unit weavesummary;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, Mask,
  ExtCtrls, ODDatPrn;

type
  TWeaveSummaryForm = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditWARPNO: TDBEdit;
    Label2: TLabel;
    EditWARPLENGTH: TDBEdit;
    Label4: TLabel;
    EditWARPTYPE: TDBEdit;
    Label5: TLabel;
    EditWARPCOL: TDBEdit;
    Label6: TLabel;
    EditWARPLOTNO: TDBEdit;
    Label7: TLabel;
    EditWARPLOTNO2: TDBEdit;
    Label8: TLabel;
    EditWARPSINGLEMULTIPLE: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    WarpRcptSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    Label3: TLabel;
    WarpSearchSpdBtn: TSpeedButton;
    MaxGreigeQuery: TQuery;
    MaxGreigeQueryMAX: TSmallintField;
    ActiveSource: TDataSource;
    GreigeRcptSource: TDataSource;
    FabricLotNoQuery: TQuery;
    GreigeGrid: TDBGrid;
    VBTypeSearchSpdBtn: TSpeedButton;
    LoomRefSpdBtn: TSpeedButton;
    WarpRcpt: TTable;
    WarpRcptWARPNO: TIntegerField;
    WarpRcptWARPLENGTH: TIntegerField;
    WarpRcptNOOFBREAKS: TSmallintField;
    WarpRcptWARPTYPE: TStringField;
    WarpRcptWARPCOL: TStringField;
    WarpRcptWARPLOTNO1: TIntegerField;
    WarpRcptWARPLOTNO2: TSmallintField;
    WarpRcptWARPSINGLEMULTIPLE: TStringField;
    WarpRcptDATEMANU: TDateTimeField;
    WarpRcptDATERCVD: TDateTimeField;
    WarpRcptRCVDBY: TStringField;
    ModeIndicator: TLabel;
    GreigeRcpt: TTable;
    GreigeRcptWARPNO: TIntegerField;
    GreigeRcptGREIGENO: TSmallintField;
    GreigeRcptLOOMREF: TStringField;
    GreigeRcptVBSTRU: TStringField;
    GreigeRcptVBCOL: TStringField;
    GreigeRcptGREIGEDATE: TDateTimeField;
    GreigeRcptGREIGELENGTH: TIntegerField;
    GreigeRcptFINDATE: TDateTimeField;
    GreigeRcptFINLENGTH: TIntegerField;
    GreigeRcptSTATUS: TStringField;
    GreigeRcptCOMMENT: TStringField;
    GreigeRcptWEAVEDATE: TDateTimeField;
    GreigeRcptWEAVELENGTH: TIntegerField;
    WarpRcptCOMMENT: TStringField;
    EditWarpComment: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditSumGreigeLength: TDBEdit;
    SumGreigeQuery: TQuery;
    SumGreigeQuerySource: TDataSource;
    SumGreigeQueryGREIGELENGTH: TIntegerField;
    Label13: TLabel;
    EditSumFinLength: TDBEdit;
    SumGreigeQueryFINLENGTH: TIntegerField;
    SumSlitQuery: TQuery;
    SumSlitQuerySource: TDataSource;
    EditFWGrossSLit: TDBEdit;
    EditFWNetSlit: TDBEdit;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    SumSlitQueryFWGROSSSLIT: TFloatField;
    SumSlitQueryFWNETSLIT: TFloatField;
    WarpRcptCOMPLETE: TStringField;
    EditWarpComplete: TDBComboBox;
    Label16: TLabel;
    Label17: TLabel;
    GreigeSlitQuery: TQuery;
    GreigeSlitQuerySource: TDataSource;
    EditGreigeSlitLengthGross: TDBEdit;
    GreigeSlitQueryFWGROSSSLIT: TFloatField;
    GreigeSlitQueryFWNETSLIT: TFloatField;
    EditGreigeSlitLengthNet: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    WarpRcptESTGREIGELEN: TFloatField;
    ShowEstGreigeLen: TDBEdit;
    Panel3: TPanel;
    tabFinRcptDaily: TTable;
    datFinRcptDaily: TDataSource;
    DBGrid1: TDBGrid;
    tabFinRcptDailyWARPNO: TIntegerField;
    tabFinRcptDailyGREIGENO: TSmallintField;
    tabFinRcptDailyFINNO: TSmallintField;
    tabFinRcptDailyFABRICLOTNO: TIntegerField;
    tabFinRcptDailyVBSTRU: TStringField;
    tabFinRcptDailyVBCOL: TStringField;
    tabFinRcptDailyVBFIN: TStringField;
    tabFinRcptDailyFINLENGTH: TIntegerField;
    tabFinRcptDailyFINDATE: TDateTimeField;
    tabFinRcptDailyCOMMENT: TStringField;
    DBNavigator1: TDBNavigator;
    GriegeRcptSpdBtn: TSpeedButton;
    FinishRcptSpdBtn: TSpeedButton;
    PrintSpdBtn: TSpeedButton;
    GreigeRcptDATEMOD: TDateTimeField;
    GreigeRcptUSERMOD: TStringField;
    ODDataPrinter1: TODDataPrinter;
    btnGridPrint: TButton;
    FindFastNextIncompleteSpnBtn: TSpeedButton;
    FindFastQuery: TQuery;
    FindFastQueryWARPNO: TIntegerField;
    procedure WarpSearchSpdBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GreigeRcptAfterCancel(DataSet: TDataset);
    procedure GreigeRcptAfterDelete(DataSet: TDataset);
    procedure GreigeRcptAfterPost(DataSet: TDataset);
    procedure GreigeRcptBeforeEdit(DataSet: TDataset);
    procedure GreigeRcptBeforeInsert(DataSet: TDataset);
    procedure GreigeRcptBeforeDelete(DataSet: TDataset);
    procedure GreigeRcptNewRecord(DataSet: TDataset);
    procedure GreigeGridEnter(Sender: TObject);
    procedure GreigeGridExit(Sender: TObject);
    procedure VBTypeSearchSpdBtnClick(Sender: TObject);
    procedure LoomRefSpdBtnClick(Sender: TObject);
    procedure GreigeRcptSourceStateChange(Sender: TObject);
    procedure GreigeRcptSTATUSChange(Sender: TField);
    procedure GreigeRcptDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure GreigeGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GreigeGridDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GriegeRcptSpdBtnClick(Sender: TObject);
    procedure FinishRcptSpdBtnClick(Sender: TObject);
    procedure WarpRcptSourceStateChange(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure GreigeRcptBeforePost(DataSet: TDataSet);
    procedure btnGridPrintClick(Sender: TObject);
    procedure FindFastNextIncompleteSpnBtnClick(Sender: TObject);
  private
    { private declarations }
{    WarpCol:string[3];
    WeftCol:string[3];}
  public
    { public declarations }
  end;

var
  WeaveSummaryForm: TWeaveSummaryForm;

implementation

{$R *.DFM}

uses VBMain, Dialogs, VBModal, greyrcpt, finrcpt{, PickDate};

procedure TWeaveSummaryForm.WarpSearchSpdBtnClick(Sender: TObject);
begin
  if GreigeRcpt.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    if VBPickDlgForm.ShowModalWarpRcpt = mrOk then
    begin
      WarpRcpt.SetKey;
      WarpRcpt.FieldByName('WarpNo').AsInteger:=VBPickDlgForm.WarpNo;
      WarpRcpt.GotoKey;
    end;
  end;
  Screen.Cursor:=crDefault;
end;

procedure TWeaveSummaryForm.CloseBitBtnClick(Sender: TObject);
begin
  if GreigeRcpt.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Greige Receipts before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TWeaveSummaryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if GreigeRcpt.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  FindFastQuery.Close; //added DL25102000
  GreigeSlitQuery.Close;
  SumSlitQuery.Close;
  SumGreigeQuery.Close;
  tabFinRcptDaily.Close;
  GreigeRcpt.Close;
  WarpRcpt.Close;
  WeaveSummaryForm.Release;
end;

procedure TWeaveSummaryForm.FormShow(Sender: TObject);
begin
  WarpRcpt.Open;
  GreigeRcpt.Open;
  tabFinRcptDaily.Open;
  SumGreigeQuery.Open;
  SumSlitQuery.Open;
  GreigeSlitQuery.Open;
end;

procedure TWeaveSummaryForm.GreigeRcptAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  GreigeRcpt.Refresh;
end;

procedure TWeaveSummaryForm.GreigeRcptAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TWeaveSummaryForm.GreigeRcptAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  GreigeRcpt.Close;
  GreigeRcpt.Open;}
