�
 TPRODUCTFORM 02  TPF0TProductFormProductFormLeft� TopeWidth�Height�ActiveControl	edtSearchCaptionProduct Price MaintenanceColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel1Left0Top(Width'HeightCaptionProdRefFocusControlDBEdit1  TLabelLabel2LeftpTop(WidthHeightCaptionCatFocusControlDBEdit2  TLabelLabel3Left� Top(WidthHeightCaptionDescrFocusControlDBEdit3  TLabelLabel4LeftTop(Width%HeightCaptionCtrlAcctFocusControlDBEdit4  TLabelLabel5LeftPTop(Width6HeightCaption
ExtProdRefFocusControlDBEdit5  TLabelLabel6LeftTop8Width%HeightCaptionProduct  TLabelLabel7LefthTopXWidth6HeightCaption
ExtProdRefFocusControlDBEdit6  TLabelLabel8Left� TopXWidthMHeightCaptionReport CategoryFocusControlDBEdit7  TLabelLabel9LeftTophWidthTHeightCaptionTxn Det Summary  TLabelLabel14LeftTop� WidthHHeightCaptionStd Cost Prices  TLabelLabel10Left@TopPWidth"HeightCaptionSearch  TDBEditDBEdit1Left0Top8Width:HeightTabStopColorclSilver	DataFieldPRODREF
DataSourceProductSourceReadOnly	TabOrder   TDBEditDBEdit2LeftpTop8Width"HeightTabStopColorclSilver	DataFieldCATEGORY
DataSourceProductSourceReadOnly	TabOrder  TDBEditDBEdit3Left� Top8Width|HeightTabStopColorclSilver	DataFieldDESCR
DataSourceProductSourceReadOnly	TabOrder  TDBEditDBEdit4LeftTop8Width4HeightTabStopColorclSilver	DataFieldCTRLACCT
DataSourceProductSourceReadOnly	TabOrder  TDBEditDBEdit5LeftPTop8WidthLHeightTabStopColorclSilver	DataField
EXTPRODREF
DataSourceProductSourceReadOnly	TabOrder  TDBEditDBEdit6LefthTophWidthLHeightTabStopColorclSilver	DataField
EXTPRODREF
DataSourceTxnDetSummarySourceReadOnly	TabOrder  TDBEditDBEdit7Left� TophWidthXHeightHint=PurchCategoryColorclSilver	DataFieldCATEGORY
DataSourceTxnDetSummarySourceReadOnly	TabOrder  TDBGridDBGrid1Left`Top� Width@Height
DataSourceStdCostPricesSourceTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnEnterDBGrid1EnterOnExitDBGrid1Exit  TDBNavigatorDBNavigator1Left0TopWidth� Height
DataSourceActiveSourceTabOrder  TBitBtnCloseBitBtnLeftPTopWidthKHeightTabOrder	OnClickCloseBitBtnClickKindbkClose  TEdit	edtSearchLeft@Top`WidthQHeightCharCaseecUpperCaseTabOrder
OnChangeedtSearchChange  TTableProductDatabaseNameStock	TableNamePRODUCTLeft� Top TStringFieldProductPRODREFDisplayLabelProdRefDisplayWidth	FieldNamePRODREFRequired	Size  TStringFieldProductCATEGORYDisplayLabelCatDisplayWidth	FieldNameCATEGORYSize  TStringFieldProductDESCRDisplayLabelDescrDisplayWidth	FieldNameDESCRSize  TStringFieldProductCTRLACCTDisplayLabelCtrlAcctDisplayWidth	FieldNameCTRLACCTRequired	Size  TStringFieldProductEXTPRODREFDisplayLabel
ExtProdRefDisplayWidth	FieldName
EXTPRODREFSize   TDataSourceProductSourceDataSetProductLeft� Top  TTableTxnDetSummaryDatabaseNameStockIndexFieldNames
EXTPRODREFMasterFields
EXTPRODREFMasterSourceProductSource	TableNameTXNDETSUMMARYLeftTopX TStringFieldTxnDetSummaryEXTPRODREFDisplayLabel
ExtProdRefDisplayWidth	FieldName
EXTPRODREFRequired	Size  TStringFieldTxnDetSummaryCATEGORYDisplayLabelReport CategoryDisplayWidth	FieldNameCATEGORYSize   TDataSourceTxnDetSummarySourceDataSetTxnDetSummaryLeft0TopX  TTableStdCostPricesDatabaseNameStockIndexFieldNames
EXTPRODREFMasterFields
EXTPRODREFMasterSourceProductSource	TableNameSTDCOSTPRICESLeft Top�  TStringFieldStdCostPricesEXTPRODREFDisplayLabel
ExtProdRef	FieldName
EXTPRODREFRequired	Size  TDateTimeFieldStdCostPricesFROMDATEDisplayLabelFromDisplayWidth	FieldNameFROMDATERequired	DisplayFormat
dd/mm/yyyy  TDateTimeFieldStdCostPricesTODATEDisplayLabelToDisplayWidth	FieldNameTODATERequired	DisplayFormat
dd/mm/yyyy  TFloatFieldStdCostPricesSTDPRICEDisplayLabel	Std PriceDisplayWidth	FieldNameSTDPRICEDisplayFormat0.00   TDataSourceStdCostPricesSourceDataSetStdCostPricesLeftTop�   TDataSourceActiveSourceDataSetProductLeftTop   