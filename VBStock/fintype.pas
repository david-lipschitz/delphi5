unit fintype;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ExtCtrls, DBTables;

type
  TVBFinTypeForm = class(TForm)
    VBFin: TTable;
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    bitClose: TBitBtn;
    DBGrid1: TDBGrid;
    FinTypeSource: TDataSource;
    VBFinVBFIN: TStringField;
    VBFinDESCRIPTION: TStringField;
    PrintSpdBtn: TSpeedButton;
    procedure bitCloseClick(Sender: TObject);
    procedure VBFinAfterCancel(DataSet: TDataSet);
    procedure VBFinAfterDelete(DataSet: TDataSet);
    procedure VBFinAfterPost(DataSet: TDataSet);
    procedure VBFinBeforeCancel(DataSet: TDataSet);
    procedure VBFinBeforeDelete(DataSet: TDataSet);
    procedure VBFinBeforeEdit(DataSet: TDataSet);
    procedure VBFinBeforeInsert(DataSet: TDataSet);
    procedure VBFinDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VBFinTypeForm: TVBFinTypeForm;

implementation

{$R *.DFM}

uses VBMain;

procedure TVBFinTypeForm.bitCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TVBFinTypeForm.VBFinAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  VBFin.Refresh;
end;

procedure TVBFinTypeForm.VBFinAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TVBFinTypeForm.VBFinAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TVBFinTypeForm.VBFinBeforeCancel(DataSet: TDataSet);
begin
  if VBFin.State=dsInsert then
    if MessageDlg('Cancel finish type being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TVBFinTypeForm.VBFinBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete finish type?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TVBFinTypeForm.VBFinBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBFinTypeForm.VBFinBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBFinTypeForm.VBFinDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBFinTypeForm.FormShow(Sender: TObject);
begin
  VBFin.Open;
end;

procedure TVBFinTypeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  VBFin.Close;
  VBFinTypeForm.Release;
end;

procedure TVBFinTypeForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
