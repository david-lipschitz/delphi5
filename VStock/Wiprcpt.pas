unit Wiprcpt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, DBLookup, Buttons,
  Dialogs;

type
  TWIPRcptForm = class(TForm)
    ScrollBox: TScrollBox;
    Label2: TLabel;
    Label3: TLabel;
    EditRCPTDATE: TDBEdit;
    EditNETWEIGHT: TDBEdit;
    EditLOTNO1: TDBEdit;
    EditLOTNO2: TDBEdit;
    EditDATEMANU: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    WIPRcptSource: TDataSource;
    Panel2: TPanel;
    WIPRcpt: TTable;
    Label1: TLabel;
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
    Product: TTable;
    ProductSource: TDataSource;
    Label10: TLabel;
    Label11: TLabel;
    EditProdRef: TDBLookupCombo;
    Label6: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EditShift: TDBComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label4: TLabel;
    EditRefNo: TDBEdit;
    CloseBitBtn: TBitBtn;
    Label5: TLabel;
    EditIssueDate: TDBEdit;
    ModeIndicator: TLabel;
    DateManuSpdBtn: TSpeedButton;
    ShowProdDescr: TEdit;
    ProductDESCR: TStringField;
    ProductLABELDESCR: TStringField;
    ProductPRODREF: TStringField;
    ShowProdLabelDescr: TEdit;
    SpeedButton1: TSpeedButton;
    SetDefaultsBtn: TButton;
    WIPRcptSearchSpdBtn: TSpeedButton;
    ProductINSTOCK: TFloatField;
    Label15: TLabel;
    WIPRcptISSUETO: TStringField;
    EditIssueTo: TDBEdit;
    EditIssueInitials: TDBEdit;
    EditRcptInitials: TDBEdit;
    WIPRcptVALUERATING: TFloatField;
    ProductMEASUNIT: TStringField;
    ShowProdMeasUnit: TEdit;
    Label16: TLabel;
    ShowProdCategory: TEdit;
    ProductCATEGORY: TStringField;
    WIPRcptVALUERATINGDATE: TDateTimeField;
    WIPRcptSTOCKAREA: TIntegerField;
    EditStockArea: TDBEdit;
    Label17: TLabel;
    SPWIPRcptNo: TStoredProc;
    WIPRcptBATREF: TIntegerField;
    WIPRcptDATEENT: TDateTimeField;
    WIPRcptUSERENT: TStringField;
    WIPRcptDATEMOD: TDateTimeField;
    WIPRcptUSERMOD: TStringField;
    Label18: TLabel;
    Label19: TLabel;
    ShowDateEnt: TDBEdit;
    ShowUserEnt: TDBEdit;
    ShowDateMod: TDBEdit;
    ShowUserMod: TDBEdit;
    WIPRcptFACTORYNO: TIntegerField;
    Label20: TLabel;
    ShowFactoryNo: TDBEdit;
    Label21: TLabel;
    ShowBatRef: TDBEdit;
    PlusBitBtn: TBitBtn;
    CancelBtn: TBitBtn;
    PostBtn: TButton;
    WIPRcptQLTY: TStringField;
    Label22: TLabel;
    EditQlty: TDBComboBox;
    procedure CancelBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure WIPRcptAfterCancel(DataSet: TDataset);
    procedure WIPRcptAfterDelete(DataSet: TDataset);
    procedure WIPRcptAfterPost(DataSet: TDataset);
    procedure WIPRcptBeforeCancel(DataSet: TDataset);
    procedure WIPRcptBeforeDelete(DataSet: TDataset);
    procedure WIPRcptBeforeEdit(DataSet: TDataset);
    procedure WIPRcptNewRecord(DataSet: TDataset);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure WIPRcptSourceStateChange(Sender: TObject);
    procedure DateManuSpdBtnClick(Sender: TObject);
    procedure EditProdRefChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure WIPRcptSearchSpdBtnClick(Sender: TObject);
    procedure SetDefaultsBtnClick(Sender: TObject);
    procedure WIPRcptBeforePost(DataSet: TDataSet);
    procedure WIPRcptDATEMANUChange(Sender: TField);
    procedure WIPRcptBeforeInsert(DataSet: TDataSet);
    procedure PlusBitBtnClick(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure EditQltyChange(Sender: TObject);
  private
    { private declarations }
    DefaultsSet:boolean;
    ProdRef:string;
    LotNo1:integer;
    LotNo2:integer;
    StockArea:integer;
    DateManu:real;
    Shift:string;
    OldNetWeight:double;
    OldProdRef:string;
  public
    { public declarations }
  end;

var
  WIPRcptForm: TWIPRcptForm;

implementation

uses Main, BRModal, PickDate, BarCode, Utils;

{$R *.DFM}

procedure TWIPRcptForm.CancelBtnClick(Sender: TObject);
begin
  WIPRcpt.Cancel;
end;

procedure TWIPRcptForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TWIPRcptForm.WIPRcptAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  WIPRcpt.Refresh;
{  MainForm.Database.StartTransaction;}
end;

procedure TWIPRcptForm.WIPRcptAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TWIPRcptForm.WIPRcptAfterPost(DataSet: TDataset);
var
  LabelData:string;
begin
  {removed product table update DL030411 as trigger added to WIPRcpt table}
  {check for product reference change}
  {if (OldProdRef<>WIPRcptProdRef.Value) and
    (OldProdRef<>'') then
  begin
    Product.SetKey;
    Product.FieldByName('ProdRef').AsString:=WIPRcptProdRef.Value;
    Product.GotoKey;
    Product.Edit;
    ProductInStock.Value:=ProductInStock.Value+
      WIPRcptNetWeight.Value;
    Product.Post;
    Product.SetKey;
    Product.FieldByName('ProdRef').AsString:=OldProdRef;
    Product.GotoKey;
    Product.Edit;
    ProductInStock.Value:=ProductInStock.Value-
      OldNetWeight;
  end
  else
  begin
    Product.SetKey;
    Product.FieldByName('ProdRef').AsString:=WIPRcptProdRef.Value;
    Product.GotoKey;
    Product.Edit;
    ProductInStock.Value:=ProductInStock.Value+
      WIPRcptNetWeight.Value-OldNetWeight;
    update ACRWHT wip
  end;
  Product.Post;}
  MainForm.Database.Commit;
  {print the bar code}
  BarCodeForm.StartLabel(true); {true for lastlabel}
  BarCodeForm.SendLabelData(0,'','');  {Vrede Textiles + address}
  LabelData:='Rcpt '+ZeroFill(WIPRcptRefNo.Value,6)+
    ' Lot No. '+inttostr(WIPRcptLotNo1.Value)+'/'+
    inttostr(WIPRcptLotNo2.Value);
  BarCodeForm.SendLabelData(1,LabelData,'');
  LabelData:=ShowProdLabelDescr.Text;
  if WIPRcptShift.Value='W' then {eoMonth stock label: DL020397}
    BarCodeForm.SendLabelData(2,'eomWIP',LabelData)
  else {all other labels are normal WIP Rcpt labels: DL020397}
    BarCodeForm.SendLabelData(2,'WIP',LabelData);
  if ShowProdMeasUnit.Text='KGS' then
    LabelData:='Net: '+
      floattostrf(WIPRcptNetWeight.Value,ffFixed,4,1)+' KGS'
  else
    LabelData:='Units: '+
      floattostrf(WIPRcptNetWeight.Value,ffFixed,5,0)+' '+
      ShowProdMeasUnit.Text; {modified DL250297}
  BarCodeForm.SendLabelData(3,LabelData,'');
  LabelData:='Date Manu: '+formatdatetime('dd/mm/yyyy',WIPRcptDateManu.Value);
  BarCodeForm.SendLabelData(4,LabelData,'');
  LabelData:='13'+ZeroFill(WIPRcptRefNo.Value,6); {13 was 03: DL020397}
  BarCodeForm.SendLabelData(6,LabelData,'');
  BarCodeForm.EndLabel;
{  Product.SetKey;
  Product.FieldByName('ProdRef').AsString:=WIPRcptProdRef.Value;
  Product.GotoKey;}
{  Product.Edit;}
{  MainForm.Database.StartTransaction;}
end;

procedure TWIPRcptForm.WIPRcptBeforeCancel(DataSet: TDataset);
begin
  if WIPRcpt.State=dsInsert then
    if MessageDlg('Cancel WIP Receipt being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TWIPRcptForm.WIPRcptBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete WIP receipt?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TWIPRcptForm.WIPRcptBeforeEdit(DataSet: TDataset);
begin
  if WIPRcptDateIssued.Value <> 0 then
  begin
    ShowMessage('Cannot edit as already issued!');
    Abort;
  end;
  MainForm.Database.StartTransaction;
  OldNetWeight:=WIPRcptNetWeight.Value;
  OldProdRef:=WIPRcptProdRef.Value;
end;

procedure TWIPRcptForm.WIPRcptNewRecord(DataSet: TDataset);
begin
  SPWIPRcptNo.ExecProc;
  EditRefNo.ReadOnly:=false;
  WIPRcpt.FieldByName('RefNo').AsInteger:=SPWIPRcptNo.ParamByName('Code').AsInteger;
  EditRefNo.ReadOnly:=true;
  WIPRcptNetWeight.Clear; {Value:=0;}
  EditRcptDate.ReadOnly:=false;
  WIPRcptRcptDate.Value:=date;
  EditRcptDate.ReadOnly:=true;
  OldNetWeight:=0;
  OldProdRef:='';
  EditRcptInitials.ReadOnly:=false;
  WIPRcptRcptInitials.Value:=UserInitials;
  EditRcptInitials.ReadOnly:=true;
  WipRcptDateEnt.Value:=now;
  WipRcptUserEnt.Value:=UserInitials;
  WipRcptDateMod.Value:=WipRcptDateEnt.Value;
  WipRcptUserMod.Value:=UserInitials;
  WipRcptStockArea.Value:=0;
  WipRcptFactoryNo.Value:=1; {default to factory 1(Spinning) DL100697}
  WipRcptQlty.Value:='';
  if DefaultsSet then
  begin
    EditProdRef.ReadOnly:=false;
    EditLotNo1.ReadOnly:=false;
    EditLotNo2.ReadOnly:=false;
    EditStockArea.ReadOnly:=false;
    EditDateManu.ReadOnly:=false;
    EditShift.ReadOnly:=false;
    WIPRcptProdRef.Value:=ProdRef;
    WIPRcptLotNo1.Value:=LotNo1;
    WIPRcptLotNo2.Value:=LotNo2;
    WIPRcptStockArea.Value:=StockArea;
    WIPRcptDateManu.Value:=DateManu;
    WIPRcptShift.Value:=Shift;
    EditProdRef.ReadOnly:=true;
    EditLotNo1.ReadOnly:=true;
    EditLotNo2.ReadOnly:=true;
    EditStockArea.ReadOnly:=true;
    EditDateManu.ReadOnly:=true;
    EditShift.ReadOnly:=true;
  end
  else
    WIPRcptDateManu.Value:=date;
  WIPRcptValueRating.Value:=1; {added DL250297}
  WIPRcptValueRatingDate.Value:=date; {added DL130397}
  if DefaultsSet then
    EditNetWeight.SetFocus
  else
    EditProdRef.SetFocus;
end;

procedure TWIPRcptForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if WIPRcpt.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  WIPRcpt.Close;
  Product.Close;
  WIPRcptForm.Release;
end;

procedure TWIPRcptForm.FormShow(Sender: TObject);
begin
  WIPRcpt.Open;
  Product.Open;
{  MainForm.Database.StartTransaction;}
  WIPRcpt.Refresh;
  Product.Refresh;
  DefaultsSet:=false;
  OldNetWeight:=0;
  OldProdRef:='';
end;

procedure TWIPRcptForm.WIPRcptSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := WIPRcpt.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := WIPRcpt.State = dsBrowse;
  WIPRcptSearchSpdBtn.Enabled:=CloseBitBtn.Enabled;
  if WIPRcpt.State = dsEdit then
  begin
    ModeIndicator.Caption := 'Edit';
    ModeIndicator.Font.Color := clRed;
  end
  else
    if WIPRcpt.State = dsInsert then
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

procedure TWIPRcptForm.DateManuSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=WIPRcptDateManu.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    WIPRcpt.Edit;
    WIPRcptDateManu.Value:=BRDateForm.Date;
  end;
end;

procedure TWIPRcptForm.EditProdRefChange(Sender: TObject);
begin
  if EditProdRef.Value<>'' then
  begin
    ShowProdDescr.Text:=ProductDescr.AsString;
    ShowProdLabelDescr.Text:=ProductLabelDescr.AsString;
    ShowProdMeasUnit.Text:=ProductMeasUnit.AsString;
    ShowProdCategory.Text:=ProductCategory.AsString;
    if (ShowProdCategory.Text='PAK') and (WIPRcpt.State=dsInsert) then {no lot number}
    begin
      WIPRcptLotNo1.Value:=0;
      WIPRcptLotNo2.Value:=0;
    end;
  end
  else
  begin
    ShowProdDescr.Clear;
    ShowProdLabelDescr.Clear;
    ShowProdMeasUnit.Clear;
    ShowProdCategory.Clear;
  end;

end;

procedure TWIPRcptForm.SpeedButton1Click(Sender: TObject);
begin
  if WIPRcpt.State in [dsInsert,dsEdit] then
    ShowMessage('Cannot search whilst in Insert or Edit Mode')
  else
    if PickDlgForm.ShowModalWIPRcpt = mrOk then
    begin
      WIPRcpt.SetKey;
      WIPRcpt.FieldByName('RefNo').AsInteger:=PickDlgForm.WIPRcptRefNo;
      WIPRcpt.GotoKey;
    end;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TWIPRcptForm.WIPRcptSearchSpdBtnClick(Sender: TObject);
var
  RefNumberStr:string;
begin
  if WIPRcpt.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    RefNumberStr:='0';
    if InputQuery('Finished Good Search',
      'Enter ref number',
      RefNumberStr) then
    begin
      if length(RefNumberStr)=8 then {bar code scanned: added DL020397}
        RefNumberStr:=copy(RefNumberStr,3,6); {added DL020397}
      WIPRcpt.SetKey;
      WIPRcpt.FieldByName('RefNo').AsInteger:=strtoint(RefNumberStr);
      if not WIPRcpt.GotoKey then
        ShowMessage('WIP Receipt not found')
      else
        WIPRcpt.GotoKey;
    end;
  end;
end;

procedure TWIPRcptForm.SetDefaultsBtnClick(Sender: TObject);
begin
  if not DefaultsSet then
  begin
    if (WIPRcptRefNo.Value=0) or
      (WIPRcptProdRef.Value='') or
      (WIPRcptDateManu.Value=0) or
      (WIPRcptStockArea.Value=0) or
      (WIPRcptShift.Value='') then
{      (WIPRcptRcptInitials.Value='') then}
    begin
      ShowMessage('Cannot "Set defaults" until all defaults set');
      Abort;
    end;
    ProdRef:=WIPRcptProdRef.AsString;
    LotNo1:=WIPRcptLotNo1.AsInteger;
    LotNo2:=WIPRcptLotNo2.AsInteger;
    StockArea:=WIPRcptStockArea.AsInteger;
    DateManu:=WIPRcptDateManu.AsFloat;
    Shift:=WIPRcptShift.AsString;
    EditProdRef.TabStop:=false;
    EditLotNo1.TabStop:=false;
    EditLotNo2.TabStop:=false;
    EditStockArea.TabStop:=false;
    EditDateManu.TabStop:=false;
    EditShift.TabStop:=false;
    EditProdRef.Color:=clSilver;
    EditLotNo1.Color:=clSilver;
    EditLotNo2.Color:=clSilver;
    EditStockArea.Color:=clSilver;
    EditDateManu.Color:=clSilver;
    EditShift.Color:=clSilver;
    EditProdRef.ReadOnly:=true;
    EditLotNo1.ReadOnly:=true;
    EditLotNo2.ReadOnly:=true;
    EditStockArea.ReadOnly:=true;
    EditDateManu.ReadOnly:=true;
    EditShift.ReadOnly:=true;
    DefaultsSet:=true;
    SetDefaultsBtn.Caption:='Clear Defaults'; {saves an extra btn on the form}
    EditNetWeight.SetFocus;
  end
  else
  begin
    ProdRef:='';
    LotNo1:=0;
    LotNo2:=0;
    StockArea:=0;
    DateManu:=0;
    Shift:='';
    EditProdRef.TabStop:=true;
    EditLotNo1.TabStop:=true;
    EditLotNo2.TabStop:=true;
    EditStockArea.TabStop:=true;
    EditDateManu.TabStop:=true;
    EditShift.TabStop:=true;
    EditProdRef.Color:=clWindow;
    EditLotNo1.Color:=clWindow;
    EditLotNo2.Color:=clWindow;
    EditStockArea.Color:=clWindow;
    EditDateManu.Color:=clWindow;
    EditShift.Color:=clWindow;
    EditProdRef.ReadOnly:=false;
    EditLotNo1.ReadOnly:=false;
    EditLotNo2.ReadOnly:=false;
    EditStockArea.ReadOnly:=false;
    EditDateManu.ReadOnly:=false;
    EditShift.ReadOnly:=false;
    DefaultsSet:=false;
    SetDefaultsBtn.Caption:='Set Defaults';
  end;
end;

procedure TWIPRcptForm.WIPRcptBeforePost(DataSet: TDataSet);
begin
  if (WIPRcptStockArea.AsInteger<9000) or (WIPRcptStockArea.AsInteger>9999) then
    raise Exception.Create('Stock Area must be between 9000 and 9999');
  WIPRcptValueRatingDate.Value:=WIPRcptDateManu.Value; {added DL160397}
  if WipRcpt.State =dsEdit then
  begin
    WipRcptDateMod.Value:=now;
    WipRcptUserMod.Value:=UserInitials;
  end;
end;

procedure TWIPRcptForm.WIPRcptDATEMANUChange(Sender: TField);
begin
  if (WIPRcptDATEMANU.Value<NoEntryBeforeDate) then
  begin
    WIPRcptDATEMANU.Value:=date;
    raise exception.create('Date cannot be less than '+
      FormatDateTime('dd-mmm-yyyy',NoEntryBeforeDate));
  end;
  if (WIPRcptDATEMANU.Value>date) then
  begin
    WIPRcptDATEMANU.Value:=date;
    raise exception.create('Date cannot be greater than today');
  end;
end;

procedure TWIPRcptForm.WIPRcptBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWIPRcptForm.PlusBitBtnClick(Sender: TObject);
begin
  WIPRcpt.Insert;
end;

procedure TWIPRcptForm.PostBtnClick(Sender: TObject);
begin
  WIPRcpt.Post;
end;

procedure TWIPRcptForm.EditQltyChange(Sender: TObject);
begin
  if UserInitials<>'SYS' then
    raise Exception.Create('Only System Administrator can modify this');
end;

end.
