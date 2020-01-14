unit rptGenDeduction;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, quickrpt, DBTables, ExtCtrls, StdCtrls, Buttons, ODDBCbx,
  ODPopCal;

type
  TfrmGenDeductionReport = class(TForm)
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
    labGeneralDeductionsHeading: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    labDeduction: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    qryReportCLKNO: TIntegerField;
    qryReportSURNAME: TStringField;
    qryReportFIRSTNAME: TStringField;
    qryReportSTREET: TStringField;
    qryReportSUBURB: TStringField;
    qryReportPOSTCODE: TStringField;
    qryReportDEDUCTION: TFloatField;
    cbxDeductionSelection: TComboBox;
    Label3: TLabel;
    btnPreview: TBitBtn;
    btnClose: TBitBtn;
    Label1: TLabel;
    odpDateSelection: TODPopupCalendar;
    QRLabel1: TQRLabel;
    qrlPeriodStart: TQRLabel;
    QRLabel25: TQRLabel;
    qrlPeriodEnd: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    lblReportType: TLabel;
    cbxReportType: TComboBox;
    QRLabel24: TQRLabel;
    qrlReportType: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGenDeductionReport: TfrmGenDeductionReport;

implementation

uses Main;

{$R *.DFM}

procedure TfrmGenDeductionReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

procedure TfrmGenDeductionReport.FormShow(Sender: TObject);
begin
  odpDateSelection.DisplayDate:=date;
  cbxDeductionSelection.ItemIndex:=0;
  cbxReportType.ItemIndex:=0;
  frmGenDeductionReport.Height:=170;
  frmGenDeductionReport.Width:=400;
  frmGenDeductionReport.VertScrollBar.Visible:=false;
  frmGenDeductionReport.HorzScrollBar.Visible:=false;
end;

