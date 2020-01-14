unit Delin;
{Modifications: DL020397: Modified bar code length from 13 to 12}
{so that even for Interleaved 3 of 5 to work}
{DL020397: added ValueRating to DelPallet and DelBCB tables}
                                             
interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DBCtrls, DBTables, DB, ExtCtrls, Tabs,
  DBLookup, Buttons, Grids, DBGrids, ComCtrls;

type
  TDelInForm = class(TForm)
    DelHead: TTable;
    DelHeadSource: TDataSource;
    DelHeadDELNO: TIntegerField;
    DelHeadSUPREF: TStringField;
    DelHeadDELNOTENO: TStringField;
    DelHeadAGENT: TStringField;
    DelHeadSUPORDNO: TStringField;
    DelHeadCONTREF: TStringField;
    DelHeadDELNOTEDATE: TDateTimeField;
    DelHeadPALLETSRCVD: TSmallintField;
    DelHeadQTYRCVD: TFloatField;
    DelHeadDELDATE: TDateTimeField;
    DelHeadRCVDBY: TStringField;
    DelHeadNARRATIVE: TStringField;
    Supplier: TTable;
    SupplierSource: TDataSource;
    Agent: TTable;
    AgentSource: TDataSource;
    PostBtn: TButton;
    CancelBtn: TButton;
    CloseBitBtn: TBitBtn;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    SupplierSUPREF: TStringField;
    AgentAGENTREF: TStringField;
    SumQuery: TQuery;
    ModeIndicator: TLabel;
    DelPalletSource: TDataSource;
    ActiveSource: TDataSource;
    DelHeadEXPDELDATE: TDateTimeField;
    DelBCB: TTable;
    DelBCBSource: TDataSource;
    DelBCBDELNO: TIntegerField;
    DelBCBPALLETNO: TSmallintField;
    DelBCBBCBNO: TSmallintField;
    DelBCBQTY: TFloatField;
    DelPallet: TTable;
    DelPalletDELNO: TIntegerField;
    DelPalletPALLETNO: TSmallintField;
    DelPalletPRODREF: TStringField;
    DelPalletBAGCARTBALEDEL: TSmallintField;
    DelPalletQTYRCVD: TFloatField;
    DelPalletMERGENO: TStringField;
    ProductQuery: TQuery;
    ProductQueryFIXEDWEIGHT: TStringField;
    ProductQueryMEASUNIT: TStringField;
    ProductQueryRCVUNIT: TStringField;
    ProductQueryLABELDESCR: TStringField;
    DelPalletQTYISSUED: TFloatField;
    APOrdDetUpdate: TTable;
    APOrdDetUpdateEXPDELDATE: TDateTimeField;
    APOrdDetUpdatePRODREF: TStringField;
    DelPalletBCBISSUED: TFloatField;
    DelBCBBCBISSUED: TStringField;
    DelHeadCARTONSRCVD: TSmallintField;
    DelHeadPRODREF: TStringField;
    APOrdDetUpdateORDLINECOMPLETE: TStringField;
    Timer1: TTimer;
    DelBCBVALUERATING: TFloatField;
    DelPalletVALUERATING: TFloatField;
    DelBCBVALUERATINGDATE: TDateTimeField;
    DelPalletVALUERATINGDATE: TDateTimeField;
    DelBCBSTOCKAREA: TIntegerField;
    DelHeadVTORDNO: TIntegerField;
    APOrdDetUpdateVTORDNO: TIntegerField;
    DelInPageControl: TPageControl;
    HdrTabSheet: TTabSheet;
    PalletTabSheet: TTabSheet;
    Label1: TLabel;
    EditDelNo: TDBEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    EditDelDate: TDBEdit;
    DelDateSpdBtn: TSpeedButton;
    ViewByOrderSpdBtn: TSpeedButton;
    ViewBySupplierSpdBtn: TSpeedButton;
    Label7: TLabel;
    EditAgent: TDBLookupCombo;
    EditDelNoteDate: TDBEdit;
    DelNoteDateSpdBtn: TSpeedButton;
    Label6: TLabel;
    Label4: TLabel;
    EditDelNoteNo: TDBEdit;
    EditSupRef: TDBLookupCombo;
    Label19: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    EditSupOrdNo: TDBEdit;
    Label10: TLabel;
    EditVTOrdNo: TDBEdit;
    Label29: TLabel;
    EditExpDelDate: TDBEdit;
    Label11: TLabel;
    EditContRef: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    CartBagLabel: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    EditPalletsRcvd: TDBEdit;
    EditCartonsRcvd: TDBEdit;
    EditQtyRcvd: TDBEdit;
    EditProdRef: TDBEdit;
    ShowBatchQty: TEdit;
    Label20: TLabel;
    EditOrdLineComplete: TCheckBox;
    EditInitials: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    EditNarrative: TDBEdit;
    BarCodeSearchSpdBtn: TSpeedButton;
    Label18: TLabel;
    ShowSupRef: TDBEdit;
    Label21: TLabel;
    ShowDelNote: TDBEdit;
    Label22: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label27: TLabel;
    Label26: TLabel;
    EditFixedWeight: TCheckBox;
    ShowQty: TDBEdit;
    EditQty: TEdit;
    EditBCB: TEdit;
    ShowBCB: TDBEdit;
    ShowPallets: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label23: TLabel;
    Label28: TLabel;
    PalletGrid: TDBGrid;
    ChangeBCBBtn: TButton;
    ChangeMergeNo: TButton;
    GenPalBarCodeBtn: TButton;
    GenBCBs: TButton;
    GenBoxBarCodeBtn: TButton;
    BoxGrid: TDBGrid;
    DelBCBQTYISSUED: TFloatField;
    SPDelInNo: TStoredProc;
    DelHeadDATEENT: TDateTimeField;
    DelHeadUSERENT: TStringField;
    DelHeadDATEMOD: TDateTimeField;
    DelHeadUSERMOD: TStringField;
    Label30: TLabel;
    Label31: TLabel;
    ShowDateEnt: TDBEdit;
    ShowUserEnt: TDBEdit;
    ShowDateMod: TDBEdit;
    ShowUserMod: TDBEdit;
    DelBCBFACTORYNO: TIntegerField;
    PrintSpdBtn: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure DelHeadNewRecord(DataSet: TDataset);
    procedure DelHeadBeforeInsert(DataSet: TDataset);
    procedure DelHeadAfterPost(DataSet: TDataset);
    procedure DelHeadBeforeCancel(DataSet: TDataset);
    procedure DelHeadAfterCancel(DataSet: TDataset);
    procedure DelDateSpdBtnClick(Sender: TObject);
    procedure DelNoteDateSpdBtnClick(Sender: TObject);
    procedure SupOrdSpdBtnClick(Sender: TObject);
    procedure DelHeadSourceStateChange(Sender: TObject);
    procedure EditDelDateExit(Sender: TObject);
    procedure EditSupRefChange(Sender: TObject);
    procedure ViewBySupplierSpdBtnClick(Sender: TObject);
    procedure ViewByOrderSpdBtnClick(Sender: TObject);
    procedure DelHeadSourceDataChange(Sender: TObject; Field: TField);
    procedure DelPalletAfterPost(DataSet: TDataset);
    procedure ChangeBCBBtnClick(Sender: TObject);
    procedure ChangeMergeNoClick(Sender: TObject);
    procedure EditVTOrdNoChange(Sender: TObject);
    procedure GenPalBarCodeBtnClick(Sender: TObject);
    procedure BoxGridEnter(Sender: TObject);
    procedure EditExpDelDateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GenBCBsClick(Sender: TObject);
    procedure PalletGridEnter(Sender: TObject);
    procedure DelHeadBeforePost(DataSet: TDataset);
    procedure GenBoxBarCodeBtnClick(Sender: TObject);
    procedure BarCodeSearchSpdBtnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DelHeadAGENTValidate(Sender: TField);
    procedure DelHeadRCVDBYValidate(Sender: TField);
    procedure DelPalletBeforeEdit(DataSet: TDataset);
    procedure DelHeadBeforeEdit(DataSet: TDataset);
    procedure Timer1Timer(Sender: TObject);
    procedure DelBCBBeforeEdit(DataSet: TDataset);
    procedure DelHeadDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DelHeadDELDATEChange(Sender: TField);
    procedure DelInPageControlChange(Sender: TObject);
    procedure BoxGridDblClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { Private declarations }
    CancelInProgress:boolean;
    PostInProgress:boolean;
    DeletePallets:boolean;
    ProductUpdateInProgress:boolean;
    OldQtyRcvd:double;
    Closing:boolean;
    BarCodePrinterReady:boolean; {added DL 140596}
    InTxn:boolean;
    BCBTotal:integer;
    QtyTotal:double;
    NoPallet:boolean; {added DL280897}    
    {OldProdRef:string;}
    {ProdRef:string;}
    procedure UpdatePalletTotals;
  public
    { Public declarations }
    procedure Enter;
  end;

