unit uCadVenda;

{
Rafael Hassegawa - Teste prático WK Tecnologia
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmRegistroVenda = class(TForm)
    panelVendas: TPanel;
    Panel2: TPanel;
    btnSair: TButton;
    dbGridItensVenda: TDBGrid;
    PanelNovoLancamento: TPanel;
    btnNovoLancamento: TBitBtn;
    Panel8: TPanel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Bevel2: TBevel;
    btnFecharPanel: TBitBtn;
    panelCapaPedido: TPanel;
    edCodigoCliente: TEdit;
    Label1: TLabel;
    btnCliente: TButton;
    edNomeCliente: TEdit;
    edConfirma: TEdit;
    edData: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edCodigoProduto: TEdit;
    Label4: TLabel;
    edQuantidade: TEdit;
    Label5: TLabel;
    edValor: TEdit;
    Label6: TLabel;
    edTotalPedido: TEdit;
    Label7: TLabel;
    btnConfirmaVenda: TBitBtn;
    edDescricaoProduto: TEdit;
    btnProduto: TButton;
    procedure btnClienteClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edConfirmaExit(Sender: TObject);
    procedure btnFecharPanelClick(Sender: TObject);
    procedure btnNovoLancamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edValorExit(Sender: TObject);
    procedure btnConfirmaVendaClick(Sender: TObject);
    procedure dbGridItensVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodigoClienteExit(Sender: TObject);
    procedure edCodigoProdutoExit(Sender: TObject);
  private
    { Private declarations }
    pl_alteraProduto : boolean;
    procedure insereProdutoVenda(numped : integer);
    function formataDataMySql(data : string) : string;
    Function Virgula(valor:string):string;
    procedure limpaLinha();
    procedure carregaItens();
    procedure limparTela();
    procedure alteraProduto();
  public
    { Public declarations }
    piNumPed : Integer;
    procedure TotalizaPedido();
  end;

var
  frmRegistroVenda: TfrmRegistroVenda;

implementation

{$R *.dfm}

uses
  Main,
  uDados,
  login,
  CadCliente,
  CadProduto;

procedure TfrmRegistroVenda.btnFecharPanelClick(Sender: TObject);
begin
  pl_alteraProduto := false;
  frmDados.qItensVendaCad.Close;
  frmRegistroVenda.PanelNovoLancamento.Visible := false;
  frmRegistroVenda.close;
end;

procedure TfrmRegistroVenda.btnNovoLancamentoClick(Sender: TObject);
var
  ls_sql : String;
  dDataAtual : TDate;
begin
  //nova venda
  PanelNovoLancamento.Visible := false;
  panelCapaPedido.Enabled := true;
  limparTela();
  edCodigoCliente.SetFocus();

  dDataAtual := Date;

  ls_sql := 'insert into vendasCad (dt_emissao) ' +
    'VALUES ("' + formataDataMySql(edData.Text) + '")';

  with frmDados.qGeral do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    try
      Execute;
      ls_sql := 'select MAX(numped) from vendascad';
      with frmDados.qGeral do
      begin
        Close;
        Sql.Clear;
        Sql.Add(ls_sql);
        Open;
      end;
      piNumPed := frmDados.qGeral.Fields[0].AsInteger;
    except
      ShowMessage('Atenção! Erro ao inserir capa do pedido!');
      Exit;
    end;
  end;

  btnConfirmaVenda.Enabled := false;
end;

procedure TfrmRegistroVenda.btnProdutoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadProduto,frmCadProduto);
  frmCadProduto.lVenda := true;
  frmCadProduto.ShowModal;
end;

procedure TfrmRegistroVenda.btnConfirmaVendaClick(Sender: TObject);
var
  ls_sql : String;
begin
  //atualizar a capa do pedido
  ls_sql := 'UPDATE VendasCad ' +
    'SET cod_cliente = ' + edCodigoCliente.Text + ', ' +
    'valor_total = "' + virgula(edTotalPedido.Text) + '"' +
    'where numped = "' + intToStr(piNumPed) + '"';

  with frmDados.qGeral do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    try
      Execute;
      ShowMessage('Venda finalizada com sucesso!');
      PanelNovoLancamento.Visible := true;
    except
      ShowMessage('Atenção! Erro ao finalizar venda!');
      Exit;
    end;
  end;

  btnConfirmaVenda.Enabled := false;
end;

procedure TfrmRegistroVenda.btnClienteClick(Sender: TObject);
begin
  Application.CreateForm(TfCadCliente,fCadCliente);
  fCadCliente.lVenda := true;
  fCadCliente.ShowModal;
end;

procedure TfrmRegistroVenda.btnSairClick(Sender: TObject);
begin
  pl_alteraProduto := false;
  frmDados.qItensVendaCad.Close;
  Close;
end;

procedure TfrmRegistroVenda.dbGridItensVendaKeyDown(Sender: TObject;
var Key: Word; Shift: TShiftState);
var
  ls_sql : String;