end;

procedure TWeaveSummaryForm.GreigeRcptBeforeEdit(DataSet: TDataset);
begin
  if GreigeRcptStatus.Value<>'S' then
  begin
  
    MainForm.Database.StartTransaction
  end
  else
  begin
    ShowMessage('Cannot edit where status=S');
    Abort;
  end;
end;

procedure TWeaveSummaryForm.GreigeRcptBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWeaveSummaryForm.GreigeRcptBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWeaveSummaryForm.GreigeRcptNewRecord(DataSet: TDataset);
begin
  MaxGreigeQuery.Close;
  MaxGreigeQuery.Params[0].AsInteger:=WarpRcptWarpNo.Value;
  MaxGreigeQuery.Open;
  GreigeRcptGreigeNo.Value:=MaxGreigeQueryMax.Value+1;
  MaxGreigeQuery.Close;
  GreigeRcptWarpNo.Value:=WarpRcptWarpNo.Value;
{  GreigeRcptWarpLotNo1.Value:=WarpRcptWarpLotNo1.Value;
  GreigeRcptWarpLotNo2.Value:=WarpRcptWarpLotNo2.Value;
  GreigeRcptWarpSingleMultiple.Value:=WarpRcptWarpSingleMultiple.Value;}
  GreigeRcptWeaveDate.Value:=date;
  GreigeRcptGreigeDate.ReadOnly:=false;
  GreigeRcptGreigeLength.ReadOnly:=false;
  GreigeRcptFinDate.ReadOnly:=false;
  GreigeRcptFinLength.ReadOnly:=false;
  GreigeRcptGreigeDate.Value:=GreigeRcptWeaveDate.Value; {added DL121296}
  GreigeRcptFinDate.Value:=GreigeRcptGreigeDate.Value;
  GreigeRcptFinLength.Value:=0;
  GreigeRcptGreigeLength.Value:=0;
  GreigeRcptGreigeDate.ReadOnly:=true;
  GreigeRcptGreigeLength.ReadOnly:=true;
  GreigeRcptFinDate.ReadOnly:=true;
  GreigeRcptFinLength.ReadOnly:=true;
  GreigeRcptStatus.Value:='W';
{  GreigeRcptRcvdBy.Value:=UserInitials;}
end;

