unit Terms;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons,
  Dialogs;

type
  TTermsForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    TermsSource: TDataSource;
    Panel2: TPanel;
    Terms: TTable;
    TermsTERMS: TStringField;
    CloseBitBtn: TBitBtn;
    TermsDESCR: TStringField;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TermsAfterPost(DataSet: TDataset);
    procedure TermsAfterCancel(DataSet: TDataset);
    procedure TermsAfterDelete(DataSet: TDataset);
    procedure TermsBeforeCancel(DataSet: TDataSet);
    procedure TermsBeforeDelete(DataSet: TDataSet);
    procedure TermsBeforeEdit(DataSet: TDataSet);
    procedure TermsBeforeInsert(DataSet: TDataSet);
    procedure TermsDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  TermsForm: TTermsForm;

implementation

uses Main;

{$R *.DFM}

procedure TTermsForm.CloseBitBtnClick(Sender: TObject);
begin
  if Terms.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post terms before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TTermsForm.FormShow(Sender: TObject);
begin
  Terms.Open;
{  MainForm.Database.StartTransaction;}
  Terms.Refresh;
end;

procedure TTermsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Terms.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  Terms.Close;
  TermsForm.Release;
end;

procedure TTermsForm.TermsAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TTermsForm.TermsAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  Terms.Refresh;
{  MainForm.Database.StartTransaction;}
end;

procedure TTermsForm.TermsAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TTermsForm.TermsBeforeCancel(DataSet: TDataSet);
begin
  if Terms.State=dsInsert then
    if MessageDlg('Cancel terms being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TTermsForm.TermsBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete terms?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TTermsForm.TermsBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TTermsForm.TermsBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TTermsForm.TermsDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

end.
