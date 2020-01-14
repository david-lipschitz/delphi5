unit Yneffgrp;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons,
  Dialogs;

type
  TYnEffGroupForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    YnEffGroupSource: TDataSource;
    Panel2: TPanel;
    YnEffGroup: TTable;
    YnEffGroupPRODGROUP: TStringField;
    YnEffGroupTOTALSPINDLES: TIntegerField;
    YnEffGroupHRSPERWEEK: TFloatField;
    YnEffGroupGROUPDESCR: TStringField;
    CloseBitBtn: TBitBtn;
    procedure YnEffGroupAfterCancel(DataSet: TDataset);
    procedure YnEffGroupAfterDelete(DataSet: TDataset);
    procedure YnEffGroupAfterPost(DataSet: TDataset);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure YnEffGroupBeforeCancel(DataSet: TDataSet);
    procedure YnEffGroupBeforeDelete(DataSet: TDataSet);
    procedure YnEffGroupBeforeEdit(DataSet: TDataSet);
    procedure YnEffGroupBeforeInsert(DataSet: TDataSet);
    procedure YnEffGroupDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  YnEffGroupForm: TYnEffGroupForm;

implementation

uses Main;

{$R *.DFM}

procedure TYnEffGroupForm.YnEffGroupAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  YnEffGroup.Refresh;
{ MainForm.Database.StartTransaction;}
end;

procedure TYnEffGroupForm.YnEffGroupAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TYnEffGroupForm.YnEffGroupAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TYnEffGroupForm.CloseBitBtnClick(Sender: TObject);
begin
  if YnEffGroup.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post efficiency groups before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TYnEffGroupForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if YnEffGroup.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  YnEffGroup.Close;
  YnEffGroupForm.Release;
end;

procedure TYnEffGroupForm.FormShow(Sender: TObject);
begin
  YnEffGroup.Open;
{ MainForm.Database.StartTransaction;}
  YnEffGroup.Refresh;
end;

procedure TYnEffGroupForm.YnEffGroupBeforeCancel(DataSet: TDataSet);
begin
  if YnEffGroup.State=dsInsert then
    if MessageDlg('Cancel yarn eff group being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TYnEffGroupForm.YnEffGroupBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete yarn eff group?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TYnEffGroupForm.YnEffGroupBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TYnEffGroupForm.YnEffGroupBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TYnEffGroupForm.YnEffGroupDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

end.