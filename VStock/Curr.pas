unit Curr;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Dialogs,
  Buttons;

type
  TCurrencyForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    CurrencySource: TDataSource;
    Panel2: TPanel;
    Currency: TTable;
    CurrencyCURREF: TStringField;
    CurrencyDESCR: TStringField;
    CloseBitBtn: TBitBtn;
    CurrencyEXCHRATE: TFloatField;
    CurrencyMULTDIV: TStringField;
    procedure CloseBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CurrencyAfterPost(DataSet: TDataset);
    procedure CurrencyAfterCancel(DataSet: TDataset);
    procedure CurrencyAfterDelete(DataSet: TDataset);
    procedure CurrencyBeforeEdit(DataSet: TDataSet);
    procedure CurrencyBeforeInsert(DataSet: TDataSet);
    procedure CurrencyBeforeDelete(DataSet: TDataSet);
    procedure CurrencyDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  CurrencyForm: TCurrencyForm;

implementation

uses Main;

{$R *.DFM}

procedure TCurrencyForm.CloseBtnClick(Sender: TObject);
begin
  if Currency.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post currencies before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TCurrencyForm.CloseBitBtnClick(Sender: TObject);
begin
  if Currency.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post currencies before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TCurrencyForm.FormShow(Sender: TObject);
begin
  Currency.Open;
  Currency.Refresh;
end;

procedure TCurrencyForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Currency.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  Currency.Close;
  CurrencyForm.Release;
end;

procedure TCurrencyForm.CurrencyAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TCurrencyForm.CurrencyAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  Currency.Refresh;  
end;

procedure TCurrencyForm.CurrencyAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TCurrencyForm.CurrencyBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TCurrencyForm.CurrencyBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TCurrencyForm.CurrencyBeforeDelete(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TCurrencyForm.CurrencyDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

end.
