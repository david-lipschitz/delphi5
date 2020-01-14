unit speom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, DB, DBTables, Mask, DBCtrls;

type
  TSPeomForm = class(TForm)
    CloseBitBtn: TBitBtn;
    StatusBar: TStatusBar;
    RunBtn: TButton;
    MyQuery: TQuery;
    MEWeftUsed: TTable;
    MEWeftUsedYNSTRU: TStringField;
    MEWeftUsedYNTWIST: TStringField;
    MEWeftUsedYNCOL: TStringField;
    MEWeftUsedYNQLTY: TStringField;
    MEWeftUsedYEARNO: TSmallintField;
    MEWeftUsedPERIODNO: TSmallintField;
    MEWeftUsedDESPTOWEAVING: TFloatField;
    MEWeftUsedRETURNED: TFloatField;
    MEWeftUsedNETDESP: TFloatField;
    MEWeftUsedOPENWIP: TFloatField;
    MEWeftUsedCLOSEWIP: TFloatField;
    MEWeftUsedWEFTUSED: TFloatField;
    MEYarnAnal: TTable;
    MEYarnAnalYNSTRU: TStringField;
    MEYarnAnalYNTWIST: TStringField;
    MEYarnAnalYNCOL: TStringField;
    MEYarnAnalYNQLTY: TStringField;
    MEYarnAnalYEARNO: TSmallintField;
    MEYarnAnalPERIODNO: TSmallintField;
    MEYarnAnalOPENSTK: TFloatField;
    MEYarnAnalOPENWIP: TFloatField;
    MEYarnAnalYNMANU: TFloatField;
    MEYarnAnalYNRETURNED: TFloatField;
    MEYarnAnalISSUEDQLTY: TFloatField;
    MEYarnAnalISSUEDWEAVING: TFloatField;
    MEYarnAnalISSUEDTWISTER: TFloatField;
    MEYarnAnalISSUEDWARPING: TFloatField;
    MEYarnAnalISSUEDADJUST: TFloatField;
    MEYarnAnalISSUEDOTHER: TFloatField;
    MEYarnAnalSALESAECI: TFloatField;
    MEYarnAnalSALESLOUVTE: TFloatField;
    MEYarnAnalSALESXTILIA: TFloatField;
    MEYarnAnalCLOSESTK: TFloatField;
    MEYarnAnalCLOSEWIP: TFloatField;
    MEYarnAnalYNSTRUGRP: TStringField;
    MEYarnAnalISSUEDVREDEFU: TFloatField;
    MEYarnAnalISSUEDVREDEVB: TFloatField;
    MEYarnAnalCLOSESTKCALC: TFloatField;
    Param: TTable;
    ParamREF: TSmallintField;
    ParamLASTMEYEARNO: TSmallintField;
    ParamLASTMEPERIODNO: TSmallintField;
    ParamMEINPROGRESS: TStringField;
    ShowYearNo: TDBEdit;
    ShowPeriodNo: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ParamSource: TDataSource;
    MEYarnAnalOPENWIPWEAVING: TFloatField;
    MEYarnAnalCLOSEWIPWEAVING: TFloatField;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RunBtnClick(Sender: TObject);
  private
    { Private declarations }
    NextYearNo:integer;
    NextPeriodNo:integer;
    {procedure YnSales;}
    procedure WeftUsed;
    procedure YarnAnalysis;
  public
    { Public declarations }
  end;

var
  SPeomForm: TSPeomForm;

implementation

uses Main;

{$R *.DFM}

procedure TSPeomForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSPeomForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Param.Close;
  SPeomForm.Release;
end;

procedure TSPeomForm.FormShow(Sender: TObject);
begin
  StatusBar.Panels.Items[1].Text:='Ready';
  Param.Open;
  Param.Refresh;
  NextYearNo:=ParamLastMEYearNo.Value;
  NextPeriodNo:=ParamLastMEPeriodNo.Value+1;
  if NextPeriodNo>12 then
  begin
    NextPeriodNo:=1;
    NextYearNo:=NextYearNo+1;
  end;
  {PeriodNo:=3;}