begin
  if key = VK_DELETE then
  begin
    ls_sql := 'delete from itensvendacad where codigoItem = "' +
      frmDados.qGeralItens.FieldByName('codigoItem').AsString + '"';

    with FrmDados.qGeral do
    begin
      Close;
      Sql.Clear;
      Sql.Add(ls_sql);
      try
        Execute;
        carregaItens();
        TotalizaPedido();
      except
        ShowMessage('Atenção! Erro ao deletar item do pedido!');
        Exit;
      end;
    end;
  end;

  case Key of
    VK_RETURN:
      begin
        limpaLinha();
        edCodigoProduto.Text := FrmDados.qGeralItens.FieldByName('cod_produto').AsString;
        edDescricaoProduto.Text := FrmDados.qGeralItens.FieldByName('descricao').AsString;
        edQuantidade.Text := FrmDados.qGeralItens.FieldByName('quant_produto').AsString;
        edValor.Text := FormatFloat('0.00',FrmDados.qGeralItens.FieldByName('valor_unitario').AsCurrency);
        edCodigoProduto.Enabled := false;
        edDescricaoProduto.Enabled := false;
        pl_alteraProduto := true;
        edQuantidade.SetFocus();
      end;
  end;
end;

procedure TfrmRegistroVenda.edCodigoClienteExit(Sender: TObject);
var
  ls_sql : String;
  li_codigoCliente : integer;
begin
  try
    li_codigoCliente := StrToInt(trim(edCodigoCliente.Text));

    //buscar cliente pelo código informado
    ls_sql := 'select nome from ClienteCad where codigo = ' + IntToStr(li_codigoCliente);

    with frmDados.qClienteCad do
    begin
      Close;
      Sql.Clear;
      Sql.Add(ls_sql);
      Open;

      if RecordCount > 0 then
        edNomeCliente.Text := frmDados.qClienteCad.FieldByName('Nome').AsString
      else
      begin
        ShowMessage('Atenção! Cliente não localizado!');
        edCodigoCliente.Text := '';
        edNomeCliente.Text := '';
        //edCodigoCliente.SetFocus();
        Exit;
      end;
    end;
  except

  end;
end;

procedure TfrmRegistroVenda.edCodigoProdutoExit(Sender: TObject);
var
  ls_sql : String;
  li_codigoProduto : integer;
begin
  try
    li_codigoProduto := StrToInt(trim(edCodigoProduto.Text));

    //buscar cliente pelo código informado
    ls_sql := 'select * from ProdutoCad where codigo = ' + IntToStr(li_codigoProduto);

    with frmDados.qProdutoCad do
    begin
      Close;
      Sql.Clear;
      Sql.Add(ls_sql);
      Open;

      if RecordCount > 0 then
      begin
        edDescricaoProduto.Text := frmDados.qProdutoCad.FieldByName('descricao').AsString;
        edValor.Text := FormatFloat('0.00',frmDados.qProdutoCad.FieldByName('preco_venda').AsCurrency);
      end
      else
      begin
        ShowMessage('Atenção! Produto não localizado!');
        edCodigoProduto.Text := '';
        edDescricaoProduto.Text := '';
        edQuantidade.Text := '';
        edValor.Text := '';
        edCodigoProduto.SetFocus();
      end;
    end;
  except

  end;
end;

procedure TfrmRegistroVenda.edConfirmaExit(Sender: TObject);
var
  liQuant : Integer;
  lcValor : Currency;
begin
  try
    liQuant := StrToInt(edQuantidade.Text);
    if liQuant <= 0 then
    begin
      ShowMessage('Atenção! Quantidade deve ser maior ou igual a 0!');
      edQuantidade.Text := '0';
      edQuantidade.SetFocus;
      Exit;
    end;
  except
    ShowMessage('Atenção! Quanitdade inválida!');
    edQuantidade.Text := '0';
    edQuantidade.SetFocus;
    Exit;
  end;

  try
    lcValor := StrToCurr(edValor.Text);
    if lcValor <= 0 then
    begin
      ShowMessage('Atenção! Preço de venda deve ser maior ou igual a 0!');
      edValor.Text := '0';
      edValor.SetFocus();
      Exit;
    end;
  except
    ShowMessage('Atenção! Valor inválido!');
    edValor.Text := '0';
    edValor.SetFocus();
    Exit;
  end;

  if (edConfirma.Text <> 'N') AND (edConfirma.Text <> 'S') then
  begin
    ShowMessage('Atenção! Informe [S]im ou [N]ão!');
    edConfirma.Text := 'S';
    edConfirma.SetFocus();
  end;

  //inserindo prouto
  if pl_alteraProduto = false then
  begin
    //confirmar produto na venda
    insereProdutoVenda(piNumPed);
  end
  else //alteração do produto
  begin
    alteraProduto();
  end;

  //atualizar grid
  CarregaItens();

  //totalizar valor do pedido
  TotalizaPedido();

  btnConfirmaVenda.Enabled := true;

  //limpar linha
  limpaLinha();
