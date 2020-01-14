unit Vbpallbl;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, Buttons, StdCtrls;

type
  TVBGenPalLabelForm = class(TForm)
    GenPalLabel: TButton;
    BitBtn1: TBitBtn;
    CheckDespQuery: TQuery;
    GenPalletNoProc: TStoredProc;
    vbParams: TTable;
    vbParamsBARCODEPRINTERTYPE: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GenPalLabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VBGenPalLabelForm: TVBGenPalLabelForm;

implementation

{$R *.DFM}

uses VBMain, VBBarCde, VBUtils;

procedure TVBGenPalLabelForm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TVBGenPalLabelForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//VBNextNo.Close;  //JT 110698 replaced by generator
{  if VBComPortClosed then
  begin
    if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
      VBBarCodeForm.UBIComPort2.Open:=true
    else
      VBBarCodeForm.DMXComPort2.Open:=true;
  end;}
  VBBarCodeForm.CloseComPort2;
  vbParams.Close;
  VBGenPalLabelForm.Release;
end;

procedure TVBGenPalLabelForm.FormShow(Sender: TObject);
begin
//VBNextNo.Open;   //JT 110698 replaced by generator
//VBNextNo.Refresh;
  vbParams.Open; //added DL261098
  VBBarCodeForm.OpenComPort2; //added DL191098
//  VBBarCodeForm.FetchString;    {get rid of characters in buffer}
end;

procedure TVBGenPalLabelForm.GenPalLabelClick(Sender: TObject);
var
  VBNextPalletNo:integer;  {next pallet no from file}
  InputPalletNo:integer; {pallet no input by user}
{  LabelData,Label1Data:string[20];}
  InputPalletNoStr:string;
  SendString:string;
  MyFile: TextFile;
