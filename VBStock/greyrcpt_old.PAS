unit greyrcpt_old;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, Mask,
  ExtCtrls;

type
  TGreigeRcptForm = class(TForm)
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
    WeftSearchSpdBtn: TSpeedButton;
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
    GreigeRcptFABRICLOTNO: TIntegerField;
    GreigeRcptLOOMREF: TStringField;
    GreigeRcptWARPLOTNO1: TIntegerField;
    GreigeRcptWARPLOTNO2: TSmallintField;
    GreigeRcptWARPSINGLEMULTIPLE: TStringField;
    GreigeRcptWEFTLOTNO1: TIntegerField;
    GreigeRcptWEFTLOTNO2: TSmallintField;
    GreigeRcptWEFTSINGLEMULTIPLE: TStringField;
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
    procedure WeftSearchSpdBtnClick(Sender: TObject);
    procedure LoomRefSpdBtnClick(Sender: TObject);
    procedure GreigeRcptSourceStateChange(Sender: TObject);
    procedure GreigeRcptSTATUSChange(Sender: TField);
    procedure GreigeRcptDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
  private
    { private declarations }
{    WarpCol:string[3];
    WeftCol:string[3];}
  public
    { public declarations }
  end;

var
  GreigeRcptForm: TGreigeRcptForm;

implementation

{$R *.DFM}

uses VBMain, Dialogs, VBModal{, PickDate};

procedure TGreigeRcptForm.WarpSearchSpdBtnClick(Sender: TObject);
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

procedure TGreigeRcptForm.CloseBitBtnClick(Sender: TObject);
begin
  if GreigeRcpt.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Greige Receipts before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TGreigeRcptForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if GreigeRcpt.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  GreigeSlitQuery.Close;
  SumSlitQuery.Close;
  SumGreigeQuery.Close;
  GreigeRcpt.Close;
  WarpRcpt.Close;
  GreigeRcptForm.Release;
end;

procedure TGreigeRcptForm.FormShow(Sender: TObject);
begin
  WarpRcpt.Open;
  GreigeRcpt.Open;
  SumGreigeQuery.Open;
  SumSlitQuery.Open;
  GreigeSlitQuery.Open;
end;

procedure TGreigeRcptForm.GreigeRcptAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  GreigeRcpt.Refresh;
end;

procedure TGreigeRcptForm.GreigeRcptAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TGreigeRcptForm.GreigeRcptAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  GreigeRcpt.Close;
  GreigeRcpt.Open;}
end;

procedure TGreigeRcptForm.GreigeRcptBeforeEdit(DataSet: TDataset);
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

procedure TGreigeRcptForm.GreigeRcptBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TGreigeRcptForm.GreigeRcptBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TGreigeRcptForm.GreigeRcptNewRecord(DataSet: TDataset);
begin
  MaxGreigeQuery.Close;
  MaxGreigeQuery.Params[0].AsInteger:=WarpRcptWarpNo.Value;
  MaxGreigeQuery.Open;
  GreigeRcptGreigeNo.Value:=MaxGreigeQueryMax.Value+1;
  MaxGreigeQuery.Close;
  GreigeRcptWarpNo.Value:=WarpRcptWarpNo.Value;
  GreigeRcptWarpLotNo1.Value:=WarpRcptWarpLotNo1.Value;
  GreigeRcptWarpLotNo2.Value:=WarpRcptWarpLotNo2.Value;
  GreigeRcptWarpSingleMultiple.Value:=WarpRcptWarpSingleMultiple.Value;
  GreigeRcptGreigeDate.Value:=date;
  GreigeRcptWeaveDate.Value:=GreigeRcptGreigeDate.Value; {added DL121296}
  GreigeRcptFinDate.Value:=GreigeRcptGreigeDate.Value;
  GreigeRcptFinLength.Value:=0;
  GreigeRcptGreigeLength.Value:=0;
  GreigeRcptStatus.Value:='W';
{  GreigeRcptRcvdBy.Value:=UserInitials;}
end;

procedure TGreigeRcptForm.GreigeGridEnter(Sender: TObject);
begin
  ActiveSource.DataSet:=GreigeRcpt{Source.DataSet};
  DBNavigator.VisibleButtons:=[nbInsert,nbPost,nbEdit,nbCancel,
    nbFirst,nbLast,nbPrior,nbNext,nbRefresh];
  GreigeGrid.Options := GreigeGrid.Options + [dgAlwaysShowSelection];
  VBTypeSearchSpdBtn.Enabled:=true;
  WeftSearchSpdBtn.Enabled:=true;
  LoomRefSpdBtn.Enabled:=true;
  CloseBitBtn.Enabled:=false;
{  WarpSearchSpdBtn.Enabled:=false;}
end;

