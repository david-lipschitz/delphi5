�
 TFRMTAXYEAREND 0�  TPF0TfrmTaxYearEndfrmTaxYearEndLeftTop� BorderIconsbiSystemMenu BorderStylebsSingleCaptionTax year endClientHeight7ClientWidth3Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel1LeftTopWidth/HeightCaptionNOTE:Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBoldfsUnderline 
ParentFont  TLabelLabel2LeftTop Width
HeightCaption8The tax year ends on the last day of February.  You must  TLabelLabel3LeftTop0WidthHeightCaption9have completed the last week in February's payroll BEFORE  TLabelLabel4LeftTop@Width� HeightCaption8you run this routine.  Once this routine is complete you  TLabelLabel5LeftTopPWidth� HeightCaption/can THEN run the first week in March's payroll.  TBevelBevel1LeftTophWidth!HeightiStylebsRaised  TLabelLabel6LeftPToppWidth� HeightCaptionTax year end routineFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.StylefsBoldfsUnderline 
ParentFont  TLabelLabel7LeftTop� Width� HeightCaption.1) You should print out latest discharge list.Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel8LeftTop� Width� HeightCaption#2) Print out current employee list.Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel9LeftTop� Width_HeightCaption3) Zero all tax totals.Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel10LeftTop� Width� HeightCaption#4) Print out another employee list.Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TSpeedButtonbtnContinueLeft(Top� WidthYHeight!CaptionContinue
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� UUUUUUUUUUUUUUUUUUUUUUUUUUU�UUUUUUYUUUUUUW�UUUUU��UUUUUUww�UUUUU��UUUUUUww�UUUUY��UUUUWwwUUUU���UUUUwww�UUW���UUUWwuww�UUyUY�UUUwuUWw�UUUUUY�UUUUUWwUUUUUU�UUUUUUw�UUUUUY�UUUUUUWw�UUUUUUyUUUUUUw�UUUUUW�UUUUUUWw�UUUUUUY�UUUUUUWwUUUUUUUUUUUUUUUU	NumGlyphsOnClickbtnContinueClick  TSpeedButton	btnCancelLeft� Top� WidthYHeight!CaptionCancel
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 33333333333���33339��33333�ww��339����3337w�w�33�3ps��33w�7?7�9�� 9�37ww3w�99�ps3�37�w7337��3��339�w�w�37�39�339�w�77�37�33ps39�w�37�7�3339�w�3w�7�33 	�9�w�3ws�s9�3 	�937?�wsw��9�3 ��37s�www33��ps9�33w?���s339����3337w37w33339��333337ww333	NumGlyphsOnClickbtnCancelClick  TBevelBevel2LeftTop Width!Height1  TLabelLabel11LeftTopWidthZHeightCaptionProgress StatusFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBoldfsUnderline 
ParentFont  TEditedtProgressLeftTopWidthHeightCtl3DEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclTealFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold ParentCtl3D
ParentFontReadOnly	TabOrder   TQueryqryUpdateTotalsDatabaseNameWages7SQL.Stringsupdate Employee  set TaxEarn = 0,        Pension = 0,        SickFD = 0,        ProvFD = 0,        UIFPay = 0,        Paye = 0,        WKSPay = 0,        TaxWeek = 0where dischargedate is null Left�   TQueryqryUpdateCompanyDatabaseNameWages7SQL.Stringsupdate companyset ataxyear=ataxyear+1,	  atxwk=1 Left�    