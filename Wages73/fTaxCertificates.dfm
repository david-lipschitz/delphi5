object frmTaxCertificates: TfrmTaxCertificates
  Left = 455
  Top = 229
  Width = 460
  Height = 272
  Caption = 'Tax Certificates'
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
  object Label1: TLabel
    Left = 47
    Top = 26
    Width = 43
    Height = 13
    Caption = 'Tax Year'
  end
  object Label2: TLabel
    Left = 16
    Top = 58
    Width = 74
    Height = 13
    Caption = 'Export File Path'
  end
  object Label3: TLabel
    Left = 16
    Top = 90
    Width = 74
    Height = 13
    Caption = 'Tax Year Dates'
  end
  object cbxTaxYear: TComboBox
    Left = 104
    Top = 24
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'cbxTaxYear'
  end
  object edtExportFilePath: TEdit
    Left = 104
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtExportFilePath'
  end
  object btnCreateCertificates: TButton
    Left = 88
    Top = 128
    Width = 113
    Height = 25
    Caption = 'Create Certificates'
    TabOrder = 2
    OnClick = btnCreateCertificatesClick
  end
  object btnClose: TBitBtn
    Left = 104
    Top = 168
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = btnCloseClick
    Kind = bkClose
  end
  object odpTaxYearDates: TODPopupCalendar
    Left = 104
    Top = 88
    Width = 225
    Height = 21
    DateFormat = 'dd/mm/yyyy'
    Seperator = ' - '
    PopupCaption = 'Select Date Range'
    DisplayYear = 2008
    DisplayMonth = 7
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
    TabOrder = 4
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 226
    Width = 452
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object qryGetTaxYears: TQuery
    DatabaseName = 'Wages7'
    SQL.Strings = (
      'select taxyr'
      'from taxconstants'
      'order by taxyr')
    Left = 344
    Top = 16
    object qryGetTaxYearsTAXYR: TIntegerField
      FieldName = 'TAXYR'
    end
  end
  object qryEmployeePay: TQuery
    DatabaseName = 'Wages7'
    SQL.Strings = (
      'select clkno,sum(provfunddeduct) as provfunddeduct,'
      '  sum(taxdeduct) as taxdeduct,'
      '  sum(taxearnings) as taxearnings,'
      '  sum(sickfunddeduct) as sickfunddeduct'
      'from paysliphist'
      'where thisweek>=:fromweek and thisweek<=:toweek'
      'group by clkno'
      'order by clkno')
    Left = 344
    Top = 48
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fromweek'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'toweek'
        ParamType = ptUnknown
      end>
    object qryEmployeePayCLKNO: TIntegerField
      FieldName = 'CLKNO'
    end
    object qryEmployeePayTAXDEDUCT: TFloatField
      FieldName = 'TAXDEDUCT'
    end
    object qryEmployeePayTAXEARNINGS: TFloatField
      FieldName = 'TAXEARNINGS'
    end
    object qryEmployeePayPROVFUNDDEDUCT: TFloatField
      FieldName = 'PROVFUNDDEDUCT'
    end
    object qryEmployeePaySICKFUNDDEDUCT: TFloatField
      FieldName = 'SICKFUNDDEDUCT'
    end
  end
  object qryGetEmployeeData: TQuery
    DatabaseName = 'Wages7'
    SQL.Strings = (
      'select *'
      'from employee'
      'where clkno=:clkno')
    Left = 344
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'clkno'
        ParamType = ptUnknown
      end>
    object qryGetEmployeeDataCLKNO: TIntegerField
      FieldName = 'CLKNO'
      Origin = 'WAGES7.EMPLOYEE.CLKNO'
    end
    object qryGetEmployeeDataSURNAME: TStringField
      FieldName = 'SURNAME'
      Origin = 'WAGES7.EMPLOYEE.SURNAME'
      FixedChar = True
      Size = 30
    end
    object qryGetEmployeeDataFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Origin = 'WAGES7.EMPLOYEE.FIRSTNAME'
      FixedChar = True
    end
    object qryGetEmployeeDataSTREET: TStringField
      FieldName = 'STREET'
      Origin = 'WAGES7.EMPLOYEE.STREET'
      FixedChar = True
      Size = 30
    end
    object qryGetEmployeeDataSUBURB: TStringField
      FieldName = 'SUBURB'
      Origin = 'WAGES7.EMPLOYEE.SUBURB'
      FixedChar = True
      Size = 30
    end
    object qryGetEmployeeDataPOSTCODE: TStringField
      FieldName = 'POSTCODE'
      Origin = 'WAGES7.EMPLOYEE.POSTCODE'
      FixedChar = True
      Size = 4
    end
    object qryGetEmployeeDataRENTACNO: TStringField
      FieldName = 'RENTACNO'
      Origin = 'WAGES7.EMPLOYEE.RENTACNO'
      FixedChar = True
      Size = 18
    end
    object qryGetEmployeeDataRENTMONTH: TFloatField
      FieldName = 'RENTMONTH'
      Origin = 'WAGES7.EMPLOYEE.RENTMONTH'
    end
    object qryGetEmployeeDataSAVEACNO: TStringField
      FieldName = 'SAVEACNO'
      Origin = 'WAGES7.EMPLOYEE.SAVEACNO'
      FixedChar = True
      Size = 14
    end
    object qryGetEmployeeDataSTARTDATE: TDateTimeField
      FieldName = 'STARTDATE'
      Origin = 'WAGES7.EMPLOYEE.STARTDATE'
    end
    object qryGetEmployeeDataBIRTHDATE: TDateTimeField
      FieldName = 'BIRTHDATE'
      Origin = 'WAGES7.EMPLOYEE.BIRTHDATE'
    end
    object qryGetEmployeeDataPAYRATESETDATE: TDateTimeField
      FieldName = 'PAYRATESETDATE'
      Origin = 'WAGES7.EMPLOYEE.PAYRATESETDATE'
    end
    object qryGetEmployeeDataHUSBANDNAME: TStringField
      FieldName = 'HUSBANDNAME'
      Origin = 'WAGES7.EMPLOYEE.HUSBANDNAME'
      FixedChar = True
      Size = 15
    end
    object qryGetEmployeeDataMSTATUS: TStringField
      FieldName = 'MSTATUS'
      Origin = 'WAGES7.EMPLOYEE.MSTATUS'
      FixedChar = True
      Size = 1
    end
    object qryGetEmployeeDataNOOFCHILD: TIntegerField
      FieldName = 'NOOFCHILD'
      Origin = 'WAGES7.EMPLOYEE.NOOFCHILD'
    end
    object qryGetEmployeeDataOCCUPATION: TStringField
      FieldName = 'OCCUPATION'
      Origin = 'WAGES7.EMPLOYEE.OCCUPATION'
      FixedChar = True
    end
    object qryGetEmployeeDataIDNO: TStringField
      FieldName = 'IDNO'
      Origin = 'WAGES7.EMPLOYEE.IDNO'
      FixedChar = True
      Size = 13
    end
    object qryGetEmployeeDataUIF: TStringField
      FieldName = 'UIF'
      Origin = 'WAGES7.EMPLOYEE.UIF'
      FixedChar = True
      Size = 1
    end
    object qryGetEmployeeDataPROVFUNDFLAG: TStringField
      FieldName = 'PROVFUNDFLAG'
      Origin = 'WAGES7.EMPLOYEE.PROVFUNDFLAG'
      FixedChar = True
      Size = 1
    end
    object qryGetEmployeeDataOTHER1FLAG: TStringField
      FieldName = 'OTHER1FLAG'
      Origin = 'WAGES7.EMPLOYEE.OTHER1FLAG'
      FixedChar = True
      Size = 1
    end
    object qryGetEmployeeDataSICKFUNDFLAG: TStringField
      FieldName = 'SICKFUNDFLAG'
      Origin = 'WAGES7.EMPLOYEE.SICKFUNDFLAG'
      FixedChar = True
      Size = 1
    end
    object qryGetEmployeeDataHRPAYRATE: TFloatField
      FieldName = 'HRPAYRATE'
      Origin = 'WAGES7.EMPLOYEE.HRPAYRATE'
    end
    object qryGetEmployeeDataATTBONUSWK: TFloatField
      FieldName = 'ATTBONUSWK'
      Origin = 'WAGES7.EMPLOYEE.ATTBONUSWK'
    end
    object qryGetEmployeeDataSAVEWK: TFloatField
      FieldName = 'SAVEWK'
      Origin = 'WAGES7.EMPLOYEE.SAVEWK'
    end
    object qryGetEmployeeDataREPAYLNWK: TFloatField
      FieldName = 'REPAYLNWK'
      Origin = 'WAGES7.EMPLOYEE.REPAYLNWK'
    end
    object qryGetEmployeeDataINSURANCE: TFloatField
      FieldName = 'INSURANCE'
      Origin = 'WAGES7.EMPLOYEE.INSURANCE'
    end
    object qryGetEmployeeDataSAVEAC: TFloatField
      FieldName = 'SAVEAC'
      Origin = 'WAGES7.EMPLOYEE.SAVEAC'
    end
    object qryGetEmployeeDataTAXEARN: TFloatField
      FieldName = 'TAXEARN'
      Origin = 'WAGES7.EMPLOYEE.TAXEARN'
    end
    object qryGetEmployeeDataPENSION: TFloatField
      FieldName = 'PENSION'
      Origin = 'WAGES7.EMPLOYEE.PENSION'
    end
    object qryGetEmployeeDataSICKFD: TFloatField
      FieldName = 'SICKFD'
      Origin = 'WAGES7.EMPLOYEE.SICKFD'
    end
    object qryGetEmployeeDataPROVFD: TFloatField
      FieldName = 'PROVFD'
      Origin = 'WAGES7.EMPLOYEE.PROVFD'
    end
    object qryGetEmployeeDataUIFPAY: TFloatField
      FieldName = 'UIFPAY'
      Origin = 'WAGES7.EMPLOYEE.UIFPAY'
    end
    object qryGetEmployeeDataPAYE: TFloatField
      FieldName = 'PAYE'
      Origin = 'WAGES7.EMPLOYEE.PAYE'
    end
    object qryGetEmployeeDataGROSSPAY: TFloatField
      FieldName = 'GROSSPAY'
      Origin = 'WAGES7.EMPLOYEE.GROSSPAY'
    end
    object qryGetEmployeeDataWKSPAY: TFloatField
      FieldName = 'WKSPAY'
      Origin = 'WAGES7.EMPLOYEE.WKSPAY'
    end
    object qryGetEmployeeDataRENTAC: TFloatField
      FieldName = 'RENTAC'
      Origin = 'WAGES7.EMPLOYEE.RENTAC'
    end
    object qryGetEmployeeDataLOANAC: TFloatField
      FieldName = 'LOANAC'
      Origin = 'WAGES7.EMPLOYEE.LOANAC'
    end
    object qryGetEmployeeDataFULLWK: TIntegerField
      FieldName = 'FULLWK'
      Origin = 'WAGES7.EMPLOYEE.FULLWK'
    end
    object qryGetEmployeeDataPARTWK: TIntegerField
      FieldName = 'PARTWK'
      Origin = 'WAGES7.EMPLOYEE.PARTWK'
    end
    object qryGetEmployeeDataLEAVEDAY: TIntegerField
      FieldName = 'LEAVEDAY'
      Origin = 'WAGES7.EMPLOYEE.LEAVEDAY'
    end
    object qryGetEmployeeDataSICKDAY: TIntegerField
      FieldName = 'SICKDAY'
      Origin = 'WAGES7.EMPLOYEE.SICKDAY'
    end
    object qryGetEmployeeDataTAXWEEK: TIntegerField
      FieldName = 'TAXWEEK'
      Origin = 'WAGES7.EMPLOYEE.TAXWEEK'
    end
    object qryGetEmployeeDataDISCHARGEDATE: TDateTimeField
      FieldName = 'DISCHARGEDATE'
      Origin = 'WAGES7.EMPLOYEE.DISCHARGEDATE'
    end
    object qryGetEmployeeDataBANKREF: TStringField
      FieldName = 'BANKREF'
      Origin = 'WAGES7.EMPLOYEE.BANKREF'
      FixedChar = True
      Size = 6
    end
    object qryGetEmployeeDataBANKSORTCODE: TStringField
      FieldName = 'BANKSORTCODE'
      Origin = 'WAGES7.EMPLOYEE.BANKSORTCODE'
      FixedChar = True
      Size = 6
    end
    object qryGetEmployeeDataBANKACCREF: TStringField
      FieldName = 'BANKACCREF'
      Origin = 'WAGES7.EMPLOYEE.BANKACCREF'
      FixedChar = True
      Size = 16
    end
    object qryGetEmployeeDataBANKACCTYPE: TStringField
      FieldName = 'BANKACCTYPE'
      Origin = 'WAGES7.EMPLOYEE.BANKACCTYPE'
      FixedChar = True
      Size = 1
    end
    object qryGetEmployeeDataDEPREF: TStringField
      FieldName = 'DEPREF'
      Origin = 'WAGES7.EMPLOYEE.DEPREF'
      FixedChar = True
      Size = 2
    end
    object qryGetEmployeeDataABLOANACCNO: TStringField
      FieldName = 'ABLOANACCNO'
      Origin = 'WAGES7.EMPLOYEE.ABLOANACCNO'
      FixedChar = True
    end
    object qryGetEmployeeDataABLOANSTARTVALUE: TFloatField
      FieldName = 'ABLOANSTARTVALUE'
      Origin = 'WAGES7.EMPLOYEE.ABLOANSTARTVALUE'
    end
    object qryGetEmployeeDataABLOANAC: TFloatField
      FieldName = 'ABLOANAC'
      Origin = 'WAGES7.EMPLOYEE.ABLOANAC'
    end
    object qryGetEmployeeDataABREPAYLNMONTH: TFloatField
      FieldName = 'ABREPAYLNMONTH'
      Origin = 'WAGES7.EMPLOYEE.ABREPAYLNMONTH'
    end
    object qryGetEmployeeDataABREPAYTERM: TIntegerField
      FieldName = 'ABREPAYTERM'
      Origin = 'WAGES7.EMPLOYEE.ABREPAYTERM'
    end
    object qryGetEmployeeDataABREPAYFROMYEAR: TIntegerField
      FieldName = 'ABREPAYFROMYEAR'
      Origin = 'WAGES7.EMPLOYEE.ABREPAYFROMYEAR'
    end
    object qryGetEmployeeDataABREPAYFROMMONTH: TIntegerField
      FieldName = 'ABREPAYFROMMONTH'
      Origin = 'WAGES7.EMPLOYEE.ABREPAYFROMMONTH'
    end
    object qryGetEmployeeDataABLOANACTIVE: TStringField
      FieldName = 'ABLOANACTIVE'
      Origin = 'WAGES7.EMPLOYEE.ABLOANACTIVE'
      FixedChar = True
      Size = 1
    end
    object qryGetEmployeeDataPFLOANACCNO: TStringField
      FieldName = 'PFLOANACCNO'
      Origin = 'WAGES7.EMPLOYEE.PFLOANACCNO'
      FixedChar = True
    end
    object qryGetEmployeeDataPFLOANSTARTVALUE: TFloatField
      FieldName = 'PFLOANSTARTVALUE'
      Origin = 'WAGES7.EMPLOYEE.PFLOANSTARTVALUE'
    end
    object qryGetEmployeeDataPFLOANAC: TFloatField
      FieldName = 'PFLOANAC'
      Origin = 'WAGES7.EMPLOYEE.PFLOANAC'
    end
    object qryGetEmployeeDataPFREPAYLNMONTH: TFloatField
      FieldName = 'PFREPAYLNMONTH'
      Origin = 'WAGES7.EMPLOYEE.PFREPAYLNMONTH'
    end
    object qryGetEmployeeDataPFREPAYTERM: TIntegerField
      FieldName = 'PFREPAYTERM'
      Origin = 'WAGES7.EMPLOYEE.PFREPAYTERM'
    end
    object qryGetEmployeeDataPFREPAYFROMYEAR: TIntegerField
      FieldName = 'PFREPAYFROMYEAR'
      Origin = 'WAGES7.EMPLOYEE.PFREPAYFROMYEAR'
    end
    object qryGetEmployeeDataPFREPAYFROMMONTH: TIntegerField
      FieldName = 'PFREPAYFROMMONTH'
      Origin = 'WAGES7.EMPLOYEE.PFREPAYFROMMONTH'
    end
    object qryGetEmployeeDataPFLOANACTIVE: TStringField
      FieldName = 'PFLOANACTIVE'
      Origin = 'WAGES7.EMPLOYEE.PFLOANACTIVE'
      FixedChar = True
      Size = 1
    end
    object qryGetEmployeeDataLAWYERMONTH: TFloatField
      FieldName = 'LAWYERMONTH'
      Origin = 'WAGES7.EMPLOYEE.LAWYERMONTH'
    end
    object qryGetEmployeeDataBANKFEES: TFloatField
      FieldName = 'BANKFEES'
      Origin = 'WAGES7.EMPLOYEE.BANKFEES'
    end
    object qryGetEmployeeDataINSURANCEWM: TStringField
      FieldName = 'INSURANCEWM'
      Origin = 'WAGES7.EMPLOYEE.INSURANCEWM'
      FixedChar = True
      Size = 1
    end
    object qryGetEmployeeDataLAWYERWM: TStringField
      FieldName = 'LAWYERWM'
      Origin = 'WAGES7.EMPLOYEE.LAWYERWM'
      FixedChar = True
      Size = 1
    end
    object qryGetEmployeeDataGRADECODE: TStringField
      FieldName = 'GRADECODE'
      Origin = 'WAGES7.EMPLOYEE.GRADECODE'
      FixedChar = True
      Size = 2
    end
    object qryGetEmployeeDataGRADESETDATE: TDateTimeField
      FieldName = 'GRADESETDATE'
      Origin = 'WAGES7.EMPLOYEE.GRADESETDATE'
    end
  end
  object qryGetWeeksWorked: TQuery
    DatabaseName = 'Wages7'
    SQL.Strings = (
      'select sum(fullweek+partweek) weeksworked'
      'from paysliphist'
      'where thisweek>=:fromweek and thisweek<=:toweek'
      'and clkno=:clkno')
    Left = 344
    Top = 112
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fromweek'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'toweek'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'clkno'
        ParamType = ptUnknown
      end>
    object qryGetWeeksWorkedWEEKSWORKED: TFloatField
      FieldName = 'WEEKSWORKED'
    end
  end
  object qryGetHolidayPay: TQuery
    DatabaseName = 'Wages7'
    SQL.Strings = (
      'select provfunddeduct,taxdeduct,'
      '  holidaypay+rentallowpay as totaltaxearnings,'
      '  sickfunddeduct,'
      '  christmasbonus+servicebonus+specialbonus as bonus,'
      '  holidayweeks'
      'from holsliphist'
      'where thisweek>=:fromweek and thisweek<=:toweek'
      'and clkno=:clkno')
    Left = 376
    Top = 48
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fromweek'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'toweek'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'clkno'
        ParamType = ptUnknown
      end>
    object qryGetHolidayPayPROVFUNDDEDUCT: TFloatField
      FieldName = 'PROVFUNDDEDUCT'
    end
    object qryGetHolidayPayTAXDEDUCT: TFloatField
      FieldName = 'TAXDEDUCT'
    end
    object qryGetHolidayPayTOTALTAXEARNINGS: TFloatField
      FieldName = 'TOTALTAXEARNINGS'
    end
    object qryGetHolidayPaySICKFUNDDEDUCT: TFloatField
      FieldName = 'SICKFUNDDEDUCT'
    end
    object qryGetHolidayPayBONUS: TFloatField
      FieldName = 'BONUS'
    end
    object qryGetHolidayPayHOLIDAYWEEKS: TIntegerField
      FieldName = 'HOLIDAYWEEKS'
    end
  end
end
