unit Vbinitls;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Dialogs,
  Buttons;

type
  TVBInitlsForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    InitialsSource: TDataSource;
    Panel2: TPanel;
    Initials: TTable;
    InitialsINITIALS: TStringField;
    InitialsSURNAME: TStringField;
    InitialsFIRSTNAME: TStringField;
    InitialsEXT: TSmallintField;
    CloseBitBtn: TBitBtn;
    InitialsUSERNAME: TStringField;
    PrintSpdBtn: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InitialsAfterPost(DataSet: TDataset);
    procedure InitialsAfterCancel(DataSet: TDataset);
    procedure InitialsAfterDelete(DataSet: TDataset);
    procedure InitialsBeforeEdit(DataSet: TDataSet);
    procedure InitialsBeforeInsert(DataSet: TDataSet);
    procedure InitialsDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure InitialsBeforeDelete(DataSet: TDataSet);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  VBInitlsForm: TVBInitlsForm;

implementation

uses VBMain;

{$R *.DFM}

procedure TVBInitlsForm.FormCreate(Sender: TObject);
begin
{  Initials.Open;}
end;

procedure TVBInitlsForm.CloseBtnClick(Sender: TObject);
begin
  if Initials.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post initials before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBInitlsForm.CloseBitBtnClick(Sender: TObject);
begin
  if Initials.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post initials before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBInitlsForm.FormShow(Sender: TObject);
begin
  Initials.Open;
{  MainForm.Database.StartTransaction;}
  Initials.Refresh;
end;

procedure TVBInitlsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Initials.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  Initials.Close;
  VBInitlsForm.Release;
end;

procedure TVBInitlsForm.InitialsAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TVBInitlsForm.InitialsAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  Initials.Refresh;
{  MainForm.Database.StartTransaction;}
end;

procedure TVBInitlsForm.InitialsAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TVBInitlsForm.InitialsBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBInitlsForm.InitialsBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBInitlsForm.InitialsDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBInitlsForm.InitialsBeforeDelete(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBInitlsForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
