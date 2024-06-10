object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCadCliente'
  ClientHeight = 598
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 76
    Width = 535
    Height = 522
    Align = alClient
    AutoSize = True
    TabOrder = 1
    object lblEndereco: TLabel
      Left = 65
      Top = 64
      Width = 69
      Height = 18
      Caption = 'Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 535
    Height = 76
    Align = alTop
    TabOrder = 0
    object btnConsultarCEP: TButton
      Left = 273
      Top = 26
      Width = 105
      Height = 25
      Caption = 'Consultar CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnConsultarCEPClick
    end
    object meCEP: TMaskEdit
      Left = 136
      Top = 28
      Width = 120
      Height = 21
      EditMask = '00000\-999;1;_'
      MaxLength = 9
      TabOrder = 0
      Text = '     -   '
    end
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://viacep.com.br/ws'
    Params = <>
    SynchronizedEvents = False
    Left = 360
    Top = 104
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Resource = '30140111/json'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 360
    Top = 192
  end
  object RESTResponse1: TRESTResponse
    Left = 456
    Top = 192
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = MemTableCEP
    FieldDefs = <>
    Response = RESTResponse1
    TypesMode = Rich
    Left = 456
    Top = 104
  end
  object MemTableCEP: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 360
    Top = 272
  end
end
