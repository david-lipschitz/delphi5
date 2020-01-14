{Unit Name: VBMake
Written By: DH Lipschitz in 1996
Descr: Calculate the production tracking schedule
Mods:  9/12/96   Print metres required rather than pieces required
       4/2/97    Subtract metres already slit from finished pieces
       4/2/97    Added Total Sales: used by stkmin report
       18/3/97   Added Total Allocated: used by order processing
       3/4/97    Added Get To Date for slit calculation
       22/5/97   Added StkMinQty constant
       8/97      Set stock min to average monthly sales
       12/97     Change all these procedures to stored procedures
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
       }

unit vbmake_old;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, {Dialogs,} StdCtrls, Buttons, DBTables, DB, Grids, DBGrids,
  ComCtrls, ExtCtrls, Mask, DBCtrls;

type
  TVBMakeForm = class(TForm)
    CloseBitBtn: TBitBtn;
    RunMakeBtn: TButton;
    VBMake: TTable;
    VBMakeSource: TDataSource;
    VBMakeVBSTRU: TStringField;
    VBMakeVBCOL: TStringField;
    VBMakeWARPTYPE: TStringField;
    VBMakeMIN127: TIntegerField;
    VBMakeSTK127: TIntegerField;
    VBMakeORD127: TIntegerField;
    VBMakePORD127: TFloatField;
    VBMakePSTK127: TFloatField;
    VBMakeMIN89: TIntegerField;
    VBMakeSTK89: TIntegerField;
    VBMakeORD89: TIntegerField;
    VBMakePORD89: TFloatField;
    VBMakePSTK89: TFloatField;
    VBMakeMIN2070: TIntegerField;
    VBMakeSTK2070: TIntegerField;
    VBMakeORD2070: TIntegerField;
    VBMakePORD2070: TFloatField;
    VBMakePSTK2070: TFloatField;
    VBMakePTOTORD: TFloatField;
    VBMakePTOTSTK: TFloatField;
    VBMakePTOTRQD: TFloatField;
    VBMakeWWIP: TFloatField;
    VBMakeVWIP: TFloatField;
    VBMakeFWIP: TFloatField;
    MyQuery: TQuery;
    PrintAllBtn: TButton;
    StatusBar: TStatusBar;
    VBMakeGrid: TDBGrid;
    Label1: TLabel;
    VBParamsSource: TDataSource;
    EditMakeDate: TDBEdit;
    VBParamsQuery: TQuery;
    VBParamsQueryMAKEDATE: TDateTimeField;
    VBMakePCSRQD: TFloatField;
    VBMakePCEWFT1WEIGHT: TFloatField;
    VBMakeWFT1YNRQD: TFloatField;
    VBMakeWFT1YNSTOCK: TFloatField;
    VBMakeWFT1TOSPIN: TFloatField;
    VBMakeWARPCOL: TStringField;
    VBMakeWEFT1STRU: TStringField;
    VBMakeWEFT1TWIST: TStringField;
    VBMakeWEFT1COL: TStringField;
    VBMakeFWSLITMRQD: TFloatField;
    VBMakeFWWARPMRQD: TFloatField;
    VBMakePCEWARPLENGTH: TFloatField;
    VBMakePCEFINLENGTH: TFloatField;
    VBMakeSALE89: TFloatField;
    VBMakeSALE127: TFloatField;
    VBMakeSALE2070: TFloatField;
    VBMakeFIRSTSALEDATE: TDateTimeField;
    VBMakeALLOC127: TIntegerField;
    VBMakeALLOC89: TIntegerField;
    VBMakeALLOC2070: TIntegerField;
    VBMakeREMAIN127: TIntegerField;
    VBMakeREMAIN89: TIntegerField;
    VBMakeREMAIN2070: TIntegerField;
    Label2: TLabel;
    VBMakeDIVBYDAYS: TIntegerField;
    Label3: TLabel;
    ShowVBStru: TDBEdit;
    Label4: TLabel;
    ShowVBCol: TDBEdit;
    VBMakeMONTHSSALES: TSmallintField;
    SPVBMAKEDELETE: TStoredProc;
    SPVBMAKESETUP: TStoredProc;
    SPVBMAKEFINDSTOCK: TStoredProc;
    SPVBMAKECALCSALES: TStoredProc;
    VBMakeVBFIN: TStringField;
    Label5: TLabel;
    ShowVBFin: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure RunMakeBtnClick(Sender: TObject);
    procedure PrintAllBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure VBMakeGridDblClick(Sender: TObject);
  private
    { Private declarations }
    PixelsInInchx: integer;       { Stores Pixels per inch }
    LineHeight: Integer;          { Stores the line height }
    AmountPrinted: integer;       { Stores amount, in pixels, printed on a page }
    TenthsOfInchPixelsY: integer; { Pixels in 1/10 of an inch used for line spacing }
    DateHeading:string;
    HeaderDescr:string;
    ToDateStr:string[11];
    ToDate:TDateTime;
    procedure VBMakeGetToDate;
    procedure VBMakeDelete;
    procedure VBMakeSetup;
    {procedure VBMakeFindMin;}
    procedure VBMakeFindStock;
    procedure VBMakeFindOrders;
    procedure VBMakeFindAlloc;
    procedure VBMakeFindWeaving;
    procedure VBMakeFindWoven;
    procedure VBMakeFindFinished;
    procedure VBMakeFindSlit;
    procedure VBMakeCalcSales;
    procedure VBMakeCompute;
    procedure PrintHeader;
    procedure PrintTrackLHSColumnNames;
    procedure PrintTrackRHSColumnNames;
    procedure PrintTrackLHS;
    procedure PrintTrackRHS;
    procedure PrintPlanLHSColumnNames;
{    procedure PrintPlanRHSColumnNames;}
    procedure PrintPlanLHS;
{    procedure PrintPlanRHS;}
    procedure PrintLine(Items: TStringList);
  public
    { Public declarations }
  end;

var
  VBMakeForm: TVBMakeForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs,printers, Pickdate;

const StkMinQty=1; {make twice the stock minimum; 1 on 1/8/97}

procedure TVBMakeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{  if VBMake.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;}
  VBParamsQuery.Close;
  VBMake.Close;
  VBMakeForm.Release;
end;

procedure TVBMakeForm.FormShow(Sender: TObject);
begin
  VBMake.Open;
  VBParamsQuery.Open;
  StatusBar.Panels.Items[1].Text:='Ready';
end;

procedure TVBMakeForm.CloseBitBtnClick(Sender: TObject);
begin
{  if VBMake.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Make before closing',
      mtInformation, [mbOK], 0)
  else}
    Close;
end;

