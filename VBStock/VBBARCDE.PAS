unit Vbbarcde;
//all the 'IA' ITA, Inc. additions added DL041013

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, AdPort, StdCtrls, Buttons, DBTables, DB, ComCtrls, OoMisc;

type
  string1=string[1];
  string2=string[2];
  string4=string[4];
  string5=string[5];
  string6=string[6];
  string8=string[8];
  string9=string[9];
  string11=string[11]; //added DL250499
  string25=string[25]; //added DL260499
  string40=string[40];
  TVBBarCodeForm = class(TForm)
    UBIComPort2: TApdComPort;
    VBTestLabel: TButton;
    CloseBitBtn: TBitBtn;
    Button1: TButton;
    VBYarnRcpt: TTable;
    VBYarnRcptBOXNO: TIntegerField;
    VBYarnRcptLOTNO1: TSmallintField;
    VBYarnRcptLOTNO2: TSmallintField;
    VBYarnRcptYNSTRU: TStringField;
    VBYarnRcptYNTWIST: TStringField;
    VBYarnRcptYNCOL: TStringField;
    VBYarnRcptYNNET: TFloatField;
    VBYarnRcptDATERCVD: TDateTimeField;
    VBYarnRcptINITIALS: TStringField;
    VBYarnRcptYNQLTY: TStringField;
    VBYarnRcptRETURNED: TStringField;
    VBYarnRcptSTOCKAREA: TIntegerField;
    VBYarnRcptBATREF: TIntegerField;
    VBYarnRcptDATEENT: TDateTimeField;
    VBYarnRcptUSERENT: TStringField;
    VBYarnRcptDATEMOD: TDateTimeField;
    VBYarnRcptUSERMOD: TStringField;
    VBYarnRcptISSUEDTO: TStringField;
    VBYarnRcptISSUEDDATE: TDateTimeField;
    VBYarnIssued: TTable;
    VBYarnIssuedBOXNO: TIntegerField;
    VBYarnIssuedISSUEDTO: TStringField;
    VBYarnIssuedISSUEDDATE: TDateTimeField;
    VBYarnIssuedISSUEDBY: TStringField;
    VBYarnIssuedISSUEDQTY: TFloatField;
    VBYarnIssuedBATREF: TIntegerField;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Button2: TButton;
    DelHead: TTable;
    CtrlAcct: TTable;
    Product: TTable;
    TxnDet: TTable;
    DelHeadDELNO: TIntegerField;
    DelHeadEXPDELDATE: TDateTimeField;
    DelHeadSUPREF: TStringField;
    DelHeadDELNOTENO: TStringField;
    DelHeadAGENT: TStringField;
    DelHeadSUPORDNO: TStringField;
    DelHeadCONTREF: TStringField;
    DelHeadDELNOTEDATE: TDateTimeField;
    DelHeadPALLETSRCVD: TSmallintField;
    DelHeadCARTONSRCVD: TSmallintField;
    DelHeadQTYRCVD: TFloatField;
    DelHeadDELDATE: TDateTimeField;
    DelHeadRCVDBY: TStringField;
    DelHeadNARRATIVE: TStringField;
    DelHeadPRODREF: TStringField;
    DelHeadVTORDNO: TIntegerField;
    DelHeadDATEENT: TDateTimeField;
    DelHeadUSERENT: TStringField;
    DelHeadDATEMOD: TDateTimeField;
    DelHeadUSERMOD: TStringField;
    CtrlAcctACCNAME: TStringField;
    CtrlAcctDESCRIPTION: TStringField;
    CtrlAcctEXTACCNAME: TStringField;
    CtrlAcctQTY: TFloatField;
    ProductPRODREF: TStringField;
    ProductCATEGORY: TStringField;
    ProductDESCR: TStringField;
    ProductREORDER: TIntegerField;
    ProductWARNING: TIntegerField;
    ProductMERGELEVEL: TIntegerField;
    ProductUNITWEIGHT: TSmallintField;
    ProductMEASUNIT: TStringField;
    ProductRCVUNIT: TStringField;
    ProductFIXEDWEIGHT: TStringField;
    ProductONORDER: TFloatField;
    ProductINSTOCK: TFloatField;
    ProductLABELDESCR: TStringField;
    ProductBSCATEGORY: TStringField;
    ProductPURCHCATEGORY: TStringField;
    ProductCTRLACCT: TStringField;
    ProductEXTPRODREF: TStringField;
    TxnDetREF: TIntegerField;
    TxnDetTXNNO: TIntegerField;
    TxnDetTXNCODE: TStringField;
    TxnDetPRODTYPE: TStringField;
    TxnDetEXTPRODREF: TStringField;
    TxnDetQLTY: TStringField;
    TxnDetQTY: TFloatField;
    TxnDetTXNDATE: TDateTimeField;
    TxnDetORIGTXNCODE: TIntegerField;
    TxnDetDATEENT: TDateTimeField;
    TxnDetUSERENT: TStringField;
    SPGenTxnDetRef: TStoredProc;
    SPGenTxnDetTxnRef: TStoredProc;
    Button3: TButton;
    IssueDet: TTable;
    IssueDetISSUENO: TIntegerField;
    IssueDetDELNO: TIntegerField;
    IssueDetPALLETNO: TSmallintField;
    IssueDetBCBNO: TSmallintField;
    IssueDetDATEISSUED: TDateTimeField;
    IssueDetINITIALS: TStringField;
    IssueDetQTYISSUED: TFloatField;
    IssueDetISSUETO: TStringField;
    IssueDetBCBISSUED: TFloatField;
    IssueDetPRODREF: TStringField;
    IssueDetBATREF: TIntegerField;
    IssueDetDATEENT: TDateTimeField;
    IssueDetUSERENT: TStringField;
    Button4: TButton;
    Button5: TButton;
    WIPRcpt: TTable;
    WIPRcptREFNO: TIntegerField;
    WIPRcptPRODREF: TStringField;
    WIPRcptRCPTDATE: TDateTimeField;
    WIPRcptRCPTINITIALS: TStringField;
    WIPRcptNETWEIGHT: TFloatField;
    WIPRcptLOTNO1: TSmallintField;
    WIPRcptLOTNO2: TSmallintField;
    WIPRcptSHIFT: TStringField;
    WIPRcptDATEMANU: TDateTimeField;
    WIPRcptDATEISSUED: TDateTimeField;
    WIPRcptISSUEINITIALS: TStringField;
    WIPRcptISSUETO: TStringField;
    WIPRcptVALUERATING: TFloatField;
    WIPRcptVALUERATINGDATE: TDateTimeField;
    WIPRcptSTOCKAREA: TIntegerField;
    WIPRcptBATREF: TIntegerField;
    WIPRcptDATEENT: TDateTimeField;
    WIPRcptUSERENT: TStringField;
    WIPRcptDATEMOD: TDateTimeField;
    WIPRcptUSERMOD: TStringField;
    WIPRcptFACTORYNO: TIntegerField;
    Button6: TButton;
    Button7: TButton;
    VBYarnRcptQuery: TQuery;
    VBYarnRcptQueryYNSTRU: TStringField;
    VBYarnRcptQueryYNTWIST: TStringField;
    VBYarnRcptQueryYNCOL: TStringField;
    VBYarnRcptQueryDATERCVD: TDateTimeField;
    VBYarnRcptQueryBOXNO: TIntegerField;
    VBYarnRcptQueryDATEENT: TDateTimeField;
    VBYarnRcptQueryUSERENT: TStringField;
    VBYarnRcptQueryRETURNED: TStringField;
    VBYarnRcptQueryYNQLTY: TStringField;
    VBYarnRcptQueryYNNET: TFloatField;
    VBYarnRcptQueryYNTYPE: TStringField;
    VBYarnRcptQueryISSUEDTO: TStringField;
    VBYarnRcptQueryISSUEDDATE: TDateTimeField;
    VBYarnRcptQueryBATREF: TIntegerField;
    VBYarnRcptISSUEDBY: TStringField;
    VBYarnRcptQueryISSUEDBY: TStringField;
    ConvertStkMinBtn: TButton;
    VBMake: TTable;
    VBStockMin: TTable;
    VBMakeVBSTRU: TStringField;
    VBMakeVBCOL: TStringField;
    VBMakeMIN127: TIntegerField;
    VBMakeMIN89: TIntegerField;
    VBMakeMIN2070: TIntegerField;
    VBMakeSALE89: TFloatField;
    VBMakeSALE127: TFloatField;
    VBMakeSALE2070: TFloatField;
    VBStockMinVBSTRU: TStringField;
    VBStockMinVBCOL: TStringField;
    VBStockMinVBWIDTH: TSmallintField;
    VBStockMinSTKMIN: TIntegerField;
    MyQuery: TQuery;
    Button8: TButton;
    VBDespHdr: TTable;
    VBDespHdrDESPNO: TIntegerField;
    VBDespHdrDESPDATE: TDateTimeField;
    VBDespHdrDESPSENT: TStringField;
    Dailybalance: TButton;
    MyQuery1: TQuery;
    VBDailyBalance: TTable;
    VBDailyBalanceVBSTRU: TStringField;
    VBDailyBalanceVBCOL: TStringField;
    VBDailyBalanceVBWIDTH: TIntegerField;
    VBDailyBalanceBALANCEDATE: TDateTimeField;
    VBDailyBalanceAVESALES: TIntegerField;
    VBDailyBalanceNETLENGTH: TIntegerField;
    VBDailyBalanceVBFIN: TStringField;
    VBDailyAnalyseQuery: TQuery;
    VBDailyAnalyseQueryVBSTRU: TStringField;
    VBDailyAnalyseQueryVBCOL: TStringField;
    VBDailyAnalyseQueryVBFIN: TStringField;
    VBDailyAnalyseQueryVBWIDTH: TIntegerField;
    DMXComPort2: TApdComPort;
    procedure VBTestLabelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ConvertStkMinBtnClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure DailybalanceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FetchString;
    procedure UBISendString(SendString:string);
    procedure PrintUBI_VT(LabelDescr:string8;Qlty:string1; //labeldescr was string6 DL081001
      LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      MetricWidthDescr:string5;ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;NetLength:real;RollNo:integer;
      StyleDescr:string8;ColorDescr:string9;PartNo:string11;
      Heading:string25);
    procedure PrintUBI_HD(StyleDescr:string8;ColorDescr:string9;
      LabelDescr:string8; //labeldescr was string6 DL081001
      PartNo:string11;LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;RollNo:integer;
      LabelStru:string2);
    //printDMX and print_ and open and close procedures added DL191098
    procedure Print_VT(LabelDescr:string8;Qlty:string1;  //labeldescr was string6 DL081001
      LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      MetricWidthDescr:string5;ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;NetLength:real;RollNo:integer;
      StyleDescr:string8;ColorDescr:string9;PartNo:string11;
      Heading:string25);
    procedure Print_HD(StyleDescr:string8;ColorDescr:string9;
      LabelDescr:string8; //labeldescr was string6 DL081001
      PartNo:string11;LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;RollNo:integer;
      LabelStru:string2); //Added DL230899
    procedure PrintDMX_VT(LabelDescr:string8;Qlty:string1; //labeldescr was string6 DL081001
      LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      MetricWidthDescr:string5;ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;NetLength:real;RollNo:integer;
      StyleDescr,ColorDescr,PartNo,Heading:string25);
    procedure PrintDMX_HD(StyleDescr:string8;ColorDescr:string9;
      LabelDescr:string8; //labeldescr was string6 DL081001
      PartNo:string11;LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;RollNo:integer;
      LabelStru:string2);
    procedure PrintC4P_VT(LabelDescr:string8;Qlty:string1; //added DL031119
      LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      MetricWidthDescr:string5;ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;NetLength:real;RollNo:integer;
      StyleDescr,ColorDescr,PartNo,Heading:string25);
    procedure PrintC4P_HD(StyleDescr:string8;ColorDescr:string9; //added DL031119
      LabelDescr:string8;
      PartNo:string11;LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;RollNo:integer;
      LabelStru:string2);
    procedure OpenComPort2;
    procedure CloseComPort2;
    procedure PrintBoxLabel(const Line1,Line2,Line3,Line4,Line5,BarCode:string40);
  end;

