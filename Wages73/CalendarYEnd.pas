unit CalendarYEnd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Db, DBTables;

type
  TfrmCalendarYEnd = class(TForm)
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
    Bevel2: TBevel;
    lbGrossPay: TLabel;
    lbSick: TLabel;
    lbWeeks: TLabel;
    btnContinue: TSpeedButton;
    qryZeros: TQuery;
    btnCancel: TSpeedButton;
    procedure Label7Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    {procedure PrintEmpList;}
    procedure ZeroG;
    procedure ZeroD;
    procedure ZeroW;
    procedure ZeroWkspay;
  public
    { Public declarations }
  end;

var
  frmCalendarYEnd: TfrmCalendarYEnd;
  ZeroDays: Boolean;
  ZeroWeeks: Boolean;
  ZeroGross: Boolean;

implementation

uses main, prnempfullhs;

{$R *.DFM}

procedure TfrmCalendarYEnd.ZeroWkspay;
begin
  qryZeros.Close;
  qryZeros.SQL.Clear;
  qryZeros.SQL.Add('UPDATE employee set Wkspay = 0');
  qryZeros.SQL.Add('where dischargedate is null'); //added DL141299
  qryZeros.ExecSQL;
end;

procedure TfrmCalendarYEnd.ZeroG;
begin
  qryZeros.Close;
  qryZeros.SQL.Clear;
  qryZeros.SQL.Add('UPDATE employee set GrossPay = 0');
  qryZeros.SQL.Add('where dischargedate is null'); //added DL141299
  qryZeros.ExecSQL;
end;

procedure TfrmCalendarYEnd.ZeroD;
begin
  qryZeros.Close;
  qryZeros.SQL.Clear;
  qryZeros.SQL.Add('UPDATE employee set Leaveday = 0, Sickday = 0'); //swopped with ZeroW DL141299
  qryZeros.SQL.Add('where dischargedate is null'); //added DL141299
  qryZeros.ExecSQL;
end;

procedure TfrmCalendarYEnd.ZeroW;
begin
  qryZeros.SQL.Clear;
  qryZeros.SQL.Add('UPDATE employee set fullwk = 0, partwk = 0'); //swopped with ZeroW DL141299
  qryZeros.SQL.Add('where dischargedate is null'); //added DL141299
  qryZeros.ExecSQL;
end;

{procedure TfrmCalendarYEnd.PrintEmpList;
begin
  frmPrnEmpFulLHS := TfrmPrnEmpFulLHS.Create(Application);
  frmPrnEmpFulLHS.qryEmployee.Open;
  frmPrnEmpFulLHS.qrpEmployeeLHS.Print;
  frmPrnEmpFulLHS.qryEmployee.Close;
  frmPrnEmpFulLHS.Release;
end;}

procedure TfrmCalendarYEnd.Label7Click(Sender: TObject);
begin
  if lbGrossPay.Caption = 'NO' then
  begin
    lbGrossPay.Caption := 'YES';
    lbGrossPay.Font.Color := clRed;
    ZeroGross := True;
  end
  else
  begin
    lbGrossPay.Caption := 'NO';
    lbGrossPay.Font.Color := clBlack;
    ZeroGross := False;
  end;
end;

procedure TfrmCalendarYEnd.Label8Click(Sender: TObject);
begin
  if lbSick.Caption = 'NO' then
  begin
    lbSick.Caption := 'YES';
    lbSick.Font.Color := clRed;
    ZeroDays := True;
  end
  else
  begin
    lbSick.Caption := 'NO';
    lbSick.Font.Color := clBlack;
    ZeroDays := False;
  end;
end;

procedure TfrmCalendarYEnd.Label9Click(Sender: TObject);
begin
  if lbWeeks.Caption = 'NO' then
  begin
    lbWeeks.Caption := 'YES';
    lbWeeks.Font.Color := clRed;
    ZeroWeeks := True;
  end
  else
  begin
    lbWeeks.Caption := 'NO';
    lbWeeks.Font.Color := clBlack;
    ZeroWeeks := False;
  end;
end;

procedure TfrmCalendarYEnd.FormCreate(Sender: TObject);
begin
  ZeroGross := False;
  ZeroDays := False;
  ZeroWeeks := False;
end;

procedure TfrmCalendarYEnd.btnContinueClick(Sender: TObject);
begin
  if ZeroGross or ZeroDays or ZeroWeeks then
  begin
    //PrintEmpList;
    frmMain.Database.StartTransaction;
    ZeroWkspay;
    if ZeroGross then
      ZeroG;       // Zero Gross Pay
    if ZeroDays then
      ZeroD;       // Zero Leave/Sick Days
    if ZeroWeeks then
      ZeroW;       // Zero Full/Part Weeks
    frmMain.Database.Commit;
    //PrintEmpList;
    Close;
  end
  else begin
    MessageDlg('No totals have been requested to be zeroed',mtError,[mbOk],0)
  end;
end;

procedure TfrmCalendarYEnd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCalendarYEnd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryZeros.Close;
  Release;
end;

end.
