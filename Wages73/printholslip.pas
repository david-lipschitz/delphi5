unit printholslip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, Db, DBTables;

type
  TfrmPrintHolSlip = class(TForm)
    qrpHolSlip: TQuickRep;
    qryHolSlip: TQuery;
    qrbHolSlip: TQRBand;
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
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    lblSpecialBonus: TQRLabel;
    lblRentAllow: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText17: TQRDBText;
    qrdSpecialBonus: TQRDBText;
    qrsRentAllow: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel44: TQRLabel;
    lblEarningsThisWeek: TQRLabel;
    lblAddSavingsPaid: TQRLabel;
    qrsEarningsThisWeek: TQRDBText;
    qrsAddSavingsPaid: TQRDBText;
    QRShape3: TQRShape;
    QRDBText29: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText60: TQRDBText;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRDBText66: TQRDBText;
    qrlNegPayLoan: TQRLabel;
    qrs1: TQRShape;
    qrs2: TQRShape;
    qrlNewPay: TQRLabel;
    QRLabel60: TQRLabel;
    qrsPayLine: TQRShape;
    QRShape1: TQRShape;
    QRLabel61: TQRLabel;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    qrsCover: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    qryHolSlipCLKNO: TIntegerField;
    qryHolSlipSURNAME: TStringField;
    qryHolSlipFIRSTNAME: TStringField;
    qryHolSlipSTREET: TStringField;
    qryHolSlipSUBURB: TStringField;
    qryHolSlipPOSTCODE: TStringField;
    qryHolSlipRENTACNO: TStringField;
    qryHolSlipRENTMONTH: TFloatField;
    qryHolSlipSAVEACNO: TStringField;
    qryHolSlipSTARTDATE: TDateTimeField;
    qryHolSlipBIRTHDATE: TDateTimeField;
    qryHolSlipPAYRATESETDATE: TDateTimeField;
    qryHolSlipHUSBANDNAME: TStringField;
    qryHolSlipMSTATUS: TStringField;
    qryHolSlipNOOFCHILD: TIntegerField;
    qryHolSlipOCCUPATION: TStringField;
    qryHolSlipIDNO: TStringField;
    qryHolSlipUIF: TStringField;
    qryHolSlipPROVFUNDFLAG: TStringField;
    qryHolSlipOTHER1FLAG: TStringField;
    qryHolSlipSICKFUNDFLAG: TStringField;
    qryHolSlipHRPAYRATE: TFloatField;
    qryHolSlipATTBONUSWK: TFloatField;
    qryHolSlipSAVEWK: TFloatField;
    qryHolSlipREPAYLNWK: TFloatField;
    qryHolSlipINSURANCE: TFloatField;
    qryHolSlipSAVEAC: TFloatField;
    qryHolSlipTAXEARN: TFloatField;
    qryHolSlipPENSION: TFloatField;
    qryHolSlipSICKFD: TFloatField;
    qryHolSlipPROVFD: TFloatField;
    qryHolSlipUIFPAY: TFloatField;
    qryHolSlipPAYE: TFloatField;
    qryHolSlipGROSSPAY: TFloatField;
    qryHolSlipWKSPAY: TFloatField;
    qryHolSlipRENTAC: TFloatField;
    qryHolSlipLOANAC: TFloatField;
    qryHolSlipFULLWK: TIntegerField;
    qryHolSlipPARTWK: TIntegerField;
    qryHolSlipLEAVEDAY: TIntegerField;
    qryHolSlipSICKDAY: TIntegerField;
    qryHolSlipTAXWEEK: TIntegerField;
    qryHolSlipDISCHARGEDATE: TDateTimeField;
    qryHolSlipBANKREF: TStringField;
    qryHolSlipBANKSORTCODE: TStringField;
    qryHolSlipBANKACCREF: TStringField;
    qryHolSlipBANKACCTYPE: TStringField;
    qryHolSlipDEPREF: TStringField;
    qryHolSlipCLKNO_1: TIntegerField;
    qryHolSlipTHISWEEK: TDateTimeField;
    qryHolSlipHOLIDAYPAYDAYS: TIntegerField;
    qryHolSlipHOLIDAYPAY: TFloatField;
    qryHolSlipCHRISTMASBONUS: TFloatField;
    qryHolSlipSERVICEBONUS: TFloatField;
    qryHolSlipSPECIALBONUS: TFloatField;
    qryHolSlipSAVINGSPAID: TFloatField;
    qryHolSlipLOANREPAYRATE: TFloatField;
    qryHolSlipOTHER1: TFloatField;
    qryHolSlipPOSTED: TStringField;
    qryHolSlipRENTALLOWPAY: TFloatField;
    qryHolSlipPENSIONDEDUCT: TFloatField;
    qryHolSlipTAXDEDUCT: TFloatField;
    qryHolSlipUIFDEDUCT: TFloatField;
    qryHolSlipPROVFUNDDEDUCT: TFloatField;
    qryHolSlipCOUNCILDEDUCT: TFloatField;
    qryHolSlipSICKFUNDDEDUCT: TFloatField;
    qryHolSlipOTHER1DEDUCT: TFloatField;
    qryHolSlipREPAYLOANPERWEEKDEDUCT: TFloatField;
    qryHolSlipRENTACBALANCE: TFloatField;
    qryHolSlipRENTREPAY: TFloatField;
    qryHolSlipSAVEACBALANCE: TFloatField;
    qryHolSlipLOANACBALANCE: TFloatField;
    qryHolSlipTAXEARNINGS: TFloatField;
    qryHolSlipTOTALEARNINGS: TFloatField;
    qryHolSlipTOTALDEDUCT: TFloatField;
    qryHolSlipTOTALPAY: TFloatField;
    qryHolSlipINSURANCEDEDUCT: TFloatField;
    qryHolSlipFULLWEEKS: TFloatField;
    qryHolSlipPARTWEEKS: TFloatField;
    qryHolSlipNEGPAYLOAN: TFloatField;
    qryHolSlipPAYKIND: TStringField;
    qryHolSlipHOLIDAYWEEKS: TIntegerField;
    qryHolSlipCONAME: TStringField;
    qryHolSlipRENTOPENINGBAL: TFloatField;
    qryHolSlipSAVEOPENINGBAL: TFloatField;
    qryHolSlipLOANOPENINGBAL: TFloatField;
    QRDBText6: TQRDBText;
    QRLabel62: TQRLabel;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText68: TQRDBText;
    qryHolSlipABOLDBAL: TFloatField;
    qryHolSlipABLESSREPAY: TFloatField;
    qryHolSlipABADDNEW: TFloatField;
    qryHolSlipABNEWBAL: TFloatField;
    QRLabel63: TQRLabel;
    QRDBText69: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    qryHolSlipABLOANACCNO: TStringField;
    qryHolSlipABLOANSTARTVALUE: TFloatField;
    qryHolSlipABLOANAC: TFloatField;
    qryHolSlipABREPAYLNMONTH: TFloatField;
    qryHolSlipABREPAYTERM: TIntegerField;
    qryHolSlipABREPAYFROMYEAR: TIntegerField;
    qryHolSlipABREPAYFROMMONTH: TIntegerField;
    qryHolSlipABLOANACTIVE: TStringField;
    qryHolSlipPFLOANACCNO: TStringField;
    qryHolSlipPFLOANSTARTVALUE: TFloatField;
    qryHolSlipPFLOANAC: TFloatField;
    qryHolSlipPFREPAYLNMONTH: TFloatField;
    qryHolSlipPFREPAYTERM: TIntegerField;
    qryHolSlipPFREPAYFROMYEAR: TIntegerField;
    qryHolSlipPFREPAYFROMMONTH: TIntegerField;
    qryHolSlipPFLOANACTIVE: TStringField;
    qryHolSlipLAWYERMONTH: TFloatField;
    qryHolSlipANNUALBONUS: TFloatField;
    qryHolSlipPFOLDBAL: TFloatField;
    qryHolSlipPFLESSREPAY: TFloatField;
    qryHolSlipPFADDNEW: TFloatField;
    qryHolSlipPFNEWBAL: TFloatField;
    qryHolSlipLAWYERDEDUCT: TFloatField;
    QRLabel16: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel72: TQRLabel;
    QRDBText76: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText74: TQRDBText;
    qryGetLastPayRate: TQuery;
    qryGetLastPayRateCLKNO: TIntegerField;
    qryGetLastPayRateFROMDATE: TDateTimeField;
    qryGetLastPayRatePAYRATE: TFloatField;
    qryGetFullAndPartWeeks: TQuery;
    qryGetFullAndPartWeeksFULLWEEK: TFloatField;
    qryGetFullAndPartWeeksPARTWEEK: TFloatField;
    qryHolSlipWEEKSWORKED: TIntegerField;
    QRLabel66: TQRLabel;
    QRDBText72: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText71: TQRDBText;
    QRDBText86: TQRDBText;
    QRLabel81: TQRLabel;
    QRLabel79: TQRLabel;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRLabel80: TQRLabel;
    qryHolSlipGRADECODE: TStringField;
    qryHolSlipGRADESETDATE: TDateTimeField;
    procedure qrbHolSlipBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintHolSlip: TfrmPrintHolSlip;

