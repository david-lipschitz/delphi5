unit vbscp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ExtCtrls;

type
  TVBSCPForm = class(TForm)
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    CloseBitBtn: TBitBtn;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    VBLCPStd: TTable;
    VBLSPSource: TDataSource;
    VBLCPStdVBSTRU: TStringField;
    VBLCPStdVBWIDTH: TSmallintField;
    VBLCPStdQLTY: TStringField;
    VBLCPStdSTKPRICE: TFloatField;
    VBLCPStdVBFIN: TStringField;
    VBLCPStdFROMDATE: TDateTimeField;
    VBLCPStdTODATE: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure VBLCPStdBeforeInsert(DataSet: TDataSet);
    procedure VBLCPStdBeforeEdit(DataSet: TDataSet);
    procedure VBLCPStdBeforeDelete(DataSet: TDataSet);
    procedure VBLCPStdAfterInsert(DataSet: TDataSet);
    procedure VBLCPStdAfterPost(DataSet: TDataSet);
    procedure VBLCPStdAfterCancel(DataSet: TDataSet);
    procedure VBLCPStdDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure VBLCPStdAfterDelete(DataSet: TDataSet);
    procedure CloseBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VBSCPForm: TVBSCPForm;

implementation

uses main;

{$R *.DFM}

procedure TVBSCPForm.FormShow(Sender: TObject);
begin
  VBLCPStd.Open;
end;

procedure TVBSCPForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VBLCPStd.Close;
  Action := caFree;
end;

procedure TVBSCPForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := VBLCPStd.State = dsBrowse;
  if not CanClose then
    MessageDlg('First cancel or post your edits before closing',
      mtError, [mbOK], 0);
end;

procedure TVBSCPForm.VBLCPStdBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBSCPForm.VBLCPStdBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBSCPForm.VBLCPStdBeforeDelete(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBSCPForm.VBLCPStdAfterInsert(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TVBSCPForm.VBLCPStdAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TVBSCPForm.VBLCPStdAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  VBLCPStd.Refresh;
end;

procedure TVBSCPForm.VBLCPStdDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBSCPForm.VBLCPStdAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TVBSCPForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

end.
