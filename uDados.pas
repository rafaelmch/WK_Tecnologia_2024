unit uDados;

{
Rafael Hassegawa - Teste pr�tico WK Tecnologia
rafaelmch@gmail.com
(31)99886-6863
}

interface

uses
  System.SysUtils, System.Classes, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef;

type
  TfrmDados = class(TDataModule)
    conexaoMySql: TFDConnection;
    qGeral: TFDQuery;
    dsqGeral: TDataSource;
    qClienteCad: TFDQuery;
    dsqClienteCad: TDataSource;
    qProdutoCad: TFDQuery;
    dsqProdutoCad: TDataSource;
    qVendasCad: TFDQuery;
    dsqVendasCad: TDataSource;
    dsqItensVendaCad: TDataSource;
    qItensVendaCad: TFDQuery;
    dsqGeralItens: TDataSource;
    qGeralItens: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDados: TfrmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses Main, CadCliente;

end.
