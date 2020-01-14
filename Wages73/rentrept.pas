unit rentrept;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, quickrpt, DBTables, ExtCtrls;

type
  TfrmRentReport = class(TForm)
    qryReport: TQuery;
    tabCompany: TTable;
    tabCompanyCONAME: TStringField;
    qryReportSURNAME: TStringField;
    qryReportFIRSTNAME: TStringField;
    qryReportRENTACNO: TStringField;
    qryReportRENTREPAY: TFloatField;
    qryReportTHISWEEK: TDateTimeField;
    qryReportPAYKIND: TStringField;
    qryReportCLKNO: TIntegerField;
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
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    qryReportSTREET: TStringField;
    qryReportSUBURB: TStringField;
    qryReportPOSTCODE: TStringField;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRentReport: TfrmRentReport;

implementation

uses Main;

{$R *.DFM}

procedure TfrmRentReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

end.