begin
  MainForm.Database.StartTransaction;
{ if VBNextNo.FindKey([NextPalletNoRef]) then   //JT 110698 replaced by generator below
    VBNextPalletNo:=VBNextNoNextNo.Value
  else
  begin
    MainForm.Database.Rollback;
    VBNextPalletNo:=1;
    ShowMessage('Problem getting next Pallet Number.  Please call David');
    Exit;
  end;}
  {print or reprint}
  GenPalletNoProc.ExecProc;       //JT 110698  generate next pallete no
  VBNextPalletNo := GenPalletNoProc.Params[0].AsInteger;
  InputPalletNo := VBNextPalletNo;
  InputPalletNoStr:=inttostr(InputPalletNo);
  if not InputQuery('Pallet Number',
    'Print pallet number', InputPalletNoStr) then
  begin
    {user pressed cancel}
    MainForm.Database.Rollback;
    Exit;
  end;
  InputPalletNo:=strtoint(InputPalletNoStr);
  if InputPalletNo>VBNextPalletNo then
  begin
    MainForm.Database.Rollback;
    ShowMessage('Pallet Number cannot be higher than last pallet number. Re-enter');
    Exit;
  end;
  if InputPalletNo=VBNextPalletNo then
  begin
{   VBNextNo.Edit;      //JT 110698  Is now generated
    VBNextPalletNo:=VBNextNoNextNo.Value;
    VBNextNoNextNo.Value:=VBNextNoNextNo.Value+1;
    VBNextNo.Post;}
  end
  else {re-print pallet label only if pallet has not been despatched}
  begin
    CheckDespQuery.Close;
    CheckDespQuery.Params[0].AsInteger:=InputPalletNo;
    CheckDespQuery.Open;
    if CheckDespQuery.Fields[0].AsInteger<>0 then
    begin
      MainForm.Database.Rollback;
      ShowMessage('Pallet already despatched!');
      Exit;
    end;
  end;
  MainForm.Database.Commit;
  {if we get here print the pallet label}
  if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then
  begin
    SendString:='';
    SendString:='CLL'+CR;
    VBBarCodeForm.UBISendString(SendString);

    SendString:='FONT "SW080BSN.1"'+CR;
    VBBarCodeForm.UBISendString(SendString);
    SendString:='PRPOS 120,400'+CR;
    VBBarCodeForm.UBISendString(SendString);
    SendString:='PRTXT "VB Pallet"'+CR;
    VBBarCodeForm.UBISendString(SendString);

    {print the data}
    SendString:='PRPOS 80,300'+CR;
    VBBarCodeForm.UBISendString(SendString);
    SendString:='PRTXT "Number: '+inttostr(InputPalletNo)+'"'+CR;
    VBBarCodeForm.UBISendString(SendString);

    {print the barcode}
    SendString:='PRPOS 80,152'+CR;
    VBBarCodeForm.UBISendString(SendString);
    SendString:='BARRATIO 3,1'+CR;
    VBBarCodeForm.UBISendString(SendString);
    SendString:='BARHEIGHT 80'+CR;
    VBBarCodeForm.UBISendString(SendString);
    SendString:='BARMAG 2'+CR;
    VBBarCodeForm.UBISendString(SendString);
    SendString:='MAG 1,1'+CR; {added 141096}
    VBBarCodeForm.UBISendString(SendString);
    SendString:='BARTYPE "INT2OF5"'+CR; {141096 changed from CODE39}
    VBBarCodeForm.UBISendString(SendString);
    {SendString:='DIR 1'+CR;
    VBBarCodeForm.UBISendString(SendString);
    SendString:='ALIGN 2'+CR;
    VBBarCodeForm.UBISendString(SendString);}
    SendString:='BARFONT #2,"SW030RSN.1",5,1,1 ON'+CR;
    VBBarCodeForm.UBISendString(SendString);
    SendString:='PRBAR "18'+ZeroFill(InputPalletNo,6)+'"'+CR;
    VBBarCodeForm.UBISendString(SendString);

    SendString:='PRINTFEED'+CR;
    VBBarCodeForm.UBISendString(SendString);
  end
  else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
  begin //print the DMX Pallet Label
    SendString:=STX+'00210'+CR;
    VBBarCodeForm.DMXComPort2.PutString(SendString);
    SendString:=STX+'f350'+CR; //inbetween labels
    VBBarCodeForm.DMXComPort2.PutString(SendString);
    SendString:=STX+'L'+CR;
    VBBarCodeForm.DMXComPort2.PutString(SendString);
    SendString:='D11'+CR;
    VBBarCodeForm.DMXComPort2.PutString(SendString);

    SendString:='1911006'+'02300075'+'VB Pallet'+CR; {Product}
    VBBarCodeForm.DMXComPort2.PutString(SendString);

    SendString:='1911006'+'01500060'+'Number:'+inttostr(InputPalletNo)+CR; {Product}
    VBBarCodeForm.DMXComPort2.PutString(SendString);

    SendString:='1D62040'+'00300060'+'18'+ZeroFill(InputPalletNo,6)+CR; {Lot #}
    VBBarCodeForm.DMXComPort2.PutString(SendString);

    SendString:='E'+CR;
    VBBarCodeForm.DMXComPort2.PutString(SendString);
  end
  else if VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='C4P' then //added DL031117
  begin //print the C4P Pallet Label
    AssignFile(MyFile, 'LPT1:');
    Rewrite(MyFile);
    Writeln(MyFile, '');
//    Writeln(MyFile, 'ON'); //leave out ,D
    Writeln(MyFile, 'Q607,15');
    Writeln(MyFile, 'q607');
    Writeln(MyFile, 'S3'); //fastest speed
    Writeln(MyFile, 'D10');
    Writeln(MyFile, 'ZB'); //ZB reverse label (downwards) 180 degrees; ZT normal
    Writeln(MyFile, 'JF');
    Writeln(MyFile, 'N');

    Writeln(MyFile, 'X22,40,2,585,563');

    Writeln(MyFile, 'A65,120,0,5,1,1,N,"VB PALLET"');
    Writeln(MyFile, 'A65,200,0,5,1,1,N,"NUMBER: '+inttostr(InputPalletNo)+'"');
    Writeln(MyFile, 'B65,280,0,2,2,6,64,B,"18'+ZeroFill(InputPalletNo,6)+'"');
    //EndLabel
    Writeln(MyFile, 'P1');
    CloseFile(MyFile);
  end;
end;

end.
