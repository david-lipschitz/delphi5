unit TaxYearEnd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables;

type
  TfrmTaxYearEnd = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btnContinue: TSpeedButton;
    btnCancel: TSpeedButton;
    Bevel2: TBevel;
    Label11: TLabel;
    edtProgress: TEdit;
    qryUpdateTotals: TQuery;
    qryUpdateCompany: TQuery;
    procedure btnCancelClick(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure PrintEmployee(msg: String);
    procedure ZeroTotals;
  public
    { Public declarations }
  end;

var
  frmTaxYearEnd: TfrmTaxYearEnd;

implementation

uses prndischarge, main, prnempfullhs, prnempfulrhs;

{$R *.DFM}

const
  msgPrintEmpList = ' Printing current employee list';
  msgZero = ' Zeroing all tax totals';
  msgReprintEmpList = ' Printing new/updated employee list';

procedure TfrmTaxYearEnd.PrintEmployee(msg: String);
begin
  edtProgress.Text := msg;
  frmPrnEmpFulLHS := TfrmPrnEmpFulLHS.Create(Application);
  frmPrnEmpFulLHS.qryEmployee.Open;
  frmPrnEmpFulLHS.qrpEmployeeLHS.Print;
  frmPrnEmpFulLHS.qryEmployee.Close;
  frmPrnEmpFulRHS := TfrmPrnEmpFulRHS.Create(Application);
  frmPrnEmpFulRHS.qryEmployee.Open;
  frmPrnEmpFulRHS.qrpEmployeeRHS.Print;
  frmPrnEmpFulRHS.qryEmployee.Close;
  edtProgress.Text := '';
end;

procedure TfrmTaxYearEnd.ZeroTotals;
begin
  frmMain.Database.StartTransaction;
  qryUpdateTotals.ExecSQL;
  //calculate the weeksinyear (for the tax year)
  qryUpdateCompany.ExecSQL;
  frmMain.Database.Commit;
end;

procedure TfrmTaxYearEnd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTaxYearEnd.btnContinueClick(Sender: TObject);
begin
  btnCancel.Enabled := False;
  edtProgress.Enabled := True;

  PrintEmployee(msgPrintEmpList);

  while MessageDlg('Is the employee list printout correct?',
    mtConfirmation,[mbYes,mbNo],0) = mrNo do
      PrintEmployee(msgPrintEmpList);

  ZeroTotals;

  PrintEmployee(msgReprintEmpList);

  while MessageDlg('Is the employee list printout correct?',
    mtConfirmation,[mbYes,mbNo],0) = mrNo do
      PrintEmployee(msgReprintEmpList);

  ShowMessage('Tax year end procedure done');
  Close; //program
end;

procedure TfrmTaxYearEnd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.Database.InTransaction then
  begin
    frmMain.Database.Rollback;
    ShowMessage('There was a problem saving the data updates');
  end;
  Release;
end;

procedure TfrmTaxYearEnd.FormShow(Sender: TObject);
begin
  qryUpdateTotals.Close;
  qryUpdateCompany.Close;
end;

end.
