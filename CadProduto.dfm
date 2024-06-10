object frmCadProduto: TfrmCadProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Produtos'
  ClientHeight = 564
  ClientWidth = 648
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 523
    Width = 648
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object btnSair: TButton
      Left = 560
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 648
    Height = 523
    Align = alClient
    TabOrder = 1
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
    object dbGridProdutos: TDBGrid
      Left = 24
      Top = 16
      Width = 611
      Height = 417
      Color = clWhite
      DataSource = frmDados.dsqProdutoCad
      DrawingStyle = gdsClassic
      FixedColor = clInfoBk
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbGridProdutosDblClick
      OnKeyDown = dbGridProdutosKeyDown
      OnTitleClick = dbGridProdutosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 431
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco_venda'
          Title.Caption = 'Pre'#231'o'
          Width = 72
          Visible = True
        end>
    end
  end
end