var
  VBBarCodeForm: TVBBarCodeForm;

implementation

{$R *.DFM}

uses VBMain,VBUtils;

procedure TVBBarCodeForm.FetchString;
var
  Cx:char;
  ix:longint;
  sx:string;
begin
  {ix:=0;}
  sx:='';
  while UBIComPort2.CharReady do
  begin
    {inc(ix);}
    Cx := UBIComPort2.GetChar;
    sx:=sx+cx;
  end;
  {build in a delay}
  {ShowMessage(sx);}
  for ix:=1 to 100000 do; {!!!!!}
end;

procedure TVBBarCodeForm.UBISendString(SendString:string);
{var
  sx1:string;}
begin
  UBIComPort2.PutString(SendString);
  FetchString;
  {sx1:=SendString+'#13#10#13#10''Ok''#13#10';
  if sx<>sx1 then
    ShowMessage('Printer Error: '+sx1);}
end;

procedure TVBBarCodeForm.VBTestLabelClick(Sender: TObject);
const
  SOH = #1;
  STX = #2; {STX, ie Control B or ASCII char 2}
  CR = #13; {carriage return}
  LF = #10; {line feed=#10}
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  SendString:string;
begin
  SendString:='';
  SendString:='CLL'+CR;
  UBISendString(SendString);

  {draw the boxes}
  SendString:='FONT "SW030RSN.1"'+CR;
  UBISendString(SendString);

  {print the horizontal lines}
  SendString:='DIR 1'+CR; {horizontal to the right; 4 is up; use for lines}
  UBISendString(SendString);
  SendString:='PRPOS 16,46'+CR; {x,y} {46,46}
  UBISendString(SendString); {send and fetch}
  SendString:='PRLINE 568,3'+CR; {length,line weight}
  UBISendString(SendString);
  SendString:='PRPOS 16,174'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 16,238'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 16,302'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 16,398'+CR; {366 first bit}
  UBISendString(SendString);
  SendString:='PRLINE 400,3'+CR; {568}
  UBISendString(SendString);
  SendString:='PRPOS 416,366'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 168,3'+CR; {568}
  UBISendString(SendString);
  SendString:='PRPOS 416,430'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 168,3'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 16,494'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 16,558'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  {VBBarCodeForm.}UBISendString(SendString);

  {print the vertical lines}
  SendString:='DIR 4'+CR; {4 is up=vertical line}
  UBISendString(SendString);
  SendString:='PRPOS 16,46'+CR; {x,y} {46,46}
  UBISendString(SendString); {send and fetch}
  SendString:='PRLINE 514,3'+CR; {length,line weight}
  UBISendString(SendString);
  SendString:='PRPOS 148,174'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 64,3'+CR; {}
  UBISendString(SendString);
  SendString:='PRPOS 292,174'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 128,3'+CR; {192}
  UBISendString(SendString);
  SendString:='PRPOS 416,174'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 320,3'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 584,46'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 514,3'+CR;
  UBISendString(SendString);

  {print the headings}
  SendString:='DIR 1'+CR; {horizontal}
  UBISendString(SendString);
  SendString:='FONT "SW020BSN.1"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,378'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Color"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,474'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Style"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,540'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Country Of Origin: Republic of South Africa"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,218'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Width ('''')"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 156,218'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Gross (yds)"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 300,218'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Allowance"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,218'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Nett (yds)"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,282'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Date Manu."'+CR;
  UBISendString(SendString);
  {SendString:='PRPOS 156,282'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Gross (mtr)"'+CR;
  UBISendString(SendString);}
  SendString:='PRPOS 300,282'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Faults"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,282'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Strip #"'+CR;
  UBISendString(SendString);
  {SendString:='PRPOS 300,346'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Faults"'+CR;
  UBISendString(SendString);}
  SendString:='PRPOS 424,346'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Part #"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,412'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Carton #"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,474'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Lot #"'+CR;
  UBISendString(SendString);
  {print Republic of South Africa}
  SendString:='FONT "SW050RSN.1"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,498'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Hunter Douglas Test"'+CR;
  UBISendString(SendString);

  {print the data}
  SendString:='DIR 1'+CR; {horizontal}
  UBISendString(SendString);
  SendString:='FONT "SW080BSN.1"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,402'+CR; {382}
  UBISendString(SendString);
  SendString:='PRTXT "FRESCO"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,306'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "CHABLIS"'+CR;
  UBISendString(SendString);
  SendString:='FONT "SW050RSN.1"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,430'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "265001"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,366'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "1694"'+CR;
  UBISendString(SendString);
  {SendString:='PRPOS 24,302'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Jun 20, 1996"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 300,302'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "1"'+CR;
  UBISendString(SendString);}
  SendString:='PRPOS 424,302'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "94103"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,238'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Jun 20, 1996"'+CR;
  UBISendString(SendString);
  {SendString:='PRPOS 156,238'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "was m allowance"'+CR;
  UBISendString(SendString);}
  SendString:='PRPOS 300,238'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "1"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,238'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "1"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,174'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "3.5"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 156,174'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "164.0"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 300,174'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "1.0"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,174'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "163.0"'+CR;
  UBISendString(SendString);

  {print the barcode}
  {TempNetFloat:=int(strtofloat(ShowNet.Text)*10);
  TempNetInt:=trunc(TempNetFloat); {cast float to int}
  {TempLotNo:=VBRcptLotNo.AsInteger{-100000};
  {TempLotNoStr:=ZeroFill(TempLotNo,3);
  TempNetWidth:=ZeroFill(VBRcptMetricWidth.AsInteger,3);
  TempNet:=ZeroFill(TempNetInt,4);
  TempFaults:=ZeroFill(VBRcptFaults.AsInteger,2);}
  SendString:='PRPOS 40,152'+CR;
  UBISendString(SendString);
  SendString:='BARRATIO 3,1'+CR;
  UBISendString(SendString);
  SendString:='BARHEIGHT 20'+CR;
  UBISendString(SendString);
  SendString:='BARMAG 2'+CR;
  UBISendString(SendString);
  SendString:='BARTYPE "CODE39"'+CR;
  UBISendString(SendString);
  {SendString:='PRBAR "VTH100001089148002"'+CR;}
  SendString:='PRBAR "VTF265 265001"'+CR;
  UBISendString(SendString);

  SendString:='PRPOS 40,112'+CR;
  UBISendString(SendString);
  SendString:='BARRATIO 3,1'+CR;
  UBISendString(SendString);
  SendString:='BARHEIGHT 20'+CR;
  UBISendString(SendString);
  SendString:='BARMAG 2'+CR;
  UBISendString(SendString);
  SendString:='BARTYPE "CODE39"'+CR;
  UBISendString(SendString);
  SendString:='PRBAR "089149.001"'+CR;
  UBISendString(SendString);

  {use label 14 for strip (roll), label 15 for box}
  SendString:='PRPOS 40,60'+CR;
  UBISendString(SendString);
  SendString:='BARRATIO 3,1'+CR;
  UBISendString(SendString);
  SendString:='BARHEIGHT 20'+CR;
  UBISendString(SendString);
  SendString:='BARMAG 2'+CR;
  UBISendString(SendString);
  SendString:='BARTYPE "CODE39"'+CR;
  UBISendString(SendString);
  SendString:='PRBAR "15001694"'+CR;
  UBISendString(SendString);

  SendString:='PRINTFEED'+CR;
  UBISendString(SendString);
end;

procedure TVBBarCodeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
    UBIComPort2.Open:=false
  else if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
    DMXComPort2.Open:=false
  else //C4P: Internet EasyCoder C4P
    DMXComPort2.Open:=false;
  MainForm.VBParams.Close;
  VBBarCodeForm.Release;
end;

procedure TVBBarCodeForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBBarCodeForm.PrintUBI_VT(LabelDescr:string8;Qlty:string1; //labeldescr was string6 DL081001
      LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      MetricWidthDescr:string5;ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;NetLength:real;RollNo:integer;
      StyleDescr:string8;ColorDescr:string9;PartNo:string11;
      Heading:string25);
const
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  SendString:string;
  GrossYards,NetYards,AllowYards:real;
  YdsString:string;
{  TempNetFloat:real;
  TempNetInt,TempLotNo:longint;
  TempLotNoStr,TempNetWidth,TempNet,TempFaults:string;}
begin
  SendString:='';
  SendString:='CLL'+CR;
  VBBarCodeForm.UBISendString(SendString);

  {draw the boxes}
  SendString:='FONT "SW030RSN.1"'+CR;
  VBBarCodeForm.UBISendString(SendString);

  {test: write Hello Hello in the middle of the label}
  {SendString:='PRPOS 200,300'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "HELLO, HELLO!"'+CR;
  VBBarCodeForm.UBISendString(SendString);}

  {print the horizontal lines}
  SendString:='DIR 1'+CR; {horizontal to the right; 4 is up; use for lines}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,46'+CR; {x,y} {46,46}
  VBBarCodeForm.UBISendString(SendString); {send and fetch}
  SendString:='PRLINE 568,3'+CR; {length,line weight}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,238'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,302'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,366'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 416,428'+CR; //was ,430 DL250499
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 168,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,494'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,558'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,428'+CR; {366 first bit} //added DL250499 was,398
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='PRLINE 400,3'+CR; {568} //added DL250499
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='PRPOS 292,110'+CR; //added DL250499 416,110
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='PRLINE 290,3'+CR; //added DL250499 was 168, xx
  VBBarCodeForm.UBISendString(SendString); //added DL250499

  {print the vertical lines}
  SendString:='DIR 4'+CR; {4 is up=vertical line}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,46'+CR; {x,y} {46,46}
  VBBarCodeForm.UBISendString(SendString); {send and fetch}
  SendString:='PRLINE 514,3'+CR; {length,line weight}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 148,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 128,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 292,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 192,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 416,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 320,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 584,46'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 514,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 292,46'+CR; //added DL250499 xx
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='PRLINE 160,3'+CR; //added DL250499
  VBBarCodeForm.UBISendString(SendString); //added DL250499

  {print the headings}
  SendString:='DIR 1'+CR; {horizontal}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='FONT "SW020BSN.1"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,346'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Date Manu."'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,474'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Style"'+CR; //was product DL250499
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,410'+CR; //added DL250499 was ,378
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='PRTXT "Color"'+CR; //added DL250499
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='PRPOS 24,540'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Country Of Origin: Republic of South Africa"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,218'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Width ('''')"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 156,218'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Gross (yds)"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 300,218'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Allowance"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,218'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Nett (yds)"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,282'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Width (mm)"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 156,282'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Gross (mtr)"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 300,282'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Allowance"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,282'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Nett (mtr)"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 300,346'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Faults"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,346'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Strip #"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,410'+CR; //was ,412 DL250499
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Carton #"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,474'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Lot #"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 300,154'+CR; //added DL250499
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='PRTXT "Product"'+CR; //added DL250499
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='PRPOS 300,90'+CR; //added DL250499 was 424
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='PRTXT "Part #"'+CR; //added DL250499
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  {print Republic of South Africa, changed to VERTICAL REALITY DL060598}
  SendString:='FONT "SW050RSN.1"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,498'+CR;
  VBBarCodeForm.UBISendString(SendString);
  //SendString:='PRTXT "VERTICAL REALITY"'+CR; removed DL260499
  SendString:='PRTXT "'+Heading+'"'+CR; //added DL260499
  VBBarCodeForm.UBISendString(SendString);

  {print the data}
  SendString:='DIR 1'+CR; {horizontal}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='FONT "SW080BSN.1"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,414'+CR; //was ,382 DL250499
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+StyleDescr+' '+Qlty+'"'+CR;  //was labeldescr xx DL250499
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,350'+CR; //added DL250499
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='PRTXT "'+ColorDescr+'"'+CR; //added DL250499
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='FONT "SW050RSN.1"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,430'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(LotNo)+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,366'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(BoxNo)+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,302'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+
    FormatDateTime('mmm dd, yyyy', DateManu)+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 300,302'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(Faults)+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,302'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(StripNo)+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,238'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+MetricWidthDescr+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 156,238'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+floattostrf(GrossLength,ffFixed,5,1)+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 300,238'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+floattostrf(Allowance,ffFixed,5,1)+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,238'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+floattostrf(NetLength,ffFixed,5,1)+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+ImperialWidthDescr+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);

  //for IA round to whole numbers DL070601 - not in _VT.
  {if LabelStru='IA' then
  begin
    GrossYards:=round(int(GrossLength*mtrTOyds*10+0.5)/10);
    AllowYards:=round(int(Allowance*mtrToyds*10+0.5)/10);
    NetYards:=round(int((GrossYards-AllowYards)*10+0.5)/10);
  end
  else
  begin
    GrossYards:=int(GrossLength*mtrTOyds*10+0.5)/10;
    AllowYards:=int(Allowance*mtrToyds*10+0.5)/10;
    NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
  end;}
  GrossYards:=int(GrossLength*mtrTOyds*10+0.5)/10;
  AllowYards:=int(Allowance*mtrToyds*10+0.5)/10;
  NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;

  YdsString:=floattostrf(GrossYards,ffFixed,5,1);
  SendString:='PRPOS 156,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+YdsString+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  YdsString:=floattostrf(AllowYards,ffFixed,3,1);
  SendString:='PRPOS 300,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+YdsString+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  YdsString:=floattostrf(NetYards,ffFixed,5,1);
  SendString:='PRPOS 424,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+YdsString+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);

  SendString:='PRPOS 300,110'+CR; //added DL250499
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='PRTXT "'+LabelDescr+'"'+CR; //added DL250499
  VBBarCodeForm.UBISendString(SendString); //added DL250499

  SendString:='PRPOS 300,46'+CR; //added DL250499
  VBBarCodeForm.UBISendString(SendString); //added DL250499
  SendString:='PRTXT "'+PartNo+'"'+CR; //added DL250499
  VBBarCodeForm.UBISendString(SendString); //added DL250499

  {print the LabelDescr and Lot No barcode}
  {SendString:='PRBAR "VTH100100001089148002"'+CR;}
{  TempNetFloat:=int(VBRcptNetLength.Value*10);
  TempNetInt:=trunc(TempNetFloat);
  TempLotNo:=VBRcptLotNo.AsInteger;
  TempLotNoStr:=ZeroFill(TempLotNo,3);
  TempNetWidth:=ZeroFill(VBRcptMetricWidth.AsInteger,3);
  TempNet:=ZeroFill(TempNetInt,4);
  TempFaults:=ZeroFill(VBRcptFaults.AsInteger,2);}
  {SendString:='PRPOS 40,152'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARRATIO 3,1'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARHEIGHT 20'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARMAG 2'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARTYPE "CODE39"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRBAR "'+
    LabelDescr+TempLotNoStr+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);}

  {print tbe second line code}
  {SendString:='PRPOS 40,112'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARRATIO 3,1'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARHEIGHT 20'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARMAG 2'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARTYPE "CODE39"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRBAR "'+
    TempNetWidth+TempNet+TempFaults+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);}

  {use label 19 (was 14) for strip (roll), label 15 for box}
  SendString:='PRPOS 60,48'+CR; {40,52} //was 120,48 DL250499 xx
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARRATIO 3,1'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARHEIGHT 80'+CR; {was 20}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARMAG 2'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='MAG 1,1'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARTYPE "INT2OF5"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  {SendString:='PRBAR "14'+
    ZeroFill(VBRcptWarpNo.AsInteger,6)+
    ZeroFill(VBRcptPieceNo.AsInteger,2)+
    ZeroFill(VBRcptStripNo.AsInteger,2)+'"'+CR;}
  SendString:='BARFONT #2,"SW030RSN.1",5,1,1 ON'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRBAR "19'+
    ZeroFill(RollNo,6)+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);

  SendString:='PRINTFEED'+CR;
  VBBarCodeForm.UBISendString(SendString);
