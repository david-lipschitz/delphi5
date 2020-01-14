unit MaintUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, DBTables, Db, Grids, DBGrids, ComCtrls, ExtCtrls, DBCtrls,
  ODCalend, StdCtrls, Mask, ODPopCal;

type
  TMaintForm = class(TForm)
    PageCtrl: TPageControl;
    LoomsPage: TTabSheet;
    WarpsPage: TTabSheet;
    FabricsPage: TTabSheet;
    LoomSpec: TTable;
    LoomSpecSource: TDataSource;
    LoomSpecGrid: TDBGrid;
    LoomSpecREF: TStringField;
    LoomSpecPOSN: TIntegerField;
    LoomSpecDESCR: TStringField;
    WarpType: TTable;
    WarpTypeSource: TDataSource;
    WarpTypeGrid: TDBGrid;
    WarpTypeWARPTYPE: TStringField;
    WarpTypeTOTALENDS: TIntegerField;
    WarpTypeDENTSPERCM: TFloatField;
    WarpTypeAVEHRS: TFloatField;
    WarpTypeGREIGELENPERCENT: TFloatField;
    WarpTypeWARPLEN: TIntegerField;
    WarpTypeWARPWGT: TFloatField;
    FabricType: TTable;
    FabricTypeFABRICSTRU: TStringField;
    FabricTypeFABRICCOL: TStringField;
    FabricTypeWARPTYPE: TStringField;
    FabricTypeWARPCOL: TStringField;
    FabricTypeWEFTSTRU: TStringField;
    FabricTypeWEFTTWIST: TStringField;
    FabricTypeWEFTCOL: TStringField;
    FabricTypePIECELEN: TIntegerField;
    FabricTypeWARPPCEWGT: TFloatField;
    FabricTypeWEFTPCEWGT: TFloatField;
    FabricTypeHRSPERPIECE: TFloatField;
    FabricTypeSource: TDataSource;
    FabricsGrid: TDBGrid;
    StruLoomPage: TTabSheet;
    StruLoomGrid: TDBGrid;
    StruLoom: TTable;
    StruLoomFABRICSTRU: TStringField;
    StruLoomLOOMTYPE: TStringField;
    StruLoomSource: TDataSource;
    FabricStruGrid: TDBGrid;
    FabricStruQuery: TQuery;
    FabricStruSource: TDataSource;
    FabricStruQueryFABRICSTRU: TStringField;
    LoomTypeGrid: TDBGrid;
    AddButton: TSpeedButton;
    RemoveButton: TSpeedButton;
    LoomTypeQuery: TQuery;
    LoomTypeSource: TDataSource;
    DowntimesPage: TTabSheet;
    DBGrid4: TDBGrid;
    DowntimeType: TTable;
    DowntimeTypeDESCR: TStringField;
    DowntimeTypeSource: TDataSource;
    NavButtons: TDBNavigator;
    EditButtons: TDBNavigator;
    ExitButton: TSpeedButton;
    HelpButton: TSpeedButton;
    WarpTypeQuery: TQuery;
    WarpTypeQueryWARPTYPE: TStringField;
    CopyButton: TSpeedButton;
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
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBCheckBox8: TDBCheckBox;
    ParamsSUNHRS: TFloatField;
    ParamsMONHRS: TFloatField;
    ParamsTUEHRS: TFloatField;
    ParamsWEDHRS: TFloatField;
    ParamsTHUHRS: TFloatField;
    ParamsFRIHRS: TFloatField;
    ParamsSATHRS: TFloatField;
    WorkHoursWORKDAY: TDateTimeField;
    WorkHoursDAYNAME: TStringField;
    AddUpToBtn: TSpeedButton;
    ClearUpToBtn: TSpeedButton;
    CalendarDlg: TODCalendarDialog;
    AQuery: TQuery;
    WorkHoursLOOM1HRS: TFloatField;
    WorkHoursLOOM2HRS: TFloatField;
    WorkHoursLOOM3HRS: TFloatField;
    WorkHoursLOOM4HRS: TFloatField;
    WorkHoursLOOM5HRS: TFloatField;
    WorkHoursLOOM6HRS: TFloatField;
    WorkHoursLOOM7HRS: TFloatField;
    WorkHoursLOOM8HRS: TFloatField;
    WorkHoursLOOM9HRS: TFloatField;
    WorkHoursLOOM10HRS: TFloatField;
    CopyLineBtn: TSpeedButton;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    ParamsREELCHANGEHRS: TFloatField;
    MonthLabel: TLabel;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    ActiveScenarioCombo: TDBLookupComboBox;
    ParamsACTIVESCENARIO: TIntegerField;
    LoomSpecLOOMSPECTYPE: TStringField;
    LoomTypeQueryLOOMSPECTYPE: TStringField;
    btnReplicateStats: TButton;
    qryReplStats: TQuery;
    qryReplStatsNUMTOGO: TIntegerField;
    dbVBStockLinux: TDatabase;
    Label12: TLabel;
    edtFirstUser: TDBEdit;
    WorkHoursLOOM11HRS: TFloatField;
    WorkHoursLOOM12HRS: TFloatField;
    btnUpdateL11L12: TButton;
    WorkHoursLOOM13HRS: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure PageCtrlChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DataSourceStateChange(Sender: TObject);
    procedure DBGridEnter(Sender: TObject);
    procedure PageCtrlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure ExitButtonClick(Sender: TObject);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure StruLoomAfterScroll(DataSet: TDataSet);
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
    procedure LoomTypeQueryAfterOpen(DataSet: TDataSet);
    procedure AddButtonClick(Sender: TObject);
    procedure RemoveButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StruLoomPageEnter(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
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
    procedure CalendarDlgStartClick(Sender: TObject; var ADate: TDateTime);
    procedure DayCalendarChange(Sender: TObject);
    procedure btnReplicateStatsClick(Sender: TObject);
    procedure btnUpdateL11L12Click(Sender: TObject);
  private
    Exiting:boolean;
    function CheckDataState: Boolean;
    procedure RefreshQueries;
    procedure CopyFromLoom1;
  public
    WorkHoursChanged, ParamsChanged: Boolean;
    function GetDefaultWorkHours(WeekDay: Integer): Single;
  end;

var
  MaintForm: TMaintForm;

implementation

uses MainUnit;

{$R *.DFM}

procedure TMaintForm.FormShow(Sender: TObject);
begin
  btnUpdateL11L12.Visible:=false; //added DL110525 - make visible on WorkHours page if required
  Exiting:=false; //added by DL170501
  DayCalendar.DisplayYear:=2001; //added by DL260401
  DayCalendar.DisplayMonth:=4; //added by DL260401
  PageCtrl.ActivePage := LoomsPage;
  PageCtrlChange(nil);
  WorkHoursChanged := False;
  ParamsChanged := False;
  Params.Refresh;
end;

procedure TMaintForm.PageCtrlChange(Sender: TObject);
var
  TodaysDate:TDateTime; //added DL260401
begin
  with NavButtons do
  begin
    if DataSource <> ParamsSource then
      DataSource.DataSet.Active := False;
    case PageCtrl.ActivePage.PageIndex of
      0: DataSource := LoomSpecSource;
      1: DataSource := WarpTypeSource;
      2: DataSource := FabricTypeSource;
      3: DataSource := StruLoomSource;
      4: DataSource := DowntimeTypeSource;
      5: DataSource := WorkHoursSource;
      6, 7: DataSource := ParamsSource;
    end;
    DataSource.DataSet.Active := True;
    case PageCtrl.ActivePage.PageIndex of //added by DL260401
      5: begin //added by DL260401
           TodaysDate:=date;
           // xx do a lookup of current year and month
           DayCalendar.DisplayYear:=2001; //added by DL260401
           DayCalendar.DisplayMonth:=4; //added by DL260401
           if not WorkHours.FindKey([TodaysDate]) then  //can only select in existing range
           begin
             WorkHours.First;
           end;
           WorkHoursAfterScroll(WorkHours);
           if WorkHoursLOOM13HRS.IsNull then //added DL110525
             btnUpdateL11L12.Visible:=true
           else
             btnUpdateL11L12.Visible:=false;
         end; //added by DL260401
    end; //added by DL260401
  end;
  with EditButtons do
  begin
    if NavButtons.DataSource = StruLoomSource then
      DataSource := nil
    else
      DataSource := NavButtons.DataSource;
    Visible := DataSource <> nil;
    if (DataSource = WorkHoursSource) or (DataSource = ParamsSource) then
      VisibleButtons := [nbEdit,nbPost,nbCancel]
    else
      VisibleButtons := [nbInsert,nbDelete,nbEdit,nbPost,nbCancel]
  end;
  if NavButtons.DataSource = ParamsSource then
    ExitButton.Enabled := True;
  CopyButton.Visible := PageCtrl.ActivePage.PageIndex < 3;
  FabricStruQuery.Active := StruLoom.Active;
  LoomTypeQuery.Active := StruLoom.Active;
  if FabricType.Active then
  begin
    FabricsGrid.Columns[2].PickList.Clear;
    WarpTypeQuery.Open;
    WarpTypeQuery.First;
    while not WarpTypeQuery.EOF do
    begin
      FabricsGrid.Columns[2].PickList.Add(WarpTypeQueryWARPTYPE.AsString);
      WarpTypeQuery.Next;
    end;
    WarpTypeQuery.Close;
  end;
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

procedure TMaintForm.DBGridEnter(Sender: TObject);
begin
  NavButtons.DataSource := (Sender as TDBGrid).DataSource;
  if Sender = StruLoomGrid then
  begin
    with StruLoomGrid do
      Options := Options + [dgRowSelect, dgAlwaysShowSelection];
    StruLoomAfterScroll(nil);
  end;
end;

procedure TMaintForm.ExitButtonClick(Sender: TObject);
begin
  Exiting:=true;
  Close;
end;

procedure TMaintForm.StruLoomAfterScroll(DataSet: TDataSet);
  procedure FindRow(DataSet: TDataSet; DataStr: string);
  begin
{}  DataSet.Open;
    with DataSet do
    begin
      DisableControls;
      First;
      while not EOF and (Fields[0].AsString <> DataStr) do
        Next;
      EnableControls;
    end;
  end;
begin
  if StruLoomGrid.Focused then
  begin
{}  StruLoom.Open;
    FindRow(FabricStruQuery, StruLoomFABRICSTRU.AsString);
    FindRow(LoomTypeQuery, StruLoomLOOMTYPE.AsString);
    AddButton.Enabled := False;
    RemoveButton.Enabled := StruLoom.RecordCount > 0;
  end;
end;

procedure TMaintForm.QueryAfterScroll(DataSet: TDataSet);
begin
  if FabricStruGrid.Focused or LoomTypeGrid.Focused then
  begin
    AddButton.Enabled := (FabricStruQuery.RecordCount > 0) and
      (LoomTypeQuery.RecordCount > 0) and not StruLoom.FindKey([
      FabricStruQueryFABRICSTRU.AsString, LoomTypeQueryLOOMSPECTYPE.AsString]);
    with StruLoomGrid do
      if AddButton.Enabled then
        Options := Options - [dgRowSelect, dgAlwaysShowSelection]
      else
        Options := Options + [dgRowSelect, dgAlwaysShowSelection];
    RemoveButton.Enabled := not AddButton.Enabled;
  end;
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

procedure TMaintForm.LoomTypeQueryAfterOpen(DataSet: TDataSet);
begin
//StruLoomAfterScroll(nil);
end;

procedure TMaintForm.AddButtonClick(Sender: TObject);
begin
  StruLoom.Insert;
  StruLoomFABRICSTRU.AsString := FabricStruQueryFABRICSTRU.AsString;
  StruLoomLOOMTYPE.AsString := LoomTypeQueryLOOMSPECTYPE.AsString;
  StruLoom.Post;
  RefreshQueries;
end;

procedure TMaintForm.RemoveButtonClick(Sender: TObject);
begin
  StruLoom.Delete;
  RefreshQueries;
end;

procedure TMaintForm.RefreshQueries;
begin
  StruLoomGrid.SetFocus;
  FabricStruQuery.Close;
  FabricStruQuery.Open;
  LoomTypeQuery.Close;
  LoomTypeQuery.Open;
  StruLoomAfterScroll(nil);
end;

procedure TMaintForm.HelpButtonClick(Sender: TObject);
begin
  MessageDlg('Specify what fabric structures can go on a loom type' +
    ' by adding the combinations.'#13'Note that the add button is only enabled' +
    ' when a combination does not already exist (when it is not highlighted).'#13 +
    'Tip: To see which fabrics are not defined for a loom type, select that ' +
    'loom type and scroll through the available fabric structures.',
    mtInformation, [mbOK], 0);
end;

procedure TMaintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  NavButtons.DataSource.DataSet.Close;
  FabricStruQuery.Close;
  LoomTypeQuery.Close;
end;

procedure TMaintForm.StruLoomPageEnter(Sender: TObject);
begin
//DeleteButton.Enabled := StruLoom.RecordCount > 0;
end;

procedure TMaintForm.CopyButtonClick(Sender: TObject);
var
  sRow, sFld: string;
  iFld, iStr: Integer;
begin
  sRow := '';
  with NavButtons.DataSource.DataSet do
  begin
    if RecordCount > 0 then
      for iFld := 0 to FieldCount-1 do
        sRow := sRow + Fields[iFld].AsString + ';';
    Insert;
    if sRow <> '' then
    begin
      sFld := '';
      iFld := 0;
      for iStr := 1 to Length(sRow) do
      begin
        if sRow[iStr] = ';' then
        begin
          if (iFld < FieldCount) and
             (Fields[iFld].FieldName <> 'WARPTYPE') and
             (Fields[iFld].FieldName <> 'WARPCOL') and
             (Fields[iFld].FieldName <> 'FABRICSTRU') and
             (Fields[iFld].FieldName <> 'FABRICCOL') and
             (Fields[iFld].FieldName <> 'WORKDAY') then
            Fields[iFld].AsString := sFld;
          sFld := '';
          Inc(iFld);
        end
        else sFld := sFld + sRow[iStr];
      end;
    end;
  end;
end;

procedure TMaintForm.FormCreate(Sender: TObject);
begin
  Height := 381; //was 337; DL110525
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
  DayCalendar.StartDate := WorkHoursWORKDAY.AsDateTime;
  DecodeDate(WorkHoursWORKDAY.AsDateTime, yr, mo, dy);
  DayCalendar.DisplayYear := yr;
  DayCalendar.DisplayMonth := mo;
  MonthLabel.Caption := LongMonthNames[mo]+' '+inttostr(yr); //yr added DL060114
end;

procedure TMaintForm.DayCalendarStartClick(Sender: TObject;
  var ADate: TDateTime);
begin
  if not WorkHours.FindKey([ADate]) then  //can only select in existing range
  begin
//    WorkHours.Last;
    ADate := WorkHoursWORKDAY.AsDateTime;
  end;
end;

procedure TMaintForm.AddUpToBtnClick(Sender: TObject);
var
  NextDate: TDateTime;
  TempFormat, st: string;
  yr, mo, dy: Word;
begin
  CalendarDlg.Caption := 'Add To Work Schedule Up To :-';
  DecodeDate(WorkHoursWORKDAY.AsDateTime, yr, mo, dy);
  CalendarDlg.DisplayYear:=yr;
  CalendarDlg.DisplayMonth:=mo;
  CalendarDlg.StartDate:=WorkHoursWORKDAY.AsDateTime; //added DL17052001
  if CalendarDlg.Execute then
  begin
    MainForm.SchedDB.StartTransaction;
    TempFormat := ShortDateFormat;
    ShortDateFormat := 'dd-mmm-yyyy';
    try
      with AQuery do
      begin
        SQL.Clear;
        SQL.Add('select max(workday) from workhours');
        Open;
        NextDate := Fields[0].AsDateTime + 1;
        Close;
        while NextDate <= CalendarDlg.StartDate do
        begin
          SQL.Clear;
          SQL.Add('insert into workhours (workday,loom1hrs,loom2hrs,loom3hrs,' +
            'loom4hrs,loom5hrs,loom6hrs,loom7hrs,loom8hrs,loom9hrs,loom10hrs,loom11hrs,loom12hrs,loom13hrs)'); //mod DL110425
          st := ',' + FloatToStr(GetDefaultWorkHours(DayOfWeek(NextDate)));
          SQL.Add('values ("' + DateToStr(NextDate) + '"' +
            st + st + st + st + st + st + st + st + st + st + st + st + st +')'); //3 extra "st +" added DL110425
          ExecSQL;
          NextDate := NextDate + 1;
        end;
      end;
    finally
      ShortDateFormat := TempFormat;
      MainForm.SchedDB.Commit;
    end;
    WorkHours.Refresh;
    WorkHoursChanged := True;
  end;
end;

procedure TMaintForm.ClearUpToBtnClick(Sender: TObject);
var
  TempFormat: string;
  yr, mo, dy: Word;
begin
  CalendarDlg.Caption := 'Add To Work Schedule Up To :-';
  DecodeDate(WorkHoursWORKDAY.AsDateTime, yr, mo, dy);
  CalendarDlg.DisplayYear:=yr;
  CalendarDlg.DisplayMonth:=mo;
  CalendarDlg.StartDate:=WorkHoursWORKDAY.AsDateTime; //added DL17052001
  if CalendarDlg.Execute then
  begin
    MainForm.SchedDB.StartTransaction;
    TempFormat := ShortDateFormat;
    ShortDateFormat := 'dd-mmm-yyyy';
    try
      with AQuery do
      begin
        SQL.Clear;
        SQL.Add('delete from workhours');
        SQL.Add('where workday < "' + DateToStr(CalendarDlg.StartDate) + '"');
        ExecSQL;
      end;
    finally
      ShortDateFormat := TempFormat;
      MainForm.SchedDB.Commit;
    end;
    WorkHours.Refresh;
    WorkHoursChanged := True;
  end;
end;

procedure TMaintForm.CopyLineBtnClick(Sender: TObject);
begin
  WorkHours.Edit;
  CopyFromLoom1;
  WorkHours.Post;
end;

procedure TMaintForm.CopyFromBtnClick(Sender: TObject);
var
  bmk: TBookmark;
begin
  if MessageDlg('Copy over all Loom1''s work hours to all the other looms ' +
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
        CopyFromLoom1;
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
    SQL.Add('select max(workday) from workhours');
    Open;
    WorkHoursWORKDAY.AsDateTime := Fields[0].AsDateTime + 1;
    Close;
  end;
  WorkHoursLOOM1HRS.AsFloat :=
    GetDefaultWorkHours(DayOfWeek(WorkHoursWORKDAY.AsDateTime));
  CopyFromLoom1;
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

procedure TMaintForm.CopyFromLoom1;
var
  nu: Single;
begin
  nu := WorkHoursLOOM1HRS.AsFloat;
  WorkHoursLOOM2HRS.AsFloat := nu;
  WorkHoursLOOM3HRS.AsFloat := nu;
  WorkHoursLOOM4HRS.AsFloat := nu;
  WorkHoursLOOM5HRS.AsFloat := nu;
  WorkHoursLOOM6HRS.AsFloat := nu;
  WorkHoursLOOM7HRS.AsFloat := nu;
  WorkHoursLOOM8HRS.AsFloat := nu;
  WorkHoursLOOM9HRS.AsFloat := nu;
  WorkHoursLOOM10HRS.AsFloat := nu;
  WorkHoursLOOM11HRS.AsFloat := nu; //added DL110425
  WorkHoursLOOM12HRS.AsFloat := nu; //added DL110425
  WorkHoursLOOM13HRS.AsFloat := nu; //added DL110425 & DL110525
end;

procedure TMaintForm.CalendarDlgStartClick(Sender: TObject;
  var ADate: TDateTime);
begin
{  if (Pos('Clear', CalendarDlg.Caption) > 0) and (ADate >= Date) then
    ADate := 0;}
end;

procedure TMaintForm.DayCalendarChange(Sender: TObject);
var
  yr, mo, dy: Word;
begin
  if Exiting then
    Exit;
  //DayCalendar.StartDate := WorkHoursWORKDAY.AsDateTime;
  DecodeDate(WorkHoursWORKDAY.AsDateTime, yr, mo, dy);
  DayCalendar.DisplayYear := yr;
  DayCalendar.DisplayMonth := mo;
  MonthLabel.Caption := LongMonthNames[mo]+' '+inttostr(yr); //yr added DL060114
end;

procedure TMaintForm.btnReplicateStatsClick(Sender: TObject);
begin
  //must connect directly to the Linux server
  try
    if not dbVBStockLinux.Connected then
      dbVBStockLinux.Connected:=true;
    qryReplStats.Close;
    qryReplStats.Open;
    ShowMessage(qryReplStatsNUMTOGO.AsString+' rows still to replicate');
  finally
    qryReplStats.Close;
    dbVBStockLinux.Connected:=false;
  end;
end;

procedure TMaintForm.btnUpdateL11L12Click(Sender: TObject);
var
  nu: Single;
begin
  //added to set up the data DL110425
  if MessageDlg('Copy L1 to L11,L12,L13 (only do this once)?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  with WorkHours do
  begin
    First;
    while not EOF do
    begin
      Edit;
      nu := WorkHoursLOOM1HRS.AsFloat;
      WorkHoursLOOM11HRS.AsFloat := nu;
      WorkHoursLOOM12HRS.AsFloat := nu;
      WorkHoursLOOM13HRS.AsFloat := nu; //DL110525
      Post;
      Next;
    end;
  end;
  ShowMessage('Done');
end;

end.
