unit JobUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, Db, DBTables, ODPopCal, ODCalend,
  ODSched, ODWeaSch;

type
  TJobForm = class(TForm)
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    GroupBox1: TGroupBox;
    LengthLabel: TLabel;
    Label5: TLabel;
    EndsLabel: TLabel;
    TypeCombo: TComboBox;
    LengthEdit: TEdit;
    EndsCombo: TComboBox;
    Label2: TLabel;
    Calendar: TODCalendar;
    procedure FormShow(Sender: TObject);
    procedure TypeComboChange(Sender: TObject);
    procedure CtrlChange(Sender: TObject);
    procedure CalendarStartClick(Sender: TObject; var ADate: TDateTime);
    procedure CalendarFinishClick(Sender: TObject; var ADate: TDateTime);
    procedure CalendarSetupDay(Sender: TObject; ADate: TDateTime;
      var AColor: TColor; var AHint: String);
    procedure OKButtonClick(Sender: TObject);
  private
    CurStartDate: TDateTime;
    procedure UpdateOKButton;
  public
    EditJob: TODJob;
    IsFirstJob: Boolean;
  end;

var
  JobForm: TJobForm;

implementation

uses MainUnit;

{$R *.DFM}

procedure TJobForm.FormShow(Sender: TObject);
  procedure DoFocus(Ctrl: TWinControl);
  begin
    if Ctrl.Visible and Ctrl.Enabled then Ctrl.SetFocus;
  end;
begin
  OKButton.Enabled := False;
  CurStartDate := Calendar.StartDate;
  if not TypeCombo.Enabled then
    DoFocus(LengthEdit)
  else
    DoFocus(EndsCombo);
end;

procedure TJobForm.TypeComboChange(Sender: TObject);
begin
  if TypeCombo.ItemIndex = -1 then Exit;
  if Visible then
  begin
    with LengthEdit do
    begin
      Visible := TypeCombo.Items.Objects[TypeCombo.ItemIndex] is TStrings;
      LengthLabel.Visible := Visible;
      if Visible then SetFocus;
    end;
    with EndsCombo do
    begin
      Visible := TypeCombo.Items[TypeCombo.ItemIndex] = 'Reed';
      EndsLabel.Visible := Visible;
      if Items.Count > 0 then ItemIndex := 0;
      if Visible and Enabled then SetFocus;
    end;
    Calendar.SingleDate := EndsCombo.Visible;
    UpdateOKButton;
  end;
end;

procedure TJobForm.UpdateOKButton;
begin
  OKButton.Enabled := (TypeCombo.ItemIndex > -1) and
    ((LengthEdit.Visible and (LengthEdit.Text <> '')) or
     (EndsCombo.Visible and (EndsCombo.ItemIndex > -1)) or
     (TypeCombo.Items.Objects[TypeCombo.ItemIndex] = nil));
end;

procedure TJobForm.CtrlChange(Sender: TObject);
begin
  UpdateOKButton;
end;

procedure TJobForm.CalendarStartClick(Sender: TObject; var ADate: TDateTime);
begin
  if not Visible then Exit;
  with Calendar do
    if not IsFirstJob then     //if not the first job then
      StartDate := CurStartDate   //disallow start date change
    else
    begin    //adjust finish date accordingly to maintain duration
      FinishDate := FinishDate + (StartDate - CurStartDate);
      CurStartDate := StartDate;
    end;
end;

procedure TJobForm.CalendarFinishClick(Sender: TObject; var ADate: TDateTime);
begin
  with Calendar do
    if FinishDate < StartDate then
      FinishDate := StartDate;
  UpdateOKButton;
end;

procedure TJobForm.CalendarSetupDay(Sender: TObject; ADate: TDateTime;
  var AColor: TColor; var AHint: String);
begin
  if not IsFirstJob and (ADate = Int(Calendar.StartDate)) then
  begin
    AHint := 'Must start here';
    AColor := clRed;
  end;
end;

procedure TJobForm.OKButtonClick(Sender: TObject);
var
  iLength: double;
begin
  if (EditJob <> nil) and (EditJob is TODWeaveJob) then
    with TODWeaveJob(EditJob) do
      if WarpLength > StrToFloat(LengthEdit.Text) then
      begin
        iLength := WarpLength;
        WarpLength := StrToInt(LengthEdit.Text);
        MainForm.CalcRemCapacity(EditJob);
        try
          MainForm.CheckRemCapacity(EditJob, MainForm.FabricStructs[0], 0);
        except
          WarpLength := iLength;
          LengthEdit.SetFocus;
          raise Exception.Create(
            'This reduced length cannot support the current fabric items');
        end;
      end;
  ModalResult := mrOK;
end;

end.
