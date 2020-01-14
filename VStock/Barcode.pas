unit Barcode;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, AdPort, StdCtrls, DBTables, DB, Buttons, ComCtrls, OoMisc;

type
  TBarCodeForm = class(TForm)
    ApdComPort2: TApdComPort;
    PrintLabelBtn: TButton;
    FixDespatch: TButton;
    YarnRcpt: TTable;
    YarnType: TTable;
    YarnRcptBOXNO: TIntegerField;
    YarnRcptYNSTRU: TStringField;
    YarnRcptYNCOL: TStringField;
    YarnRcptYNNET: TFloatField;
    YarnRcptDESPNO: TIntegerField;
    YarnTypeYNSTRU: TStringField;
    YarnTypeYNCOL: TStringField;
    YarnTypeINSTOCK: TFloatField;
    Label1: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Employee: TButton;
    IssueDet: TTable;
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
    FixIssueDet: TButton;
    DelHead: TTable;
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
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    DelHeadTxnDet: TButton;
    SPGenTxnDetRef: TStoredProc;
    SPGenTxnDetTxnRef: TStoredProc;
    Product: TTable;
    ProductPRODREF: TStringField;
    ProductEXTPRODREF: TStringField;
    TxnDet: TTable;
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
    CtrlAcct: TTable;
    CtrlAcctACCNAME: TStringField;
    CtrlAcctEXTACCNAME: TStringField;
    CtrlAcctQTY: TFloatField;
    IssueDetTxns: TButton;
    Dept: TTable;
    DeptDEPTREF: TStringField;
    DeptCTRLACCT: TStringField;
    DeptISSUEYARNTO: TStringField;
    MyQuery: TQuery;
    CreateWIPRcptTxns: TButton;
    CreateWIPIssueTxns: TButton;
    CreateYarnRcptTxns: TButton;
    YarnRcptYNQLTY: TStringField;
    YarnRcptDATEMANU: TDateTimeField;
    YarnRcptYNTWIST: TStringField;
    YarnRcptRETURNED: TStringField;
    YarnRcptDATEENT: TDateTimeField;
    YarnRcptUSERENT: TStringField;
    YarnRcptDATEMOD: TDateTimeField;
    YarnRcptUSERMOD: TStringField;
    YarnRcptQuery: TQuery;
    YarnWBSQuery: TQuery;
    YarnRcptQueryYNSTRU: TStringField;
    YarnRcptQueryYNTWIST: TStringField;
    YarnRcptQueryYNCOL: TStringField;
    YarnRcptQueryDATEMANU: TDateTimeField;
    YarnRcptQueryBOXNO: TIntegerField;
    YarnRcptQueryDATEENT: TDateTimeField;
    YarnRcptQueryUSERENT: TStringField;
    YarnRcptQueryYNTYPE: TStringField;
    YarnWBSQueryRMPERKG: TFloatField;
    YarnWBSQueryEXTACCNAME: TStringField;
    YarnWBSQueryACCNAME: TStringField;
    YarnRcptQueryRETURNED: TStringField;
    YarnRcptQueryYNQLTY: TStringField;
    YarnRcptQueryYNNET: TFloatField;
    CreateYarnDespTxns: TButton;
    YnDespHdrQuery: TQuery;
    YnDespHdrQueryDESPNO: TIntegerField;
    YnDespHdrQueryDESPDATE: TDateTimeField;
    YnDespHdrQueryVT1WIP: TStringField;
    YnDespHdrQueryDATEENT: TDateTimeField;
    YnDespHdrQueryUSERENT: TStringField;
    YarnRcptTypeQuery: TQuery;
    YarnRcptTypeQueryYNTYPE: TStringField;
    YarnRcptTypeQueryYNSTRU: TStringField;
    YarnRcptTypeQueryYNTWIST: TStringField;
    YarnRcptTypeQueryYNQLTY: TStringField;
    YarnRcptTypeQuerySUMYNNET: TFloatField;
    RemoveWIPsBtn: TButton;
    WIPQuery: TQuery;
    YnLotNoBtnBtn: TButton;
    YarnLotNo: TTable;
    YarnLotNoLOTNO1: TIntegerField;
    YarnLotNoLOTNO2: TSmallintField;
    YarnLotNoYNCOL: TStringField;
    YarnLotNoDATEMANU: TDateTimeField;
    YarnLotNoDATERCVD: TDateTimeField;
    YarnLotNoRCVDBY: TStringField;
    YarnLotNoYNSTRU: TStringField;
    YarnLotNoYNTWIST: TStringField;
    procedure TestKohcorClick(Sender: TObject);
    procedure TestPolifiClick(Sender: TObject);
    procedure PrintLabelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FixDespatchClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EmployeeClick(Sender: TObject);
    procedure FixIssueDetClick(Sender: TObject);
    procedure DelHeadTxnDetClick(Sender: TObject);
    procedure IssueDetTxnsClick(Sender: TObject);
    procedure CreateWIPRcptTxnsClick(Sender: TObject);
    procedure CreateWIPIssueTxnsClick(Sender: TObject);
    procedure CreateYarnRcptTxnsClick(Sender: TObject);
    procedure CreateYarnDespTxnsClick(Sender: TObject);
    procedure RemoveWIPsBtnClick(Sender: TObject);
    procedure YnLotNoBtnBtnClick(Sender: TObject);
  private
    { Private declarations }
    PrintLabels:boolean;
  public
    { Public declarations }
    procedure StartLabel(LastLabel:boolean);
    procedure SendLabelData(LineNo:smallint;SendString,SendString2:string);
    procedure EndLabel;
  end;

