unit agent;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, Mask, ExtCtrls,
  Buttons, Dialogs;

type
  TAgentForm = class(TForm)
    AgentFreightAGENTREF: TStringField;
    AgentFreightVBWIDTH: TSmallintField;
    AgentFreightFROMDATE: TDateTimeField;
    AgentFreightTODATE: TDateTimeField;
    AgentFreightFREIGHTPERBOX: TFloatField;
    AgentAGENTREF: TStringField;
    AgentDESCR: TStringField;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditAGENTREF: TDBEdit;
    Label2: TLabel;
    EditDESCR: TDBEdit;
    AgentFreightDBGrid: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    AgentSource: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    Agent: TTable;
    AgentFreight: TTable;
    AgentFreightSource: TDataSource;
    Panel4: TPanel;
    PostBtn: TButton;
    CancelBtn: TButton;
    ActiveSource: TDataSource;
    CloseBitBtn: TBitBtn;
    AgentFreightFREIGHTPERMETRE: TFloatField;
    AgentFreightFREIGHTPERDESPATCH: TFloatField;
    spdAgentSearch: TSpeedButton;
    PrintSpdBtn: TSpeedButton;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AgentFreightBeforeDelete(DataSet: TDataSet);
    procedure AgentFreightBeforeEdit(DataSet: TDataSet);
    procedure AgentFreightBeforeInsert(DataSet: TDataSet);
    procedure AgentFreightNewRecord(DataSet: TDataSet);
    procedure AgentAfterCancel(DataSet: TDataSet);
    procedure AgentAfterDelete(DataSet: TDataSet);
    procedure AgentAfterPost(DataSet: TDataSet);
    procedure AgentBeforeCancel(DataSet: TDataSet);
    procedure AgentBeforeDelete(DataSet: TDataSet);
    procedure AgentBeforeEdit(DataSet: TDataSet);
    procedure AgentBeforeInsert(DataSet: TDataSet);
    procedure AgentFreightDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure AgentDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure AgentFreightDBGridEnter(Sender: TObject);
    procedure AgentFreightDBGridExit(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure AgentSourceStateChange(Sender: TObject);
    procedure spdAgentSearchClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
    NoCommit:boolean;
    InTxn:boolean;
  public
    { public declarations }
  end;

var
  AgentForm: TAgentForm;

implementation

uses VBMain, VBModal, Brmodal;

{$R *.DFM}

procedure TAgentForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TAgentForm.FormShow(Sender: TObject);
begin
  Agent.Open;
  AgentFreight.Open;
end;

procedure TAgentForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Agent.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  AgentFreight.Close;
  Agent.Close;
  AgentForm.Release;
end;

procedure TAgentForm.AgentFreightBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete freight?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  Agent.Edit;
end;

procedure TAgentForm.AgentFreightBeforeEdit(DataSet: TDataSet);
begin
  Agent.Edit;
end;

procedure TAgentForm.AgentFreightBeforeInsert(DataSet: TDataSet);
begin
  if Agent.State = dsInsert then
  begin
    NoCommit:=true;
    Agent.Post;
    Agent.Edit;
    NoCommit:=false;
  end
  else
    Agent.Edit;
end;

procedure TAgentForm.AgentFreightNewRecord(DataSet: TDataSet);
begin
  AgentFreightAGENTREF.Value:=AgentAGENTREF.Value;
end;

procedure TAgentForm.AgentAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  InTxn:=false;
  Agent.Refresh;
  AgentFreight.Refresh;
end;

procedure TAgentForm.AgentAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TAgentForm.AgentAfterPost(DataSet: TDataSet);
begin
  if not NoCommit then
  begin
    MainForm.Database.Commit;
    InTxn:=false;
  end;
end;

procedure TAgentForm.AgentBeforeCancel(DataSet: TDataSet);
begin
  if Agent.State=dsInsert then
    if MessageDlg('Cancel agent being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TAgentForm.AgentBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete agent?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TAgentForm.AgentBeforeEdit(DataSet: TDataSet);
begin
  if not InTxn then
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TAgentForm.AgentBeforeInsert(DataSet: TDataSet);
begin
  if Agent.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('An agent is being processed. Post changes before inserting new product?',
      mtInformation, mbOKCancel, 0) = mrOK then
        Agent.Post
    else
      Abort;
  end;
  if InTxn then
    raise Exception.Create('Post before inserting')
  else
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TAgentForm.AgentFreightDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TAgentForm.AgentDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TAgentForm.AgentFreightDBGridEnter(Sender: TObject);
begin
  ActiveSource.Dataset := AgentFreight;
end;

procedure TAgentForm.AgentFreightDBGridExit(Sender: TObject);
begin
  ActiveSource.Dataset := Agent;
end;

procedure TAgentForm.PostBtnClick(Sender: TObject);
begin
  Agent.Post;
end;

procedure TAgentForm.CancelBtnClick(Sender: TObject);
begin
  Agent.Cancel;
end;

procedure TAgentForm.AgentSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := Agent.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := Agent.State = dsBrowse;
end;

procedure TAgentForm.spdAgentSearchClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalAgents = mrOk then
    Agent.FindKey([PickDlgForm.ProductRef]);
end;

procedure TAgentForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.