procedure TVBMakeForm.VBMakeDelete;
begin
  StatusBar.Panels.Items[1].Text:='Getting Ready';
  VBMake.First;
  Application.ProcessMessages;
{  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('delete from vbmake');
  MyQuery.Prepare;
  MyQuery.ExecSQL;
  MyQuery.Close;}
  SPVBMakeDelete.ExecProc;
end;

procedure TVBMakeForm.VBMakeSetup;
begin
  StatusBar.Panels.Items[1].Text:='Fetching Types';
  VBMake.First;
  Application.ProcessMessages;
{  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('insert into vbmake (vbstru,vbcol,warptype,warpcol,');
  MyQuery.SQL.Add('pcewarplength,pcefinlength,pcewft1weight,weft1stru,');
  MyQuery.SQL.Add('weft1twist,weft1col,wft1ynstock)');
  MyQuery.SQL.Add('select vt.vbstru,vt.vbcol,vt.warptype,vt.warpcol,');
  MyQuery.SQL.Add('vs.pcewarplength,vs.pcefinlength,vs.weft1weight,vt.weftstru,');
  MyQuery.SQL.Add('vt.wefttwist,vt.weftcol,yt.instock+yt.weavewip');
  MyQuery.SQL.Add('from vbtype vt,vbstru vs,yarntype yt');
  MyQuery.SQL.Add('where vt.vbstru=vs.vbstru');
  MyQuery.SQL.Add('and vt.weftstru=yt.ynstru');
  MyQuery.SQL.Add('and vt.wefttwist=yt.yntwist');
  MyQuery.SQL.Add('and vt.weftcol=yt.yncol');
  MyQuery.Prepare;
  MyQuery.ExecSQL;
  VBMake.Refresh;
  MyQuery.Close;}
  SPVBMakeSetup.ExecProc;
end;

{procedure TVBMakeForm.VBMakeFindMin;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Fetching Minima';
  VBMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vbstru,vbcol,vbwidth,stkmin');
  MyQuery.SQL.Add('from vbstockmin');
  MyQuery.SQL.Add('where stkmin<>0');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    VBMake.SetKey;
    VBMakeVBStru.Value:=MyQuery.Fields[0].AsString;
    VBMakeVBCol.Value:=MyQuery.Fields[1].AsString;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not VBMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      VBMake.Refresh;
      raise Exception.Create('Min:Error at '+ErrorString);
    end;
    VBMake.Edit;
    if MyQuery.Fields[2].AsInteger=89 then
      VBMakeMin89.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=127 then
      VBMakeMin127.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=2070 then
      VBMakeMin2070.Value:=MyQuery.Fields[3].AsInteger;
    VBMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end;}

