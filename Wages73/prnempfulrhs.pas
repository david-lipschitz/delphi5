unit prnempfulrhs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, QuickRpt, Qrctrls, ExtCtrls;

type
  TfrmPrnEmpFulRHS = class(TForm)
    qrpEmployeeRHS: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qryEmployee: TQuery;
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
    qryEmployeeTC: TStringField;
    QRDBText22: TQRDBText;
    tabCompany: TTable;
    qrlHeading: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel15: TQRLabel;
    QRDBText23: TQRDBText;
    tabCompanyCONAME: TStringField;
    tabCompanyLASTWEEK: TDateTimeField;
    QRLabel16: TQRLabel;
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
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText3: TQRDBText;
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
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText18: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRLabel25: TQRLabel;
    qryEmployeeBANKREF: TStringField;
    qryEmployeeDEPREF: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrnEmpFulRHS: TfrmPrnEmpFulRHS;

implementation

uses Main;

{$R *.DFM}

procedure TfrmPrnEmpFulRHS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

end.