implementation

uses HolidayPay, Main;

{$R *.DFM}
                             //JT031298
procedure TfrmPrintHolSlip.qrbHolSlipBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qryHolSlipTOTALPAY.AsFloat < 0 then
    qrsCover.Height := 0 //can't make invisible!
  else
    qrsCover.Height := 55; //cover neg pay loan section
  if qryHolSlipSPECIALBONUS.AsFloat=0 then
  begin
    //hide Special Bonus and move other fields up
    //field top's changed DL041207 due to new Annual Bonus field
    lblSpecialBonus.Width:=0;
    qrdSpecialBonus.Width:=0;
    //lblSpecialBonus.Top:=200;
    //qrdSpecialBonus.Top:=200;
    lblRentAllow.Top:=160;
    qrsRentAllow.Top:=160;
    qrsPayLine.Top:=178;
    lblEarningsThisWeek.Top:=184;
    qrsEarningsThisWeek.Top:=184;
    lblAddSavingsPaid.Top:=204;
    qrsAddSavingsPaid.Top:=204;
  end
  else //must show the special bonus as well as the other fields
  begin
    lblSpecialBonus.Width:=125;
    qrdSpecialBonus.Width:=61;
    //lblSpecialBonus.Top:=200;
    //qrdSpecialBonus.Top:=200;
    lblRentAllow.Top:=180;
    qrsRentAllow.Top:=180;
    qrsPayLine.Top:=198;
    lblEarningsThisWeek.Top:=204;
    qrsEarningsThisWeek.Top:=204;
    lblAddSavingsPaid.Top:=224;
    qrsAddSavingsPaid.Top:=224;
  end;

  //do the following only at the end of 2004 - removed DL051213
  {qryGetFullAndPartWeeks.Close;
  qryGetFullAndPartWeeks.ParamByName('ClkNo').AsInteger:=qryHolSlipCLKNO.AsInteger;
  qryGetFullAndPartWeeks.ParamByName('FromDate').AsString:='1-jan-2004';
  qryGetFullAndPartWeeks.ParamByName('ToDate').AsString:='30-jun-2004';
  qryGetFullAndPartWeeks.Open;
  if qryGetFullAndPartWeeksFULLWEEK.IsNull then
    qryGetFullAndPartWeeks.Close;
  qryGetLastPayRate.Close;
  qryGetLastPayRate.ParamByName('ClkNo').AsInteger:=qryHolSlipCLKNO.AsInteger;
  qryGetLastPayRate.Open;
  if qryGetLastPayRatePAYRATE.IsNull then
    qryGetLastPayRate.Close;}
end;

procedure TfrmPrintHolSlip.FormShow(Sender: TObject);
begin
  qryHolSlip.Open;
end;

procedure TfrmPrintHolSlip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryHolSlip.Close;
  Release;
end;

end.
