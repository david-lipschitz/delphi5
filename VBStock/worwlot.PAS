unit Worwlot;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons;

type
  TWorWLotNoForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    WorWLotNoSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    WorWLotNo: TTable;
    WorWLotNoLOTNOREF1: TIntegerField;
    WorWLotNoLOTNOREF2: TSmallintField;
    WorWLotNoSINGLEMULTIPLE: TStringField;
    WorWLotNoW1LOTNO1: TIntegerField;
    WorWLotNoW1LOTNO2: TSmallintField;
    WorWLotNoW1YNCOL: TStringField;
    WorWLotNoW2LOTNO1: TIntegerField;
    WorWLotNoW2LOTNO2: TSmallintField;
    WorWLotNoW2YNCOL: TStringField;
    WorWLotNoW3LOTNO1: TIntegerField;
    WorWLotNoW3LOTNO2: TSmallintField;
    WorWLotNoW3YNCOL: TStringField;
    WorWLotNoW4LOTNO1: TIntegerField;
    WorWLotNoW4LOTNO2: TSmallintField;
    WorWLotNoW4YNCOL: TStringField;
    WorWLotNoDATERCVD: TDateTimeField;
    WorWLotNoRCVDBY: TStringField;
    PrintSpdBtn: TSpeedButton;
    Label1: TLabel;
    EditLotNo: TEdit;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure WorWLotNoAfterCancel(DataSet: TDataset);
    procedure WorWLotNoAfterDelete(DataSet: TDataset);
    procedure WorWLotNoAfterPost(DataSet: TDataset);
    procedure WorWLotNoBeforeEdit(DataSet: TDataset);
    procedure WorWLotNoBeforeInsert(DataSet: TDataset);
    procedure WorWLotNoBeforeDelete(DataSet: TDataset);
    procedure WorWLotNoNewRecord(DataSet: TDataset);
    procedure WorWLotNoDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure EditLotNoChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  WorWLotNoForm: TWorWLotNoForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs;

procedure TWorWLotNoForm.CloseBitBtnClick(Sender: TObject);
begin
  if WorWLotNo.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Warp or Weft Lot No before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TWorWLotNoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if WorWLotNo.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  WorWLotNo.Close;
  WorWLotNoForm.Release;
end;

procedure TWorWLotNoForm.FormShow(Sender: TObject);
begin
  WorWLotNo.Open;
  EditLotNo.SetFocus;
end;

procedure TWorWLotNoForm.WorWLotNoAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  WorWLotNo.Refresh;
end;

procedure TWorWLotNoForm.WorWLotNoAfterDelete(DataSet: TDataset);
{var
  MyBookmark: TBookmark;}
begin
  MainForm.Database.Commit;
{  MyBookmark := WorWLotNo.GetBookmark;
  WorWLotNo.Close;
  WorWLotNo.Open;
  WorWLotNo.GotoBookmark(MyBookmark);
  WorWLotNo.FreeBookmark(MyBookmark);}
end;

procedure TWorWLotNoForm.WorWLotNoAfterPost(DataSet: TDataset);
{var
  MyBookmark: TBookmark;}
begin
  MainForm.Database.Commit;
{  MyBookmark := WorWLotNo.GetBookmark;
  WorWLotNo.Close;
  WorWLotNo.Open;
  WorWLotNo.GotoBookmark(MyBookmark);
  WorWLotNo.FreeBookmark(MyBookmark);}
end;

procedure TWorWLotNoForm.WorWLotNoBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWorWLotNoForm.WorWLotNoBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWorWLotNoForm.WorWLotNoBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWorWLotNoForm.WorWLotNoNewRecord(DataSet: TDataset);
begin
  WorWLotNoW2LotNo1.Value:=0;
  WorWLotNoW2LotNo2.Value:=0;
  WorWLotNoW2YnCol.Value:='XXX';
  WorWLotNoW3LotNo1.Value:=0;
  WorWLotNoW3LotNo2.Value:=0;
  WorWLotNoW3YnCol.Value:='XXX';
  WorWLotNoW4LotNo1.Value:=0;
  WorWLotNoW4LotNo2.Value:=0;
  WorWLotNoW4YnCol.Value:='XXX';
  WorWLotNoDateRcvd.ReadOnly:=false;
  WorWLotNoRcvdBy.ReadOnly:=false;
  WorWLotNoDateRcvd.Value:=date;
  WorWLotNoRcvdBy.Value:=UserInitials;
  WorWLotNoDateRcvd.ReadOnly:=true;
  WorWLotNoRcvdBy.ReadOnly:=true;
end;

procedure TWorWLotNoForm.WorWLotNoDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.RollBack;
end;

procedure TWorWLotNoForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TWorWLotNoForm.EditLotNoChange(Sender: TObject);
begin
  if EditLotNo.Text='' then
    WorWLotNo.Filtered:=false
  else
  begin
    WorWLotNo.Filter:='lotnoref1>='+EditLotNo.Text;
    WorWLotNo.Filtered:=true;
  end;
end;

end.