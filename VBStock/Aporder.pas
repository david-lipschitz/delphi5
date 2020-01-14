unit Aporder;
{modified: DL160297 so that transactions only used when needed}

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, Grids, DBGrids, ExtCtrls, DBLookup,
  StdCtrls, Mask, DBCtrls, Buttons;

type
  TAPOrderForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    APOrdDetGrid: TDBGrid;
    Panel3: TPanel;
    APOrdHdr: TTable;
    APOrdHdrSource: TDataSource;
    ActiveSource: TDataSource;
    DBNavigator1: TDBNavigator;
    Order: TLabel;
    Ref: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditOrdDate: TDBEdit;
    EditSupOrdNo: TDBEdit;
    EditExpDelDate: TDBEdit;
    Label6: TLabel;
    Supplier: TTable;
    Label7: TLabel;
    SupplierSource: TDataSource;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label12: TLabel;
    APOrdDet: TTable;
    APOrdDetSource: TDataSource;
    APOrdHdrORDDATE: TDateTimeField;
    APOrdHdrSUPREF: TStringField;
    APOrdHdrEXPDELDATE: TDateTimeField;
    APOrdHdrORDERSENT: TStringField;
    APOrdHdrDATEENT: TDateTimeField;
    APOrdHdrDATEMOD: TDateTimeField;
    APOrdHdrORDEREDBY: TStringField;
    APOrdHdrAUTHBY: TStringField;
    APOrdHdrUSERENT: TStringField;
    APOrdHdrUSERMOD: TStringField;
    APOrdHdrORDAPPROX: TStringField;
    APOrdDetPRODREF: TStringField;
    APOrdDetQTY: TFloatField;
    PostBtn: TButton;
    CancelBtn: TButton;
    CloseBitBtn: TBitBtn;
    SupplierCURRENCY: TStringField;
    Product: TTable;
    Label18: TLabel;
    SupplierSUPREF: TStringField;
    DBLookupCombo1: TDBLookupCombo;
    Initials: TTable;
    InitialsSource: TDataSource;
    Label20: TLabel;
    DBLookupCombo2: TDBLookupCombo;
    ProductPRODREF: TStringField;
    PopupOrdCalSpdBtn: TSpeedButton;
    PopupCalDelSpdBtn: TSpeedButton;
    Label22: TLabel;
    ProdSup: TTable;
    ProdSupPRODREF: TStringField;
    ProdSupSUPREF: TStringField;
    APOrdDetQTYRCVD: TFloatField;
    APOrdHdrSUPORDNO: TStringField;
    EditVTOrdNo: TDBEdit;
    APOrdDetEXPDELDATE: TDateTimeField;
    ProductMEASUNIT: TStringField;
    APOrdDetMeasUnit: TStringField;
    OutOrdSpdBtn: TSpeedButton;
    EditSupRef: TDBEdit;
    SupRefSpdBtn: TSpeedButton;
    APOrdDetORDLINECOMPLETE: TStringField;
    Label23: TLabel;
    EditDateEnt: TDBEdit;
    EditUserEnt: TDBEdit;
    AllOrdSpdBtn: TSpeedButton;
    APOrdHdrVTORDNO: TIntegerField;
    APOrdDetVTORDNO: TIntegerField;
    Label11: TLabel;
    ShowDateMod: TDBEdit;
    ShowUserMod: TDBEdit;
    PrintSpdBtn: TSpeedButton;
    procedure APOrdHdrSourceStateChange(Sender: TObject);
    procedure APOrdDetGridEnter(Sender: TObject);
    procedure APOrdDetGridExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure APOrdHdrBeforeInsert(DataSet: TDataset);
    procedure APOrdHdrNewRecord(DataSet: TDataset);
    procedure APOrdHdrAfterPost(DataSet: TDataset);
    procedure APOrdHdrAfterCancel(DataSet: TDataset);
    procedure APOrdHdrBeforeDelete(DataSet: TDataset);
    procedure APOrdHdrBeforeCancel(DataSet: TDataset);
    procedure APOrdHdrAfterDelete(DataSet: TDataset);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure APOrdDetNewRecord(DataSet: TDataset);
    procedure APOrdHdrORDDATEChange(Sender: TField);
    procedure APOrdHdrBeforeEdit(DataSet: TDataset);
    procedure PopupOrdCalSpdBtnClick(Sender: TObject);
    procedure PopupCalDelSpdBtnClick(Sender: TObject);
    procedure APOrdDetPRODREFChange(Sender: TField);
    procedure APOrdDetCalcFields(DataSet: TDataset);
    procedure APOrdDetBeforeDelete(DataSet: TDataset);
    procedure APOrdDetBeforeEdit(DataSet: TDataset);
    procedure APOrdDetBeforeInsert(DataSet: TDataset);
    procedure APOrdDetSourceStateChange(Sender: TObject);
    procedure APOrdHdrORDDATEValidate(Sender: TField);
    procedure APOrdHdrEXPDELDATEValidate(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure OutOrdSpdBtnClick(Sender: TObject);
    procedure SupRefSpdBtnClick(Sender: TObject);
    procedure APOrdDetDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure APOrdHdrDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure AllOrdSpdBtnClick(Sender: TObject);
    procedure APOrdHdrORDEREDBYValidate(Sender: TField);
    procedure APOrdDetORDLINECOMPLETEChange(Sender: TField);
    procedure APOrdHdrBeforePost(DataSet: TDataSet);
    procedure APOrdDetBeforePost(DataSet: TDataSet);
    procedure APOrdDetGridEditButtonClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { Private declarations }
    InTxn:boolean; {added DL 160297}
    NoCommit: Boolean;
    DoingEdit:boolean; {added DL291097}
    OldQty:double; {added DL291097}
    OldProdRef:string; {added DL291097}
{    procedure DeleteItems; {done by trigger as at 30/5/97}
  public
    { Public declarations }
    procedure Enter;
    procedure Edit(VTOrdNo:string;ExpDelDate:double);
  end;

var
  APOrderForm: TAPOrderForm;

implementation

uses VBMain, PickDate, BrModal, VBUtils;

{$R *.DFM}

{const
  DatasetStates: array[TDataSetState] of string[11] =
    ('Not active', 'Browsing', 'Editing', 'Inserting',
    'Setting key', 'Calculating', 'Updat.New', 'Updat.Old',
    'Filter');}

procedure TAPOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if APOrdHdr.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post this order before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  APOrdDet.Close;
  Supplier.Close;
  Initials.Close;
  Product.Close;
  ProdSup.Close;
  APOrdHdr.Close;
{  MainForm.Database.Commit;}
  APOrderForm.Release;
end;

procedure TAPOrderForm.Enter;
begin
  DoingEdit:=false;
  ShowModal;
end;

procedure TAPOrderForm.Edit(VTOrdNo:string;ExpDelDate:double);
begin
  MainForm.Database.StartTransaction;
end;

procedure TAPOrderForm.APOrdHdrSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := APOrdHdr.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := APOrdHdr.State = dsBrowse;
end;

procedure TAPOrderForm.APOrdDetGridEnter(Sender: TObject);
begin
  ActiveSource.DataSet := APOrdDet;
end;

procedure TAPOrderForm.APOrdDetGridExit(Sender: TObject);
begin
  ActiveSource.DataSet := APOrdHdr;
end;

procedure TAPOrderForm.FormShow(Sender: TObject);
begin
  APOrdHdr.Open;
  APOrdDet.Open;
  Supplier.Open;
  Initials.Open;
  Product.Open;
  ProdSup.Open;
  ApOrdDet.Refresh; {added DL020497 so that record is displayed when screen is initially opened}
  Supplier.Refresh;
  Product.Refresh;
  ProdSup.Refresh;
  NoCommit:=false;
  InTxn:=false;
end;

procedure TAPOrderForm.APOrdHdrBeforeInsert(DataSet: TDataset);
begin
  if InTxn then
    raise Exception.Create('Post before inserting')
  else
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TAPOrderForm.APOrdHdrNewRecord(DataSet: TDataset);
begin
  {find next order number}
  {initialise variables}
  EditDateEnt.ReadOnly:=false;
  APOrdHdrDateEnt.Value:=date;
  EditDateEnt.ReadOnly:=true;
  EditUserEnt.ReadOnly:=false;
  APOrdHdrUserEnt.Value:=UserInitials;
  EditUserEnt.ReadOnly:=true;
  APOrdHdrUserMod.value:=UserInitials;
  APOrdHdrOrdDate.Value:=date;
  APOrdHdrDateEnt.Value:=date;  {added DL100397}
  APOrdHdrDateMod.Value:=date;  {added DL100397}
  APOrdHdrOrdApprox.Value:='N';
  APOrdHdrOrderSent.Value:='N';
  {APOrdHdrOrdComplete.ReadOnly:=false;
  APOrdHdrOrdComplete.Value:='N';
  APOrdHdrOrdComplete.ReadOnly:=true;}
{  DispCurrency.Text:='';}
  {reset totals to zero}
end;

procedure TAPOrderForm.APOrdHdrAfterPost(DataSet: TDataset);
begin
  if not NoCommit then
  begin
    MainForm.Database.Commit;
    InTxn:=false;
  end;
end;

procedure TAPOrderForm.APOrdHdrAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  InTxn:=false;
  APOrdHdr.Refresh;
  APOrdDet.Refresh;
end;

procedure TAPOrderForm.APOrdHdrAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
  InTxn:=false;
end;

procedure TAPOrderForm.APOrdHdrBeforeCancel(DataSet: TDataset);
begin
  if (APOrdHdr.State=dsInsert) and not (APOrdDet.BOF and APOrdDet.EOF) then
    if MessageDlg('Cancel order being inserted and delete all line items?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TAPOrderForm.APOrdHdrBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete order and line items?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  if not InTxn then
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TAPOrderForm.PostBtnClick(Sender: TObject);
begin
{  APOrdHdrUserEnt.value:='DL';
  APOrdHdrUserMod.value:='DL';}
  APOrdHdr.Post;
end;

procedure TAPOrderForm.CancelBtnClick(Sender: TObject);
begin
  APOrdHdr.Cancel;
end;

{close the form window}
procedure TAPOrderForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TAPOrderForm.APOrdDetNewRecord(DataSet: TDataset);
begin
  APOrdDetVTOrdNo.Value:=APOrdHdrVTOrdNo.Value;
  APOrdDetExpDelDate.Value:=APOrdHdrExpDelDate.Value;
  APOrdDetQtyRcvd.ReadOnly:=false;
  APOrdDetQtyRcvd.Value:=0;
  APOrdDetQtyRcvd.ReadOnly:=true;
  {APOrdDetOrdLineComplete.ReadOnly:=false;}
  APOrdDetOrdLineComplete.Value:='N';
  {APOrdDetOrdComplete.ReadOnly:=true;}
end;

procedure TAPOrderForm.APOrdHdrORDDATEChange(Sender: TField);
begin
  APOrdHdrExpDelDate.Value:=APOrdHdrOrdDate.Value;
end;

procedure TAPOrderForm.APOrdHdrBeforeEdit(DataSet: TDataset);
begin
  if not InTxn then
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TAPOrderForm.PopupOrdCalSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=APOrdHdrOrdDate.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    APOrdHdr.Edit;
    APOrdHdrOrdDate.Value:=BRDateForm.Date;
  end;
end;

procedure TAPOrderForm.PopupCalDelSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=APOrdHdrExpDelDate.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    APOrdHdr.Edit;
    APOrdHdrExpDelDate.Value:=BRDateForm.Date;
  end;
end;

procedure TAPOrderForm.APOrdDetPRODREFChange(Sender: TField);
begin
  if not ProdSup.FindKey([APOrdDetProdRef.Value,APOrdHdrSupRef.Value]) then
  begin
    raise Exception.Create(
          'This product is not valid for the supplier selected');
    APOrdDetProdRef.Value:=#0;
  end
  else
  begin
    Product.FindKey([APOrdDetProdRef.Value]);
    APOrdDetMeasUnit.Value:=ProductMeasUnit.Value;
  end;
end;

procedure TAPOrderForm.APOrdDetCalcFields(DataSet: TDataset);
begin
  {note this procedure is called when the form is created}
  if Product.Active then
  begin
    Product.FindKey([ApOrdDetProdRef.Value]);
    APOrdDetMeasUnit.Value:=ProductMeasUnit.Value;
  end;
end;

procedure TAPOrderForm.APOrdDetBeforeDelete(DataSet: TDataset);
begin
  if not InTxn then
    APOrdHdr.Edit;
  if APOrdDetQtyRcvd.Value<>0 then
  begin
    ShowMessage('Cannot delete a line where an order is received');
{    MainForm.Database.Rollback;
    InTxn:=false;}
    Abort;
  end;
end;

procedure TAPOrderForm.APOrdDetBeforeEdit(DataSet: TDataset);
begin
  if APOrdDetOrdLineComplete.Value='Y' then
  begin
    ShowMessage('Cannot edit order detail as complete');
    Abort; {raise silent exception}
  end
  else
  begin
    DoingEdit:=true;
    OldProdRef:=APOrdDetProdRef.AsString;
    OldQty:=APOrdDetQty.AsFloat;
    APOrdHdr.Edit;
  end;

end;

procedure TAPOrderForm.APOrdDetBeforeInsert(DataSet: TDataset);
begin
  if APOrdHdr.State = dsInsert then
  begin
    NoCommit:=true;
    APOrdHdr.Post;
    APOrdHdr.Edit; {? Det}
    NoCommit:=false;
  end
  else
    APOrdHdr.Edit;
end;

procedure TAPOrderForm.APOrdDetSourceStateChange(Sender: TObject);
begin
  if APOrdDet.State=dsBrowse then
    APOrdDetGrid.Options:=APOrdDetGrid.Options - [dgTabs]
  else
    APOrdDetGrid.Options:=APOrdDetGrid.Options + [dgTabs];
end;

procedure TAPOrderForm.APOrdHdrORDDATEValidate(Sender: TField);
begin
  if APOrdHdrExpDelDate.Value <> 0 then
    if APOrdHdrOrdDate.Value > APOrdHdrExpDelDate.Value then
      raise Exception.Create('Order date should be after delivery date');
end;

procedure TAPOrderForm.APOrdHdrEXPDELDATEValidate(Sender: TField);
begin
  if APOrdHdrExpDelDate.Value < APOrdHdrOrdDate.Value then
    raise Exception.Create('Delivery date should be after order date');
end;

procedure TAPOrderForm.OutOrdSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalOutOrds('O') = mrOk then
  begin
    APOrdHdr.SetKey;
    APOrdHdr.FieldByName('VTOrdNo').AsInteger:=PickDlgForm.OutVTOrdNo;
    APOrdHdr.GotoKey;
  end;
end;

procedure TAPOrderForm.SupRefSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalSups('SU') = mrOk then {CU for customers}
    ApOrdHdrSupRef.AsString:=PickDlgForm.SupRef;
end;

procedure TAPOrderForm.APOrdDetDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TAPOrderForm.APOrdHdrDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TAPOrderForm.AllOrdSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalOutOrds('A') = mrOk then
  begin
    APOrdHdr.SetKey;
    APOrdHdr.FieldByName('VTOrdNo').AsInteger:=PickDlgForm.OutVTOrdNo;
    APOrdHdr.GotoKey;
  end;
end;

procedure TAPOrderForm.APOrdHdrORDEREDBYValidate(Sender: TField);
begin
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TAPOrderForm.APOrdDetORDLINECOMPLETEChange(Sender: TField);
begin
  if (ApOrdDetOrdLineComplete.Value<>'N') and (ApOrdDetOrdLineComplete.Value<>'Y') then
    raise Exception.Create('Complete can only be Yes or No');
end;

procedure TAPOrderForm.APOrdHdrBeforePost(DataSet: TDataSet);
begin
  if ApOrdHdr.State =dsEdit then
  begin
    ApOrdHdrDateMod.Value:=now;
    ApOrdHdrUserMod.Value:=UserInitials;
  end;
end;

procedure TAPOrderForm.APOrdDetBeforePost(DataSet: TDataSet);
begin
  if DoingEdit then
  begin
    if (APOrdDetQTYRCVD.AsFloat<>0) then {qty already received}
    begin
      if (OldProdRef<>APOrdDetProdRef.AsString) then
      begin
        ShowMessage('Cannot modify product ref. Press return, then ESC');
        Abort;
      end
      else
      if (trunc((OldQty*100)+0.000001)<>trunc((APOrdDetQty.AsFloat*100)+0.000001))
        and (APOrdDetQTYRCVD.AsFloat<>0) then
      begin
        ShowMessage('Cannot modify order qty as qty received. Press return, then ESC');
        Abort;
      end
      else
        DoingEdit:=false;
    end
    else
      DoingEdit:=false;
  end;
end;

procedure TAPOrderForm.APOrdDetGridEditButtonClick(Sender: TObject);
begin
  if ApOrdDetGrid.SelectedField.Name='APOrdDetPRODREF' then
  begin
    APOrdDetGrid.SelectedField := APOrdDetProdRef;
    if PickDlgForm.ShowModalProds(APOrdHdrSupRef.Value) = mrOk then
    begin
      APOrdDet.Edit;
      APOrdDetProdRef.Value := PickDlgForm.ProdRef;
    end;
  end;
end;

procedure TAPOrderForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