end;

{procedure TSPeomForm.YnSales;
begin
end;}

procedure TSPeomForm.WeftUsed;
var
  ErrorString:string[40];
  procedure YarnDespToWeaving;
  begin
    {get the yarn despatched to weaving}
    StatusBar.Panels.Items[1].Text:='Fetching Yn Desp to Weaving';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('insert into meweftused (ynstru,yntwist,yncol,ynqlty,yearno,');
    MyQuery.SQL.Add('periodno,desptoweaving)');
    MyQuery.SQL.Add('select yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,vp.yearno,');
    MyQuery.SQL.Add('vp.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('from yndesphdr yh,yarnrcpt yr,vtperiod vp');
    MyQuery.SQL.Add('where yh.despdate>=vp.fromdate');
    MyQuery.SQL.Add('and yh.despdate<=vp.todate');
    MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and yr.ynqlty<>''W'''); {not WIP}
    MyQuery.SQL.Add('and yr.despno=yh.despno');
    MyQuery.SQL.Add('and yh.custref=''WEAVNG'''); {only desp to weaving}
    MyQuery.SQL.Add('group by yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,vp.yearno,vp.periodno');
    MyQuery.Prepare;
    MyQuery.ExecSQL;
    MyQuery.Close;
  end;
  procedure YarnReturned;
  begin
    {get the yarn returned from weaving}
    StatusBar.Panels.Items[1].Text:='Fetching Yn Desp returned from Weaving';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vp.yearno,vp.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('from yarnrcpt yr,vtperiod vp');
    MyQuery.SQL.Add('where yr.returned=''Y'''); {returned from Weaving}
    MyQuery.SQL.Add('and yr.custref=''WEAVNG''');
    MyQuery.SQL.Add('and yr.datemanu>=vp.fromdate');
    MyQuery.SQL.Add('and yr.datemanu<=vp.todate');
    MyQuery.SQL.Add('and yr.ynqlty<>''W''');    
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
  procedure EndOfMonthData;
  begin
    {get the closing wip at weaving }
    StatusBar.Panels.Items[1].Text:='Fetching Yn End of Month WIP';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vp.yearno,vp.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('from yarnrcpt yr,vtperiod vp,yndesphdr yh');
    MyQuery.SQL.Add('where yr.ynqlty=''W''');
    MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and yh.despno=yr.despno');
    MyQuery.SQL.Add('and yh.custref=''WEAVNG''');
    MyQuery.SQL.Add('and yh.despdate=vp.todate+1');
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
begin
  YarnDespToWeaving;
  YarnReturned;
  {get the opening wip at weaving - use zero for start of year:exclude periods 1 to 4}
  EndOfMonthData; {starting period 4}
end;

