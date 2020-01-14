unit MaintUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, DBTables, Db, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls,
  ODCalend, StdCtrls, Mask, ODPopCal;

type
  TMaintForm = class(TForm)
    PageCtrl: TPageControl;
    NavButtons: TDBNavigator;
    EditButtons: TDBNavigator;
    ExitButton: TSpeedButton;
    TabSheet1: TTabSheet;
    Params: TTable;
    WorkHours: TTable;
    ParamsSource: TDataSource;
    WorkHoursSource: TDataSource;
    TabSheet2: TTabSheet;
    DayCalendar: TODCalendar;
    DBGrid1: TDBGrid;
    CopyFromBtn: TSpeedButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    AddUpToBtn: TSpeedButton;
    ClearUpToBtn: TSpeedButton;
    CalendarDlg: TODCalendarDialog;
    CopyLineBtn: TSpeedButton;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    MonthLabel: TLabel;
    WorkHoursWORKDAY: TDateTimeField;
    WorkHoursGROUP1HRS: TFloatField;
    WorkHoursGROUP2HRS: TFloatField;
    WorkHoursGROUP3HRS: TFloatField;
    ParamsSUNHRS: TFloatField;
    ParamsMONHRS: TFloatField;
    ParamsTUEHRS: TFloatField;
    ParamsWEDHRS: TFloatField;
    ParamsTHUHRS: TFloatField;
    ParamsFRIHRS: TFloatField;
    ParamsSATHRS: TFloatField;
    ParamsSPINCHANGEHRS: TFloatField;
    WorkHoursDAYNAME: TStringField;
    AQuery: TQuery;
    procedure FormShow(Sender: TObject);
    procedure PageCtrlChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DataSourceStateChange(Sender: TObject);
    procedure PageCtrlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure ExitButtonClick(Sender: TObject);
    procedure TableBeforeEdit(DataSet: TDataSet);
    procedure TableBeforeInsert(DataSet: TDataSet);
    procedure TableAfterPost(DataSet: TDataSet);
    procedure TableAfterCancel(DataSet: TDataSet);
    procedure TableDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure TableEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure TablePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure WorkHoursCalcFields(DataSet: TDataSet);
    procedure WorkHoursAfterScroll(DataSet: TDataSet);
    procedure DayCalendarStartClick(Sender: TObject; var ADate: TDateTime);
    procedure AddUpToBtnClick(Sender: TObject);
    procedure ClearUpToBtnClick(Sender: TObject);
    procedure CopyFromBtnClick(Sender: TObject);
    procedure TableBeforeDelete(DataSet: TDataSet);
    procedure TableAfterDelete(DataSet: TDataSet);
    procedure AQueryUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure WorkHoursAfterInsert(DataSet: TDataSet);
    procedure CopyLineBtnClick(Sender: TObject);
  private
    function CheckDataState: Boolean;
    procedure CopyFromGroup1;
  public
    WorkHoursChanged, ParamsChanged: Boolean;
    function GetDefaultWorkHours(WeekDay: Integer): Single;
  end;

var
  MaintForm: TMaintForm;

implementation

uses Main;

{$R *.DFM}

procedure TMaintForm.FormShow(Sender: TObject);
begin
  PageCtrl.ActivePage := TabSheet1;
  PageCtrlChange(nil);
  WorkHoursChanged := False;
  ParamsChanged := False;
end;

procedure TMaintForm.PageCtrlChange(Sender: TObject);
begin
  with NavButtons do
  begin
    if DataSource <> ParamsSource then
      DataSource.DataSet.Active := False;
    case PageCtrl.ActivePage.PageIndex of
      0: DataSource := WorkHoursSource;
      1: DataSource := ParamsSource;
    end;
    DataSource.DataSet.Active := True;
  end;
  EditButtons.DataSource := NavButtons.DataSource;
  ExitButton.Enabled := True;
end;

function TMaintForm.CheckDataState: Boolean;
begin
  Result := NavButtons.DataSource.DataSet.State in [dsBrowse, dsInactive];
  if not Result then
    MessageDlg('First save or cancel your edits', mtError, [mbOK], 0);
