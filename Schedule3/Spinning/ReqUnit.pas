unit ReqUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  DBCtrls;

type
  TReqmtsForm = class(TForm)
    ToolPanel: TPanel;
    PrintButton: TSpeedButton;
    ExitButton: TSpeedButton;
    RegGrid: TDBGrid;
    ReqSource: TDataSource;
    ReqDateQuery: TQuery;
    ReqJobQuery: TQuery;
    StkGrid: TDBGrid;
    Splitter1: TSplitter;
    FibreStkQuery: TQuery;
    StkSource: TDataSource;
    FibreStkQueryYNSTRU: TStringField;
    FibreStkQueryYNTWIST: TStringField;
    FibreStkQueryYNCOL: TStringField;
    FibreStkQueryCOLUMN4: TStringField;
    FibreStkQuerySUM: TFloatField;
    LinkCheck: TCheckBox;
    NavBtns: TDBNavigator;
    AcrylicReqQuery: TQuery;
    AcrylicReqQueryACRYLREQ: TFloatField;
    TotalEndsQuery: TQuery;
    TotalEndsQuerySUM: TIntegerField;
    YnColWBSQuery: TQuery;
    YnColWBSQueryFIBRE: TStringField;
    YnColWBSQueryNUMENDS: TSmallintField;
    ReqDateQuerySTARTDATE: TDateTimeField;
    ReqDateQuerySTRUCT: TStringField;
    ReqDateQueryTWIST: TStringField;
    ReqDateQueryCOLOR: TStringField;
    ReqDateQueryYARNWEIGHT: TIntegerField;
    ReqDateQueryFIBREWEIGHT: TFloatField;
    ReqJobQueryJOBNO: TIntegerField;
    ReqJobQuerySTARTDATE: TDateTimeField;
    ReqJobQuerySTRUCT: TStringField;
    ReqJobQueryTWIST: TStringField;
    ReqJobQueryCOLOR: TStringField;
    ReqJobQueryYARNWEIGHT: TIntegerField;
    ReqJobQueryFIBREWEIGHT: TFloatField;
    ReqQuery: TQuery;
    YarnCheck: TCheckBox;
    JobCheck: TCheckBox;
    Query1: TQuery;
    OldFibreReqQuery: TQuery;
    OldYarnReqQuery: TQuery;
    OldFibreReqQuerySTARTDATE: TDateTimeField;
    OldFibreReqQueryFIBRE: TStringField;
    OldFibreReqQueryYARNWEIGHT: TIntegerField;
    OldYarnReqQuerySTARTDATE: TDateTimeField;
    OldYarnReqQueryFIBRE: TStringField;
    OldYarnReqQuerySTRUCT: TStringField;
    OldYarnReqQueryTWIST: TStringField;
    OldYarnReqQueryCOLOR: TStringField;
    OldYarnReqQueryYARNWEIGHT: TIntegerField;
    OldFibreReqQueryFIBREWEIGHT: TFloatField;
    OldYarnReqQueryFIBREWEIGHT: TFloatField;
    FibreReqQuery: TQuery;
    YarnReqQuery: TQuery;
    YarnReqQuerySTARTDATE: TDateTimeField;
    YarnReqQueryFIBRE: TStringField;
    YarnReqQuerySTRUCT: TStringField;
    YarnReqQueryTWIST: TStringField;
    YarnReqQueryCOLOR: TStringField;
    FibreReqQuerySTARTDATE: TDateTimeField;
    FibreReqQueryFIBRE: TStringField;
    FibreReqQueryNUMENDS: TSmallintField;
    FibreReqQueryYARNWGT: TIntegerField;
    FibreReqQueryTOTRMPERKG: TFloatField;
    FibreReqQueryTOTENDS: TIntegerField;
    FibreReqQueryFIBREWGT: TFloatField;
    YarnReqQueryNUMENDS: TSmallintField;
    YarnReqQueryYARNWGT: TIntegerField;
    YarnReqQueryTOTRMPERKG: TFloatField;
    YarnReqQueryTOTENDS: TIntegerField;
    YarnReqQueryFIBREWGT: TFloatField;
    procedure ReqQueryCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ReqChange(Sender: TObject);
    procedure LinkCheckClick(Sender: TObject);
    procedure WeftReqQueryAfterScroll(DataSet: TDataSet);
    procedure RegGridEnter(Sender: TObject);
    procedure StkGridEnter(Sender: TObject);
  private