end;

procedure TVBBarCodeForm.PrintUBI_HD(StyleDescr:string8;
      ColorDescr:string9;LabelDescr:string8; //labeldescr was string6 DL081001
      PartNo:string11;LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;RollNo:integer;
      LabelStru:string2);
const
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  SendString:string;
  GrossYards,NetYards,AllowYards,NetMetres:real;
  YdsString:string;
  YdsDigits:integer; //added DL070601
{  TempNetFloat:real;
  TempNetInt,TempLotNo:longint;
  TempLotNoStr,TempNetWidth,TempNet,TempFaults:string;}
begin
  SendString:='';
  SendString:='CLL'+CR;
  VBBarCodeForm.UBISendString(SendString);

  {draw the boxes}
  SendString:='FONT "SW030RSN.1"'+CR;
  VBBarCodeForm.UBISendString(SendString);

  {print the horizontal lines}
  SendString:='DIR 1'+CR; {horizontal to the right; 4 is up; use for lines}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,46'+CR; {x,y} {46,46}
  VBBarCodeForm.UBISendString(SendString); {send and fetch}
  SendString:='PRLINE 568,3'+CR; {length,line weight}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,238'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,302'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,398'+CR; {366 first bit}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 400,3'+CR; {568}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 416,110'+CR; {added DL151096}
  UBISendString(SendString); {added DL151096}
  SendString:='PRLINE 168,3'+CR; {added DL151096}
  UBISendString(SendString); {added DL151096}
  SendString:='PRPOS 416,366'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 168,3'+CR; {568}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 416,430'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 168,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,494'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,558'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  VBBarCodeForm.UBISendString(SendString);

  {print the vertical lines}
  SendString:='DIR 4'+CR; {4 is up=vertical line}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 16,46'+CR; {x,y} {46,46}
  VBBarCodeForm.UBISendString(SendString); {send and fetch}
  SendString:='PRLINE 514,3'+CR; {length,line weight}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 148,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 64,3'+CR; {}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 292,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 128,3'+CR; {192}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 416,46'+CR; {was ,174 DL151096}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 448,3'+CR; {was 320, DL151096} //xx DL230899 was 494,3
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 584,46'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRLINE 514,3'+CR;
  VBBarCodeForm.UBISendString(SendString);

  {print the headings}
  SendString:='DIR 1'+CR; {horizontal}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='FONT "SW020BSN.1"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,378'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Color"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,474'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Style"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,540'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Country Of Origin: Republic of South Africa"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,218'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Width ('''')"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 156,218'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Gross (yds)"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 300,218'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Allowance"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,218'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Nett (yds)"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 24,282'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Date Manu."'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 300,282'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Faults"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,282'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Strip #"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,346'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Lot #"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,412'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Carton #"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,474'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "Part #"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,154'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Product"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,90'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Nett (mtr)"'+CR;
  UBISendString(SendString);
  {print Republic of South Africa}
  SendString:='FONT "SW050RSN.1"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 20,498'+CR;
  VBBarCodeForm.UBISendString(SendString);
  if (LabelStru='LH') then
    SendString:='PRTXT "Levolor Home Fashions"'+CR
  else if (LabelStru='HD') then
    SendString:='PRTXT "Hunter Douglas Verticals"'+CR
  else //added DL041013
    SendString:='PRTXT "ITA, Inc."'+CR;

  VBBarCodeForm.UBISendString(SendString);

  {print the data}
  SendString:='DIR 1'+CR; {horizontal}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='FONT "SW080BSN.1"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 20,402'+CR; {382}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+StyleDescr+'"'+CR; {"FRESCO"}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 20,306'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+ColorDescr+'"'+CR; {"CHABLIS"}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='FONT "SW050RSN.1"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,430'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+PartNo+'"'+CR; {"265001"}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,366'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(BoxNo)+'"'+CR; {"1694"}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,302'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(LotNo)+'"'+CR; {"94103"}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 20,238'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+
    FormatDateTime('mmm dd, yyyy', DateManu)+
    '"'+CR; {"Jun 20, 1996"}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 300,238'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(Faults)+'"'+CR; {faults}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,238'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(StripNo)+'"'+CR; {strip no}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 20,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+ImperialWidthDescr+'"'+CR; {"3.5"}
  VBBarCodeForm.UBISendString(SendString);

  NetMetres:=GrossLength-Allowance;
  //for IA round to whole numbers DL070601
  if LabelStru='IA' then
  begin
    GrossYards:=round(int(GrossLength*mtrTOyds*10+0.5)/10);
    AllowYards:=round(int(Allowance*mtrToyds*10+0.5)/10);
    NetYards:=round(int((GrossYards-AllowYards)*10+0.5)/10);
    YdsDigits:=0;
  end
  else
  begin
    GrossYards:=int(GrossLength*mtrTOyds*10+0.5)/10;
    AllowYards:=int(Allowance*mtrToyds*10+0.5)/10;
    NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
    YdsDigits:=1;
  end;

  YdsString:=floattostrf(GrossYards,ffFixed,5,YdsDigits);
  SendString:='PRPOS 156,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRTXT "'+YdsString+'"'+CR; {gross yards}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 300,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  YdsString:=floattostrf(AllowYards,ffFixed,5,YdsDigits);
  SendString:='PRTXT "'+YdsString+'"'+CR; {allowance}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,174'+CR;
  VBBarCodeForm.UBISendString(SendString);
  YdsString:=floattostrf(NetYards,ffFixed,5,YdsDigits);
  SendString:='PRTXT "'+YdsString+'"'+CR; {net yards}
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRPOS 424,110'+CR; {added DL151096}
  UBISendString(SendString);
  SendString:='PRTXT "'+LabelDescr+'"'+CR; {net yards}
  UBISendString(SendString);
  SendString:='PRPOS 424,46'+CR; {added DL151096}
  UBISendString(SendString);
  SendString:='PRTXT "'+floattostrf(NetMetres,ffFixed,5,YdsDigits)+'"'+CR; {net yards}
  UBISendString(SendString);

  {print the barcode}
  {use label 19 (was 14) for strip (roll), label 15 for box}
{  SendString:='PRPOS 40,52'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARRATIO 3,1'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARHEIGHT 40'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARMAG 2'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARTYPE "CODE39"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARFONT #2,"SW030RSN.1",5,1,1 ON'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRBAR "19'+
    ZeroFill(RollNo,6)+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);}
  SendString:='PRPOS 120,48'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARRATIO 3,1'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARHEIGHT 80'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARMAG 2'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='MAG 1,1'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARTYPE "INT2OF5"'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='BARFONT #2,"SW030RSN.1",5,1,1 ON'+CR;
  VBBarCodeForm.UBISendString(SendString);
  SendString:='PRBAR "19'+
    ZeroFill(RollNo,6)+'"'+CR;
  VBBarCodeForm.UBISendString(SendString);

  SendString:='PRINTFEED'+CR;
  VBBarCodeForm.UBISendString(SendString);
end;

procedure TVBBarCodeForm.Button1Click(Sender: TObject);
begin
  VBYarnRcpt.Open;
  VBYarnIssued.Open;
  VBYarnRcpt.Refresh;
  VBYarnIssued.Refresh;
  VBYarnIssued.First;
  while not VBYarnIssued.EOF do
  begin
{    ProgressBar1.Position:=trunc(DelHeadDelNo.AsInteger/472*100);}  
    VBYarnRcpt.SetKey;
    VBYarnRcpt.FieldByName('BoxNo').AsInteger:=VBYarnIssuedBoxNo.Value;
    if VBYarnRcpt.GotoKey then
    begin
      VBYarnRcpt.Edit;
      VBYarnRcptIssuedTo.Value:=VBYarnIssuedIssuedTo.Value;
      VBYarnRcptIssuedDate.Value:=VBYarnIssuedIssuedDate.Value;
      VBYarnRcptIssuedBy.Value:=VBYarnIssuedIssuedBy.Value;
      VBYarnRcpt.Post;
    end;
    VBYarnIssued.Next;
  end;
  VBYarnRcpt.Close;
  VBYarnIssued.Close;
end;

procedure TVBBarCodeForm.Button2Click(Sender: TObject);
var
  refno1: integer;
{  refno2: integer;}
  txnno: integer;
begin
{commented out so that not run by mistake}
  DelHead.Open;
  CtrlAcct.Open;
  Product.Open;
  TxnDet.Open;
  DelHead.First;
  while not DelHead.EOF do
  begin
    ProgressBar1.Position:=trunc(DelHeadDelNo.AsInteger/5017*100);
      SPGenTxnDetRef.ExecProc;
      RefNo1:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
      SPGenTxnDetTxnRef.ExecProc;
      TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;
      Product.SetKey;
      Product.FieldByName('ProdRef').AsString:=DelHeadProdRef.Value;
      if Product.GotoKey then
      begin
        with TxnDet do
        begin
          Insert;
          FieldByName('Ref').AsInteger:=RefNo1;
          FieldByName('TxnNo').AsInteger:=TxnNo;
          FieldByName('TxnCode').AsString:='DH';
          FieldByName('ProdType').AsString:='RM';
          FieldByName('ExtProdRef').AsString:=ProductExtProdRef.AsString;
          FieldByName('Qlty').AsString:='';
          FieldByName('Qty').Value:=DelHeadQtyRcvd.Value;
          FieldByName('TxnDate').Value:=DelHeadDelDate.Value;
          FieldByName('OrigTxnCode').AsInteger:=DelHeadDelNo.Value;
          FieldByName('DateEnt').Value:=DelHeadDateEnt.Value;
          FieldByName('UserEnt').AsString:=DelHeadUserEnt.Value;
          Post;
        end;
      end;
    DelHead.Next;
  end;
  CtrlAcct.Close;
  Product.Close;
  TxnDet.Close;
  DelHead.Close;
end;

procedure TVBBarCodeForm.Button3Click(Sender: TObject);
var
  refno1: integer;
{  refno2: integer;}
  txnno: integer;
{  extprodref:string[11];}
  controlacct:string[6];
{  accname:string[6];}
begin
{commented out so that not run by mistake}
  IssueDet.Open;
  CtrlAcct.Open;
  Product.Open;
  TxnDet.Open;
  IssueDet.First;
  while not IssueDet.EOF do
  begin
    ProgressBar1.Position:=trunc(IssueDetIssueNo.AsInteger/100380*100);
    SPGenTxnDetRef.ExecProc;
    RefNo1:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
{    SPGenTxnDetRef.ExecProc;
    RefNo2:=SPGenTxnDetRef.ParamByName('Code').AsInteger;}
    SPGenTxnDetTxnRef.ExecProc;
    TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;
    ControlAcct:='NONE';
{    1) insert the issue from record: decrease the stock}
    Product.SetKey;
    Product.FieldByName('ProdRef').AsString:=IssueDetProdRef.Value;
    if Product.GotoKey then
    begin
      with TxnDet do
      begin
        Insert;
        FieldByName('Ref').AsInteger:=RefNo1;
        FieldByName('TxnNo').AsInteger:=TxnNo;
        FieldByName('TxnCode').AsString:='ID';
        FieldByName('ProdType').AsString:='RM';
        FieldByName('ExtProdRef').AsString:=ProductExtProdRef.AsString;
        FieldByName('Qlty').AsString:='';
        FieldByName('Qty').Value:=IssueDetQtyIssued.Value*-1;
        FieldByName('TxnDate').Value:=IssueDetDateIssued.Value;
        FieldByName('OrigTxnCode').AsInteger:=IssueDetIssueNo.Value;
        FieldByName('DateEnt').Value:=IssueDetDateIssued.Value;
        FieldByName('UserEnt').AsString:=IssueDetInitials.Value;
        Post;
      end;
    end
    else
      raise Exception.Create('Error: cannot find product: '+IssueDetProdRef.Value);
    IssueDet.Next;
  end;
  IssueDet.Close;
  CtrlAcct.Close;
  Product.Close;
  TxnDet.Close;
end;

procedure TVBBarCodeForm.Button4Click(Sender: TObject);
begin
  DelHead.Open;
  IssueDet.Open;
  IssueDet.First;
  while not IssueDet.EOF do
  begin
    ProgressBar1.Position:=IssueDetIssueNo.AsInteger;
    if IssueDetProdRef.Value='' then
    begin
      DelHead.SetKey;
      DelHead.FieldByName('DelNo').AsInteger:=IssueDetDelNo.Value;
      if DelHead.GotoKey then
      begin
        IssueDet.Edit;
        IssueDetProdRef.Value:=DelHeadProdRef.Value;
        IssueDet.Post;
      end;
    end;
    IssueDet.Next;
  end;
end;

procedure TVBBarCodeForm.Button5Click(Sender: TObject);
var
  refno1: integer;
{  refno2: integer;}
  txnno: integer;
{  extprodref: string[11];}
{  accname: string[6];}
begin
  Product.Open;
  WIPRcpt.Open;
  CtrlAcct.Open;
  TxnDet.Open;
  WIPRcpt.First;
  while not WIPRcpt.EOF do
  begin
    ProgressBar1.Position:=trunc(WIPRcptRefNo.AsInteger/4739*100);
    SPGenTxnDetRef.ExecProc;
    RefNo1:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
{    SPGenTxnDetRef.ExecProc;
    RefNo2:=SPGenTxnDetRef.ParamByName('Code').AsInteger;}
    SPGenTxnDetTxnRef.ExecProc;
    TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;
    Product.SetKey;
    Product.FieldByName('ProdRef').AsString:=WIPRcptProdRef.Value;
    if Product.GotoKey then
    begin
      with TxnDet do
      begin
        Insert;
        FieldByName('Ref').AsInteger:=RefNo1;
        FieldByName('TxnNo').AsInteger:=TxnNo;
        FieldByName('TxnCode').AsString:='WR';
        FieldByName('ProdType').AsString:='RM';
        FieldByName('ExtProdRef').AsString:=ProductExtProdRef.AsString;
        FieldByName('Qlty').AsString:='';
        FieldByName('Qty').Value:=WIPRcptNetWeight.Value;
        FieldByName('TxnDate').Value:=WIPRcptDateManu.Value;
        FieldByName('OrigTxnCode').AsInteger:=WIPRcptRefNo.Value;
        FieldByName('DateEnt').Value:=WIPRcptDateEnt.Value;
        FieldByName('UserEnt').AsString:=WIPRcptUserEnt.Value;
        Post;
      end;
    end
    else
      raise Exception.Create('Error: cannot find product: '+WIPRcptProdRef.Value);
    WIPRcpt.Next;
  end;
  Product.Close;
  WIPRcpt.Close;
  CtrlAcct.Close;
  TxnDet.Close;
end;

procedure TVBBarCodeForm.Button6Click(Sender: TObject);
var
 refno1: integer;
{ refno2: integer;}
 txnno: integer;
{ extprodref: string[11];}
 controlacct: string[6];
{ accname: string[6];}
begin
  Product.Open;
  WIPRcpt.Open;
  CtrlAcct.Open;
  TxnDet.Open;
  WIPRcpt.First;
  while not WIPRcpt.EOF do
  begin
    ProgressBar1.Position:=trunc(WIPRcptRefNo.AsInteger/4739*100);
    SPGenTxnDetRef.ExecProc;
    RefNo1:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
{    SPGenTxnDetRef.ExecProc;
    RefNo2:=SPGenTxnDetRef.ParamByName('Code').AsInteger;}
    SPGenTxnDetTxnRef.ExecProc;
    TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;
    ControlAcct:='NONE';
    Product.SetKey;
    Product.FieldByName('ProdRef').AsString:=WIPRcptProdRef.Value;
    if Product.GotoKey then
    begin
      with TxnDet do
      begin
        Insert;
        FieldByName('Ref').AsInteger:=RefNo1;
        FieldByName('TxnNo').AsInteger:=TxnNo;
        FieldByName('TxnCode').AsString:='WI';
        FieldByName('ProdType').AsString:='RM';
        FieldByName('ExtProdRef').AsString:=ProductExtProdRef.AsString;
        FieldByName('Qlty').AsString:='';
        FieldByName('Qty').Value:=WIPRcptNetWeight.Value*-1;
        FieldByName('TxnDate').Value:=WIPRcptDateIssued.Value;
        FieldByName('OrigTxnCode').AsInteger:=WIPRcptRefNo.Value;
        FieldByName('DateEnt').Value:=WIPRcptDateMod.Value;
        FieldByName('UserEnt').AsString:=WIPRcptUserMod.Value;
        Post;
      end;
    end
    else
      raise Exception.Create('Error: cannot find product: '+WIPRcptProdRef.Value);
    WIPRcpt.Next;
  end;
  Product.Close;
  WIPRcpt.Close;
  CtrlAcct.Close;
  TxnDet.Close;
end;

procedure TVBBarCodeForm.Button7Click(Sender: TObject);
var
 refno: integer;
 txnno: integer;
{ wbsweight: double;}
 txncode: string[2];
 prodtype:string[3];
begin
  VBYarnRcptQuery.Open;
  TxnDet.Open;
  VBYarnRcptQuery.First;
  while not VBYarnRcptQuery.EOF do
  begin
    MainForm.Database.StartTransaction;
    ProgressBar1.Position:=trunc(VBYarnRcptQueryBoxNo.AsInteger/500120*100);
{    SPGenTxnDetTxnRef.ExecProc;
    TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;}
    if (VBYarnRcptQuerybatref.Value<>0) then
    begin
      TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;
      if (VBYarnRcptQueryYnQlty.Value='W') then
      begin
        prodtype:='WEW';
        txncode:='FI';
      end
      else
      begin
        prodtype:='WEF';
        if (VBYarnRcptQueryissuedto.Value='VREDE1') then
        begin
          txncode:='FR';
        end
        else
        begin
          txncode:='FI';
        end
      end;
      SPGenTxnDetRef.ExecProc;
      RefNo:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
      with TxnDet do
      begin
        Insert;
        FieldByName('Ref').AsInteger:=RefNo;
        FieldByName('TxnNo').AsInteger:=TxnNo;
        FieldByName('TxnCode').AsString:=TxnCode;
        FieldByName('ProdType').AsString:=ProdType; {YN or WYN}
        FieldByName('ExtProdRef').AsString:=VBYarnRcptQueryYnType.Value;
        FieldByName('Qlty').AsString:=VBYarnRcptQueryYnQlty.Value;
        FieldByName('Qty').Value:=VBYarnRcptQueryYnNet.Value*-1;
        FieldByName('TxnDate').Value:=VBYarnRcptQueryIssuedDate.Value;
        FieldByName('OrigTxnCode').AsInteger:=VBYarnRcptQueryBoxNo.Value;
        FieldByName('DateEnt').Value:=VBYarnRcptQueryDateEnt.Value;
        FieldByName('UserEnt').AsString:=VBYarnRcptQueryIssuedBy.Value;
        Post;
      end;
    end;
    SPGenTxnDetTxnRef.ExecProc;
    TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;
    if (VBYarnRcptQueryYnQlty.Value='W') then
    begin
      prodtype:='WEW';
      txncode:='WF';
    end
    else
    begin
      prodtype:='WEF';
      if (VBYarnRcptQueryReturned.Value='Y') then
      begin
        txncode:='WF';
      end
      else
      begin
        txncode:='WS';
      end;
    end;
    SPGenTxnDetRef.ExecProc;
    RefNo:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
    with TxnDet do
    begin
      Insert;
      FieldByName('Ref').AsInteger:=RefNo;
      FieldByName('TxnNo').AsInteger:=TxnNo;
      FieldByName('TxnCode').AsString:=TxnCode;
      FieldByName('ProdType').AsString:=ProdType; {YN or WYN}
      FieldByName('ExtProdRef').AsString:=VBYarnRcptQueryYnType.Value;
      FieldByName('Qlty').AsString:=VBYarnRcptQueryYnQlty.Value;
      FieldByName('Qty').Value:=VBYarnRcptQueryYnNet.Value;
      FieldByName('TxnDate').Value:=VBYarnRcptQueryDateRcvd.Value;
      FieldByName('OrigTxnCode').AsInteger:=VBYarnRcptQueryBoxNo.Value;
      FieldByName('DateEnt').Value:=VBYarnRcptQueryDateEnt.Value;
      FieldByName('UserEnt').AsString:=VBYarnRcptQueryUserEnt.Value;
      Post;
    end;
    MainForm.Database.Commit;
    VBYarnRcptQuery.Next;
  end;
  VBYarnRcptQuery.Close;
  TxnDet.Close;
end;

procedure TVBBarCodeForm.ConvertStkMinBtnClick(Sender: TObject);
var
  {ErrorString:string[80];}
  RecordsInVBMake:integer;
  CurrentVBMakeRecord:integer;
begin
  {remember to do manual copy to vbstkmintemp first}
  CurrentVBMakeRecord:=0;
  MainForm.Database.StartTransaction;
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select count(*) from vbmake');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  RecordsInVBMake:=MyQuery.Fields[0].AsInteger;
  MyQuery.Close;
  VBMake.Open;
  VBStockMin.Open;
  VBMake.First;
  while not VBMake.EOF do
  begin
    inc(CurrentVBMakeRecord);
    ProgressBar1.Position:=trunc(CurrentVBMakeRecord/RecordsInVBMake*100);
    {if VBMakeSale127.Value>VBMakeMin127.Value then
    begin}
      VBStockMin.SetKey;
      VBStockMinVBStru.Value:=VBMakeVBStru.AsString;
      VBStockMinVBCol.Value:=VBMakeVBCol.AsString;
      VBStockMinVBWidth.Value:=127;
      {ErrorString:=VBMakeVBStru.AsString+VBMakeVBCol.AsString+'127';}
      if not VBStockMin.GotoKey then
      begin
        VBStockMin.Insert;
        VBStockMinVBStru.Value:=VBMakeVBStru.AsString;
        VBStockMinVBCol.Value:=VBMakeVBCol.AsString;
        VBStockMinVBWidth.Value:=127;
        VBStockMinStkMin.Value:=VBMakeSale127.AsInteger;
      end
      else
      begin
        VBStockMin.Edit;
        VBStockMinStkMin.Value:=VBMakeSale127.AsInteger;
      end;
      VBStockMin.Post;
    {end; {127}
    {if VBMakeSale89.Value>VBMakeMin89.Value then
    begin}
      VBStockMin.SetKey;
      VBStockMinVBStru.Value:=VBMakeVBStru.AsString;
      VBStockMinVBCol.Value:=VBMakeVBCol.AsString;
      VBStockMinVBWidth.Value:=89;
      {ErrorString:=VBMakeVBStru.AsString+VBMakeVBCol.AsString+'89';}
      if not VBStockMin.GotoKey then
      begin
        VBStockMin.Insert;
        VBStockMinVBStru.Value:=VBMakeVBStru.AsString;
        VBStockMinVBCol.Value:=VBMakeVBCol.AsString;
        VBStockMinVBWidth.Value:=89;
        VBStockMinStkMin.Value:=VBMakeSale89.AsInteger;
      end
      else
      begin
        VBStockMin.Edit;
        VBStockMinStkMin.Value:=VBMakeSale89.AsInteger;
      end;
      VBStockMin.Post;
    {end; {89}
    {if VBMakeSale2070.Value>VBMakeMin2070.Value then
    begin}
      VBStockMin.SetKey;
      VBStockMinVBStru.Value:=VBMakeVBStru.AsString;
      VBStockMinVBCol.Value:=VBMakeVBCol.AsString;
      VBStockMinVBWidth.Value:=2070;
      {ErrorString:=VBMakeVBStru.AsString+VBMakeVBCol.AsString+'2070';}
      if not VBStockMin.GotoKey then
      begin
        VBStockMin.Insert;
        VBStockMinVBStru.Value:=VBMakeVBStru.AsString;
        VBStockMinVBCol.Value:=VBMakeVBCol.AsString;
        VBStockMinVBWidth.Value:=2070;
        VBStockMinStkMin.Value:=VBMakeSale2070.AsInteger;
      end
      else
      begin
        VBStockMin.Edit;
        VBStockMinStkMin.Value:=VBMakeSale2070.AsInteger;
      end;
      VBStockMin.Post;
    {end; {2070}
    VBMake.Next;
  end;
  VBMake.Close;
  VBStockMin.Close;
  MainForm.Database.Commit;
end;

procedure TVBBarCodeForm.PrintBoxLabel(const Line1,Line2,Line3,Line4,Line5,BarCode:string40);
var
  SendString:string;
  MyFile: TextFile; //added DL040307
begin
  //xx modified method DL040307 to be able to print to UBI or C4P printer
  if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
  begin
    SendString:='';
    SendString:='CLL'+CR;
    UBISendString(SendString);

    SendString:='FONT "SW030RSN.1"'+CR;
    UBISendString(SendString);
    SendString:='DIR 1'+CR;
    UBISendString(SendString);
    SendString:='PRPOS 24,540'+CR;
    UBISendString(SendString);
    SendString:='PRTXT "'+Line1+'"'+CR;
    UBISendString(SendString);
    SendString:='FONT "SW080BSN.1"'+CR;
    UBISendString(SendString);
    SendString:='PRPOS 24,440'+CR; {was 24,474}
    UBISendString(SendString);
    SendString:='PRTXT "'+Line2+'"'+CR;
    UBISendString(SendString);
    SendString:='FONT "SW030RSN.1"'+CR;
    UBISendString(SendString);
    SendString:='PRPOS 24,378'+CR;
    UBISendString(SendString);
    SendString:='PRTXT "'+Line3+'"'+CR;
    UBISendString(SendString);
    SendString:='PRPOS 24,282'+CR;
    UBISendString(SendString);
    SendString:='PRTXT "'+Line4+'"'+CR;
    UBISendString(SendString);
    SendString:='PRPOS 24,218'+CR;
    UBISendString(SendString);
    SendString:='PRTXT "'+Line5+'"'+CR;
    UBISendString(SendString);

    SendString:='PRPOS 120,48'+CR;
    UBISendString(SendString);
    SendString:='BARFONT "SW030RSN.1"'+CR;
    UBISendString(SendString);
    SendString:='BARFONT ON'+CR;
    UBISendString(SendString);
    SendString:='BARRATIO 3,1'+CR;
    UBISendString(SendString);
    SendString:='BARHEIGHT 100'+CR;
    UBISendString(SendString);
    SendString:='BARMAG 2'+CR;
    UBISendString(SendString);
    SendString:='MAG 1,1'+CR;
    UBISendString(SendString);
    SendString:='BARTYPE "INT2OF5"'+CR;
    UBISendString(SendString);
    SendString:='PRBAR "'+BarCode+'"'+CR;
    UBISendString(SendString);

    SendString:='PRINTFEED'+CR;
    UBISendString(SendString);
  end
  else if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
  begin
  end
  else if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='C4P' then
  begin
    AssignFile(MyFile, 'LPT1:');
    Rewrite(MyFile);
    Writeln(MyFile, '');
    //Writeln(MyFile, 'ON'); //leave out ,D
    Writeln(MyFile, 'Q607,15');
    Writeln(MyFile, 'q607');
    Writeln(MyFile, 'S3'); //fastest speed
    Writeln(MyFile, 'D10');
    Writeln(MyFile, 'ZB'); //ZB reverse label (downwards) 180 degrees; ZT normal
    Writeln(MyFile, 'JF');
    Writeln(MyFile, 'N');
    //Writeln(MyFile, 'X22,40,2,585,563');
    Writeln(MyFile, 'A102,40,0,4,1,1,N,"VREDE TEXTILES (PTY) LTD"');
    Writeln(MyFile, 'A45,120,0,4,1,1,N,"'+Line1+'"'); //Box
    Writeln(MyFile, 'A45,190,0,2,3,3,N,"'+Line2+'"'); //SHAFTW
    Writeln(MyFile, 'A45,270,0,4,1,1,N,"'+Line3+'"'); //Qty
    Writeln(MyFile, 'A45,320,0,4,1,1,N,"'+Line4+'"'); //Date Rcvd
    Writeln(MyFile, 'A45,370,0,4,1,1,N,"'+Line5+'"'); //
    Writeln(MyFile, 'B45,408,0,2,2,6,64,B,"'+BarCode+'"'); //113140003001

    //EndLabel
    Writeln(MyFile, 'P1');
    CloseFile(MyFile);
  end;
end;

procedure TVBBarCodeForm.Button8Click(Sender: TObject);
var
  RecordsInDespatch:integer;
begin
  VBDespHdr.Open;
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select count(*)');
  MyQuery.SQL.Add('from vbdesphdr');
  MyQuery.SQL.Add('where despsent=''Y''');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  RecordsInDespatch:=MyQuery.Fields[0].AsInteger;
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('update vbrcpt');
  MyQuery.SQL.Add('set despdate=:despdate');
  MyQuery.SQL.Add('where despno=:despno');
  MyQuery.Prepare;
  VBDespHdr.First;
  MainForm.Database.StartTransaction;
  while not VBDespHdr.EOF do
  begin
    ProgressBar1.Position:=trunc(VBDespHdrDespNo.AsInteger/RecordsInDespatch*100);
    MyQuery.Params[0].Value:=VBDespHdrDespDate.Value;
    MyQuery.Params[1].Value:=VBDespHdrDespNo.AsInteger;
    MyQuery.ExecSQL;
    if MyQuery.RowsAffected<=0 then
      ShowMessage('Error in Despatch '+VBDespHdrDespNo.AsString);
    VBDespHdr.Next;
  end;
  MainForm.Database.Commit;
  MyQuery.Close;
  VBDespHdr.Close;
