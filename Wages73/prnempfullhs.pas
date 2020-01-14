unit prnempfullhs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, QuickRpt, Qrctrls, ExtCtrls;

type
  TfrmPrnEmpFulLHS = class(TForm)
    qrpEmployeeLHS: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qryEmployee: TQuery;
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
    qryEmployeeCLKNO: TIntegerField;
    qryEmployeeSURNAME: TStringField;
    qryEmployeeFIRSTNAME: TStringField;
    qryEmployeeSTREET: TStringField;
    qryEmployeeSUBURB: TStringField;
    qryEmployeePOSTCODE: TStringField;
    qryEmployeeRENTACNO: TStringField;
    qryEmployeeRENTMONTH: TFloatField;
    qryEmployeeSAVEACNO: TStringField;
    qryEmployeeSTARTDATE: TDateTimeField;
    qryEmployeeBIRTHDATE: TDateTimeField;
    qryEmployeePAYRATESETDATE: TDateTimeField;
    qryEmployeeHUSBANDNAME: TStringField;
    qryEmployeeMSTATUS: TStringField;
    qryEmployeeNOOFCHILD: TIntegerField;
    qryEmployeeOCCUPATION: TStringField;
    qryEmployeeIDNO: TStringField;
    qryEmployeeUIF: TStringField;
    qryEmployeePROVFUNDFLAG: TStringField;
    qryEmployeeOTHER1FLAG: TStringField;
    qryEmployeeSICKFUNDFLAG: TStringField;
    qryEmployeeHRPAYRATE: TFloatField;
    qryEmployeeATTBONUSWK: TFloatField;
    qryEmployeeSAVEWK: TFloatField;
    qryEmployeeREPAYLNWK: TFloatField;
    qryEmployeeINSURANCE: TFloatField;
    qryEmployeeSAVEAC: TFloatField;
    qryEmployeeTAXEARN: TFloatField;
    qryEmployeePENSION: TFloatField;
    qryEmployeeSICKFD: TFloatField;
    qryEmployeePROVFD: TFloatField;
    qryEmployeeUIFPAY: TFloatField;
    qryEmployeePAYE: TFloatField;
    qryEmployeeGROSSPAY: TFloatField;
    qryEmployeeWKSPAY: TFloatField;
    qryEmployeeRENTAC: TFloatField;
    qryEmployeeLOANAC: TFloatField;
    qryEmployeeFULLWK: TIntegerField;
    qryEmployeePARTWK: TIntegerField;
    qryEmployeeLEAVEDAY: TIntegerField;
    qryEmployeeSICKDAY: TIntegerField;
    qryEmployeeTAXWEEK: TIntegerField;
    qryEmployeeDISCHARGEDATE: TDateTimeField;
    qryEmployeeBANKSORTCODE: TStringField;
    qryEmployeeBANKACCREF: TStringField;
    qryEmployeeBANKACCTYPE: TStringField;
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
    qryEmployeeTC: TStringField;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText21: TQRDBText;
    tabCompany: TTable;
    tabCompanyCONAME: TStringField;
    tabCompanyLASTWEEK: TDateTimeField;
    PageHeaderBand2: TQRBand;
    QRDBText24: TQRDBText;
    qrlHeading: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel21: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel22: TQRLabel;
    QRDBText25: TQRDBText;
    qryEmployeeBANKREF: TStringField;
    qryEmployeeDEPREF: TStringField;
    qryEmployeeGRADECODE: TStringField;
    qryEmployeeGRADESETDATE: TDateTimeField;
    QRLabel14: TQRLabel;
    QRDBText22: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryEmployeeCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrnEmpFulLHS: TfrmPrnEmpFulLHS;

implementation

uses Main;

{$R *.DFM}

procedure TfrmPrnEmpFulLHS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

procedure TfrmPrnEmpFulLHS.qryEmployeeCalcFields(DataSet: TDataSet);
begin
  qryEmployeeTC.AsString:=qryEmployeeMSTATUS.AsString
    + '/' + qryEmployeeNOOFCHILD.AsString;
end;

end.