end;

procedure TMaintForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := CheckDataState;
end;

procedure TMaintForm.PageCtrlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := CheckDataState;
end;

procedure TMaintForm.DataSourceStateChange(Sender: TObject);
begin
  ExitButton.Enabled := NavButtons.DataSource.DataSet.State = dsBrowse;
  if NavButtons.DataSource = WorkHoursSource then
  begin
    CopyLineBtn.Enabled := ExitButton.Enabled;
    CopyFromBtn.Enabled := ExitButton.Enabled;
    AddUpToBtn.Enabled := ExitButton.Enabled;
    ClearUpToBtn.Enabled := ExitButton.Enabled;
  end;
end;

procedure TMaintForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMaintForm.TableBeforeEdit(DataSet: TDataSet);
begin
  MainForm.SchedDB.StartTransaction;
end;

procedure TMaintForm.TableBeforeDelete(DataSet: TDataSet);
begin
  MainForm.SchedDB.StartTransaction;
end;

procedure TMaintForm.TableAfterDelete(DataSet: TDataSet);
begin
  MainForm.SchedDB.Commit;
end;

procedure TMaintForm.TableBeforeInsert(DataSet: TDataSet);
begin
  MainForm.SchedDB.StartTransaction;
end;

procedure TMaintForm.TableAfterPost(DataSet: TDataSet);
begin
  MainForm.SchedDB.Commit;
  if DataSet = WorkHours then WorkHoursChanged := True
  else if DataSet = Params then ParamsChanged := True;
end;

procedure TMaintForm.TableAfterCancel(DataSet: TDataSet);
begin
  MainForm.SchedDB.Rollback;
end;

procedure TMaintForm.TableDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daFail;
end;

procedure TMaintForm.TableEditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daFail;
end;

procedure TMaintForm.TablePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daFail;
end;

procedure TMaintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  NavButtons.DataSource.DataSet.Close;
end;

procedure TMaintForm.FormCreate(Sender: TObject);
begin
  Height := 337;
  Params.Open;
end;

procedure TMaintForm.WorkHoursCalcFields(DataSet: TDataSet);
var
  yr, mo, dy: Word;
begin
  DecodeDate(WorkHoursWORKDAY.AsDateTime, yr, mo, dy);
  WorkHoursDAYNAME.AsString := IntToStr(dy) + ' ' +
    ShortDayNames[DayOfWeek(WorkHoursWORKDAY.AsDateTime)];
end;

procedure TMaintForm.WorkHoursAfterScroll(DataSet: TDataSet);
var
  yr, mo, dy: Word;
begin
  if WorkHours.RecordCount > 0 then
  begin
    DayCalendar.StartDate := WorkHoursWORKDAY.AsDateTime;
    DecodeDate(WorkHoursWORKDAY.AsDateTime, yr, mo, dy);
  end
  else
  begin
    DayCalendar.StartDate := Date;
    DecodeDate(Date, yr, mo, dy);
  end;
  DayCalendar.DisplayYear := yr;
  DayCalendar.DisplayMonth := mo;
  MonthLabel.Caption := LongMonthNames[mo];
end;

procedure TMaintForm.DayCalendarStartClick(Sender: TObject;
  var ADate: TDateTime);
begin
  if WorkHours.RecordCount > 0 then
  begin
    if not WorkHours.FindKey([ADate]) then  //can only select in existing range
      ADate := WorkHoursWORKDAY.AsDateTime;
  end
  else ADate := Date;
end;

procedure TMaintForm.AddUpToBtnClick(Sender: TObject);
var
  NextDate: TDateTime;
  TempFormat, st: string;
