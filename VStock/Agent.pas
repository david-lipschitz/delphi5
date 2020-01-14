unit Agent;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, ExtCtrls,
  Dialogs;

type
  TAgentForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    AgentSource: TDataSource;
    Panel2: TPanel;
    Agent: TTable;
    AgentAGENTREF: TStringField;
    AgentDESCR: TStringField;
    CloseBitBtn: TBitBtn;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AgentAfterPost(DataSet: TDataset);
    procedure AgentAfterDelete(DataSet: TDataset);
    procedure AgentAfterCancel(DataSet: TDataset);
    procedure AgentBeforeEdit(DataSet: TDataSet);
    procedure AgentBeforeInsert(DataSet: TDataSet);
    procedure AgentBeforeDelete(DataSet: TDataSet);
    procedure AgentDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  AgentForm: TAgentForm;

implementation

uses Main;

{$R *.DFM}

procedure TAgentForm.CloseBitBtnClick(Sender: TObject);
begin
  if Agent.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post agent details before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TAgentForm.FormShow(Sender: TObject);
begin
  Agent.Open;
  Agent.Refresh;
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
{  MainForm.Database.Commit;}
  Agent.Close;
  AgentForm.Release;
end;

procedure TAgentForm.AgentAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TAgentForm.AgentAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TAgentForm.AgentAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  Agent.Refresh;
end;

procedure TAgentForm.AgentBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TAgentForm.AgentBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TAgentForm.AgentBeforeDelete(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TAgentForm.AgentDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

end.
