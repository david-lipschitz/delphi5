unit Yntype;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, DBLookup, Mask, ExtCtrls, Buttons,
  Dialogs, ComCtrls, Grids, DBGrids;

type
  TYarnTypeForm = class(TForm)
    ScrollBox: TScrollBox;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    YarnTypeSource: TDataSource;
    Panel2: TPanel;
    YarnType: TTable;
    YarnColSource: TDataSource;
    YarnTypeYNSTRU: TStringField;
    YarnTypeYNCOL: TStringField;
    YarnTypeINSTOCK: TFloatField;
    YarnCol: TTable;
    YarnColYNCOL: TStringField;
    YarnColDESCR: TStringField;
    YarnTypeYNTWIST: TStringField;
    YnStruQuery: TQuery;
    YnStruQueryDESCR: TStringField;
    YarnTypeYNTYPE: TStringField;
    YnTypePageControl: TPageControl;
    InfoTabSheet: TTabSheet;
    Label5: TLabel;
    YnTypeSearchSpdBtn: TSpeedButton;
    YnTypeBreakDown: TSpeedButton;
    Label1: TLabel;
    EditYnStru: TDBEdit;
    EditYnTwist: TDBEdit;
    StrucTwistSpdBtn: TSpeedButton;
    ShowStruDescr: TEdit;
    ShowColDescr: TEdit;
    EditYnCol: TDBLookupCombo;
    Label2: TLabel;
    Label4: TLabel;
    edtTxnDetBalance: TDBEdit;
    Label6: TLabel;
    EditYnType: TDBEdit;
    PostBtn: TButton;
    CancelBtn: TButton;
    CloseBitBtn: TBitBtn;
    qryFetchBalance: TQuery;
    qryFetchBalanceQTY: TFloatField;
    datFetchBalance: TDataSource;
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure YarnTypeSourceStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure YarnTypeAfterPost(DataSet: TDataset);
    procedure YarnTypeAfterDelete(DataSet: TDataset);
    procedure YarnTypeAfterCancel(DataSet: TDataset);
    procedure YarnTypeBeforeCancel(DataSet: TDataset);
    procedure YarnTypeBeforeDelete(DataSet: TDataset);
    procedure YnTypeSearchSpdBtnClick(Sender: TObject);
    procedure YarnTypeNewRecord(DataSet: TDataset);
    procedure EditYnStruChange(Sender: TObject);
    procedure EditYnColChange(Sender: TObject);
    procedure StrucTwistSpdBtnClick(Sender: TObject);
    procedure YnTypeBreakDownClick(Sender: TObject);
    procedure EditYnTwistChange(Sender: TObject);
    procedure YarnTypeBeforeEdit(DataSet: TDataSet);
    procedure YarnTypeBeforeInsert(DataSet: TDataSet);
    procedure YarnTypeBeforePost(DataSet: TDataSet);
    procedure YarnTypeDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  YarnTypeForm: TYarnTypeForm;

implementation

uses Main, BrModal;

{$R *.DFM}

procedure TYarnTypeForm.PostBtnClick(Sender: TObject);
begin
  YarnType.Post;
end;

procedure TYarnTypeForm.CancelBtnClick(Sender: TObject);
begin
  YarnType.Cancel;
end;

procedure TYarnTypeForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TYarnTypeForm.YarnTypeSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := YarnType.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := YarnType.State = dsBrowse;
end;

procedure TYarnTypeForm.FormShow(Sender: TObject);
begin
  YarnType.Open;
  YarnCol.Open;
  YarnType.Refresh;
  YarnCol.Refresh;
  qryFetchBalance.Open; //added DL050416
end;

procedure TYarnTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if YarnType.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  qryFetchBalance.Close; //added DL050416
  YarnCol.Close;
  YarnType.Close;
  YarnTypeForm.Release;
end;

procedure TYarnTypeForm.YarnTypeAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{ MainForm.Database.StartTransaction;}
end;

procedure TYarnTypeForm.YarnTypeAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{ MainForm.Database.StartTransaction;}
end;

procedure TYarnTypeForm.YarnTypeAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  YarnType.Refresh;
{ MainForm.Database.StartTransaction;}
end;

