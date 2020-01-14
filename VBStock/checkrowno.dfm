object frmCheckRowNo: TfrmCheckRowNo
  Left = 231
  Top = 156
  Width = 544
  Height = 375
  Caption = 'Check (and Fix) Row No'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDisplayBoxRows: TDBGrid
    Left = 32
    Top = 120
    Width = 489
    Height = 145
    DataSource = datDisplayBoxRows
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnFindBoxes: TButton
    Left = 104
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Find Boxes'
    TabOrder = 1
    OnClick = btnFindBoxesClick
  end
  object btnResetBoxRows: TButton
    Left = 248
    Top = 56
    Width = 121
    Height = 25
    Caption = 'Reset Box Rows'
    TabOrder = 2
    OnClick = btnResetBoxRowsClick
  end
  object btnClose: TBitBtn
    Left = 368
    Top = 16
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = btnCloseClick
    Kind = bkClose
  end
  object qryResetBox: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'delete from vbboxdetailscheck')
    Left = 72
    Top = 16
  end
  object qryInsertBoxes: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'insert into vbboxdetailscheck'
      'select distinct rowno,boxno'
      'from vbrcpt'
      'where despdate is null')
    Left = 136
    Top = 16
  end
  object qryInsertRows: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'insert into vbboxdetailscheckrowno'
      'select boxno,count(*)'
      'from vbboxdetailscheck'
      'group by boxno'
      'having count(*)>1')
    Left = 168
    Top = 16
  end
  object qryDisplayBoxRows: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select distinct boxno,rowno'
      'from vbrcpt'
      'where boxno in'
      '(select boxno'
      'from vbboxdetailscheckrowno'
      ')'
      'order by boxno,rowno')
    Left = 200
    Top = 16
    object qryDisplayBoxRowsBOXNO: TIntegerField
      FieldName = 'BOXNO'
    end
    object qryDisplayBoxRowsROWNO: TIntegerField
      FieldName = 'ROWNO'
    end
  end
  object qryUpdateBoxes: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'update vbrcpt'
      'set rowno=0'
      'where boxno=:boxno')
    Left = 256
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'boxno'
        ParamType = ptUnknown
      end>
  end
  object datDisplayBoxRows: TDataSource
    DataSet = qryDisplayBoxRows
    Left = 200
    Top = 48
  end
  object qryResetBoxRow: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'delete from vbboxdetailscheckrowno')
    Left = 104
    Top = 16
  end
end
