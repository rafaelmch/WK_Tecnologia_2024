unit uListagemVenda;
{
Rafael Hassegawa - Teste prático WK Tecnologia
rafaelmch@gmail.com
(31)99886-6863
}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmListagemVenda = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    btnSair: TButton;
    dbGridClientes: TDBGrid;
    procedure dbGridClientesDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemVenda: TfrmListagemVenda;

implementation

{$R *.dfm}

uses
  uDados,
  login,
  uCadVenda;

procedure TfrmListagemVenda.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListagemVenda.dbGridClientesDblClick(Sender: TObject);
var
  ls_sql : String;
begin
  Application.CreateForm(TfrmRegistroVenda,frmRegistroVenda);

  ls_sql := 'select * from ClienteCad ' +
    'where codigo = ' + frmDados.qVendasCad.FieldByName('cod_cliente').AsString;

  with FrmDados.qClienteCad do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    Open;
  end;

  frmRegistroVenda.edCodigoCliente.Text :=
    frmDados.qClienteCad.FieldByName('codigo').AsString;

  frmRegistroVenda.edNomeCliente.Text :=
    frmDados.qClienteCad.FieldByName('nome').AsString;

  frmRegistroVenda.edData.Text :=
    frmDados.qVendasCad.FieldByName('dt_emissao').AsString;

  frmRegistroVenda.edCodigoProduto.Text := '';
  frmRegistroVenda.edDescricaoProduto.Text := '';
  frmRegistroVenda.edQuantidade.Text := '';
  frmRegistroVenda.PanelNovoLancamento.Visible := false;
  frmRegistroVenda.piNumPed := frmDados.qVendasCad.FieldByName('numped').AsInteger;
  frmRegistroVenda.btnConfirmaVenda.Visible := false;
  frmRegistroVenda.btnCliente.Enabled := false;
  frmRegistroVenda.btnProduto.Enabled := false;
  frmRegistroVenda.TotalizaPedido();

  ls_sql := 'select * from itensVendaCad ' +
    'where numped = ' + frmDados.qVendasCad.FieldByName('numped').AsString;

  with FrmDados.qGeralItens do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    Open;
  end;

  frmRegistroVenda.ShowModal;
end;

procedure TfrmListagemVenda.FormShow(Sender: TObject);
var
  ls_sql : String;
begin
  ls_sql := 'select * from vendascad order by numped';

  with frmDados.qVendasCad do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    Open;
  end;
end;

end.
