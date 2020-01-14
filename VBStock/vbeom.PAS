unit vbeom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, DB, DBTables, Mask, DBCtrls, ExtCtrls,
  ODPopCal, ODDBCommon;

type
  TVBEOMForm = class(TForm)
    RunEOMButton: TButton;
    StatusBar: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    CloseBitBtn: TBitBtn;
    MyQuery: TQuery;
    MEVBStock: TTable;
    MEVBStockVBSTRU: TStringField;
    MEVBStockVBCOL: TStringField;
    MEVBStockVBWIDTH: TSmallintField;
    MEVBStockYEARNO: TSmallintField;
    MEVBStockPERIODNO: TSmallintField;
    MEVBStockNETLENGTH: TFloatField;
    MEVBStockGROSSLENGTH: TFloatField;
    MEVBSlit: TTable;
    MEVBSlitVBSTRU: TStringField;
    MEVBSlitVBCOL: TStringField;
    MEVBSlitVBWIDTH: TSmallintField;
    MEVBSlitQLTY: TStringField;
    MEVBSlitYEARNO: TSmallintField;
    MEVBSlitPERIODNO: TSmallintField;
    MEVBSlitNETLENGTH: TFloatField;
    MEVBSlitGROSSLENGTH: TFloatField;
    MEVBWeaving: TTable;
    MEVBWeavingVBSTRU: TStringField;
    MEVBWeavingVBCOL: TStringField;
    MEVBWeavingYEARNO: TSmallintField;
    MEVBWeavingPERIODNO: TSmallintField;
    MEVBWeavingGREIGEMANU: TFloatField;
    MEVBWeavingGREIGEOPWIP: TFloatField;
    MEVBWeavingGREIGECLWIP: TFloatField;
    MEVBWeavingGREIGEPROD: TFloatField;
    MEVBWeavingFINMANU: TFloatField;
    MEVBWeavingFINOPWIP: TFloatField;
    MEVBWeavingFINCLWIP: TFloatField;
    MEVBWeavingFINPROD: TFloatField;
    MEVBWeavingGROSSSLIT: TFloatField;
    MEVBWeavingNETSLIT: TFloatField;
    RunYnEOMBtn: TButton;
    MEWeftUsed: TTable;
    VBParams: TTable;
    VBParamsSource: TDataSource;
    VBParamsREF: TSmallintField;
    VBParamsLASTMEYEARNO: TSmallintField;
    VBParamsLASTMEPERIODNO: TSmallintField;
    VBParamsMEINPROGRESS: TStringField;
    MEWeftUsedYNSTRU: TStringField;
    MEWeftUsedYNTWIST: TStringField;
    MEWeftUsedYNCOL: TStringField;
    MEWeftUsedYNQLTY: TStringField;
    MEWeftUsedYEARNO: TSmallintField;
    MEWeftUsedPERIODNO: TSmallintField;
    MEWeftUsedDESPTOWIP: TFloatField;
    MEWeftUsedRETURNED: TFloatField;
    MEWeftUsedNETDESP: TFloatField;
    MEWeftUsedOPENWIP: TFloatField;
    MEWeftUsedCLOSEWIP: TFloatField;
    MEWeftUsedWEFTUSED: TFloatField;
    MEWeftUsedOPENSTK: TFloatField;
    MEWeftUsedCLOSESTK: TFloatField;
    Label3: TLabel;
    ShowYearNo: TDBEdit;
    ShowPeriodNo: TDBEdit;
    MEWeftUsedYARNRCVD: TFloatField;
    MEWeftUsedDESPATCHEDVREDE1: TFloatField;
    odcWarpStats: TODPopupCalendar;
    qryUpdateGrossNetN: TQuery;
    qryUpdateGrossNetY: TQuery;
    qryUpdateNetFirstsN: TQuery;
    qryUpdateAdjust: TQuery;
    qryUpdateSamples: TQuery;
    qryUpdateReslit: TQuery;
    qryUpdateNetFirstsY: TQuery;
    procedure RunEOMButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure RunYnEOMBtnClick(Sender: TObject);
  private
    { Private declarations }
    NextYearNo:integer;
    NextPeriodNo:integer;

    {Yarn Analysis procedures}
    {procedure YnSales;}
    procedure WeftUsed;
    {procedure YarnAnalysis;}

    {VB Analysis procedures}
    procedure VBSales;
    procedure VBStkMin; {for firsts}
    {procedure VBStockFirsts;
    procedure VBStockAll;}
    procedure VBStock;
    procedure VBSlit;
    procedure VBReSlit;
    procedure FabricWoven; {greige manu}
    procedure FabricFinished; {fin manu}
    procedure FabricSlit;
    procedure WarpsUsed;
    procedure WarpStats;
  public
    { Public declarations }
  end;

var
  VBEOMForm: TVBEOMForm;

implementation

uses Vbmain;

{$R *.DFM}

procedure TVBeomForm.VBSales;
begin
  StatusBar.Panels.Items[1].Text:='Fetching VB Sales';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('insert into mevbsales (vbstru,vbcol,vbwidth,qlty,');
  MyQuery.SQL.Add('localoverseas,yearno,periodno,netlength)');
  MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,vr.metricwidth,vr.qlty,su.localoverseas,');  MyQuery.SQL.Add('vp.yearno,vp.periodno,sum(vr.netlength)');
  MyQuery.SQL.Add('from vbrcpt vr, vbdesphdr vh, supplier su,vtperiod vp');
  MyQuery.SQL.Add('where vh.custref=su.supref');
  MyQuery.SQL.Add('and vr.despno=vh.despno');
  MyQuery.SQL.Add('and vh.despdate>=vp.fromdate and vh.despdate<=vp.todate');
  MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
  MyQuery.SQL.Add('group by vr.vbstru,vr.vbcol,vr.metricwidth,vr.qlty,su.localoverseas,');
  MyQuery.SQL.Add('vp.periodno,vp.yearno');
  MyQuery.Prepare;
  MyQuery.ExecSQL;
{  VBMake.Refresh;}
  MyQuery.Close;
end;

procedure TVBeomForm.VBStkMin; {for firsts}
begin
  StatusBar.Panels.Items[1].Text:='Fetching VB Stock Minima';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('insert into mevbstockmin (vbstru,vbcol,vbwidth,stkmin,yearno,periodno)');
  MyQuery.SQL.Add('select vs.vbstru,vs.vbcol,vs.vbwidth,stkmin,');
{  MyQuery.SQL.Add('1997,6');}
  MyQuery.SQL.Add(inttostr(NextYearNo)+','+inttostr(NextPeriodNo));
  MyQuery.SQL.Add('from vbstockmin vs');
  MyQuery.Prepare;
  MyQuery.ExecSQL;
{  VBMake.Refresh;}
  MyQuery.Close;