procedure TVBMakeForm.VBMakeFindStock;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Calculating Stock';
  VBMake.First;
{  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,vr.metricwidth,sum(vr.netlength)');
  MyQuery.SQL.Add('from vbrcpt vr left join vbdesphdr vh');
  MyQuery.SQL.Add('on vr.despno=vh.despno');
  MyQuery.SQL.Add('where ((vr.despno=0 and vh.despsent is null)');
  MyQuery.SQL.Add('or (vr.despno<>0 and vh.despsent=''N''))');
  MyQuery.SQL.Add('and (vr.qlty='''')');
  MyQuery.SQL.Add('and (vr.netlength<>0)');
  MyQuery.SQL.Add('group by vr.vbstru,vr.vbcol,vr.metricwidth');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    VBMake.SetKey;
    VBMakeVBStru.Value:=MyQuery.Fields[0].AsString;
    VBMakeVBCol.Value:=MyQuery.Fields[1].AsString;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not VBMake.GotoKey then
      raise Exception.Create('Stock:Error at '+ErrorString);
    VBMake.Edit;
    if MyQuery.Fields[2].AsInteger=89 then
      VBMakeStk89.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=127 then
      VBMakeStk127.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=2070 then
      VBMakeStk2070.Value:=MyQuery.Fields[3].AsInteger;
    VBMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;}
  SPVBMakeFindStock.ExecProc;
end;

procedure TVBMakeForm.VBMakeFindOrders;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Calculating Orders';
  VBMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vbstru,vbcol,vbwidth,sum(qty-qtydel)');
  MyQuery.SQL.Add('from vborddet');
  MyQuery.SQL.Add('where status<>''C''');
  MyQuery.SQL.Add('group by vbstru,vbcol,vbwidth');
  MyQuery.SQL.Add('having sum(qty-qtydel)<>0');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    VBMake.SetKey;
    VBMakeVBStru.Value:=MyQuery.Fields[0].AsString;
    VBMakeVBCol.Value:=MyQuery.Fields[1].AsString;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not VBMake.GotoKey then
      raise Exception.Create('Orders:Error at '+ErrorString);
    VBMake.Edit;
    if MyQuery.Fields[2].AsInteger=89 then
      VBMakeOrd89.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=127 then
      VBMakeOrd127.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=2070 then
      VBMakeOrd2070.Value:=MyQuery.Fields[3].AsInteger;
    VBMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end;

procedure TVBMakeForm.VBMakeFindAlloc;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Calculating Alloc';
  VBMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vbstru,vbcol,metricwidth,sum(vr.netlength) allocated');
  MyQuery.SQL.Add('from vbrcpt vr left join vbdesphdr vh');
  MyQuery.SQL.Add('on vr.despno=vh.despno');
  MyQuery.SQL.Add('where (vr.vtordno<>0)');
  MyQuery.SQL.Add('and ((vr.despno=0 and vh.despsent is null)');
  MyQuery.SQL.Add('or (vr.despno<>0 and vh.despsent=''N''))');
  MyQuery.SQL.Add('group by vbstru,vbcol,metricwidth');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    VBMake.SetKey;
    VBMakeVBStru.Value:=MyQuery.Fields[0].AsString;
    VBMakeVBCol.Value:=MyQuery.Fields[1].AsString;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not VBMake.GotoKey then
      raise Exception.Create('Alloc:Error at '+ErrorString);
    VBMake.Edit;
    if MyQuery.Fields[2].AsInteger=89 then
    begin
      VBMakeAlloc89.Value:=MyQuery.Fields[3].AsInteger;
      VBMakeRemain89.Value:=VBMakeStk89.Value-MyQuery.Fields[3].AsInteger;
    end
    else if MyQuery.Fields[2].AsInteger=127 then
    begin
      VBMakeAlloc127.Value:=MyQuery.Fields[3].AsInteger;
      VBMakeRemain127.Value:=VBMakeStk127.Value-MyQuery.Fields[3].AsInteger;
    end
    else if MyQuery.Fields[2].AsInteger=2070 then
    begin
      VBMakeAlloc2070.Value:=MyQuery.Fields[3].AsInteger;
      VBMakeRemain2070.Value:=VBMakeStk2070.Value-MyQuery.Fields[3].AsInteger;
    end;
    VBMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end;

procedure TVBMakeForm.VBMakeFindWeaving;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Calculating Weaving WIP';
  VBMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  {weavelength added DL121296}
  MyQuery.SQL.Add('select vbstru,vbcol,sum(weavelength),sum(greigelength)');
  MyQuery.SQL.Add('from greigercpt');
  MyQuery.SQL.Add('where status=''W''');
  MyQuery.SQL.Add('group by vbstru,vbcol');
  MyQuery.SQL.Add('having ((sum(greigelength)<>0) or (sum(weavelength)<>0))');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    VBMake.SetKey;
    VBMakeVBStru.Value:=MyQuery.Fields[0].AsString;
    VBMakeVBCol.Value:=MyQuery.Fields[1].AsString;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not VBMake.GotoKey then
      raise Exception.Create('Weaving:Error at '+ErrorString);
    VBMake.Edit;
    VBMakeWWip.Value:=MyQuery.Fields[2].AsFloat-MyQuery.Fields[3].AsFloat; {/160 removed 9/12/96DL}
    VBMakeVWip.Value:=MyQuery.Fields[3].AsFloat; {added DL121296}
    VBMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end;

procedure TVBMakeForm.VBMakeFindWoven;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Calculating Woven WIP';
  VBMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vbstru,vbcol,sum(greigelength)');
  MyQuery.SQL.Add('from greigercpt');
  MyQuery.SQL.Add('where status=''V''');
  MyQuery.SQL.Add('group by vbstru,vbcol');
  MyQuery.SQL.Add('having sum(greigelength)<>0');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    VBMake.SetKey;
    VBMakeVBStru.Value:=MyQuery.Fields[0].AsString;
    VBMakeVBCol.Value:=MyQuery.Fields[1].AsString;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not VBMake.GotoKey then
      raise Exception.Create('Woven:Error at '+ErrorString);
    VBMake.Edit;
    {sum added DL121296}
    VBMakeVWip.Value:=VBMakeVWip.Value+MyQuery.Fields[2].AsFloat; {/160 removed 9/12/96DL}
    VBMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end;

procedure TVBMakeForm.VBMakeFindFinished;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Calculating Finished WIP';
  VBMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vbstru,vbcol,sum(finlength)');
  MyQuery.SQL.Add('from greigercpt');
  MyQuery.SQL.Add('where status=''F''');
  MyQuery.SQL.Add('group by vbstru,vbcol');
  MyQuery.SQL.Add('having sum(finlength)<>0');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    VBMake.SetKey;
    VBMakeVBStru.Value:=MyQuery.Fields[0].AsString;
    VBMakeVBCol.Value:=MyQuery.Fields[1].AsString;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not VBMake.GotoKey then
      raise Exception.Create('Finished:Error at '+ErrorString);
    VBMake.Edit;
    VBMakeFWip.Value:=MyQuery.Fields[2].AsFloat; {/150 removed 9/12/96DL}
    VBMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end;

procedure TVBMakeForm.VBMakeFindSlit;
{xx}
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Calculating Slit WIP';
  VBMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select gr.vbstru,gr.vbcol,sum(vr.grosslength/vw.strips)');
  MyQuery.SQL.Add('from vbrcpt vr,vbwidth vw,greigercpt gr');
  MyQuery.SQL.Add('where vr.warpno=gr.warpno');
  MyQuery.SQL.Add('and vr.greigeno=gr.greigeno');
  MyQuery.SQL.Add('and gr.status=''F''');
  MyQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
  MyQuery.SQL.Add('and vr.returned=''N''');
  MyQuery.SQL.Add('and vr.datemanu<='''+ToDateStr+''''); {added DL030497}
{  MyQuery.SQL.Add('and vr.datemanu<=''2-mar-1997''');xx for eomonth}
  MyQuery.SQL.Add('group by gr.vbstru,gr.vbcol');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    VBMake.SetKey;
    VBMakeVBStru.Value:=MyQuery.Fields[0].AsString;
    VBMakeVBCol.Value:=MyQuery.Fields[1].AsString;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not VBMake.GotoKey then
      raise Exception.Create('Slit:Error at '+ErrorString);
    VBMake.Edit;
    VBMakeFWip.Value:=VBMakeFWIP.Value-MyQuery.Fields[2].AsFloat;
    VBMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end;

procedure TVBMakeForm.VBMakeCalcSales;
var
  ErrorString:string[4];
  QueryFromDate:string[11];
