’
 TFRMCOMPANY 0N  TPF0TfrmCompany
frmCompanyLeftš Top~WidthHeightśCaptionCompany / Parameter File SetupColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TPageControl
pgeCompanyLeft Top Width}Heightß
ActivePagetshSystemConstantsAlignalClientTabOrder  	TTabSheet
tshCompanyCaptionCompany TLabelLabel1LeftTopWidth,HeightCaptionCompany  TDBEdit	edtCoNameLeftHTopWidth“ Height	DataFieldCONAME
DataSource
datCompanyTabOrder   TButtonbtnFixBalancesLeftTopPWidthKHeightCaptionFix BalancesTabOrderOnClickbtnFixBalancesClick  
TStatusBar	StatusBarLeft Top°WidthuHeightPanels SimplePanel	
SimpleTextReady  TButtonbtnFixPFBalancesLeftTop Width HeightCaptionFix Prov Fund BalancesTabOrderOnClickbtnFixPFBalancesClick   	TTabSheet
tshPrinterCaptionPrinter TLabelLabel7LeftTopŻ WidthFHeightCaptionLines On Page  TLabelLabel4LeftTop#WidthHeightCaptionPrinter  TLabelLabel5Left@TopPWidthÉ Height4Caption”Note: When selecting a printer here the currently selected printer will change to the selected printer until the program exits when the printer will change back.WordWrap	  TDBEditDBEdit6LefthTopŁ WidthAHeight	DataFieldLINESONPAGE
DataSource
datCompanyTabOrder  TDBComboBox
cmbPrinterLeft@Top Widthį HeightStylecsDropDownList	DataFieldPRINTER
DataSource
datCompany
ItemHeightSorted	TabOrder OnChangecmbPrinterChange  	TGroupBox	GroupBox1LeftTopHWidthHeight]Caption Fonts TabOrder TLabelLabel2LeftTopWidth!HeightCaptionNormal  TLabelLabel3LeftTop;Width:HeightCaption
Compressed  TDBComboBoxcmbNormalFontLeftXTopWidth± HeightStylecsDropDownList	DataField
NORMALFONT
DataSource
datCompany
ItemHeightSorted	TabOrder   TDBComboBoxcmbCompressedFontLeftXTop8Width± HeightStylecsDropDownList	DataFieldCOMPRESSEDFONT
DataSource
datCompany
ItemHeightSorted	TabOrder   TButtonbtnDefaultPrinterLeft(TopWidthYHeightCaptionDefault PrinterTabOrderOnClickbtnDefaultPrinterClick  TButtonbtnTestPrintLeftøTopWidthKHeightCaptionTest PreviewTabOrderOnClickbtnTestPrintClick   	TTabSheettshUserConstantsCaptionUser ConstantsParentShowHintShowHint	 TLabelLabel14LeftToppWidthKHeightCaptionRent Allowance  TLabelLabel15LeftTop WidthHHeightCaptionOther 1 Default  TLabelLabel16LeftTop° WidthVHeightCaptionAnnual Bonus Min  TLabelLabel17LeftTopŠ Width4HeightCaption	Last Week  TLabelLabel18LeftTopš WidthEHeightCaptionSystem Start #  TLabelLabel19LeftČ TopŠ WidthSHeightCaptionActual Tax Week  TLabelLabel20LeftČ Topš WidthGHeightCaptionWeeks In Year  TLabelLabel37LefthTopŠ WidthLHeightCaptionActual Tax YearFocusControledtATaxYear  TLabelLabel6Left TopWidth HeightCaptionBatch User (Default 'None')  TLabelLabel45LefthTopš WidthŽ HeightCaption0(working - usually 49, but 50 in a 53 week year)  TLabelLabel46LefthTop Widthķ HeightCaption0(or 50 in 2005 when the factory worked 50 weeks)  TLabelLabel47Leftø Top WidthĮ HeightCaption'not used; replaced with Union Deduction  TDBEditedtRentAllowanceLeftpToplWidthAHeight	DataFieldRENTALLOWANCE
DataSource
datCompanyTabOrder   TDBEdit	edtOther1LeftpTop WidthAHeight	DataFieldOTHER1
DataSource
datCompanyTabOrder  TDBEditedtAnnualBonMinLeftpTop¬ WidthAHeight	DataFieldANNUALBONMIN
DataSource
datCompanyTabOrder  TDBEditedtLastWeekLeftpTopĢ WidthPHeightHintLast Week that Wages was runColor	clBtnFace	DataFieldLASTWEEK
DataSource
datCompanyReadOnly	TabOrder  TDBEditedtStartNumberLeftpTopģ WidthAHeightHintStart Up Procedures CodeColor	clBtnFace	DataFieldSTARTNUMBER
DataSource
datCompanyReadOnly	TabOrder  TDBEditedtATxWkLeft TopĢ WidthAHeightHintFActual tax week being run this year. = Total week ends since 1st MarchColor	clBtnFace	DataFieldATXWK
DataSource
datCompanyReadOnly	TabOrder  TDBEditedtWeeksInYearLeft Topģ WidthAHeightHintNumber of tax weeks in the year	DataFieldWEEKSINYEAR
DataSource
datCompanyTabOrder  TPanelPanel1LeftTopWidthį HeightYParentShowHintShowHint	TabOrder TLabelLabel10LeftTop Width,HeightCaptionPay Rate  TLabelLabel11LeftPTopWidth)HeightCaptionMinimum  TLabelLabel12Left TopWidth,HeightCaptionMaximum  TLabelLabel13LeftTop8Width6HeightCaption	Age Range  TDBEditedtMaxPayRateLeft TopWidthAHeight	DataField
MAXPAYRATE
DataSource
datCompanyTabOrder   TDBEditedtMinPayRateLeftPTopWidthAHeight	DataField
MINPAYRATE
DataSource
datCompanyTabOrder  TDBEditedtMinStartAgeLeftPTop0WidthAHeight	DataFieldMINSTARTAGE
DataSource
datCompanyTabOrder  TDBEditedtMaxStartAgeLeft Top0WidthAHeight	DataFieldMAXSTARTAGE
DataSource
datCompanyTabOrder   TDBEditedtATaxYearLeftĄTopĢ Width@HeightColor	clBtnFace	DataFieldATAXYEAR
DataSource
datCompanyReadOnly	TabOrder  TDBEditedtBatUserNameLeft Top WidthAHeightColor	clBtnFace	DataFieldBATUSERNAME
DataSource
datCompanyReadOnly	TabOrder	   	TTabSheettshSystemConstantsCaptionSystem Constants TLabelLabel21LeftTopWidth@HeightCaptionNormal Hours  TLabelLabel22LeftTop0WidthGHeightCaptionOvertime + 1/3  TLabelLabel23LeftTopHWidthGHeightCaptionOvertime + 1/2  TLabelLabel24LeftTop`Width;HeightCaptionOvertime x 2  TLabelLabel25LeftTopØ WidthIHeightCaptionCouncil Deduct  TLabelLabel26LeftTop WidthvHeightCaptionNormal Attendance Days  TLabelLabel27LeftTopĄ Width<HeightCaptionProv Fund %  TLabelLabel28LeftTopŲ WidthaHeightCaptionSick Fund Deduct %  TLabelLabel29LeftTopWidth_HeightCaptionMax Paid Sick Days  TLabelLabel30LeftŲ Top WidthHeightCaptionUIF %  TLabelLabel31LeftŲ TopØ Width<HeightCaptionNight Shift %  TLabelLabel32LeftŲ TopĄ Width1HeightCaption	Pension %  TLabelLabel33LeftŲ TopŲ WidthSHeightCaptionHoliday Pay Days  TLabelLabel34LeftŲ Topš WidthHHeightCaptionHoliday Weeks  TLabelLabel35Left TopWidthHeightCaptionHours  TLabelLabel36LeftŲ TopWidthHeightCaptionMins  TLabelLabel38LeftTopxWidthü HeightCaption4Note: For %tages, 10% is entered as .1 and 5% as .05ColorclYellowFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style ParentColor
ParentFont  TLabelLabel39LeftTopī WidthPHeightCaptionSick Fund Pay %  TLabelLabel40LeftŲ TopWidthEHeightCaptionService BonusFocusControlDBEdit2Visible  TLabelLabel41LeftTopWidth[HeightCaption(per week per year)  TLabelLabel42LeftTopŲ WidthmHeightCaption(15 + HPD=Total HPD)  TLabelLabel43LeftŲ TopWidthgHeightCaptionAnnual Bonus Weeks  TLabelLabel44LeftTop Width9HeightCaption(eg 3 or 3.5)  TLabelLabel48LeftHTop8Width&HeightCaptionSubs. %  TLabelLabel49Left Top8WidthhHeightCaptionMin Excl Funeral Levy  TLabelLabel50Left Top8WidthkHeightCaptionMax Excl Funeral Levy  TLabelLabel51LeftpTop8Width=HeightCaptionFuneral Levy  TLabelLabel52LeftTopHWidth6HeightCaption
Union Levy  TLabelLabel53LeftHTop`Widthį HeightCaption-Subscription % is of Weekly Wage (Normal Pay)ColorclYellowParentColor  TDBEditDBEdit18Left TopWidthAHeight	DataField	NORMALHRS
DataSource
datCompanyTabOrder   TDBEditDBEdit19LeftŲ TopWidthAHeight	DataField
NORMALMINS
DataSource
datCompanyTabOrder  TDBEditDBEdit20Left Top,WidthAHeight	DataFieldNORMALOT13HRS
DataSource
datCompanyTabOrder  TDBEditDBEdit21LeftŲ Top,WidthAHeight	DataFieldNORMALOT13MINS
DataSource
datCompanyTabOrder  TDBEditDBEdit22Left TopDWidthAHeight	DataFieldNORMALOT12HRS
DataSource
datCompanyTabOrder  TDBEditDBEdit23LeftŲ TopDWidthAHeight	DataFieldNORMALOT12MINS
DataSource
datCompanyTabOrder  TDBEditDBEdit24Left Top\WidthAHeight	DataFieldNORMALOTX2HRS
DataSource
datCompanyTabOrder  TDBEditDBEdit25LeftŲ Top\WidthAHeight	DataFieldNORMALOTX2MINS
DataSource
datCompanyTabOrder  TDBEditDBEdit26Left Top WidthAHeight	DataFieldNORMALATTDAYS
DataSource
datCompanyTabOrder  TDBEditDBEdit27Left Top¤ WidthAHeight	DataFieldCOUNCILDEDUCT
DataSource
datCompanyTabOrder	  TDBEditDBEdit28Left Top¼ WidthAHeight	DataFieldPROVFUNDPERCENT
DataSource
datCompanyTabOrder
  TDBEditDBEdit29Left TopŌ WidthAHeight	DataFieldSICKFUNDPERCENT
