unit JobUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, Db, DBTables, ODPopCal, ODCalend,
  ODSched{, ODWeaSch};

type
  TJobForm = class(TForm)
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    DatePicker: TDateTimePicker;
    DateLabel: TLabel;
    YarnLabel: TLabel;
    WeightEdit: TEdit;
    WeightLabel: TLabel;
    SpindlesEdit: TEdit;
    SpindlesLabel: TLabel;
    GroupBox1: TGroupBox;
    SpinningRadio: TRadioButton;
    CleaningRadio: TRadioButton;
    SpindlesUpDown: TUpDown;
    FindEdit: TEdit;
    YarnList: TListBox;
    MaxLabel: TLabel;
    procedure FormShow(Sender: TObject);
    procedure TypeRadioClick(Sender: TObject);
    procedure CtrlChange(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure YarnListClick(Sender: TObject);
    procedure FindEditKeyPress(Sender: TObject; var Key: Char);
  private
    procedure SetOKButton;
  public
    Schedule: TODJobSchedule;
  end;

var
  JobForm: TJobForm;

implementation

uses Main;

{$R *.DFM}

procedure TJobForm.FormShow(Sender: TObject);
begin
  if Schedule.JobCount = 0 then
  begin
    SpinningRadio.Enabled := False;
    CleaningRadio.Checked := True;
  end
  else
  begin
    SpinningRadio.Enabled := True;
    SpinningRadio.Checked := True;
  end;
  TypeRadioClick(nil);
  DatePicker.Enabled := Schedule.JobCount = 0;
//  DateLabel.Enabled := DatePicker.Enabled;
end;

procedure TJobForm.TypeRadioClick(Sender: TObject);
var
  vi: Boolean;
begin
  vi := SpinningRadio.Checked;
  FindEdit.Visible := vi;
  YarnList.Visible := vi;
  YarnLabel.Visible := vi;
  WeightEdit.Visible := vi;
  WeightLabel.Visible := vi;
  SpindlesEdit.Visible := vi;
  SpindlesLabel.Visible := vi;
  SpindlesUpDown.Visible := vi;
  MaxLabel.Visible := vi;
  SetOKButton;
end;

procedure TJobForm.CtrlChange(Sender: TObject);
begin
  SetOKButton;
end;

procedure TJobForm.SetOKButton;
begin
  OKButton.Enabled := CleaningRadio.Checked or
    ((YarnList.ItemIndex > 0) and (WeightEdit.Text <> ''));
end;

procedure TJobForm.OKButtonClick(Sender: TObject);
begin
  if StrToInt(SpindlesEdit.Text) < 1 then
    MessageDlg('At least one spindle must be used.', mtError, [mbOK], 0)
  else if StrToInt(SpindlesEdit.Text) > SpindlesUpDown.Max then
    MessageDlg('Cannot use more spindles than those available', mtError, [mbOK], 0)
  else
    ModalResult := mrOK;
end;

procedure TJobForm.FindEditChange(Sender: TObject);
var
  Buf: array[0..255] of Char;
begin
  StrPCopy(Buf, UpperCase(FindEdit.Text));
  YarnList.ItemIndex := YarnList.Perform(LB_SELECTSTRING, 0, LongInt(@Buf));
  CtrlChange(nil);
end;

procedure TJobForm.YarnListClick(Sender: TObject);
begin
  FindEdit.Text := YarnList.Items[YarnList.ItemIndex];
  CtrlChange(nil);
end;

procedure TJobForm.FindEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

end.