var
  BarCodeForm: TBarCodeForm;

implementation

uses Main;

{$R *.DFM}

const
  SOH = #1;
  STX = #2; {STX, ie Control B or ASCII char 2}
  CR = #13; {carriage return}

procedure TBarCodeForm.SendLabelData(
  LineNo:smallint;SendString,SendString2:string);
begin
  if not PrintLabels then
    exit;
  case LineNo of
    0:begin {for raw material}
        SendString:='191100102600038'+'VREDE TEXTILES'+CR;
      end;
    10:begin {for finished product}
        SendString:='191100102600038'+'VREDE TEXTILES (PTY) LTD'+CR;
        ApdComPort2.PutString(SendString);
        SendString:='191100102400030'+'PO Box 1421, Dassenberg, 7350'+CR;
      end;
    1:SendString:='191100202000015'+SendString+CR;
    2:begin {this is the raw material supplier/product line}
        SendString:='191100201600010'+SendString+CR;
        ApdComPort2.PutString(SendString);
        SendString:='191100401600100'+SendString2+CR;
      end;
    20:begin {this is the finished product line}
        SendString:='191100401600010'+SendString+CR;
       end;
    3:SendString:='191100201300015'+SendString+CR;
    4:SendString:='191100201000015'+SendString+CR;
    5:SendString:='191100200700015'+SendString+CR; //added DL230400 to print DateManu line
{   6:SendString:='1A3107000000040'+SendString+CR; old bar code structure}
    6:SendString:='1D3104500000040'+SendString+CR; {new bar code DL020397}
  end;
  ApdComPort2.PutString(SendString);
end;

procedure TBarCodeForm.StartLabel(LastLabel:boolean);
var
  SendString:string;
begin
  if not PrintLabels then
    exit;
  ApdComPort2.Open:=true;
  SendString:=STX+'00210'+CR;
  ApdComPort2.PutString(SendString);
  if LastLabel then
    SendString:=STX+'f350'+CR
  else
    SendString:=STX+'f200'+CR;
  ApdComPort2.PutString(SendString);
  SendString:=STX+'L'+CR;
  ApdComPort2.PutString(SendString);
end;

procedure TBarCodeForm.EndLabel;
var
  SendString:string;
begin
  if not PrintLabels then
    exit;
  SendString:='E'+CR;
  ApdComPort2.PutString(SendString);
end;

procedure TBarCodeForm.TestKohcorClick(Sender: TObject);
{test print VREDE Vertical Blind and Bar Code 12345678}
begin
  StartLabel(true);
  SendLabelData(1,'0','');
  SendLabelData(3,'1','');
  EndLabel;
end;

procedure TBarCodeForm.TestPolifiClick(Sender: TObject);
begin
  StartLabel(true);
  SendLabelData(10,'','');
  SendLabelData(1,'POLIFI 1100L','');
  SendLabelData(2,'Order:06977 Del:00095','');
  SendLabelData(3,'Pallet:007/008 BCB:50','');
  SendLabelData(4,'Qty:025 Total:1250 KGS','');
  SendLabelData(6,'0100095007000','');
  EndLabel;
end;

procedure TBarCodeForm.PrintLabelBtnClick(Sender: TObject);
begin
  if PrintLabels then
  begin
    PrintLabelBtn.Caption:='Print Labels';
    PrintLabels:=false;
  end
  else
  begin
    PrintLabelBtn.Caption:='Don''t Print Labels';
    PrintLabels:=true;
  end;
end;

procedure TBarCodeForm.FormCreate(Sender: TObject);
begin
  PrintLabels:=true;
end;

procedure TBarCodeForm.FixDespatchClick(Sender: TObject);
begin
  YarnRcpt.Open;
  YarnType.Open;
  MainForm.Database.StartTransaction;
  YarnRcpt.Refresh;
  YarnType.Refresh;
  {1) set the stru and col instock totals to zero}
  YarnType.First;
  while not YarnType.EOF do
  begin
    Label1.Caption:='YarnType '+YarnTypeYnStru.Value+' '+YarnTypeYnCol.Value;
    YarnType.Edit;
    YarnTypeInStock.Value:=0;
    YarnType.Post;
    YarnType.Next;
  end;
  {2) add up the totals for stru and col}
  YarnRcpt.First;
  while not YarnRcpt.EOF do
  begin
    Label1.Caption:='YnRcpt '+YarnRcptYnStru.Value+' '+YarnRcptYnCol.Value;
    if YarnRcptDespNo.Value=0 then {not despatched}
    begin
      YarnType.SetKey;
      YarnType.FieldByName('YnStru').AsString:=YarnRcptYnStru.Value;
      YarnType.FieldByName('YnCol').AsString:=YarnRcptYnCol.Value;
      if YarnType.GotoKey then
      begin
        YarnType.Edit;
        YarnTypeInStock.Value:=YarnTypeInStock.Value+
          YarnRcptYnNet.Value;
        YarnType.Post;
      end
      else
      begin
        MainForm.Database.RollBack;
        ShowMessage('Error finding YarnType');
        exit;
      end;
    end;
    YarnRcpt.Next;
  end;
  MainForm.Database.Commit;
  YarnRcpt.Close;
  YarnType.Close;
