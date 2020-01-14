unit Struloom;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons,
  Mask;

type
  TStruLoomForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    StruLoomSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    VBStruQuery: TQuery;
    LoomTypeQuery: TQuery;
    EditVBDescr: TDBEdit;
    VBStruSource: TDataSource;
    LoomTypeSource: TDataSource;
    EditLTName: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    EditLTShed: TDBEdit;
    Label6: TLabel;
    StruLoom: TTable;
    StruLoomVBSTRU: TStringField;
    StruLoomLOOMTYPE: TStringField;
    StruLoomLOOMEFF: TSmallintField;
    StruLoomPICSPERMIN: TSmallintField;
    PrintSpdBtn: TSpeedButton;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StruLoomAfterCancel(DataSet: TDataset);
    procedure StruLoomAfterDelete(DataSet: TDataset);
    procedure StruLoomAfterPost(DataSet: TDataset);
    procedure StruLoomBeforeEdit(DataSet: TDataset);
    procedure StruLoomBeforeInsert(DataSet: TDataset);
    procedure StruLoomBeforeDelete(DataSet: TDataset);
    procedure StruLoomDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  StruLoomForm: TStruLoomForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs;

procedure TStruLoomForm.CloseBitBtnClick(Sender: TObject);
begin
  if StruLoom.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Structure on Looms before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TStruLoomForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if StruLoom.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  LoomTypeQuery.Close;
  VBStruQuery.Close;
  StruLoom.Close;
  StruLoomForm.Release;
end;

procedure TStruLoomForm.FormShow(Sender: TObject);
begin
  StruLoom.Open;
  StruLoom.Refresh;
  VBStruQuery.Open;
  LoomTypeQuery.Open;
end;

procedure TStruLoomForm.StruLoomAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
end;

procedure TStruLoomForm.StruLoomAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TStruLoomForm.StruLoomAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  VBStruQuery.Close;
  LoomTypeQuery.Close;
  StruLoom.Close;
  StruLoom.Open;
  LoomTypeQuery.Open;
  VBStruQuery.Open;}
end;

procedure TStruLoomForm.StruLoomBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TStruLoomForm.StruLoomBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TStruLoomForm.StruLoomBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TStruLoomForm.StruLoomDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.RollBack;
end;

procedure TStruLoomForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.