�
 TVBSTOCKMINFORM 0�3  TPF0TVBStockMinFormVBStockMinFormLeft� Top� Width�HeightyCaptionVB Minimum Stock RqdColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel1Left Top Width�HeightIAlignalTopTabOrder  TSpeedButtonPrintSpdBtnLeftFTop	WidthHeightHintPrint this form
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�ss3330�� 33337��w33330  33337wws333	NumGlyphsParentShowHintShowHint	OnClickPrintSpdBtnClick  TLabelLabel4LefthTopWidth*HeightCaptionVB StrucVisible  TLabelLabel2LeftTop#WidthHeightCaptionStru  TLabelLabel3Left8Top#WidthHeightCaptionCol  TLabelLabel5LeftpTop#WidthHeightCaptionFin  TLabelLabel6Left� Top#WidthHeightCaptionWidth  TLabelLabel7Left� Top#Width5HeightCaption
Sale Group  TLabelLabel12Left�Top(WidthwHeightCaptionSales Per Month Analysis  TLabelLabel13Left�Top8WidthoHeightCaptionUsing Data Warehouse  TDBNavigatorDBNavigatorLeftTopWidth� Height
DataSourceVBStockMinSourceVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbEditnbPostnbCancel Ctl3DParentCtl3DTabOrder   TBitBtnCloseBitBtnLeft� TopWidthAHeightCaption&CloseModalResultTabOrderOnClickCloseBitBtnClick
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 8����w���������33?  DD@���DD������3��  33MP��33�����38��  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33DDDDD3333������?  33333333333�����3?  333   333333?���3?  333
��333333����3?  333   333333����3?  	NumGlyphs  TEdit
EditVBStruLeft�TopWidth"HeightTabOrderVisibleOnChangeEditVBStruChange  TEditedtStruLeftTop0Width)HeightTabOrderOnExitedtStruExit  TEditedtColLeft8Top0Width1HeightTabOrderOnExitedtStruExit  TEditedtFinLeftpTop0Width1HeightTabOrderOnExitedtStruExit  TEditedtWidthLeft� Top0Width1HeightTabOrderOnExitedtStruExit  TEditedtSaleGroupLeft� Top0Width9HeightTabOrderOnExitedtStruExit  TButton	btnUpdateLeft8Top(WidthKHeightHint!Update others in group to currentCaptionUpdateTabOrderVisibleOnClickbtnUpdateClick  TStaticTextStaticText1LeftTopWidthrHeightCaptionSOQ is Sales Order QtyColorclYellowParentColorTabOrder	  TButtonbtnAddMissingLeftTop(WidthaHeightCaptionAdd Missing ItemsTabOrder
OnClickbtnAddMissingClick   TPanelPanel2Left TopIWidth�Height� AlignalClient
BevelInner	bvLoweredBorderWidthCaptionPanel2TabOrder 	TSplitter	Splitter1LeftyTopWidthHeight� CursorcrHSplit  TDBGridDBGrid1LeftTopWidthsHeight� AlignalLeftBorderStylebsNone
DataSourceVBStockMinSourceTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style   TPanelPanel4Left|TopWidthHeight� AlignalClientTabOrder TPanelPanel5LeftTopWidthHeight� AlignalClientCaptionPanel5TabOrder  TDBGridDBGrid2LeftTopWidthHeight� AlignalClient
DataSourcedatSalesPerMonthTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    TPanelPanel6LeftTop� WidthHeight,AlignalBottomTabOrder TLabelLabel8LeftTopWidthRHeightCaptionAve Sale:        89  TLabelLabel9LeftxTopWidthHeightCaption127  TLabelLabel10Left� TopWidthHeightCaptionFW  TLabelLabel11Left� TopWidth-HeightCaptionFW Conv  TLabelLabel14LeftTopWidthCHeightCaptionFrom VBMake  TDBEditDBEdit1LeftPTopWidth(Height	DataField	AVESALE89
DataSourcedatVBMake_FinTabOrder   TDBEditDBEdit2LeftxTopWidth(Height	DataField
AVESALE127
DataSourcedatVBMake_FinTabOrder  TDBEditDBEdit3Left� TopWidth(Height	DataFieldAVESALE2070
DataSourcedatVBMake_FinTabOrder  TDBEditDBEdit4Left� TopWidth(Height	DataFieldFWCONV
DataSourcedatVBMake_FinTabOrder     TPanelPanel3Left Top(Width�Height6AlignalBottomTabOrder TLabelLabel1LeftTopWidth�Height!AlignalClientCaption�Notes: Stock Min: enter -1 for use Average Sales; 0 means stock min is zero; 0.1 to 4.9 means multiply the average sales by this number; 5 or higher means this is the stock minimum in metres.  If no sales then stock min = 0. MakeStk is a simple multiplierColorclInfoBkParentColorWordWrap	  
TStatusBar	StatusBarLeftTop"Width�HeightPanels SimplePanel	   TDataSourceVBStockMinSourceDataSet
VBStockMinLeft� Top�   TTable
VBStockMinBeforeInsertVBStockMinBeforeInsert
BeforeEditVBStockMinBeforeEdit	AfterPostVBStockMinAfterPostAfterCancelVBStockMinAfterCancelBeforeDeleteVBStockMinBeforeDeleteAfterDeleteVBStockMinAfterDeleteOnDeleteErrorVBStockMinDeleteErrorOnNewRecordVBStockMinNewRecordDatabaseNameVBStock	TableName
VBSTOCKMINLeft� Top�  TStringFieldVBStockMinVBSTRUDisplayLabelStruDisplayWidth	FieldNameVBSTRURequired	EditMask>LAA;0;_Size  TStringFieldVBStockMinVBCOLDisplayLabelColDisplayWidth	FieldNameVBCOLRequired	EditMask>aaa;0;_Size  TStringFieldVBStockMinVBFINDisplayLabelFinDisplayWidth	FieldNameVBFINRequired	EditMask>AA;0;_Size  TSmallintFieldVBStockMinVBWIDTHDisplayLabelWidthDisplayWidth	FieldNameVBWIDTHRequired	  TStringFieldVBStockMinSALEGROUPDisplayLabel
Sale Group	FieldName	SALEGROUPRequired	EditMask>Laaaaa;0;_Size  TFloatFieldVBStockMinMINCALCMULTIPLIERDisplayLabelMin CalcDisplayWidth	FieldNameMINCALCMULTIPLIERDisplayFormat0.0  TFloatFieldVBStockMinMAKESTKMULTIPLIERDisplayLabelMake StkDisplayWidth	FieldNameMAKESTKMULTIPLIERDisplayFormat0.0  TIntegerFieldVBStockMinSTKMIN	FieldNameSTKMINRequired	Visible  TFloatFieldVBStockMinMINSALESORDERQTYDisplayLabelMin SOQ (m)	FieldNameMINSALESORDERQTY   TQuery	qryUpdateDatabaseNameVBStockLeft� Top�   TQueryqrySalesPerMonthDatabaseNameVBStock
DataSourceVBStockMinSourceSQL.Strings7select vbwidth,yearno,periodno,warptype,warpcol,vbstru,  vbcol,vbfin,9  sum(netlength) netlength,sum(pcsnetlength) pcsnetlengthfrom whsalespercustomerwhere vbstru=:vbstruand vbcol=:vbcoland vbfin=:vbfin9group by vbwidth,yearno,periodno,warptype,warpcol,vbstru,  vbcol,vbfin order by vbwidth,yearno,periodno Left<Top_	ParamDataDataTypeftStringNameVBSTRU	ParamType	ptUnknown DataTypeftStringNameVBCOL	ParamType	ptUnknown DataTypeftStringNameVBFIN	ParamType	ptUnknown   TIntegerFieldqrySalesPerMonthVBWIDTHDisplayLabelmmDisplayWidth	FieldNameVBWIDTHOriginWHSALESPERCUSTOMER.VBWIDTH  TIntegerFieldqrySalesPerMonthYEARNODisplayLabelYearDisplayWidth	FieldNameYEARNOOriginWHSALESPERCUSTOMER.YEARNO  TIntegerFieldqrySalesPerMonthPERIODNODisplayLabelMthDisplayWidth	FieldNamePERIODNOOriginWHSALESPERCUSTOMER.PERIODNO  TStringFieldqrySalesPerMonthWARPTYPEDisplayLabelWpDisplayWidth	FieldNameWARPTYPEOriginWHSALESPERCUSTOMER.WARPTYPESize  TStringFieldqrySalesPerMonthWARPCOLDisplayLabelWpColDisplayWidth	FieldNameWARPCOLOriginWHSALESPERCUSTOMER.WARPCOLSize  TStringFieldqrySalesPerMonthVBSTRUDisplayLabelStruDisplayWidth	FieldNameVBSTRUOriginWHSALESPERCUSTOMER.VBSTRUSize  TStringFieldqrySalesPerMonthVBCOLDisplayLabelColDisplayWidth	FieldNameVBCOLOriginWHSALESPERCUSTOMER.VBCOLSize  TStringFieldqrySalesPerMonthVBFINDisplayLabelFin	FieldNameVBFINOriginWHSALESPERCUSTOMER.VBFINSize  TIntegerFieldqrySalesPerMonthNETLENGTHDisplayLabelNetDisplayWidth	FieldName	NETLENGTHOriginWHSALESPERCUSTOMER.NETLENGTHDisplayFormat0  TFloatFieldqrySalesPerMonthPCSNETLENGTHDisplayLabelpcsDisplayWidth	FieldNamePCSNETLENGTHOriginWHSALESPERCUSTOMER.PCSNETLENGTHDisplayFormat0.0   TDataSourcedatSalesPerMonthDataSetqrySalesPerMonthLeft\Top_  TQueryqryVBMake_FinDatabaseNameVBStock
DataSourceVBStockMinSourceSQL.Strings(select avesale89,avesale127,avesale2070,3  (avesale89/23)+(avesale127/16)+avesale2070 fwconvfrom vbmake_finwhere vbstru=:vbstruand vbcol=:vbcoland vbfin=:vbfin LeftETop� 	ParamDataDataType	ftUnknownNamevbstru	ParamType	ptUnknown DataType	ftUnknownNamevbcol	ParamType	ptUnknown DataType	ftUnknownNamevbfin	ParamType	ptUnknown   TFloatFieldqryVBMake_FinAVESALE89	FieldName	AVESALE89OriginVBMAKE_FIN.AVESALE89DisplayFormat0  TFloatFieldqryVBMake_FinAVESALE127	FieldName
AVESALE127OriginVBMAKE_FIN.AVESALE127DisplayFormat0  TFloatFieldqryVBMake_FinAVESALE2070	FieldNameAVESALE2070OriginVBMAKE_FIN.AVESALE2070DisplayFormat0  TFloatFieldqryVBMake_FinFWCONV	FieldNameFWCONVDisplayFormat0   TDataSourcedatVBMake_FinDataSetqryVBMake_FinLefteTop�   TQueryqryGetVBTypeDatabaseNameVBStockSQL.Stringsselect *from vbtypeorder by vbstru,vbcol,vbfin LeftTopI TStringFieldqryGetVBTypeVBSTRU	FieldNameVBSTRUOriginVBSTOCK.VBTYPE.VBSTRU	FixedChar	Size  TStringFieldqryGetVBTypeVBCOL	FieldNameVBCOLOriginVBSTOCK.VBTYPE.VBCOL	FixedChar	Size  TStringFieldqryGetVBTypeLABELDESCR	FieldName
LABELDESCROriginVBSTOCK.VBTYPE.LABELDESCR	FixedChar	Size  TStringFieldqryGetVBTypeWARPCOL	FieldNameWARPCOLOriginVBSTOCK.VBTYPE.WARPCOL	FixedChar	Size  TStringFieldqryGetVBTypeWEFTSTRU	FieldNameWEFTSTRUOriginVBSTOCK.VBTYPE.WEFTSTRU	FixedChar	Size  TStringFieldqryGetVBTypeWEFTTWIST	FieldName	WEFTTWISTOriginVBSTOCK.VBTYPE.WEFTTWIST	FixedChar	Size  TStringFieldqryGetVBTypeWEFTCOL	FieldNameWEFTCOLOriginVBSTOCK.VBTYPE.WEFTCOL	FixedChar	Size  TStringFieldqryGetVBTypeWARPTYPE	FieldNameWARPTYPEOriginVBSTOCK.VBTYPE.WARPTYPE	FixedChar	Size  TDateTimeFieldqryGetVBTypeDATEENT	FieldNameDATEENTOriginVBSTOCK.VBTYPE.DATEENT  TStringFieldqryGetVBTypeUSERENT	FieldNameUSERENTOriginVBSTOCK.VBTYPE.USERENT	FixedChar	Size  TDateTimeFieldqryGetVBTypeDATEMOD	FieldNameDATEMODOriginVBSTOCK.VBTYPE.DATEMOD  TStringFieldqryGetVBTypeUSERMOD	FieldNameUSERMODOriginVBSTOCK.VBTYPE.USERMOD	FixedChar	Size  TStringFieldqryGetVBTypeVBFIN	FieldNameVBFINOriginVBSTOCK.VBTYPE.VBFIN	FixedChar	Size  TStringFieldqryGetVBTypeEXTPRODREF	FieldName
EXTPRODREFOriginVBSTOCK.VBTYPE.EXTPRODREF	FixedChar	Size
  TIntegerFieldqryGetVBTypeFWONLY	FieldNameFWONLYOriginVBSTOCK.VBTYPE.FWONLY   TQueryqryInsertStockMinDatabaseNameVBStockSQL.Stringsinsert into VBSTOCKMINvalues2(:VBSTRU,:VBCOL,:VBWIDTH,0,:VBFIN,-1,0,'NORMAL',0) LeftXTopH	ParamDataDataTypeftStringNameVBSTRU	ParamType	ptUnknown DataTypeftStringNameVBCOL	ParamType	ptUnknown DataType	ftIntegerNameVBWIDTH	ParamType	ptUnknown DataTypeftStringNameVBFIN	ParamType	ptUnknown    TQueryqryCheckExistsInMinDatabaseNameVBStockSQL.Stringsselect *from vbstockminwhere vbstru=:vbstruand vbcol=:vbcoland vbfin=:vbfinand vbwidth=:vbwidth Left8TopH	ParamDataDataTypeftStringNameVBSTRU	ParamType	ptUnknown DataTypeftStringNameVBCOL	ParamType	ptUnknown DataTypeftStringNameVBFIN	ParamType	ptUnknown DataType	ftIntegerNameVBWIDTH	ParamType	ptUnknown   TStringFieldqryCheckExistsInMinVBSTRU	FieldNameVBSTRUOriginVBSTOCK.VBSTOCKMIN.VBSTRU	FixedChar	Size  TStringFieldqryCheckExistsInMinVBCOL	FieldNameVBCOLOriginVBSTOCK.VBSTOCKMIN.VBCOL	FixedChar	Size  TSmallintFieldqryCheckExistsInMinVBWIDTH	FieldNameVBWIDTHOriginVBSTOCK.VBSTOCKMIN.VBWIDTH  TIntegerFieldqryCheckExistsInMinSTKMIN	FieldNameSTKMINOriginVBSTOCK.VBSTOCKMIN.STKMIN  TStringFieldqryCheckExistsInMinVBFIN	FieldNameVBFINOriginVBSTOCK.VBSTOCKMIN.VBFIN	FixedChar	Size  TFloatField$qryCheckExistsInMinMINCALCMULTIPLIER	FieldNameMINCALCMULTIPLIEROrigin$VBSTOCK.VBSTOCKMIN.MINCALCMULTIPLIER  TFloatField$qryCheckExistsInMinMAKESTKMULTIPLIER	FieldNameMAKESTKMULTIPLIEROrigin$VBSTOCK.VBSTOCKMIN.MAKESTKMULTIPLIER  TStringFieldqryCheckExistsInMinSALEGROUP	FieldName	SALEGROUPOriginVBSTOCK.VBSTOCKMIN.SALEGROUP	FixedChar	Size  TFloatField#qryCheckExistsInMinMINSALESORDERQTY	FieldNameMINSALESORDERQTYOrigin#VBSTOCK.VBSTOCKMIN.MINSALESORDERQTY    