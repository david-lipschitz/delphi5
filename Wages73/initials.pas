unit initials;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Dialogs,
  Buttons;

type
  TfrmInitials = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    datInitials: TDataSource;
    Panel2: TPanel;
    tabInitials: TTable;
    tabInitialsINITIALS: TStringField;
    tabInitialsSURNAME: TStringField;
    tabInitialsFIRSTNAME: TStringField;
    tabInitialsEXT: TSmallintField;
    CloseBitBtn: TBitBtn;
    tabInitialsUSERNAME: TStringField;
    PrintSpdBtn: TSpeedButton;
    procedure CloseBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tabInitialsAfterPost(DataSet: TDataset);
    procedure tabInitialsAfterCancel(DataSet: TDataset);
    procedure tabInitialsAfterDelete(DataSet: TDataset);
    procedure tabInitialsBeforeEdit(DataSet: TDataSet);
    procedure tabInitialsBeforeInsert(DataSet: TDataSet);
    procedure tabInitialsDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tabInitialsBeforeDelete(DataSet: TDataSet);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmInitials: TfrmInitials;

implementation

uses Main;

{$R *.DFM}

procedure TfrmInitials.CloseBtnClick(Sender: TObject);
begin
  if tabInitials.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post initials before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TfrmInitials.CloseBitBtnClick(Sender: TObject);
begin
  if tabInitials.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post initials before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TfrmInitials.FormShow(Sender: TObject);
begin
  tabInitials.Open;
  tabInitials.Refresh;
end;

procedure TfrmInitials.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tabInitials.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  tabInitials.Close;
  Release;
end;

procedure TfrmInitials.tabInitialsAfterPost(DataSet: TDataset);
begin
  frmMain.Database.Commit;
end;

procedure TfrmInitials.tabInitialsAfterCancel(DataSet: TDataset);
begin
  frmMain.Database.Rollback;
  tabInitials.Refresh;
end;

procedure TfrmInitials.tabInitialsAfterDelete(DataSet: TDataset);
begin
  frmMain.Database.Commit;
end;

procedure TfrmInitials.tabInitialsBeforeEdit(DataSet: TDataSet);
begin
  frmMain.Database.StartTransaction;
end;

procedure TfrmInitials.tabInitialsBeforeInsert(DataSet: TDataSet);
begin
  frmMain.Database.StartTransaction;
end;

procedure TfrmInitials.tabInitialsDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  frmMain.Database.Rollback;
end;

procedure TfrmInitials.tabInitialsBeforeDelete(DataSet: TDataSet);
begin
  frmMain.Database.StartTransaction;
end;

procedure TfrmInitials.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
