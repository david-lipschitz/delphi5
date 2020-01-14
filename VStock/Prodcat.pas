unit Prodcat;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls,
  Dialogs, Buttons;

type
  TProdCatForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    ProdCatSource: TDataSource;
    Panel2: TPanel;
    ProdCat: TTable;
    ProdCatCATEGORY: TStringField;
    CloseBitBtn: TBitBtn;
    ProdCatDESCR: TStringField;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ProdCatAfterPost(DataSet: TDataset);
    procedure ProdCatAfterCancel(DataSet: TDataset);
    procedure ProdCatAfterDelete(DataSet: TDataset);
    procedure ProdCatDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ProdCatBeforeEdit(DataSet: TDataSet);
    procedure ProdCatBeforeInsert(DataSet: TDataSet);
    procedure ProdCatBeforeDelete(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ProdCatForm: TProdCatForm;

implementation

uses Main;

{$R *.DFM}

procedure TProdCatForm.CloseBitBtnClick(Sender: TObject);
begin
  if ProdCat.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post product categories before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TProdCatForm.FormShow(Sender: TObject);
begin
  ProdCat.Open;
  ProdCat.Refresh;
end;

procedure TProdCatForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ProdCat.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  ProdCat.Close;
  ProdCatForm.Release;
end;

procedure TProdCatForm.ProdCatAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TProdCatForm.ProdCatAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  ProdCat.Refresh;
end;

procedure TProdCatForm.ProdCatAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

{initialization
  ProdCatForm:=TProdCatForm.Create(Application);}

procedure TProdCatForm.ProdCatDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TProdCatForm.ProdCatBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TProdCatForm.ProdCatBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TProdCatForm.ProdCatBeforeDelete(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

end.