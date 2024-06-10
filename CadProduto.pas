unit CadProduto;

{
Rafael Hassegawa - Teste prático WK Tecnologia
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmCadProduto = class(TForm)
    Panel1: TPanel;
    btnSair: TButton;
    Panel3: TPanel;
    dbGridProdutos: TDBGrid;
    lblDica: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbGridProdutosTitleClick(Column: TColumn);
    procedure dbGridProdutosDblClick(Sender: TObject);
    procedure dbGridProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    lVenda : boolean;
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses
  Main,
  uDados,
  login,
  uCadVenda;

procedure TfrmCadProduto.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmCadProduto.dbGridProdutosDblClick(Sender: TObject);
begin
  //selecionar produto para a venda
  keybd_event(VK_RETURN, 0, 0, 0);
end;

procedure TfrmCadProduto.dbGridProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        //selecionar produto para a venda
        if (FrmDados.qProdutoCad.FieldByName('codigo').AsInteger > 0) AND (lVenda) then
        begin
          frmRegistroVenda.edCodigoProduto.Text := FrmDados.qProdutoCad.FieldByName('codigo').AsString;
          frmRegistroVenda.edDescricaoProduto.Text := FrmDados.qProdutoCad.FieldByName('descricao').AsString;
          frmRegistroVenda.edValor.Text := FormatFloat('0.00',FrmDados.qProdutoCad.FieldByName('preco_venda').AsCurrency);
          frmCadProduto.Close;
        end;
      end;
  end;
end;

procedure TfrmCadProduto.dbGridProdutosTitleClick(Column: TColumn);
begin
  //ordenar de acordo com a coluna clicada
  frmDados.qProdutoCad.IndexFieldNames := Column.FieldName;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmCadProduto := nil;
  Action := cafree;
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
var
  ls_sql : String;
begin
  ls_sql := 'SELECT * FROM produtoCad ORDER BY descricao';

  with FrmDados.qProdutoCad do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    Open;
  end;

  lblDica.Visible := lVenda;
end;

end.
