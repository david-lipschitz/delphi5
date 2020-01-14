{Unit Name: ProductMake
Written By: DH Lipschitz on 11th March 1997
Descr: Calculate the production tracking schedule at the spinning factory.
Not used by Oct 1997 as txndet system written}

unit prodmake;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, {Dialogs,} StdCtrls, Buttons, DBTables, DB, Grids, DBGrids,
  ComCtrls, ExtCtrls, Mask, DBCtrls;

type
  TProductMakeForm = class(TForm)
    CloseBitBtn: TBitBtn;
    RunMakeBtn: TButton;
    ProductMake: TTable;
    ProductMakeSource: TDataSource;
    MyQuery: TQuery;
    PrintAllBtn: TButton;
    StatusBar: TStatusBar;
    ProductMakeGrid: TDBGrid;
    Label1: TLabel;
    ParamSource: TDataSource;
    EditMakeDate: TDBEdit;
    ParamQuery: TQuery;
    ParamQueryMAKEDATE: TDateTimeField;
    ProductMakePRODREF: TStringField;
    ProductMakeCATEGORY: TStringField;
    ProductMakeFIXEDWEIGHT: TStringField;
    ProductMakePRINSTOCK: TFloatField;
    ProductMakeDHEQTYRCVDINCDHO: TFloatField;
    ProductMakeDPQTYRCVDINCDHO: TFloatField;
    ProductMakeDPQTYISSUEDINCDHO: TFloatField;
    ProductMakeDPQTYREMINCDHO: TFloatField;
    ProductMakeDHEQTYRCVDEXDHO: TFloatField;
    ProductMakeDPQTYRCVDEXDHO1: TFloatField;
    ProductMakeDPQTYISSUEDEXDHO: TFloatField;
    ProductMakeDPQTYREMEXDHO: TFloatField;
    ProductMakeDELBCBQTYRCVDEXDHO: TFloatField;
    ProductMakeOPSTDELIN: TFloatField;
    ProductMakeOPSTDELISSUE: TFloatField;
    ProductMakeOPSTWIPRCPTEXWIP: TFloatField;
    ProductMakeOPSTWIPRCPTWIP: TFloatField;
    ProductMakeOPSTWIPISSUE: TFloatField;
    ProductMakeOPENINGSTOCK: TFloatField;
    ProductMakeDPQTYRCVDEXDHO2: TFloatField;
    ProductMakeDELISSUEQTYEXDHO: TFloatField;
    ProductMakeDELISSUEQTYDHLTI: TFloatField;
    ProductMakeDELISSUEQTYDHTBS: TFloatField;
    ProductMakeDELISSUEQTYDHSAF: TFloatField;
    ProductMakeDELISSUEQTYFTMORE: TFloatField;
    ProductMakeDELISSUEQTYFUSE: TFloatField;
    ProductMakeDELISSUEQTYRETPLA: TFloatField;
    ProductMakeDELISSUEQTYSASOL: TFloatField;
    ProductMakeDELISSUEQTYTWISTR: TFloatField;
    ProductMakeDELISSUEQTYVB: TFloatField;
    ProductMakeDELISSUEQTYWIP: TFloatField;
    ProductMakeDELISSUEQTYSANS: TFloatField;
    ProductMakeDELISSUEQTYWASTE: TFloatField;
    ProductMakeDELISSUEQTYOTHER: TFloatField;
    ProductMakeDPQTYRCVDDHLTI: TFloatField;
    ProductMakeDPQTYRCVDDHTBS: TFloatField;
    ProductMakeDPQTYRCVDDHSAF: TFloatField;
    ProductMakeWIPRCPTEXWIP: TFloatField;
    ProductMakeWIPISSUEFTMORE: TFloatField;
    ProductMakeWIPISSUEFUSE: TFloatField;
    ProductMakeWIPISSUERETPLA: TFloatField;
    ProductMakeWIPISSUESASOL: TFloatField;
    ProductMakeWIPISSUETWISTR: TFloatField;
    ProductMakeWIPISSUEVB: TFloatField;
    ProductMakeWIPISSUEWIP: TFloatField;
    ProductMakeWIPISSUEDHLTI: TFloatField;
    ProductMakeWIPISSUEDHTBS: TFloatField;
    ProductMakeWIPISSUEDHSAF: TFloatField;
    ProductMakeWIPISSUESANS: TFloatField;
    ProductMakeWIPISSUEWASTE: TFloatField;
    ProductMakeWIPISSUEOTHER: TFloatField;
    ProductMakeWIPRCPTWIP: TFloatField;
    ProductMakeTOTDELINEXDHO: TFloatField;
    ProductMakeTOTISSUE: TFloatField;
    ProductMakeTOTDELINDHO: TFloatField;
    ProductMakeTOTWIPRCPTEXWIP: TFloatField;
    ProductMakeTOTWIPISSUE: TFloatField;
    ProductMakeTOTPURCHASESINPERIOD: TFloatField;
    ProductMakeTOTISSUESINPERIOD: TFloatField;
    ProductMakeCLOSINGSTOCKEXWIP: TFloatField;
    ProductMakeTOTWIPRCPTWIP: TFloatField;
    ProductMakeCLOSINGSTOCKINCWIP: TFloatField;
    ProductMakeTOTACTUALUSAGE: TFloatField;
    ParamQueryPMSTARTDATE: TDateTimeField;
    ParamQueryPMENDDATE: TDateTimeField;
    EditPMStartDate: TDBEdit;
    EditPMEndDate: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    ProductMakeTOTUSAGE2: TFloatField;
    ProductMakeOPVALEXREDUNDANT: TFloatField;
    ProductMakeCLVALEXREDUNDANT: TFloatField;
    ProductMakeOPPRICE: TFloatField;
    ProductMakeCLPRICE: TFloatField;
    ProductMakePURCHASEVALUE: TFloatField;
    ProductMakeUSAGEVALUE2: TFloatField;
    ProductMakeUSAGEVALUE3: TFloatField;
    ProductMakeOPDELINFP: TFloatField;
    ProductMakeOPDELINZP: TFloatField;
    ProductMakeOPDELINRP: TFloatField;
    ProductMakeOPWIPFP: TFloatField;
    ProductMakeOPWIPZIP: TFloatField;
    ProductMakeOPWIPRP: TFloatField;
    ProductMakeCLDELINFP: TFloatField;
    ProductMakeCLDELINZP: TFloatField;
    ProductMakeCLDELINRP: TFloatField;
    ProductMakeCLWIPFP: TFloatField;
    ProductMakeCLWIPZIP: TFloatField;
    ProductMakeCLWIPRP: TFloatField;
    ProductMakeOPFP: TFloatField;
    ProductMakeOPFPPRICE: TFloatField;
    ProductMakeOPFPVALUE: TFloatField;
    ProductMakeOPZP: TFloatField;
    ProductMakeOPZPPRICE: TFloatField;
    ProductMakeOPZPVALUE: TFloatField;
    ProductMakeOPRP: TFloatField;
    ProductMakeOPRPPRICE: TFloatField;
    ProductMakeOPRPVALUE: TFloatField;
    ProductMakeOPVALUE: TFloatField;
    ProductMakeCLFP: TFloatField;
    ProductMakeCLFPPRICE: TFloatField;
    ProductMakeCLFPVALUE: TFloatField;
    ProductMakeCLZP: TFloatField;
    ProductMakeCLZPPRICE: TFloatField;
    ProductMakeCLZPVALUE: TFloatField;
    ProductMakeCLRP: TFloatField;
    ProductMakeCLRPPRICE: TFloatField;
    ProductMakeCLRPVALUE: TFloatField;
    ProductMakeCLVALUE: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure RunMakeBtnClick(Sender: TObject);
    procedure PrintAllBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ProductMakeGridDblClick(Sender: TObject);
  private
    { Private declarations }
    PixelsInInchx: integer;       { Stores Pixels per inch }
    LineHeight: Integer;          { Stores the line height }
    AmountPrinted: integer;       { Stores amount, in pixels, printed on a page }
    TenthsOfInchPixelsY: integer; { Pixels in 1/10 of an inch used for line spacing }
    DateHeading:string;
    HeaderDescr:string;
    procedure PMDelete;
    procedure PMSetup;
    procedure PMFindOpeningQtyIncDyeHouse;
    procedure PMFindOpeningQtyExDyeHouse;
    procedure PMFindOpeningQuantities;
    procedure PMFindDelInDuringPeriod; {rcvd}
    procedure PMFindDelIssuesDuringPeriod;
    procedure PMFindWIPRcptDuringPeriod;
    procedure PMFindWIPIssueDuringPeriod;
    procedure PMFindEOPeriodWIP;
    procedure PMCalcTotals;
    procedure PMCalcValueIncludingRedundant;
    procedure PMCalcValueWithBreakdown;
    procedure PMCalcValueTotals;
    procedure PrintHeader;
    procedure PrintTrackLHSColumnNames;
    procedure PrintTrackRHSColumnNames;
    procedure PrintTrackLHS;
    procedure PrintTrackRHS;
    procedure PrintPlanLHSColumnNames;
    procedure PrintPlanRHSColumnNames;
    procedure PrintPlanLHS;
    procedure PrintPlanRHS;
    procedure PrintLine(Items: TStringList);
  public
    { Public declarations }
  end;

