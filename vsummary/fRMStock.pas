unit fRMStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, ODPopCal, ComCtrls, XLSDbRead2,
  XLSReadWriteII2;

type
  TfrmRMStock = class(TForm)
    Label1: TLabel;
    odpStockRange: TODPopupCalendar;
    btnDoCalc: TButton;
    btnDoExport: TButton;
    spFindRM: TStoredProc;
    btnClose: TButton;
    StatusBar: TStatusBar;
    XLS: TXLSReadWriteII2;
    XLSDbRead: TXLSDbRead2;
    Label9: TLabel;
    edtExportDirectory: TEdit;
    qryExportRM: TQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDoCalcClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnDoExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRMStock: TfrmRMStock;

implementation

uses main;

{$R *.DFM}

procedure TfrmRMStock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Release;
end;

procedure TfrmRMStock.btnDoCalcClick(Sender: TObject);
var
  lMessage:string;
begin
  if odpStockRange.Text='' then
    raise Exception.Create('Please enter a date range first');

  lMessage:='Do you wish to find the stock for the entered dates?';
  if MessageDlg(lMessage, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    StatusBar.SimpleText:='Finding stock information';
    Application.ProcessMessages;
    MainForm.Database.StartTransaction;
    spFindRM.Close;
    spFindRM.ParamByName('pMovementFrom').AsDateTime:=odpStockRange.StartDate;
    spFindRM.ParamByName('pMovementTo').AsDateTime:=odpStockRange.FinishDate;
    spFindRM.ExecProc;
    MainForm.Database.Commit;
    StatusBar.SimpleText:='Completed finding stock information';
    Application.ProcessMessages;
  end;
end;

procedure TfrmRMStock.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRMStock.btnDoExportClick(Sender: TObject);
begin
  if MessageDlg('Do you wish to Export to Excel?',mtWarning,[mbYes,mbNo], 0) = mrYes then
  begin
    StatusBar.SimpleText:='Exporting RM';
    Application.ProcessMessages;
    qryExportRM.Close;
    XLSDbRead.Dataset:=qryExportRM;
    XLS.Clear;
    qryExportRM.Open;
    XLSDbRead.Read;
    XLS.FileName:=edtExportDirectory.Text+'RMUsage.xls';
    XLS.Write;
    //autosize the columns
    XLS.Sheets[0].AutoWidthCols(0,11);
    XLS.Write;
    //set the column formats for the date and amount
    XLS.Sheets[0].Columns[1].NumberFormat:='dd/mm/yyyy'; //date
    XLS.Sheets[0].Columns[2].NumberFormat:='dd/mm/yyyy'; //date
    XLS.Sheets[0].Columns[3].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[4].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[5].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[6].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[7].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[8].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[9].NumberFormat:='#,##0.00'; //number
    XLS.Sheets[0].Columns[10].NumberFormat:='#,##0.00'; //number
    XLS.Sheets[0].Columns[11].NumberFormat:='#,##0.00'; //number
    XLS.Write;
    //autosize the columns
    XLS.Sheets[0].AutoWidthCols(0,11);
    XLS.Write;

    qryExportRM.Close;

    StatusBar.SimpleText:='Ready';
    Application.ProcessMessages;
  end;
end;

end.
