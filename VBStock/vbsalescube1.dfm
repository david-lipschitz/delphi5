�
 TFRMVBSALESCUBE1 0�  TPF0TfrmVBSalesCube1frmVBSalesCube1Left� TopjWidthJHeight�CaptionSales Cube since 1/1/1999Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight 	TSplitter	Splitter1Left Top!WidthBHeightCursorcrVSplitAlignalTop  TPanelPanel1Left Top WidthBHeight9AlignalTopTabOrder  TBitBtnbtnCloseLeft�TopWidthKHeightTabOrder OnClickbtnCloseClickKindbkClose  TButtonbtnPrintLeft@TopWidthKHeightCaptionPrintTabOrderOnClickbtnPrintClick   TDecisionPivotDecisionPivot1Left Top9WidthBHeight8ButtonAutoSize	DecisionSourceDecisionSource1GroupLayoutxtHorizontalGroupsxtRows	xtColumnsxtSummaries ButtonSpacingButtonWidth@ButtonHeightGroupSpacing
BorderWidthBorderStylebsNoneAlignalTopTabOrder  TPanelPanel2Left TopqWidthBHeight� AlignalTopCaptionPanel2TabOrder TDecisionGridDecisionGrid1LeftTopWidth@Height� DefaultColWidthdDefaultRowHeightCaptionColorclActiveCaptionCaptionFont.CharsetDEFAULT_CHARSETCaptionFont.ColorclCaptionTextCaptionFont.Height�CaptionFont.NameMS Sans SerifCaptionFont.Style 	DataColorclInfoBkDataSumColorclNoneDataFont.CharsetDEFAULT_CHARSETDataFont.ColorclWindowTextDataFont.Height�DataFont.NameMS Sans SerifDataFont.Style LabelFont.CharsetDEFAULT_CHARSETLabelFont.ColorclWindowTextLabelFont.Height�LabelFont.NameMS Sans SerifLabelFont.Style 
LabelColor	clBtnFaceLabelSumColorclInactiveCaptionDecisionSourceDecisionSource1
Dimensions	FieldNameYEARNOColorclNone	AlignmenttaCenter	Subtotals	 	FieldNamePERIODNOColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameMETRICWIDTHColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameVBSTRUColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameLOCALOVERSEASColorclNone	AlignmenttaCenter	Subtotals	 	FieldName	NETLENGTHColorclNone	AlignmenttaCenter	Subtotals	  Totals	ShowCubeEditorAlignalClientColor	clBtnFaceGridLineWidthGridLineColorclWindowTextTabOrder    TPanelPanel3Left Top%WidthBHeight� AlignalClientCaptionPanel3TabOrder TDecisionGraphDecisionGraph1LeftTopWidth@Height� DecisionSourceDecisionSource1BottomWall.ColorclWhiteFoot.Font.CharsetDEFAULT_CHARSETFoot.Font.ColorclRedFoot.Font.Height�Foot.Font.NameArialFoot.Font.StylefsItalic LeftWall.Color��� Title.Text.StringsTDecisionGraph AlignalClientTabOrder  
TBarSeriesSeries1ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: PERIODNOSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ��?XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ��?YValues.OrderloNone
IdentifierTemplate: PERIODNOStyle=  
TBarSeriesSeries2ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: METRICWIDTHSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ��?XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ��?YValues.OrderloNone
IdentifierTemplate: METRICWIDTHStyle=  
TBarSeriesSeries3ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: VBSTRUSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ��?XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ��?YValues.OrderloNone
IdentifierTemplate: VBSTRUStyle=  
TBarSeriesSeries4ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: LOCALOVERSEASSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ��?XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ��?YValues.OrderloNone
IdentifierTemplate: LOCALOVERSEASStyle=  
TBarSeriesSeries8ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: YEARNOSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ��?XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ��?YValues.OrderloNone
IdentifierTemplate: YEARNOStyle=  
TBarSeriesSeries5ActiveColorEachPoint	Marks.ArrowLengthMarks.VisibleTitle1D Template: YEARNOSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ��?XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ��?YValues.OrderloNone
Identifier1D Template: YEARNOStyle(    TDecisionQueryDecisionQuery1DatabaseNameVBStockSQL.Strings�SELECT wh.VBSTRU, wh.YEARNO, wh.PERIODNO, su.LOCALOVERSEAS, wh.VBWIDTH, wh.CUSTREF, CAST( SUM( wh.NETLENGTH ) AS INTEGER ) netlengthFROM whsalespercustomer wh   INNER JOIN supplier su!   ON  (wh.custref = su.supref)  TGROUP BY wh.VBSTRU, wh.YEARNO, wh.PERIODNO, su.LOCALOVERSEAS, wh.VBWIDTH, wh.CUSTREF LefthTop�   TDecisionCubeDecisionCube1DataSetDecisionQuery1DimensionMap
ActiveFlag
diAsNeeded	FieldType
ftSmallint	FieldnameYEARNOBaseName	vp.yearnoNameYEARNODerivedFrom�DimensionTypedimDimensionBinTypebinNone
ValueCountActive	 
ActiveFlag
diAsNeeded	FieldType
ftSmallint	FieldnamePERIODNOBaseNamevp.periodnoNamePERIODNODerivedFrom�DimensionTypedimDimensionBinTypebinNone
ValueCountActive	 
ActiveFlag
diAsNeeded	FieldType
ftSmallint	FieldnameMETRICWIDTHBaseNamevr.metricwidthNameMETRICWIDTHDerivedFrom�DimensionTypedimDimensionBinTypebinNone
ValueCountActive	 
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameVBSTRUBaseName	vr.vbstruNameVBSTRUDerivedFrom�DimensionTypedimDimensionBinTypebinNone
ValueCountActive	 
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameLOCALOVERSEASBaseNamesu.localoverseasNameLOCALOVERSEASDerivedFrom�DimensionTypedimDimensionBinTypebinNone
ValueCountActive	 
ActiveFlag
diAsNeeded	FieldType	ftInteger	Fieldname	NETLENGTHBaseNameSUM( vr.NETLENGTH )Name	NETLENGTHDerivedFrom�DimensionTypedimGenericAggBinTypebinNone
ValueCount�Active	  ShowProgressDialog	MaxDimensionsMaxSummaries
MaxCells Left� Top�   TDecisionSourceDecisionSource1DecisionCubeDecisionCube1ControlTypextCheck
SparseRows
SparseColsLeftTop� DimensionCountSummaryCountCurrentSummary 
SparseRows
SparseColsDimensionInfo  ��� � ��    