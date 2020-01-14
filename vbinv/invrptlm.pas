unit invrptlm;
//INVoiceRePorTLocalMetres

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, Qrctrls, ExtCtrls, DBTables, Db;

type
  TfrmInvoiceLM = class(TForm)
    qrpInvoiceM: TQuickRep;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
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
    qrdnetlength: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    qrdpriceperm: TQRDBText;
    qrdLoc_Value: TQRDBText;
    QRDBText40: TQRDBText;
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
    qryVBInvDetCUSTORDNO: TStringField;
    qryVBInvDetLOC_PRICE: TFloatField;
    qryVBInvDetOVERRIDE_LOC_PRICE: TFloatField;
    QRGroup1: TQRGroup;
    qrbGroupFooter: TQRBand;
    qrlQtyM: TQRLabel;
    QRShape9: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape13: TQRShape;
    qrlPricePerMetre: TQRLabel;
    QRShape14: TQRShape;
    QRLabel32: TQRLabel;
    QRShape15: TQRShape;
    QRLabel27: TQRLabel;
    qreTotalMetres: TQRExpr;
    qreLoc_ValueTotal: TQRExpr;
    qrlTotalToPay: TQRLabel;
    qryVBInvDetTARIFFGROUP: TIntegerField;
    qryVBInvHdrDESPNO: TIntegerField;
    qryVBInvHdrINVNO: TIntegerField;
    qryVBInvHdrCUSTREF: TStringField;
    qryVBInvHdrINVDATE: TDateTimeField;
    qryVBInvHdrTERMSFROMDATE: TDateTimeField;
    qryVBInvHdrTERMSDAYS: TIntegerField;
    qryVBInvHdrCURRENCY: TStringField;
    qryVBInvHdrAGENTREF: TStringField;
    qryVBInvHdrOURREF: TStringField;
    qryVBInvHdrYOURREF: TStringField;
    qryVBInvHdrEXPORTCODE: TStringField;
    qryVBInvHdrPALLETS: TIntegerField;
    qryVBInvHdrBOXES: TIntegerField;
    qryVBInvHdrNETLENGTH: TFloatField;
    qryVBInvHdrLOC_TOTAL: TFloatField;
    qryVBInvHdrACC_TOTAL: TFloatField;
    qryVBInvHdrPALLETPRICE: TFloatField;
    qryVBInvHdrPALLETVALUE: TFloatField;
    qryVBInvHdrFREIGHTDOCUMENTATION: TFloatField;
    qryVBInvHdrFREIGHTBOXES: TFloatField;
    qryVBInvHdrLOC_GRAND_TOTAL: TFloatField;
    qryVBInvHdrACC_GRAND_TOTAL: TFloatField;
    qryVBInvHdrVATRATE: TFloatField;
    qryVBInvHdrVATAMT: TFloatField;
    qryVBInvHdrEXCHRATE: TFloatField;
    qryVBInvHdrINVBY: TStringField;
    qryVBInvHdrINVSENT: TStringField;
    qryVBInvHdrPHYSICALPALLETS: TIntegerField;
    qryVBInvHdrMETRICORIMPERIAL: TStringField;
    qryVBInvHdrLOCALOVERSEAS: TStringField;
    qryVBInvHdrDESPNO_1: TIntegerField;
    qryVBInvHdrINVNO_1: TIntegerField;
    qryVBInvHdrSTREETADD1: TStringField;
    qryVBInvHdrSTREETADD2: TStringField;
    qryVBInvHdrSTREETADD3: TStringField;
    qryVBInvHdrSTREETADD4: TStringField;
    qryVBInvHdrSTREETADD5: TStringField;
    qryVBInvHdrPOSTALADD1: TStringField;
    qryVBInvHdrPOSTALADD2: TStringField;
    qryVBInvHdrPOSTALADD3: TStringField;
    qryVBInvHdrPOSTALADD4: TStringField;
    qryVBInvHdrPOSTALADD5: TStringField;
    qryVBInvHdrPLACELOAD: TStringField;
    qryVBInvHdrPLACEDISCHARGE: TStringField;
    qryVBInvHdrINCOTERMS: TStringField;
    qryVBInvHdrPLACEDESTLINE1: TStringField;
    qryVBInvHdrPLACEDESTLINE2: TStringField;
    qryVBInvHdrCARRIAGEBYLINE1: TStringField;
    qryVBInvHdrCARRIAGEBYLINE2: TStringField;
    qryVBInvHdrTERMSLINE1: TStringField;
    qryVBInvHdrTERMSLINE2: TStringField;
    qryVBInvHdrNOTIFYLINE1: TStringField;
    qryVBInvHdrNOTIFYLINE2: TStringField;
    qryVBInvHdrNOTIFYLINE3: TStringField;
    qryVBInvHdrTARRIFFWIDE: TStringField;
    qryVBInvHdrTARRIFFNARROW: TStringField;
    qryVBInvHdrSPECIALINFO: TMemoField;
    qryVBInvHdrSUPREF: TStringField;
    qryVBInvHdrSUPACCNO: TStringField;
    qryVBInvHdrVATNO: TStringField;
    qryVBInvHdrSTREETADD1_1: TStringField;
    qryVBInvHdrSTREETADD2_1: TStringField;
    qryVBInvHdrSTREETADD3_1: TStringField;
    qryVBInvHdrSTREETADD4_1: TStringField;
    qryVBInvHdrSTREETADD5_1: TStringField;
    qryVBInvHdrPOSTALADD1_1: TStringField;
    qryVBInvHdrPOSTALADD2_1: TStringField;
    qryVBInvHdrPOSTALADD3_1: TStringField;
    qryVBInvHdrPOSTALADD4_1: TStringField;
    qryVBInvHdrPOSTALADD5_1: TStringField;
    qryVBInvHdrPHONE: TStringField;
    qryVBInvHdrFAX: TStringField;
    qryVBInvHdrTELEX: TStringField;
    qryVBInvHdrCONTACT: TStringField;
    qryVBInvHdrTERMS: TStringField;
    qryVBInvHdrEARLYDISC: TIntegerField;
    qryVBInvHdrCURRENCY_1: TStringField;
    qryVBInvHdrAGENTREF_1: TStringField;
    qryVBInvHdrNARRATIVE: TStringField;
    qryVBInvHdrEMAIL: TStringField;
    qryVBInvHdrCELLPHONE: TStringField;
    qryVBInvHdrSCTYPE: TStringField;
    qryVBInvHdrDEPTLINK: TStringField;
    qryVBInvHdrCRLIMIT: TFloatField;
    qryVBInvHdrSUPDESCR: TStringField;
    qryVBInvHdrBANK: TStringField;
    qryVBInvHdrBRANCH: TStringField;
    qryVBInvHdrACCNO: TStringField;
    qryVBInvHdrCOREG: TStringField;
    qryVBInvHdrNEDLIBLIMIT: TFloatField;
    qryVBInvHdrCRGUARREQ: TFloatField;
    qryVBInvHdrCRGUARLIMIT: TFloatField;
    qryVBInvHdrCRGUARRET: TStringField;
    qryVBInvHdrCRGUARCOMMENT: TStringField;
    qryVBInvHdrAPPROXMSALES: TFloatField;
    qryVBInvHdrLOCALOVERSEAS_1: TStringField;
    qryVBInvHdrSALECLIENT: TStringField;
    qryVBInvHdrPLACELOAD_1: TStringField;
    qryVBInvHdrPLACEDISCHARGE_1: TStringField;
    qryVBInvHdrINCOTERMS_1: TStringField;
    qryVBInvHdrPLACEDESTLINE1_1: TStringField;
    qryVBInvHdrPLACEDESTLINE2_1: TStringField;
    qryVBInvHdrCARRIAGEBYLINE1_1: TStringField;
    qryVBInvHdrCARRIAGEBYLINE2_1: TStringField;
    qryVBInvHdrTERMSLINE1_1: TStringField;
    qryVBInvHdrTERMSLINE2_1: TStringField;
    qryVBInvHdrNOTIFYLINE1_1: TStringField;
    qryVBInvHdrNOTIFYLINE2_1: TStringField;
    qryVBInvHdrNOTIFYLINE3_1: TStringField;
    qryVBInvHdrNOTIFYLINE4: TStringField;
    qryVBInvHdrTARRIFFWIDE_1: TStringField;
    qryVBInvHdrTARRIFFNARROW_1: TStringField;
    qryVBInvHdrMETRICORIMPERIAL_1: TStringField;
    qryVBInvHdrSPECIALINFO_1: TMemoField;
    qryVBInvHdrCURREF: TStringField;
    qryVBInvHdrDESCR: TStringField;
    qryVBInvHdrMULTDIV: TStringField;
    qryVBInvHdrEXCHRATE_1: TFloatField;
    qryVBInvHdrADDITIONALLOCAMT: TFloatField;
    qryVBInvHdrADDITIONALACCAMT: TFloatField;
    qryVBInvHdrADDITIONALDETAILS: TStringField;
    qrlTotalToPay2: TQRLabel;
    qrdAdditionalLocAmt: TQRDBText;
    qrdLoc_GrandTotal: TQRDBText;
    QRShape10: TQRShape;
    QRShape22: TQRShape;
    qryVBInvDetITEMNO: TIntegerField;
    qryVBInvHdrBEFOREAFTER: TStringField;
    qryVBInvHdrSYMBOL: TStringField;
    qryVBInvHdrNEWDESPNO: TStringField;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel1: TQRLabel;
    qryVBInvHdrCONSIGNMENTCLIENT: TStringField;
    qryVBInvHdrCONSIGNMENTROWNO: TIntegerField;
    qryVBInvHdrTRANSBY: TStringField;
    qryVBInvHdrWAYBILLNO: TStringField;
    qryVBInvHdrSEALS: TStringField;
    qryVBInvHdrCONTREF: TStringField;
    qryVBInvHdrVTCONTREF: TStringField;
    qryVBInvHdrWAYBILLNO2: TStringField;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape23: TQRShape;
    QRLabel25: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel33: TQRLabel;
    qrlPhysicalPallets: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    qrlDiscountSurcharge: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    lblVATDescription: TQRLabel;
    QRDBText33: TQRDBText;
    qrlPlaceLoad: TQRLabel;
    qryVBInvHdrDESPDATE: TDateTimeField;
    QRLabel36: TQRLabel;
    QRDBText24: TQRDBText;
    qryVBInvHdrOVERRIDEFREIGHT: TFloatField;
    qryVBInvHdrACC_TOTALBEFOREFREIGHT: TFloatField;
    qryVBInvHdrACC_TOTALINCLFREIGHT: TFloatField;
    QRDBText38: TQRDBText;
    qrlFreight: TQRLabel;
    QRDBText34: TQRDBText;
    qryVBInvHdrNEDLIBCUSTNO: TStringField;
    QRLabel38: TQRLabel;
    QRDBText39: TQRDBText;
    procedure qrbGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInvoiceLM: TfrmInvoiceLM;