procedure TSPeomForm.YarnAnalysis;
var
  ErrorString:string[40];
  procedure CalcOpenWeight;
  begin
    StatusBar.Panels.Items[1].Text:='Calculating Opening Yn Weight';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('insert into meyarnanal (ynstru,yntwist,yncol,ynqlty,yearno,');
    MyQuery.SQL.Add('periodno,openstk)');
    MyQuery.SQL.Add('SELECT yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vt.yearno,vt.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('FROM vtperiod vt,YARNRCPT yr left join yndesphdr yd');
    MyQuery.SQL.Add('on yr.despno=yd.despno');
    MyQuery.SQL.Add('where (yr.datemanu < vt.fromdate)');
    MyQuery.SQL.Add('and ((yd.despdate >= vt.fromdate) or (yd.despdate is null))');
    MyQuery.SQL.Add('and vt.yearno='+inttostr(NextYearNo)+' and vt.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and yr.ynqlty<>''W''');
    MyQuery.SQL.Add('group by yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,vt.yearno,vt.periodno');
    MyQuery.Prepare;
    MyQuery.ExecSQL;
    MyQuery.Close;
  end;
  procedure CalcCloseWeight; {according to OpenWeight Calc method}
  begin
    {get all the yarn returned: xx split by dept}
    StatusBar.Panels.Items[1].Text:='Calculating Closing Yarn Weight';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('SELECT yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vt.yearno,vt.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('FROM vtperiod vt,YARNRCPT yr left join yndesphdr yd');
    MyQuery.SQL.Add('on yr.despno=yd.despno');
    MyQuery.SQL.Add('where (yr.datemanu <= vt.todate)');
    MyQuery.SQL.Add('and ((yd.despdate > vt.todate) or (yd.despdate is null))');
    MyQuery.SQL.Add('and vt.yearno='+inttostr(NextYearNo)+' and vt.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and yr.ynqlty<>''W''');
    MyQuery.SQL.Add('group by yr.ynqlty,yr.ynstru,yr.yntwist,yr.yncol,vt.yearno,vt.periodno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEYarnAnal.Open;
    while not MyQuery.EOF do
    begin
      MEYarnAnal.SetKey;
      MEYarnAnalYnStru.Value:=MyQuery.Fields[0].AsString;
      MEYarnAnalYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEYarnAnalYnCol.Value:=MyQuery.Fields[2].AsString;
      MEYarnAnalYnQlty.Value:=MyQuery.Fields[3].AsString;
      MEYarnAnalYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEYarnAnalPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEYarnAnal.GotoKey then
      begin
        {insert the missing record!!}
        with MEYarnAnal do
        begin
          Insert;
          MEYarnAnalYnStru.Value:=MyQuery.Fields[0].AsString;
          MEYarnAnalYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEYarnAnalYnCol.Value:=MyQuery.Fields[2].AsString;
          MEYarnAnalYnQlty.Value:=MyQuery.Fields[3].AsString;
          MEYarnAnalYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEYarnAnalPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          MEYarnAnalCloseStk.Value:=MyQuery.Fields[6].AsFloat;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end
      else
      begin
        MEYarnAnal.Edit;
        MEYarnAnalCloseStk.Value:=MyQuery.Fields[6].AsFloat;
        MEYarnAnal.Post;
      end;
      MyQuery.Next;
    end;
    MEYarnAnal.Close;
    MyQuery.Close;
  end;
  procedure CalcOpenWIP;
  begin
    {get all the yarn returned: xx split by dept}
    StatusBar.Panels.Items[1].Text:='Calculating Opening WIP';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('SELECT yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vt.yearno,vt.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('FROM vtperiod vt,YARNRCPT yr'); {all WIP rcvd must have been despatched/issued}
    MyQuery.SQL.Add('where yr.datemanu=(vt.fromdate-1)');
    MyQuery.SQL.Add('and vt.yearno='+inttostr(NextYearNo)+' and vt.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and yr.ynqlty=''W''');
    MyQuery.SQL.Add('group by yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,vt.yearno,vt.periodno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEYarnAnal.Open;
    while not MyQuery.EOF do
    begin
      MEYarnAnal.SetKey;
      MEYarnAnalYnStru.Value:=MyQuery.Fields[0].AsString;
      MEYarnAnalYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEYarnAnalYnCol.Value:=MyQuery.Fields[2].AsString;
      MEYarnAnalYnQlty.Value:=MyQuery.Fields[3].AsString;
      MEYarnAnalYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEYarnAnalPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEYarnAnal.GotoKey then
      begin
        {insert the missing record!!}
        with MEYarnAnal do
        begin
          Insert;
          MEYarnAnalYnStru.Value:=MyQuery.Fields[0].AsString;
          MEYarnAnalYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEYarnAnalYnCol.Value:=MyQuery.Fields[2].AsString;
          MEYarnAnalYnQlty.Value:=MyQuery.Fields[3].AsString;
          MEYarnAnalYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEYarnAnalPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          MEYarnAnalOpenWIP.Value:=MyQuery.Fields[6].AsFloat;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end
      else
      begin
        MEYarnAnal.Edit;
        MEYarnAnalOpenWIP.Value:=MyQuery.Fields[6].AsFloat;
        MEYarnAnal.Post;
      end;
      MyQuery.Next;
    end;
    MEYarnAnal.Close;
    MyQuery.Close;
  end;
  procedure CalcCloseWIP;
  begin
    {get all the yarn returned: xx split by dept}
    StatusBar.Panels.Items[1].Text:='Calculating Closing WIP';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('SELECT yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vt.yearno,vt.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('FROM vtperiod vt,YARNRCPT yr');
    MyQuery.SQL.Add('where yr.datemanu=vt.todate');
    MyQuery.SQL.Add('and vt.yearno='+inttostr(NextYearNo)+' and vt.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and yr.ynqlty=''W''');
    MyQuery.SQL.Add('group by yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,vt.yearno,vt.periodno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEYarnAnal.Open;
    while not MyQuery.EOF do
    begin
      MEYarnAnal.SetKey;
      MEYarnAnalYnStru.Value:=MyQuery.Fields[0].AsString;
      MEYarnAnalYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEYarnAnalYnCol.Value:=MyQuery.Fields[2].AsString;
      MEYarnAnalYnQlty.Value:=MyQuery.Fields[3].AsString;
      MEYarnAnalYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEYarnAnalPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEYarnAnal.GotoKey then
      begin
        {insert the missing record!!}
        with MEYarnAnal do
        begin
          Insert;
          MEYarnAnalYnStru.Value:=MyQuery.Fields[0].AsString;
          MEYarnAnalYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEYarnAnalYnCol.Value:=MyQuery.Fields[2].AsString;
          MEYarnAnalYnQlty.Value:=MyQuery.Fields[3].AsString;
          MEYarnAnalYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEYarnAnalPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          MEYarnAnalCloseWIP.Value:=MyQuery.Fields[6].AsFloat;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end
      else
      begin
        MEYarnAnal.Edit;
        MEYarnAnalCloseWIP.Value:=MyQuery.Fields[6].AsFloat;
        MEYarnAnal.Post;
      end;
      MyQuery.Next;
    end;
    MEYarnAnal.Close;
    MyQuery.Close;
  end;
  procedure CalcYarnManu;
  begin
    {get all the yarn returned: xx split by dept}
    StatusBar.Panels.Items[1].Text:='Fetching Yn Manufactured';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('SELECT yr.ynstru,yr.yntwist,yr.YNCOL,yr.YNQLTY,');
    MyQuery.SQL.Add('vt.yearno,vt.periodno,SUM(yr.YNNET)');
    MyQuery.SQL.Add('FROM YARNRCPT yr,vtperiod vt');
    MyQuery.SQL.Add('where (yr.Datemanu >= vt.fromdate)');
    MyQuery.SQL.Add('AND (yr.DATEMANU <=vt.todate)');
    MyQuery.SQL.Add('and vt.yearno='+inttostr(NextYearNo)+' and vt.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('and yr.ynqlty<>''W'' and yr.returned=''N''');
    MyQuery.SQL.Add('group BY YR.YNSTRU, yr.yntwist, YR.YNCOL,');
    MyQuery.SQL.Add('yr.ynqlty,vt.yearno,vt.periodno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEYarnAnal.Open;
    while not MyQuery.EOF do
    begin
      MEYarnAnal.SetKey;
      MEYarnAnalYnStru.Value:=MyQuery.Fields[0].AsString;
      MEYarnAnalYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEYarnAnalYnCol.Value:=MyQuery.Fields[2].AsString;
      MEYarnAnalYnQlty.Value:=MyQuery.Fields[3].AsString;
      MEYarnAnalYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEYarnAnalPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEYarnAnal.GotoKey then
      begin
        {insert the missing record!!}
        with MEYarnAnal do
        begin
          Insert;
          MEYarnAnalYnStru.Value:=MyQuery.Fields[0].AsString;
          MEYarnAnalYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEYarnAnalYnCol.Value:=MyQuery.Fields[2].AsString;
          MEYarnAnalYnQlty.Value:=MyQuery.Fields[3].AsString;
          MEYarnAnalYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEYarnAnalPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          MEYarnAnalYnManu.Value:=MyQuery.Fields[6].AsFloat;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end
      else
      begin
        MEYarnAnal.Edit;
        MEYarnAnalYnManu.Value:=MyQuery.Fields[6].AsFloat;
        MEYarnAnal.Post;
      end;
      MyQuery.Next;
    end;
    MEYarnAnal.Close;
    MyQuery.Close;
  end;
  procedure YarnReturned;
  begin
    {get all the yarn returned: xx split by dept}
    StatusBar.Panels.Items[1].Text:='Fetching Yn Desp Returned';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vp.yearno,vp.periodno,sum(yr.ynnet)');
    MyQuery.SQL.Add('from yarnrcpt yr,vtperiod vp');
    MyQuery.SQL.Add('where yr.returned<>''N'''); {returned from all clients}
    MyQuery.SQL.Add('and yr.datemanu>=vp.fromdate');
    MyQuery.SQL.Add('and yr.datemanu<=vp.todate');
    MyQuery.SQL.Add('and yr.ynqlty<>''W''');
    MyQuery.SQL.Add('and vp.yearno='+inttostr(NextYearNo)+' and vp.periodno='+inttostr(NextPeriodNo));
    MyQuery.SQL.Add('group by ynstru,yntwist,yncol,ynqlty,vp.yearno,vp.periodno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEYarnAnal.Open;
    while not MyQuery.EOF do
    begin
      MEYarnAnal.SetKey;
      MEYarnAnalYnStru.Value:=MyQuery.Fields[0].AsString;
      MEYarnAnalYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEYarnAnalYnCol.Value:=MyQuery.Fields[2].AsString;
      MEYarnAnalYnQlty.Value:=MyQuery.Fields[3].AsString;
      MEYarnAnalYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEYarnAnalPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEYarnAnal.GotoKey then
      begin
        {insert the missing record!!}
        with MEYarnAnal do
        begin
          Insert;
          MEYarnAnalYnStru.Value:=MyQuery.Fields[0].AsString;
          MEYarnAnalYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEYarnAnalYnCol.Value:=MyQuery.Fields[2].AsString;
          MEYarnAnalYnQlty.Value:=MyQuery.Fields[3].AsString;
          MEYarnAnalYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEYarnAnalPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          MEYarnAnalYnReturned.Value:=MyQuery.Fields[6].AsFloat;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end
      else
      begin
        MEYarnAnal.Edit;
        MEYarnAnalYnReturned.Value:=MyQuery.Fields[6].AsFloat;
        MEYarnAnal.Post;
      end;
      MyQuery.Next;
    end;
    MEYarnAnal.Close;
    MyQuery.Close;
  end;
  procedure CalcIssues; {despatched to all departments incl Sales}
  begin
    {get all the yarn returned: xx split by dept}
    StatusBar.Panels.Items[1].Text:='Calculating Yarn Issued/Despatched';
    Application.ProcessMessages;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('SELECT yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,');
    MyQuery.SQL.Add('vt.yearno,vt.periodno,yd.custref,sum(yr.ynnet)');
    MyQuery.SQL.Add('FROM vtperiod vt,YARNRCPT yr,yndesphdr yd');
    MyQuery.SQL.Add('where yd.despdate >= vt.fromdate');
    MyQuery.SQL.Add('and yd.despdate <= vt.todate');
    MyQuery.SQL.Add('and yr.despno=yd.despno');
    MyQuery.SQL.Add('and vt.yearno='+inttostr(NextYearNo)+' and vt.periodno='+inttostr(NextPeriodNo));
    {MyQuery.SQL.Add('and yr.ynqlty<>''W'''); - must include WIP issues wont be included!}
    MyQuery.SQL.Add('group by yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,vt.yearno,vt.periodno,yd.custref');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    MEYarnAnal.Open;
    while not MyQuery.EOF do
    begin
      MEYarnAnal.SetKey;
      MEYarnAnalYnStru.Value:=MyQuery.Fields[0].AsString;
      MEYarnAnalYnTwist.Value:=MyQuery.Fields[1].AsString;
      MEYarnAnalYnCol.Value:=MyQuery.Fields[2].AsString;
      MEYarnAnalYnQlty.Value:=MyQuery.Fields[3].AsString;
      MEYarnAnalYearNo.Value:=MyQuery.Fields[4].AsInteger;
      MEYarnAnalPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
      ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
      if not MEYarnAnal.GotoKey then
      begin
        {insert the missing record!!}
        with MEYarnAnal do
        begin
          Insert;
          MEYarnAnalYnStru.Value:=MyQuery.Fields[0].AsString;
          MEYarnAnalYnTwist.Value:=MyQuery.Fields[1].AsString;
          MEYarnAnalYnCol.Value:=MyQuery.Fields[2].AsString;
          MEYarnAnalYnQlty.Value:=MyQuery.Fields[3].AsString;
          MEYarnAnalYearNo.Value:=MyQuery.Fields[4].AsInteger;
          MEYarnAnalPeriodNo.Value:=MyQuery.Fields[5].AsInteger;
          Post;
        end;
        {MainForm.Database.RollBack;
        raise Exception.Create('VBReSlit Search:Error at '+ErrorString);}
      end;
      begin
        MEYarnAnal.Edit;
        if MyQuery.Fields[6].AsString='VREDEQ' then
          MEYarnAnalIssuedQlty.Value:=MyQuery.Fields[7].AsFloat
        else if MyQuery.Fields[6].AsString='WEAVNG' then
          MEYarnAnalIssuedWeaving.Value:=MyQuery.Fields[7].AsFloat
        else if MyQuery.Fields[6].AsString='TWISTR' then
          MEYarnAnalIssuedTwister.Value:=MyQuery.Fields[7].AsFloat
        else if MyQuery.Fields[6].AsString='VRWARP' then
          MEYarnAnalIssuedWarping.Value:=MyQuery.Fields[7].AsFloat
        else if MyQuery.Fields[6].AsString='ADJUST' then
          MEYarnAnalIssuedAdjust.Value:=MyQuery.Fields[7].AsFloat
        else if MyQuery.Fields[6].AsString='AECI' then
          MEYarnAnalSalesAECI.Value:=MyQuery.Fields[7].AsFloat
        else if MyQuery.Fields[6].AsString='LOUVTE' then
          MEYarnAnalSalesLouvte.Value:=MyQuery.Fields[7].AsFloat
        else if MyQuery.Fields[6].AsString='XTILIA' then
          MEYarnAnalSalesXtilia.Value:=MyQuery.Fields[7].AsFloat
        else if MyQuery.Fields[6].AsString='VREDFU' then
          MEYarnAnalIssuedVredeFU.Value:=MyQuery.Fields[7].AsFloat
        else if MyQuery.Fields[6].AsString='VREDVB' then
          MEYarnAnalIssuedVredeVB.Value:=MyQuery.Fields[7].AsFloat
        else
          MEYarnAnalIssuedOther.Value:=MyQuery.Fields[7].AsFloat;
        MEYarnAnal.Post;
      end;
      MyQuery.Next;
    end;
    MEYarnAnal.Close;
    MyQuery.Close;
  end;
begin
  CalcOpenWeight;
  CalcCloseWeight; {according to OpenWeight Calc method}
  CalcOpenWIP;
  CalcCloseWIP;
  CalcYarnManu;
  YarnReturned;
  CalcIssues; {despatched to all departments incl Sales}
end;

procedure TSPeomForm.RunBtnClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;                 { Show hourglass cursor }
  Application.ProcessMessages;
  MainForm.Database.StartTransaction;
  {YnSales;}
  WeftUsed; {run this}
  YarnAnalysis; {run this}
  {yarn and raw materials in yarn system}
  Param.Edit;
  ParamLastMEYearNo.AsInteger:=NextYearNo;
  ParamLastMEPeriodNo.AsInteger:=NextPeriodNo;
  Param.Post;
  MainForm.Database.Commit;
  Screen.Cursor := crDefault;                  { Always restore to normal }
  StatusBar.Panels.Items[1].Text:='Ready';
  Application.ProcessMessages;
end;

end.
