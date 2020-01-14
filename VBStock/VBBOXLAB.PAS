unit Vbboxlab;
{note until 17/5/96 a carton was a box.  Code unchanged.  Only labels.}
{added include despatched cartons check box: DL030397}
//all the 'IA' ITA, Inc. additions added DL041013

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, DB, DBTables, AdPort, ExtCtrls, OoMisc;

type
  TVBBoxLabelForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ClearFormBtn: TButton;
    PrintLabelsBtn: TButton;
    CloseBitBtn: TBitBtn;
    EditStartBoxNo: TEdit;
    EditEndBoxNo: TEdit;
    CheckBoxNoQuery: TQuery;
    CheckBoxNoQueryBOXNO: TIntegerField;
    FindBoxesQuery: TQuery;
    FindBoxesQueryBOXNO: TIntegerField;
    FindBoxesQueryLABELDESCR: TStringField;
    FindBoxesQueryFAULTS: TSmallintField;
    FindBoxesQuerySTRIPNO: TSmallintField;
    FindBoxesQueryLOTNO: TIntegerField;
    FindBoxesQueryDATEMANU: TDateTimeField;
    FindBoxesQueryQLTY: TStringField;
    FindBoxesQueryMETRICLABELDESCR: TStringField;
    FindBoxesQueryIMPERIALWIDTH: TStringField;
    FindBoxesQueryGROSSLENGTH: TFloatField;
    FindBoxesQueryLONGLENGTH: TFloatField;
    DMXComPort2: TApdComPort;
    FindBoxesQueryMETRICWIDTH: TSmallintField;
    UBIComPort2: TApdComPort;
    ChangePrinter: TButton;
    Timer1: TTimer;
    BarCodeFaults: TButton;
    FindBoxesQueryALLOWANCE: TFloatField;
    FindBoxesQueryVBSTRU: TStringField;
    FindBoxesQueryLABELSTRU: TStringField;
    ScanOptionsBtn: TButton;
    InclDespChkBox: TCheckBox;
    FindBoxesQueryDESPNO: TIntegerField;
    FaultLengthBtn: TButton;
    vbParams: TTable;
    vbParamsBARCODEPRINTERTYPE: TStringField;
    FindBoxesQueryDESCR: TStringField;
    qryCustPart: TQuery;
    qryCustPartDESCR: TStringField;
    qryCustPartSTYLEDESCR: TStringField;
    qryCustPartPARTNO: TStringField;
    FindBoxesQueryLABELSTRUCUSTREF: TStringField;
    FindBoxesQueryVBCOL: TStringField;
    FindBoxesQueryVBFIN: TStringField;
    qryVBTypeClient: TQuery;
    qryVBTypeClientPARTNO: TStringField;
    qryVBTypeClientSTYLEDESCR: TStringField;
    qryVBTypeClientCOLORDESCR: TStringField;
    qryVBTypeClientVBSTRU: TStringField;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure ClearFormBtnClick(Sender: TObject);
    procedure PrintLabelsBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChangePrinterClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EditStartBoxNoExit(Sender: TObject);
    procedure EditEndBoxNoExit(Sender: TObject);
    procedure BarCodeFaultsClick(Sender: TObject);
    procedure ScanOptionsBtnClick(Sender: TObject);
    procedure FaultLengthBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    VBComPortClosed:boolean; //added DL191098
    LastBoxNo:integer;
    LastLotNo:longint;
    LastDateManu:real;
    LastMetricWidth:integer;
    LastMetricWidthDescr:string[5];
    LastImperialWidthDescr:string[5];
    LastLabelDescr:string[8];
    LastStyleDescr:string[8]; {added 1507096}
    LastColorDescr:string[9]; {added 1607096}
    LastLabelStru:string[2]; {added 1507096} //was string[1] DL230899
    LastPartNo:string[11]; {added 1507096} //modified from 5 to 11 DL260499
    LastVBStru:string[3]; //was 1 DL060901
    LastFaults:integer;
    {LastStripNo:integer;}
    LastQlty:string[1];
    {LastGrossLength:real;}
    LastLongLength:real;
    LastTotalFaults:integer;
    LastTotalGross:real;
    LastTotalAllow:real;
    LastStripNoString:string;
    LastHeading:string[25]; //added DL260499
    BarCodePrinterReady:boolean;
    procedure DMXPrintLabel; //test one
    procedure UBIPrintLabel_VT;
    procedure DMXPrintLabel_VT(LastLabel:boolean); //added DL191098
    procedure UBIPrintLabel_HD;
    procedure DMXPrintLabel_HD; //added DL031117
    procedure C4PPrintLabel_VT; //added DL031119
    procedure C4PPrintLabel_HD; //added DL031119
    procedure FetchString;
    procedure UBISendString(SendString:string);
    procedure AssignValues;
    {function CalcAllowance:real;}
    procedure PrintBarCodeFaults(Desc,BarCode:string);
  public
    { Public declarations }
  end;

var
  VBBoxLabelForm: TVBBoxLabelForm;

implementation

{$R *.DFM}

uses VBMain,VBUtils,AbortBx, Vbbarcde;

procedure TVBBoxLabelForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBBoxLabelForm.ClearFormBtnClick(Sender: TObject);
begin
  EditStartBoxNo.Clear;
  EditEndBoxNo.Clear;
  EditStartBoxNo.SetFocus;
end;

procedure TVBBoxLabelForm.DMXPrintLabel; //test procedure
var
  SendString:string;
  GrossYards,NetYards,AllowYards:real;
  YdsString:string;
  TempNetFloat:real;
  TempNetInt,TempLotNo:longint;
  TempLotNoStr,TempNetWidth,TempNet,TempFaults:string;
begin
  GrossYards:=int(LastTotalGross*mtrTOyds*10+0.5)/10;
  AllowYards:=int(LastTotalAllow*mtrTOyds*10+0.5)/10;
  NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
  TempNetFloat:=LastTotalGross-LastTotalAllow;
  TempNetInt:=trunc(TempNetFloat*10); {cast float to int}
  TempLotNo:=LastLotNo{-100000};
  TempLotNoStr:=ZeroFill(TempLotNo,3);
  TempNetWidth:=ZeroFill(LastMetricWidth,3);
  TempNet:=ZeroFill(TempNetInt,4);
  TempFaults:=ZeroFill(LastTotalFaults,2);
  {BarCodeForm.StartLabel(true); true for lastlabel}
