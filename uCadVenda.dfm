object frmRegistroVenda: TfrmRegistroVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Registro de Vendas'
  ClientHeight = 622
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object panelCapaPedido: TPanel
    Left = 0
    Top = 0
    Width = 568
    Height = 177
    Align = alTop
    Caption = ' '
    Enabled = False
    TabOrder = 2
    object Label1: TLabel
      Left = 43
      Top = 24
      Width = 39
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 401
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 43
      Top = 82
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 298
      Top = 82
      Width = 27
      Height = 13
      Caption = 'Qtde'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 364
      Top = 82
      Width = 29
      Height = 13
      Caption = 'Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 445
      Top = 82
      Width = 51
      Height = 13
      Caption = 'Confirma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edCodigoCliente: TEdit
      Left = 43
      Top = 43
      Width = 39
      Height = 21
      CharCase = ecUpperCase
      NumbersOnly = True
      TabOrder = 0
      OnExit = edCodigoClienteExit
    end
    object btnCliente: TButton
      Left = 88
      Top = 41
      Width = 34
      Height = 25
      TabOrder = 8
      TabStop = False
      OnClick = btnClienteClick
    end
    object edNomeCliente: TEdit
      Left = 131
      Top = 43
      Width = 257
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object edConfirma: TEdit
      Left = 459
      Top = 101
      Width = 17
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 1
      TabOrder = 7
      Text = 'S'
      OnExit = edConfirmaExit
    end
    object edData: TEdit
      Left = 394
      Top = 43
      Width = 75
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object edCodigoProduto: TEdit
      Left = 43
      Top = 101
      Width = 39
      Height = 21
      CharCase = ecUpperCase
      NumbersOnly = True
      TabOrder = 3
      OnExit = edCodigoProdutoExit
    end
    object edQuantidade: TEdit
      Left = 298
      Top = 101
      Width = 39
      Height = 21
      CharCase = ecUpperCase
      NumbersOnly = True
      TabOrder = 5
      Text = '0'
    end
    object edValor: TEdit
      Left = 352
      Top = 101
      Width = 75
      Height = 21
      TabOrder = 6
      Text = '0'
      OnExit = edValorExit
    end
    object edDescricaoProduto: TEdit
      Left = 131
      Top = 101
      Width = 161
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object btnProduto: TButton
      Left = 88
      Top = 99
      Width = 34
      Height = 25
      TabOrder = 9
      TabStop = False
      OnClick = btnProdutoClick
    end
  end
  object panelVendas: TPanel
    Left = 0
    Top = 177
    Width = 568
    Height = 401
    Align = alClient
    TabOrder = 0
    object Label7: TLabel
      Left = 180
      Top = 375
      Width = 70
      Height = 13
      Caption = 'Total Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbGridItensVenda: TDBGrid
      Left = 19
      Top = 24
      Width = 529
      Height = 329
      Color = clInfoBk
      DataSource = frmDados.dsqGeralItens
      DrawingStyle = gdsClassic
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = dbGridItensVendaKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_produto'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 218
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quant_produto'
          Title.Caption = 'Qtde'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_unitario'
          Title.Caption = 'Vlr Unit'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_total'
          Title.Caption = 'Vlr Total'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigoItem'
          Visible = False
        end>
    end
    object PanelNovoLancamento: TPanel
      Left = 98
      Top = 107
      Width = 330
      Height = 158
      BorderWidth = 2
      BorderStyle = bsSingle
      TabOrder = 1
      TabStop = True
      object btnNovoLancamento: TBitBtn
        Left = 3
        Top = 56
        Width = 316
        Height = 48
        Caption = 'Novo Lan'#231'amento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnNovoLancamentoClick
      end
      object Panel8: TPanel
        Left = 3
        Top = 3
        Width = 320
        Height = 48
        Align = alTop
        BevelOuter = bvNone
        BevelWidth = 3
        Color = clBtnHighlight
        TabOrder = 0
        object Label63: TLabel
          Left = 18
          Top = 12
          Width = 189
          Height = 25
          Caption = 'Novo Lan'#231'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnFace
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label64: TLabel
          Left = 17
          Top = 11
          Width = 189
          Height = 25
          Caption = 'Novo Lan'#231'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnShadow
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label65: TLabel
          Left = 16
          Top = 10
          Width = 189
          Height = 25
          Caption = 'Novo Lan'#231'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11626040
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Bevel2: TBevel
          Left = 0
          Top = 0
          Width = 320
          Height = 47
          Align = alTop
          Shape = bsFrame
          ExplicitLeft = -1
          ExplicitTop = -2
        end
      end
      object btnFecharPanel: TBitBtn
        Left = 126
        Top = 110
        Width = 90
        Height = 30
        Caption = 'Fechar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFBC4B00BC4B00BC4B00BC4B00BC4B00BC4B00BC
          4B00BC4B00BC4B00BC4B00BC4B00BC4B00BC4B00BC4B00BC4B00BC4B00BC4B00
          BC4B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC4B00FFFFFFFFFAF0FFF4
          E5FFEFDAFFEACFFFE5C4FFE0BAFFDCB1FFD8A9FFD4A3FFD19FFFD19FFFD19FFF
          D19FFFD19FFFDDAFBC4B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC4B00
          FFFFFFFEF7EDFFF0E3FEEDD9FFE9CFFEE3C5FEDEBAFED9B1FED4A7FED0A0FECE
          9AFECB96FECB96FECB96FECB96FFD7A5BC4B00FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFBC4B00FFFFFFFFFBF4FFF6EDFFF2E5FEEDDAFFE9D0FEE3C5FEDEBB
          FED9B1FED4A9FED0A0FECE99FECB96FECB96FECB96FFD7A5BC4B00FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFBC4B00FFFFFFFFFEFCFFFBF4FFF7EEFFF2E5FE
          EEDAFEE9D0FFE3C6FEDEBCFED9B1FED4A9FED1A1FECE9AFECB97FECB96FFD7A5
          BC4B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC4B00FFFFFFFFFFFFFFFE
          FCFFFBF6FFF7EFFFF3E5FEEFDAFFE9D0FFE3C6FFDEBCFFD9B4FED5AAFED1A1FE
          CE9AFECC97FFD7A5BC4B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC4B00
          FFFFFFFFFFFFFFFFFFFFFEFEFFFBF6FEF7EFFEF4E7FFEEDCFEEAD1FEE5C6FFE0
          BDFFD9B2FED4AAFFD3A1FECE9CFFD7A6BC4B00FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFBC4B00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFBF7FFF8F0FFF3E6
          FFEEDCFEE9D1FFE5C7FEDEBDFFDAB4FED7ABFFD1A3FFD9ACBC4B00FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFBC4B00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFEFFFCF8FFF7F0FEF3E7FEEEDDFEEAD4FFE6C9FFE0BDFEDAB5FFD5ABFFDDB4
          BC4B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC4B00FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFEFFFBF8FFF8F0FFF3E7FFEFDEFFEAD4FEE5C9FE
          E0C0FEDCB5FFE1BCBC4B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC4B00
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFCF8FFF7F0FFF3
          E9FFEFE0FEEBD4FEE5CAFEE1C0FFE6C7BC4B00FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFBC4B00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFFFCF8FFF8F0FFF4E9000D66000D66FEE6CBFFEDD3BC4B00FF00FF000D
          66000D66FF00FFFF00FFFF00FFBC4B00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000D665474FF00139C000D66FFFFFB
          BC4B00000D6600139C00139C000D66FF00FFFF00FFBC4B00EFAC5FEEAB5FEEAB
          5FEEAB5FEEAB5FEEAB5FEEAB5FEEAB5FEEAB5FEEAB5FEEAA5E000D665474FF1E
          41FE00139C000D66000D660524FC021FFC00139C000D66FF00FFFF00FFBF4B00
          C44800C24800C24800C24800C24800C24800C24800C24800C24800C24800C248
          00C24800000D665474FF1F41FE00139C00139C0A2AFC00139C000D66FF00FFFF
          00FFFF00FFFF00FFBC4B00BC4B00BC4B00BC4B00BC4B00BC4B00BC4B00BC4B00
          BC4B00BC4B00BC4B00BC4B00BC4B00000D665474FF1F41FE163AFE00139C000D
          66FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000D665474FF2649FE
          1F41FE00139C000D66FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000D6654
          74FF3557FF5474FF5474FF1E41FE00139C000D66FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF000D665474FF395CFF395CFF000D66000D665474FF1F41FC00139C000D66FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF000D665474FF5474FF000D66FF00FFFF00FF000D665474
          FF1E41FE000D66FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000D66000D66FF00FFFF00FF
          FF00FFFF00FF000D66000D66FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        TabOrder = 2
        OnClick = btnFecharPanelClick
      end
    end
    object edTotalPedido: TEdit
      Left = 257
      Top = 369
      Width = 121
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 578
    Width = 568
    Height = 44
    Align = alBottom
    TabOrder = 1
    object btnSair: TButton
      Left = 473
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
    object btnConfirmaVenda: TBitBtn
      Left = 363
      Top = 6
      Width = 104
      Height = 25
      Caption = 'Confirma Venda'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnConfirmaVendaClick
    end
  end
end
