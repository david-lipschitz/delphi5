unit audit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, Grids, DBGrids, ExtCtrls, ComCtrls;

type
  TAuditForm = class(TForm)
    VTLog: TTable;
    VTLogREF: TIntegerField;
    VTLogDATEENT: TDateTimeField;
    VTLogUSERENT: TStringField;
    VTLogPROGRAMREF: TStringField;
    VTLogDESCR: TStringField;
    VTLogTABLEREF: TStringField;
    VTLogSource: TDataSource;
    VTLogCHECKED: TStringField;
    CheckYnQuery: TQuery;
    CheckYnQueryYNTYPE: TStringField;
    CheckYnQueryEXTPRODREF: TStringField;
    SPVTLogRef: TStoredProc;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    edtDatabaseName: TEdit;
    btnAudit: TButton;
    CloseBitBtn: TBitBtn;
    CheckRMQuery: TQuery;
    CheckWIPQuery: TQuery;
    CheckRMQueryPRODREF: TStringField;
    CheckWIPQueryACCNAME: TStringField;
    SPTxnDetSummary: TStoredProc;
    CheckVBRcptQuery: TQuery;
    CheckVBRcptQueryDESPNO: TIntegerField;
    CheckVBRcptQueryDESPDATE: TDateTimeField;
    CheckVBRcptQueryDESPDATE_1: TDateTimeField;
    CheckVBRcptQueryDESPSENT: TStringField;
    UnsentYNQuery: TQuery;
    UnsentVBQuery: TQuery;
    UnsentVBQueryDESPNO: TIntegerField;
    UnsentYNQueryDESPNO: TIntegerField;
    YnLessZeroQuery: TQuery;
    YnBalVT1Query: TQuery;
    FixYnZeroQuery: TQuery;
    YnBalVT2Query: TQuery;
    YnBalVT1QueryYNSTRU: TStringField;
    YnBalVT1QueryYNTWIST: TStringField;
    YnBalVT1QueryYNCOL: TStringField;
    YnBalVT2QueryYNSTRU: TStringField;
    YnBalVT2QueryYNTWIST: TStringField;
    YnBalVT2QueryYNCOL: TStringField;
    YnBalVT2QueryINSTOCK: TFloatField;
    UnsentVBQueryDESPDATE: TDateTimeField;
    UnsentYNQueryDESPDATE: TDateTimeField;
    YnBalVT1QueryYNTYPE: TStringField;
    YnBalVT2QueryYNTYPE: TStringField;
    FixYarnTypeQuery: TQuery;
    YnBalVT2QuerySUMQTY: TFloatField;
    YnBalVT1QuerySUMQTY: TFloatField;
    YnBalVT1QueryINSTOCK: TFloatField;
    StatusBar1: TStatusBar;
    FindWIPBalancesQuery: TQuery;
    FixWIPBalancesQuery: TQuery;
    qryUpdateRMtoRMP: TQuery;
    RMBalVT1Query: TQuery;
    FixRawMatQuery: TQuery;
    RMBalVT1QueryPRODREF: TStringField;
    RMBalVT1QueryDESCR: TStringField;
    RMBalVT1QueryPRODSTOCK: TFloatField;
    RMBalVT1QueryTXNDETSTOCK: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure btnAuditClick(Sender: TObject);
  private
    { Private declarations }
    procedure WriteToLog(const ProgRef,TableRef,Descr:string);
  public
    { Public declarations }
  end;

var
  AuditForm: TAuditForm;

implementation

{$R *.DFM}

uses Main;

procedure TAuditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VTLog.Close;
  AuditForm.Release;
end;

procedure TAuditForm.FormShow(Sender: TObject);
begin
  EdtDatabaseName.ReadOnly:=false;
  EdtDatabaseName.Text:=MainForm.DatabaseAlias.Text;
  EdtDatabaseName.ReadOnly:=true;
  VTLog.Open;
end;

procedure TAuditForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TAuditForm.WriteToLog(const ProgRef,TableRef,Descr:string);
var
  RefNo:integer;
begin
  MainForm.Database.StartTransaction;
  SPVTLogRef.ExecProc;
  RefNo:=SPVTLogRef.ParamByName('Code').AsInteger;
  VTLog.Insert;
  VTLog.FieldByName('Ref').AsInteger:=RefNo;
  VTLog.FieldByName('ProgramRef').AsString:=ProgRef;
  VTLog.FieldByName('TableRef').AsString:=TableRef;
  VTLog.FieldByName('Descr').AsString:=Descr;
  VTLog.Post;
  MainForm.Database.Commit;
end;

procedure TAuditForm.btnAuditClick(Sender: TObject);
var
  TempStr:string;