procedure TWeaveSummaryForm.GreigeGridEnter(Sender: TObject);
begin
  ActiveSource.DataSet:=GreigeRcpt{Source.DataSet};
  DBNavigator.VisibleButtons:=[nbInsert,nbPost,nbEdit,nbCancel,
    nbFirst,nbLast,nbPrior,nbNext,nbRefresh];
  GreigeGrid.Options := GreigeGrid.Options + [dgAlwaysShowSelection];
  VBTypeSearchSpdBtn.Enabled:=true;
  LoomRefSpdBtn.Enabled:=true;
//CloseBitBtn.Enabled:=false;   JT170698  not required
end;

procedure TWeaveSummaryForm.GreigeGridExit(Sender: TObject);
begin
  ActiveSource.DataSet:=WarpRcpt;
  DBNavigator.VisibleButtons:=[nbFirst,nbLast,nbPrior,nbNext,nbEdit,
    nbPost,nbCancel,nbRefresh];
  GreigeGrid.Options := GreigeGrid.Options - [dgAlwaysShowSelection];
  VBTypeSearchSpdBtn.Enabled:=false;
  LoomRefSpdBtn.Enabled:=false;
//CloseBitBtn.Enabled:=true;    JT170698  not required
end;

procedure TWeaveSummaryForm.VBTypeSearchSpdBtnClick(Sender: TObject);
begin
  GreigeGrid.SelectedField := GreigeRcptVBStru;
  if not (GreigeRcpt.State in [dsEdit,dsInsert]) then
    raise Exception.Create('Must be in edit or insert mode to search');
  if VBPickDlgForm.ShowModalVBWarpType(WarpRcptWarpType.Value) = mrOk then
  begin
{    EditVBStru.ReadOnly:=false;
    EditVBCol.ReadOnly:=false;}
    GreigeRcpt.Edit;
    GreigeGrid.SelectedField := GreigeRcptVBStru;
    GreigeRcptVBStru.Value:=VBPickDlgForm.VBWarpStru;
    GreigeGrid.SelectedField := GreigeRcptVBCol;
    GreigeRcptVBCol.Value:=VBPickDlgForm.VBWarpCol;
{    GreigeGrid.SelectedField := GreigeRcptWarpLotNo1;
    GreigeRcptWarpLotNo1.Value:=WarpRcptWarpLotNo1.Value;
    GreigeGrid.SelectedField := GreigeRcptWarpLotNo2;
    GreigeRcptWarpLotNo2.Value:=WarpRcptWarpLotNo2.Value;}
{    GreigeGrid.SelectedField := GreigeRcptWarpSingleMultiple;
    GreigeRcptWarpSingleMultiple.Value:=WarpRcptWarpSingleMultiple.Value;}
{    WarpCol:=VBPickDlgForm.WarpCol;
    WeftCol:=VBPickDlgForm.WeftCol;}
{    EditVBStru.ReadOnly:=true;
    EditVBCol.ReadOnly:=true;}
  end;
  Screen.Cursor:=crDefault;