procedure TYarnTypeForm.YarnTypeBeforeCancel(DataSet: TDataset);
begin
  if YarnType.State=dsInsert then
    if MessageDlg('Cancel yarn type being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TYarnTypeForm.YarnTypeBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete yarn type?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TYarnTypeForm.YnTypeSearchSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalYarnType{('N')} = mrOk then
  begin
    YarnType.SetKey;
    YarnType.FieldByName('YnStru').AsString:=PickDlgForm.YarnTypeStru;
    YarnType.FieldByName('YnTwist').AsString:=PickDlgForm.YarnTypeYnTwist;
    YarnType.FieldByName('YnCol').AsString:=PickDlgForm.YarnTypeCol;
    YarnType.GotoKey;
{procedure TYarnTypeForm.EditYnStruChange(Sender: TObject);}
    EditYnStruChange(Sender);
  end;
end;

procedure TYarnTypeForm.YarnTypeNewRecord(DataSet: TDataset);
begin
  YarnTypeInstock.ReadOnly:=false;
  YarnTypeInstock.Value:=0;
  YarnTypeInstock.ReadOnly:=true;
{  ShowStruDescr.Text:='';
  ShowColDescr.Text:='';}
end;

procedure TYarnTypeForm.EditYnStruChange(Sender: TObject);
begin
  if (EditYnStru.Text<>'') and (EditYnTwist.Text<>'') then
  begin
    YnStruQuery.Active:=false;
    YnStruQuery.Params[0].AsString:=EditYnStru.Text;
    YnStruQuery.Params[1].AsString:=EditYnTwist.Text;
    YnStruQuery.Active:=true;
    with YnStruQuery.Fields[0] do
      ShowStruDescr.Text:=AsString;
  end
  else
    ShowStruDescr.Clear;
end;

procedure TYarnTypeForm.EditYnColChange(Sender: TObject);
begin
  if EditYnCol.Value<>'' then
    ShowColDescr.Text:=YarnColDescr.AsString
  else
    ShowColDescr.Clear;
end;

procedure TYarnTypeForm.StrucTwistSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalYarnStru = mrOk then
  begin
    YarnType.Edit;
    YarnTypeYnStru.AsString:=PickDlgForm.YarnStru;
    YarnTypeYnTwist.AsString:=PickDlgForm.YnTwist;
  end;
end;

procedure TYarnTypeForm.YnTypeBreakDownClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalYarnTypeBreakDown = mrOk then
  begin
    YarnType.SetKey;
    YarnType.FieldByName('YnStru').AsString:=PickDlgForm.YarnTypeBDStru;
    YarnType.FieldByName('YnTwist').AsString:=PickDlgForm.YarnTypeBDYnTwist;
    YarnType.FieldByName('YnCol').AsString:=PickDlgForm.YarnTypeBDCol;
    YarnType.GotoKey;
{procedure TYarnTypeForm.EditYnStruChange(Sender: TObject);}
    EditYnStruChange(Sender);
  end;
end;

procedure TYarnTypeForm.EditYnTwistChange(Sender: TObject);
begin
  EditYnStruChange(Sender);
end;

procedure TYarnTypeForm.YarnTypeBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TYarnTypeForm.YarnTypeBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TYarnTypeForm.YarnTypeBeforePost(DataSet: TDataSet);
var
  YnTwist:string[2];
  YnCol:string[3];
begin
  if length(EditYnTwist.Text)=2 then
    YnTwist:=EditYnTwist.Text
  else
    YnTwist:='0'+EditYnTwist.Text;
  if length(EditYnCol.Text)=3 then
    YnCol:=EditYnCol.Text
  else
    if length(EditYnCol.Text)=2 then
      YnCol:='0'+EditYnCol.Text
    else
      YnCol:='00'+EditYnCol.Text;
  YarnTypeYnType.ReadOnly:=false;
  YarnTypeYnType.Value:=EditYnStru.Text+YnTwist+YnCol;
  YarnTypeYnType.ReadOnly:=true;  
end;

procedure TYarnTypeForm.YarnTypeDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

end.
