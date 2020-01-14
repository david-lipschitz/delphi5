unit DateChoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Db, DBTables, ExtCtrls;

type
  TfrmDateChoice = class(TForm)
    rbHist: TRadioButton;
    rbThisweek: TRadioButton;
    qryPaysliphist: TQuery;
    cbDate: TComboBox;
    qryPaysliphistTHISWEEK: TDateTimeField;
    Panel1: TPanel;
    Panel2: TPanel;
    btnOk: TSpeedButton;
    btnClose: TSpeedButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rbHistClick(Sender: TObject);
    procedure rbThisweekClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cbDateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDateChoice: TfrmDateChoice;
  ThisWeek: TDateTime;

implementation

uses printslip, wklywages;

{$R *.DFM}

procedure TfrmDateChoice.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDateChoice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

procedure TfrmDateChoice.FormCreate(Sender: TObject);
begin
  qryPaysliphist.Close;
  qryPaySliphist.Open;
  qryPaySliphist.Last;
  cbDate.Clear;
  while not qryPaysliphist.BOF do
  begin
    cbDate.Items.Add(DateToStr(qryPaysliphistTHISWEEK.AsDateTime));
    qryPaysliphist.Prior;
  end;
  qryPaysliphist.Prior;
  cbDate.Enabled := False;
  cbDate.ItemIndex := 0;
  rbThisweekClick(nil);
end;

procedure TfrmDateChoice.rbHistClick(Sender: TObject);
begin
  if rbHist.Checked then
  begin
    ThisWeek := StrToDate(cbDate.Text);
    rbHist.Font.Color := clNavy;
    rbThisweek.Font.Color := clBlack;
    cbDate.Enabled := True;
  end;
end;

procedure TfrmDateChoice.rbThisweekClick(Sender: TObject);
begin
  if rbThisWeek.Checked then
  begin
    ThisWeek := frmWeeklyWages.ThisWeekEnd;
    rbHist.Font.Color := clBlack;
    rbThisweek.Font.Color := clNavy;
    cbDate.ItemIndex := 0;
    cbDate.Enabled := False;
  end;
end;

procedure TfrmDateChoice.btnOkClick(Sender: TObject);
begin
  frmPrintSlip.qryPaySlip.Close;
  frmPrintSlip.qryPaySlip.ParamByName('ThisWeek').AsDateTime:=ThisWeek;
  frmPrintSlip.qryPaySlip.Open;
  frmPrintSlip.qrpPaySlip.Preview;
  frmPrintSlip.qryPaySlip.Close;
end;

procedure TfrmDateChoice.cbDateChange(Sender: TObject);
begin
  ThisWeek := StrToDate(cbDate.Text);
end;

end.
