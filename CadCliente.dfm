object fCadCliente: TfCadCliente
  Left = 2
  Top = 2
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes'
  ClientHeight = 532
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 691
    Height = 491
    Align = alClient
    TabOrder = 0
    object lblDica: TLabel
      Left = 24
      Top = 448
      Width = 369
      Height = 18
      Caption = 'SELECIONE O PRODUTO COM UM DUPLO CLIQUE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Visible = False
    end
    object dbGridClientes: TDBGrid
      Left = 24
      Top = 16
      Width = 649
      Height = 417
      Color = clWhite
      DataSource = frmDados.dsqClienteCad
      DrawingStyle = gdsClassic
      FixedColor = clInfoBk
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbGridClientesDblClick
      OnKeyDown = dbGridClientesKeyDown
      OnTitleClick = dbGridClientesTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Width = 284
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cidade'
          Title.Caption = 'Cidade'
          Width = 214
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'uf'
          Title.Caption = 'UF'
          Width = 39
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 491
    Width = 691
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    object btnSair: TButton
      Left = 598
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSairClick
    end
  end
end
