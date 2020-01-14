unit ctrlacct;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Buttons, DBTables, Mask, ExtCtrls,
  Dialogs, Grids, DBGrids, ComCtrls;

type
  TCtrlAcctForm = class(TForm)
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    CtrlAcctSource: TDataSource;
    CtrlAcct: TTable;
    CtrlAcctACCNAME: TStringField;
    CtrlAcctDESCRIPTION: TStringField;
    CloseBitBtn: TBitBtn;
    CtrlAcctEXTACCNAME: TStringField;
    CtrlAcctQTY: TFloatField;
    Panel2: TPanel;
    TxnDetPageControl: TPageControl;
    CtrlAcctTabSheet: TTabSheet;
    RMTxnDetCategoryTabSheet: TTabSheet;
    CtrlAcctGrid: TDBGrid;
    RMTxnDetCategoryGrid: TDBGrid;
    RMTxnDetCategory: TTable;
    RMTxnDetCategorySource: TDataSource;
    RMTxnDetCategoryRMTXNDETCATEGORY: TStringField;
    RMTxnDetCategoryDESCRIPTION: TStringField;
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure CtrlAcctSourceStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CtrlAcctAfterPost(DataSet: TDataset);
    procedure CtrlAcctAfterDelete(DataSet: TDataset);
    procedure CtrlAcctAfterCancel(DataSet: TDataset);
    procedure CtrlAcctBeforeCancel(DataSet: TDataset);
    procedure CtrlAcctBeforeDelete(DataSet: TDataset);
    procedure CtrlAcctBeforeEdit(DataSet: TDataSet);
    procedure CtrlAcctBeforeInsert(DataSet: TDataSet);
    procedure CtrlAcctBeforePost(DataSet: TDataSet);
    procedure CtrlAcctDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure TxnDetPageControlChange(Sender: TObject);
    procedure TxnDetPageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure RMTxnDetCategoryAfterCancel(DataSet: TDataSet);
    procedure RMTxnDetCategoryAfterDelete(DataSet: TDataSet);
    procedure RMTxnDetCategoryAfterPost(DataSet: TDataSet);
    procedure RMTxnDetCategoryBeforeCancel(DataSet: TDataSet);
    procedure RMTxnDetCategoryBeforeDelete(DataSet: TDataSet);
    procedure RMTxnDetCategoryBeforeEdit(DataSet: TDataSet);
    procedure RMTxnDetCategoryBeforeInsert(DataSet: TDataSet);
    procedure RMTxnDetCategoryDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure RMTxnDetCategorySourceStateChange(Sender: TObject);
  private
    { private declarations }
    InTxn:boolean;
  public
    { public declarations }
  end;

var
  CtrlAcctForm: TCtrlAcctForm;

implementation

uses Main, BrModal;

{$R *.DFM}

procedure TCtrlAcctForm.PostBtnClick(Sender: TObject);
begin
  CtrlAcct.Post;
end;

procedure TCtrlAcctForm.CancelBtnClick(Sender: TObject);
begin
  CtrlAcct.Cancel;
end;

procedure TCtrlAcctForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCtrlAcctForm.CtrlAcctSourceStateChange(Sender: TObject);
begin
{  PostBtn.Enabled := CtrlAcct.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;}
  CloseBitBtn.Enabled := CtrlAcct.State = dsBrowse;
end;

procedure TCtrlAcctForm.FormShow(Sender: TObject);
begin
  CtrlAcct.Open;
  RMTxnDetCategory.Open;
  CtrlAcct.Refresh;
  RMTxnDetCategory.Refresh;
  InTxn:=false;
  TxnDetPageControl.ActivePage:=CtrlAcctTabSheet;
  DBNavigator.DataSource:=CtrlAcctSource;
end;

procedure TCtrlAcctForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if CtrlAcct.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  CtrlAcct.Close;
  RMTxnDetCategory.Close;
  CtrlAcctForm.Release;
end;

procedure TCtrlAcctForm.CtrlAcctAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
  InTxn:=false;
{  MainForm.Database.StartTransaction;}
end;

procedure TCtrlAcctForm.CtrlAcctAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
  InTxn:=false;
  {  MainForm.Database.StartTransaction;}
end;

procedure TCtrlAcctForm.CtrlAcctAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  CtrlAcct.Refresh;
  InTxn:=false;
{  MainForm.Database.StartTransaction;}
end;

procedure TCtrlAcctForm.CtrlAcctBeforeCancel(DataSet: TDataset);
begin
  if CtrlAcct.State=dsInsert then
    if MessageDlg('Cancel control account being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TCtrlAcctForm.CtrlAcctBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete control account?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
  InTxn:=true;
end;

procedure TCtrlAcctForm.CtrlAcctBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
  InTxn:=true;
end;

procedure TCtrlAcctForm.CtrlAcctBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
  InTxn:=true;
end;

procedure TCtrlAcctForm.CtrlAcctBeforePost(DataSet: TDataSet);
begin
  CtrlAcctExtAccName.ReadOnly:=false;
  CtrlAcctExtAccName.Value:='WIP'+CtrlAcctAccName.Value;
  CtrlAcctExtAccName.ReadOnly:=true;
end;

procedure TCtrlAcctForm.CtrlAcctDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
  InTxn:=false;
end;

procedure TCtrlAcctForm.TxnDetPageControlChange(Sender: TObject);
begin
  if TxnDetPageControl.ActivePage=CtrlAcctTabSheet then
  begin
    DBNavigator.DataSource:=CtrlAcctSource;
  end;
  if TxnDetPageControl.ActivePage=RMTxnDetCategoryTabSheet then
  begin
    DBNavigator.DataSource:=RMTxnDetCategorySource;
  end;
end;

procedure TCtrlAcctForm.TxnDetPageControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if InTxn then
  begin
    ShowMessage('Post or Cancel before changing page');
    AllowChange:=false;
  end;
end;

procedure TCtrlAcctForm.RMTxnDetCategoryAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  RMTxnDetCategory.Refresh;
  InTxn:=false;
end;

procedure TCtrlAcctForm.RMTxnDetCategoryAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
  InTxn:=false;
end;

procedure TCtrlAcctForm.RMTxnDetCategoryAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;

end;

procedure TCtrlAcctForm.RMTxnDetCategoryBeforeCancel(DataSet: TDataSet);
begin
  if RMTxnDetCategory.State=dsInsert then
    if MessageDlg('Cancel txn det / purchase category being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TCtrlAcctForm.RMTxnDetCategoryBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete category?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
  InTxn:=true;
end;

procedure TCtrlAcctForm.RMTxnDetCategoryBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
  InTxn:=true;
end;

procedure TCtrlAcctForm.RMTxnDetCategoryBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
  InTxn:=true;
end;

procedure TCtrlAcctForm.RMTxnDetCategoryDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
  InTxn:=false;
end;

procedure TCtrlAcctForm.RMTxnDetCategorySourceStateChange(Sender: TObject);
begin
  CloseBitBtn.Enabled := RMTxnDetCategory.State = dsBrowse;
end;

end.