unit Warpcol;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons,
  Mask;

type
  TWarpColForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    WarpColSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    WarpTypeQuery: TQuery;
    WarpTypeSource: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    EditWarp1Stru: TDBEdit;
    EditWarp1Twist: TDBEdit;
    WarpCol: TTable;
    WarpColWARPTYPE: TStringField;
    WarpColWARPCOL: TStringField;
    WarpColYNSTRU1: TStringField;
    WarpColYNTWIST1: TStringField;
    WarpColYNCOL1: TStringField;
    PrintSpdBtn: TSpeedButton;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure WarpColAfterCancel(DataSet: TDataset);
    procedure WarpColAfterDelete(DataSet: TDataset);
    procedure WarpColAfterPost(DataSet: TDataset);
    procedure WarpColBeforeEdit(DataSet: TDataset);
    procedure WarpColBeforeInsert(DataSet: TDataset);
    procedure WarpColBeforeDelete(DataSet: TDataset);
    procedure WarpColDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  WarpColForm: TWarpColForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs;

procedure TWarpColForm.CloseBitBtnClick(Sender: TObject);
begin
  if WarpCol.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Warp Colours before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TWarpColForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if WarpCol.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  WarpTypeQuery.Close;
  WarpCol.Close;
  WarpColForm.Release;
end;

procedure TWarpColForm.FormShow(Sender: TObject);
begin
  WarpCol.Open;
  WarpCol.Refresh;
  WarpTypeQuery.Open;
end;

procedure TWarpColForm.WarpColAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  WarpCol.Refresh;
end;

procedure TWarpColForm.WarpColAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TWarpColForm.WarpColAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  WarpCol.Close;
  WarpCol.Open;
  WarpTypeQuery.Close;
  WarpTypeQuery.Open;}
end;

procedure TWarpColForm.WarpColBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWarpColForm.WarpColBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWarpColForm.WarpColBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWarpColForm.WarpColDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TWarpColForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
