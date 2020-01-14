unit Vbmaint;
//all the 'LH' Levolor additions added DL230899
//all the 'IA' ITA, Inc. additions added DL041013
//added AV labelstructure DL100318

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBLookup, Buttons, DBTables, Mask, ExtCtrls,
  AdPort, Spin, Menus, OoMisc;

type
  TVBMaintForm = class(TForm)
    ScrollBox: TScrollBox;
    EditVBSTRU: TDBEdit;
    EditVBCOL: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    EditBOXNO: TDBEdit;
    Label6: TLabel;
    EditDATEMANU: TDBEdit;
    Label7: TLabel;
    EditFAULTS: TDBEdit;
    Label8: TLabel;
    EditStripNo: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    EditGROSSLENGTH: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    VBRcptSource: TDataSource;
    Panel2: TPanel;
    VBRcpt: TTable;
    Label11: TLabel;
    Label12: TLabel;
    DateManuSpdBtn: TSpeedButton;
    RollSearchSpdBtn: TSpeedButton;
    EditMetricWidth: TDBLookupCombo;
    VBWidth: TTable;
    VBWidthSource: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EditWarpNo: TDBEdit;
    EditPieceNo: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    PostBtn: TButton;
    CancelBtn: TButton;
    CloseBitBtn: TBitBtn;
    SetDefaultsBtn: TButton;
    ModeIndicator: TLabel;
    AllegroComPort2: TApdComPort;
    VBRcptVBSTRU: TStringField;
    VBRcptVBCOL: TStringField;
    VBRcptBOXNO: TIntegerField;
    VBRcptDATEMANU: TDateTimeField;
    VBRcptFAULTS: TSmallintField;
    VBRcptGROSSLENGTH: TFloatField;
    VBRcptWARPNO: TIntegerField;
    VBRcptPIECENO: TSmallintField;
    Label17: TLabel;
    VBRcptINITIALS: TStringField;
    VBRcptDESPNO: TIntegerField;
    EditDespNo: TDBEdit;
    Label19: TLabel;
    VBRcptDATERCVD: TDateTimeField;
    EditDateRcvd: TDBEdit;
    Label20: TLabel;
    VBRcptSTRIPNO: TSmallintField;
    VBRcptQLTY: TStringField;
    EditQlty: TDBComboBox;
    CheckBoxCountQuery: TQuery;
    VBRcptROLLNO: TIntegerField;
    CheckBoxContentsQuery: TQuery;
    CheckBoxContentsQueryVBSTRU: TStringField;
    CheckBoxContentsQueryVBCOL: TStringField;
    VBRcptLOTNO: TIntegerField;
    CheckBoxContentsQueryLOTNO: TIntegerField;
    CheckBoxContentsQueryQLTY: TStringField;
    VBWidthIMPERIALWIDTH: TStringField;
    VBWidthMETRICLABELDESCR: TStringField;
    VBRcptMETRICWIDTH: TSmallintField;
    VBWidthMETRICWIDTH: TSmallintField;
    CheckBoxContentsQueryMETRICWIDTH: TSmallintField;
    Label21: TLabel;
    Label22: TLabel;
    VBRcptLONGLENGTH: TFloatField;
    EditLongLength: TDBEdit;
    EditLotNo: TDBEdit;
    EditInitials: TDBEdit;
    ChangePrinter: TButton;
    VBRcptPALLETNO: TIntegerField;
    Label23: TLabel;
    EditPalletNo: TDBEdit;
    VBRcptNETLENGTH: TFloatField;
    EditNetLength: TDBEdit;
    VBRcptALLOWANCE: TFloatField;
    EditAllowance: TDBEdit;
    LabelCount: TEdit;
    Label24: TLabel;
    Timer1: TTimer;
    Label25: TLabel;
    EditRollNo: TDBEdit;
    UniqueStripSearch: TSpeedButton;
    EditLabelStru: TDBComboBox;
    Label26: TLabel;
    Label27: TLabel;
    EditGreigeNo: TDBEdit;
    VBRcptGREIGENO: TSmallintField;
    NextStripQuery: TQuery;
    Label28: TLabel;
    VBRcptRETURNED: TStringField;
    EditReturned: TDBEdit;
    CheckBoxContentsQueryPALLETNO: TIntegerField;
    CheckBoxContentsQueryDESPNO: TIntegerField;
    CheckBoxContentsQueryVTORDNO: TIntegerField;
    VBRcptVTORDNO: TIntegerField;
    VBRcptROWNO: TIntegerField;
    EditVTOrdNo: TDBEdit;
    EditRowNo: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    VBMaintPopupMenu: TPopupMenu;
    ChangeBoxInfo1: TMenuItem;
    ChangeStripInfo1: TMenuItem;
    VBRcptDATERQD: TDateTimeField;
    VBRcptDATEMOD: TDateTimeField;
    VBRcptUSERMOD: TStringField;
    Label31: TLabel;
    Label32: TLabel;
    ShowDatePicked: TDBEdit;
    ShowDateMod: TDBEdit;
    ShowUserMod: TDBEdit;
    MyQuery: TQuery;
    VBRcptDESPDATE: TDateTimeField;
    VBRcptFINNO: TIntegerField;
    VBRcptVBFIN: TStringField;
    Label1: TLabel;
    EditFinNo: TDBEdit;
    Label18: TLabel;
    EditVBFin: TDBEdit;
    Label33: TLabel;
    CheckBoxContentsQueryVBFIN: TStringField;
    CheckBoxContentsQueryCOUNT: TIntegerField;
    Label34: TLabel;
    Label35: TLabel;
    EditDespDate: TDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    EditIndexField: TEdit;
    Label38: TLabel;
    LabelCountBtn: TSpinButton;
    BoxQuery: TQuery;
    BoxQueryLOTNO: TIntegerField;
    BoxQueryBOXNO: TIntegerField;
    BoxQueryDATEMANU: TDateTimeField;
    BoxQueryFAULTS: TSmallintField;
    BoxQuerySTRIPNO: TSmallintField;
    BoxQueryGROSSLENGTH: TFloatField;
    BoxQueryALLOWANCE: TFloatField;
    BoxQueryROLLNO: TIntegerField;
    BoxQueryNETLENGTH: TFloatField;
    LabelsSpdBtn: TSpeedButton;
    PrintSpdBtn: TSpeedButton;
    Label39: TLabel;
    EditSEQNO: TDBEdit;
    VBRcptSEQNO: TIntegerField;
    VBRcptQLTYREASON: TStringField;
    EditQLTYREASON: TDBLookupComboBox;
    QltyReason: TTable;
    QltyReasonQLTYREASON: TStringField;
    QltyReasonDESCR: TStringField;
    QltyReasonFIRSTQLTY: TStringField;
    QltyReasonSource: TDataSource;
    Label40: TLabel;
    CheckBoxContentsQueryQLTYREASON: TStringField;
    BoxSearchSpdBtn: TSpeedButton;
    GenRollNoProc: TStoredProc;
    VBTypeQuery: TQuery;
    VBTypeQuerySTYLEDESCR: TStringField;
    VBTypeQueryCOLORDESCR: TStringField;
    VBTypeQueryPARTNO: TStringField;
    VBTypeQueryLABELDESCR: TStringField;
    VBTypeQueryDESCR: TStringField;
    VBRcptLABELSTRU: TStringField;
    CheckBoxContentsQueryLABELSTRU: TStringField;
    VBTypeQuerySTRIPSPERCARTON: TIntegerField;
    VBTypeQueryLABELSPERSTRIP: TIntegerField;
    VBRcptLABELSTRUCUSTREF: TStringField;
    Label41: TLabel;
    EditCustRef: TDBEdit;
    qryCustPart: TQuery;
    qryCustPartDESCR: TStringField;
    qryCustPartSTYLEDESCR: TStringField;
    qryCustPartPARTNO: TStringField;
    btnReprint: TButton;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VBRcptAfterCancel(DataSet: TDataset);
    procedure VBRcptAfterDelete(DataSet: TDataset);
    procedure VBRcptAfterPost(DataSet: TDataset);
    procedure VBRcptBeforeCancel(DataSet: TDataset);
    procedure VBRcptBeforeDelete(DataSet: TDataset);
    procedure VBRcptBeforeEdit(DataSet: TDataset);
    procedure VBRcptNewRecord(DataSet: TDataset);
    procedure VBRcptSourceStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetDefaultsBtnClick(Sender: TObject);
    procedure RollSearchSpdBtnClick(Sender: TObject);
    procedure DateManuSpdBtnClick(Sender: TObject);
    procedure EditFAULTSChange(Sender: TObject);
    procedure VBRcptBeforePost(DataSet: TDataset);
    procedure ChangePrinterClick(Sender: TObject);
    procedure LabelCountBtnDownClick(Sender: TObject);
    procedure LabelCountBtnUpClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure UniqueStripSearchClick(Sender: TObject);
    procedure VBRcptBeforeInsert(DataSet: TDataSet);
    procedure VBRcptPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ChangeStripInfo1Click(Sender: TObject);
    procedure ChangeBoxInfo1Click(Sender: TObject);
    procedure EditIndexFieldExit(Sender: TObject);
    procedure LabelsSpdBtnClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure BoxSearchSpdBtnClick(Sender: TObject);
    procedure EditLabelStruChange(Sender: TObject);
  private
    { private declarations }
    BarCodePrinterReady:boolean; {added DL 170596}
    DefaultsSet:boolean;
    LabelDescr:string[8]; {was 8 (made 6) DL151096} //back to 8 DL081001
    StyleDescr:string[8];
    ColorDescr:string[9];
    LabelStru:string[2];
    PartNo:string[11];
    VBStru:String[3]; //was 1 DL060901
    VBCol:String[3];
    VBFin:string[2]; {DL100198}
    Heading:string[25]; //added DL260499
    LotNo:longint;
    MetricWidth:Integer;
    DateManu:real;
    GrossLength:real;
    WarpNo:Integer;
    GreigeNo:integer;
    FinNo:integer;
    PieceNo:Integer;
    {BoxNo:Integer;}
    Qlty:string[1];
    QltyReasn: string[2];  //JT190798
    TempDate:TDateTime;
    InChangeMode:string[1]; {added DL170797}
    OldBoxNo:integer; {DL170697 before box number change where InChangeMode='B'}
    OldGrossLength:real;
    OldFaults:real;
    OldLabelStru:string[2]; //added DL230899
    procedure CalcAllowance(Faults:integer;LongLength:real;MetricWidth:integer); //MetricWidth added DL030501
    procedure PrintAllegro;
    procedure SetVBRcptIndex(IndexField: string); //JT060898
  public
    { public declarations }
  end;

