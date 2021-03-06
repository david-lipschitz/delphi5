unit abloanwklyrept;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, quickrpt, DBTables, ExtCtrls;

type
  TfrmABLoanWklyReport = class(TForm)
    qryReport: TQuery;
    tabCompany: TTable;
    tabCompanyCONAME: TStringField;
    qrpReport: TQuickRep;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    qryReportSURNAME: TStringField;
    qryReportFIRSTNAME: TStringField;
    qryReportSTREET: TStringField;
    qryReportSUBURB: TStringField;
    qryReportPOSTCODE: TStringField;
    qryReportABLOANACCNO: TStringField;
    qryReportABLOANSTARTVALUE: TFloatField;
    qryReportABLOANAC: TFloatField;
    qryReportABREPAYLNMONTH: TFloatField;
    qryReportABREPAYTERM: TIntegerField;
    qryReportABOLDBAL: TFloatField;
    qryReportABLESSREPAY: TFloatField;
    qryReportABADDNEW: TFloatField;
    qryReportABNEWBAL: TFloatField;
    qryReportTHISWEEK: TDateTimeField;
    qryReportPAYKIND: TStringField;
    qryReportCLKNO: TIntegerField;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr2: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmABLoanWklyReport: TfrmABLoanWklyReport;

implementation

uses Main;

{$R *.DFM}

procedure TfrmABLoanWklyReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

end.
