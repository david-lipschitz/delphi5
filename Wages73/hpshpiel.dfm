�
 TFRMHPSHPIEL 0S  TPF0TfrmHPShpielfrmHPShpielLeft� ToplWidth�Height�CaptionHoliday Pay RoutineColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel1LeftTopWidth/HeightCaptionNOTE:Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBoldfsUnderline 
ParentFont  TSpeedButtonbtnContinueLeft Top`WidthYHeight!CaptionYes
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� UUUUUUUUUUUUUUUUUUUUUUUUUUU�UUUUUUYUUUUUUW�UUUUU��UUUUUUww�UUUUU��UUUUUUww�UUUUY��UUUUWwwUUUU���UUUUwww�UUW���UUUWwuww�UUyUY�UUUwuUWw�UUUUUY�UUUUUWwUUUUUU�UUUUUUw�UUUUUY�UUUUUUWw�UUUUUUyUUUUUUw�UUUUUW�UUUUUUWw�UUUUUUY�UUUUUUWwUUUUUUUUUUUUUUUU	NumGlyphsOnClickbtnContinueClick  TSpeedButton	btnCancelLeft� Top`WidthYHeight!CaptionNo
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 33333333333���33339��33333�ww��339����3337w�w�33�3ps��33w�7?7�9�� 9�37ww3w�99�ps3�37�w7337��3��339�w�w�37�39�339�w�77�37�33ps39�w�37�7�3339�w�3w�7�33 	�9�w�3ws�s9�3 	�937?�wsw��9�3 ��37s�www33��ps9�33w?���s339����3337w37w33339��333337ww333	NumGlyphsOnClickbtnCancelClick  TLabelLabel2LeftTopHWidthHeightCaption7Do you wish to continue? (note: Total HPD=15+HPD above)  TLabelLabel4LeftTop� WidthsHeightCaptionHoliday Pay Days (HPD)FocusControlDBEdit2  TLabelLabel5Left� Top� WidthHHeightCaptionHoliday WeeksFocusControlDBEdit3  TLabelLabel6Left� Top� WidthEHeightCaptionService BonusFocusControlDBEdit4  TLabelLabel7LeftTop� WidthHeight'Caption�Please check the following Holiday Pay Constants.  If any of them are incorrect, please press NO below and Fix them in the Company / Parameter File.WordWrap	  TLabelLabel41LeftTopWidth[HeightCaption(per week per year)  TLabelLabel3LeftTopWidth� HeightCaption(Annual Bonus Minimum for Christmas Bonus  TMemoMemo1LeftTop Width!Height� BorderStylebsNoneColor	clBtnFaceLines.Strings!Wages Package Holiday Pay Routine<------------------------------------------------------------ 2This routine will allow you to pay your employee's,their holiday pay.  The payslip is formatted4differently from the normal weekly one since not all+the usual payments and deductions are made. 7This routine should be run AFTER the LAST normal weekly7wages run of the year and BEFORE the Financial Year EndRoutine. TabOrder   TDBEditDBEdit2LeftTop Width@HeightColor	cl3DLight	DataFieldHOLIDAYPAYDAYS
DataSource
datCompanyReadOnly	TabOrder  TDBEditDBEdit3Left� Top Width@HeightColor	cl3DLight	DataFieldHOLIDAYWEEKS
DataSource
datCompanyReadOnly	TabOrder  TDBEditDBEdit4Left� Top Width@HeightColor	cl3DLight	DataFieldSERVICEBONUS
DataSource
datCompanyReadOnly	TabOrder  TDBEditDBEdit1Left� TopWidth@HeightColor	cl3DLight	DataFieldANNUALBONMIN
DataSource
datCompanyReadOnly	TabOrder  TTable
tabCompanyDatabaseNameWages7	TableNameCOMPANYLeft� Top TIntegerFieldtabCompanyREF	FieldNameREFRequired	  TIntegerFieldtabCompanyWEEKSINYEAR	FieldNameWEEKSINYEAR  TIntegerFieldtabCompanyHOLIDAYPAYDAYS	FieldNameHOLIDAYPAYDAYS  TIntegerFieldtabCompanyHOLIDAYWEEKS	FieldNameHOLIDAYWEEKS  TFloatFieldtabCompanySERVICEBONUS	FieldNameSERVICEBONUSDisplayFormat0.00  TFloatFieldtabCompanyANNUALBONMIN	FieldNameANNUALBONMINDisplayFormat0.00   TDataSource
datCompanyDataSet
tabCompanyLeft� Top   