var
  ProductMakeForm: TProductMakeForm;

implementation

{$R *.DFM}

uses Main,Dialogs,printers;

procedure TProductMakeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{  if ProductMake.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;}
  ParamQuery.Close;
  ProductMake.Close;
  ProductMakeForm.Release;
end;

procedure TProductMakeForm.FormShow(Sender: TObject);
begin
  ProductMake.Open;
  ParamQuery.Open;
  StatusBar.Panels.Items[1].Text:='Ready';
end;

procedure TProductMakeForm.CloseBitBtnClick(Sender: TObject);
begin
{  if ProductMake.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Make before closing',
      mtInformation, [mbOK], 0)
  else}
    Close;
end;

procedure TProductMakeForm.PMDelete;
begin
  StatusBar.Panels.Items[1].Text:='Getting Ready';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('delete from productmake');
  MyQuery.Prepare;
  MyQuery.ExecSQL;
  MyQuery.Close;
end;

procedure TProductMakeForm.PMSetup;
begin
  StatusBar.Panels.Items[1].Text:='Fetching Products';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('insert into productmake (prodref,category,fixedweight,prinstock)');
  MyQuery.SQL.Add('select prodref,category,fixedweight,instock');
  MyQuery.SQL.Add('from product');
  MyQuery.Prepare;
  MyQuery.ExecSQL;
  ProductMake.Refresh;
  MyQuery.Close;
end;

procedure TProductMakeForm.PMFindOpeningQtyIncDyeHouse;
var
  ErrorString:string[4];