end;

procedure TVBBarCodeForm.DailybalanceClick(Sender: TObject);
var {tempdate,}CurrentDate{,LastDate}:TDateTime;
  {tempstring:string[11];}
  {ix,iy:integer;}startingfrom:string[11];
  OpeningBalance,TodaysBalance:integer;
begin
  startingfrom:='1-jan-1997';
  VBDailyAnalyseQuery.Open;
  VBDailyBalance.Open;
  while not VBDailyAnalyseQuery.EOF do
  begin
    MyQuery.Close;
    MyQuery.SQL.Clear; {get opening balance, be careful of products starting after opening date}
    MyQuery.SQL.Add('select sum(vr.netlength)');
    MyQuery.SQL.Add('from vbrcpt vr');
    MyQuery.SQL.Add('where (vr.datemanu<'''+StartingFrom+''')');
    MyQuery.SQL.Add('and ((vr.despdate>='''+StartingFrom+''') or (vr.despdate is null))');
    MyQuery.SQL.Add('and (vr.vbstru='''+VBDailyAnalyseQueryVBStru.AsString+''')');
    MyQuery.SQL.Add('and (vr.vbcol='''+VBDailyAnalyseQueryVBCol.AsString+''')');
    MyQuery.SQL.Add('and (vr.vbfin='''+VBDailyAnalyseQueryVBFin.AsString+''')');
    MyQuery.SQL.Add('and (vr.metricwidth='+VBDailyAnalyseQueryVBWidth.AsString+')');
    MyQuery.SQL.Add('and (vr.qlty='''')');
    MyQuery.Open;
    OpeningBalance:=MyQuery.Fields[0].AsInteger;

    TodaysBalance:=OpeningBalance;

    MyQuery1.SQL.Clear; {get balances on transaction days}
    MyQuery1.SQL.Add('select vr.despdate,sum(vr.netlength*-1)'); {despatches must decrease stock}
    MyQuery1.SQL.Add('from vbrcpt vr');
    MyQuery1.SQL.Add('where vr.vbstru='''+VBDailyAnalyseQueryVBStru.AsString+'''');
    MyQuery1.SQL.Add('and vr.vbcol='''+VBDailyAnalyseQueryVBCol.AsString+'''');
    MyQuery1.SQL.Add('and vr.vbfin='''+VBDailyAnalyseQueryVBFin.AsString+'''');
    MyQuery1.SQL.Add('and vr.metricwidth='+VBDailyAnalyseQueryVBWidth.AsString);
    MyQuery1.SQL.Add('and vr.datemanu>='''+StartingFrom+'''');
    MyQuery1.SQL.Add('and vr.qlty=''''');
    MyQuery1.SQL.Add('and vr.despdate is not null');
    MyQuery1.SQL.Add('group by vr.despdate');
    MyQuery1.SQL.Add('union');
    MyQuery1.SQL.Add('select vr.datemanu,sum(vr.netlength)'); {manufactured}
    MyQuery1.SQL.Add('from vbrcpt vr');
    MyQuery1.SQL.Add('where vr.vbstru='''+VBDailyAnalyseQueryVBStru.AsString+'''');
    MyQuery1.SQL.Add('and vr.vbcol='''+VBDailyAnalyseQueryVBCol.AsString+'''');
    MyQuery1.SQL.Add('and vr.vbfin='''+VBDailyAnalyseQueryVBFin.AsString+'''');
    MyQuery1.SQL.Add('and vr.metricwidth='+VBDailyAnalyseQueryVBWidth.AsString);
    MyQuery1.SQL.Add('and vr.datemanu>='''+StartingFrom+'''');
    MyQuery1.SQL.Add('and vr.qlty=''''');
    MyQuery1.SQL.Add('group by vr.datemanu');
    MyQuery1.SQL.Add('order by 1');
    MyQuery1.Prepare;
    MyQuery1.Open;
    MyQuery1.First;
    CurrentDate:=strtodate({StartingFrom}'1/1/97');
    while not MyQuery1.EOF do
    begin
      {insert records until day-1 in union select}
      while CurrentDate<strtodate(MyQuery1.Fields[0].Value) do
      begin
        {MainForm.Database.StartTransaction;}
        with VBDailyBalance do
        begin
          Insert;
          FieldByName('vbstru').AsString:=VBDailyAnalyseQuery.Fields[0].AsString;
          FieldByName('vbcol').AsString:=VBDailyAnalyseQuery.Fields[1].AsString;
          FieldByName('vbfin').AsString:=VBDailyAnalyseQuery.Fields[2].AsString;
          FieldByName('vbwidth').AsInteger:=VBDailyAnalyseQuery.Fields[3].AsInteger;
          FieldByName('balancedate').Value:=CurrentDate;
          FieldByName('avesales').AsInteger:=1;
          FieldByName('netlength').AsInteger:=TodaysBalance;
          Post;
        end;
        {MainForm.Database.Commit;}
        CurrentDate:=CurrentDate+1;
      end;
      repeat {while on currentdate}
        TodaysBalance:=TodaysBalance+MyQuery1.Fields[1].AsInteger;
        {LastDate:=MyQuery1.Fields[0].AsDate;}
        MyQuery1.Next;
      until (strtodate(MyQuery1.Fields[0].Value)>CurrentDate)
        or (MyQuery1.EOF); {bec. can be a rcpt and despatch on same date}
    end;
    {Insert the last record}
    with VBDailyBalance do
    begin
      Insert;
      FieldByName('vbstru').AsString:=VBDailyAnalyseQuery.Fields[0].AsString;
      FieldByName('vbcol').AsString:=VBDailyAnalyseQuery.Fields[1].AsString;
      FieldByName('vbfin').AsString:=VBDailyAnalyseQuery.Fields[2].AsString;
      FieldByName('vbwidth').AsInteger:=VBDailyAnalyseQuery.Fields[3].AsInteger;
      FieldByName('balancedate').Value:=CurrentDate;
      FieldByName('avesales').AsInteger:=1;
      FieldByName('netlength').AsInteger:=TodaysBalance;
      Post;
    end;
    VBDailyAnalyseQuery.Next;
  end; {VBDailyAnalyseQuery.EOF}
  VBDailyBalance.Close;
  VBDailyAnalyseQuery.Close;
