�
 TSTRULOOMFORM 0L  TPF0TStruLoomFormStruLoomFormLeft� TopzWidth}HeightVActiveControlPanel1Caption%VB Structure on Loom Type MaintenanceColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel1Left Top WidthuHeight)AlignalTopTabOrder  TSpeedButtonPrintSpdBtnLeftXTopWidthHeightHintPrint this form
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�ss3330�� 33337��w33330  33337wws333	NumGlyphsParentShowHintShowHint	OnClickPrintSpdBtnClick  TDBNavigatorDBNavigatorLeftTopWidth� Height
DataSourceStruLoomSourceVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbEditnbPostnbCancel Ctl3DParentCtl3DTabOrder   TBitBtnCloseBitBtnLeftTopWidthAHeightTabOrderOnClickCloseBitBtnClickKindbkClose   TPanelPanel2Left Top)WidthuHeight� AlignalTop
BevelInner	bvLoweredBorderWidthCaptionPanel2TabOrder TDBGridDBGrid1LeftTopWidthiHeight� AlignalClientBorderStylebsNone
DataSourceStruLoomSourceTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    TPanelPanel3Left Top� WidthuHeight[AlignalBottom
BevelInner	bvLoweredBorderWidthTabOrder TLabelLabel1LeftTopWidth_HeightCaptionVB Structure Details  TLabelLabel2Left� TopWidthUHeightCaptionLoomType Details  TLabelLabel3LeftTop$WidthHeightCaptionDescr  TLabelLabel4Left� Top$WidthHeightCaptionName  TLabelLabel5Left� Top<WidthHeightCaptionShed  TLabelLabel6LeftpTopWidth3HeightCaption
can run on  TDBEditEditVBDescrLeft0Top WidthPHeightColorclSilver	DataFieldDESCR
DataSourceVBStruSourceReadOnly	TabOrder   TDBEdit
EditLTNameLeft� Top WidthPHeightColorclSilver	DataFieldNAME
DataSourceLoomTypeSourceReadOnly	TabOrder  TDBEdit
EditLTShedLeft� Top8WidthPHeightColorclSilver	DataFieldSHED
DataSourceLoomTypeSourceReadOnly	TabOrder   TDataSourceStruLoomSourceDataSetStruLoomLeft� Topm  TQueryVBStruQueryDatabaseNameVBStock
DataSourceStruLoomSourceSQL.Stringsselect descrfrom vbstruwhere vbstru=:vbstru Left<Top� 	ParamDataDataTypeftStringNameVBSTRU	ParamType	ptUnknown    TQueryLoomTypeQueryDatabaseNameVBStock
DataSourceStruLoomSourceSQL.Stringsselect name,shed,width,maxcolfrom loomtypewhere loomtype=:loomtype Left� Top� 	ParamDataDataTypeftStringNameLOOMTYPE	ParamType	ptUnknown    TDataSourceVBStruSourceDataSetVBStruQueryLeftXTop�   TDataSourceLoomTypeSourceDataSetLoomTypeQueryLeft� Top�   TTableStruLoomBeforeInsertStruLoomBeforeInsert
BeforeEditStruLoomBeforeEdit	AfterPostStruLoomAfterPostAfterCancelStruLoomAfterCancelBeforeDeleteStruLoomBeforeDeleteAfterDeleteStruLoomAfterDeleteOnDeleteErrorStruLoomDeleteErrorDatabaseNameVBStock	TableNameSTRULOOMLeftxTopq TStringFieldStruLoomVBSTRUDisplayLabel	StructureDisplayWidth	FieldNameVBSTRURequired	EditMask>Laa;0;_Size  TStringFieldStruLoomLOOMTYPEDisplayLabel	Loom TypeDisplayWidth		FieldNameLOOMTYPERequired	EditMask>L;0;_Size  TSmallintFieldStruLoomPICSPERMINDisplayLabelPics Per Min	FieldName
PICSPERMIN  TSmallintFieldStruLoomLOOMEFFDisplayLabel
Loom Eff %	FieldNameLOOMEFF    