begin
  {1: fetch delhead info}
  StatusBar.Panels.Items[1].Text:='Fetching Opening Quantities: DelHead inc DHO';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,sum(dh.qtyrcvd) rcvd');
  MyQuery.SQL.Add('from delhead dh');
  MyQuery.SQL.Add('where dh.deldate<'''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+'''');
  MyQuery.SQL.Add('group by dh.prodref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
{    if MyQuery.Fields[2].AsInteger=89 then
      ProductMakeMin89.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=127 then
      ProductMakeMin127.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=2070 then
      ProductMakeMin2070.Value:=MyQuery.Fields[3].AsInteger;}
    ProductMakeDHEQtyRcvdincDHO.Value:=MyQuery.Fields[1].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  {2: fetch delpallet info}
  StatusBar.Panels.Items[1].Text:='Fetching Opening Quantities: Pallets inc DHO';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dp.prodref,sum(dp.qtyrcvd) rcvd,sum(dp.qtyissued) issued,');
  MyQuery.SQL.Add('sum(dp.qtyrcvd-dp.qtyissued) qtyrem');
  MyQuery.SQL.Add('from delpallet dp,delhead dh');
  MyQuery.SQL.Add('where dp.delno=dh.delno');
  MyQuery.SQL.Add('and dh.deldate<'''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+'''');
  MyQuery.SQL.Add('group by dp.prodref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
{    if MyQuery.Fields[2].AsInteger=89 then
      ProductMakeMin89.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=127 then
      ProductMakeMin127.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=2070 then
      ProductMakeMin2070.Value:=MyQuery.Fields[3].AsInteger;}
    ProductMakeDPQtyRcvdincDHO.Value:=MyQuery.Fields[1].AsFloat;
    ProductMakeOpStDelIn.Value:=MyQuery.Fields[1].AsFloat;
    ProductMakeDPQtyIssuedincDHO.Value:=MyQuery.Fields[2].AsFloat;
    ProductMakeDPQtyRemincDHO.Value:=MyQuery.Fields[3].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end;

procedure TProductMakeForm.PMFindOpeningQtyExDyeHouse;
var
  ErrorString:string[4];
begin
  {1: fetch delhead info}
  StatusBar.Panels.Items[1].Text:='Fetching Opening Quantities: DelHead ex DHO';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,sum(dh.qtyrcvd) rcvd');
  MyQuery.SQL.Add('from delhead dh');
  MyQuery.SQL.Add('where dh.deldate<'''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+'''');
  MyQuery.SQL.Add('and dh.supref<>''DHLTI'' and dh.supref<>''DHSAF''');
  MyQuery.SQL.Add('and dh.supref<>''DHTBS''');
  MyQuery.SQL.Add('group by dh.prodref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    ProductMakeDHEQtyRcvdexDHO.Value:=MyQuery.Fields[1].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  {2: fetch delpallet info}
  StatusBar.Panels.Items[1].Text:='Fetching Opening Quantities: Pallets ex DHO';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dp.prodref,sum(dp.qtyrcvd) rcvd,sum(dp.qtyissued) issued,');
  MyQuery.SQL.Add('sum(dp.qtyrcvd-dp.qtyissued) qtyrem');
  MyQuery.SQL.Add('from delpallet dp,delhead dh');
  MyQuery.SQL.Add('where dp.delno=dh.delno');
  MyQuery.SQL.Add('and dh.deldate<'''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+'''');  
  MyQuery.SQL.Add('and dh.supref<>''DHLTI'' and dh.supref<>''DHSAF''');
  MyQuery.SQL.Add('and dh.supref<>''DHTBS''');
  MyQuery.SQL.Add('group by dp.prodref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
{    if MyQuery.Fields[2].AsInteger=89 then
      ProductMakeMin89.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=127 then
      ProductMakeMin127.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=2070 then
      ProductMakeMin2070.Value:=MyQuery.Fields[3].AsInteger;}
    ProductMakeDPQtyRcvdexDHO1.Value:=MyQuery.Fields[1].AsFloat;
    ProductMakeDPQtyIssuedexDHO.Value:=MyQuery.Fields[2].AsFloat;
    ProductMakeDPQtyRemexDHO.Value:=MyQuery.Fields[3].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  {3. fetch DelBCB info}
  StatusBar.Panels.Items[1].Text:='Fetching Opening Quantities: BCBs ex DHO';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,sum(db.qty) rcvd');
  MyQuery.SQL.Add('from delbcb db,delhead dh');
  MyQuery.SQL.Add('where db.delno=dh.delno');
  MyQuery.SQL.Add('and dh.deldate<'''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+'''');  
  MyQuery.SQL.Add('and dh.supref<>''DHLTI'' and dh.supref<>''DHSAF''');
  MyQuery.SQL.Add('and dh.supref<>''DHTBS''');
  MyQuery.SQL.Add('group by dh.prodref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
{    if MyQuery.Fields[2].AsInteger=89 then
      ProductMakeMin89.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=127 then
      ProductMakeMin127.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=2070 then
      ProductMakeMin2070.Value:=MyQuery.Fields[3].AsInteger;}
    ProductMakeDelBCBQtyRcvdexDHO.Value:=MyQuery.Fields[1].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end; {exDyeHouse}

procedure TProductMakeForm.PMFindOpeningQuantities;
var
  ErrorString:string[4];
begin
  {1: total issues}
  StatusBar.Panels.Items[1].Text:='Fetching Opening Quantities: Issues';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,sum(id.qtyissued)');
  MyQuery.SQL.Add('from delhead dh,issuedet id');
  MyQuery.SQL.Add('where dh.delno=id.delno');
  MyQuery.SQL.Add('and id.dateissued<'''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+'''');  
  MyQuery.SQL.Add('group by dh.prodref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    ProductMakeOpStDelIssue.Value:=MyQuery.Fields[1].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  {2: fetch wip rcpt excl WIP}
  StatusBar.Panels.Items[1].Text:='Fetching Opening Quantities: WIPRcpt ex WIP';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select wr.prodref,sum(wr.netweight)');
  MyQuery.SQL.Add('from wiprcpt wr');
  MyQuery.SQL.Add('where wr.datemanu<'''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+'''');  
  MyQuery.SQL.Add('and wr.shift<>''W''');
  MyQuery.SQL.Add('group by wr.prodref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    ProductMakeOpStWIPRcptexWIP.Value:=MyQuery.Fields[1].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  {3: fetch wip rcpt WIP}
  StatusBar.Panels.Items[1].Text:='Fetching Opening Quantities: WIPRcpt WIP';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select wr.prodref,sum(wr.netweight)');
  MyQuery.SQL.Add('from wiprcpt wr');
  MyQuery.SQL.Add('where wr.datemanu='''+ {one day earlier xx}
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMStartDate.Value-1))+'''');
  MyQuery.SQL.Add('and (wr.shift=''W'')');
  MyQuery.SQL.Add('and (wr.datemanu<>wr.dateissued)'); {to cater for rcpts done incorrectly}
  MyQuery.SQL.Add('group by wr.prodref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    ProductMakeOpStWIPRcptWIP.Value:=MyQuery.Fields[1].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  {4: fetch WIPIssues}
  StatusBar.Panels.Items[1].Text:='Fetching Opening Quantities: WIP Issues';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select wr.prodref,sum(wr.netweight)');
  MyQuery.SQL.Add('from wiprcpt wr');
  MyQuery.SQL.Add('where wr.dateissued<'''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+'''');  
  MyQuery.SQL.Add('and wr.shift<>''W''');
  MyQuery.SQL.Add('group by wr.prodref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    ProductMakeOpStWIPIssue.Value:=MyQuery.Fields[1].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  {5: calc openingstock}
  StatusBar.Panels.Items[1].Text:='Fetching Opening Quantities: Calc Opening Stock';
  ProductMake.First;
  Application.ProcessMessages;
  while not ProductMake.EOF do
  begin
    ProductMake.Edit;
    ProductMakeOpeningStock.Value:=ProductMakeOpStDelIn.Value-
      ProductMakeOpStDelIssue.Value+
      ProductMakeOpStWIPRcptexWIP.Value+
      ProductMakeOpStWIPRcptWIP.Value-
      ProductMakeOpStWIPIssue.Value;
    ProductMake.Next;
  end;
end; {OpeningQuantities}

procedure TProductMakeForm.PMFindDelInDuringPeriod;
var
  ErrorString:string[4];
begin
  {1: excluding DyeHouse}
  StatusBar.Panels.Items[1].Text:='Fetching DelIn during period: ex DyeHouse';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,sum(dh.qtyrcvd)');
  MyQuery.SQL.Add('from delhead dh');
  MyQuery.SQL.Add('where (dh.deldate>='''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+''')');
  MyQuery.SQL.Add('and (dh.deldate<='''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMEndDate.Value)+''')');
  MyQuery.SQL.Add('and (dh.supref<>''DHLTI'') and (dh.supref<>''DHSAF'')');
  MyQuery.SQL.Add('and (dh.supref<>''DHTBS'')');
  MyQuery.SQL.Add('group by dh.prodref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  {xx can speed up by adding prodrefs to array and then doing one productmake search}
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('Period DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    ProductMakeDPQtyRcvdexDHO2.Value:=MyQuery.Fields[1].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  {DyeHouse only}
  StatusBar.Panels.Items[1].Text:='Fetching DelIn during period:  DyeHouse';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,dh.supref,sum(dh.qtyrcvd)');
  MyQuery.SQL.Add('from delhead dh');
  MyQuery.SQL.Add('where (dh.deldate>='''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+''')');
  MyQuery.SQL.Add('and (dh.deldate<='''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMEndDate.Value)+''')');
  MyQuery.SQL.Add('and ((dh.supref=''DHLTI'') or (dh.supref=''DHSAF'')');
  MyQuery.SQL.Add(' or (dh.supref=''DHTBS''))');
  MyQuery.SQL.Add('group by dh.prodref,dh.supref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  {xx can speed up by adding prodrefs to array and then doing one productmake search}
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('Period DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsString='DHLTI' then
      ProductMakeDPQtyRcvdDHLTI.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='DHTBS' then
      ProductMakeDPQtyRcvdDHTBS.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='DHSAF' then
      ProductMakeDPQtyRcvdDHSAF.Value:=MyQuery.Fields[2].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end; {PMFindDelInDuringPeriod}

procedure TProductMakeForm.PMFindDelIssuesDuringPeriod;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Fetching DelIssues during period';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,id.issueto,sum(id.qtyissued)');
  MyQuery.SQL.Add('from delhead dh,issuedet id');
  MyQuery.SQL.Add('where (dh.delno=id.delno)'); {xx check for prodref in delpallet<>prodref in delhead}
  MyQuery.SQL.Add('and (id.dateissued>='''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+''')');
  MyQuery.SQL.Add('and (id.dateissued<='''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMEndDate.Value)+''')');
  MyQuery.SQL.Add('group by dh.prodref,id.issueto');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  {xx can speed up by adding prodrefs to array and then doing one productmake search}
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('Period DelIssue:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if (MyQuery.Fields[1].AsString<>'DHLTI') and
      (MyQuery.Fields[1].AsString<>'DHSAF') and
      (MyQuery.Fields[1].AsString<>'DHTBS') then
      ProductMakeDelIssueQtyexDHO.Value:=ProductMakeDelIssueQtyexDHO.Value+
        MyQuery.Fields[2].AsFloat;
    if MyQuery.Fields[1].AsString='DHLTI' then
      ProductMakeDelIssueQtyDHLTI.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='DHTBS' then
      ProductMakeDelIssueQtyDHTBS.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='DHSAF' then
      ProductMakeDelIssueQtyDHSAF.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='FTMORE' then
      ProductMakeDelIssueQtyFTMORE.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='FUSE' then
      ProductMakeDelIssueQtyFUSE.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='RETPLA' then
      ProductMakeDelIssueQtyRETPLA.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='SASOL' then
      ProductMakeDelIssueQtySASOL.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='TWISTR' then
      ProductMakeDelIssueQtyTWISTR.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='VB' then
      ProductMakeDelIssueQtyVB.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='WIP' then
      ProductMakeDelIssueQtyWIP.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='SANS' then
      ProductMakeDelIssueQtySANS.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='WASTE' then
      ProductMakeDelIssueQtyWASTE.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='OTHER' then
      ProductMakeDelIssueQtyOTHER.Value:=MyQuery.Fields[2].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end; {PMFindDelIssuesDuringPeriod}

procedure TProductMakeForm.PMFindWIPRcptDuringPeriod;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Fetching Period Quantities: WIPRcpt';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select wr.prodref,sum(wr.netweight)');
  MyQuery.SQL.Add('from wiprcpt wr');
  MyQuery.SQL.Add('where (wr.datemanu>='''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+''')');
  MyQuery.SQL.Add('and (wr.datemanu<='''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMEndDate.Value)+''')');
  MyQuery.SQL.Add('and wr.shift<>''W''');
  MyQuery.SQL.Add('group by wr.prodref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    ProductMakeWIPRcptexWIP.Value:=MyQuery.Fields[1].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end; {PMFindWIPRcptDuringPeriod}

procedure TProductMakeForm.PMFindWIPIssueDuringPeriod;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Fetching WIP Issues during period';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select wr.prodref,wr.issueto,sum(wr.netweight)');
  MyQuery.SQL.Add('from wiprcpt wr');
  MyQuery.SQL.Add('where (wr.dateissued>='''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMStartDate.Value)+''')');
  MyQuery.SQL.Add('and (wr.dateissued<='''+
    formatdatetime('dd-mmm-yyyy',ParamQueryPMEndDate.Value)+''')');
  MyQuery.SQL.Add('and (wr.shift<>''W'')');
  MyQuery.SQL.Add('group by wr.prodref,wr.issueto');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  {xx can speed up by adding prodrefs to array and then doing one productmake search}
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('Period DelIssue:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsString='DHLTI' then
      ProductMakeWIPIssueDHLTI.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='DHTBS' then
      ProductMakeWIPIssueDHTBS.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='DHSAF' then
      ProductMakeWIPIssueDHSAF.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='FTMORE' then
      ProductMakeWIPIssueFTMORE.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='FUSE' then
      ProductMakeWIPIssueFUSE.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='RETPLA' then
      ProductMakeWIPIssueRETPLA.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='SASOL' then
      ProductMakeWIPIssueSASOL.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='TWISTR' then
      ProductMakeWIPIssueTWISTR.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='VB' then
      ProductMakeWIPIssueVB.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='WIP' then
      ProductMakeWIPIssueWIP.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='SANS' then
      ProductMakeWIPIssueSANS.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='WASTE' then
      ProductMakeWIPIssueWASTE.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsString='OTHER' then
      ProductMakeWIPIssueOTHER.Value:=MyQuery.Fields[2].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end; {PMFindWIPIssueDuringPeriod}

procedure TProductMakeForm.PMFindEOPeriodWIP;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Fetching End of Period WIP';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select wr.prodref,sum(wr.netweight)');
  MyQuery.SQL.Add('from wiprcpt wr');
  MyQuery.SQL.Add('where (wr.datemanu='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMEndDate.Value))+''')');
  MyQuery.SQL.Add('and (wr.shift=''W'')');
  MyQuery.SQL.Add('and (wr.datemanu<>wr.dateissued)');
  MyQuery.SQL.Add('group by wr.prodref');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    ProductMakeWIPRcptWIP.Value:=MyQuery.Fields[1].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end; {PMFindEOPeriodWIP}