//    Searching: Boolean;
//    procedure FindStockWeft;
  end;

var
  ReqmtsForm: TReqmtsForm;

implementation

uses Main;

{$R *.DFM}

procedure TReqmtsForm.FormCreate(Sender: TObject);
begin
//  GroupCombo.ItemIndex := 0;
end;

procedure TReqmtsForm.FormShow(Sender: TObject);
begin
{  AcrylicReqQuery.Prepare;
  TotalEndsQuery.Prepare;
  YnColWBSQuery.Prepare;
  ReqDateQuery.Prepare;
  ReqJobQuery.Prepare;}
  ReqChange(nil);
end;

procedure TReqmtsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReqSource.DataSet.Close;
//  StkSource.DataSet.Close;
end;

procedure TReqmtsForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TReqmtsForm.ReqChange(Sender: TObject);
  procedure OpenQuery(Query: TQuery; DataSource: TDataSource);
  begin
    DataSource.DataSet.Close;
    DataSource.DataSet := Query;
    Query.Open;
  end;
{var
  st: string;}
begin
(*
  st := 'sj.startdate, yc.fibre';
  if JobCheck.Checked then
    st := 'sj.JobNo, ' + st;
  if YarnCheck.Checked then
    st := st + ', si.struct, si.twist, si.color';
  with ReqQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select ' + st + ',');
    SQL.Add('  sum(si.weight) * sum(ys.rmperkg) * yc.numends / ');{sum(yc.numends)}
    SQL.Add('  (select sum(numends) from yncolwbs where yncol = si.color)');
    SQL.Add('  as fibreweight');
    SQL.Add('from spinjob sj, spinitem si, yncolwbs yc, ynstruwbsrm ys');
    SQL.Add('where sj.scenariono = :ScenarioNo and si.scenariono = sj.scenariono');
    SQL.Add('  and si.color = yc.yncol');
    SQL.Add('  and si.struct = ys.ynstru and si.twist = ys.yntwist');
    SQL.Add('  and ys.ctrlacct in ["ACRWIP","ACRDOP","COTTON"]');
    SQL.Add('group by ' + st);
    Open;
  end;

//    OpenQuery(WarpStkQuery, StkSource);
    if GroupCombo.ItemIndex = 0 then
      OpenQuery(ReqDateQuery, ReqSource)
    else
      OpenQuery(ReqJobQuery, ReqSource);
  end;
*)
  if YarnCheck.Checked then
    OpenQuery(YarnReqQuery, ReqSource)
  else
    OpenQuery(FibreReqQuery, ReqSource);
end;

procedure TReqmtsForm.ReqQueryCalcFields(DataSet: TDataSet);
begin
{  AcrylicReqQuery.ParamByName('ynstru').AsString :=
    ReqSource.DataSet.FieldByName('Struct').AsString;
  AcrylicReqQuery.ParamByName('yntwist').AsString :=
    ReqSource.DataSet.FieldByName('Twist').AsString;
  AcrylicReqQuery.Open;
  TotalEndsQuery.ParamByName('yncol').AsString :=
    ReqSource.DataSet.FieldByName('Color').AsString;
  TotalEndsQuery.Open;
  YnColWBSQuery.ParamByName('yncol').AsString :=
    ReqSource.DataSet.FieldByName('Color').AsString;
  YnColWBSQuery.Open;
  if YnColWBSQueryNUMENDS.AsFloat > 0 then
    ReqSource.DataSet.FieldByName('FIBREWEIGHT').AsFloat := Round(
      ReqSource.DataSet.FieldByName('YARNWEIGHT').AsInteger
      * AcrylicReqQueryACRYLREQ.AsFloat
      * YnColWBSQueryNUMENDS.AsFloat
      / TotalEndsQuerySUM.AsFloat)
  else
    ReqSource.DataSet.FieldByName('FIBREWEIGHT').AsFloat := -9999;
  AcrylicReqQuery.Close;
  TotalEndsQuery.Close;
  YnColWBSQuery.Close;}
  with ReqSource.DataSet do
    FieldByName('fibrewgt').AsFloat := Round(
      FieldByName('yarnwgt').AsInteger * FieldByName('totrmperkg').AsFloat
        * FieldByName('numends').AsFloat / FieldByName('totends').AsFloat);
