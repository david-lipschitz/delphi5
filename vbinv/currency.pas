unit currency;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, ExtCtrls, DBTables;

type
  TfrmCurrency = class(TForm)
    tabCurrency: TTable;
    datCurrency: TDataSource;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    btnClose: TBitBtn;
    tabCurrencyCURREF: TStringField;
    tabCurrencyDESCR: TStringField;
    tabCurrencyMULTDIV: TStringField;
    tabCurrencyEXCHRATE: TFloatField;
    tabCurrencyBEFOREAFTER: TStringField;
    tabCurrencySYMBOL: TStringField;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tabCurrencyAfterCancel(DataSet: TDataSet);
    procedure tabCurrencyBeforeEdit(DataSet: TDataSet);
    procedure tabCurrencyDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tabCurrencyBeforeInsert(DataSet: TDataSet);
    procedure tabCurrencyBeforeDelete(DataSet: TDataSet);
    procedure tabCurrencyAfterPost(DataSet: TDataSet);
    procedure tabCurrencyBeforeCancel(DataSet: TDataSet);
    procedure tabCurrencyBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCurrency: TfrmCurrency;

implementation

{$R *.DFM}

uses Main;

procedure TfrmCurrency.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCurrency.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tabCurrency.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  tabCurrency.Close;
  Release;
end;

procedure TfrmCurrency.FormShow(Sender: TObject);
begin
  tabCurrency.Open;
end;

procedure TfrmCurrency.tabCurrencyAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  tabCurrency.Refresh;
end;

procedure TfrmCurrency.tabCurrencyBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TfrmCurrency.tabCurrencyDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TfrmCurrency.tabCurrencyBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TfrmCurrency.tabCurrencyBeforeDelete(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TfrmCurrency.tabCurrencyAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TfrmCurrency.tabCurrencyBeforeCancel(DataSet: TDataSet);
begin
  if tabCurrency.State=dsInsert then
    if MessageDlg('Cancel currency being modified?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TfrmCurrency.tabCurrencyBeforePost(DataSet: TDataSet);
begin
  if (tabCurrencyBEFOREAFTER.AsString<>'B') and
    (tabCurrencyBEFOREAFTER.AsString<>'A') then
    raise Exception.Create('Place must be Before or After');
end;

end.