procedure TProductMakeForm.PMCalcTotals;
{var
  ErrorString:string[4];}
begin
  StatusBar.Panels.Items[1].Text:='Calculating Totals';
  ProductMake.First;
  Application.ProcessMessages;
  while not ProductMake.EOF do
  begin
    ProductMake.Edit;
    ProductMakeTotDelInexDHO.Value:=
      ProductMakeDPQtyRcvdexDHO2.Value;
    ProductMakeTotIssue.Value:=
      {ProductMakeDelIssueQtyexDHO.Value+: leave out otherwise double counting}
      ProductMakeDelIssueQtyDHLTI.Value+
      ProductMakeDelIssueQtyDHTBS.Value+
      ProductMakeDelIssueQtyDHSAF.Value+
      ProductMakeDelIssueQtyFTMORE.Value+
      ProductMakeDelIssueQtyFUSE.Value+
      ProductMakeDelIssueQtyRETPLA.Value+
      ProductMakeDelIssueQtySASOL.Value+
      ProductMakeDelIssueQtyTWISTR.Value+
      ProductMakeDelIssueQtyVB.Value+
      ProductMakeDelIssueQtyWIP.Value+
      ProductMakeDelIssueQtySANS.Value+
      ProductMakeDelIssueQtyWASTE.Value+ {XX SHOW SEPARATELY}
      ProductMakeDelIssueQtyOTHER.Value;
    ProductMakeTotDelInDHO.Value:=
      ProductMakeDPQtyRcvdDHLTI.Value+
      ProductMakeDPQtyRcvdDHTBS.Value+
      ProductMakeDPQtyRcvdDHSAF.Value;
    ProductMakeTotWIPRcptexWIP.Value:=
      ProductMakeWIPRcptexWIP.Value;
    ProductMakeTotWIPIssue.Value:=
      ProductMakeWIPIssueFTMORE.Value+
      ProductMakeWIPIssueFUSE.Value+
      ProductMakeWIPIssueRETPLA.Value+
      ProductMakeWIPIssueSASOL.Value+
      ProductMakeWIPIssueTWISTR.Value+
      ProductMakeWIPIssueVB.Value+
      ProductMakeWIPIssueWIP.Value+
      ProductMakeWIPIssueDHLTI.Value+
      ProductMakeWIPIssueDHTBS.Value+
      ProductMakeWIPIssueDHSAF.Value+
      ProductMakeWIPIssueSANS.Value+
      ProductMakeWIPIssueWASTE.Value+ {XX SHOW waste SEPARATELY?}
      ProductMakeWIPIssueOTHER.Value;
    ProductMakeTotPurchasesInPeriod.Value:=
      ProductMakeTotDelInexDHO.Value+
      ProductMakeTotDelInDHO.Value;
    ProductMakeTotIssuesInPeriod.Value:=
      ProductMakeTotIssue.Value+
      ProductMakeTotWIPIssue.Value;
    ProductMakeClosingStockexWIP.Value:=
      (ProductMakeOpeningStock.Value-ProductMakeOpStWIPRcptWIP.Value)+{OpnStkexWIP}
      ProductMakeTotPurchasesInPeriod.Value+
      ProductMakeTotWIPRcptExWIP.Value-
      ProductMakeTotIssuesInPeriod.Value;
    ProductMakeTotWIPRcptWIP.Value:=
      ProductMakeWIPRcptWIP.Value;
    ProductMakeClosingStockincWIP.Value:=
      ProductMakeClosingStockexWIP.Value+
      ProductMakeTotWIPRcptWIP.Value;
    ProductMakeTotActualUsage.Value:=
      ProductMakeTotIssuesInPeriod.Value-
      ProductMakeOpStWIPRcptWIP.Value+
      ProductMakeTotWIPRcptWIP.Value;
    ProductMake.Next;
  end;
