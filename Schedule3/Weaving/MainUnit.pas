unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Db, DBTables, Buttons, ComCtrls,
  Grids, DBGrids, ODSched, ODWeaSch, Mask, DBCtrls, ODDatPrn;

type
  TMainForm = class(TForm)
    LoomSpec: TTable;
    WeaveJob: TTable;
    WeaveItem: TTable;
    ToolPanel: TPanel;
    SaveButton: TSpeedButton;
    LoadButton: TSpeedButton;
    MaxItemNoQuery: TQuery;
    Scenario: TTable;
    ScenarioSource: TDataSource;
    WarpQuery: TQuery;
    SchedDB: TDatabase;
    FabricQuery: TQuery;
    ScheduleBox: TODScheduleBox;
    DesignSchedule: TODJobSchedule;
    ClearButton: TSpeedButton;
    PrintButton: TSpeedButton;
    ScenarioSCENARIONO: TIntegerField;
    ScenarioDESCR: TStringField;
    WeaveJobSCENARIONO: TIntegerField;
    WeaveJobLOOMNO: TIntegerField;
    WeaveJobJOBNO: TIntegerField;
    WeaveJobPLACENO: TIntegerField;
    WeaveJobSTARTDATE: TDateTimeField;
    WeaveJobENDDATE: TDateTimeField;
    WeaveJobWARPTYPE: TStringField;
    WeaveJobWARPCOL: TStringField;
    WeaveItemSCENARIONO: TIntegerField;
    WeaveItemSCHEDULENO: TIntegerField;
    WeaveItemJOBNO: TIntegerField;
    WeaveItemITEMNO: TIntegerField;
    WeaveItemPLACENO: TIntegerField;
    WarpEndsQuery: TQuery;
    WarpTypesQuery: TQuery;
    OutputButton: TSpeedButton;
    ExitButton: TSpeedButton;
    Output: TTable;
    OutputSCHENARIONO: TIntegerField;
    OutputREADYDATE: TDateTimeField;
    OutputVBSTRU: TStringField;
    OutputVBCOL: TStringField;
    ReqmtsButton: TSpeedButton;
    JobNoProc: TStoredProc;
    SpeedButton1: TSpeedButton;
    AboutButton: TSpeedButton;
    DataPrinter: TODDataPrinter;
    Status: TStatusBar;
    MsgTimer: TTimer;
    LoomSpecREF: TStringField;
    LoomSpecPOSN: TIntegerField;
    LoomSpecDESCR: TStringField;
    WarpEndsQueryTOTALENDS: TIntegerField;
    WarpTypesQueryWARPTYPE: TStringField;
    DowntimeType: TTable;
    LoomTypeQuery: TQuery;
    MaxScenarioNoQuery: TQuery;
    WarpType: TTable;
    WarpTypeWARPTYPE: TStringField;
    WarpTypeTOTALENDS: TIntegerField;
    WarpTypeDENTSPERCM: TFloatField;
    WarpTypeAVEHRS: TFloatField;
    WarpTypeGREIGELENPERCENT: TFloatField;
    WarpQueryWARPTYPE: TStringField;
    WarpQueryWARPCOL: TStringField;
    FabricQueryFABRICSTRU: TStringField;
    FabricQueryFABRICCOL: TStringField;
    FabricQueryWEFTCOL: TStringField;
    WeaveItemFABRICSTRU: TStringField;
    WeaveItemFABRICCOL: TStringField;
    WeaveItemWEFTCOL: TStringField;
    ReedJob: TTable;
    ReedJobSCENARIONO: TIntegerField;
    ReedJobLOOMNO: TIntegerField;
    ReedJobJOBNO: TIntegerField;
    ReedJobPLACENO: TIntegerField;
    ReedJobTOTALENDS: TIntegerField;
    ReedJobDENTSPERCM: TFloatField;
    ReedJobSTARTDATE: TDateTimeField;
    ReedJobENDDATE: TDateTimeField;
    DowntimeJob: TTable;
    DowntimeJobSCENARIONO: TIntegerField;
    DowntimeJobLOOMNO: TIntegerField;
    DowntimeJobJOBNO: TIntegerField;
    DowntimeJobPLACENO: TIntegerField;
    DowntimeJobDESCR: TStringField;
    DowntimeJobSTARTDATE: TDateTimeField;
    DowntimeJobENDDATE: TDateTimeField;
    DowntimeTypeDESCR: TStringField;
    FabricStructQuery: TQuery;
    WarpTypeWARPLEN: TIntegerField;
    WarpTypeWARPWGT: TFloatField;
    FabricStructQueryFABRICSTRU: TStringField;
    FabricStructQueryPIECELEN: TIntegerField;
    FabricStructQueryWARPPCEWGT: TFloatField;
    FabricStructQueryWEFTPCEWGT: TFloatField;
    FabricStructQueryHRSPERPIECE: TFloatField;
    EndsQuery: TQuery;
    MaintButton: TSpeedButton;
    VBMakePanel: TPanel;
    Label24: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    PcsStk2070ok: TDBEdit;
    EditPcsStk2070Reslit: TDBEdit;
    FinishesGrid: TDBGrid;
    VBMakeQuery: TQuery;
    VBMakeQueryVBSTRU: TStringField;
    VBMakeQueryVBCOL: TStringField;
    VBMakeQueryMIN127: TIntegerField;
    VBMakeQuerySTK127: TIntegerField;
    VBMakeQueryORD127: TIntegerField;
    VBMakeQueryPORD127: TFloatField;
    VBMakeQueryPSTK127: TFloatField;
    VBMakeQueryMIN89: TIntegerField;
    VBMakeQuerySTK89: TIntegerField;
    VBMakeQueryORD89: TIntegerField;
    VBMakeQueryPORD89: TFloatField;
    VBMakeQueryPSTK89: TFloatField;
    VBMakeQueryMIN2070: TIntegerField;
    VBMakeQuerySTK2070: TIntegerField;
    VBMakeQueryORD2070: TIntegerField;
    VBMakeQueryPORD2070: TFloatField;
    VBMakeQueryPSTK2070: TFloatField;
    VBMakeQueryFWIP: TFloatField;
    VBMakeQuerySALE89: TFloatField;
    VBMakeQuerySALE127: TFloatField;
    VBMakeQuerySALE2070: TFloatField;
    VBMakeQueryFIRSTSALEDATE: TDateTimeField;
    VBMakeQueryALLOC127: TIntegerField;
    VBMakeQueryALLOC89: TIntegerField;
    VBMakeQueryALLOC2070: TIntegerField;
    VBMakeQueryREMAIN127: TIntegerField;
    VBMakeQueryREMAIN89: TIntegerField;
    VBMakeQueryREMAIN2070: TIntegerField;
    VBMakeQueryCOLORDESCR: TStringField;
    VBMakeQuerySTYLEDESCR: TStringField;
    VBMakeQueryPARTNO: TStringField;
    VBMakeQuerySource: TDataSource;
    AllFinsQuery: TQuery;
    AllFinsQueryVBFIN: TStringField;
    AllFinsSource: TDataSource;
    EditWWIP: TDBEdit;
    EditVWIP: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    EditFWIP: TDBEdit;
    Label16: TLabel;
    VBParamsQuery: TQuery;
    VBParamsQueryMAKEDATE: TDateTimeField;
    VBParamsQuerySource: TDataSource;
    VBMake_WarpQuery: TQuery;
    VBMake_WarpQueryWWIP: TFloatField;
    VBMake_WarpQueryVWIP: TFloatField;
    VBMake_WarpSource: TDataSource;
    EditMakeDate: TDBEdit;
    StockDB: TDatabase;
    MakeGrid: TDBGrid;
    VBQuerySource: TDataSource;
    VBOrdQuery: TQuery;
    VBOrdQueryFWWARPMRQD: TIntegerField;
    VBOrdQueryPCS: TIntegerField;
    VBMinQuery: TQuery;
    IntegerField1: TIntegerField;
    IntegerField4: TIntegerField;
    VBRemQuery: TQuery;
    IntegerField5: TIntegerField;
    IntegerField8: TIntegerField;
    Panel1: TPanel;
    OrdersRadio: TRadioButton;
    ScheduleRadio: TRadioButton;
    EditFWMin: TDBEdit;
    Edit89Min: TDBEdit;
    Edit127Min: TDBEdit;
    EditFWStk: TDBEdit;
    Edit89Stk: TDBEdit;
    Edit127Stk: TDBEdit;
    EditFWOrd: TDBEdit;
    Edit89Ord: TDBEdit;
    Edit127Ord: TDBEdit;
    VBOrdQueryVBSTRU: TStringField;
    VBOrdQueryVBCOL: TStringField;
    VBMinQueryVBSTRU: TStringField;
    VBMinQueryVBCOL: TStringField;
    VBRemQueryVBSTRU: TStringField;
    VBRemQueryVBCOL: TStringField;
    TypeLabel: TLabel;
    VBOrdQueryWARP: TStringField;
    VBRemQueryWARP: TStringField;
    VBMinQueryWARP: TStringField;
    AllFinsQueryVBSTRU: TStringField;
    AllFinsQueryVBCOL: TStringField;
    VBOrdQueryVBTYPE: TStringField;
    VBMinQueryVBTYPE: TStringField;
    VBRemQueryVBTYPE: TStringField;
    DBNavigator1: TDBNavigator;
    TotPcsText: TStaticText;
    Label1: TLabel;
    VBOrdQueryWARPTYPE: TStringField;
    VBOrdQueryWARPCOL: TStringField;
    VBMinQueryWARPTYPE: TStringField;
    VBMinQueryWARPCOL: TStringField;
    VBRemQueryWARPTYPE: TStringField;
    VBRemQueryWARPCOL: TStringField;
    VBAllQuery: TQuery;
    VBAllQueryVBTYPE: TStringField;
    VBAllQueryFWWARPRQD: TIntegerField;
    VBAllQueryPCS: TIntegerField;
    VBAllQueryVBSTRU: TStringField;
    VBAllQueryVBCOL: TStringField;
    VBAllQueryWARP: TStringField;
    VBAllQueryWARPTYPE: TStringField;
    VBAllQueryWARPCOL: TStringField;
    FindEdit: TEdit;
    PriorityCombo: TComboBox;
    Label2: TLabel;
    FilterCheck: TCheckBox;
    Label3: TLabel;
    WarpRadio: TRadioButton;
    FabricRadio: TRadioButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ApplyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    VBMakeQueryPCSMIN127: TFloatField;
    VBMakeQueryPCSSTK127: TFloatField;
    VBMakeQueryPCSORD127: TFloatField;
    VBMakeQueryPCSALLOC127: TFloatField;
    VBMakeQueryPCSREMAIN127: TFloatField;
    VBMakeQueryPCSMIN89: TFloatField;
    VBMakeQueryPCSSTK89: TFloatField;
    VBMakeQueryPCSORD89: TFloatField;
    VBMakeQueryPCSALLOC89: TFloatField;
    VBMakeQueryPCSREMAIN89: TFloatField;
    VBMakeQueryPCSMIN2070: TFloatField;
    VBMakeQueryPCSSTK2070: TFloatField;
    VBMakeQueryPCSORD2070: TFloatField;
    VBMakeQueryPCSALLOC2070: TFloatField;
    VBMakeQueryPCSREMAIN2070: TFloatField;
    VBMakeQueryPCSFWIP: TFloatField;
    VBMakeQuerySTK2070OK: TIntegerField;
    VBMakeQuerySTK2070RESLIT: TIntegerField;
    VBMakeQueryPCSSTK2070OK: TFloatField;
    VBMakeQueryPCSSTK2070RESLIT: TFloatField;
    VBMake_WarpQueryPCSWWIP: TFloatField;
    VBMake_WarpQueryPCSVWIP: TFloatField;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    VBMakeQueryPCSAVESALE127: TFloatField;
    VBMakeQueryPCSAVESALE89: TFloatField;
    VBMakeQueryPCSAVESALE2070: TFloatField;
    AllFinsQueryPCSSTK2070: TFloatField;
    AllFinsQueryPCSORD89: TFloatField;
    AllFinsQueryPCSORD127: TFloatField;
    AllFinsQueryPCSORD2070: TFloatField;
    qryGetHoldOrders: TQuery;
    qryGetHoldOrdersHOLDPCS: TFloatField;
    VBMakeQueryPCSPTOTORD: TFloatField;
    VBMakeQueryPCSPTOTSTK: TFloatField;
    VBMakeQueryPCSPTOTRQD: TFloatField;
    Label7: TLabel;
    EditFWOrdHeld: TDBEdit;
    Edit89OrdHeld: TDBEdit;
    Edit127OrdHeld: TDBEdit;
    VBMakeQueryPCSPHELDORD127: TFloatField;
    VBMakeQueryPCSPHELDORD89: TFloatField;
    VBMakeQueryPCSPHELDORD2070: TFloatField;
    VBMakeQueryPCSPNOTHELDORD127: TFloatField;
    VBMakeQueryPCSPNOTHELDORD89: TFloatField;
    VBMakeQueryPCSPNOTHELDORD2070: TFloatField;
    VBMakeQueryDISCON127: TStringField;
    VBMakeQueryDISCON89: TStringField;
    VBMakeQueryDISCON2070: TStringField;
    LoomSpecLOOMSPECTYPE: TStringField;
    LoomTypeQueryLOOMSPECTYPE: TStringField;
    WeaveJobWARPLEN: TFloatField;
    WeaveItemWEFTPCS: TFloatField;
    VBOrdQueryPCSFLOAT: TFloatField;
    VBAllQueryPCSFLOAT: TFloatField;
    VBRemQueryPCSFLOAT: TFloatField;
    VBMinQueryPCSFLOAT: TFloatField;
    tabFirstUser: TTable;
    tabFirstUserUSERNAME: TStringField;
    datFirstUser: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure DoJobAdd(Schedule: TODJobSchedule);
    procedure DoJobEdit(Schedule: TODJobSchedule; Job: TODJob);
    procedure DoItemAdd(Schedule: TODJobSchedule; Job: TODJob);
    procedure JobDragOver(Schedule: TODJobSchedule; Job: TODJob;
      Index: Integer; var Accept: Boolean);
    procedure ItemDragOver(Schedule: TODJobSchedule; Job: TODJob;
      Item: TODJobItem; Index: Integer; var Accept: Boolean);
    procedure JobDragDrop(Schedule: TODJobSchedule; Job: TODJob);
    procedure AfterJobAdd(Schedule: TODJobSchedule; Job: TODJob);
    procedure AfterJobEdit(Schedule: TODJobSchedule; Job: TODJob);
    procedure AfterJobRemove(Schedule: TODJobSchedule);
    procedure BeforeJobFree(Schedule: TODJobSchedule; Job: TODJob);
    procedure ExitButtonClick(Sender: TObject);
    procedure OutputButtonClick(Sender: TObject);
    procedure AfterJobFree(Schedule: TODJobSchedule);
    procedure AfterItemAdd(Schedule: TODJobSchedule; Job: TODJob;
      Item: TODJobItem);
    procedure AfterItemFree(Schedule: TODJobSchedule; Job: TODJob);
    procedure AfterItemRemove(Schedule: TODJobSchedule; Job: TODJob);
    procedure ItemDragDrop(Schedule: TODJobSchedule; Job: TODJob;
      Item: TODJobItem);
    procedure ReqmtsButtonClick(Sender: TObject);
    procedure AboutButtonClick(Sender: TObject);
    procedure DoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MsgTimerTimer(Sender: TObject);
    procedure DoItemEdit(Schedule: TODJobSchedule; Job: TODJob;
      Item: TODJobItem);
    procedure AfterItemEdit(Schedule: TODJobSchedule; Job: TODJob;
      Item: TODJobItem);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MaintButtonClick(Sender: TObject);
    procedure ItemClick(Schedule: TODJobSchedule;
      Job: TODJob; Item: TODJobItem);
    procedure EditMakeDateDblClick(Sender: TObject);
    procedure ScheduleRadioClick(Sender: TObject);
    procedure OrdersRadioClick(Sender: TObject);
    procedure VBQueryAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure AllFinsQueryAfterScroll(DataSet: TDataSet);
    procedure FilterCheckClick(Sender: TObject);
    procedure JobClick(Schedule: TODJobSchedule;
      Job: TODJob);
    procedure BeforeItemFree(Schedule: TODJobSchedule;
      Job: TODJob; Item: TODJobItem);
    procedure BeforeJobRemove(Schedule: TODJobSchedule;
      Job: TODJob);
    procedure PriorityComboChange(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure FindRadioClick(Sender: TObject);
    procedure FindEditKeyPress(Sender: TObject; var Key: Char);
    procedure DeleteButtonClick(Sender: TObject);
    procedure VBMakeQuerySourceDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditFWStkDblClick(Sender: TObject);
    procedure Edit89StkDblClick(Sender: TObject);
    procedure Edit127StkDblClick(Sender: TObject);
    procedure EditFWOrdDblClick(Sender: TObject);
    procedure Edit89OrdDblClick(Sender: TObject);
    procedure Edit127OrdDblClick(Sender: TObject);
  private
    NextJobNo, NextItemNo: Integer;
    UpdateLocked{, IsOverReed}: Boolean;
    CurrentItem: TODJobItem;
    CurrentJob: TODWeaveJob;
    procedure LoadLooms;
    function GetAllowables: TStrings;
    function GetWarpTypes: TStrings;
    function GetFabricStructs: TStrings;
    function GetDowntimes: TStrings;
    function GetWorkHours: TStrings;
    function GetDefaultHours: TStrings;
    procedure UpdateMenuCaptions(Job: TODJob);
    procedure UpdateDates(Schedule: TODJobSchedule);
    procedure UpdateFooter(Schedule: TODJobSchedule);
    procedure SetStatus(const Msg: string);
{   procedure CalcRemCapacity(Job: TODJob);
    procedure CheckRemCapacity(Job: TODJob;    now public
      const FabricStruct: string; Pieces: Integer);}
    function GetWarpType(const WarpDescr: string): string;
    function GetWarpColor(const WarpDescr: string): string;
//  function GetFabricStruct(const FabricDescr: string): string; now public
    function GetFabricColor(const FabricDescr: string): string;
    function GetWeftColor(const FabricDescr: string): string;
    function GetJobDescr(Job: TODJob): string;
    procedure SetSelectedItems(const Fabric: string);
    procedure FindVBType;
  public
    StartDates, Allowables, LoomTypes, WarpTypes, FabricStructs,
      Downtimes, WorkHours, DefaultHours: TStrings;
    Changed, Searching, WasFirstJob: Boolean;
    gUserName:string; //added DL031013
    function GetFabricStruct(const FabricDescr: string): string;
    procedure CalcRemCapacity(Job: TODJob);
    procedure CheckRemCapacity(Job: TODJob;
      const FabricStruct: string; Pieces: double {Integer});
    procedure CalcDuration(Job: TODJob);
//    procedure DeleteScenarioJobs;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

{Allowables list structure :-
        Allowables
            |
          Tappet - C-BU9 (warp type/col) - A-WHT - B-WHT ...
            |        |                        |       |
          Dobby ...  K900:BU9 (fabric/weft)   ...     ...
            |        |
            ...      K451:BU9
                     ...
 Allowables
     |__Loom
     :    |__Warp
          :    |__Fabric
               :         }
uses
  LoadUnit, SaveUnit, JobUnit, ItemUnit, OutUnit, ReqUnit, AboutUnit,
  PrnUnit, MaintUnit, DBLogin, DelUnit,
  VBModal; //VBModal added DL110607

type
  TWarpInfo = class(TObject)
  public
    StdLength, TotalEnds: Integer;
    StdWeight, LossFactor, DentsPerCm, AveHrs: Single;
  end;

  TFabricInfo = class(TObject)
  public
    PieceLength: Integer;
    WarpPceWeight, WeftPceWeight, HrsPerPiece: Single;
  end;

const
  LoomWdwCaption = 'Loom Loading Planner';
  clWarp = clBlue;      //keep these different! - used as IDs
  clReed = clGreen;
  clDowntime = clPurple;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  LoginForm := TLoginForm.Create(Application);
  if LoginForm.ShowModal = ID_OK then
  begin
    SchedDB.Params.Clear;
    StockDB.Params.Clear;
    {if LoginForm.cbxServerOrLocal.Text='Server (no replication)' then
    begin
      SchedDB.AliasName:='Weaving6LinuxSQL';
      SchedDB.Params.Add('SERVER NAME=commander:/usr/interbase/weaving6.gdb');
      StockDB.AliasName:='VBStock6LinuxSQL';
      StockDB.Params.Add('SERVER NAME=commander:/usr/interbase/vbstock6.gdb');
    end
    else //LoginForm.cbxServerOrLocal.Text='Replication (local)'
    begin
      SchedDB.AliasName:='Weaving6ReplSQL';
      SchedDB.Params.Add('SERVER NAME=D:\a_usr\ibdatabase\Linux\weaving6.gdb');
      StockDB.AliasName:='VBStock6ReplSQL';
      StockDB.Params.Add('SERVER NAME=D:\a_usr\ibdatabase\Linux\vbstock6.gdb');
    end;}

    SchedDB.Params.Add('USER NAME=' + LoginForm.UserNameEdit.Text);
    gUserName:=LoginForm.UserNameEdit.Text; //added DL031013
    SchedDB.Params.Add('PASSWORD=' + LoginForm.PasswordEdit.Text);
    SchedDB.Params.Add('OPEN MODE=READ/WRITE');
    SchedDB.Params.Add('SCHEMA CACHE SIZE=8');
    SchedDB.Params.Add('LANGDRIVER=');
    SchedDB.Params.Add('SQLQRYMODE=');
    SchedDB.Params.Add('SQLPASSTHRU MODE=SHARED NOAUTOCOMMIT');
    SchedDB.Params.Add('SCHEMA CACHE TIME=-1');
    SchedDB.Params.Add('MAX ROWS=-1');
    SchedDB.Params.Add('BATCH COUNT=200');
    SchedDB.Params.Add('ENABLE SCHEMA CACHE=FALSE');
    SchedDB.Params.Add('SCHEMA CACHE DIR=');
    SchedDB.Params.Add('ENABLE BCD=FALSE');
    SchedDB.Params.Add('BLOBS TO CACHE=64');
    SchedDB.Params.Add('BLOB SIZE=32');

    StockDB.Params.Add('USER NAME=' + LoginForm.UserNameEdit.Text);
    StockDB.Params.Add('PASSWORD=' + LoginForm.PasswordEdit.Text);
    StockDB.Params.Add('OPEN MODE=READ/WRITE');
    StockDB.Params.Add('SCHEMA CACHE SIZE=8');
    StockDB.Params.Add('LANGDRIVER=');
    StockDB.Params.Add('SQLQRYMODE=');
    StockDB.Params.Add('SQLPASSTHRU MODE=SHARED NOAUTOCOMMIT');
    StockDB.Params.Add('SCHEMA CACHE TIME=-1');
    StockDB.Params.Add('MAX ROWS=-1');
    StockDB.Params.Add('BATCH COUNT=200');
    StockDB.Params.Add('ENABLE SCHEMA CACHE=FALSE');
    StockDB.Params.Add('SCHEMA CACHE DIR=');
    StockDB.Params.Add('ENABLE BCD=FALSE');
    StockDB.Params.Add('BLOBS TO CACHE=64');
    StockDB.Params.Add('BLOB SIZE=32');


    //SchedDB.Params.Add('USER NAME=' + LoginForm.UserNameEdit.Text);
    //SchedDB.Params.Add('PASSWORD=' + LoginForm.PasswordEdit.Text);
    //StockDB.Params.Add('USER NAME=' + LoginForm.UserNameEdit.Text);
    //StockDB.Params.Add('PASSWORD=' + LoginForm.PasswordEdit.Text);

    //LoginParams.Values['USER NAME'] := PasswordDlg.UName.Text;
    //LoginParams.Values['PASSWORD'] := PasswordDlg.PWord.Text;
  end
  else Halt(1);
  try
    SchedDB.Open;
    StockDB.Open;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Halt(1);
    end;
  end;
  LoginForm.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  iSched: Integer;
begin
  ShortDateFormat := 'dd/mm/yyyy'; //changed to yyyy DL030200
  ODABoutForm.ShowAsSplash;
  Width := 602;
  Caption := LoomWdwCaption;
  DesignSchedule.Free;      //just used for creating handlers at design time
  NextJobNo := 1;
  NextItemNo := 1;
//  SchedDB.Open;
  tabFirstUser.Open; //added DL031013 modified DL031030
  Scenario.Open;
  WeaveJob.Open;
  WeaveItem.Open;
  ReedJob.Open;
  DowntimeJob.Open;
  LoomTypes := TStringList.Create;
  Allowables := GetAllowables;
  WarpTypes := GetWarpTypes;
  FabricStructs := GetFabricStructs;
  Downtimes := GetDowntimes;
  DowntimeType.Close;
  LoadLooms;
  WorkHours := GetWorkHours;
  DefaultHours := GetDefaultHours;
  StartDates := TStringList.Create;
  for iSched := 0 to ScheduleBox.ScheduleCount-1 do  //init start dates
    StartDates.AddObject('0', ScheduleBox[iSched]);
  with EndsQuery do
  begin
    Open;
    while not EOF do
    begin
      JobForm.EndsCombo.Items.Add(Fields[0].AsString);
      Next;
    end;
    Close;
  end;
  LoadButton.Enabled := Scenario.Active;
  if tabFirstUserUSERNAME.AsString=gUserName then //added DL031013
    DeleteButton.Enabled := Scenario.Active
  else
    DeleteButton.Enabled:=false; //added DL031013
//  StockDB.Open;
  VBMakeQuery.Prepare;
  VBOrdQuery.Prepare;
  VBMinQuery.Prepare;
  VBRemQuery.Prepare;
  VBAllQuery.Prepare;
  VBMake_WarpQuery.Prepare;
  AllFinsQuery.Prepare;
  VBParamsQuery.Open;
  VBOrdQuery.Open;
  VBMinQuery.Open;
  VBRemQuery.Open;
  VBAllQuery.Open;
  VBMake_WarpQuery.Open;
  VBMakeQuery.Open;
  AllFinsQuery.Open;
  PriorityCombo.OnChange := nil;
  PriorityCombo.ItemIndex := 0;
  PriorityCombo.OnChange := PriorityComboChange;
  ODAboutForm.Close;
  MaintForm.Params.Open;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
  procedure FreeList(List: TStrings);
  var
    ix: Integer;
  begin
    for ix := 0 to List.Count-1 do
      if List.Objects[ix] <> nil then
        FreeList(TStrings(List.Objects[ix]));
    List.Free;
  end;
var
  ix: Integer;
begin
  if StartDates = nil then Exit;
  StartDates.Free;
  LoomTypes.Free;
  Downtimes.Free;
  FreeList(Allowables);
  for ix := 0 to WarpTypes.Count-1 do
    TWarpInfo(WarpTypes.Objects[ix]).Free;
  WarpTypes.Free;
  for ix := 0 to FabricStructs.Count-1 do
    TFabricInfo(FabricStructs.Objects[ix]).Free;
  FabricStructs.Free;
//  FreeList(WorkHours);
  for ix := 0 to WorkHours.Count-1 do
    TStrings(WorkHours.Objects[ix]).Free;
  WorkHours.Free;
  DefaultHours.Free;
end;

function TMainForm.GetWarpType(const WarpDescr: string): string;
begin           //extract WarpType, eg 'B' from 'B-WHT'
  Result := Copy(WarpDescr, 1, Pos('-', WarpDescr)-1)
end;

function TMainForm.GetWarpColor(const WarpDescr: string): string;
var           //extract WarpCol, eg 'WHT' from 'B-WHT 3000m'
  iHyphen, iSpace: Integer;
begin
  iHyphen := Pos('-', WarpDescr);
  iSpace := Pos(' ', WarpDescr);
  if iSpace = 0 then
    iSpace := Length(WarpDescr);
  if iHyphen > 0 then
    Result := Copy(WarpDescr, iHyphen +1, iSpace - iHyphen)
  else
    Result := '';
end;

function TMainForm.GetFabricStruct(const FabricDescr: string): string;
//var           //extract FabricStru, eg 'R' from 'R133 : WHT'
//  ip: Integer;
begin
  //removed all commented out code DL090901: all fabrics are 3 chars wide
  //if FabricDescr[2] in ['A'..'Z'] then
  //  ip := 2 else ip := 1;
  //Result := Copy(FabricDescr, 1, ip)

  //extract FabricStru, eg 'RIB' from 'RIB133 : WHT'
  Result := Copy(FabricDescr, 1, 3); //added DL090901
end;

function TMainForm.GetFabricColor(const FabricDescr: string): string;
//var           //extract FabricCol, eg '133' from 'R133 : WHT'
//  iStart, iFinish: Integer;
begin
  //removed all commented out code DL090901: all fabrics are 3 chars wide
  //if FabricDescr[2] in ['A'..'Z'] then
  //  iStart := 3 else iStart := 2;
  //iFinish := Pos(' : ', FabricDescr);
  //Result := Copy(FabricDescr, iStart, iFinish - iStart)

  //extract FabricStru, eg 'RIB' from 'RIB133 : WHT'
  Result := Copy(FabricDescr, 4, 3); //added DL090901
end;

function TMainForm.GetWeftColor(const FabricDescr: string): string;
//var           //extract WeftType, eg 'WHT' from 'R133 : WHT'
//  ip: Integer;
begin
  //removed all commented out code DL090901: all fabrics are 3 chars wide
  //ip := Pos(' : ', FabricDescr) + 3;
  //extract FabricStru, eg 'RIB' from 'RIB133 : WHT'
  //Result := Copy(FabricDescr, ip, Length(FabricDescr) -ip +1)

  //extract FabricStru, eg 'RIB' from 'RIB133 : WHT'
  Result := Copy(FabricDescr, 10, 3); //added DL090901
end;

function TMainForm.GetAllowables: TStrings;

  function GetWarpsAllowed(const LoomType: string): TStrings;

    function GetFabricsAllowed(const LoomType, WarpType, WarpCol: string): TStrings;
    begin
      Result := TStringList.Create;
      with FabricQuery do
      begin
        ParamByName('LoomType').AsString := LoomType;
        ParamByName('WarpType').AsString := WarpType;
        ParamByName('WarpCol').AsString := WarpCol;
        Open;
        First;
        while not EOF do
        begin
          Result.Add(
            FabricQueryFABRICSTRU.AsString + FabricQueryFABRICCOL.AsString +
            ' : ' + FabricQueryWEFTCOL.AsString);
          Next;
        end;
        Close;
      end;
    end;

  begin {GetWarpsAllowed}
    Result := TStringList.Create;
    with WarpQuery do
    begin
      Params[0].AsString := LoomType;
      Open;
      First;
      while not EOF do
      begin
        Result.AddObject(
          WarpQueryWARPTYPE.AsString + '-' + WarpQueryWARPCOL.AsString,
          GetFabricsAllowed(LoomType,
            WarpQueryWARPTYPE.AsString, WarpQueryWARPCOL.AsString));
        Next;
      end;
      Close;
    end;
  end;

begin {GetAllowables}
  Result := TStringList.Create;
  WarpQuery.Prepare;
  FabricQuery.Prepare;
  with LoomTypeQuery do
  begin
    Open;
    First;
    while not EOF do
    begin
      Result.AddObject(LoomTypeQueryLOOMSPECTYPE.AsString,
        GetWarpsAllowed(LoomTypeQueryLOOMSPECTYPE.AsString));
      Next;
    end;
    Close;
  end;
end;

function TMainForm.GetWarpTypes: TStrings;
var
  wi: TWarpInfo;
begin           //enlist warp types per their warp ends
  Result := TStringList.Create;
  WarpType.Open;
  while not WarpType.EOF do
  begin
    wi := TWarpInfo.Create;
    wi.StdLength  := WarpTypeWARPLEN.AsInteger;
    wi.TotalEnds  := WarpTypeTOTALENDS.AsInteger;
    wi.LossFactor := WarpTypeGREIGELENPERCENT.AsInteger /100;
    wi.StdWeight  := WarpTypeWARPWGT.AsFloat;
    wi.AveHrs     := WarpTypeAVEHRS.AsFloat;
    wi.DentsPerCm := WarpTypeDENTSPERCM.AsFloat;
    Result.AddObject(WarpTypeWARPTYPE.AsString, wi);
    WarpType.Next;
  end;
  WarpType.Close;
end;

function TMainForm.GetFabricStructs: TStrings;
var
  fi: TFabricInfo;
begin
  Result := TStringList.Create;
  FabricStructQuery.Open;
  while not FabricStructQuery.EOF do
  begin
    fi := TFabricInfo.Create;
    fi.PieceLength   := FabricStructQueryPIECELEN.AsInteger;
    fi.WarpPceWeight := FabricStructQueryWARPPCEWGT.AsFloat;
    fi.WeftPceWeight := FabricStructQueryWEFTPCEWGT.AsFloat;
    fi.HrsPerPiece   := FabricStructQueryHRSPERPIECE.AsFloat;
    Result.AddObject(FabricStructQueryFABRICSTRU.AsString, fi);
    FabricStructQuery.Next;
  end;
  FabricStructQuery.Close;
end;

function TMainForm.GetDowntimes: TStrings;
begin
  Result := TStringList.Create;
  DowntimeType.Open;
  while not DowntimeType.EOF do
  begin
    Result.Add(DowntimeTypeDESCR.AsString);
    DowntimeType.Next;
  end;
end;

function TMainForm.GetWorkHours: TStrings;
var
  ix: Integer;
{                       WorkHours
                            Loom1      Loom2    ...
                              25/09/98   26/09/98  ...    }
begin
  Result := TStringList.Create;
  for ix := 0 to ScheduleBox.ScheduleCount-1 do
    Result.AddObject('Loom' + IntToStr(ix+1), TStringList.Create);
  with MaintForm do
  begin
    WorkHours.Open;
    WorkHours.First;
    while not WorkHours.EOF do
    begin
      for ix := 0 to Result.Count-1 do
{        TStringList(Result.Objects[ix]).AddObject(
          WorkHoursWORKDAY.AsString,
            Pointer(WorkHours.Fields[ix+2].AsFloat));}
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

procedure TMainForm.LoadLooms;    //instantiate the loom schedules -
begin
  LoomSpec.Open;
  try
    while not LoomSpec.EOF do
    begin
      with ScheduleBox.AddScheduleFrom(
        LoomSpecPOSN.Value, LoomSpecDESCR.AsString, '') do
      begin
        ScheduleNo := LoomSpecPOSN.Value;
        Header := LoomSpecDESCR.AsString;
        Tag := Allowables.IndexOf(LoomSpecLOOMSPECTYPE.AsString); //keep loom type - modified DL180701
        with MenuCaptions do
        begin
          AddItem := '&Add Fabric...';
          EditItem := '&Edit Fabric...';
          RemoveItem := '&Remove Fabric';
          ClearItems := '&Clear Fabrics';
//        AddJob := '&Add Warp...';
          EditJob := '&Edit Warp';
          RemoveJob := '&Remove Warp';
          ClearJobs := '&Clear All';
        end;
        OnDoJobAdd := DoJobAdd;          //connect event handlers -
        OnDoJobEdit := DoJobEdit;
        OnDoItemAdd := DoItemAdd;
        OnDoItemEdit := DoItemEdit;
        OnJobDragOver := JobDragOver;
        OnItemDragOver := ItemDragOver;
        OnJobDragDrop := JobDragDrop;
        OnItemDragDrop := ItemDragDrop;
        OnBeforeJobRemove := BeforeJobRemove;
        OnBeforeJobFree := BeforeJobFree;
        OnBeforeItemFree := BeforeItemFree;
        OnAfterJobAdd := AfterJobAdd;
        OnAfterJobEdit := AfterJobEdit;
        OnAfterJobFree := AfterJobFree;
        OnAfterJobRemove := AfterJobRemove;
        OnAfterItemAdd := AfterItemAdd;
        OnAfterItemEdit := AfterItemEdit;
        OnAfterItemFree := AfterItemFree;
        OnAfterItemRemove := AfterItemRemove;
        OnMouseUp := DoMouseUp;
        OnItemClick := ItemClick;
        OnJobClick := JobClick;
      end;
      LoomSpec.Next;
    end;
  finally
    LoomSpec.Close;
  end;
end;

procedure TMainForm.LoadButtonClick(Sender: TObject);

  procedure LoadJobs(ASchedule: TODJobSchedule);
  var
    iJob, iItem, iEnds, ix: Integer;
    aJob: TODJob;
  begin
    ASchedule.ClearJobs(True);
    ReedJob.Close; //added DL031030
    ReedJob.Open; //added DL031030
    ReedJob.First;
    while not ReedJob.EOF do
    begin
      if ASchedule.ScheduleNo = ReedJobLOOMNO.AsInteger then    //add job -
      begin
        aJob := TODReedJob.Create(Self);
        with TODReedJob(aJob) do
        begin
          JobNo := ReedJobJOBNO.AsInteger;
          TotalEnds := ReedJobTOTALENDS.AsInteger;
          DentsPerCm := ReedJobDENTSPERCM.AsFloat;
          StartDate := ReedJobSTARTDATE.AsDateTime;
          FinishDate := ReedJobENDDATE.AsDateTime;
          Tag := ReedJobPLACENO.AsInteger;   //temp place no holder
        end;
        ASchedule.AddJob(aJob);
        UpdateMenuCaptions(aJob);
      end;
      ReedJob.Next;
    end;
    DowntimeJob.Close; //added DL031030
    DowntimeJob.Open; //added DL031030
    DowntimeJob.First;
    while not DowntimeJob.EOF do
    begin
      if ASchedule.ScheduleNo = DowntimeJobLOOMNO.AsInteger then    //add job -
      begin
        aJob := TODDowntimeJob.Create(Self);
        with TODDowntimeJob(aJob) do
        begin
          JobNo := DowntimeJobJOBNO.AsInteger;
          Descr := DowntimeJobDESCR.AsString;
          StartDate := DowntimeJobSTARTDATE.AsDateTime;
          FinishDate := DowntimeJobENDDATE.AsDateTime;
          Tag := DowntimeJobPLACENO.AsInteger;   //temp place no holder
        end;
        ASchedule.AddJob(aJob);
        UpdateMenuCaptions(aJob);
      end;
      DowntimeJob.Next;
    end;
    WeaveJob.Close; //added DL031030
    WeaveJob.Open; //added DL031030
    WeaveJob.First;
    while not WeaveJob.EOF do
    begin
      if (ASchedule.ScheduleNo = WeaveJobLOOMNO.AsInteger) then    //add job -
      begin
        aJob := TODWeaveJob.Create(Self);
        with TODWeaveJob(aJob) do
        begin
          JobNo := WeaveJobJOBNO.AsInteger;
          WarpType := WeaveJobWARPTYPE.AsString;
          WarpColor := WeaveJobWARPCOL.AsString;
          WarpLength := WeaveJobWARPLEN.AsFloat;
          StartDate := WeaveJobSTARTDATE.AsDateTime;
          FinishDate := WeaveJobENDDATE.AsDateTime;
          Tag := WeaveJobPLACENO.AsInteger;
          ASchedule.AddJob(aJob);  //do here so items menus initialized
          WeaveItem.First;
          while not WeaveItem.EOF do    //load job items -
          begin
            if JobNo = WeaveItemJOBNO.AsInteger then        //add job item -
              with AddItemFrom(WeaveItemITEMNO.AsInteger,
                 WeaveItemFABRICSTRU.AsString, WeaveItemFABRICCOL.AsString,
                 WeaveItemWEFTCOL.AsString, WeaveItemWEFTPCS.AsFloat) do
                Tag := WeaveItemPLACENO.AsInteger;
            WeaveItem.Next;
          end;
        end;
//        CalcRemCapacity(aJob);
//      ASchedule.AddJob(aJob);  see above
      end;
      WeaveJob.Next;
    end;
    with ASchedule do
    begin
      for ix := 0 to 4 do  //jt990421 repeat 5 times to make sure
        for iJob := 0 to JobCount-1 do    //sort jobs and their items -
          with Jobs[iJob] do
          begin
            for iItem := 0 to ItemCount-1 do
              MoveItem(iItem, Items[iItem].Tag);
            MoveJob(iJob, Tag);
          end;
{      for iJob := 0 to JobCount-1 do    //repeat sort to make sure -
        with Jobs[iJob] do
        begin
          for iItem := 0 to ItemCount-1 do
            MoveItem(iItem, Items[iItem].Tag);
          MoveJob(iJob, Tag);
        end;}
      iEnds := 0;
      for iJob := 0 to JobCount-1 do  //store the ends (reed) in the job's Tag
        if Jobs[iJob] is TODReedJob then
          iEnds := TODReedJob(Jobs[iJob]).TotalEnds
        else
          Jobs[iJob].Tag := iEnds;
      if JobCount > 0 then
        Footer := 'Finish: ' + {DateToStr(Jobs[JobCount-1].FinishDate)}
          FormatDateTime('dd mmm', (Jobs[JobCount-1].FinishDate))
      else
        Footer := '';
    end;
  end;

var
  ix: Integer;
begin {LoadButtonClick}
  if Changed then
    case MessageDlg('Do you want to first save the current scenario?',
        mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: SaveButtonClick(nil);
      mrNo: ;
      mrCancel: Exit;
    end;
  //if params.firstuser is not null, then this new user can view only,
  //but cannot modify DL031013
  //ScheduleBox.AllowEdits:=false; //added DL031013
  if tabFirstUserUSERNAME.AsString<>gUserName then
  begin
    if (tabFirstUserUSERNAME.AsString<>'') then
    begin
      VBMakePanel.Color:=clRed;
      ShowMessage('You can only view scenarios because User '+tabFirstUserUSERNAME.AsString+' can edit')
    end
    else
    begin
      if not SchedDB.InTransaction then
        SchedDB.StartTransaction;
      tabFirstUser.Edit;
      tabFirstUserUSERNAME.AsString:=gUserName;
      tabFirstUser.Post;
      SchedDB.Commit;
      //ScheduleBox.AllowEdits:=true; //added DL031013
      VBMakePanel.Color:=clBtnFace;
    end;
  end
  else
  begin
    //ScheduleBox.AllowEdits:=true; //added DL031013
    VBMakePanel.Color:=clBtnFace;
  end;
  if LoadForm.ShowModal = ID_OK then
  begin
    Caption := LoomWdwCaption + ' - ' + ScenarioDESCR.Value;
    UpdateLocked := True;
    try
      for ix := 0 to ScheduleBox.ScheduleCount-1 do
        LoadJobs(ScheduleBox[ix]);
    finally
      UpdateLocked := False;
    end;
    for ix := 0 to ScheduleBox.ScheduleCount-1 do
    begin
      UpdateDates(ScheduleBox[ix]);
{      with ScheduleBox[ix] do
        if (JobCount > 0) and ((Jobs[JobCount-1].Top +
           Jobs[JobCount-1].Height) > ClientHeight) then
          Resize;      //add vert scroll bar}
    end;
    if tabFirstUserUSERNAME.AsString=gUserName then //added DL031013
      SaveButton.Enabled := True;
    ClearButton.Enabled := True;
    PrintButton.Enabled := True;
    ReqmtsButton.Enabled := True;
    OutputButton.Enabled := True;
    MaxItemNoQuery.Close;
    MaxItemNoQuery.ParamByName('ScenarioNo').AsInteger :=
      ScenarioSCENARIONO.AsInteger;
    MaxItemNoQuery.Open;
    NextItemNo := MaxItemNoQuery.Fields[0].AsInteger + 1;
    MaxItemNoQuery.Close;
    Changed := False;
  end;
  CurrentItem := nil;
end;

procedure TMainForm.SaveButtonClick(Sender: TObject);

  procedure SaveSchedule(ASchedule: TODJobSchedule);
  var
    iJob, iItem: Integer;
  begin
    with ASchedule do
      for iJob := 0 to JobCount-1 do         //save each job -
      begin
        if Jobs[iJob] is TODWeaveJob then
          with TODWeaveJob(Jobs[iJob]) do
          begin
            WeaveJob.Insert;             //add job -
            WeaveJobSCENARIONO.Value := ScenarioSCENARIONO.Value;
            WeaveJobLOOMNO.Value := ScheduleNo;
            WeaveJobJOBNO.Value := JobNo;
            WeaveJobPLACENO.Value := iJob;
            WeaveJobWARPTYPE.AsString := WarpType;
            WeaveJobWARPCOL.AsString := WarpColor;
            WeaveJobWARPLEN.AsFloat := WarpLength;
            WeaveJobSTARTDATE.AsDateTime := Int(StartDate);
            WeaveJobENDDATE.AsDateTime := Int(FinishDate);
            WeaveJob.Post;
            for iItem := 0 to ItemCount-1 do      //save each job item -
              with Items[iItem] do
              begin
                WeaveItem.Insert;            //add item -
                WeaveItemSCENARIONO.AsInteger := ScenarioSCENARIONO.Value;
                WeaveItemSCHEDULENO.AsInteger := ScheduleNo;
                WeaveItemJOBNO.AsInteger := JobNo;
                WeaveItemITEMNO.AsInteger := Items[iItem].ItemNo;
                WeaveItemPLACENO.AsInteger := iItem;
                WeaveItemFABRICSTRU.AsString := FabricStruct;
                WeaveItemFABRICCOL.AsString := FabricColor;
                WeaveItemWEFTCOL.AsString := WeftColor;
                WeaveItemWEFTPCS.AsFloat := WeftPieces;
                WeaveItem.Post;
              end;
          end
        else if Jobs[iJob] is TODReedJob then
          with TODReedJob(Jobs[iJob]) do
          begin
            ReedJob.Insert;             //add job -
            ReedJobSCENARIONO.Value := ScenarioSCENARIONO.Value;
            ReedJobLOOMNO.Value := ScheduleNo;
            ReedJobJOBNO.Value := JobNo;
            ReedJobPLACENO.Value := iJob;
            ReedJobTOTALENDS.AsInteger := TotalEnds;
            ReedJobDENTSPERCM.AsFloat := DentsPerCm;
            ReedJobSTARTDATE.AsDateTime := Int(StartDate);
            ReedJobENDDATE.AsDateTime := Int(FinishDate);
            ReedJob.Post;
          end
        else if Jobs[iJob] is TODDowntimeJob then
          with TODDowntimeJob(Jobs[iJob]) do
          begin
            DowntimeJob.Insert;             //add job -
            DowntimeJobSCENARIONO.Value := ScenarioSCENARIONO.Value;
            DowntimeJobLOOMNO.Value := ScheduleNo;
            DowntimeJobJOBNO.Value := JobNo;
            DowntimeJobPLACENO.Value := iJob;
            DowntimeJobDESCR.AsString := Descr;
            DowntimeJobSTARTDATE.AsDateTime := Int(StartDate);
            DowntimeJobENDDATE.AsDateTime := Int(FinishDate);
            DowntimeJob.Post;
          end;
      end;
  end;

var
  ix: Integer;
begin {SaveButtonClick}
  MaxScenarioNoQuery.Open;
  ix := MaxScenarioNoQuery.Fields[0].AsInteger + 1;  //next scenario no
  MaxScenarioNoQuery.Close;
  with SaveForm do
  begin
    NumberEdit.Text := IntToStr(ix);
    NumberEdit.Tag := ix;
    DescrEdit.Text := 'Scenario ' + IntToStr(ix);
    ScenarioSource.DataSet := Scenario;
    if not SchedDB.InTransaction then
      SchedDB.StartTransaction;
    ShowModal;
    if ModalResult in [mrOK, mrYes] then
    begin
//      SchedDB.StartTransaction;  //jt990430  moved above because of Params edit on save dlg
      try
        if NumberEdit.Text <> '' then  //jt990430 if saving scenario & not just changing active scenario
        begin
          if ModalResult = mrYes then   //overwriting a stored scenario
            if Scenario.FindKey([StrToInt(NumberEdit.Text)]) then
              DeleteForm.DeleteScenario    //delete prev version
            else raise EDatabaseError.Create(
              'Scenario number ' + NumberEdit.Text + ' not found');
          Scenario.Insert;
          ScenarioSCENARIONO.Value := StrToInt(NumberEdit.Text);
          ScenarioDESCR.Value := DescrEdit.Text;
          Scenario.Post;
          for ix := 0 to ScheduleBox.ScheduleCount-1 do
            SaveSchedule(ScheduleBox[ix]);
        end;
        SchedDB.Commit;
      except
        SchedDB.RollBack;
      end;
      Self.Caption := LoomWdwCaption + ' - ' + ScenarioDESCR.Value;
      Changed := False;
      ReqmtsButton.Enabled := True;
      OutputButton.Enabled := True;
    end
    else if SchedDB.InTransaction then
      SchedDB.Rollback;
  end;
end;

procedure TMainForm.DeleteButtonClick(Sender: TObject);
begin
  DeleteForm.ShowModal;
end;

procedure TMainForm.ClearButtonClick(Sender: TObject);
var
  ix: Integer;
begin
  if MessageDlg('Clear all jobs?', mtConfirmation, [mbYes, mbNo], 0)
    <> mrYes then Exit;
  UpdateLocked := True;
  try
    for ix := 0 to ScheduleBox.ScheduleCount-1 do
      with ScheduleBox[ix] do
      begin
        ClearJobs(True);
        Footer := '';
      end;
  finally
    UpdateLocked := False;
  end;
  Caption := LoomWdwCaption;
  SaveButton.Enabled := False;
  ClearButton.Enabled := False;
  PrintButton.Enabled := False;
  ReqmtsButton.Enabled := False;
  OutputButton.Enabled := False;
  Changed := False;
  CurrentItem := nil;
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
          Result.Add('------------------');
          for iItem := 0 to ItemCount-1 do
            Result.Add(Items[iItem].Caption);
        end;
        if Status <> '' then
        begin
          Result.Add(Status);
//          Result.Add('------------------');
//          Result.Add('');  //leave space for writing actual time
        end;
        Result.Add('_________________'); //added _ DL081001
      end;
  end;

var
  iCol, mRow: Integer;
  sList: TList;
  aLines, sHeaders: TStrings;
begin {PrintButtonClick}         //row by row via string lists
  //Split into two pages - 7 looms on first page; 6 looms on second page (landscape)
  //print first page
  mRow := 0;
  sList := TList.Create;
  sHeaders := TStringList.Create;
  try
    //for iCol := 0 to ScheduleBox.ScheduleCount-1 do //get list for each column -
    for iCol := 0 to 6 do //get list for each column - 0 to 6 is seven looms
    begin
      sHeaders.Add(ScheduleBox[iCol].Header);
      aLines := GetScheduleValues(ScheduleBox[iCol]);
      if aLines.Count > mRow then
        mRow := aLines.Count;
      sList.Add(aLines);
    end;
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
  //print second page
  mRow := 0;
  sList := TList.Create;
  sHeaders := TStringList.Create;
  try
    //for iCol := 0 to ScheduleBox.ScheduleCount-1 do //get list for each column -
    for iCol := 7 to ScheduleBox.ScheduleCount-1 do //get list for each column - 8th loom to 13th loom
    begin
      sHeaders.Add(ScheduleBox[iCol].Header);
      aLines := GetScheduleValues(ScheduleBox[iCol]);
      if aLines.Count > mRow then
        mRow := aLines.Count;
      sList.Add(aLines);
    end;
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
(*
procedure TMainForm.DeleteScenarioJobs;

  procedure DeleteScheduleJobs(ASchedule: TODJobSchedule);
  begin
    WeaveJob.First;
    while not WeaveJob.EOF do
      if WeaveJobLOOMNO.Value = ASchedule.ScheduleNo then
      begin
        WeaveItem.First;
        while not WeaveItem.EOF do
          if WeaveItemJOBNO.Value = WeaveJobJOBNO.Value then
            WeaveItem.Delete
          else
            WeaveItem.Next;
        WeaveJob.Delete;
      end
      else WeaveJob.Next;
    ReedJob.First;
    while not ReedJob.EOF do
      if ReedJobLOOMNO.Value = ASchedule.ScheduleNo then
        ReedJob.Delete
      else
       ReedJob.Next;
    DowntimeJob.First;
    while not DowntimeJob.EOF do
      if DowntimeJobLOOMNO.Value = ASchedule.ScheduleNo then
        DowntimeJob.Delete
      else
       DowntimeJob.Next;
  end;

var
  ix: Integer;
begin {DeleteScenarioJobs}
  UpdateLocked := True;
  try
    for ix := 0 to ScheduleBox.ScheduleCount-1 do
      DeleteScheduleJobs(ScheduleBox[ix]);
  finally
    UpdateLocked := False;
  end;
end;
*)
function TMainForm.GetJobDescr(Job: TODJob): string;
begin
  if Job is TODWeaveJob then
    Result := TODWeaveJob(Job).Descr
  else if Job is TODReedJob then
    Result := 'Reed'
  else if Job is TODDowntimeJob then
    Result := TODDowntimeJob(Job).Descr;
end;

procedure TMainForm.DoJobAdd(Schedule: TODJobSchedule);
var
  sWarpDescrs: TStrings;
  ix, iEnds: Integer;
  aJob: TODJob;
begin
  iEnds := 0;
  if Schedule.JobCount > 0 then
  begin
    //get warps types allowed on reed used
    for ix := Schedule.JobCount-1 downto 0 do    //get current reed -
      if Schedule.Jobs[ix] is TODReedJob then
      begin
        iEnds := TODReedJob(Schedule.Jobs[ix]).TotalEnds;   //get the reed ends
        Break;
      end;
    //get warp descrs allowed on this loom type
    sWarpDescrs := TStrings(Allowables.Objects[Schedule.Tag]);
  end
  else sWarpDescrs := nil;
  with JobForm do
  begin
    Caption := 'Add Job To ' + Schedule.Header;
    EditJob := nil;
    TypeCombo.Items.Clear;
    TypeCombo.Items.Add('Reed');
    if sWarpDescrs <> nil then
      for ix := 0 to sWarpDescrs.Count-1 do
        //include warp types that go on this loom can go on this reed
        if TWarpInfo(WarpTypes.Objects[WarpTypes.IndexOf(
            GetWarpType(sWarpDescrs[ix]))]).TotalEnds = iEnds then
          TypeCombo.Items.AddObject(sWarpDescrs[ix], sWarpDescrs.Objects[ix]);
    for ix := 0 to Downtimes.Count-1 do    //add downtime items
      TypeCombo.Items.Add(Downtimes[ix]);
    TypeCombo.Enabled := True;
    LengthEdit.Text := '2440';
    EndsCombo.Enabled := True;
    IsFirstJob := Schedule.JobCount = 0;
    if IsFirstJob then     //start today by default
      Calendar.StartDate := Date
    else       //if prev jobs then start on finish of last
      Calendar.StartDate := Schedule.Jobs[Schedule.JobCount-1].FinishDate;
  {}Calendar.FinishDate := Calendar.StartDate;
    Calendar.DisplayDate := Calendar.StartDate;
    LengthEdit.Visible := False;
    EndsCombo.Visible := False;
    LengthLabel.Visible := False;
    EndsLabel.Visible := False;
    if ShowModal = ID_OK then
    begin
      JobNoProc.ExecProc;            //run jobno generator
      NextJobNo := JobNoProc.ParamByName('Code').AsInteger;
      if TypeCombo.Items.Objects[TypeCombo.ItemIndex] is TStrings then
      begin
        aJob := TODWeaveJob.Create(Self);
        with TODWeaveJob(aJob) do
        begin
          JobNo := NextJobNo;
          WarpType := GetWarpType(TypeCombo.Items[TypeCombo.ItemIndex]);
          WarpColor := GetWarpColor(TypeCombo.Items[TypeCombo.ItemIndex]);
          WarpLength := StrToInt(LengthEdit.Text);
          Tag := iEnds;  //store warp total ends
        end;
      end
      else if TypeCombo.Items[TypeCombo.ItemIndex] = 'Reed' then
      begin
        aJob := TODReedJob.Create(Self);
        with TODReedJob(aJob) do
        begin
          JobNo := NextJobNo;
          TotalEnds := StrToInt(EndsCombo.Items[EndsCombo.ItemIndex]);
  {}      DentsPerCm := 6.5;
          Tag := TotalEnds;
        end;
      end
      else      //a downtime job
      begin
        aJob := TODDowntimeJob.Create(Self);
        aJob.JobNo := NextJobNo;
        TODDowntimeJob(aJob).Descr := TypeCombo.Items[TypeCombo.ItemIndex];
      end;
      aJob.StartDate := Calendar.StartDate;
      aJob.FinishDate := Calendar.FinishDate;
      Schedule.AddJob(aJob);
{     if not (aJob is TODWeaveJob) then
        with aJob.MenuCaptions do
        begin
          AddItem := '';
          ClearItems := '';
        end;}
      UpdateMenuCaptions(aJob);
      if tabFirstUserUSERNAME.AsString=gUserName then //added DL031013
        SaveButton.Enabled := True;
      ClearButton.Enabled := True;
      PrintButton.Enabled := True;
    end;
  end;
end;

procedure TMainForm.DoJobEdit(Schedule: TODJobSchedule; Job: TODJob);
{var
  iLength: Integer;}
begin
  with JobForm do
  begin
    Caption := 'Edit ' + GetJobDescr(Job) + ' On ' + Schedule.Header;
    EditJob := Job;
    with TypeCombo do
    begin
      Enabled := False;
      Items.Clear;
      Items.Add(GetJobDescr(Job));
      ItemIndex := 0;
    end;
    with LengthEdit do
    begin
      Visible := Job is TODWeaveJob;
      LengthLabel.Visible := Visible;
      if Visible then
        Text := FloatToStr(TODWeaveJob(Job).WarpLength);
    end;
    with EndsCombo do
    begin
      Visible := Job is TODReedJob;
      EndsLabel.Visible := Visible;
      if Visible then
        ItemIndex := Items.IndexOf(IntToStr(TODReedJob(Job).TotalEnds));
      Enabled := Job = Schedule[Schedule.JobCount-1];  //can't change if warps
    end;
    IsFirstJob := Schedule[0] = Job; //only editable if first job
    Calendar.SingleDate := Job is TODReedJob;
    Calendar.StartDate := Job.StartDate;
    Calendar.FinishDate := Job.FinishDate;
    Calendar.DisplayDate := Job.StartDate;
    if ShowModal = ID_OK then
      if Job is TODWeaveJob then          //apply any length change
        with TODWeaveJob(Job) do
        begin
//        iLength := WarpLength;
          WarpLength := StrToInt(LengthEdit.Text);
          CalcRemCapacity(Job);
{         try               now done by JobForm
            CheckRemCapacity(Job, FabricStructs[0], 0);
          except
            WarpLength := iLength;
            CalcRemCapacity(Job);
          end;}
        end
      else if Job is TODReedJob then
        with TODReedJob(Job) do
        begin
          TotalEnds := StrToInt(EndsCombo.Items[EndsCombo.ItemIndex]);
//        DentsPerCm :=
          Tag := TotalEnds;
        end
{     else
        TODDowntimeJob(Job).Descr := TypeCombo.Items[TypeCombo.ItemIndex]};
      if IsFirstJob then       //apply any start date change -
      begin
        Job.FinishDate := Job.FinishDate + (Calendar.StartDate - Job.StartDate);
        Job.StartDate := Calendar.StartDate;
        StartDates[StartDates.IndexOfObject(Schedule)] :=
          DateToStr(Calendar.StartDate);
      end;
{}    Job.FinishDate := Calendar.FinishDate;
      CalcRemCapacity(Job);
      UpdateDates(Schedule);
      UpdateFooter(Schedule);
      Changed := True;
    end;
end;

procedure TMainForm.DoItemAdd(Schedule: TODJobSchedule; Job: TODJob);
var
  sWarps: TStrings;
  st: string;
  ix: Integer;
begin
  with ItemForm do
  begin
    Caption := 'Add To ' + GetJobDescr(Job) + ' On ' + Job.Schedule.Header;
    ItemJob := Job;
    CurPieces := 0;
    //get fabrics allowed on this job on this loom type -
    sWarps := TStrings(Allowables.Objects[Schedule.Tag]);
    ix := sWarps.IndexOf(TODWeaveJob(Job).Descr);
    if ix = -1 then
      raise Exception.Create('Unknown warp: ' + TODWeaveJob(Job).Descr)
    else
      TypeCombo.Items.Assign(TStrings(sWarps.Objects[ix]));
    TypeCombo.Enabled := True;
    PiecesEdit.Text := '1';
    if ShowModal = ID_OK then
    begin
      st := TypeCombo.Items[TypeCombo.ItemIndex];
      CheckRemCapacity(Job, GetFabricStruct(st), StrToFloat(PiecesEdit.Text)); 
      TODWeaveJob(Job).AddItemFrom(NextItemNo, GetFabricStruct(st),
        GetFabricColor(st), GetWeftColor(st), StrToFloat(PiecesEdit.Text));
      Inc(NextItemNo);
      Changed := True;
    end;
  end;
end;

procedure TMainForm.DoItemEdit(Schedule: TODJobSchedule;
  Job: TODJob; Item: TODJobItem);
begin
  with ItemForm do
  begin
    Caption := 'Edit ' + Item.Caption + ' In ' + GetJobDescr(Job);
    ItemJob := Job;
    CurPieces := TODWeaveJobItem(Item).WeftPieces;
    //DL051219 Position a sequence where every up increases the position by 1
    //  even if the actual increase is only .5  Setting Position to 20 allows for
    //  downarrow to always work.
    PiecesUpDown.Position:=20; //added DL051219 - to allow for the downarrow to work
    with TypeCombo do
    begin
      Items.Clear;
      Items.Add(TODWeaveJobItem(Item).Descr);
      ItemIndex := 0;
      Enabled := False;
    end;
    PiecesEdit.Text := FloatToStr(TODWeaveJobItem(Item).WeftPieces);
    //PiecesUpDown.Position := TODWeaveJobItem(Item).WeftPieces;
    if ShowModal = ID_OK then
      with TODWeaveJobItem(Item) do
      begin
{       CheckRemCapacity(Job, FabricStruct,
          StrToInt(PiecesEdit.Text) - WeftPieces); now done by ItemForm}
        WeftPieces := StrToFloat(PiecesEdit.Text);
        CalcRemCapacity(Job);
        UpdateDates(Schedule);
        Changed := True;
      end;
  end;
end;

procedure TMainForm.JobDragOver(Schedule: TODJobSchedule;
  Job: TODJob; Index: Integer; var Accept: Boolean);

  function IsCorrectReed(ASchedule: TODJobSchedule; AJob: TODJob;
    AIndex: Integer): Boolean;
  var
    ix: Integer;
  begin
    Result := False;
    if AIndex = -1 then          //dragging over schedule
      AIndex := ASchedule.JobCount   //make as over last job in schedule
    else if (ASchedule.JobCount = 0) or
      ((ASchedule[AIndex] is TODReedJob) and
       (TODReedJob(ASchedule[AIndex]).TotalEnds <> AJob.Tag)) then
      Exit;
    for ix := AIndex-1 downto 0 do
      if ASchedule[ix] is TODReedJob then  //find reed it will be used on
      begin               //check if correct reed (no of ends)
        Result := AJob.Tag = TODReedJob(ASchedule[ix]).TotalEnds;
        if not Result then
          SetStatus('Wrong reed type for this warp');
//      Break;
        Exit;
      end;
    if not Result then SetStatus('Reed required');
  end;

var
  sWarps, sFabrics: TStrings;
  iItem: Integer;
begin {JobDragOver}
  if Job is TODReedJob then
  begin
    Accept := False;       //can't move a reed
    SetStatus('Cannot move a reed');
  end
  else if Job is TODDowntimeJob then
    Accept := True      //is downtime - can go anywhere
  else
  begin               //else check if warp can go on loom -
    Accept := IsCorrectReed(Schedule, Job, Index);
    if Accept and (Job.Schedule <> Schedule) then  //a different schedule
    begin
      //get available warps for loom type
      sWarps := TStrings(Allowables.Objects[Schedule.Tag]);
      Accept := sWarps.IndexOf(TODWeaveJob(Job).Descr) > -1;
      if Accept and (Job.ItemCount > 0) then
      begin         //get fabrics that can go on this warp on this loom
        sFabrics := TStrings(sWarps.Objects[
          sWarps.IndexOf(TODWeaveJob(Job).Descr)]);
        for iItem := 0 to Job.ItemCount-1 do
        begin        //check all its fabrics are in list for this loom -
          Accept := sFabrics.IndexOf(
            TODWeaveJob(Job).Items[iItem].Descr) > -1;
          if not Accept then
          begin
            SetStatus('Has fabric that cannot go on this loom type');
            Exit; //contains a fabric that can't go on the loom
          end;
        end;
      end
      else SetStatus('Cannot go on this loom type');
    end;
  end;
  if Accept then Status.Panels[0].Text := ''; //was .SimpleText DL050900
//IsOverReed := (Index > 0) and (Schedule[Index].Color = ReedColour);
end;

procedure TMainForm.ItemDragOver(Schedule: TODJobSchedule;
  Job: TODJob; Item: TODJobItem; Index: Integer; var Accept: Boolean);
var
  sWarps, sFabrics: TStrings;
begin
  if Job = nil then       //dragging over schedule
  begin
    Accept := False;
    SetStatus('');
    Exit;
  end
  else if not (Job is TODWeaveJob) then
  begin
    Accept := False;           //can't go on reed or downtime
    SetStatus('Can only go on a weaving job');
  end
  else if Item.Job = Job then      //moving in same job
    Accept := True
  else
  begin                  //check if can be moved to job -
    sWarps := TStrings(Allowables.Objects[Schedule.Tag]);  // eg Tag 0 to 5
    sFabrics := TStrings(sWarps.Objects[
      sWarps.IndexOf(TODWeaveJob(Job).Descr)]);    // eg Descr A-WHT
    Accept := sFabrics.IndexOf(TODWeaveJobItem(Item).Descr) > -1; //if in list  eg Descr H100 WHT
    if not Accept then
      SetStatus('Cannot go on this loom/warp type')
    else
      try
        CheckRemCapacity(Job, TODWeaveJobItem(Item).FabricStruct,
          TODWeaveJobItem(Item).WeftPieces);
      except
        on Exception do
        begin
          Accept := False;
          SetStatus('Not enough capacity left');
        end;
      end;
  end;
  if Accept then SetStatus('');
end;

procedure TMainForm.JobDragDrop(Schedule: TODJobSchedule; Job: TODJob);
var
  ix: Integer;
begin
{ if IsOverReed then
  begin
    ix := Schedule.IndexOfJob(Job);
    Schedule.MoveJob(ix, ix+1);
  end;}
  if not UpdateLocked then
    for ix := 0 to ScheduleBox.ScheduleCount-1 do
    begin
      UpdateDates(ScheduleBox[ix]);
      UpdateFooter(ScheduleBox[ix]);
    end;
  Changed := True;
end;

procedure TMainForm.AfterJobAdd(Schedule: TODJobSchedule; Job: TODJob);
begin
  UpdateMenuCaptions(Job);
  if Schedule.JobCount = 1 then      //first & only job so keep its start date
    StartDates[StartDates.IndexOfObject(Schedule)] :=
      DateToStr(Job.StartDate)
  else UpdateDates(Schedule);
  UpdateFooter(Schedule);
  CalcRemCapacity(Job);
  UpdateDates(Schedule);
  Changed := True;
  Schedule.Resize;
end;

procedure TMainForm.AfterJobEdit(Schedule: TODJobSchedule; Job: TODJob);
begin
  AfterJobAdd(Schedule, Job);
end;

procedure TMainForm.BeforeJobRemove(Schedule: TODJobSchedule; Job: TODJob);
begin
  WasFirstJob := (Schedule.JobCount > 1) and (Job = Schedule[1]); //allow for reed
end;

procedure TMainForm.AfterJobRemove(Schedule: TODJobSchedule);
var
  aDate: TDateTime;
begin
  if Schedule.JobCount > 0 then
  begin
    if WasFirstJob and (Schedule[0] is TODReedJob) and
       (Schedule.JobCount > 1) and
       (MessageDlg('Adjust the start date of the reed on ' +
         Schedule.Header + ' to that of the new first job on it?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      Schedule[0].StartDate := Schedule[1].StartDate;
      Schedule[0].FinishDate := Schedule[1].StartDate;
    end;
    aDate := Schedule[0].StartDate;
  end
  else aDate := 0;
  StartDates[StartDates.IndexOfObject(Schedule)] := DateToStr(aDate);
//  UpdateFooter(Schedule);
  UpdateDates(Schedule);
  Changed := True;
end;

procedure TMainForm.BeforeJobFree(Schedule: TODJobSchedule; Job: TODJob);
var
  iJob: Integer;
begin
  if not UpdateLocked then
  begin
    if Job.Color = clReed then
      for iJob := Schedule.IndexOfJob(Job)+1 to Schedule.JobCount-1 do
        if Schedule[iJob] is TODReedJob then
          Break   //another reed before any warps
        else if Schedule[iJob] is TODWeaveJob then
        begin
          MessageDlg('First delete all the warp jobs on this reed ' +
            'before you can delete it.', mtError, [mbOK], 0);
          Abort;
        end;
    if MessageDlg('Delete this job?', mtConfirmation, [mbYes, mbNo], 0)
      <> mrYes then Abort;
  end;
  if Job = CurrentJob then
  begin
    FilterCheck.Checked := False;
    FilterCheckClick(nil);
    FilterCheck.Enabled := False;
    CurrentJob := nil;
  end;
  if (CurrentItem <> nil) and (Job = CurrentItem.Job) then
    CurrentItem := nil;
end;

procedure TMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.AfterJobFree(Schedule: TODJobSchedule);
begin
  Changed := True;
  Schedule.Resize;
end;

procedure TMainForm.AfterItemAdd(Schedule: TODJobSchedule;
  Job: TODJob; Item: TODJobItem);
begin
  CalcRemCapacity(Job);
  UpdateDates(Schedule);
  Changed := True;
  with TODWeaveJobItem(Item) do
    SetSelectedItems(FabricStruct + FabricColor);
end;

procedure TMainForm.AfterItemEdit(Schedule: TODJobSchedule;
  Job: TODJob; Item: TODJobItem);
begin
  AfterItemAdd(Schedule, Job, Item);
{  CalcRemCapacity(Job);
  UpdateDates(Schedule);
  Changed := True;
  with TODWeaveJobItem(Item) do   //in case num pieces changed
    SetSelectedItems(FabricStruct + FabricColor);}
end;

procedure TMainForm.AfterItemFree(Schedule: TODJobSchedule;
  Job: TODJob);
begin
{  CalcRemCapacity(Job);    //AfterItemRemove triggered aswell
  UpdateDates(Schedule);
  Changed := True; }
end;

procedure TMainForm.AfterItemRemove(Schedule: TODJobSchedule;
  Job: TODJob);
begin
  CalcRemCapacity(Job);
  UpdateDates(Schedule);
  Changed := True;
end;

procedure TMainForm.ItemDragDrop(Schedule: TODJobSchedule;
  Job: TODJob; Item: TODJobItem);
begin
  Changed := True;
end;

procedure TMainForm.ReqmtsButtonClick(Sender: TObject);
begin
  if Changed then
    MessageDlg('First save your changes', mtError, [mbOK], 0)
  else
    with ReqmtsForm do
    begin
      Caption := 'Yarn Requirements - ' + ScenarioDESCR.AsString;
      WarpReqDateQuery.Params[0].AsInteger := ScenarioSCENARIONO.AsInteger;
      WarpReqJobQuery.Params[0].AsInteger := ScenarioSCENARIONO.AsInteger;
      WeftReqDateQuery.Params[0].AsInteger := ScenarioSCENARIONO.AsInteger;
      WeftReqJobQuery.Params[0].AsInteger := ScenarioSCENARIONO.AsInteger;
      ShowModal;
    end;
end;

procedure TMainForm.OutputButtonClick(Sender: TObject);
begin
  if Changed then
    MessageDlg('First save your changes', mtError, [mbOK], 0)
  else
    with OutputForm do
    begin
      Caption := 'Greige Output - ' + ScenarioDESCR.AsString;
      OutDateQuery.Params[0].AsInteger := ScenarioSCENARIONO.AsInteger;
      OutJobQuery.Params[0].AsInteger := ScenarioSCENARIONO.AsInteger;
      ShowModal;
    end;
end;

procedure TMainForm.AboutButtonClick(Sender: TObject);
begin
  ODAboutForm.ShowModal;
end;

procedure TMainForm.DoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Status.Panels[0].Text := ''; //was .SimpleText DL050900
end;

procedure TMainForm.SetStatus(const Msg: string);
begin
  MsgTimer.Enabled := False;
  Status.Panels[0].Text := Msg; //was .SimpleText DL050900
  MsgTimer.Enabled := Msg <> '';
end;

procedure TMainForm.MsgTimerTimer(Sender: TObject);
begin
  MsgTimer.Enabled := False;
  Status.Panels[0].Text := ''; //was .SimpleText DL050900
end;

procedure TMainForm.CalcRemCapacity(Job: TODJob);
var
  {CurLen, {CurWgt,} iItem: Integer;
  CurLen:double;
begin
  if Job is TODWeaveJob then
    with TODWeaveJob(Job) do
    begin
      CurLen := 0;
//    CurWgt := 0;
      for iItem := 0 to ItemCount-1 do
        with Items[iItem], TFabricInfo(
          FabricStructs.Objects[FabricStructs.IndexOf(FabricStruct)]) do
        begin
          CurLen:=CurLen+(PieceLength * WeftPieces); //DL
          //Inc(CurLen, PieceLength * WeftPieces);
//        Inc(CurWgt, Round(WeftPieces * WarpPceWeight));
        end;
      with TWarpInfo(WarpTypes.Objects[WarpTypes.IndexOf(WarpType)]) do
      begin
        LengthRem := Round((WarpLength * LossFactor) - CurLen);
//      WeightRem := Round((WarpLength / StdLength * StdWeight * LossFactor) - CurWgt);
      end;
    end;
end;

procedure TMainForm.CheckRemCapacity(Job: TODJob;
  const FabricStruct: string; Pieces: double {Integer});
var
  //rLength{, rWeight}: Integer;
  rLength:double;
begin
  if Job is TODWeaveJob then
  begin
    with TFabricInfo(FabricStructs.Objects[
      FabricStructs.IndexOf(FabricStruct)]) do
    begin
      rLength := TODWeaveJob(Job).LengthRem - (PieceLength * Pieces);
//    rWeight := TODWeaveJob(Job).WeightRem - Round(Pieces * WarpPceWeight);
    end;
  //Result := (rLength >= 0) and (rWeight >= 0);
    if rLength < 0 then
      raise Exception.Create('Total piece lengths over warp capacity by ' +
        FloatToStr(Abs(rLength)) + 'm')
{   else if rWeight < 0 then
      raise Exception.Create('Weight over capacity by ' +
        IntToStr(Abs(rWeight)) + 'kg')};
  end;
end;

procedure TMainForm.CalcDuration(Job: TODJob);
var
  ix: Integer;
  iHours: Single;
  iDate: TDateTime;
  aLoomHours: TStrings;
begin
  if UpdateLocked then Exit;
  if Job is TODWeaveJob then
    with TODWeaveJob(Job) do   {WorkHours & Params are on MaintForm}
    begin
      //calc time required to weave current fabric items
      iHours := 0;
      for ix := 0 to ItemCount-1 do
        iHours := iHours + (TFabricInfo(FabricStructs.Objects[
          FabricStructs.IndexOf(Items[ix].FabricStruct)]).HrsPerPiece
            * Items[ix].WeftPieces);
      WeaveHours := Round(iHours);
{      MaintForm.WorkHours.Open;
      ix := MaintForm.WorkHours.FieldByName('LOOM' + IntToStr(
        ScheduleBox.IndexOfSchedule(Job.Schedule)+1) + 'HRS').Index;}
      //factor in scheduled work hours for the loom to get finish date
      iDate := StartDate;
      iHours := 0{-4.5};
      while iHours < WeaveHours + MaintForm.ParamsREELCHANGEHRS.AsFloat do
      begin
{        if MaintForm.WorkHours.FindKey([iDate]) then
          iHours := iHours + MaintForm.WorkHours.Fields[ix].AsFloat
        else  //else if not in work sched, use default hours for day
          iHours := iHours + MaintForm.GetDefaultWorkHours(DayOfWeek(iDate));}
        aLoomHours := TStringList(            //get work hours for loom
          WorkHours.Objects[ScheduleBox.IndexOfSchedule(Job.Schedule)]);
        ix := aLoomHours.IndexOfObject(Pointer(Trunc(iDate)));  //date stored in objects
        if ix > -1 then  //if work hours for date in work schedule, use that
          iHours := iHours + StrToFloat(aLoomHours[ix])
        else   //else use the default work hours for that day
          iHours := iHours + StrToFloat(DefaultHours[DayOfWeek(iDate)-1]);  //hours stored in string
        iDate := iDate + 1;
      end;
{      if iHours + 4.5 < WeaveHours then
        iDate := iDate + 1;}
      FinishDate := iDate - 1;
//      WorkHours.Close;
    end;
end;

procedure TMainForm.UpdateDates(Schedule: TODJobSchedule);
var
  aNextDate: TDateTime;
//  aDuration: Double;
  iJob: Integer;
begin
  if UpdateLocked or (Schedule.JobCount = 0) then Exit;
  aNextDate := StrToDate(StartDates[StartDates.IndexOfObject(Schedule)]);
  with Schedule do
    if JobCount > 1 then
    begin
      for iJob := 0 to JobCount-1 do
      begin
        if aNextDate <> 0 then
          Jobs[iJob].StartDate := aNextDate;
        CalcDuration(Jobs[iJob]);
        aNextDate := Jobs[iJob].FinishDate;
      end;
{        with Jobs[iJob] do
        begin
          aDuration := FinishDate - StartDate;
          if aNextDate <> 0 then
            StartDate := aNextDate;
          FinishDate := StartDate + aDuration;
          aNextDate := FinishDate;
        end;}
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

procedure TMainForm.UpdateMenuCaptions(Job: TODJob);
begin
  with Job.MenuCaptions do
    if not (Job is TODWeaveJob) then  //defaults to warps
    begin
      AddItem := '';
      ClearItems := '';
      if Job is TODReedJob then
      begin
        Edit := '&Edit Reed...';
        Remove := '&Remove Reed';
      end else
      begin
        Edit := '&Edit Downtime...';
        Remove := '&Remove Downtime';
      end;
    end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Changed then
    CanClose := MessageDlg('Close without saving your changes?',
      mtWarning, [mbYes, mbNo], 0) = mrYes
  else
    CanClose := True;
end;

procedure TMainForm.MaintButtonClick(Sender: TObject);
var
  ix: Integer;
begin
  MaintForm.ShowModal;
  if MaintForm.WorkHoursChanged then
  begin
    SetStatus('Please wait: Fetching Working Hours');
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
    SetStatus('Please wait: Fetching Working Hours');
    for ix := 0 to ScheduleBox.ScheduleCount-1 do
    begin
      UpdateDates(ScheduleBox[ix]);
      UpdateFooter(ScheduleBox[ix]);
    end;
  end;
end;

procedure TMainForm.EditMakeDateDblClick(Sender: TObject);
begin
  VBMakePanel.Visible := not VBMakePanel.Visible;
end;

procedure TMainForm.PriorityComboChange(Sender: TObject);
begin
  with VBQuerySource do
    case PriorityCombo.ItemIndex of
      0: DataSet := VBOrdQuery;
      1: DataSet := VBMinQuery;
      2: DataSet := VBRemQuery;
      3: DataSet := VBAllQuery;
    end;
  VBQueryAfterScroll(nil);
  FindVBType;
  if ApplyButton.Down and not Searching then
    ApplyButtonClick(nil);
end;

procedure TMainForm.ScheduleRadioClick(Sender: TObject);
begin
  if CurrentItem <> nil then
    ItemClick(CurrentItem.Job.Schedule, CurrentItem.Job, CurrentItem);
//  SetSelectedItems;
  with VBQuerySource.DataSet do
    SetSelectedItems(FieldByName('VBSTRU').AsString +
      FieldByName('VBCOL').AsString);
//  MakeGrid.Color := clBtnFace;
end;

procedure TMainForm.OrdersRadioClick(Sender: TObject);
begin
//  MakeGrid.Color := clWindow;
  VBQueryAfterScroll(nil);
//  SetSelectedItems;
  if not Searching then
    with VBQuerySource.DataSet do
      SetSelectedItems(FieldByName('VBSTRU').AsString +
        FieldByName('VBCOL').AsString);
end;

procedure TMainForm.VBQueryAfterScroll(DataSet: TDataSet);
var
  OrdHeld,OrdNotHeld:double; //added DL050900
begin
  if Searching then Exit;
  if OrdersRadio.Checked then
  begin
    with AllFinsQuery do
    begin
      DisableControls;
      Close;
      ParamByName('VBStru').AsString :=
        VBQuerySource.DataSet.FieldByName('VBStru').AsString;
      ParamByName('VBCol').AsString :=
        VBQuerySource.DataSet.FieldByName('VBCol').AsString;
      Open;
      EnableControls;
    end;
//    SetSelectedItems;
    with VBQuerySource.DataSet do
      SetSelectedItems(FieldByName('VBSTRU').AsString +
        FieldByName('VBCOL').AsString);
  end;
  with MakeGrid, VBQuerySource.DataSet do
    if (AllFinsQueryVBStru.AsString = FieldByName('VBStru').AsString) and
       (AllFinsQueryVBCol.AsString = FieldByName('VBCol').AsString) then
      Options := Options + [dgRowSelect, dgAlwaysShowSelection]
    else
      Options := Options - [dgRowSelect, dgAlwaysShowSelection];
  if FabricRadio.Checked then
  begin
    ApplyButton.Down := False;
    ScheduleRadio.Enabled := True;
//    ScheduleRadioClick(nil);
  end;
  //  AllFinsQueryBeforeScroll(nil);
  // added DL050900
  qryGetHoldOrders.Close;
  qryGetHoldOrders.ParamByName('VBStru').AsString:=
    VBQuerySource.DataSet.FieldByName('VBStru').AsString;
  qryGetHoldOrders.ParamByName('VBCol').AsString:=
    VBQuerySource.DataSet.FieldByName('VBCol').AsString;
  qryGetHoldOrders.ParamByName('OrderHeld').AsString:='Y';
  qryGetHoldOrders.Open;
  OrdHeld:=qryGetHoldOrdersHOLDPCS.AsFloat;
  qryGetHoldOrders.Close;
  qryGetHoldOrders.ParamByName('VBStru').AsString:=
    VBQuerySource.DataSet.FieldByName('VBStru').AsString;
  qryGetHoldOrders.ParamByName('VBCol').AsString:=
    VBQuerySource.DataSet.FieldByName('VBCol').AsString;
  qryGetHoldOrders.ParamByName('OrderHeld').AsString:='N';
  qryGetHoldOrders.Open;
  OrdNotHeld:=qryGetHoldOrdersHOLDPCS.AsFloat;
  Status.Panels[1].Text:='Orders:'+FormatFloat('0.0',OrdNotHeld)+
    '; Held:'+FormatFloat('0.0',OrdHeld);
end;

procedure TMainForm.JobClick(Schedule: TODJobSchedule; Job: TODJob);
begin
  if Job is TODWeaveJob then
  begin
    if CurrentJob <> nil then
      CurrentJob.Font.Color := clWhite;
    CurrentJob := TODWeaveJob(Job);
    CurrentJob.Font.Color := clYellow;
    FilterCheck.Enabled := True;
    if FilterCheck.Enabled and FilterCheck.Checked then
      FilterCheckClick(nil);
    if (Job.ItemCount > 0) and
       ((CurrentItem = nil) or (CurrentItem.Job <> Job)) then
      ItemClick(Schedule, Job, Job.Items[0]);
  end;
end;

procedure TMainForm.ItemClick(Schedule: TODJobSchedule; Job: TODJob;
  Item: TODJobItem);
begin
  if CurrentItem <> nil then
    CurrentItem.Color := clWindow;
  CurrentItem := Item;
  CurrentItem.Color := clYellow;
  if ScheduleRadio.Checked then
  begin
    with AllFinsQuery, Item as TODWeaveJobItem do
    begin
      DisableControls;
      Close;
      ParamByName('VBStru').AsString := FabricStruct;
      ParamByName('VBCol').AsString := FabricColor;
      Open;
      EnableControls;
    end;
  end;
  FindVBType;
  with VBQuerySource.DataSet do
    SetSelectedItems(FieldByName('VBSTRU').AsString +
      FieldByName('VBCOL').AsString);
    JobClick(Schedule, Job);
end;

procedure TMainForm.SetSelectedItems(const Fabric: string);
var
  iShed, iJob, iItem: Integer;
  TotPcs:double;
begin
  TotPcs := 0;
  for iShed := 0 to ScheduleBox.ScheduleCount-1 do
    for iJob := 0 to ScheduleBox[iShed].JobCount-1 do
      for iItem := 0 to ScheduleBox[iShed][iJob].ItemCount-1 do
        with ScheduleBox[iShed][iJob][iItem] as TODWeaveJobItem do
          if OrdersRadio.Checked and
             (FabricStruct + FabricColor = Fabric) then
{            (FabricStruct = VBQuerySource.DataSet.FieldByName('VBSTRU').AsString) and
             (FabricColor = VBQuerySource.DataSet.FieldByName('VBCOL').AsString) then}
          begin
            Color := clHighlight;
            if ScheduleBox[iShed][iJob][iItem] = CurrentItem then
              Font.Color := clYellow
            else
              Font.Color := clHighlightText;
            //Inc(TotPcs, WeftPieces); //DL
            TotPcs:=TotPcs+WeftPieces;
          end
          else
          begin
            if ScheduleBox[iShed][iJob][iItem] = CurrentItem then
              Color := clYellow
            else
              Color := clWindow;
            Font.Color := clWindowText;
          end;
  if OrdersRadio.Checked then
    TotPcsText.Caption := FloatToStr(TotPcs)
  else
    TotPcsText.Caption := '';
end;

procedure TMainForm.FindVBType;
var
  bmk: TBookmark;
begin
  with VBQuerySource.DataSet do
  begin
    bmk := GetBookmark;
    Searching := True;
    DisableControls;
    VBMakeQuery.DisableControls;
    try
      First;
      while not EOF do
      begin
        if (VBMakeQueryVBStru.AsString = FieldByName('VBStru').AsString) and
           (VBMakeQueryVBCol.AsString = FieldByName('VBCol').AsString) then
           Break;
        Next;
      end;
      with MakeGrid do
        if (VBMakeQueryVBStru.AsString = FieldByName('VBStru').AsString) and
           (VBMakeQueryVBCol.AsString = FieldByName('VBCol').AsString) then
          Options := Options + [dgRowSelect, dgAlwaysShowSelection]
        else
        begin
          Options := Options - [dgRowSelect, dgAlwaysShowSelection];
          GotoBookmark(bmk);
        end;
    finally
      EnableControls;
      VBMakeQuery.EnableControls;
      FreeBookmark(bmk);
      Searching := False;
    end;
  end;
end;

procedure TMainForm.AllFinsQueryAfterScroll(DataSet: TDataSet);
begin
  TypeLabel.Caption := AllFinsQueryVBStru.AsString +
    AllFinsQueryVBCol.AsString + AllFinsQueryVBFin.AsString;
end;

procedure TMainForm.FilterCheckClick(Sender: TObject);
  procedure SetFilter(Query: TQuery);
  begin
    Query.Close;
    if FilterCheck.Checked then
    begin
      Query.Filtered := False;
      if ApplyButton.Down and WarpRadio.Checked then
        Query.Filter := 'warptype = ''' + Copy(FindEdit.Text, 1, 1) +
          ''' and warpcol = ''' +  Copy(FindEdit.Text, 2, 3) + ''''
      else if CurrentJob <> nil then
        Query.Filter := 'warptype = ''' + CurrentJob.WarpType +
          ''' and warpcol = ''' + CurrentJob.WarpColor + ''''
      else
        raise Exception.Create('No job to filter on');
      Query.Filtered := True;
    end
    else Query.Filtered := False;
    Query.Open;
  end;
begin
  VBQuerySource.DataSet.DisableControls;
  try
    SetFilter(VBOrdQuery);
    SetFilter(VBMinQuery);
    SetFilter(VBRemQuery);
    SetFilter(VBAllQuery);
  finally
    VBQuerySource.DataSet.EnableControls;
  end;
  if not Searching then
    ApplyButton.Down := False;
end;

procedure TMainForm.BeforeItemFree(Schedule: TODJobSchedule;
  Job: TODJob; Item: TODJobItem);
begin
  if Item = CurrentItem then
    CurrentItem := nil;
end;

procedure TMainForm.FindEditChange(Sender: TObject);
begin
  ApplyButton.Down := False;
  ApplyButton.Enabled := Length(FindEdit.Text) = 6; //was in [3..4]; DL090901;
  ApplyButtonClick(nil);
//  FilterCheck.Enabled := not ApplyButton.Down;
end;

procedure TMainForm.ApplyButtonClick(Sender: TObject);

  function FindFabric: Boolean;
  var
    bm: TBookmark;
  begin
    with VBQuerySource.DataSet do
    begin
      bm := GetBookmark;
      AfterScroll := nil;
      DisableControls;
      try
        First;
        while not EOF and (FieldByName('VBTYPE').AsString <> FindEdit.Text) do
          Next;
        Result := FieldByName('VBTYPE').AsString = FindEdit.Text;
        if Result then
          MakeGrid.Options := MakeGrid.Options +
            [dgRowSelect, dgAlwaysShowSelection]
        else
        begin
          MakeGrid.Options := MakeGrid.Options -
            [dgRowSelect, dgAlwaysShowSelection];
          GotoBookmark(bm);
        end;
      finally
        EnableControls;
        AfterScroll := VBQueryAfterScroll;
        FreeBookmark(bm);
      end;
    end;
  end;

  procedure FindWarps;
  var
    iShed, iJob: Integer;
  begin
    for iShed := 0 to ScheduleBox.ScheduleCount-1 do
      for iJob := 0 to ScheduleBox[iShed].JobCount-1 do
        if ScheduleBox[iShed][iJob] is TODWeaveJob then
          with TODWeaveJob(ScheduleBox[iShed][iJob]) do
            if WarpType + WarpColor = FindEdit.Text then
              Color := clHighlight;
  end;

  procedure ClearWarps;
  var
    iShed, iJob: Integer;
  begin
    for iShed := 0 to ScheduleBox.ScheduleCount-1 do
      for iJob := 0 to ScheduleBox[iShed].JobCount-1 do
        if ScheduleBox[iShed][iJob].Color = clHighlight then
          ScheduleBox[iShed][iJob].Color := clBlue;
  end;

begin {ApplyButtonClick}
  Searching := True;
  ClearWarps;
  if ApplyButton.Down then
  begin
    FindEdit.OnChange := nil;
    FindEdit.Text := UpperCase(FindEdit.Text);
    FindEdit.OnChange := FindEditChange;
//    PriorityCombo.ItemIndex := 3; //no priority - show all
    if WarpRadio.Checked then
    begin
      FilterCheck.Checked := True;
      FilterCheckClick(nil);
      FindWarps;
    end
    else {FabricRadio.Checked}
    begin
{      FilterCheck.Checked := False;
      FilterCheckClick(nil);}
      //modified to show zero orders and stock DL170800
      VBQuerySource.DataSet := VBOrdQuery;
      PriorityCombo.ItemIndex := 0;
      if not FindFabric then
      begin
        VBQuerySource.DataSet := VBMinQuery;
        PriorityCombo.ItemIndex := 1;
        if not FindFabric then
        begin
          VBQuerySource.DataSet := VBRemQuery;
          PriorityCombo.ItemIndex := 2;
          if not FindFabric then
          begin
            VBQuerySource.DataSet := VBAllQuery;
            PriorityCombo.ItemIndex := 3;
          end;
        end;
      end;
        Searching := False;
        VBQueryAfterScroll(nil);
//      FindVBType;
      SetSelectedItems(FindEdit.Text);
    end;
  end
  else
  begin
    FilterCheck.Enabled := CurrentJob <> nil;
    if not FilterCheck.Enabled then
      FilterCheck.Checked := False;
    FilterCheckClick(nil);
  end;
  OrdersRadio.Checked := True;
  OrdersRadioClick(nil);
  ScheduleRadio.Enabled := not ApplyButton.Down;
  Searching := False;
end;

procedure TMainForm.FindRadioClick(Sender: TObject);
begin
  FindEdit.Text := '';
  FindEdit.SetFocus;
end;

procedure TMainForm.FindEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['a'..'z'] then Key := UpCase(Key);
end;

procedure TMainForm.VBMakeQuerySourceDataChange(Sender: TObject;
  Field: TField);
begin
  //modified DL25102000 to use Discontinued flag in VBMake_Fin
  if VBMakeQuery.Active then
  begin
    if VBMakeQueryDISCON127.AsString='Y' then
    begin
      EditFWOrd.Font.Color:=clRed;
      Edit89Ord.Font.Color:=clRed;
      Edit127Ord.Font.Color:=clRed;
    end
    else
    begin
      EditFWOrd.Font.Color:=clBlack;
      Edit89Ord.Font.Color:=clBlack;
      Edit127Ord.Font.Color:=clBlack;
    end;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //reset the FirstUser name if equal to the current user name: added DL031013
  if tabFirstUserUSERNAME.AsString=gUserName then
  begin
    if not SchedDB.InTransaction then
      SchedDB.StartTransaction;
    tabFirstUser.Edit;
    tabFirstUserUSERNAME.AsString:='';
    tabFirstUser.Post;
    SchedDB.Commit;
  end;
  VBMakeQuery.Close; //added DL25102000
end;

procedure TMainForm.EditFWStkDblClick(Sender: TObject);
begin
  //method added DL110607
  VBPickDlgForm.ShowModalVTStockNoFin(VBMakeQueryVBSTRU.Value,VBMakeQueryVBCOL.Value,1); // 1, not 2070
  Screen.Cursor:=crDefault;
end; //EditFWStkDblClick

procedure TMainForm.Edit89StkDblClick(Sender: TObject);
begin
  //method added DL110607
  VBPickDlgForm.ShowModalVTStockNoFin(VBMakeQueryVBSTRU.Value,VBMakeQueryVBCOL.Value,23);
  Screen.Cursor:=crDefault;
end; //Edit89StkDblClick

procedure TMainForm.Edit127StkDblClick(Sender: TObject);
begin
  //method added DL110607
  VBPickDlgForm.ShowModalVTStockNoFin(VBMakeQueryVBSTRU.Value,VBMakeQueryVBCOL.Value,16);
  Screen.Cursor:=crDefault;
end; //Edit127StkDblClick

procedure TMainForm.EditFWOrdDblClick(Sender: TObject);
begin
  //method added DL110607 - modified DL110716 to automatically show Orders Outstanding
  //if MessageDlg('FW Orders: Show All (or Total By Held)?  Yes for All; No for Total By Held.',
  //    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  VBPickDlgForm.ShowModalVTOrderNoNoFin(VBMakeQueryVBSTRU.Value,VBMakeQueryVBCOL.Value,1);
  //else
  //  VBPickDlgForm.ShowModalVTOrderNoTotalsNoFin(VBMakeQueryVBSTRU.Value,VBMakeQueryVBCOL.Value,1);
  Screen.Cursor:=crDefault;
end; //EditFWOrdDblClick

procedure TMainForm.Edit89OrdDblClick(Sender: TObject);
begin
  //method added DL110607 - modified DL110716 to automatically show Orders Outstanding
  //if MessageDlg('89 Orders: Show All (or Total By Held)?  Yes for All; No for Total By Held.',
  //     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  VBPickDlgForm.ShowModalVTOrderNoNoFin(VBMakeQueryVBSTRU.Value,VBMakeQueryVBCOL.Value,23);
  //else
  //  VBPickDlgForm.ShowModalVTOrderNoTotalsNoFin(VBMakeQueryVBSTRU.Value,VBMakeQueryVBCOL.Value,23);
  Screen.Cursor:=crDefault;
end; //Edit89OrdDblClick

procedure TMainForm.Edit127OrdDblClick(Sender: TObject);
begin
  //method added DL110607 - modified DL110716 to automatically show Orders Outstanding
  //if MessageDlg('127 Orders: Show All (or Total By Held)?  Yes for All; No for Total By Held.',
  //     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  VBPickDlgForm.ShowModalVTOrderNoNoFin(VBMakeQueryVBSTRU.Value,VBMakeQueryVBCOL.Value,16);
  //else
  //  VBPickDlgForm.ShowModalVTOrderNoTotalsNoFin(VBMakeQueryVBSTRU.Value,VBMakeQueryVBCOL.Value,16);
  Screen.Cursor:=crDefault;
end; //Edit127OrdDblClick

end.