procedure TGreigeRcptForm.GreigeGridExit(Sender: TObject);
begin
  ActiveSource.DataSet:=WarpRcpt;
  DBNavigator.VisibleButtons:=[nbFirst,nbLast,nbPrior,nbNext,nbEdit,
    nbPost,nbCancel,nbRefresh];
  GreigeGrid.Options := GreigeGrid.Options - [dgAlwaysShowSelection];
  VBTypeSearchSpdBtn.Enabled:=false;
  WeftSearchSpdBtn.Enabled:=false;
  LoomRefSpdBtn.Enabled:=false;
  CloseBitBtn.Enabled:=true;
{  WarpSearchSpdBtn.Enabled:=true;}
end;

procedure TGreigeRcptForm.VBTypeSearchSpdBtnClick(Sender: TObject);
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
    GreigeGrid.SelectedField := GreigeRcptWarpLotNo1;
    GreigeRcptWarpLotNo1.Value:=WarpRcptWarpLotNo1.Value;
    GreigeGrid.SelectedField := GreigeRcptWarpLotNo2;
    GreigeRcptWarpLotNo2.Value:=WarpRcptWarpLotNo2.Value;
    GreigeGrid.SelectedField := GreigeRcptWarpSingleMultiple;
    GreigeRcptWarpSingleMultiple.Value:=WarpRcptWarpSingleMultiple.Value;
{    WarpCol:=VBPickDlgForm.WarpCol;
    WeftCol:=VBPickDlgForm.WeftCol;}
{    EditVBStru.ReadOnly:=true;
    EditVBCol.ReadOnly:=true;}
  end;
  Screen.Cursor:=crDefault;
end;

procedure TGreigeRcptForm.WeftSearchSpdBtnClick(Sender: TObject);
begin
  GreigeGrid.SelectedField := GreigeRcptWarpLotNo1;
  if not (GreigeRcpt.State in [dsEdit,dsInsert]) then
    raise Exception.Create('Must be in edit or insert mode to search');
  if GreigeRcptVBCol.Value='' then
    raise Exception.Create('Must search for VB Type first');
  if VBPickDlgForm.ShowModalFabricLotNo(
    GreigeRcptVBStru.Value,
    GreigeRcptVBCol.Value,
    GreigeRcptWarpLotNo1.Value,
    GreigeRcptWarpLotNo2.Value,
    GreigeRcptWarpSingleMultiple.Value) = mrOk then
  begin
{    EditVBStru.ReadOnly:=false;
    EditVBCol.ReadOnly:=false;}
{    FabricLotNoQuery.Edit;}
    GreigeGrid.SelectedField := GreigeRcptWarpLotNo1;
    GreigeRcptWeftLotNo1.Value:=VBPickDlgForm.FLNWeftLotNo1; {FLN=Fabric Lot NO}
    GreigeGrid.SelectedField := GreigeRcptWarpLotNo2;
    GreigeRcptWeftLotNo2.Value:=VBPickDlgForm.FLNWeftLotNo2;
    GreigeGrid.SelectedField := GreigeRcptWarpSingleMultiple;
    GreigeRcptWeftSingleMultiple.Value:=VBPickDlgForm.FLNWeftSingleMultiple;
    GreigeGrid.SelectedField := GreigeRcptFabricLotNo;
    GreigeRcptFabricLotNo.Value:=VBPickDlgForm.FLNLotNo;
{    EditVBStru.ReadOnly:=true;
    EditVBCol.ReadOnly:=true;}
  end;
  Screen.Cursor:=crDefault;
end;

procedure TGreigeRcptForm.LoomRefSpdBtnClick(Sender: TObject);
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

procedure TGreigeRcptForm.GreigeRcptSourceStateChange(Sender: TObject);
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
end;

procedure TGreigeRcptForm.GreigeRcptSTATUSChange(Sender: TField);
begin
  if (GreigeRcptStatus.Value <>'P' )
     and (GreigeRcptStatus.Value <>'W' )
     and (GreigeRcptStatus.Value <>'V' )
     and (GreigeRcptStatus.Value <>'F' )
     and (GreigeRcptStatus.Value <>'C' )
     and (GreigeRcptStatus.Value <>'S' ) then
    raise Exception.Create('Invalid Status (PWVFCS)');
end;

procedure TGreigeRcptForm.GreigeRcptDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.RollBack;
end;

procedure TGreigeRcptForm.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button=nbRefresh) and ((GreigeRcpt.State in [dsInsert, dsEdit])
     or (WarpRcpt.State in [dsInsert, dsEdit])) then
  begin
    ShowMessage('Cannot refresh while in Receive or Edit Mode');
    Abort;
  end;
end;

end.