begin
  StatusBar.Panels.Items[1].Text:='Calculating Average Monthly Sales (and StkMin) per formula';
  VBMake.First;
  Application.ProcessMessages;
  SPVBMakeCalcSales.ExecProc;
  {maco=0; fresco=0}
  {calc min date}
{  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,min(vh.despdate)');
  MyQuery.SQL.Add('from vbdesphdr vh,vbrcpt vr');
  MyQuery.SQL.Add('where (vh.despsent=''Y'')');
  MyQuery.SQL.Add('and (vh.despno=vr.despno)');
  MyQuery.SQL.Add('and (vr.qlty='''')');
  MyQuery.SQL.Add('group by vr.vbstru,vr.vbcol');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    VBMake.SetKey;
    VBMakeVBStru.Value:=MyQuery.Fields[0].AsString;
    VBMakeVBCol.Value:=MyQuery.Fields[1].AsString;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not VBMake.GotoKey then
      raise Exception.Create('Sales:Error at '+ErrorString);
    if MyQuery.Fields[2].AsFloat<>0 then
    begin
      VBMake.Edit;
      VBMakeFirstSaleDate.Value:=MyQuery.Fields[2].AsFloat;
      VBMakeMonthsSales.Value:=trunc((date-VBMakeFirstSaleDate.AsFloat)/30.3333);
      if (date-VBMakeFirstSaleDate.AsFloat)>180 then
        VBMakeDivByDays.Value:=180
      else
        VBMakeDivByDays.Value:=trunc(date-VBMakeFirstSaleDate.AsFloat);
      VBMake.Post;
    end;
    MyQuery.Next;
  end;
  MyQuery.Close;
  calc ave of sales
  QueryFromDate:=FormatDateTime('dd-mmm-yyyy',(date-180));
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,vr.metricwidth,sum(netlength)');
  MyQuery.SQL.Add('from vbdesphdr vh,vbrcpt vr');
  MyQuery.SQL.Add('where (vh.despsent=''Y'')');
  MyQuery.SQL.Add('and (vh.despno=vr.despno)');
  MyQuery.SQL.Add('and (vr.qlty='''')');
  MyQuery.SQL.Add('and vh.despdate>='''+QueryFromDate+'''');
  MyQuery.SQL.Add('group by vr.vbstru,vr.vbcol,vr.metricwidth');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    VBMake.SetKey;
    VBMakeVBStru.Value:=MyQuery.Fields[0].AsString;
    VBMakeVBCol.Value:=MyQuery.Fields[1].AsString;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not VBMake.GotoKey then
      raise Exception.Create('Sales:Error at '+ErrorString);
    VBMake.Edit;
    if VBMakeDivByDays.AsInteger<>0 then
    begin
      if MyQuery.Fields[2].AsInteger=89 then
      begin
        if VBMakeDivByDays.AsInteger<=30 then if added DL180897
          VBMakeSale89.Value:=MyQuery.Fields[3].AsInteger
        else
          VBMakeSale89.Value:=trunc(MyQuery.Fields[3].AsInteger/(VBMakeDivByDays.AsInteger)*30);
        if (MyQuery.Fields[0].AsString<>'M') and (MyQuery.Fields[0].AsString<>'F') then
          VBMakeMin89.Value:=VBMakeSale89.AsInteger; else zero by default
      end
      else if MyQuery.Fields[2].AsInteger=127 then
      begin
        if VBMakeDivByDays.AsInteger<=30 then if added DL180897
          VBMakeSale127.Value:=MyQuery.Fields[3].AsInteger
        else
          VBMakeSale127.Value:=trunc(MyQuery.Fields[3].AsInteger/(VBMakeDivByDays.AsInteger)*30);
        if (MyQuery.Fields[0].AsString<>'M') and (MyQuery.Fields[0].AsString<>'F') then
          VBMakeMin127.Value:=VBMakeSale127.AsInteger; else zero by default
      end
      else if MyQuery.Fields[2].AsInteger=2070 then
      begin
        if VBMakeDivByDays.AsInteger<=30 then if added DL180897
          VBMakeSale2070.Value:=MyQuery.Fields[3].AsInteger
        else
          VBMakeSale2070.Value:=trunc(MyQuery.Fields[3].AsInteger/(VBMakeDivByDays.AsInteger)*30);
        if (MyQuery.Fields[0].AsString<>'M') and (MyQuery.Fields[0].AsString<>'F') then
          VBMakeMin2070.Value:=VBMakeSale2070.AsInteger; else zero by default
      end;
    end;
    VBMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;}
end;

procedure TVBMakeForm.VBMakeCompute;
{var
  ErrorString:string[4];}
begin
  StatusBar.Panels.Items[1].Text:='Computing metre Rqts';
  VBMake.First;
  Application.ProcessMessages;
  VBMake.First;
  while not VBMake.EOF do
  begin
    {next if statement so that we don't do unnecessary calcs and posts}
{    if (VBMakeStk127.Value<VBMakeMin127.Value) or
         (VBMakeOrd127.Value>VBMakeStk127.Value) or
       (VBMakeStk89.Value<VBMakeMin89.Value) or
         (VBMakeOrd89.Value>VBMakeStk89.Value) or
       (VBMakeStk2070.Value<VBMakeMin2070.Value) or
         (VBMakeOrd2070.Value>VBMakeStk2070.Value) then
    begin}
    VBMake.Edit;
    if VBMakeOrd127.Value>VBMakeStk127.Value then
      VBMakePOrd127.Value:=(VBMakeOrd127.Value-VBMakeStk127.Value)/16; {2400}
    if VBMakeStk127.Value-VBMakeOrd127.Value<VBMakeMin127.Value then
      VBMakePStk127.Value:=(((VBMakeMin127.Value*StkMinQty)+
        VBMakeOrd127.Value-VBMakeStk127.Value)/16)-
        VBMakePOrd127.Value;
    if VBMakeOrd89.Value>VBMakeStk89.Value then
      VBMakePOrd89.Value:=(VBMakeOrd89.Value-VBMakeStk89.Value)/23; {3450}
    if VBMakeStk89.Value-VBMakeOrd89.Value<VBMakeMin89.Value then
      VBMakePStk89.Value:=(((VBMakeMin89.Value*StkMinQty)+
        VBMakeOrd89.Value-VBMakeStk89.Value)/23)-
        VBMakePOrd89.Value;
    if VBMakeOrd2070.Value>VBMakeStk2070.Value then
      VBMakePOrd2070.Value:=(VBMakeOrd2070.Value-VBMakeStk2070.Value); {/150}
    if VBMakeStk2070.Value-VBMakeOrd2070.Value<VBMakeMin2070.Value then
      VBMakePStk2070.Value:=(((VBMakeMin2070.Value*StkMinQty)+
        VBMakeOrd2070.Value-VBMakeStk2070.Value)/1)-
        VBMakePOrd2070.Value;
    if VBMakePOrd127.Value+VBMakePOrd89.Value+VBMakePOrd2070.Value>0 then
    begin
      VBMakePTotOrd.Value:=VBMakePOrd127.Value+VBMakePOrd89.Value
        +VBMakePOrd2070.Value;
    end;
    if VBMakePStk127.Value+VBMakePStk89.Value+VBMakePStk2070.Value>0 then
    begin
{      VBMake.Edit;}
      VBMakePTotStk.Value:=VBMakePStk127.Value+VBMakePStk89.Value
        +VBMakePStk2070.Value;
    end;
    if VBMakePTotOrd.Value+VBMakePTotStk.Value>0 then
    begin
{      VBMake.Edit;}
      VBMakePTotRqd.Value:=VBMakePTotOrd.Value+VBMakePTotStk.Value;
    end;
    if VBMakePTotRqd.Value>0 then {round up to nearest number of pieces}
    begin
      {VBMakeWWIP.Value added DL180897}
      {VBMakePcsRqd.Value:=int(((VBMakePTotRqd.Value-
        VBMakeWWIP.Value-VBMakeVWIP.Value-
        VBMakeFWIP.Value)/VBMakePceFinLength.Value)+1);}
      VBMakePcsRqd.Value:=(VBMakePTotRqd.Value-
        VBMakeWWIP.Value-VBMakeVWIP.Value-
        VBMakeFWIP.Value)/VBMakePceFinLength.Value; {don't round up DL180897}
      if VBMakePcsRqd.Value<0 then
        VBMakePcsRqd.Value:=0;
    end;
    if VBMakePcsRqd.Value>0 then
    begin
      VBMakeFWSlitmRqd.Value:=VBMakePcsRqd.Value*VBMakePceFinLength.Value;
      VBMakeFWWarpmRqd.Value:=VBMakePcsRqd.Value*VBMakePceWarpLength.Value;
      VBMakeWft1YnRqd.Value:=VBMakePcsRqd.Value*VBMakePceWft1Weight.Value;
      VBMakeWft1ToSpin.Value:=VBMakeWft1YnRqd.Value-VBMakeWft1YnStock.Value;
      if VBMakeWft1ToSpin.Value<0 then
        VBMakeWft1ToSpin.Value:=0;
    end;
    {calc yn in stock}
    {calc rqd to spin}
{    if VBMake.State=dsEdit then}
      VBMake.Post;
{    end;}
    VBMake.Next;
  end;
  VBMake.First;
end;

procedure TVBMakeForm.VBMakeGetToDate();
begin
  BrDateForm.Date:=date;  {start with today's date}
  if BRDateForm.ShowModal=mrOK then
  begin
    ToDate:=BRDateForm.Date;
    ToDateStr:=FormatDateTime('dd-mmm-yyyy',BRDateForm.Date); {dd mmm yyyy}
  end;
end;

procedure TVBMakeForm.RunMakeBtnClick(Sender: TObject);
begin
  {1. delete records from VBMake}
  {2. set up VBMake Stru and Col incl pcs length and weight}
  {3. find minimum values for Stru and Col}
  {4. find stock values for Stru and Col for 89,127,2070 (firsts)}
  {5. find outstanding order quantities}
  {6. find wip full width greige metres}
  {7. calculate total sales}
  {8. compute metre (was piece) requirements+compute planned pieces and weft yn rqts}
  VBMakeGetToDate();
  Screen.Cursor := crHourglass;                 { Show hourglass cursor }
  Application.ProcessMessages;
  VBMake.Close;
  VBMake.ReadOnly:=false; {added DL4/2/97}
  VBMake.Open;
  MainForm.Database.StartTransaction;
  MyQuery.Close;
  VBMakeDelete; {SP}
  VBMakeSetup; {SP}
  VBMakeCalcSales; {SP} {added DL4/2/97} {moved to front on 1/8/97}
  {VBMakeFindMin; {set to average sales on 1/8/97}
  VBMakeFindStock; {SP}
  VBMake.Refresh;
  VBMakeFindOrders;
  VBMakeFindAlloc;
  VBMakeFindWeaving;
  VBMakeFindWoven;
  VBMakeFindFinished;
  VBMakeFindSlit; {added DL4/2/97 so that slit metres removed from partly slip warps}
  VBMakeCompute;
  VBParamsQuery.Edit;
  VBParamsQueryMakeDate.ReadOnly:=false;
  if ToDateStr<>FormatDateTime('dd-mmm-yyyy',date) then
    VBParamsQueryMakeDate.Value:=ToDate
  else
    VBParamsQueryMakeDate.Value:=now;
  VBParamsQueryMakeDate.ReadOnly:=true;
  VBParamsQuery.Post;
{  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vbstru,vbcol');
  MyQuery.SQL.Add('from vbstru');
  MyQuery.Prepare;
  MyQuery.Params[0].AsInteger:=GreigeRcptWarpNo.Value;
  MyQuery.Params[1].AsInteger:=GreigeRcptGreigeNo.Value;
  MyQuery.Open;
  SpinEditPieceNo.MinValue:=MyQuery.Fields[0].AsInteger;}
  MainForm.Database.Commit;
  VBMake.Close;
  VBMake.ReadOnly:=true; {added DL4/2/97}
  VBMake.Open;
  Screen.Cursor := crDefault;                  { Always restore to normal }
  StatusBar.Panels.Items[1].Text:='Ready';
  Application.ProcessMessages;
end;

procedure TVBMakeForm.PrintHeader;
{var
  SaveFont: TFont;}
begin
  { Save the current printer's font and assign Edit1's font to Printer }
{  SaveFont := TFont.Create;
  Savefont.Assign(Printer.Canvas.Font);
  {Printer.Canvas.Font.Assign(Edit1.Font);}
  Printer.Canvas.Font.Style := [];     { Set to normal style }

  { Print out the Header }
  with Printer do begin
    if not Printer.Aborted then
      Canvas.TextOut((PageWidth div 2)-(Canvas.TextWidth(HeaderDescr) div 2),
                      0, HeaderDescr);
    { Increment AmountPrinted by the LineHeight }
    AmountPrinted := AmountPrinted + LineHeight+TenthsOfInchPixelsY;
  end;
{  Printer.Canvas.Font.Assign(SaveFont);   { Re-assign the old font }
{  SaveFont.Free;                          { Free the saved font }
end;

procedure TVBMakeForm.PrintLine(Items: TStringList);
var
  OutRect: TRect;
  Inches: double;
  i: integer;
begin
  OutRect.Left := 0;                           { left position is zero }
  OutRect.Top := AmountPrinted;                { Set Top to Amount printed }
  OutRect.Bottom := OutRect.Top + LineHeight;  { Set bottom position }
  With Printer.Canvas do
    for i := 0 to Items.Count - 1 do begin
      Inches := longint(Items.Objects[i]) * 0.1;                     { Get inches }
      OutRect.Right := OutRect.Left + round(PixelsInInchx*Inches);   { Determine Right position }
      if not Printer.Aborted then
        TextRect(OutRect, OutRect.Left, OutRect.Top, Items[i]);      { Print the line }
      OutRect.Left := OutRect.Right;                                 { Set left to Right }
    end;
  { Increment the amount printed }
  AmountPrinted := AmountPrinted + TenthsOfInchPixelsY*2;
end;

procedure TVBMakeForm.PrintTrackLHSColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  with ColNames do begin
    { Create the column headers }
    AddObject('WpTyp', pointer(5));
    AddObject('Type', pointer(4));
    AddObject('NB', pointer(2)); {added DL200897} {used for months sales,etc}
    {127}
    AddObject('Min127', pointer(6));
    AddObject('Stk', pointer(6));
    AddObject('Ord', pointer(6));
    AddObject('m Ord', pointer(6));
    AddObject('m Stk', pointer(6));
    {89}
    AddObject('Min89', pointer(6));
    AddObject('Stk', pointer(6));
    AddObject('Ord', pointer(6));
    AddObject('m Ord', pointer(6));
    AddObject('m Stk', pointer(6));
  end;
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;

procedure TVBMakeForm.PrintTrackLHS;
var
  Items: TStringList;
  TempStr:string[20];
begin
  Items := TStringList.Create;              { Create a new TStringList }
  PixelsInInchx := GetDeviceCaps(Printer.Handle, LOGPIXELSX); { Get Pixels per inch horizonally}
  TenthsOfInchPixelsY := GetDeviceCaps(Printer.Handle, LOGPIXELSY) div 10;

  AmountPrinted := 0;
  try
{    ColReportForm.Enabled := false;                    { Disable the parent Form }
    Printer.BeginDoc;                                  { Initiate a print job }
{    AbortForm.Show;
    Application.ProcessMessages;                       { Allow Drawing of abort box }
    { Calculate an arbitrary line height }
    LineHeight := Printer.Canvas.TextHeight('X')+TenthsOfInchPixelsY;
    PrintHeader;                                     { Print the header }
    PrintTrackLHSColumnNames;                                  { Print the column Names }
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select vm.warptype,vm.vbstru,vm.vbcol,vm.min127,vm.stk127,vm.ord127,');
    MyQuery.SQL.Add('vm.pord127,vm.pstk127,vm.min89,vm.stk89,vm.ord89,vm.pord89,vm.pstk89,vm.monthssales');
    MyQuery.SQL.Add('from vbmake vm');
    MyQuery.SQL.Add('where VBStru<>''Z''');
    {MyQuery.SQL.Add('and ((pord127<>0) or (pstk127<>0)');
    MyQuery.SQL.Add('or (pord89<>0) or (pstk89<>0)');
    MyQuery.SQL.Add('or (pord2070<>0) or (pstk2070<>0)');
    MyQuery.SQL.Add('or (ptotord<>0) or (ptotstk<>0)');
    MyQuery.SQL.Add('or (WWIP<>0) or (VWIP<>0) or (FWIP<>0))');}
    MyQuery.SQL.Add('order by vm.warptype,vm.vbstru,vm.vbcol');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    { Add the data in the fields into a TStringList in the order that they are }
    { Going to be printed }
    while not MyQuery.EOF do
    begin
{      Application.ProcessMessages;
      if Printer.Aborted then
        exit;}
      with Items do begin
        AddObject(MyQuery.FieldByName('WARPTYPE').AsString,
                        pointer(5));
        TempStr:=MyQuery.FieldByName('VBSTRU').AsString+
          MyQuery.FieldByName('VBCOL').AsString;
        AddObject(TempStr,pointer(4));
        if (MyQuery.FieldByName('MONTHSSALES').AsInteger>=6) then {added DL200897}
          TempStr:=''
        else
          TempStr:=FormatFloat('0', MyQuery.FieldByName('MONTHSSALES').AsFloat);
        AddObject(TempStr,pointer(2));          
        {127}
        AddObject(MyQuery.FieldByName('MIN127').AsString,pointer(6));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('STK127').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('ORD127').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PORD127').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PSTK127').AsFloat);
        AddObject(TempStr,pointer(6));
        {89}
        AddObject(MyQuery.FieldByName('MIN89').AsString,pointer(6));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('STK89').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('ORD89').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PORD89').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PSTK89').AsFloat);
        AddObject(TempStr,pointer(6));
      end;
      PrintLine(Items);   { Print the line }
      { Force printjob to begin a new page if printed output has exceeded the }
      { Page height }
      if AmountPrinted + LineHeight > Printer.PageHeight then
      begin
        AmountPrinted := 0;         { Reset to zero }
        if not Printer.Aborted then
          Printer.NewPage;          { Force page eject }
        PrintHeader;                { Print the header again }
        PrintTrackLHSColumnNames;           { Print the column names again }
      end;
      Items.Clear;                  { Clear this record from the TStringList }
      MyQuery.Next;                  { Go to the next record }
    end;
{    AbortForm.Hide;                 { Hide the abort form, no longer needed }
    if not Printer.Aborted then
      Printer.EndDoc;               { End the print job }
{    ColReportForm.Enabled := true;}
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end;
  Items.Free;                       { Free the TStringList }
  MyQuery.Close;
end;

procedure TVBMakeForm.PrintTrackRHSColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  with ColNames do begin
    { Create the column headers }
    AddObject('WpTyp', pointer(5));
    AddObject('Type', pointer(4));
    {2070 = Full Width = FW}
    AddObject('Min FW', pointer(6));
    AddObject('Stk', pointer(6));
    AddObject('Ord', pointer(6));
    AddObject('m Ord', pointer(6));
    AddObject('m Stk', pointer(6));
    {totals}
    AddObject('m TOrd', pointer(6));
    AddObject('m TStk', pointer(6));
    AddObject('m TRqd', pointer(6));
    AddObject('W WIP', pointer(6));
    AddObject('V WIP', pointer(6));
    AddObject('F WIP', pointer(6));
  end;
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;

procedure TVBMakeForm.PrintTrackRHS;
var
  Items: TStringList;
  TempStr:string[20];
begin
  Items := TStringList.Create;              { Create a new TStringList }
  PixelsInInchx := GetDeviceCaps(Printer.Handle, LOGPIXELSX); { Get Pixels per inch horizonally}
  TenthsOfInchPixelsY := GetDeviceCaps(Printer.Handle, LOGPIXELSY) div 10;

  AmountPrinted := 0;
  try
{    ColReportForm.Enabled := false;                    { Disable the parent Form }
    Printer.BeginDoc;                                  { Initiate a print job }
{    AbortForm.Show;
    Application.ProcessMessages;                       { Allow Drawing of abort box }
    { Calculate an arbitrary line height }
    LineHeight := Printer.Canvas.TextHeight('X')+TenthsOfInchPixelsY;
    PrintHeader;                                     { Print the header }
    PrintTrackRHSColumnNames;                          { Print the column Names }
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select vm.warptype,vm.vbstru,vm.vbcol,');
    MyQuery.SQL.Add('vm.min2070,vm.stk2070,vm.ord2070,vm.pord2070,vm.pstk2070,');
    MyQuery.SQL.Add('vm.ptotord,vm.ptotstk,vm.ptotrqd,vm.wwip,vm.vwip,vm.fwip');
    MyQuery.SQL.Add('from vbmake vm');
    MyQuery.SQL.Add('where VBStru<>''Z''');
    {MyQuery.SQL.Add('and ((pord127<>0) or (pstk127<>0)');
    MyQuery.SQL.Add('or (pord89<>0) or (pstk89<>0)');
    MyQuery.SQL.Add('or (pord2070<>0) or (pstk2070<>0)');
    MyQuery.SQL.Add('or (ptotord<>0) or (ptotstk<>0)');
    MyQuery.SQL.Add('or (WWIP<>0) or (VWIP<>0) or (FWIP<>0))');}
    MyQuery.SQL.Add('order by vm.warptype,vm.vbstru,vm.vbcol');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    { Add the data in the fields into a TStringList in the order that they are }
    { Going to be printed }
    while not MyQuery.EOF do
    begin
{      Application.ProcessMessages;
      if Printer.Aborted then
        exit;}
      with Items do begin
        AddObject(MyQuery.FieldByName('WARPTYPE').AsString,
                        pointer(5));
        TempStr:=MyQuery.FieldByName('VBSTRU').AsString+
          MyQuery.FieldByName('VBCOL').AsString;
        AddObject(TempStr,pointer(4));
        {2070}
        AddObject(MyQuery.FieldByName('MIN2070').AsString,pointer(6));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('STK2070').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('ORD2070').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PORD2070').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PSTK2070').AsFloat);
        AddObject(TempStr,pointer(6));
        {Totals}
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PTOTORD').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PTOTSTK').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PTOTRQD').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('WWIP').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('VWIP').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('FWIP').AsFloat);
        AddObject(TempStr,pointer(6));
      end;
      PrintLine(Items);   { Print the line }
      { Force printjob to begin a new page if printed output has exceeded the }
      { Page height }
      if AmountPrinted + LineHeight > Printer.PageHeight then
      begin
        AmountPrinted := 0;         { Reset to zero }
        if not Printer.Aborted then
          Printer.NewPage;          { Force page eject }
        PrintHeader;                { Print the header again }
        PrintTrackRHSColumnNames;           { Print the column names again }
      end;
      Items.Clear;                  { Clear this record from the TStringList }
      MyQuery.Next;                  { Go to the next record }
    end;
{    AbortForm.Hide;                 { Hide the abort form, no longer needed }
    if not Printer.Aborted then
      Printer.EndDoc;               { End the print job }
{    ColReportForm.Enabled := true;}
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end;
  Items.Free;                       { Free the TStringList }
  MyQuery.Close;
end;

{------------start plan print}

procedure TVBMakeForm.PrintPlanLHSColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  with ColNames do begin
    { Create the column headers }
    AddObject('WtStru', pointer(5));
    AddObject('WtTw', pointer(4));
    AddObject('WtCol', pointer(4));
    AddObject('Wp', pointer(2));
    AddObject('Col', pointer(3));
    AddObject('Type', pointer(4));
    {totals}
    AddObject('NB', pointer(2));
    AddObject('m TOrd', pointer(5));
    AddObject('m TStk', pointer(5));
    AddObject('m TRqd', pointer(5));
    AddObject('s-o FW', pointer(5));
    AddObject('min FW', pointer(5));
    AddObject('W WIP', pointer(4));
    AddObject('V WIP', pointer(4));
    AddObject('F WIP', pointer(4));
    AddObject('PcsRqd', pointer(4));
    AddObject('Wp mRqd', pointer(6));
    AddObject('Wt YnRqd', pointer(7));
  end;
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;

procedure TVBMakeForm.PrintPlanLHS;
var
  Items: TStringList;
  TempStr:string[20];
begin
  Items := TStringList.Create;              { Create a new TStringList }
  PixelsInInchx := GetDeviceCaps(Printer.Handle, LOGPIXELSX); { Get Pixels per inch horizonally}
  TenthsOfInchPixelsY := GetDeviceCaps(Printer.Handle, LOGPIXELSY) div 10;

  AmountPrinted := 0;
  try
{    ColReportForm.Enabled := false;                    { Disable the parent Form }
    Printer.BeginDoc;                                  { Initiate a print job }
{    AbortForm.Show;
    Application.ProcessMessages;                       { Allow Drawing of abort box }
    { Calculate an arbitrary line height }
    LineHeight := Printer.Canvas.TextHeight('X')+TenthsOfInchPixelsY;
    PrintHeader;                                     { Print the header }
    PrintPlanLHSColumnNames;                                  { Print the column Names }
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select vm.warptype,vm.vbstru,vm.vbcol,');
    MyQuery.SQL.Add('vm.ptotord,vm.ptotstk,vm.ptotrqd,vm.wwip,vm.vwip,vm.fwip,');
    MyQuery.SQL.Add('vm.warpcol,vm.weft1stru,vm.weft1twist,vm.weft1col,');
    MyQuery.SQL.Add('vm.pcsrqd,vm.fwwarpmrqd,vm.wft1ynrqd,');
    MyQuery.SQL.Add('vm.wft1ynstock,vm.wft1tospin,(vm.stk2070-vm.ord2070) stk2070,');
    MyQuery.SQL.Add('vm.min2070,vm.monthssales');
    {vm.min2070 added DL180897}
    MyQuery.SQL.Add('from vbmake vm');
    MyQuery.SQL.Add('where VBStru<>''Z''');
    {MyQuery.SQL.Add('and ((pord127<>0) or (pstk127<>0)');
    MyQuery.SQL.Add('or (pord89<>0) or (pstk89<>0)');
    MyQuery.SQL.Add('or (pord2070<>0) or (pstk2070<>0)');
    MyQuery.SQL.Add('or (ptotord<>0) or (ptotstk<>0)');
    MyQuery.SQL.Add('or (WWIP<>0) or (VWIP<>0) or (FWIP<>0))');}
    MyQuery.SQL.Add('order by vm.weft1stru,vm.weft1twist,vm.weft1col');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    { Add the data in the fields into a TStringList in the order that they are }
    { Going to be printed }
    while not MyQuery.EOF do
    begin
{      Application.ProcessMessages;
      if Printer.Aborted then
        exit;}
      with Items do begin
        AddObject(MyQuery.FieldByName('WEFT1STRU').AsString,
                        pointer(5));
        AddObject(MyQuery.FieldByName('WEFT1TWIST').AsString,
                        pointer(4));
        AddObject(MyQuery.FieldByName('WEFT1COL').AsString,
                        pointer(4));
        AddObject(MyQuery.FieldByName('WARPTYPE').AsString,
                        pointer(2));
        AddObject(MyQuery.FieldByName('WARPCOL').AsString,
                        pointer(3));
        TempStr:=MyQuery.FieldByName('VBSTRU').AsString+
          MyQuery.FieldByName('VBCOL').AsString;
        AddObject(TempStr,pointer(4));
        {Totals}
        if (MyQuery.FieldByName('MONTHSSALES').AsInteger>=6) then {added DL200897}
          TempStr:=''
        else
          TempStr:=FormatFloat('0', MyQuery.FieldByName('MONTHSSALES').AsFloat);
        AddObject(TempStr,pointer(2));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PTOTORD').AsFloat);
        AddObject(TempStr,pointer(5));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PTOTSTK').AsFloat);
        AddObject(TempStr,pointer(5));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PTOTRQD').AsFloat);
        AddObject(TempStr,pointer(5));
        TempStr:=FormatFloat('0;"0";"0"', MyQuery.FieldByName('STK2070').AsFloat);
        AddObject(TempStr,pointer(5));
        TempStr:=FormatFloat('0;"0";"0"', MyQuery.FieldByName('MIN2070').AsFloat);
        AddObject(TempStr,pointer(5));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('WWIP').AsFloat);
        AddObject(TempStr,pointer(4));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('VWIP').AsFloat);
        AddObject(TempStr,pointer(4));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('FWIP').AsFloat);
        AddObject(TempStr,pointer(4));
        TempStr:=FormatFloat('#.#', MyQuery.FieldByName('PCSRQD').AsFloat);
        AddObject(TempStr,pointer(4));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('FWWARPMRQD').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('WFT1YNRQD').AsFloat);
        AddObject(TempStr,pointer(7));
      end;
      PrintLine(Items);   { Print the line }
      { Force printjob to begin a new page if printed output has exceeded the }
      { Page height }
      if AmountPrinted + LineHeight > Printer.PageHeight then
      begin
        AmountPrinted := 0;         { Reset to zero }
        if not Printer.Aborted then
          Printer.NewPage;          { Force page eject }
        PrintHeader;                { Print the header again }
        PrintPlanLHSColumnNames;           { Print the column names again }
      end;
      Items.Clear;                  { Clear this record from the TStringList }
      MyQuery.Next;                  { Go to the next record }
    end;
{    AbortForm.Hide;                 { Hide the abort form, no longer needed }
    if not Printer.Aborted then
      Printer.EndDoc;               { End the print job }
{    ColReportForm.Enabled := true;}
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end;
  Items.Free;                       { Free the TStringList }
  MyQuery.Close;
end;

{procedure TVBMakeForm.PrintPlanRHSColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;
  Printer.Canvas.Font.Style := [fsBold, fsUnderline];
  with ColNames do begin
    AddObject('WpTyp', pointer(5));
    AddObject('WpCol', pointer(5));
    AddObject('WtStru', pointer(6));
    AddObject('WtTw', pointer(4));
    AddObject('WtCol', pointer(5));
    AddObject('Type', pointer(4));
    AddObject('PcsRqd', pointer(6));
    AddObject('Wp mRqd', pointer(7));
    AddObject('Wt YnRqd', pointer(8));
    AddObject('Wt YnStk', pointer(8));
    AddObject('Wt ToSpn', pointer(8));
  end;
  PrintLine(ColNames);
  Printer.Canvas.Font.Style := [];
  ColNames.Free;
end;}

{procedure TVBMakeForm.PrintPlanRHS;
var
  Items: TStringList;
  TempStr:string[20];
begin
  Items := TStringList.Create;
  PixelsInInchx := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
  TenthsOfInchPixelsY := GetDeviceCaps(Printer.Handle, LOGPIXELSY) div 10;

  AmountPrinted := 0;
  try
    Printer.BeginDoc;
    LineHeight := Printer.Canvas.TextHeight('X')+TenthsOfInchPixelsY;
    PrintHeader;
    PrintPlanRHSColumnNames;
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select vm.warptype,vm.vbstru,vm.vbcol,');
    MyQuery.SQL.Add('vm.ptotord,vm.ptotstk,vm.ptotrqd,vm.wwip,vm.vwip,vm.fwip,');
    MyQuery.SQL.Add('vm.warpcol,vm.weft1stru,vm.weft1twist,vm.weft1col,');
    MyQuery.SQL.Add('vm.pcsrqd,vm.fwwarpmrqd,vm.wft1ynrqd,');
    MyQuery.SQL.Add('vm.wft1ynstock,vm.wft1tospin');
    MyQuery.SQL.Add('from vbmake vm');
    MyQuery.SQL.Add('where VBStru<>''Z''');
    MyQuery.SQL.Add('order by vm.warptype,vm.warpcol,vm.weft1col,vm.weft1stru,vm.weft1twist');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    while not MyQuery.EOF do
    begin
      with Items do begin
        AddObject(MyQuery.FieldByName('WARPTYPE').AsString,
                        pointer(5));
        AddObject(MyQuery.FieldByName('WARPCOL').AsString,
                        pointer(5));
        AddObject(MyQuery.FieldByName('WEFT1STRU').AsString,
                        pointer(6));
        AddObject(MyQuery.FieldByName('WEFT1TWIST').AsString,
                        pointer(4));
        AddObject(MyQuery.FieldByName('WEFT1COL').AsString,
                        pointer(5));
        TempStr:=MyQuery.FieldByName('VBSTRU').AsString+
          MyQuery.FieldByName('VBCOL').AsString;
        AddObject(TempStr,pointer(4));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('PCSRQD').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('FWWARPMRQD').AsFloat);
        AddObject(TempStr,pointer(7));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('WFT1YNRQD').AsFloat);
        AddObject(TempStr,pointer(8));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('WFT1YNSTOCK').AsFloat);
        AddObject(TempStr,pointer(8));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('WFT1TOSPIN').AsFloat);
        AddObject(TempStr,pointer(8));
      end;
      PrintLine(Items);
      if AmountPrinted + LineHeight > Printer.PageHeight then
      begin
        AmountPrinted := 0;
        if not Printer.Aborted then
          Printer.NewPage;
        PrintHeader;
        PrintPlanRHSColumnNames;
      end;
      Items.Clear;
      MyQuery.Next;
    end;
    if not Printer.Aborted then
      Printer.EndDoc;
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end;
  Items.Free;
  MyQuery.Close;