begin
  CalendarDlg.Caption := 'Add To Work Schedule Up To :-';
  if CalendarDlg.Execute then
  begin
    MainForm.SchedDB.StartTransaction;
    TempFormat := ShortDateFormat;
    ShortDateFormat := 'dd-mmm-yyyy';
    try
      with AQuery do
      begin
        SQL.Clear;
        SQL.Add('select max(workday) from spinworkhours');
        Open;
        NextDate := Fields[0].AsDateTime + 1;
        Close;
        while NextDate <= CalendarDlg.StartDate do
        begin
          SQL.Clear;
          SQL.Add('insert into spinworkhours (workday,group1hrs,group2hrs,group3hrs)');
          st := ',' + FloatToStr(GetDefaultWorkHours(DayOfWeek(NextDate)));
          SQL.Add('values ("' + DateToStr(NextDate) + '"' + st + st + st + ')');
          ExecSQL;
          NextDate := NextDate + 1;
        end;
      end;
    finally
      ShortDateFormat := TempFormat;
      MainForm.SchedDB.Commit;
    end;
    WorkHours.Refresh;
  end;
  WorkHoursChanged := True;
end;

procedure TMaintForm.ClearUpToBtnClick(Sender: TObject);
var
  TempFormat: string;
begin
  CalendarDlg.Caption := 'Clear Work Schedule Up To :-';
  CalendarDlg.StartDate := WorkHoursWORKDAY.AsDateTime;
  if CalendarDlg.Execute then
  begin
    MainForm.SchedDB.StartTransaction;
    TempFormat := ShortDateFormat;
    ShortDateFormat := 'dd-mmm-yyyy';
    try
      with AQuery do
      begin
        SQL.Clear;
        SQL.Add('delete from spinworkhours');
        SQL.Add('where workday < "' + DateToStr(CalendarDlg.StartDate) + '"');
        ExecSQL;
      end;
    finally
      ShortDateFormat := TempFormat;
      MainForm.SchedDB.Commit;
    end;
    WorkHours.Refresh;
  end;
  WorkHoursChanged := True;
end;

procedure TMaintForm.CopyLineBtnClick(Sender: TObject);
begin
  WorkHours.Edit;
  CopyFromGroup1;
  WorkHours.Post;
end;

procedure TMaintForm.CopyFromBtnClick(Sender: TObject);
var
  bmk: TBookmark;
begin
  if MessageDlg('Copy over all Group1''s work hours to all the other groups ' +
    'from the current day (' + WorkHoursWORKDAY.AsString + ')?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  with WorkHours do
  begin
    bmk := GetBookmark;
    DisableControls;
    try
      while not EOF do
      begin
        Edit;
        CopyFromGroup1;
        Post;
        Next;
      end;
      GotoBookmark(bmk);
    finally
      EnableControls;
      FreeBookmark(bmk);
    end;
  end;
end;

procedure TMaintForm.AQueryUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  MainForm.SchedDB.Rollback;
end;

procedure TMaintForm.WorkHoursAfterInsert(DataSet: TDataSet);
begin
  with AQuery do
  begin
    SQL.Clear;
    SQL.Add('select max(workday) from spinworkhours');
    Open;
    WorkHoursWORKDAY.AsDateTime := Fields[0].AsDateTime + 1;
    Close;
  end;
  WorkHoursGROUP1HRS.AsFloat :=
    GetDefaultWorkHours(DayOfWeek(WorkHoursWORKDAY.AsDateTime));
  CopyFromGroup1;
end;

function TMaintForm.GetDefaultWorkHours(WeekDay: Integer): Single;
begin
  case WeekDay of
    1: Result := ParamsSUNHRS.AsFloat;
    2: Result := ParamsMONHRS.AsFloat;
    3: Result := ParamsTUEHRS.AsFloat;
    4: Result := ParamsWEDHRS.AsFloat;
    5: Result := ParamsTHUHRS.AsFloat;
    6: Result := ParamsFRIHRS.AsFloat;
    7: Result := ParamsSATHRS.AsFloat;
    else Result := 0;
  end;
end;

procedure TMaintForm.CopyFromGroup1;
begin
  WorkHoursGROUP2HRS.AsFloat := WorkHoursGROUP1HRS.AsFloat;
  WorkHoursGROUP3HRS.AsFloat := WorkHoursGROUP1HRS.AsFloat;
end;

end.
