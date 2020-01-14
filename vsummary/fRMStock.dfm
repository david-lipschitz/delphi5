object frmRMStock: TfrmRMStock
  Left = 455
  Top = 252
  Width = 614
  Height = 471
  Caption = 'RM Stock'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 34
    Width = 61
    Height = 13
    Caption = 'Stock Period'
  end
  object Label9: TLabel
    Left = 192
    Top = 98
    Width = 75
    Height = 13
    Caption = 'Export Directory'
  end
  object odpStockRange: TODPopupCalendar
    Left = 96
    Top = 32
    Width = 320
    Height = 21
    DateFormat = 'dddd, mmm d, yyyy'
    Seperator = ' - '
    PopupCaption = 'Select Date Range'
    DisplayYear = 2011
    DisplayMonth = 4
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
    TimeFormat = 'hh:mm'
    Color = clWindow
    TabOrder = 0
  end
  object btnDoCalc: TButton
    Left = 96
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Do Calc'
    TabOrder = 1
    OnClick = btnDoCalcClick
  end
  object btnDoExport: TButton
    Left = 96
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Do Export'
    TabOrder = 2
    OnClick = btnDoExportClick
  end
  object btnClose: TButton
    Left = 456
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = btnCloseClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 425
    Width = 606
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object edtExportDirectory: TEdit
    Left = 273
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'c:\'
  end
  object spFindRM: TStoredProc
    DatabaseName = 'Stock'
    StoredProcName = 'SPFINDRMMOVEMENT '
    Left = 96
    Top = 128
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PMOVEMENTFROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PMOVEMENTTO'
        ParamType = ptInput
      end>
  end
  object XLS: TXLSReadWriteII2
    Version = xvExcel97
    Sheets = <
      item
        Name = 'Sheet1'
        DefaultColWidth = 8
        DefaultRowHeight = 255
        PrintSettings.Copies = 0
        PrintSettings.FooterMargin = 0.5
        PrintSettings.HeaderMargin = 0.5
        PrintSettings.MarginBottom = -1
        PrintSettings.MarginLeft = -1
        PrintSettings.MarginRight = -1
        PrintSettings.MarginTop = -1
        PrintSettings.MarginBottomCm = -2.54
        PrintSettings.MarginLeftCm = -2.54
        PrintSettings.MarginRightCm = -2.54
        PrintSettings.MarginTopCm = -2.54
        PrintSettings.Options = [psoPortrait]
        PrintSettings.PaperSize = psA4
        PrintSettings.ScalingFactor = 100
        PrintSettings.StartingPage = 1
        PrintSettings.HorizPagebreaks = <>
        PrintSettings.VertPagebreaks = <>
        PrintSettings.Resolution = 600
        MergedCells = <>
        Options = [soGridlines, soRowColHeadings, soShowZeros]
        WorkspaceOptions = [woShowAutoBreaks, woRowSumsBelow, woColSumsRight, woOutlineSymbols]
        SheetProtection = [spEditObjects, spEditScenarios, spEditCellFormattingm, spEditColumnFormatting, spEditRowFormatting, spInsertColumns, spInsertRows, spInsertHyperlinks, spDeleteColumns, spDeleteRows, spSelectLockedCells, spSortCellRange, spEditAutoFileters, spEditPivotTables, spSelectUnlockedCells]
        Zoom = 0
        ZoomPreview = 0
        RecalcFormulas = True
        Hidden = hsVisible
        Validations = <>
        DrawingObjects.Texts = <>
        DrawingObjects.Notes = <>
        DrawingObjects.Basics = <>
        DrawingObjects.AutoShapes = <>
        DrawingObjects.Pictures = <>
        ControlsObjects.ListBoxes = <>
        ControlsObjects.ComboBoxes = <>
        ControlsObjects.Buttons = <>
        Hyperlinks = <>
        ConditionalFormats = <>
      end>
    Workbook.Left = 100
    Workbook.Top = 100
    Workbook.Width = 10000
    Workbook.Height = 7000
    Workbook.SelectedTab = 0
    Workbook.Options = [woHScroll, woVScroll, woTabs]
    OptionsDialog.SaveExtLinkVal = False
    OptionsDialog.CalcCount = 100
    OptionsDialog.CalcMode = cmAutomatic
    OptionsDialog.Delta = 0.001
    OptionsDialog.ShowObjects = soShowAll
    OptionsDialog.Iteration = False
    OptionsDialog.PrecisionAsDisplayed = True
    OptionsDialog.R1C1Mode = False
    OptionsDialog.RecalcBeforeSave = False
    OptionsDialog.Uncalced = False
    OptionsDialog.SaveRecalc = True
    Font.Name = 'Arial'
    Font.Charset = ANSI_CHARSET
    Font.Family = 2
    Font.Color = xcBlack
    Font.Size = 10
    Font.Size20 = 200
    Font.Style = []
    Font.SubSuperScript = xssNone
    Font.Underline = xulNone
    BookProtected = False
    Backup = False
    RefreshAll = False
    StrTRUE = 'TRUE'
    StrFALSE = 'FALSE'
    ShowFormulas = False
    IsMac = False
    PreserveMacros = True
    ComponentVersion = '2.02.13'
    MSOPictures = <>
    Left = 132
    Top = 129
  end
  object XLSDbRead: TXLSDbRead2
    Column = 0
    IncludeFieldnames = True
    Row = 0
    Sheet = 0
    XLS = XLS
    Left = 164
    Top = 129
  end
  object qryExportRM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select *'
      'from whrm'
      'order by extprodref')
    Left = 200
    Top = 128
  end
end
