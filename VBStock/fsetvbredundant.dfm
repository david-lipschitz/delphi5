object frmSetVBRedundant: TfrmSetVBRedundant
  Left = 281
  Top = 210
  Width = 764
  Height = 584
  Caption = 'Set VB Redundant'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 756
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object gbxAllInfo: TGroupBox
    Left = 0
    Top = 41
    Width = 756
    Height = 209
    Align = alTop
    Caption = ' All Info '
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 752
      Height = 192
      Align = alClient
      DataSource = datAllInfo
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 516
    Width = 756
    Height = 41
    Align = alBottom
    TabOrder = 2
  end
  object gbxSummary: TGroupBox
    Left = 0
    Top = 250
    Width = 369
    Height = 127
    Caption = ' Summary '
    TabOrder = 3
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 365
      Height = 110
      Align = alClient
      DataSource = datSummaryInfo
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object gbxRequirements: TGroupBox
    Left = 369
    Top = 250
    Width = 384
    Height = 262
    Caption = ' Requirements '
    TabOrder = 4
    object Label1: TLabel
      Left = 16
      Top = 18
      Width = 36
      Height = 13
      Caption = 'VB Stru'
    end
    object Label2: TLabel
      Left = 16
      Top = 42
      Width = 32
      Height = 13
      Caption = 'VB Col'
    end
    object Label3: TLabel
      Left = 16
      Top = 66
      Width = 31
      Height = 13
      Caption = 'VB Fin'
    end
    object Label4: TLabel
      Left = 16
      Top = 90
      Width = 60
      Height = 13
      Caption = 'Metric Width'
    end
    object Label5: TLabel
      Left = 16
      Top = 114
      Width = 69
      Height = 13
      Caption = 'To Manu Date'
    end
    object Label6: TLabel
      Left = 16
      Top = 140
      Width = 77
      Height = 13
      Caption = 'From Desp Date'
    end
    object edtVBStru: TEdit
      Left = 104
      Top = 16
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      Text = 'EDTVBSTRU'
    end
    object edtVBCol: TEdit
      Left = 104
      Top = 40
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      Text = 'EDTVBCOL'
    end
    object edtVBFin: TEdit
      Left = 104
      Top = 64
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      Text = 'EDTVBFIN'
    end
    object edtMetricWidth: TEdit
      Left = 104
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'edtMetricWidth'
    end
    object edtToManuDate: TODPopupCalendar
      Left = 104
      Top = 112
      Width = 120
      Height = 21
      DateFormat = 'dd/mm/yyyy'
      Seperator = ' - '
      PopupCaption = 'Select Date Range'
      DisplayYear = 2006
      DisplayMonth = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      StartFont.Charset = DEFAULT_CHARSET
      StartFont.Color = clWindowText
      StartFont.Height = -11
      StartFont.Name = 'MS Sans Serif'
      StartFont.Style = []
      FinishFont.Charset = DEFAULT_CHARSET
      FinishFont.Color = clWindowText
      FinishFont.Height = -11
      FinishFont.Name = 'MS Sans Serif'
      FinishFont.Style = []
      DateFont.Charset = DEFAULT_CHARSET
      DateFont.Color = clWindowText
      DateFont.Height = -11
      DateFont.Name = 'MS Sans Serif'
      DateFont.Style = []
      MonthNames.Jan = 'January'
      MonthNames.Feb = 'February'
      MonthNames.Mar = 'March'
      MonthNames.Apr = 'April'
      MonthNames.May = 'May'
      MonthNames.Jun = 'June'
      MonthNames.Jul = 'July'
      MonthNames.Aug = 'August'
      MonthNames.Sep = 'September'
      MonthNames.Oct = 'October'
      MonthNames.Nov = 'November'
      MonthNames.Dec = 'December'
      Headers.Week = 'Wk'
      Headers.Sunday = 'Sun'
      Headers.Monday = 'Mon'
      Headers.Tuesday = 'Tue'
      Headers.Wednesday = 'Wed'
      Headers.Thursday = 'Thu'
      Headers.Friday = 'Fri'
      Headers.Saturday = 'Sat'
      SingleDate = True
      ShowCurrent = False
      TimeFormat = 'hh:mm'
      Color = clWindow
      TabOrder = 4
    end
    object edtFromDespDate: TODPopupCalendar
      Left = 104
      Top = 138
      Width = 120
      Height = 21
      DateFormat = 'dd/mm/yyyy'
      Seperator = ' - '
      PopupCaption = 'Select Date Range'
      DisplayYear = 2006
      DisplayMonth = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      StartFont.Charset = DEFAULT_CHARSET
      StartFont.Color = clWindowText
      StartFont.Height = -11
      StartFont.Name = 'MS Sans Serif'
      StartFont.Style = []
      FinishFont.Charset = DEFAULT_CHARSET
      FinishFont.Color = clWindowText
      FinishFont.Height = -11
      FinishFont.Name = 'MS Sans Serif'
      FinishFont.Style = []
      DateFont.Charset = DEFAULT_CHARSET
      DateFont.Color = clWindowText
      DateFont.Height = -11
      DateFont.Name = 'MS Sans Serif'
      DateFont.Style = []
      MonthNames.Jan = 'January'
      MonthNames.Feb = 'February'
      MonthNames.Mar = 'March'
      MonthNames.Apr = 'April'
      MonthNames.May = 'May'
      MonthNames.Jun = 'June'
      MonthNames.Jul = 'July'
      MonthNames.Aug = 'August'
      MonthNames.Sep = 'September'
      MonthNames.Oct = 'October'
      MonthNames.Nov = 'November'
      MonthNames.Dec = 'December'
      Headers.Week = 'Wk'
      Headers.Sunday = 'Sun'
      Headers.Monday = 'Mon'
      Headers.Tuesday = 'Tue'
      Headers.Wednesday = 'Wed'
      Headers.Thursday = 'Thu'
      Headers.Friday = 'Fri'
      Headers.Saturday = 'Sat'
      SingleDate = True
      ShowCurrent = False
      TimeFormat = 'hh:mm'
      Color = clWindow
      TabOrder = 5
    end
    object btnFind: TButton
      Left = 248
      Top = 16
      Width = 121
      Height = 25
      Caption = 'Find'
      TabOrder = 6
      OnClick = btnFindClick
    end
    object btnZeroValueRating: TButton
      Left = 248
      Top = 48
      Width = 121
      Height = 25
      Caption = 'Zero Value Rating'
      TabOrder = 7
      OnClick = btnZeroValueRatingClick
    end
    object btnClose: TButton
      Left = 248
      Top = 80
      Width = 121
      Height = 25
      Caption = 'Close'
      TabOrder = 8
      OnClick = btnCloseClick
    end
    object gbxAllQltySum: TGroupBox
      Left = 8
      Top = 168
      Width = 369
      Height = 89
      Caption = ' All Qlty and Finish Sum '
      TabOrder = 9
      object dbgAllQltySum: TDBGrid
        Left = 2
        Top = 15
        Width = 365
        Height = 72
        Align = alClient
        DataSource = datAllQltySum
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object gbxQuality: TGroupBox
    Left = 0
    Top = 384
    Width = 369
    Height = 129
    Caption = ' Quality and Value '
    TabOrder = 5
    object DBGrid3: TDBGrid
      Left = 2
      Top = 15
      Width = 365
      Height = 112
      Align = alClient
      DataSource = datQlty
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object qryAllInfo: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      
        'select vbstru,vbcol,vbfin,metricwidth,datemanu,despno,qlty,netle' +
        'ngth,'
      '  despdate,valuerating'
      'from vbrcpt'
      'where vbstru = :vbstru'
      'and vbcol = :vbcol'
      'and vbfin = :vbfin'
      'and metricwidth = :metricwidth'
      'and datemanu <= :todatemanu'
      'and (despdate >= :fromdespdate or despdate is null)'
      'and valuerating = 1')
    Left = 400
    Top = 65
    ParamData = <
      item
        DataType = ftString
        Name = 'vbstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbcol'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbfin'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'metricwidth'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'todatemanu'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'fromdespdate'
        ParamType = ptUnknown
      end>
    object qryAllInfoVBSTRU: TStringField
      FieldName = 'VBSTRU'
      FixedChar = True
      Size = 3
    end
    object qryAllInfoVBCOL: TStringField
      FieldName = 'VBCOL'
      FixedChar = True
      Size = 3
    end
    object qryAllInfoVBFIN: TStringField
      FieldName = 'VBFIN'
      FixedChar = True
      Size = 2
    end
    object qryAllInfoMETRICWIDTH: TSmallintField
      FieldName = 'METRICWIDTH'
    end
    object qryAllInfoDATEMANU: TDateTimeField
      FieldName = 'DATEMANU'
    end
    object qryAllInfoDESPNO: TIntegerField
      FieldName = 'DESPNO'
    end
    object qryAllInfoQLTY: TStringField
      FieldName = 'QLTY'
      FixedChar = True
      Size = 1
    end
    object qryAllInfoNETLENGTH: TFloatField
      FieldName = 'NETLENGTH'
      DisplayFormat = '#,##0.00'
    end
    object qryAllInfoDESPDATE: TDateTimeField
      FieldName = 'DESPDATE'
    end
    object qryAllInfoVALUERATING: TIntegerField
      FieldName = 'VALUERATING'
    end
  end
  object datAllInfo: TDataSource
    DataSet = qryAllInfo
    Left = 432
    Top = 65
  end
  object qrySummaryInfo: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select '#39'alldesp'#39' as desp,qlty,sum(netlength) as netlength'
      'from vbrcpt'
      'where vbstru = :vbstru'
      'and vbcol = :vbcol'
      'and vbfin = :vbfin'
      'and metricwidth = :metricwidth'
      'and datemanu <= :todatemanu'
      'and (despdate >= :fromdespdate or despdate is null)'
      'and valuerating = 1'
      'group by qlty'
      'union'
      'select '#39'desp0  '#39' as desp,qlty,sum(netlength) as netlength'
      'from vbrcpt'
      'where vbstru = :vbstru'
      'and vbcol = :vbcol'
      'and vbfin = :vbfin'
      'and metricwidth = :metricwidth'
      'and datemanu <= :todatemanu'
      'and (despno = 0)'
      'and valuerating = 1'
      'group by qlty')
    Left = 400
    Top = 97
    ParamData = <
      item
        DataType = ftString
        Name = 'vbstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbcol'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbfin'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'metricwidth'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'todatemanu'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'fromdespdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbcol'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbfin'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'metricwidth'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'todatemanu'
        ParamType = ptUnknown
      end>
    object qrySummaryInfoDESP: TStringField
      DisplayWidth = 15
      FieldName = 'DESP'
      FixedChar = True
      Size = 7
    end
    object qrySummaryInfoQLTY: TStringField
      FieldName = 'QLTY'
      FixedChar = True
      Size = 1
    end
    object qrySummaryInfoNETLENGTH: TFloatField
      FieldName = 'NETLENGTH'
      DisplayFormat = '#,##0.00'
    end
  end
  object datSummaryInfo: TDataSource
    DataSet = qrySummaryInfo
    Left = 432
    Top = 97
  end
  object qryQlty: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select *'
      'from stdqltyvalues'
      'where prodtype='#39'VB'#39
      'order by qlty')
    Left = 400
    Top = 129
  end
  object datQlty: TDataSource
    DataSet = qryQlty
    Left = 432
    Top = 129
  end
  object qryUpdateVBRcptDespAll: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'update vbrcpt'
      'set valuerating=0'
      'where vbstru = :vbstru'
      'and vbcol = :vbcol'
      'and vbfin = :vbfin'
      'and metricwidth = :metricwidth'
      'and datemanu <= :todatemanu'
      'and (despdate >= :fromdespdate or despdate is null)'
      'and valuerating = 1'
      'and qlty= :qlty')
    Left = 400
    Top = 169
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vbstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vbcol'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vbfin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'metricwidth'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'todatemanu'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fromdespdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'qlty'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateVBRcptDesp0: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'update vbrcpt'
      'set valuerating=0'
      'where vbstru = :vbstru'
      'and vbcol = :vbcol'
      'and vbfin = :vbfin'
      'and metricwidth = :metricwidth'
      'and datemanu <= :todatemanu'
      'and (despno = 0)'
      'and valuerating = 1'
      'and qlty= :qlty')
    Left = 432
    Top = 169
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vbstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vbcol'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vbfin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'metricwidth'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'todatemanu'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'qlty'
        ParamType = ptUnknown
      end>
  end
  object qryAllQltySum: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select sum(netlength) as netlength'
      'from vbrcpt'
      'where vbstru = :vbstru'
      'and vbcol = :vbcol'
      'and metricwidth = :metricwidth'
      'and datemanu <= :todatemanu'
      'and (despdate >= :fromdespdate or despdate is null)'
      'and valuerating = 1')
    Left = 400
    Top = 209
    ParamData = <
      item
        DataType = ftString
        Name = 'vbstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbcol'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'metricwidth'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'todatemanu'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'fromdespdate'
        ParamType = ptUnknown
      end>
    object qryAllQltySumNETLENGTH: TFloatField
      FieldName = 'NETLENGTH'
      DisplayFormat = '#,##0.00'
    end
  end
  object datAllQltySum: TDataSource
    DataSet = qryAllQltySum
    Left = 432
    Top = 209
  end
end
