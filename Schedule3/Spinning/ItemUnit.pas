unit ItemUnit;
//ScheduleBox[iSched][iJob][iItem]
//ScheduleBox[0][0][0]  is equal to :-
//ScheduleBox.Schedules[0].Jobs[0].Items[0]

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ODSched, SpinShed, ComCtrls;

type
  TItemForm = class(TForm)
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    WeightLabel: TLabel;
    WeightEdit: TEdit;
    SpindlesLabel: TLabel;
    SpindlesEdit: TEdit;
    MaxLabel: TLabel;
    SpindlesUpDown: TUpDown;
    Label1: TLabel;
    FindEdit: TEdit;
    YarnList: TListBox;
    procedure CtrlChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure YarnListClick(Sender: TObject);
    procedure FindEditKeyPress(Sender: TObject; var Key: Char);
  private
//     AvailSpindles: Integer;
  public
{     Schedule: TODJobSchedule;
     Job: TODSpinJob;
     Item: TODSpinJobItem;}
  end;

var
  ItemForm: TItemForm;

implementation

{$R *.DFM}

procedure TItemForm.CtrlChange(Sender: TObject);
begin
  OKButton.Enabled := (YarnList.ItemIndex > 0) and
    (WeightEdit.Text <> '') and (SpindlesEdit.Text <> '');
end;

procedure TItemForm.FormShow(Sender: TObject);
{var
  ix: Integer;}
begin
  OKButton.Enabled := False;
{  AvailSpindles := Schedule.Tag;
  for ix := 0 to Job.ItemCount-1 do
    Dec(AvailSpindles, Job[ix].Spindles);  //or Job.Items[ix].Spindles
  if Item <> nil then
    Inc(AvailSpindles, Item.Spindles);
  SpindlesLabel.Caption := 'Spindles (Avail: ' + IntToStr(AvailSpindles) + ')';}
end;

procedure TItemForm.OKButtonClick(Sender: TObject);
begin
  if StrToInt(SpindlesEdit.Text) <= 0 then
  begin
    MessageDlg('You must assign at least one spindle to this yarn',
      mtError, [mbOK], 0);
    Exit;
  end;
  if StrToInt(SpindlesEdit.Text) <= {AvailSpindles}SpindlesUpDown.Max then
    ModalResult := mrOK
  else
    MessageDlg('You have assigned ' + IntToStr(
      StrToInt(SpindlesEdit.Text) - {AvailSpindles}SpindlesUpDown.Max) +
      ' more spindles to this yarn that are available in this group',
      mtError, [mbOK], 0);
end;

procedure TItemForm.FindEditChange(Sender: TObject);
var
  Buf: array[0..255] of Char;
begin
  StrPCopy(Buf, UpperCase(FindEdit.Text));
  YarnList.ItemIndex := YarnList.Perform(LB_SELECTSTRING, 0, LongInt(@Buf));
  CtrlChange(nil);
end;

procedure TItemForm.YarnListClick(Sender: TObject);
begin
  FindEdit.Text := YarnList.Items[YarnList.ItemIndex];
  CtrlChange(nil);
end;

procedure TItemForm.FindEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

end.
