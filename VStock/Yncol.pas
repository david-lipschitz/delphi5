unit Yncol;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Buttons, DBTables, Mask, ExtCtrls,
  Dialogs, Grids, DBGrids;

type
  TYarnColForm = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditYNCOL: TDBEdit;
    Label2: TLabel;
    EditDESCR: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    YarnColSource: TDataSource;
    Panel2: TPanel;
    YarnCol: TTable;
    PostBtn: TButton;
    CancelBtn: TButton;
    CloseBitBtn: TBitBtn;
    YarnColYNCOL: TStringField;
    YarnColDESCR: TStringField;
    YnColSearchSpdBtn: TSpeedButton;
    Label3: TLabel;
    YnColWBS: TTable;
    YnColWBSSource: TDataSource;
    DBGrid1: TDBGrid;
    YnColWBSYNCOL: TStringField;
    YnColWBSFIBRE: TStringField;
    YnColWBSNUMENDS: TSmallintField;
    ActiveSource: TDataSource;
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure YarnColSourceStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure YarnColAfterPost(DataSet: TDataset);
    procedure YarnColAfterDelete(DataSet: TDataset);
    procedure YarnColAfterCancel(DataSet: TDataset);
    procedure YarnColBeforeCancel(DataSet: TDataset);
    procedure YarnColBeforeDelete(DataSet: TDataset);
    procedure YnColSearchSpdBtnClick(Sender: TObject);
    procedure YarnColBeforeEdit(DataSet: TDataSet);
    procedure YarnColBeforeInsert(DataSet: TDataSet);
    procedure YnColWBSBeforeInsert(DataSet: TDataSet);
    procedure YnColWBSNewRecord(DataSet: TDataSet);
    procedure YnColWBSBeforeDelete(DataSet: TDataSet);
    procedure YnColWBSBeforeEdit(DataSet: TDataSet);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure YarnColDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
    NoCommit:boolean;
    InTxn:boolean; {added DL250897}
  public
    { public declarations }
  end;

var
  YarnColForm: TYarnColForm;

implementation

uses Main, BrModal;

{$R *.DFM}

procedure TYarnColForm.PostBtnClick(Sender: TObject);
begin
  YarnCol.Post;
end;

procedure TYarnColForm.CancelBtnClick(Sender: TObject);
begin
  YarnCol.Cancel;
end;

procedure TYarnColForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TYarnColForm.YarnColSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := YarnCol.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := YarnCol.State = dsBrowse;
end;

procedure TYarnColForm.FormShow(Sender: TObject);
begin
  YarnCol.Open;
{  MainForm.Database.StartTransaction;}
  YarnCol.Refresh;
  InTxn:=false;
  NoCommit:=false;
  YnColWBS.Open;
  YnColWBS.Refresh;
end;

procedure TYarnColForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if YarnCol.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  YnColWBS.Close;
  YarnCol.Close;
  YarnColForm.Release;
end;

procedure TYarnColForm.YarnColAfterPost(DataSet: TDataset);
begin
  if not NoCommit then
  begin
    MainForm.Database.Commit;
    InTxn:=false;
  end;
end;

procedure TYarnColForm.YarnColAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TYarnColForm.YarnColAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  InTxn:=false;
  YarnCol.Refresh;
  YnColWBS.Refresh;
end;

procedure TYarnColForm.YarnColBeforeCancel(DataSet: TDataset);
begin
  if YarnCol.State=dsInsert then
    if MessageDlg('Cancel yarn colour being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TYarnColForm.YarnColBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete yarn colour (first delete WBS)?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TYarnColForm.YnColSearchSpdBtnClick(Sender: TObject);
begin
  if YarnCol.State in [dsEdit,dsInsert] then
    ShowMessage('Cannot search when in Edit or Insert mode')
  else
  begin
    if PickDlgForm.ShowModalYarnCol = mrOk then
    begin
      YarnCol.SetKey;
      YarnCol.FieldByName('YnCol').AsString:=PickDlgForm.YarnCol;
      YarnCol.GotoKey;
    end;
  end;
end;

procedure TYarnColForm.YarnColBeforeEdit(DataSet: TDataSet);
begin
  if not InTxn then
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TYarnColForm.YarnColBeforeInsert(DataSet: TDataSet);
begin
  if InTxn then
    raise Exception.Create('Post before inserting')
  else
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TYarnColForm.YnColWBSBeforeInsert(DataSet: TDataSet);
begin
  if YarnCol.State = dsInsert then
  begin
    NoCommit:=true;
    YarnCol.Post;
    YarnCol.Edit;
    NoCommit:=false;
  end
  else
    YarnCol.Edit;
end;

procedure TYarnColForm.YnColWBSNewRecord(DataSet: TDataSet);
begin
  YnColWBSYnCol.Value:=YarnColYnCol.Value;
end;

procedure TYarnColForm.YnColWBSBeforeDelete(DataSet: TDataSet);
begin
  YarnCol.Edit;
end;

procedure TYarnColForm.YnColWBSBeforeEdit(DataSet: TDataSet);
begin
  YarnCol.Edit;
end;

procedure TYarnColForm.DBGrid1Enter(Sender: TObject);
begin
  ActiveSource.Dataset := YnColWBS;
end;

procedure TYarnColForm.DBGrid1Exit(Sender: TObject);
begin
  ActiveSource.Dataset := YarnCol;
end;

procedure TYarnColForm.YarnColDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

end.
