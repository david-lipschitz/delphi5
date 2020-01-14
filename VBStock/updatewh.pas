unit updatewh;
//added onorder column to data warehouse: DL170501


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Buttons, StdCtrls, ComCtrls, ODDBImporter;

type
  TfrmUpdateWH = class(TForm)
    btnUpdateFWSales: TButton;
    btnClose: TBitBtn;
    qryGetVTPeriods: TQuery;
    qryInsertSalesPass1: TQuery;
    qryGetVTPeriodsYEARNO: TSmallintField;
    qryGetVTPeriodsPERIODNO: TSmallintField;
    qryGetVTPeriodsFROMDATE: TDateTimeField;
    qryGetVTPeriodsTODATE: TDateTimeField;
    StatusBar: TStatusBar;
    btnImportColourSelection: TButton;
    odiImporter: TODDBImporter;
    qryInsertColourSelection: TQuery;
    btnCreate: TButton;
    Memo1: TMemo;
    qryDeleteAST: TQuery;
    qryInsertAST89: TQuery;
    qryInsertAST127: TQuery;
    qryInsertAST2070: TQuery;
    qryUpdateASTZeros: TQuery;
    qryUpdateSP: TQuery;
    qryUpdateCP: TQuery;
    qryCalcValues: TQuery;
    qryGetFWm: TQuery;
    qryGetAveSalesByFW: TQuery;
    qryGetAveSalesByFWVBSTRU: TStringField;
    qryGetAveSalesByFWVBCOL: TStringField;
    qryGetAveSalesByFWVBFIN: TStringField;
    qryGetAveSalesByFWTOTALFW: TIntegerField;
    btnTop60ByNetLengthFw: TButton;
    qryResetTop60Flag: TQuery;
    qryUpdateTop60Flag: TQuery;
    qryGetAveSalesByFWVBTYPE: TStringField;
    qryUpdateOverseas: TQuery;
    btnUpdateOverseas: TButton;
    btnUpdateWHSalesPerCust: TButton;
    Label1: TLabel;
    edtStartingYear: TEdit;
    qryInsertWHSalesPerCust: TQuery;
    btnManuSold: TButton;
    Label2: TLabel;
    Label3: TLabel;
    edtManuYear: TEdit;
    edtManuMonth: TEdit;
    qryQuery: TQuery;
    qryInsertClientSalesWH: TQuery;
    qryGetVTPeriodsYYYYMM: TIntegerField;
    btnWHSalesPerCustomer: TButton;
    edtFromYYYYMM: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUpdateFWSalesClick(Sender: TObject);
    procedure btnImportColourSelectionClick(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure btnTop60ByNetLengthFwClick(Sender: TObject);
    procedure btnUpdateOverseasClick(Sender: TObject);
    procedure btnUpdateWHSalesPerCustClick(Sender: TObject);
    procedure btnManuSoldClick(Sender: TObject);
    procedure btnWHSalesPerCustomerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdateWH: TfrmUpdateWH;

implementation

uses Vbmain;

{$R *.DFM}

procedure TfrmUpdateWH.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUpdateWH.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryGetVTPeriods.Close;
  Release;
end;

procedure TfrmUpdateWH.btnUpdateFWSalesClick(Sender: TObject);
begin
  //written DL200800
  qryGetVTPeriods.Close;
  qryGetVTPeriods.ParamByName('YYYYMM').AsInteger:=strtoint(edtFromYYYYMM.Text); //added DL040701
  qryGetVTPeriods.Open;
  qryGetVTPeriods.First;
  while not qryGetVTPeriods.EOF do
  begin
    StatusBar.Panels[0].Text:='Calculating Year,Period: '+
      qryGetVTPeriodsYEARNO.AsString+', '+qryGetVTPeriodsPERIODNO.AsString;
    Application.ProcessMessages;
    //do all until before aug 2000
    if (qryGetVTPeriodsYEARNO.AsInteger=2000) and (qryGetVTPeriodsPERIODNO.AsInteger=8) then
      break;
    MainForm.Database.StartTransaction;
    qryInsertSalesPass1.Close;
    qryInsertSalesPass1.ParamByName('YearNo').AsInteger:=qryGetVTPeriodsYEARNO.AsInteger;
    qryInsertSalesPass1.ParamByName('PeriodNo').AsInteger:=qryGetVTPeriodsPERIODNO.AsInteger;
    //qryInsertSalesPass1.ParamByName('FromDate').AsDateTime:=qryGetVTPeriodsFROMDATE.AsDateTime;
    //qryInsertSalesPass1.ParamByName('ToDate').AsDateTime:=qryGetVTPeriodsTODATE.AsDateTime;
    qryInsertSalesPass1.ExecSQL;
    MainForm.Database.Commit;
    qryGetVTPeriods.Next;
  end;
  StatusBar.Panels[0].Text:='Complete';
  Application.ProcessMessages;
end;

procedure TfrmUpdateWH.btnImportColourSelectionClick(Sender: TObject);
  procedure InsertRec(VBStru,VBCol,VBFin:string;VBWidth:integer;CustTag:string;
    CustRef:string);
  begin
    if CustTag<>'' then  //CustTag represents the field's contents
    begin
      MainForm.Database.StartTransaction;
      qryInsertColourSelection.Close;
      qryInsertColourSelection.ParamByName('VBStru').AsString:=VBStru;
      qryInsertColourSelection.ParamByName('VBCol').AsString:=VBCol;
      qryInsertColourSelection.ParamByName('VBFin').AsString:=VBFin;
      qryInsertColourSelection.ParamByName('VBWidth').AsInteger:=VBWidth;
      qryInsertColourSelection.ParamByName('CustRef').AsString:=CustRef;
      qryInsertColourSelection.ExecSQL;
      MainForm.Database.Commit;
    end;
  end;
begin
//xx currently disabled: fix odiimporter options before enabling
  //import the colour selection criteria
//VBStru,VBCol,VBFin,VBWidth,Stock,AveSales,StockDays,StockPrice,Value,AveValMnt,Top60,HDCHUK,HDDHUK,HBNHUK,ARENUK,FBNHUK,FFRLDM,CMKRBE,LHCAUS,HDFLUS,AVSYAU,CMPAMA,
//A,248,VB,127,,,,,,,,,,,,,,,,,AVBC,Cpt Mnf Mau,1
//A,378,VB,127,,,,,,,,,,,,,,,,,,Cpt Mnf Mau,1
  odiImporter.Open;
  odiImporter.First;
  while not odiImporter.EOF do
  begin
    if odiImporter.RecValid then
    begin
      InsertRec(
        odiImporter.FieldByName('VBStru').AsString,
        odiImporter.FieldByName('VBCol').AsString,
        odiImporter.FieldByName('VBFin').AsString,
        odiImporter.FieldByName('VBWidth').AsInteger,
        odiImporter.FieldByName('HDCHUK').AsString,'HDCHUK');
      InsertRec(
        odiImporter.FieldByName('VBStru').AsString,
        odiImporter.FieldByName('VBCol').AsString,
        odiImporter.FieldByName('VBFin').AsString,
        odiImporter.FieldByName('VBWidth').AsInteger,
        odiImporter.FieldByName('HDDHUK').AsString,'HDDHUK');
      InsertRec(
        odiImporter.FieldByName('VBStru').AsString,
        odiImporter.FieldByName('VBCol').AsString,
        odiImporter.FieldByName('VBFin').AsString,
        odiImporter.FieldByName('VBWidth').AsInteger,
        odiImporter.FieldByName('HBNHUK').AsString,'HBNHUK');
      InsertRec(
        odiImporter.FieldByName('VBStru').AsString,
        odiImporter.FieldByName('VBCol').AsString,
        odiImporter.FieldByName('VBFin').AsString,
        odiImporter.FieldByName('VBWidth').AsInteger,
        odiImporter.FieldByName('ARENUK').AsString,'ARENUK');
      InsertRec(
        odiImporter.FieldByName('VBStru').AsString,
        odiImporter.FieldByName('VBCol').AsString,
        odiImporter.FieldByName('VBFin').AsString,
        odiImporter.FieldByName('VBWidth').AsInteger,
        odiImporter.FieldByName('FBNHUK').AsString,'FBNHUK');
      InsertRec(
        odiImporter.FieldByName('VBStru').AsString,
        odiImporter.FieldByName('VBCol').AsString,
        odiImporter.FieldByName('VBFin').AsString,
        odiImporter.FieldByName('VBWidth').AsInteger,
        odiImporter.FieldByName('FFRLDM').AsString,'FFRLDM');
      InsertRec(
        odiImporter.FieldByName('VBStru').AsString,
        odiImporter.FieldByName('VBCol').AsString,
        odiImporter.FieldByName('VBFin').AsString,
        odiImporter.FieldByName('VBWidth').AsInteger,
        odiImporter.FieldByName('CMKRBE').AsString,'CMKRBE');
      InsertRec(
        odiImporter.FieldByName('VBStru').AsString,
        odiImporter.FieldByName('VBCol').AsString,
        odiImporter.FieldByName('VBFin').AsString,
        odiImporter.FieldByName('VBWidth').AsInteger,
        odiImporter.FieldByName('LHCAUS').AsString,'LHCAUS');
      InsertRec(
        odiImporter.FieldByName('VBStru').AsString,
        odiImporter.FieldByName('VBCol').AsString,
        odiImporter.FieldByName('VBFin').AsString,
        odiImporter.FieldByName('VBWidth').AsInteger,
        odiImporter.FieldByName('HDFLUS').AsString,'HDFLUS');
      InsertRec(
        odiImporter.FieldByName('VBStru').AsString,
        odiImporter.FieldByName('VBCol').AsString,
        odiImporter.FieldByName('VBFin').AsString,
        odiImporter.FieldByName('VBWidth').AsInteger,
        odiImporter.FieldByName('AVSYAU').AsString,'AVSYAU');
      InsertRec(
        odiImporter.FieldByName('VBStru').AsString,
        odiImporter.FieldByName('VBCol').AsString,
        odiImporter.FieldByName('VBFin').AsString,
        odiImporter.FieldByName('VBWidth').AsInteger,
        odiImporter.FieldByName('CMPAMA').AsString,'CMPAMA');
    end;
    odiImporter.Next;
  end;
end;

procedure TfrmUpdateWH.btnCreateClick(Sender: TObject);
begin
  MainForm.Database.StartTransaction;
  StatusBar.Panels[0].Text:='Initialising';
  Application.ProcessMessages;
  qryDeleteAST.ExecSQL;
  StatusBar.Panels[0].Text:='Inserting 89s';
  Application.ProcessMessages;
  qryInsertAST89.ExecSQL;
  StatusBar.Panels[0].Text:='Inserting 127s';
  Application.ProcessMessages;
  qryInsertAST127.ExecSQL;
  StatusBar.Panels[0].Text:='Inserting 127s';
  Application.ProcessMessages;
  qryInsertAST2070.ExecSQL;
  StatusBar.Panels[0].Text:='Updating Zeros';
  Application.ProcessMessages;
  qryUpdateASTZeros.ExecSQL;
  MainForm.Database.Commit;

  MainForm.Database.StartTransaction;
  StatusBar.Panels[0].Text:='Updating Stock Prices (correlated subquery)';
  Application.ProcessMessages;
  qryUpdateCP.Close;
  qryUpdateCP.ParamByName('CurrentDate').AsDateTime:=date;
  qryUpdateCP.ExecSQL;
  StatusBar.Panels[0].Text:='Updating Contract Selling Prices (correlated subquery)';
  Application.ProcessMessages;
  qryUpdateSP.Close;
  qryUpdateSP.ParamByName('CurrentDate').AsDateTime:=date;
  qryUpdateSP.ExecSQL;
  StatusBar.Panels[0].Text:='Calculating Values';
  Application.ProcessMessages;
  qryCalcValues.ExecSQL;
  StatusBar.Panels[0].Text:='Updating FW metres (correlated subquery)';
  Application.ProcessMessages;
  qryGetFWm.ExecSQL;
  MainForm.Database.Commit;

  StatusBar.Panels[0].Text:='Ready';
  Application.ProcessMessages;
end;

procedure TfrmUpdateWH.btnTop60ByNetLengthFwClick(Sender: TObject);
var
  ix:integer;
begin
  ix:=1;
  qryGetAveSalesByFW.Close;
  qryGetAveSalesByFW.Open;
  qryGetAveSalesByFW.First;
  while not qryGetAveSalesByFW.EOF do
  begin
    if ix=1 then
      qryResetTop60Flag.ExecSQL;
    //set the top60 flag where required
    MainForm.Database.StartTransaction;
    StatusBar.Panels[0].Text:='Updating '+qryGetAveSalesByFWVBTYPE.AsString;
    Application.ProcessMessages;
    qryUpdateTop60Flag.Close;
    qryUpdateTop60Flag.ParamByName('VBStru').AsString:=qryGetAveSalesByFWVBSTRU.AsString;
    qryUpdateTop60Flag.ParamByName('VBCol').AsString:=qryGetAveSalesByFWVBCOL.AsString;
    qryUpdateTop60Flag.ParamByName('VBFin').AsString:=qryGetAveSalesByFWVBFIN.AsString;
    qryUpdateTop60Flag.ExecSQL;
    MainForm.Database.Commit;
    ix:=ix+1;
    if ix=61 then
      break;
    qryGetAveSalesByFW.Next;
  end;
  StatusBar.Panels[0].Text:='Ready';
  Application.ProcessMessages;
end;

procedure TfrmUpdateWH.btnUpdateOverseasClick(Sender: TObject);
const
  OverseasClients: array[1..11] of string =
    (
      'HDCHUK',
      'HDDHUK',
      'HBNHUK',
      'ARENUK',
      'FBNHUK',
      'FFRLDM',
      'CMKRBE',
      'LHCAUS',
      'HDFLUS',
      'AVSYAU',
      'CMPAMA'
    );
var
  ix:integer;
begin
  for ix:=1 to 11 do
  begin
    MainForm.Database.StartTransaction;
    StatusBar.Panels[0].Text:='Updating '+OverseasClients[ix];
    qryUpdateOverseas.Close;
    qryUpdateOverseas.SQL.Clear;
{update vbavesalestemp va
set va.hdchuk=
(select 'Y'
from vbcolourselection vc
where va.vbstru=vc.vbstru
and va.vbcol=vc.vbcol
and va.vbfin=vc.vbfin
and va.vbwidth=vc.vbwidth
and vc.custref='HDCHUK'
)}
    qryUpdateOverseas.SQL.Add('update vbavesalestemp va');
    qryUpdateOverseas.SQL.Add('set va.'+OverseasClients[ix]+'=');  //set va.hdchuk=
    qryUpdateOverseas.SQL.Add('(select ''Y''');
    qryUpdateOverseas.SQL.Add('from vbcolourselection vc');
    qryUpdateOverseas.SQL.Add('where va.vbstru=vc.vbstru');
    qryUpdateOverseas.SQL.Add('and va.vbcol=vc.vbcol');
    qryUpdateOverseas.SQL.Add('and va.vbfin=vc.vbfin');
    qryUpdateOverseas.SQL.Add('and va.vbwidth=vc.vbwidth');
    qryUpdateOverseas.SQL.Add('and vc.custref='''+OverseasClients[ix]+''''); //and vc.custref='HDCHUK'
    qryUpdateOverseas.SQL.Add(')');
    qryUpdateOverseas.ExecSQL;
    MainForm.Database.Commit;
  end;
  StatusBar.Panels[0].Text:='Ready';
  qryUpdateOverseas.Close;
end;

procedure TfrmUpdateWH.btnUpdateWHSalesPerCustClick(Sender: TObject);
begin
  if edtStartingYear.Text='' then
    raise Exception.Create('Please enter the starting year for the analysis');
  StatusBar.Panels[0].Text:='Please Wait: Updating WH Sales Per Customer';
  Application.ProcessMessages;
  qryInsertWHSalesPerCust.Close;
  qryInsertWHSalesPerCust.ParamByName('YearNo').AsInteger:=
    strtoint(edtStartingYear.Text);
  MainForm.Database.StartTransaction;
  qryInsertWHSalesPerCust.ExecSQL;
  MainForm.Database.Commit;
  StatusBar.Panels[0].Text:='Ready';
  Application.ProcessMessages;
end;

procedure TfrmUpdateWH.btnManuSoldClick(Sender: TObject);
begin
  if (edtManuYear.Text='') or (edtManuMonth.Text='') then
    raise Exception.Create('Please enter the Year and Month');

  StatusBar.Panels[0].Text:='Manu : When Sold: Initialising';
  Application.ProcessMessages;
  qryQuery.Close;
  qryQuery.SQL.Clear;
  qryQuery.SQL.Add('delete from whmanuboxes');
  MainForm.Database.StartTransaction;
  qryQuery.ExecSQL;
  MainForm.Database.Commit;

  StatusBar.Panels[0].Text:='Manu : When Sold: Fetching Data';
  Application.ProcessMessages;
  qryQuery.Close;
  qryQuery.SQL.Clear;
  qryQuery.SQL.Add('insert into whmanuboxes');
  qryQuery.SQL.Add('(manuyear,manumonth,vbstru,vbcol,vbfin,');
  qryQuery.SQL.Add('  netlength,salesdate)');
  qryQuery.SQL.Add('select wk.yearno,wk.monthno,vr.vbstru,vr.vbcol,vr.vbfin,');
  qryQuery.SQL.Add('  sum(vr.netlength/vw.strips),');
  qryQuery.SQL.Add('  vr.despdate');
  qryQuery.SQL.Add('from vbrcpt vr, wkno wk, vbwidth vw');
  qryQuery.SQL.Add('where vr.datemanu between wk.fromdate and wk.todate');
  qryQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
  qryQuery.SQL.Add('and wk.yearno='+edtManuYear.Text);
  qryQuery.SQL.Add('and wk.monthno='+edtManuMonth.Text);
  qryQuery.SQL.Add('group by wk.yearno,wk.monthno,vr.vbstru,vr.vbcol,vr.vbfin,');
  qryQuery.SQL.Add('  vr.despdate');
  MainForm.Database.StartTransaction;
  qryQuery.ExecSQL;
  MainForm.Database.Commit;

  StatusBar.Panels[0].Text:='Manu : When Sold: Fetching Year';
  Application.ProcessMessages;
  qryQuery.Close;
  qryQuery.SQL.Clear;
  qryQuery.SQL.Add('update whmanuboxes wh');
  qryQuery.SQL.Add('set wh.salesyear');
  qryQuery.SQL.Add('=');
  qryQuery.SQL.Add('(select wk.yearno');
  qryQuery.SQL.Add('from wkno wk');
  qryQuery.SQL.Add('where wh.salesdate between wk.fromdate and wk.todate)');
  MainForm.Database.StartTransaction;
  qryQuery.ExecSQL;
  MainForm.Database.Commit;

  StatusBar.Panels[0].Text:='Manu : When Sold: Fetching Month';
  Application.ProcessMessages;
  qryQuery.Close;
  qryQuery.SQL.Clear;
  qryQuery.SQL.Add('update whmanuboxes wh');
  qryQuery.SQL.Add('set wh.salesmonth');
  qryQuery.SQL.Add('=');
  qryQuery.SQL.Add('(select wk.monthno');
  qryQuery.SQL.Add('from wkno wk');
  qryQuery.SQL.Add('where wh.salesdate between wk.fromdate and wk.todate)');
  MainForm.Database.StartTransaction;
  qryQuery.ExecSQL;
  MainForm.Database.Commit;
  qryQuery.Close;

  StatusBar.Panels[0].Text:='Ready';
  Application.ProcessMessages;
end;

procedure TfrmUpdateWH.btnWHSalesPerCustomerClick(Sender: TObject);
begin
  //written DL220501
  //delete query added DL040701
  StatusBar.Panels[0].Text:='Deleting Data >= '+edtFromYYYYMM.Text;
  Application.ProcessMessages;
  qryQuery.Close;
  qryQuery.SQL.Clear;
  qryQuery.SQL.Add('delete from whsalespercustomerfw');
  qryQuery.SQL.Add('where yyyymm>='+edtFromYYYYMM.Text);
  MainForm.Database.StartTransaction;
  try
    qryQuery.ExecSQL;
    MainForm.Database.Commit;
  except
    MainForm.Database.Rollback;
    ShowMessage('Error in delete operation');
    StatusBar.Panels[0].Text:='Ready';
    Application.ProcessMessages;
    Exit;
  end;
  qryGetVTPeriods.Close;
  qryGetVTPeriods.ParamByName('YYYYMM').AsInteger:=strtoint(edtFromYYYYMM.Text); //added DL040701
  qryGetVTPeriods.Open;
  qryGetVTPeriods.First;
  while not qryGetVTPeriods.EOF do
  begin
    StatusBar.Panels[0].Text:='Inserting Year,Period: '+
      qryGetVTPeriodsYEARNO.AsString+', '+qryGetVTPeriodsPERIODNO.AsString;
    Application.ProcessMessages;
    //do all until before aug 2000
    //if (qryGetVTPeriodsYEARNO.AsInteger=2000) and (qryGetVTPeriodsPERIODNO.AsInteger=8) then
    //  break;
    //qryInsertClientSalesWH.Close;
    //qryInsertClientSalesWH.ParamByName('FromDate').AsDateTime:=qryGetVTPeriodsFROMDATE.AsDateTime;
    //qryInsertClientSalesWH.ParamByName('ToDate').AsDateTime:=qryGetVTPeriodsTODATE.AsDateTime;
    //qryInsertClientSalesWH.ParamByName('YYYYMM').AsInteger:=qryGetVTPeriodsYYYYMM.AsInteger;
    //qryInsertSalesPass1.ParamByName('FromDate').AsDateTime:=qryGetVTPeriodsFROMDATE.AsDateTime;
    //qryInsertSalesPass1.ParamByName('ToDate').AsDateTime:=qryGetVTPeriodsTODATE.AsDateTime;
    qryQuery.Close;
    qryQuery.SQL.Clear;
    qryQuery.SQL.Add('insert into whsalespercustomerfw');
    qryQuery.SQL.Add('(custref,yyyymm,vbstru,vbcol,vbfin,netlength,pcsnetlength)');
    qryQuery.SQL.Add('select vh.custref,'+qryGetVTPeriodsYYYYMM.AsString+',');
    qryQuery.SQL.Add('  vr.vbstru,vr.vbcol,vr.vbfin,');
    qryQuery.SQL.Add('  cast(sum(vr.netlength/vw.strips)*100 as integer)/100,');
    qryQuery.SQL.Add('  cast(sum(vr.netlength/vw.strips/vs.pcefinlength)*100 as integer)/100');
    qryQuery.SQL.Add('from vbrcpt vr,supplier su,vbdesphdr vh,vbwidth vw,vbstru vs');
    qryQuery.SQL.Add('where vr.qlty=''''');
    qryQuery.SQL.Add('and vr.despno=vh.despno');
    qryQuery.SQL.Add('and vh.despsent=''Y''');
    qryQuery.SQL.Add('and vh.custref=su.supref');
    qryQuery.SQL.Add('and su.saleclient=''Y''');
    qryQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
    qryQuery.SQL.Add('and vr.vbstru=vs.vbstru');
    qryQuery.SQL.Add('and vr.despdate between '''+
      formatdatetime('dd-mmm-yyyy',qryGetVTPeriodsFROMDATE.AsDateTime)+
      ''' and '''+
      formatdatetime('dd-mmm-yyyy',qryGetVTPeriodsTODATE.AsDateTime)+
      '''');
    qryQuery.SQL.Add('and ((vr.metricwidth=89) or (vr.metricwidth=127) or (vr.metricwidth=2070) or (vr.metricwidth=2100) or (vr.metricwidth=1850))'); //DL030215 - DL031217
    qryQuery.SQL.Add('group by vh.custref,');
    qryQuery.SQL.Add('  vr.vbstru,vr.vbcol,vr.vbfin');
    MainForm.Database.StartTransaction;
    try
      qryQuery.ExecSQL;
      MainForm.Database.Commit;
    except
      MainForm.Database.Rollback;
    end;
    qryGetVTPeriods.Next;
  end;
  StatusBar.Panels[0].Text:='Complete';
  Application.ProcessMessages;
end;

end.
