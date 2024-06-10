object frmDados: TfrmDados
  Height = 460
  Width = 845
  object conexaoMySql: TFDConnection
    Params.Strings = (
      'Database=wk_database'
      'User_Name=root'
      'Password=Rafa1982;'
      'Server=localhost'
      'DriverID=MySQL')
    Left = 104
    Top = 200
  end
  object qGeral: TFDQuery
    Connection = conexaoMySql
    Left = 216
    Top = 200
  end
  object dsqGeral: TDataSource
    DataSet = qGeral
    Left = 288
    Top = 200
  end
  object qClienteCad: TFDQuery
    Connection = conexaoMySql
    SQL.Strings = (
      'select * from clienteCad')
    Left = 208
    Top = 272
  end
  object dsqClienteCad: TDataSource
    DataSet = qClienteCad
    Left = 296
    Top = 280
  end
  object qProdutoCad: TFDQuery
    Connection = conexaoMySql
    SQL.Strings = (
      'select * from produtoCad')
    Left = 208
    Top = 328
  end
  object dsqProdutoCad: TDataSource
    DataSet = qProdutoCad
    Left = 296
    Top = 336
  end
  object qVendasCad: TFDQuery
    Connection = conexaoMySql
    SQL.Strings = (
      'select * from vendasCad')
    Left = 440
    Top = 200
  end
  object dsqVendasCad: TDataSource
    DataSet = qVendasCad
    Left = 528
    Top = 208
  end
  object dsqItensVendaCad: TDataSource
    DataSet = qItensVendaCad
    Left = 504
    Top = 304
  end
  object qItensVendaCad: TFDQuery
    Connection = conexaoMySql
    SQL.Strings = (
      'select * from itensVendaCad')
    Left = 416
    Top = 296
  end
  object dsqGeralItens: TDataSource
    DataSet = qGeralItens
    Left = 328
    Top = 152
  end
  object qGeralItens: TFDQuery
    Connection = conexaoMySql
    Left = 256
    Top = 152
  end
end
