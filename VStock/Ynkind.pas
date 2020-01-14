unit Ynkind;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, ExtCtrls,
  Dialogs;

type
  TYnKindForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    YarnKindSource: TDataSource;
    Panel2: TPanel;
    YarnKind: TTable;
    BitBtn1: TBitBtn;
    YarnKindREF: TStringField;
    YarnKindDESCR: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure YarnKindAfterPost(DataSet: TDataset);
    procedure YarnKindAfterDelete(DataSet: TDataset);
    procedure YarnKindAfterCancel(DataSet: TDataset);
    procedure YarnKindBeforeCancel(DataSet: TDataSet);
    procedure YarnKindBeforeDelete(DataSet: TDataSet);
    procedure YarnKindBeforeEdit(DataSet: TDataSet);
    procedure YarnKindBeforeInsert(DataSet: TDataSet);
    procedure YarnKindDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  YnKindForm: TYnKindForm;

implementation

uses Main;

{$R *.DFM}

procedure TYnKindForm.BitBtn1Click(Sender: TObject);
begin
  if YarnKind.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post yarn kinds before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TYnKindForm.FormShow(Sender: TObject);
begin
  YarnKind.Open;
{  MainForm.Database.StartTransaction;}
  YarnKind.Refresh;
end;

procedure TYnKindForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if YarnKind.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  YarnKind.Close;
  YnKindForm.Release;
end;

procedure TYnKindForm.YarnKindAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TYnKindForm.YarnKindAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TYnKindForm.YarnKindAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  YarnKind.Refresh;
{  MainForm.Database.StartTransaction;}
end;

procedure TYnKindForm.YarnKindBeforeCancel(DataSet: TDataSet);
begin
  if YarnKind.State=dsInsert then
    if MessageDlg('Cancel yarn kind being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TYnKindForm.YarnKindBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete yarn kind?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TYnKindForm.YarnKindBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TYnKindForm.YarnKindBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TYnKindForm.YarnKindDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

end.