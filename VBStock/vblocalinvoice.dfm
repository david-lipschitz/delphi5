object frmLocalInvoice: TfrmLocalInvoice
  Left = 216
  Top = 157
  Width = 544
  Height = 375
  Caption = 'Local Invoice'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 802
    Height = 73
    Align = alTop
    TabOrder = 0
    object Discount: TLabel
      Left = 8
      Top = 8
      Width = 42
      Height = 13
      Caption = 'Discount'
    end
    object btnClose: TBitBtn
      Left = 424
      Top = 24
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = btnCloseClick
      Kind = bkClose
    end
    object DBEdit1: TDBEdit
      Left = 56
      Top = 8
      Width = 121
      Height = 21
      DataSource = datVBDespHdr
      TabOrder = 1
    end
  end
  object QuickRep1: TQuickRep
    Left = 8
    Top = 88
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
  end
  object tabVBDespHdr: TTable
    DatabaseName = 'VBStock'
    TableName = 'VBDESPHDR'
    Left = 184
    Top = 8
  end
  object datVBDespHdr: TDataSource
    DataSet = tabVBDespHdr
    Left = 216
    Top = 8
  end
end