end;

{procedure TVBeomForm.VBStockAll;
begin
  StatusBar.Panels.Items[1].Text:='Fetching VB Stock (all qualities) at end of period';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('insert into mevbstock (vbstru,vbcol,vbwidth,yearno,periodno,netlength,grosslength)');
  MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,vr.metricwidth,1996,12,');
  MyQuery.SQL.Add('0,sum(vr.grosslength)');
  MyQuery.SQL.Add('from vbrcpt vr left join vbdesphdr vh');
  MyQuery.SQL.Add('on vr.despno=vh.despno, vtperiod vp');
  MyQuery.SQL.Add('where vr.datemanu<vp.fromdate');
  MyQuery.SQL.Add('and ((vh.despdate is null) or (vh.despdate>=vp.fromdate))');
  MyQuery.SQL.Add('and vp.yearno=1997 and vp.periodno=1');
  MyQuery.SQL.Add('group by vr.vbstru,vr.vbcol,vr.metricwidth,');
  MyQuery.SQL.Add('vp.periodno,vp.yearno');
  MyQuery.Prepare;
  MyQuery.ExecSQL;
  MyQuery.Close;
end;

{procedure TVBeomForm.VBStockFirsts;
var
  ErrorString:string[20];
begin
  StatusBar.Panels.Items[1].Text:='Fetching VB Stock (Firsts) at end of period';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,vr.metricwidth,1996,12,');
  MyQuery.SQL.Add('sum(netlength)');
  MyQuery.SQL.Add('from vbrcpt vr left join vbdesphdr vh');
  MyQuery.SQL.Add('on vr.despno=vh.despno, vtperiod vp');
  MyQuery.SQL.Add('where vr.datemanu<vp.fromdate');
  MyQuery.SQL.Add('and ((vh.despdate is null) or (vh.despdate>=vp.fromdate))');
  MyQuery.SQL.Add('and vp.yearno=1997 and vp.periodno=1');
  MyQuery.SQL.Add('and (vr.qlty='''')');
  MyQuery.SQL.Add('group by vr.vbstru,vr.vbcol,vr.metricwidth,');
  MyQuery.SQL.Add('vp.periodno,vp.yearno');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  MEVBStock.Open;
  while not MyQuery.EOF do
  begin
    MEVBStock.SetKey;
    MEVBStockVBStru.Value:=MyQuery.Fields[0].AsString;
    MEVBStockVBCol.Value:=MyQuery.Fields[1].AsString;
    MEVBStockVBWidth.Value:=MyQuery.Fields[2].AsInteger;
    MEVBStockYearNo.Value:=MyQuery.Fields[3].AsInteger;
    MEVBStockPeriodNo.Value:=MyQuery.Fields[4].AsInteger;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString+
      MyQuery.Fields[2].AsString;
    if not MEVBStock.GotoKey then
    begin
      MainForm.Database.RollBack;
      raise Exception.Create('VBStock Search:Error at '+ErrorString);
    end;
    MEVBStock.Edit;
    MEVBStockNetLength.Value:=MyQuery.Fields[5].AsFloat;
    MEVBStock.Post;
    MyQuery.Next;
  end;
  MEVBStock.Close;
  MyQuery.Close;
end;}

procedure TVBeomForm.VBStock;
begin
  StatusBar.Panels.Items[1].Text:='Fetching VB Stock (all qualities) at end of period';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('insert into mevbstock (vbstru,vbcol,vbwidth,qlty,yearno,periodno,netlength,grosslength)');
  MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,vr.metricwidth,qlty,vp.yearno,vp.periodno,');
  MyQuery.SQL.Add('sum(netlength),sum(vr.grosslength)');
  MyQuery.SQL.Add('from vbrcpt vr left join vbdesphdr vh');
  MyQuery.SQL.Add('on vr.despno=vh.despno, vtperiod vp');
  MyQuery.SQL.Add('where vr.datemanu<=vp.todate');
  MyQuery.SQL.Add('and ((vh.despdate is null) or (vh.despdate>vp.todate))');
  MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
  MyQuery.SQL.Add('group by vr.vbstru,vr.vbcol,vr.metricwidth,qlty,');
  MyQuery.SQL.Add('vp.periodno,vp.yearno');
  MyQuery.Prepare;
  MyQuery.ExecSQL;
  MyQuery.Close;
end;

procedure TVBeomForm.VBSlit;
{returned and not returned added because reslit subtracted}
begin
  StatusBar.Panels.Items[1].Text:='Fetching VB Slit (all qualities) for a period';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('insert into mevbslit (vbstru,vbcol,vbwidth,qlty,yearno,periodno,netlength,grosslength)');
  MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,vr.metricwidth,qlty,vp.yearno,vp.periodno,');
  MyQuery.SQL.Add('sum(netlength),sum(vr.grosslength)');
  MyQuery.SQL.Add('from vbrcpt vr left join vbdesphdr vh on vr.despno=vh.despno, vtperiod vp');
  MyQuery.SQL.Add('where vr.datemanu>=vp.fromdate');
  MyQuery.SQL.Add('and vr.datemanu<=vp.todate');
  MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
  MyQuery.SQL.Add('and ((vh.custref<>''ADJUST'') or (custref is null))'); {added as ADJUST means not made}
  MyQuery.SQL.Add('group by vr.vbstru,vr.vbcol,vr.metricwidth,vr.qlty,');
  MyQuery.SQL.Add('vp.periodno,vp.yearno');
  MyQuery.Prepare;
  MyQuery.ExecSQL;
  MyQuery.Close;
end;

procedure TVBeomForm.VBReSlit;
{returned and not returned added because reslit subtracted}
var
  ErrorString:string[20];
begin
  StatusBar.Panels.Items[1].Text:='Fetching VB ReSlit (all qualities) for a period';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,vr.metricwidth,vr.qlty,vp.yearno,vp.periodno,');
  MyQuery.SQL.Add('sum(netlength),sum(grosslength)');
  MyQuery.SQL.Add('from vbrcpt vr left join vbdesphdr vh on vr.despno=vh.despno,');
  MyQuery.SQL.Add('vtperiod vp');
  MyQuery.SQL.Add('where vh.despdate>=vp.fromdate');
  MyQuery.SQL.Add('and vh.despdate<=vp.todate');
  MyQuery.SQL.Add('and vh.custref=''ZSLITT''');
  MyQuery.SQL.Add('and vh.despno=vr.despno');
  MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
  MyQuery.SQL.Add('and ((vh.custref<>''ADJUST'') or (vh.custref is null))'); {added as ADJUST means not made}
  MyQuery.SQL.Add('group by vr.vbstru,vr.vbcol,vr.metricwidth,vr.qlty,');
  MyQuery.SQL.Add('vp.periodno,vp.yearno');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  MEVBSlit.Open;
  while not MyQuery.EOF do
  begin
    MEVBSlit.SetKey;
    MEVBSlitVBStru.Value:=MyQuery.Fields[0].AsString;
    MEVBSlitVBCol.Value:=MyQuery.Fields[1].AsString;
    MEVBSlitVBWidth.Value:=MyQuery.Fields[2].AsInteger;
    MEVBSlitQlty.Value:=MyQuery.Fields[3].AsString;
    MEVBSlitYearNo.Value:=MyQuery.Fields[4].AsInteger;
    MEVBSlitPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString+
      ':'+MyQuery.Fields[2].AsString;
    if not MEVBSlit.GotoKey then
    begin
      {insert the missing record!!}
      with MEVBSlit do
      begin
        Insert;
        MEVBSlitVBStru.Value:=MyQuery.Fields[0].AsString;
        MEVBSlitVBCol.Value:=MyQuery.Fields[1].AsString;
        MEVBSlitVBWidth.Value:=MyQuery.Fields[2].AsInteger;
        MEVBSlitQlty.Value:=MyQuery.Fields[3].AsString;
        MEVBSlitYearNo.Value:=MyQuery.Fields[4].AsInteger;
        MEVBSlitPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
        MEVBSlitNetLength.Value:=0-MyQuery.Fields[6].AsFloat;
        MEVBSlitGrossLength.Value:=0-MyQuery.Fields[7].AsFloat;
        Post;
      end;
      {MainForm.Database.RollBack;
      raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
    end
    else
    begin
      MEVBSlit.Edit;
      MEVBSlitNetLength.Value:=MEVBSlitNetLength.Value-MyQuery.Fields[6].AsFloat;
      MEVBSlitGrossLength.Value:=MEVBSlitGrossLength.Value-MyQuery.Fields[7].AsFloat;
      MEVBSlit.Post;
    end;
    MyQuery.Next;
  end;
  MEVBSlit.Close;
  MyQuery.Close;
end;

procedure TVBeomForm.FabricWoven; {greige manu}
begin
  StatusBar.Panels.Items[1].Text:='Fetching Fabric Woven for a period';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('insert into mevbweaving (vbstru,vbcol,yearno,periodno,greigemanu)');
  MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,vp.yearno,vp.periodno,');
  MyQuery.SQL.Add('sum(greigelength)');
  MyQuery.SQL.Add('from greigercpt vr, vtperiod vp');
  MyQuery.SQL.Add('where vr.greigedate>=vp.fromdate');
  MyQuery.SQL.Add('and vr.greigedate<=vp.todate');
  MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
  MyQuery.SQL.Add('group by vr.vbstru,vr.vbcol,');
  MyQuery.SQL.Add('vp.periodno,vp.yearno');
  MyQuery.Prepare;
  MyQuery.ExecSQL;
  MyQuery.Close;
end;

procedure TVBeomForm.FabricFinished; {fin manu}
var
  ErrorString:string[20];
begin
  StatusBar.Panels.Items[1].Text:='Fetching Fabric Finished for a period';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select gr.vbstru,gr.vbcol,vp.yearno,vp.periodno,');
  MyQuery.SQL.Add('sum(gr.finlength)');
  MyQuery.SQL.Add('from greigercpt gr, vtperiod vp');
  MyQuery.SQL.Add('where gr.findate>=vp.fromdate');
  MyQuery.SQL.Add('and gr.findate<=vp.todate');
  MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
  MyQuery.SQL.Add('group by gr.vbstru,gr.vbcol,');
  MyQuery.SQL.Add('vp.periodno,vp.yearno');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  MEVBWeaving.Open;
  while not MyQuery.EOF do
  begin
    MEVBWeaving.SetKey;
    MEVBWeavingVBStru.Value:=MyQuery.Fields[0].AsString;
    MEVBWeavingVBCol.Value:=MyQuery.Fields[1].AsString;
    MEVBWeavingYearNo.Value:=MyQuery.Fields[2].AsInteger;
    MEVBWeavingPeriodNo.Value:=MyQuery.Fields[3].AsInteger;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not MEVBWeaving.GotoKey then
    begin
      {insert the missing record!!}
      with MEVBWeaving do
      begin
        Insert;
        MEVBWeavingVBStru.Value:=MyQuery.Fields[0].AsString;
        MEVBWeavingVBCol.Value:=MyQuery.Fields[1].AsString;
        MEVBWeavingYearNo.Value:=MyQuery.Fields[2].AsInteger;
        MEVBWeavingPeriodNo.Value:=MyQuery.Fields[3].AsInteger;
        MEVBWeavingFinManu.Value:=MyQuery.Fields[4].AsFloat;
        MEVBWeavingGreigeManu.Value:=0;
        Post;
      end;
      {MainForm.Database.RollBack;
      raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
    end
    else
    begin
      MEVBWeaving.Edit;
      MEVBWeavingFinManu.Value:=MyQuery.Fields[4].AsFloat;
      MEVBWeaving.Post;
    end;
    MyQuery.Next;
  end;
  MEVBWeaving.Close;
  MyQuery.Close;
end;

procedure TVBeomForm.FabricSlit;
var
  ErrorString:string[20];
begin
  StatusBar.Panels.Items[1].Text:='Fetching Fabric Slit (FW) for a period';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,vp.yearno,vp.periodno,');
  MyQuery.SQL.Add('sum(vr.netlength/vw.strips),sum(vr.grosslength/vw.strips)');
  MyQuery.SQL.Add('from vbrcpt vr left join vbdesphdr vh on vr.despno=vh.despno,');
  MyQuery.SQL.Add('vtperiod vp, vbwidth vw');
  MyQuery.SQL.Add('where vr.datemanu>=vp.fromdate');
  MyQuery.SQL.Add('and vr.datemanu<=vp.todate');
  MyQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
  MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
  MyQuery.SQL.Add('and ((vh.custref<>''ADJUST'') or (vh.custref is null))'); {added as ADJUST means not made}
  MyQuery.SQL.Add('group by vr.vbstru,vr.vbcol,');
  MyQuery.SQL.Add('vp.yearno,vp.periodno');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  MEVBWeaving.Open;
  while not MyQuery.EOF do
  begin
    MEVBWeaving.SetKey;
    MEVBWeavingVBStru.Value:=MyQuery.Fields[0].AsString;
    MEVBWeavingVBCol.Value:=MyQuery.Fields[1].AsString;
    MEVBWeavingYearNo.Value:=MyQuery.Fields[2].AsInteger;
    MEVBWeavingPeriodNo.Value:=MyQuery.Fields[3].AsInteger;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not MEVBWeaving.GotoKey then
    begin
      {insert the missing record!!}
      with MEVBWeaving do
      begin
        Insert;
        MEVBWeavingVBStru.Value:=MyQuery.Fields[0].AsString;
        MEVBWeavingVBCol.Value:=MyQuery.Fields[1].AsString;
        MEVBWeavingYearNo.Value:=MyQuery.Fields[2].AsInteger;
        MEVBWeavingPeriodNo.Value:=MyQuery.Fields[3].AsInteger;
        MEVBWeavingNetSlit.Value:=MyQuery.Fields[4].AsFloat;
        MEVBWeavingGrossSlit.Value:=MyQuery.Fields[5].AsFloat;
        Post;
      end;
      {MainForm.Database.RollBack;
      raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
    end
    else
    begin
      MEVBWeaving.Edit;
      MEVBWeavingNetSlit.Value:=MyQuery.Fields[4].AsFloat;
      MEVBWeavingGrossSlit.Value:=MyQuery.Fields[5].AsFloat;
      MEVBWeaving.Post;
    end;
    MyQuery.Next;
  end;
  MEVBWeaving.Close;
  MyQuery.Close;
end;

procedure TVBeomForm.WarpsUsed;
{=warpmanu+opening WIP-closing WIP: used = consumption}
begin
  StatusBar.Panels.Items[1].Text:='Fetching Warps Manufactured for a period';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('insert into mewarpused (warptype,warpcol,yearno,periodno,warpmanu)');
  MyQuery.SQL.Add('select wr.warptype,wr.warpcol,vp.yearno,vp.periodno,sum(wr.warplength)');
  MyQuery.SQL.Add('from warprcpt wr, vtperiod vp');
  MyQuery.SQL.Add('where wr.datemanu>=vp.fromdate');
  MyQuery.SQL.Add('and wr.datemanu<=vp.todate');
  MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
  MyQuery.SQL.Add('group by wr.warptype,wr.warpcol,');
  MyQuery.SQL.Add('vp.periodno,vp.yearno');
  MyQuery.Prepare;
  MyQuery.ExecSQL;
  MyQuery.Close;
end;

procedure TVBeomForm.WarpStats;
{var
  ErrorString:string[20];}
var
  FromDateStr,ToDateStr:string;
begin
  {delete from mewarpstats first}
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('delete from mewarpstats');
  MyQuery.Prepare;
  MainForm.Database.StartTransaction;
  MyQuery.ExecSQL;
  MainForm.Database.Commit;
  MyQuery.Close;
  StatusBar.Panels.Items[1].Text:='Fetching Warp Stats for Period Selected';
  Application.ProcessMessages;
  FromDateStr:=formatdatetime('dd-mmm-yyyy',odcWarpStats.StartDate);
  ToDateStr:=formatdatetime('dd-mmm-yyyy',odcWarpStats.FinishDate);
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('insert into mewarpstats (warpno,greigeno,warptype,warpcol,');
  MyQuery.SQL.Add('vbstru,vbcol,warplength,weavelength,wovenlength,finishedlength,startdate,enddate)');
  MyQuery.SQL.Add('select wr.warpno,gr.greigeno,wr.warptype,wr.warpcol,');
  MyQuery.SQL.Add('  gr.vbstru,gr.vbcol,wr.warplength,gr.weavelength,');
  MyQuery.SQL.Add('  gr.greigelength,gr.finlength,'''+FromDateStr+''','''+ToDateStr+'''');
  MyQuery.SQL.Add('from warprcpt wr, greigercpt gr');
  MyQuery.SQL.Add('where wr.datemanu between '''+FromDateStr+''' and '''+ToDateStr+'''');
  MyQuery.SQL.Add('and wr.warpno=gr.warpno');
  MyQuery.SQL.Add('and wr.complete=''Y''');
  MyQuery.SQL.Add('and wr.warpno not in (select distinct gr.warpno from greigercpt gr');
  MyQuery.SQL.Add('  where gr.status<>''S'')');
  MyQuery.SQL.Add('group by wr.warpno,gr.greigeno,wr.warptype,wr.warpcol,');
  MyQuery.SQL.Add('  gr.vbstru,gr.vbcol,wr.warplength,gr.weavelength,');
  MyQuery.SQL.Add('  gr.greigelength,gr.finlength');
  MyQuery.Prepare;
  MainForm.Database.StartTransaction;
  MyQuery.ExecSQL;
  MainForm.Database.Commit;
  MyQuery.Close;

  StatusBar.Panels.Items[1].Text:='Fetching Gross and Net for Returned = N';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.warpno,vr.greigeno,sum(vr.grosslength/vw.strips),sum(vr.netlength/vw.strips)');
  MyQuery.SQL.Add('from vbrcpt vr,vbwidth vw');
  MyQuery.SQL.Add('where vr.warpno in (select ws.warpno from mewarpstats ws)');
  MyQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
  MyQuery.SQL.Add('and vr.returned=''N''');
  MyQuery.SQL.Add('group by vr.warpno,vr.greigeno');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  qryUpdateGrossNetN.Close;
  qryUpdateGrossNetN.Prepare;
  while not MyQuery.EOF do
  begin
    qryUpdateGrossNetN.ParamByName('GrossSlitRetN').AsInteger:=MyQuery.Fields[2].AsInteger; {gross}
    qryUpdateGrossNetN.ParamByName('NetSlitRetN').AsInteger:=MyQuery.Fields[3].AsInteger; {net}
    qryUpdateGrossNetN.ParamByName('WarpNo').AsInteger:=MyQuery.Fields[0].AsInteger; {warpno}
    qryUpdateGrossNetN.ParamByName('GreigeNo').AsInteger:=MyQuery.Fields[1].AsInteger; {greigeno}
    MainForm.Database.StartTransaction;
    qryUpdateGrossNetN.ExecSQL;
    MainForm.Database.Commit;
    qryUpdateGrossNetN.Close;
    MyQuery.Next;
  end;
  qryUpdateGrossNetN.Close;
  MyQuery.Close;

  StatusBar.Panels.Items[1].Text:='Fetching Gross and Net for Returned = Y';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.warpno,vr.greigeno,sum(vr.grosslength/vw.strips),sum(vr.netlength/vw.strips)');
  MyQuery.SQL.Add('from vbrcpt vr,vbwidth vw');
  MyQuery.SQL.Add('where vr.warpno in (select ws.warpno from mewarpstats ws)');
  MyQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
  MyQuery.SQL.Add('and vr.returned=''Y''');
  MyQuery.SQL.Add('group by vr.warpno,vr.greigeno');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  qryUpdateGrossNetY.Close;
  qryUpdateGrossNetY.Prepare;
  while not MyQuery.EOF do
  begin
    qryUpdateGrossNetY.ParamByName('GrossSlitRetY').AsInteger:=MyQuery.Fields[2].AsInteger; {gross}
    qryUpdateGrossNetY.ParamByName('NetSlitRetY').AsInteger:=MyQuery.Fields[3].AsInteger; {net}
    qryUpdateGrossNetY.ParamByName('WarpNo').AsInteger:=MyQuery.Fields[0].AsInteger; {warpno}
    qryUpdateGrossNetY.ParamByName('GreigeNo').AsInteger:=MyQuery.Fields[1].AsInteger; {greigeno}
    MainForm.Database.StartTransaction;
    qryUpdateGrossNetY.ExecSQL;
    MainForm.Database.Commit;
    qryUpdateGrossNetY.Close;
    MyQuery.Next;
  end;
  qryUpdateGrossNetY.Close;
  MyQuery.Close;

  StatusBar.Panels.Items[1].Text:='Fetching Net Slit Firsts for Returned = N';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.warpno,vr.greigeno,sum(vr.netlength/vw.strips)');
  MyQuery.SQL.Add('from vbrcpt vr,vbwidth vw');
  MyQuery.SQL.Add('where vr.warpno in (select ws.warpno from mewarpstats ws)');
  MyQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
  MyQuery.SQL.Add('and vr.returned=''N''');
  MyQuery.SQL.Add('and qlty=''''');
  MyQuery.SQL.Add('group by vr.warpno,vr.greigeno');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  qryUpdateNetFirstsN.Close;
  qryUpdateNetFirstsN.Prepare;
  while not MyQuery.EOF do
  begin
    qryUpdateNetFirstsN.ParamByName('NetSlitFirstsRetN').AsInteger:=MyQuery.Fields[2].AsInteger; {net}
    qryUpdateNetFirstsN.ParamByName('WarpNo').AsInteger:=MyQuery.Fields[0].AsInteger; {warpno}
    qryUpdateNetFirstsN.ParamByName('GreigeNo').AsInteger:=MyQuery.Fields[1].AsInteger; {greigeno}
    MainForm.Database.StartTransaction;
    qryUpdateNetFirstsN.ExecSQL;
    MainForm.Database.Commit;
    qryUpdateNetFirstsN.Close;
    MyQuery.Next;
  end;
  qryUpdateNetFirstsN.Close;
  MyQuery.Close;

  StatusBar.Panels.Items[1].Text:='Fetching Net Slit Firsts for Returned = Y';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.warpno,vr.greigeno,sum(vr.netlength/vw.strips)');
  MyQuery.SQL.Add('from vbrcpt vr,vbwidth vw');
  MyQuery.SQL.Add('where vr.warpno in (select ws.warpno from mewarpstats ws)');
  MyQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
  MyQuery.SQL.Add('and vr.returned=''Y''');
  MyQuery.SQL.Add('and qlty=''''');
  MyQuery.SQL.Add('group by vr.warpno,vr.greigeno');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  qryUpdateNetFirstsY.Close;
  qryUpdateNetFirstsY.Prepare;
  while not MyQuery.EOF do
  begin
    qryUpdateNetFirstsY.ParamByName('NetSlitFirstsRetY').AsInteger:=MyQuery.Fields[2].AsInteger; {net}
    qryUpdateNetFirstsY.ParamByName('WarpNo').AsInteger:=MyQuery.Fields[0].AsInteger; {warpno}
    qryUpdateNetFirstsY.ParamByName('GreigeNo').AsInteger:=MyQuery.Fields[1].AsInteger; {greigeno}
    MainForm.Database.StartTransaction;
    qryUpdateNetFirstsY.ExecSQL;
    MainForm.Database.Commit;
    qryUpdateNetFirstsY.Close;
    MyQuery.Next;
  end;
  qryUpdateNetFirstsY.Close;
  MyQuery.Close;

  StatusBar.Panels.Items[1].Text:='Fetching Adjustments';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.warpno,vr.greigeno,sum(vr.netlength/vw.strips)');
  MyQuery.SQL.Add('from vbrcpt vr,vbwidth vw,vbdesphdr vh');
  MyQuery.SQL.Add('where vr.warpno in (select ws.warpno from mewarpstats ws)');
  MyQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
  MyQuery.SQL.Add('and qlty=''''');
  MyQuery.SQL.Add('and vh.custref=''ADJUST''');
  MyQuery.SQL.Add('and vr.despno=vh.despno');
  MyQuery.SQL.Add('group by vr.warpno,vr.greigeno');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  qryUpdateAdjust.Close;
  qryUpdateAdjust.Prepare;
  while not MyQuery.EOF do
  begin
    qryUpdateAdjust.ParamByName('Adjust').AsInteger:=MyQuery.Fields[2].AsInteger; {net}
    qryUpdateAdjust.ParamByName('WarpNo').AsInteger:=MyQuery.Fields[0].AsInteger; {warpno}
    qryUpdateAdjust.ParamByName('GreigeNo').AsInteger:=MyQuery.Fields[1].AsInteger; {greigeno}
    MainForm.Database.StartTransaction;
    qryUpdateAdjust.ExecSQL;
    MainForm.Database.Commit;
    qryUpdateAdjust.Close;
    MyQuery.Next;
  end;
  qryUpdateAdjust.Close;
  MyQuery.Close;

  StatusBar.Panels.Items[1].Text:='Fetching Samples';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.warpno,vr.greigeno,sum(vr.netlength/vw.strips)');
  MyQuery.SQL.Add('from vbrcpt vr,vbwidth vw,vbdesphdr vh');
  MyQuery.SQL.Add('where vr.warpno in (select ws.warpno from mewarpstats ws)');
  MyQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
  MyQuery.SQL.Add('and qlty=''''');
  MyQuery.SQL.Add('and vh.custref=''SAMPLE''');
  MyQuery.SQL.Add('and vr.despno=vh.despno');
  MyQuery.SQL.Add('group by vr.warpno,vr.greigeno');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  qryUpdateSamples.Close;
  qryUpdateSamples.Prepare;
  while not MyQuery.EOF do
  begin
    qryUpdateSamples.ParamByName('Samples').AsInteger:=MyQuery.Fields[2].AsInteger; {net}
    qryUpdateSamples.ParamByName('WarpNo').AsInteger:=MyQuery.Fields[0].AsInteger; {warpno}
    qryUpdateSamples.ParamByName('GreigeNo').AsInteger:=MyQuery.Fields[1].AsInteger; {greigeno}
    MainForm.Database.StartTransaction;
    qryUpdateSamples.ExecSQL;
    MainForm.Database.Commit;
    qryUpdateSamples.Close;
    MyQuery.Next;
  end;
  qryUpdateSamples.Close;
  MyQuery.Close;

  StatusBar.Panels.Items[1].Text:='Fetching Reslit';
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vr.warpno,vr.greigeno,sum(vr.netlength/vw.strips)');
  MyQuery.SQL.Add('from vbrcpt vr,vbwidth vw,vbdesphdr vh');
  MyQuery.SQL.Add('where vr.warpno in (select ws.warpno from mewarpstats ws)');
  MyQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
  MyQuery.SQL.Add('and qlty=''''');
  MyQuery.SQL.Add('and vh.custref=''ZSLITT''');
  MyQuery.SQL.Add('and vr.despno=vh.despno');
  MyQuery.SQL.Add('group by vr.warpno,vr.greigeno');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  qryUpdateReslit.Close;
  qryUpdateReslit.Prepare;
  while not MyQuery.EOF do
  begin
    qryUpdateReslit.ParamByName('Reslit').AsInteger:=MyQuery.Fields[2].AsInteger; {net}
    qryUpdateReslit.ParamByName('WarpNo').AsInteger:=MyQuery.Fields[0].AsInteger; {warpno}
    qryUpdateReslit.ParamByName('GreigeNo').AsInteger:=MyQuery.Fields[1].AsInteger; {greigeno}
    MainForm.Database.StartTransaction;
    qryUpdateReslit.ExecSQL;
    MainForm.Database.Commit;
    qryUpdateReslit.Close;
    MyQuery.Next;
  end;
  qryUpdateReslit.Close;
  MyQuery.Close;

  StatusBar.Panels.Items[1].Text:='Completed Refreshing WarpStats: Please note dates selected';
  Application.ProcessMessages;

end;

procedure TVBeomForm.RunEOMButtonClick(Sender: TObject);
begin
  if odcWarpStats.Text='' then
    raise EODComponentError.Create('Please fill in a date range first',RunEOMButton);
  Screen.Cursor := crHourglass;                 { Show hourglass cursor }
  Application.ProcessMessages;
  //MainForm.Database.StartTransaction;
{  VBStockAll; ?
  VBStockFirsts; ?}
//  VBSales;
//  VBStkMin;
//  VBStock;
//  VBSlit;
//  VBReslit;
//  FabricWoven; {greige manu}
//  FabricFinished; {fin manu}
//  FabricSlit; {gross and net converted from slit to FW}
//  WarpsUsed;
  WarpStats; {for completed warps}
  {yarn and raw materials in yarn system}
  //MainForm.Database.Commit;
  Screen.Cursor := crDefault;                  { Always restore to normal }
  StatusBar.Panels.Items[1].Text:='Ready';
  Application.ProcessMessages;
end;

procedure TVBEOMForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VBParams.Close;
  VBeomForm.Release;
end;

procedure TVBEOMForm.FormShow(Sender: TObject);
begin
  StatusBar.Panels.Items[1].Text:='Ready';
  VBParams.Open;
  VBParams.Refresh;
  NextYearNo:=VBParamsLastMEYearNo.Value;
  NextPeriodNo:=VBParamsLastMEPeriodNo.Value+1;
  if NextPeriodNo>12 then
  begin
    NextPeriodNo:=1;
    NextYearNo:=NextYearNo+1;
  end;

  odcWarpStats.StartDate:=date; //added DL020219

  {PeriodNo:=3;}
end;

procedure TVBEOMForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBEOMForm.WeftUsed;
var
  ErrorString:string[40];
  procedure YarnIssuedToWeavingWIP;
  begin
    {get the yarn despatched to weaving wip}
    StatusBar.Panels.Items[1].Text:='Fetching Yn Desp to Weaving WIP';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('insert into meweftused (ynstru,yntwist,yncol,ynqlty,yearno,');
    MyQuery.SQL.Add('periodno,desptowip)');
    MyQuery.SQL.Add('select yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,vp.yearno,');
    MyQuery.SQL.Add('vp.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('from vbyarnissued vi,vbyarnrcpt yr,vtperiod vp');
    MyQuery.SQL.Add('where vi.issueddate>=vp.fromdate');
    MyQuery.SQL.Add('and vi.issueddate<=vp.todate');
    MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and yr.ynqlty<>''W'''); {not WIP}
    MyQuery.SQL.Add('and yr.batref=vi.batref');
    MyQuery.SQL.Add('and yr.boxno=vi.boxno');
    MyQuery.SQL.Add('and ((vi.issuedto=''LOOM01'') or (vi.issuedto=''LOOM02'')');
    MyQuery.SQL.Add('or (vi.issuedto=''LOOM03'') or (vi.issuedto=''LOOM04'')');
    MyQuery.SQL.Add('or (vi.issuedto=''LOOM05'') or (vi.issuedto=''LOOM06'')');
    MyQuery.SQL.Add('or (vi.issuedto=''ADJUST''))');
    MyQuery.SQL.Add('group by yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,vp.yearno,vp.periodno');
    MyQuery.Prepare;
    MyQuery.ExecSQL;
    MyQuery.Close;
  end;
  procedure YarnReturned;
  begin
    {get the yarn returned from weaving wip to weft yarn stock}
    StatusBar.Panels.Items[1].Text:='Fetching Yn Issued returned from Weaving WIP';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vp.yearno,vp.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('from vbyarnrcpt yr,vtperiod vp');
    MyQuery.SQL.Add('where yr.returned=''Y'''); {returned from WeavingWIP}
    MyQuery.SQL.Add('and yr.ynqlty<>''W'''); {not WIP}
    MyQuery.SQL.Add('and yr.datercvd>=vp.fromdate');
    MyQuery.SQL.Add('and yr.datercvd<=vp.todate');
    MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('group by ynstru,yntwist,yncol,ynqlty,vp.yearno,vp.periodno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEWeftUsed.Open;
    while not MyQuery.EOF do
    begin
      MEWeftUsed.SetKey;
      MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
      MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
      MEWeftUsedYnQlty.Value:=MyQuery.Fields[3].AsString;
      MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEWeftUsed.GotoKey then
      begin
        {insert the missing record!!}
        with MEWeftUsed do
        begin
          Insert;
          MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
          MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
          MEWeftUsedYnQlty.Value:=MyQuery.Fields[3].AsString;
          MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          MEWeftUsedReturned.Value:=MyQuery.Fields[6].AsFloat;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end
      else
      begin
        MEWeftUsed.Edit;
        MEWeftUsedReturned.Value:=MyQuery.Fields[6].AsFloat;
        MEWeftUsed.Post;
      end;
      MyQuery.Next;
    end;
    MEWeftUsed.Close;
    MyQuery.Close;
  end;
  procedure StartOfMonthWIPData;
  begin
    {get the opening wip}
    StatusBar.Panels.Items[1].Text:='Fetching Yn Start of Month WIP';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vp.yearno,vp.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('from vbyarnrcpt yr,vtperiod vp,vbyarnissued vi');
    MyQuery.SQL.Add('where yr.ynqlty=''W''');
    MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and vi.batref=yr.batref');
    MyQuery.SQL.Add('and yr.boxno=vi.boxno');
    MyQuery.SQL.Add('and ((vi.issuedto=''LOOM01'') or (vi.issuedto=''LOOM02'')');
    MyQuery.SQL.Add('or (vi.issuedto=''LOOM03'') or (vi.issuedto=''LOOM04'')');
    MyQuery.SQL.Add('or (vi.issuedto=''LOOM05'') or (vi.issuedto=''LOOM06'')');
    MyQuery.SQL.Add('or (vi.issuedto=''ADJUST''))');
    MyQuery.SQL.Add('and vi.issueddate=vp.fromdate');
    MyQuery.SQL.Add('group by yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,vp.yearno,vp.periodno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEWeftUsed.Open;
    while not MyQuery.EOF do
    begin
      MEWeftUsed.SetKey;
      MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
      MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
      MEWeftUsedYnQlty.Value:=''; {treat as firsts}
      MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEWeftUsed.GotoKey then
      begin
        {insert the missing record!!}
        with MEWeftUsed do
        begin
          Insert;
          MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
          MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
          MEWeftUsedYnQlty.Value:=''; {treat as firsts}
          MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          MEWeftUsedOpenWIP.Value:=MyQuery.Fields[6].AsFloat;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end
      else
      begin
        MEWeftUsed.Edit;
        MEWeftUsedOpenWIP.Value:=MyQuery.Fields[6].AsFloat;
        MEWeftUsed.Post;
      end;
      MyQuery.Next;
    end;
    MEWeftUsed.Close;
    MyQuery.Close;
  end;
  procedure EndOfMonthWIPData;
  begin
    {get the closing wip}
    StatusBar.Panels.Items[1].Text:='Fetching Yn End of Month WIP';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vp.yearno,vp.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('from vbyarnrcpt yr,vtperiod vp,vbyarnissued vi');
    MyQuery.SQL.Add('where yr.ynqlty=''W''');
    MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and vi.batref=yr.batref');
    MyQuery.SQL.Add('and yr.boxno=vi.boxno');
    MyQuery.SQL.Add('and ((vi.issuedto=''LOOM01'') or (vi.issuedto=''LOOM02'')');
    MyQuery.SQL.Add('or (vi.issuedto=''LOOM03'') or (vi.issuedto=''LOOM04'')');
    MyQuery.SQL.Add('or (vi.issuedto=''LOOM05'') or (vi.issuedto=''LOOM06'')');
    MyQuery.SQL.Add('or (vi.issuedto=''ADJUST''))');
    MyQuery.SQL.Add('and vi.issueddate=vp.todate+1');
    MyQuery.SQL.Add('group by yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,vp.yearno,vp.periodno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEWeftUsed.Open;
    while not MyQuery.EOF do
    begin
      MEWeftUsed.SetKey;
      MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
      MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
      MEWeftUsedYnQlty.Value:=''; {treat as firsts}
      MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEWeftUsed.GotoKey then
      begin
        {insert the missing record!!}
        with MEWeftUsed do
        begin
          Insert;
          MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
          MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
          MEWeftUsedYnQlty.Value:=''; {treat as firsts}
          MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          MEWeftUsedCloseWIP.Value:=MyQuery.Fields[6].AsFloat;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end
      else
      begin
        MEWeftUsed.Edit;
        MEWeftUsedCloseWIP.Value:=MyQuery.Fields[6].AsFloat;
        MEWeftUsed.Post;
      end;
      MyQuery.Next;
    end;
    MEWeftUsed.Close;
    MyQuery.Close;
  end;
  procedure CalcOpenWeight;
  begin
    StatusBar.Panels.Items[1].Text:='Calculating Opening Yarn Weight';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('SELECT yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vt.yearno,vt.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('FROM vtperiod vt,vbYARNRCPT yr left join vbyarnissued vi');
    MyQuery.SQL.Add('on yr.batref=vi.batref');
    MyQuery.SQL.Add('and yr.boxno=vi.boxno');
    MyQuery.SQL.Add('where (yr.datercvd < vt.fromdate)');
    MyQuery.SQL.Add('and ((vi.issueddate >= vt.fromdate) or (vi.issueddate is null))');
    MyQuery.SQL.Add('and vt.yearno='+inttostr(NextYearNo)+' and vt.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and yr.ynqlty<>''W''');
    MyQuery.SQL.Add('group by yr.ynqlty,yr.ynstru,yr.yntwist,yr.yncol,vt.yearno,vt.periodno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEWeftUsed.Open;
    while not MyQuery.EOF do
    begin
      MEWeftUsed.SetKey;
      MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
      MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
      MEWeftUsedYnQlty.Value:=MyQuery.Fields[3].AsString;
      MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEWeftUsed.GotoKey then
      begin
        {insert the missing record!!}
        with MEWeftUsed do
        begin
          Insert;
          MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
          MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
          MEWeftUsedYnQlty.Value:=MyQuery.Fields[3].AsString;
          MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          MEWeftUsedOpenStk.Value:=MyQuery.Fields[6].AsFloat;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end
      else
      begin
        MEWeftUsed.Edit;
        MEWeftUsedOpenStk.Value:=MyQuery.Fields[6].AsFloat;
        MEWeftUsed.Post;
      end;
      MyQuery.Next;
    end;
    MEWeftUsed.Close;
    MyQuery.Close;
  end;
  procedure CalcCloseWeight;
  begin
    StatusBar.Panels.Items[1].Text:='Calculating Closing Yarn Weight';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('SELECT yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vt.yearno,vt.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('FROM vtperiod vt,vbYARNRCPT yr left join vbyarnissued vi');
    MyQuery.SQL.Add('on yr.batref=vi.batref');
    MyQuery.SQL.Add('and yr.boxno=vi.boxno');
    MyQuery.SQL.Add('where (yr.datercvd <= vt.todate)');
    MyQuery.SQL.Add('and ((vi.issueddate > vt.todate) or (vi.issueddate is null))');
    MyQuery.SQL.Add('and vt.yearno='+inttostr(NextYearNo)+' and vt.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and yr.ynqlty<>''W''');
    MyQuery.SQL.Add('group by yr.ynqlty,yr.ynstru,yr.yntwist,yr.yncol,vt.yearno,vt.periodno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEWeftUsed.Open;
    while not MyQuery.EOF do
    begin
      MEWeftUsed.SetKey;
      MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
      MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
      MEWeftUsedYnQlty.Value:=MyQuery.Fields[3].AsString;
      MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEWeftUsed.GotoKey then
      begin
        {insert the missing record!!}
        with MEWeftUsed do
        begin
          Insert;
          MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
          MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
          MEWeftUsedYnQlty.Value:=MyQuery.Fields[3].AsString;
          MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          MEWeftUsedCloseStk.Value:=MyQuery.Fields[6].AsFloat;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end
      else
      begin
        MEWeftUsed.Edit;
        MEWeftUsedCloseStk.Value:=MyQuery.Fields[6].AsFloat;
        MEWeftUsed.Post;
      end;
      MyQuery.Next;
    end;
    MEWeftUsed.Close;
    MyQuery.Close;
  end;
  procedure YarnRcvd;
  begin
    {get the yarn rcvd from spinning}
    StatusBar.Panels.Items[1].Text:='Fetching Yn Rcvd from Spinning factory';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vp.yearno,vp.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('from vbyarnrcpt yr,vtperiod vp');
    MyQuery.SQL.Add('where yr.returned=''N''');
    MyQuery.SQL.Add('and yr.ynqlty<>''W''');
    MyQuery.SQL.Add('and yr.datercvd>=vp.fromdate');
    MyQuery.SQL.Add('and yr.datercvd<=vp.todate');
    MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('group by ynstru,yntwist,yncol,ynqlty,vp.yearno,vp.periodno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEWeftUsed.Open;
    while not MyQuery.EOF do
    begin
      MEWeftUsed.SetKey;
      MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
      MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
      MEWeftUsedYnQlty.Value:=MyQuery.Fields[3].AsString;
      MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEWeftUsed.GotoKey then
      begin
        {insert the missing record!!}
        with MEWeftUsed do
        begin
          Insert;
          MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
          MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
          MEWeftUsedYnQlty.Value:=MyQuery.Fields[3].AsString;
          MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          MEWeftUsedYarnRcvd.Value:=MyQuery.Fields[6].AsFloat;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end
      else
      begin
        MEWeftUsed.Edit;
        MEWeftUsedYarnRcvd.Value:=MyQuery.Fields[6].AsFloat;
        MEWeftUsed.Post;
      end;
      MyQuery.Next;
    end;
    MEWeftUsed.Close;
    MyQuery.Close;
  end;
  procedure YarnDespatchedToVrede1;
  begin
    {get the yarn despatched to weaving wip}
    StatusBar.Panels.Items[1].Text:='Fetching Yn Desp to Vrede 1';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    StatusBar.Panels.Items[1].Text:='Fetching Yn Rcvd from Spinning factory';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vp.yearno,vp.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('from vbyarnissued vi,vbyarnrcpt yr,vtperiod vp');
    MyQuery.SQL.Add('where vi.issueddate>=vp.fromdate');
    MyQuery.SQL.Add('and vi.issueddate<=vp.todate');
    MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and yr.ynqlty<>''W'''); {not WIP}
    MyQuery.SQL.Add('and yr.batref=vi.batref');
    MyQuery.SQL.Add('and yr.boxno=vi.boxno');
    MyQuery.SQL.Add('and vi.issuedto=''VREDE1''');
    MyQuery.SQL.Add('group by yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,vp.yearno,vp.periodno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEWeftUsed.Open;
    while not MyQuery.EOF do
    begin
      MEWeftUsed.SetKey;
      MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
      MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
      MEWeftUsedYnQlty.Value:=MyQuery.Fields[3].AsString;
      MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEWeftUsed.GotoKey then
      begin
        {insert the missing record!!}
        with MEWeftUsed do
        begin
          Insert;
          MEWeftUsedYnStru.Value:=MyQuery.Fields[0].AsString;
          MEWeftUsedYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEWeftUsedYnCol.Value:=MyQuery.Fields[2].AsString;
          MEWeftUsedYnQlty.Value:=MyQuery.Fields[3].AsString;
          MEWeftUsedYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEWeftUsedPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          MEWeftUsedDespatchedVrede1.Value:=MyQuery.Fields[6].AsFloat;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end
      else
      begin
        MEWeftUsed.Edit;
        MEWeftUsedDespatchedVrede1.Value:=MyQuery.Fields[6].AsFloat;
        MEWeftUsed.Post;
      end;
      MyQuery.Next;
    end;
    MEWeftUsed.Close;
    MyQuery.Close;
  end;
begin
  YarnIssuedToWeavingWIP;
  YarnReturned;
  {get the opening wip at weaving - use zero for start of year:exclude periods 1 to 4}
  StartOfMonthWIPData; {starting period 6}
  EndOfMonthWIPData; {starting period 6}
  CalcOpenWeight;
  CalcCloseWeight;
  YarnRcvd;
  YarnDespatchedToVrede1;
end;

procedure TVBEOMForm.RunYnEOMBtnClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;                 { Show hourglass cursor }
  Application.ProcessMessages;
  MainForm.Database.StartTransaction;
  WeftUsed;
  {YarnAnalysis;}
  VBParams.Edit;
  VBParamsLastMEYearNo.AsInteger:=NextYearNo;
  VBParamsLastMEPeriodNo.AsInteger:=NextPeriodNo;
  VBParams.Post;
  MainForm.Database.Commit;
  Screen.Cursor := crDefault; { Always restore to normal }
  StatusBar.Panels.Items[1].Text:='Ready';
  Application.ProcessMessages;
end;

end.
