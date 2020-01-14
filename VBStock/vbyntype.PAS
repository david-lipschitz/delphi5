unit Vbyntype;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons;

type
  TVBYnTypeForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    YarnTypeSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    YarnType: TTable;
    YarnTypeYNSTRU: TStringField;
    YarnTypeYNCOL: TStringField;
    YarnTypeYNTWIST: TStringField;
    YarnTypeINSTOCK: TFloatField;
    YarnTypeWEAVEWIP: TFloatField;
    YarnTypeMODDATE: TDateTimeField;
    YarnTypeYNTYPE: TStringField;
    PrintSpdBtn: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure YarnTypeAfterCancel(DataSet: TDataset);
    procedure YarnTypeAfterDelete(DataSet: TDataset);
    procedure YarnTypeAfterPost(DataSet: TDataset);
    procedure YarnTypeBeforeEdit(DataSet: TDataset);
    procedure YarnTypeBeforeInsert(DataSet: TDataset);
    procedure YarnTypeBeforeDelete(DataSet: TDataset);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure YarnTypeDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure YarnTypeNewRecord(DataSet: TDataSet);
    procedure YarnTypeBeforePost(DataSet: TDataSet);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  VBYnTypeForm: TVBYnTypeForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs;

procedure TVBYnTypeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if YarnType.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  YarnType.Close;
  VBYnTypeForm.Release;
end;

procedure TVBYnTypeForm.FormShow(Sender: TObject);
begin
  YarnType.Open;
  YarnType.Refresh;
end;

procedure TVBYnTypeForm.YarnTypeAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  YarnType.Refresh;
end;

procedure TVBYnTypeForm.YarnTypeAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBYnTypeForm.YarnTypeAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBYnTypeForm.YarnTypeBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYnTypeForm.YarnTypeBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYnTypeForm.YarnTypeBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYnTypeForm.CloseBitBtnClick(Sender: TObject);
begin
  if YarnType.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post yarn types before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBYnTypeForm.YarnTypeDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBYnTypeForm.YarnTypeNewRecord(DataSet: TDataSet);
begin
  YarnTypeInStock.ReadOnly:=false;
  YarnTypeWeaveWip.ReadOnly:=false;
  YarnTypeInStock.Value:=0;
  YarnTypeWeaveWip.Value:=0;
  YarnTypeInStock.ReadOnly:=true;
  YarnTypeWeaveWip.ReadOnly:=true;
  YarnTypeModDate.Value:=date;
end;

procedure TVBYnTypeForm.YarnTypeBeforePost(DataSet: TDataSet);
var
  YnTwist:string[2];
  YnCol:string[3];
begin
  YarnTypeModDate.Value:=date;
  if length(YarnTypeYnTwist.AsString)=2 then
    YnTwist:=YarnTypeYnTwist.AsString
  else
    YnTwist:='0'+YarnTypeYnTwist.AsString;
  if length(YarnTypeYnCol.AsString)=3 then
    YnCol:=YarnTypeYnCol.AsString
  else
    if length(YarnTypeYnCol.AsString)=2 then
      YnCol:='0'+YarnTypeYnCol.AsString
    else
      YnCol:='00'+YarnTypeYnCol.AsString;
  YarnTypeYnType.ReadOnly:=false;
  YarnTypeYnType.Value:=YarnTypeYnStru.AsString+YnTwist+YnCol;
  YarnTypeYnType.ReadOnly:=true;
end;

procedure TVBYnTypeForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