end; {PMCalcTotals}


procedure TProductMakeForm.PMCalcValueIncludingRedundant;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Calculating Opening Prices (incl Redundant)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select prodref,stdprice');
  MyQuery.SQL.Add('from storeprice');
  MyQuery.SQL.Add('where (fromdate<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMStartDate.Value-1))+''')');
  MyQuery.SQL.Add('and (todate>='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMStartDate.Value-1))+''')');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    ProductMakeOpPrice.Value:=MyQuery.Fields[1].AsFloat;
    ProductMakeOpValExRedundant.Value:=MyQuery.Fields[1].AsFloat*
      ProductMakeOpeningStock.Value;
    ProductMakeOpFPPrice.Value:=MyQuery.Fields[1].AsFloat;
    ProductMakeOpZPPrice.Value:=0;
    ProductMakeOpRPPrice.Value:=MyQuery.Fields[1].AsFloat*0.999; {xx}
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  StatusBar.Panels.Items[1].Text:='Calculating Closing Prices (incl Redundant)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select prodref,stdprice');
  MyQuery.SQL.Add('from storeprice');
  MyQuery.SQL.Add('where (fromdate<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMEndDate.Value))+''')');
  MyQuery.SQL.Add('and (todate>='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMEndDate.Value))+''')');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    ProductMakeClPrice.Value:=MyQuery.Fields[1].AsFloat;
    ProductMakeClValExRedundant.Value:=MyQuery.Fields[1].AsFloat*
      ProductMakeClosingStockincWIP.Value;
    ProductMakePurchaseValue.Value:=MyQuery.Fields[1].AsFloat*
      ProductMakeTotPurchasesInPeriod.Value; {xx temporarily until full calc done}
    ProductMakeUsageValue3.Value:=ProductMakeOpValExRedundant.Value+
      ProductMakePurchaseValue.Value-
      ProductMakeClValExRedundant.Value; {gives opening value+purchase value-closing value=usage}
    ProductMakeClFPPrice.Value:=MyQuery.Fields[1].AsFloat;
    ProductMakeClZPPrice.Value:=0;
    ProductMakeClRPPrice.Value:=MyQuery.Fields[1].AsFloat*0.999; {xx}
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end; {PMCalcValueExcludingRedundant}

procedure TProductMakeForm.PMCalcValueWithBreakdown;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Calculating Opening Prices: DelIn Fixed Weight (with analysis)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dp.prodref,dp.valuerating,sum(dp.qtyrcvd)');
  MyQuery.SQL.Add('from product pr,delhead dh,delpallet dp');
  MyQuery.SQL.Add('where dp.prodref=pr.prodref');
  MyQuery.SQL.Add('and dp.delno=dh.delno');
  MyQuery.SQL.Add('and pr.fixedweight=''Y''');
  MyQuery.SQL.Add('and (dh.delnotedate<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMStartDate.Value-1))+''')');
  MyQuery.SQL.Add('group by dp.prodref,dp.valuerating');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsFloat=1 then
      ProductMakeOpDelInFP.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsFloat=0 then
      ProductMakeOpDelInZP.Value:=MyQuery.Fields[2].AsFloat
    else
      ProductMakeOpDelInRP.Value:=MyQuery.Fields[2].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  StatusBar.Panels.Items[1].Text:='Calculating Opening Prices: DelIn Not Fixed Weight (with analysis)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,db.valuerating,sum(db.qty)');
  MyQuery.SQL.Add('from product pr,delhead dh,delbcb db');
  MyQuery.SQL.Add('where (dh.prodref=pr.prodref)');
  MyQuery.SQL.Add('and (db.delno=dh.delno)');
  MyQuery.SQL.Add('and (pr.fixedweight=''N'')');
  MyQuery.SQL.Add('and (dh.delnotedate<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMStartDate.Value-1))+''')');
  MyQuery.SQL.Add('group by dh.prodref,db.valuerating');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsFloat=1 then
      ProductMakeOpDelInFP.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsFloat=0 then
      ProductMakeOpDelInZP.Value:=MyQuery.Fields[2].AsFloat
    else
      ProductMakeOpDelInRP.Value:=MyQuery.Fields[2].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  StatusBar.Panels.Items[1].Text:='Calculating Opening Prices: Issues (with analysis)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,dp.valuerating,sum(id.qtyissued)');
  MyQuery.SQL.Add('from product pr,delhead dh,delpallet dp,issuedet id');
  MyQuery.SQL.Add('where dh.prodref=pr.prodref');
  MyQuery.SQL.Add('and dp.delno=dh.delno');
  MyQuery.SQL.Add('and id.delno=dp.delno and id.palletno=dp.palletno');
  MyQuery.SQL.Add('and pr.fixedweight=''Y''');
  MyQuery.SQL.Add('and (dh.delnotedate<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMStartDate.Value-1))+''')');
  MyQuery.SQL.Add('and (id.dateissued<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMStartDate.Value-1))+''')');
  MyQuery.SQL.Add('group by dh.prodref,dp.valuerating');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsFloat=1 then
      ProductMakeOpDelInFP.Value:=ProductMakeOpDelInFP.Value-MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsFloat=0 then
      ProductMakeOpDelInZP.Value:=ProductMakeOpDelInZP.Value-MyQuery.Fields[2].AsFloat
    else
      ProductMakeOpDelInRP.Value:=ProductMakeOpDelInRP.Value-MyQuery.Fields[2].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  StatusBar.Panels.Items[1].Text:='Calculating Opening Prices: Issues (with analysis)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,db.valuerating,sum(id.qtyissued)');
  MyQuery.SQL.Add('from product pr,delhead dh,delbcb db,issuedet id');
  MyQuery.SQL.Add('where dh.prodref=pr.prodref');
  MyQuery.SQL.Add('and db.delno=dh.delno');
  MyQuery.SQL.Add('and id.delno=db.delno and id.palletno=db.palletno and id.bcbno=db.bcbno');
  MyQuery.SQL.Add('and pr.fixedweight=''N''');
  MyQuery.SQL.Add('and (dh.delnotedate<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMStartDate.Value-1))+''')');
  MyQuery.SQL.Add('and (id.dateissued<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMStartDate.Value-1))+''')');
  MyQuery.SQL.Add('group by dh.prodref,db.valuerating');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsFloat=1 then
      ProductMakeOpDelInFP.Value:=ProductMakeOpDelInFP.Value-MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsFloat=0 then
      ProductMakeOpDelInZP.Value:=ProductMakeOpDelInZP.Value-MyQuery.Fields[2].AsFloat
    else
      ProductMakeOpDelInRP.Value:=ProductMakeOpDelInRP.Value-MyQuery.Fields[2].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  StatusBar.Panels.Items[1].Text:='Calculating Opening Prices: WIP1 (with analysis)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select prodref,valuerating,sum(netweight)');
  MyQuery.SQL.Add('from wiprcpt');
  MyQuery.SQL.Add('where (datemanu<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMStartDate.Value-1))+''')');
  MyQuery.SQL.Add('group by prodref,valuerating');
  MyQuery.SQL.Add('order by prodref,valuerating');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('WIP Value analysis:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsFloat=1 then
      ProductMakeOpWIPFP.Value:=MyQuery.Fields[2].AsFloat {full price}
    else if MyQuery.Fields[1].AsFloat=0 then
      ProductMakeOpWIPZIP.Value:=MyQuery.Fields[2].AsFloat {zero price}
    else
      ProductMakeOpWIPRP.Value:=MyQuery.Fields[2].AsFloat; {redundant price}
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  StatusBar.Panels.Items[1].Text:='Calculating Opening Prices: WIP2 (with analysis)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select prodref,valuerating,sum(netweight)');
  MyQuery.SQL.Add('from wiprcpt');
  MyQuery.SQL.Add('where (dateissued<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMStartDate.Value-1))+''')');
  MyQuery.SQL.Add('group by prodref,valuerating');
  MyQuery.SQL.Add('order by prodref,valuerating');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('WIP Value analysis:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsFloat=1 then
      ProductMakeOpWIPFP.Value:=ProductMakeOpWIPFP.Value-MyQuery.Fields[2].AsFloat {full price}
    else if MyQuery.Fields[1].AsFloat=0 then
      ProductMakeOpWIPZIP.Value:=ProductMakeOpWIPZIP.Value-MyQuery.Fields[2].AsFloat {zero price}
    else
      ProductMakeOpWIPRP.Value:=ProductMakeOpWIPRP.Value-MyQuery.Fields[2].AsFloat; {redundant price}
    ProductMake.Post;
    MyQuery.Next;
  end;

  StatusBar.Panels.Items[1].Text:='Calculating Closing Prices: DelIn Fixed Weight (with analysis)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dp.prodref,dp.valuerating,sum(dp.qtyrcvd)');
  MyQuery.SQL.Add('from product pr,delhead dh,delpallet dp');
  MyQuery.SQL.Add('where (dp.prodref=pr.prodref)');
  MyQuery.SQL.Add('and (dp.delno=dh.delno)');
  MyQuery.SQL.Add('and (pr.fixedweight=''Y'')');
  MyQuery.SQL.Add('and (dh.delnotedate<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMEndDate.Value))+''')');
  MyQuery.SQL.Add('group by dp.prodref,dp.valuerating');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsFloat=1 then
      ProductMakeClDelInFP.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsFloat=0 then
      ProductMakeClDelInZP.Value:=MyQuery.Fields[2].AsFloat
    else
      ProductMakeClDelInRP.Value:=MyQuery.Fields[2].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  StatusBar.Panels.Items[1].Text:='Calculating Closing Prices: DelIn Not Fixed Weight (with analysis)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,db.valuerating,sum(db.qty)');
  MyQuery.SQL.Add('from product pr,delhead dh,delbcb db');
  MyQuery.SQL.Add('where (dh.prodref=pr.prodref)');
  MyQuery.SQL.Add('and (db.delno=dh.delno)');
  MyQuery.SQL.Add('and (pr.fixedweight=''N'')');
  MyQuery.SQL.Add('and (dh.delnotedate<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMEndDate.Value))+''')');
  MyQuery.SQL.Add('group by dh.prodref,db.valuerating');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsFloat=1 then
      ProductMakeClDelInFP.Value:=MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsFloat=0 then
      ProductMakeClDelInZP.Value:=MyQuery.Fields[2].AsFloat
    else
      ProductMakeClDelInRP.Value:=MyQuery.Fields[2].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  StatusBar.Panels.Items[1].Text:='Calculating Closing Prices: Issues (with analysis)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,dp.valuerating,sum(id.qtyissued)');
  MyQuery.SQL.Add('from product pr,delhead dh,delpallet dp,issuedet id');
  MyQuery.SQL.Add('where dh.prodref=pr.prodref');
  MyQuery.SQL.Add('and dp.delno=dh.delno');
  MyQuery.SQL.Add('and id.delno=dp.delno and id.palletno=dp.palletno');
  MyQuery.SQL.Add('and pr.fixedweight=''Y''');
  MyQuery.SQL.Add('and (dh.delnotedate<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMEndDate.Value))+''')');
  MyQuery.SQL.Add('and (id.dateissued<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMEndDate.Value))+''')');
  MyQuery.SQL.Add('group by dh.prodref,dp.valuerating');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsFloat=1 then
      ProductMakeClDelInFP.Value:=ProductMakeClDelInFP.Value-MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsFloat=0 then
      ProductMakeClDelInZP.Value:=ProductMakeClDelInZP.Value-MyQuery.Fields[2].AsFloat
    else
      ProductMakeClDelInRP.Value:=ProductMakeClDelInRP.Value-MyQuery.Fields[2].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  StatusBar.Panels.Items[1].Text:='Calculating Closing Prices: Issues (with analysis)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select dh.prodref,db.valuerating,sum(id.qtyissued)');
  MyQuery.SQL.Add('from product pr,delhead dh,delbcb db,issuedet id');
  MyQuery.SQL.Add('where dh.prodref=pr.prodref');
  MyQuery.SQL.Add('and db.delno=dh.delno');
  MyQuery.SQL.Add('and id.delno=db.delno and id.palletno=db.palletno and id.bcbno=db.bcbno');
  MyQuery.SQL.Add('and pr.fixedweight=''N''');
  MyQuery.SQL.Add('and (dh.delnotedate<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMEndDate.Value))+''')');
  MyQuery.SQL.Add('and (id.dateissued<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMEndDate.Value))+''')');
  MyQuery.SQL.Add('group by dh.prodref,db.valuerating');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('DelIn:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsFloat=1 then
      ProductMakeClDelInFP.Value:=ProductMakeClDelInFP.Value-MyQuery.Fields[2].AsFloat
    else if MyQuery.Fields[1].AsFloat=0 then
      ProductMakeClDelInZP.Value:=ProductMakeClDelInZP.Value-MyQuery.Fields[2].AsFloat
    else
      ProductMakeClDelInRP.Value:=ProductMakeClDelInRP.Value-MyQuery.Fields[2].AsFloat;
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  StatusBar.Panels.Items[1].Text:='Calculating Closing Prices: WIP1 (with analysis)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select prodref,valuerating,sum(netweight)');
  MyQuery.SQL.Add('from wiprcpt');
  MyQuery.SQL.Add('where (datemanu<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMEndDate.Value))+''')');
  MyQuery.SQL.Add('group by prodref,valuerating');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('WIP Value analysis:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsFloat=1 then
      ProductMakeClWIPFP.Value:=MyQuery.Fields[2].AsFloat {full price}
    else if MyQuery.Fields[1].AsFloat=0 then
      ProductMakeClWIPZIP.Value:=MyQuery.Fields[2].AsFloat {zero price}
    else
      ProductMakeClWIPRP.Value:=MyQuery.Fields[2].AsFloat; {redundant price}
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
  StatusBar.Panels.Items[1].Text:='Calculating Closing Prices: WIP2 (with analysis)';
  ProductMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select prodref,valuerating,sum(netweight)');
  MyQuery.SQL.Add('from wiprcpt');
  MyQuery.SQL.Add('where (dateissued<='''+
    formatdatetime('dd-mmm-yyyy',(ParamQueryPMEndDate.Value))+''')');
  MyQuery.SQL.Add('group by prodref,valuerating');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProductMake.SetKey;
    ProductMakeProdRef.Value:=MyQuery.Fields[0].AsString;
    ErrorString:=MyQuery.Fields[0].AsString;
    if not ProductMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      ProductMake.Refresh;
      raise Exception.Create('WIP Value analysis:Error at '+ErrorString);
    end;
    ProductMake.Edit;
    if MyQuery.Fields[1].AsFloat=1 then
      ProductMakeClWIPFP.Value:=ProductMakeClWIPFP.Value-MyQuery.Fields[2].AsFloat {full price}
    else if MyQuery.Fields[1].AsFloat=0 then
      ProductMakeClWIPZIP.Value:=ProductMakeClWIPZIP.Value-MyQuery.Fields[2].AsFloat {zero price}
    else
      ProductMakeClWIPRP.Value:=ProductMakeClWIPRP.Value-MyQuery.Fields[2].AsFloat; {redundant price}
    ProductMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end; {PMCalcValueWithBreakdown}

procedure TProductMakeForm.PMCalcValueTotals;
{var
  ErrorString:string[4];}
begin
  StatusBar.Panels.Items[1].Text:='Calculating Values';
  ProductMake.First;
  Application.ProcessMessages;
  {now recalc the new totals}
  StatusBar.Panels.Items[1].Text:='Calculating Totals';
  ProductMake.First;
  Application.ProcessMessages;
  {xx use update ExecSQL, it will be faster}
  while not ProductMake.EOF do
  begin
    ProductMake.Edit;
    ProductMakeOpFP.Value:=ProductMakeOpDelInFP.Value+ProductMakeOpWIPFP.Value;
    ProductMakeOpFPValue.Value:=ProductMakeOpFP.Value*ProductMakeOpFPPrice.Value;
    ProductMakeOpZP.Value:=ProductMakeOpDelInZP.Value+ProductMakeOpWIPZIP.Value;
    ProductMakeOpZPValue.Value:=ProductMakeOpZP.Value*ProductMakeOpZPPrice.Value;
    ProductMakeOpRP.Value:=ProductMakeOpDelInRP.Value+ProductMakeOpWIPRP.Value;
    ProductMakeOpRPValue.Value:=ProductMakeOpRP.Value*ProductMakeOpRPPrice.Value;
    ProductMakeOpValue.Value:=ProductMakeOpFPValue.Value+
      ProductMakeOpZPValue.Value+ProductMakeOpRPValue.Value;
    ProductMakeClFP.Value:=ProductMakeClDelInFP.Value+ProductMakeClWIPFP.Value;
    ProductMakeClFPValue.Value:=ProductMakeClFP.Value*ProductMakeClFPPrice.Value;
    ProductMakeClZP.Value:=ProductMakeClDelInZP.Value+ProductMakeClWIPZIP.Value;
    ProductMakeClZPValue.Value:=ProductMakeClZP.Value*ProductMakeClZPPrice.Value;
    ProductMakeClRP.Value:=ProductMakeClDelInRP.Value+ProductMakeClWIPRP.Value;
    ProductMakeClRPValue.Value:=ProductMakeClRP.Value*ProductMakeClRPPrice.Value;
    ProductMakeClValue.Value:=ProductMakeClFPValue.Value+
      ProductMakeClZPValue.Value+ProductMakeClRPValue.Value;
    ProductMake.Post;
    ProductMake.Next;
  end;
end; {PMCalcValueTotals}

procedure TProductMakeForm.RunMakeBtnClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;                 { Show hourglass cursor }
  Application.ProcessMessages;
  ProductMake.Close;
  ProductMake.ReadOnly:=false;
  ProductMake.Open;
  ProductMake.Close;
  ProductMake.IndexName:='RDB$PRIMARY10';
  ProductMake.Open;
  MainForm.Database.StartTransaction;
  MyQuery.Close;
  PMDelete;
  PMSetup;
  PMFindOpeningQtyIncDyeHouse; {for checking purposes}
  PMFindOpeningQtyExDyeHouse;  {for checking purposes}
  PMFindOpeningQuantities;
  PMFindDelIssuesDuringPeriod;
  PMFindDelInDuringPeriod;
  PMFindWIPRcptDuringPeriod;
  PMFindWIPIssueDuringPeriod;
  PMFindEOPeriodWIP;
  PMCalcTotals;
  PMCalcValueIncludingRedundant;
{  PMCalcValueWithBreakdown;
  PMCalcValueTotals; {calc extended totals including proper pricing}
  ParamQuery.Edit;
  ParamQueryMakeDate.ReadOnly:=false;
  ParamQueryMakeDate.Value:=now;
  ParamQueryMakeDate.ReadOnly:=true;
  ParamQuery.Post;
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
  ProductMake.Close;
  ProductMake.IndexName:='IPM_CATPROD';
  ProductMake.ReadOnly:=true;
  ProductMake.Open;
  Screen.Cursor := crDefault;                  { Always restore to normal }
  StatusBar.Panels.Items[1].Text:='Ready';
  Application.ProcessMessages;
end;

procedure TProductMakeForm.PrintHeader;
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

procedure TProductMakeForm.PrintLine(Items: TStringList);
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

procedure TProductMakeForm.PrintTrackLHSColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  with ColNames do begin
    { Create the column headers }
    AddObject('WpTyp', pointer(5));
    AddObject('Type', pointer(4));
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

procedure TProductMakeForm.PrintTrackLHS;
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
    MyQuery.SQL.Add('vm.pord127,vm.pstk127,vm.min89,vm.stk89,vm.ord89,vm.pord89,vm.pstk89');
    MyQuery.SQL.Add('from ProductMake vm');
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

procedure TProductMakeForm.PrintTrackRHSColumnNames;
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

procedure TProductMakeForm.PrintTrackRHS;
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
    MyQuery.SQL.Add('from ProductMake vm');
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

procedure TProductMakeForm.PrintPlanLHSColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  with ColNames do begin
    { Create the column headers }
    AddObject('Wp', pointer(2));
    AddObject('Col', pointer(3));
    AddObject('WtStru', pointer(5));
    AddObject('WtTw', pointer(4));
    AddObject('WtCol', pointer(4));
    AddObject('Type', pointer(4));
    {totals}
    AddObject('m TOrd', pointer(5));
    AddObject('m TStk', pointer(5));
    AddObject('m TRqd', pointer(5));
    AddObject('m FWStk', pointer(6));
    AddObject('W WIP', pointer(5));
    AddObject('V WIP', pointer(5));
    AddObject('F WIP', pointer(5));
    AddObject('PcsRqd', pointer(5));
    AddObject('Wp mRqd', pointer(6));
    AddObject('Wt YnRqd', pointer(7));
  end;
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;

procedure TProductMakeForm.PrintPlanLHS;
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
    MyQuery.SQL.Add('vm.wft1ynstock,vm.wft1tospin,vm.stk2070');
    MyQuery.SQL.Add('from ProductMake vm');
    MyQuery.SQL.Add('where VBStru<>''Z''');
    {MyQuery.SQL.Add('and ((pord127<>0) or (pstk127<>0)');
    MyQuery.SQL.Add('or (pord89<>0) or (pstk89<>0)');
    MyQuery.SQL.Add('or (pord2070<>0) or (pstk2070<>0)');
    MyQuery.SQL.Add('or (ptotord<>0) or (ptotstk<>0)');
    MyQuery.SQL.Add('or (WWIP<>0) or (VWIP<>0) or (FWIP<>0))');}
    MyQuery.SQL.Add('order by vm.warptype,vm.warpcol,vm.weft1col,vm.weft1stru,vm.weft1twist');
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
                        pointer(2));
        AddObject(MyQuery.FieldByName('WARPCOL').AsString,
                        pointer(3));
        AddObject(MyQuery.FieldByName('WEFT1STRU').AsString,
                        pointer(5));
        AddObject(MyQuery.FieldByName('WEFT1TWIST').AsString,
                        pointer(4));
        AddObject(MyQuery.FieldByName('WEFT1COL').AsString,
                        pointer(4));
        TempStr:=MyQuery.FieldByName('VBSTRU').AsString+
          MyQuery.FieldByName('VBCOL').AsString;
        AddObject(TempStr,pointer(4));
        {Totals}
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PTOTORD').AsFloat);
        AddObject(TempStr,pointer(5));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PTOTSTK').AsFloat);
        AddObject(TempStr,pointer(5));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('PTOTRQD').AsFloat);
        AddObject(TempStr,pointer(5));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('STK2070').AsFloat);
        AddObject(TempStr,pointer(6));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('WWIP').AsFloat);
        AddObject(TempStr,pointer(5));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('VWIP').AsFloat);
        AddObject(TempStr,pointer(5));
        TempStr:=FormatFloat('0;0;#', MyQuery.FieldByName('FWIP').AsFloat);
        AddObject(TempStr,pointer(5));
        TempStr:=FormatFloat('#', MyQuery.FieldByName('PCSRQD').AsFloat);
        AddObject(TempStr,pointer(5));
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

