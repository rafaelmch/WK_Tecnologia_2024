object frmListagemVenda: TfrmListagemVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Listagem de Vendas'
  ClientHeight = 506
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 361
    Height = 465
    Align = alClient
    TabOrder = 0
    object dbGridClientes: TDBGrid
      Left = 24
      Top = 16
      Width = 313
      Height = 417
      Color = clWhite
      DataSource = frmDados.dsqVendasCad
      DrawingStyle = gdsClassic
      FixedColor = clInfoBk
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbGridClientesDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'numped'
          Title.Caption = 'N'#250'mero Pedido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_emissao'
          Title.Caption = 'Data Emiss'#227'o'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_total'
          Title.Caption = 'Valor Total'
          Width = 95
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 465
    Width = 361
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    object btnSair: TButton
      Left = 262
      Top = 6
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