end;

procedure TfrmRegistroVenda.edValorExit(Sender: TObject);
var
  lc_valor : Currency;
begin
  try
    lc_valor := StrToCurr(trim(edValor.Text));
  except
    ShowMessage('Atenção! Valor inváldo!');
    edValor.Text := '';
    edValor.SetFocus;
  end;
end;

procedure TfrmRegistroVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //pular campo com o ENTER
  if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmRegistroVenda.FormShow(Sender: TObject);
begin
  //data atual
  edData.Text := FormatDateTime('dd/mm/yyyy',Date);
  pl_alteraProduto := false;
end;

function TfrmRegistroVenda.formataDataMySql(data : string) : string;
var
  ls_dia, ls_mes, ls_ano:string;
begin
  //ano-dia-mes
  ls_dia := copy(data,1,2);
  ls_mes := copy(data,4,2);
  ls_ano := copy(data,7,4);
  formataDataMySql := concat(ls_ano + '-' + ls_mes + '-' + ls_dia);
end;

procedure TfrmRegistroVenda.insereProdutoVenda(numped : integer);
var
  ls_sql : String;
  ldValorTotal : Currency;
begin

  try
    ldValorTotal := StrToInt(edQuantidade.Text) * StrToCurr(edValor.Text);
  except
    ldValorTotal := 0;
  end;

  ls_sql := 'INSERT INTO itensvendacad(numped, cod_produto, quant_produto, valor_unitario, valor_total) ' +
    'VALUES ("' + IntToStr(piNumPed) +'", "' +
    trim(edCodigoProduto.Text) + '", "' +
    trim(edQuantidade.Text) + '", "' +
    virgula(edValor.Text) + '", "' +
    virgula(CurrToStr(ldValorTotal)) +'")';

  with FrmDados.qGeral do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    try
      Execute;
    except
      ShowMessage('Atenção! Erro ao salvar item do pedido!');
      Exit;
    end;
  end;
end;

Function TfrmRegistroVenda.Virgula(valor:string):string;
var
i, wMaximo : integer;
wValor_, wLetra:string;
begin
  wMaximo:=Length(valor);
  for i:= 1 to wMaximo do
  begin
    wLetra:=copy(valor,i,1);
    if wLetra = ',' then
      wLetra:='.';

    wValor_:=concat(wValor_+wLetra);
  end;
  result:=wValor_;
end;

procedure TfrmRegistroVenda.TotalizaPedido();
var
  ls_sql : String;
  lcTotalPedido : Currency;
begin
  ls_sql := 'select SUM(valor_total) as Total from itensvendacad ' +
    'where numped = ' + IntToStr(piNumPed);

  with frmDados.Qgeral do
  begin
    Close;
    Sql.Clear();
    Sql.Add(ls_sql);
    Open;
  end;

  edTotalPedido.Text := FormatFloat('0.00',frmDados.qGeral.FieldByName('Total').AsCurrency);
end;

procedure TfrmRegistroVenda.LimpaLinha();
begin
  edCodigoProduto.Text := '';
  edDescricaoProduto.Text := '';
  edQuantidade.Text := '';
  edValor.Text := '';
end;


procedure TfrmRegistroVenda.carregaItens();
var
  ls_sql : String;
begin
  ls_sql := 'SELECT i.*, p.descricao  ' +
    'from ItensVendaCad i ' +
    'inner join produtoCad p on i.cod_produto = p.codigo ' +
    'where i.numped = ' + IntToStr(piNumPed);

  with FrmDados.qGeralItens do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    Open;
  end;
end;

procedure TfrmRegistroVenda.limparTela();
begin
  edCodigoCliente.Text := '';
  edNomeCliente.Text := '';
  frmDados.qGeralItens.Close;
end;

procedure TfrmRegistroVenda.alteraProduto();
var
  ls_sql : string;
  ldvalorTotal : Currency;
begin

  try
    ldValorTotal := StrToInt(edQuantidade.Text) * StrToCurr(edValor.Text);
  except
    ldValorTotal := 0;
  end;

  ls_sql := 'UPDATE itensvendacad ' +
    'SET quant_produto = "' + trim(edQuantidade.Text) + '", ' +
    'valor_unitario = "' + virgula(edValor.Text) + '", ' +
    'valor_total = "' + virgula(CurrToStr(ldValorTotal)) + '" ' +
    'where codigoItem = "' + frmDados.qGeralItens.FieldByName('codigoItem').AsString + '"';

  with frmDados.qGeral do
  begin
    Close;
    Sql.CLear;
    Sql.Add(ls_sql);
    try
      Execute();
      pl_alteraProduto := false;
    except
      ShowMessage('Atenção! Erro ao alterar item do pedido!');
    end;
  end;

end;

end.
