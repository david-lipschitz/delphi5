unit Vbyncol;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons;

type
  TVBYnColForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    YnColSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    YarnCol: TTable;
    YarnColYNCOL: TStringField;
    YarnColDESCR: TStringField;
    PrintSpdBtn: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure YarnColAfterCancel(DataSet: TDataset);
    procedure YarnColAfterDelete(DataSet: TDataset);
    procedure YarnColAfterPost(DataSet: TDataset);
    procedure YarnColBeforeEdit(DataSet: TDataset);
    procedure YarnColBeforeInsert(DataSet: TDataset);
    procedure YarnColBeforeDelete(DataSet: TDataset);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure YarnColDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  VBYnColForm: TVBYnColForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs;

procedure TVBYnColForm.FormShow(Sender: TObject);
begin
  YarnCol.Open;
  YarnCol.Refresh;
end;

procedure TVBYnColForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if YarnCol.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  YarnCol.Close;
  VBYnColForm.Release;
end;

procedure TVBYnColForm.YarnColAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  YarnCol.Refresh;
end;

procedure TVBYnColForm.YarnColAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBYnColForm.YarnColAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBYnColForm.YarnColBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYnColForm.YarnColBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYnColForm.YarnColBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYnColForm.CloseBitBtnClick(Sender: TObject);
begin
  if YarnCol.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post yarn colours before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBYnColForm.YarnColDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBYnColForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