procedure TProductMakeForm.PrintPlanRHSColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  with ColNames do begin
    { Create the column headers }
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
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;

procedure TProductMakeForm.PrintPlanRHS;
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
    PrintPlanRHSColumnNames;                          { Print the column Names }
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select vm.warptype,vm.vbstru,vm.vbcol,');
    MyQuery.SQL.Add('vm.ptotord,vm.ptotstk,vm.ptotrqd,vm.wwip,vm.vwip,vm.fwip,');
    MyQuery.SQL.Add('vm.warpcol,vm.weft1stru,vm.weft1twist,vm.weft1col,');
    MyQuery.SQL.Add('vm.pcsrqd,vm.fwwarpmrqd,vm.wft1ynrqd,');
    MyQuery.SQL.Add('vm.wft1ynstock,vm.wft1tospin');
    MyQuery.SQL.Add('from ProductMake vm');
    MyQuery.SQL.Add('where VBStru<>''Z''');
    {MyQuery.SQL.Add('and ((pord127<>0) or (pstk127<>0)');
    MyQuery.SQL.Add('or (pord89<>0) or (pstk89<>0)');
    MyQuery.SQL.Add('or (pord2070<>0) or (pstk2070<>0)');
    MyQuery.SQL.Add('or (ptotord<>0) or (ptotstk<>0)');
    MyQuery.SQL.Add('or (WWIP<>0) or (VWIP<>0) or (FWIP<>0))');}
    MyQuery.SQL.Add('order by vm.warptype,vm.warpcol,vm.weft1col,vm.weft1stru,vm.weft1twist');
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
      PrintLine(Items);   { Print the line }
      { Force printjob to begin a new page if printed output has exceeded the }
      { Page height }
      if AmountPrinted + LineHeight > Printer.PageHeight then
      begin
        AmountPrinted := 0;         { Reset to zero }
        if not Printer.Aborted then
          Printer.NewPage;          { Force page eject }
        PrintHeader;                { Print the header again }
        PrintPlanRHSColumnNames;           { Print the column names again }
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

