object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Login A - Senha A'
  ClientHeight = 145
  ClientWidth = 229
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  PrintScale = poPrintToFit
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object PanelWorkArea: TPanel
    Left = 0
    Top = 0
    Width = 229
    Height = 145
    Align = alClient
    BevelOuter = bvNone
    Caption = 'panel'
    Color = clGray
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 104
      Width = 229
      Height = 41
      Align = alBottom
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object btnConfirma: TButton
        Left = 36
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Confirma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnConfirmaClick
      end
      object btnCancelar: TButton
        Left = 116
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCancelarClick
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 229
      Height = 104
      Align = alClient
      Color = clSkyBlue
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 14
        Top = 28
        Width = 41
        Height = 18
        Caption = 'Login'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 14
        Top = 59
        Width = 46
        Height = 18
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtLogin: TEdit
        Left = 64
        Top = 25
        Width = 121
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnExit = txtLoginExit
      end
      object txtSenha: TEdit
        Left = 64
        Top = 56
        Width = 121
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
        OnExit = txtSenhaExit
      end
    end
  end
end
