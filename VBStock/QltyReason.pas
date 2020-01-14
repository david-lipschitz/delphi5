unit QltyReason;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ExtCtrls;

type
  TQualityForm = class(TForm)
    Panel1: TPanel;
    PrintSpdBtn: TSpeedButton;
    DBNavigator: TDBNavigator;
    CloseBitBtn: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    QltyReason: TTable;
    QltyReasonSource: TDataSource;
    QltyReasonQLTYREASON: TStringField;
    QltyReasonDESCR: TStringField;
    QltyReasonFIRSTQLTY: TStringField;
    QltyReasonRESLIT: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure QltyReasonAfterCancel(DataSet: TDataSet);
    procedure QltyReasonAfterDelete(DataSet: TDataSet);
    procedure QltyReasonAfterPost(DataSet: TDataSet);
    procedure QltyReasonBeforeEdit(DataSet: TDataSet);
    procedure QltyReasonBeforeInsert(DataSet: TDataSet);
    procedure QltyReasonBeforeDelete(DataSet: TDataSet);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QltyReasonDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QualityForm: TQualityForm;

implementation

uses Vbmain;

{$R *.DFM}

procedure TQualityForm.FormShow(Sender: TObject);
begin
  QltyReason.Open;
  QltyReason.Refresh;
end;

procedure TQualityForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QltyReason.Close;
  Release;
end;

procedure TQualityForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := QltyReason.State = dsBrowse;
  if not CanClose then
    MessageDlg('Cancel or post edits before closing',
      mtInformation, [mbOK], 0);
end;

procedure TQualityForm.QltyReasonAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  QltyReason.Refresh;
end;

procedure TQualityForm.QltyReasonAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TQualityForm.QltyReasonAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TQualityForm.QltyReasonBeforeEdit(DataSet: TDataSet);
begin
  if (QltyReasonQLTYREASON.AsString = 'OK') or
     (QltyReasonQLTYREASON.AsString = 'NK') then
    raise Exception.Create('Cannot edit OK or NK record');
  MainForm.Database.StartTransaction;
end;

procedure TQualityForm.QltyReasonBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TQualityForm.QltyReasonBeforeDelete(DataSet: TDataSet);
begin
  if (QltyReasonQLTYREASON.AsString = 'OK') or
     (QltyReasonQLTYREASON.AsString = 'NK') then
    raise Exception.Create('Cannot delete OK or NK record');
  MainForm.Database.StartTransaction;
end;

procedure TQualityForm.QltyReasonDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TQualityForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TQualityForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
