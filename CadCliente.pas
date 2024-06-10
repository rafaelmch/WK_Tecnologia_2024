unit CadCliente;

{
Rafael Hassegawa - Teste prático WK Tecnologia
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Types, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Grids, Vcl.DBGrids ;

type
  TfCadCliente = class(TForm)
    Panel3: TPanel;
    dbGridClientes: TDBGrid;
    Panel1: TPanel;
    btnSair: TButton;
    lblDica: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbGridClientesTitleClick(Column: TColumn);
    procedure dbGridClientesDblClick(Sender: TObject);
    procedure dbGridClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    lVenda : boolean;
  end;

var
  fCadCliente: TfCadCliente;

implementation

{$R *.dfm}

uses
  Main,
  uDados,
  login,
  uCadVenda;

procedure TfCadCliente.btnSairClick(Sender: TObject);
begin
  try
    frmDados.qClienteCad.Close;
  except

  end;
  Close;
end;

procedure TfCadCliente.dbGridClientesDblClick(Sender: TObject);
begin
  //selecionar cliente
  keybd_event(VK_RETURN, 0, 0, 0);
end;

procedure TfCadCliente.dbGridClientesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN :
      if (frmDados.qClienteCad.FieldByName('codigo').AsInteger > 0) and (lVenda) then
      begin
//        //código do cliente
        frmRegistroVenda.edCodigoCliente.Text := trim(frmDados.qClienteCad.FieldByName('codigo').AsString);
//        //nome do cliente
        frmRegistroVenda.edNomeCliente.Text := trim(frmDados.qClienteCad.FieldByName('nome').AsString);
        frmRegistroVenda.edData.SelectAll;
        fCadCliente.Close;
      end;
  end;
end;

procedure TfCadCliente.dbGridClientesTitleClick(Column: TColumn);
begin
  //ordenar grid de acordo com a coluna clicada
  frmDados.qClienteCad.IndexFieldNames := Column.FieldName;
end;

procedure TfCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //frmDados.qClienteCad.Close;
  fCadCliente := nil;
  Action := caFree;
end;

procedure TfCadCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //pular campo com o ENTER
  if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfCadCliente.FormShow(Sender: TObject);
var
  ls_sql : String;
begin
  ls_sql := 'select * ' +
    'from clienteCad ' +
    'order by nome ASC';

  with frmDados.qClienteCad do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ls_sql);
    Open;
  end;

  lblDica.Visible := lVenda;
end;

end.

