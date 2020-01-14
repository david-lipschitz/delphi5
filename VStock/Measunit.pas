unit Measunit;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, ExtCtrls,
  Dialogs;

type
  TMeasUnitForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    MeasUnitSource: TDataSource;
    Panel2: TPanel;
    MeasUnit: TTable;
    MeasUnitUNITREF: TStringField;
    BitBtn1: TBitBtn;
    MeasUnitDESCR: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MeasUnitAfterPost(DataSet: TDataset);
    procedure MeasUnitAfterDelete(DataSet: TDataset);
    procedure MeasUnitAfterCancel(DataSet: TDataset);
    procedure MeasUnitBeforeCancel(DataSet: TDataSet);
    procedure MeasUnitBeforeDelete(DataSet: TDataSet);
    procedure MeasUnitBeforeEdit(DataSet: TDataSet);
    procedure MeasUnitBeforeInsert(DataSet: TDataSet);
    procedure MeasUnitPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure MeasUnitDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  MeasUnitForm: TMeasUnitForm;

implementation

uses Main;

{$R *.DFM}

procedure TMeasUnitForm.FormCreate(Sender: TObject);
begin
{  MeasUnit.Open;}
end;

procedure TMeasUnitForm.BitBtn1Click(Sender: TObject);
begin
  if MeasUnit.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post measurement units before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TMeasUnitForm.FormShow(Sender: TObject);
begin
  MeasUnit.Open;
{  MainForm.Database.StartTransaction;}
  MeasUnit.Refresh;
end;

procedure TMeasUnitForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if MeasUnit.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  MeasUnit.Close;
  MeasUnitForm.Release;
end;

procedure TMeasUnitForm.MeasUnitAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TMeasUnitForm.MeasUnitAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TMeasUnitForm.MeasUnitAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  MeasUnit.Refresh;
{  MainForm.Database.StartTransaction;}
end;

{initialization
  MeasUnitForm:=TMeasUnitForm.Create(Application);}

procedure TMeasUnitForm.MeasUnitBeforeCancel(DataSet: TDataSet);
begin
  if MeasUnit.State=dsInsert then
    if MessageDlg('Cancel measurement unit being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TMeasUnitForm.MeasUnitBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete measurement unit?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TMeasUnitForm.MeasUnitBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TMeasUnitForm.MeasUnitBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TMeasUnitForm.MeasUnitPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
{  MainForm.Database.Rollback;}
end;

procedure TMeasUnitForm.MeasUnitDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

end.