�
 TREQMTSFORM 0�-  TPF0TReqmtsForm
ReqmtsFormLeft� Top� WidthHeight�Caption
ReqmtsFormFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight 	TSplitter	Splitter1LeftTopWidthHeight�CursorcrHSplitAlignalRight  TPanel	ToolPanelLeft Top WidthHeightAlignalTop
BevelOuterbvNoneTabOrder  TSpeedButtonPrintButtonLeftxTopWidthBHeightCaption&PrintFlat	
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 0      ?��������������wwwwwww�������wwwwwww        ���������������wwwwwww�������wwwwwww�������wwwwww        wwwwwww30����337���?330� 337�wss330����337��?�330�  337�swws330���3337��73330��3337�ss3330�� 33337��w33330  33337wws333	NumGlyphsOnClickPrintButtonClick  TSpeedButton
ExitButtonLeft�TopWidth?HeightCaptionE&xitFlat	
Glyph.Data
z  v  BMv      v   (                                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333 3333333�333333 p333333��33333 wp33333��?33330wwp33338�3??�33?wwp�3338�3?�333?wwp��338�3?8�33?w�p��338�???33?w�p��338�8?�?�3?wwp���38�3?333�?wwp���8�3?�?��?wwp��38�3?8?8??wwp��318�3�8�3�?ww��3318���8�3�?w���3318��38�3�?����338�����8�?����3338����333	NumGlyphsOnClickExitButtonClick  	TCheckBox	LinkCheckLeft� TopWidth1HeightCaption&LinkTabOrder VisibleOnClickLinkCheckClick  TDBNavigatorNavBtnsLeft TopWidthpHeight
DataSource	ReqSourceVisibleButtonsnbFirstnbPriornbNextnbLast Flat	TabOrder  	TCheckBox	YarnCheckLeftPTopWidthaHeightCaptionBy &Yarn TypeTabOrderOnClick	ReqChange  	TCheckBoxJobCheckLeftTopWidthAHeightCaptionBy &JobEnabledTabOrderOnClick	ReqChange   TDBGridRegGridLeft TopWidthHeight�AlignalClient
DataSource	ReqSourceTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnEnterRegGridEnter  TDBGridStkGridLeft TopWidth� Height�AlignalRight
DataSource	StkSourceTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnEnterStkGridEnter  TDataSource	ReqSourceDataSetReqQueryLeft� Top�   TQueryReqDateQueryOnCalcFieldsReqQueryCalcFieldsDatabaseNameSpinningSQL.StringsPselect sj.startdate, si.struct, si.twist, si.color, sum(si.weight) as yarnweightfrom spinjob sj, spinitem siCwhere sj.scenariono = :ScenarioNo and si.scenariono = sj.scenariono4group by sj.startdate, si.struct, si.twist, si.color Params.Data
     
ScenarioNo      Left(Top�  TDateTimeFieldReqDateQuerySTARTDATEDisplayLabel
Start DateDisplayWidth	FieldName	STARTDATE  TStringFieldReqDateQuerySTRUCTDisplayLabelStruct	FieldNameSTRUCTSize  TStringFieldReqDateQueryTWISTDisplayLabelTwist	FieldNameTWISTSize  TStringFieldReqDateQueryCOLORDisplayLabelColour	FieldNameCOLORSize  TIntegerFieldReqDateQueryYARNWEIGHT	FieldName
YARNWEIGHTVisible  TFloatFieldReqDateQueryFIBREWEIGHTDisplayLabelWeightDisplayWidth	FieldNameFIBREWEIGHT
Calculated	   TQueryReqJobQueryOnCalcFieldsReqQueryCalcFieldsDatabaseNameSpinningSQL.StringsZselect sj.jobno, sj.startdate, si.struct, si.twist, si.color, sum(si.weight) as yarnweightfrom spinjob sj, spinitem siCwhere sj.scenariono = :ScenarioNo and si.scenariono = sj.scenariono>group by sj.jobno, sj.startdate, si.struct, si.twist, si.color Params.Data
     
ScenarioNo      Left(Top TIntegerFieldReqJobQueryJOBNODisplayLabelJob NoDisplayWidth	FieldNameJOBNO  TDateTimeFieldReqJobQuerySTARTDATEDisplayLabel
Start DateDisplayWidth	FieldName	STARTDATE  TStringFieldReqJobQuerySTRUCTDisplayLabelStruct	FieldNameSTRUCTSize  TStringFieldReqJobQueryTWISTDisplayLabelTwist	FieldNameTWISTSize  TStringFieldReqJobQueryCOLORDisplayLabelColour	FieldNameCOLORSize  TIntegerFieldReqJobQueryYARNWEIGHT	FieldName
YARNWEIGHTVisible  TFloatFieldReqJobQueryFIBREWEIGHTDisplayLabelWeightDisplayWidth	FieldNameFIBREWEIGHT
Calculated	   TQueryFibreStkQueryDatabaseNameStockSQL.Strings>select ynstru, yntwist, yncol, lotno1||'/'||lotno2, sum(ynnet)from vbyarnrcptwhere batref = 0/group by ynstru, yntwist, yncol, lotno1, lotno2/order by ynstru, yntwist, yncol, lotno1, lotno2 Left(Top TStringFieldFibreStkQueryYNSTRUDisplayLabelStruDisplayWidth	FieldNameYNSTRUSize  TStringFieldFibreStkQueryYNTWISTDisplayLabelTw	FieldNameYNTWISTSize  TStringFieldFibreStkQueryYNCOLDisplayLabelColDisplayWidth	FieldNameYNCOLSize  TStringFieldFibreStkQueryCOLUMN4DisplayLabelLot NoDisplayWidth	FieldNameCOLUMN4Size  TFloatFieldFibreStkQuerySUMDisplayLabelStk (Kg)DisplayWidth	FieldNameSUMDisplayFormat0.0   TDataSource	StkSourceLeftHTop  TQueryAcrylicReqQueryDatabaseNameStockSQL.Stringsselect sum(rmperkg) acrylreqfrom ynstruwbsrmwhere ynstru=:ynstruand yntwist=:yntwistAand (ctrlacct='ACRWIP' or ctrlacct='ACRDOP' or ctrlacct='COTTON') Params.Data
&     ynstru  B090  yntwist  1  Left`Topi TFloatFieldAcrylicReqQueryACRYLREQ	FieldNameACRYLREQDisplayFormat0.000   TQueryTotalEndsQueryDatabaseNameStockSQL.Stringsselect sum(numends)from yncolwbswhere yncol=:yncol Params.Data
     YNCOL  BU9  Left� Topi TIntegerFieldTotalEndsQuerySUM	FieldNameSUM   TQueryYnColWBSQueryDatabaseNameStockSQL.Stringsselect fibre,numendsfrom yncolwbswhere yncol=:yncol Params.Data
     yncol  BU9  Left� Topi TStringFieldYnColWBSQueryFIBRE	FieldNameFIBRESize  TSmallintFieldYnColWBSQueryNUMENDS	FieldNameNUMENDS   TQueryReqQueryOnCalcFieldsReqQueryCalcFieldsDatabaseNameSpinningSQL.Stringsselect sj.startdate, yc.fibre,2  sum(si.weight) * sum(ys.rmperkg) * yc.numends / >    (select sum(numends) from yncolwbs where yncol = si.color)  as fibreweight9from spinjob sj, spinitem si, yncolwbs yc, ynstruwbsrm ysCwhere sj.scenariono = :ScenarioNo and si.scenariono = sj.scenariono  and si.color = yc.yncol5  and si.struct = ys.ynstru and si.twist = ys.yntwist1  and ys.ctrlacct in ("ACRWIP","ACRDOP","COTTON")group by sj.startdate, yc.fibre Params.Data
     
ScenarioNo    Left(Top�   TQueryQuery1DatabaseNameSpinningSQL.Stringsselect sj.startdate, yc.fibre,#  (sum(si.weight) * sum(ys.rmperkg);    * (select numends from yncolwbs where fibre = yc.fibre)@    / (select sum(numends) from yncolwbs where yncol = si.color)  ) as fibrewgt9from spinjob sj, spinitem si, yncolwbs yc, ynstruwbsrm ysCwhere sj.scenariono = :ScenarioNo and si.scenariono = sj.scenariono  and si.color = yc.yncol5  and si.struct = ys.ynstru and si.twist = ys.yntwist1  and ys.ctrlacct in ("ACRWIP","ACRDOP","COTTON")group by sj.startdate, yc.fibre Params.Data
     
ScenarioNo    LeftPTop  TQueryOldFibreReqQueryOnCalcFieldsReqQueryCalcFieldsDatabaseNameSpinningSQL.Strings;select sj.startdate, yc.fibre, sum(si.weight) as yarnweight)from spinjob sj, spinitem si, yncolwbs ycCwhere sj.scenariono = :ScenarioNo and si.scenariono = sj.scenariono   and si.color = yc.yncolgroup by sj.startdate, yc.fibre Params.Data
     
ScenarioNo      LeftxTop0 TDateTimeFieldOldFibreReqQuerySTARTDATEDisplayLabelDateDisplayWidth	FieldName	STARTDATE  TStringFieldOldFibreReqQueryFIBREDisplayLabelFibre	FieldNameFIBRESize  TIntegerFieldOldFibreReqQueryYARNWEIGHT	FieldName
YARNWEIGHTVisible  TFloatFieldOldFibreReqQueryFIBREWEIGHTDisplayLabelWgtDisplayWidth	FieldNameFIBREWEIGHT
Calculated	   TQueryOldYarnReqQueryOnCalcFieldsReqQueryCalcFieldsDatabaseNameSpinningSQL.StringsZselect sj.startdate, yc.fibre, si.struct, si.twist, si.color, sum(si.weight) as yarnweight)from spinjob sj, spinitem si, yncolwbs ycCwhere sj.scenariono = :ScenarioNo and si.scenariono = sj.scenariono   and si.color = yc.yncol>group by sj.startdate, yc.fibre, si.struct, si.twist, si.color Params.Data
     
ScenarioNo      LeftxTopP TDateTimeFieldOldYarnReqQuerySTARTDATEDisplayLabelDateDisplayWidth	FieldName	STARTDATE  TStringFieldOldYarnReqQueryFIBREDisplayLabelFibre	FieldNameFIBRESize  TStringFieldOldYarnReqQuerySTRUCTDisplayLabelStru	FieldNameSTRUCTSize  TStringFieldOldYarnReqQueryTWISTDisplayLabelTw	FieldNameTWISTSize  TStringFieldOldYarnReqQueryCOLORDisplayLabelCol	FieldNameCOLORSize  TIntegerFieldOldYarnReqQueryYARNWEIGHT	FieldName
YARNWEIGHTVisible  TFloatFieldOldYarnReqQueryFIBREWEIGHTDisplayLabelWgtDisplayWidth	FieldNameFIBREWEIGHT
Calculated	   TQueryFibreReqQueryOnCalcFieldsReqQueryCalcFieldsDatabaseNameSpinningSQL.Strings*select sj.startdate, yc.fibre, yc.numends,;  sum(si.weight) as yarnwgt, sum(ys.rmperkg) as totrmperkg,G  (select sum(numends) from yncolwbs where yncol = si.color) as totends9from spinjob sj, spinitem si, yncolwbs yc, ynstruwbsrm ysCwhere sj.scenariono = :ScenarioNo and si.scenariono = sj.scenariono  and si.color = yc.yncol5  and si.struct = ys.ynstru and si.twist = ys.yntwist1  and ys.ctrlacct in ("ACRWIP","ACRDOP","COTTON")+group by sj.startdate, yc.fibre, yc.numends Params.Data
     
ScenarioNo      Left� Top�  TDateTimeFieldFibreReqQuerySTARTDATEDisplayLabelDateDisplayWidth	FieldName	STARTDATE  TStringFieldFibreReqQueryFIBREDisplayLabelFibreDisplayWidth	FieldNameFIBRESize  TSmallintFieldFibreReqQueryNUMENDS	FieldNameNUMENDSVisible  TIntegerFieldFibreReqQueryYARNWGT	FieldNameYARNWGTVisible  TFloatFieldFibreReqQueryTOTRMPERKG	FieldName
TOTRMPERKGVisible  TIntegerFieldFibreReqQueryTOTENDS	FieldNameTOTENDSVisible  TFloatFieldFibreReqQueryFIBREWGTDisplayLabelWgtDisplayWidth	FieldNameFIBREWGT
Calculated	   TQueryYarnReqQueryOnCalcFieldsReqQueryCalcFieldsDatabaseNameSpinningSQL.StringsIselect sj.startdate, yc.fibre, si.struct, si.twist, si.color, yc.numends,;  sum(si.weight) as yarnwgt, sum(ys.rmperkg) as totrmperkg,G  (select sum(numends) from yncolwbs where yncol = si.color) as totends9from spinjob sj, spinitem si, yncolwbs yc, ynstruwbsrm ysCwhere sj.scenariono = :ScenarioNo and si.scenariono = sj.scenariono  and si.color = yc.yncol5  and si.struct = ys.ynstru and si.twist = ys.yntwist1  and ys.ctrlacct in ("ACRWIP","ACRDOP","COTTON")Jgroup by sj.startdate, yc.fibre, yc.numends, si.struct, si.twist, si.color  Params.Data
     
ScenarioNo      Left� Top�  TDateTimeFieldYarnReqQuerySTARTDATEDisplayLabelDateDisplayWidth	FieldName	STARTDATE  TStringFieldYarnReqQueryFIBREDisplayLabelFibreDisplayWidth	FieldNameFIBRESize  TStringFieldYarnReqQuerySTRUCTDisplayLabelStruDisplayWidth	FieldNameSTRUCTSize  TStringFieldYarnReqQueryTWISTDisplayLabelTwDisplayWidth	FieldNameTWISTSize  TStringFieldYarnReqQueryCOLORDisplayLabelColDisplayWidth	FieldNameCOLORSize  TSmallintFieldYarnReqQueryNUMENDS	FieldNameNUMENDSVisible  TIntegerFieldYarnReqQueryYARNWGT	FieldNameYARNWGTVisible  TFloatFieldYarnReqQueryTOTRMPERKG	FieldName
TOTRMPERKGVisible  TIntegerFieldYarnReqQueryTOTENDS	FieldNameTOTENDSVisible  TFloatFieldYarnReqQueryFIBREWGTDisplayLabelWgtDisplayWidth	FieldNameFIBREWGT
Calculated	    