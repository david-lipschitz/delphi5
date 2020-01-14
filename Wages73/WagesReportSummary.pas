unit WagesReportSummary;
//unit added DL060414 to summarise values by any period (eg month)
//DL060611 added WeeklyMonthly so that user is not confused by selection

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Qrctrls, quickrpt, ExtCtrls, DBTables, StdCtrls, Buttons, ODPopCal;

type
  TfrmPayReportSummary = class(TForm)
    qryReport: TQuery;
    qrpReport: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRLabel52: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel56: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel23: TQRLabel;
    QRShape1: TQRShape;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel66: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel61: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText67: TQRDBText;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRLabel72: TQRLabel;
    QRLabel25: TQRLabel;
    Label1: TLabel;
    Label2: TLabel;
    odpDateSelection: TODPopupCalendar;
    cbxReportType: TComboBox;
    btnClose: TBitBtn;
    btnPreview: TBitBtn;
    QRLabel2: TQRLabel;
    tabCompany: TTable;
    tabCompanyCONAME: TStringField;
    tabCompanySICKFUNDPERCENT: TFloatField;
    qryReportTAXEARN: TFloatField;
    qryReportSAVINGS: TFloatField;
    qryReportLOAN: TFloatField;
    qryReportNEGPAYLOAN: TFloatField;
    qryReportSICKPAY: TFloatField;
    qryReportRENTPAID: TFloatField;
    qryReportPENSIONDEDUCT: TFloatField;
    qryReportTAXDEDUCT: TFloatField;
    qryReportUIFDEDUCT: TFloatField;
    qryReportPROVFUNDDEDUCT: TFloatField;
    qryReportCOUNCILDEDUCT: TFloatField;
    qryReportSICKFUNDDEDUCT: TFloatField;
    qryReportMEDAIDDEDUCT: TFloatField;
    qryReportOTHER1DEDUCT: TFloatField;
    qryReportOTHER2DEDUCT: TFloatField;
    qryReportRENTDEDUCT: TFloatField;
    qryReportSAVINGSDEDUCT: TFloatField;
    qryReportLOANDEDUCT: TFloatField;
    qryReportTOTALPAYMENTS: TFloatField;
    qryReportTOTALDEDUCTS: TFloatField;
    qryReportNETPAY: TFloatField;
    qryReportEMPLOYEESTOTAL: TIntegerField;
    qryReportTOTALEARNINGS: TFloatField;
    qryReportSAVINGSPAID: TFloatField;
    qryReportLOANGIVEN: TFloatField;
    qryReportABLOANDEDUCT: TFloatField;
    qryReportPFLOANDEDUCT: TFloatField;
    qryReportLAWYERDEDUCT: TFloatField;
    qryReportSTANDBYALLOWANCEPAY: TFloatField;
    qryReportBANKFEESPAY: TFloatField;
    qryReportOVERALLSDEDUCT: TFloatField;
    qryReportTOOLSDEDUCT: TFloatField;
    qryReportOTHER3DEDUCT: TFloatField;
    qrlReportType: TQRLabel;
    qrlPeriodStart: TQRLabel;
    qrlPeriodEnd: TQRLabel;
    qryReportINSURANCEDEDUCT: TFloatField;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    qryDeptReport: TQuery;
    StringField1: TStringField;
    FloatField34: TFloatField;
    StringField2: TStringField;
    QRExpr1: TQRExpr;
    QRSubDetail1: TQRSubDetail;
    QRDBText49: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText54: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPayReportSummary: TfrmPayReportSummary;

implementation

uses Main;

{$R *.DFM}

procedure TfrmPayReportSummary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

procedure TfrmPayReportSummary.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPayReportSummary.FormShow(Sender: TObject);
begin
  odpDateSelection.DisplayDate:=date;
  cbxReportType.ItemIndex:=0;
  frmPayReportSummary.Height:=150;
  frmPayReportSummary.Width:=400;
  frmPayReportSummary.VertScrollBar.Visible:=false;
  frmPayReportSummary.HorzScrollBar.Visible:=false;
end;

procedure TfrmPayReportSummary.btnPreviewClick(Sender: TObject);
begin
  if odpDateSelection.Text='' then
    raise Exception.Create('Please choose a date range first');
  tabCompany.Close;
  qryReport.Close;
  qryDeptReport.Close;
  qryReport.ParamByName('FromDate').AsDateTime:=odpDateSelection.StartDate;
  qryReport.ParamByName('ToDate').AsDateTime:=odpDateSelection.FinishDate;
  qryDeptReport.ParamByName('FromDate').AsDateTime:=odpDateSelection.StartDate;
  qryDeptReport.ParamByName('ToDate').AsDateTime:=odpDateSelection.FinishDate;
  if cbxReportType.ItemIndex=0 then
  begin
    qryReport.ParamByName('PayKind1').AsString:='AW';
    qryReport.ParamByName('PayKind2').AsString:='AW';
    qryDeptReport.ParamByName('PayKind1').AsString:='AW';
    qryDeptReport.ParamByName('PayKind2').AsString:='AW';
  end
  else if cbxReportType.ItemIndex=1 then
  begin
    qryReport.ParamByName('PayKind1').AsString:='BF';
    qryReport.ParamByName('PayKind2').AsString:='BF';
    qryDeptReport.ParamByName('PayKind1').AsString:='BF';
    qryDeptReport.ParamByName('PayKind2').AsString:='BF';
  end
  else
  begin
    qryReport.ParamByName('PayKind1').AsString:='AW';
    qryReport.ParamByName('PayKind2').AsString:='BF';
    qryDeptReport.ParamByName('PayKind1').AsString:='AW';
    qryDeptReport.ParamByName('PayKind2').AsString:='BF';
  end;
  qrlPeriodStart.Caption:=formatdatetime('dd/mm/yyyy',odpDateSelection.StartDate);
  qrlPeriodEnd.Caption:=formatdatetime('dd/mm/yyyy',odpDateSelection.FinishDate);
  if cbxReportType.Text='Both' then
    qrlReportType.Caption:='Weekly and Final Pay (excl Holiday Pay)'
  else
    qrlReportType.Caption:=cbxReportType.Text;
  tabCompany.Open;
  qryReport.Open;
  qryDeptReport.Open;
  qrpReport.Preview;
end;

end.