end;

procedure TWeaveSummaryForm.LoomRefSpdBtnClick(Sender: TObject);
begin
  GreigeGrid.SelectedField := GreigeRcptLoomRef;
  if not (GreigeRcpt.State in [dsEdit,dsInsert]) then
    raise Exception.Create('Must be in edit or insert mode to search');
  if VBPickDlgForm.ShowModalLoomRef(WarpRcptWarpType.Value) = mrOk then
  begin
{    EditVBStru.ReadOnly:=false;
    EditVBCol.ReadOnly:=false;}
{    FabricLotNoQuery.Edit;}
    GreigeGrid.SelectedField := GreigeRcptLoomRef;
    GreigeRcptLoomRef.Value:=VBPickDlgForm.LoomRef;
{    EditVBStru.ReadOnly:=true;
    EditVBCol.ReadOnly:=true;}
  end;
  Screen.Cursor:=crDefault;
end;

procedure TWeaveSummaryForm.GreigeRcptSourceStateChange(Sender: TObject);
begin
  if GreigeRcpt.State = dsEdit then
  begin
    ModeIndicator.Caption := 'Edit';
    ModeIndicator.Font.Color := clRed;
  end
  else
    if GreigeRcpt.State = dsInsert then
    begin
      ModeIndicator.Caption := 'Receive';
      ModeIndicator.Font.Color := clRed;
    end
    else
    begin
      ModeIndicator.Caption := 'Browse';
      ModeIndicator.Font.Color := clBlue;
    end;
  CloseBitBtn.Enabled :=          //added JT180698
    (GreigeRcpt.State = dsBrowse) and (WarpRcpt.State = dsBrowse);
  GriegeRcptSpdBtn.Enabled := CloseBitBtn.Enabled;
  FinishRcptSpdBtn.Enabled := CloseBitBtn.Enabled;
  FindFastNextIncompleteSpnBtn.Enabled := CloseBitBtn.Enabled; //added DL22102001
end;

procedure TWeaveSummaryForm.GreigeRcptSTATUSChange(Sender: TField);
begin
  if (GreigeRcptStatus.Value <>'P' )
     and (GreigeRcptStatus.Value <>'W' )
     and (GreigeRcptStatus.Value <>'V' )
     and (GreigeRcptStatus.Value <>'F' )
     and (GreigeRcptStatus.Value <>'C' )
     and (GreigeRcptStatus.Value <>'S' ) then
    raise Exception.Create('Invalid Status (PWVFCS)');
end;

procedure TWeaveSummaryForm.GreigeRcptDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.RollBack;
end;

procedure TWeaveSummaryForm.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button=nbRefresh) and ((GreigeRcpt.State in [dsInsert, dsEdit])
     or (WarpRcpt.State in [dsInsert, dsEdit])) then
  begin
    ShowMessage('Cannot refresh while in Receive or Edit Mode');
    Abort;
  end;
