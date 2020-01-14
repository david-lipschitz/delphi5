unit invrpt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, Qrctrls, ExtCtrls, DBTables, Db;

type
  TfrmInvoiceR = class(TForm)
    qrpInvoice: TQuickRep;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRDBText3: TQRDBText;
    QRShape3: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape4: TQRShape;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRShape7: TQRShape;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    qrlQtyM: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    qrlPricePerMetre: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    qrdnetlength: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    qrdpriceperm: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    qryVBInvHdr: TQuery;
    qryVBInvDet: TQuery;
    qryVBInvDetDESPNO: TIntegerField;
    qryVBInvDetINVNO: TIntegerField;
    qryVBInvDetLINENO: TIntegerField;
    qryVBInvDetVBSTRU: TStringField;
    qryVBInvDetVBFIN: TStringField;
    qryVBInvDetMETRICWIDTH: TIntegerField;
    qryVBInvDetIMPERIALWIDTH: TFloatField;
    qryVBInvDetQLTY: TStringField;
    qryVBInvDetVBSTRUDESCR: TStringField;
    qryVBInvDetLABELDESCR: TStringField;
    qryVBInvDetCUSTPARTSTYLEDESCR: TStringField;
    qryVBInvDetCUSTPARTDESCR: TStringField;
    qryVBInvDetVTORDNO: TIntegerField;
    qryVBInvDetGROSSLENGTHMETRES: TFloatField;
    qryVBInvDetNETLENGTHMETRES: TFloatField;
    qryVBInvDetNETLENGTHYARDS: TFloatField;
    qryVBInvDetPRICETYPE: TStringField;
    qryVBInvDetLOC_VALUE: TFloatField;
    qryVBInvDetBOXES: TIntegerField;
    qryVBInvDetLOC_FREIGHT: TFloatField;
    qryVBInvDetTARIFFGROUP: TStringField;
    qryVBInvDetCUSTORDNO: TStringField;
    qryVBInvDetLOC_PRICE: TFloatField;
    qryVBInvDetOVERRIDE_LOC_PRICE: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInvoiceR: TfrmInvoiceR;

implementation

{$R *.DFM}

uses Main;

end.
