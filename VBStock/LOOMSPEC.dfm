�
 TLOOMSPECFORM 0�  TPF0TLoomSpecFormLoomSpecFormLeft� TopxWidthIHeightVActiveControlPanel1CaptionLoom SpecificationsFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel1Left Top WidthAHeight)AlignalTopTabOrder  TDBNavigatorDBNavigatorLeftTopWidth� Height
DataSourceLoomSpecSourceVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbEditnbPostnbCancel Ctl3DParentCtl3DTabOrder   TBitBtnCloseBitBtnLeft� TopWidthAHeightTabOrderOnClickCloseBitBtnClickKindbkClose   TPanelPanel2Left Top)WidthAHeight� AlignalTop
BevelInner	bvLoweredBorderWidthCaptionPanel2TabOrder TDBGridDBGrid1LeftTopWidth5Height� AlignalClientBorderStylebsNone
DataSourceLoomSpecSourceTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    TPanelPanel3Left Top� WidthAHeightSAlignalBottom
BevelInner	bvLoweredBorderWidthTabOrder TLabelLabel1Left
TopWidth;HeightCaptionType Details  TLabelLabel2Left
Top WidthHeightCaptionName  TLabelLabel3Left
Top8WidthHeightCaptionShed  TLabelLabel4Left� Top Width5HeightCaption
Width (mm)  TLabelLabel5Left� Top8Width:HeightCaptionMax Colours  TSpeedButtonPrintSpdBtnLeft Top	WidthHeightHintPrint this form
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�ss3330�� 33337��w33330  33337wws333	NumGlyphsParentShowHintShowHint	OnClickPrintSpdBtnClick  TDBEditEditNameLeft,TopWidthFHeightColorclSilver	DataFieldNAME
DataSourceLoomTypeSourceReadOnly	TabOrder   TDBEditEditShedLeft,Top4WidthFHeightColorclSilver	DataFieldSHED
DataSourceLoomTypeSourceReadOnly	TabOrder  TDBEdit	EditWidthLeft� TopWidthFHeightColorclSilver	DataFieldWIDTH
DataSourceLoomTypeSourceReadOnly	TabOrder  TDBEdit
EditMaxColLeft� Top4WidthFHeightColorclSilver	DataFieldMAXCOL
DataSourceLoomTypeSourceReadOnly	TabOrder   TDataSourceLoomSpecSourceDataSetLoomSpecLeft� Top]  TQueryLoomTypeQueryDatabaseNameVBStock
DataSourceLoomSpecSourceSQL.StringsSelect  LOOMTYPE.NAME,  LOOMTYPE.SHED,  LOOMTYPE.WIDTH,  LOOMTYPE.MAXCOLFrom LOOMTYPEwhere loomtype=:loomtype Params.Data
     loomtype     Left� Top} TStringFieldLoomTypeQueryNAME	FieldNameNAMESize  TStringFieldLoomTypeQuerySHED	FieldNameSHEDSize  TIntegerFieldLoomTypeQueryWIDTH	FieldNameWIDTH  TSmallintFieldLoomTypeQueryMAXCOL	FieldNameMAXCOL   TDataSourceLoomTypeSourceDataSetLoomTypeQueryLeft� Top}  TTableLoomSpecBeforeInsertLoomSpecBeforeInsert
BeforeEditLoomSpecBeforeEdit	AfterPostLoomSpecAfterPostAfterCancelLoomSpecAfterCancelBeforeDeleteLoomSpecBeforeDeleteAfterDeleteLoomSpecAfterDeleteOnDeleteErrorLoomSpecDeleteErrorOnNewRecordLoomSpecNewRecordDatabaseNameVBStock	TableNameLOOMSPECLeft� TopY TStringFieldLoomSpecLOOMREFDisplayLabelRefDisplayWidth	FieldNameLOOMREFRequired	EditMask>Laaaaaa;0;_Size  TSmallintFieldLoomSpecLOOMPOSNDisplayLabelPosnDisplayWidth	FieldNameLOOMPOSNRequired	  TStringFieldLoomSpecLOOMTYPEDisplayLabelTypeDisplayWidth	FieldNameLOOMTYPERequired	EditMask>L;0;_Size  TSmallintFieldLoomSpecLASTSEQNODisplayLabel	LastSeqNo	FieldName	LASTSEQNOReadOnly	  TStringFieldLoomSpecLOMDOWNCHKDisplayLabel
LomDownChk	FieldName
LOMDOWNCHKReadOnly	Size    