procedure TfrmGenDeductionReport.btnPreviewClick(Sender: TObject);
begin
  //populate the query
  if odpDateSelection.Text='' then
    raise Exception.Create('Please choose a date range first');
  tabCompany.Close;
  qryReport.Close;
  qryReport.SQL.Clear;
  labGeneralDeductionsHeading.Caption:=cbxDeductionSelection.Text+' Deductions Report';
  labDeduction.Caption:=cbxDeductionSelection.Text+' Deduction';
  if cbxDeductionSelection.Text='Community Chest' then
  begin
    qryReport.SQL.Add('select emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode,');
    qryReport.SQL.Add('  sum(ph.other2deduct) as deduction');
    qryReport.SQL.Add('from employee emp,paysliphist ph');
    qryReport.SQL.Add('where emp.clkno=ph.clkno');
    qryReport.SQL.Add('and ph.other2deduct>0');
    qryReport.SQL.Add('and ph.thisweek >= :fromdate');
    qryReport.SQL.Add('and ph.thisweek <= :todate');
    qryReport.SQL.Add('and ((ph.paykind=:paykind1) or (ph.paykind=:paykind2))');
    qryReport.SQL.Add('group by emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode');
    qryReport.SQL.Add('order by emp.surname,emp.firstname');
  end
  else
  if cbxDeductionSelection.Text='Council' then
  begin
    qryReport.SQL.Add('select emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode,');
    qryReport.SQL.Add('  sum(ph.councildeduct) as deduction');
    qryReport.SQL.Add('from employee emp,paysliphist ph');
    qryReport.SQL.Add('where emp.clkno=ph.clkno');
    qryReport.SQL.Add('and ph.councildeduct>0');
    qryReport.SQL.Add('and ph.thisweek >= :fromdate');
    qryReport.SQL.Add('and ph.thisweek <= :todate');
    qryReport.SQL.Add('and ((ph.paykind=:paykind1) or (ph.paykind=:paykind2))');
    qryReport.SQL.Add('group by emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode');
    qryReport.SQL.Add('order by emp.surname,emp.firstname');
  end
  else
  if cbxDeductionSelection.Text='Garnishee' then
  begin
    qryReport.SQL.Add('select emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode,');
    qryReport.SQL.Add('  sum(ph.lawyerdeduct) as deduction');
    qryReport.SQL.Add('from employee emp,paysliphist ph');
    qryReport.SQL.Add('where emp.clkno=ph.clkno');
    qryReport.SQL.Add('and ph.lawyerdeduct>0');
    qryReport.SQL.Add('and ph.thisweek >= :fromdate');
    qryReport.SQL.Add('and ph.thisweek <= :todate');
    qryReport.SQL.Add('and ((ph.paykind=:paykind1) or (ph.paykind=:paykind2))');
    qryReport.SQL.Add('group by emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode');
    qryReport.SQL.Add('order by emp.surname,emp.firstname');
  end
  else
  if cbxDeductionSelection.Text='Insurance' then
  begin
    qryReport.SQL.Add('select emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode,');
    qryReport.SQL.Add('  sum(ph.insurancededuct) as deduction');
    qryReport.SQL.Add('from employee emp,paysliphist ph');
    qryReport.SQL.Add('where emp.clkno=ph.clkno');
    qryReport.SQL.Add('and ph.insurancededuct>0');
    qryReport.SQL.Add('and ph.thisweek >= :fromdate');
    qryReport.SQL.Add('and ph.thisweek <= :todate');
    qryReport.SQL.Add('and ((ph.paykind=:paykind1) or (ph.paykind=:paykind2))');
    qryReport.SQL.Add('group by emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode');
    qryReport.SQL.Add('order by emp.surname,emp.firstname');
  end
  else
  if cbxDeductionSelection.Text='Medical Aid' then
  begin
    qryReport.SQL.Add('select emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode,');
    qryReport.SQL.Add('  sum(ph.medaiddeduct) as deduction');
    qryReport.SQL.Add('from employee emp,paysliphist ph');
    qryReport.SQL.Add('where emp.clkno=ph.clkno');
    qryReport.SQL.Add('and ph.medaiddeduct>0');
    qryReport.SQL.Add('and ph.thisweek >= :fromdate');
    qryReport.SQL.Add('and ph.thisweek <= :todate');
    qryReport.SQL.Add('and ((ph.paykind=:paykind1) or (ph.paykind=:paykind2))');
    qryReport.SQL.Add('group by emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode');
    qryReport.SQL.Add('order by emp.surname,emp.firstname');
  end
  else
  if cbxDeductionSelection.Text='Provident Fund' then
  begin
    qryReport.SQL.Add('select emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode,');
    qryReport.SQL.Add('  sum(ph.provfunddeduct) as deduction');
    qryReport.SQL.Add('from employee emp,paysliphist ph');
    qryReport.SQL.Add('where emp.clkno=ph.clkno');
    qryReport.SQL.Add('and ph.provfunddeduct>0');
    qryReport.SQL.Add('and ph.thisweek >= :fromdate');
    qryReport.SQL.Add('and ph.thisweek <= :todate');
    qryReport.SQL.Add('and ((ph.paykind=:paykind1) or (ph.paykind=:paykind2))');
    qryReport.SQL.Add('group by emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode');
    qryReport.SQL.Add('order by emp.surname,emp.firstname');
  end
  else
  if cbxDeductionSelection.Text='Sick Fund' then
  begin
    qryReport.SQL.Add('select emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode,');
    qryReport.SQL.Add('  sum(ph.sickfunddeduct) as deduction');
    qryReport.SQL.Add('from employee emp,paysliphist ph');
    qryReport.SQL.Add('where emp.clkno=ph.clkno');
    qryReport.SQL.Add('and ph.sickfunddeduct>0');
    qryReport.SQL.Add('and ph.thisweek >= :fromdate');
    qryReport.SQL.Add('and ph.thisweek <= :todate');
    qryReport.SQL.Add('and ((ph.paykind=:paykind1) or (ph.paykind=:paykind2))');
    qryReport.SQL.Add('group by emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode');
    qryReport.SQL.Add('order by emp.surname,emp.firstname');
  end
  else
  if cbxDeductionSelection.Text='Union Levy' then
  begin
    qryReport.SQL.Add('select emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode,');
    qryReport.SQL.Add('  sum(ph.other1deduct) as deduction');
    qryReport.SQL.Add('from employee emp,paysliphist ph');
    qryReport.SQL.Add('where emp.clkno=ph.clkno');
    qryReport.SQL.Add('and ph.other1deduct>0');
    qryReport.SQL.Add('and ph.thisweek >= :fromdate');
    qryReport.SQL.Add('and ph.thisweek <= :todate');
    qryReport.SQL.Add('and ((ph.paykind=:paykind1) or (ph.paykind=:paykind2))');
    qryReport.SQL.Add('group by emp.clkno,emp.surname,emp.firstname,emp.street,emp.suburb,emp.postcode');
    qryReport.SQL.Add('order by emp.surname,emp.firstname');
  end;
  qryReport.ParamByName('FromDate').AsDateTime:=odpDateSelection.StartDate;
  qryReport.ParamByName('ToDate').AsDateTime:=odpDateSelection.FinishDate;
  qrlPeriodStart.Caption:=formatdatetime('dd/mm/yyyy',odpDateSelection.StartDate);
  qrlPeriodEnd.Caption:=formatdatetime('dd/mm/yyyy',odpDateSelection.FinishDate);
  if cbxReportType.ItemIndex=0 then
  begin
    qryReport.ParamByName('PayKind1').AsString:='AW';
    qryReport.ParamByName('PayKind2').AsString:='AW';
  end
  else if cbxReportType.ItemIndex=1 then
  begin
    qryReport.ParamByName('PayKind1').AsString:='BF';
    qryReport.ParamByName('PayKind2').AsString:='BF';
  end
  else
  begin
    qryReport.ParamByName('PayKind1').AsString:='AW';
    qryReport.ParamByName('PayKind2').AsString:='BF';
  end;
  tabCompany.Open;
  qryReport.Open;
  if cbxReportType.Text='Both' then
    qrlReportType.Caption:='Weekly and Final Pay (excl Holiday Pay)'
  else
    qrlReportType.Caption:=cbxReportType.Text;
  qrpReport.Preview;
end;

end.
