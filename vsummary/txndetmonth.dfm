�
 TTXNDETSUMMARYMONTHFORM 0�  TPF0TTxnDetSummaryMonthFormTxnDetSummaryMonthFormLeftTop� Width�Height�Caption&Summarise Txn Det Historical Month WIPColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel1Left Top Width�HeightQAlignalTopTabOrder  TLabelLabel1LeftTopWidthHeightCaptionYear  TLabelLabel2LeftHTopWidthHeightCaptionPeriod  TLabelLabel3Left8TopWidthAHeightCaptionNum Records  TLabelLabel4Left8Top*Width+HeightCaption	Qty Total  TLabelLabel5LeftPTop>Width.HeightCaptionDatabase  TLabelLabel6LeftTop0WidthoHeightCaption2002,2003 added 0408ColorclYellowParentColor  TButtonSummariseBtnLeft� TopWidth� HeightCaptionSummarise Period on LeftTabOrder OnClickSummariseBtnClick  	TComboBox
EditYearNoLeftTopWidth<Height
ItemHeightTabOrderText2001OnChangeEditYearNoChangeItems.Strings199519961997199819992000200120022003   	TComboBoxEditPeriodNoLeftHTopWidth<HeightDropDownCount
ItemHeightTabOrderText1OnChangeEditPeriodNoChangeItems.Strings123456789101112   TButtonUpdateTxnDetBtnLeft� Top Width� HeightCaptionUpdate Txn DetTabOrderOnClickUpdateTxnDetBtnClick  TEditShowNumRecordsLeft8TopWidth2HeightTabOrder  TBitBtnCloseBitBtnLeftxTopWidthKHeightTabOrderOnClickCloseBitBtnClickKindbkClose  TEditShowQtyTotalLeft8Top8Width2HeightTabOrder  TEditEdtDatabaseNameLeft� Top:WidthyHeightColorclSilverReadOnly	TabOrder   TPanelPanel2Left TopQWidth�Height#AlignalClientTabOrder TDBGridDBGrid1LeftTopWidth�Height!AlignalClient
DataSourceTxnDetSummariseSourceTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    TTableTxnDetSummariseDatabaseNameStock	TableNameTXNDETSUMMARISELeft(Topy TStringFieldTxnDetSummarisePRODTYPEDisplayLabel	Prod TypeDisplayWidth		FieldNamePRODTYPERequired	Size  TStringFieldTxnDetSummariseTXNCODEDisplayLabelTxn CodeDisplayWidth		FieldNameTXNCODERequired	Size  TStringFieldTxnDetSummariseEXTPRODREFDisplayLabelExt Prod Ref	FieldName
EXTPRODREFRequired	Size  TStringFieldTxnDetSummariseQLTYDisplayLabelQltyDisplayWidth	FieldNameQLTYRequired	Size  TFloatFieldTxnDetSummariseQTYDisplayLabelQuantity	FieldNameQTYDisplayFormat0   TDataSourceTxnDetSummariseSourceDataSetTxnDetSummariseLeftHTopy  TStoredProcSPEXTRACTTXNDETSUMMARYDatabaseNameStockStoredProcNameSPEXTRACTTXNDETSUMMARYMONTHLeftxTopy	ParamDataDataType	ftIntegerNameYEARNO	ParamTypeptInput DataType	ftIntegerNamePERIODNO	ParamTypeptInput DataType	ftIntegerNameRECORDSFOUND	ParamTypeptOutput DataType
ftDateTimeNameFROMDATE	ParamTypeptOutput DataType
ftDateTimeNameTODATE	ParamTypeptOutput DataType	ftIntegerNameQTYTOTAL	ParamTypeptOutput    TStoredProcSPSUMMARISETXNDETDatabaseNameStockStoredProcNameSPSUMMARISETXNDETMONTHLeft� Topy	ParamDataDataType
ftDateTimeNameFROMDATE	ParamTypeptInput DataType
ftDateTimeNameTODATE	ParamTypeptInput     