end;}

{---------end plan print}

procedure TVBMakeForm.PrintAllBtnClick(Sender: TObject);
var
  InputPorT:string;
begin
  if InputQuery('Print Options',
    'Print for Planning (p), for Tracking (t)', InputPorT) then
  begin
    InputPorT:=uppercase(InputPorT);
    if (InputPorT='P') then
    begin
      DateHeading:=FormatDateTime('dddd, mmmm d, yyyy hh:mm AM/PM',
        VBParamsQueryMakeDate.Value);
      HeaderDescr:='Production Planning as at '+DateHeading;
      PrintPlanLHS;
      {PrintPlanRHS;}
      VBMake.First;
    end
    else {if P is not entered print the tracking report}
    begin
      DateHeading:=FormatDateTime('dddd, mmmm d, yyyy hh:mm AM/PM',
        VBParamsQueryMakeDate.Value);
      HeaderDescr:='Production Tracking as at '+DateHeading;
      PrintTrackLHS;
      PrintTrackRHS;
      VBMake.First;
    end;
  end;
end;

procedure TVBMakeForm.FormResize(Sender: TObject);
begin
  VBMakeGrid.Align:=alNone;
  VBMakeGrid.Height:=VBMakeForm.Height-100;
  VBMakeGrid.Align:=alBottom;
end;

procedure TVBMakeForm.VBMakeGridDblClick(Sender: TObject);
var
  MsgStr:string[30];
begin
  MsgStr:='Row: '+VBMakeVBCol.AsString+
    '; Col: '+VBMakeGrid.SelectedField.DisplayLabel;
  ShowMessage(MsgStr);
end;

end.
