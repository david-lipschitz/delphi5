unit Vbrcpt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, Mask, ExtCtrls,
  Buttons, Spin;

type
  TVBRcptForm = class(TForm)
    GreigeRcptSource: TDataSource;
    Panel2: TPanel;
    GreigeRcpt: TTable;
    VBRcptSource: TDataSource;
    ActiveSource: TDataSource;
    GreigeRcptWARPNO: TIntegerField;
    GreigeRcptGREIGENO: TSmallintField;
    GreigeRcptFABRICLOTNO: TIntegerField;
    GreigeRcptLOOMREF: TStringField;
    GreigeRcptWARPLOTNO1: TIntegerField;
    GreigeRcptWARPLOTNO2: TSmallintField;
    GreigeRcptWARPSINGLEMULTIPLE: TStringField;
    GreigeRcptWEFTLOTNO1: TIntegerField;
    GreigeRcptWEFTLOTNO2: TSmallintField;
    GreigeRcptWEFTSINGLEMULTIPLE: TStringField;
    GreigeRcptVBSTRU: TStringField;
    GreigeRcptVBCOL: TStringField;
    GreigeRcptGREIGEDATE: TDateTimeField;
    GreigeRcptGREIGELENGTH: TIntegerField;
    GreigeRcptFINDATE: TDateTimeField;
    GreigeRcptFINLENGTH: TIntegerField;
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
    VBRcptGrid: TDBGrid;
    EditGross: TEdit;
    EditDateRcvd: TEdit;
    EditRcvdBy: TEdit;
    DBNavigator1: TDBNavigator;
    CloseBitBtn: TBitBtn;
    EditWidth: TComboBox;
    EditLabelStru: TComboBox;
    EditQlty: TComboBox;
    Strips: TLabel;
    EditStrips: TEdit;
    SpinEditPieceNo: TSpinEdit;
    MyQuery: TQuery;
    EditDateManu: TEdit;
    GenStripsSpdBtn: TSpeedButton;
    PostSpdBtn: TSpeedButton;
    CancelSpdBtn: TSpeedButton;
    PieceRcpt: TTable;
    PieceRcptSource: TDataSource;
    PieceRcptWARPNO: TIntegerField;
    PieceRcptPIECENO: TSmallintField;
    PieceRcptGREIGENO: TSmallintField;
    VBRcpt: TTable;
    VBRcptVBSTRU: TStringField;
    VBRcptVBCOL: TStringField;
    VBRcptLOTNO: TIntegerField;
    VBRcptBOXNO: TIntegerField;
    VBRcptDATEMANU: TDateTimeField;
    VBRcptFAULTS: TSmallintField;
    VBRcptMETRICWIDTH: TSmallintField;
    VBRcptGROSSLENGTH: TFloatField;
    VBRcptWARPNO: TIntegerField;
    VBRcptPIECENO: TSmallintField;
    VBRcptSTRIPNO: TSmallintField;
    VBRcptINITIALS: TStringField;
    VBRcptDESPNO: TIntegerField;
    VBRcptDATERCVD: TDateTimeField;
    VBRcptQLTY: TStringField;
    VBRcptROLLNO: TIntegerField;
    VBRcptLONGLENGTH: TFloatField;
    VBRcptPALLETNO: TIntegerField;
    VBRcptNETLENGTH: TFloatField;
    VBRcptALLOWANCE: TFloatField;
    VBRcptLABELSTRU: TStringField;
    PauseSpdBtn: TSpeedButton;
    Timer1: TTimer;
    WarpSearchSpdBtn: TSpeedButton;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GreigeRcptSourceDataChange(Sender: TObject; Field: TField);
    procedure SpinEditPieceNoChange(Sender: TObject);
    procedure VBRcptGridEnter(Sender: TObject);
    procedure VBRcptGridExit(Sender: TObject);
    procedure EditWidthExit(Sender: TObject);
    procedure GenStripsSpdBtnClick(Sender: TObject);
    procedure CancelSpdBtnClick(Sender: TObject);
    procedure PostSpdBtnClick(Sender: TObject);
    procedure VBRcptBeforePost(DataSet: TDataset);
    procedure PauseSpdBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure WarpSearchSpdBtnClick(Sender: TObject);
  private
    { private declarations }
    InTransaction:boolean;
    InsertInProgress:boolean;
    AddInProgress:boolean; {can only enter the grid if in add mode}
    PausePrinting:boolean;
    BarCodePrinterReady:boolean;
    VBRcptClosed:boolean;
    LabelDescr:string[8];
    StyleDescr:string[8];
    ColorDescr:string[9];
    PartNo:string[5];
    OldPieceNo:smallint;
{    LabelStru:string[1];
{    VBStru:String[1];
{    VBCol:String[3];
{    LotNo:longint;
{    MetricWidth:Integer;
{    DateManu:real;
{    GrossLength:real;
{    WarpNo:Integer;
{    PieceNo:Integer;
{    Qlty:string[1];}
    procedure CalcAllowance(Faults:integer;LongLength:real);
    procedure PrintLabels;
    procedure FindMinMax(SetValue:boolean);
  public
    { public declarations }
  end;

var
  VBRcptForm: TVBRcptForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs,VBBarCde,VBModal;

procedure TVBRcptForm.CloseBitBtnClick(Sender: TObject);
begin
  if GreigeRcpt.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post VB Receipts before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBRcptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if GreigeRcpt.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  VBRcpt.Close;
  GreigeRcpt.Close;
  PieceRcpt.Close;
  VBBarCodeForm.UBIComPort2.Open:=false;
  VBRcptForm.Release;
end;

procedure TVBRcptForm.FormShow(Sender: TObject);
begin
{  PieceRcpt.Open;}
  InTransaction:=false;
  InsertInProgress:=false;
  AddInProgress:=false;
  PausePrinting:=false;
  PieceRcpt.Open;
  GreigeRcpt.Open;
  VBRcpt.Open;
  VBRcptClosed:=false;
  VBBarCodeForm.UBIComPort2.Open:=true;
end;

procedure TVBRcptForm.FindMinMax(SetValue:boolean);
begin
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select min(pieceno)');
  MyQuery.SQL.Add('from piecercpt');
  MyQuery.SQL.Add('where warpno=:warpno');
  MyQuery.SQL.Add('and greigeno=:greigeno');
  MyQuery.Prepare;
  MyQuery.Params[0].AsInteger:=GreigeRcptWarpNo.Value;
  MyQuery.Params[1].AsInteger:=GreigeRcptGreigeNo.Value;
  MyQuery.Open;
  SpinEditPieceNo.MinValue:=MyQuery.Fields[0].AsInteger;
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select max(pieceno)');
  MyQuery.SQL.Add('from piecercpt');
  MyQuery.SQL.Add('where warpno=:warpno');
  MyQuery.SQL.Add('and greigeno=:greigeno');
  MyQuery.Prepare;
  MyQuery.Params[0].AsInteger:=GreigeRcptWarpNo.Value;
  MyQuery.Params[1].AsInteger:=GreigeRcptGreigeNo.Value;
  MyQuery.Open;
  SpinEditPieceNo.MaxValue:=MyQuery.Fields[0].AsInteger;
  if SetValue then
    SpinEditPieceNo.Value:=SpinEditPieceNo.MinValue;
  OldPieceNo:=SpinEditPieceNo.Value;
  MyQuery.Close;
end;

procedure TVBRcptForm.GreigeRcptSourceDataChange(Sender: TObject;
  Field: TField);
begin
  {find the minimum and maximum piece numbers for}
  {the current warp and greige reference}
{  VBRcpt.Close;}
  MainForm.Database.StartTransaction;
  InTransaction:=true;
  FindMinMax(true);
  if SpinEditPieceNo.MinValue=SpinEditPieceNo.MaxValue then
    SpinEditPieceNo.Increment:=0
  else
    SpinEditPieceNo.Increment:=1;
  if SpinEditPieceNo.MaxValue=0 then
  begin
    VBRcpt.Close;
    VBRcptClosed:=true;
{    VBRcptGrid.Color:=clSilver;
    VBRcptGrid.Enabled:=false;}
  end
  else
  begin
    if VBRcptClosed then
    begin
      VBRcpt.Open;
      VBRcptClosed:=false;
    end;
    {VBRcptGrid.Enabled:=true;
    VBRcptGrid.Color:=clWindow;}
    PieceRcpt.SetKey;
    PieceRcpt.FieldByName('WarpNo').AsInteger := GreigeRcptWarpNo.Value;
    PieceRcpt.FieldByName('PieceNo').AsInteger := SpinEditPieceNo.MinValue;
    PieceRcpt.GotoKey;
  end;
{  VBRcptQuery.Params[0].AsInteger:=GreigeRcptWarpNo.Value;
  VBRcptQuery.Params[1].AsInteger:=GreigeRcptGreigeNo.Value;
  VBRcptQuery.Params[2].AsInteger:=SpinEditPieceNo.MinValue;
  VBRcptQuery.Open;}
{  if SpinEditPieceNo.MinValue=0 then {no strips->allow add}
{  begin}
{    GenStripsSpdBtn.Enabled:=true;}
    CancelSpdBtn.Enabled:=false;
    PostSpdBtn.Enabled:=false;
    PauseSpdBtn.Enabled:=false;
{    EditWidth.Enabled:=true;
    EditLabelStru.Enabled:=true;
    EditQlty.Enabled:=true;
    EditWidth.Color:=clWindow;
    EditLabelStru.Color:=clWindow;
    EditQlty.Color:=clWindow;
    EditWidth.TabStop:=true;
    EditLabelStru.TabStop:=true;
    EditQlty.TabStop:=true;}
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select labelstru,partno,styledescr,colordescr,labeldescr');
    MyQuery.SQL.Add('from vbtype');
    MyQuery.SQL.Add('where vbstru=:vbstru');
    MyQuery.SQL.Add('and vbcol=:vbcol');
    MyQuery.Prepare;
    MyQuery.Params[0].AsString:=GreigeRcptVBStru.Value;
    MyQuery.Params[1].AsString:=GreigeRcptVBCol.Value;
    MyQuery.Open;
    EditLabelStru.Text:=MyQuery.Fields[0].AsString;
    PartNo:=MyQuery.Fields[1].AsString;
    StyleDescr:=MyQuery.Fields[2].AsString;
    ColorDescr:=MyQuery.Fields[3].AsString;
    LabelDescr:=MyQuery.Fields[4].AsString;
    EditQlty.Text:='';
    EditDateRcvd.ReadOnly:=false;
    EditRcvdBy.ReadOnly:=false;
    EditDateRcvd.Text:=datetostr(date);
    EditRcvdBy.Text:=UserInitials;
    EditDateRcvd.ReadOnly:=true;
    EditRcvdBy.ReadOnly:=true;
{    EditGross.ReadOnly:=false;
    EditDateManu.ReadOnly:=false;
    EditStrips.ReadOnly:=false;
    EditGross.TabStop:=true;
    EditDateManu.TabStop:=true;
    EditStrips.TabStop:=true;
    EditGross.Color:=clWindow;
    EditDateManu.Color:=clWindow;
    EditStrips.Color:=clWindow;}
{  end;
  {else
  begin
{    GenStripsSpdBtn.Enabled:=false;}
{    CancelSpdBtn.Enabled:=false;
    PostSpdBtn.Enabled:=false;
    EditDateRcvd.ReadOnly:=false;
    EditRcvdBy.ReadOnly:=false;
{    EditWidth.Enabled:=true;
    EditLabelStru.Enabled:=true;
    EditQlty.Enabled:=true;
    EditGross.ReadOnly:=false;
    EditDateManu.ReadOnly:=false;
    EditStrips.ReadOnly:=false;}
{    EditWidth.Text:='';  {set to 'defaults' from right}
{    EditLabelStru.Text:='';
    EditQlty.Text:='';
    EditGross.Clear;
    EditDateManu.Clear;
    EditStrips.Clear;
    EditDateRcvd.Clear;
    EditRcvdBy.Clear;
{    EditWidth.TabStop:=false;
    EditLabelStru.TabStop:=false;
    EditQlty.TabStop:=false;
    EditGross.TabStop:=false;
    EditDateManu.TabStop:=false;
    EditStrips.TabStop:=false;
    EditGross.ReadOnly:=true;
    EditDateManu.ReadOnly:=true;
    EditStrips.ReadOnly:=true;
    EditDateRcvd.ReadOnly:=true;
    EditRcvdBy.ReadOnly:=true;
    EditWidth.Enabled:=false;
    EditLabelStru.Enabled:=false;
    EditQlty.Enabled:=false;
    EditLabelStru.Color:=clSilver;
    EditWidth.Color:=clSilver;
    EditLabelStru.Color:=clSilver;
    EditQlty.Color:=clSilver;
    EditGross.Color:=clSilver;
    EditDateManu.Color:=clSilver;
    EditStrips.Color:=clSilver;}
{  end;}
  MainForm.Database.Commit;
  InTransaction:=false;
end;

procedure TVBRcptForm.SpinEditPieceNoChange(Sender: TObject);
begin
  PieceRcpt.SetKey;
  PieceRcpt.FieldByName('WarpNo').AsInteger := GreigeRcptWarpNo.Value;
  PieceRcpt.FieldByName('PieceNo').AsInteger := SpinEditPieceNo.Value;
  PieceRcpt.GotoKey;
  while PieceRcptGreigeNo.Value<>GreigeRcptGreigeNo.Value do
  begin
    if SpinEditPieceNo.Value>OldPieceNo then {cycling upwards}
      SpinEditPieceNo.Value:=SpinEditPieceNo.Value+1
    else
      SpinEditPieceNo.Value:=SpinEditPieceNo.Value-1;
    PieceRcpt.GotoKey;
  end;
  OldPieceNo:=SpinEditPieceNo.Value;
{  VBRcptQuery.Close;
  VBRcptQuery.Params[0].AsInteger:=GreigeRcptWarpNo.Value;
  VBRcptQuery.Params[1].AsInteger:=GreigeRcptGreigeNo.Value;
  VBRcptQuery.Params[2].AsInteger:=SpinEditPieceNo.Value;
  VBRcptQuery.Open;}
end;

procedure TVBRcptForm.VBRcptGridEnter(Sender: TObject);
begin
  if not AddInProgress then
  begin
    EditGross.SetFocus;
    raise Exception.Create('Can only enter grid when in add strips mode');
  end;
  ActiveSource.DataSet:=VBRcpt;
{  DBNavigator.VisibleButtons:=[nbInsert,nbDelete,nbPost,nbEdit,nbCancel,
    nbFirst,nbLast,nbPrior,nbNext];}
  VBRcptGrid.Options := VBRcptGrid.Options + [dgAlwaysShowSelection];
{  VBTypeSearchSpdBtn.Enabled:=true;
  WeftSearchSpdBtn.Enabled:=true;
  LoomRefSpdBtn.Enabled:=true;}
  CloseBitBtn.Enabled:=false;
end;

procedure TVBRcptForm.VBRcptGridExit(Sender: TObject);
begin
  ActiveSource.DataSet:=GreigeRcpt;
{  DBNavigator.VisibleButtons:=[nbInsert,nbDelete,nbPost,nbEdit,nbCancel,
    nbFirst,nbLast,nbPrior,nbNext];}
  VBRcptGrid.Options := VBRcptGrid.Options - [dgAlwaysShowSelection];
{  VBTypeSearchSpdBtn.Enabled:=true;
  WeftSearchSpdBtn.Enabled:=true;
  LoomRefSpdBtn.Enabled:=true;}
  CloseBitBtn.Enabled:=true;
end;

procedure TVBRcptForm.EditWidthExit(Sender: TObject);
begin
  if not ((EditWidth.Text = '80')
      or (EditWidth.Text='89')
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
        EditStrips.Text:='1';
end;

procedure TVBRcptForm.GenStripsSpdBtnClick(Sender: TObject);
var
  NextRollNo:integer;
  BoxNo:integer;
  MaxBoxNo:integer;
  StripsInBox:smallint;
  ix:smallint;
  NextPieceNo:smallint;
begin
  if (EditWidth.Text='') or
    (EditLabelStru.Text='') or
    (EditGross.Text='') or
    (EditDateManu.Text='') or
    (EditStrips.Text='') then
    raise Exception.Create('Not all defaults set!')
  else
  begin {generate strip info}
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
    MyQuery.Params[0].AsInteger:=GreigeRcptWarpNo.Value;
    MyQuery.Open;
    NextPieceNo:=MyQuery.Fields[0].AsInteger+1;
    SpinEditPieceNo.Value:=NextPieceNo;
    SpinEditPieceNo.MaxValue:=NextPieceNo;
    {insert into piecercpt}
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('insert into piecercpt values');
    MyQuery.SQL.Add('(:warpno,:pieceno,:greigeno)');
    MyQuery.Prepare;
    MyQuery.Params[0].AsInteger:=GreigeRcptWarpNo.Value;
    MyQuery.Params[1].AsInteger:=NextPieceNo;
    MyQuery.Params[2].AsInteger:=GreigeRcptGreigeNo.Value;
    MyQuery.ExecSQL;
    MyQuery.Close;
    PieceRcpt.SetKey;
    PieceRcpt.FieldByName('WarpNo').AsInteger := GreigeRcptWarpNo.Value;
    PieceRcpt.FieldByName('PieceNo').AsInteger := NextPieceNo;
    PieceRcpt.GotoKey;
    {find next unique strip no (roll no)}
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
    MyQuery.SQL.Add('and qlty=:qlty');
    MyQuery.SQL.Add('and lotno=:lotno'); {and labelstru=}
    MyQuery.SQL.Add('and metricwidth=:metricwidth');
    MyQuery.SQL.Add('and labelstru=:labelstru');
    MyQuery.Prepare;
    MyQuery.Params[0].AsString:=GreigeRcptVBStru.Value;
    MyQuery.Params[1].AsString:=GreigeRcptVBCol.Value;
    MyQuery.Params[2].AsString:=EditQlty.Text;
    MyQuery.Params[3].AsInteger:=GreigeRcptFabricLotNo.Value;
    MyQuery.Params[4].AsInteger:=strtoint(EditWidth.Text);
    MyQuery.Params[5].AsString:=EditLabelStru.Text;
    MyQuery.Open;
    BoxNo:=MyQuery.Fields[0].AsInteger;
    MyQuery.Close;
    if BoxNo<>0 then
    begin
      {check how many strips in this carton}
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('select count(*)');
      MyQuery.SQL.Add('from vbrcpt');
      MyQuery.SQL.Add('where boxno=:boxno');
      MyQuery.Prepare;
      MyQuery.Params[0].AsInteger:=BoxNo;
      MyQuery.Open;
      StripsInBox:=MyQuery.Fields[0].AsInteger;
      MyQuery.Close;
    end
    else
    begin
      StripsInBox:=0;
      BoxNo:=MaxBoxNo+1;
    end;
    {check how many strips go into current box}
    if EditLabelStru.Text='V' then {3 in a box}
      StripsInBox:=3-StripsInBox
    else {10 in a box}
      StripsInBox:=10-StripsInBox;
    if StripsInBox<1 then
      StripsInBox:=0;
    {insert records;don't commit as must still edit (add faults)}
    InsertInProgress:=true;
    {VBRcptGrid.Enabled:=true;
    VBRcptGrid.Color:=clWindow;}
    if VBRcptClosed then
    begin
      {PieceRcpt.Refresh;}
      VBRcpt.Open;
      VBRcptClosed:=false;
      {VBRcpt.Refresh;}
      {Application.ProcessMessages;}
    end;
    for ix:=1 to strtoint(EditStrips.Text) do
    begin
      VBRcptPieceNo.ReadOnly:=false;
      VBRcptStripNo.ReadOnly:=false;
      VBRcptAllowance.ReadOnly:=false;
      VBRcptNetLength.ReadOnly:=false;
      VBRcptPalletNo.ReadOnly:=false;
      VBRcptDespNo.ReadOnly:=false;
      VBRcptRollNo.ReadOnly:=false;
      VBRcpt.Insert;
      VBRcptVBStru.Value:=GreigeRcptVBStru.Value;
      VBRcptVBCol.Value:=GreigeRcptVBCol.Value;
      VBRcptLotNo.Value:=GreigeRcptFabricLotNo.Value;{remove when running}
      VBRcptDateManu.Value:=strtodate(EditDateManu.Text);
      VBRcptFaults.Value:=0; {when inserting}
      VBRcptMetricWidth.Value:=strtoint(EditWidth.Text);
      VBRcptGrossLength.Value:=strtofloat(EditGross.Text);
      VBRcptWarpNo.Value:=GreigeRcptWarpNo.Value;
{      VBRcptGreigeNo.Value:=GreigeRcptGreigeNo.Value;}
      VBRcptPieceNo.Value:=NextPieceNo;
      VBRcptInitials.Value:=EditRcvdBy.Text;
      VBRcptDespNo.Value:=0;
      VBRcptDateRcvd.Value:=strtodate(EditDateRcvd.Text);
      VBRcptQlty.Value:=EditQlty.Text;
      VBRcptLongLength.Value:=0;
      VBRcptPalletNo.Value:=0;
      VBRcptLabelStru.Value:=EditLabelStru.Text;
      {variable info follows}
      VBRcptStripNo.Value:=ix;
      VBRcptRollNo.Value:=NextRollNo+ix-1;
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
      VBRcptBoxNo.Value:=BoxNo; {for now}
      StripsInBox:=StripsInBox-1;
      VBRcptAllowance.AsInteger:=0;
      VBRcptNetLength.Value:=strtofloat(EditGross.Text);
      VBRcpt.Post;
      VBRcptPieceNo.ReadOnly:=true;
      VBRcptStripNo.ReadOnly:=true;
      VBRcptAllowance.ReadOnly:=true;
      VBRcptNetLength.ReadOnly:=true;
      VBRcptPalletNo.ReadOnly:=true;
      VBRcptDespNo.ReadOnly:=true;
      VBRcptRollNo.ReadOnly:=true;
    end;
    InsertInProgress:=false;
{    VBRcpt.Close;}
    SpinEditPieceNo.Value:=NextPieceNo;
    SpinEditPieceNo.MaxValue:=NextPieceNo;
    SpinEditPieceNo.Increment:=1;
{    VBRcptQuery.Params[0].AsInteger:=GreigeRcptWarpNo.Value;
    VBRcptQuery.Params[1].AsInteger:=GreigeRcptGreigeNo.Value;
    VBRcptQuery.Params[2].AsInteger:=SpinEditPieceNo.Value;
    VBRcptQuery.Open;}
  end;
  GenStripsSpdBtn.Enabled:=false;
  CancelSpdBtn.Enabled:=true;
  PostSpdBtn.Enabled:=true;
  PauseSpdBtn.Enabled:=true;
end;

procedure TVBRcptForm.CancelSpdBtnClick(Sender: TObject);
begin
  if InTransaction then
  begin
    MainForm.Database.RollBack;
    MessageDlg('Cancelled',mtInformation, [mbOK], 0);
    InTransaction:=false;
    AddInProgress:=false;
{    VBRcptQuery.Close;}
    SpinEditPieceNo.Value:=SpinEditPieceNo.Value-1;
    SpinEditPieceNo.MaxValue:=SpinEditPieceNo.Value;
    if SpinEditPieceNo.Value<2 then {=0 or 1}
      SpinEditPieceNo.Increment:=0;
    if SpinEditPieceNo.Value=0 then
    begin
      VBRcpt.Close;
      VBRcptClosed:=true;
      {VBRcptGrid.Enabled:=false;}
    end;
{    VBRcptQuery.Params[0].AsInteger:=GreigeRcptWarpNo.Value;
    VBRcptQuery.Params[1].AsInteger:=GreigeRcptGreigeNo.Value;
    VBRcptQuery.Params[2].AsInteger:=SpinEditPieceNo.Value;
    VBRcptQuery.Open;}
    GenStripsSpdBtn.Enabled:=true;
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
    CancelSpdBtn.Enabled:=false;
    PostSpdBtn.Enabled:=false;
    PauseSpdBtn.Enabled:=false;
    FindMinMax(false);
    EditWidth.SetFocus;
  end;
end;

procedure TVBRcptForm.CalcAllowance(Faults:integer;LongLength:real);
{remember to modify calcallowance in vbrmaint.pas as well}
var
  Allowance:real;
begin
    Allowance:=0;
    LongLength:=0;
    if Faults<=6 then
      Allowance:=Faults+LongLength
    else
      if Faults>=11 then
        Allowance:=(Faults*2)+LongLength
      else
        Allowance:=(Faults*1.5)+LongLength;
    if (Allowance>30) and (VBRcptQlty.Value='') then
    begin
      {if DefaultsSet then
        EditQlty.ReadOnly:=false;}
      {VBRcptQueryQlty.ItemIndex:=1; {substandard; 2->2nds 'N'}
      VBRcptQlty.Value:='N';  {second if faults>15, ie Allowance>30}
      {if DefaultsSet then
        EditQlty.ReadOnly:=true;}
    end;
    if VBRcptLabelStru.Value='H' then {HunterDouglas Label}
      {convert yds faults length to metres}
      Allowance:=Allowance/mtrToyds;
    {EditAllowance.ReadOnly:=false;}
    VBRcptAllowance.ReadOnly:=false;
    VBRcptAllowance.Value:=Allowance;
    VBRcptAllowance.ReadOnly:=true;
    {EditAllowance.ReadOnly:=true;}
    {EditNetLength.ReadOnly:=false;}
    VBRcptNetLength.ReadOnly:=false;
    VBRcptNetLength.Value:=VBRcptGrossLength.Value-Allowance;
    VBRcptNetLength.ReadOnly:=true;
    {EditNetLength.ReadOnly:=true;}
end;


procedure TVBRcptForm.VBRcptBeforePost(DataSet: TDataset);
begin
  if not InsertInProgress then
  begin
    CalcAllowance(VBRcptFaults.Value,VBRcptLongLength.Value);
    {checkboxcontents}
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select distinct vbstru,vbcol,lotno,qlty,metricwidth,labelstru');
    MyQuery.SQL.Add('from vbrcpt');
    MyQuery.SQL.Add('where boxno=:boxno');
    MyQuery.Prepare;
    MyQuery.Params[0].AsInteger:=VBRcptBoxNo.Value;
    MyQuery.Open;
    if not MyQuery.Fields[0].IsNull then
      if (MyQuery.RecordCount>1) then
        if (MyQuery.Fields[0].AsString<>VBRcptVBStru.Value) or
           (MyQuery.Fields[1].AsString<>VBRcptVBCol.Value) or
           (MyQuery.Fields[2].AsInteger<>VBRcptLotNo.Value) or
           (MyQuery.Fields[3].AsString<>VBRcptQlty.Value) or
           (MyQuery.Fields[4].AsInteger<>VBRcptMetricWidth.Value) or
           (MyQuery.Fields[5].AsString<>VBRcptLabelStru.Value) then
        begin
          MyQuery.Close;
          ShowMessage(
            'Cannot mix qualities or widths or label structures in a box');
          Abort;
        end;
    MyQuery.Close;
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
  CurrentStripNo:smallint;
  MetricLabelDescr:string[5];
  ImperialWidth:string[4];
begin
  CurrentStripNo:=1;
  Timer1.Enabled:=true;
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select metriclabeldescr,imperialwidth');
  MyQuery.SQL.Add('from vbwidth');
  MyQuery.SQL.Add('where metricwidth=:metricwidth');
  MyQuery.Prepare;
  VBRcpt.First;
  while not VBRcpt.EOF do
  begin
    MyQuery.Params[0].AsInteger:=VBRcptMetricWidth.Value;
    MyQuery.Open;
    MetricLabelDescr:=MyQuery.Fields[0].AsString;
    ImperialWidth:=MyQuery.Fields[1].AsString;
    MyQuery.Close;
    if VBRcptLabelStru.Value='H' then
      LabelsRequired:=3  {Hunter Douglas}
    else
      LabelsRequired:=2; {Vrede Textiles}
    for ix:=1 to LabelsRequired do
    begin
      if VBRcptLabelStru.Value='H' then
        VBBarCodeForm.PrintUBI_HD(
          StyleDescr,ColorDescr,
          PartNo,VBRcptLotNo.Value,
          VBRcptBoxNo.Value,VBRcptDateManu.Value,
          VBRcptFaults.Value,VBRcptStripNo.Value,
          ImperialWidth,
          VBRcptGrossLength.Value,VBRcptAllowance.Value,VBRcptRollNo.Value)
      else {as normal - for Vrede Textiles}
        VBBarCodeForm.PrintUBI_VT(LabelDescr,VBRcptQlty.Value,
          VBRcptLotNo.Value,
          VBRcptBoxNo.Value,VBRcptDateManu.Value,VBRcptFaults.Value,
          VBRcptStripNo.Value,
          MetricLabelDescr,ImperialWidth,
          VBRcptGrossLength.Value,VBRcptAllowance.Value,
          VBRcptNetLength.Value,VBRcptRollNo.Value);
      {delay until label has finished printing before sending next one}
      BarCodePrinterReady:=false;
      while not (BarCodePrinterReady and not PausePrinting) do
        Application.ProcessMessages;
    end;
    VBRcpt.Next;
  end;
  MyQuery.Close;
  Timer1.Enabled:=false;
end;

procedure TVBRcptForm.Timer1Timer(Sender: TObject);
begin
  BarCodePrinterReady:=true;
end;

procedure TVBRcptForm.WarpSearchSpdBtnClick(Sender: TObject);
begin
  if VBRcpt.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    if PickDlgForm.ShowModalWarpRcpt = mrOk then
    begin
{      PieceRcpt.SetKey;
      PieceRcpt.FieldByName('WarpNo').AsInteger:=PickDlgForm.WarpNo;
      PieceRcpt.FieldByName('PieceNo').AsInteger:=1;
      PieceRcpt.GotoKey;
      GreigeRcpt.Refresh;
      VBRcpt.Refresh;}
    end;
  end;
end;

end.
