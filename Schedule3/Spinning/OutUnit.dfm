�
 TOUTPUTFORM 0�  TPF0TOutputForm
OutputFormLeft� Top.Width,Height�CaptionGreige OutputFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanel	ToolPanelLeft Top Width$Height7AlignalTop
BevelOuterbvNoneTabOrder  TSpeedButtonPrintButtonLeft� TopWidthBHeightCaption&PrintFlat	
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�ss3330�� 33337��w33330  33337wws333	NumGlyphsOnClickPrintButtonClick  TSpeedButton
ExitButtonLeft� TopWidthBHeightCaptionE&xitFlat	
Glyph.Data
z  v  BMv      v   (                                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333 3333333�333333 p333333��33333 wp33333��?33330wwp33338�3??�33?wwp�3338�3?�333?wwp��338�3?8�33?w�p��338�???33?w�p��338�8?�?�3?wwp���38�3?333�?wwp���8�3?�?��?wwp��38�3?8?8??wwp��318�3�8�3�?ww��3318���8�3�?w���3318��38�3�?����338�����8�?����3338����333	NumGlyphsOnClickExitButtonClick  	TComboBox
GroupComboLeftTopWidthgHeightStylecsDropDownList
ItemHeightItems.StringsBy DateBy Job TabOrder OnChangeComboChange  TDBNavigatorNavBtnsLeftlTopWidthpHeight
DataSource	OutSourceVisibleButtonsnbFirstnbPriornbNextnbLast Flat	TabOrder  TODPopupCalendarRangeCalendarLeftTopWidth� Height
DateFormatddd, d mmmm	Seperator - PopupCaptionSelect Date RangeDisplayYear�DisplayMonth
TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style StartFont.CharsetDEFAULT_CHARSETStartFont.ColorclWindowTextStartFont.Height�StartFont.NameMS Sans SerifStartFont.Style FinishFont.CharsetDEFAULT_CHARSETFinishFont.ColorclWindowTextFinishFont.Height�FinishFont.NameMS Sans SerifFinishFont.Style DateFont.CharsetDEFAULT_CHARSETDateFont.ColorclWindowTextDateFont.Height�DateFont.NameMS Sans SerifDateFont.Style MonthNames.JanJanuaryMonthNames.FebFebruaryMonthNames.MarMarchMonthNames.AprAprilMonthNames.MayMayMonthNames.JunJuneMonthNames.JulJulyMonthNames.AugAugustMonthNames.Sep	SeptemberMonthNames.OctOctoberMonthNames.NovNovemberMonthNames.DecDecemberHeaders.WeekWkHeaders.SundaySunHeaders.MondayMonHeaders.TuesdayTueHeaders.WednesdayWedHeaders.ThursdayThuHeaders.FridayFriHeaders.SaturdaySat	BevelEdge	bvLoweredPlain	ShowCurrentShowYearBtnsPrevMonthGlyph.Data
�   �   BM�       v   (               h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwp wwwwwp wwpwwp wwwwp wpf  p wfffp pffffp wfffp wpf  p wwwwp wwpwwp wwwwwp wwwwwwp NextMonthGlyph.Data
�   �   BM�       v   (               h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwp wwwwwp www wwp wwwwp w  `wp wfffp wfff`p wfffp w  `wp wwwwp www wwp wwwwwp wwwwwwp 
TimeFormathh:mmColorclWindowTabOrderOnChangeComboChange   TDBGridDBGrid1Left Top7Width$HeightEAlignalClient
DataSource	OutSourceTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style   TQueryOutDateQueryOnCalcFieldsOutDateQueryCalcFieldsDatabaseNameSpinningSQL.StringsQselect sj.finishdate, si.struct, si.twist, si.color, sum(si.weight) as yarnweightfrom spinjob sj, spinitem siDwhere sj.scenariono = :ScenarioNo and sj.scenariono = si.scenariono    and sj.jobno = si.jobnoC   and sj.finishdate >= :StartDate and sj.finishdate <= :FinishDate5group by sj.finishdate, si.struct, si.twist, si.color Params.Data
B     
ScenarioNo      	StartDate 	 Z�
   
FinishDate 	 Z�
   Left� Toph TDateTimeFieldOutDateQueryFINISHDATEDisplayLabelDateDisplayWidth	FieldName
FINISHDATE  TStringFieldOutDateQuerySTRUCTDisplayLabelStruDisplayWidth	FieldNameSTRUCTSize  TStringFieldOutDateQueryTWISTDisplayLabelTwDisplayWidth	FieldNameTWISTSize  TStringFieldOutDateQueryCOLORDisplayLabelColDisplayWidth	FieldNameCOLORSize  TIntegerFieldOutDateQueryYARNWEIGHTDisplayLabelWgtDisplayWidth	FieldName
YARNWEIGHT   TDataSource	OutSourceDataSetOutDateQueryLeft� Top�   TQueryOutJobQueryOnCalcFieldsOutJobQueryCalcFieldsDatabaseNameSpinningSQL.Strings[select sj.jobno, sj.finishdate, si.struct, si.twist, si.color, sum(si.weight) as yarnweightfrom spinjob sj, spinitem siDwhere sj.scenariono = :ScenarioNo and sj.scenariono = si.scenariono    and sj.jobno = si.jobnoC   and sj.finishdate >= :StartDate and sj.finishdate <= :FinishDate?group by sj.jobno, sj.finishdate, si.struct, si.twist, si.color  Params.Data
B     
ScenarioNo      	StartDate 	 Z�
   
FinishDate 	 Z�
   Left� Top�  TIntegerFieldOutJobQueryJOBNODisplayLabelJobDisplayWidth	FieldNameJOBNO  TDateTimeFieldOutJobQueryFINISHDATEDisplayLabelDateDisplayWidth	FieldName
FINISHDATE  TStringFieldOutJobQuerySTRUCTDisplayLabelStruDisplayWidth	FieldNameSTRUCTSize  TStringFieldOutJobQueryTWISTDisplayLabelTwDisplayWidth	FieldNameTWISTSize  TStringFieldOutJobQueryCOLORDisplayLabelColDisplayWidth	FieldNameCOLORSize  TIntegerFieldOutJobQueryYARNWEIGHTDisplayLabelWgtDisplayWidth	FieldName
YARNWEIGHT   TQuery	DateQueryDatabaseNameSpinningSQL.Strings'select min(finishdate), max(finishdate)from spinjobwhere scenariono = :scenariono Params.Data
     
scenariono        LeftPTop�  TDateTimeFieldDateQueryMIN	FieldNameMIN  TDateTimeFieldDateQueryMAX	FieldNameMAX    