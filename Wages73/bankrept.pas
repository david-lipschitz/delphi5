unit bankrept;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, quickrpt, Qrctrls;

type
  TfrmBankReport = class(TForm)
    qrpReport: TQuickRep;
    qryReport: TQuery;
    qryReportSURNAME: TStringField;
    qryReportFIRSTNAME: TStringField;
    qryReportBANKSORTCODE: TStringField;
    qryReportBANKACCREF: TStringField;
    qryReportBANKACCTYPE: TStringField;
    qryReportTOTALPAY: TFloatField;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    tabCompany: TTable;
    tabCompanyCONAME: TStringField;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qryReportTHISWEEK: TDateTimeField;
    qryReportPAYKIND: TStringField;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlFromBank: TQRLabel;
    qrlToBank: TQRLabel;
    qryReportBANKREF: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBankReport: TfrmBankReport;

implementation

uses Main;

{$R *.DFM}

procedure TfrmBankReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

end.
