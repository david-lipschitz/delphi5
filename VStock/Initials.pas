unit Initials;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Dialogs,
  Buttons;

type
  TInitialsForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    InitialsSource: TDataSource;
    Panel2: TPanel;
    Initials: TTable;
    InitialsINITIALS: TStringField;
    InitialsSURNAME: TStringField;
    InitialsFIRSTNAME: TStringField;
    InitialsEXT: TSmallintField;
    CloseBitBtn: TBitBtn;
    InitialsUSERNAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InitialsAfterPost(DataSet: TDataset);
    procedure InitialsAfterCancel(DataSet: TDataset);
    procedure InitialsAfterDelete(DataSet: TDataset);
    procedure InitialsBeforeCancel(DataSet: TDataSet);
    procedure InitialsBeforeDelete(DataSet: TDataSet);
    procedure InitialsBeforeEdit(DataSet: TDataSet);
    procedure InitialsBeforeInsert(DataSet: TDataSet);
    procedure InitialsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure InitialsDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  InitialsForm: TInitialsForm;

implementation

uses Main;

{$R *.DFM}

procedure TInitialsForm.FormCreate(Sender: TObject);
begin
{  Initials.Open;}
end;

procedure TInitialsForm.CloseBtnClick(Sender: TObject);
begin
  if Initials.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post initials before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TInitialsForm.CloseBitBtnClick(Sender: TObject);
begin
  if Initials.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post initials before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TInitialsForm.FormShow(Sender: TObject);
begin
  Initials.Open;
{  MainForm.Database.StartTransaction;}
  Initials.Refresh;
end;

procedure TInitialsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Initials.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  Initials.Close;
  InitialsForm.Release;
end;

procedure TInitialsForm.InitialsAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TInitialsForm.InitialsAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  Initials.Refresh;
{  MainForm.Database.StartTransaction;}
end;

procedure TInitialsForm.InitialsAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TInitialsForm.InitialsBeforeCancel(DataSet: TDataSet);
begin
  if Initials.State=dsInsert then
    if MessageDlg('Cancel user (initials) being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TInitialsForm.InitialsBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete user?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TInitialsForm.InitialsBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TInitialsForm.InitialsBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TInitialsForm.InitialsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
{  MainForm.Database.Rollback;}
end;

procedure TInitialsForm.InitialsDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

end.