//  DMXComPort2.Open:=true;
  SendString:=STX+'00210'+CR;
  DMXComPort2.PutString(SendString);
  SendString:=STX+'f200'+CR;
  {SendString:=STX+'f350'+CR; lastlabel}
  DMXComPort2.PutString(SendString);
  SendString:=STX+'L'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='D11'+CR;
  DMXComPort2.PutString(SendString);
  {draw the boxes}
  SendString:='1X11000'+'00850010'+'B067025001001'+CR; {3.5"}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01100010'+'B067030001001'+CR; {89 mm}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00850077'+'B072025001001'+CR; {150m}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01100077'+'B072030001001'+CR; {164yrds}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00850149'+'B067025001001'+CR; {Allow}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01100149'+'B067030001001'+CR; {Allow}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00850216'+'B080025001001'+CR; {Nett}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01100216'+'B080030001001'+CR; {Nett}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01400010'+'B139030001001'+CR; {Date}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01400149'+'B067030001001'+CR; {Faults}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01400216'+'B080030001001'+CR; {Slit No.}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01700010'+'B206060001001'+CR; {Product}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'01700216'+'B080030001001'+CR; {Blank box}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'02000216'+'B080030001001'+CR; {Lot #}
  DMXComPort2.PutString(SendString);
  SendString:='1X11000'+'00150010'+'B286070001001'+CR; {Bar Codes}
  DMXComPort2.PutString(SendString);
  {send the data}
  SendString:='191100102150020'+'Product'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100102170220'+'Lot #'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100101870220'+'Carton #'+CR;
  DMXComPort2.PutString(SendString);
  {SendString:='191100701800020'+'VTH100'+CR;}
  SendString:='191100701800020'+LastLabelDescr+' '+LastQlty+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100402000220'+inttostr(LastLotNo)+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100401700220'+inttostr(LastBoxNo)+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100101570020'+'Date Manu.'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100101570150'+'Faults'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100101570220'+'Strip'+CR;
  DMXComPort2.PutString(SendString);
  {SendString:='191100401400020'+'MAR 01, 1996'+CR; {date manu}
  SendString:='191100401400020'+
    FormatDateTime('mmm dd, yyyy', LastDateManu)+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100401400150'+inttostr(LastTotalFaults)+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100401400220'+LastStripNoString+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100101270020'+'Width'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100101270080'+'Gross'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100101270150'+'Allowance'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100101270220'+'Nett'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100401100020'+LastMetricWidthDescr+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100401100080'+floattostrF(LastTotalGross,
    ffFixed,5,1)+'mtr'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='191100401100150'+floattostrF(LastTotalAllow,ffFixed,5,1)+' mtr'+CR;
  DMXComPort2.PutString(SendString);

  SendString:='191100401100220'+floattostrf(TempNetFloat,ffFixed,5,1)+' mtr'+CR; {}
  DMXComPort2.PutString(SendString);
  SendString:='191100400900020'+LastImperialWidthDescr+CR;
  DMXComPort2.PutString(SendString);

  YdsString:=floattostrf(GrossYards,ffFixed,5,1);
  SendString:='191100400900080'+YdsString+'yds'+CR;
  DMXComPort2.PutString(SendString);
  YdsString:=floattostrf(AllowYards,ffFixed,3,1);
  SendString:='191100400900150'+YdsString+' yds'+CR;
  DMXComPort2.PutString(SendString);
  YdsString:=floattostrf(NetYards,ffFixed,5,1);
  SendString:='191100400900220'+YdsString+' yds'+CR;
  DMXComPort2.PutString(SendString);
  {barcode}
  {SendString:='1A3102000500020'+'VTH100001089148002'+CR;}

  SendString:='1A3102000500020'+
    LastLabelDescr+TempLotNoStr+TempNetWidth+TempNet+TempFaults+CR;
  DMXComPort2.PutString(SendString);
  {use label 14 for strip (roll), label 15 for box}
  {SendString:='1A3102000200020'+'140000010101'+CR;}
  SendString:='1A3102000200020'+'15'+
    ZeroFill(LastBoxNo,6)+CR;
  DMXComPort2.PutString(SendString);
  {EndLabel;}
  SendString:='E'+CR;
  DMXComPort2.PutString(SendString);
end;

procedure TVBBoxLabelForm.FetchString;
var
  Cx:char;
  ix:longint;
  sx:string;
begin
  {ix:=0;}
  sx:='';
//while UBIComPort2.CharReady do  //JT250698  use Vbbarcde's to prevent clash
  while {VBBarCodeForm.} UBIComPort2.CharReady do
  begin
    {inc(ix);}
//  Cx := UBIComPort2.GetChar;               //JT250698
    Cx := {VBBarCodeForm.} UBIComPort2.GetChar;
    sx:=sx+cx;
  end;
  {build in a delay}
  {ShowMessage(sx);}
  for ix:=1 to 100000 do; {!!!!!}
end;

procedure TVBBoxLabelForm.UBISendString(SendString:string);
{var
  sx1:string;}
begin
//UBIComPort2.PutString(SendString);               //JT250698
  {VBBarCodeForm.} UBIComPort2.PutString(SendString);
  FetchString;
  {sx1:=SendString+'#13#10#13#10''Ok''#13#10';
  if sx<>sx1 then
    ShowMessage('Printer Error: '+sx1);}
end;

procedure TVBBoxLabelForm.UBIPrintLabel_VT;
const
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  SendString:string;
  GrossYards,NetYards,AllowYards:real;
  YdsString:string;
  TempNetFloat:real;
  TempNetInt,TempLotNo:longint;
  TempLotNoStr,TempNetWidth,TempNet,TempFaults:string;
begin
  GrossYards:=int(LastTotalGross*mtrTOyds*10+0.5)/10;
  AllowYards:=int(LastTotalAllow*mtrTOyds*10+0.5)/10;
  NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
  TempNetFloat:=LastTotalGross-LastTotalAllow;
  TempNetInt:=trunc(TempNetFloat*10); {cast float to int}
  TempLotNo:=LastLotNo{-100000};
  TempLotNoStr:=ZeroFill(TempLotNo,3);
  TempNetWidth:=ZeroFill(LastMetricWidth,3);
  TempNet:=ZeroFill(TempNetInt,4);
  TempFaults:=ZeroFill(LastTotalFaults,2);
  SendString:='';
  SendString:='CLL'+CR;
  UBISendString(SendString);

  {draw the boxes}
  SendString:='FONT "SW030RSN.1"'+CR;
  UBISendString(SendString);

  {test: write Hello Hello in the middle of the label}
  {SendString:='PRPOS 200,300'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "HELLO, HELLO!"'+CR;
  UBISendString(SendString);}

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
  SendString:='PRPOS 16,366'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 568,3'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 416,428'+CR; //was ,430 DL250499
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
  SendString:='PRPOS 16,428'+CR; {366 first bit} //added DL250499 was,398
  UBISendString(SendString); //added DL250499
  SendString:='PRLINE 400,3'+CR; {568} //added DL250499
  UBISendString(SendString); //added DL250499
  SendString:='PRPOS 292,110'+CR; //added DL250499 416,110
  UBISendString(SendString); //added DL250499
  SendString:='PRLINE 290,3'+CR; //added DL250499 was 168, xx
  UBISendString(SendString); //added DL250499

  {print the vertical lines}
  SendString:='DIR 4'+CR; {4 is up=vertical line}
  UBISendString(SendString);
  SendString:='PRPOS 16,46'+CR; {x,y} {46,46}
  UBISendString(SendString); {send and fetch}
  SendString:='PRLINE 514,3'+CR; {length,line weight}
  UBISendString(SendString);
  SendString:='PRPOS 148,174'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 128,3'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 292,174'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 192,3'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 416,174'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 320,3'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 584,46'+CR;
  UBISendString(SendString);
  SendString:='PRLINE 514,3'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 292,46'+CR; //added DL250499 xx
  UBISendString(SendString); //added DL250499
  SendString:='PRLINE 160,3'+CR; //added DL250499
  UBISendString(SendString); //added DL250499

  {print the headings}
  SendString:='DIR 1'+CR; {horizontal}
  UBISendString(SendString);
  SendString:='FONT "SW020BSN.1"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,346'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Date Manu."'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,474'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Style"'+CR; //was product DL250499
  UBISendString(SendString);
  SendString:='PRPOS 24,410'+CR; //added DL250499 was ,378
  UBISendString(SendString); //added DL250499
  SendString:='PRTXT "Color"'+CR; //added DL250499
  UBISendString(SendString); //added DL250499
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
  SendString:='PRTXT "Width (mm)"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 156,282'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Gross (mtr)"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 300,282'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Allowance"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,282'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Nett (mtr)"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 300,346'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Faults"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,346'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Strip #s"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,410'+CR; //was ,412 DL250499
  UBISendString(SendString);
  SendString:='PRTXT "Carton #"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,474'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Lot #"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 300,154'+CR; //added DL250499
  UBISendString(SendString); //added DL250499
  SendString:='PRTXT "Product"'+CR; //added DL250499
  UBISendString(SendString); //added DL250499
  SendString:='PRPOS 300,90'+CR; //added DL250499 was 424
  UBISendString(SendString); //added DL250499
  SendString:='PRTXT "Part #"'+CR; //added DL250499
  UBISendString(SendString); //added DL250499
  {print Republic of South Africa, changed to VERTICAL REALITY DL060598}
  SendString:='FONT "SW050RSN.1"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,498'+CR;
  UBISendString(SendString);
  //SendString:='PRTXT "VERTICAL REALITY"'+CR; removed DL260499
  SendString:='PRTXT "'+LastHeading+'"'+CR; //added DL260499
  UBISendString(SendString);

  {print the data}
  SendString:='DIR 1'+CR; {horizontal}
  UBISendString(SendString);
  SendString:='FONT "SW080BSN.1"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,414'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+LastStyleDescr+' '+LastQlty+'"'+CR; //was LastLabelDescr DL250499
  UBISendString(SendString);
  SendString:='PRPOS 24,350'+CR; //added DL250499
  UBISendString(SendString); //added DL250499
  SendString:='PRTXT "'+LastColorDescr+'"'+CR; //added DL250499
  UBISendString(SendString); //added DL250499
  SendString:='FONT "SW050RSN.1"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,430'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(LastLotNo)+'"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,366'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(LastBoxNo)+'"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,302'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+
    FormatDateTime('mmm dd, yyyy', LastDateManu)+'"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 300,302'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(LastTotalFaults)+'"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,302'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+LastStripNoString+'"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,238'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+LastMetricWidthDescr+'"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 156,238'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+floattostrF(LastTotalGross,
    ffFixed,5,1)+'"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 300,238'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+floattostrF(LastTotalAllow,ffFixed,5,1)+'"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,238'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+floattostrf(TempNetFloat,ffFixed,5,1)+'"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 24,174'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+LastImperialWidthDescr+'"'+CR;
  UBISendString(SendString);
  YdsString:=floattostrf(GrossYards,ffFixed,5,1);
  SendString:='PRPOS 156,174'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+YdsString+'"'+CR;
  UBISendString(SendString);
  YdsString:=floattostrf(AllowYards,ffFixed,3,1);
  SendString:='PRPOS 300,174'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+YdsString+'"'+CR;
  UBISendString(SendString);
  YdsString:=floattostrf(NetYards,ffFixed,5,1);
  SendString:='PRPOS 424,174'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+YdsString+'"'+CR;
  UBISendString(SendString);

  SendString:='PRPOS 300,110'+CR; //added DL250499
  UBISendString(SendString); //added DL250499
  SendString:='PRTXT "'+LastLabelDescr+'"'+CR; //added DL250499
  UBISendString(SendString); //added DL250499

  SendString:='PRPOS 300,46'+CR; //added DL250499
  UBISendString(SendString); //added DL250499
  SendString:='PRTXT "'+LastPartNo+'"'+CR; //added DL250499
  UBISendString(SendString); //added DL250499

  {print the barcode}
  {TempNetFloat:=int(strtofloat(ShowNet.Text)*10);
  TempNetInt:=trunc(TempNetFloat); {cast float to int}
  {TempLotNo:=VBRcptLotNo.AsInteger{-100000};
  {TempLotNoStr:=ZeroFill(TempLotNo,3);
  TempNetWidth:=ZeroFill(VBRcptMetricWidth.AsInteger,3);
  TempNet:=ZeroFill(TempNetInt,4);
  TempFaults:=ZeroFill(VBRcptFaults.AsInteger,2);}
  {SendString:='PRBAR "VTH100001089148002"'+CR;}
  {SendString:='PRPOS 40,152'+CR;
  UBISendString(SendString);
  SendString:='BARRATIO 3,1'+CR;
  UBISendString(SendString);
  SendString:='BARHEIGHT 20'+CR;
  UBISendString(SendString);
  SendString:='BARMAG 2'+CR;
  UBISendString(SendString);
  SendString:='BARTYPE "CODE39"'+CR;
  UBISendString(SendString);

  SendString:='PRBAR "'+
    LastLabelDescr+TempLotNoStr+'"'+CR;
  UBISendString(SendString);}

  {SendString:='PRPOS 40,112'+CR;
  UBISendString(SendString);
  SendString:='BARRATIO 3,1'+CR;
  UBISendString(SendString);
  SendString:='BARHEIGHT 20'+CR;
  UBISendString(SendString);
  SendString:='BARMAG 2'+CR;
  UBISendString(SendString);
  SendString:='BARTYPE "CODE39"'+CR;
  UBISendString(SendString);
  SendString:='PRBAR "'+
    TempNetWidth+TempNet+TempFaults+'"'+CR;
  UBISendString(SendString);}

  {use label 19 (was 14) for strip (roll), label 15 for box}
  SendString:='PRPOS 60,48'+CR; //was 120,48 DL250499
  UBISendString(SendString);
  SendString:='BARRATIO 3,1'+CR;
  UBISendString(SendString);
  SendString:='BARHEIGHT 80'+CR;
  UBISendString(SendString);
  SendString:='BARMAG 2'+CR;
  UBISendString(SendString);
  SendString:='MAG 1,1'+CR;
  UBISendString(SendString);
  SendString:='BARTYPE "INT2OF5"'+CR;
  UBISendString(SendString);
  SendString:='BARFONT #2,"SW030RSN.1",5,1,1 ON'+CR;
  UBISendString(SendString);
  SendString:='PRBAR "15'+
    ZeroFill(LastBoxNo,6)+'"'+CR;
  UBISendString(SendString);

  SendString:='PRINTFEED'+CR;
  UBISendString(SendString);
end;

procedure TVBBoxLabelForm.UBIPrintLabel_HD;
const
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  SendString:string;
  GrossYards,NetYards,AllowYards,NetMetres:real;
  YdsString:string;
  YdsDigits:integer;
  TempNetFloat:real;
  TempNetInt,TempLotNo:longint;
  TempLotNoStr,TempNetWidth,TempNet,TempFaults:string;
begin
  NetMetres:=LastTotalGross-LastTotalAllow;

  //for IA round to whole numbers DL070601
  if LastLabelStru='IA' then
  begin
    GrossYards:=int(LastTotalGross*mtrTOyds*10+0.5)/10;
    AllowYards:=int(LastTotalAllow*mtrTOyds*10+0.5)/10;
    NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
    YdsDigits:=0;
  end
  else
  begin
    GrossYards:=int(LastTotalGross*mtrTOyds*10+0.5)/10;
    AllowYards:=int(LastTotalAllow*mtrTOyds*10+0.5)/10;
    NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
    YdsDigits:=1;
  end;

  TempNetFloat:=LastTotalGross-LastTotalAllow;
  TempNetInt:=trunc(TempNetFloat*10); {cast float to int}
  TempLotNo:=LastLotNo{-100000};
  TempLotNoStr:=ZeroFill(TempLotNo,3);
  TempNetWidth:=ZeroFill(LastMetricWidth,3);
  TempNet:=ZeroFill(TempNetInt,4);
  TempFaults:=ZeroFill(LastTotalFaults,2);

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
  SendString:='PRPOS 416,110'+CR; {added DL151096}
  UBISendString(SendString); {added DL151096}
  SendString:='PRLINE 168,3'+CR; {added DL151096}
  UBISendString(SendString); {added DL151096}
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
  UBISendString(SendString);

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
  SendString:='PRPOS 416,46'+CR; {was ,174 DL151096}
  UBISendString(SendString);
  SendString:='PRLINE 448,3'+CR; {was 320, DL151096} //xx was 494 DL 230899
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
  SendString:='PRPOS 300,282'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Faults"'+CR;
  UBISendString(SendString);
  {SendString:='PRPOS 424,282'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Strip #"'+CR;
  UBISendString(SendString);}
  SendString:='PRPOS 424,346'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Lot #"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,412'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Carton #"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,474'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "Part #"'+CR;
  UBISendString(SendString);
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
  UBISendString(SendString);
  SendString:='PRPOS 20,498'+CR;
  UBISendString(SendString);

  if (LastLabelStru='LH') then //added DL230899
    SendString:='PRTXT "Levolor Home Fashions"'+CR
  else if (LastLabelStru='HD') then //if added DL041013
    SendString:='PRTXT "Hunter Douglas Verticals"'+CR
  else
    SendString:='PRTXT "ITA, Inc."'+CR; //added DL041013
  UBISendString(SendString);

  {print the data}
  SendString:='DIR 1'+CR; {horizontal}
  UBISendString(SendString);
  SendString:='FONT "SW080BSN.1"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 20,402'+CR; {382}
  UBISendString(SendString);
  SendString:='PRTXT "'+LastStyleDescr+'"'+CR; {"FRESCO"}
  UBISendString(SendString);
  SendString:='PRPOS 20,306'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+LastColorDescr+'"'+CR; {"CHABLIS"}
  UBISendString(SendString);
  SendString:='FONT "SW050RSN.1"'+CR;
  UBISendString(SendString);
  SendString:='PRPOS 424,430'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+LastPartNo+'"'+CR; {"94103"}
  UBISendString(SendString);
  SendString:='PRPOS 424,366'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(LastBoxNo)+'"'+CR; {"1694"}
  UBISendString(SendString);
  SendString:='PRPOS 424,302'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(LastLotNo)+'"'+CR; {"265001"}
  UBISendString(SendString);
  SendString:='PRPOS 20,238'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+
    FormatDateTime('mmm dd, yyyy', LastDateManu)+
    '"'+CR; {"Jun 20, 1996"}
  UBISendString(SendString);
  SendString:='PRPOS 300,238'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+inttostr(LastTotalFaults)+'"'+CR; {faults}
  UBISendString(SendString);
  {SendString:='PRPOS 424,238'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+LastStripNoString+'"'+CR;
  UBISendString(SendString);}
  SendString:='PRPOS 20,174'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+LastImperialWidthDescr+'"'+CR; {"3.5"}
  UBISendString(SendString);
  YdsString:=floattostrf(GrossYards,ffFixed,5,YdsDigits);
  SendString:='PRPOS 156,174'+CR;
  UBISendString(SendString);
  SendString:='PRTXT "'+YdsString+'"'+CR; {gross yards}
  UBISendString(SendString);
  SendString:='PRPOS 300,174'+CR;
  UBISendString(SendString);
  YdsString:=floattostrf(AllowYards,ffFixed,5,YdsDigits);
  SendString:='PRTXT "'+YdsString+'"'+CR; {allowance}
  UBISendString(SendString);
  SendString:='PRPOS 424,174'+CR;
  UBISendString(SendString);
  YdsString:=floattostrf(NetYards,ffFixed,5,YdsDigits);
  SendString:='PRTXT "'+YdsString+'"'+CR; {net yards}
  UBISendString(SendString);
  SendString:='PRPOS 424,110'+CR; {added DL151096}
  UBISendString(SendString);
  SendString:='PRTXT "'+LastLabelDescr+'"'+CR; {net yards}
  UBISendString(SendString);
  SendString:='PRPOS 424,46'+CR; {added DL151096}
  UBISendString(SendString);
  SendString:='PRTXT "'+floattostrf(NetMetres,ffFixed,5,YdsDigits)+'"'+CR; {net yards}
  UBISendString(SendString);

  {use label 19 (was 14) for strip (roll), label 15 for box}
  SendString:='PRPOS 120,48'+CR;
  UBISendString(SendString);
  SendString:='BARFONT #2,"SW030RSN.1",5,1,1 ON'+CR;
  UBISendString(SendString);
  SendString:='BARRATIO 3,1'+CR;
  UBISendString(SendString);
  SendString:='BARHEIGHT 80'+CR;
  UBISendString(SendString);
  SendString:='BARMAG 2'+CR;
  UBISendString(SendString);
  SendString:='MAG 1,1'+CR;
  UBISendString(SendString);
  SendString:='BARTYPE "INT2OF5"'+CR; {was CODE39}
  UBISendString(SendString);
  SendString:='PRBAR "15'+
    ZeroFill(LastBoxNo,6)+'"'+CR;
  UBISendString(SendString);

  SendString:='PRINTFEED'+CR;
  UBISendString(SendString);
end;

procedure TVBBoxLabelForm.AssignValues;
var
  StyleFilled:boolean; //added DL260700
begin
  LastBoxNo:=FindBoxesQueryBoxNo.AsInteger;
  LastLotNo:=FindBoxesQueryLotNo.AsInteger;
  LastDateManu:=FindBoxesQueryDateManu.AsFloat;
  LastMetricWidth:=FindBoxesQueryMetricWidth.AsInteger;
  LastMetricWidthDescr:=FindBoxesQueryMetricLabelDescr.AsString;
  LastImperialWidthDescr:=FindBoxesQueryImperialWidth.AsString;

  //added this if statement DL260700
  StyleFilled:=false;
  if (FindBoxesQueryLabelStru.AsString='CU') and (not FindBoxesQueryLABELSTRUCUSTREF.IsNull) then //override what's found DL260700
  begin
    qryCustPart.Close;
    qryCustPart.ParamByName('CustRef').AsString:=FindBoxesQueryLABELSTRUCUSTREF.AsString;
    qryCustPart.ParamByName('VBStru').AsString:=FindBoxesQueryVBStru.AsString;
    qryCustPart.ParamByName('VBCol').AsString:=FindBoxesQueryVBCOL.AsString;
    qryCustPart.ParamByName('VBFin').AsString:=FindBoxesQueryVBFIN.AsString;
    qryCustPart.ParamByName('VBWidth').AsInteger:=FindBoxesQueryMetricWidth.AsInteger;
    qryCustPart.Open;
    if not qryCustPartDESCR.IsNull then
    begin
      StyleFilled:=true;
      LastLabelStru:='VT';
      LastPartNo:=qryCustPartPARTNO.AsString;
      LastStyleDescr:=qryCustPartSTYLEDESCR.AsString;
      LastColorDescr:=qryCustPartDESCR.AsString;
      LastLabelDescr:='VT'+FindBoxesQueryVBStru.AsString+FindBoxesQueryVBCOL.AsString;
      LastHeading:='Vrede Fabrics'; //was Vertical Reality: DL030501
    end;
  end;
  if not StyleFilled then
  begin //originally here
    //qryVBTypeClient query added DL260700
    qryVBTypeClient.Close;
    qryVBTypeClient.ParamByName('VBStru').AsString:=FindBoxesQueryVBStru.AsString;
    qryVBTypeClient.ParamByName('VBCol').AsString:=FindBoxesQueryVBCOL.AsString;
    qryVBTypeClient.ParamByName('VBFin').AsString:=FindBoxesQueryVBFIN.AsString;
    qryVBTypeClient.ParamByName('LabelStru').AsString:=FindBoxesQueryLabelStru.AsString;
    qryVBTypeClient.Open;
    if qryVBTypeClientVBSTRU.IsNull then
    begin //shouldn't happen, but just in case
      LastPartNo:='';
      LastStyleDescr:='';
      LastColorDescr:='';
    end
    else
    begin
      LastPartNo:=qryVBTypeClientPARTNO.AsString;
      LastStyleDescr:=qryVBTypeClientSTYLEDESCR.AsString;
      LastColorDescr:=qryVBTypeClientCOLORDESCR.AsString;
    end;
    LastLabelStru:=FindBoxesQueryLabelStru.AsString;
    LastLabelDescr:=FindBoxesQueryLabelDescr.AsString;
    LastHeading:=FindBoxesQueryDescr.AsString; //added DL260499
  end;

  LastVBStru:=FindBoxesQueryVBStru.AsString;
  {LastFaults:=FindBoxesQueryFaults.AsInteger;
  LastStripNo:=FindBoxesQueryStripNo.AsInteger;}
  LastQlty:=FindBoxesQueryQlty.AsString;
  {LastGrossLength:=FindBoxesQueryGrossLength.AsFloat;}
  {LastLongLength:=FindBoxesQueryLongLength.AsFloat;}
  LastTotalFaults:=0;
  LastTotalGross:=0;
  LastTotalAllow:=0;
  LastStripNoString:='';
end;

{function TVBBoxLabelForm.CalcAllowance:real;
begin
  LastLongLength:=0;
  if LastFaults<=6 then
    CalcAllowance:=LastFaults+LastLongLength
  else
    if LastFaults>=11 then
      CalcAllowance:=(LastFaults*2)+LastLongLength
    else
      CalcAllowance:=(LastFaults*1.5)+LastLongLength;
end;}

procedure TVBBoxLabelForm.PrintLabelsBtnClick(Sender: TObject);
begin
//VBBarCodeForm.UBIComPort2.Open := False;  //added JT240698  prevent port usage clash
  Timer1.Enabled:=true; //added DL031113
  
  PrinterAborted:=false; {added DL250897}
  LastBoxNo:=0;
  if (EditStartBoxNo.Text='') or (EditStartBoxNo.Text='') then
    raise Exception.Create('Please enter starting and ending box numbers');
  if (strtoint(EditEndBoxNo.Text)<strtoint(EditStartBoxNo.Text)) then
    raise Exception.Create('End box number cannot be less than start box number');
  AbortForm.Show; {added DL250897}
  FindBoxesQuery.Active:=false;
  FindBoxesQuery.Params[0].AsInteger:=strtoint(EditStartBoxNo.Text);
  FindBoxesQuery.Params[1].AsInteger:=strtoint(EditEndBoxNo.Text);
  FindBoxesQuery.Active:=true;
  FindBoxesQuery.First;
  while not FindBoxesQuery.eof do
  begin
    Application.ProcessMessages; {added DL250897}
    if PrinterAborted then {if and contents added DL250897}
    begin
      AbortForm.Close;
      EditStartBoxNo.SetFocus;
      Exit;
    end;
    {ShowMessage(FindBoxesQueryBoxNo.AsString);}
    if (not InclDespChkBox.Checked) then {leave out this box if despatched}
      if FindBoxesQueryDespNo.Value<>0 then
      begin {if statement and contents added DL:3/3/97}
        FindBoxesQuery.Next;
        continue;
      end;
    if LastBoxNo=0 then {first time}
      AssignValues;
    if LastBoxNo<>FindBoxesQueryBoxNo.AsInteger then
    begin
      if ChangePrinter.Caption='DMX' then
        DMXPrintLabel //test label
      else
      begin
        //15/7/96 DL Print the Hunter Douglas or Levolor label
        if (LastLabelStru='HD') or (LastLabelStru='LH') or (LastLabelStru='IA') then //IA added DL041013
        begin
          if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
            UBIPrintLabel_HD
          else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
            DMXPrintLabel_HD //added DL031117
          else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='C4P' then
            C4PPrintLabel_HD; //added DL031117
        end
        else {as normal - for Vrede Textiles}
        begin
          if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
            UBIPrintLabel_VT
          else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
            DMXPrintLabel_VT(false)
          else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='C4P' then
            C4PPrintLabel_VT;
        end;
      end;
      {delay until label has finished printing before sending next one}
      BarCodePrinterReady:=false;
      while not BarCodePrinterReady do
        Application.ProcessMessages;
      AssignValues;
    end;
    LastFaults:=FindBoxesQueryFaults.AsInteger;
    LastLongLength:=FindBoxesQueryLongLength.AsFloat;
    LastTotalFaults:=LastTotalFaults+LastFaults;
    LastTotalGross:=LastTotalGross+FindBoxesQueryGrossLength.AsFloat;
    LastTotalAllow:=LastTotalAllow+FindBoxesQueryAllowance.AsFloat;{CalcAllowance}
    if LastLabelStru='VT' then
    begin
      if LastStripNoString='' then
        LastStripNoString:=FindBoxesQueryStripNo.AsString
      else
        LastStripNoString:=LastStripNoString+','+FindBoxesQueryStripNo.AsString;
    end;
    FindBoxesQuery.Next;
  end; {while not FindBoxesQuery.eof do}
  if LastBoxNo<>0 then
  begin
    if ChangePrinter.Caption='DMX' then
      DMXPrintLabel //test printout
    else
    begin
      //15/7/96 DL Print the Hunter Douglas or Levolor label
      if (LastLabelStru='HD') or (LastLabelStru='LH')  or (LastLabelStru='IA') then //IA added DL041013
      begin
        if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
          UBIPrintLabel_HD
        else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
          DMXPrintLabel_HD //added DL031117
        else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='C4P' then
          C4PPrintLabel_HD; //added DL031119
      end
      else {as normal - for Vrede Textiles}
      begin
        if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
          UBIPrintLabel_VT
        else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
          DMXPrintLabel_VT(true) //LastLabel = true
        else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='C4P' then
          C4PPrintLabel_VT;
      end;
    end;
  end;
  AbortForm.Close; {added DL250897}
  EditStartBoxNo.SetFocus;
end;

procedure TVBBoxLabelForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
    UBIComPort2.Open:=false
  else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
    DMXComPort2.Open:=false
  else
  begin
    UBIComPort2.Open:=false;
    DMXComPort2.Open:=false;
  end;
  if VBComPortClosed then
  begin
    if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
      VBBarCodeForm.UBIComPort2.Open:=true
    else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
      VBBarCodeForm.DMXComPort2.Open:=true
    else
    begin
      VBBarCodeForm.UBIComPort2.Open:=false;
      VBBarCodeForm.DMXComPort2.Open:=false;
    end;
  end;
  qryCustPart.Close; //added DL260700
  vbParams.Close;
  CheckBoxNoQuery.Close; //added DL260700
  FindBoxesQuery.Close; //added DL260700
  qryCustPart.Close; //added DL260700
  qryVBTypeClient.Close; //added DL260700
  VBBoxLabelForm.Release;
end;

procedure TVBBoxLabelForm.ChangePrinterClick(Sender: TObject);
begin
  if ChangePrinter.Caption='DMX' then
    ChangePrinter.Caption:='UBI'
  else
    ChangePrinter.Caption:='DMX';
end;

procedure TVBBoxLabelForm.Timer1Timer(Sender: TObject);
begin
  BarCodePrinterReady:=true;
end;

procedure TVBBoxLabelForm.EditStartBoxNoExit(Sender: TObject);
begin
  if EditStartBoxNo.Text<>'' then
  begin
    CheckBoxNoQuery.Active:=false;
    CheckBoxNoQuery.Params[0].AsInteger:=strtoint(EditStartBoxNo.Text);
    CheckBoxNoQuery.Active:=true;
    with CheckBoxNoQuery.Fields[0] do
      if IsNull then
      begin
        ShowMessage('Box does not exist');
        EditStartBoxNo.Clear;
        EditStartBoxNo.SetFocus;
        Abort;
      end;
  end;
end;

procedure TVBBoxLabelForm.EditEndBoxNoExit(Sender: TObject);
begin
  if EditEndBoxNo.Text<>'' then
  begin
    CheckBoxNoQuery.Active:=false;
    CheckBoxNoQuery.Params[0].AsInteger:=strtoint(EditEndBoxNo.Text);
    CheckBoxNoQuery.Active:=true;
    with CheckBoxNoQuery.Fields[0] do
      if IsNull then
      begin
        ShowMessage('Box does not exist');
        EditEndBoxNo.Clear;
        EditEndBoxNo.SetFocus;
        Abort;
      end;
  end;
end;

procedure TVBBoxLabelForm.PrintBarCodeFaults(Desc,BarCode:string);
var
  SendString:string;
  MyFile: TextFile; //added DL040307
begin
  //modified method DL040307 to be able to print to UBI or C4P printer
  if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
  begin
    SendString:='';
    SendString:='CLL'+CR;
    UBISendString(SendString);

    SendString:='FONT "SW030RSN.1"'+CR;
    UBISendString(SendString);
    SendString:='DIR 1'+CR;
    UBISendString(SendString);
    SendString:='PRPOS 64,110'+CR;
    UBISendString(SendString);
    SendString:='PRTXT "'+Desc+'"'+CR; {SMALL SHORT FAULT}
    UBISendString(SendString);

    SendString:='PRPOS 114,156'+CR;
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
    SendString:='PRBAR "'+BarCode+'"'+CR; {12345678900011}
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
    Writeln(MyFile, 'A65,396,0,1,2,2,N,"'+Desc+'"'); //was 0,2,3,3 DL040413
    Writeln(MyFile, 'B65,446,0,2,2,6,64,B,"'+BarCode+'"');
    //EndLabel
    Writeln(MyFile, 'P1');
    CloseFile(MyFile);
  end;
end;

procedure TVBBoxLabelForm.BarCodeFaultsClick(Sender: TObject);
{var
  SendString:string;}
begin
  Timer1.Enabled:=true; //added DL040307
  CloseBitBtn.Enabled:=false;
  try //try finally block added DL040307
    PrintBarCodeFaults('WEFT FAULT','12345678900001');
    BarCodePrinterReady:=false;
    while not BarCodePrinterReady do
      Application.ProcessMessages;
    PrintBarCodeFaults('WARP FAULT','12345678900002');
    BarCodePrinterReady:=false;
    while not BarCodePrinterReady do
      Application.ProcessMessages;
    PrintBarCodeFaults('COLOUR FAULT','12345678900007');
    BarCodePrinterReady:=false;
    while not BarCodePrinterReady do
      Application.ProcessMessages;
    PrintBarCodeFaults('MISSING PIC','12345678900008');
    BarCodePrinterReady:=false;
    while not BarCodePrinterReady do
      Application.ProcessMessages;
    PrintBarCodeFaults('YARN FAULT','12345678900003');
    BarCodePrinterReady:=false;
    while not BarCodePrinterReady do
      Application.ProcessMessages;
    PrintBarCodeFaults('SLUB IN YARN','12345678900004');
    BarCodePrinterReady:=false;
    while not BarCodePrinterReady do
      Application.ProcessMessages;
    PrintBarCodeFaults('TWO PICS','12345678900005');
    BarCodePrinterReady:=false;
    while not BarCodePrinterReady do
      Application.ProcessMessages;
    PrintBarCodeFaults('FINISHING FAULT','12345678900006');
    BarCodePrinterReady:=false;
    while not BarCodePrinterReady do
      Application.ProcessMessages;
    PrintBarCodeFaults('MISSING END','12345678900009');
    BarCodePrinterReady:=false;
    while not BarCodePrinterReady do
      Application.ProcessMessages;
    PrintBarCodeFaults('OIL DROP (OTHER)','12345678900010');
    BarCodePrinterReady:=false;
    while not BarCodePrinterReady do
      Application.ProcessMessages;
  finally
    Timer1.Enabled:=false; //added DL040307
    CloseBitBtn.Enabled:=true;
  end;
end;

procedure TVBBoxLabelForm.ScanOptionsBtnClick(Sender: TObject);
{var
  SendString:string;}
begin
  CloseBitBtn.Enabled:=false;

  PrintBarCodeFaults('YES','99000001');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('NO','99000002');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('STOCK TAKE','99000003');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('PALLETISE','99000004');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('QUIT','99000000');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('SUMMARY','99000005');

  CloseBitBtn.Enabled:=true;
end;

procedure TVBBoxLabelForm.FaultLengthBtnClick(Sender: TObject);
begin
  CloseBitBtn.Enabled:=false;

  PrintBarCodeFaults('SMALL SHORT FAULT','12345678900011');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('WIDE SHORT FAULT,TOTAL WIDTH','12345678900020');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('SMALL LONG BEGIN FAULT', '12345678900012');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('SMALL LONG END FAULT','12345678900013');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('WIDE LONG BEGIN FAULT,TOTAL WIDTH','12345678900021');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('WIDE LONG END FAULT,TOTAL WIDTH','12345678900022');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('LEFT EDGE WIDE SHORT FAULT','12345678900014');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('RIGHT EDGE WIDE SHORT FAULT','12345678900015');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('LEFT EDGE WIDE LONG BEGIN FAULT','12345678900016');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('RIGHT EDGE WIDE LONG BEGIN FAULT','12345678900017');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('LEFT EDGE WIDE LONG END FAULT','12345678900018');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;
  PrintBarCodeFaults('RIGHT EDGE WIDE LONG END FAULT','12345678900019');
  BarCodePrinterReady:=false;
  while not BarCodePrinterReady do
    Application.ProcessMessages;

  CloseBitBtn.Enabled:=true;
end;

procedure TVBBoxLabelForm.FormShow(Sender: TObject);
begin
  Timer1.Enabled:=false;
  if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then //UBI faster than DMX DL031113
    Timer1.Interval:=3500 //delay between labels
  else if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
    Timer1.Interval:=7000
  else if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='C4P' then //C4P the fastest
    Timer1.Interval:=2500;

  VBComPortClosed:=false;
  if VBBarCodeForm.UBIComPort2.Open or VBBarCodeForm.DMXComPort2.Open then
  begin
    VBBarCodeForm.UBIComPort2.Open:=false;
    VBBarCodeForm.DMXComPort2.Open:=false;
    VBComPortClosed:=true;
  end;
  vbParams.Open;
  if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
  begin
    if not UBIComPort2.Open then
      UBIComPort2.Open:=true;
//    VBBarCodeForm.FetchString;    {get rid of characters in buffer}
  end
  else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
  begin
    if not DMXComPort2.Open then
      DMXComPort2.Open:=true;
  end
  else
  begin
    UBIComPort2.Open:=false;
    DMXComPort2.Open:=false;
  end;
end;

procedure TVBBoxLabelForm.DMXPrintLabel_VT(LastLabel:boolean);
const
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  SendString:string;
  GrossYards,NetYards,AllowYards:real;
  YdsString:string;
  TempNetFloat:real;
  TempNetInt,TempLotNo:longint;
  TempLotNoStr,TempNetWidth,TempNet,TempFaults:string;
begin
  GrossYards:=int(LastTotalGross*mtrTOyds*10+0.5)/10;
  AllowYards:=int(LastTotalAllow*mtrTOyds*10+0.5)/10;
  NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
  TempNetFloat:=LastTotalGross-LastTotalAllow;
  TempNetInt:=trunc(TempNetFloat*10); {cast float to int}
  TempLotNo:=LastLotNo{-100000};
  TempLotNoStr:=ZeroFill(TempLotNo,3);
  TempNetWidth:=ZeroFill(LastMetricWidth,3);
  TempNet:=ZeroFill(TempNetInt,4);
  TempFaults:=ZeroFill(LastTotalFaults,2);

  //to do: deal with the inbetween labels and last label eject problem
  SendString:=STX+'00210'+CR;
  DMXComPort2.PutString(SendString);
  if LastLabel then
    SendString:=STX+'f350'+CR //lastlabel
  else
    SendString:=STX+'f200'+CR; //inbetween labels
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
  SendString:='1911001'+'01700210'+'Strip #s'+CR; {Strip #s}
  DMXComPort2.PutString(SendString);

  SendString:='1911001'+'02300010'+'Style'+CR; {Product}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'02000010'+'Color'+CR; //Color added DL031113
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'02000210'+'Carton #'+CR; {Carton #}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'02300210'+'Lot #'+CR; {Lot #}
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'02600010'+'Country Of Origin: Republic of South Africa'+CR; {Country of Origin}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'02420010'+'Vrede Fabrics'+CR; //was VERTICAL REALITY DL030501
  DMXComPort2.PutString(SendString);

  //new Product Field; new Part# field: added DL031213
  SendString:='1911001'+'00780145'+'Product'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'00480145'+'Part #'+CR;
  DMXComPort2.PutString(SendString);

  //print the data
  SendString:='1911004'+'00920010'+LastImperialWidthDescr+CR; {3.5"}
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

  SendString:='1911004'+'01220010'+LastMetricWidthDescr+CR; {89 mm}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01220075'+floattostrf(LastTotalGross,ffFixed,5,1)+CR; {150m}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01220145'+floattostrf(LastTotalAllow,ffFixed,5,1)+CR; {Allow}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01220210'+floattostrf(TempNetFloat,ffFixed,5,1)+CR; {Nett}
  DMXComPort2.PutString(SendString);

  SendString:='1911004'+'01520010'+FormatDateTime('mmm dd, yyyy', LastDateManu)+CR; {Date}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01520145'+inttostr(LastTotalFaults)+CR; {Faults}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01520210'+LastStripNoString+CR; {Strip #}
  DMXComPort2.PutString(SendString);

  SendString:='1911004'+'02120010'+LastStyleDescr+CR; //mod DL031113 was LastLabelDescr+' '+LastQlty+CR; {Product}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01820210'+inttostr(LastBoxNo)+CR; {Carton #}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'02120210'+inttostr(LastLotNo)+CR; {Lot #}
  DMXComPort2.PutString(SendString);

  //print new data: added DL031112
  SendString:='1911004'+'01820010'+LastColorDescr+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'00600145'+LastLabelDescr+' '+LastQlty+CR; //Product
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'00300145'+LastPartNo+CR;
  DMXComPort2.PutString(SendString);

  // print the bar code; int 2 of 5; barratio 3,1; barheight 80;
  // barmag 2; mag 1,1 (Note: these are params from the UBI printer)
  //SendString:='1D00000'+'00300060'+'15'+ZeroFill(LastBoxNo,6)+CR; //removed DL031113
  SendString:='1D62040'+'00300025'+'15'+ZeroFill(LastBoxNo,6)+CR; //added DL031113
  DMXComPort2.PutString(SendString);

  //EndLabel
  SendString:='E'+CR;
  DMXComPort2.PutString(SendString);
end; //DMXPrintLabel_VT

procedure TVBBoxLabelForm.DMXPrintLabel_HD;
const
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  SendString:string;
  GrossYards,NetYards,AllowYards,NetMetres:real;
  YdsString:string;
  YdsDigits:integer;
  TempNetFloat:real;
  TempNetInt,TempLotNo:longint;
  TempLotNoStr,TempNetWidth,TempNet,TempFaults:string;
begin
  //written DL031117
  //for IA round to whole numbers DL070601
  if LastLabelStru='IA' then
  begin
    GrossYards:=int(LastTotalGross*mtrTOyds*10+0.5)/10;
    AllowYards:=int(LastTotalAllow*mtrTOyds*10+0.5)/10;
    NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
    YdsDigits:=0;
  end
  else
  begin
    GrossYards:=int(LastTotalGross*mtrTOyds*10+0.5)/10;
    AllowYards:=int(LastTotalAllow*mtrTOyds*10+0.5)/10;
    NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
    YdsDigits:=1;
  end;

  TempNetFloat:=LastTotalGross-LastTotalAllow;
  TempNetInt:=trunc(TempNetFloat*10); {cast float to int}
  TempLotNo:=LastLotNo{-100000};
  TempLotNoStr:=ZeroFill(TempLotNo,3);
  TempNetWidth:=ZeroFill(LastMetricWidth,3);
  TempNet:=ZeroFill(TempNetInt,4);
  TempFaults:=ZeroFill(LastTotalFaults,2);

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
//  SendString:='1911001'+'01400210'+'Strip #'+CR; //was Lot #
//  DMXComPort2.PutString(SendString);

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

  if (LastLabelStru='LH') then //if with else's added DL041013
    SendString:='1911004'+'02420010'+'Levolor Home Fashions'+CR
  else if (LastLabelStru='HD') then //if added DL041013
    SendString:='1911004'+'02420010'+'Hunter Douglas Verticals'+CR
  else
    SendString:='1911004'+'02420010'+'ITA, Inc.'+CR;
  DMXComPort2.PutString(SendString);

  //new Product Field; new Part# field: added DL031213
  SendString:='1911001'+'00780145'+'Product'+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911001'+'00480145'+'Nett (mtr)'+CR;
  DMXComPort2.PutString(SendString);

  //print the data
  NetMetres:=int((LastTotalGross-LastTotalAllow)*10+0.5)/10; //added DL031117
  SendString:='1911004'+'00920010'+LastImperialWidthDescr+CR; {3.5"}
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
  SendString:='1911004'+'01220010'+FormatDateTime('mmm dd, yyyy', LastDateManu)+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01220145'+inttostr(LastFaults)+CR;
  DMXComPort2.PutString(SendString);
//  SendString:='1911004'+'01220210'+inttostr(LastStripNo)+CR;
//  DMXComPort2.PutString(SendString);

  SendString:='1911004'+'01520210'+inttostr(LastLotNo)+CR; {was Strip #}
  DMXComPort2.PutString(SendString);

  //SendString:='1911008'+'01820015'+LabelDescr+' '+Qlty+CR; {Product}
  SendString:='1911007'+'01920010'+LastStyleDescr+CR; //mod DL031112
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'01820210'+inttostr(LastBoxNo)+CR; {Carton #}
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'02120210'+LastPartNo+CR; {was Lot #}
  DMXComPort2.PutString(SendString);

  //print new data: added DL031112
  SendString:='1911007'+'01470010'+LastColorDescr+CR;
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'00600145'+LastLabelDescr+' '+CR; //Product
  DMXComPort2.PutString(SendString);
  SendString:='1911004'+'00300145'+floattostrf(NetMetres,ffFixed,5,YdsDigits)+CR; //was PartNo
  DMXComPort2.PutString(SendString);

  // print the bar code; int 2 of 5; barratio 3,1; barheight 80;
  // barmag 2; mag 1,1 (Note: these are params from the UBI printer)
  SendString:='1D62040'+'00300025'+'15'+ZeroFill(LastBoxNo,6)+CR;
  DMXComPort2.PutString(SendString);

  //EndLabel
  SendString:='E'+CR;
  DMXComPort2.PutString(SendString);
end; //DMXPrintLabel_HD


procedure TVBBoxLabelForm.C4PPrintLabel_VT;
const
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  SendString:string;
  GrossYards,NetYards,AllowYards:real;
  YdsString:string;
  TempNetFloat:real;
  TempNetInt,TempLotNo:longint;
  TempLotNoStr,TempNetWidth,TempNet,TempFaults:string;
  MyFile: TextFile;
begin
  //method added DL031119
  GrossYards:=int(LastTotalGross*mtrTOyds*10+0.5)/10;
  AllowYards:=int(LastTotalAllow*mtrTOyds*10+0.5)/10;
  NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
  TempNetFloat:=LastTotalGross-LastTotalAllow;
  TempNetInt:=trunc(TempNetFloat*10); {cast float to int}
  TempLotNo:=LastLotNo{-100000};
  TempLotNoStr:=ZeroFill(TempLotNo,3);
  TempNetWidth:=ZeroFill(LastMetricWidth,3);
  TempNet:=ZeroFill(TempNetInt,4);
  TempFaults:=ZeroFill(LastTotalFaults,2);

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
  Writeln(MyFile, 'A423,237,0,1,1,1,N,"Strip #s"'); //on carton label
  Writeln(MyFile, 'A303,300,0,1,1,1,N,"Allowance"');
  Writeln(MyFile, 'A303,365,0,1,1,1,N,"Allowance"');
  Writeln(MyFile, 'A303,428,0,1,1,1,N,"Product"');
  Writeln(MyFile, 'A303,490,0,1,1,1,N,"Part #"');
  Writeln(MyFile, 'A160,300,0,1,1,1,N,"Gross (m)"');
  Writeln(MyFile, 'A160,365,0,1,1,1,N,"Gross (yds)"');
  Writeln(MyFile, 'A423,300,0,1,1,1,N,"Nett (mtr)"');
  Writeln(MyFile, 'A423,365,0,1,1,1,N,"Nett (yds)"');

  //print the data
  GrossYards:=int(LastTotalGross*mtrTOyds*10+0.5)/10;
  AllowYards:=int(LastTotalAllow*mtrTOyds*10+0.5)/10;
  NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
  Writeln(MyFile, 'A40,388,0,4,1,1,N,"'+LastImperialWidthDescr+'"'); {3.5"}
  YdsString:=floattostrf(GrossYards,ffFixed,5,1);
  Writeln(MyFile, 'A170,388,0,4,1,1,N,"'+YdsString+'"'); {164yrds}
  YdsString:=floattostrf(AllowYards,ffFixed,3,1);
  Writeln(MyFile, 'A310,388,0,4,1,1,N,"'+YdsString+'"'); {Allow}
  YdsString:=floattostrf(NetYards,ffFixed,5,1);
  Writeln(MyFile, 'A433,388,0,4,1,1,N,"'+YdsString+'"'); {Nett yrds}

  Writeln(MyFile, 'A29,118,0,5,1,1,N,"'+LastStyleDescr+'"');
  Writeln(MyFile, 'A29,182,0,5,1,1,N,"'+LastColorDescr+'"');
  Writeln(MyFile, 'A433,130,0,4,1,1,N,"'+inttostr(LastLotNo)+'"');
  Writeln(MyFile, 'A433,196,0,4,1,1,N,"'+inttostr(LastBoxNo)+'"');
  Writeln(MyFile, 'A40,258,0,4,1,1,N,"'+FormatDateTime('mmm dd, yyyy', LastDateManu)+'"');
  Writeln(MyFile, 'A310,258,0,4,1,1,N,"'+inttostr(LastFaults)+'"');
  Writeln(MyFile, 'A433,258,0,4,1,1,N,"'+LastStripNoString+'"');
  Writeln(MyFile, 'A40,324,0,4,1,1,N,"'+LastMetricWidthDescr+'"');
  Writeln(MyFile, 'A170,324,0,4,1,1,N,"'+floattostrf(LastTotalGross,ffFixed,5,1)+'"');
  Writeln(MyFile, 'A310,324,0,4,1,1,N,"'+floattostrf(LastTotalAllow,ffFixed,5,1)+'"');
  Writeln(MyFile, 'A433,324,0,4,1,1,N,"'+floattostrf(TempNetFloat,ffFixed,5,1)+'"');
  Writeln(MyFile, 'A310,450,0,4,1,1,N,"'+LastLabelDescr+' '+LastQlty+'"'); //Product
  Writeln(MyFile, 'A310,515,0,4,1,1,N,"'+LastPartNo+'"');

  // print the bar code; int 2 of 5; barratio 3,1; barheight 80;
  // barmag 2; mag 1,1 (Note: these are params from the UBI printer)
  Writeln(MyFile, 'B65,446,0,2,2,6,64,B,"15'+ZeroFill(LastBoxNo,6)+'"');

  //EndLabel
  Writeln(MyFile, 'P1');
  CloseFile(MyFile);
end;

procedure TVBBoxLabelForm.C4PPrintLabel_HD;
const
  mtrTOyds = 1.0936; {metres to yards conversion}
var
  SendString:string;
  GrossYards,NetYards,AllowYards,NetMetres:real;
  YdsString:string;
  YdsDigits:integer;
  TempNetFloat:real;
  TempNetInt,TempLotNo:longint;
  TempLotNoStr,TempNetWidth,TempNet,TempFaults:string;
  MyFile: TextFile;
begin
  //method added DL031119

  //for IA round to whole numbers DL070601
  if LastLabelStru='IA' then
  begin
    GrossYards:=int(LastTotalGross*mtrTOyds*10+0.5)/10;
    AllowYards:=int(LastTotalAllow*mtrTOyds*10+0.5)/10;
    NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
    YdsDigits:=0;
  end
  else
  begin
    GrossYards:=int(LastTotalGross*mtrTOyds*10+0.5)/10;
    AllowYards:=int(LastTotalAllow*mtrTOyds*10+0.5)/10;
    NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
    YdsDigits:=1;
  end;

  TempNetFloat:=LastTotalGross-LastTotalAllow;
  TempNetInt:=trunc(TempNetFloat*10); {cast float to int}
  TempLotNo:=LastLotNo{-100000};
  TempLotNoStr:=ZeroFill(TempLotNo,3);
  TempNetWidth:=ZeroFill(LastMetricWidth,3);
  TempNet:=ZeroFill(TempNetInt,4);
  TempFaults:=ZeroFill(LastTotalFaults,2);
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

  if (LastLabelStru='LH') then //if with else's added DL041013
    Writeln(MyFile, 'A29,70,0,4,1,1,N,"Levolor Home Fashions"')
  else if (LastLabelStru='HD') then //if added DL041013
    Writeln(MyFile, 'A29,70,0,4,1,1,N,"Hunter Douglas Verticals"')
  else
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
  //Writeln(MyFile, 'A423,300,0,1,1,1,N,"Strip #s"'); //not printed: 10 strips in box
  Writeln(MyFile, 'A165,365,0,1,1,1,N,"Gross (yds)"');
  Writeln(MyFile, 'A423,365,0,1,1,1,N,"Nett (yds)"');
  Writeln(MyFile, 'A310,428,0,1,1,1,N,"Product"');
  Writeln(MyFile, 'A310,492,0,1,1,1,N,"Nett (mtr)"');

  //print the data
  NetMetres:=int((LastTotalGross-LastTotalAllow)*10+0.5)/10;
  Writeln(MyFile, 'A29,390,0,4,1,1,N,"'+LastImperialWidthDescr+'"'); {3.5"}
  YdsString:=floattostrf(GrossYards,ffFixed,5,YdsDigits);
  Writeln(MyFile, 'A168,390,0,4,1,1,N,"'+YdsString+'"'); {164yrds}
  YdsString:=floattostrf(AllowYards,ffFixed,3,YdsDigits);
  Writeln(MyFile, 'A310,390,0,4,1,1,N,"'+YdsString+'"'); {Allow} //324
  YdsString:=floattostrf(NetYards,ffFixed,5,YdsDigits);
  Writeln(MyFile, 'A433,390,0,4,1,1,N,"'+YdsString+'"'); {Nett yrds}

  Writeln(MyFile, 'A29,140,0,5,1,1,N,"'+LastStyleDescr+'"');
  Writeln(MyFile, 'A29,234,0,5,1,1,N,"'+LastColorDescr+'"');

  Writeln(MyFile, 'A29,324,0,4,1,1,N,"'+FormatDateTime('mmm dd, yyyy', LastDateManu)+'"');
  Writeln(MyFile, 'A310,324,0,4,1,1,N,"'+inttostr(LastFaults)+'"');

  //Writeln(MyFile, 'A433,324,0,4,1,1,N,"'+inttostr(StripNo)+'"'); not printed: 10 strips in box
  Writeln(MyFile, 'A433,130,0,4,1,1,N,"'+LastPartNo+'"');
  Writeln(MyFile, 'A433,196,0,4,1,1,N,"'+inttostr(LastBoxNo)+'"');
  Writeln(MyFile, 'A433,258,0,4,1,1,N,"'+inttostr(LastLotNo)+'"');
  Writeln(MyFile, 'A310,450,0,4,1,1,N,"'+LastLabelDescr+'"'); //Product
  Writeln(MyFile, 'A310,515,0,4,1,1,N,"'+floattostrf(TempNetFloat,ffFixed,5,YdsDigits)+'"');
  Writeln(MyFile, 'B65,446,0,2,2,6,64,B,"15'+ZeroFill(LastBoxNo,6)+'"');

  //EndLabel
  Writeln(MyFile, 'P1');
  CloseFile(MyFile);
end;

end.
