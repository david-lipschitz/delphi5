unit departments;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Dialogs,
  Buttons;

type
  TfrmDepartments = class(TForm)
    dbgDepartment: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    datDepartment: TDataSource;
    Panel2: TPanel;
    tabDepartment: TTable;
    CloseBitBtn: TBitBtn;
    PrintSpdBtn: TSpeedButton;
    tabDepartmentDEPREF: TStringField;
    tabDepartmentDESCRIPTION: TStringField;
    procedure CloseBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tabDepartmentAfterPost(DataSet: TDataset);
    procedure tabDepartmentAfterCancel(DataSet: TDataset);
    procedure tabDepartmentAfterDelete(DataSet: TDataset);
    procedure tabDepartmentBeforeEdit(DataSet: TDataSet);
    procedure tabDepartmentBeforeInsert(DataSet: TDataSet);
    procedure tabDepartmentDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tabDepartmentBeforeDelete(DataSet: TDataSet);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmDepartments: TfrmDepartments;

implementation

uses Main;

{$R *.DFM}

procedure TfrmDepartments.CloseBtnClick(Sender: TObject);
begin
  if tabDepartment.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post departments before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TfrmDepartments.CloseBitBtnClick(Sender: TObject);
begin
  if tabDepartment.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post departments before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TfrmDepartments.FormShow(Sender: TObject);
begin
  tabDepartment.Open;
  tabDepartment.Refresh;
end;

procedure TfrmDepartments.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tabDepartment.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  tabDepartment.Close;
  frmDepartments.Release;
end;

procedure TfrmDepartments.tabDepartmentAfterPost(DataSet: TDataset);
begin
  frmMain.Database.Commit;
end;

procedure TfrmDepartments.tabDepartmentAfterCancel(DataSet: TDataset);
begin
  frmMain.Database.Rollback;
  tabDepartment.Refresh;
end;

procedure TfrmDepartments.tabDepartmentAfterDelete(DataSet: TDataset);
begin
  frmMain.Database.Commit;
end;

procedure TfrmDepartments.tabDepartmentBeforeEdit(DataSet: TDataSet);
begin
  frmMain.Database.StartTransaction;
end;

procedure TfrmDepartments.tabDepartmentBeforeInsert(DataSet: TDataSet);
begin
  frmMain.Database.StartTransaction;
end;

procedure TfrmDepartments.tabDepartmentDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  frmMain.Database.Rollback;
end;

procedure TfrmDepartments.tabDepartmentBeforeDelete(DataSet: TDataSet);
begin
  frmMain.Database.StartTransaction;
end;

procedure TfrmDepartments.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
