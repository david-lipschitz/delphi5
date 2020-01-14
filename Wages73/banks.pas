unit banks;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Dialogs,
  Buttons;

type
  TfrmBanks = class(TForm)
    dbgDepartment: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    datBank: TDataSource;
    Panel2: TPanel;
    tabBank: TTable;
    CloseBitBtn: TBitBtn;
    PrintSpdBtn: TSpeedButton;
    tabBankBANKREF: TStringField;
    tabBankDESCRIPTION: TStringField;
    procedure CloseBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tabBankAfterPost(DataSet: TDataset);
    procedure tabBankAfterCancel(DataSet: TDataset);
    procedure tabBankAfterDelete(DataSet: TDataset);
    procedure tabBankBeforeEdit(DataSet: TDataSet);
    procedure tabBankBeforeInsert(DataSet: TDataSet);
    procedure tabBankDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tabBankBeforeDelete(DataSet: TDataSet);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmBanks: TfrmBanks;

implementation

uses Main;

{$R *.DFM}

procedure TfrmBanks.CloseBtnClick(Sender: TObject);
begin
  if tabBank.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Banks before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TfrmBanks.CloseBitBtnClick(Sender: TObject);
begin
  if tabBank.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Banks before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TfrmBanks.FormShow(Sender: TObject);
begin
  tabBank.Open;
  tabBank.Refresh;
end;

procedure TfrmBanks.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tabBank.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  tabBank.Close;
  frmBanks.Release;
end;

procedure TfrmBanks.tabBankAfterPost(DataSet: TDataset);
begin
  frmMain.Database.Commit;
end;

procedure TfrmBanks.tabBankAfterCancel(DataSet: TDataset);
begin
  frmMain.Database.Rollback;
  tabBank.Refresh;
end;

procedure TfrmBanks.tabBankAfterDelete(DataSet: TDataset);
begin
  frmMain.Database.Commit;
end;

procedure TfrmBanks.tabBankBeforeEdit(DataSet: TDataSet);
begin
  frmMain.Database.StartTransaction;
end;

procedure TfrmBanks.tabBankBeforeInsert(DataSet: TDataSet);
begin
  frmMain.Database.StartTransaction;
end;

procedure TfrmBanks.tabBankDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  frmMain.Database.Rollback;
end;

procedure TfrmBanks.tabBankBeforeDelete(DataSet: TDataSet);
begin
  frmMain.Database.StartTransaction;
end;

procedure TfrmBanks.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
