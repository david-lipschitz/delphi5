unit Ynstru;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Buttons, DBTables, Mask, ExtCtrls,
  Dialogs, DBLookup, Grids, DBGrids, ComCtrls;

type
  TYarnStruForm = class(TForm)
    ScrollBox: TScrollBox;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    YarnStruSource: TDataSource;
    Panel2: TPanel;
    YarnStru: TTable;
    YarnStruYNSTRU: TStringField;
    YarnStruDESCR: TStringField;
    YarnStruLABELDESCR: TStringField;
    YarnStruYNTWIST: TStringField;
    YnTwist: TTable;
    YnTwistSource: TDataSource;
    YarnStruPRODHRSPDL: TFloatField;
    YarnStruPRODGROUP: TStringField;
    Dept: TTable;
    DeptSource: TDataSource;
    YarnStruDEPTGROUP: TStringField;
    YarnStruYNSTRUGRP: TStringField;
    YnStruPageControl: TPageControl;
    InfoTabSheet: TTabSheet;
    WBSTabSheet: TTabSheet;
    WBS: TTabSheet;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    YnStruSearchSpdBtn: TSpeedButton;
    Label8: TLabel;
    EditYNSTRU: TDBEdit;
    DBLookupCombo1: TDBLookupCombo;
    Label7: TLabel;
    Label14: TLabel;
    EditYnStruGrp: TDBEdit;
    Label9: TLabel;
    Label3: TLabel;
    EditLabelDescr: TDBEdit;
    EditDESCR: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EditDeptComboBox: TDBLookupCombo;
    EditProdGroup: TDBEdit;
    EditProdHrSpndl: TDBEdit;
    Label10: TLabel;
    YnStruWBSRM: TTable;
    YnStruWBSRMSource: TDataSource;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    Label6: TLabel;
    YnStruWBSRMYNSTRU: TStringField;
    YnStruWBSRMYNTWIST: TStringField;
    YnStruWBSRMCTRLACCT: TStringField;
    YnStruWBSRMRMPERKG: TFloatField;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    Label16: TLabel;
    DBLookupCombo2: TDBLookupCombo;
    Label17: TLabel;
    PostBtn: TButton;
    CancelBtn: TButton;
    CloseBitBtn: TBitBtn;
    YnTotalQuery: TQuery;
    YnTotalQuerySource: TDataSource;
    DBEdit2: TDBEdit;
    Label18: TLabel;
    YnTotalQuerySUM: TFloatField;
    YarnStruWARPTOTWISTED: TFloatField;
    YarnStruTWISTEDTOWOUND: TFloatField;
    YarnStruWOUNDTOYARN: TFloatField;
    YarnStruRESULTYARNTEX: TIntegerField;
    Label19: TLabel;
    EditWarpToTwisted: TDBEdit;
    Label20: TLabel;
    EditTwistedToWound: TDBEdit;
    Label21: TLabel;
    EditWoundToYarn: TDBEdit;
    Label22: TLabel;
    EditResultYarnTex: TDBEdit;
    Label23: TLabel;
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure YarnStruSourceStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure YarnStruAfterPost(DataSet: TDataset);
    procedure YarnStruAfterDelete(DataSet: TDataset);
    procedure YarnStruAfterCancel(DataSet: TDataset);
    procedure YarnStruBeforeCancel(DataSet: TDataset);
    procedure YarnStruBeforeDelete(DataSet: TDataset);
    procedure YnStruSearchSpdBtnClick(Sender: TObject);
    procedure YarnStruBeforeEdit(DataSet: TDataSet);
    procedure YarnStruBeforeInsert(DataSet: TDataSet);
    procedure YnStruWBSRMNewRecord(DataSet: TDataSet);
    procedure YnStruWBSRMBeforeEdit(DataSet: TDataSet);
    procedure YnStruWBSRMBeforeDelete(DataSet: TDataSet);
    procedure YnStruWBSRMBeforeInsert(DataSet: TDataSet);
    procedure YarnStruDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
    NoCommit:boolean;
  public
    { public declarations }
  end;

var
  YarnStruForm: TYarnStruForm;

implementation

uses Main, BrModal;

{$R *.DFM}

procedure TYarnStruForm.PostBtnClick(Sender: TObject);
begin
  YarnStru.Post;
end;

procedure TYarnStruForm.CancelBtnClick(Sender: TObject);
begin
  YarnStru.Cancel;
end;

procedure TYarnStruForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TYarnStruForm.YarnStruSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := YarnStru.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := YarnStru.State = dsBrowse;
end;

procedure TYarnStruForm.FormShow(Sender: TObject);
begin
  YarnStru.Open;
  YnTwist.Open;
  Dept.Open;
  YnStruWBSRM.Open;
  YnTotalQuery.Open;
{  MainForm.Database.StartTransaction;}
  YarnStru.Refresh;
  YnTwist.Refresh;
  Dept.Refresh;
  YnStruWBSRM.Refresh;
  YnStruPageControl.ActivePage:=InfoTabSheet;
  NoCommit:=false;  
end;

procedure TYarnStruForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if YarnStru.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  YnTotalQuery.Close;
  YnStruWBSRM.Close;
  YarnStru.Close;
  YnTwist.Close;
  Dept.Close;
  YarnStruForm.Release;
end;

procedure TYarnStruForm.YarnStruAfterPost(DataSet: TDataset);
begin
  if not NoCommit then
    MainForm.Database.Commit;
end;

procedure TYarnStruForm.YarnStruAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TYarnStruForm.YarnStruAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  YarnStru.Refresh;
{  MainForm.Database.StartTransaction;}
end;

procedure TYarnStruForm.YarnStruBeforeCancel(DataSet: TDataset);
begin
  if YarnStru.State=dsInsert then
    if MessageDlg('Cancel yarn structure being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TYarnStruForm.YarnStruBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete yarn structure?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;      
end;

procedure TYarnStruForm.YnStruSearchSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalYarnStru = mrOk then
  begin
    YarnStru.SetKey;
    YarnStru.FieldByName('YnStru').AsString:=PickDlgForm.YarnStru;
    YarnStru.FieldByName('YnTwist').AsString:=PickDlgForm.YnTwist;
    YarnStru.GotoKey;
  end;
end;

procedure TYarnStruForm.YarnStruBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TYarnStruForm.YarnStruBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TYarnStruForm.YnStruWBSRMNewRecord(DataSet: TDataSet);
begin
  YnStruWBSRMYnStru.Value:=YarnStruYnStru.Value;
  YnStruWBSRMYnTwist.Value:=YarnStruYnTwist.Value;
end;

procedure TYarnStruForm.YnStruWBSRMBeforeEdit(DataSet: TDataSet);
begin
  YarnStru.Edit;
end;

procedure TYarnStruForm.YnStruWBSRMBeforeDelete(DataSet: TDataSet);
begin
  YarnStru.Edit;
end;

procedure TYarnStruForm.YnStruWBSRMBeforeInsert(DataSet: TDataSet);
begin
  if YarnStru.State = dsInsert then
  begin
    NoCommit:=true;
    YarnStru.Post;
    YarnStru.Edit;
    NoCommit:=false;
  end
  else
    YarnStru.Edit;
end;

procedure TYarnStruForm.YarnStruDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

end.
