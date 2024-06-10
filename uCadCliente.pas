unit uCadCliente;

{
Rafael Hassegawa - Teste prático WK Tecnologia
rafaelmch@gmail.com
(31)99886-6863
}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Datasnap.DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.Mask;

type
  TfrmCadCliente = class(TForm)
    Panel1: TPanel;
    lblEndereco: TLabel;
    Panel2: TPanel;
    btnConsultarCEP: TButton;
    meCEP: TMaskEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    MemTableCEP: TFDMemTable;
    procedure btnConsultarCEPClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure ConsultarCEP(CEP : String);
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

procedure TfrmCadCliente.btnConsultarCEPClick(Sender: TObject);
begin
  consultarCEP(trim(meCEP.Text));
end;

procedure TfrmCadCliente.ConsultarCEP(CEP : String);
begin
  //setar o resource da consulta na API
  try
    RESTRequest1.Resource := meCEP.Text + '/json';
    RESTRequest1.Execute;

    if RESTResponse1.StatusCode = 200 then
    begin
      with MemTableCEP do
      begin
        lblEndereco.Caption := 'CEP: ' + FieldByName('cep').AsString + sLineBreak +
                               'End.: ' + FieldByName('logradouro').AsString + sLineBreak +
                               'Comp.: ' + FieldByName('complemento').AsString + sLineBreak +
                               'Bairro.: ' + FieldByName('bairro').AsString + sLineBreak +
                               'Cidade.: ' + FieldByName('localidade').AsString + sLineBreak +
                               'UF.: ' + FieldByName('uf').AsString + sLineBreak +
                               'COD IBGE.: ' + FieldByName('ibge').AsString + sLineBreak;
      end;
    end
    else if RESTResponse1.StatusCode <> 200 then
    begin
      ShowMessage('Atenção! Erro ao buscar CEP!');
      lblEndereco.Caption := '';
    end;
  except
    ShowMessage('Atenção! Arquivo json inválido!');
    Exit;
  end;

end;

procedure TfrmCadCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //pular campo com o ENTER
  if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.