end;
          //added JT170698  highlight unfinished rows
procedure TWeaveSummaryForm.GreigeGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if GreigeRcptSTATUS.Value <> 'S' then
    GreigeGrid.Canvas.Font.Color := clRed;
  GreigeGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
          //added JT170698  open relevant form on dbl click
procedure TWeaveSummaryForm.GreigeGridDblClick(Sender: TObject);
begin
  if (GreigeGrid.SelectedField = GreigeRcptGREIGEDATE) and GriegeRcptSpdBtn.Enabled then
    GriegeRcptSpdBtnClick(nil)
  else if (GreigeGrid.SelectedField = GreigeRcptFINDATE) and FinishRcptSpdBtn.Enabled then
    FinishRcptSpdBtnClick(nil);
end;
      //added JT170698   enforce transaction completion
procedure TWeaveSummaryForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := GreigeRcpt.State = dsBrowse;
  if not CanClose then
    MessageDlg('First post or cancel this edit', mtError, [mbOK], 0);
end;
            //added JT180698
procedure TWeaveSummaryForm.GriegeRcptSpdBtnClick(Sender: TObject);
begin
  frmGreigeRcpt:=TfrmGreigeRcpt.Create(Application);
  frmGreigeRcpt.edtWarpNo.Text := WarpRcptWARPNO.AsString; //was GreigeRcpt DL110599
  {frmGreigeRcpt.Show}frmGreigeRcpt.ShowModal;
  GreigeRcpt.Refresh;
end;
            //added JT180698
procedure TWeaveSummaryForm.FinishRcptSpdBtnClick(Sender: TObject);
begin
  frmFinRcpt:=TfrmFinRcpt.Create(Application);
  frmFinRcpt.edtWarpNo.Text := WarpRcptWARPNO.AsString; //was GreigeRcpt DL110599
  frmFinRcpt.ShowModal;
  GreigeRcpt.Refresh;
end;

procedure TWeaveSummaryForm.WarpRcptSourceStateChange(Sender: TObject);
begin
  CloseBitBtn.Enabled :=          //added JT180698
    (GreigeRcpt.State = dsBrowse) and (WarpRcpt.State = dsBrowse);
  GriegeRcptSpdBtn.Enabled := CloseBitBtn.Enabled;
  FinishRcptSpdBtn.Enabled := CloseBitBtn.Enabled;
  FindFastNextIncompleteSpnBtn.Enabled := CloseBitBtn.Enabled; //added DL25102000
end;

procedure TWeaveSummaryForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TWeaveSummaryForm.GreigeRcptBeforePost(DataSet: TDataSet);
begin
  GreigeRcptDateMod.ReadOnly:=false;
  GreigeRcptUserMod.ReadOnly:=false;
  GreigeRcptDateMod.Value:=now;
  GreigeRcptUserMod.Value:=UserInitials;
  GreigeRcptDateMod.ReadOnly:=true;
  GreigeRcptUserMod.ReadOnly:=true;
end;

procedure TWeaveSummaryForm.btnGridPrintClick(Sender: TObject);
begin
  ODDataPrinter1.Print;
end;

procedure TWeaveSummaryForm.FindFastNextIncompleteSpnBtnClick(
  Sender: TObject);
begin
  //added DL25102000
  //if GreigeRcpt.State in [dsInsert, dsEdit] then
  //  ShowMessage('Cannot search when in Receive or Edit Mode')
  //else
  //begin
    WarpRcpt.DisableControls;
    try
      FindFastQuery.Close;
      FindFastQuery.ParamByName('WarpNo').AsInteger:=WarpRcptWARPNO.AsInteger;
      FindFastQuery.Open;
      if FindFastQuery.BOF=FindFastQuery.EOF then
        ShowMessage('No more incomplete orders after this one')
      else
      begin
        WarpRcpt.SetKey;
        WarpRcpt.FieldByName('WarpNo').AsInteger:=FindFastQueryWARPNO.AsInteger;
        WarpRcpt.GotoKey;
      end
    finally
      WarpRcpt.EnableControls;
    end;
  //end;
  FindFastQuery.Close;
  Screen.Cursor:=crDefault;
end;

end.
