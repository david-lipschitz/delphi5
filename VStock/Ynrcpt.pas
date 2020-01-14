unit Ynrcpt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Buttons, DBLookup,
  Dialogs;

type
  TYnRcptForm = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditBOXNO: TDBEdit;
    Label2: TLabel;
    EditLOTNO: TDBEdit;
    EditLOTNO2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditYNTARE : TDBEdit;
    Label7: TLabel;
    EditYNNET: TDBEdit;
    ManuOrReturnedLabel: TLabel;
    EditDATEmanu: TDBEdit;
    Label9: TLabel;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    YarnRcptSource: TDataSource;
    Panel2: TPanel;
    YarnRcpt: TTable;
    YarnRcptBOXNO: TIntegerField;
    YarnRcptLOTNO1: TSmallintField;
    YarnRcptLOTNO2: TSmallintField;
    YarnRcptYNSTRU: TStringField;
    YarnRcptYNCOL: TStringField;
    YarnRcptYNTARE: TFloatField;
    YarnRcptYNNET: TFloatField;
    YarnRcptDATERCVD: TDateTimeField;
    YarnRcptINITIALS: TStringField;
    SetDefaultsBtn: TButton;
    CloseBitBtn: TBitBtn;
    Label3: TLabel;
    ShowGross: TEdit;
    Label10: TLabel;
    ShowStruDescr: TEdit;
    ShowColDescr: TEdit;
    YarnRcptYNQLTY: TStringField;
    EditQltyComboBox: TDBComboBox;
    Label11: TLabel;
    EditYarnStru: TDBEdit;
    EditYarnCol: TDBEdit;
    TypeSearchSpdBtn: TSpeedButton;
    ClearDefBtn: TButton;
    YarnStruQuery: TQuery;
    YarnColQuery: TQuery;
    YarnStruQueryDESCR: TStringField;
    YarnColQueryDESCR: TStringField;
    VBSearch: TSpeedButton;
    DateManuSpdBtn: TSpeedButton;
    ModeIndicator: TLabel;
    YarnRcptDESPNO: TIntegerField;
    Label12: TLabel;
    EditDespNo: TDBEdit;
    YarnStruQueryLABELDESCR: TStringField;
    ShowStruLabelDescr: TEdit;
    YarnRcptSHIFT: TStringField;
    Label13: TLabel;
    YarnRcptDATEMANU: TDateTimeField;
    Label14: TLabel;
    EditDateRcvd: TDBEdit;
    EditShift: TDBComboBox;
    YarnRcptYNTWIST: TStringField;
    EditYnTwist: TDBEdit;
    Button1: TButton;
    YarnRcptRETURNED: TStringField;
    ReturnedLabel: TLabel;
    EditReturned: TDBComboBox;
    EditInitials: TDBEdit;
    YarnRcptPALLETNO: TIntegerField;
    Label16: TLabel;
    EditPalletNo: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    YarnRcptBPC: TSmallintField;
    EditBPC: TDBEdit;
    YarnRcptVALUERATING: TFloatField;
    YarnRcptVALUERATINGDATE: TDateTimeField;
    YarnRcptSTOCKAREA: TIntegerField;
    Label19: TLabel;
    EditStockArea: TDBEdit;
    YarnRcptWARPNO: TIntegerField;
    Label8: TLabel;
    YarnRcptCUSTREF: TStringField;
    CustRefSpdBtn: TSpeedButton;
    EditCustRef: TDBEdit;
    SPYnBoxNo: TStoredProc;
    YarnRcptBATREF: TIntegerField;
    Label15: TLabel;
    EditBatRef: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    ShowDateEnt: TDBEdit;
    ShowUserEnt: TDBEdit;
    ShowDateMod: TDBEdit;
    ShowUserMod: TDBEdit;
    YarnRcptDATEENT: TDateTimeField;
    YarnRcptUSERENT: TStringField;
    YarnRcptDATEMOD: TDateTimeField;
    YarnRcptUSERMOD: TStringField;
    Label23: TLabel;
    MyQuery: TQuery;
    PlusBitBtn: TBitBtn;
    PostBtn: TButton;
    CancelBtn: TBitBtn;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    EditWarpNo: TDBEdit;
    Label20: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    EditFlange: TDBEdit;
    EditLength: TDBEdit;
    YarnRcptWARPTYPE: TStringField;
    YarnRcptWARPLENGTH: TIntegerField;
    YarnRcptFLANGE: TIntegerField;
    Label26: TLabel;
    EditWarpType: TDBEdit;
    WarpTypeQuery: TQuery;
    Label27: TLabel;
    EditEnds: TDBEdit;
    YarnRcptENDS: TIntegerField;
    WarpTypeQueryWARPTYPE: TStringField;
    WarpTypeQueryWARP1STRU: TStringField;
    WarpTypeQueryWARP1TWIST: TStringField;
    WarpTypeQueryWARP1ENDS: TSmallintField;
    WarpTypeQueryWPYNMETRESTOKGS: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure YarnRcptNewRecord(DataSet: TDataset);
    procedure TypeSearchSpdBtnClick(Sender: TObject);
    procedure EditYarnStruChange(Sender: TObject);
    procedure EditYarnColChange(Sender: TObject);
    procedure ClearDefBtnClick(Sender: TObject);
{    procedure ClearFormBtnClick(Sender: TObject);}
    procedure SetDefaultsBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure YarnRcptSourceStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure YarnRcptAfterPost(DataSet: TDataset);
    procedure YarnRcptAfterDelete(DataSet: TDataset);
    procedure YarnRcptAfterCancel(DataSet: TDataset);
    procedure YarnRcptBeforeCancel(DataSet: TDataset);
    procedure YarnRcptBeforeDelete(DataSet: TDataset);
    procedure EditYNTAREChange(Sender: TObject);
    procedure EditYNNETChange(Sender: TObject);
    procedure EditYNTAREExit(Sender: TObject);
    procedure EditYNNETExit(Sender: TObject);
    procedure DateManuSpdBtnClick(Sender: TObject);
    procedure VBSearchClick(Sender: TObject);
    procedure YarnRcptBeforeEdit(DataSet: TDataset);
    procedure Button1Click(Sender: TObject);
    procedure YarnRcptDATEMANUChange(Sender: TField);
    procedure YarnRcptBeforeInsert(DataSet: TDataSet);
    procedure YarnRcptBeforePost(DataSet: TDataSet);
    procedure CustRefSpdBtnClick(Sender: TObject);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure PlusBitBtnClick(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EditYnTwistChange(Sender: TObject);
    procedure YarnRcptPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure EditEndsExit(Sender: TObject);
    procedure EditStockAreaExit(Sender: TObject);
  private
    { private declarations }
    DefaultsSet:boolean;
    YnStru:string;
    YnTwist:string;
    YnCol:string;
    YnTare:real;
    DateManu:real;
    LotNo1:integer;
    LotNo2:integer;
    YnQlty:string;
    {Returned:string;}
    Shift:string;
    BPC:integer;
    CustRef:string;
    StockArea:integer;
  public
    { public declarations }
  end;

var
  YnRcptForm: TYnRcptForm;

implementation

uses Main, BrModal, PickDate, BarCode, Utils;

{$R *.DFM}

procedure TYnRcptForm.FormCreate(Sender: TObject);
begin
{  YarnRcpt.Open;}
end;

procedure TYnRcptForm.YarnRcptNewRecord(DataSet: TDataset);
begin
  {find the next yarnrcpt no}
  SPYnBoxNo.ExecProc;
  EditBoxNo.ReadOnly:=false;
  YarnRcpt.FieldByName('BoxNo').AsInteger:=SPYnBoxNo.ParamByName('Code').AsInteger;
  EditBoxNo.ReadOnly:=true;
{  YarnRcptLotNo1.Clear;
  YarnRcptLotNo2.Clear;}
  ShowGross.ReadOnly:=false;
  ShowGross.Text:='0';
  ShowGross.ReadOnly:=true;
  YarnRcptYnNet.Clear; {Value:=0;}
  YarnRcptYnQlty.Value:='';
  YarnRcptDateEnt.Value:=now;
  YarnRcptUserEnt.Value:=UserInitials;
  YarnRcptDateMod.Value:=YarnRcptDateEnt.Value;
  YarnRcptUserMod.Value:=UserInitials;
  if PassValue=0 then
  begin
    YarnRcptReturned.Value:='N';
    EditCustRef.ReadOnly:=false; //added DL241199
    YarnRcptCustRef.Value:='ZCLIEN';
    EditCustRef.ReadOnly:=true; //added DL241199
  end
  else
  begin
    YarnRcptReturned.Value:='Y';
    EditShift.ReadOnly:=false;
    YarnRcptShift.Value:='Z';
    EditShift.ReadOnly:=true;
    EditShift.Color:=clSilver;
    Shift:='Z';
  end;
  EditQltyComboBox.ItemIndex:=0; {<blank>}
  {EditReturned.ItemIndex:=0; {N}
  EditDateRcvd.ReadOnly:=false;
  YarnRcptDateRcvd.Value:=date;
  EditDateRcvd.ReadOnly:=true;
  EditInitials.ReadOnly:=false;
  YarnRcptInitials.Value:=UserInitials;
  EditInitials.ReadOnly:=true;
  YarnRcptLotNo1.Value:=0;
  YarnRcptLotNo2.Value:=0;
  YarnRcptWarpNo.Value:=0;
  YarnRcptStockArea.Value:=0;
  if DefaultsSet then
  begin
    EditYarnStru.ReadOnly:=false;
    EditYnTwist.ReadOnly:=false;
    EditYarnCol.ReadOnly:=false;
    EditYnTare.ReadOnly:=false;
    EditDateRcvd.ReadOnly:=false;
    EditLotNo.ReadOnly:=false;
    EditLotNo2.ReadOnly:=false;
    EditQltyComboBox.ReadOnly:=false;
    {EditReturned.ReadOnly:=false;}
    EditShift.ReadOnly:=false;
    //EditCustRef.ReadOnly:=false; removed DL241199
    EditStockArea.ReadOnly:=false;
    YarnRcptYnStru.Value:=YnStru;
    YarnRcptYnTwist.Value:=YnTwist;
    YarnRcptYnCol.Value:=YnCol;
    YarnRcptYnTare.Value:=YnTare;
    YarnRcptDateManu.Value:=DateManu;
    YarnRcptLotNo1.Value:=LotNo1;
    YarnRcptLotNo2.Value:=LotNo2;
    YarnRcptYnQlty.Value:=YnQlty;
    {YarnRcptReturned.Value:=Returned;}
    YarnRcptShift.Value:=Shift;
    YarnRcptBPC.Value:=BPC;
    YarnRcptStockArea.Value:=StockArea;
    if PassValue=1 then
    begin
      EditCustRef.ReadOnly:=false; //added DL241199
      YarnRcptCustRef.Value:=CustRef;
      EditCustRef.ReadOnly:=true; //added DL241199
    end;
    EditYarnStru.ReadOnly:=true;
    EditYnTwist.ReadOnly:=true;
    EditYarnCol.ReadOnly:=true;
    EditYnTare.ReadOnly:=true;
    EditDateRcvd.ReadOnly:=true;
    EditLotNo.ReadOnly:=true;
    EditLotNo2.ReadOnly:=true;
    EditQltyComboBox.ReadOnly:=true;
    {EditReturned.ReadOnly:=true;}
    EditShift.ReadOnly:=true;
    //EditCustRef.ReadOnly:=true; removed DL241199
    EditStockArea.ReadOnly:=true;
  end
  else
  begin
    EditYnTare.ReadOnly:=false;
    YarnRcptYnTare.Value:=0;
    EditBPC.ReadOnly:=false;
    YarnRcptBPC.Value:=0;
    YarnRcptDateManu.Value:=date;
  end;
  YarnRcptDespNo.ReadOnly:=false;
  YarnRcptDespNo.Value:=0; {despatch number}
  YarnRcptDespNo.ReadOnly:=true;
  YarnRcptPalletNo.ReadOnly:=false;
  YarnRcptPalletNo.Value:=0;
  YarnRcptPalletNo.ReadOnly:=true;
{  EditQltyComboBox.ItemIndex:=0;}
  {when ready find next box number automatically}
  YarnRcptValueRating.Value:=1; {added DL170297}
  YarnRcptValueRatingDate.Value:=DateManu; {added DL100397}
  YarnRcptBatRef.Value:=0;
  if DefaultsSet or (PassValue=1) then
    EditYnNet.SetFocus
  else
    EditShift.SetFocus;
end;

procedure TYnRcptForm.TypeSearchSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalYarnType = mrOk then
  begin
    EditYarnStru.ReadOnly:=false;
    EditYnTwist.ReadOnly:=false;
    EditYarnCol.ReadOnly:=false;
    YarnRcpt.Edit;
    YarnRcptYnTwist.Value:=PickDlgForm.YarnTypeYnTwist;
    YarnRcptYnStru.Value:=PickDlgForm.YarnTypeStru;
    YarnRcptYnCol.Value:=PickDlgForm.YarnTypeCol;
    EditYarnStru.ReadOnly:=true;
    EditYnTwist.ReadOnly:=true;
    EditYarnCol.ReadOnly:=true;
    //added DL230400 just in case info below is wrong after a change
    YarnRcptWarpNo.Value:=0;
    YarnRcptWARPTYPE.AsString:='';
    YarnRcptWARPLENGTH.AsInteger:=0;
    YarnRcptFLANGE.AsInteger:=0;
    YarnRcptENDS.AsInteger:=0;
  end;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TYnRcptForm.EditYarnStruChange(Sender: TObject);
begin
  if (YarnRcptYnStru.Value<>'') and
    (YarnRcptYnTwist.Value<>'') then
  begin
    YarnStruQuery.Active:=false;
    YarnStruQuery.Params[0].AsString:=YarnRcptYnStru.Value;
    YarnStruQuery.Params[1].AsString:=YarnRcptYnTwist.Value;
    YarnStruQuery.Active:=true;
    with YarnStruQuery.Fields[0] do
      if IsNull then
      begin
        ShowStruDescr.Text := '-1';
        ShowStruLabelDescr.Text := '-1';
      end
      else
      begin
        ShowStruDescr.Text := AsString;
        ShowStruLabelDescr.Text := YarnStruQuery.Fields[1].AsString;
      end;
    YarnStruQuery.Active:=false;
  end
  else
    ShowStruDescr.Clear;
end;

procedure TYnRcptForm.EditYarnColChange(Sender: TObject);
begin
  if {(YarnRcpt.State in [dsEdit,dsInsert]) and}
    (YarnRcptYnCol.Value<>'') then
  begin
    YarnColQuery.Active:=false;
    YarnColQuery.Params[0].AsString:=YarnRcptYnCol.Value;
    YarnColQuery.Active:=true;
    with YarnColQuery.Fields[0] do
      if IsNull then
        ShowColDescr.Text := '-1'
      else
        ShowColDescr.Text := AsString;
    YarnColQuery.Active:=false;
  end
  else
    ShowColDescr.Clear;
end;

procedure TYnRcptForm.ClearDefBtnClick(Sender: TObject);
begin
  YnStru:='';
  YnTwist:='';
  YnCol:='';
  YnTare:=0;
  DateManu:=0;
  LotNo1:=0;
  LotNo2:=0;
  StockArea:=0;
  if PassValue=0 then
    Shift:='';
  CustRef:='';
  EditYnTare.TabStop:=true;
  EditStockArea.TabStop:=true;
  EditDateManu.TabStop:=true;
  EditLotNo.TabStop:=true;
  EditLotNo2.TabStop:=true;
  if PassValue=0 then
    EditShift.TabStop:=true;
  //EditCustRef.TabStop:=true; removed DL241199
  EditYnTare.Color:=clWindow;
  EditStockArea.Color:=clWindow;
  EditDateManu.Color:=clWindow;
  EditLotNo.Color:=clWindow;
  EditLotNo2.Color:=clWindow;
  EditQltyComboBox.Color:=clWindow;
  //EditCustRef.Color:=clWindow; removed DL241199
  {EditReturned.Color:=clWindow;}
  if PassValue=0 then
    EditShift.Color:=clWindow;
  DefaultsSet:=false;
  EditYnTare.ReadOnly:=false;
  EditStockArea.ReadOnly:=false;
  EditDateManu.ReadOnly:=false;
  EditLotNo.ReadOnly:=false;
  EditLotNo2.ReadOnly:=false;
  EditQltyComboBox.ReadOnly:=false;
  {EditReturned.ReadOnly:=false;}
  if PassValue=0 then
    EditShift.ReadOnly:=false;
  {if PassValue=0 then removed DL241199
    EditCustRef.ReadOnly:=true
  else
    EditCustRef.ReadOnly:=false;}
  {clear the other fields}
{  ClearFormBtnClick(Sender);}
end;

{procedure TYnRcptForm.ClearFormBtnClick(Sender: TObject);
begin
  if YarnRcpt.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post this receipt before inserting again',
      mtInformation, [mbOK], 0);
    Exit;
  end;
  YarnRcptYnNet.Clear;
  if DefaultsSet then
  begin
    EditYarnStru.ReadOnly:=false;
    EditYarnCol.ReadOnly:=false;
    EditYnTare.ReadOnly:=false;
    EditDateRcvd.ReadOnly:=false;
    EditDateManu.ReadOnly:=false;
    EditLotNo.ReadOnly:=false;
    EditLotNo2.ReadOnly:=false;
    EditQltyComboBox.ReadOnly:=false;
    EditShift.ReadOnly:=false;
    YarnRcptYnStru.Value:=YnStru;
    YarnRcptYnCol.Value:=YnCol;
    YarnRcptYnTare.Value:=YnTare;
    YarnRcptDateManu.Value:=DateManu;
    YarnRcptDateRcvd.Value:=date;
    YarnRcptLotNo1.Value:=LotNo1;
    YarnRcptLotNo2.Value:=LotNo2;
    YarnRcptYnQlty.Value:=YnQlty;
    YarnRcptShift.Value:=Shift;
    EditYarnStru.ReadOnly:=true;
    EditYarnCol.ReadOnly:=true;
    EditYnTare.ReadOnly:=true;
    EditDateRcvd.ReadOnly:=true;
    EditDateManu.ReadOnly:=true;
    EditLotNo.ReadOnly:=true;
    EditLotNo2.ReadOnly:=true;
    EditShift.ReadOnly:=true;
    EditQltyComboBox.ReadOnly:=true;
  end;
end;}

procedure TYnRcptForm.SetDefaultsBtnClick(Sender: TObject);
begin
{  if YarnRcpt.State in [dsEdit,dsInsert] then
  begin}
    if (YarnRcptYnStru.Value='') or
      (YarnRcptYnTwist.Value='') or
      (YarnRcptYnCol.Value='') or
      (YarnRcptYnTare.Value=0) or
      (YarnRcptStockArea.Value=0) or
      (YarnRcptDateManu.Value=0) or
      (YarnRcptShift.Value='') or
      (YarnRcptLotNo1.Value=0) or
      (YarnRcptLotNo2.Value=0) or
      ((YarnRcptCustRef.Value='') and (PassValue=1)) then
      begin
        ShowMessage('Cannot Set defaults until all defaults have been set');
        Abort;
      end;
    YnStru:=YarnRcptYnStru.AsString;
    YnTwist:=YarnRcptYnTwist.AsString;
    YnCol:=YarnRcptYnCol.AsString;
    YnTare:=YarnRcptYnTare.AsFloat;
    StockArea:=YarnRcptStockArea.AsInteger;
    DateManu:=YarnRcptDateManu.AsFloat;
    LotNo1:=YarnRcptLotNo1.AsInteger;
    LotNo2:=YarnRcptLotNo2.AsInteger;
    YnQlty:=YarnRcptYnQlty.AsString;
    {Returned:=YarnRcptReturned.AsString;}
    Shift:=YarnRcptShift.AsString;
    BPC:=YarnRcptBPC.AsInteger;
    CustRef:=YarnRcptCustRef.AsString;
    EditYarnStru.TabStop:=false;
    EditYnTwist.TabStop:=false;
    EditYarnCol.TabStop:=false;
    EditYnTare.TabStop:=false;
    EditStockArea.TabStop:=false;
    EditDateManu.TabStop:=false;
    EditLotNo.TabStop:=false;
    EditLotNo2.TabStop:=false;
    EditShift.TabStop:=false;
    EditYnTare.Color:=clSilver; {clWindow}
    EditStockArea.Color:=clSilver;
    EditDateManu.Color:=clSilver;
    EditLotNo.Color:=clSilver;
    EditLotNo2.Color:=clSilver;
    EditQltyComboBox.Color:=clSilver;
    {EditReturned.Color:=clSilver;}
    EditShift.Color:=clSilver;
    DefaultsSet:=true;
    EditYnNet.SetFocus;
    //EditCustRef.TabStop:=false; removed DL241199
    //EditCustRef.Color:=clSilver; removed DL241199
{  end
  else
    ShowMessage('Cannot set defaults');}
end;

procedure TYnRcptForm.CloseBitBtnClick(Sender: TObject);
begin
{  ClearDefBtnClick(Sender);}
  Close;
end;

procedure TYnRcptForm.FormShow(Sender: TObject);
begin
  YarnRcpt.Open;
  YarnRcpt.Refresh;
  DefaultsSet:=false;
  if PassValue=0 then
  begin
    YnRcptForm.Caption:='Yarn Receipts from factory';
    ManuOrReturnedLabel.Caption:='Date Manufac';
    ReturnedLabel.Font.Color:=clBlack;
    CustRefSpdBtn.Visible:=false;
    //EditCustRef.Color:=clSilver; removed DL241199
    //EditCustRef.ReadOnly:=true; removed DL241199
  end
  else
  begin
    YnRcptForm.Caption:='Yarn Returns from clients';
    ManuOrReturnedLabel.Caption:='Date Returned';
    ReturnedLabel.Font.Color:=clRed;
    CustRefSpdBtn.Visible:=true;
    //EditCustRef.Color:=clWindow; removed DL241199
    //EditCustRef.ReadOnly:=false; removed DL241199
  end;
end;

procedure TYnRcptForm.YarnRcptSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := YarnRcpt.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := YarnRcpt.State = dsBrowse;
  if YarnRcpt.State = dsEdit then
  begin
    ModeIndicator.Caption := 'Edit';
    ModeIndicator.Font.Color := clRed;
  end
  else
    if YarnRcpt.State = dsInsert then
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

procedure TYnRcptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if YarnRcpt.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  WarpTypeQuery.Close; //added DL230400
  YarnRcpt.Close;
  YnRcptForm.Release;
end;

procedure TYnRcptForm.YarnRcptAfterPost(DataSet: TDataset);
var
  LabelData:string;
  ConsLabel:string;
begin
  {print the bar code}
  MainForm.Database.Commit;

  BarCodeForm.StartLabel(true); {true for lastlabel}
  BarCodeForm.SendLabelData(10,'','');  {Vrede Textiles + address}
  if YarnRcptYnStru.Value='XSFG' then {AECI Label}
    ConsLabel:='  Cons '
  else
    ConsLabel:='  Lot ';
  LabelData:='Box '+ZeroFill(YarnRcptBoxNo.Value,6)+
    ConsLabel+inttostr(YarnRcptLotNo1.Value)+'/'+  {for AECI Consignment No}
    inttostr(YarnRcptLotNo2.Value);
  BarCodeForm.SendLabelData(1,LabelData,'');
  if YarnRcptYnStru.Value='XSFG' then {AECI label}
    LabelData:='AECI DuraFuse'
  else
    LabelData:=ShowStruLabelDescr.Text+'  col:'+
      YarnRcptYnQlty.Value+' '+
      YarnRcptYnCol.Value;
  BarCodeForm.SendLabelData(20,LabelData,'');
  LabelData:='Gross: '+
    floattostrf(YarnRcptYnNet.Value+YarnRcptYnTare.Value,ffFixed,4,1)+
    '  Tare: '+floattostrf(YarnRcptYnTare.Value,ffFixed,4,1);
  BarCodeForm.SendLabelData(3,LabelData,'');
  if YarnRcptWarpNo.Value=0 then
    LabelData:='Net: '+
      floattostrf(YarnRcptYnNet.Value,ffFixed,4,1)+' KG BPC: '+
      inttostr(YarnRcptBPC.Value)
  else
    LabelData:='Net: '+
      floattostrf(YarnRcptYnNet.Value,ffFixed,4,1)+' KG WP: '+
      inttostr(YarnRcptWarpNo.Value);
  BarCodeForm.SendLabelData(4,LabelData,'');
  //added DateManu DL230400
  LabelData:='Manu: '+FormatDateTime('dd/mm/yyyy',YarnRcptDATEMANU.AsDateTime); //added DL230400
  BarCodeForm.SendLabelData(5,LabelData,''); //added DL230400
  LabelData:='12'+ZeroFill(YarnRcptBoxNo.Value,6); {12 was 02: DL020397}
  BarCodeForm.SendLabelData(6,LabelData,'');
  BarCodeForm.EndLabel;

  //added Warp Label format DL230400
  if YarnRcptWARPNO.AsInteger<>0 then
  begin
    BarCodeForm.StartLabel(true); {true for lastlabel}
    BarCodeForm.SendLabelData(10,'','');  {Vrede Textiles + address}
    ConsLabel:='  Lot ';
    LabelData:='Warp '+ZeroFill(YarnRcptWARPNO.Value,6)+
      ConsLabel+inttostr(YarnRcptLotNo1.Value)+'/'+
      inttostr(YarnRcptLotNo2.Value);
    BarCodeForm.SendLabelData(1,LabelData,'');
    LabelData:='Type:'+YarnRcptWARPTYPE.AsString+
      ' len:'+YarnRcptWARPLENGTH.AsString+'m';
    BarCodeForm.SendLabelData(20,LabelData,'');
    LabelData:=ShowStruLabelDescr.Text+'  col:'+
      YarnRcptYnQlty.Value+' '+
      YarnRcptYnCol.Value;
    BarCodeForm.SendLabelData(3,LabelData,'');
    LabelData:='Flange: '+YarnRcptFLANGE.AsString+
      ' Box: '+YarnRcptBOXNO.AsString;
    BarCodeForm.SendLabelData(4,LabelData,'');
    //added DateManu DL230400
    LabelData:='Manu: '+FormatDateTime('dd/mm/yyyy',YarnRcptDATEMANU.AsDateTime); //added DL230400
    BarCodeForm.SendLabelData(5,LabelData,''); //added DL230400
    BarCodeForm.EndLabel;
  end;
end;

procedure TYnRcptForm.YarnRcptAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TYnRcptForm.YarnRcptAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  YarnRcpt.Refresh;
{  MainForm.Database.StartTransaction;}
end;

procedure TYnRcptForm.YarnRcptBeforeCancel(DataSet: TDataset);
begin
  if YarnRcpt.State=dsInsert then
    if MessageDlg('Cancel yarn receipt being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TYnRcptForm.YarnRcptBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete yarn receipt?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TYnRcptForm.EditYNTAREChange(Sender: TObject);
begin
  if (EditYnTare.Text<>'') and (EditYnNet.Text<>'') then
    if (strtofloat(EditYnTare.Text)<>0) and (strtofloat(EditYnNet.Text)<>0) then
    begin
      ShowGross.ReadOnly:=false;
      ShowGross.Text:=floattostr(YarnRcptYnNet.Value+YarnRcptYnTare.Value);
      ShowGross.ReadOnly:=true;
    end;
end;

procedure TYnRcptForm.EditYNNETChange(Sender: TObject);
begin
  if (EditYnTare.Text<>'') and (EditYnNet.Text<>'') then
    if (YarnRcptYnTare.Value<>0) and (YarnRcptYnNet.Value<>0) then
    begin
      ShowGross.ReadOnly:=false;
      ShowGross.Text:=floattostr(YarnRcptYnNet.Value+YarnRcptYnTare.Value);
      ShowGross.ReadOnly:=true;
    end;
end;

procedure TYnRcptForm.EditYNTAREExit(Sender: TObject);
begin
  if (EditYnTare.Text<>'') and (EditYnNet.Text<>'') then
    if (strtofloat(EditYnTare.Text)<>0) and (strtofloat(EditYnNet.Text)<>0) then
    begin
      ShowGross.ReadOnly:=false;
      ShowGross.Text:=floattostr(YarnRcptYnNet.Value+YarnRcptYnTare.Value);
      ShowGross.ReadOnly:=true;
    end;
end;

procedure TYnRcptForm.EditYNNETExit(Sender: TObject);
begin
  if (EditYnTare.Text<>'') and (EditYnNet.Text<>'') then
  begin
    if (strtofloat(EditYnTare.Text)<>0) and (strtofloat(EditYnNet.Text)<>0) then
    begin
      ShowGross.ReadOnly:=false;
      ShowGross.Text:=floattostr(YarnRcptYnNet.Value+YarnRcptYnTare.Value);
      ShowGross.ReadOnly:=true;
    end;
  end;
  YarnRcptWARPLENGTH.AsInteger:=0; //added DL230400
end;

procedure TYnRcptForm.DateManuSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=YarnRcptDateManu.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    YarnRcpt.Edit;
    YarnRcptDateManu.Value:=BRDateForm.Date;
  end;
end;

procedure TYnRcptForm.VBSearchClick(Sender: TObject);
begin
  if YarnRcpt.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    if PickDlgForm.ShowModalYarnRcpt = mrOk then
    begin
      YarnRcpt.SetKey;
      YarnRcpt.FieldByName('BoxNo').AsInteger:=PickDlgForm.YarnRcptBoxNo;
      YarnRcpt.GotoKey;
    end;
  end;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TYnRcptForm.YarnRcptBeforeEdit(DataSet: TDataset);
begin
{  OldYnNet:=strtofloat(EditYnNet.Text);}
  if YarnRcptDespNo.Value<>0 then
  begin
    ShowMessage('Cannot edit as already despatched!');
    Abort;
  end;
  MainForm.Database.StartTransaction;
end;

procedure TYnRcptForm.Button1Click(Sender: TObject);
var
{  BoxNumber:integer;}
  BoxNumberStr:string;
begin
  if YarnRcpt.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    BoxNumberStr:='0';
    if InputQuery('Finished Good Search',
      'Enter box number',
      BoxNumberStr) then
    begin
      if length(BoxNumberStr)=8 then {bar code scanned: added DL020397}
        BoxNumberStr:=copy(BoxNumberStr,3,6); {added DL020397}
      YarnRcpt.SetKey;
      YarnRcpt.FieldByName('BoxNo').AsInteger:=strtoint(BoxNumberStr);
      if not YarnRcpt.GotoKey then
        ShowMessage('Box not found')
      else
        YarnRcpt.GotoKey;
    end;
  end;
end;

procedure TYnRcptForm.YarnRcptDATEMANUChange(Sender: TField);
begin
  if (YarnRcptDATEMANU.Value<NoEntryBeforeDate) then
  begin
    YarnRcptDATEMANU.Value:=date;
    raise exception.create('Date cannot be less than '+
      FormatDateTime('dd-mmm-yyyy',NoEntryBeforeDate));
  end;
  if (YarnRcptDATEMANU.Value>date) then
  begin
    YarnRcptDATEMANU.Value:=date;
    raise exception.create('Date cannot be greater than today');
  end;
end;

procedure TYnRcptForm.YarnRcptBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TYnRcptForm.YarnRcptBeforePost(DataSet: TDataSet);
begin
  if ((YarnRcptYnTwist.Value='SS') or (YarnRcptYnTwist.Value='SZ') or
    (YarnRcptYnTwist.Value='ZZ')) then
  begin
    //if statement and checks modified DL230400
    if (YarnRcptWarpNo.Value=0) then
      raise Exception.Create('Warp Number required')
    else if YarnRcptENDS.AsInteger=0 then
      raise Exception.Create('Warp Ends required')
    else if YarnRcptWARPTYPE.AsString='' then
      raise Exception.Create('Warp Type required')
    else if YarnRcptWARPLENGTH.AsInteger=0 then
      raise Exception.Create('Warp Length required')
    else if YarnRcptFLANGE.AsInteger=0 then
      raise Exception.Create('Warp Flange required');
  end
  else
    if not ((YarnRcptYnTwist.Value='SS') or
            (YarnRcptYnTwist.Value='SZ') or
            (YarnRcptYnTwist.Value='ZZ')) then
    begin
      YarnRcptWarpNo.Value:=0; {in case filled in}
      //added DL230400
      YarnRcptWARPTYPE.AsString:='';
      YarnRcptWARPLENGTH.AsInteger:=0;
      YarnRcptFLANGE.AsInteger:=0;
      YarnRcptENDS.AsInteger:=0;
    end;
  if (YarnRcptStockArea.AsInteger<9000) or (YarnRcptStockArea.AsInteger>9900) then //was 9999 DL030501
    raise Exception.Create('Stock Area must be between 9000 and 9900'); //was 9999 DL030501
  if YarnRcpt.State = dsEdit then
  begin
    YarnRcptDateMod.Value:=now;
    YarnRcptUserMod.Value:=UserInitials;
  end;
end;

procedure TYnRcptForm.CustRefSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalSups('CU') = mrOk then {CU for customers}
  begin
    EditCustRef.ReadOnly:=false; //added DL241199
    YarnRcptCustRef.AsString:=PickDlgForm.SupRef;
    EditCustRef.ReadOnly:=true; //added DL241199
  end;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TYnRcptForm.DBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  {go to the last record in a hurry}
  {put a TQuery object onto your form called MyQuery}
  {insert your databasename;requestlive=false;active=false}
  {if nbLast ... MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select max(boxno)');
  MyQuery.SQL.Add('from yarnrcpt');
  MyQuery.Prepare;
  try
    MyQuery.Open;
    MyQuery.First;
    YarnRcpt.SetKey;
    YarnRcpt.FieldByName('BoxNo').AsInteger:=MyQuery.Fields[0].AsInteger;
    if not YarnRcpt.GotoKey then
      ShowMessage('Box not found')
    else
      YarnRcpt.GotoKey;
  finally
    MyQuery.Close;
  end;}
end;

procedure TYnRcptForm.PlusBitBtnClick(Sender: TObject);
begin
  YarnRcpt.Insert; {was append: DL210897}
end;

procedure TYnRcptForm.PostBtnClick(Sender: TObject);
begin
  YarnRcpt.Post;
end;

procedure TYnRcptForm.CancelBtnClick(Sender: TObject);
begin
  YarnRcpt.Cancel;
end;

procedure TYnRcptForm.SpeedButton1Click(Sender: TObject);
begin
  if YarnRcpt.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    if PickDlgForm.ShowModalYarnRcptLotNo = mrOk then
    begin
      YarnRcpt.SetKey;
      YarnRcpt.FieldByName('BoxNo').AsInteger:=PickDlgForm.YarnRcptLotNoBoxNo;
      YarnRcpt.GotoKey;
    end;
  end;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TYnRcptForm.EditYnTwistChange(Sender: TObject);
begin
  if (YarnRcptYnStru.Value<>'') and
    (YarnRcptYnTwist.Value<>'') then
  begin
    YarnStruQuery.Active:=false;
    YarnStruQuery.Params[0].AsString:=YarnRcptYnStru.Value;
    YarnStruQuery.Params[1].AsString:=YarnRcptYnTwist.Value;
    YarnStruQuery.Active:=true;
    with YarnStruQuery.Fields[0] do
      if IsNull then
      begin
        ShowStruDescr.Text := '-1';
        ShowStruLabelDescr.Text := '-1';
      end
      else
      begin
        ShowStruDescr.Text := AsString;
        ShowStruLabelDescr.Text := YarnStruQuery.Fields[1].AsString;
      end;
    YarnStruQuery.Active:=false;
  end
  else
    ShowStruDescr.Clear;
end;

procedure TYnRcptForm.YarnRcptPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
{  DatabaseError(E.Message);}
{  E:eDBEngineError do DatabaseError(E.Message+'~:~'+
      inttostr(E.Errors[0].Category)+':'+
      inttostr(E.Errors[0].SubCode));}
end;

procedure TYnRcptForm.EditEndsExit(Sender: TObject);
var
  YnStru:string;
begin
  //added Warp Lookup DL230400
  if YarnRcptYnTwist.AsString='SZ' then
  begin
    YnStru:=YarnRcptYNSTRU.AsString;
    if YnStru='V095' then
      YnStru:='H095'; //bec. H095 in database
    WarpTypeQuery.Close;
    WarpTypeQuery.ParamByName('Warp1Stru').AsString:=YnStru;
    WarpTypeQuery.ParamByName('Warp1Twist').AsString:=YarnRcptYNTWIST.AsString;
    WarpTypeQuery.ParamByName('Warp1Ends').AsInteger:=YarnRcptENDS.AsInteger;
    WarpTypeQuery.Open;
    if not WarpTypeQueryWPYNMETRESTOKGS.IsNull then
    begin
      YarnRcptWARPTYPE.AsString:=WarpTypeQueryWARPTYPE.AsString;
      if WarpTypeQueryWPYNMETRESTOKGS.AsFloat<>0 then
      begin
        YarnRcptWARPLENGTH.AsInteger:=trunc(YarnRcptYNNET.AsFloat/
          WarpTypeQueryWPYNMETRESTOKGS.AsFloat);
      end;
    end;
  end
  else
  begin
    //added DL230400
    YarnRcptWarpNo.Value:=0;
    YarnRcptWARPTYPE.AsString:='';
    YarnRcptWARPLENGTH.AsInteger:=0;
    YarnRcptFLANGE.AsInteger:=0;
    YarnRcptENDS.AsInteger:=0;
  end;
end;

procedure TYnRcptForm.EditStockAreaExit(Sender: TObject);
begin
  //added DL230400
  if YarnRcptYnTwist.AsString='SZ' then
    EditWarpNo.SetFocus
  else
    EditShift.SetFocus;
end;

end.
