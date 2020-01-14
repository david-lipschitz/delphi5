object frmGetDates: TfrmGetDates
  Left = 378
  Top = 255
  Width = 391
  Height = 171
  Caption = 'frmGetDates'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object calDates: TODPopupCalendar
    Left = 32
    Top = 24
    Width = 320
    Height = 21
    DateFormat = 'dddd, mmm d, yyyy'
    Seperator = ' - '
    PopupCaption = 'Select Date Range'
    DisplayYear = 2006
    DisplayMonth = 2
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
    ShowCurrent = False
    StartOnMonday = True
    TimeFormat = 'hh:mm'
    Color = clWindow
    TabOrder = 0
  end
  object btnOK: TBitBtn
    Left = 56
    Top = 64
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 168
    Top = 64
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end