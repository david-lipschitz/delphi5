unit Vbynlot;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons;

type
  TVBYarnLotForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    YarnLotNoSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    YarnLotNo: TTable;
    YarnLotNoLOTNO1: TIntegerField;
    YarnLotNoLOTNO2: TSmallintField;
    YarnLotNoYNCOL: TStringField;
    YarnLotNoDATEMANU: TDateTimeField;
    YarnLotNoDATERCVD: TDateTimeField;
    YarnLotNoRCVDBY: TStringField;
    PrintSpdBtn: TSpeedButton;
    Label1: TLabel;
    EditLotNo: TEdit;
    qryCheckExists: TQuery;
    qryCheckExistsYNCOL: TStringField;
    procedure YarnLotNoAfterCancel(DataSet: TDataset);
    procedure YarnLotNoAfterDelete(DataSet: TDataset);
    procedure YarnLotNoAfterPost(DataSet: TDataset);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure YarnLotNoBeforeEdit(DataSet: TDataset);
    procedure YarnLotNoBeforeInsert(DataSet: TDataset);
    procedure YarnLotNoBeforeDelete(DataSet: TDataset);
    procedure YarnLotNoNewRecord(DataSet: TDataset);
    procedure YarnLotNoDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure EditLotNoChange(Sender: TObject);
    procedure YarnLotNoBeforePost(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  VBYarnLotForm: TVBYarnLotForm;

implementation

uses VBMain,Dialogs;

{$R *.DFM}

procedure TVBYarnLotForm.YarnLotNoAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  YarnLotNo.Refresh;
end;

procedure TVBYarnLotForm.YarnLotNoAfterDelete(DataSet: TDataset);
{var
  MyBookmark: TBookmark;}
begin
  MainForm.Database.Commit;
{  MyBookmark := YarnLotNoQuery.GetBookmark;
  YarnLotNoQuery.Close;
  YarnLotNoQuery.Open;
  YarnLotNoQuery.GotoBookmark(MyBookmark);
  YarnLotNoQuery.FreeBookmark(MyBookmark);}
end;

procedure TVBYarnLotForm.YarnLotNoAfterPost(DataSet: TDataset);
{var
  MyBookmark: TBookmark;}
begin
  MainForm.Database.Commit;
{  MyBookmark := YarnLotNoQuery.GetBookmark;
  YarnLotNoQuery.Close;
  YarnLotNoQuery.Open;
  YarnLotNoQuery.GotoBookmark(MyBookmark);
  YarnLotNoQuery.FreeBookmark(MyBookmark);}
end;

procedure TVBYarnLotForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if YarnLotNo.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  YarnLotNo.Close;
  qryCheckExists.Close;
  VBYarnLotForm.Release;
end;

procedure TVBYarnLotForm.FormShow(Sender: TObject);
begin
  YarnLotNo.Open;
  EditLotNo.SetFocus;
end;

procedure TVBYarnLotForm.CloseBitBtnClick(Sender: TObject);
begin
  if YarnLotNo.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post yarn lots before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBYarnLotForm.YarnLotNoBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYarnLotForm.YarnLotNoBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYarnLotForm.YarnLotNoBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYarnLotForm.YarnLotNoNewRecord(DataSet: TDataset);
begin
  YarnLotNoDateRcvd.ReadOnly:=false;
  YarnLotNoDateRcvd.Value:=date;
  YarnLotNoDateRcvd.ReadOnly:=true;
  YarnLotNoRcvdBy.ReadOnly:=false;
  YarnLotNoRcvdBy.Value:=UserInitials;
  YarnLotNoRcvdBy.ReadOnly:=true;
  YarnLotNoDateManu.Value:=YarnLotNoDateRcvd.Value;
end;

procedure TVBYarnLotForm.YarnLotNoDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBYarnLotForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TVBYarnLotForm.EditLotNoChange(Sender: TObject);
begin
  if EditLotNo.Text='' then
    YarnLotNo.Filtered:=false
  else
  begin
    YarnLotNo.Filter:='lotno1>='+EditLotNo.Text;
    YarnLotNo.Filtered:=true;
  end;
end;

procedure TVBYarnLotForm.YarnLotNoBeforePost(DataSet: TDataSet);
begin
  qryCheckExists.Close;
  qryCheckExists.ParamByName('LotNo1').AsInteger:=YarnLotNoLOTNO1.AsInteger;
  qryCheckExists.ParamByName('YnCol').AsString:=YarnLotNoYNCOL.AsString;
  qryCheckExists.Open;
  if not qryCheckExistsYNCOL.IsNull then
    raise Exception.Create('Cannot post as lot no already exists for colour '+
      qryCheckExistsYNCOL.AsString);
end;

end.