end;

procedure TReqmtsForm.PrintButtonClick(Sender: TObject);
var
  st: string;
begin
  with MainForm.DataPrinter do
  begin
{    AutoClose := False;}
    //print warp/weft requirements
    Title := Caption;
    SubTitles.Clear;
//    SubTitles.Add(GroupCombo.Text);
    st := 'By Fibre';
    if JobCheck.Checked then
      st := st + ', Job';
    if YarnCheck.Checked then
      st := st + ', Yarn';
    SubTitles.Add(st);
    DataSet := ReqSource.DataSet;
    Print;
    //print warp/weft in stock
{    DoTimeStamp := False;
    DoPageNumbers := False;
    Title := ' ';
    SubTitles.Clear;
    SubTitles.Add('Amount in stock');
    DataSet := StkSource.DataSet;
    Print;
    Printer.EndDoc;
    AutoClose := True;
    DoTimeStamp := True;
    DoPageNumbers := True;}
  end;
end;

procedure TReqmtsForm.LinkCheckClick(Sender: TObject);
begin
{  if LinkCheck.Checked then
    FindStockFibre
  else
    StkGrid.Options := StkGrid.Options - [dgRowSelect, dgAlwaysShowSelection];}
end;
{
procedure TReqmtsForm.FindStockFibre;
var
  bm: TBookmark;
  stru, twist, col: string;
begin
  if WeftStkQuery.Active and LinkCheck.Visible and LinkCheck.Checked then
  begin
    with ReqSource.DataSet do
    begin
      stru := FieldByName('WEFTSTRU').AsString;
      twist := FieldByName('WEFTTWIST').AsString;
      col := FieldByName('WEFTCOL').AsString;
    end;
    Searching := True;
    bm := WeftStkQuery.GetBookmark;
    WeftStkQuery.DisableControls;
    try
      WeftStkQuery.First;
      while not WeftStkQuery.EOF do
        if (stru = WeftStkQueryYNSTRU.AsString) and
           (twist = WeftStkQueryYNTWIST.AsString) and
           (col = WeftStkQueryYNCOL.AsString) then
          Break
        else
          WeftStkQuery.Next;
      if (stru = WeftStkQueryYNSTRU.AsString) and
         (twist = WeftStkQueryYNTWIST.AsString) and
         (col = WeftStkQueryYNCOL.AsString) then
        StkGrid.Options := StkGrid.Options + [dgRowSelect, dgAlwaysShowSelection]
      else
      begin
        StkGrid.Options := StkGrid.Options - [dgRowSelect, dgAlwaysShowSelection];
        WeftStkQuery.GotoBookmark(bm);
      end;
    finally
      WeftStkQuery.EnableControls;
      WeftStkQuery.FreeBookmark(bm);
      Searching := False;
    end;
  end;
end;
}
procedure TReqmtsForm.WeftReqQueryAfterScroll(DataSet: TDataSet);
begin
//  if not Searching then FindStockWeft;
end;

procedure TReqmtsForm.RegGridEnter(Sender: TObject);
begin
  NavBtns.DataSource := ReqSource;
end;

procedure TReqmtsForm.StkGridEnter(Sender: TObject);
begin
  NavBtns.DataSource := StkSource;
end;

end.


