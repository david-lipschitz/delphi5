�
 TVBSTRUFORM 0Y  TPF0TVBStruForm
VBStruFormLeft�TopzWidth� Height#Caption
VBStruFormColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PixelsPerInch`
TextHeight TLabelLabel1Left� TopxWidth3HeightCaption&Price Type  TLabelLabel2LeftTopWidth)HeightCaption&VB Type  TLabelLabel3Left� TopWidthHeightCaption&Width  TLabelLabel4Left� TopGWidth HeightCaption&Quality  TDBGridDBGrid1LeftTopWidth� Height� 
DataSource	srcVBTypeTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style   TDBLookupComboBoxDBLookupComboBox1Left� Top� WidthQHeight	DataField	PRICETYPE
DataSourcesrcVBLSPDropDownWidth� KeyField	PRICETYPE	ListFieldPRICETYPE;DESCR
ListSourcesrcPriceTypeTabOrder  TDBLookupComboBoxDBLookupComboBox2Left� Top(WidthQHeight	DataFieldVBWIDTH
DataSourcesrcVBLSPKeyFieldMETRICWIDTH	ListFieldMETRICWIDTH
ListSource
srcVBWidthTabOrder  TDBLookupComboBoxDBLookupComboBox3Left� TopXWidthQHeight	DataFieldQLTY
DataSource	srcVBQltyKeyFieldQLTY	ListField
QLTY;DESCR
ListSource	srcVBQltyTabOrder  TBitBtnBitBtn1LeftPTop� WidthKHeightTabOrderKindbkOK  TBitBtnBitBtn2Left� Top� WidthKHeightTabOrderKindbkCancel  TQuery
VBLSPQueryDatabaseNameStockRequestLive	SQL.Strings	select * 
from vblspAwhere vbstru = :vbstru and vbfin = :vbfin and vbwidth = :vbwidth /    and qlty = :qlty and pricetype = :pricetype LeftTop@	ParamDataDataTypeftStringNamevbstru	ParamType	ptUnknown DataTypeftStringNamevbfin	ParamType	ptUnknown DataType	ftIntegerNamevbwidth	ParamType	ptUnknown DataTypeftStringNameqlty	ParamType	ptUnknown DataTypeftStringName	pricetype	ParamType	ptUnknown    TTableVBTypeDatabaseNameStockIndexFieldNamesVBSTRU;VBCOL;VBFIN	TableNameVBTYPELeftTop` TStringFieldVBTypeVBSTRUDisplayLabelStructDisplayWidth	FieldNameVBSTRURequired	Size  TStringFieldVBTypeVBCOLDisplayLabelColour	FieldNameVBCOLRequired	Size  TStringFieldVBTypeVBFINDisplayLabelFinish	FieldNameVBFINRequired	Size   TDataSource	srcVBTypeDataSetVBTypeLeft(Top`  TTable	PriceTypeDatabaseNameStock	TableName	PRICETYPELeftTop�  TStringFieldPriceTypePRICETYPE	FieldName	PRICETYPESize  TStringFieldPriceTypeDESCR	FieldNameDESCRSize
   TDataSourcesrcVBLSPDataSet
VBLSPQueryLeft(Top@  TTableVBWidthDatabaseNameStockIndexFieldNamesMETRICWIDTH	TableNameVBWIDTHLeftTop�  TSmallintFieldVBWidthMETRICWIDTH	FieldNameMETRICWIDTHRequired	   TDataSourcesrcPriceTypeDataSet	PriceTypeLeft(Top�   TTableVBQltyDatabaseNameStockIndexFieldNamesQLTY	TableNameVBQLTYLeftTop�  TStringField
VBQltyQLTY	FieldNameQLTYRequired	Size  TStringFieldVBQltyDESCR	FieldNameDESCRSize<   TDataSource
srcVBWidthDataSetVBWidthLeft(Top�   TDataSource	srcVBQltyDataSetVBQltyLeft(Top�    