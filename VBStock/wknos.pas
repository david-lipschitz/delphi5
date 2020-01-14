unit wknos;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons;

type
  TWkNosForm = class(TForm)
    WkNosFROMDATE: TDateTimeField;
    WkNosTODATE: TDateTimeField;
    WkNosYEARNO: TSmallintField;
    WkNosWEEKNO: TSmallintField;
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    WkNosSource: TDataSource;
    Panel2: TPanel;
    WkNos: TTable;
    CloseBitBtn: TBitBtn;
    WkNosMONTHNO: TSmallintField;
    WkNosVTPERIOD: TSmallintField;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WkNosAfterCancel(DataSet: TDataSet);
    procedure WkNosAfterDelete(DataSet: TDataSet);
    procedure WkNosAfterPost(DataSet: TDataSet);
    procedure WkNosBeforeEdit(DataSet: TDataSet);
    procedure WkNosBeforeInsert(DataSet: TDataSet);
    procedure WkNosBeforeDelete(DataSet: TDataSet);
    procedure WkNosDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  WkNosForm: TWkNosForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs;

procedure TWkNosForm.CloseBitBtnClick(Sender: TObject);
begin
  if WkNos.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Week Nos before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TWkNosForm.FormShow(Sender: TObject);
begin
  WkNos.Open;
  WkNos.Refresh;
end;

procedure TWkNosForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if WkNos.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  WkNos.Close;
  WkNosForm.Release;
end;

procedure TWkNosForm.WkNosAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  WkNos.Refresh;
end;

procedure TWkNosForm.WkNosAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TWkNosForm.WkNosAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TWkNosForm.WkNosBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWkNosForm.WkNosBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWkNosForm.WkNosBeforeDelete(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWkNosForm.WkNosDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MainForm.Database.RollBack;
end;

end.