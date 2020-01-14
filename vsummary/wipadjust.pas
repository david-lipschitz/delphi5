unit wipadjust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TWIPAdjustForm = class(TForm)
    WIPQuerySource: TDataSource;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Splitter1: TSplitter;
    WIPQuery: TQuery;
    TxnDetQuery: TQuery;
    TxnDetQuerySource: TDataSource;
    Panel3: TPanel;
    Label1: TLabel;
    edtMonthEndDate: TEdit;
    CloseBitBtn: TBitBtn;
    btnAdjust: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    WIPQueryISSUETO: TStringField;
    TxnDetQueryPRODTYPE: TStringField;
    TxnDetQueryEXTPRODREF: TStringField;
    TxnDetQueryQLTY: TStringField;
    WIPQueryNETWEIGHT: TIntegerField;
    TxnDetQuerySUMQTY: TIntegerField;
    WIPQueryCOLUMN4: TStringField;
    AdjTxnDetQuery: TQuery;
    SPGenTxnDetRef: TStoredProc;
    SPGenTxnDetTxnRef: TStoredProc;
    WIPQueryCTRLACCT: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure edtMonthEndDateExit(Sender: TObject);
    procedure btnAdjustClick(Sender: TObject);
  private
    { Private declarations }
    MonthEndDate:TDateTime;
  public
    { Public declarations }
  end;

var
  WIPAdjustForm: TWIPAdjustForm;

implementation

{$R *.DFM}

uses Main;

procedure TWIPAdjustForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WIPQuery.Close;
  TxnDetQuery.Close;
  WIPAdjustForm.Release;
end;

procedure TWIPAdjustForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TWIPAdjustForm.edtMonthEndDateExit(Sender: TObject);
begin
  try
    WIPQuery.Close;
    TxnDetQuery.Close;
    MonthEndDate:=strtodate(edtMonthEndDate.Text);
    WIPQuery.ParamByName('DateManu').Value:=MonthEndDate;
    WIPQuery.Open;
    TxnDetQuery.ParamByName('TxnDate').Value:=MonthEndDate;
    TxnDetQuery.Open;
  except
    on EConvertError do ;
  end;
end;

procedure TWIPAdjustForm.btnAdjustClick(Sender: TObject);
var
  Ref,TxnNo:integer;
  ExtProdRef:string;
  NextDay:TDateTime;
  DHSubtract,NetWeight:integer;
