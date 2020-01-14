unit Main;
//ScheduleBox[iSched][iJob][iItem]
//ScheduleBox[0][0][0]  is equal to :-
//ScheduleBox.Schedules[0].Jobs[0].Items[0]

{The schedules' Tag properties are used to store the number of spindles in
  the group & their ScheduleNo properties store their indexes - Group 1, 2 & 3
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, StdCtrls, Mask, DBCtrls, Buttons,
  ODSched, SpinShed, ComCtrls, Grids, DBGrids, ODDBCbx, ODPopCal,
  Menus, ODDatPrn;

type
  TMainForm = class(TForm)
    Group1: TODJobSchedule;
    Group2: TODJobSchedule;
    Group3: TODJobSchedule;
    Panel1: TPanel;
    StockDB: TDatabase;
    SchedDB: TDatabase;
    YarnType: TTable;
    YarnTypeYNSTRU: TStringField;
    YarnTypeYNCOL: TStringField;
    YarnTypeINSTOCK: TFloatField;
    YarnTypeYNTWIST: TStringField;
    YarnTypeYNTYPE: TStringField;
    Scenario: TTable;
    SpinJob: TTable;
    ScenarioSource: TDataSource;
    SpinJobSource: TDataSource;
    SpinItem: TTable;
    SpinItemSource: TDataSource;
    CleanJob: TTable;
    ToolPanel: TPanel;
    SaveButton: TSpeedButton;
    LoadButton: TSpeedButton;
    ClearButton: TSpeedButton;
    PrintButton: TSpeedButton;
    OutputButton: TSpeedButton;
    ExitButton: TSpeedButton;
    ReqmtsButton: TSpeedButton;
    AboutButton: TSpeedButton;
    MaintButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    MaxSpinPlanNoQuery: TQuery;
    SpinJobSCENARIONO: TIntegerField;
    SpinJobJOBNO: TIntegerField;
    SpinJobGROUPNO: TIntegerField;
    SpinJobPLACENO: TIntegerField;
    SpinJobSTARTDATE: TDateTimeField;
    SpinJobFINISHDATE: TDateTimeField;
    SpinItemSCENARIONO: TIntegerField;
    SpinItemJOBNO: TIntegerField;
    SpinItemITEMNO: TIntegerField;
    SpinItemGROUPNO: TIntegerField;
    SpinItemPLACENO: TIntegerField;
    SpinItemSTRUCT: TStringField;
    SpinItemTWIST: TStringField;
    SpinItemCOLOR: TStringField;
    SpinItemWEIGHT: TIntegerField;
    SpinItemHOURSPERKG: TFloatField;
    SpinItemSPINDLES: TIntegerField;
    CleanJobSCENARIONO: TIntegerField;
    CleanJobJOBNO: TIntegerField;
    CleanJobGROUPNO: TIntegerField;
    CleanJobPLACENO: TIntegerField;
    CleanJobSTARTDATE: TDateTimeField;
    CleanJobFINISHDATE: TDateTimeField;
    ScenarioSCENARIONO: TIntegerField;
    ScenarioDESCR: TStringField;
    YarnHrsQuery: TQuery;
    JobNoProc: TStoredProc;
    MaxItemNoQuery: TQuery;
    KgsPerHourQuery: TQuery;
    KgsPerHourQueryPRODHRSPDL: TFloatField;
    Status: TStatusBar;
    MsgTimer: TTimer;
    DataPrinter: TODDataPrinter;
    WeaveScenario: TTable;
    WeaveScenarioSCENARIONO: TIntegerField;
    WeaveScenarioDESCR: TStringField;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    TypeCombo: TComboBox;
    GroupCombo: TComboBox;
    ReqGrid: TDBGrid;
    WeftReqDateQuery: TQuery;
    WeftReqDateQuerySTARTDATE: TDateTimeField;
    WeftReqDateQueryWEFTSTRU: TStringField;
    WeftReqDateQueryWEFTTWIST: TStringField;
    WeftReqDateQueryWEFTCOL: TStringField;
    WeftReqDateQueryWEFTPCEWGT: TFloatField;
    WeftReqDateQueryWEFTWEIGHT: TFloatField;
    WeaveReqSource: TDataSource;
    WeftReqJobQuery: TQuery;
    WeftReqJobQueryJOBNO: TIntegerField;
    DateTimeField1: TDateTimeField;
    WeftReqJobQueryWEFTSTRU: TStringField;
    WeftReqJobQueryWEFTTWIST: TStringField;
    WeftReqJobQueryWEFTCOL: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    WarpReqDateQuery: TQuery;
    DateTimeField2: TDateTimeField;
    WarpReqDateQueryWARPTYPE: TStringField;
    WarpReqDateQueryWARPCOL: TStringField;
    WarpReqDateQueryWARPWEIGHT: TFloatField;
    WarpReqJobQuery: TQuery;
    WarpReqJobQueryJOBNO: TIntegerField;
    DateTimeField3: TDateTimeField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField3: TFloatField;
    RangeCalendar: TODPopupCalendar;
    DateQuery: TQuery;
    DateQueryMIN: TDateTimeField;
    DateQueryMAX: TDateTimeField;
    ScenarioCombo: TComboBox;
    WarpReqDateQueryINSTOCK: TFloatField;
    WarpReqDateQueryREQUIRED: TFloatField;
    WarpReqJobQueryINSTOCK: TFloatField;
    WarpReqJobQueryREQUIRED: TFloatField;
    WeftReqDateQueryINSTOCK: TFloatField;
    WeftReqDateQueryREQUIRED: TFloatField;
    WeftReqJobQueryINSTOCK: TFloatField;
    WeftReqJobQueryREQUIRED: TFloatField;
    WeftRegQuery: TQuery;
    DateTimeField4: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField4: TFloatField;
    IntegerField2: TIntegerField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    WarpLeftQuery: TQuery;
    WarpLeftQuerySUM: TFloatField;
    WarpReqTypeQuery: TQuery;
    WarpReqTypeQueryINSTOCK: TFloatField;
    WarpReqTypeQueryREQUIRED: TFloatField;
    WeftReqTypeQuery: TQuery;
    WeftReqTypeQueryINSTOCK: TFloatField;
    WeftReqTypeQueryREQUIRED: TFloatField;
    WeftReqTypeQueryMIN: TDateTimeField;
    WeftReqTypeQueryWEFTSTRU: TStringField;
    WeftReqTypeQueryWEFTTWIST: TStringField;
    WeftReqTypeQueryWEFTCOL: TStringField;
    WeftReqTypeQueryWEFTPCEWGT: TFloatField;
    WarpReqTypeQueryMIN: TDateTimeField;
    WarpReqTypeQueryWARPTYPE: TStringField;
    WarpReqTypeQueryWARPCOL: TStringField;
    WarpReqTypeQueryWARPWEIGHT: TFloatField;
    VBStkDB: TDatabase;
    WeftReqTypeQueryWEFTWEIGHT: TFloatField;
    ReqNav: TDBNavigator;
    ReqPopup: TPopupMenu;
    AddToGroup1: TMenuItem;
    AddToGroup2: TMenuItem;
    AddToGroup3: TMenuItem;
    YarnCol: TTable;
    YarnColYNCOL: TStringField;
    YarnColDARKNESS: TIntegerField;
    SortButton: TSpeedButton;
    WarpReqTypeQueryWARPLEN: TFloatField;
    WeftReqTypeQuerySUM: TFloatField;
    WarpReqDateQueryWARPLEN: TFloatField;
    WeftReqDateQuerySUM: TFloatField;
    WarpReqJobQueryWARPLEN: TFloatField;
    WeftReqJobQuerySUM: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure DoJobAdd(Schedule: TODJobSchedule);
    procedure DoItemAdd(Schedule: TODJobSchedule; Job: TODJob);
    procedure DoItemEdit(Schedule: TODJobSchedule; Job: TODJob;
      Item: TODJobItem);
    procedure AfterJobAdd(Schedule: TODJobSchedule; Job: TODJob);
    procedure AfterItemAdd(Schedule: TODJobSchedule; Job: TODJob;
      Item: TODJobItem);
    procedure AfterItemEdit(Schedule: TODJobSchedule; Job: TODJob;
      Item: TODJobItem);
    procedure BeforeItemRemove(Schedule: TODJobSchedule; Job: TODJob;
      Item: TODJobItem);
    procedure MaintButtonClick(Sender: TObject);
    procedure AfterItemRemove(Schedule: TODJobSchedule; Job: TODJob);
    procedure AfterJobRemove(Schedule: TODJobSchedule);
    procedure AfterJobEdit(Schedule: TODJobSchedule; Job: TODJob);
    procedure JobDragDrop(Schedule: TODJobSchedule; Job: TODJob);
    procedure JobDragOver(Schedule: TODJobSchedule; Job: TODJob;
      Index: Integer; var Accept: Boolean);
    procedure ItemDragOver(Schedule: TODJobSchedule; Job: TODJob;
      Item: TODJobItem; Index: Integer; var Accept: Boolean);
    procedure AboutButtonClick(Sender: TObject);
    procedure DoJobEdit(Schedule: TODJobSchedule; Job: TODJob);
    procedure BeforeJobRemove(Schedule: TODJobSchedule; Job: TODJob);
    procedure MsgTimerTimer(Sender: TObject);
    procedure DoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ReqmtsButtonClick(Sender: TObject);
    procedure OutputButtonClick(Sender: TObject);
    procedure ItemDragDrop(Schedule: TODJobSchedule; Job: TODJob;
      Item: TODJobItem);
    procedure PrintButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboChange(Sender: TObject);
    procedure WeftReqCalcFields(DataSet: TDataSet);
    procedure ReqQueryAfterScroll(DataSet: TDataSet);
    procedure WarpReqQueryCalcFields(DataSet: TDataSet);
    procedure GroupDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GroupDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ReqGridStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure AddToGroup1Click(Sender: TObject);
    procedure AddToGroup2Click(Sender: TObject);
    procedure AddToGroup3Click(Sender: TObject);
    procedure ReqPopupPopup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SortButtonClick(Sender: TObject);
  private
    Changed, UpdateLocked: Boolean;
    NextItemNo: Integer;    //the next item no to use on adding an item
    WorkHours, DefaultHours, Darkness: TStrings;
    function GetStruct(const Descr: string): string;
    function GetTwist(const Descr: string): string;
    function GetColor(const Descr: string): string;
    function GetHoursPerKg(const Struct, Twist: string): Double;
    function GetNextJobNo: Integer;
    function GetNextItemNo: Integer;
    function GetWorkHours: TStrings;
    function GetDefaultHours: TStrings;
    function GetDarkness: TStrings;
    procedure UpdateDates(Schedule: TODJobSchedule);
    procedure UpdateFooter(Schedule: TODJobSchedule);
    procedure SortJobs(Schedule: TODJobSchedule);
    procedure CalcDuration(Job: TODSpinJob);
    procedure SetStatus(const Msg: string);
    procedure HighlightItem(Item: TODSpinJobItem; DataSet: TDataSet);
  end;

var
  MainForm: TMainForm;

implementation

uses
  DBLogin, AboutUnit, LoadUnit, SaveUnit, DelUnit, JobUnit,
  ItemUnit, PrnUnit, MaintUnit, DateUnit, OutUnit{, OutUnit, ReqUnit,OutUnit};

{$R *.DFM}

const
  SpinningCaption = 'Spinning Planner';

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ShortDateFormat:='dd/mm/yyyy'; //added DL030200
  SchedDB.LoginPrompt := False;
  StockDB.LoginPrompt := False;
  LoginForm := TLoginForm.Create(Application);
  if LoginForm.ShowModal = ID_OK then
  begin
    SchedDB.Params.Clear;
    SchedDB.Params.Add('USER NAME=' + LoginForm.UserNameEdit.Text);
    SchedDB.Params.Add('PASSWORD=' + LoginForm.PasswordEdit.Text);
    StockDB.Params.Clear;
    StockDB.Params.Add('USER NAME=' + LoginForm.UserNameEdit.Text);
    StockDB.Params.Add('PASSWORD=' + LoginForm.PasswordEdit.Text);
    VBStkDB.Params.Clear;
    VBStkDB.Params.Add('USER NAME=' + LoginForm.UserNameEdit.Text);
    VBStkDB.Params.Add('PASSWORD=' + LoginForm.PasswordEdit.Text);
  end
  else Halt(1);
  try
    SchedDB.Open;
    StockDB.Open;
    VBStkDB.Open;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Halt(1);
    end;
  end;
  LoginForm.Free;
//  RangeCalendar.StartDate := Date;
//  RangeCalendar.FinishDate := Date + 30;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  ODABoutForm.ShowAsSplash;
  Scenario.Open;
  SpinJob.Open;
  SpinItem.Open;
  CleanJob.Open;
  YarnType.Open;
  YarnType.First;
  while not YarnType.EOF do
  begin
    JobForm.YarnList.Items.Add(YarnTypeYNSTRU.AsString + '-' +
      YarnTypeYNTWIST.AsString + '-' + YarnTypeYNCOL.AsString);
    YarnType.Next;
  end;
  ItemForm.YarnList.Items.Assign(JobForm.YarnList.Items);
//  YarnType.Close;
  WorkHours := GetWorkHours;
  DefaultHours := GetDefaultHours;
  Darkness := GetDarkness;
  NextItemNo := 1;
{  Group1.AddJobFrom(0, 'Cleaning', '', Date-1, Date-1).Color := clMaroon;
  with Group1.AddJobFrom(0, 'BO90-1-108 900', '', Date, Date+2) do
  begin
    AddItemFrom(0, 'Spindle 1');
    AddItemFrom(2, 'Spindle 2');
    AddItemFrom(3, 'Spindle 3');
    AddItemFrom(4, 'Spindle 4');
    AddItemFrom(5, 'Spindle 5');
    AddItemFrom(6, 'Spindle 6');
    AddItemFrom(7, 'Spindle 7');
    AddItemFrom(8, 'Spindle 8');
    AddItemFrom(8, 'Spindle 9');
    AddItemFrom(10, 'Spindle 10');
    Status := '300/10 = 30hrs';
  end;
  with Group1.AddJobFrom(0, 'BO90-1-100 500', '', Date+2, Date+3) do
  begin
    AddItemFrom(1, 'Spindle 1');
    AddItemFrom(2, 'Spindle 2');
    AddItemFrom(3, 'Spindle 3');
    AddItemFrom(4, 'Spindle 4');
    AddItemFrom(5, 'Spindle 5');
    AddItemFrom(6, 'Spindle 6');
    AddItemFrom(7, 'Spindle 7');
    AddItemFrom(8, 'Spindle 8');
    AddItemFrom(9, 'Spindle 9');
    AddItemFrom(10, 'Spindle 10');
    Status := '167/10 = 17hrs';
  end;
  Group2.AddJobFrom(0, 'Cleaning', '', Date-1, Date-1).Color := clMaroon;
  with Group2.AddJobFrom(0, 'BO60-SZ-112 700', '', Date, Date+2) do
  begin
    AddItemFrom(11, 'Spindle 11');
    AddItemFrom(12, 'Spindle 12');
    AddItemFrom(13, 'Spindle 13');
    AddItemFrom(14, 'Spindle 14');
    AddItemFrom(15, 'Spindle 15');
  end;
  with Group2.AddJobFrom(0, 'BO60-SZ-108 400', '', Date+2, Date+3) do
  begin
    AddItemFrom(11, 'Spindle 11');
    AddItemFrom(12, 'Spindle 12');
    AddItemFrom(13, 'Spindle 13');
    AddItemFrom(14, 'Spindle 14');
    AddItemFrom(15, 'Spindle 15');
  end;}
{  Group1.JobWidth := 120;  //*** sort this problem out in component
  Group2.JobWidth := 120;
  Group3.JobWidth := 120;}
  WeaveScenario.Open;
  WeaveScenario.First;
  while not WeaveScenario.EOF do     //populate weave scenario combo
  begin
    ScenarioCombo.Items.AddObject(WeaveScenarioDESCR.AsString,
      Pointer(WeaveScenarioSCENARIONO.AsInteger));
    WeaveScenario.Next;
  end;
//  WeaveScenario.Close;
  TypeCombo.ItemIndex := 0;
  GroupCombo.ItemIndex := 0;
  ODAboutForm.Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WorkHours.Free;
  DefaultHours.Free;
  Darkness.Free;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Changed then
    CanClose := MessageDlg('Close without saving your changes?',
      mtWarning, [mbYes, mbNo], 0) = mrYes
  else
    CanClose := True;
end;

function TMainForm.GetWorkHours: TStrings;
var
  ix: Integer;
{                       WorkHours
                            Group1      Group2    ...
                              25/09/98   26/09/98  ...    }
begin
  Result := TStringList.Create;
  Result.AddObject('Group1', TStringList.Create);
  Result.AddObject('Group2', TStringList.Create);
  Result.AddObject('Group3', TStringList.Create);
  with MaintForm do
  begin
    WorkHours.Open;
    WorkHours.First;
    while not WorkHours.EOF do
    begin
      for ix := 0 to Result.Count-1 do
        TStringList(Result.Objects[ix]).AddObject(
          WorkHours.Fields[ix+2].AsString,   //skip WORKDAY & DAYNAME
            Pointer(Trunc(WorkHoursWORKDAY.AsFloat)));
      WorkHours.Next;
    end;
    WorkHours.Close;
  end;
end;

function TMainForm.GetDefaultHours: TStrings;
begin
  Result := TStringList.Create;
  with MaintForm do
  begin
    Params.Open;
    Result.Add(ParamsSUNHRS.AsString);
    Result.Add(ParamsMONHRS.AsString);
    Result.Add(ParamsTUEHRS.AsString);
    Result.Add(ParamsWEDHRS.AsString);
    Result.Add(ParamsTHUHRS.AsString);
    Result.Add(ParamsFRIHRS.AsString);
    Result.Add(ParamsSATHRS.AsString);
//    Params.Close;
   end;
end;

function TMainForm.GetDarkness: TStrings;
begin
{}Randomize;
  Result := TStringList.Create;
  YarnCol.Open;
  YarnCol.First;
  while not YarnCol.EOF do
  begin
//    Result.AddObject(YarnColYNCOL.AsString, Pointer(YarnColDARKNESS.AsInteger));
{}  Result.AddObject(YarnColYNCOL.AsString, Pointer(Random(1000)));
    YarnCol.Next;
  end;
  YarnCol.Close;
end;

procedure TMainForm.LoadButtonClick(Sender: TObject);

  procedure LoadSchedule(Schedule: TODJobSchedule);
  var
    iJob, iItem: Integer;
    aJob: TODJob;
    aItem: TODSpinJobItem;
  begin
    Schedule.ClearJobs(True);
    CleanJob.First;
    while not CleanJob.EOF do
    begin
      if Schedule.ScheduleNo = CleanJobGROUPNO.AsInteger then    //add job -
      begin
        aJob := TODCleanJob.Create(Self);
        with TODCleanJob(aJob) do
        begin
          JobNo := CleanJobJOBNO.AsInteger;
          StartDate := CleanJobSTARTDATE.AsDateTime;
          FinishDate := CleanJobFINISHDATE.AsDateTime;
          Tag := CleanJobPLACENO.AsInteger;   //temp place no holder
        end;
        Schedule.AddJob(aJob);
//        UpdateMenuCaptions(aJob);
      end;
      CleanJob.Next;
    end;
    SpinJob.First;
    while not SpinJob.EOF do
    begin
      if (Schedule.ScheduleNo = SpinJobGROUPNO.AsInteger) then    //add job -
      begin
        aJob := TODSpinJob.Create(Schedule);
        with TODSpinJob(aJob) do
        begin
          JobNo := SpinJobJOBNO.AsInteger;
          StartDate := SpinJobSTARTDATE.AsDateTime;
          FinishDate := SpinJobFINISHDATE.AsDateTime;
          Tag := SpinJobPLACENO.AsInteger;
          Schedule.AddJob(aJob);
          SpinItem.First;
          while not SpinItem.EOF do    //load job items -
          begin
            if JobNo = SpinItemJOBNO.AsInteger then        //add job item -
            begin
              aItem := TODSpinJobItem.Create(aJob);
              aItem.ItemNo := SpinItemITEMNO.AsInteger;
              aItem.Struct := SpinItemSTRUCT.AsString;
              aItem.Twist := SpinItemTWIST.AsString;
              aItem.Color := SpinItemCOLOR.AsString;
              aItem.Weight := SpinItemWEIGHT.AsInteger;
              aItem.HoursPerKg := SpinItemHOURSPERKG.AsFloat;
              aItem.Spindles := SpinItemSPINDLES.AsInteger;
              aItem.Tag := SpinItemPLACENO.AsInteger;  //for sorting below
              TODSpinJob(aJob).AddItem(aItem);
            end;
            SpinItem.Next;
          end;
        end;
      end;
      SpinJob.Next;
    end;
    with Schedule do
    begin
      for iJob := 0 to JobCount-1 do    //sort jobs and their items -
        with Jobs[iJob] do
        begin
          for iItem := 0 to ItemCount-1 do
            MoveItem(iItem, Items[iItem].Tag);
          MoveJob(iJob, Tag);
        end;
      for iJob := 0 to JobCount-1 do    //repeat sort to make sure -
        with Jobs[iJob] do
        begin
          for iItem := 0 to ItemCount-1 do
            MoveItem(iItem, Items[iItem].Tag);
          MoveJob(iJob, Tag);
        end;
      if JobCount > 0 then
        Footer := 'Finish: ' + {DateToStr(Jobs[JobCount-1].FinishDate)}
          FormatDateTime('dd mmm', (Jobs[JobCount-1].FinishDate))
      else
        Footer := '';
    end;
  end;

{var
  ix: Integer;}
begin {LoadButtonClick}
  if Changed then
    case MessageDlg('Do you want to first save the current scenario?',
        mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: SaveButtonClick(nil);
      mrNo: ;
      mrCancel: Exit;
    end;
  if LoadForm.ShowModal = ID_OK then
  begin
    Caption := SpinningCaption + ' - ' + ScenarioDESCR.Value;
    UpdateLocked := True;
    try
      LoadSchedule(Group1);
      LoadSchedule(Group2);
      LoadSchedule(Group3);
//      LoadSchedule(Group4);
    finally
      UpdateLocked := False;
    end;
    UpdateDates(Group1);
    UpdateDates(Group2);
    UpdateDates(Group3);
    SaveButton.Enabled := True;
    SortButton.Enabled := True;
    ClearButton.Enabled := True;
    PrintButton.Enabled := True;
    ReqmtsButton.Enabled := True;
    OutputButton.Enabled := True;
    Changed := False;
    MaxItemNoQuery.Params[0].AsInteger := ScenarioSCENARIONO.AsInteger;
    MaxItemNoQuery.Open;
    NextItemNo := MaxItemNoQuery.Fields[0].AsInteger;
    MaxItemNoQuery.Close;
  end;
end;

procedure TMainForm.SaveButtonClick(Sender: TObject);

  procedure SaveSchedule(Schedule: TODJobSchedule);
  var
    iJob, iItem: Integer;
  begin
    with Schedule do
      for iJob := 0 to JobCount-1 do         //save each job -
      begin
        if Jobs[iJob] is TODSpinJob then
          with TODSpinJob(Jobs[iJob]) do
          begin
            SpinJob.Insert;             //add job -
            SpinJobSCENARIONO.Value := ScenarioSCENARIONO.Value;
            SpinJobGROUPNO.Value := ScheduleNo;
            SpinJobJOBNO.Value := JobNo;
            SpinJobPLACENO.Value := iJob;
            SpinJobSTARTDATE.AsDateTime := Int(StartDate);
            SpinJobFINISHDATE.AsDateTime := Int(FinishDate);
            SpinJob.Post;
            for iItem := 0 to ItemCount-1 do      //save each job item -
              with Items[iItem] do
              begin
                SpinItem.Insert;            //add item -
                SpinItemSCENARIONO.AsInteger := ScenarioSCENARIONO.Value;
                SpinItemGROUPNO.AsInteger := ScheduleNo;
                SpinItemJOBNO.AsInteger := JobNo;
                SpinItemITEMNO.AsInteger := ItemNo;
                SpinItemPLACENO.AsInteger := iItem;
                SpinItemSTRUCT.AsString := Struct;
                SpinItemTWIST.AsString := Twist;
                SpinItemCOLOR.AsString := Color;
                SpinItemWEIGHT.AsInteger := Weight;
                SpinItemHOURSPERKG.AsFloat := HoursPerKg;
                SpinItemSPINDLES.AsInteger := Spindles;
                SpinItem.Post;
              end;
          end
        else if Jobs[iJob] is TODCleanJob then
          with TODCleanJob(Jobs[iJob]) do
          begin
            CleanJob.Insert;             //add job -
            CleanJobSCENARIONO.Value := ScenarioSCENARIONO.Value;
            CleanJobGROUPNO.Value := ScheduleNo;
            CleanJobJOBNO.Value := JobNo;
            CleanJobPLACENO.Value := iJob;
            CleanJobSTARTDATE.AsDateTime := Int(StartDate);
            CleanJobFINISHDATE.AsDateTime := Int(FinishDate);
            CleanJob.Post;
          end;
      end;
  end;

var
  ix: Integer;
begin {SaveButtonClick}
  MaxSpinPlanNoQuery.Open;
  ix := MaxSpinPlanNoQuery.Fields[0].AsInteger + 1;  //next spin plan no
  MaxSpinPlanNoQuery.Close;
  with SaveForm do
  begin
    NumberEdit.Text := IntToStr(ix);
    NumberEdit.Tag := ix;
    DescrEdit.Text := 'Scenario ' + IntToStr(ix);
    ScenarioSource.DataSet := Scenario;
    ShowModal;
    if ModalResult in [mrOK, mrYes] then
    begin
      SchedDB.StartTransaction;
      try
{        if ModalResult = mrOK then     //storing a new scenario -
        begin
          Scenario.Insert;
          ScenarioSCENARIONO.Value := StrToInt(NumberEdit.Text);
        end
        else if Scenario.FindKey([StrToInt(NumberEdit.Text)]) then
        begin                     //overwriting a stored scenario -
          DeleteForm.DeleteScenario;
          Scenario.Edit;
        end}
        if ModalResult = mrYes then   //overwriting a stored scenario
          if Scenario.FindKey([StrToInt(NumberEdit.Text)]) then
            DeleteForm.DeleteScenario    //delete prev version
          else raise EDatabaseError.Create(
            'Scenario number ' + NumberEdit.Text + ' not found');
        Scenario.Insert;
        ScenarioSCENARIONO.Value := StrToInt(NumberEdit.Text);
        ScenarioDESCR.Value := DescrEdit.Text;
        Scenario.Post;
        SaveSchedule(Group1);
        SaveSchedule(Group2);
        SaveSchedule(Group3);
        SchedDB.Commit;
      except
        SchedDB.RollBack;
      end;
      Self.Caption := SpinningCaption + ' - ' + ScenarioDESCR.Value;
      Changed := False;
      ReqmtsButton.Enabled := True;
      OutputButton.Enabled := True;
    end;
  end;
end;

procedure TMainForm.DeleteButtonClick(Sender: TObject);
begin
  DeleteForm.ShowModal;
end;

procedure TMainForm.ClearButtonClick(Sender: TObject);
begin
  if MessageDlg('Clear all jobs?', mtConfirmation, [mbYes, mbNo], 0)
    <> mrYes then Exit;
  UpdateLocked := True;
  try
    Group1.ClearJobs(True);
    Group2.ClearJobs(True);
    Group3.ClearJobs(True);
    Group1.Footer := '';
    Group2.Footer := '';
    Group3.Footer := '';
  finally
    UpdateLocked := False;
  end;
  Caption := SpinningCaption;
  SaveButton.Enabled := False;
  SortButton.Enabled := False;
  ClearButton.Enabled := False;
  PrintButton.Enabled := False;
  ReqmtsButton.Enabled := False;
  OutputButton.Enabled := False;
  Changed := False;
  NextItemNo := 1;
end;

procedure TMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

function TMainForm.GetStruct(const Descr: string): string;
begin
  Result := Copy(Descr, 1, Pos('-', Descr)-1);
end;

function TMainForm.GetTwist(const Descr: string): string;
begin
  Result := Copy(Descr, Pos('-', Descr)+1, Length(Descr));
  Delete(Result, Pos('-', Result), Length(Result));
end;

function TMainForm.GetColor(const Descr: string): string;
begin
  Result := Copy(Descr, Pos('-', Descr)+1, Length(Descr));
  Result := Copy(Result, Pos('-', Result)+1, Length(Result));
end;

function TMainForm.GetHoursPerKg(const Struct, Twist: string): Double;
begin
  with KgsPerHourQuery do
  begin
    ParamByName('Struct').AsString := Struct;
    ParamByName('Twist').AsString := Twist;
    Open;
    Result := 1/KgsPerHourQueryPRODHRSPDL.AsFloat;
    Close;
  end;
end;

function TMainForm.GetNextJobNo: Integer;
begin
  JobNoProc.ExecProc;            //run jobno generator
  Result := JobNoProc.ParamByName('Code').AsInteger;
end;

function TMainForm.GetNextItemNo: Integer;
begin
  Result := NextItemNo;
  Inc(NextItemNo);
end;

procedure TMainForm.DoJobAdd(Schedule: TODJobSchedule);
var
  Job: TODJob;
  Item: TODSpinJobItem;
  Yarn: string;
begin
  JobForm.Caption := 'Add Job To Group ' + IntToStr(Schedule.ScheduleNo);
  JobForm.Schedule := Schedule;
  if Schedule.JobCount > 0 then
    JobForm.DatePicker.Date := Schedule.Jobs[Schedule.JobCount-1].FinishDate
  else
    JobForm.DatePicker.Date := Date;
//  JobForm.SpindlesEdit.Text := IntToStr(Schedule.Tag); //store no of spindles in group
  JobForm.SpindlesUpDown.Max := Schedule.Tag;
  JobForm.SpindlesUpDown.Position := Schedule.Tag; //store no of spindles in group
  JobForm.MaxLabel.Caption := '(avail ' + IntToStr(Schedule.Tag) + ')';
  JobForm.FindEdit.Text := '';
  if JobForm.ShowModal = ID_OK then
  begin
    if JobForm.SpinningRadio.Checked then
    begin
      Job := TODSpinJob.Create(Schedule);
      TODSpinJob(Job).JobNo := GetNextJobNo;
    end
    else
    begin
      Job := TODCleanJob.Create(Schedule);
      TODCleanJob(Job).JobNo := GetNextJobNo;
    end;
    Job.StartDate := JobForm.DatePicker.Date;
    Job.FinishDate := Job.StartDate;
    Schedule.AddJob(Job);
    if Job is TODSpinJob then
    begin
{      Job.MenuCaptions.AddItem := '&Add New Yarn Split...';
      Job.MenuCaptions.ClearItems := '';
      Job.MenuCaptions.Edit := '';
      Job.MenuCaptions.Remove := '&Remove Spinning Job';}
      Item := TODSpinJobItem.Create(Job);  //Owner can be anything here as reassigned on adding to Job
      Item.ItemNo := GetNextItemNo;
      Yarn := JobForm.YarnList.Items[JobForm.YarnList.ItemIndex];
      Item.Struct := GetStruct(Yarn);
      Item.Twist  := GetTwist(Yarn);
      Item.Color  := GetColor(Yarn);
      Item.Weight := StrToInt(JobForm.WeightEdit.Text);
      Item.Spindles := StrToInt(JobForm.SpindlesEdit.Text);
      Item.HoursPerKg := GetHoursPerKg(Item.Struct, Item.Twist);
      Job.AddItem(Item);
{      Item.MenuCaptions.Edit := '&Edit Yarn Item...';
      Item.MenuCaptions.Remove := '&Remove Yarn Item';}
{    end
    else
    begin
      Job.MenuCaptions.AddItem := '';    //cannot add items
      Job.MenuCaptions.ClearItems := '';
      Job.MenuCaptions.Edit := '&Change Start Date...';
      Job.MenuCaptions.Remove := '&Remove Cleaning Job';}
    end;
    Changed := True;
  end;
end;

procedure TMainForm.DoJobEdit(Schedule: TODJobSchedule; Job: TODJob);
begin
  if Job = Schedule.Jobs[0] then
  begin
    DateForm.Caption := 'Change Group ' + IntToStr(Schedule.ScheduleNo) +
      '''s Start Date';
    DateForm.DatePicker.Date := Job.StartDate;
    if DateForm.ShowModal = ID_OK then
    begin
      Job.StartDate := DateForm.DatePicker.Date;
      UpdateDates(Schedule);
      Changed := True;
    end;
  end
  else MessageDlg('You can only change the date of the first job in the group.',
         mtError, [mbOK], 0);
end;

procedure TMainForm.DoItemAdd(Schedule: TODJobSchedule; Job: TODJob);
var
  Item: TODSpinJobItem;
  Yarn: string;
begin
  if TODSpinJob(Job).Spindles = Schedule.Tag then
  begin
    MessageDlg('No more spindles available in job', mtError, [mbOK], 0);
    Exit;
  end;
  ItemForm.Caption := 'Add New Yarn Split To Job ' + IntToStr(Job.JobNo);
{  ItemForm.Schedule := Schedule;
  ItemForm.Job := TODSpinJob(Job);
  ItemForm.Item := nil;     //tells dialog that is adding new item}
  ItemForm.SpindlesUpDown.Max := Schedule.Tag - TODSpinJob(Job).Spindles; //avail spindles = in group - used
  ItemForm.SpindlesUpDown.Position := ItemForm.SpindlesUpDown.Max;
  ItemForm.MaxLabel.Caption :=
    '(avail ' + IntToStr(ItemForm.SpindlesUpDown.Max) + ')';
  ItemForm.FindEdit.Text := '';
  if ItemForm.ShowModal = ID_OK then
  begin
//    Item := TODSpinJob(Job).AddNewItem;
    Item := TODSpinJobItem.Create(Job);
    Item.ItemNo := GetNextItemNo;
      Yarn := JobForm.YarnList.Items[ItemForm.YarnList.ItemIndex];
      Item.Struct := GetStruct(Yarn);
      Item.Twist  := GetTwist(Yarn);
      Item.Color  := GetColor(Yarn);
    Item.Weight := StrToInt(ItemForm.WeightEdit.Text);
    Item.Spindles := StrToInt(ItemForm.SpindlesEdit.Text);
    Item.HoursPerKg := GetHoursPerKg(Item.Struct, Item.Twist);
    Job.AddItem(Item);  //want properties initialised before item added
    Changed := True;
  end;
end;

procedure TMainForm.DoItemEdit(Schedule: TODJobSchedule; Job: TODJob;
  Item: TODJobItem);
var
  SpinItem: TODSpinJobItem;   //to use instead of typecasting item in with .. do
  Yarn: string;
begin
  SpinItem := TODSpinJobItem(Item);
  ItemForm.Caption := 'Edit Yarn Split In Job ' + IntToStr(Job.JobNo);
{  ItemForm.Schedule := Schedule;
  ItemForm.Job := TODSpinJob(Job);
  ItemForm.Item := SpinItem;     //tells dialog that is editing an item}
{  ItemForm.YarnList.ItemIndex := ItemForm.YarnList.Items.IndexOf(
    SpinItem.Struct + '-' + SpinItem.Twist + '-' + SpinItem.Color);}
  ItemForm.FindEdit.Text :=
    SpinItem.Struct + '-' + SpinItem.Twist + '-' + SpinItem.Color;
  ItemForm.WeightEdit.Text := IntToStr(SpinItem.Weight);
  ItemForm.SpindlesUpDown.Max :=
    Schedule.Tag - TODSpinJob(Job).Spindles + SpinItem.Spindles;
  ItemForm.SpindlesUpDown.Position := SpinItem.Spindles;
  ItemForm.MaxLabel.Caption :=
    '(avail ' + IntToStr(ItemForm.SpindlesUpDown.Max) + ')';
  if ItemForm.ShowModal = ID_OK then
  begin
    Yarn := JobForm.YarnList.Items[ItemForm.YarnList.ItemIndex];
    SpinItem.Struct := GetStruct(Yarn);
    SpinItem.Twist  := GetTwist(Yarn);
    SpinItem.Color  := GetColor(Yarn);
    SpinItem.Weight := StrToInt(ItemForm.WeightEdit.Text);
    SpinItem.Spindles := StrToInt(ItemForm.SpindlesEdit.Text);
    SpinItem.HoursPerKg := GetHoursPerKg(SpinItem.Struct, SpinItem.Twist);
    Changed := True;
  end;
end;

procedure TMainForm.AfterJobAdd(Schedule: TODJobSchedule; Job: TODJob);
begin
  if Job is TODCleanJob then
    Job.MenuCaptions.AddItem := '';
  Job.MenuCaptions.ClearItems := '';
  SaveButton.Enabled := True;
  ClearButton.Enabled := True;
//  PrintButton.Enabled := True;
  UpdateDates(Schedule);
  ReqQueryAfterScroll(WeaveReqSource.DataSet);
end;

procedure TMainForm.AfterItemAdd(Schedule: TODJobSchedule;
  Job: TODJob; Item: TODJobItem);
//Updating job duration
begin
  CalcDuration(TODSpinJob(Job));
  ReqQueryAfterScroll(WeaveReqSource.DataSet);
end;

procedure TMainForm.AfterItemEdit(Schedule: TODJobSchedule;
  Job: TODJob; Item: TODJobItem);
begin
  CalcDuration(TODSpinJob(Job));
  ReqQueryAfterScroll(WeaveReqSource.DataSet);
end;

procedure TMainForm.CalcDuration(Job: TODSpinJob);
//Updating job duration
var
  ix: Integer;
  nDuration: Double;
begin
  nDuration := 0;
  for ix := 0 to Job.ItemCount-1 do
    if TODSpinJobItem(Job[ix]).Duration > nDuration then
      nDuration := TODSpinJobItem(Job[ix]).Duration;
  TODSpinJob(Job).Duration := nDuration;
  UpdateDates(Job.Schedule);
end;

procedure TMainForm.BeforeItemRemove(Schedule: TODJobSchedule;
  Job: TODJob; Item: TODJobItem);
begin
  if Job.ItemCount = 1 then
    raise Exception.Create('There must be at least one yarn in this job');
end;

procedure TMainForm.UpdateDates(Schedule: TODJobSchedule);

  procedure CalcFinishDate(Job: TODSpinJob);
  var
    ix: Integer;
    iHours: Single;
    iDate: TDateTime;
    aSpinHours: TStrings;
  begin
    if UpdateLocked then Exit;
    iDate := Job.StartDate;
    iHours := 0;
    while iHours < Job.Duration + MaintForm.ParamsSPINCHANGEHRS.AsFloat do
    begin
      aSpinHours :=             //get work hours for group
        TStringList(WorkHours.Objects[Job.Schedule.ScheduleNo-1]);
      ix := aSpinHours.IndexOfObject(Pointer(Trunc(iDate)));  //date stored in objects
      if ix > -1 then  //if work hours for date in work schedule, use that
        iHours := iHours + StrToFloat(aSpinHours[ix])
      else   //else use the default work hours for that day
        iHours := iHours + StrToFloat(DefaultHours[DayOfWeek(iDate)-1]);  //hours stored in string
      iDate := iDate + 1;
    end;
    Job.FinishDate := iDate - 1;
  end;

var
  aNextDate: TDateTime;
  iJob: Integer;
begin
  aNextDate := 0;
  if UpdateLocked or (Schedule.JobCount = 0) then Exit;
//  SortJobs(Schedule);
  with Schedule do
    if JobCount > 1 then
    begin
      for iJob := 0 to JobCount-1 do
      begin
        if iJob > 0 then
          Jobs[iJob].StartDate := aNextDate;
        if Jobs[iJob] is TODSpinJob then
          CalcFinishDate(TODSpinJob(Jobs[iJob]))
        else
          Jobs[iJob].FinishDate := Jobs[iJob].StartDate;
        aNextDate := Jobs[iJob].FinishDate;
      end;
    end;
  UpdateFooter(Schedule);
end;

procedure TMainForm.UpdateFooter(Schedule: TODJobSchedule);
begin
  if UpdateLocked then Exit;
  with Schedule do
    if JobCount > 0 then
      Footer := 'Finish: ' + {DateToStr(Jobs[JobCount-1].FinishDate)}
        FormatDateTime('dd mmm', (Jobs[JobCount-1].FinishDate))
    else
      Footer := '';
end;

procedure TMainForm.SortJobs(Schedule: TODJobSchedule);

  function Compare(Item1, Item2: Pointer): Integer;
  var
    C1, C2: Integer;
    s1: string;
  begin
    s1 := TODSpinJob(Item1)[0].Color;
    C1 := Darkness.IndexOf(s1);
    C1 := Longint(Darkness.Objects[C1]);
{    C1 := Longint(Darkness.Objects[
      Darkness.IndexOf(TODSpinJob(Item1)[0].Color)]);}
    C2 := Longint(Darkness.Objects[
      Darkness.IndexOf(TODSpinJob(Item2)[0].Color)]);
    if C1 = C2 then Result := 0
    else if C1 < C2 then Result := -1
    else Result := 1;
  end;

var
  ix, iFirst, iLast: Integer;
  sList: TList;
begin  {SortJobs}
  if UpdateLocked then Exit;
  ix := 0;
  sList := TList.Create;
  with Schedule do
  try
    while ix < JobCount do
    begin
      if Jobs[ix] is TODCleanJob then
      begin
        Inc(ix);      //skip cleaning job
        if ix = JobCount then Exit;
        iFirst := ix;
        sList.Clear;
        while (ix < JobCount) and not (Jobs[ix] is TODCleanJob) do
        begin
          sList.Add(Jobs[ix]);
          Inc(ix);
        end;
        iLast := ix;
        ix := Darkness.IndexOf('WHT');
        sList.Sort(@Compare);
        for ix := 0 to sList.Count-1 do
          MoveJob(IndexOfJob(TODJob(sList[ix])), iFirst + ix);
        for ix := 0 to sList.Count-1 do
          MoveJob(IndexOfJob(TODJob(sList[ix])), iFirst + ix);
        ix := iLast;
      end;
    end;
  finally
    sList.Free;
  end;
end;

procedure TMainForm.MaintButtonClick(Sender: TObject);
var
  ix: Integer;
begin
  MaintForm.ShowModal;
  if MaintForm.WorkHoursChanged then
  begin
    for ix := 0 to WorkHours.Count-1 do
      TObject(WorkHours.Objects[ix]).Free;
    WorkHours.Free;
    WorkHours := GetWorkHours;
  end;
  if MaintForm.ParamsChanged then
  begin
    DefaultHours.Free;
    DefaultHours := GetDefaultHours;
  end;
  if MaintForm.WorkHoursChanged or MaintForm.ParamsChanged then
  begin
    UpdateDates(Group1);
    UpdateDates(Group2);
    UpdateDates(Group3);
{    for ix := 0 to ScheduleBox.ScheduleCount-1 do
    begin
      UpdateDates(ScheduleBox[ix]);
      UpdateFooter(ScheduleBox[ix]);
    end;}
  end;
end;

procedure TMainForm.AfterItemRemove(Schedule: TODJobSchedule;
  Job: TODJob);
begin
  CalcDuration(TODSpinJob(Job));
end;

procedure TMainForm.AfterJobRemove(Schedule: TODJobSchedule);
begin
  UpdateDates(Schedule);
end;

procedure TMainForm.AfterJobEdit(Schedule: TODJobSchedule; Job: TODJob);
begin
  UpdateDates(Schedule);
end;

procedure TMainForm.JobDragDrop(Schedule: TODJobSchedule; Job: TODJob);
begin
  if Job.ItemCount = 1 then
  begin
    TODSpinJobItem(Job[0]).Spindles := Schedule.Tag;
    CalcDuration(Job as TODSpinJob);
  end;
  UpdateDates(Schedule);
  Changed := True;
end;

procedure TMainForm.JobDragOver(Schedule: TODJobSchedule; Job: TODJob;
  Index: Integer; var Accept: Boolean);
//Schedule: the schedule being dragged over
//Job: the job being dragged
//Index: the index of the job on the schedule being dragged over
begin
  if Job = nil then       //dragging over schedule
  begin
    Accept := False;
    SetStatus('');
  end
  else if Job = Job.Schedule[0] then   //cannot drag first (cleaning) job
  begin
    Accept := False;
    SetStatus('Cannot move first (cleaning) job');
  end
  else if Index = 0 then              //cannot drag to first position
  begin
    Accept := False;
    SetStatus('Cannot move to first job');
  end
  else if (Job is TODSpinJob) and (Schedule.JobCount = 0) then   //cannot drag to empty schedule
  begin
    Accept := False;
    SetStatus('A cleaning job must first be added');
  end
  else if (Job.ItemCount > 1) and
          (Schedule.Tag < (Job as TODSpinJob).Spindles) then
  //if has more than one spin item, check that spindles used are available in group
  // (otherwise changed automatically on drop)
  begin
    Accept := False;
    SetStatus('Not enough spindles in group for this job split');
  end
  else Accept := True;
end;

procedure TMainForm.ItemDragOver(Schedule: TODJobSchedule;
  Job: TODJob; Item: TODJobItem; Index: Integer; var Accept: Boolean);
//Schedule: the schedule being dragged over
//Job: the job being dragged over
//Item: the item being dragged
//Index: the index of the item on the job being dragged over
begin
  if Job = nil then       //dragging over schedule
  begin
    Accept := False;
    SetStatus('');
  end
  else if Item.Job.ItemCount = 1 then    //cannot drag an only item
  begin
    Accept := False;
    SetStatus('The job must have at least one yarn item');
  end
  else if Job is TODCleanJob then   //can only drag to a spin job
  begin
    Accept := False;
    SetStatus('A cleaning job cannot have yarn items');
  end
  else if Schedule.Tag <   //group's spindles < job's spindles + dragged item's spindles
    (Job as TODSpinJob).Spindles + TODSpinJobItem(Item).Spindles then
  begin
    Accept :=  False;
    SetStatus('Not enough spindles available for this yarn item');
  end
  else Accept := True;
end;

procedure TMainForm.AboutButtonClick(Sender: TObject);
begin
  ODAboutForm.ShowModal;
end;

procedure TMainForm.BeforeJobRemove(Schedule: TODJobSchedule; Job: TODJob);
begin
  if not UpdateLocked and (Schedule.JobCount > 1) and (Job = Schedule[0]) then
    raise Exception.Create('Cannot remove the first cleaning job in the group.');
end;

procedure TMainForm.SetStatus(const Msg: string);
begin
  MsgTimer.Enabled := False;
  Status.SimpleText := Msg;
  MsgTimer.Enabled := Msg <> '';
end;

procedure TMainForm.MsgTimerTimer(Sender: TObject);
begin
  MsgTimer.Enabled := False;
  Status.SimpleText := '';
end;

procedure TMainForm.DoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Status.SimpleText := '';
end;

procedure TMainForm.ReqmtsButtonClick(Sender: TObject);
begin
{  if Changed then
    MessageDlg('First save your changes', mtError, [mbOK], 0)
  else
    with ReqmtsForm do
    begin
      Caption := 'Fibre Requirements - ' + ScenarioDESCR.AsString;
      ReqDateQuery.ParamByName('ScenarioNo').AsInteger :=
        ScenarioSCENARIONO.AsInteger;
      ReqJobQuery.ParamByName('ScenarioNo').AsInteger :=
        ScenarioSCENARIONO.AsInteger;
      ShowModal;
    end;}
  MessageDlg('The fibre requirements are calculated manually by Judy' +
    ' because draw ratios might change as a result of light or dark fibre' +
    ' from the dye houses.', mtInformation, [mbOK], 0);
end;

procedure TMainForm.OutputButtonClick(Sender: TObject);
begin
  if Changed then
    MessageDlg('First save your changes', mtError, [mbOK], 0)
  else
    with OutputForm do
    begin
      Caption := 'Yarn Output - ' + ScenarioDESCR.AsString;
      ScenarioNo := ScenarioSCENARIONO.AsInteger;
      ShowModal;
    end;
end;

procedure TMainForm.ItemDragDrop(Schedule: TODJobSchedule;
  Job: TODJob; Item: TODJobItem);
begin
  Changed := True;
end;

procedure TMainForm.PrintButtonClick(Sender: TObject);

  function GetScheduleValues(ASchedule: TODJobSchedule): TStrings;
  var
    iJob, iItem: Integer;
  begin
    Result := TStringList.Create;
//    Result.Add('');
    for iJob := 0 to ASchedule.JobCount-1 do
      with ASchedule[iJob] do
      begin
        Result.AddObject(UpperCaption, ASchedule[iJob]);  //indicate to be bold
        if LowerCaption <> '' then Result.Add(LowerCaption);
        Result.Add(FormatDateTime('dd mmm', StartDate) + ' - ' +
          FormatDateTime('dd mmm', FinishDate));
{        Result.Add('Start: ' + FormatDateTime('dd/mm/yy', StartDate));
        Result.Add('End:  ' + FormatDateTime('dd/mm/yy', FinishDate));}
        if Expanded and (ItemCount > 0) then
        begin
          Result.Add('----------------------');
          for iItem := 0 to ItemCount-1 do
            Result.Add(Items[iItem].Caption);
        end;
        if Status <> '' then
        begin
          Result.Add(Status);
//          Result.Add('------------------');
//          Result.Add('');  //leave space for writing actual time
        end;
        Result.Add('___________________');
      end;
  end;

var
  iCol, mRow: Integer;
  sList: TList;
  aLines, sHeaders: TStrings;
begin {PrintButtonClick}         //row by row via string lists
  mRow := 0;
  sList := TList.Create;
  sHeaders := TStringList.Create;
  try
    //enlist Group 1
    sHeaders.Add(Group1.Header);
    aLines := GetScheduleValues(Group1);
    if aLines.Count > mRow then
      mRow := aLines.Count;
    sList.Add(aLines);
    //enlist Group 2
    sHeaders.Add(Group2.Header);
    aLines := GetScheduleValues(Group2);
    if aLines.Count > mRow then
      mRow := aLines.Count;
    sList.Add(aLines);
    //enlist Group 3
    sHeaders.Add(Group3.Header);
    aLines := GetScheduleValues(Group3);
    if aLines.Count > mRow then
      mRow := aLines.Count;
    sList.Add(aLines);
    //print lists in parallel
    with PrintForm do
    begin
      Title := Self.Caption;
      Headers := sHeaders;
      PrintList := sList;
      MaxRow := mRow;
      FileName := ScenarioDESCR.AsString + '.csv';
      ShowModal;
    end;
  finally
    sHeaders.Free;
    for icol := 0 to sList.Count-1 do
      TObject(sList[iCol]).Free;
    sList.Free;
  end;
end;

procedure TMainForm.ComboChange(Sender: TObject);
  procedure OpenQuery(Query: TQuery; DataSource: TDataSource);
  begin
    DataSource.DataSet.Close;
    DataSource.DataSet := Query;
    Query.ParamByName('ScenarioNo').AsInteger := WeaveScenarioSCENARIONO.AsInteger;
    Query.ParamByName('StartDate').AsDateTime := RangeCalendar.StartDate;
    Query.ParamByName('FinishDate').AsDateTime := RangeCalendar.FinishDate;
    Query.Open;
  end;
begin
  if ScenarioCombo.ItemIndex > -1 then
  begin
    if Sender = ScenarioCombo then
    begin
      WeaveScenario.FindKey([Longint(
        ScenarioCombo.Items.Objects[ScenarioCombo.ItemIndex])]);
      DateQuery.ParamByName('ScenarioNo').AsInteger :=
        WeaveScenarioSCENARIONO.AsInteger;
      DateQuery.Open;
      RangeCalendar.StartDate := DateQueryMIN.AsDateTime;
      RangeCalendar.FinishDate := DateQueryMAX.AsDateTime;
      DateQuery.Close;
    end;
    case GroupCombo.ItemIndex of
      0: if TypeCombo.ItemIndex = 0 then
           OpenQuery(WarpReqTypeQuery, WeaveReqSource)
         else
           OpenQuery(WeftReqTypeQuery, WeaveReqSource);
      1: if TypeCombo.ItemIndex = 0 then
           OpenQuery(WarpReqDateQuery, WeaveReqSource)
         else
           OpenQuery(WeftReqDateQuery, WeaveReqSource);
      2: if TypeCombo.ItemIndex = 0 then
           OpenQuery(WarpReqJobQuery, WeaveReqSource)
         else
           OpenQuery(WeftReqJobQuery, WeaveReqSource);
    end;
  end;
end;

procedure TMainForm.WarpReqQueryCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    WarpLeftQuery.ParamByName('WARPTYPE').AsString :=
      FieldByName('WARPTYPE').AsString;
    WarpLeftQuery.ParamByName('WARPCOL').AsString :=
      FieldByName('WARPCOL').AsString;
    WarpLeftQuery.Open;
    if WarpLeftQuerySUM.AsFloat > 0 then
      FieldByName('INSTOCK').AsFloat := Round(WarpLeftQuerySUM.AsFloat)
    else
      FieldByName('INSTOCK').AsFloat := 0;
    if FieldByName('WARPLEN').AsFloat - FieldByName('INSTOCK').AsFloat > 0 then
      FieldByName('REQUIRED').AsFloat := Round(
        FieldByName('WARPLEN').AsFloat - FieldByName('INSTOCK').AsFloat)
    else
      FieldByName('REQUIRED').AsFloat := 0;
    WarpLeftQuery.Close;
  end;
end;

procedure TMainForm.WeftReqCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('WEFTWEIGHT').AsFloat := Round(
      FieldByName('WEFTPCEWGT').AsFloat * FieldByName('SUM').AsInteger);
    if YarnType.FindKey([FieldByName('WEFTSTRU').AsString,
        FieldByName('WEFTTWIST').AsString, FieldByName('WEFTCOL').AsString])
    and (YarnTypeINSTOCK.AsFloat > 0) then
      FieldByName('INSTOCK').AsFloat := Round(YarnTypeINSTOCK.AsFloat)
    else
      FieldByName('INSTOCK').AsFloat := 0;
    if FieldByName('WEFTWEIGHT').AsFloat - FieldByName('INSTOCK').AsFloat > 0 then
      FieldByName('REQUIRED').AsFloat := Round(
        FieldByName('WEFTWEIGHT').AsFloat - FieldByName('INSTOCK').AsFloat)
    else
      FieldByName('REQUIRED').AsFloat := 0;
  end;
end;

procedure TMainForm.HighlightItem(Item: TODSpinJobItem; DataSet: TDataSet);
begin
  if DataSet.Active and ((DataSet = WeftReqTypeQuery) or
     (DataSet = WeftReqDateQuery) or (DataSet = WeftReqJobQuery)) and
     (Item.Struct = DataSet.FieldByName('WEFTSTRU').AsString) and
     (Item.Twist = DataSet.FieldByName('WEFTTWIST').AsString) and
     (Item.Color = DataSet.FieldByName('WEFTCOL').AsString) then
  begin
    TODJobItem(Item).Color := clHighlight;   //hidden by TODSpinJobItem.Color
    Item.Font.Color := clHighlightText;
  end
  else
  begin
    TODJobItem(Item).Color := clWindow;
    Item.Font.Color := clWindowText;
  end;
end;

procedure TMainForm.ReqQueryAfterScroll(DataSet: TDataSet);
  procedure HighlightSchedule(Schedule: TODJobSchedule);
  var
    iJob, iItem: Integer;
  begin
    for iJob := 0 to Schedule.JobCount-1 do
      for iItem := 0 to Schedule[iJob].ItemCount-1 do
        HighlightItem(Schedule[iJob][iItem] as TODSpinJobItem, DataSet);
  end;
begin
  HighlightSchedule(Group1);
  HighlightSchedule(Group2);
  HighlightSchedule(Group3);
end;

procedure TMainForm.GroupDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
{  if (Sender is TODJobSchedule) and (Source = ReqGrid) and
     (TypeCombo.ItemIndex = 1) then
    Accept := TODJobSchedule(Sender).JobCount > 0;
  if Accept then SetStatus('')
  else SetStatus('A cleaning job must first be added');}
end;

procedure TMainForm.GroupDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Schedule: TODJobSchedule;
  Job: TODJob;
  Item: TODSpinJobItem;
  Yarn: string;
begin
  Schedule := Sender as TODJobSchedule;
  JobForm.Caption := 'Add Job To Group ' + IntToStr(Schedule.ScheduleNo);
  JobForm.Schedule := Schedule;
  if Schedule.JobCount > 0 then
    JobForm.DatePicker.Date := Schedule.Jobs[Schedule.JobCount-1].FinishDate
  else
    JobForm.DatePicker.Date := Date;
  JobForm.SpindlesUpDown.Max := Schedule.Tag;
  JobForm.SpindlesUpDown.Position := Schedule.Tag; //store no of spindles in group
  JobForm.MaxLabel.Caption := '(avail ' + IntToStr(Schedule.Tag) + ')';
  with WeaveReqSource.DataSet do
  begin
{    JobForm.YarnList.ItemIndex := JobForm.YarnList.Items.IndexOf(}
    JobForm.FindEdit.Text := FieldByName('weftstru').AsString + '-' +
      FieldByName('wefttwist').AsString + '-' + FieldByName('weftcol').AsString;
    JobForm.WeightEdit.Text := FieldByName('required').AsString;
  end;
  if JobForm.ShowModal = ID_OK then
  begin
    if JobForm.SpinningRadio.Checked then
    begin
      Job := TODSpinJob.Create(Schedule);
      TODSpinJob(Job).JobNo := GetNextJobNo;
    end
    else
    begin
      Job := TODCleanJob.Create(Schedule);
      TODCleanJob(Job).JobNo := GetNextJobNo;
    end;
    Job.StartDate := JobForm.DatePicker.Date;
    Job.FinishDate := Job.StartDate;
    Schedule.AddJob(Job);
    if Job is TODSpinJob then
    begin
      Item := TODSpinJobItem.Create(Job);  //Owner can be anything here as reassigned on adding to Job
      Item.ItemNo := GetNextItemNo;
      Yarn := JobForm.YarnList.Items[JobForm.YarnList.ItemIndex];
      Item.Struct := GetStruct(Yarn);
      Item.Twist  := GetTwist(Yarn);
      Item.Color  := GetColor(Yarn);
      Item.Weight := StrToInt(JobForm.WeightEdit.Text);
      Item.Spindles := StrToInt(JobForm.SpindlesEdit.Text);
      Item.HoursPerKg := GetHoursPerKg(Item.Struct, Item.Twist);
      Job.AddItem(Item);
    end;
    Changed := True;
  end;
end;

procedure TMainForm.ReqGridStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
{  if (TypeCombo.ItemIndex = 1) and (WeaveReqSource.DataSet.RecordCount > 0) then
    BeginDrag(False);}
end;

procedure TMainForm.AddToGroup1Click(Sender: TObject);
begin
  GroupDragDrop(Group1, ReqGrid, 0, 0);
end;

procedure TMainForm.AddToGroup2Click(Sender: TObject);
begin
  GroupDragDrop(Group2, ReqGrid, 0, 0);
end;

procedure TMainForm.AddToGroup3Click(Sender: TObject);
begin
  GroupDragDrop(Group3, ReqGrid, 0, 0);
end;

procedure TMainForm.ReqPopupPopup(Sender: TObject);
var
  ok: Boolean;
begin
  ok := (TypeCombo.ItemIndex = 1) and (WeaveReqSource.DataSet.RecordCount > 0);
  AddToGroup1.Enabled := ok and (Group1.JobCount > 0);
  AddToGroup2.Enabled := ok and (Group2.JobCount > 0);
  AddToGroup3.Enabled := ok and (Group3.JobCount > 0);
end;

procedure TMainForm.SortButtonClick(Sender: TObject);
begin
{  SortJobs(Group1);
  SortJobs(Group2);
  SortJobs(Group3);}
end;

end.
