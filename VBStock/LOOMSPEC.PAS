unit Loomspec;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, ExtCtrls,
  Mask;

type
  TLoomSpecForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    LoomSpecSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    Panel3: TPanel;
    EditName: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LoomTypeQuery: TQuery;
    LoomTypeSource: TDataSource;
    LoomTypeQueryNAME: TStringField;
    LoomTypeQuerySHED: TStringField;
    LoomTypeQueryWIDTH: TIntegerField;
    LoomTypeQueryMAXCOL: TSmallintField;
    EditShed: TDBEdit;
    EditWidth: TDBEdit;
    EditMaxCol: TDBEdit;
    LoomSpec: TTable;
    LoomSpecLOOMREF: TStringField;
    LoomSpecLOOMPOSN: TSmallintField;
    LoomSpecLOOMTYPE: TStringField;
    LoomSpecLASTSEQNO: TSmallintField;
    LoomSpecLOMDOWNCHK: TStringField;
    PrintSpdBtn: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LoomSpecAfterCancel(DataSet: TDataset);
    procedure LoomSpecAfterDelete(DataSet: TDataset);
    procedure LoomSpecAfterPost(DataSet: TDataset);
    procedure LoomSpecBeforeEdit(DataSet: TDataset);
    procedure LoomSpecBeforeInsert(DataSet: TDataset);
    procedure LoomSpecBeforeDelete(DataSet: TDataset);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure LoomSpecDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure LoomSpecNewRecord(DataSet: TDataSet);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  LoomSpecForm: TLoomSpecForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs;

procedure TLoomSpecForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if LoomSpec.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  LoomTypeQuery.Close;
  LoomSpec.Close;
  LoomSpecForm.Release;
end;

procedure TLoomSpecForm.FormShow(Sender: TObject);
begin
  LoomSpec.Open;
  LoomTypeQuery.Open;
end;

procedure TLoomSpecForm.LoomSpecAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  LoomSpec.Refresh;
end;

procedure TLoomSpecForm.LoomSpecAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TLoomSpecForm.LoomSpecAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  LoomTypeQuery.Close;
  LoomSpec.Close;
  LoomSpec.Open;
  LoomTypeQuery.Open;}
{  LoomTypeQuery.Close;
  LoomTypeQuery.Open;}
end;

procedure TLoomSpecForm.LoomSpecBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TLoomSpecForm.LoomSpecBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TLoomSpecForm.LoomSpecBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TLoomSpecForm.CloseBitBtnClick(Sender: TObject);
begin
  if LoomSpec.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post loom specs before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TLoomSpecForm.LoomSpecDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TLoomSpecForm.LoomSpecNewRecord(DataSet: TDataSet);
begin
  LoomSpecLastSeqNo.ReadOnly:=false;
  LoomSpecLastSeqNo.Value:=0;
  LoomSpecLastSeqNo.ReadOnly:=true;
  LoomSpecLomDownChk.ReadOnly:=false;
  LoomSpecLomDownChk.Value:='N';
  LoomSpecLomDownChk.ReadOnly:=true;
end;

procedure TLoomSpecForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
