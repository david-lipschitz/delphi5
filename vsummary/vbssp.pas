unit vbssp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, ExtCtrls, DBCtrls, DBTables, StdCtrls, Buttons;

type
  TVBSSPForm = class(TForm)
    VBLSPStd: TTable;
    VBLSPSource: TDataSource;
    VBLSPStdVBSTRU: TStringField;
    VBLSPStdVBWIDTH: TSmallintField;
    VBLSPStdFROMDATE: TDateTimeField;
    VBLSPStdTODATE: TDateTimeField;
    VBLSPStdPRICE: TFloatField;
    VBLSPStdVBFIN: TStringField;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    CloseBitBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VBLSPStdBeforeInsert(DataSet: TDataSet);
    procedure VBLSPStdBeforeEdit(DataSet: TDataSet);
    procedure VBLSPStdBeforeDelete(DataSet: TDataSet);
    procedure VBLSPStdAfterInsert(DataSet: TDataSet);
    procedure VBLSPStdAfterPost(DataSet: TDataSet);
    procedure VBLSPStdAfterCancel(DataSet: TDataSet);
    procedure VBLSPStdDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure VBLSPStdAfterDelete(DataSet: TDataSet);
    procedure CloseBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VBSSPForm: TVBSSPForm;

implementation

{$R *.DFM}

uses Main;

procedure TVBSSPForm.FormShow(Sender: TObject);
begin
  VBLSPStd.Open;
end;

procedure TVBSSPForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VBLSPStd.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  VBLSPStd.Close;
  Release;
end;

procedure TVBSSPForm.VBLSPStdBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBSSPForm.VBLSPStdBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBSSPForm.VBLSPStdBeforeDelete(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBSSPForm.VBLSPStdAfterInsert(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TVBSSPForm.VBLSPStdAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TVBSSPForm.VBLSPStdAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  VBLSPStd.Refresh;
end;

procedure TVBSSPForm.VBLSPStdDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBSSPForm.VBLSPStdAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TVBSSPForm.CloseBitBtnClick(Sender: TObject);
begin
  if VBLSPStd.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

end.