begin
  //DL050519 removed balance checks as not required anymore
  StatusBar1.Panels.Items[0].Text:='Checking and Fixing TxnDetSummary';
  Application.ProcessMessages;
  WriteToLog('Audit','TxnDetSummary','');
  MainForm.Database.StartTransaction;
  SPTxnDetSummary.ExecProc;
  MainForm.Database.Commit;

  StatusBar1.Panels.Items[0].Text:='Fixing Close to Zero Balances';
  Application.ProcessMessages;
  MainForm.Database.StartTransaction;
  FixYnZeroQuery.Prepare;
  FixYnZeroQuery.ExecSQL;
  MainForm.Database.Commit;

  StatusBar1.Panels.Items[0].Text:='Checking Raw Mat Balances: Added DL030403';
  Application.ProcessMessages;
  WriteToLog('Audit','RawMat Balances','Start:RMRef;Actual;Balance');
  RMBalVT1Query.Open; //VT1 and VT2
  RMBalVT1Query.First;
  while not RMBalVT1Query.EOF do
  begin
    TempStr:=RMBalVT1QueryPRODREF.AsString+';  '+
      FloatToStrF(RMBalVT1QueryTXNDETSTOCK.AsFloat,ffFixed,7,1)+';  '+
      FloatToStrF(RMBalVT1QueryPRODSTOCK.AsFloat,ffFixed,7,1);
    WriteToLog('Audit','RawMat Balances',TempStr);
    FixRawMatQuery.Close;
    MainForm.Database.StartTransaction;
    FixRawMatQuery.ParamByName('InStock').AsFloat:=RMBalVT1QueryTXNDETSTOCK.AsFloat;
    FixRawMatQuery.ParamByName('ProdRef').AsString:=RMBalVT1QueryPRODREF.AsString;
    FixRawMatQuery.ExecSQL;
    MainForm.Database.Commit;

    RMBalVT1Query.Next;
  end;
  RMBalVT1Query.Close;
  WriteToLog('Audit','RawMat Balances','End');

  if MainForm.DatabaseAlias.Text='VBStock6LinuxSQL' then //was VBStkSQL DL210901
  begin
    StatusBar1.Panels.Items[0].Text:='Checking VBRcpt Despatch Date=VBDespHdr DespDate';
    Application.ProcessMessages;
    WriteToLog('Audit','VBRcpt DespDate','Start:Despno;VRDespDate;VHDespDate');
    CheckVBRcptQuery.Open;
    CheckVBRcptQuery.First;
    while not CheckVBRcptQuery.EOF do
    begin
      TempStr:=CheckVBRcptQueryDESPNO.AsString+';'+
        datetostr(CheckVBRcptQueryDESPDATE.Value)+';'+
        datetostr(CheckVBRcptQueryDESPDATE_1.Value);
      WriteToLog('Audit','VBRcpt DespDate',TempStr);
      CheckVBRcptQuery.Next;
    end;
    CheckVBRcptQuery.Close;
    WriteToLog('Audit','VBRcpt DespDate','End');

    StatusBar1.Panels.Items[0].Text:='Checking Unsent VB Despatches';
    Application.ProcessMessages;
    WriteToLog('Audit','Unsent VB Despatches','Start');
    UnsentVBQuery.Open;
    UnsentVBQuery.First;
    while not UnsentVBQuery.EOF do
    begin
      TempStr:=UnsentVBQueryDESPNO.AsString+';'+datetostr(UnsentVBQueryDESPDate.Value);
      WriteToLog('Audit','Unsent VB Despatches',TempStr);
      UnsentVBQuery.Next;
    end;
    UnsentVBQuery.Close;
    WriteToLog('Audit','Unsent VB Despatches','End');

