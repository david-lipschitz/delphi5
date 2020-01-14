unit VTDept;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, ExtCtrls,
  Dialogs;

type
  TDeptForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    DeptSource: TDataSource;
    Panel2: TPanel;
    Dept: TTable;
    CloseBitBtn: TBitBtn;
    DeptDEPTREF: TStringField;
    DeptDESCR: TStringField;
    DeptCTRLACCT: TStringField;
    DeptISSUEYARNTO: TStringField;
    DeptTRANSFERALLOWED: TStringField;
    DeptSUPPLIER: TStringField;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DeptAfterPost(DataSet: TDataset);
    procedure DeptAfterDelete(DataSet: TDataset);
    procedure DeptAfterCancel(DataSet: TDataset);
    procedure DeptBeforeCancel(DataSet: TDataSet);
    procedure DeptBeforeDelete(DataSet: TDataSet);
    procedure DeptBeforeEdit(DataSet: TDataSet);
    procedure DeptBeforeInsert(DataSet: TDataSet);
    procedure DeptDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DeptForm: TDeptForm;

implementation

uses Main;

{$R *.DFM}

procedure TDeptForm.CloseBitBtnClick(Sender: TObject);
begin
  if Dept.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post departments before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TDeptForm.FormShow(Sender: TObject);
begin
  Dept.Open;
{  MainForm.Database.StartTransaction;}
  Dept.Refresh;
end;

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Dept.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  Dept.Close;
  DeptForm.Release;
end;

procedure TDeptForm.DeptAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TDeptForm.DeptAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TDeptForm.DeptAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  Dept.Refresh;
{  MainForm.Database.StartTransaction;}
end;

procedure TDeptForm.DeptBeforeCancel(DataSet: TDataSet);
begin
  if Dept.State=dsInsert then
    if MessageDlg('Cancel department being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TDeptForm.DeptBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete department?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TDeptForm.DeptBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TDeptForm.DeptBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TDeptForm.DeptDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

end.
