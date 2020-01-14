unit Vbynstru;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons;

type
  TVBYnStruForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    YarnStruSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    YarnStru: TTable;
    YarnStruYNSTRU: TStringField;
    YarnStruDESCR: TStringField;
    YarnStruLABELDESCR: TStringField;
    YarnStruYNTWIST: TStringField;
    YarnStruYNCOUNT: TSmallintField;
    YarnStruPLY: TSmallintField;
    PrintSpdBtn: TSpeedButton;
    procedure YarnStruAfterCancel(DataSet: TDataset);
    procedure YarnStruAfterDelete(DataSet: TDataset);
    procedure YarnStruAfterPost(DataSet: TDataset);
    procedure YarnStruBeforeEdit(DataSet: TDataset);
    procedure YarnStruBeforeInsert(DataSet: TDataset);
    procedure YarnStruBeforeDelete(DataSet: TDataset);
    procedure YarnStruNewRecord(DataSet: TDataset);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure YarnStruDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  VBYnStruForm: TVBYnStruForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs;

procedure TVBYnStruForm.YarnStruAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  YarnStru.Refresh;
end;

procedure TVBYnStruForm.YarnStruAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBYnStruForm.YarnStruAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBYnStruForm.YarnStruBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYnStruForm.YarnStruBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYnStruForm.YarnStruBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYnStruForm.YarnStruNewRecord(DataSet: TDataset);
begin
{  YarnLotNoQueryDateRcvd.ReadOnly:=false;
  YarnLotNoQueryDateRcvd.Value:=date;
  YarnLotNoQueryDateRcvd.ReadOnly:=true;
  YarnLotNoQueryRcvdBy.ReadOnly:=false;
  YarnLotNoQueryRcvdBy.Value:=UserInitials;
  YarnLotNoQueryRcvdBy.ReadOnly:=true;}
end;

procedure TVBYnStruForm.CloseBitBtnClick(Sender: TObject);
begin
  if YarnStru.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post yarn structures before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBYnStruForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if YarnStru.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  YarnStru.Close;
  VBYnStruForm.Release;
end;

procedure TVBYnStruForm.FormShow(Sender: TObject);
begin
  YarnStru.Open;
  YarnStru.Refresh;
end;

procedure TVBYnStruForm.YarnStruDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBYnStruForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
