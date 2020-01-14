object frmPrnEmpChoice: TfrmPrnEmpChoice
  Left = 259
  Top = 170
  Width = 316
  Height = 255
  Caption = 'Print Employee Sorting Choices'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnPrintReport: TBitBtn
    Left = 56
    Top = 192
    Width = 75
    Height = 25
    TabOrder = 0
    OnClick = btnPrintReportClick
    Kind = bkOK
  end
  object btnCancelReport: TBitBtn
    Left = 184
    Top = 192
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object rdgPrnEmpChoice: TRadioGroup
    Left = 16
    Top = 16
    Width = 281
    Height = 153
    Caption = ' Sorting Options '
    ItemIndex = 0
    Items.Strings = (
      'Sort By ClockNo (default)'
      'Sort By WeeksPay'
      'Sort By WeeksPay Descending (Highest to Lowest)'
      'Sort By Surname,FirstName'
      'Sort By FirstName,Surname')
    TabOrder = 2
  end
end
