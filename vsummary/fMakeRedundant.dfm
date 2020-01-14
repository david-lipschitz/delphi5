object frmMakeRedundant: TfrmMakeRedundant
  Left = 242
  Top = 151
  Width = 1000
  Height = 725
  Caption = 'Make Redundant'
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
  object pgeMakeRedundant: TPageControl
    Left = 0
    Top = 41
    Width = 992
    Height = 638
    ActivePage = tshFindRedundantStock
    Align = alClient
    TabOrder = 0
    object tshFindRedundantStock: TTabSheet
      Caption = 'Find Redundant Stock'
      ImageIndex = 3
      object Label5: TLabel
        Left = 16
        Top = 18
        Width = 89
        Height = 13
        Caption = 'Year End Selected'
      end
      object Label6: TLabel
        Left = 16
        Top = 42
        Width = 81
        Height = 13
        Caption = 'Movement Dates'
      end
      object Label7: TLabel
        Left = 16
        Top = 66
        Width = 126
        Height = 13
        Caption = 'After Movement Start Date'
      end
      object Label8: TLabel
        Left = 16
        Top = 90
        Width = 50
        Height = 13
        Caption = 'Price Date'
      end
      object Label9: TLabel
        Left = 328
        Top = 290
        Width = 75
        Height = 13
        Caption = 'Export Directory'
      end
      object btnFindRedundant: TButton
        Left = 328
        Top = 200
        Width = 97
        Height = 25
        Caption = 'Find Redundant'
        TabOrder = 10
        OnClick = btnFindRedundantClick
      end
      object cbxRMFound: TDBCheckBox
        Left = 16
        Top = 120
        Width = 97
        Height = 17
        Caption = 'RM Found'
        DataField = 'RMFOUND'
        DataSource = datRedundantStockParams
        TabOrder = 4
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object cbxYarnFound: TDBCheckBox
        Left = 16
        Top = 144
        Width = 97
        Height = 17
        Caption = 'Yarn Found'
        DataField = 'YARNFOUND'
        DataSource = datRedundantStockParams
        TabOrder = 5
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object cbxVBFound: TDBCheckBox
        Left = 16
        Top = 168
        Width = 97
        Height = 17
        Caption = 'VB Found'
        DataField = 'VBFOUND'
        DataSource = datRedundantStockParams
        TabOrder = 6
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object dbgRMRedundant: TDBRadioGroup
        Left = 152
        Top = 128
        Width = 185
        Height = 40
        Caption = ' RM Redundant '
        Columns = 3
        DataField = 'RMREDUNDANT'
        DataSource = datRedundantStockParams
        Items.Strings = (
          'No'
          'WIP'
          'Yes')
        TabOrder = 7
        Values.Strings = (
          'N'
          'W'
          'Y')
        Visible = False
      end
      object rdgVBRedundant: TDBRadioGroup
        Left = 544
        Top = 128
        Width = 185
        Height = 40
        Caption = ' VB Redundant '
        Columns = 3
        DataField = 'VBREDUNDANT'
        DataSource = datRedundantStockParams
        Items.Strings = (
          'No'
          'WIP'
          'Yes')
        TabOrder = 9
        Values.Strings = (
          'N'
          'W'
          'Y')
        Visible = False
      end
      object odpYearEnd: TODDBPopupCalendar
        Left = 152
        Top = 16
        Width = 120
        Height = 21
        DateFormat = 'dd/mm/yyyy'
        Seperator = ' - '
        PopupCaption = 'Select Date Range'
        DisplayYear = 2005
        DisplayMonth = 12
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
        TabOrder = 0
        DataSource = datRedundantStockParams
        StartDateName = 'YEARENDDATE'
      end
      object odpMovement: TODDBPopupCalendar
        Left = 152
        Top = 40
        Width = 240
        Height = 21
        DateFormat = 'dd/mm/yyyy'
        Seperator = ' - '
        PopupCaption = 'Select Date Range'
        DisplayYear = 2006
        DisplayMonth = 1
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
        TabOrder = 1
        DataSource = datRedundantStockParams
        StartDateName = 'MOVEMENTFROMDATE'
        FinishDateName = 'MOVEMENTTODATE'
      end
      object odpAfterMovement: TODDBPopupCalendar
        Left = 152
        Top = 64
        Width = 120
        Height = 21
        DateFormat = 'dd/mm/yyyy'
        Seperator = ' - '
        PopupCaption = 'Select Date Range'
        DisplayYear = 2007
        DisplayMonth = 1
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
        TabOrder = 2
        DataSource = datRedundantStockParams
        StartDateName = 'AFTERMOVEMENTDATE'
      end
      object odpPriceDate: TODDBPopupCalendar
        Left = 152
        Top = 88
        Width = 120
        Height = 21
        DateFormat = 'dd/mm/yyyy'
        Seperator = ' - '
        PopupCaption = 'Select Date Range'
        DisplayYear = 2006
        DisplayMonth = 12
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
        TabOrder = 3
        DataSource = datRedundantStockParams
        StartDateName = 'PRICEDATE'
      end
      object rdgYarnRedundant: TDBRadioGroup
        Left = 352
        Top = 128
        Width = 185
        Height = 40
        Caption = ' Yarn Redundant '
        Columns = 3
        DataField = 'YARNREDUNDANT'
        DataSource = datRedundantStockParams
        Items.Strings = (
          'No'
          'WIP'
          'Yes')
        TabOrder = 8
        Values.Strings = (
          'N'
          'W'
          'Y')
        Visible = False
      end
      object dbnRedundantStockParams: TDBNavigator
        Left = 16
        Top = 192
        Width = 140
        Height = 25
        DataSource = datRedundantStockParams
        VisibleButtons = [nbPrior, nbNext, nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
        TabOrder = 11
      end
      object btnExportFiles: TButton
        Left = 328
        Top = 317
        Width = 97
        Height = 25
        Caption = 'Export Files'
        TabOrder = 12
        OnClick = btnExportFilesClick
      end
      object edtExportDirectory: TEdit
        Left = 416
        Top = 288
        Width = 121
        Height = 21
        TabOrder = 13
        Text = 'c:\'
      end
    end
    object tshRM: TTabSheet
      Caption = 'RM/WIP'
      object gbxTxnDetMovement: TGroupBox
        Left = 0
        Top = 0
        Width = 984
        Height = 81
        Align = alTop
        Caption = ' TxnDet Movement '
        TabOrder = 0
        object dbgTDMRM: TDBGrid
          Left = 2
          Top = 15
          Width = 980
          Height = 64
          Align = alClient
          DataSource = datTDMRM
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object gbxTxnDetMovementNotes: TGroupBox
        Left = 0
        Top = 81
        Width = 984
        Height = 105
        Align = alTop
        Caption = ' TxnDet Movement Notes '
        TabOrder = 1
        object Label2: TLabel
          Left = 16
          Top = 50
          Width = 28
          Height = 13
          Caption = 'Notes'
        end
        object edtNotesRM: TEdit
          Left = 56
          Top = 48
          Width = 593
          Height = 21
          TabOrder = 0
          Text = 'edtNotesRM'
        end
        object cbxMakeRedundantRM: TCheckBox
          Left = 16
          Top = 24
          Width = 129
          Height = 17
          Caption = 'Make Redundant?'
          TabOrder = 1
        end
        object btnUpdateRM: TButton
          Left = 160
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Update'
          TabOrder = 2
          OnClick = btnUpdateRMClick
        end
        object btnMakeRedundantRM: TButton
          Left = 264
          Top = 16
          Width = 129
          Height = 25
          Caption = 'Make WIP Redundant'
          TabOrder = 3
          OnClick = btnMakeRedundantRMClick
        end
        object cbxSpeedUpRMWIP: TCheckBox
          Left = 528
          Top = 24
          Width = 137
          Height = 17
          Caption = 'Speed Up RM/WIP'
          TabOrder = 4
        end
      end
      object gbxDelPallet: TGroupBox
        Left = 0
        Top = 291
        Width = 984
        Height = 105
        Align = alTop
        Caption = ' DelPallet '
        TabOrder = 2
        object dbgDelPalletRM: TDBGrid
          Left = 2
          Top = 15
          Width = 980
          Height = 88
          Align = alClient
          DataSource = datDelPalletRM
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object gbxWIPRcpt: TGroupBox
        Left = 0
        Top = 396
        Width = 984
        Height = 105
        Align = alTop
        Caption = ' WIPRcpt '
        TabOrder = 3
        object dbgWIPRcptRM: TDBGrid
          Left = 2
          Top = 15
          Width = 980
          Height = 88
          Align = alClient
          DataSource = datWIPRcptRM
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object gbxTxnDet: TGroupBox
        Left = 0
        Top = 186
        Width = 984
        Height = 105
        Align = alTop
        Caption = ' TxnDet '
        TabOrder = 4
        object dbgTxnDetByQltyRM: TDBGrid
          Left = 2
          Top = 15
          Width = 167
          Height = 88
          Align = alLeft
          DataSource = datTxnDetByQltyRM
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object dbgTxnDetByTxnCodeRM: TDBGrid
          Left = 169
          Top = 15
          Width = 184
          Height = 88
          Align = alLeft
          DataSource = datTxnDetByTxnCodeRM
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object dbgTxnDetRM: TDBGrid
          Left = 353
          Top = 15
          Width = 629
          Height = 88
          Align = alClient
          DataSource = datTxnDetRM
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object gbxTotals: TGroupBox
        Left = 0
        Top = 501
        Width = 984
        Height = 109
        Align = alClient
        Caption = ' Totals (DelPallet - WIPRcpt) '
        TabOrder = 5
        object Label1: TLabel
          Left = 480
          Top = 16
          Width = 81
          Height = 13
          Caption = 'Total Stock Here'
        end
        object dbgDelPalletTotalRM: TDBGrid
          Left = 2
          Top = 15
          Width = 247
          Height = 92
          Align = alLeft
          DataSource = datDelPalletTotalRM
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object dbgWIPRcptTotalRM: TDBGrid
          Left = 249
          Top = 15
          Width = 208
          Height = 92
          Align = alLeft
          DataSource = datWIPRcptTotalRM
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object edtTotalStockRM: TEdit
          Left = 480
          Top = 32
          Width = 121
          Height = 21
          TabOrder = 2
          Text = 'edtTotalStockRM'
        end
      end
    end
    object tshYarn: TTabSheet
      Caption = 'Yarn'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 984
        Height = 81
        Align = alTop
        Caption = ' TxnDet Movement '
        TabOrder = 0
        object dbgTDMYarn: TDBGrid
          Left = 2
          Top = 15
          Width = 980
          Height = 64
          Align = alClient
          DataSource = datTDMYarn
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 81
        Width = 984
        Height = 105
        Align = alTop
        Caption = ' TxnDet Movement Notes '
        TabOrder = 1
        object Label3: TLabel
          Left = 16
          Top = 50
          Width = 28
          Height = 13
          Caption = 'Notes'
        end
        object edtNotesYarn: TEdit
          Left = 56
          Top = 48
          Width = 593
          Height = 21
          TabOrder = 0
          Text = 'edtNotesYarn'
        end
        object cbxMakeRedundantYarn: TCheckBox
          Left = 16
          Top = 24
          Width = 129
          Height = 17
          Caption = 'Make Redundant?'
          TabOrder = 1
        end
        object btnUpdateYN: TButton
          Left = 160
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Update'
          TabOrder = 2
          OnClick = btnUpdateYNClick
        end
        object btnMakeRedundantYN: TButton
          Left = 264
          Top = 16
          Width = 129
          Height = 25
          Caption = 'Make Yarn Redundant'
          TabOrder = 3
          OnClick = btnMakeRedundantYNClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 186
        Width = 984
        Height = 105
        Align = alTop
        Caption = ' TxnDet '
        TabOrder = 2
        object dbgTxnDetByQltyYarn: TDBGrid
          Left = 2
          Top = 15
          Width = 167
          Height = 88
          Align = alLeft
          DataSource = datTxnDetByQltyYarn
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object dbgTxnDetByTxnCodeYarn: TDBGrid
          Left = 169
          Top = 15
          Width = 184
          Height = 88
          Align = alLeft
          DataSource = datTxnDetByTxnCodeYarn
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object dbgTxnDetYarn: TDBGrid
          Left = 353
          Top = 15
          Width = 629
          Height = 88
          Align = alClient
          DataSource = datTxnDetYarn
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object gbxVT1Yarn: TGroupBox
        Left = 0
        Top = 291
        Width = 984
        Height = 105
        Align = alTop
        Caption = ' VT1 Yarn '
        TabOrder = 3
        object dbgVT1Yarn: TDBGrid
          Left = 2
          Top = 15
          Width = 320
          Height = 88
          Align = alLeft
          DataSource = datVT1Yarn
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object gbxVT2Yarn: TGroupBox
        Left = 0
        Top = 396
        Width = 984
        Height = 105
        Align = alTop
        Caption = ' VT2 Yarn '
        TabOrder = 4
        object dbgVT2Yarn: TDBGrid
          Left = 2
          Top = 15
          Width = 319
          Height = 88
          Align = alLeft
          DataSource = datVT2Yarn
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
    object tshVB: TTabSheet
      Caption = 'VB'
      ImageIndex = 2
      object Label10: TLabel
        Left = 32
        Top = 416
        Width = 305
        Height = 13
        Caption = 'VB After Movement Information only  records manufactured data.'
      end
      object gbxVBMovement: TGroupBox
        Left = 0
        Top = 0
        Width = 984
        Height = 81
        Align = alTop
        Caption = ' VB Movement '
        TabOrder = 0
        object dbgVBM: TDBGrid
          Left = 2
          Top = 15
          Width = 980
          Height = 64
          Align = alClient
          DataSource = datVBM
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object gbxVBMNotes: TGroupBox
        Left = 0
        Top = 81
        Width = 984
        Height = 105
        Align = alTop
        Caption = ' VB Movement Notes '
        TabOrder = 1
        object Label4: TLabel
          Left = 16
          Top = 50
          Width = 28
          Height = 13
          Caption = 'Notes'
        end
        object edtNotesVB: TEdit
          Left = 56
          Top = 48
          Width = 593
          Height = 21
          TabOrder = 0
          Text = 'edtNotesVB'
        end
        object cbxMakeRedundantVB: TCheckBox
          Left = 16
          Top = 24
          Width = 129
          Height = 17
          Caption = 'Make Redundant?'
          TabOrder = 1
        end
        object btnUpdateVBM: TButton
          Left = 160
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Update'
          TabOrder = 2
          OnClick = btnUpdateVBMClick
        end
        object btnMakeVBRedundant: TButton
          Left = 264
          Top = 16
          Width = 129
          Height = 25
          Caption = 'Make VB Redundant'
          TabOrder = 3
          OnClick = btnMakeVBRedundantClick
        end
      end
      object gbxVB: TGroupBox
        Left = 0
        Top = 186
        Width = 984
        Height = 105
        Align = alTop
        Caption = ' VB Detail '
        TabOrder = 2
        object dbgVBRcpt: TDBGrid
          Left = 2
          Top = 15
          Width = 980
          Height = 88
          Align = alClient
          DataSource = datVBRcpt
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object gbxVBTotals: TGroupBox
        Left = 0
        Top = 291
        Width = 984
        Height = 105
        Align = alTop
        Caption = ' VB Totals '
        TabOrder = 3
        object dbgVBTotals: TDBGrid
          Left = 2
          Top = 15
          Width = 367
          Height = 88
          Align = alLeft
          DataSource = datVBTotals
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 679
    Width = 992
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 992
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label11: TLabel
      Left = 128
      Top = 16
      Width = 228
      Height = 13
      Caption = 'Always choose the last date on the first tabsheet'
      Color = clYellow
      ParentColor = False
    end
    object btnClose: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = btnCloseClick
      Kind = bkClose
    end
  end
  object datTDMRM: TDataSource
    DataSet = qryTDMRM
    OnDataChange = datTDMRMDataChange
    Left = 492
    Top = 97
  end
  object qryTDMRM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select td.extprodref,td.asatqty openingstock,'
      '  td.inmovementqty, td.outmovementqty,'
      '  td.asatqty+td.inmovementqty+td.outmovementqty closingstock,'
      '  td.aftermovementqty,td.verylastmovementdate,'
      '  td.currentstock,'
      '  td.stdprice,'
      
        '  (td.asatqty+td.inmovementqty+td.outmovementqty)*stdprice stkva' +
        'lue,'
      '  td.makeredundant,td.notes,'
      '  pr.prodref'
      'from txndetmovement td, product pr'
      'where td.inmovementqty = 0 and td.outmovementqty=0'
      
        'and ((td.asatqty<>0) or ((td.asatqty+td.inmovementqty+td.outmove' +
        'mentqty)<>0))'
      'and td.extprodref=pr.extprodref'
      'order by td.extprodref')
    Left = 460
    Top = 97
    object qryTDMRMEXTPRODREF: TStringField
      FieldName = 'EXTPRODREF'
      FixedChar = True
      Size = 11
    end
    object qryTDMRMOPENINGSTOCK: TFloatField
      FieldName = 'OPENINGSTOCK'
      DisplayFormat = '0.00'
    end
    object qryTDMRMINMOVEMENTQTY: TFloatField
      FieldName = 'INMOVEMENTQTY'
      DisplayFormat = '0.00'
    end
    object qryTDMRMOUTMOVEMENTQTY: TFloatField
      FieldName = 'OUTMOVEMENTQTY'
      DisplayFormat = '0.00'
    end
    object qryTDMRMCLOSINGSTOCK: TFloatField
      FieldName = 'CLOSINGSTOCK'
      DisplayFormat = '0.00'
    end
    object qryTDMRMAFTERMOVEMENTQTY: TFloatField
      FieldName = 'AFTERMOVEMENTQTY'
      DisplayFormat = '0.00'
    end
    object qryTDMRMVERYLASTMOVEMENTDATE: TDateTimeField
      DisplayWidth = 10
      FieldName = 'VERYLASTMOVEMENTDATE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTDMRMCURRENTSTOCK: TFloatField
      FieldName = 'CURRENTSTOCK'
      DisplayFormat = '0.00'
    end
    object qryTDMRMSTDPRICE: TFloatField
      FieldName = 'STDPRICE'
      DisplayFormat = '0.00'
    end
    object qryTDMRMSTKVALUE: TFloatField
      FieldName = 'STKVALUE'
      DisplayFormat = '0.00'
    end
    object qryTDMRMMAKEREDUNDANT: TStringField
      FieldName = 'MAKEREDUNDANT'
      FixedChar = True
      Size = 1
    end
    object qryTDMRMNOTES: TStringField
      FieldName = 'NOTES'
      Size = 200
    end
    object qryTDMRMPRODREF: TStringField
      FieldName = 'PRODREF'
      FixedChar = True
      Size = 6
    end
  end
  object qryDelPalletRM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select *'
      'from delpallet'
      'where prodref=:prodref'
      'and qtyissued<>qtyrcvd'
      'order by delno,palletno')
    Left = 508
    Top = 387
    ParamData = <
      item
        DataType = ftString
        Name = 'prodref'
        ParamType = ptUnknown
      end>
    object qryDelPalletRMDELNO: TIntegerField
      FieldName = 'DELNO'
      Origin = 'STOCK6LINUXSQLHOME.DELPALLET.DELNO'
    end
    object qryDelPalletRMPALLETNO: TSmallintField
      FieldName = 'PALLETNO'
      Origin = 'STOCK6LINUXSQLHOME.DELPALLET.PALLETNO'
    end
    object qryDelPalletRMPRODREF: TStringField
      FieldName = 'PRODREF'
      Origin = 'STOCK6LINUXSQLHOME.DELPALLET.PRODREF'
      FixedChar = True
      Size = 6
    end
    object qryDelPalletRMBAGCARTBALEDEL: TSmallintField
      FieldName = 'BAGCARTBALEDEL'
      Origin = 'STOCK6LINUXSQLHOME.DELPALLET.BAGCARTBALEDEL'
    end
    object qryDelPalletRMQTYRCVD: TFloatField
      FieldName = 'QTYRCVD'
      Origin = 'STOCK6LINUXSQLHOME.DELPALLET.QTYRCVD'
    end
    object qryDelPalletRMMERGENO: TStringField
      FieldName = 'MERGENO'
      Origin = 'STOCK6LINUXSQLHOME.DELPALLET.MERGENO'
      FixedChar = True
      Size = 5
    end
    object qryDelPalletRMQTYISSUED: TFloatField
      FieldName = 'QTYISSUED'
      Origin = 'STOCK6LINUXSQLHOME.DELPALLET.QTYISSUED'
    end
    object qryDelPalletRMBCBISSUED: TFloatField
      FieldName = 'BCBISSUED'
      Origin = 'STOCK6LINUXSQLHOME.DELPALLET.BCBISSUED'
    end
    object qryDelPalletRMVALUERATING: TFloatField
      FieldName = 'VALUERATING'
      Origin = 'STOCK6LINUXSQLHOME.DELPALLET.VALUERATING'
    end
    object qryDelPalletRMVALUERATINGDATE: TDateTimeField
      FieldName = 'VALUERATINGDATE'
      Origin = 'STOCK6LINUXSQLHOME.DELPALLET.VALUERATINGDATE'
    end
  end
  object qryWIPRcptRM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select *'
      'from wiprcpt'
      'where prodref=:prodref'
      'and dateissued is null'
      'and qlty<>'#39'9'#39
      'order by refno')
    Left = 444
    Top = 492
    ParamData = <
      item
        DataType = ftString
        Name = 'prodref'
        ParamType = ptUnknown
      end>
    object qryWIPRcptRMREFNO: TIntegerField
      FieldName = 'REFNO'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.REFNO'
    end
    object qryWIPRcptRMPRODREF: TStringField
      FieldName = 'PRODREF'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.PRODREF'
      FixedChar = True
      Size = 6
    end
    object qryWIPRcptRMRCPTDATE: TDateTimeField
      FieldName = 'RCPTDATE'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.RCPTDATE'
    end
    object qryWIPRcptRMRCPTINITIALS: TStringField
      FieldName = 'RCPTINITIALS'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.RCPTINITIALS'
      FixedChar = True
      Size = 4
    end
    object qryWIPRcptRMNETWEIGHT: TFloatField
      FieldName = 'NETWEIGHT'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.NETWEIGHT'
    end
    object qryWIPRcptRMLOTNO1: TSmallintField
      FieldName = 'LOTNO1'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.LOTNO1'
    end
    object qryWIPRcptRMLOTNO2: TSmallintField
      FieldName = 'LOTNO2'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.LOTNO2'
    end
    object qryWIPRcptRMSHIFT: TStringField
      FieldName = 'SHIFT'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.SHIFT'
      FixedChar = True
      Size = 1
    end
    object qryWIPRcptRMDATEMANU: TDateTimeField
      FieldName = 'DATEMANU'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.DATEMANU'
    end
    object qryWIPRcptRMDATEISSUED: TDateTimeField
      FieldName = 'DATEISSUED'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.DATEISSUED'
    end
    object qryWIPRcptRMISSUEINITIALS: TStringField
      FieldName = 'ISSUEINITIALS'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.ISSUEINITIALS'
      FixedChar = True
      Size = 4
    end
    object qryWIPRcptRMISSUETO: TStringField
      FieldName = 'ISSUETO'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.ISSUETO'
      FixedChar = True
      Size = 6
    end
    object qryWIPRcptRMVALUERATING: TFloatField
      FieldName = 'VALUERATING'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.VALUERATING'
    end
    object qryWIPRcptRMVALUERATINGDATE: TDateTimeField
      FieldName = 'VALUERATINGDATE'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.VALUERATINGDATE'
    end
    object qryWIPRcptRMSTOCKAREA: TIntegerField
      FieldName = 'STOCKAREA'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.STOCKAREA'
    end
    object qryWIPRcptRMBATREF: TIntegerField
      FieldName = 'BATREF'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.BATREF'
    end
    object qryWIPRcptRMDATEENT: TDateTimeField
      FieldName = 'DATEENT'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.DATEENT'
    end
    object qryWIPRcptRMUSERENT: TStringField
      FieldName = 'USERENT'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.USERENT'
      FixedChar = True
      Size = 4
    end
    object qryWIPRcptRMDATEMOD: TDateTimeField
      FieldName = 'DATEMOD'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.DATEMOD'
    end
    object qryWIPRcptRMUSERMOD: TStringField
      FieldName = 'USERMOD'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.USERMOD'
      FixedChar = True
      Size = 4
    end
    object qryWIPRcptRMFACTORYNO: TIntegerField
      FieldName = 'FACTORYNO'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.FACTORYNO'
    end
    object qryWIPRcptRMQLTY: TStringField
      FieldName = 'QLTY'
      Origin = 'STOCK6LINUXSQLHOME.WIPRCPT.QLTY'
      FixedChar = True
      Size = 1
    end
  end
  object qryTxnDetByQltyRM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select qlty,sum(qty)'
      'from txndet'
      'where extprodref=:extprodref'
      'group by qlty')
    Left = 52
    Top = 301
    ParamData = <
      item
        DataType = ftString
        Name = 'extprodref'
        ParamType = ptUnknown
      end>
    object qryTxnDetByQltyRMQLTY: TStringField
      FieldName = 'QLTY'
      FixedChar = True
      Size = 1
    end
    object qryTxnDetByQltyRMSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '0.00'
    end
  end
  object qryDelPalletTotalRM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select sum(qtyrcvd) qtyrcvd,sum(qtyissued) as qtyissued,'
      '  sum(qtyrcvd-qtyissued) as qtyinstock'
      'from delpallet'
      'where prodref=:prodref')
    Left = 108
    Top = 622
    ParamData = <
      item
        DataType = ftString
        Name = 'prodref'
        ParamType = ptUnknown
      end>
    object qryDelPalletTotalRMQTYRCVD: TFloatField
      FieldName = 'QTYRCVD'
    end
    object qryDelPalletTotalRMQTYISSUED: TFloatField
      FieldName = 'QTYISSUED'
    end
    object qryDelPalletTotalRMQTYINSTOCK: TFloatField
      FieldName = 'QTYINSTOCK'
    end
  end
  object qryWIPRcptTotalRM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select qlty,sum(netweight) netweight,count(*) items'
      'from wiprcpt'
      'where prodref=:prodref'
      'and qlty<>'#39'9'#39
      'and dateissued is null'
      'group by qlty')
    Left = 340
    Top = 614
    ParamData = <
      item
        DataType = ftString
        Name = 'prodref'
        ParamType = ptUnknown
      end>
    object qryWIPRcptTotalRMQLTY: TStringField
      FieldName = 'QLTY'
      FixedChar = True
      Size = 1
    end
    object qryWIPRcptTotalRMNETWEIGHT: TFloatField
      FieldName = 'NETWEIGHT'
    end
    object qryWIPRcptTotalRMITEMS: TIntegerField
      FieldName = 'ITEMS'
    end
  end
  object qryUpdateTDMRM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'update  txndetmovement'
      'set makeredundant=:makeredundant,'
      '  notes=:notes'
      'where extprodref=:extprodref')
    Left = 676
    Top = 166
    ParamData = <
      item
        DataType = ftString
        Name = 'makeredundant'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'extprodref'
        ParamType = ptUnknown
      end>
  end
  object datDelPalletRM: TDataSource
    DataSet = qryDelPalletRM
    Left = 540
    Top = 387
  end
  object datWIPRcptRM: TDataSource
    DataSet = qryWIPRcptRM
    Left = 476
    Top = 492
  end
  object datTxnDetByQltyRM: TDataSource
    DataSet = qryTxnDetByQltyRM
    Left = 84
    Top = 301
  end
  object datDelPalletTotalRM: TDataSource
    DataSet = qryDelPalletTotalRM
    Left = 140
    Top = 622
  end
  object datWIPRcptTotalRM: TDataSource
    DataSet = qryWIPRcptTotalRM
    Left = 372
    Top = 614
  end
  object qryTxnDetByTxnCodeRM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select txncode,sum(qty)'
      'from txndet'
      'where extprodref=:extprodref'
      'group by txncode')
    Left = 204
    Top = 301
    ParamData = <
      item
        DataType = ftString
        Name = 'extprodref'
        ParamType = ptUnknown
      end>
    object qryTxnDetByTxnCodeRMTXNCODE: TStringField
      FieldName = 'TXNCODE'
      FixedChar = True
      Size = 6
    end
    object qryTxnDetByTxnCodeRMSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '0.00'
    end
  end
  object datTxnDetByTxnCodeRM: TDataSource
    DataSet = qryTxnDetByTxnCodeRM
    Left = 228
    Top = 301
  end
  object qryTxnDetRM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select *'
      'from txndet'
      'where extprodref=:extprodref')
    Left = 604
    Top = 269
    ParamData = <
      item
        DataType = ftString
        Name = 'extprodref'
        ParamType = ptUnknown
      end>
  end
  object datTxnDetRM: TDataSource
    DataSet = qryTxnDetRM
    Left = 636
    Top = 269
  end
  object qryMakeWIPRedundantRM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'update wiprcpt'
      'set qlty='#39'9'#39
      'where dateissued is null'
      'and prodref=:prodref'
      'and qlty<>'#39'9'#39
      'and datemanu<=:datemanu')
    Left = 708
    Top = 170
    ParamData = <
      item
        DataType = ftString
        Name = 'prodref'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'datemanu'
        ParamType = ptUnknown
      end>
  end
  object qryTDMYarn: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select td.extprodref,td.asatqty openingstock,'
      '  td.inmovementqty, td.outmovementqty,'
      '  td.asatqty+td.inmovementqty+td.outmovementqty closingstock,'
      '  td.aftermovementqty,td.verylastmovementdate,'
      '  td.currentstock,'
      '  td.stdprice,'
      
        '  (td.asatqty+td.inmovementqty+td.outmovementqty)*td.stdprice st' +
        'kvalue,'
      '  td.makeredundant,td.notes,'
      '  yt.ynstru,yt.yncol,yt.yntwist'
      'from txndetmovementyarn td, yarntype yt'
      'where td.inmovementqty = 0 and td.outmovementqty=0'
      
        'and ((td.asatqty<>0) or ((td.asatqty+td.inmovementqty+td.outmove' +
        'mentqty)<>0))'
      'and td.extprodref=yt.yntype'
      'order by td.extprodref')
    Left = 460
    Top = 129
    object qryTDMYarnEXTPRODREF: TStringField
      FieldName = 'EXTPRODREF'
      FixedChar = True
      Size = 11
    end
    object qryTDMYarnOPENINGSTOCK: TFloatField
      FieldName = 'OPENINGSTOCK'
      DisplayFormat = '0.00'
    end
    object qryTDMYarnINMOVEMENTQTY: TFloatField
      FieldName = 'INMOVEMENTQTY'
      DisplayFormat = '0.00'
    end
    object qryTDMYarnOUTMOVEMENTQTY: TFloatField
      FieldName = 'OUTMOVEMENTQTY'
      DisplayFormat = '0.00'
    end
    object qryTDMYarnCLOSINGSTOCK: TFloatField
      FieldName = 'CLOSINGSTOCK'
      DisplayFormat = '0.00'
    end
    object qryTDMYarnAFTERMOVEMENTQTY: TFloatField
      FieldName = 'AFTERMOVEMENTQTY'
      DisplayFormat = '0.00'
    end
    object qryTDMYarnVERYLASTMOVEMENTDATE: TDateTimeField
      DisplayWidth = 10
      FieldName = 'VERYLASTMOVEMENTDATE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTDMYarnCURRENTSTOCK: TFloatField
      FieldName = 'CURRENTSTOCK'
      DisplayFormat = '0.00'
    end
    object qryTDMYarnSTDPRICE: TFloatField
      FieldName = 'STDPRICE'
      DisplayFormat = '0.00'
    end
    object qryTDMYarnSTKVALUE: TFloatField
      FieldName = 'STKVALUE'
      DisplayFormat = '0.00'
    end
    object qryTDMYarnMAKEREDUNDANT: TStringField
      FieldName = 'MAKEREDUNDANT'
      FixedChar = True
      Size = 1
    end
    object qryTDMYarnNOTES: TStringField
      FieldName = 'NOTES'
      Size = 200
    end
    object qryTDMYarnYNSTRU: TStringField
      FieldName = 'YNSTRU'
      FixedChar = True
      Size = 4
    end
    object qryTDMYarnYNCOL: TStringField
      FieldName = 'YNCOL'
      FixedChar = True
      Size = 3
    end
    object qryTDMYarnYNTWIST: TStringField
      FieldName = 'YNTWIST'
      FixedChar = True
      Size = 2
    end
  end
  object datTDMYarn: TDataSource
    DataSet = qryTDMYarn
    OnDataChange = datTDMYarnDataChange
    Left = 492
    Top = 129
  end
  object qryUpdateTDMYarn: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'update  txndetmovementyarn'
      'set makeredundant=:makeredundant,'
      '  notes=:notes'
      'where extprodref=:extprodref')
    Left = 676
    Top = 198
    ParamData = <
      item
        DataType = ftString
        Name = 'makeredundant'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'extprodref'
        ParamType = ptUnknown
      end>
  end
  object qryMakeYarnRedundantVT1: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'update YARNRCPT'
      'set ynqlty=:toynqlty'
      'WHERE YNSTRU=:ynstru'
      'AND YNTWIST=:yntwist'
      'AND YNCOL=:yncol'
      'AND DESPNO=0'
      'and ynqlty=:fromynqlty'
      'and datemanu<=:datemanu')
    Left = 708
    Top = 202
    ParamData = <
      item
        DataType = ftString
        Name = 'toynqlty'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ynstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'yntwist'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'yncol'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'fromynqlty'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'datemanu'
        ParamType = ptUnknown
      end>
  end
  object qryTxnDetByQltyYarn: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select qlty,sum(qty)'
      'from txndet'
      'where extprodref=:extprodref'
      'group by qlty')
    Left = 52
    Top = 333
    ParamData = <
      item
        DataType = ftString
        Name = 'extprodref'
        ParamType = ptUnknown
      end>
    object qryTxnDetByQltyYarnQLTY: TStringField
      FieldName = 'QLTY'
      FixedChar = True
      Size = 1
    end
    object qryTxnDetByQltyYarnSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '0.00'
    end
  end
  object datTxnDetByQltyYarn: TDataSource
    DataSet = qryTxnDetByQltyYarn
    Left = 84
    Top = 333
  end
  object qryTxnDetByTxnCodeYarn: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select txncode,sum(qty)'
      'from txndet'
      'where extprodref=:extprodref'
      'group by txncode')
    Left = 204
    Top = 333
    ParamData = <
      item
        DataType = ftString
        Name = 'extprodref'
        ParamType = ptUnknown
      end>
    object qryTxnDetByTxnCodeYarnTXNCODE: TStringField
      FieldName = 'TXNCODE'
      FixedChar = True
      Size = 6
    end
    object qryTxnDetByTxnCodeYarnSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '0.00'
    end
  end
  object datTxnDetByTxnCodeYarn: TDataSource
    DataSet = qryTxnDetByTxnCodeYarn
    Left = 228
    Top = 333
  end
  object qryTxnDetYarn: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select *'
      'from txndet'
      'where extprodref=:extprodref')
    Left = 604
    Top = 301
    ParamData = <
      item
        DataType = ftString
        Name = 'extprodref'
        ParamType = ptUnknown
      end>
  end
  object datTxnDetYarn: TDataSource
    DataSet = qryTxnDetYarn
    Left = 636
    Top = 301
  end
  object qryVT1Yarn: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'SELECT ynqlty,sum(ynnet) as ynnet'
      'FROM YARNRCPT'
      'WHERE YNSTRU=:ynstru'
      'AND YNTWIST=:yntwist'
      'AND YNCOL=:yncol'
      'AND DESPNO=0'
      'and ynqlty in ('#39#39','#39' '#39','#39'T'#39','#39'S'#39','#39'R'#39')'
      'group by ynqlty')
    Left = 508
    Top = 420
    ParamData = <
      item
        DataType = ftString
        Name = 'ynstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'yntwist'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'yncol'
        ParamType = ptUnknown
      end>
    object qryVT1YarnYNQLTY: TStringField
      FieldName = 'YNQLTY'
      FixedChar = True
      Size = 1
    end
    object qryVT1YarnYNNET: TFloatField
      FieldName = 'YNNET'
    end
  end
  object datVT1Yarn: TDataSource
    DataSet = qryVT1Yarn
    Left = 540
    Top = 420
  end
  object qryVT2Yarn: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'SELECT ynqlty,sum(ynnet) as ynnet'
      'FROM VBYARNRCPT'
      'WHERE YNSTRU=:ynstru'
      'AND YNTWIST=:yntwist'
      'AND YNCOL=:yncol'
      'AND BATREF=0'
      'and ynqlty in ('#39#39','#39' '#39','#39'T'#39','#39'S'#39','#39'R'#39')'
      'group by ynqlty')
    Left = 508
    Top = 452
    ParamData = <
      item
        DataType = ftString
        Name = 'ynstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'yntwist'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'yncol'
        ParamType = ptUnknown
      end>
    object qryVT2YarnYNQLTY: TStringField
      FieldName = 'YNQLTY'
      FixedChar = True
      Size = 1
    end
    object qryVT2YarnYNNET: TFloatField
      FieldName = 'YNNET'
    end
  end
  object datVT2Yarn: TDataSource
    DataSet = qryVT2Yarn
    Left = 540
    Top = 452
  end
  object qryMakeYarnRedundantVT2: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'update VBYARNRCPT'
      'set ynqlty=:toynqlty'
      'WHERE YNSTRU=:ynstru'
      'AND YNTWIST=:yntwist'
      'AND YNCOL=:yncol'
      'AND BATREF=0'
      'and ynqlty=:fromynqlty'
      'and datercvd<=:datercvd')
    Left = 740
    Top = 202
    ParamData = <
      item
        DataType = ftString
        Name = 'toynqlty'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ynstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'yntwist'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'yncol'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'fromynqlty'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'datercvd'
        ParamType = ptUnknown
      end>
  end
  object qryVBM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select vm.vbstru,vm.vbcol,vm.vbfin,vm.vbwidth,'
      '  vm.openingqty,vm.inmovementqty,vm.outmovementqty,'
      '  vm.openingqty+vm.inmovementqty-vm.outmovementqty closingqty,'
      '  vm.aftermovementinqty manuafterclosing,'
      '  vm.aftermovementoutqty despafterclosing,'
      '  vm.lastmovementdatemanu,'
      '  vm.lastmovementdatedesp,'
      '  vs.stkprice,'
      
        '  (vm.openingqty+vm.inmovementqty-vm.outmovementqty)*vs.stkprice' +
        ' as stkvalue,'
      '  vm.makeredundant,vm.notes'
      'from vbstockmovement vm, vbpricesstd vs'
      'where vm.vbstru=vs.vbstru'
      'and vm.vbfin=vs.vbfin'
      'and vm.vbwidth=vs.vbwidth'
      'and vs.qlty='#39#39
      'and :pricedate between vs.fromdate and vs.todate'
      'and vm.inmovementqty=0'
      'and vm.outmovementqty=0'
      'and vm.openingqty+vm.inmovementqty-vm.outmovementqty<>0'
      'order by vm.vbstru,vm.vbcol,vm.vbfin,vm.vbwidth')
    Left = 460
    Top = 161
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pricedate'
        ParamType = ptUnknown
      end>
    object qryVBMVBSTRU: TStringField
      FieldName = 'VBSTRU'
      FixedChar = True
      Size = 3
    end
    object qryVBMVBCOL: TStringField
      FieldName = 'VBCOL'
      FixedChar = True
      Size = 3
    end
    object qryVBMVBFIN: TStringField
      FieldName = 'VBFIN'
      FixedChar = True
      Size = 2
    end
    object qryVBMVBWIDTH: TIntegerField
      FieldName = 'VBWIDTH'
    end
    object qryVBMOPENINGQTY: TFloatField
      FieldName = 'OPENINGQTY'
      DisplayFormat = '0.0'
    end
    object qryVBMINMOVEMENTQTY: TFloatField
      FieldName = 'INMOVEMENTQTY'
      DisplayFormat = '0.0'
    end
    object qryVBMOUTMOVEMENTQTY: TFloatField
      FieldName = 'OUTMOVEMENTQTY'
      DisplayFormat = '0.0'
    end
    object qryVBMCLOSINGQTY: TFloatField
      FieldName = 'CLOSINGQTY'
      DisplayFormat = '0.0'
    end
    object qryVBMMANUAFTERCLOSING: TFloatField
      FieldName = 'MANUAFTERCLOSING'
      DisplayFormat = '0.0'
    end
    object qryVBMDESPAFTERCLOSING: TFloatField
      FieldName = 'DESPAFTERCLOSING'
      DisplayFormat = '0.0'
    end
    object qryVBMLASTMOVEMENTDATEMANU: TDateTimeField
      DisplayLabel = 'Last Manu'
      DisplayWidth = 10
      FieldName = 'LASTMOVEMENTDATEMANU'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryVBMLASTMOVEMENTDATEDESP: TDateTimeField
      DisplayLabel = 'Last Desp'
      DisplayWidth = 10
      FieldName = 'LASTMOVEMENTDATEDESP'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryVBMSTKPRICE: TFloatField
      FieldName = 'STKPRICE'
      DisplayFormat = '0.00'
    end
    object qryVBMSTKVALUE: TFloatField
      FieldName = 'STKVALUE'
      DisplayFormat = '0.00'
    end
    object qryVBMMAKEREDUNDANT: TStringField
      FieldName = 'MAKEREDUNDANT'
      FixedChar = True
      Size = 1
    end
    object qryVBMNOTES: TStringField
      FieldName = 'NOTES'
      Size = 200
    end
  end
  object datVBM: TDataSource
    DataSet = qryVBM
    OnDataChange = datVBMDataChange
    Left = 492
    Top = 161
  end
  object qryUpdateVBM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'update vbstockmovement'
      'set makeredundant=:makeredundant,'
      '  notes=:notes'
      'where vbstru=:vbstru'
      'and vbcol=:vbcol'
      'and vbfin=:vbfin'
      'and vbwidth=:vbwidth')
    Left = 780
    Top = 166
    ParamData = <
      item
        DataType = ftString
        Name = 'makeredundant'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'notes'
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
        Name = 'vbwidth'
        ParamType = ptUnknown
      end>
  end
  object qryMakeVBRedundant: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'update vbrcpt'
      'set valuerating=0'
      'where vbstru=:vbstru'
      'and vbcol=:vbcol'
      'and vbfin=:vbfin'
      'and metricwidth=:metricwidth'
      'and despno=0'
      'and datemanu<:datemanu'
      'and valuerating=1')
    Left = 780
    Top = 198
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
        Name = 'datemanu'
        ParamType = ptUnknown
      end>
  end
  object qryVBRcpt: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select vbstru,vbcol,vbfin,metricwidth,qlty,'
      '  boxno,netlength,despno,datemanu,valuerating'
      'from vbrcpt'
      'where vbstru=:vbstru'
      'and vbcol=:vbcol'
      'and vbfin=:vbfin'
      'and metricwidth=:metricwidth'
      'and despno=0'
      'and datemanu<:datemanu'
      'and valuerating=1')
    Left = 604
    Top = 333
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
        Name = 'datemanu'
        ParamType = ptUnknown
      end>
    object qryVBRcptVBSTRU: TStringField
      FieldName = 'VBSTRU'
      FixedChar = True
      Size = 3
    end
    object qryVBRcptVBCOL: TStringField
      FieldName = 'VBCOL'
      FixedChar = True
      Size = 3
    end
    object qryVBRcptVBFIN: TStringField
      FieldName = 'VBFIN'
      FixedChar = True
      Size = 2
    end
    object qryVBRcptMETRICWIDTH: TSmallintField
      FieldName = 'METRICWIDTH'
    end
    object qryVBRcptQLTY: TStringField
      FieldName = 'QLTY'
      FixedChar = True
      Size = 1
    end
    object qryVBRcptBOXNO: TIntegerField
      FieldName = 'BOXNO'
    end
    object qryVBRcptNETLENGTH: TFloatField
      FieldName = 'NETLENGTH'
      DisplayFormat = '0.0'
    end
    object qryVBRcptDESPNO: TIntegerField
      FieldName = 'DESPNO'
    end
    object qryVBRcptDATEMANU: TDateTimeField
      FieldName = 'DATEMANU'
    end
    object qryVBRcptVALUERATING: TIntegerField
      FieldName = 'VALUERATING'
    end
  end
  object datVBRcpt: TDataSource
    DataSet = qryVBRcpt
    Left = 636
    Top = 333
  end
  object qryVBTotals: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      
        'select vbstru,vbcol,vbfin,metricwidth,qlty,sum(netlength) as net' +
        'length'
      'from vbrcpt'
      'where vbstru=:vbstru'
      'and vbcol=:vbcol'
      'and vbfin=:vbfin'
      'and metricwidth=:metricwidth'
      'and despno=0'
      'and datemanu<:datemanu'
      'and valuerating=1'
      'group by vbstru,vbcol,vbfin,metricwidth,qlty')
    Left = 124
    Top = 404
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
        Name = 'datemanu'
        ParamType = ptUnknown
      end>
  end
  object datVBTotals: TDataSource
    DataSet = qryVBTotals
    Left = 156
    Top = 404
  end
  object sprFindRedundantRM: TStoredProc
    DatabaseName = 'Stock'
    StoredProcName = 'SPFINDREDUNDANTRM'
    Left = 172
    Top = 265
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PPRICEDATE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PAFTERMOVEMENTFROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PMOVEMENTTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PMOVEMENTFROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PYEARENDDATE'
        ParamType = ptInput
      end>
  end
  object sprFindRedundantYarn: TStoredProc
    DatabaseName = 'Stock'
    StoredProcName = 'SPFINDREDUNDANTYARN'
    Left = 204
    Top = 265
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PPRICEDATE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PAFTERMOVEMENTFROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PMOVEMENTTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PMOVEMENTFROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PYEARENDDATE'
        ParamType = ptInput
      end>
  end
  object sprFindRedundantVB: TStoredProc
    DatabaseName = 'Stock'
    StoredProcName = 'SPFINDREDUNDANTVB'
    Left = 236
    Top = 265
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PPRICEDATE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PAFTERMOVEMENTFROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PMOVEMENTTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PMOVEMENTFROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PYEARENDDATE'
        ParamType = ptInput
      end>
  end
  object tabRedundantStockParams: TTable
    DatabaseName = 'Stock'
    TableName = 'REDUNDANTSTOCKPARAMS'
    Left = 132
    Top = 233
    object tabRedundantStockParamsYEARENDDATE: TDateTimeField
      FieldName = 'YEARENDDATE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tabRedundantStockParamsMOVEMENTFROMDATE: TDateTimeField
      FieldName = 'MOVEMENTFROMDATE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tabRedundantStockParamsMOVEMENTTODATE: TDateTimeField
      FieldName = 'MOVEMENTTODATE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tabRedundantStockParamsAFTERMOVEMENTDATE: TDateTimeField
      FieldName = 'AFTERMOVEMENTDATE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tabRedundantStockParamsPRICEDATE: TDateTimeField
      FieldName = 'PRICEDATE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tabRedundantStockParamsRMFOUND: TStringField
      FieldName = 'RMFOUND'
      FixedChar = True
      Size = 1
    end
    object tabRedundantStockParamsYARNFOUND: TStringField
      FieldName = 'YARNFOUND'
      FixedChar = True
      Size = 1
    end
    object tabRedundantStockParamsVBFOUND: TStringField
      FieldName = 'VBFOUND'
      FixedChar = True
      Size = 1
    end
    object tabRedundantStockParamsRMREDUNDANT: TStringField
      FieldName = 'RMREDUNDANT'
      FixedChar = True
      Size = 1
    end
    object tabRedundantStockParamsYARNREDUNDANT: TStringField
      FieldName = 'YARNREDUNDANT'
      FixedChar = True
      Size = 1
    end
    object tabRedundantStockParamsVBREDUNDANT: TStringField
      FieldName = 'VBREDUNDANT'
      FixedChar = True
      Size = 1
    end
    object tabRedundantStockParamsHISTORYCOPIED: TStringField
      FieldName = 'HISTORYCOPIED'
      FixedChar = True
      Size = 1
    end
  end
  object datRedundantStockParams: TDataSource
    DataSet = tabRedundantStockParams
    OnStateChange = datRedundantStockParamsStateChange
    Left = 164
    Top = 233
  end
  object qryUpdateRedFound: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'update redundantstockparams'
      'set rmfound='#39'Y'#39','
      '  yarnfound='#39'Y'#39','
      '  vbfound='#39'Y'#39)
    Left = 436
    Top = 265
  end
  object qryExportRM: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select td.extprodref,td.asatqty as openingstock,'
      '  td.inmovementqty, td.outmovementqty,'
      '  td.asatqty+td.inmovementqty+td.outmovementqty as closingstock,'
      '  td.aftermovementqty,td.verylastmovementdate,'
      '  td.currentstock,'
      '  td.stdprice,'
      
        '  (td.asatqty+td.inmovementqty+td.outmovementqty)*stdprice as st' +
        'kvalue,'
      '  td.makeredundant,td.notes,'
      '  pr.prodref'
      'from txndetmovement td, product pr'
      'where td.inmovementqty = 0 and td.outmovementqty=0'
      
        'and ((td.asatqty<>0) or ((td.asatqty+td.inmovementqty+td.outmove' +
        'mentqty)<>0))'
      'and td.extprodref=pr.extprodref'
      'order by td.extprodref')
    Left = 332
    Top = 417
  end
  object qryExportYarn: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select td.extprodref,td.asatqty as openingstock,'
      '  td.inmovementqty, td.outmovementqty,'
      '  td.asatqty+td.inmovementqty+td.outmovementqty as closingstock,'
      '  td.aftermovementqty,td.verylastmovementdate,'
      '  td.currentstock,'
      '  td.stdprice,'
      
        '  (td.asatqty+td.inmovementqty+td.outmovementqty)*td.stdprice as' +
        ' stkvalue,'
      '  td.makeredundant,td.notes,'
      '  yt.ynstru,yt.yncol,yt.yntwist'
      'from txndetmovementyarn td, yarntype yt'
      'where td.inmovementqty = 0 and td.outmovementqty=0'
      
        'and ((td.asatqty<>0) or ((td.asatqty+td.inmovementqty+td.outmove' +
        'mentqty)<>0))'
      'and td.extprodref=yt.yntype'
      'order by td.extprodref')
    Left = 364
    Top = 417
  end
  object qryExportVB: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select vm.vbstru,vm.vbcol,vm.vbfin,vm.vbwidth,'
      '  vm.openingqty,vm.inmovementqty,vm.outmovementqty,'
      
        '  vm.openingqty+vm.inmovementqty-vm.outmovementqty as closingqty' +
        ','
      '  vm.aftermovementinqty manuafterclosingin,'
      '  vm.aftermovementoutqty manuafterclosingout,'
      '  vm.lastmovementdatemanu as lastmanudate,'
      '  vm.lastmovementdatedesp as lastdespdate,'
      '  vs.stkprice,'
      
        '  (vm.openingqty+vm.inmovementqty-vm.outmovementqty)*vs.stkprice' +
        ' as stkvalue,'
      '  vm.makeredundant,vm.notes'
      'from vbstockmovement vm, vbpricesstd vs'
      'where vm.vbstru=vs.vbstru'
      'and vm.vbfin=vs.vbfin'
      'and vm.vbwidth=vs.vbwidth'
      'and vs.qlty='#39#39
      'and :pricedate between vs.fromdate and vs.todate'
      'and vm.inmovementqty=0'
      'and vm.outmovementqty=0'
      'and vm.openingqty+vm.inmovementqty-vm.outmovementqty<>0'
      'order by vm.vbstru,vm.vbcol,vm.vbfin,vm.vbwidth')
    Left = 396
    Top = 417
    ParamData = <
      item
        DataType = ftString
        Name = 'pricedate'
        ParamType = ptUnknown
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
    Left = 60
    Top = 481
  end
  object XLSDbRead: TXLSDbRead2
    Column = 0
    IncludeFieldnames = True
    Row = 0
    Sheet = 0
    XLS = XLS
    Left = 92
    Top = 481
  end
end