//    MainForm.Database.StartTransaction;
//    YnLessZeroQuery.Prepare;  //could be in both systems
//    YnLessZeroQuery.ExecSQL;  //could be in both systems
//    MainForm.Database.Commit;


    {StatusBar1.Panels.Items[0].Text:='Checking and Fixing Weft Yarn Balances';
    Application.ProcessMessages;
    WriteToLog('Audit','Yarn Balances','Start:Type;Actual;Balance');
    FixYarnTypeQuery.Prepare;
    YnBalVT2Query.Open;
    YnBalVT2Query.First;
    while not YnBalVT2Query.EOF do
    begin
      TempStr:=YnBalVT2QueryYnType.AsString+';  '+
        //YnBalVT2QueryYnStru.AsString+
        //YnBalVT2QueryYnTwist.AsString+
        //YnBalVT2QueryYnCol.AsString+';'+
        FloatToStrF(YnBalVT2QuerySUMQTY.AsFloat,ffFixed,7,1)+';  '+
        FloatToStrF(YnBalVT2QueryINSTOCK.AsFloat,ffFixed,7,1);
      WriteToLog('Audit','Yarn Balances',TempStr);
      FixYarnTypeQuery.Close;
      MainForm.Database.StartTransaction;
      FixYarnTypeQuery.ParamByName('InStock').AsFloat:=YnBalVT2QuerySUMQTY.AsFloat;
      FixYarnTypeQuery.ParamByName('YnStru').AsString:=YnBalVT2QueryYnStru.AsString;
      FixYarnTypeQuery.ParamByName('YnTwist').AsString:=YnBalVT2QueryYnTwist.AsString;
      FixYarnTypeQuery.ParamByName('YnCol').AsString:=YnBalVT2QueryYnCol.AsString;
      FixYarnTypeQuery.ExecSQL;
      MainForm.Database.Commit;

      YnBalVT2Query.Next;
    end;
    YnBalVT2Query.Close;
    WriteToLog('Audit','Yarn Balances','End');}

  end
  else
  begin
    //added qryUpdateRMtoRMP check on DL021199
    StatusBar1.Panels.Items[0].Text:='Checking RM to RMP';
    Application.ProcessMessages;
    WriteToLog('Audit','RM to RMP fix','Start');
    qryUpdateRMtoRMP.Close;
    qryUpdateRMtoRMP.ExecSQL;
    WriteToLog('Audit','RM to RMP fix','End');

    StatusBar1.Panels.Items[0].Text:='Checking Unsent Yarn Despatches';
    Application.ProcessMessages;
    WriteToLog('Audit','Unsent Yn Despatches','Start');
    UnsentYnQuery.Open;
    UnsentYnQuery.First;
    while not UnsentYnQuery.EOF do
    begin
      TempStr:=UnsentYnQueryDESPNO.AsString+';'+datetostr(UnsentYnQueryDESPDate.Value);
      WriteToLog('Audit','Unsent Yn Despatches',TempStr);
      UnsentYnQuery.Next;
    end;
    UnsentYnQuery.Close;
    WriteToLog('Audit','Unsent Yn Despatches','End');

    {StatusBar1.Panels.Items[0].Text:='Checking Yarn Balances';
    Application.ProcessMessages;
    WriteToLog('Audit','Yarn Balances','Start:Type;Actual;Balance');
    YnBalVT1Query.Open;
    YnBalVT1Query.First;
    while not YnBalVT1Query.EOF do
    begin
      TempStr:=YnBalVT1QueryYnStru.AsString+
        YnBalVT1QueryYnTwist.AsString+
        YnBalVT1QueryYnCol.AsString+';  '+
        FloatToStrF(YnBalVT1QuerySUMQTY.AsFloat,ffFixed,7,1)+';  '+
        FloatToStrF(YnBalVT1QueryINSTOCK.AsFloat,ffFixed,7,1);
      WriteToLog('Audit','Yarn Balances',TempStr);
      FixYarnTypeQuery.Close;
      MainForm.Database.StartTransaction;
      FixYarnTypeQuery.ParamByName('InStock').AsFloat:=YnBalVT1QuerySUMQTY.AsFloat;
      FixYarnTypeQuery.ParamByName('YnStru').AsString:=YnBalVT1QueryYnStru.AsString;
      FixYarnTypeQuery.ParamByName('YnTwist').AsString:=YnBalVT1QueryYnTwist.AsString;
      FixYarnTypeQuery.ParamByName('YnCol').AsString:=YnBalVT1QueryYnCol.AsString;
      FixYarnTypeQuery.ExecSQL;
      MainForm.Database.Commit;

      YnBalVT1Query.Next;
    end;
    YnBalVT1Query.Close;
    WriteToLog('Audit','Yarn Balances','End');}
  end;

  StatusBar1.Panels.Items[0].Text:='Checking Yarn Prices';
  Application.ProcessMessages;
  WriteToLog('Audit','Yn Prices','Start');
  CheckYnQuery.Prepare;
  CheckYnQuery.Params[0].Value:=date;
  CheckYnQuery.Open;
  CheckYnQuery.First;
  while not CheckYnQuery.EOF do
  begin
    TempStr:='No Price for '+CheckYnQueryYNTYPE.AsString;
    WriteToLog('Audit','Yn Prices',TempStr);
    CheckYnQuery.Next;
  end;
  CheckYnQuery.Close;
  WriteToLog('Audit','Yn Prices','End');

  StatusBar1.Panels.Items[0].Text:='Checking RM and RMP Prices';
  Application.ProcessMessages;
  WriteToLog('Audit','RM Prices','Start');
  CheckRMQuery.Prepare;
  CheckRMQuery.Params[0].Value:=date;
  CheckRMQuery.Open;
  CheckRMQuery.First;
  while not CheckRMQuery.EOF do
  begin
    TempStr:='No Price for '+CheckRMQueryProdRef.AsString;
    WriteToLog('Audit','RM Prices',TempStr);
    CheckRMQuery.Next;
  end;
  CheckRMQuery.Close;
  WriteToLog('Audit','RM Prices','End');

  StatusBar1.Panels.Items[0].Text:='Checking WIP Prices';
  Application.ProcessMessages;
  WriteToLog('Audit','WIP Prices','Start');
  CheckWIPQuery.Prepare;
  CheckWIPQuery.Params[0].Value:=date;
  CheckWIPQuery.Open;
  CheckWIPQuery.First;
  while not CheckWIPQuery.EOF do
  begin
    TempStr:='No Price for '+CheckWIPQueryAccName.AsString;
    WriteToLog('Audit','WIP Prices',TempStr);
    CheckWIPQuery.Next;
  end;
  CheckWIPQuery.Close;
  WriteToLog('Audit','WIP Prices','End');
  StatusBar1.Panels.Items[0].Text:='Ready';
  Application.ProcessMessages;
end;

end.