begin
  if not (WIPQuery.Active or TxnDetQuery.Active) then
    raise Exception.Create('Fill in a month end date first');
  //used so that ACRWIP posted is correct;  Works as long as
  //issueto prefix 'DH' < main ACRWIP issue ('VB')
  DHSubtract:=0;
  NextDay:=MonthEndDate+1;
  AdjTxnDetQuery.Prepare;
  WIPQuery.DisableControls;
  TxnDetQuery.DisableControls;
  WIPQuery.First;
  MainForm.Database.StartTransaction;
  SPGenTxnDetTxnRef.ExecProc;
  TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;

  //first post a reversal transaction to reverse the stock at the
  //end of the month (from txndetquery)
  TxnDetQuery.First;
  while not TxnDetQuery.EOF do
  begin
    if TxnDetQuery.FieldByName('SumQty').AsInteger<>0 then
    begin
      SPGenTxnDetRef.ExecProc;
      Ref:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
      AdjTxnDetQuery.ParamByName('Ref').AsInteger:=Ref;
      AdjTxnDetQuery.ParamByName('TxnNo').AsInteger:=TxnNo;
      AdjTxnDetQuery.ParamByName('TxnCode').AsString:='WA';
      AdjTxnDetQuery.ParamByName('ProdType').AsString:='WIP';
      AdjTxnDetQuery.ParamByName('ExtProdRef').AsString:=TxnDetQueryEXTPRODREF.AsString;
      AdjTxnDetQuery.ParamByName('Qlty').AsString:=TxnDetQueryQlty.AsString;
      AdjTxnDetQuery.ParamByName('Qty').AsInteger:=
        TxnDetQuery.FieldByName('SumQty').AsInteger*-1;
      AdjTxnDetQuery.ParamByName('TxnDate').Value:=MonthEndDate;
      AdjTxnDetQuery.ParamByName('DateEnt').Value:=date;
      AdjTxnDetQuery.ParamByName('UserEnt').AsString:='SYSDBA'; //xxx for now
      AdjTxnDetQuery.ExecSQL;
    end;
    TxnDetQuery.Next;
  end;

  //then post the actual wip from wiprcpt to txndet using wipquery
  //the net effect of these two postings is the same as posting a
  //single transaction
  WIPQuery.First;
  while not WIPQuery.EOF do
  begin
    ExtProdRef:='';
    NetWeight:=WIPQuery.FieldByName('NetWeight').AsInteger;
    if (WIPQuery.FieldByName('CtrlAcct').AsString='ACRWIP') then
    begin
      if (WIPQuery.FieldByName('IssueTo').AsString='DHSAF') then
      begin
        ExtProdRef:='WIPDHSAF';
        DHSubtract:=DHSubtract+NetWeight;
      end
      else if (WIPQuery.FieldByName('IssueTo').AsString='DHTBS') then
      begin
        ExtProdRef:='WIPDHTBS';
        DHSubtract:=DHSubtract+NetWeight;
      end
      else if (WIPQuery.FieldByName('IssueTo').AsString='DHLTI') then
      begin
        ExtProdRef:='WIPDHLTI';
        DHSubtract:=DHSubtract+NetWeight;
      end
      else
      begin
        ExtProdref:='WIPACRWIP';
        NetWeight:=NetWeight-DHSubtract;
      end;
    end
    else
      ExtProdRef:='WIP'+WIPQuery.FieldByName('CtrlAcct').AsString;

    SPGenTxnDetRef.ExecProc;
    Ref:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
    AdjTxnDetQuery.ParamByName('Ref').AsInteger:=Ref;
    AdjTxnDetQuery.ParamByName('TxnNo').AsInteger:=TxnNo;
    AdjTxnDetQuery.ParamByName('TxnCode').AsString:='WA';
    AdjTxnDetQuery.ParamByName('ProdType').AsString:='WIP';
    AdjTxnDetQuery.ParamByName('ExtProdRef').AsString:=ExtProdRef;
    AdjTxnDetQuery.ParamByName('Qlty').AsString:='';
    AdjTxnDetQuery.ParamByName('Qty').AsInteger:=NetWeight;
    AdjTxnDetQuery.ParamByName('TxnDate').Value:=MonthEndDate;
    AdjTxnDetQuery.ParamByName('DateEnt').Value:=date;
    AdjTxnDetQuery.ParamByName('UserEnt').AsString:='SYSDBA'; //xxx for now
    AdjTxnDetQuery.ExecSQL;
    if ExtProdRef='WIPVBMIX' then
    begin
      // post the WB record to get rid of the VBMIX which is not stored
      // as a WIP item (because no Work Breakdown Structure including it
      SPGenTxnDetRef.ExecProc;
      Ref:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
      AdjTxnDetQuery.ParamByName('Ref').AsInteger:=Ref;
      AdjTxnDetQuery.ParamByName('TxnNo').AsInteger:=TxnNo;
      AdjTxnDetQuery.ParamByName('TxnCode').AsString:='WB';
      AdjTxnDetQuery.ParamByName('ProdType').AsString:='WIP';
      AdjTxnDetQuery.ParamByName('ExtProdRef').AsString:=ExtProdRef;
      AdjTxnDetQuery.ParamByName('Qlty').AsString:='';
      AdjTxnDetQuery.ParamByName('Qty').AsInteger:=NetWeight*-1;
      AdjTxnDetQuery.ParamByName('TxnDate').Value:=NextDay;
      AdjTxnDetQuery.ParamByName('DateEnt').Value:=date;
      AdjTxnDetQuery.ParamByName('UserEnt').AsString:='SYSDBA'; //xxx for now
      AdjTxnDetQuery.ExecSQL;
    end;

    WIPQuery.Next;
  end;
  MainForm.Database.Commit;
  WIPQuery.EnableControls;
  TxnDetQuery.EnableControls;
  WIPQuery.Close;
  TxnDetQuery.Close;
  WIPQuery.Open;
  TxnDetQuery.Open;
end;

end.
