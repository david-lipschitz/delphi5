�
 TOUTPUTFORM 0  TPF0TOutputForm
OutputFormLeft� TopWidthqHeight�CaptionGreige OutputColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanel	ToolPanelLeft Top WidthiHeightAlignalTop
BevelOuterbvNoneTabOrder  TSpeedButtonPrintButtonLeft� TopWidthBHeightCaption&PrintFlat	
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�ss3330�� 33337��w33330  33337wws333	NumGlyphsOnClickPrintButtonClick  TSpeedButton
ExitButtonLeft"TopWidth?HeightCaptionE&xitFlat	
Glyph.Data
z  v  BMv      v   (                                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333 3333333�333333 p333333��33333 wp33333��?33330wwp33338�3??�33?wwp�3338�3?�333?wwp��338�3?8�33?w�p��338�???33?w�p��338�8?�?�3?wwp���38�3?333�?wwp���8�3?�?��?wwp��38�3?8?8??wwp��318�3�8�3�?ww��3318���8�3�?w���3318��38�3�?����338�����8�?����3338����333	NumGlyphsOnClickExitButtonClick  	TComboBox
GroupComboLeftTopWidthYHeightStylecsDropDownList
ItemHeightTabOrder Items.StringsBy DateBy Job   TDBNavigatorNavBtnsLefthTopWidthpHeight
DataSource	OutSourceVisibleButtonsnbFirstnbPriornbNextnbLast Flat	TabOrder   TDBGridDBGrid1Left TopWidthiHeight_AlignalClient
DataSource	OutSourceTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style   TQueryOutDateQueryOnCalcFieldsOutDateQueryCalcFieldsDatabaseNameWeavingSQL.Strings?select wj.enddate, wi.fabricstru, wi.fabriccol, sum(wi.weftpcs)from weavejob wj, weaveitem wiDwhere wj.scenariono = :scenariono and wj.scenariono = wi.scenariono    and wj.jobno = wi.jobno0group by wj.enddate, wi.fabricstru, wi.fabriccol Left� Top`	ParamDataDataType	ftIntegerName
scenariono	ParamType	ptUnknownValue   TDateTimeFieldOutDateQueryENDDATEDisplayLabelDateDisplayWidth	FieldNameENDDATEDisplayFormatdd mmm  TStringFieldOutDateQueryFABRICSTRUDisplayLabelStructDisplayWidth	FieldName
FABRICSTRUSize  TStringFieldOutDateQueryFABRICCOLDisplayLabelColourDisplayWidth	FieldName	FABRICCOLSize  TFloatFieldOutDateQuerySUMDisplayLabelPiecesDisplayWidth	FieldNameSUM  TIntegerFieldOutDateQueryFABRICLENDisplayLabelLengthDisplayWidth	FieldKindfkCalculated	FieldName	FABRICLEN
Calculated	   TDataSource	OutSourceDataSetOutDateQueryLeft� Top�   TQueryOutJobQueryOnCalcFieldsOutJobQueryCalcFieldsDatabaseNameWeavingSQL.StringsIselect wj.jobno, wj.enddate, wi.fabricstru, wi.fabriccol, sum(wi.weftpcs)from weavejob wj, weaveitem wiDwhere wj.scenariono = :scenariono and wj.scenariono = wi.scenariono    and wj.jobno = wi.jobno:group by wj.jobno, wj.enddate, wi.fabricstru, wi.fabriccol  Left� Top� 	ParamDataDataType	ftIntegerName
scenariono	ParamType	ptUnknownValue   TIntegerFieldOutJobQueryJOBNODisplayLabelJob NoDisplayWidth	FieldNameJOBNO  TDateTimeFieldOutJobQueryENDDATEDisplayLabelDateDisplayWidth	FieldNameENDDATEDisplayFormatdd mmm  TStringFieldOutJobQueryFABRICSTRUDisplayLabelStructDisplayWidth	FieldName
FABRICSTRUSize  TStringFieldOutJobQueryFABRICCOLDisplayLabelColourDisplayWidth	FieldName	FABRICCOLSize  TFloatFieldOutJobQuerySUMDisplayLabelPiecesDisplayWidth	FieldNameSUM  TIntegerFieldOutJobQueryFABRICLENDisplayLabelLengthDisplayWidth	FieldKindfkCalculated	FieldName	FABRICLEN
Calculated	   TTable	FabricLenDatabaseNameWeavingIndexFieldNamesFABRICSTRU;FABRICCOL	TableName
FABRICTYPELeft� Top�  TStringFieldFabricLenFABRICSTRU	FieldName
FABRICSTRURequired	Size  TStringFieldFabricLenFABRICCOL	FieldName	FABRICCOLRequired	Size  TIntegerFieldFabricLenPIECELEN	FieldNamePIECELENRequired	    