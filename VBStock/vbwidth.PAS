unit Vbwidth;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Buttons, Grids, ExtCtrls,
  Dialogs;

type
  TVBWidthForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    VBWidthSource: TDataSource;
    Panel2: TPanel;
    VBWidth: TTable;
    CloseBitBtn: TBitBtn;
    VBWidthIMPERIALWIDTH: TStringField;
    VBWidthMETRICLABELDESCR: TStringField;
    VBWidthMETRICWIDTH: TSmallintField;
    VBWidthSTRIPS: TSmallintField;
    PrintSpdBtn: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure VBWidthAfterCancel(DataSet: TDataset);
    procedure VBWidthAfterDelete(DataSet: TDataset);
    procedure VBWidthAfterPost(DataSet: TDataset);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure VBWidthDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure VBWidthBeforeEdit(DataSet: TDataSet);
    procedure VBWidthBeforeInsert(DataSet: TDataSet);
    procedure VBWidthBeforeDelete(DataSet: TDataSet);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  VBWidthForm: TVBWidthForm;

implementation

{$R *.DFM}

uses VBMain;

procedure TVBWidthForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VBWidth.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  VBWidth.Close;
  VBWidthForm.Release;
end;

procedure TVBWidthForm.FormShow(Sender: TObject);
begin
  VBWidth.Open;
  VBWidth.Refresh;
end;

procedure TVBWidthForm.VBWidthAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  VBWidth.Refresh;
end;

procedure TVBWidthForm.VBWidthAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBWidthForm.VBWidthAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBWidthForm.CloseBitBtnClick(Sender: TObject);
begin
  if VBWidth.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post VB Widths before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBWidthForm.VBWidthDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBWidthForm.VBWidthBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBWidthForm.VBWidthBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBWidthForm.VBWidthBeforeDelete(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBWidthForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.