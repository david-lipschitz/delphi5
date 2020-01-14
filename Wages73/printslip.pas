unit printslip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, Db, DBTables;

type
  TfrmPrintSlip = class(TForm)
    qrpPaySlip: TQuickRep;
    qryPaySlip: TQuery;
    qrbPaySlip: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
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
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRShape3: TQRShape;
    QRDBText29: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRLabel53: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRDBText66: TQRDBText;
    qrlNegPayLoan: TQRLabel;
    qrs1: TQRShape;
    qrs2: TQRShape;
    qrlNewPay: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel61: TQRLabel;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    qrsCover: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    qryPaySlipCLKNO: TIntegerField;
    qryPaySlipSURNAME: TStringField;
    qryPaySlipFIRSTNAME: TStringField;
    qryPaySlipSTREET: TStringField;
    qryPaySlipSUBURB: TStringField;
    qryPaySlipPOSTCODE: TStringField;
    qryPaySlipRENTACNO: TStringField;
    qryPaySlipRENTMONTH: TFloatField;
    qryPaySlipSAVEACNO: TStringField;
    qryPaySlipSTARTDATE: TDateTimeField;
    qryPaySlipBIRTHDATE: TDateTimeField;
    qryPaySlipPAYRATESETDATE: TDateTimeField;
    qryPaySlipHUSBANDNAME: TStringField;
    qryPaySlipMSTATUS: TStringField;
    qryPaySlipNOOFCHILD: TIntegerField;
    qryPaySlipOCCUPATION: TStringField;
    qryPaySlipIDNO: TStringField;
    qryPaySlipUIF: TStringField;
    qryPaySlipPROVFUNDFLAG: TStringField;
    qryPaySlipOTHER1FLAG: TStringField;
    qryPaySlipSICKFUNDFLAG: TStringField;
    qryPaySlipHRPAYRATE: TFloatField;
    nn: TFloatField;
    qryPaySlipSAVEWK: TFloatField;
    qryPaySlipREPAYLNWK: TFloatField;
    qryPaySlipINSURANCE: TFloatField;
    qryPaySlipSAVEAC: TFloatField;
    qryPaySlipTAXEARN: TFloatField;
    qryPaySlipPENSION: TFloatField;
    qryPaySlipSICKFD: TFloatField;
    qryPaySlipPROVFD: TFloatField;
    qryPaySlipUIFPAY: TFloatField;
    qryPaySlipPAYE: TFloatField;
    qryPaySlipGROSSPAY: TFloatField;
    qryPaySlipWKSPAY: TFloatField;
    qryPaySlipRENTAC: TFloatField;
    qryPaySlipLOANAC: TFloatField;
    qryPaySlipFULLWK: TIntegerField;
    qryPaySlipPARTWK: TIntegerField;
    qryPaySlipLEAVEDAY: TIntegerField;
    qryPaySlipSICKDAY: TIntegerField;
    qryPaySlipTAXWEEK: TIntegerField;
    qryPaySlipDISCHARGEDATE: TDateTimeField;
    qryPaySlipBANKSORTCODE: TStringField;
    qryPaySlipBANKACCREF: TStringField;
    qryPaySlipBANKACCTYPE: TStringField;
    qryPaySlipTHISWEEK: TDateTimeField;
    qryPaySlipNORMALHH: TIntegerField;
    qryPaySlipNORMALMM: TIntegerField;
    qryPaySlipOT13HH: TIntegerField;
    qryPaySlipOT13MM: TIntegerField;
    qryPaySlipOT12HH: TIntegerField;
    qryPaySlipOT12MM: TIntegerField;
    qryPaySlipOTX2HH: TIntegerField;
    qryPaySlipOTX2MM: TIntegerField;
    qryPaySlipATTDAYS: TIntegerField;
    qryPaySlipLEAVEPAYDAYS: TIntegerField;
    qryPaySlipSICKPAYDAYS: TIntegerField;
    qryPaySlipPRODBONUS: TFloatField;
    qryPaySlipNIGHTSHIFTALLOW: TFloatField;
    qryPaySlipSAVINGSPAID: TFloatField;
    qryPaySlipLOANGIVEN: TFloatField;
    qryPaySlipLOANREPAYRATE: TFloatField;
    qryPaySlipMEDAID: TFloatField;
    qryPaySlipOTHER2: TFloatField;
    qryPaySlipOTHER1: TFloatField;
    qryPaySlipPOSTED: TStringField;
    qryPaySlipNORMALPAY: TFloatField;
    qryPaySlipOT13PAY: TFloatField;
    qryPaySlipOT12PAY: TFloatField;
    qryPaySlipOTX2PAY: TFloatField;
    qryPaySlipATTBONUSPAY: TFloatField;
    qryPaySlipPRODBONUSPAY: TFloatField;
    qryPaySlipNIGHTSHIFTPAY: TFloatField;
    qryPaySlipLEAVEPAY: TFloatField;
    qryPaySlipRENTALLOWPAY: TFloatField;
    qryPaySlipPENSIONDEDUCT: TFloatField;
    qryPaySlipTAXDEDUCT: TFloatField;
    qryPaySlipUIFDEDUCT: TFloatField;
    qryPaySlipPROVFUNDDEDUCT: TFloatField;
    qryPaySlipCOUNCILDEDUCT: TFloatField;
    qryPaySlipSICKFUNDDEDUCT: TFloatField;
    qryPaySlipMEDAIDDEDUCT: TFloatField;
    qryPaySlipOTHER1DEDUCT: TFloatField;
    qryPaySlipOTHER2DEDUCT: TFloatField;
    qryPaySlipRENTDEDUCT: TFloatField;
    qryPaySlipSAVINGSPERWEEKDEDUCT: TFloatField;
    qryPaySlipREPAYLOANPERWEEKDEDUCT: TFloatField;
    qryPaySlipRENTACBALANCE: TFloatField;
    qryPaySlipRENTREPAY: TFloatField;
    qryPaySlipSAVEACBALANCE: TFloatField;
    qryPaySlipLOANACBALANCE: TFloatField;
    qryPaySlipFULLWEEK: TFloatField;
    qryPaySlipPARTWEEK: TFloatField;
    qryPaySlipSICKFUNDPAY: TFloatField;
    qryPaySlipTAXEARNINGS: TFloatField;
    qryPaySlipTOTALEARNINGS: TFloatField;
    qryPaySlipTOTALDEDUCT: TFloatField;
    qryPaySlipTOTALPAY: TFloatField;
    qryPaySlipINSURANCEDEDUCT: TFloatField;
    qryPaySlipLEAVEDAYS: TFloatField;
    qryPaySlipSICKDAYS: TFloatField;
    qryPaySlipFULLWEEKS: TFloatField;
    qryPaySlipPARTWEEKS: TFloatField;
    qryPaySlipNEGPAYLOAN: TFloatField;
    qryPaySlipCONAME: TStringField;
    qryPaySlipRENTOPENINGBAL: TFloatField;
    qryPaySlipSAVEOPENINGBAL: TFloatField;
    qryPaySlipLOANOPENINGBAL: TFloatField;
    qryPaySlipABOLDBAL: TFloatField;
    qryPaySlipABLESSREPAY: TFloatField;
    qryPaySlipABADDNEW: TFloatField;
    qryPaySlipABNEWBAL: TFloatField;
    QRLabel62: TQRLabel;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText68: TQRDBText;
    QRLabel63: TQRLabel;
    QRDBText69: TQRDBText;
    QRLabel64: TQRLabel;
    QRDBText70: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText71: TQRDBText;
    QRLabel67: TQRLabel;
    QRDBText73: TQRDBText;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    qryPaySlipNORMALHRS: TIntegerField;
    qryPaySlipANNUALBONMIN: TFloatField;
    qryPaySlipWEEKSINYEAR: TIntegerField;
    QRLabel72: TQRLabel;
    QRDBText76: TQRDBText;
    QRLabel66: TQRLabel;
    QRDBText72: TQRDBText;
    qryPaySlipPFOLDBAL: TFloatField;
    qryPaySlipPFLESSREPAY: TFloatField;
    qryPaySlipPFADDNEW: TFloatField;
    qryPaySlipPFNEWBAL: TFloatField;
    qryPaySlipLAWYERDEDUCT: TFloatField;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRDBText67: TQRDBText;
    QRDBText79: TQRDBText;
    QRLabel73: TQRLabel;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText80: TQRDBText;
    qryPaySlipBANKREF: TStringField;
    qryPaySlipDEPREF: TStringField;
    qryPaySlipSTANDBYALLOWANCEPAY: TFloatField;
    qryPaySlipBANKFEESPAY: TFloatField;
    qryPaySlipOVERALLSDEDUCT: TFloatField;
    qryPaySlipTOOLSDEDUCT: TFloatField;
    qryPaySlipOTHER3DEDUCT: TFloatField;
    QRLabel52: TQRLabel;
    QRLabel71: TQRLabel;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRDBText83: TQRDBText;
    QRLabel79: TQRLabel;
    QRDBText84: TQRDBText;
    qryPaySlipGRADECODE: TStringField;
    QRLabel80: TQRLabel;
    QRDBText85: TQRDBText;
    qryPaySlipGRADESETDATE: TDateTimeField;
    QRLabel81: TQRLabel;
    QRDBText86: TQRDBText;
    procedure qryPaySlipCalcFields(DataSet: TDataSet);
    procedure qrbPaySlipBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintSlip: TfrmPrintSlip;