implementation

{$R *.DFM}

uses Main;

procedure TfrmInvoiceLM.qrbGroupFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
(*  // this procedure added DL011199
  if (qryVBInvHdrADDITIONALDETAILS.AsString<>'') or
    (qryVBInvHdrADDITIONALLOCAMT.AsFloat<>0) then
  begin
    qrbGroupFooter.Height:=86;
    qrlTotalToPay.Caption:='TOTAL';
    qrlTotalToPay2.Caption:='TOTAL TO PAY';
//    qrlAdditionalDetails.Caption:=qryVBInvHdrADDITIONALDETAILS.AsString; -DL030204
//    qrdAdditionalLocAmt.Enabled:=true; -DL030204
    //qrlAdditionalLocAmt.Caption:=
    //  formatfloat('#,##0.00',qryVBInvHdrADDITIONALLOCAMT.AsFloat);
    //qrlGrandTotal.Caption:=formatfloat('#,##0.00',qreLoc_ValueTotal.value(+
    //  qryVBInvHdrADDITIONALLOCAMT.AsFloat);

    qrdLoc_GrandTotal.Enabled:=true;
    qrdAdditionalLocAmt.Enabled:=true;
  end
  else
  begin
    qrbGroupFooter.Height:=40;
    qrlTotalToPay.Caption:='TOTAL TO PAY';
//    qrlAdditionalDetails.Caption:=''; - DL030204
//    qrdAdditionalLocAmt.Enabled:=false; - DL030204
    //qrlGrandTotal.Caption:='';
    //qrlCurRef2.Caption:='';
    qrlTotalToPay2.Caption:='';
    qrdLoc_GrandTotal.Enabled:=false;
    qrdAdditionalLocAmt.Enabled:=false;
  end;*)
end;

end.