{---------end plan print}

procedure TProductMakeForm.PrintAllBtnClick(Sender: TObject);
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
        ParamQueryMakeDate.Value);
      HeaderDescr:='Spinning Production Planning as at '+DateHeading;
      PrintPlanLHS;
      {PrintPlanRHS;}
      ProductMake.First;
    end
    else {if P is not entered print the tracking report}
    begin
      DateHeading:=FormatDateTime('dddd, mmmm d, yyyy hh:mm AM/PM',
        ParamQueryMakeDate.Value);
      HeaderDescr:='Spinning Production Tracking as at '+DateHeading;
      PrintTrackLHS;
      PrintTrackRHS;
      ProductMake.First;
    end;
  end;
end;

procedure TProductMakeForm.FormResize(Sender: TObject);
begin
  ProductMakeGrid.Align:=alNone;
  ProductMakeGrid.Height:=ProductMakeForm.Height-100;
  ProductMakeGrid.Align:=alBottom;
end;

procedure TProductMakeForm.ProductMakeGridDblClick(Sender: TObject);
{var
  MsgStr:string[30];}
begin
{  MsgStr:='Row: '+ProductMakeVBCol.AsString+
    '; Col: '+ProductMakeGrid.SelectedField.DisplayLabel;
  ShowMessage(MsgStr);}
end;

end.
