unit Loomtype;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons;

type
  TLoomTypeForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    LoomTypeSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    LoomType: TTable;
    LoomTypeLOOMTYPE: TStringField;
    LoomTypeNAME: TStringField;
    LoomTypeSHED: TStringField;
    LoomTypeWIDTH: TIntegerField;
    LoomTypeMAXCOL: TSmallintField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LoomTypeAfterCancel(DataSet: TDataset);
    procedure LoomTypeAfterDelete(DataSet: TDataset);
    procedure LoomTypeAfterPost(DataSet: TDataset);
    procedure LoomTypeBeforeEdit(DataSet: TDataset);
    procedure LoomTypeBeforeInsert(DataSet: TDataset);
    procedure LoomTypeBeforeDelete(DataSet: TDataset);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure LoomTypeDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  LoomTypeForm: TLoomTypeForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs;

procedure TLoomTypeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if LoomType.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  LoomType.Close;
  LoomTypeForm.Release;
end;

procedure TLoomTypeForm.FormShow(Sender: TObject);
begin
  LoomType.Open;
end;

procedure TLoomTypeForm.LoomTypeAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  LoomType.Refresh;
end;

procedure TLoomTypeForm.LoomTypeAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TLoomTypeForm.LoomTypeAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TLoomTypeForm.LoomTypeBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TLoomTypeForm.LoomTypeBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TLoomTypeForm.LoomTypeBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TLoomTypeForm.CloseBitBtnClick(Sender: TObject);
begin
  if LoomType.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post loom types before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TLoomTypeForm.LoomTypeDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

end.
