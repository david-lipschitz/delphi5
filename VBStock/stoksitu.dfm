�
 TSTOKSITUFORM 0r  TPF0TStokSituFormStokSituFormLeft� Top� Width�Height,CaptionStock SituationFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TDecisionPivotDecisionPivot1Left Top)Width�Height)ButtonAutoSize	DecisionSourceDecisionSource1GroupLayoutxtHorizontalGroupsxtRows	xtColumnsxtSummaries ButtonSpacingButtonWidth@ButtonHeightGroupSpacing
BorderWidthBorderStylebsNoneAlignalTopTabOrder   TDecisionGridDecisionGrid1Left TopRWidth�Height� DefaultColWidthdDefaultRowHeightCaptionColorclActiveCaptionCaptionFont.CharsetDEFAULT_CHARSETCaptionFont.ColorclCaptionTextCaptionFont.Height�CaptionFont.NameMS Sans SerifCaptionFont.Style 	DataColorclInfoBkDataSumColorclNoneDataFont.CharsetDEFAULT_CHARSETDataFont.ColorclWindowTextDataFont.Height�DataFont.NameMS Sans SerifDataFont.Style LabelFont.CharsetDEFAULT_CHARSETLabelFont.ColorclWindowTextLabelFont.Height�LabelFont.NameMS Sans SerifLabelFont.Style 
LabelColor	clBtnFaceLabelSumColorclInactiveCaptionDecisionSourceDecisionSource1
Dimensions	FieldName	Prod TypeColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameTxn CodeColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameProdColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameTXNDATEColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameQTYColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameTOTVALUEColorclNone	AlignmenttaCenter	Subtotals	  Totals	ShowCubeEditorAlignalTopColor	clBtnFaceGridLineWidthGridLineColorclWindowTextTabOrder  TPanelPanel1Left Top Width�Height)AlignalTopTabOrder  TDecisionQueryStockSituQueryDatabaseNameVBStockSQL.Strings/SELECT td.PRODTYPE, td.TXNCODE, td.EXTPRODREF, td.txndate,$cast(SUM( td.QTY ) as integer) Qty, @cast(sum(td.qty*sc.stdprice*sv.valuerating) as integer) TotValue0FROM txndet td,stdcostprices sc,stdqltyvalues sv!where td.extprodref=sc.extprodrefand td.txndate>=sc.fromdateand td.txndate<=sc.todateand td.prodtype=sv.prodtypeand td.qlty=sv.qlty;GROUP BY td.PRODTYPE, td.TXNCODE, td.EXTPRODREF,td.txndate,sc.stdprice,sv.prodtype,sv.qlty:ORDER BY td.PRODTYPE, td.TXNCODE, td.EXTPRODREF,td.txndate LeftxToph  TDecisionCubeDecisionCube1DataSetStockSituQueryDimensionMap
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnamePRODTYPEBaseNametd.prodtypeName	Prod TypeDerivedFrom�DimensionTypedimDimensionBinTypebinNone
ValueCountActive	 
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameTXNCODEBaseName
td.TXNCODENameTxn CodeDerivedFrom�DimensionTypedimDimensionBinTypebinNone
ValueCount	Active	 
ActiveFlag
diAsNeeded	FieldTypeftString	Fieldname
EXTPRODREFBaseNametd.extprodrefNameProdDerivedFrom�DimensionTypedimDimensionBinTypebinNone
ValueCountnActive	 
ActiveFlag
diAsNeeded	FieldType
ftDateTime	FieldnameTXNDATEBaseName
td.txndateNameTXNDATEDerivedFrom�DimensionTypedimDimensionBinTypebinMonth
ValueCountActive	
StartValue      g�@ 
ActiveFlag
diAsNeeded	FieldType	ftInteger	FieldnameQTYBaseName
SUM( QTY )NameQTYDerivedFrom�DimensionTypedimGenericAggBinTypebinNone
ValueCount�Active	 
ActiveFlag
diAsNeeded	FieldType	ftInteger	FieldnameTOTVALUEBaseName)SUM(   (QTY * stdprice)  * valuerating  )NameTOTVALUEDerivedFrom�DimensionTypedimGenericAggBinTypebinNone
ValueCount�Active	  ShowProgressDialog	MaxDimensionsMaxSummaries
MaxCells@B Left�Toph  TDecisionSourceDecisionSource1DecisionCubeDecisionCube1ControlTypextCheck
SparseRows
SparseColsLeft�TophDimensionCountSummaryCountCurrentSummary
SparseRows
SparseColsDimensionInfo   �  �  �    