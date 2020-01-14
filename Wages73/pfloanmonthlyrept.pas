unit pfloanmonthlyrept;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Db, DBTables, Qrctrls;

type
  TfrmPFLoanMonthlyReport = class(TForm)
    qrpReport: TQuickRep;
    DetailBand1: TQRBand;
    qryReport: TQuery;
    qryReportCLKNO: TIntegerField;
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
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
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
    qryReportPFLOANACCNO: TStringField;
    qryReportPFLOANSTARTVALUE: TFloatField;
    qryReportPFLOANAC: TFloatField;
    qryReportPFREPAYLNMONTH: TFloatField;
    qryReportPFREPAYTERM: TIntegerField;
    qryReportPFOLDBAL: TFloatField;
    qryReportPFLESSREPAY: TFloatField;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    qryReportPAYKIND: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPFLoanMonthlyReport: TfrmPFLoanMonthlyReport;

implementation

uses Main;

{$R *.DFM}

procedure TfrmPFLoanMonthlyReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

end.
