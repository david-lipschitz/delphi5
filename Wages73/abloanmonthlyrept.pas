unit abloanmonthlyrept;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Db, DBTables, Qrctrls;

type
  TfrmABLoanMonthlyReport = class(TForm)
    qrpReport: TQuickRep;
    DetailBand1: TQRBand;
    qryReport: TQuery;
    qryReportCLKNO: TIntegerField;
    qryReportABOLDBAL: TFloatField;
    PageHeaderBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    qrlYearMonth: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    tabCompany: TTable;
    tabCompanyCONAME: TStringField;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText10: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel8: TQRLabel;
    qryReportSURNAME: TStringField;
    qryReportFIRSTNAME: TStringField;
    qryReportABLOANACCNO: TStringField;
    qryReportABLOANSTARTVALUE: TFloatField;
    qryReportABLOANAC: TFloatField;
    qryReportABREPAYLNMONTH: TFloatField;
    qryReportABREPAYTERM: TIntegerField;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qryReportABLESSREPAY: TFloatField;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText6: TQRDBText;
    QRExpr3: TQRExpr;
    QRLabel3: TQRLabel;
    qryReportENDOFMONTHBAL: TFloatField;
    QRDBText9: TQRDBText;
    QRExpr4: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmABLoanMonthlyReport: TfrmABLoanMonthlyReport;

implementation

uses Main;

{$R *.DFM}

procedure TfrmABLoanMonthlyReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

end.
