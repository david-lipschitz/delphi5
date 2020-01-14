unit txndet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons;

type
  TTxnDetSummaryForm = class(TForm)
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
  TxnDetSummaryForm: TTxnDetSummaryForm;

implementation

{$R *.DFM}

uses Main;

procedure TTxnDetSummaryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TxnDetSummarise.Close;
  TxnDetSummaryForm.Release;
end;

procedure TTxnDetSummaryForm.FormShow(Sender: TObject);
begin
  FromDate:=0;
  ToDate:=0;
  ReRun:=true;
  TxnDetSummarise.Open;
  EdtDatabaseName.ReadOnly:=false;
  EdtDatabaseName.Text:=MainForm.DatabaseAlias.Text;
  EdtDatabaseName.ReadOnly:=true;  
end;

procedure TTxnDetSummaryForm.SummariseBtnClick(Sender: TObject);
begin
  TxnDetSummarise.Close;
  MainForm.Database.StartTransaction;
  Screen.Cursor:=crSQLWait;
  SPExtractTxnDetSummary.Params[0].AsString:='WIP';
  SPExtractTxnDetSummary.Params[1].AsInteger:=strtoint(EditYearNo.Text);
  SPExtractTxnDetSummary.Params[2].AsInteger:=strtoint(EditPeriodNo.Text);
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

procedure TTxnDetSummaryForm.UpdateTxnDetBtnClick(Sender: TObject);
begin
  {ensure that summarise has been run and that from date and to date agree}
  if (FromDate=0) or (ToDate=0) or ReRun then
    showmessage('Cannot execute until summarise is executed')
  else
  begin
    MainForm.Database.StartTransaction;
    Screen.Cursor:=crSQLWait;
    SPSummariseTxnDet.Params[0].AsString:='WIP';
    SPSummariseTxnDet.Params[1].Value:=FromDate;
    SPSummariseTxnDet.Params[2].Value:=ToDate;
    SPSummariseTxnDet.ExecProc;
    Screen.Cursor:=crDefault;
    MainForm.Database.Commit;
    ReRun:=true;
  end;
  {xx at some point might want to store the last month end details}
  {in the param table}
end;

procedure TTxnDetSummaryForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TTxnDetSummaryForm.EditYearNoChange(Sender: TObject);
begin
  ReRun:=true;
end;

procedure TTxnDetSummaryForm.EditPeriodNoChange(Sender: TObject);
begin
  ReRun:=true;
end;

end.
