�
 TCTRLACCPFORM 0U  TPF0TCtrlAccPFormCtrlAccPFormLeft� TopbWidth�HeightaActiveControl	edtSearchCaption.Control Account Summary and Prices MaintenanceColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel1LeftTop(Width(HeightCaption	Ctrl AcctFocusControlDBEdit1  TLabelLabel2LeftTopPWidth5HeightCaptionDescriptionFocusControlDBEdit2  TLabelLabel3LeftPTop(Width:HeightCaptionExt Ctrl AcctFocusControlDBEdit3  TLabelLabel4Left� Top(Width:HeightCaptionQty BalanceFocusControlDBEdit4  TLabelLabel9LeftTop� WidthTHeightCaptionTxn Det Summary  TLabelLabel7LefthTop� Width6HeightCaption
ExtProdRefFocusControlDBEdit6  TLabelLabel8Left� Top� WidthMHeightCaptionReport CategoryFocusControlDBEdit7  TLabelLabel14LeftTop� WidthHHeightCaptionStd Cost Prices  TLabelLabel10Left@TopPWidth"HeightCaptionSearch  TDBEditDBEdit1LeftTop8Width:HeightTabStopColorclSilver	DataFieldACCNAME
DataSourceCtrlAcctSourceReadOnly	TabOrder   TDBEditDBEdit2LeftTop`Width� HeightColorclSilver	DataFieldDESCRIPTION
DataSourceCtrlAcctSourceReadOnly	TabOrder  TDBEditDBEdit3LeftPTop8WidthAHeightTabStopColorclSilver	DataField
EXTACCNAME
DataSourceCtrlAcctSourceReadOnly	TabOrder  TDBEditDBEdit4Left� Top8Width@HeightTabStopColorclSilver	DataFieldQTY
DataSourceCtrlAcctSourceReadOnly	TabOrder  TDBEditDBEdit6LefthTop� WidthLHeightTabStopColorclSilver	DataField
EXTPRODREF
DataSourceTxnDetSummarySourceReadOnly	TabOrder  TDBEditDBEdit7Left� Top� WidthXHeightHint=Ext Ctrl AcctColorclSilver	DataFieldCATEGORY
DataSourceTxnDetSummarySourceReadOnly	TabOrder  TDBGridDBGrid1Left`Top� Width9Heightx
DataSourceStdCostPricesSourceTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnEnterDBGrid1EnterOnExitDBGrid1Exit  TDBNavigatorDBNavigator1Left8TopWidth� Height
DataSourceActiveSourceTabOrder  TEdit	edtSearchLeft@Top`WidthQHeightCharCaseecUpperCaseTabOrderOnChangeedtSearchChange  TBitBtnCloseBitBtnLeftHTop WidthKHeightTabOrder	OnClickCloseBitBtnClickKindbkClose  TTableCtrlAcctDatabaseNameStock	TableNameCTRLACCTLeft Top0 TStringFieldCtrlAcctACCNAME	FieldNameACCNAMERequired	Size  TStringFieldCtrlAcctDESCRIPTION	FieldNameDESCRIPTIONSize<  TStringFieldCtrlAcctEXTACCNAME	FieldName
EXTACCNAMESize	  TFloatFieldCtrlAcctQTY	FieldNameQTYDisplayFormat0   TDataSourceCtrlAcctSourceDataSetCtrlAcctLeftTop0  TTableTxnDetSummaryDatabaseNameStockIndexFieldNames
EXTPRODREFMasterFields
EXTACCNAMEMasterSourceCtrlAcctSource	TableNameTXNDETSUMMARYLeftTop�  TStringFieldTxnDetSummaryEXTPRODREFDisplayLabel
ExtProdRefDisplayWidth	FieldName
EXTPRODREFRequired	Size  TStringFieldTxnDetSummaryCATEGORYDisplayLabelReport CategoryDisplayWidth	FieldNameCATEGORYSize   TDataSourceTxnDetSummarySourceDataSetTxnDetSummaryLeft0Top�   TTableStdCostPricesDatabaseNameStockIndexFieldNames
EXTPRODREFMasterFields
EXTACCNAMEMasterSourceCtrlAcctSource	TableNameSTDCOSTPRICESLeft� Top�  TStringFieldStdCostPricesEXTPRODREFDisplayLabel
ExtProdRef	FieldName
EXTPRODREFRequired	Size  TDateTimeFieldStdCostPricesFROMDATEDisplayLabelFromDisplayWidth	FieldNameFROMDATERequired	DisplayFormat
dd/mm/yyyy  TDateTimeFieldStdCostPricesTODATEDisplayLabelToDisplayWidth	FieldNameTODATERequired	DisplayFormat
dd/mm/yyyy  TFloatFieldStdCostPricesSTDPRICEDisplayLabel	Std PriceDisplayWidth	FieldNameSTDPRICEDisplayFormat0.00   TDataSourceStdCostPricesSourceDataSetStdCostPricesLeftTop�   TDataSourceActiveSourceDataSetCtrlAcctLeftTop   