implementation

uses wklywages,main,wcommon; //wcommon added DL030303 for GetChristmasBonus

{$R *.DFM}
                             //JT031298
procedure TfrmPrintSlip.qryPaySlipCalcFields(DataSet: TDataSet);
begin
{  qryPaySlipTOTOLDBALANCE.AsFloat := qryPaySlipRENTAC.AsFloat +
    qryPaySlipSAVEAC.AsFloat + qryPaySlipLOANAC.AsFloat;
  qryPaySlipTOTLESSREPAY.AsFloat := qryPaySlipRENTREPAY.AsFloat +
    qryPaySlipSAVINGSPAID.AsFloat + qryPaySlipREPAYLOANPERWEEKDEDUCT.AsFloat;
  qryPaySlipTOTADDNEW.AsFloat := qryPaySlipRENTDEDUCT.AsFloat +
    qryPaySlipSAVINGSPAID.AsFloat + qryPaySlipLOANGIVEN.AsFloat;
  qryPaySlipTOTNEWBALANCE.AsFloat := qryPaySlipRENTACBALANCE.AsFloat +
    qryPaySlipSAVEACBALANCE.AsFloat + qryPaySlipLOANACBALANCE.AsFloat;}
end;

procedure TfrmPrintSlip.qrbPaySlipBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  ChristmasBonus:double; //added DL030303
  TWYYYY, TWMM, TWDD, NextWeekYYYY: Word; //added DL030303
