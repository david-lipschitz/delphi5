�
 TVBYARNLOTFORM 0S  TPF0TVBYarnLotFormVBYarnLotFormLeft� ToptWidth�HeightVActiveControlDBGrid1CaptionVB System Yarn Lot No ReferenceFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterShowHint	OnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel1Left Top Width�Height)AlignalTopTabOrder  TSpeedButtonPrintSpdBtnLeft|TopWidthHeightHintPrint this form
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�ss3330�� 33337��w33330  33337wws333	NumGlyphsParentShowHintShowHint	OnClickPrintSpdBtnClick  TLabelLabel1Left� TopWidth HeightCaptionLot No  TDBNavigatorDBNavigatorLeftTopWidth� Height
DataSourceYarnLotNoSourceVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbEditnbPostnbCancel Ctl3DParentCtl3DTabOrder   TBitBtnCloseBitBtnLeft4TopWidthAHeightCaption&CloseModalResultTabOrderOnClickCloseBitBtnClick
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 8����w���������33?  DD@���DD������3��  33MP��33�����38��  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33DDDDD3333������?  33333333333�����3?  333   333333?���3?  333
��333333����3?  333   333333����3?  	NumGlyphs  TEdit	EditLotNoLeft� TopWidthAHeightTabOrderOnChangeEditLotNoChange   TPanelPanel2Left Top)Width�HeightAlignalClient
BevelInner	bvLoweredBorderWidthCaptionPanel2TabOrder TDBGridDBGrid1LeftTopWidth�HeightAlignalClientBorderStylebsNone
DataSourceYarnLotNoSourceTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    TDataSourceYarnLotNoSourceDataSet	YarnLotNoLeft� TopI  TTable	YarnLotNoBeforeInsertYarnLotNoBeforeInsert
BeforeEditYarnLotNoBeforeEdit
BeforePostYarnLotNoBeforePost	AfterPostYarnLotNoAfterPostAfterCancelYarnLotNoAfterCancelBeforeDeleteYarnLotNoBeforeDeleteAfterDeleteYarnLotNoAfterDeleteOnDeleteErrorYarnLotNoDeleteErrorOnNewRecordYarnLotNoNewRecordDatabaseNameVBStock	TableName	YARNLOTNOLeft� TopI TIntegerFieldYarnLotNoLOTNO1DisplayLabelLotNo1DisplayWidth	FieldNameLOTNO1Required	  TSmallintFieldYarnLotNoLOTNO2DisplayLabelLotNoDisplayWidth	FieldNameLOTNO2Required	  TStringFieldYarnLotNoYNCOLDisplayLabelYn ColDisplayWidth	FieldNameYNCOLRequired	EditMask>Aaa;0;_Size  TDateTimeFieldYarnLotNoDATEMANUDisplayLabel	Date Manu	FieldNameDATEMANUDisplayFormat
dd/mm/yyyy  TDateTimeFieldYarnLotNoDATERCVDDisplayLabel	Date Rcvd	FieldNameDATERCVDReadOnly	DisplayFormat
dd/mm/yyyy  TStringFieldYarnLotNoRCVDBYDisplayLabelRcvd ByDisplayWidth	FieldNameRCVDBYReadOnly	Required	EditMask	>Llll;0;_Size   TQueryqryCheckExistsDatabaseNameVBStockSQL.Stringsselect yncolfrom yarnlotnowhere lotno1=:lotno1and yncol<>:yncol Params.Data
#     lotno1        yncol  0   Left� TopI TStringFieldqryCheckExistsYNCOL	FieldNameYNCOLSize    