DataSource
datCompanyTabOrder  TDBEditDBEdit30Left TopWidthAHeight	DataFieldMAXPAIDSICKDAYS
DataSource
datCompanyTabOrder  TDBEditDBEdit31LeftPTop WidthAHeight	DataField
UIFPERCENT
DataSource
datCompanyTabOrder  TDBEditDBEdit32LeftPTop¤ WidthAHeight	DataFieldNIGHTSHIFTPERCENT
DataSource
datCompanyTabOrder  TDBEditDBEdit33LeftPTop¼ WidthAHeight	DataFieldPENSIONPERCENT
DataSource
datCompanyTabOrder  TDBEditDBEdit34LeftPTopŌ WidthAHeight	DataFieldHOLIDAYPAYDAYS
DataSource
datCompanyTabOrder  TDBEditDBEdit35LeftPTopģ WidthAHeight	DataFieldHOLIDAYWEEKS
DataSource
datCompanyTabOrder  TDBEditDBEdit1Left Topģ WidthAHeight	DataFieldSICKFUNDPAYPERCENT
DataSource
datCompanyTabOrder  TDBEditDBEdit2LeftPTopWidthAHeight	DataFieldSERVICEBONUS
DataSource
datCompanyTabOrderVisible  TDBEditDBEdit3LeftPTopWidthAHeight	DataFieldANNUALBONUSWEEKS
DataSource
datCompanyTabOrder  TDBEditDBEdit4LeftHTopHWidthAHeight	DataFieldUNIONSUBSPERCENT
DataSource
datCompanyTabOrder  TDBEditDBEdit5Left TopHWidthAHeight	DataFieldUNIONMINEXCLFUNERALLEVY
DataSource
datCompanyTabOrder  TDBEditDBEdit7Left TopHWidthAHeight	DataFieldUNIONMAXEXCLFUNERALLEVY
DataSource
datCompanyTabOrder  TDBEditDBEdit8LeftpTopHWidthAHeight	DataFieldFUNERALLEVY
DataSource
datCompanyTabOrder   	TTabSheet
tshTaxInfoCaptionTax Info TLabelLabel8LeftTop WidthDHeightCaptionTax Constants  TLabelLabel9LeftTop° Width0HeightCaption	Tax Table  TDBGridDBGrid1Left`Top WidthyHeightĮ Color	clBtnFace
DataSourcedatTaxTableReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.HeightõTitleFont.NameMS Sans SerifTitleFont.Style   TDBGridDBGrid2Left`TopWidth1HeightqColor	clBtnFace
DataSourcedatTaxConstantsReadOnly	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.HeightõTitleFont.NameMS Sans SerifTitleFont.Style     TBitBtnbtnSaveLeft8Top°WidthKHeightCaption&SaveTabOrderOnClickbtnSaveClick
Glyph.Data
ā  Ž  BMŽ      v   (   $            h                                    ĄĄĄ    ’  ’   ’’ ’   ’ ’ ’’  ’’’ 333333333333333333  333333333333ó33333  334C3333333833333  33B$33333338ó3333  34""C333338333333  3B""$33333338ó333  4"*""C3338ó8ó3333  2"£¢"C3338ó3333  :*3:"$3338ų38ó8ó33  3£33¢"C33333333  3333:"$3333338ó8ó3  33333¢"C33333333  33333:"$3333338ó8ó  333333¢"C3333333  333333:"C3333338ó  3333333¢#3333333  3333333:3333333383  333333333333333333  	NumGlyphs  TBitBtn	btnCancelLeft Top°WidthKHeightCaptionC&ancelTabOrderOnClickbtnCancelClick
Glyph.Data
ā  Ž  BMŽ      v   (   $            h                                    ĄĄĄ    ’  ’   ’’ ’   ’ ’ ’’  ’’’ 333333333333333333  3333333333?333333  39333333ó33?33  3939338ó3?ó3  39338ó8óų33  33338ó338ó  3393333833ų3  33333338ó33?3  33313333333833  3339333338ó333  3333333383333  339333333333  33333838ó8ó3  3339333333  33933333ų38ó8ó  3333339333833’  33333333333333383  333333333333333333  	NumGlyphs  TBitBtnbtnCloseLeftŲ Top°WidthKHeightTabOrderOnClickbtnCloseClickKindbkClose  TBitBtnbtnEditLeft(Top°WidthKHeightCaption&EditTabOrderOnClickbtnEditClick  TTable
tabCompany
BeforeEdittabCompanyBeforeEdit	AfterPosttabCompanyAfterPostAfterCanceltabCompanyAfterCancelDatabaseNameWages7	TableNameCOMPANYLeftTop TIntegerFieldtabCompanyREF	FieldNameREFRequired	  TStringFieldtabCompanyCONAME	FieldNameCONAMESize(  TStringFieldtabCompanyCOMPRESSSEL	FieldNameCOMPRESSSELSize  TStringFieldtabCompanyCOMPRESSCLR	FieldNameCOMPRESSCLRSize  TStringFieldtabCompanyBOLDSEL	FieldNameBOLDSELSize  TStringFieldtabCompanyBOLDCLR	FieldNameBOLDCLRSize  TStringFieldtabCompanyFORMFEED	FieldNameFORMFEEDSize  TIntegerFieldtabCompanyLINESONPAGE	FieldNameLINESONPAGE  TFloatFieldtabCompanyMINPAYRATE	FieldName
MINPAYRATEDisplayFormat0.0000  TFloatFieldtabCompanyMAXPAYRATE	FieldName
MAXPAYRATEDisplayFormat0.0000  TIntegerFieldtabCompanyMINSTARTAGE	FieldNameMINSTARTAGE  TIntegerFieldtabCompanyMAXSTARTAGE	FieldNameMAXSTARTAGE  TFloatFieldtabCompanyRENTALLOWANCE	FieldNameRENTALLOWANCEDisplayFormat0.00  TFloatFieldtabCompanyOTHER1	FieldNameOTHER1DisplayFormat0.00  TFloatFieldtabCompanyANNUALBONMIN	FieldNameANNUALBONMINDisplayFormat0.00  TDateTimeFieldtabCompanyLASTWEEK	FieldNameLASTWEEKDisplayFormat
dd/mm/yyyy  TIntegerFieldtabCompanySTARTNUMBER	FieldNameSTARTNUMBER  TIntegerFieldtabCompanyATXWK	FieldNameATXWK  TIntegerFieldtabCompanyWEEKSINYEAR	FieldNameWEEKSINYEAR  TIntegerFieldtabCompanyHOLIDAYPAYDAYS	FieldNameHOLIDAYPAYDAYS  TIntegerFieldtabCompanyNORMALHRS	FieldName	NORMALHRS  TIntegerFieldtabCompanyNORMALMINS	FieldName
NORMALMINS  TIntegerFieldtabCompanyNORMALOT13HRS	FieldNameNORMALOT13HRS  TIntegerFieldtabCompanyNORMALOT13MINS	FieldNameNORMALOT13MINS  TIntegerFieldtabCompanyNORMALOT12HRS	FieldNameNORMALOT12HRS  TIntegerFieldtabCompanyNORMALOT12MINS	FieldNameNORMALOT12MINS  TIntegerFieldtabCompanyNORMALOTX2HRS	FieldNameNORMALOTX2HRS  TIntegerFieldtabCompanyNORMALOTX2MINS	FieldNameNORMALOTX2MINS  TFloatFieldtabCompanyNORMALATTDAYS	FieldNameNORMALATTDAYS  TFloatFieldtabCompanyCOUNCILDEDUCT	FieldNameCOUNCILDEDUCTDisplayFormat0.00  TFloatFieldtabCompanyPROVFUNDPERCENT	FieldNamePROVFUNDPERCENTDisplayFormat0.0000  TFloatFieldtabCompanySICKFUNDPERCENT	FieldNameSICKFUNDPERCENTDisplayFormat0.00  TFloatFieldtabCompanyMAXPAIDSICKDAYS	FieldNameMAXPAIDSICKDAYSDisplayFormat0.00  TFloatFieldtabCompanyUIFPERCENT	FieldName
UIFPERCENTDisplayFormat0.00  TFloatFieldtabCompanyNIGHTSHIFTPERCENT	FieldNameNIGHTSHIFTPERCENTDisplayFormat0.00  TFloatFieldtabCompanyPENSIONPERCENT	FieldNamePENSIONPERCENTDisplayFormat0.00  TIntegerFieldtabCompanyHOLIDAYWEEKS	FieldNameHOLIDAYWEEKS  TIntegerFieldtabCompanyATAXYEAR	FieldNameATAXYEAR  TStringFieldtabCompanyNORMALFONT	FieldName
NORMALFONTSize  TStringFieldtabCompanyCOMPRESSEDFONT	FieldNameCOMPRESSEDFONTSize  TStringFieldtabCompanyPRINTER	FieldNamePRINTERSize2  TStringFieldtabCompanyBATUSERNAME	FieldNameBATUSERNAMESize
  TFloatFieldtabCompanySICKFUNDPAYPERCENT	FieldNameSICKFUNDPAYPERCENTDisplayFormat0.00  TFloatFieldtabCompanySERVICEBONUS	FieldNameSERVICEBONUSDisplayFormat0.00  TFloatFieldtabCompanyANNUALBONUSWEEKS	FieldNameANNUALBONUSWEEKSDisplayFormat0.000  TFloatFieldtabCompanyUNIONSUBSPERCENT	FieldNameUNIONSUBSPERCENTDisplayFormat0.00  TFloatField!tabCompanyUNIONMINEXCLFUNERALLEVY	FieldNameUNIONMINEXCLFUNERALLEVYDisplayFormat0.00  TFloatField!tabCompanyUNIONMAXEXCLFUNERALLEVY	FieldNameUNIONMAXEXCLFUNERALLEVYDisplayFormat0.00  TFloatFieldtabCompanyFUNERALLEVY	FieldNameFUNERALLEVYDisplayFormat0.00   TDataSourcedatTaxTableDataSetqryTaxTableLeftXTop8  TDataSourcedatTaxConstantsDataSetqryTaxConstantsLeft8Top8  TDataSource
datCompanyDataSet
tabCompanyOnStateChangedatCompanyStateChangeLeftTop8  TPrinterSetupDialogdlgSetupLeft$TopX  TPrintDialogdlgPrintLeftLTopX  TQueryqryGetPaySlipHistDatabaseNameWages7SQL.Stringsselect *from paysliphistorder by clkno,thisweek Left$Topx  TQueryqryFixTableDatabaseNameWages7LeftLTopx  TQueryqryPFFixNullsDatabaseNameWages7SQL.Stringsupdate paysliphistset pfaddnew=0where pfaddnew is null LeftōTop    TQueryqryPFFetchPaySlipHistDatabaseNameWages7SQL.Strings<select clkno,thisweek,pfoldbal,pflessrepay,pfaddnew,pfnewbalfrom paysliphistwhere pfoldbal<>0and paykind='AW'order by clkno,thisweek LeftTop   TIntegerFieldqryPFFetchPaySlipHistCLKNO	FieldNameCLKNO  TDateTimeFieldqryPFFetchPaySlipHistTHISWEEK	FieldNameTHISWEEK  TFloatFieldqryPFFetchPaySlipHistPFOLDBAL	FieldNamePFOLDBAL  TFloatField qryPFFetchPaySlipHistPFLESSREPAY	FieldNamePFLESSREPAY  TFloatFieldqryPFFetchPaySlipHistPFADDNEW	FieldNamePFADDNEW  TFloatFieldqryPFFetchPaySlipHistPFNEWBAL	FieldNamePFNEWBAL   TQueryqryPFUpdatePaySlipHistDatabaseNameWages7SQL.Stringsupdate paysliphistset pfoldbal=:pfoldbal,  pfnewbal=:pfnewbalwhere clkno=:clknoand thisweek=:thisweek Left4Top  	ParamDataDataType
ftCurrencyNamepfoldbal	ParamType	ptUnknown DataType
ftCurrencyNamepfnewbal	ParamType	ptUnknown DataType	ftIntegerNameclkno	ParamType	ptUnknown DataType
ftDateTimeNamethisweek	ParamType	ptUnknown    TQueryqryPFUpdateEmployeeDatabaseNameWages7SQL.Stringsupdate employeeset pfloanac=:pfloanacwhere clkno=:clkno LeftTTop  	ParamDataDataType	ftUnknownNamepfloanac	ParamType	ptUnknown DataType	ftUnknownNameclkno	ParamType	ptUnknown    TQueryqryTaxConstantsDatabaseNameWages7SQL.Stringsselect *from taxconstantsorder by taxyr desc Left9Top TIntegerFieldqryTaxConstantsTAXYRDisplayLabelTax Year	FieldNameTAXYROriginWAGES7.TAXCONSTANTS.TAXYR  TFloatFieldqryTaxConstantsPRIMREBDisplayLabelPrimary Rebate	FieldNamePRIMREBOriginWAGES7.TAXCONSTANTS.PRIMREBDisplayFormat#,##0.00  TFloatFieldqryTaxConstantsPERSON65RDisplayLabelPerson 65 Rebate	FieldName	PERSON65ROriginWAGES7.TAXCONSTANTS.PERSON65RDisplayFormat#,##0.00   TQueryqryTaxTableDatabaseNameWages7
DataSourcedatTaxConstantsSQL.Stringsselect *from taxtablewhere taxyr = :taxyr LeftXTop	ParamDataDataType	ftIntegerNameTAXYR	ParamType	ptUnknown   TIntegerFieldqryTaxTableTAXYRDisplayLabelTax Year	FieldNameTAXYROriginWAGES7.TAXTABLE.TAXYR  TFloatFieldqryTaxTableFROMTAXABLEINCOMEDisplayLabelFromDisplayWidth	FieldNameFROMTAXABLEINCOMEOrigin!WAGES7.TAXTABLE.FROMTAXABLEINCOMEDisplayFormat#,##0.00  TFloatFieldqryTaxTableTOTAXABLEINCOMEDisplayLabelToDisplayWidth	FieldNameTOTAXABLEINCOMEOriginWAGES7.TAXTABLE.TOTAXABLEINCOMEDisplayFormat#,##0.00  TFloatFieldqryTaxTableTAXDisplayLabelTax	FieldNameTAXOriginWAGES7.TAXTABLE.TAXDisplayFormat#,##0.00  TFloatFieldqryTaxTableEXTRAPERCENTDisplayLabelExtra %	FieldNameEXTRAPERCENTOriginWAGES7.TAXTABLE.EXTRAPERCENTDisplayFormat#,##0.00    