var
  VBMaintForm: TVBMaintForm;

implementation

{$R *.DFM}

uses PickDate, VBModal, VBMain, VBUtils,
  VBBarCde, Dialogs, Vbboxlab;

const
  MtrToYds=1.0936; {shouldn't be necessary as defined in VBMain}

procedure TVBMaintForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBMaintForm.PostBtnClick(Sender: TObject);
begin
{  if InChangeMode='B' then
xxx
  else}
    VBRcpt.Post;
end;

procedure TVBMaintForm.CancelBtnClick(Sender: TObject);
begin
  VBRcpt.Cancel;
end;

procedure TVBMaintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VBRcpt.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  qryCustPart.Close; //added DL230400
  VBRcpt.Close;
  VBWidth.Close;
//  VBNextNo.Close;
  VBTypeQuery.Close;
  QltyReason.Close;
//  VBBarCodeForm.UBIComPort2.Open:=false;
  VBBarCodeForm.CloseComPort2; //added DL191098
  VBMaintForm.Release;
end;

procedure TVBMaintForm.VBRcptAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  EditDateManu.ReadOnly:=false;
  EditDateManu.Color:=clWindow;
  EditGrossLength.ReadOnly:=false;
  EditGrossLength.Color:=clWindow;
  EditFaults.ReadOnly:=false;
  EditFaults.Color:=clWindow;
  EditBoxNo.ReadOnly:=false;
  EditBoxNo.Color:=clWindow;
  EditStripNo.ReadOnly:=false;
  EditStripNo.Color:=clSilver;
{  VBRcpt.Refresh;
  VBNextNo.Refresh;
  MainForm.Database.StartTransaction;}
end;

procedure TVBMaintForm.VBRcptAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBMaintForm.PrintAllegro;
{var
  SendString:string;
  GrossYards,NetYards,AllowYards:real;
  YdsString:string;
  TempNetFloat:real;
  TempNetInt,TempLotNo:longint;
  TempLotNoStr,TempNetWidth,TempNet,TempFaults:string;}
begin
{  AllegroComPort2.Open:=true;
  SendString:=STX+'00210'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:=STX+'f350'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:=STX+'L'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='D11'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'00850010'+'B067025001001'+CR; 3.5"
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'01100010'+'B067030001001'+CR; 89 mm
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'00850077'+'B072025001001'+CR; 150m
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'01100077'+'B072030001001'+CR; 164yrds
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'00850149'+'B067025001001'+CR; Allow
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'01100149'+'B067030001001'+CR; Allow
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'00850216'+'B080025001001'+CR; Nett
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'01100216'+'B080030001001'+CR; Nett
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'01400010'+'B139030001001'+CR; Date
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'01400149'+'B067030001001'+CR; Faults
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'01400216'+'B080030001001'+CR; Slit No.
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'01700010'+'B206060001001'+CR; Product
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'01700216'+'B080030001001'+CR; Blank box
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'02000216'+'B080030001001'+CR; Lot #
  AllegroComPort2.PutString(SendString);
  SendString:='1X11000'+'00150010'+'B286070001001'+CR; Bar Code
  AllegroComPort2.PutString(SendString);
  SendString:='191100102150020'+'Product'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100102170220'+'Lot #'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100101870220'+'Carton #'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100701800020'+LabelDescr+' '+VBRcptQlty.AsString+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100402000220'+VBRcptLotNo.AsString+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100401700220'+VBRcptBoxNo.AsString+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100101570020'+'Date Manu.'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100101570150'+'Faults'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100101570220'+'Strip'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100401400020'+
    FormatDateTime('mmm dd, yyyy', VBRcptDateManu.Value)+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100401400150'+VBRcptFaults.AsString+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100401400220'+VBRcptStripNo.AsString+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100101270020'+'Width'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100101270080'+'Gross'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100101270150'+'Allowance'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100101270220'+'Nett'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100401100020'+VBWidthMetricLabelDescr.AsString+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100401100080'+VBRcptGrossLength.AsString+' mtr'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100401100150'+VBRcptAllowance.AsString+' mtr'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100401100220'+VBRcptNetLength.AsString+' mtr'+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='191100400900020'+VBWidthImperialWidth.Value+CR;
  AllegroComPort2.PutString(SendString);
  GrossYards:=int(VBRcptGrossLength.AsFloat*mtrTOyds*10+0.5)/10;
  AllowYards:=int(VBRcptAllowance.Value*mtrTOyds*10+0.5)/10;
  NetYards:=int((GrossYards-AllowYards)*10+0.5)/10;
  YdsString:=floattostrf(GrossYards,ffFixed,5,1);
  SendString:='191100400900080'+YdsString+'yds'+CR;
  AllegroComPort2.PutString(SendString);
  YdsString:=floattostrf(AllowYards,ffFixed,3,1);
  SendString:='191100400900150'+YdsString+' yds'+CR;
  AllegroComPort2.PutString(SendString);
  YdsString:=floattostrf(NetYards,ffFixed,5,1);
  SendString:='191100400900220'+YdsString+' yds'+CR;
  AllegroComPort2.PutString(SendString);
  TempNetFloat:=int(VBRcptNetLength.Value*10);
  TempNetInt:=trunc(TempNetFloat);
  TempLotNo:=VBRcptLotNo.AsInteger-100000;
  TempLotNoStr:=ZeroFill(TempLotNo,3);
  TempNetWidth:=ZeroFill(VBRcptMetricWidth.AsInteger,3);
  TempNet:=ZeroFill(TempNetInt,4);
  TempFaults:=ZeroFill(VBRcptFaults.AsInteger,2);
  SendString:='1A3102000500020'+
    LabelDescr+TempLotNoStr+TempNetWidth+TempNet+TempFaults+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='1A3102000200020'+'14'+
    ZeroFill(VBRcptWarpNo.AsInteger,6)+
    ZeroFill(VBRcptPieceNo.AsInteger,2)+
    ZeroFill(VBRcptStripNo.AsInteger,2)+CR;
  AllegroComPort2.PutString(SendString);
  SendString:='E'+CR;
  AllegroComPort2.PutString(SendString);}
end;
(*  //JT170698  redone below
procedure TVBMaintForm.VBRcptAfterPost(DataSet: TDataset);
var
  ix:integer;
begin
  MainForm.Database.Commit; //DL170698 was at eo routine
  if ChangePrinter.Caption='Allegro' then
    PrintAllegro
  else
  begin
    Timer1.Enabled:=true;
    //add a TQuery which is used if InChangeMode='B' (box change)
    //that finds the box and prints all the strips in the box
    //labelcount times and then prints the box label
    for ix:=1 to strtoint(LabelCount.Text) do
    begin
      if VBRcptLabelStru.Value='H' then {14/7/96 DL Print the Hunter Douglas label}
        VBBarCodeForm.PrintUBI_HD(
          StyleDescr,ColorDescr,LabelDescr, {labeldescr added DL151096}
          PartNo,VBRcptLotNo.Value,
          VBRcptBoxNo.Value,VBRcptDateManu.Value,
          VBRcptFaults.Value,VBRcptStripNo.Value,
          VBWidthImperialWidth.Value,
          VBRcptGrossLength.Value,VBRcptAllowance.Value,VBRcptRollNo.Value)
      else {as normal - for Vrede Textiles}
        {17/5/96 DL Print the label as many times as required}
        VBBarCodeForm.PrintUBI_VT(LabelDescr,VBRcptQlty.Value,
          VBRcptLotNo.Value,
          VBRcptBoxNo.Value,VBRcptDateManu.Value,VBRcptFaults.Value,
          VBRcptStripNo.Value,
          VBWidthMetricLabelDescr.Value,VBWidthImperialWidth.Value,
          VBRcptGrossLength.Value,VBRcptAllowance.Value,
          VBRcptNetLength.Value,VBRcptRollNo.Value);
      {delay until label has finished printing before sending next one}
      BarCodePrinterReady:=false;
      while not BarCodePrinterReady do
        Application.ProcessMessages;
    end;
    Timer1.Enabled:=false;
  end;
  InChangeMode:='S'; {ready for the next edit}
end;
*)

procedure TVBMaintForm.VBRcptAfterPost(DataSet: TDataset);
var
  ix:integer;
begin
  MainForm.Database.Commit; //DL170698 was at eo routine
  if ChangePrinter.Caption='Allegro' then
    PrintAllegro
  else
  begin
    Timer1.Enabled:=true;
    //add a TQuery which is used if InChangeMode='B' (box change)
    //that finds the box and prints all the strips in the box
    //labelcount times and then prints the box label
    if InChangeMode = 'B' then  //added JT170698 reprint all labels if box changed
    begin
      BoxQuery.Params[0].AsInteger := VBRcptBoxNo.Value;
      BoxQuery.Open;
      while not BoxQuery.EOF do
      begin
        for ix:=1 to strtoint(LabelCount.Text) do
        begin
          //14/7/96 DL Print the Hunter Douglas label; added LH for Levolor DL230899
          //IA added DL041013
          if (VBRcptLabelStru.Value='HD') or (VBRcptLabelStru.Value='LH') or (VBRcptLabelStru.Value='IA') then
            VBBarCodeForm.PrintUBI_HD(
              StyleDescr,ColorDescr,LabelDescr, {labeldescr added DL151096}
              PartNo,BoxQueryLotNo.Value,
              VBRcptBoxNo.Value,BoxQueryDateManu.Value,
              BoxQueryFaults.Value,BoxQueryStripNo.Value,
              VBWidthImperialWidth.Value,
              BoxQueryGrossLength.Value,BoxQueryAllowance.Value,BoxQueryRollNo.Value,
              VBRcptLabelStru.Value)
          else {as normal - for Vrede Textiles}
            {17/5/96 DL Print the label as many times as required}
            VBBarCodeForm.PrintUBI_VT(LabelDescr,VBRcptQlty.Value,
              BoxQueryLotNo.Value,
              VBRcptBoxNo.Value,BoxQueryDateManu.Value,BoxQueryFaults.Value,
              BoxQueryStripNo.Value,
              VBWidthMetricLabelDescr.Value,VBWidthImperialWidth.Value,
              BoxQueryGrossLength.Value,BoxQueryAllowance.Value,
              BoxQueryNetLength.Value,BoxQueryRollNo.Value,
              StyleDescr,ColorDescr,PartNo,Heading); // added DL250499 xx
          {delay until label has finished printing before sending next one}
          BarCodePrinterReady:=false;
          while not BarCodePrinterReady do
            Application.ProcessMessages;
        end;
        BoxQuery.Next;
      end;
      BoxQuery.Close;
      //Print box labels here?
    end
    else  //InChangeMode <> 'B'
    begin
      for ix:=1 to strtoint(LabelCount.Text) do
      begin
        //14/7/96 DL Print the Hunter Douglas or Levolor Label
        //IA added DL041013
        if (VBRcptLabelStru.Value='HD') or (VBRcptLabelStru.Value='LH')  or (VBRcptLabelStru.Value='IA') then
          VBBarCodeForm.Print_HD( //was PrintUBI_HD DL191098
            StyleDescr,ColorDescr,LabelDescr, {labeldescr added DL151096}
            PartNo,VBRcptLotNo.Value,
            VBRcptBoxNo.Value,VBRcptDateManu.Value,
            VBRcptFaults.Value,VBRcptStripNo.Value,
            VBWidthImperialWidth.Value,
            VBRcptGrossLength.Value,VBRcptAllowance.Value,VBRcptRollNo.Value,
            VBRcptLabelStru.AsString) //LabelStru added DL230899
        else {as normal - for Vrede Textiles}
          {17/5/96 DL Print the label as many times as required}
          VBBarCodeForm.Print_VT(LabelDescr,VBRcptQlty.Value, //was PrintUBI_VT DL191098
            VBRcptLotNo.Value,
            VBRcptBoxNo.Value,VBRcptDateManu.Value,VBRcptFaults.Value,
            VBRcptStripNo.Value,
            VBWidthMetricLabelDescr.Value,VBWidthImperialWidth.Value,
            VBRcptGrossLength.Value,VBRcptAllowance.Value,
            VBRcptNetLength.Value,VBRcptRollNo.Value,
            StyleDescr,ColorDescr,PartNo,Heading);
        {delay until label has finished printing before sending next one}
        BarCodePrinterReady:=false;
        while not BarCodePrinterReady do
          Application.ProcessMessages;
      end;
    end;
    Timer1.Enabled:=false;
  end;
  InChangeMode:='S'; {ready for the next edit}
end;

procedure TVBMaintForm.VBRcptBeforeCancel(DataSet: TDataset);
begin
  if VBRcpt.State=dsInsert then
    if MessageDlg('Cancel VB receipt being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TVBMaintForm.VBRcptBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete VB receipt?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TVBMaintForm.VBRcptBeforeEdit(DataSet: TDataset);
begin
  OldBoxNo:=0; {added DL170697}
  OldLabelStru:=VBRcptLABELSTRU.AsString; //added DL230899
  //added if picked or on pallet shouldn't be allowed to edit DL271098
  if (VBRcptDespNo.AsInteger<>0) or (VBRcptVTORDNO.AsInteger<>0)
    or (VBRcptPALLETNO.AsInteger<>0) then
  begin
    ShowMessage('Cannot edit as on despatch, picked or on pallet!');
    InChangeMode:='S';
    Abort;
  end;
  if (VBRcptROWNO.AsInteger>=9900) and (VBRcptROWNO.AsInteger<=9999) then
  begin
    ShowMessage('Cannot edit as on at another warehouse!');
    InChangeMode:='S';
    Abort;
  end;
  OldBoxNo:=VBRcptBoxNo.AsInteger; {added DL170697}
  OldGrossLength:=VBRcptGrossLength.AsFloat;
  OldFaults:=VBRcptFaults.AsInteger;
  MainForm.Database.StartTransaction;
  TempDate:=VBRcptDATEMANU.Value;
end;

procedure TVBMaintForm.VBRcptNewRecord(DataSet: TDataset);
begin
  OldBoxNo:=0; {DL170697}
  {defaults must be set}
  if not DefaultsSet then
  begin
    MainForm.Database.Rollback;
    raise Exception.Create('Set Defaults first');
  end;
  VBRcptSeqNo.AsInteger:=0; //added DL070998 xx what about returns?
  GenRollNoProc.ExecProc;    //added JT070998  Generate next RollNo
  VBRcptRollNo.Value := GenRollNoProc.Params[0].AsInteger;
(*removed DL079898
  if VBNextNo.FindKey([NextRollNoRef]) then
  begin
    VBNextNo.Edit;
    {EditRollNo.ReadOnly:=false;}
    VBRcptRollNo.Value:=VBNextNoNextNo.Value;
    {EditRollNo.ReadOnly:=true;}
    VBNextNoNextNo.Value:=VBNextNoNextNo.Value+1;
    VBNextNo.Post;
  end
  else
  begin
    {duplicate key set here for safety so that a YarnRcpt}
    {Post causes an error}
    VBRcptStripNo.Value:=1;
    ShowMessage('Problem getting next Strip Number.  Please call David');
  end;*)
  {find the next strip number}
  NextStripQuery.Close; {prepared in form show}
  NextStripQuery.SQL.Clear;
  NextStripQuery.SQL.Add('select max(stripno)');
  NextStripQuery.SQL.Add('from vbrcpt');
  NextStripQuery.SQL.Add('where warpno=:warpno');
  NextStripQuery.SQL.Add('and greigeno=:greigeno');
  NextStripQuery.SQL.Add('and finno=:finno');
  NextStripQuery.SQL.Add('and pieceno=:pieceno');
  NextStripQuery.Prepare;
  NextStripQuery.Params[0].AsInteger:=WarpNo;
  NextStripQuery.Params[1].AsInteger:=GreigeNo;
  NextStripQuery.Params[2].AsInteger:=FinNo;
  NextStripQuery.Params[3].AsInteger:=PieceNo;
  NextStripQuery.Open;
  EditStripNo.ReadOnly:=false;
  VBRcptStripNo.Value:=NextStripQuery.Fields[0].AsInteger+1;
  EditStripNo.ReadOnly:=true;
  NextStripQuery.Close;
  {if VBNextNo.FindKey([NextStripNoRef]) then
  begin
    VBNextNo.Edit;
    EditStripNo.ReadOnly:=false;
    VBRcptStripNo.Value:=VBNextNoNextNo.Value;
    EditStripNo.ReadOnly:=true;
    VBNextNoNextNo.Value:=VBNextNoNextNo.Value+1;
    VBNextNo.Post;
  end
  else
  begin
    {duplicate key set here for safety so that a YarnRcpt}
    {Post causes an error}
    {VBRcptStripNo.Value:=1;
    ShowMessage('Problem getting next Strip Number.  Please call David');
  end;}
{  if VBNextNo.FindKey([NextPieceNoRef]) then {get current piece number}
{    VBRcptPieceNo.Value:=VBNextNoNextNo.Value-1;}
  VBRcptFinNo.Value:=FinNo;
  VBRcptPieceNo.Value:=PieceNo;
  EditAllowance.ReadOnly:=false;
  VBRcptAllowance.Value:=0;
  EditAllowance.ReadOnly:=true;
  EditNetLength.ReadOnly:=false;
  VBRcptNetLength.Value:=0;
  EditNetLength.ReadOnly:=true;
  EditDespNo.ReadOnly:=false;
  VBRcptDespNo.Value:=0; {despatch number}
  EditDespNo.ReadOnly:=true;
  EditPalletNo.ReadOnly:=false;
  VBRcptPalletNo.Value:=0;
  EditPalletNo.ReadOnly:=true;
  EditDateRcvd.ReadOnly:=false;
  VBRcptDateRcvd.Value:=date;
  EditDateRcvd.ReadOnly:=true;
  VBRcptLongLength.Value:=0;
  EditInitials.ReadOnly:=false;
  VBRcptInitials.Value:=UserInitials;
  EditInitials.ReadOnly:=true;
  VBRcptDateMod.Value:=now; {added DL170697}
  VBRcptUserMod.Value:=UserInitials; {added DL170697}
  EditReturned.ReadOnly:=false; {added DL241096}
  VBRcptReturned.Value:='N'; {don't know if Y rqd here}
  EditReturned.ReadOnly:=true;
  {defaults are set}
  EditVBStru.ReadOnly:=false;
  EditVBCol.ReadOnly:=false;
  EditVBFin.ReadOnly:=false;
  EditLabelStru.ReadOnly:=false;
  EditDateManu.ReadOnly:=false;
  EditLotNo.ReadOnly:=false;
  EditMetricWidth.ReadOnly:=false;
  EditGrossLength.ReadOnly:=false;
  EditWarpNo.ReadOnly:=false;
  EditFinNo.ReadOnly:=false;
  EditPieceNo.ReadOnly:=false;
  EditStripNo.ReadOnly:=false;
  EditQlty.ReadOnly:=false;
  EditQltyReason.ReadOnly:=false; //DL230798
  VBRcptVBStru.Value:=VBStru;
  VBRcptVBCol.Value:=VBCol;
  VBRcptVBFin.Value:=VBFin;
  VBRcptLabelStru.Value:=LabelStru;
  VBRcptDateManu.Value:=DateManu;
  VBRcptLotNo.Value:=LotNo;
  VBRcptMetricWidth.Value:=MetricWidth;
  VBRcptGrossLength.Value:=GrossLength;
  VBRcptWarpNo.Value:=WarpNo;
  VBRcptGreigeNo.Value:=GreigeNo;
  VBRcptFinNo.Value:=FinNo;
  VBRcptPieceNo.Value:=PieceNo;
  VBRcptQlty.Value:=Qlty;
  VBRcptQltyReason.AsString := QltyReasn;   //JT190798
  EditVBStru.ReadOnly:=true;
  EditVBCol.ReadOnly:=true;
  EditVBFin.ReadOnly:=true;
  EditLabelStru.ReadOnly:=true;
  EditDateManu.ReadOnly:=true;
  EditLotNo.ReadOnly:=true;
  EditMetricWidth.ReadOnly:=true;
  EditGrossLength.ReadOnly:=true;
  EditWarpNo.ReadOnly:=true;
  EditFinNo.ReadOnly:=true;
  EditPieceNo.ReadOnly:=true;
  EditStripNo.ReadOnly:=true;
  EditQlty.ReadOnly:=true;
  EditQltyReason.ReadOnly:=true;  //JT190798
  VBRcptGreigeNo.Value:=GreigeNo;
  EditBoxNo.SetFocus;
end;

procedure TVBMaintForm.VBRcptSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := VBRcpt.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := VBRcpt.State = dsBrowse;
  if VBRcpt.State = dsEdit then
  begin
    if InChangeMode='S' then
      ModeIndicator.Caption := 'Edit: Changing Strip Details'
    else
      if InChangeMode='B' then
        ModeIndicator.Caption := 'Edit: Changing Box Details';
    ModeIndicator.Font.Color := clRed;
  end
  else
    if VBRcpt.State = dsInsert then
    begin
      ModeIndicator.Caption := 'Receive';
      ModeIndicator.Font.Color := clRed;
    end
    else
    begin
      ModeIndicator.Caption := 'Browse';
      ModeIndicator.Font.Color := clBlue;
    end;
end;

procedure TVBMaintForm.FormShow(Sender: TObject);
begin
  LabelCount.Text:=inttostr(2); {default label count}
  CheckBoxCountQuery.Active:=false;
  CheckBoxContentsQuery.Active:=false;
  VBRcpt.Open;
  VBWidth.Open;
//  VBNextNo.Open;
  VBTypeQuery.Open;
  QltyReason.Open;
{  MainForm.Database.StartTransaction;}
  VBRcpt.Refresh;
  VBWidth.Refresh;
//  VBNextNo.Refresh;
//  VBType.Refresh;
  DefaultsSet:=false;
  VBStru:='';
  VBCol:='';
  VBFin:='';
  LotNo:=0;
  MetricWidth:=0;
  DateManu:=0;
  GrossLength:=0;
  WarpNo:=0;
  GreigeNo:=0;
  FinNo:=0;
  PieceNo:=0;
  Qlty:='';
  QltyReasn := 'OK';   //JT190798
  LabelStru:=''; {added 160796}
//  VBBarCodeForm.UBIComPort2.Open:=true; removed DL191098
  VBBarCodeForm.OpenComPort2; //added DL191098
//  VBBarCodeForm.FetchString;    {get rid of characters in buffer} removed DL191098
  InChangeMode:='S'; {defaults to changing strips}
end;

procedure TVBMaintForm.SetDefaultsBtnClick(Sender: TObject);
begin
  if not DefaultsSet then {set defaults}
  begin
    if(VBRcptLabelStru.Value='') or
      (VBRcptMetricWidth.Value=0) or
      (VBRcptDateManu.Value=0) or
      (VBRcptGrossLength.Value=0) then
      begin
        ShowMessage('Cannot Set defaults until all defaults have been set');
        Abort;
      end;
    VBStru:=VBRcptVBStru.AsString;
    VBCol:=VBRcptVBCol.AsString;
    VBFin:=VBRcptVBFin.AsString;
    LabelStru:=VBRcptLabelStru.AsString;
    LotNo:=VBRcptLotNo.AsInteger;
    MetricWidth:=VBRcptMetricWidth.AsInteger;
    DateManu:=VBRcptDateManu.AsFloat;
    GrossLength:=VBRcptGrossLength.AsFloat;
    WarpNo:=VBRcptWarpNo.AsInteger;
    GreigeNo:=VBRcptGreigeNo.AsInteger;
    FinNo:=VBRcptFinNo.AsInteger;
    PieceNo:=VBRcptPieceNo.AsInteger;
    {BoxNo:=VBRcptBoxNo.AsInteger;}
    Qlty:=VBRcptQlty.AsString;
    QltyReasn:=VBRcptQltyReason.AsString;   //JT190798
    EditLabelStru.ReadOnly:=true;
    EditDateManu.ReadOnly:=true;
    EditMetricWidth.ReadOnly:=true;
    EditGrossLength.ReadOnly:=true;
    EditStripNo.ReadOnly:=true;
    {EditBoxNo.ReadOnly:=true;}
    EditQlty.ReadOnly:=true;
    EditQltyReason.ReadOnly:=true;    //JT190798
    EditLabelStru.TabStop:=false;
    EditMetricWidth.TabStop:=false;
    EditDateManu.TabStop:=false;
    EditGrossLength.TabStop:=false;
    EditStripNo.TabStop:=false;
    {EditBoxNo.TabStop:=false;}
    EditQlty.TabStop:=false;
    EditQltyReason.TabStop:=false;
    {EditVBCol.Color:=clWindow; {clWindow}
    EditLabelStru.Color:=clWindow;
    EditMetricWidth.Color:=clWindow;
    EditDateManu.Color:=clWindow;
    EditGrossLength.Color:=clWindow;
    EditStripNo.Color:=clWindow;
    {EditBoxNo.Color:=clWindow;}
    EditQlty.Color:=clWindow;
    {EditQltyComboBox.Color:=clWindow;}
    EditQltyReason.Color:=clWindow;  //JT190798
    {EditReturned.Color:=clWindow;}
    DefaultsSet:=true;
    SetDefaultsBtn.Caption:='Clear &Defaults';
    EditBoxNo.SetFocus;
  end
  else {unset defaults}
  begin
    VBStru:='';
    VBCol:='';
    VBFin:='';
    LabelStru:='';
    LotNo:=0;
    MetricWidth:=0;
    DateManu:=0;
    GrossLength:=0;
    WarpNo:=0;
    GreigeNo:=0;
    FinNo:=0;
    PieceNo:=0;
    {BoxNo:=0;}
    Qlty:='';
    QltyReasn := 'OK';         //JT190798
    {EditVBStru.TabStop:=;}
    {EditVBCol.TabStop:=true;}
    EditLabelStru.ReadOnly:=false;
    EditDateManu.ReadOnly:=false;
    EditMetricWidth.ReadOnly:=false;
    EditGrossLength.ReadOnly:=false;
    EditStripNo.ReadOnly:=false;
    {EditBoxNo.ReadOnly:=false;}
    EditLabelStru.ReadOnly:=false;
    EditQlty.ReadOnly:=false;
    EditQltyReason.ReadOnly:=false;
    EditMetricWidth.TabStop:=true;
    EditDateManu.TabStop:=true;
    EditGrossLength.TabStop:=true;
    EditStripNo.TabStop:=true;
    {EditBoxNo.TabStop:=true;}
    EditQlty.TabStop:=true;
    EditQltyReason.TabStop:=true;
    {EditVBCol.Color:=clWindow; {clWindow}
    EditLabelStru.Color:=clWindow;
    EditMetricWidth.Color:=clWindow;
    EditDateManu.Color:=clWindow;
    EditGrossLength.Color:=clWindow;
    EditStripNo.Color:=clWindow;
    {EditBoxNo.Color:=clWindow;}
    EditQlty.Color:=clWindow;
    EditQltyReason.Color:=clWindow;
    {EditQltyComboBox.Color:=clWindow;}
    {EditReturned.Color:=clWindow;}
    DefaultsSet:=false;
    SetDefaultsBtn.Caption:='Set &Defaults';
    EditLotNo.SetFocus;
  end;
end;

procedure TVBMaintForm.RollSearchSpdBtnClick(Sender: TObject);
begin
  if VBRcpt.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    Screen.Cursor:=crHourGlass;
    if VBPickDlgForm.ShowModalVBRoll = mrOk then
    begin
      SetVBRcptIndex('ROLLNO');   //JT060898
      VBRcpt.SetKey;
      VBRcpt.FieldByName('RollNo').AsInteger:=VBPickDlgForm.RollNo;
      {VBRcpt.FieldByName('WarpNo').AsInteger:=VBPickDlgForm.WarpNo;
      VBRcpt.FieldByName('PieceNo').AsInteger:=VBPickDlgForm.PieceNo;
      VBRcpt.FieldByName('StripNo').AsInteger:=VBPickDlgForm.StripNo;}
      VBRcpt.GotoKey;
    end;
    Screen.Cursor:=crDefault;
  end;
end;

procedure TVBMaintForm.DateManuSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=VBRcptDateManu.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    VBRcpt.Edit;
    VBRcptDateManu.Value:=BRDateForm.Date;
  end;
end;

procedure TVBMaintForm.CalcAllowance(Faults:integer;LongLength:real;MetricWidth:integer); //MetricWidth added DL030501
var
  Allowance:real;
begin
  if MetricWidth=0 then //added DL030501: shouldn't happen, but just in case
  begin
    ShowMessage('MetricWidth = 0; Please tell David');
    MetricWidth:=89;
  end;
  Allowance:=0;
  LongLength:=0;
  if VBRcptGrossLength.Value=0 then
  begin
    VBRcptFaults.Value:=0;
    {Faults:=0; hint said not reqd xx}
  end
  else
  begin
    //if Faults<=6 then - removed DL030501
    if MetricWidth>=1850 then //.5m per fault: DL 030501 - was 2070 DL021212 - was 2000 DL031217
      Allowance:=(Faults/2)+LongLength
    else
      Allowance:=Faults+LongLength;
    //else - removed DL030501
    //  if Faults>=11 then - removed DL030501
    //    Allowance:=(Faults*2)+LongLength - removed DL030501
    //  else - removed DL030501
    //    Allowance:=(Faults*1.5)+LongLength; - removed DL030501
    if (Allowance>15) and (VBRcptQlty.Value='') then //15 was 30 DL030501
    begin
      if DefaultsSet then
        EditQlty.ReadOnly:=false;
      EditQlty.ItemIndex:=1; {substandard; 2->2nds 'N'}
      //xx set qltyreason
      //EditQltyReason.Text:='NK';//:=EditQltyReason.Items.IndexOf('NK'); //added DL230798xx
      {VBRcptQlty.Value:='2';  {second if faults>15, ie Allowance>30}
      if DefaultsSet then
        EditQlty.ReadOnly:=true;
    end;
    //IA added DL041013
    if (VBRcptLabelStru.Value='HD') or (VBRcptLabelStru.Value='LH') or (VBRcptLabelStru.Value='IA') then {HunterDouglas Label}
      {convert yds faults length to metres}
      Allowance:=Allowance/mtrToyds;
  end;
  EditAllowance.ReadOnly:=false;
  VBRcptAllowance.Value:=Allowance;
  EditAllowance.ReadOnly:=true;
  EditNetLength.ReadOnly:=false;
  VBRcptNetLength.Value:=VBRcptGrossLength.Value-Allowance;
  EditNetLength.ReadOnly:=true;
end;

procedure TVBMaintForm.EditFAULTSChange(Sender: TObject);
begin
{  CalcAllowance(VBRcptFaults.Value,VBRcptLongLength.Value);}
end;

procedure TVBMaintForm.VBRcptBeforePost(DataSet: TDataset);
begin
  if VBRcptLotNo.Value=0 then
  begin
    ShowMessage('Lot Number is invalid');
    Abort;
  end;
  CalcAllowance(VBRcptFaults.Value,VBRcptLongLength.Value,VBRcptMETRICWIDTH.AsInteger); //MetricWidth added DL030501
  {CheckBoxCountQuery.Active:=false; removed for now DL260396
  CheckBoxCountQuery.Params[0].AsInteger:=VBRcptBoxNo.Value;
  CheckBoxCountQuery.Active:=true;
  with CheckBoxCountQuery.Fields[0] do
    if not IsNull then
      if (AsInteger>2) and (VBRcpt.State=dsInsert) then
      begin
        ShowMessage('Cannot have more than 3 rolls in a box');
        Abort;
      end;}
  if InChangeMode='B' then {added DL170697: changing box details}
  begin
    {change all box details using update box info SQL cursor}
    VBRcptDateMod.Value:=now;
    VBRcptUserMod.Value:=UserInitials;
    VBTypeQuery.Close;
    VBTypeQuery.ParamByName('VBStru').AsString:=VBRcptVBStru.AsString;
    VBTypeQuery.ParamByName('VBCol').AsString:=VBRcptVBCol.AsString;
    VBTypeQuery.ParamByName('VBFin').AsString:=VBRcptVBFin.AsString;
    VBTypeQuery.ParamByName('LabelStru').AsString:=VBRcptLabelStru.AsString;
    VBTypeQuery.Open;
    {LabelStru:=VBTypeLabelStru.Value;}
    if (VBRcptLabelStru.Value='CU') and (not VBRcptLABELSTRUCUSTREF.IsNull) then //override what's found DL230400
    begin
      qryCustPart.Close;
      qryCustPart.ParamByName('CustRef').AsString:=VBRcptLABELSTRUCUSTREF.AsString;
      qryCustPart.ParamByName('VBStru').AsString:=VBRcptVBStru.Value;
      qryCustPart.ParamByName('VBCol').AsString:=VBRcptVBCol.Value;
      qryCustPart.ParamByName('VBFin').AsString:=VBRcptVBFin.Value;
      qryCustPart.ParamByName('VBWidth').AsInteger:=VBRcptMETRICWIDTH.AsInteger;
      qryCustPart.Open;
      if not qryCustPartDESCR.IsNull then
      begin //don't forget to modify for strip change
        LabelDescr:='VT'+VBRcptVBStru.AsString+VBRcptVBCol.AsString;
        PartNo:=qryCustPartPARTNO.AsString;
        StyleDescr:=qryCustPartSTYLEDESCR.AsString;
        ColorDescr:=qryCustPartDESCR.AsString;
        Heading:='Vrede Fabrics'; //was Vertical Reality: DL030501
      end
      else
      begin //originally here
        LabelDescr:=VBTypeQueryLabelDescr.Value;
        PartNo:=VBTypeQueryPartNo.Value;
        StyleDescr:=VBTypeQueryStyleDescr.Value;
        ColorDescr:=VBTypeQueryColorDescr.Value;
        Heading:=VBTypeQueryDescr.Value;
      end;
    end
    else
    begin //originally here
      LabelDescr:=VBTypeQueryLabelDescr.Value;
      PartNo:=VBTypeQueryPartNo.Value;
      StyleDescr:=VBTypeQueryStyleDescr.Value;
      ColorDescr:=VBTypeQueryColorDescr.Value;
      Heading:=VBTypeQueryDescr.Value;
    end;
    {update all the other rolls in this box}
    //xxx allowance not set correctly on all rolls DL230899
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('update vbrcpt');
    MyQuery.SQL.Add('set vbstru='''+VBRcptVBStru.AsString+''',');
    MyQuery.SQL.Add('vbcol='''+VBRcptVBCol.AsString+''',');
    MyQuery.SQL.Add('vbfin='''+VBRcptVBFin.AsString+''',');
    MyQuery.SQL.Add('lotno='+VBRcptLotNo.AsString+',');
    MyQuery.SQL.Add('metricwidth='+VBRcptMetricWidth.AsString+',');
    MyQuery.SQL.Add('qlty='''+VBRcptQlty.AsString+''',');
    MyQuery.SQL.Add('qltyreason='''+VBRcptQltyReason.AsString+''',');
    MyQuery.SQL.Add('labelstru='''+VBRcptLabelStru.AsString+'''');
    MyQuery.SQL.Add('where boxno='+VBRcptBoxNo.AsString);
    MyQuery.SQL.Add('and rollno<>'+VBRcptRollNo.AsString); {otherwise problems}
    MyQuery.Prepare;
    MyQuery.ExecSQL;
    MyQuery.Close;
    EditDateManu.ReadOnly:=false;
    EditDateManu.Color:=clWindow;
    EditGrossLength.ReadOnly:=false;
    EditGrossLength.Color:=clWindow;
    EditFaults.ReadOnly:=false;
    EditFaults.Color:=clWindow;
    EditBoxNo.ReadOnly:=false;
    EditBoxNo.Color:=clWindow;
    EditStripNo.ReadOnly:=false;
    EditStripNo.Color:=clSilver;
    //MainForm.Database.Commit;
  end
  else {InChangeMode='S'->changing strip details}
  begin
    CheckBoxContentsQuery.Active:=false;
    CheckBoxContentsQuery.Params[0].AsInteger:=VBRcptBoxNo.Value; {this is the new box no}
    CheckBoxContentsQuery.Params[1].AsInteger:=VBRcptRollNo.Value; {added DL100198}
    CheckBoxContentsQuery.Active:=true;
    with CheckBoxContentsQuery.Fields[0] do
    begin {added DL160197}
      if not IsNull then
      begin  {added DL160197}
          if (AsString<>VBRcptVBStru.Value) or
           (CheckBoxContentsQuery.Fields[1].AsString<>VBRcptVBCol.Value) or
           (CheckBoxContentsQuery.Fields[2].AsInteger<>VBRcptLotNo.Value) or
           (CheckBoxContentsQuery.Fields[3].AsString<>VBRcptQlty.Value) or
           (CheckBoxContentsQuery.Fields[4].AsInteger<>VBRcptMetricWidth.Value) or
           (CheckBoxContentsQuery.Fields[5].AsString<>VBRcptLabelStru.Value) or
           (CheckBoxContentsQuery.Fields[9].AsString<>VBRcptVBFin.Value) or
           (CheckBoxContentsQuery.Fields[11].AsString<>VBRcptQltyReason.Value) then //added DL230798
          begin
            ShowMessage(
              'Cannot mix VB types or lot numbers or qualities or widths or label structures in a box');
            Abort;
          end;
          if (CheckBoxContentsQuery.Fields[6].AsInteger<>0) then {added DL160197}
          begin
            {this if added to check that box is not on a pallet}
            ShowMessage(
              'Box is already on pallet '+CheckBoxContentsQuery.Fields[6].AsString);
            Abort;
          end;
          if (CheckBoxContentsQuery.Fields[7].AsInteger<>0) then {added DL160197}
          begin
            {this if added to check that box is not on a despatch,}
            {should be impossible considering pallet already checked!}
            ShowMessage(
              'Box is already on despatch '+CheckBoxContentsQuery.Fields[7].AsString);
            Abort;
          end;
          if (CheckBoxContentsQuery.Fields[8].AsInteger<>0) then {added DL160197}
          begin
            {this if added to check that box is not picked}
            ShowMessage(
              'Box is already picked to order '+CheckBoxContentsQuery.Fields[8].AsString);
            Abort;
          end;
      end; {added DL160197}
    end; {added DL160197}
    {with CheckBoxContentsQuery.Fields[1] do
      if not IsNull then
        if AsString<>VBRcptVBCol.Value then
        begin
          ShowMessage('Cannot mix VB types in a box');
          Abort;
        end;}
    if VBRcpt.State =dsEdit then
    begin
      VBRcptDateMod.Value:=now;
      VBRcptUserMod.Value:=UserInitials;
    end;
    VBTypeQuery.Close;
    VBTypeQuery.ParamByName('VBStru').AsString:=VBRcptVBStru.AsString;
    VBTypeQuery.ParamByName('VBCol').AsString:=VBRcptVBCol.AsString;
    VBTypeQuery.ParamByName('VBFin').AsString:=VBRcptVBFin.AsString;
    VBTypeQuery.ParamByName('LabelStru').AsString:=VBRcptLabelStru.AsString;
    VBTypeQuery.Open;
    {LabelStru:=VBTypeLabelStru.Value;}
    if (VBRcptLabelStru.Value='CU') and (not VBRcptLABELSTRUCUSTREF.IsNull) then //override what's found DL230400
    begin
      qryCustPart.Close;
      qryCustPart.ParamByName('CustRef').AsString:=VBRcptLABELSTRUCUSTREF.AsString;
      qryCustPart.ParamByName('VBStru').AsString:=VBRcptVBStru.Value;
      qryCustPart.ParamByName('VBCol').AsString:=VBRcptVBCol.Value;
      qryCustPart.ParamByName('VBFin').AsString:=VBRcptVBFin.Value;
      qryCustPart.ParamByName('VBWidth').AsInteger:=VBRcptMETRICWIDTH.AsInteger;
      qryCustPart.Open;
      if not qryCustPartDESCR.IsNull then
      begin //don't forget to modify for box change
        LabelDescr:='VT'+VBRcptVBStru.AsString+VBRcptVBCol.AsString;
        PartNo:=qryCustPartPARTNO.AsString;
        StyleDescr:=qryCustPartSTYLEDESCR.AsString;
        ColorDescr:=qryCustPartDESCR.AsString;
        Heading:='Vrede Fabrics'; //was Vertical Reality: DL030501
      end
      else
      begin //originally here
        LabelDescr:=VBTypeQueryLabelDescr.Value;
        PartNo:=VBTypeQueryPartNo.Value;
        StyleDescr:=VBTypeQueryStyleDescr.Value;
        ColorDescr:=VBTypeQueryColorDescr.Value;
        Heading:=VBTypeQueryDescr.Value;
      end;
    end
    else
    begin //originally here
      LabelDescr:=VBTypeQueryLabelDescr.Value;
      PartNo:=VBTypeQueryPartNo.Value;
      StyleDescr:=VBTypeQueryStyleDescr.Value;
      ColorDescr:=VBTypeQueryColorDescr.Value;
      Heading:=VBTypeQueryDescr.Value;
    end;
  end;
end;

procedure TVBMaintForm.ChangePrinterClick(Sender: TObject);
begin
  if ChangePrinter.Caption='Allegro' then
    ChangePrinter.Caption:='UBI'
  else
    ChangePrinter.Caption:='Allegro';
end;

procedure TVBMaintForm.LabelCountBtnDownClick(Sender: TObject);
begin
  if strtoint(LabelCount.Text)>0 then
    LabelCount.Text:=inttostr(strtoint(LabelCount.Text)-1);
end;

procedure TVBMaintForm.LabelCountBtnUpClick(Sender: TObject);
begin
  if strtoint(LabelCount.Text)<3 then
    LabelCount.Text:=inttostr(strtoint(LabelCount.Text)+1);
end;

procedure TVBMaintForm.Timer1Timer(Sender: TObject);
begin
  BarCodePrinterReady:=true;
end;

procedure TVBMaintForm.UniqueStripSearchClick(Sender: TObject);
var
  BarCodeStr:string;
  SubStr:string;
begin
  if VBRcpt.Filter<>'' then
    ShowMessage('Please erase Carton Number and then exit the field')
  else
  if VBRcpt.State in [dsInsert,dsEdit] then
    ShowMessage('For bar code search, cannot be in insert or edit mode')
  else
  begin
    BarCodeStr:='';
    if InputQuery('Strip Bar Code Search',
      'Enter bar code',
      BarCodeStr) then
    begin
      SetVBRcptIndex('ROLLNO');   //JT060898 - added here DL271098
      if length(BarCodeStr)=8 then
        SubStr:=Copy(BarCodeStr,3,6) {was DLCopyStr}
      else
        SubStr:=BarCodeStr;
      VBRcpt.SetKey;
      VBRcpt.FieldByName('RollNo').AsInteger:=strtoint(SubStr);
      if not VBRcpt.GotoKey then
        ShowMessage('Record not found');
    end;
  end;
end;

procedure TVBMaintForm.VBRcptBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBMaintForm.VBRcptPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBMaintForm.ChangeStripInfo1Click(Sender: TObject);
begin
  InChangeMode:='S'; {changing strip}
  VBRcpt.Edit;
end;

procedure TVBMaintForm.ChangeBoxInfo1Click(Sender: TObject);
begin
  InChangeMode:='B'; {changing box}
  {can't change length,carton #, faults, datemanu when changing box details}
  EditDateManu.ReadOnly:=true;
  EditDateManu.Color:=clSilver;
  EditGrossLength.ReadOnly:=true;
  EditGrossLength.Color:=clSilver;
  EditFaults.ReadOnly:=true;
  EditFaults.Color:=clSilver;
  EditBoxNo.ReadOnly:=true;
  EditBoxNo.Color:=clSilver;
  EditStripNo.ReadOnly:=true;
  EditStripNo.Color:=clSilver;
  VBRcpt.Edit;
end;

procedure TVBMaintForm.EditIndexFieldExit(Sender: TObject);
begin
{  if EditCartonFilter.Text='' then  //removed JT060898
  begin
    if VBRcpt.Filter<>'' then
    begin
      VBRcpt.Filtered:=false;
      VBRcpt.Filter:='';
    end;
  end
  else
  begin
    VBRcpt.Filter:='boxno='+EditCartonFilter.Text;
    VBRcpt.Filtered:=true;
  end;}
end;
            //added JT170698
procedure TVBMaintForm.LabelsSpdBtnClick(Sender: TObject);
begin
  VBBoxLabelForm := TVBBoxLabelForm.Create(Application);
  with VBBoxLabelForm do
  begin
    EditStartBoxNo.Text := VBRcptBoxNo.AsString;
    EditEndBoxNo.Text := VBRcptBoxNo.AsString;
    ShowModal;
  end;
end;

procedure TVBMaintForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;
        //JT050898
procedure TVBMaintForm.BoxSearchSpdBtnClick(Sender: TObject);
var
  BarCodeStr:string;
begin
  if VBRcpt.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    //Screen.Cursor:=crHourGlass;
    //if VBPickDlgForm.ShowModalVBBox = mrOk then removed DL271098
    if InputQuery('Box Search', //added DL271098
      'Enter box code',
      BarCodeStr) then
    begin
      SetVBRcptIndex('BOXNO');
      VBRcpt.SetKey;
      VBRcpt.FieldByName('BoxNo').AsInteger:=strtoint(BarCodeStr); //VBPickDlgForm.BoxNo;
      if not VBRcpt.GotoKey then
        ShowMessage('Record not found');
    end;
    //Screen.Cursor:=crDefault;
  end;
end;
                           //JT060898
procedure TVBMaintForm.SetVBRcptIndex(IndexField: string);
begin
  if Pos(IndexField, VBRcpt.IndexFieldNames) <> 1 then
  begin
    VBRcpt.DisableControls;
    VBRcpt.Close;
    VBRcpt.IndexFieldNames := IndexField{ + ';SEQNO'};
    VBRcpt.Open;
    VBRcpt.EnableControls;
    if Uppercase(IndexField) = 'ROLLNO' then
      EditIndexField.Text := 'Roll No'
    else
      EditIndexField.Text := 'Carton No';
  end;
end;

procedure TVBMaintForm.EditLabelStruChange(Sender: TObject);
begin
  //added DL230400
  if EditLabelStru.Text='CU' then
  begin
    //get the customer reference
    if VBPickDlgForm.ShowModalSups('CU') = mrOk then {CU for customers}
      VBRcptLABELSTRUCUSTREF.AsString:=VBPickDlgForm.SupRef;
  end;
end;

end.
