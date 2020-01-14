unit Vbrcpt;
{modifications: modified: DL to print labels in sequence 1,2,3... 1,2,3}
{not 1,1,1;2,2,2;3,3,3 as now. DL040397}
{modified: changed MyQuery for VBWidth to VBWidth table DL110397}
{DL090198: added finno and vbfin}
//Levolor label must print same as Hunter Douglas Label:
//  Note that Part # on Levolor should probably be Order Number
//  To make flexible requires more work
//all the 'IA' ITA, Inc. additions added DL041013
//added VBWidth 250 DL090710
//added AV labelstructure DL100318

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, Mask, ExtCtrls,
  Buttons, Dialogs;

type
  TVBRcptForm = class(TForm)
    datFinRcptDaily: TDataSource;
    Panel2: TPanel;
    tabFinRcptDaily: TTable;
    datVBRcpt: TDataSource;
    ActiveSource: TDataSource;
    tabFinRcptDailyWARPNO: TIntegerField;
    tabFinRcptDailyGREIGENO: TSmallintField;
    tabFinRcptDailyVBSTRU: TStringField;
    tabFinRcptDailyVBCOL: TStringField;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    EditWARPNO: TDBEdit;
    EditGREIGENO: TDBEdit;
    EditFABRICLOTNO: TDBEdit;
    EditLOOMREF: TDBEdit;
    EditVBSTRU: TDBEdit;
    EditVBCOL: TDBEdit;
    EditGREIGELENGTH: TDBEdit;
    EditFINLENGTH: TDBEdit;
    dbgVBRcpt: TDBGrid;
    EditGross: TEdit;
    EditDateRcvd: TEdit;
    EditRcvdBy: TEdit;
    dbnVBRcpt: TDBNavigator;
    CloseBitBtn: TBitBtn;
    EditWidth2: TComboBox;
    EditLabelStru1: TComboBox;
    EditQlty: TComboBox;
    Strips: TLabel;
    EditStrips2: TEdit;
    MyQuery: TQuery;
    EditDateManu: TEdit;
    tabPieceRcpt: TTable;
    datPieceRcpt: TDataSource;
    tabPieceRcptWARPNO: TIntegerField;
    tabPieceRcptPIECENO: TSmallintField;
    tabPieceRcptGREIGENO: TSmallintField;
    tabVBRcpt: TTable;
    tabVBRcptVBSTRU: TStringField;
    tabVBRcptVBCOL: TStringField;
    tabVBRcptLOTNO: TIntegerField;
    tabVBRcptBOXNO: TIntegerField;
    tabVBRcptDATEMANU: TDateTimeField;
    tabVBRcptFAULTS: TSmallintField;
    tabVBRcptMETRICWIDTH: TSmallintField;
    tabVBRcptGROSSLENGTH: TFloatField;
    tabVBRcptWARPNO: TIntegerField;
    tabVBRcptPIECENO: TSmallintField;
    tabVBRcptSTRIPNO: TSmallintField;
    tabVBRcptINITIALS: TStringField;
    tabVBRcptDESPNO: TIntegerField;
    tabVBRcptDATERCVD: TDateTimeField;
    tabVBRcptQLTY: TStringField;
    tabVBRcptROLLNO: TIntegerField;
    tabVBRcptLONGLENGTH: TFloatField;
    tabVBRcptPALLETNO: TIntegerField;
    tabVBRcptNETLENGTH: TFloatField;
    tabVBRcptALLOWANCE: TFloatField;
    tabVBRcptLABELSTRU: TStringField;
    Timer1: TTimer;
    WarpSearchSpdBtn: TSpeedButton;
    EditPieceNo: TDBEdit;
    tabVBRcptGREIGENO: TSmallintField;
    Label9: TLabel;
    EditReturned: TComboBox;
    tabVBRcptRETURNED: TStringField;
    tabVBWidth: TTable;
    tabVBWidthMETRICWIDTH: TSmallintField;
    tabVBWidthIMPERIALWIDTH: TStringField;
    tabVBWidthMETRICLABELDESCR: TStringField;
    tabVBRcptDATEMOD: TDateTimeField;
    tabVBRcptUSERMOD: TStringField;
    tabVBRcptFINNO: TIntegerField;
    tabVBRcptVBFIN: TStringField;
    Label13: TLabel;
    tabFinRcptDailyFINNO: TSmallintField;
    tabFinRcptDailyFABRICLOTNO: TIntegerField;
    tabFinRcptDailyWARPLOTNO1: TIntegerField;
    tabFinRcptDailyWARPLOTNO2: TSmallintField;
    tabFinRcptDailyWARPSINGLEMULTIPLE: TStringField;
    tabFinRcptDailyWEFTLOTNO1: TIntegerField;
    tabFinRcptDailyWEFTLOTNO2: TSmallintField;
    tabFinRcptDailyWEFTSINGLEMULTIPLE: TStringField;
    tabFinRcptDailyVBFIN: TStringField;
    tabFinRcptDailyFINLENGTH: TIntegerField;
    tabFinRcptDailyFINDATE: TDateTimeField;
    tabGreigeRcpt: TTable;
    tabGreigeRcptWARPNO: TIntegerField;
    tabGreigeRcptGREIGENO: TSmallintField;
    tabGreigeRcptGREIGELENGTH: TIntegerField;
    datGreigeRcpt: TDataSource;
    EditFinNo: TDBEdit;
    EditVBFin: TDBEdit;
    tabGreigeRcptLOOMREF: TStringField;
    Label15: TLabel;
    tabPieceRcptFINNO: TIntegerField;
    tabVBRcptVTORDNO: TIntegerField;
    GenRollNoProc: TStoredProc;
    LabelsButton: TButton;
    GenBoxNoProc: TStoredProc;
    Label16: TLabel;
    Label24: TLabel;
    EditWidth1: TComboBox;
    EditStrips1: TEdit;
    Bevel1: TBevel;
    Label25: TLabel;
    EditLabelStru2: TComboBox;
    MaxBoxNoQuery: TQuery;
    GenStripsSpdBtn: TButton;
    CancelSpdBtn: TButton;
    PostSpdBtn: TButton;
    PauseSpdBtn: TButton;
    PrintSpdBtn: TSpeedButton;
    tabVBRcptQLTYREASON: TStringField;
    tabVBRcptSEQNO: TIntegerField;
    QltyReasonQuery: TQuery;
    qryStripsInBox: TQuery;
    qryStripsInPiece: TQuery;
    qryCheckIdentical: TQuery;
    qryGetMaxBoxNo: TQuery;
    qryCustPart: TQuery;
    qryCustPartDESCR: TStringField;
    qryCustPartSTYLEDESCR: TStringField;
    qryCustPartPARTNO: TStringField;
    tabVBRcptLABELSTRUCUSTREF: TStringField;
    tabVBRcptROWNO: TIntegerField;
    spdReprintLabels: TSpeedButton;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure datFinRcptDailyDataChange(Sender: TObject; Field: TField);
    procedure dbgVBRcptEnter(Sender: TObject);
    procedure dbgVBRcptExit(Sender: TObject);
    procedure EditWidthExit(Sender: TObject);
    procedure GenStripsSpdBtnClick(Sender: TObject);
    procedure CancelSpdBtnClick(Sender: TObject);
    procedure PostSpdBtnClick(Sender: TObject);
    procedure tabVBRcptBeforePost(DataSet: TDataset);
    procedure PauseSpdBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure WarpSearchSpdBtnClick(Sender: TObject);
    procedure EditPieceNoEnter(Sender: TObject);
    procedure EditWARPNOEnter(Sender: TObject);
    procedure EditDateManuExit(Sender: TObject);
    procedure LabelsButtonClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure tabVBRcptAfterPost(DataSet: TDataSet);
    procedure tabVBRcptAfterEdit(DataSet: TDataSet);
    procedure EditLabelStru1Change(Sender: TObject);
    procedure spdReprintLabelsClick(Sender: TObject);
  private
    { private declarations }
    InTransaction:boolean;
    InsertInProgress:boolean;
    AddInProgress:boolean; {can only enter the grid if in add mode}
    PausePrinting:boolean;
    BarCodePrinterReady:boolean;
{    VBRcptClosed:boolean;}
    LabelDescr:string[8]; //was 6 DL081001
    StyleDescr:string[8];
    ColorDescr:string[9];
    PartNo:string[11]; //was string[11] DL250499
    Heading:string[25]; //added DL260499
    OldBoxNo:integer; //added DL200799
    LabelStruCustRef:string[6]; //added DL230400
{    OldPieceNo:smallint;}
{    LabelStru:string[1];
{    VBStru:String[3]; //was 1, but commented out already DL070901
{    VBCol:String[3];
{    LotNo:longint;
{    MetricWidth:Integer;
{    DateManu:real;
{    GrossLength:real;
{    WarpNo:Integer;
{    PieceNo:Integer;
{    Qlty:string[1];}
    StartBoxNo, FinishBoxNo: Integer;  //defaults for carton label print dialog
    BoxNo:integer; //moved here from inside add routine DL190799
    procedure CalcAllowance(Faults:integer;LongLength:real;MetricWidth:integer); //MetricWidth added DL030501
    procedure PrintLabels;
  public
    { public declarations }
  end;

var
  VBRcptForm: TVBRcptForm;

implementation

{$R *.DFM}

uses Vbmain, VBBarCde, VBBoxLab, VBModal, Reslit;

const
  MtrToYds=1.0936; {shouldn't be necessary as defined in VBMain}

procedure TVBRcptForm.CloseBitBtnClick(Sender: TObject);
begin
  if InTransaction then
    MessageDlg('Cancel edits or post VB Receipts before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBRcptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if InTransaction then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  qryCustPart.Close; //added DL230400
  tabVBWidth.Close;
  tabVBRcpt.Close;
  tabGreigeRcpt.Close;
  tabPieceRcpt.Close;
  tabFinRcptDaily.Close;
  QltyReasonQuery.Close;
//  VBBarCodeForm.UBIComPort2.Open:=false;
  VBBarCodeForm.CloseComPort2;  //new procedure as at 191098
  VBRcptForm.Release;
end;

procedure TVBRcptForm.FormShow(Sender: TObject);
begin
  Timer1.Enabled:=false;
  if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='UBI' then //UBI faster than DMX DL031113
    Timer1.Interval:=3500 //delay between labels
  else if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='DMX' then
    Timer1.Interval:=7000
  else if MainForm.VBParams.FieldByName('BARCODEPRINTERTYPE').AsString='C4P' then //C4P the fastest
    Timer1.Interval:=2500;

{  PieceRcpt.Open;}
  InTransaction:=false;
  InsertInProgress:=false;
  AddInProgress:=false;
  PausePrinting:=false;
  tabFinRcptDaily.Open;
  tabGreigeRcpt.Open;
  tabPieceRcpt.Open;
  tabVBRcpt.Open;
  tabVBWidth.Open;
  QltyReasonQuery.Close;
  QltyReasonQuery.Prepare;
{  VBRcptClosed:=false;}
//  VBBarCodeForm.UBIComPort2.Open:=true;
  VBBarCodeForm.OpenComPort2; //added DL191098
end;

procedure TVBRcptForm.datFinRcptDailyDataChange(Sender: TObject;
  Field: TField);
begin
  MainForm.Database.StartTransaction;
  InTransaction:=true;
  CancelSpdBtn.Enabled:=false;
  PostSpdBtn.Enabled:=false;
  PauseSpdBtn.Enabled:=false;
  //query was here DL260499
  EditQlty.Text:='';
  {EditReturned.Text:='N';}
  EditReturned.ItemIndex:=0; {added DL241096}
  EditDateRcvd.ReadOnly:=false;
  EditRcvdBy.ReadOnly:=false;
  EditDateRcvd.Text:=FormatDateTime('dd/mm/yyyy', date);
  EditDateManu.Text:=EditDateRcvd.Text;
  EditRcvdBy.Text:=UserInitials;
  EditDateRcvd.ReadOnly:=true;
  EditRcvdBy.ReadOnly:=true;
  MainForm.Database.Commit;
  InTransaction:=false;
end;

procedure TVBRcptForm.dbgVBRcptEnter(Sender: TObject);
begin
  if not AddInProgress then
  begin
    EditGross.SetFocus;
    raise Exception.Create('Can only enter grid when in add strips mode');
  end;
  ActiveSource.DataSet:=tabVBRcpt;
{  DBNavigator.VisibleButtons:=[nbInsert,nbDelete,nbPost,nbEdit,nbCancel,
    nbFirst,nbLast,nbPrior,nbNext];}
  dbgVBRcpt.Options := dbgVBRcpt.Options + [dgAlwaysShowSelection];
{  VBTypeSearchSpdBtn.Enabled:=true;
  WeftSearchSpdBtn.Enabled:=true;
  LoomRefSpdBtn.Enabled:=true;}
  CloseBitBtn.Enabled:=false;
end;

procedure TVBRcptForm.dbgVBRcptExit(Sender: TObject);
begin
  ActiveSource.DataSet:=tabFinRcptDaily;
{  DBNavigator.VisibleButtons:=[nbInsert,nbDelete,nbPost,nbEdit,nbCancel,
    nbFirst,nbLast,nbPrior,nbNext];}
  dbgVBRcpt.Options := dbgVBRcpt.Options - [dgAlwaysShowSelection];
{  VBTypeSearchSpdBtn.Enabled:=true;
  WeftSearchSpdBtn.Enabled:=true;
  LoomRefSpdBtn.Enabled:=true;}
  CloseBitBtn.Enabled:=true;
end;
{  redone below JT110698
procedure TVBRcptForm.EditWidthExit(Sender: TObject);
begin
  if not ((EditWidth.Text='80')
      or (EditWidth.Text='63')
      or (EditWidth.Text='89')
      or (EditWidth.Text='100')
      or (EditWidth.Text='127')
      or (EditWidth.Text='130')
      or (EditWidth.Text='2070')) then
  begin
    EditWidth.SetFocus;
    raise Exception.Create ('Invalid Width');
  end
  else
    if (EditWidth.Text='80') or (EditWidth.Text='89') then
      EditStrips.Text:='23'
    else
      if (EditWidth.Text='127') or (EditWidth.Text='130') then
        EditStrips.Text:='16'
      else
        if (EditWidth.Text='100') then
          EditStrips.Text:='20'
        else
          if (EditWidth.Text='63') then
            EditStrips.Text:='32'
          else
            EditStrips.Text:='1';
end;}

//redone JT110698 -Now handles two mutually exclusive width & strips pairs
procedure TVBRcptForm.EditWidthExit(Sender: TObject);
var
  ThisEditWidth: TComboBox;
  ThisEditStrips: TEdit;
begin
  ThisEditWidth := Sender as TComboBox;
  if ThisEditWidth = EditWidth1 then
    ThisEditStrips := EditStrips1
  else
    ThisEditStrips := EditStrips2;
  case StrToInt(ThisEditWidth.Text) of
    63:       ThisEditStrips.Text := '32';
    80, 89:   ThisEditStrips.Text := '23';
    100:      ThisEditStrips.Text := '20';
    127, 130: ThisEditStrips.Text := '16';
    250:      ThisEditStrips.Text := '8'; //added DL090710
    2070,2100,1850:ThisEditStrips.Text := '1'; //2100 added DL021212; 1850 added DL031214
    else      begin
                ThisEditWidth.SetFocus;
                raise Exception.Create('Invalid Width');
              end;
  end;
end;
(*                 JT120698  replaced whole procedure below
procedure TVBRcptForm.GenStripsSpdBtnClick(Sender: TObject);
var
  NextRollNo:integer;
  BoxNo:integer;
  MaxBoxNo:integer;
  StripsInBox:smallint;
  ix:smallint;
  NextPieceNo:smallint;
begin
  if (EditWidth1.Text='') or
    (EditLabelStru1.Text='') or
    (EditGross.Text='') or
    (EditDateManu.Text='') or
    (EditStrips.Text='') then
    raise Exception.Create('Not all defaults set!')
  else
  begin {generate strip info}
    CloseBitBtn.Enabled:=false; // added JT110698
    {find the next available carton number}
    MainForm.Database.StartTransaction; {commit after post called}
    InTransaction:=true;
    AddInProgress:=true;
    {find next piece no for this warp}
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select max(pieceno)');
    MyQuery.SQL.Add('from piecercpt');
    MyQuery.SQL.Add('where warpno=:warpno');
    MyQuery.Prepare;
    MyQuery.Params[0].AsInteger:=tabFinRcptDailyWarpNo.Value;
    MyQuery.Open;
    NextPieceNo:=MyQuery.Fields[0].AsInteger+1;
    {insert into piecercpt}
    MyQuery.Close;
    tabPieceRcpt.Insert;
    tabPieceRcptWarpNo.Value:=tabFinRcptDailyWarpNo.Value;
    tabPieceRcptGreigeNo.Value:=tabFinRcptDailyGreigeNo.Value;
    tabPieceRcptFinNo.Value:=tabFinRcptDailyFinNo.Value;
    tabPieceRcptPieceNo.Value:=NextPieceNo;
    tabPieceRcpt.Post;
{    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('insert into piecercpt values');
    MyQuery.SQL.Add('(:warpno,:pieceno,:greigeno)');
    MyQuery.Prepare;
    MyQuery.Params[0].AsInteger:=GreigeRcptWarpNo.Value;
    MyQuery.Params[1].AsInteger:=NextPieceNo;
    MyQuery.Params[2].AsInteger:=GreigeRcptGreigeNo.Value;
    MyQuery.ExecSQL;
    MyQuery.Close;}
{    PieceRcpt.SetKey;
    PieceRcpt.FieldByName('WarpNo').AsInteger := GreigeRcptWarpNo.Value;
    PieceRcpt.FieldByName('GreigeNo').AsInteger := GreigeRcptGreigeNo.Value;
    PieceRcpt.FieldByName('PieceNo').AsInteger := NextPieceNo;
    PieceRcpt.GotoKey;}
    {find next unique strip no (roll no)} {xx change this to generator}
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select nextno');
    MyQuery.SQL.Add('from vbnextno');
    MyQuery.SQL.Add('where ref=:ref');
    MyQuery.Prepare;
    MyQuery.Params[0].AsInteger:=6;
    MyQuery.Open;
    NextRollNo:=MyQuery.Fields[0].AsInteger;
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('update vbnextno');
    MyQuery.SQL.Add('set nextno=:nextno');
    MyQuery.SQL.Add('where ref=:ref');
    MyQuery.Prepare;
    MyQuery.Params[0].AsInteger:=NextRollNo+strtoint(EditStrips.Text);
    MyQuery.Params[1].AsInteger:=6;
    MyQuery.ExecSQL;
    MyQuery.Close;
    {find max boxno}
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select max(boxno)');
    MyQuery.SQL.Add('from vbrcpt');
    MyQuery.Prepare;
    MyQuery.Open;
    MaxBoxNo:=MyQuery.Fields[0].AsInteger;
    {find last boxno with reqd attributes}
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select max(boxno)');
    MyQuery.SQL.Add('from vbrcpt');
    MyQuery.SQL.Add('where vbstru=:vbstru');
    MyQuery.SQL.Add('and vbcol=:vbcol');
    MyQuery.SQL.Add('and vbfin=:vbfin');
    MyQuery.SQL.Add('and qlty=:qlty');
    MyQuery.SQL.Add('and lotno=:lotno'); {and labelstru=}
    MyQuery.SQL.Add('and metricwidth=:metricwidth');
    MyQuery.SQL.Add('and labelstru=:labelstru');
    MyQuery.SQL.Add('and palletno=0'); {not on pallet: added DL160197}
    MyQuery.SQL.Add('and despno=0'); {not on despatch}
    MyQuery.SQL.Add('and vtordno=0'); {not picked: added DL160197}
    MyQuery.Prepare;
    MyQuery.Params[0].AsString:=tabFinRcptDailyVBStru.Value;
    MyQuery.Params[1].AsString:=tabFinRcptDailyVBCol.Value;
    MyQuery.Params[2].AsString:=tabFinRcptDailyVBFin.Value;
    MyQuery.Params[3].AsString:=EditQlty.Text;
    MyQuery.Params[4].AsInteger:=tabFinRcptDailyFabricLotNo.Value;
    MyQuery.Params[5].AsInteger:=strtoint(EditWidth.Text);
    MyQuery.Params[6].AsString:=EditLabelStru.Text;
    BoxNo:=0; // added DL130598
    MyQuery.Open;
    BoxNo:=MyQuery.Fields[0].AsInteger;
    MyQuery.Close;
    if BoxNo<>0 then           //if a box that these can go into
    begin
      {check how many strips in this carton}
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('select count( * )');
      MyQuery.SQL.Add('from vbrcpt');
      MyQuery.SQL.Add('where boxno=:boxno');
      MyQuery.Prepare;
      MyQuery.Params[0].AsInteger:=BoxNo;
      MyQuery.Open;
      StripsInBox:=MyQuery.Fields[0].AsInteger;  //how many are already in box
      MyQuery.Close;
    end
    else
    begin
      StripsInBox:=0;
      BoxNo:=MaxBoxNo+1;   //start with new box
    end;
    {check how many strips go into current box}
    if EditWidth.Text='2070' then {1 in a box so show 0 to go in current box}
      StripsInBox:=0
    else
    begin
      if EditLabelStru.Text='V' then {3 in a box}
        StripsInBox:=3-StripsInBox
      else {10 in a box}
        StripsInBox:=10-StripsInBox;
    end;
    if StripsInBox<1 then  // :)
      StripsInBox:=0;
    {insert records;don't commit as must still edit (add faults)}
    InsertInProgress:=true;
    LastStripNo := 0;
    for ix:=1 to strtoint(EditStrips.Text) do
    begin
      tabVBRcptPieceNo.ReadOnly:=false;
      tabVBRcptStripNo.ReadOnly:=false;
      tabVBRcptAllowance.ReadOnly:=false;
      tabVBRcptNetLength.ReadOnly:=false;
      tabVBRcptPalletNo.ReadOnly:=false;
      tabVBRcptDespNo.ReadOnly:=false;
      tabVBRcptRollNo.ReadOnly:=false;
      tabVBRcptReturned.ReadOnly:=false; {added DL241096}
      tabVBRcpt.Insert;
      tabVBRcptVBStru.Value:=tabFinRcptDailyVBStru.Value;
      tabVBRcptVBCol.Value:=tabFinRcptDailyVBCol.Value;
      tabVBRcptVBFin.Value:=tabFinRcptDailyVBFin.Value;
      tabVBRcptLotNo.Value:=tabFinRcptDailyFabricLotNo.Value;{remove when running}
      tabVBRcptDateManu.Value:=strtodate(EditDateManu.Text);
      tabVBRcptFaults.Value:=0; {when inserting}
      tabVBRcptMetricWidth.Value:=strtoint(EditWidth.Text);
      tabVBRcptGrossLength.Value:=strtofloat(EditGross.Text);
      tabVBRcptWarpNo.Value:=tabFinRcptDailyWarpNo.Value;
      tabVBRcptGreigeNo.Value:=tabFinRcptDailyGreigeNo.Value; {why was this commented out?}
      tabVBRcptFinNo.Value:=tabFinRcptDailyFinNo.Value;
      tabVBRcptPieceNo.Value:=NextPieceNo;
      tabVBRcptInitials.Value:=EditRcvdBy.Text;
      tabVBRcptDespNo.Value:=0;
      {add VBRcptVBOrdNo.Value:=0 xx}
      tabVBRcptDateRcvd.Value:=strtodate(EditDateRcvd.Text);
      tabVBRcptQlty.Value:=EditQlty.Text;
      tabVBRcptReturned.Value:=EditReturned.Text; {added DL241096}
      tabVBRcptLongLength.Value:=0;
      tabVBRcptPalletNo.Value:=0;
      tabVBRcptLabelStru.Value:=EditLabelStru.Text;
      {variable info follows}
      tabVBRcptStripNo.Value:=ix;
      tabVBRcptRollNo.Value:=NextRollNo+ix-1;
      if StripsInBox=0 then
      begin
        if EditLabelStru.Text='V' then {3 in a box}
          StripsInBox:=3
        else {10 in a box}
          StripsInBox:=10;
        if BoxNo<MaxBoxNo then
          BoxNo:=MaxBoxNo+1
        else
          BoxNo:=BoxNo+1;
      end;
      tabVBRcptBoxNo.Value:=BoxNo; {for now}
      StripsInBox:=StripsInBox-1;
      tabVBRcptAllowance.AsInteger:=0;
      tabVBRcptNetLength.Value:=strtofloat(EditGross.Text);
      tabVBRcpt.Post;
      tabVBRcptPieceNo.ReadOnly:=true;
      tabVBRcptStripNo.ReadOnly:=true;
      tabVBRcptAllowance.ReadOnly:=true;
      tabVBRcptNetLength.ReadOnly:=true;
      tabVBRcptPalletNo.ReadOnly:=true;
      tabVBRcptReturned.ReadOnly:=true; {added DL241096}
      tabVBRcptDespNo.ReadOnly:=true;
      tabVBRcptRollNo.ReadOnly:=true;
    end;
    InsertInProgress:=false;
  end;
  GenStripsSpdBtn.Enabled:=false;
  CancelSpdBtn.Enabled:=true;
  PostSpdBtn.Enabled:=true;
  PauseSpdBtn.Enabled:=true;
end;
*)
 //redone JT120698  Handles two strip types via sub-routine now
procedure TVBRcptForm.GenStripsSpdBtnClick(Sender: TObject);
var
  MaxBoxNo:integer;
  StripsInBox:smallint;
  NextPieceNo:smallint;
  LastStripNo: Integer;  //the last strip no of a DoStrips call

  procedure DoStrips(EditLabelStru, EditWidth: TComboBox; EditStrips: TEdit);
  var
    ix: Integer;
  begin
    {find max boxno}
    qryGetMaxBoxNo.Close;
    qryGetMaxBoxNo.Open;
    MaxBoxNo:=qryGetMaxBoxNo.FieldByName('MaxBoxNo').AsInteger;
    {find last boxno with reqd attributes}
    qryGetMaxBoxNo.Close;
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select max(boxno)');
    MyQuery.SQL.Add('from vbrcpt');
    MyQuery.SQL.Add('where vbstru=:vbstru');
    MyQuery.SQL.Add('and vbcol=:vbcol');
    MyQuery.SQL.Add('and vbfin=:vbfin');
    MyQuery.SQL.Add('and qlty=:qlty');
    MyQuery.SQL.Add('and lotno=:lotno'); {and labelstru=}
    MyQuery.SQL.Add('and metricwidth=:metricwidth');
    MyQuery.SQL.Add('and labelstru=:labelstru');
    MyQuery.SQL.Add('and palletno=0'); {not on pallet: added DL160197}
    MyQuery.SQL.Add('and despno=0'); {not on despatch}
    MyQuery.SQL.Add('and vtordno=0'); {not picked: added DL160197}
    MyQuery.SQL.Add('and qltyreason=:qltyreason'); {qltyreason added DL230798}
    MyQuery.SQL.Add('and rowno<=9900'); //added DL030210
    MyQuery.Prepare;
    MyQuery.Params[0].AsString:=tabFinRcptDailyVBStru.Value;
    MyQuery.Params[1].AsString:=tabFinRcptDailyVBCol.Value;
    MyQuery.Params[2].AsString:=tabFinRcptDailyVBFin.Value;
    MyQuery.Params[3].AsString:=EditQlty.Text;
    MyQuery.Params[4].AsInteger:=tabFinRcptDailyFabricLotNo.Value;
    MyQuery.Params[5].AsInteger:=strtoint(EditWidth.Text);
    MyQuery.Params[6].AsString:=EditLabelStru.Text;
    //note: default qltyreason is OK
    MyQuery.ParamByName('QltyReason').AsString:='OK'; //added DL230798
    BoxNo:=0; // added DL130598
    MyQuery.Open;
    BoxNo:=MyQuery.Fields[0].AsInteger;
    MyQuery.Close;
    if BoxNo<>0 then           //if a box that these can go into
    begin
      {check how many strips in this carton}
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('select count(*)');
      MyQuery.SQL.Add('from vbrcpt');
      MyQuery.SQL.Add('where boxno=:boxno');
      MyQuery.Prepare;
      MyQuery.Params[0].AsInteger:=BoxNo;
      MyQuery.Open;
      StripsInBox:=MyQuery.Fields[0].AsInteger;  //how many are already in box
      MyQuery.Close;
    end
    else
    begin
      StripsInBox:=0;
      BoxNo:=MaxBoxNo+1;   //start with new box //altered JT120698
{     GenBoxNoProc.ExecProc;    //added JT110698  Generate new box no
      BoxNo := GenBoxNoProc.Params[0].AsInteger;}
      if StartBoxNo = 0 then   //form variable: default start box no for label printing
        StartBoxNo := BoxNo;
    end;
    {check how many strips go into current box}
    if (strtoint(EditWidth.Text)>=1850) then {1 in a box so show 0 to go in current box} //- all FW DL031217
      StripsInBox:=0
    else
    begin
      if (EditLabelStru.Text='VT') or (EditLabelStru.Text='FB')
          or (EditLabelStru.Text='FD')  //FD added DL270100
          or (EditLabelStru.Text='CU')                    //CU added DL230400
          or (EditLabelStru.Text='IA') then {3 in a box}  //IA added DL060720
        StripsInBox:=3-StripsInBox
      else {10 in a box}
        StripsInBox:=10-StripsInBox;
    end;
    if StripsInBox<1 then  // :)
      StripsInBox:=0;
    tabVBRcptPieceNo.ReadOnly:=false; //JT120698  Moved these outside the loop
    tabVBRcptStripNo.ReadOnly:=false;
    tabVBRcptAllowance.ReadOnly:=false;
    tabVBRcptNetLength.ReadOnly:=false;
    tabVBRcptPalletNo.ReadOnly:=false;
    tabVBRcptDespNo.ReadOnly:=false;
    tabVBRcptRollNo.ReadOnly:=false;
    tabVBRcptReturned.ReadOnly:=false; {added DL241096}
    for ix:=1 to strtoint(EditStrips.Text) do
    begin
      tabVBRcpt.Insert;
      tabVBRcptVBStru.Value:=tabFinRcptDailyVBStru.Value;
      tabVBRcptVBCol.Value:=tabFinRcptDailyVBCol.Value;
      tabVBRcptVBFin.Value:=tabFinRcptDailyVBFin.Value;
      tabVBRcptLotNo.Value:=tabFinRcptDailyFabricLotNo.Value;{remove when running}
      tabVBRcptDateManu.Value:=strtodate(EditDateManu.Text);
      tabVBRcptFaults.Value:=0; {when inserting}
      tabVBRcptMetricWidth.Value:=strtoint(EditWidth.Text);
      tabVBRcptGrossLength.Value:=strtofloat(EditGross.Text);
      tabVBRcptWarpNo.Value:=tabFinRcptDailyWarpNo.Value;
      tabVBRcptGreigeNo.Value:=tabFinRcptDailyGreigeNo.Value; {why was this commented out?}
      tabVBRcptFinNo.Value:=tabFinRcptDailyFinNo.Value;
      tabVBRcptPieceNo.Value:=NextPieceNo;
      tabVBRcptInitials.Value:=EditRcvdBy.Text;
      tabVBRcptDespNo.Value:=0;
      {add VBRcptVBOrdNo.Value:=0 xx}
      tabVBRcptDateRcvd.Value:=strtodate(EditDateRcvd.Text);
      tabVBRcptQlty.Value:=EditQlty.Text;
      tabVBRcptQltyReason.Value:='OK'; //added DL230798
      tabVBRcptReturned.Value:=EditReturned.Text; {added DL241096}
      tabVBRcptLongLength.Value:=0;
      tabVBRcptPalletNo.Value:=0;
      tabVBRcptLabelStru.Value:=EditLabelStru.Text;
      {variable info follows}
      tabVBRcptStripNo.Value:=ix + LastStripNo;   //altered JT110698  provide for 2nd call to DoStrips
      //tabVBRcptRollNo.Value:=NextRollNo+ix-1;
      GenRollNoProc.ExecProc;    //added JT110698  Generate next RollNo
      tabVBRcptRollNo.Value := GenRollNoProc.Params[0].AsInteger;
      if StripsInBox=0 then
      begin
        if (EditLabelStru.Text='VT') or (EditLabelStru.Text='FB')
          or (EditLabelStru.Text='FD')  //FD added DL270100
          or (EditLabelStru.Text='CU')                    //CU added DL230400
          or (EditLabelStru.Text='IA') then {3 in a box}  //IA added DL060720
          StripsInBox:=3
        else {10 in a box}
          StripsInBox:=10;
        if BoxNo<MaxBoxNo then  //altered JT110698  Generate new box no below
          BoxNo:=MaxBoxNo+1     //^reverted as user can alter box no
        else
          BoxNo:=BoxNo+1;
{       GenBoxNoProc.ExecProc;
        BoxNo := GenBoxNoProc.Params[0].AsInteger;}
      end;
      tabVBRcptBoxNo.Value:=BoxNo; {for now}
      StripsInBox:=StripsInBox-1;
      tabVBRcptAllowance.AsInteger:=0;
      tabVBRcptNetLength.Value:=strtofloat(EditGross.Text);
      tabVBRcptSEQNO.AsInteger:=0;
      if EditLabelStru.Text='CU' then //added DL230400
        tabVBRcptLABELSTRUCUSTREF.AsString:=LabelStruCustRef; //added DL230400
      tabVBRcpt.Post;
    end;
    tabVBRcptPieceNo.ReadOnly:=true;
    tabVBRcptStripNo.ReadOnly:=true;
    tabVBRcptAllowance.ReadOnly:=true;
    tabVBRcptNetLength.ReadOnly:=true;
    tabVBRcptPalletNo.ReadOnly:=true;
    tabVBRcptReturned.ReadOnly:=true; {added DL241096}
    tabVBRcptDespNo.ReadOnly:=true;
    tabVBRcptRollNo.ReadOnly:=true;
  end;

begin {GenStripsSpdBtnClick}
  if (EditWidth1.Text='') or
     (EditLabelStru1.Text='') or
     (EditGross.Text='') or
     (EditDateManu.Text='') or
     (EditStrips1.Text='') then
    raise Exception.Create('Not all defaults set!');
  if (EditWidth1.Text = EditWidth2.Text) and
     (EditLabelStru1.Text = EditLabelStru2.Text) then
  begin
    EditWidth2.SetFocus;
    raise Exception.Create(
      'You cannot have the same width and label stru in both strip types');
  end;

  //add reslit information screen DL030700
  //? move to before post.
  if EditReturned.Text='Y' then
  begin
    frmReslit:=TfrmReslit.Create(Application);
    frmReslit.WarpNo:=tabFinRcptDailyWarpNo.AsInteger;
    frmReslit.GreigeNo:=tabFinRcptDailyGreigeNo.AsInteger;
    frmReslit.FinNo:=tabFinRcptDailyFinNo.AsInteger;
    frmReslit.MetricWidth:=0; //not used yet
    frmReslit.ShowModal;
    VBRcptForm.Refresh;
  end;

  {generate strip info}
  Screen.Cursor:=crSQLWait;
  CloseBitBtn.Enabled:=false; // added JT110698
  {find the next available carton number}
  MainForm.Database.StartTransaction; {commit after post called}
  InTransaction:=true;
  AddInProgress:=true;
  {find next piece no for this warp}
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select max(pieceno)');
  MyQuery.SQL.Add('from piecercpt');
  MyQuery.SQL.Add('where warpno=:warpno');
  MyQuery.Prepare;
  MyQuery.Params[0].AsInteger:=tabFinRcptDailyWarpNo.Value;
  MyQuery.Open;
  NextPieceNo:=MyQuery.Fields[0].AsInteger+1;
  {insert into piecercpt}
  MyQuery.Close;
  tabPieceRcpt.Insert;
  tabPieceRcptWarpNo.Value:=tabFinRcptDailyWarpNo.Value;
  tabPieceRcptGreigeNo.Value:=tabFinRcptDailyGreigeNo.Value;
  tabPieceRcptFinNo.Value:=tabFinRcptDailyFinNo.Value;
  tabPieceRcptPieceNo.Value:=NextPieceNo;
  tabPieceRcpt.Post;
  InsertInProgress:=true;
  LastStripNo := 0;         //added JT110698  Do for 2 strip types
  DoStrips(EditLabelStru1, EditWidth1, EditStrips1);
  if (EditLabelStru2.Text <> '') and (EditWidth2.Text <> '') then
  begin
    LastStripNo := StrToInt(EditStrips1.Text);
    DoStrips(EditLabelStru2, EditWidth2, EditStrips2);
  end;
  InsertInProgress:=false;
  FinishBoxNo := BoxNo;  //form variable: last box no for label printing
  GenStripsSpdBtn.Enabled:=false;
  CancelSpdBtn.Enabled:=true;
  PostSpdBtn.Enabled:=true;
  PauseSpdBtn.Enabled:=true;
  Screen.Cursor:=crDefault;
end;

procedure TVBRcptForm.CancelSpdBtnClick(Sender: TObject);
begin
  if InTransaction then
  begin
    InTransaction:=true; //added DL190799
    MainForm.Database.RollBack;
    MessageDlg('Cancelled',mtInformation, [mbOK], 0);
    AddInProgress:=false;
    tabPieceRcpt.Refresh;
    tabVBRcpt.Refresh;
    InTransaction:=false;
    GenStripsSpdBtn.Enabled:=true;
    CloseBitBtn.Enabled:=true; //JT 110698
    CancelSpdBtn.Enabled:=false;
    PostSpdBtn.Enabled:=false;
    PauseSpdBtn.Enabled:=false;
  end;
end;

procedure TVBRcptForm.PostSpdBtnClick(Sender: TObject);
begin
  if InTransaction then
  begin
    CancelSpdBtn.Enabled:=false;
    PostSpdBtn.Enabled:=false;
    MainForm.Database.Commit;
    PrintLabels;
    MessageDlg('Posted',mtInformation, [mbOK], 0);
    InTransaction:=false;
    AddInProgress:=false;
    GenStripsSpdBtn.Enabled:=true;
    CloseBitBtn.Enabled:=true; //added JT110698
    CancelSpdBtn.Enabled:=false;
    PostSpdBtn.Enabled:=false;
    PauseSpdBtn.Enabled:=false;
    EditLabelStru1.SetFocus; //altered JT110698
  end;
end;

procedure TVBRcptForm.CalcAllowance(Faults:integer;LongLength:real;MetricWidth:integer); //MetricWidth added DL030501
{remember to modify calcallowance in vbrmaint.pas as well}
var
  Allowance:real;
begin
{    Allowance:=0; hints says not reqd: see if statement below}
  if MetricWidth=0 then //added DL030501: shouldn't happen, but just in case
  begin
    ShowMessage('MetricWidth = 0; Please tell David');
    MetricWidth:=89;
  end;
    LongLength:=0;
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
    if (Allowance>15) and (tabVBRcptQlty.Value='') then //15 was 30 DL030501
    begin
      {if DefaultsSet then
        EditQlty.ReadOnly:=false;}
      {VBRcptQueryQlty.ItemIndex:=1; {substandard; 2->2nds 'N'}
      tabVBRcptQlty.Value:='N';  {second if faults>15, ie Allowance>30}
      {if DefaultsSet then
        EditQlty.ReadOnly:=true;}
    end;
    //Hunter Douglas or Levolor or ITA Label
    //IA added DL041013
    if (tabVBRcptLabelStru.Value='HD') or (tabVBRcptLabelStru.Value='LH')  or (tabVBRcptLabelStru.Value='IA') then
      {convert yds faults length to metres}
      Allowance:=Allowance/mtrToyds;
    {EditAllowance.ReadOnly:=false;}
    tabVBRcptAllowance.ReadOnly:=false;
    tabVBRcptAllowance.Value:=Allowance;
    tabVBRcptAllowance.ReadOnly:=true;
    {EditAllowance.ReadOnly:=true;}
    {EditNetLength.ReadOnly:=false;}
    tabVBRcptNetLength.ReadOnly:=false;
    tabVBRcptNetLength.Value:=tabVBRcptGrossLength.Value-Allowance;
    tabVBRcptNetLength.ReadOnly:=true;
    {EditNetLength.ReadOnly:=true;}
end;

procedure TVBRcptForm.tabVBRcptBeforePost(DataSet: TDataset);
//add qlty and qltyreason checks xx 230798
var
  KeepQlty:string;
  KeepQltyReason:string;
  KeepMetricWidth:integer;
  KeepLabelStru:string;
  KeepBoxNo:integer;
  KeepSeqNo:integer;
  KeepRollNo:integer;
  KeepBookMark: TBookmark;

  procedure UpdateAllDetails; //for this box in this piece
  begin
    KeepBookMark:=tabVBRcpt.GetBookmark;
    InsertInProgress:=true; //otherwise recursive calls to this procedure
    //can't use an update cursor here because of another user has modified
    //message, therefore cycle through the strips and then set the
    //cursor back to the current record
    KeepQlty:=tabVBRcptQlty.AsString;
    KeepQltyReason:=tabVBRcptQltyReason.AsString;
    KeepMetricWidth:=tabVBRcptMetricWidth.AsInteger;
    KeepLabelStru:=tabVBRcptLabelStru.AsString;
    KeepBoxNo:=tabVBRcptBoxNo.AsInteger;
    KeepSeqNo:=tabVBRcptSeqNo.AsInteger;
    KeepRollNo:=tabVBRcptRollNo.AsInteger;
    CalcAllowance(tabVBRcptFaults.Value,tabVBRcptLongLength.Value,tabVBRcptMETRICWIDTH.AsInteger); //MetricWidth added DL030501
    tabVBRcptDateMod.Value:=now;
    tabVBRcptUserMod.Value:=UserInitials;
    tabVBRcpt.Post;
    tabVBRcpt.First;
    while not tabVBRcpt.EOF do
    begin
      if (tabVBRcptBoxNo.AsInteger=KeepBoxNo)
        and (tabVBRcptRollNo.AsInteger<>KeepRollNo) then
      begin
        tabVBRcpt.Edit;
        tabVBRcptQlty.AsString:=KeepQlty;
        tabVBRcptQltyReason.AsString:=KeepQltyReason;
        tabVBRcptMetricWidth.AsInteger:=KeepMetricWidth;
        tabVBRcptLabelStru.AsString:=KeepLabelStru;
        tabVBRcptBoxNo.AsInteger:=KeepBoxNo;
        tabVBRcptSeqNo.AsInteger:=KeepSeqNo;
        tabVBRcptDateMod.Value:=now;
        tabVBRcptUserMod.Value:=UserInitials;
        //CalcAllowance added here DL230899
        CalcAllowance(tabVBRcptFaults.Value,tabVBRcptLongLength.Value,tabVBRcptMETRICWIDTH.AsInteger); //MetricWidth added DL030501
        tabVBRcpt.Post;
      end;
      tabVBRcpt.Next;
    end;
    tabVBRcpt.GotoBookmark(KeepBookMark);
    tabVBRcpt.FreeBookmark(KeepBookMark);
    InsertInProgress:=false;
    tabVBRcpt.Edit; //because post for this record must still happen
  end; //UpdateAllDetails

begin
  if not InsertInProgress then
  begin
    //check that qlty is valid xx
    if (tabVBRcptQlty.AsString<>'') and
      (tabVBRcptQlty.AsString<>'S') and
      (tabVBRcptQlty.AsString<>'N') and
      (tabVBRcptQlty.AsString<>'T') and
      (tabVBRcptQlty.AsString<>'A') then
      raise Exception.Create('Qlty must be <b>,S,N,T,A');
    //check that the labelstru is valid. Added DL230899
    if (tabVBRcptLABELSTRU.AsString<>'VT') and
       (tabVBRcptLABELSTRU.AsString<>'HD') and
       (tabVBRcptLABELSTRU.AsString<>'IA') and //IA added DL041013
       (tabVBRcptLABELSTRU.AsString<>'FB') and
       (tabVBRcptLABELSTRU.AsString<>'FD') and //FD added DL270100
       (tabVBRcptLABELSTRU.AsString<>'LH') and
       (tabVBRcptLABELSTRU.AsString<>'CU') then //CU added DL230400
      raise Exception.Create('Label Structure (LS) must be VT,HD,FB,FD,LH,CU,IA');
    //check that qltyreason is valid for this type of qlty
    //qltyreason cannot be blank
    QltyReasonQuery.Close;
    if tabVBRcptQlty.AsString='' then
      QltyReasonQuery.ParamByName('FirstQlty').AsString:='Y'
    else
      QltyReasonQuery.ParamByName('FirstQlty').AsString:='N';
    QltyReasonQuery.ParamByName('QltyReason').AsString:=tabVBRcptQltyReason.AsString;
    QltyReasonQuery.Open;
    if QltyReasonQuery.BOF=QltyReasonQuery.EOF then
      raise Exception.Create('Invalid Reason for this quality type');
    //start checks on box contents
    //1) if only one strip in the box allow the change
    qryStripsInBox.Close;
    qryStripsInBox.ParamByName('BoxNo').AsInteger:=tabVBRcptBoxNo.AsInteger;
    qryStripsInBox.Open;
    if ((OldBoxNo=tabVBRcptBoxNo.AsInteger) and //leaving boxno alone therefore only one strip (the current one) must exist
      (qryStripsInBox.FieldByName('StripsInBox').AsInteger=1)) or
       ((OldBoxNo<>tabVBRcptBoxNo.AsInteger) and //changing boxno, so no others must exist
        (qryStripsInBox.FieldByName('StripsInBox').AsInteger=0)) then
    begin
      CalcAllowance(tabVBRcptFaults.Value,tabVBRcptLongLength.Value,tabVBRcptMETRICWIDTH.AsInteger); //MetricWidth added DL030501
      tabVBRcptDateMod.Value:=now;
      tabVBRcptUserMod.Value:=UserInitials;
      qryStripsInBox.Close;
      Exit;  //procedure: make sure that post is still activated
    end;
    qryStripsInBox.Close;
    //2) if all strips are in this piece ask how the change must take place
    qryStripsInPiece.Close;
    qryStripsInPiece.ParamByName('BoxNo').AsInteger:=tabVBRcptBoxNo.AsInteger;
    qryStripsInPiece.ParamByName('WarpNo').AsInteger:=tabVBRcptWarpNo.AsInteger;
    qryStripsInPiece.ParamByName('PieceNo').AsInteger:=tabVBRcptPieceNo.AsInteger;
    qryStripsInPiece.Open;
    if qryStripsInPiece.FieldByName('AnotherPiece').AsInteger=0 then
    begin
      //change all the other strips in this box to the same details
      //because they are all in this piece
      //2a) if all the strips on this piece are identical then this change
      //can go ahead with no questions.
      qryCheckIdentical.Close;
      qryCheckIdentical.ParamByName('boxno').AsInteger:=tabVBRcptBoxNo.AsInteger;
      qryCheckIdentical.ParamByName('warpno').AsInteger:=tabVBRcptWarpNo.AsInteger;
      qryCheckIdentical.ParamByName('pieceno').AsInteger:=tabVBRcptPieceNo.AsInteger;
      qryCheckIdentical.ParamByName('vbstru').AsString:=tabVBRcptVBStru.AsString;
      qryCheckIdentical.ParamByName('vbcol').AsString:=tabVBRcptVBCol.AsString;
      qryCheckIdentical.ParamByName('vbfin').AsString:=tabVBRcptVBFin.AsString;
      qryCheckIdentical.ParamByName('metricwidth').AsInteger:=tabVBRcptMetricWidth.AsInteger;
      qryCheckIdentical.ParamByName('qlty').AsString:=tabVBRcptQlty.AsString;
      qryCheckIdentical.ParamByName('qltyreason').AsString:=tabVBRcptQltyReason.AsString;
      qryCheckIdentical.ParamByName('labelstru').AsString:=tabVBRcptLabelStru.AsString;
      qryCheckIdentical.Open;
      if qryCheckIdentical.RecordCount=1 then
      begin
        //no need to ask the question, so simply update this row.
        CalcAllowance(tabVBRcptFaults.Value,tabVBRcptLongLength.Value,tabVBRcptMETRICWIDTH.AsInteger); //added DL030501
        tabVBRcptDateMod.Value:=now;
        tabVBRcptUserMod.Value:=UserInitials;
        qryCheckIdentical.Close;
        Exit; //and post
      end;
      qryCheckIdentical.Close;
      //else
      if MessageDlg('Cannot Mix: Change other strips in this box on this piece'+CR+
                    'to the same qlty, qltyreason, width and labelstru?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        UpdateAllDetails;
        qryStripsInPiece.Close;
        Exit;
      end
      else
      begin
        if MessageDlg('Cannot Mix: Find a new box number for this strip on this piece?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          //find a new box number: see if boxno+1 works
          //boxno+1 works unless user has selected a new box number
          //already in which case the select to find the highest
          //boxno should be redone
          InsertInProgress:=true; //otherwise recursive calls to this procedure
          BoxNo:=BoxNo+1;
          tabVBRcptBoxNo.AsInteger:=BoxNo;
          tabVBRcptSeqNo.AsInteger:=0;
          CalcAllowance(tabVBRcptFaults.Value,tabVBRcptLongLength.Value,tabVBRcptMETRICWIDTH.AsInteger); //added DL030501
          tabVBRcptDateMod.Value:=now;
          tabVBRcptUserMod.Value:=UserInitials;
          InsertInProgress:=false;
          qryStripsInPiece.Close;
          Exit;
        end
        else
          qryStripsInPiece.Close;
          Abort;
      end;
    end;
    qryStripsInPiece.Close;
    //3) this box number exists on another piece, therefore all the
    //details on this box number must be the same as on the other
    //strips and strips must not be picked, palletised or despatched,
    //ie do the changes as they were before
    MyQuery.Close;
    MyQuery.SQL.Clear; {palletno,despno,vtordno added DL160197}
    //                          0     1     2    3     4            5        6        7       8      9     10
    MyQuery.SQL.Add('select vbstru,vbcol,lotno,qlty,metricwidth,labelstru,palletno,despno,vtordno,vbfin,qltyreason');
    MyQuery.SQL.Add('from vbrcpt');
    MyQuery.SQL.Add('where boxno=:boxno');
    MyQuery.SQL.Add('and seqno=:seqno');   //JT190798
    MyQuery.Prepare;
    MyQuery.Params[0].AsInteger:=tabVBRcptBoxNo.Value;
    MyQuery.Params[1].AsInteger:=tabVBRcptSeqNo.Value; //JT190798
    MyQuery.Open;
    while not MyQuery.EOF do
    begin
      if (MyQuery.Fields[6].AsInteger<>0) then {added DL160197}
      begin
        {this if added to check that box is not on a pallet}
        ShowMessage(
          'Box is already on pallet '+MyQuery.Fields[6].AsString);
        MyQuery.Close;
        Abort;
      end;
      if (MyQuery.Fields[7].AsInteger<>0) then {added DL160197}
      begin
        {this if added to check that box is not on a despatch,}
        {should be impossible considering pallet already checked!}
        ShowMessage(
          'Box is already on despatch '+MyQuery.Fields[7].AsString);
        MyQuery.Close;
        Abort;
      end;
      if (MyQuery.Fields[8].AsInteger<>tabVBRcptVTOrdNo.AsInteger) then {added DL160197}
      begin  // <>0 changed to <>VBRcptVTOrdNo.AsInteger DL130598
        {this if added to check that box is not picked}
        ShowMessage(
          'Box is already picked to order '+MyQuery.Fields[8].AsString);
        MyQuery.Close;
        Abort;
      end;
      if (MyQuery.Fields[0].AsString<>tabVBRcptVBStru.AsString) or //can't change
         (MyQuery.Fields[1].AsString<>tabVBRcptVBCol.AsString) or //can't change
         (MyQuery.Fields[2].AsInteger<>tabVBRcptLotNo.AsInteger) or //can't change
         (MyQuery.Fields[3].AsString<>tabVBRcptQlty.AsString) or
         (MyQuery.Fields[4].AsInteger<>tabVBRcptMetricWidth.AsInteger) or
         (MyQuery.Fields[5].AsString<>tabVBRcptLabelStru.AsString) or
         (MyQuery.Fields[9].AsString<>tabVBRcptVBFin.AsString) or //can't change
         (MyQuery.Fields[10].AsString<>tabVBRcptQltyReason.AsString) then  //JT190798
      begin
        if MessageDlg('Cannot Mix: This strip is on another piece.'+CR+
          'Find a new box number for this strip?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          //find a new box number: see if boxno+1 works
          InsertInProgress:=true; //otherwise recursive calls to this procedure
          BoxNo:=BoxNo+1;
          tabVBRcptBoxNo.AsInteger:=BoxNo;
          tabVBRcptSeqNo.AsInteger:=0;
          CalcAllowance(tabVBRcptFaults.Value,tabVBRcptLongLength.Value,tabVBRcptMETRICWIDTH.AsInteger); //added DL030501
          tabVBRcptDateMod.Value:=now;
          tabVBRcptUserMod.Value:=UserInitials;
          InsertInProgress:=false;
          MyQuery.Close;
          Exit;
        end
        else
        begin
          MyQuery.Close;
          Abort;
        end;
      end;
      MyQuery.Next;
    end;
    MyQuery.Close;
    CalcAllowance(tabVBRcptFaults.Value,tabVBRcptLongLength.Value,tabVBRcptMETRICWIDTH.AsInteger); //added DL030501
    tabVBRcptDateMod.Value:=now;
    tabVBRcptUserMod.Value:=UserInitials;
  end;
end;

procedure TVBRcptForm.PauseSpdBtnClick(Sender: TObject);
begin
  if not PausePrinting then {button shows 'pause'}
  begin
    PauseSpdBtn.Caption:='Resume';
    PausePrinting:=true;
  end
  else  {button shows 'resume'}
  begin
    PauseSpdBtn.Caption:='Pause';
    PausePrinting:=false;
  end;
end;

procedure TVBRcptForm.PrintLabels;
var
  ix:smallint;
  LabelsRequired:smallint;
{  CurrentStripNo:smallint;}
{  MetricLabelDescr:string[5];}
{  ImperialWidth:string[4];}
  EvenOdd,iy:smallint; {added DL040397}
begin
{  CurrentStripNo:=1;}
  Timer1.Enabled:=true;
  try
    {the following myquery prepare was outside the try clause until}
    {061196 DL; removed: DL110397}
    MyQuery.Close;
{    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select metriclabeldescr,imperialwidth');
    MyQuery.SQL.Add('from vbwidth');
    MyQuery.SQL.Add('where metricwidth=:metricwidth');
    MyQuery.Prepare;
    MyQuery.Close;}
    tabVBRcpt.First; {if last record not posted then opened the wrong cursor}
    for ix:=1 to 2 do {added DL040397}
    begin
      {first print the odd numbered strips, then print the even numbered ones}
      for iy:=1 to 2 do {EvenOdd=1->odd numbers;=2->even numbers}
      begin
        if iy=1 then
          EvenOdd:=1 {odd}
        else {iy=2}
          EvenOdd:=0; {even}
        tabVBRcpt.First;
        while not tabVBRcpt.EOF do
        begin
          if (((tabVBRcptStripNo.Value mod 2) = EvenOdd) and (ix=1))
            or (ix=2) then {on the first loop print the odds then the evens}
            {on the second loop print all in order}
          begin
{showmessage('Now printing: '+VBRcptStripNo.AsString);}
{            MyQuery.Params[0].AsInteger:=VBRcptMetricWidth.Value;
            MyQuery.Open;
            MetricLabelDescr:=MyQuery.Fields[0].AsString;
            ImperialWidth:=MyQuery.Fields[1].AsString;
            MyQuery.Close;}
            {PrintLabel:=false;}
            if ix=1 then
              LabelsRequired:=1
            else
            begin
              if iy=2 then
                LabelsRequired:=0 {don't print}
              else
              begin
                //assumption is that first strip is for correct client
                //IA added DL041013
                //IA labels are packed the same as South African, ie 3 in a box, not 1 in a box DL041028
                if (tabVBRcptLabelStru.Value='HD') or (tabVBRcptLabelStru.Value='LH') {or (tabVBRcptLabelStru.Value='IA')} then
                  LabelsRequired:=2  {Hunter Douglas, Levolor: 3-1=2}
                else
                  LabelsRequired:=1; {Vrede Textiles: 2-1=1, ITA}
              end;
            end;
            MyQuery.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('select vc.labelstru,vc.partno,vc.styledescr,vc.colordescr,vt.labeldescr,vs.descr');
            MyQuery.SQL.Add('from vbtype vt,vbtypeclient vc,vblabelstru vs');
            MyQuery.SQL.Add('where vt.vbstru=:vbstru');
            MyQuery.SQL.Add('and vt.vbcol=:vbcol');
            MyQuery.SQL.Add('and vt.vbfin=:vbfin');
            MyQuery.SQL.Add('and vt.vbstru=vc.vbstru');
            MyQuery.SQL.Add('and vt.vbcol=vc.vbcol');
            MyQuery.SQL.Add('and vt.vbfin=vc.vbfin');
            MyQuery.SQL.Add('and vc.labelstru=vs.labelstru');
            MyQuery.SQL.Add('and vc.labelstru=:labelstru');
            MyQuery.Prepare;
            MyQuery.Params[0].AsString:=tabVBRcptVBStru.Value;
            MyQuery.Params[1].AsString:=tabVBRcptVBCol.Value;
            MyQuery.Params[2].AsString:=tabVBRcptVBFin.Value;
            MyQuery.Params[3].AsString:=tabVBRcptLabelStru.Value;
            MyQuery.Open;
            if (tabVBRcptLabelStru.Value='CU') and (not tabVBRcptLABELSTRUCUSTREF.IsNull) then //override what's found DL230400
            begin
              qryCustPart.Close;
              qryCustPart.ParamByName('CustRef').AsString:=tabVBRcptLABELSTRUCUSTREF.AsString;
              qryCustPart.ParamByName('VBStru').AsString:=tabVBRcptVBStru.Value;
              qryCustPart.ParamByName('VBCol').AsString:=tabVBRcptVBCol.Value;
              qryCustPart.ParamByName('VBFin').AsString:=tabVBRcptVBFin.Value;
              qryCustPart.ParamByName('VBWidth').AsInteger:=tabVBRcptMETRICWIDTH.AsInteger;
              qryCustPart.Open;
              if not qryCustPartDESCR.IsNull then
              begin
                EditLabelStru1.Text:='VT'; //altered JT120698
                EditLabelStru2.Text:='VT';
                PartNo:=qryCustPartPARTNO.AsString;
                StyleDescr:=qryCustPartSTYLEDESCR.AsString;
                ColorDescr:=qryCustPartDESCR.AsString;
                LabelDescr:='VT'+tabVBRcptVBStru.AsString+tabVBRcptVBCol.AsString;
                Heading:='Vrede Fabrics'; //was Vertical Reality: DL030501
              end
              else
              begin //originally here
                EditLabelStru1.Text:=MyQuery.Fields[0].AsString; //altered JT120698
                EditLabelStru2.Text:=MyQuery.Fields[0].AsString;
                PartNo:=MyQuery.Fields[1].AsString;
                StyleDescr:=MyQuery.Fields[2].AsString;
                ColorDescr:=MyQuery.Fields[3].AsString;
                LabelDescr:=MyQuery.Fields[4].AsString;
                Heading:=MyQuery.Fields[5].AsString;
              end;
            end
            else
            begin //originally here
              EditLabelStru1.Text:=MyQuery.Fields[0].AsString; //altered JT120698
              EditLabelStru2.Text:=MyQuery.Fields[0].AsString;
              PartNo:=MyQuery.Fields[1].AsString;
              StyleDescr:=MyQuery.Fields[2].AsString;
              ColorDescr:=MyQuery.Fields[3].AsString;
              LabelDescr:=MyQuery.Fields[4].AsString;
              Heading:=MyQuery.Fields[5].AsString;
            end;
            MyQuery.Close;
            while LabelsRequired>=1 do {for ix:=1 to LabelsRequired-1 do}
            begin
              if (tabVBRcptLabelStru.Value='HD') or (tabVBRcptLabelStru.Value='LH') or (tabVBRcptLabelStru.Value='IA') then //IA added DL041013
                VBBarCodeForm.Print_HD( //was PrintUBI_HD DL191098
                  StyleDescr,ColorDescr,LabelDescr,
                  PartNo,tabVBRcptLotNo.Value,
                  tabVBRcptBoxNo.Value,tabVBRcptDateManu.Value,
                  tabVBRcptFaults.Value,tabVBRcptStripNo.Value,
                  tabVBWidthIMPERIALWIDTH.Value,
                  tabVBRcptGrossLength.Value,tabVBRcptAllowance.Value,tabVBRcptRollNo.Value,
                  tabVBRcptLabelStru.Value)
              else {as normal - for Vrede Textiles}
                VBBarCodeForm.Print_VT(LabelDescr,tabVBRcptQlty.Value, //was PrintUBI_VT DL191098
                  tabVBRcptLotNo.Value,
                  tabVBRcptBoxNo.Value,tabVBRcptDateManu.Value,tabVBRcptFaults.Value,
                  tabVBRcptStripNo.Value,
                  tabVBWidthMetricLabelDescr.Value,tabVBWidthImperialWidth.Value,
                  tabVBRcptGrossLength.Value,tabVBRcptAllowance.Value,
                  tabVBRcptNetLength.Value,tabVBRcptRollNo.Value,
                  StyleDescr,ColorDescr,PartNo,Heading);
              {delay until label has finished printing before sending next one}
              BarCodePrinterReady:=false;
              while not (BarCodePrinterReady and not PausePrinting) do
                Application.ProcessMessages;
              LabelsRequired:=LabelsRequired-1;
            end; {while LabelsRequired}
          end; {end EvenOdd print}
          tabVBRcpt.Next;
        end; {while not VBRcpt.EOF}
      end; {even odd for iy:=...}
    end; {for ix:=1 to 3}
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end; {try}
{  MyQuery.Close;}
  Timer1.Enabled:=false;
end;

procedure TVBRcptForm.Timer1Timer(Sender: TObject);
begin
  BarCodePrinterReady:=true;
end;

procedure TVBRcptForm.WarpSearchSpdBtnClick(Sender: TObject);
begin
  if InTransaction {tabVBRcpt.State in [dsInsert, dsEdit]} then {DL090198}
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    if VBPickDlgForm.ShowModalWarpRcpt = mrOk then
    begin
      tabFinRcptDaily.SetKey;
      tabFinRcptDaily.FieldByName('WarpNo').AsInteger:=VBPickDlgForm.WarpNo;
      tabFinRcptDaily.FieldByName('GreigeNo').AsInteger:=1; {min greigeno}
      tabFinRcptDaily.FieldByName('FinNo').AsInteger:=1; {min finno}
      tabFinRcptDaily.GotoKey;
{      GreigeRcpt.Refresh;
      VBRcpt.Refresh;}
    end;
  end;
  Screen.Cursor:=crDefault;
end;

procedure TVBRcptForm.EditPieceNoEnter(Sender: TObject);
begin
  ActiveSource.DataSet:=tabPieceRcpt;
  {set hints}
  dbnVBRcpt.Hints.Clear;
  dbnVBRcpt.Hints.Add('First Warp,Piece');
  dbnVBRcpt.Hints.Add('Previous Warp,Piece');
  dbnVBRcpt.Hints.Add('Next Warp,Piece');
  dbnVBRcpt.Hints.Add('Last Warp,Piece');
end;

procedure TVBRcptForm.EditWARPNOEnter(Sender: TObject);
begin
  ActiveSource.DataSet:=tabFinRcptDaily;
  {set hints}
  dbnVBRcpt.Hints.Clear;
  dbnVBRcpt.Hints.Add('First Warp,Greige,Fin');
  dbnVBRcpt.Hints.Add('Previous Warp,Greige,Fin');
  dbnVBRcpt.Hints.Add('Next Warp,Greige,Fin');
  dbnVBRcpt.Hints.Add('Last Warp,Greige,Fin');
end;

procedure TVBRcptForm.EditDateManuExit(Sender: TObject);
begin
  if (strtodate(EditDateManu.Text)<NoEntryBeforeDate) then
  begin
    EditDateManu.Text:=EditDateRcvd.Text;
    raise exception.create('Date cannot be less than '+
      FormatDateTime('dd-mmm-yyyy',NoEntryBeforeDate));
  end;
  if (strtodate(EditDateManu.Text)>date) then
  begin
    EditDateManu.Text:=EditDateRcvd.Text;
    raise exception.create('Date cannot be greater than today');
  end;
end;
          //added JT120698
procedure TVBRcptForm.LabelsButtonClick(Sender: TObject);
begin
  with tabVBRcpt do    //added JT250698
  begin
    DisableControls;
    First;
    StartBoxNo := tabVBRcptBOXNO.AsInteger;
    Last;
    FinishBoxNo := tabVBRcptBOXNO.AsInteger;
    First;
    EnableControls;
  end;
  VBBoxLabelForm := TVBBoxLabelForm.Create(Application);
  with VBBoxLabelForm do
  begin
    if StartBoxNo > 0 then
      EditStartBoxNo.Text := IntToStr(StartBoxNo);
    if FinishBoxNo > 0 then
      EditEndBoxNo.Text := IntToStr(FinishBoxNo);
    ShowModal;
  end;
end;

procedure TVBRcptForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TVBRcptForm.tabVBRcptAfterPost(DataSet: TDataSet);
begin
//  ShowMessage('In After Post');
  if tabVBRcptBoxNo.AsInteger>BoxNo then
    BoxNo:=tabVBRcptBoxNo.AsInteger;
  //give a warning if there are more than 3 strips in a box for
  //VT or more than 10 strips in a box for HD
  qryStripsInBox.Close;
  qryStripsInBox.ParamByName('BoxNo').AsInteger:=tabVBRcptBoxNo.AsInteger;
  qryStripsInBox.Open;
  //IA added to the following if DL041013
  //IA labels are packed the same as South African, ie 3 in a box, not 1 in a box DL041028
  if (tabVBRcptLabelStru.AsString='HD') or (tabVBRcptLabelStru.AsString='LH') {or (tabVBRcptLabelStru.AsString='IA')} then
  begin
    if qryStripsInBox.FieldByName('StripsInBox').AsInteger>10 then
      MessageDlg('Warning: Box No: '+tabVBRcptBoxNo.AsString+
        ' is Hunter Douglas or Levolor Box with more than 10 strips', //or ITA message removed DL060720
        mtWarning, [mbOK], 0);
  end
  else //all others have 3 strips in box
  begin
    if qryStripsInBox.FieldByName('StripsInBox').AsInteger>3 then
      MessageDlg('Warning: Box No: '+tabVBRcptBoxNo.AsString+
        ' is Normal Box with more than 3 strips',
        mtWarning, [mbOK], 0);
  end;
  qryStripsInBox.Close;
end;

procedure TVBRcptForm.tabVBRcptAfterEdit(DataSet: TDataSet);
begin
  OldBoxNo:=tabVBRcptBoxNo.AsInteger;
end;

procedure TVBRcptForm.EditLabelStru1Change(Sender: TObject);
begin
  //added DL230400
  if EditLabelStru1.Text='CU' then
  begin
    //get the customer reference
    if VBPickDlgForm.ShowModalSups('CU') = mrOk then {CU for customers}
      LabelStruCustRef:=VBPickDlgForm.SupRef;
  end;
end;

procedure TVBRcptForm.spdReprintLabelsClick(Sender: TObject);
begin
  //reprint the labels that are selected. Added DL070531
  if MessageDlg('Do you wish to reprint labels for the current piece # '+tabVBRcptPIECENO.AsString+'?',
      mtInformation, mbOKCancel, 0)=mrOK then
    PrintLabels;
end;

end.