var
  DelInForm: TDelInForm;

implementation

uses VBMain, PickDate, BrModal, VBUtils, VBBarCde;

{$R *.DFM}

procedure TDelInForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DelHead.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post this delivery before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  Supplier.Close;
  Agent.Close;
  APOrdDetUpdate.Close;
  DelPallet.Close;
  DelBCB.Close;
  DelHead.Close;
  DelInForm.Release;
end;

procedure TDelInForm.Enter;
begin
  CancelInProgress:=false;
  PostInProgress:=false;
  DeletePallets:=false;
  ProductUpdateInProgress:=false;
  InTxn:=false;
  Closing:=false;
  NoPallet:=false; {added DL280897}
{  MainForm.Database.StartTransaction;}
  ShowModal;
end;

procedure TDelInForm.CloseBitBtnClick(Sender: TObject);
begin
  Closing:=true;
  Close;
end;

procedure TDelInForm.PostBtnClick(Sender: TObject);
var
  CannotPost:boolean;
begin
  {can't save if pallet details exist without product references}
  CannotPost:=false;
  try
    DelPallet.First;
    if not (DelPallet.EOF=DelPallet.BOF) then
    {there are no records in DelPallet -> post allowed}
      while not DelPallet.EOF do
      begin
        if DelPalletProdRef.Value='' then
          CannotPost:=true;
        DelPallet.Next;
      end;
  finally
    {exceptions must be handled here by programmer}
    {finally is always executed}
    if CannotPost then
      raise Exception.Create('Cannot post if no product reference on pallet details')
    else
    begin
      PostInProgress:=true;
      DelHead.Post;
    end;
  end;
end;

procedure TDelInForm.CancelBtnClick(Sender: TObject);
begin
  DelHead.Cancel;
end;

procedure TDelInForm.DelHeadNewRecord(DataSet: TDataset);
begin
  {find next delivery number}
  SPDelInNo.ExecProc;
  DelHead.FieldByName('DelNo').AsInteger:=SPDelInNo.ParamByName('Code').AsInteger;
  {initialise variables}
  DelHeadDelDate.Value:=date;
  DelHeadDelNoteDate.Value:=date;
  EditOrdLineComplete.Checked:=false;
  {reset totals to zero}
  DelHeadPalletsRcvd.Value:=0;
  DelHeadCartonsRcvd.Value:=0;
  DelHeadQtyRcvd.Value:=0;
  DelHeadAgent.Value:='NONE';
  EditInitials.ReadOnly:=false;
  DelHeadRcvdBy.Value:=UserInitials;
  EditInitials.ReadOnly:=true;
  DelHeadDateEnt.Value:=now;
  DelHeadUserEnt.Value:=UserInitials;
  DelHeadDateMod.Value:=DelHeadDateEnt.Value;
  DelHeadUserMod.Value:=UserInitials;
end;

procedure TDelInForm.DelHeadBeforeInsert(DataSet: TDataset);
begin
  if DelHead.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('A delivery is being processed. Post changes before inserting new order?',
      mtInformation, mbOKCancel, 0) = mrOK then
        DelHead.Post
    else
      Abort;
  end;
  if InTxn then
    raise Exception.Create('Post before inserting')
  else
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TDelInForm.DelHeadAfterPost(DataSet: TDataset);
begin
  if NoPallet then {added DL280897}
    Exit;
  MainForm.Database.Commit;
  InTxn:=false;
  PostInProgress:=false;
  DelHeadPalletsRcvd.ReadOnly:=false;
  DelHeadCartonsRcvd.ReadOnly:=false;
  DelHeadQtyRcvd.ReadOnly:=false;
  DelHeadDelDate.ReadOnly:=false;
  DelHeadSupRef.ReadOnly:=false;
  EditPalletsRcvd.Color:=clWindow;
  EditCartonsRcvd.Color:=clWindow;
  EditQtyRcvd.Color:=clWindow;
  EditDelDate.Color:=clWindow;
  EditSupRef.Color:=clWindow;
end;

procedure TDelInForm.DelHeadBeforeCancel(DataSet: TDataset);
begin
  CancelInProgress:=true;
  if (DelHead.State=dsInsert) {and not (APOrdDet.BOF and APOrdDet.EOF)} then
    if MessageDlg('Cancel delivery being inserted and delete all line items?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TDelInForm.DelHeadAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  InTxn:=false;
  DelHead.Refresh;
  DelPallet.Refresh;
  DelBCB.Refresh;
  {APOrdDet.Refresh;}
{  MainForm.Database.StartTransaction;}
  {DispCurrency.Text:='';}
  CancelInProgress:=false;
  DelHeadPalletsRcvd.ReadOnly:=false;
  DelHeadCartonsRcvd.ReadOnly:=false;
  DelHeadQtyRcvd.ReadOnly:=false;
  DelHeadDelDate.ReadOnly:=false;
  DelHeadSupRef.ReadOnly:=false;
  EditPalletsRcvd.Color:=clWindow;
  EditCartonsRcvd.Color:=clWindow;
  EditQtyRcvd.Color:=clWindow;
  EditDelDate.Color:=clWindow;
  EditSupRef.Color:=clWindow;
  {added change to first page after cancel: DL160297}
  DelInPageControl.ActivePage:=HdrTabSheet;
  ActiveSource.DataSet:=DelHead;
  DBNavigator1.VisibleButtons:=[nbFirst,nbPrior,
    nbNext,nbLast,nbInsert,{nbDelete,}nbEdit];
end;

procedure TDelInForm.DelDateSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=DelHeadDelDate.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    DelHead.Edit;
    DelHeadDelDate.Value:=BRDateForm.Date;
  end;
end;

procedure TDelInForm.DelNoteDateSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=DelHeadDelNoteDate.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    DelHead.Edit;
    DelHeadDelNoteDate.Value:=BRDateForm.Date;
  end;
end;

procedure TDelInForm.SupOrdSpdBtnClick(Sender: TObject);
begin
  if DelHeadSupRef.Value = '' then
    raise Exception.Create('Supplier Reference must be entered')
  else
  begin
  end;
end;

procedure TDelInForm.EditSupRefChange(Sender: TObject);
begin
  if (EditSupRef.DisplayValue <> '') and
    (DelHeadSupRef.Value = '') and
    (DelHead.State in [dsInsert,dsEdit]) then
    {get orders for this supplier}
    if not CancelInProgress then
    begin
      if PickDlgForm.ShowModalOrds(EditSupRef.DisplayValue) = mrOk then
      begin
        DelHead.Edit;
        DelHeadSupRef.Value:=EditSupRef.DisplayValue;
        DelHeadVTOrdNo.Value := PickDlgForm.VTOrdNo;
        DelHeadExpDelDate.Value := PickDlgForm.ExpDelDate;
        DelHeadProdRef.ReadOnly:=false;
        DelHeadProdRef.Value := PickDlgForm.OrdProdRef;
        DelHeadProdRef.ReadOnly:=true
      end;
      {position cursor on note number field}
      DelInForm.ActiveControl:=EditDelNoteNo;
    end;
  {else
    check that supref and ordno match}
  {else
  check that supref and ordno match (before update)}
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TDelInForm.ViewBySupplierSpdBtnClick(Sender: TObject);
begin
  if (EditSupRef.DisplayValue <> '') and
    (DelHead.State in [dsInsert,dsEdit]) then
  begin
    {get orders for this supplier}
    if not CancelInProgress then
    begin
      if PickDlgForm.ShowModalOrds(EditSupRef.DisplayValue) = mrOk then
      begin
        DelHead.Edit;
        DelHeadVTOrdNo.Value := PickDlgForm.VTOrdNo;
        DelHeadExpDelDate.Value := PickDlgForm.ExpDelDate;
        DelHeadProdRef.ReadOnly:=false;
        DelHeadProdRef.Value := PickDlgForm.OrdProdRef;
        DelHeadProdRef.ReadOnly:=true;
      end;
      {position cursor on note number field}
      DelInForm.ActiveControl:=EditDelNoteNo;
      Screen.Cursor := crDefault; { Always restore to normal }
    end
  end
  else
  begin
    Screen.Cursor := crDefault; { Always restore to normal }  
    raise Exception.Create('First enter Supplier Reference on new/edit');
  end;
  {else
    check that supref and ordno match}
  {else
  check that supref and ordno match (before update)}
end;

procedure TDelInForm.ViewByOrderSpdBtnClick(Sender: TObject);
begin
  if (EditSupRef.DisplayValue = '') and
    (DelHead.State in [dsInsert,dsEdit]) then
  begin
    {get all outstanding orders}
    if not CancelInProgress then
    begin
      if PickDlgForm.ShowModalOutOrds('O') = mrOk then {outstanding only}
      begin
        DelHead.Edit;
        DelHeadSupRef.Value:=PickDlgForm.OutSupRef;
        DelHeadVTOrdNo.Value:=PickDlgForm.OutVTOrdNo;
        DelHeadExpDelDate.Value:=PickDlgForm.OutExpDelDate;
        DelHeadProdRef.ReadOnly:=false;
        DelHeadProdRef.Value:=PickDlgForm.OutProdRef;
        DelHeadProdRef.ReadOnly:=true;
      end;
      DelInForm.ActiveControl:=EditContRef;
      Screen.Cursor := crDefault; { Always restore to normal }
    end;
  end
  else
  begin
    Screen.Cursor := crDefault; { Always restore to normal }
    raise Exception.Create('Supplier Reference must be unknown on new/edit');
  end;
end;

procedure TDelInForm.FormShow(Sender: TObject);
begin
  Supplier.Open;
  Agent.Open;
  APOrdDetUpdate.Open;
  DelHead.Open;
  DelPallet.Open;
  DelBCB.Open;
  Supplier.Refresh;
  Agent.Refresh;
  DelInPageControl.ActivePage:=HdrTabSheet;
  {DL160297: added the following so that the completed flag is set correctly on the first record}
  {see DelHeadSourceDataChange}
  APOrdDetUpdate.SetKey;
  APOrdDetUpdate.FieldByName('VTOrdNo').AsInteger:=DelHeadVTOrdNo.Value;
  APOrdDetUpdate.FieldByName('ExpDelDate').AsFloat:=DelHeadExpDelDate.Value;
  APOrdDetUpdate.FieldByName('ProdRef').AsString:=DelPalletProdRef.Value;
  if APOrdDetUpdate.GotoKey then
  begin
    EditOrdLineComplete.Checked:=APOrdDetUpdateOrdLineComplete.Value='Y';
  end;
  BCBTotal:=0;
  QtyTotal:=0;
end;

procedure TDelInForm.DelHeadSourceStateChange(Sender: TObject);
begin
  if NoPallet then {added DL280897}
    Exit;
  if Closing then
    Exit;         {else takes ages to close}
  PostBtn.Enabled := DelHead.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := DelHead.State = dsBrowse;
  if DelHead.State in [dsEdit, dsInsert] then
  begin
    ModeIndicator.Caption := 'Edit, Insert';
    ModeIndicator.Font.Color := clRed
  end
  else
  begin
    ModeIndicator.Caption := 'Browse';
    ModeIndicator.Font.Color := clBlue;
  end;
end;

procedure TDelInForm.EditDelDateExit(Sender: TObject);
begin
  if DelHeadDelDate.Value=0 then
    raise Exception.Create('Delivery Date must be entered.  Use insert to add a new record')
  else
    if DelHeadDelNoteDate.Value=0 then
      DelHeadDelNoteDate.Value:=DelHeadDelDate.Value;
end;

procedure TDelInForm.EditVTOrdNoChange(Sender: TObject);
var
  RealVal:real; {used otherwise double precision subtraction produces very}
  {small number: eg: 4.333E-15}
begin
  if (DelHeadVTOrdNo.Value<>0) and (DelHeadExpDelDate.Value <> 0) then
  begin
    SumQuery.Active:=false;
    SumQuery.Params[0].AsInteger:=DelHeadVTOrdNo.Value;
    SumQuery.Params[1].AsDate:=DelHeadExpDelDate.Value;
    SumQuery.Active:=true;
    { SQL servers return Null for some aggregates if no items are present }
    with SumQuery.Fields[0] do
      if IsNull then
        ShowBatchQty.Text := '-1'
      else
      begin
        RealVal:=DLRound(AsFloat,1000);
        ShowBatchQty.Text:=floattostrf(RealVal,ffFixed,8,2);
      end;
    SumQuery.Active:=false;
  end
  else
    ShowBatchQty.Text := '0';
{  Query1.SQL.Clear;
  Query1.SQL.Add('select sum(qty-qtyrcvd)');
  Query1.SQL.Add('from aporddet');
  Query1.SQL.Add('where vtordno:=:vtordno');
  Query1.SQL.Add('and expdeldate:=:expdeldate');
  Query1.Params[0]:=DelHeadVTOrdNo.Value;
  Query1.Params[1]:=DelHeadExpDelDate.Value;
  Query1.ExecSQL;}
end;

procedure TDelInForm.EditExpDelDateChange(Sender: TObject);
begin
  if (DelHeadVTOrdNo.Value<>0) and (DelHeadExpDelDate.Value <> 0) then
  begin
    SumQuery.Active:=false;
    SumQuery.Params[0].AsInteger:=DelHeadVTOrdNo.Value;
    SumQuery.Params[1].AsDate:=DelHeadExpDelDate.Value;
    SumQuery.Active:=true;
    { SQL servers return Null for some aggregates if no items are present }
    with SumQuery.Fields[0] do
      if IsNull then
        ShowBatchQty.Text := '-1'
      else
        ShowBatchQty.Text:=floattostrf(AsFloat,ffFixed,8,2);
    SumQuery.Active:=false;
  end
  else
    ShowBatchQty.Text := '0';
end;

procedure TDelInForm.DelHeadSourceDataChange(Sender: TObject;
  Field: TField);
begin
  if NoPallet then {added DL280897}
    Exit;
  if (not PostInProgress) and {otherwise resets before updates!}
    (DelHeadVTOrdNo.Value<>0) and
    (DelHeadExpDelDate.Value<>0) then
  begin
    APOrdDetUpdate.SetKey;
    APOrdDetUpdate.FieldByName('VTOrdNo').AsInteger:=DelHeadVTOrdNo.Value;
    APOrdDetUpdate.FieldByName('ExpDelDate').AsFloat:=DelHeadExpDelDate.Value;
    APOrdDetUpdate.FieldByName('ProdRef').AsString:=DelPalletProdRef.Value;
    if APOrdDetUpdate.GotoKey then
    begin
      EditOrdLineComplete.Checked:=APOrdDetUpdateOrdLineComplete.Value='Y';
    end;
  end;
end;

procedure TDelInForm.UpdatePalletTotals;
var
{   TempBCBTotal:integer;
   TempQtyTotal:double;}
   Bookmark:TBookmark;
begin
  if DeletePallets or ProductUpdateInProgress then
    Exit;
  BookMark:=DelPallet.GetBookmark;
  try
    DelPallet.DisableControls;
    DelPallet.First;
    BCBTotal:=0;
    QtyTotal:=0;
    while not DelPallet.EOF do
    begin
      BCBTotal:=BCBTotal+DelPalletBagCartBaleDel.Value;
      {qtyrcvd is per bag or box or carton or bale}
      QtyTotal:=QtyTotal+DelPalletQtyRcvd.Value{*DelPalletBagCartBaleDel.Value)};
      DelPallet.Next;
    end;
    {EditAcc_FreightExit(nil);}
    EditBCB.Text:=inttostr(BCBTotal);
    EditQty.Text:=floattostr(QtyTotal);
  finally
    DelPallet.GotoBookmark(Bookmark);
    DelPallet.EnableControls;
    DelPallet.FreeBookmark(Bookmark);
  end;
end;

procedure TDelInForm.ChangeBCBBtnClick(Sender: TObject);
var
  NewBCBStr:string;
  NewBCB:integer;
  DelHeadEdit:boolean;
  Bookmark:TBookmark;
begin
  ProductUpdateInProgress:=true;
  DelHeadEdit:=false;
  if InputQuery('Units per Pallet Adjustment',
    'Enter bags/cartons/boxes/bales per pallet',
    NewBCBStr) then
  begin
    NewBCB:=strtoint(NewBCBStr); {+ do error check xx}
    BookMark:=DelPallet.GetBookmark; {placeholder for current (original) record}
    DelPallet.DisableControls;
    try
      DelPallet.First;
      while not DelPallet.EOF do
      begin
        DelHeadEdit:=true;
        DelPallet.Edit; {for current record}
        DelPalletBagCartBaleDel.Value:=NewBCB;
        DelPallet.Post; {current record}
        DelPallet.Next;
      end;
    finally
      DelPallet.GotoBookmark(Bookmark);
      DelPallet.EnableControls;
      DelPallet.FreeBookmark(Bookmark);
      DelPallet.Edit; {original record}
    end;
    if DelHeadEdit then
      DelHead.Edit;
    ProductUpdateInProgress:=false;
    UpdatePalletTotals;
  end;
end;

procedure TDelInForm.DelPalletAfterPost(DataSet: TDataset);
begin
  UpdatePalletTotals;
end;

procedure TDelInForm.ChangeMergeNoClick(Sender: TObject);
var
  NewMergeStr:string;
  DelHeadEdit:boolean;
  Bookmark:TBookmark;
begin
  ProductUpdateInProgress:=true;
  DelHeadEdit:=false;
  if InputQuery('Merge Number Adjustment',
    'Enter merge number',
    NewMergeStr) then
  begin
    BookMark:=DelPallet.GetBookmark; {placeholder for current (original) record}
    DelPallet.DisableControls;
    try
      DelPallet.First;
      while not DelPallet.EOF do
      begin
        DelHeadEdit:=true;
        DelPallet.Edit; {for current record}
        DelPalletMergeNo.Value:=NewMergeStr;
        DelPallet.Post; {current record}
        DelPallet.Next;
      end;
    finally
      DelPallet.GotoBookmark(Bookmark);
      DelPallet.EnableControls;
      DelPallet.FreeBookmark(Bookmark);
      DelPallet.Edit; {original record}
    end;
    if DelHeadEdit then
      DelHead.Edit;
    ProductUpdateInProgress:=false;
  end;
end;

procedure TDelInForm.GenPalBarCodeBtnClick(Sender: TObject);
{var
  ix:smallint;
  LabelData:string;
  MeasUnit:string;
  LabelDescr:string;}
begin
{  if MessageDlg('Print Pallet Labels?',
    mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    Timer1.Enabled:=true;
    DelPallet.First;
    for ix:=1 to DelHeadPalletsRcvd.Value do
    begin
      if ix=DelHeadPalletsRcvd.Value then
        BarCodeForm.StartLabel(true)
      else
        BarCodeForm.StartLabel(false);

      ProductQuery.Active:=false;
      ProductQuery.Params[0].AsString:=DelPalletProdRef.Value;
      ProductQuery.Active:=true;
      MeasUnit:=ProductQuery.Fields[1].AsString;
      LabelDescr:=ProductQuery.Fields[3].AsString;
      ProductQuery.Active:=false;

      BarCodeForm.SendLabelData(0,'','');
      LabelData:='Pallet '+DelPalletDelNo.AsString+'/'+ZeroFill(ix,3);
      BarCodeForm.SendLabelData(1,LabelData,'');
      BarCodeForm.SendLabelData(2,DelHeadSupRef.Value,LabelDescr);
      LabelData:='Qty: '+floattostrf(DelPalletQtyRcvd.Value,ffFixed,5,2)+
          ' '+MeasUnit;
      BarCodeForm.SendLabelData(3,LabelData,'');
      LabelData:='Date Rcvd: '+formatdatetime('dd/mm/yyyy',DelHeadDelDate.Value);
      BarCodeForm.SendLabelData(4,LabelData,'');
      LabelData:='11'+ZeroFill(DelHeadDelNo.Value,4)+
        ZeroFill(ix,3)+'000';
      BarCodeForm.SendLabelData(6,LabelData,'');
      BarCodeForm.EndLabel;
      BarCodePrinterReady:=false;
      while not BarCodePrinterReady do
        Application.ProcessMessages;
      DelPallet.Next;
    end;
    Timer1.Enabled:=false;
  end;}
end;

procedure TDelInForm.BoxGridEnter(Sender: TObject);
begin
  ActiveSource.DataSet := DelBCB;
{  BrowseProductSpeedBtn.Enabled:=true;}
end;

procedure TDelInForm.PalletGridEnter(Sender: TObject);
begin
  ActiveSource.DataSet := DelPallet;
  PalletGrid.Options := PalletGrid.Options + [dgAlwaysShowSelection];
  {BCBGrid.Options := BCBGrid.Options - [dgAlwaysShowSelection];}
end;

procedure TDelInForm.GenBCBsClick(Sender: TObject);
var
  ix:integer;
  CountTo:integer; {added DL010697 to allow fixed weight items to be entered}
  {BookMark:TBookMark;}
begin
  if (DelHeadPalletsRcvd.Value<>0) and
    (DelHeadCartonsRcvd.Value<>0) and
    (DelHeadQtyRcvd.Value<>0) and
    (DelHead.State in [dsInsert,dsEdit]) and
    {(not EditFixedWeight.Checked) and}
    (DelPallet.FindKey([DelHeadDelNo.Value])) and
    (not (DelBCB.FindKey([DelHeadDelNo.Value]))) then
  begin
    {BookMark:=DelPallet.GetBookmark; {placeholder for current (original) record}
    DelPallet.DisableControls;
    DelBCB.DisableControls;
    try
      DelPallet.First;
      while not DelPallet.EOF do
      begin
        if EditFixedWeight.Checked then
          CountTo:=1
        else
          CountTo:=DelPalletBagCartBaleDel.Value;
        for ix:= 1 to CountTo do
        begin
          with DelBCB do
          begin
            Insert; {DelPallet.Insert a new record}
            FieldByName('DelNo').AsInteger:=DelHeadDelNo.Value;
            FieldByName('PalletNo').AsInteger:=DelPalletPalletNo.Value;
            FieldByName('BCBNo').AsInteger:=ix;
            FieldByName('QtyIssued').ReadOnly:=false; {added DL010697}
            FieldByName('BCBIssued').ReadOnly:=false;
            FieldByName('BCBIssued').AsString:='N';
            FieldByName('BCBIssued').ReadOnly:=true;
            FieldByName('FactoryNo').ReadOnly:=false; {added DL100697}
            FieldByName('FactoryNo').AsInteger:=2; {factory 2}
            FieldByName('FactoryNo').ReadOnly:=true;
            FieldByName('StockArea').ReadOnly:=false; {added DL100697}
            FieldByName('StockArea').AsInteger:=0;
            FieldByName('StockArea').ReadOnly:=true;
            if EditFixedWeight.Checked then
            begin
              FieldByName('Qty').AsFloat:=DelPalletQtyRcvd.AsFloat;
              FieldByName('QtyIssued').AsFloat:=DelPalletQtyIssued.Value;
              if DelPalletQtyRcvd.Value=DelPalletQtyIssued.Value then
              begin
                FieldByName('BCBIssued').ReadOnly:=false;
                FieldByName('BCBIssued').AsString:='Y';
                FieldByName('BCBIssued').ReadOnly:=true;
              end;
            end
            else
            begin
              if ix=1 then
                FieldByName('Qty').AsFloat:=DelPalletQtyRcvd.AsFloat  {added DL120697}
              else
                FieldByName('Qty').AsFloat:=0;
              FieldByName('QtyIssued').AsInteger:=0;
            end;
            FieldByName('QtyIssued').ReadOnly:=true;
            FieldByName('ValueRating').AsFloat:=1; {added DL020397}
            FieldByName('ValueRatingDate').Value:=DelHeadDelDate.Value; {added DL100397}
            Post;
          end;
        end;
        DelPallet.Next;
      end;
      {DelHeadEdit:=true;}
    finally
      {DelBCB.GotoBookmark(Bookmark);}
      DelBCB.EnableControls;
      DelPallet.EnableControls;
      {DelBCB.FreeBookmark(Bookmark);}
      DelBCB.Edit; {original record}
    end;
    DelPallet.First; {added DL280897}
  end
  else
    ShowMessage('Must be in insert or edit mode with no BCB''s in existence');
end;

procedure TDelInForm.DelHeadBeforePost(DataSet: TDataset);
var
  TempQtyTotal:double;
  TempQtyTotal1:double;
  ErrorMsg:string;
begin
  if NoPallet then {added DL280897}
    Exit; {added DL280897}
  TempQtyTotal1:=DelHeadQtyRcvd.AsFloat;
  {check batch totals}
  if not DelPallet.FindKey([DelHeadDelNo.Value]) then
    raise Exception.Create('Pallet Details do not exist.  Cannot post');
  if  DelHeadCartonsRcvd.AsInteger<>BCBTotal then
    raise Exception.Create('Box Batch Totals do not balance.  Cannot post');
  if trunc((TempQtyTotal1*100)+0.000001)<>trunc((QtyTotal*100)+0.000001) then
  begin
    ErrorMsg:='Qty Batch Totals do not balance.  Cannot post. '+
       formatfloat('0.00',TempQtyTotal1)+'<>'+formatfloat('0.00',QtyTotal);
    raise Exception.Create(ErrorMsg);
  end;
  {check bcb totals}
  {if boxes exist check that the total weight}
  {for each pallet inserted is correct}
  {DelBCB.DisableControls;
  DelPallet.DisableControls;}
{  if not EditFixedWeight.Checked then {fixed weight pallets only have 1 boxes}
{  begin}
    try
      DelPallet.First;
      while not DelPallet.EOF do
      begin
        TempQtyTotal:=0;
        try
          DelBCB.First;
          while not DelBCB.EOF do
          begin
            TempQtyTotal:=TempQtyTotal+DelBCBQty.Value;
            DelBCB.Next;
          end;
        finally
          TempQtyTotal1:=DelPalletQtyRcvd.AsFloat;
          if trunc((TempQtyTotal*100)+0.000001)<>trunc((TempQtyTotal1*100)+0.000001) then
          begin
            ErrorMsg:='Box Totals do not balance.  Cannot post. '+
               formatfloat('0.00',TempQtyTotal)+'<>'+formatfloat('0.00',TempQtyTotal1);
            raise Exception.Create(ErrorMsg);
          end;
        end;
        DelPallet.Next;
      end;
    finally
      {DelBCB.EnableControls;
      DelPallet.EnableControls;}
    end;
  if DelHead.State =dsEdit then
  begin
    DelHeadDateMod.Value:=now;
    DelHeadUserMod.Value:=UserInitials;
  end;
end;

procedure TDelInForm.GenBoxBarCodeBtnClick(Sender: TObject);
type
  string40=string[40];
var
  ix:smallint;
  LabelData,LabelDescr:string;
  MeasUnit:string;
  Line1,Line2,Line3,Line4,Line5,BarCode:string40;
begin
  if not DelBCB.FindKey([DelHeadDelNo.Value]) then
    raise Exception.Create('No Boxes for this Pallet');
  if EditFixedWeight.Checked then
    raise Exception.Create('Cannot print box labels for a fixed weight pallet');
    if MessageDlg('Print Labels for Current Pallet?',
      mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      Timer1.Enabled:=true;
      DelBCB.First;
      for ix:=1 to DelPalletBagCartBaleDel.Value do
      begin
        if ix=1 then
        begin
          ProductQuery.Active:=false;
          ProductQuery.Params[0].AsString:=DelPalletProdRef.Value;
          ProductQuery.Active:=true;
          MeasUnit:=ProductQuery.Fields[1].AsString;
          LabelDescr:=ProductQuery.Fields[3].AsString;
          ProductQuery.Active:=false;
        end;
        if DelBCBBCBIssued.AsString='Y' then {issued, don't reprint: added DL221097}
        begin
          DelBCB.Next;
          continue;
        end;

        Line1:='Box '+DelPalletDelNo.AsString+'/'+
          ZeroFill(DelPalletPalletNo.Value,3)+
          '/'+ZeroFill(ix,3);
        Line2:=DelHeadSupRef.Value+' '+LabelDescr;
        Line3:='Qty: '+floattostrf(DelBCBQty.Value,ffFixed,5,2)+
          ' '+MeasUnit;
        Line4:='Date Rcvd: '+formatdatetime('dd/mm/yyyy',DelHeadDelDate.Value);
        Line5:='';
        BarCode:='11'+ZeroFill(DelHeadDelNo.Value,4)+
          ZeroFill(DelPalletPalletNo.Value,3)+ZeroFill(ix,3);
        BarCodePrinterReady:=false;
        VBBarCodeForm.PrintBoxLabel(Line1,Line2,Line3,Line4,Line5,BarCode);
        while not BarCodePrinterReady do
          Application.ProcessMessages;
        DelBCB.Next;
      end;
      Timer1.Enabled:=false;
    end;
end;

procedure TDelInForm.BarCodeSearchSpdBtnClick(Sender: TObject);
var
  BarCodeStr:string;
  SubStr:string;
begin
  if DelHead.State in [dsInsert,dsEdit] then
    ShowMessage('For bar code search, cannot be in insert or edit mode')
  else
  begin
    BarCodeStr:='';
    if InputQuery('Bar Code Search',
      'Enter bar code',
      BarCodeStr) then
    begin
      SubStr:=Copy(BarCodeStr,3,4); {4 was 5 DL020397}
      DelHead.SetKey;
      DelHead.FieldByName('DelNo').AsInteger:=strtoint(SubStr);
      if not DelHead.GotoKey then
        ShowMessage('Record not found')
      else
      begin
        ShowBCB.Text:=inttostr(DelHeadCartonsRcvd.Value);
        ShowQty.Text:=floattostr(DelHeadQtyRcvd.Value);
      end;
    end;
  end;
end;

procedure TDelInForm.SpeedButton1Click(Sender: TObject);
begin
  if DelHead.State in [dsInsert,dsEdit] then
    ShowMessage('Cannot search whilst in Insert or Edit Mode')
  else
    if PickDlgForm.ShowModalDelNo = mrOk then
    begin
      DelHead.SetKey;
      DelHead.FieldByName('DelNo').AsInteger:=PickDlgForm.DelNo;
      DelHead.GotoKey;
    end;
  Screen.Cursor := crDefault; { Always restore to normal }    
end;

procedure TDelInForm.DelHeadAGENTValidate(Sender: TField);
begin
  {check for existence of agent}
  Agent.SetKey;
  Agent.FieldByName('AgentRef').AsString:=DelHeadAgent.Value;
  if not Agent.GotoKey then
    raise Exception.Create('Agent not found');
end;

procedure TDelInForm.DelHeadRCVDBYValidate(Sender: TField);
begin
  {check for existence of user}
  {Initials.SetKey;
  Initials.FieldByName('Initials').AsString:=DelHeadRcvdBy.Value;
  if not Initials.GotoKey then
    raise Exception.Create('User not found');}
end;

procedure TDelInForm.DelPalletBeforeEdit(DataSet: TDataset);
begin
  DelHead.Edit;
  OldQtyRcvd:=DelPalletQtyRcvd.Value;
  {OldProdRef:=DelPalletProdRef.Value;}
end;

procedure TDelInForm.DelHeadBeforeEdit(DataSet: TDataset);
begin
  if NoPallet then {added DL280897}
    Exit;
  if EditOrdLineComplete.Checked then
  begin
  {  raise Exception.Create('Cannot modify a complete delivery');}
    ShowMessage('About to modify a complete delivery'); {DL160197}
    DelHeadPalletsRcvd.ReadOnly:=true;
    DelHeadCartonsRcvd.ReadOnly:=true;
    DelHeadQtyRcvd.ReadOnly:=true;
    DelHeadDelDate.ReadOnly:=true;
    DelHeadSupRef.ReadOnly:=true;
    EditPalletsRcvd.Color:=clSilver;
    EditCartonsRcvd.Color:=clSilver;
    EditQtyRcvd.Color:=clSilver;
    EditDelDate.Color:=clSilver;
    EditSupRef.Color:=clSilver;
{    PalletGrid.Enabled:=false;}
  end
  else
  begin
    DelHeadPalletsRcvd.ReadOnly:=false;
    DelHeadCartonsRcvd.ReadOnly:=false;
    DelHeadQtyRcvd.ReadOnly:=false;
    DelHeadDelDate.ReadOnly:=false;
    DelHeadSupRef.ReadOnly:=false;
    EditPalletsRcvd.Color:=clWindow;
    EditCartonsRcvd.Color:=clWindow;
    EditQtyRcvd.Color:=clWindow;
    EditDelDate.Color:=clWindow;
    EditSupRef.Color:=clWindow;
  end;
  if not InTxn then
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TDelInForm.Timer1Timer(Sender: TObject);
begin
  BarCodePrinterReady:=true;
end;

procedure TDelInForm.DelBCBBeforeEdit(DataSet: TDataset);
begin
  DelHead.Edit;
end;

procedure TDelInForm.DelHeadDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TDelInForm.DelHeadDELDATEChange(Sender: TField);
begin
  if (DelHeadDelDate.Value<NoEntryBeforeDate) then
  begin
    DelHeadDelDate.Value:=date;
    raise exception.create('Date cannot be less than '+
      FormatDateTime('dd-mmm-yyyy',NoEntryBeforeDate));
  end;
  if (DelHeadDelDate.Value>date) then
  begin
    DelHeadDelDate.Value:=date;
    raise exception.create('Date cannot be greater than today');
  end;
end;

procedure TDelInForm.DelInPageControlChange(Sender: TObject);
var
  ix:smallint;
begin
  if DelInPageControl.ActivePage=HdrTabSheet then
  begin
    ActiveSource.DataSet:=DelHead;
    DBNavigator1.VisibleButtons:=[nbFirst,nbPrior,
      nbNext,nbLast,nbInsert,{nbDelete,}nbEdit];
  end
  else
  begin
    ActiveSource.DataSet:=DelPallet;
    DBNavigator1.VisibleButtons:=[nbFirst,nbPrior,
      nbNext,nbLast];
    UpdatePalletTotals;
  end;
  if (DelHeadPalletsRcvd.Value<>0) and
    (DelHeadCartonsRcvd.Value<>0) and
    (DelHeadQtyRcvd.Value<>0) then
  begin
    if DelHead.State in [dsInsert,dsEdit] then
    begin
      {first make sure no delpallet records exist}
      {if they do check the quantities created compared with the header record}
      if not (DelPallet.FindKey([DelHeadDelNo.Value])) then
      begin
        NoPallet:=true; {do not check for pallet, inserted because delheadbeforepost is called: DL280897}
        DelHead.Post;
        DelHead.Edit;
        NoPallet:=false; {do not check for pallet: DL280897}
        DelPalletPalletNo.ReadOnly:=false;
        DelPalletProdRef.ReadOnly:=false;
        for ix:=1 to DelHeadPalletsRcvd.Value do
        begin
          with DelPallet do
          begin
            Insert; {DelPallet.Insert a new record}
            FieldByName('DelNo').AsInteger:=DelHeadDelNo.Value;
            FieldByName('ProdRef').AsString:=DelHeadProdRef.Value; {was :='' DL190296}
            FieldByName('PalletNo').AsInteger:=ix;
            FieldByName('BagCartBaleDel').AsInteger:=
              trunc(DelHeadCartonsRcvd.Value/DelHeadPalletsRcvd.Value);
            FieldByName('QtyRcvd').AsFloat:=
              dlround((DelHeadQtyRcvd.Value/DelHeadPalletsRcvd.Value),1);
            FieldByName('BCBIssued').ReadOnly:=false;
            FieldByName('QtyIssued').ReadOnly:=false;
            FieldByName('BCBIssued').AsInteger:=0;
            FieldByName('QtyIssued').AsFloat:=0;
            FieldByName('BCBIssued').ReadOnly:=true;
            FieldByName('QtyIssued').ReadOnly:=true;
            FieldByName('ValueRating').AsFloat:=1; {added DL020397}
            FieldByName('ValueRatingDate').Value:=DelHeadDelDate.Value; {added DL100397}
            OldQtyRcvd:=0;
            Post;
          end;
        end;
      end;
      DelPallet.Edit;
      DelPalletPalletNo.ReadOnly:=true;
      DelPalletProdRef.ReadOnly:=true;
    end;
    {moved DL 140596 so that displayed even when not in edit or insert mode}
    if DelPallet.FindKey([DelHeadDelNo.Value]) then
    begin
      ProductQuery.Active:=false;
      ProductQuery.Params[0].AsString:=DelPalletProdRef.Value;
      ProductQuery.Active:=true;
      with ProductQuery.Fields[0] do
        if IsNull then
          EditFixedWeight.Checked:=true
        else
          EditFixedWeight.Checked:=AsString='Y';
      ProductQuery.Active:=false;
    end;
  end;
end;

procedure TDelInForm.BoxGridDblClick(Sender: TObject);
begin
  if DelBCBQtyIssued.AsFloat>0 then
  begin
    if EditFixedWeight.Checked then
      PickDlgForm.ShowModalIssued(DelBCBDelNo.AsInteger,
        DelBCBPalletNo.AsInteger,0)
    else
      PickDlgForm.ShowModalIssued(DelBCBDelNo.AsInteger,
        DelBCBPalletNo.AsInteger,DelBCBBCBNo.AsInteger);
  end;
  Screen.Cursor:=crDefault;
end;

procedure TDelInForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