end;

procedure TBarCodeForm.Button1Click(Sender: TObject);
var
  SendString:string;
begin
  ApdComPort2.Open:=true;
  SendString:=STX+'00210'+CR;
  ApdComPort2.PutString(SendString);
  SendString:=STX+'f350'+CR;
  ApdComPort2.PutString(SendString);
  SendString:=STX+'L'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='D11'+CR;
  ApdComPort2.PutString(SendString);
  {draw the boxes}
  SendString:='1X11000'+'00850010'+'B067025001001'+CR; {3.5"}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'01100010'+'B067030001001'+CR; {164 yds}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'00850077'+'B068025001001'+CR; {26.4 yds}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'01100077'+'B068030001001'+CR; {137.6 yds}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'00850145'+'B071025001001'+CR; {Width}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'01100145'+'B071030001001'+CR; {Gross}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'00850216'+'B080025001001'+CR; {Allowance}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'01100216'+'B080030001001'+CR; {Nett}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'01400010'+'B135030001001'+CR; {Date}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'01400145'+'B071030001001'+CR; {Faults}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'01400216'+'B080030001001'+CR; {Slit No.}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'01700010'+'B206060001001'+CR; {Product}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'01700216'+'B080030001001'+CR; {Blank box}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'02000216'+'B080030001001'+CR; {Lot #}
  ApdComPort2.PutString(SendString);
  SendString:='1X11000'+'00150010'+'B286070001001'+CR; {Bar Codes}
  ApdComPort2.PutString(SendString);
  {send the data}
  SendString:='191100102150020'+'Product'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100102170220'+'Lot #'+CR;
  ApdComPort2.PutString(SendString);
  {SendString:='191100101870220'+'Weft Lot'+CR;
  ApdComPort2.PutString(SendString);}
  SendString:='191100701800020'+'VTH100'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100402000220'+'100001'+CR;
  ApdComPort2.PutString(SendString);
  {SendString:='191100401700220'+'01235/01'+CR;
  ApdComPort2.PutString(SendString);}
  SendString:='191100101570020'+'Date Manu.'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100101570150'+'Faults'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100101570220'+'Slit'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100401400020'+'MAR 01, 1996'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100401400150'+'2'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100401400220'+'15'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100101270020'+'Width'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100101270080'+'Gross'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100101270150'+'Allowance'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100101270220'+'Nett'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100401100020'+'89mm'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100401100080'+'150 mtr'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100401100150'+'2 mtr'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100401100220'+'148 mtr'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100400900020'+'3.5"'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100400900080'+'164 yds'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100400900150'+'2.2 yds'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100400900220'+'161.8 yds'+CR;
  ApdComPort2.PutString(SendString);
  {barcode}
  SendString:='1A3102000500020'+'VTH100001089148002'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='1A3102000200020'+'040000010101'+CR;
  ApdComPort2.PutString(SendString);
  EndLabel;
end;

procedure TBarCodeForm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TBarCodeForm.EmployeeClick(Sender: TObject);
var
  SendString:string;
begin
  ApdComPort2.Open:=true;
  SendString:=STX+'00210'+CR;
  ApdComPort2.PutString(SendString);
  SendString:=STX+'f350'+CR;
  ApdComPort2.PutString(SendString);
  SendString:=STX+'L'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='D11'+CR;
  ApdComPort2.PutString(SendString);

  {send the data}
  SendString:='191100501500020'+'Vrede Textiles (Pty) Ltd.'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100501200020'+'David Lipschitz'+CR;
  ApdComPort2.PutString(SendString);
  SendString:='191100300700120'+'S8001050'+CR;
  ApdComPort2.PutString(SendString);

  {barcode}
  SendString:='1a6204500120075'+'S8001050'+CR;
  ApdComPort2.PutString(SendString);
  EndLabel;
end;

procedure TBarCodeForm.FixIssueDetClick(Sender: TObject);
begin
{  DelHead.Open;
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
  end;}
end;

procedure TBarCodeForm.DelHeadTxnDetClick(Sender: TObject);
{var
  refno1: integer;
  refno2: integer;
  txnno: integer;}
begin
{commented out so that not run by mistake}
{  DelHead.Open;
  CtrlAcct.Open;
  Product.Open;
  TxnDet.Open;
  DelHead.First;
  while not DelHead.EOF do
  begin
    ProgressBar1.Position:=trunc(DelHeadDelNo.AsInteger/472*100);
    if ((DelHeadsupref.Value<>'DHLTI')
        and (DelHeadsupref.Value<>'DHTBS')
        and (DelHeadsupref.Value<>'DHSAF')) then
    begin
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
    end
    else Dye House->2 detail lines
    begin
      SPGenTxnDetRef.ExecProc;
      RefNo1:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
      SPGenTxnDetRef.ExecProc;
      RefNo2:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
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
          FieldByName('TxnCode').AsString:='DY';
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
      CtrlAcct.SetKey;
      CtrlAcct.FieldByName('AccName').AsString:=DelHeadSupRef.Value;
      if CtrlAcct.GotoKey then
      begin
        with TxnDet do
        begin
          Insert;
          FieldByName('Ref').AsInteger:=RefNo2;
          FieldByName('TxnNo').AsInteger:=TxnNo;
          FieldByName('TxnCode').AsString:='DY';
          FieldByName('ProdType').AsString:='WIP';
          FieldByName('ExtProdRef').AsString:=CtrlAcctExtAccName.AsString;
          FieldByName('Qlty').AsString:='';
          FieldByName('Qty').Value:=DelHeadQtyRcvd.Value*-1;
          FieldByName('TxnDate').Value:=DelHeadDelDate.Value;
          FieldByName('OrigTxnCode').AsInteger:=DelHeadDelNo.Value;
          FieldByName('DateEnt').Value:=DelHeadDateEnt.Value;
          FieldByName('UserEnt').AsString:=DelHeadUserEnt.Value;
          Post;
        end;
        CtrlAcct.Edit;
        CtrlAcctQty.Value:=CtrlAcctQty.Value-DelHeadQtyRcvd.Value;
        CtrlAcct.Post;
      end;
    end;
    DelHead.Next;
  end;
  CtrlAcct.Close;
  Product.Close;
  TxnDet.Close;
  DelHead.Close;}
end;

procedure TBarCodeForm.IssueDetTxnsClick(Sender: TObject);
{var
  refno1: integer;
  refno2: integer;
  txnno: integer;
  extprodref:string[11];
  controlacct:string[6];
  accname:string[6];}
begin
{commented out so that not run by mistake}
{  IssueDet.Open;
  CtrlAcct.Open;
  Product.Open;
  Dept.Open;
  TxnDet.Open;
  IssueDet.First;
  while not IssueDet.EOF do
  begin
    ProgressBar1.Position:=trunc(IssueDetIssueNo.AsInteger/13161*100);
    need two rows here including for Dye Houses
    SPGenTxnDetRef.ExecProc;
    RefNo1:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
    SPGenTxnDetRef.ExecProc;
    RefNo2:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
    SPGenTxnDetTxnRef.ExecProc;
    TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;
    ControlAcct:='NONE';
    1) insert the issue from record: decrease the stock
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
    2) insert the issue_to record
    increase stock in WIP or at the Dye House: if WIP then check dept
    table to make sure that we are issuing to WIP and not to a NONE type
    control account, eg a supplier or a customer
    if ((IssueDetissueto.Value='DHLTI')
        or (IssueDetissueto.Value='DHTBS')
        or (IssueDetissueto.Value='DHSAF')) then
    begin
      CtrlAcct.SetKey;
      CtrlAcct.FieldByName('AccName').AsString:=IssueDetIssueTo.Value;
      CtrlAcct.GotoKey;
      ControlAcct:=IssueDetissueto.Value; not NONE,-> control acct will be updated
      ExtProdRef:=CtrlAcctExtAccName.Value;
      AccName:=CtrlAcctAccName.Value;
    end
    else
    begin
      Dept.SetKey;
      Dept.FieldByName('DeptRef').AsString:=IssueDetIssueTo.Value;
      Dept.GotoKey;
      if (DeptCtrlAcct.AsString<>'NONE') then issuing to WIP
      begin
        MyQuery.SQL.Clear;
        MyQuery.SQL.Add('select ctrlacct.extaccname,ctrlacct.accname');
        MyQuery.SQL.Add('from ctrlacct,product');
        MyQuery.SQL.Add('where product.prodref='''+IssueDetprodref.Value+'''');
        MyQuery.SQL.Add('and ctrlacct.accname=product.ctrlacct');
        MyQuery.Prepare;
        MyQuery.Open;
        MyQuery.First;
        ExtProdRef:=MyQuery.Fields[0].AsString;
        AccName:=MyQuery.Fields[1].AsString;
        ControlAcct:=IssueDetissueto.Value; not NONE,-> control acct will be updated
      end;
    end;
    if (controlacct<>'NONE') then
    begin
      with TxnDet do
      begin
        Insert;
        FieldByName('Ref').AsInteger:=RefNo2;
        FieldByName('TxnNo').AsInteger:=TxnNo;
        FieldByName('TxnCode').AsString:='ID';
        FieldByName('ProdType').AsString:='WIP';
        FieldByName('ExtProdRef').AsString:=ExtProdRef;
        FieldByName('Qlty').AsString:='';
        FieldByName('Qty').Value:=IssueDetQtyIssued.Value;
        FieldByName('TxnDate').Value:=IssueDetDateIssued.Value;
        FieldByName('OrigTxnCode').AsInteger:=IssueDetIssueNo.Value;
        FieldByName('DateEnt').Value:=IssueDetDateIssued.Value;
        FieldByName('UserEnt').AsString:=IssueDetInitials.Value;
        Post;
      end;
      CtrlAcct.SetKey;
      CtrlAcct.FieldByName('AccName').AsString:=AccName;
      CtrlAcct.GotoKey;
      CtrlAcct.Edit;
      CtrlAcctQty.Value:=CtrlAcctQty.Value+IssueDetQtyIssued.Value;
      CtrlAcct.Post;
    end;
    IssueDet.Next;
  end;
  IssueDet.Close;
  CtrlAcct.Close;
  Product.Close;
  Dept.Close;
  TxnDet.Close;}
end;

procedure TBarCodeForm.CreateWIPRcptTxnsClick(Sender: TObject);
var
  refno1: integer;
  refno2: integer;
  txnno: integer;
  extprodref: string[11];
  accname: string[6];
begin
  {need two rows here}
  Product.Open;
  WIPRcpt.Open;
  CtrlAcct.Open;
  TxnDet.Open;
  WIPRcpt.First;
  while not WIPRcpt.EOF do
  begin
    if WIPRcptShift.Value='W' then {ignore this line}
    begin
      WIPRcpt.Next;
      continue;
    end;
    ProgressBar1.Position:=trunc(WIPRcptRefNo.AsInteger/6523*100);
    SPGenTxnDetRef.ExecProc;
    RefNo1:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
    SPGenTxnDetRef.ExecProc;
    RefNo2:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
    SPGenTxnDetTxnRef.ExecProc;
    TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;
    {1) insert the wiprcpt record: increase the stock}
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
    {2) decrease the WIP}
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select ctrlacct.extaccname,ctrlacct.accname');
    MyQuery.SQL.Add('from ctrlacct,product');
    MyQuery.SQL.Add('where product.prodref='''+WIPRcptprodref.Value+'''');
    MyQuery.SQL.Add('and ctrlacct.accname=product.ctrlacct');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    ExtProdRef:=MyQuery.Fields[0].AsString;
    AccName:=MyQuery.Fields[1].AsString;
    with TxnDet do
    begin
      Insert;
      FieldByName('Ref').AsInteger:=RefNo2;
      FieldByName('TxnNo').AsInteger:=TxnNo;
      FieldByName('TxnCode').AsString:='WR';
      FieldByName('ProdType').AsString:='WIP';
      FieldByName('ExtProdRef').AsString:=ExtProdRef;
      FieldByName('Qlty').AsString:='';
      FieldByName('Qty').Value:=WIPRcptNetWeight.Value*-1;
      FieldByName('TxnDate').Value:=WIPRcptDateManu.Value;
      FieldByName('OrigTxnCode').AsInteger:=WIPRcptRefNo.Value;
      FieldByName('DateEnt').Value:=WIPRcptDateEnt.Value;
      FieldByName('UserEnt').AsString:=WIPRcptUserEnt.Value;
      Post;
    end;
    CtrlAcct.SetKey;
    CtrlAcct.FieldByName('AccName').AsString:=AccName;
    CtrlAcct.GotoKey;
    CtrlAcct.Edit;
    CtrlAcctQty.Value:=CtrlAcctQty.Value-WIPRcptNetWeight.Value;
    CtrlAcct.Post;
    WIPRcpt.Next;
  end;
  Product.Close;
  WIPRcpt.Close;
  CtrlAcct.Close;
  TxnDet.Close;
end;

procedure TBarCodeForm.CreateWIPIssueTxnsClick(Sender: TObject);
var
 refno1: integer;
 refno2: integer;
 txnno: integer;
 extprodref: string[11];
 controlacct: string[6];
 accname: string[6];
begin
  {/*note: there is no WIPIssue table, but issuing a WIPRcpt requires*/
  /*a trigger*/}
  Product.Open;
  WIPRcpt.Open;
  CtrlAcct.Open;
  TxnDet.Open;
  Dept.Open;
  WIPRcpt.First;
  while not WIPRcpt.EOF do
  begin
    if (WIPRcptShift.Value='W') then {ignore this line}
    begin
      WIPRcpt.Next;
      continue;
    end;
    if (WIPRcptIssueTo.Value='') or (WIPRcptIssueTo.Value=null) then {ignore this line}
    begin
      WIPRcpt.Next;
      continue;
    end;
    ProgressBar1.Position:=trunc(WIPRcptRefNo.AsInteger/6523*100);
    SPGenTxnDetRef.ExecProc;
    RefNo1:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
    SPGenTxnDetRef.ExecProc;
    RefNo2:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
    SPGenTxnDetTxnRef.ExecProc;
    TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;
    ControlAcct:='NONE';
    {1) insert the wiprcpt record: increase the stock}
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
    {/*2) insert the issue_to record*/
    /*increase stock in WIP or at the Dye House: if WIP then check dept*/
    /*table to make sure that we are issuing to WIP and not to a NONE type*/
    /*control account, eg a supplier or a customer*/}
    if ((WIPRcptissueto.Value='DHLTI')
        or (WIPRcptissueto.Value='DHTBS')
        or (WIPRcptissueto.Value='DHSAF')) then
    begin
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('select ctrlacct.extaccname,ctrlacct.accname');
      MyQuery.SQL.Add('from ctrlacct');
      MyQuery.SQL.Add('where ctrlacct.accname='''+WIPRcptIssueTo.Value+'''');
      MyQuery.Prepare;
      MyQuery.Open;
      MyQuery.First;
      ExtProdRef:=MyQuery.Fields[0].AsString;
      AccName:=MyQuery.Fields[1].AsString;
      ControlAcct:=WIPRcptIssueTo.Value;
      MyQuery.Close;
    end
    else
    begin
      Dept.SetKey;
      Dept.FieldByName('DeptRef').AsString:=WIPRcptIssueTo.Value;
      Dept.GotoKey;
      ControlAcct:=DeptCtrlAcct.Value;
      if (ControlAcct<>'NONE') then {issuing to WIP}
      begin
        MyQuery.SQL.Clear;
        MyQuery.SQL.Add('select ctrlacct.extaccname,ctrlacct.accname');
        MyQuery.SQL.Add('from ctrlacct,product');
        MyQuery.SQL.Add('where product.prodref='''+WIPRcptprodref.Value+'''');
        MyQuery.SQL.Add('and ctrlacct.accname=product.ctrlacct');
        MyQuery.Prepare;
        MyQuery.Open;
        MyQuery.First;
        ExtProdRef:=MyQuery.Fields[0].AsString;
        AccName:=MyQuery.Fields[1].AsString;
        MyQuery.Close;
      end;
    end;
    if (ControlAcct<>'NONE') then
    begin
      with TxnDet do
      begin
        Insert;
        FieldByName('Ref').AsInteger:=RefNo2;
        FieldByName('TxnNo').AsInteger:=TxnNo;
        FieldByName('TxnCode').AsString:='WI';
        FieldByName('ProdType').AsString:='WIP';
        FieldByName('ExtProdRef').AsString:=ExtProdRef;
        FieldByName('Qlty').AsString:='';
        FieldByName('Qty').Value:=WIPRcptNetWeight.Value;
        FieldByName('TxnDate').Value:=WIPRcptDateIssued.Value;
        FieldByName('OrigTxnCode').AsInteger:=WIPRcptRefNo.Value;
        FieldByName('DateEnt').Value:=WIPRcptDateMod.Value;
        FieldByName('UserEnt').AsString:=WIPRcptUserMod.Value;
        Post;
      end;
      CtrlAcct.SetKey;
      CtrlAcct.FieldByName('AccName').AsString:=AccName;
      CtrlAcct.GotoKey;
      CtrlAcct.Edit;
      CtrlAcctQty.Value:=CtrlAcctQty.Value+WIPRcptNetWeight.Value;
      CtrlAcct.Post;
    end;
    WIPRcpt.Next;
  end;
  Product.Close;
  WIPRcpt.Close;
  CtrlAcct.Close;
  TxnDet.Close;
  Dept.Close;
end;

procedure TBarCodeForm.CreateYarnRcptTxnsClick(Sender: TObject);
var
 refno: integer;
 txnno: integer;
 wbsweight: double;
 txncode: string[2];
 prodtype:string[3];
begin
  YarnRcptQuery.Open;
  TxnDet.Open;
  CtrlAcct.Open;
  YarnRcptQuery.First;
  while not YarnRcptQuery.EOF do
  begin
    MainForm.Database.StartTransaction;
    ProgressBar1.Position:=trunc(YarnRcptQueryBoxNo.AsInteger/31051*100);
    SPGenTxnDetTxnRef.ExecProc;
    TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;
    if (YarnRcptQueryYnQlty.Value='W') then {WIP}
    begin
      prodtype:='WYN'; {WIP Yarn}
      txncode:='YF';   {WIP yarn considered to be from factory}
      {xx to do: WYN must be converted in a lookup table to get orig prodtype (='YN')}
      {xx to do: modify the triggers}
      {xx to do: include an automatic despatch the next day?, but what about an incorrect entry}
    end
    else
    begin
      ProdType:='YN';
      if (YarnRcptQueryReturned.Value='N') then
        txncode:='YF' {/*yarn from factory*/}
      else
        txncode:='YC'; {/*yarn from client*/}
    end;
    {/*1)insert the yarnrcpt record: increase the stock;*/}
    {/*decrease WIPs (if not returned)*/}
    SPGenTxnDetRef.ExecProc;
    RefNo:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
    with TxnDet do
    begin
      Insert;
      FieldByName('Ref').AsInteger:=RefNo;
      FieldByName('TxnNo').AsInteger:=TxnNo;
      FieldByName('TxnCode').AsString:=TxnCode;
      FieldByName('ProdType').AsString:=ProdType; {YN or WYN}
      FieldByName('ExtProdRef').AsString:=YarnRcptQueryYnType.Value;
      FieldByName('Qlty').AsString:=YarnRcptQueryYnQlty.Value;
      FieldByName('Qty').Value:=YarnRcptQueryYnNet.Value;
      FieldByName('TxnDate').Value:=YarnRcptQueryDateManu.Value;
      FieldByName('OrigTxnCode').AsInteger:=YarnRcptQueryBoxNo.Value;
      FieldByName('DateEnt').Value:=YarnRcptQueryDateEnt.Value;
      FieldByName('UserEnt').AsString:=YarnRcptQueryUserEnt.Value;
      Post;
    end;
    {/*2) decrease the WIPs.  Need the product's WIP control acct here*/}
    if ((YarnRcptQueryReturned.Value='N')
      or (YarnRcptQueryYnQlty.Value='W')) then {/*not returned so manufactured,so consumes RM*/}
    begin
      YarnWBSQuery.Params[0].AsString:=YarnRcptQueryYnStru.AsString;
      YarnWBSQuery.Params[1].AsString:=YarnRcptQueryYnTwist.AsString;
      YarnWBSQuery.Prepare;
      YarnWBSQuery.Open;
      YarnWBSQuery.First;
      while not YarnWBSQuery.EOF do
      begin
        WBSWeight:=YarnRcptQueryYnNet.AsFloat*YarnWBSQueryRMPerKG.AsFloat;
        SPGenTxnDetRef.ExecProc;
        RefNo:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
        with TxnDet do
        begin
          Insert;
          FieldByName('Ref').AsInteger:=RefNo;
          FieldByName('TxnNo').AsInteger:=TxnNo;
          FieldByName('TxnCode').AsString:=TxnCode;
          FieldByName('ProdType').AsString:='WIP'; {WIP is WIP!}
          FieldByName('ExtProdRef').AsString:=YarnWBSQueryExtAccName.Value;
          FieldByName('Qlty').AsString:='';
          FieldByName('Qty').Value:=WBSWeight*-1;
          FieldByName('TxnDate').Value:=YarnRcptQueryDateManu.Value;
          FieldByName('OrigTxnCode').AsInteger:=YarnRcptQueryBoxNo.Value;
          FieldByName('DateEnt').Value:=YarnRcptQueryDateEnt.Value;
          FieldByName('UserEnt').AsString:=YarnRcptQueryUserEnt.Value;
          Post;
        end;
        CtrlAcct.SetKey;
        CtrlAcct.FieldByName('AccName').AsString:=YarnWBSQueryAccName.Value;
        CtrlAcct.GotoKey;
        CtrlAcct.Edit;
        CtrlAcctQty.Value:=CtrlAcctQty.Value-WBSWeight;
        CtrlAcct.Post;
        YarnWBSQuery.Next;
      end;
      YarnWBSQuery.Close;
    end;
    MainForm.Database.Commit;
    YarnRcptQuery.Next;
  end;
  YarnRcptQuery.Close;
  TxnDet.Close;
  CtrlAcct.Close;
end;

procedure TBarCodeForm.CreateYarnDespTxnsClick(Sender: TObject);
var
  refno: integer; {/*get the ref nos here as reqd*/}
  txnno: integer; {/*one txn no for the whole txn*/}
  wbsweight: double;
  txncode: string[2];
  ProdType:string[3];
begin
  {/* probably won't be run: especially if using the issue routine*/}
  {/* only update stock and WIP if required: */}
  YnDespHdrQuery.Open;
  TxnDet.Open;
  CtrlAcct.Open;
  YnDespHdrQuery.First;
  while not YnDespHdrQuery.EOF do
  begin
    MainForm.Database.StartTransaction;
    ProgressBar1.Position:=trunc(YnDespHdrQueryDespNo.AsInteger/825*100);
    SPGenTxnDetTxnRef.ExecProc;
    TxnNo:=SPGenTxnDetTxnRef.ParamByName('Code').AsInteger;
    if (YnDespHdrQueryVT1WIP.Value='N') then
      TxnCode:='YD' {/*yarn despatched to client*/}
    else
      TxnCode:='YI'; {/*yarn issued */}
    YarnRcptTypeQuery.Params[0].AsInteger:=YnDespHdrQueryDespNo.Value;
    YarnRcptTypeQuery.Prepare;
    YarnRcptTypeQuery.Open;
    YarnRcptTypeQuery.First;
    while not YarnRcptTypeQuery.EOF do
    begin
      {xx to do: remove this if statement}
      if YarnRcptTypeQueryYnQlty.Value<>'W' then {when ='W',skip WIP entries}
      begin
        YarnRcptTypeQuery.Next;
        continue;
      end;

      if YarnRcptTypeQueryYnQlty.Value='W' then
      begin
        ProdType:='WYN'; {xx to do: modify trigger. Plus check despdate=rcptdate+1}
        TxnCode:='YI'; {always Yarn Issued back to factory}
      end
      else
        ProdType:='YN';

      {/*1)decrease the stock*/}
      SPGenTxnDetRef.ExecProc;
      RefNo:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
      with TxnDet do
      begin
        Insert;
        FieldByName('Ref').AsInteger:=RefNo;
        FieldByName('TxnNo').AsInteger:=TxnNo;
        FieldByName('TxnCode').AsString:=TxnCode;
        FieldByName('ProdType').AsString:=ProdType;
        FieldByName('ExtProdRef').AsString:=YarnRcptTypeQueryYnType.Value;
        FieldByName('Qlty').AsString:=YarnRcptTypeQueryYnQlty.Value;
        FieldByName('Qty').Value:=YarnRcptTypeQuerySumYnNet.Value*-1;
        FieldByName('TxnDate').Value:=YnDespHdrQueryDespDate.Value;
        FieldByName('OrigTxnCode').AsInteger:=YnDespHdrQueryDespNo.Value;
        FieldByName('DateEnt').Value:=YnDespHdrQueryDateEnt.Value;
        FieldByName('UserEnt').AsString:=YnDespHdrQueryUserEnt.Value;
        Post;
      end;
      {/*2) increase the WIPs if reqd.*/}
      {/*Need the product's WIP control acct here*/}
      {/*only need change WIPs if issuing to WIP (factory)*/}
      if TxnCode='YI' then
      begin
        YarnWBSQuery.Params[0].AsString:=YarnRcptTypeQueryYnStru.AsString;
        YarnWBSQuery.Params[1].AsString:=YarnRcptTypeQueryYnTwist.AsString;
        YarnWBSQuery.Prepare;
        YarnWBSQuery.Open;
        YarnWBSQuery.First;
        while not YarnWBSQuery.EOF do
        begin
          WBSWeight:=YarnRcptTypeQuerySumYnNet.AsFloat*YarnWBSQueryRMPerKG.AsFloat;
          SPGenTxnDetRef.ExecProc;
          RefNo:=SPGenTxnDetRef.ParamByName('Code').AsInteger;
          with TxnDet do
          begin
            Insert;
            FieldByName('Ref').AsInteger:=RefNo;
            FieldByName('TxnNo').AsInteger:=TxnNo;
            FieldByName('TxnCode').AsString:=TxnCode;
            FieldByName('ProdType').AsString:='WIP'; {WIP is WIP}
            FieldByName('ExtProdRef').AsString:=YarnWBSQueryExtAccName.Value;
            FieldByName('Qlty').AsString:='';
            FieldByName('Qty').Value:=WBSWeight;
            FieldByName('TxnDate').Value:=YnDespHdrQueryDespDate.Value;
            FieldByName('OrigTxnCode').AsInteger:=YnDespHdrQueryDespNo.Value;
            FieldByName('DateEnt').Value:=YnDespHdrQueryDateEnt.Value;
            FieldByName('UserEnt').AsString:=YnDespHdrQueryUserEnt.Value;
            Post;
          end;
          CtrlAcct.SetKey;
          CtrlAcct.FieldByName('AccName').AsString:=YarnWBSQueryAccName.Value;
          CtrlAcct.GotoKey;
          CtrlAcct.Edit;
          CtrlAcctQty.Value:=CtrlAcctQty.Value+WBSWeight;
          CtrlAcct.Post;
          YarnWBSQuery.Next;
        end; {while not YarnWBSQuery.EOF do}
        YarnWBSQuery.Close;
      end; {TxnCode='YI'}
      YarnRcptTypeQuery.Next;
    end; {while not YarnRcptTypeQuery.EOF do}
    YarnRcptTypeQuery.Close;
    MainForm.Database.Commit;
    YnDespHdrQuery.Next;
  end; {while not YnDespHdrQuery.EOF do}
  YnDespHdrQuery.Close;
  CtrlAcct.Close;
  TxnDet.Close;
end;

procedure TBarCodeForm.RemoveWIPsBtnClick(Sender: TObject);
begin
  MainForm.Database.StartTransaction;
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('delete from txndet');
  MyQuery.SQL.Add('where (ref=:ref)');
  MyQuery.Prepare;
  WIPQuery.Open;
  WIPQuery.First;
  while not WIPQuery.EOF do
  begin
    ProgressBar1.Position:=trunc(WIPQuery.Fields[0].AsInteger/7655*100);
    MyQuery.Params[0].AsInteger:=WIPQuery.Fields[0].AsInteger;
    MyQuery.ExecSQL;
    WIPQuery.Next;
  end;
  WIPQuery.Close;
  MyQuery.Close;
  MainForm.Database.Commit;  
end;

procedure TBarCodeForm.YnLotNoBtnBtnClick(Sender: TObject);
var MaxLotNo:integer;
begin
  MainForm.Database.StartTransaction;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select max(lotno1) from yarnrcpt');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  MaxLotNo:=MyQuery.Fields[0].AsInteger;
  MyQuery.Close;
  YarnLotNo.Open;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select distinct ynstru,yntwist,yncol,lotno1,lotno2');
  MyQuery.SQL.Add('from yarnrcpt');
{  MyQuery.SQL.Add('where datemanu>''1-aug-1997''');}
  MyQuery.SQL.Add('order by lotno1');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    ProgressBar1.Position:=trunc(MyQuery.Fields[3].AsInteger/MaxLotNo*100);
    YarnLotNo.SetKey;
    YarnLotNo.FieldByName('LotNo1').AsInteger:=MyQuery.Fields[3].AsInteger;
    YarnLotNo.FieldByName('LotNo2').AsInteger:=MyQuery.Fields[4].AsInteger;
    YarnLotNo.FieldByName('YnCol').AsString:=MyQuery.Fields[2].AsString;
    if YarnLotNo.GotoKey then
    begin
      YarnLotNo.Edit;
      YarnLotNoYnStru.Value:=MyQuery.Fields[0].AsString;
      YarnLotNoYnTwist.Value:=MyQuery.Fields[1].AsString;
      YarnLotNo.Post;
    end
    else
    begin {add the item}
      ShowMessage(MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString+MyQuery.Fields[2].AsString+'is missing');
    end;
    MyQuery.Next;
  end;
  MainForm.Database.Commit;
  MyQuery.Close;
  YarnLotNo.Close;
end;

end.