begin
  //DL030303: added ChristmasBonus Calculation
  DecodeDate(qryPaySlipTHISWEEK.AsDateTime, TWYYYY, TWMM, TWDD);
  NextWeekYYYY:=TWYYYY+1;
  (*ChristmasBonus:=GetChristmasBonus( - removed DL051213
      qryPaySlipNORMALHRS.AsFloat,
      qryPaySlipANNUALBONMIN.AsFloat,
      qryPaySlipHRPAYRATE.AsFloat,
      qryPaySlipSTARTDATE.AsDateTime,
      52 {qryPaySlipWEEKSINYEAR.AsInteger}, //changed to 52 DL030509
      49-qryPaySlipPARTWEEKS.AsInteger {qryPaySlipFULLWEEKS.AsInteger}, //changed to 49 ... DL030509
      qryPaySlipPARTWEEKS.AsInteger,
      3, //tabHolSlip.FieldByName('HolidayWeeks').AsInteger,
      NextWeekYYYY);*)
  //qrdChristmasBonus.Caption:=FormatFloat('0.00',ChristmasBonus); - removed DL050111
  ChristmasBonus:=0; //added DL051213
  if qryPaySlipTOTALPAY.AsFloat < 0 then
    qrsCover.Height := 0 //can't make invisible!
  else
    qrsCover.Height := 55; //cover neg pay loan section
end;

procedure TfrmPrintSlip.FormShow(Sender: TObject);
begin
  qryPaySlip.Open;
end;

procedure TfrmPrintSlip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryPaySlip.Close;
  Release;
end;

end.
