unit prndischarge;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls;

type
  TfrmPrnDischarge = class(TForm)
    qrpDischarge: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
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
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRDBText22: TQRDBText;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel15: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel16: TQRLabel;
    tabCompany: TTable;
    tabCompanyCONAME: TStringField;
    tabCompanyLASTWEEK: TDateTimeField;
    qryDisch: TQuery;
    SummaryBand1: TQRBand;
    qryDischCLKNO: TIntegerField;
    qryDischSURNAME: TStringField;
    qryDischFIRSTNAME: TStringField;
    qryDischSTREET: TStringField;
    qryDischSUBURB: TStringField;
    qryDischPOSTCODE: TStringField;
    qryDischRENTACNO: TStringField;
    qryDischRENTMONTH: TFloatField;
    qryDischSAVEACNO: TStringField;
    qryDischSTARTDATE: TDateTimeField;
    qryDischBIRTHDATE: TDateTimeField;
    qryDischPAYRATESETDATE: TDateTimeField;
    qryDischHUSBANDNAME: TStringField;
    qryDischMSTATUS: TStringField;
    qryDischNOOFCHILD: TIntegerField;
    qryDischOCCUPATION: TStringField;
    qryDischIDNO: TStringField;
    qryDischUIF: TStringField;
    qryDischPROVFUNDFLAG: TStringField;
    qryDischOTHER1FLAG: TStringField;
    qryDischSICKFUNDFLAG: TStringField;
    qryDischHRPAYRATE: TFloatField;
    qryDischATTBONUSWK: TFloatField;
    qryDischSAVEWK: TFloatField;
    qryDischREPAYLNWK: TFloatField;
    qryDischINSURANCE: TFloatField;
    qryDischSAVEAC: TFloatField;
    qryDischTAXEARN: TFloatField;
    qryDischPENSION: TFloatField;
    qryDischSICKFD: TFloatField;
    qryDischPROVFD: TFloatField;
    qryDischUIFPAY: TFloatField;
    qryDischPAYE: TFloatField;
    qryDischGROSSPAY: TFloatField;
    qryDischWKSPAY: TFloatField;
    qryDischRENTAC: TFloatField;
    qryDischLOANAC: TFloatField;
    qryDischFULLWK: TIntegerField;
    qryDischPARTWK: TIntegerField;
    qryDischLEAVEDAY: TIntegerField;
    qryDischSICKDAY: TIntegerField;
    qryDischTAXWEEK: TIntegerField;
    qryDischDISCHARGEDATE: TDateTimeField;
    qryDischBANKREF: TStringField;
    qryDischBANKSORTCODE: TStringField;
    qryDischBANKACCREF: TStringField;
    qryDischBANKACCTYPE: TStringField;
    qryDischDEPREF: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrnDischarge: TfrmPrnDischarge;

implementation

{$R *.DFM}

end.
