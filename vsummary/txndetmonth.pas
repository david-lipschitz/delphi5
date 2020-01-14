unit txndetmonth;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons;

type
  TTxnDetSummaryMonthForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    TxnDetSummarise: TTable;
    TxnDetSummariseSource: TDataSource;
    TxnDetSummariseTXNCODE: TStringField;
    TxnDetSummarisePRODTYPE: TStringField;
    TxnDetSummariseEXTPRODREF: TStringField;
    TxnDetSummariseQLTY: TStringField;
    TxnDetSummariseQTY: TFloatField;
    SummariseBtn: TButton;
    EditYearNo: TComboBox;
    EditPeriodNo: TComboBox;
    UpdateTxnDetBtn: TButton;
    ShowNumRecords: TEdit;
    Label3: TLabel;
    SPEXTRACTTXNDETSUMMARY: TStoredProc;
    SPSUMMARISETXNDET: TStoredProc;
    CloseBitBtn: TBitBtn;
    Label4: TLabel;
    ShowQtyTotal: TEdit;
    EdtDatabaseName: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SummariseBtnClick(Sender: TObject);
    procedure UpdateTxnDetBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure EditYearNoChange(Sender: TObject);
    procedure EditPeriodNoChange(Sender: TObject);
  private
    { Private declarations }
    FromDate,ToDate:TDateTime;
    ReRun:boolean;
  public
    { Public declarations }
  end;

var
  TxnDetSummaryMonthForm: TTxnDetSummaryMonthForm;

implementation

{$R *.DFM}

uses Main;

procedure TTxnDetSummaryMonthForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TxnDetSummarise.Close;
  TxnDetSummaryMonthForm.Release;
end;

procedure TTxnDetSummaryMonthForm.FormShow(Sender: TObject);
begin
  FromDate:=0;
  ToDate:=0;
  ReRun:=true;
  TxnDetSummarise.Open;
  EdtDatabaseName.ReadOnly:=false;
  EdtDatabaseName.Text:=MainForm.DatabaseAlias.Text;
  EdtDatabaseName.ReadOnly:=true;  
end;

procedure TTxnDetSummaryMonthForm.SummariseBtnClick(Sender: TObject);
begin
  TxnDetSummarise.Close;
  MainForm.Database.StartTransaction;
  Screen.Cursor:=crSQLWait;
  //SPExtractTxnDetSummary.Params[0].AsString:='WIP';
  SPExtractTxnDetSummary.Params[0].AsInteger:=strtoint(EditYearNo.Text);
  SPExtractTxnDetSummary.Params[1].AsInteger:=strtoint(EditPeriodNo.Text);
  SPExtractTxnDetSummary.ExecProc;
  ShowNumRecords.Text:=SPExtractTxnDetSummary.ParamByName('RecordsFound').AsString;
  ShowQtyTotal.Text:=SPExtractTxnDetSummary.ParamByName('QtyTotal').AsString;
  FromDate:=SPExtractTxnDetSummary.ParamByName('FromDate').AsFloat;
  ToDate:=SPExtractTxnDetSummary.ParamByName('ToDate').AsFloat;
  Screen.Cursor:=crDefault;
  MainForm.Database.Commit;
  TxnDetSummarise.Open;
  ReRun:=false;
end;

procedure TTxnDetSummaryMonthForm.UpdateTxnDetBtnClick(Sender: TObject);
begin
  {ensure that summarise has been run and that from date and to date agree}
  if (FromDate=0) or (ToDate=0) or ReRun then
    showmessage('Cannot execute until summarise is executed')
  else
  begin
    MainForm.Database.StartTransaction;
    Screen.Cursor:=crSQLWait;
    //SPSummariseTxnDet.Params[0].AsString:='WIP';
    SPSummariseTxnDet.Params[0].Value:=FromDate;
    SPSummariseTxnDet.Params[1].Value:=ToDate;
    SPSummariseTxnDet.ExecProc;
    Screen.Cursor:=crDefault;
    MainForm.Database.Commit;
    ReRun:=true;
  end;
  {xx at some point might want to store the last month end details}
  {in the param table}
end;

procedure TTxnDetSummaryMonthForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TTxnDetSummaryMonthForm.EditYearNoChange(Sender: TObject);
begin
  ReRun:=true;
end;

procedure TTxnDetSummaryMonthForm.EditPeriodNoChange(Sender: TObject);
begin
  ReRun:=true;
end;

end.