end;

procedure TVBBarCodeForm.PrintDMX_VT(LabelDescr:string8;Qlty:string1; //labeldescr was string6 DL081001
      LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      MetricWidthDescr:string5;ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;NetLength:real;RollNo:integer;
      StyleDescr,ColorDescr,PartNo,Heading:string25);
const
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  SendString:string;
  GrossYards,NetYards,AllowYards:real;
  YdsString:string;
begin
  //to do: deal with the inbetween labels and last label eject problem
  SendString:=STX+'00210'+CR;
  DMXComPort2.PutString(SendString);
//  SendString:=STX+'f200'+CR; //inbetween labels
  SendString:=STX+'f350'+CR; //lastlabel DL031117
  DMXComPort2.PutString(SendString);
  SendString:=STX+'L'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='D11'+CR;
  DMXComPort2.PutString(SendString);

  //print the boxes
  SendString:='1X11000'+'00900005'+'B065030001001'+CR; {3.5"}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00900070'+'B070030001001'+CR; {164yrds}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00900140'+'B065030001001'+CR; {Allow}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00900205'+'B080030001001'+CR; {Nett yrds}
  DMXComPort2.PutString(SendString);

  SendString:='1X11000'+'01200005'+'B065030001001'+CR; {89 mm}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01200070'+'B070030001001'+CR; {150m}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01200140'+'B065030001001'+CR; {Allow}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01200205'+'B080030001001'+CR; {Nett}
  DMXComPort2.PutString(SendString);

  SendString:='1X11000'+'01500005'+'B135030001001'+CR; {Date}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01500140'+'B065030001001'+CR; {Faults}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01500205'+'B080030001001'+CR; {Strip #s}
  DMXComPort2.PutString(SendString);

  SendString:='1X11000'+'01800005'+'B200060001001'+CR; {Product}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01800205'+'B080030001001'+CR; {Carton #}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'02100205'+'B080030001001'+CR; {Lot #}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'02400005'+'B280030001001'+CR; {Country of Origin}
  DMXComPort2.PutString(SendString);

  SendString:='1X11000'+'00200005'+'B280070001001'+CR; {Bar Codes}
  DMXComPort2.PutString(SendString);

  //add new Lines DL031213
  SendString:='1X11000'+'02090005'+'L199002'+CR; //? or 2800 0001 NL1 (new line 1)
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00200139'+'L002070'+CR; //? or 2800 0001 NL2
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00590141'+'L143002'+CR; //? or 2800 0001 NL3
  DMXComPort2.PutString(SendString);

  //print the headings
  SendString:='1911001'+'01100010'+'Width (")'+CR; {3.5"}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01100075'+'Gross (yds)'+CR; {164yrds}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01100145'+'Allowance'+CR; {Allow}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01100210'+'Nett (yds)'+CR; {Nett yrds}
  DMXComPort2.PutString(SendString);

  SendString:='1911001'+'01400010'+'Width (mm)'+CR; {89 mm}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01400075'+'Gross (mtr)'+CR; {150m}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01400145'+'Allowance'+CR; {Allow}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01400210'+'Nett (mtr)'+CR; {Nett}
  DMXComPort2.PutString(SendString);

  SendString:='1911001'+'01700010'+'Date Manu.'+CR; {Date}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01700145'+'Faults'+CR; {Faults}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01700210'+'Strip #'+CR; {Strip #}
  DMXComPort2.PutString(SendString);

  SendString:='1911001'+'02300010'+'Style'+CR; //Product'+CR; {Product} mod DL031213
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'02000010'+'Color'+CR; //added DL031213
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'02000210'+'Carton #'+CR; {Carton #}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'02300210'+'Lot #'+CR; {Lot #}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'02600010'+'Country Of Origin: Republic of South Africa'+CR; // {Country of Origin} RSA
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'02420010'+'Vrede Fabrics'+CR; //was VERTICAL REALITY DL030501
  DMXComPort2.PutString(SendString);

  //new Product Field; new Part# field: added DL031213
  SendString:='1911001'+'00780145'+'Product'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'00480145'+'Part #'+CR;
  DMXComPort2.PutString(SendString);

  //print the data
  //for IA round to whole numbers DL070601 - not in _VT.
  {if LabelStru='IA' then
  begin
    GrossYards:=round(int(GrossLength*mtrTOyds*10+0.5)/10);
    AllowYards:=round(int(Allowance*mtrToyds*10+0.5)/10);
    NetYards:=round(int((GrossYards-AllowYards)*10+0.5)/10);
  end
  else
  begin
    GrossYards:=int(GrossLength*mtrTOyds*10+0.5)/10;
    AllowYards:=int(Allowance*mtrToyds*10+0.5)/10;
    NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
  end;}
  GrossYards:=int(GrossLength*mtrTOyds*10+0.5)/10;
  AllowYards:=int(Allowance*mtrToyds*10+0.5)/10;
  NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;

  SendString:='1911004'+'00920010'+ImperialWidthDescr+CR; {3.5"}
  DMXComPort2.PutString(SendString);
  YdsString:=floattostrf(GrossYards,ffFixed,5,1);
  SendString:='1911004'+'00920075'+YdsString+CR; {164yrds}
  DMXComPort2.PutString(SendString);
  YdsString:=floattostrf(AllowYards,ffFixed,3,1);
  SendString:='1911004'+'00920145'+YdsString+CR; {Allow}
  DMXComPort2.PutString(SendString);
  YdsString:=floattostrf(NetYards,ffFixed,5,1);
  SendString:='1911004'+'00920210'+YdsString+CR; {Nett yrds}
  DMXComPort2.PutString(SendString);

  SendString:='1911004'+'01220010'+MetricWidthDescr+CR; {89 mm}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01220075'+floattostrf(GrossLength,ffFixed,5,1)+CR; {150m}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01220145'+floattostrf(Allowance,ffFixed,5,1)+CR; {Allow}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01220210'+floattostrf(NetLength,ffFixed,5,1)+CR; {Nett}
  DMXComPort2.PutString(SendString);

  SendString:='1911004'+'01520010'+FormatDateTime('mmm dd, yyyy', DateManu)+CR; {Date}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01520145'+inttostr(Faults)+CR; {Faults}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01520210'+inttostr(StripNo)+CR; {Strip #}
  DMXComPort2.PutString(SendString);

  //SendString:='1911008'+'01820015'+LabelDescr+' '+Qlty+CR; {Product}
  SendString:='1911004'+'02120010'+StyleDescr+CR; //mod DL031112
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01820210'+inttostr(BoxNo)+CR; {Carton #}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'02120210'+inttostr(LotNo)+CR; {Lot #}
  DMXComPort2.PutString(SendString);

  //print new data: added DL031112
  SendString:='1911004'+'01820010'+ColorDescr+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'00600145'+LabelDescr+' '+Qlty+CR; //Product
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'00300145'+PartNo+CR;
  DMXComPort2.PutString(SendString);

  // print the bar code; int 2 of 5; barratio 3,1; barheight 80;
  // barmag 2; mag 1,1 (Note: these are params from the UBI printer)
  //SendString:='1D00000'+'00300060'+'19'+ZeroFill(RollNo,6)+CR; //removed DL031113
  SendString:='1D62040'+'00300025'+'19'+ZeroFill(RollNo,6)+CR; //added DL031113
  DMXComPort2.PutString(SendString);

  //EndLabel
  SendString:='E'+CR;
  DMXComPort2.PutString(SendString);
end; //PrintDMX_VT

procedure TVBBarCodeForm.PrintDMX_HD(StyleDescr:string8;
      ColorDescr:string9;LabelDescr:string8;
      PartNo:string11;LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;RollNo:integer;
      LabelStru:string2);
const
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  SendString:string;
  GrossYards,NetYards,AllowYards,NetMetres:real;
  YdsString:string;
  YdsDigits:integer; //added DL070601
{  TempNetFloat:real;
  TempNetInt,TempLotNo:longint;
  TempLotNoStr,TempNetWidth,TempNet,TempFaults:string;}
begin
  //written DL031117
  //to do: deal with the inbetween labels and last label eject problem
  SendString:=STX+'00210'+CR;
  DMXComPort2.PutString(SendString);
//  SendString:=STX+'f200'+CR; //inbetween labels
  SendString:=STX+'f350'+CR; //lastlabel DL031117
  DMXComPort2.PutString(SendString);
  SendString:=STX+'L'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='D11'+CR;
  DMXComPort2.PutString(SendString);

  //print the boxes
  SendString:='1X11000'+'00900005'+'B065030001001'+CR; {3.5"}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00900070'+'B070030001001'+CR; {164yrds}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00900140'+'B065030001001'+CR; {Allow}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00900205'+'B080030001001'+CR; {Nett yrds}
  DMXComPort2.PutString(SendString);

  SendString:='1X11000'+'01200005'+'B135030001001'+CR; {Date Manu} //B135 was B065 DL03117
  DMXComPort2.PutString(SendString);
  //SendString:='1X11000'+'01200075'+'B070030001001'+CR; {150m}
  //DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01200140'+'B065030001001'+CR; {Faults}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01200205'+'B080030001001'+CR; {Strip #}
  DMXComPort2.PutString(SendString);

  SendString:='1X11000'+'01500005'+'B200045001001'+CR; {New Color}
  DMXComPort2.PutString(SendString);
  //SendString:='1X11000'+'01500145'+'B065030001001'+CR; {Faults}
  //DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01500205'+'B080030001001'+CR; {Lot #}
  DMXComPort2.PutString(SendString);

  SendString:='1X11000'+'01950005'+'B200045001001'+CR; {Product}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01800205'+'B080030001001'+CR; {Carton #}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'02100205'+'B080030001001'+CR; {Lot #}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'02400005'+'B280030001001'+CR; {Country of Origin}
  DMXComPort2.PutString(SendString);

  SendString:='1X11000'+'00200005'+'B280070001001'+CR; {Bar Codes}
  DMXComPort2.PutString(SendString);

  //add new Lines DL031213
//  SendString:='1X11000'+'02090010'+'L199002'+CR; //? or 2800 0001 NL1 (new line 1)
//  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00200139'+'L002070'+CR; //? or 2800 0001 NL2
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00590141'+'L143002'+CR; //? or 2800 0001 NL3
  DMXComPort2.PutString(SendString);

  //print the headings
  SendString:='1911001'+'01100010'+'Width (")'+CR; {3.5"}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01100075'+'Gross (yds)'+CR; {164yrds}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01100145'+'Allowance'+CR; {Allow}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01100210'+'Nett (yds)'+CR; {Nett yrds}
  DMXComPort2.PutString(SendString);

  //SendString:='1911001'+'01700015'+'Date Manu.'+CR;
  //DMXComPort2.PutString(SendString);
  //SendString:='1911001'+'01700080'+'Gross (mtr)'+CR; {150m}
  //DMXComPort2.PutString(SendString);
  //SendString:='1911001'+'01700150'+'Faults'+CR;
  //DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01700210'+'Lot #'+CR; //was Strip #
  DMXComPort2.PutString(SendString);

  SendString:='1911001'+'01400010'+'Date Manu.'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01400145'+'Faults'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01400210'+'Strip #'+CR; //was Lot #
  DMXComPort2.PutString(SendString);

  SendString:='1911001'+'02300010'+'Style'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'01820010'+'Color'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'02000210'+'Carton #'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'02300210'+'Part #'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'02600010'+'Country Of Origin: Republic of South Africa'+CR; // {Country of Origin} RSA
  DMXComPort2.PutString(SendString);
  if (LabelStru='LH') then
  begin
    SendString:='1911004'+'02420010'+'Levolor Home Fashions'+CR;
    DMXComPort2.PutString(SendString);
  end
  else if (LabelStru='HD') then //HD and LH separation done DL041013 because of other place where it was!
  begin
    SendString:='1911004'+'02420010'+'Hunter Douglas Verticals'+CR;
    DMXComPort2.PutString(SendString);
  end
  else //LabelStru='IA' //IA and if statement added DL041013
  begin
    SendString:='1911004'+'02420010'+'ITA, Inc.'+CR;
    DMXComPort2.PutString(SendString);
  end;


  //new Product Field; new Part# field: added DL031213
  SendString:='1911001'+'00780145'+'Product'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'00480145'+'Nett (mtr)'+CR;
  DMXComPort2.PutString(SendString);

  //print the data
  //for IA round to whole numbers DL070601
  if LabelStru='IA' then
  begin
    GrossYards:=round(int(GrossLength*mtrTOyds*10+0.5)/10);
    AllowYards:=round(int(Allowance*mtrToyds*10+0.5)/10);
    NetYards:=round(int((GrossYards-AllowYards)*10+0.5)/10);
    YdsDigits:=0;
  end
  else
  begin
    GrossYards:=int(GrossLength*mtrTOyds*10+0.5)/10;
    AllowYards:=int(Allowance*mtrToyds*10+0.5)/10;
    NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
    YdsDigits:=1;
  end;

  NetMetres:=int((GrossLength-Allowance)*10+0.5)/10; //added DL031117
  SendString:='1911004'+'00920010'+ImperialWidthDescr+CR; {3.5"}
  DMXComPort2.PutString(SendString);
  YdsString:=floattostrf(GrossYards,ffFixed,5,YdsDigits);
  SendString:='1911004'+'00920075'+YdsString+CR; {164yrds}
  DMXComPort2.PutString(SendString);
  YdsString:=floattostrf(AllowYards,ffFixed,3,YdsDigits);
  SendString:='1911004'+'00920145'+YdsString+CR; {Allow}
  DMXComPort2.PutString(SendString);
  YdsString:=floattostrf(NetYards,ffFixed,5,YdsDigits);
  SendString:='1911004'+'00920210'+YdsString+CR; {Nett yrds}
  DMXComPort2.PutString(SendString);

  //SendString:='1911004'+'01220015'+MetricWidthDescr+CR; {89 mm}
  //DMXComPort2.PutString(SendString);
  //SendString:='1911004'+'01220080'+floattostrf(GrossLength,ffFixed,5,1)+CR; {150m}
  //DMXComPort2.PutString(SendString);
  //SendString:='1911004'+'01220150'+floattostrf(Allowance,ffFixed,5,1)+CR; {Allow}
  //DMXComPort2.PutString(SendString);
  //SendString:='1911004'+'01220215'+floattostrf(NetLength,ffFixed,5,1)+CR; {Nett}
  //DMXComPort2.PutString(SendString);

  //change these co-ordinates
  SendString:='1911004'+'01220010'+FormatDateTime('mmm dd, yyyy', DateManu)+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01220145'+inttostr(Faults)+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01220210'+inttostr(StripNo)+CR;
  DMXComPort2.PutString(SendString);

  SendString:='1911004'+'01520210'+inttostr(LotNo)+CR; {was Strip #}
  DMXComPort2.PutString(SendString);

  //SendString:='1911008'+'01820015'+LabelDescr+' '+Qlty+CR; {Product}
  SendString:='1911007'+'01920010'+StyleDescr+CR; //mod DL031112
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01820210'+inttostr(BoxNo)+CR; {Carton #}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'02120210'+PartNo+CR; {was Lot #}
  DMXComPort2.PutString(SendString);

  //print new data: added DL031112
  SendString:='1911007'+'01470010'+ColorDescr+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'00600145'+LabelDescr+' '+CR; //Product
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'00300145'+floattostrf(NetMetres,ffFixed,5,YdsDigits)+CR; //was PartNo
  DMXComPort2.PutString(SendString);

  // print the bar code; int 2 of 5; barratio 3,1; barheight 80;
  // barmag 2; mag 1,1 (Note: these are params from the UBI printer)
  SendString:='1D62040'+'00300025'+'19'+ZeroFill(RollNo,6)+CR;
  DMXComPort2.PutString(SendString);

  //EndLabel
  SendString:='E'+CR;
  DMXComPort2.PutString(SendString);
end; //PrintDMX_HD



procedure TVBBarCodeForm.PrintC4P_VT(LabelDescr:string8;Qlty:string1;
      LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      MetricWidthDescr:string5;ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;NetLength:real;RollNo:integer;
      StyleDescr,ColorDescr,PartNo,Heading:string25);
const
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  GrossYards,NetYards,AllowYards:real;
  YdsString:string;
  MyFile: TextFile;
begin
  //written DL031119
  //VT Standard Label
  AssignFile(MyFile, 'LPT1:');
  Rewrite(MyFile);
  Writeln(MyFile, '');
//  Writeln(MyFile, 'ON'); //leave out ,D
  Writeln(MyFile, 'Q607,15');
  Writeln(MyFile, 'q607');
  Writeln(MyFile, 'S3'); //fastest speed
  Writeln(MyFile, 'D10');
  Writeln(MyFile, 'ZB'); //ZB reverse label (downwards) 180 degrees; ZT normal
  Writeln(MyFile, 'JF');
  Writeln(MyFile, 'N');
  Writeln(MyFile, 'X22,40,2,585,563');
  Writeln(MyFile, 'LE21,104,561,1');
  Writeln(MyFile, 'LE21,167,561,1');
  Writeln(MyFile, 'LE20,232,564,1');
  Writeln(MyFile, 'LE21,295,564,1');
  Writeln(MyFile, 'LE23,360,560,1');
  Writeln(MyFile, 'LE20,424,564,1');
  Writeln(MyFile, 'LE301,486,283,1');
  Writeln(MyFile, 'LE419,103,1,320');
  Writeln(MyFile, 'LE299,232,1,330');
  Writeln(MyFile, 'LE157,295,1,128');
  Writeln(MyFile, 'A29,46,0,1,1,1,N,"Country of Origin: Republic of South Africa"');
  Writeln(MyFile, 'A29,70,0,4,1,1,N,"Vrede Fabrics"');
  Writeln(MyFile, 'A29,106,0,1,1,1,N,"Style"');
  Writeln(MyFile, 'A29,170,0,1,1,1,N,"Color"');
  Writeln(MyFile, 'A29,237,0,1,1,1,N,"Date Manu."');
  Writeln(MyFile, 'A29,300,0,1,1,1,N,"Width (mm)"');
  Writeln(MyFile, 'A29,365,0,1,1,1,N,"Width (\")"');
  Writeln(MyFile, 'A423,106,0,1,1,1,N,"Lot #"');
  Writeln(MyFile, 'A423,170,0,1,1,1,N,"Carton #"');
  Writeln(MyFile, 'A303,237,0,1,1,1,N,"Faults"');
  Writeln(MyFile, 'A423,237,0,1,1,1,N,"Strip #"'); //on strip label
  Writeln(MyFile, 'A303,300,0,1,1,1,N,"Allowance"');
  Writeln(MyFile, 'A303,365,0,1,1,1,N,"Allowance"');
  Writeln(MyFile, 'A303,428,0,1,1,1,N,"Product"');
  Writeln(MyFile, 'A303,490,0,1,1,1,N,"Part #"');
  Writeln(MyFile, 'A160,300,0,1,1,1,N,"Gross (m)"');
  Writeln(MyFile, 'A160,365,0,1,1,1,N,"Gross (yds)"');
  Writeln(MyFile, 'A423,300,0,1,1,1,N,"Nett (mtr)"');
  Writeln(MyFile, 'A423,365,0,1,1,1,N,"Nett (yds)"');

  //print the data
  //for IA round to whole numbers DL070601 - not in _VT.
  {if LabelStru='IA' then
  begin
    GrossYards:=round(int(GrossLength*mtrTOyds*10+0.5)/10);
    AllowYards:=round(int(Allowance*mtrToyds*10+0.5)/10);
    NetYards:=round(int((GrossYards-AllowYards)*10+0.5)/10);
  end
  else
  begin
    GrossYards:=int(GrossLength*mtrTOyds*10+0.5)/10;
    AllowYards:=int(Allowance*mtrToyds*10+0.5)/10;
    NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
  end;}
  GrossYards:=int(GrossLength*mtrTOyds*10+0.5)/10;
  AllowYards:=int(Allowance*mtrToyds*10+0.5)/10;
  NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;

  Writeln(MyFile, 'A40,388,0,4,1,1,N,"'+ImperialWidthDescr+'"'); {3.5"}
  YdsString:=floattostrf(GrossYards,ffFixed,5,1);
  Writeln(MyFile, 'A170,388,0,4,1,1,N,"'+YdsString+'"'); {164yrds}
  YdsString:=floattostrf(AllowYards,ffFixed,3,1);
  Writeln(MyFile, 'A310,388,0,4,1,1,N,"'+YdsString+'"'); {Allow}
  YdsString:=floattostrf(NetYards,ffFixed,5,1);
  Writeln(MyFile, 'A433,388,0,4,1,1,N,"'+YdsString+'"'); {Nett yrds}

  Writeln(MyFile, 'A29,118,0,5,1,1,N,"'+StyleDescr+'"');
  Writeln(MyFile, 'A29,182,0,5,1,1,N,"'+ColorDescr+'"');
  Writeln(MyFile, 'A433,130,0,4,1,1,N,"'+inttostr(LotNo)+'"');
  Writeln(MyFile, 'A433,196,0,4,1,1,N,"'+inttostr(BoxNo)+'"');
  Writeln(MyFile, 'A40,258,0,4,1,1,N,"'+FormatDateTime('mmm dd, yyyy', DateManu)+'"');
  Writeln(MyFile, 'A310,258,0,4,1,1,N,"'+inttostr(Faults)+'"');
  Writeln(MyFile, 'A433,258,0,4,1,1,N,"'+inttostr(StripNo)+'"');
  Writeln(MyFile, 'A40,324,0,4,1,1,N,"'+MetricWidthDescr+'"');
  Writeln(MyFile, 'A170,324,0,4,1,1,N,"'+floattostrf(GrossLength,ffFixed,5,1)+'"');
  Writeln(MyFile, 'A310,324,0,4,1,1,N,"'+floattostrf(Allowance,ffFixed,5,1)+'"');
  Writeln(MyFile, 'A433,324,0,4,1,1,N,"'+floattostrf(NetLength,ffFixed,5,1)+'"');
  Writeln(MyFile, 'A310,450,0,4,1,1,N,"'+LabelDescr+' '+Qlty+'"'); //Product
  Writeln(MyFile, 'A310,515,0,4,1,1,N,"'+PartNo+'"');

  // print the bar code; int 2 of 5; barratio 3,1; barheight 80;
  // barmag 2; mag 1,1 (Note: these are params from the UBI printer)
  Writeln(MyFile, 'B65,446,0,2,2,6,64,B,"19'+ZeroFill(RollNo,6)+'"');

  //EndLabel
  Writeln(MyFile, 'P1');
  CloseFile(MyFile);
end; //PrintC4P_VT

procedure TVBBarCodeForm.PrintC4P_HD(StyleDescr:string8;
      ColorDescr:string9;LabelDescr:string8;
      PartNo:string11;LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;RollNo:integer;
      LabelStru:string2);
const
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  GrossYards,NetYards,AllowYards,NetMetres:real;
  YdsString:string;
  MyFile: TextFile;
  YdsDigits:integer; //added DL070601
begin
  //written DL031119
  //HD Label
  AssignFile(MyFile, 'LPT1:');
  Rewrite(MyFile);
  Writeln(MyFile, '');

//  Writeln(MyFile, 'ON');
  Writeln(MyFile, 'Q607,15');
  Writeln(MyFile, 'q607');
  Writeln(MyFile, 'S3');
  Writeln(MyFile, 'D10');
  Writeln(MyFile, 'ZB'); //ZB reverse label (downwards) 180 degrees; ZT normal
  Writeln(MyFile, 'JF');

  Writeln(MyFile, 'N');
  Writeln(MyFile, 'X22,40,2,585,563');

  Writeln(MyFile, 'LE21,104,561,1');
  Writeln(MyFile, 'LE419,168,164,1');
  Writeln(MyFile, 'LE419,232,165,1');
  Writeln(MyFile, 'LE21,295,564,1');
  Writeln(MyFile, 'LE23,360,560,1');
  Writeln(MyFile, 'LE20,424,564,1');
  Writeln(MyFile, 'LE301,486,283,1');
  Writeln(MyFile, 'LE419,103,1,320');
  Writeln(MyFile, 'LE299,297,1,266');
  Writeln(MyFile, 'LE157,359,1,64');
  Writeln(MyFile, 'LE20,198,399,1');
  Writeln(MyFile, 'A29,46,0,1,1,1,N,"Country of Origin: Republic of South Africa"');

  if (LabelStru='LH') then
    Writeln(MyFile, 'A29,70,0,4,1,1,N,"Levolor Home Fashions"') //split HD and LH DL041013
  else if (LabelStru='HD') then //IA and if statement added DL041013
    Writeln(MyFile, 'A29,70,0,4,1,1,N,"Hunter Douglas Verticals"')
  else //LabelStru='IA' //IA and if statement added DL041013
    Writeln(MyFile, 'A29,70,0,4,1,1,N,"ITA, Inc."');

  Writeln(MyFile, 'A29,110,0,1,1,1,N,"Style"');
  Writeln(MyFile, 'A29,204,0,1,1,1,N,"Color"');
  Writeln(MyFile, 'A29,300,0,1,1,1,N,"Date Manu."');
  Writeln(MyFile, 'A29,365,0,1,1,1,N,"Width (\")"');
  Writeln(MyFile, 'A423,237,0,1,1,1,N,"Lot #"');
  Writeln(MyFile, 'A423,174,0,1,1,1,N,"Carton #"');
  Writeln(MyFile, 'A423,110,0,1,1,1,N,"Part #"');
  Writeln(MyFile, 'A310,300,0,1,1,1,N,"Faults"');
  Writeln(MyFile, 'A310,365,0,1,1,1,N,"Allowance"');
  Writeln(MyFile, 'A423,300,0,1,1,1,N,"Strip #"'); //only 1 strip in a box
  Writeln(MyFile, 'A165,365,0,1,1,1,N,"Gross (yds)"');
  Writeln(MyFile, 'A423,365,0,1,1,1,N,"Nett (yds)"');
  Writeln(MyFile, 'A310,428,0,1,1,1,N,"Product"');
  Writeln(MyFile, 'A310,492,0,1,1,1,N,"Nett (mtr)"');

  //print the data
  //for IA round to whole numbers DL070601
  if LabelStru='IA' then
  begin
    GrossYards:=round(int(GrossLength*mtrTOyds*10+0.5)/10);
    AllowYards:=round(int(Allowance*mtrToyds*10+0.5)/10);
    NetYards:=round(int((GrossYards-AllowYards)*10+0.5)/10);
    YdsDigits:=0;
  end
  else
  begin
    GrossYards:=int(GrossLength*mtrTOyds*10+0.5)/10;
    AllowYards:=int(Allowance*mtrToyds*10+0.5)/10;
    NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
    YdsDigits:=1;
  end;
  NetMetres:=int((GrossLength-Allowance)*10+0.5)/10;

  Writeln(MyFile, 'A29,390,0,4,1,1,N,"'+ImperialWidthDescr+'"'); {3.5"}
  YdsString:=floattostrf(GrossYards,ffFixed,5,YdsDigits);
  Writeln(MyFile, 'A168,390,0,4,1,1,N,"'+YdsString+'"'); {164yrds}
  YdsString:=floattostrf(AllowYards,ffFixed,3,YdsDigits);
  Writeln(MyFile, 'A310,390,0,4,1,1,N,"'+YdsString+'"'); {Allow} //324
  YdsString:=floattostrf(NetYards,ffFixed,5,YdsDigits);
  Writeln(MyFile, 'A433,390,0,4,1,1,N,"'+YdsString+'"'); {Nett yrds}

  Writeln(MyFile, 'A29,140,0,5,1,1,N,"'+StyleDescr+'"');
  Writeln(MyFile, 'A29,234,0,5,1,1,N,"'+ColorDescr+'"');

  Writeln(MyFile, 'A29,324,0,4,1,1,N,"'+FormatDateTime('mmm dd, yyyy', DateManu)+'"');
  Writeln(MyFile, 'A310,324,0,4,1,1,N,"'+inttostr(Faults)+'"');

  Writeln(MyFile, 'A433,324,0,4,1,1,N,"'+inttostr(StripNo)+'"');
  Writeln(MyFile, 'A433,130,0,4,1,1,N,"'+PartNo+'"');
  Writeln(MyFile, 'A433,196,0,4,1,1,N,"'+inttostr(BoxNo)+'"');
  Writeln(MyFile, 'A433,258,0,4,1,1,N,"'+inttostr(LotNo)+'"');
  Writeln(MyFile, 'A310,450,0,4,1,1,N,"'+LabelDescr+'"'); //Product
  Writeln(MyFile, 'A310,515,0,4,1,1,N,"'+floattostrf(NetMetres,ffFixed,5,YdsDigits)+'"');
  Writeln(MyFile, 'B65,446,0,2,2,6,64,B,"19'+ZeroFill(RollNo,6)+'"');

  //EndLabel
  Writeln(MyFile, 'P1');
  CloseFile(MyFile);
end; //PrintC4P_HD


procedure TVBBarCodeForm.Print_VT(LabelDescr:string8;Qlty:string1; //labeldescr was string6 DL081001
      LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      MetricWidthDescr:string5;ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;NetLength:real;RollNo:integer;
      StyleDescr:string8;ColorDescr:string9;PartNo:string11;
      Heading:string25);
begin
  if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
    PrintUBI_VT(LabelDescr,Qlty,
      LotNo,
      BoxNo,DateManu,Faults,
      StripNo,
      MetricWidthDescr,ImperialWidthDescr,
      GrossLength,Allowance,
      NetLength,RollNo,StyleDescr,ColorDescr,PartNo,Heading)
  else if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
    PrintDMX_VT(LabelDescr,Qlty,
      LotNo,
      BoxNo,DateManu,Faults,
      StripNo,
      MetricWidthDescr,ImperialWidthDescr,
      GrossLength,Allowance,
      NetLength,RollNo,StyleDescr,ColorDescr,PartNo,Heading) //Style,Color,Part added DL031113
  else if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='C4P' then
    PrintC4P_VT(LabelDescr,Qlty,
      LotNo,
      BoxNo,DateManu,Faults,
      StripNo,
      MetricWidthDescr,ImperialWidthDescr,
      GrossLength,Allowance,
      NetLength,RollNo,StyleDescr,ColorDescr,PartNo,Heading);
end;

procedure TVBBarCodeForm.Print_HD(StyleDescr:string8;
      ColorDescr:string9;LabelDescr:string8; //labeldescr was string6 DL081001
      PartNo:string11;LotNo:longint;
      BoxNo:integer;DateManu:real;Faults:smallint;StripNo:smallint;
      ImperialWidthDescr:string4;
      GrossLength:real;Allowance:real;RollNo:integer;
      LabelStru:string2); //Added DL230899
begin
  if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
    PrintUBI_HD(
      StyleDescr,ColorDescr,LabelDescr,
      PartNo,LotNo,
      BoxNo,DateManu,
      Faults,StripNo,
      IMPERIALWIDTHDescr,
      GrossLength,Allowance,RollNo,LabelStru) //LabelStru added DL230899
  else if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
    PrintDMX_HD(
      StyleDescr,ColorDescr,LabelDescr,
      PartNo,LotNo,
      BoxNo,DateManu,
      Faults,StripNo,
      IMPERIALWIDTHDescr,
      GrossLength,Allowance,RollNo,LabelStru) //LabelStru added DL230899
  else if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='C4P' then
    PrintC4P_HD(
      StyleDescr,ColorDescr,LabelDescr,
      PartNo,LotNo,
      BoxNo,DateManu,
      Faults,StripNo,
      IMPERIALWIDTHDescr,
      GrossLength,Allowance,RollNo,LabelStru);
end;

procedure TVBBarCodeForm.OpenComPort2;
begin
  if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
  begin
    UBIComPort2.Open:=true;
    VBBarCodeForm.FetchString;    {get rid of characters in buffer}
  end
  else if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
    DMXComPort2.Open:=true
  else
    DMXComPort2.Open:=false;
end;

procedure TVBBarCodeForm.CloseComPort2;
begin
  if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
    UBIComPort2.Open:=false
  else
    DMXComPort2.Open:=false;
end;

procedure TVBBarCodeForm.FormCreate(Sender: TObject);
begin
//  VBParams.Open; - removed DL271098 now on main form
end;

end.
