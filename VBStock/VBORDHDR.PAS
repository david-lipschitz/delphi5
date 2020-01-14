unit Vbordhdr;
//widened Credit Limit Field DL090710

interface

uses
  SysUtils, DBTables, DB, Grids, {Wwdbigrd, Wwdbgrid, Wwdatsrc, Wwtable,}
  StdCtrls, Mask, DBCtrls, Buttons, Controls, Forms, Classes, ExtCtrls,
  {Wwquery, wwidlg, Wwlocate,} Graphics, {wwidlg, Wwdbedit, wwdblook,
  Wwquery, Wwdotdot, Wwdbcomb,} DBGrids,Windows, ODDatPrn, Menus, ODDBFind;
  {SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, Mask, ExtCtrls,
  Buttons, Wwdbigrd, Wwdbgrid, Wwdatsrc, Wwtable;}

type
  TVBOrdHdrForm = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    Label5: TLabel;
    OrderSearchSpdBtn: TSpeedButton;
    CustSearchSpdBtn: TSpeedButton;
    DateSearchSpdBtn: TSpeedButton;
    CloseBitBtn: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    VBTypeSrchSpdBtn: TSpeedButton;
    Label9: TLabel;
    Label11: TLabel;
    PostBtn: TSpeedButton;
    CancelBtn: TSpeedButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label10: TLabel;
    VBOrdHdr: TTable;
    VBOrdHdrSource: TDataSource;
    ActiveSource: TDataSource;
    VBOrdHdrVTORDNO: TIntegerField;
    VBOrdHdrCUSTREF: TStringField;
    VBOrdHdrORDDATE: TDateTimeField;
    VBOrdHdrCUSTORDNO: TStringField;
    VBOrdHdrDATERCVD: TDateTimeField;
    VBOrdHdrRCVDBY: TStringField;
    VBOrdHdrPRICETYPE: TStringField;
    EditVTOrdNo: TDBEdit;
    EditCustRef: TDBEdit;
    EditOrdDate: TDBEdit;
    EditCustOrdNo: TDBEdit;
    Supplier: TTable;
    SupplierSource: TDataSource;
    SupplierSUPREF: TStringField;
    SupplierCRLIMIT: TFloatField;
    SupplierSUPDESCR: TStringField;
    ShowCustDescr: TDBEdit;
    ShowCreditLimit: TDBEdit;
    FindFastQuery: TQuery;
    EditDateRcvd: TDBEdit;
    EditRcvdBy: TDBEdit;
    VBParamSource: TDataSource;
    VBParamsQuery: TQuery;
    VBParamsQueryMAKEDATE: TDateTimeField;
    EditMakeDate: TDBEdit;
    VBOrdDet: TTable;
    VBOrdDetSource: TDataSource;
    VBOrdDetGrid: TDBGrid;
    VBOrdDetVTORDNO: TIntegerField;
    VBOrdDetVBSTRU: TStringField;
    VBOrdDetVBCOL: TStringField;
    VBOrdDetVBWIDTH: TSmallintField;
    VBOrdDetQTY: TIntegerField;
    VBOrdDetDATERQD: TDateTimeField;
    VBOrdDetRCVDBY: TStringField;
    VBOrdDetQTYDEL: TFloatField;
    VBOrdDetSTATUS: TStringField;
    VBOrdDetQTYALLOC: TFloatField;
    VBOrdDetESTDATE: TDateTimeField;
    VBMake_Fin: TTable;
    VBMakeSource: TDataSource;
    VBMake_FinVBSTRU: TStringField;
    VBMake_FinVBCOL: TStringField;
    VBMake_FinSTK2070: TIntegerField;
    VBMake_FinORD2070: TIntegerField;
    VBMake_FinFWIP: TFloatField;
    VBMake_FinSTK127: TIntegerField;
    VBMake_FinORD127: TIntegerField;
    VBMake_FinSTK89: TIntegerField;
    VBMake_FinORD89: TIntegerField;
    VBMake_FinALLOC127: TIntegerField;
    VBMake_FinALLOC89: TIntegerField;
    VBMake_FinALLOC2070: TIntegerField;
    VBMake_FinREMAIN127: TIntegerField;
    VBMake_FinREMAIN89: TIntegerField;
    VBMake_FinREMAIN2070: TIntegerField;
    EditWWIP: TDBEdit;
    EditVWIP: TDBEdit;
    EditFWIP: TDBEdit;
    EditFWStk: TDBEdit;
    Edit89Stk: TDBEdit;
    Edit127Stk: TDBEdit;
    EditFWOrd: TDBEdit;
    Edit89Ord: TDBEdit;
    Edit127Ord: TDBEdit;
    EditFWAlloc: TDBEdit;
    Edit89Alloc: TDBEdit;
    Edit127Alloc: TDBEdit;
    EditFWRemain: TDBEdit;
    Edit89Remain: TDBEdit;
    Edit127Remain: TDBEdit;
    FindFastQueryVTORDNO: TIntegerField;
    CustOrdSearchSpdBtn: TSpeedButton;
    EditPriceType: TDBLookupComboBox;
    PriceType: TTable;
    PriceTypeSource: TDataSource;
    Label19: TLabel;
    EditFWMin: TDBEdit;
    Edit89Min: TDBEdit;
    Edit127Min: TDBEdit;
    VBMake_FinMIN127: TIntegerField;
    VBMake_FinMIN89: TIntegerField;
    VBMake_FinMIN2070: TIntegerField;
    VBOrdDetVBFIN: TStringField;
    FindFastNextIncompleteSpnBtn: TSpeedButton;
    VBMake_FinVBFIN: TStringField;
    Label21: TLabel;
    VBMake_Warp: TTable;
    VBMake_WarpSource: TDataSource;
    VBMake_WarpVBSTRU: TStringField;
    VBMake_WarpVBCOL: TStringField;
    VBMake_WarpVWIP: TFloatField;
    VBMake_WarpWWIP: TFloatField;
    VBFinComboBox: TComboBox;
    CheckLineCompleteQuery: TQuery;
    GenOrdNoProc: TStoredProc;
    PrintFormSpdBtn: TSpeedButton;
    PrintOrderSpdBtn: TSpeedButton;
    CustomerPrinter: TODDataPrinter;
    CkbxConsignment: TDBCheckBox;
    VBOrdHdrPLANNEDCONSIGNMENT: TStringField;
    Label8: TLabel;
    edtVTColour: TDBEdit;
    qryGetVTColour: TQuery;
    datGetVTColour: TDataSource;
    btnVBEnq: TButton;
    dbcOrderHeld: TDBCheckBox;
    VBOrdHdrORDERHELD: TStringField;
    ODFindMenu1: TODFindMenu;
    Label25: TLabel;
    EditFWSales: TDBEdit;
    Edit89Sales: TDBEdit;
    Edit127Sales: TDBEdit;
    VBMake_FinSALE89: TFloatField;
    VBMake_FinSALE127: TFloatField;
    VBMake_FinSALE2070: TFloatField;
    VBMake_FinAVESALE89: TFloatField;
    VBMake_FinAVESALE127: TFloatField;
    VBMake_FinAVESALE2070: TFloatField;
    qryStockMin: TQuery;
    qryStockMinSALEGROUP: TStringField;
    VBMake_FinDISCON127: TStringField;
    VBMake_FinDISCON89: TStringField;
    VBMake_FinDISCON2070: TStringField;
    VBOrdDetITEMNO: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VBOrdHdrAfterCancel(DataSet: TDataset);
    procedure VBOrdHdrAfterPost(DataSet: TDataset);
    procedure VBOrdHdrBeforeEdit(DataSet: TDataset);
    procedure VBOrdHdrBeforeInsert(DataSet: TDataset);
    procedure VBOrdHdrBeforeDelete(DataSet: TDataset);
    procedure VBOrdDetGridEnter(Sender: TObject);
    procedure VBOrdDetGridExit(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure CustSearchSpdBtnClick(Sender: TObject);
    procedure VBOrdHdrBeforeCancel(DataSet: TDataset);
    procedure VBOrdDetBeforeDelete(DataSet: TDataset);
    procedure VBOrdDetBeforeInsert(DataSet: TDataset);
    procedure VBOrdDetBeforeEdit(DataSet: TDataset);
    procedure VBOrdDetNewRecord(DataSet: TDataset);
    procedure VBOrdHdrNewRecord(DataSet: TDataset);
    procedure DateSearchSpdBtnClick(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure VBOrdHdrSourceStateChange(Sender: TObject);
    procedure VBOrdDetAfterPost(DataSet: TDataset);
    procedure OrderSearchSpdBtnClick(Sender: TObject);
    procedure VBOrdDetDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure VBOrdHdrDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure VBOrdDetGridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
{    procedure OrderSearchDialogInitDialog(Dialog: TwwLookupDlg);}
    procedure VBTypeSrchSpdBtnClick(Sender: TObject);
    procedure VBOrdDetVBWIDTHValidate(Sender: TField);
    procedure VBOrdDetVBCOLValidate(Sender: TField);
    procedure VBOrdDetVBSTRUValidate(Sender: TField);
    procedure PrintOrderSpdBtnClick(Sender: TObject);
    procedure VBOrdHdrSourceDataChange(Sender: TObject; Field: TField);
    procedure VBOrdDetAfterDelete(DataSet: TDataSet);
    procedure VBOrdDetAfterInsert(DataSet: TDataSet);
    procedure VBOrdDetDATERQDValidate(Sender: TField);
    procedure VBOrdDetESTDATEValidate(Sender: TField);
    procedure VBOrdDetQTYValidate(Sender: TField);
    procedure FindFastNextIncompleteSpnBtnClick(Sender: TObject);
    procedure VBOrdDetGridDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CustOrdSearchSpdBtnClick(Sender: TObject);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure Edit127OrdDblClick(Sender: TObject);
    procedure Edit89OrdDblClick(Sender: TObject);
    procedure EditFWOrdDblClick(Sender: TObject);
    procedure VBOrdDetGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PrintFormSpdBtnClick(Sender: TObject);
    procedure VBOrdDetGridCellClick(Column: TColumn);
    procedure btnVBEnqClick(Sender: TObject);
    procedure EditFWStkDblClick(Sender: TObject);
    procedure Edit89StkDblClick(Sender: TObject);
    procedure Edit127StkDblClick(Sender: TObject);
    procedure VBMakeSourceDataChange(Sender: TObject; Field: TField);
  private
    { private declarations }
    InTxn:boolean;
    NoCommit:boolean;
    LastCompleteOrdNo:integer; {set to the last order number checked for completed lines}
    procedure RedisplayWidths;
  public
    { public declarations }
  end;

var
  VBOrdHdrForm: TVBOrdHdrForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs,VBModal,PickDate, vbenq;

procedure TVBOrdHdrForm.VBOrdHdrNewRecord(DataSet: TDataset);
begin
(*if VBNextNo.FindKey([NextVTOrdNoRef]) then  //> JT 110698 replaced by generator below
  begin
    VBNextNo.Edit;
    VBOrdHdrVTOrdNo.Value:=VBNextNoNextNo.Value;
    VBNextNoNextNo.Value:=VBNextNoNextNo.Value+1;
    VBNextNo.Post;
{    EditDespBy.ReadOnly:=false;
    VBDespHdrDespBy.Value:=UserInitials;
    EditDespBy.ReadOnly:=true;}
  end
  else
  begin
    {duplicate key set here for safety so that a YnDespHdr}
    {Post causes an error}
    VBOrdHdrVTOrdNo.Value:=1;
    ShowMessage('Problem getting next Order Number.  Please call David');
  end;*)
  GenOrdNoProc.ExecProc;
  VBOrdHdrVTOrdNo.Value := GenOrdNoProc.Params[0].AsInteger; //< JT 110698
  VBOrdHdrOrdDate.Value:=date;
{  EditDateRcvd.ReadOnly:=false;}
  VBOrdHdrDateRcvd.Value:=VBOrdHdrOrdDate.Value;
{  EditDateRcvd.ReadOnly:=true;}
{  EditRcvdBy.ReadOnly:=false;}
  VBOrdHdrRcvdBy.Value:=UserInitials;
{  EditRcvdBy.ReadOnly:=true;}
  VBOrdHdrPlannedConsignment.Value:='N';
end;

procedure TVBOrdHdrForm.FormShow(Sender: TObject);
begin
  VBOrdHdr.Open;
  VBOrdDet.Open;
//VBNextNo.Open;   JT 110698  replaced by stored proc generator
  qryGetVTColour.Open;
  Supplier.Open;
  VBParamsQuery.Open;
  VBMake_Fin.Open;
  VBMake_Warp.Open;
  PriceType.Open;
  FindFastQuery.Prepare;
  CheckLineCompleteQuery.Prepare;
  qryStockMin.Close; //added DL18102000
//VBNextNo.Refresh;   JT 110698  replaced by stored proc generator
//  VBType.Refresh;
  Supplier.Refresh;
  VBMake_Fin.Refresh;
  VBMake_Warp.Refresh;
  PriceType.Refresh;
  NoCommit:=false;
  InTxn:=false;
  if UserInitials='SYS' then
    DBNavigator.VisibleButtons:=DBNavigator.VisibleButtons+[nbDelete];
  if PassValue<>0 then {goto the desired order}
  begin
    VBOrdHdr.SetKey;
    VBOrdHdr.FieldByName('VTOrdNo').AsInteger:=PassValue;
    VBOrdHdr.GotoKey;
    DBNavigator.VisibleButtons:=[];
  end;
  if ((UserInitials='SYS') or (UserInitials='SJ')  //JT200798
      or (UserInitials='PB')) then
    CkbxConsignment.ReadOnly := False;
  VBTypeSrchSpdBtn.Enabled:=false;
  VBOrdHdrSourceDataChange(Self,nil);
  LastCompleteOrdNo:=0;
end;

procedure TVBOrdHdrForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VBOrdHdr.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post this order before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  qryStockMin.Close; //added DL18102000
  PriceType.Close;
  VBMake_Fin.Close;
  VBMake_Warp.Close;
  VBParamsQuery.Close;
  Supplier.Close;
  qryGetVTColour.Close;
  VBOrdDet.Close;
  VBOrdHdr.Close;
//VBNextNo.Close;   JT 110698  replaced by stored proc generator
  VBOrdHdrForm.Release;
end;

procedure TVBOrdHdrForm.VBOrdHdrAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  InTxn:=false;
  VBOrdHdr.Refresh;
  VBOrdDet.Refresh;
{  VBOrdHdrSourceDataChange(Self,nil);
end;

procedure TVBOrdHdrForm.VBOrdHdrAfterDelete(DataSet: TDataset);
begin
{  MainForm.Database.Commit;
  InTxn:=false;}
end;

procedure TVBOrdHdrForm.VBOrdHdrAfterPost(DataSet: TDataset);
begin
  if not NoCommit then
  begin
    MainForm.Database.Commit;
    InTxn:=false;
    VBOrdHdrSourceDataChange(Self,nil);
  end;
end;

procedure TVBOrdHdrForm.VBOrdHdrBeforeEdit(DataSet: TDataset);
begin
  if not InTxn then
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
    VBOrdHdrSourceDataChange(Self,nil);
  end;
end;

procedure TVBOrdHdrForm.VBOrdHdrBeforeInsert(DataSet: TDataset);
begin
  if InTxn then
    raise Exception.Create('Post before inserting')
  else
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
    VBOrdHdrSourceDataChange(Self,nil);
  end;
end;

procedure TVBOrdHdrForm.VBOrdHdrBeforeDelete(DataSet: TDataset);
begin
  {only david can delete orders}
  if MessageDlg('Delete order (David: delete details first)?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  if not InTxn then
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
    VBOrdHdrSourceDataChange(Self,nil);
  end;
end;

procedure TVBOrdHdrForm.VBOrdDetGridEnter(Sender: TObject);
begin
  ActiveSource.DataSet:=VBOrdDet;
  if PassValue=0 then
  begin
    DBNavigator.VisibleButtons:=DBNavigator.VisibleButtons+[nbDelete];
    VBTypeSrchSpdBtn.Enabled:=true;
  end;
end;

procedure TVBOrdHdrForm.VBOrdDetGridExit(Sender: TObject);
begin
  ActiveSource.DataSet:=VBOrdHdr;
  if PassValue=0 then
  begin
    DBNavigator.VisibleButtons:=DBNavigator.VisibleButtons-[nbDelete];
    VBTypeSrchSpdBtn.Enabled:=false;
  end;
end;

procedure TVBOrdHdrForm.CloseBitBtnClick(Sender: TObject);
begin
  if VBOrdHdr.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Orders before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBOrdHdrForm.CustSearchSpdBtnClick(Sender: TObject);
begin
  if VBPickDlgForm.ShowModalSups('CU') = mrOk then {CU for customers}
    VBOrdHdrCustRef.AsString:=VBPickDlgForm.SupRef;
  Screen.Cursor:=crDefault;
end;

procedure TVBOrdHdrForm.VBOrdHdrBeforeCancel(DataSet: TDataset);
begin
  if VBOrdHdr.State=dsInsert then
    if MessageDlg('Cancel order being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TVBOrdHdrForm.VBOrdDetBeforeDelete(DataSet: TDataset);
begin
  if VBOrdDetStatus.Value='C' then
    raise Exception.Create('Cannot delete a completed line!');
  if (VBOrdDetQtyAlloc.Value<>0) or (VBOrdDetQtyDel.Value<>0) then
    raise Exception.Create('Cannot delete where allocated or despatched!');
  if not InTxn then
    VBOrdHdr.Edit; {puts system into txn}
end;

procedure TVBOrdHdrForm.VBOrdDetBeforeInsert(DataSet: TDataset);
begin
  if VBOrdHdr.State = dsInsert then
  begin
    NoCommit:=true;
    VBOrdHdr.Post;
    VBOrdHdr.Edit;
    NoCommit:=false;
  end
  else
    VBOrdHdr.Edit;
end;

procedure TVBOrdHdrForm.VBOrdDetBeforeEdit(DataSet: TDataset);
begin
  if VBOrdDetStatus.Value='C' then
    raise Exception.Create('Cannot edit a completed line')
  else
  begin
    VBOrdHdr.Edit;
{    VBOrdDetGrid.SelectedField := VBOrdDetVBStru;}
  end;
end;

procedure TVBOrdHdrForm.VBOrdDetNewRecord(DataSet: TDataset);
begin
{  VBOrdDetVTOrdNo.ReadOnly:=false;}
  VBOrdDetVTOrdNo.Value:=VBOrdHdrVTOrdNo.Value;
{  VBOrdDetVTOrdNo.ReadOnly:=true;}
  VBOrdDetRcvdBy.ReadOnly:=false;
  VBOrdDetRcvdBy.Value:=UserInitials;
  VBOrdDetRcvdBy.ReadOnly:=true;
  VBOrdDetQtyAlloc.ReadOnly:=false;
  VBOrdDetQtyAlloc.Value:=0;
  VBOrdDetQtyAlloc.ReadOnly:=true;
  VBOrdDetQtyDel.ReadOnly:=false;
  VBOrdDetQtyDel.Value:=0;
  VBOrdDetQtyDel.ReadOnly:=true;
  VBOrdDetStatus.Value:='E'; {Entered}
  VBOrdDetDateRqd.Value:=VBOrdHdrOrdDate.Value;
  VBOrdDetEstDate.Value:=VBOrdDetDateRqd.Value;
  VBOrdDetVBFin.AsString:=VBFinComboBox.Text;
end;

procedure TVBOrdHdrForm.DateSearchSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=VBOrdHdrOrdDate.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    VBOrdHdr.Edit;
    VBOrdHdrOrdDate.Value:=BRDateForm.Date;
  end;
end;

procedure TVBOrdHdrForm.PostBtnClick(Sender: TObject);
begin
  VBOrdHdr.Post;
end;

procedure TVBOrdHdrForm.CancelBtnClick(Sender: TObject);
begin
  VBOrdHdr.Cancel;
end;

procedure TVBOrdHdrForm.VBOrdHdrSourceStateChange(Sender: TObject);
begin
  if PassValue=0 then
  begin
    PostBtn.Enabled:=VBOrdHdrSource.State in [dsInsert,dsEdit];
  end
  else
    PostBtn.Enabled:=false;
  CancelBtn.Enabled:=VBOrdHdrSource.State in [dsInsert,dsEdit];
  CloseBitBtn.Enabled:= not PostBtn.Enabled;
  FindFastNextIncompleteSpnBtn.Enabled:=CloseBitBtn.Enabled; //added DL25102000
end;

procedure TVBOrdHdrForm.VBOrdDetAfterPost(DataSet: TDataset);
begin
{xxx  VBOrdDetQuery.Refresh;}
end;

procedure TVBOrdHdrForm.OrderSearchSpdBtnClick(Sender: TObject);
begin
  if PassValue=0 then
  begin
    if VBOrdHdr.State in [dsInsert, dsEdit] then
      ShowMessage('Cannot search when in Receive or Edit Mode')
    else
      if VBPickDlgForm.ShowModalVTOrderNo(0) = mrOk then {CU for customers}
      begin
        VBOrdHdr.SetKey;
        VBOrdHdr.FieldByName('VTOrdNo').AsInteger:=VBPickDlgForm.VTOrderNo;
        VBOrdHdr.GotoKey;
      end;
  end
  else
    ShowMessage('Cannot search when called by another program!');
  Screen.Cursor:=crDefault;
end;

procedure TVBOrdHdrForm.VBOrdDetDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBOrdHdrForm.VBOrdHdrDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBOrdHdrForm.VBOrdDetGridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if VBOrdDetStatus.Value<>'C' then
    AFont.color:=clRed;
end;

{xx procedure TVBOrdHdrForm.OrderSearchDialogInitDialog(Dialog: TwwLookupDlg);
begin
  Dialog.wwKeyCombo1.ShowAllIndexes:=true;
end;}

procedure TVBOrdHdrForm.VBTypeSrchSpdBtnClick(Sender: TObject);
begin
  if PassValue=0 then
  begin
    if (VBOrdDetStatus.Value='C') or (VBOrdDetQtyAlloc.Value>0)
        or (VBOrdDetQtyDel.Value>0) then
      raise Exception.Create('Cannot search where picked, despatched or completed!');
    if VBOrdHdr.State in [dsInsert, dsEdit] then
    begin
      VBOrdDetGrid.SelectedField := VBOrdDetVBStru;
      if VBPickDlgForm.ShowModalVBType = mrOk then
      begin
        VBOrdDet.Edit;
        VBOrdDetGrid.SelectedField := VBOrdDetVBStru;
        VBOrdDetVBStru.Value:=VBPickDlgForm.VBStru;
        VBOrdDetGrid.SelectedField := VBOrdDetVBCol;
        VBOrdDetVBCol.Value:=VBPickDlgForm.VBCol;
        VBOrdDetGrid.SelectedField := VBOrdDetVBFin;
        VBOrdDetVBFin.Value:=VBPickDlgForm.VBFin;
      end;
    end
    else
      raise Exception.Create('Must be in edit or insert mode to search');
  end
  else
    ShowMessage('Cannot search when called by another program!');
  Screen.Cursor:=crDefault;
end;

procedure TVBOrdHdrForm.RedisplayWidths;
begin
end;

procedure TVBOrdHdrForm.VBOrdDetVBWIDTHValidate(Sender: TField);
begin
  if (VBOrdDetQtyAlloc.Value<>0) or (VBOrdDetQtyDel.Value<>0) then
    raise Exception.Create('Cannot modify as already picked or despatched')
  else
    RedisplayWidths;
end;

procedure TVBOrdHdrForm.VBOrdDetVBCOLValidate(Sender: TField);
begin
  if (VBOrdDetQtyAlloc.Value<>0) or (VBOrdDetQtyDel.Value<>0) then
    raise Exception.Create('Cannot modify as already picked or despatched')
  else
    RedisplayWidths;
end;

procedure TVBOrdHdrForm.VBOrdDetVBSTRUValidate(Sender: TField);
begin
  if (VBOrdDetQtyAlloc.Value<>0) or (VBOrdDetQtyDel.Value<>0) then
    raise Exception.Create('Cannot modify as already picked or despatched')
  else
    RedisplayWidths;
end;

procedure TVBOrdHdrForm.PrintOrderSpdBtnClick(Sender: TObject);
const
  Spacer = '           ';
begin
  if VBOrdHdr.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel or Save before printing',mtInformation, [mbOK], 0);
  end
  else
  with CustomerPrinter do          //JT140798
  begin
    SubTitles.Clear;
    SubTitles.Add(
      ' VT Order No:  ' + VBOrdHdrVTORDNO.AsString + Spacer +
      ' Customer Ref:  ' + VBOrdHdrCUSTREF.AsString + Spacer +
      ' Order Date:  ' + VBOrdHdrORDDATE.AsString);
    SubTitles.Add(
      ' Cust Order No:  ' + VBOrdHdrCUSTORDNO.AsString + Spacer +
      ' Cust Descr:  ' + SupplierSUPDESCR.AsString);
    SubTitles.Add(
      ' Credit Limit:  ' + SupplierCRLIMIT.AsString + Spacer +
      ' Price Type:  ' + VBOrdHdrPRICETYPE.AsString + Spacer +
      ' Finish: ' + VBFinComboBox.Text);
    SubTitles.Add(
      ' Date Rcvd:  ' + VBOrdHdrDATERCVD.AsString + Spacer +
      ' Rcvd By:  ' + VBOrdHdrRCVDBY.AsString);
    Print;
  end;
(*begin
    {turn off fields of no value}
    Label13.Visible:=false;
    EditMakeDate.Visible:=false;
    Label14.Visible:=false;
    Label15.Visible:=false;
    Label16.Visible:=false;
    Label17.Visible:=false;
    Label18.Visible:=false;
    Label8.Visible:=false;
    Label11.Visible:=false;
    EditWWIP.Visible:=false;
    EditVWIP.Visible:=false;
    EditFWIP.Visible:=false;
    EditFWStk.Visible:=false;
    EditFWOrd.Visible:=false;
    VBTypeSrchSpdBtn.Visible:=false;
    DBNavigator.Visible:=false;
    PostBtn.Visible:=false;
    CancelBtn.Visible:=false;
    CloseBitBtn.Visible:=false;
    EditColorDescr.Visible:=false;
    PrintSpdBtn.Visible:=false;
    OrderSearchSpdBtn.Visible:=false;
    CustSearchSpdBtn.Visible:=false;
    DateSearchSpdBtn.Visible:=false;
    Label23.Visible:=false;
    Label24.Visible:=false;
    Edit89Stk.Visible:=false;
    Edit127Stk.Visible:=false;
    Edit89Ord.Visible:=false;
    Edit127Ord.Visible:=false;
    EditFWAlloc.Visible:=false;
    Edit89Alloc.Visible:=false;
    Edit127Alloc.Visible:=false;
    Label22.Visible:=false;
    Label10.Visible:=false;
    EditFWRemain.Visible:=false;
    Edit89Remain.Visible:=false;
    Edit127Remain.Visible:=false;
    Label19.Visible:=false;
    EditFWMin.Visible:=false;
    Edit89Min.Visible:=false;
    Edit127Min.Visible:=false;
    Print;
    {turn fields back on}
    Label13.Visible:=true;
    EditMakeDate.Visible:=true;
    Label14.Visible:=true;
    Label15.Visible:=true;
    Label16.Visible:=true;
    Label17.Visible:=true;
    Label18.Visible:=true;
    Label8.Visible:=true;
    Label11.Visible:=true;
    EditWWIP.Visible:=true;
    EditVWIP.Visible:=true;
    EditFWIP.Visible:=true;
    EditFWStk.Visible:=true;
    EditFWOrd.Visible:=true;
    VBTypeSrchSpdBtn.Visible:=true;
    DBNavigator.Visible:=true;
    PostBtn.Visible:=true;
    CancelBtn.Visible:=true;
    CloseBitBtn.Visible:=true;
    EditColorDescr.Visible:=true;
    PrintSpdBtn.Visible:=true;
    OrderSearchSpdBtn.Visible:=true;
    CustSearchSpdBtn.Visible:=true;
    DateSearchSpdBtn.Visible:=true;
    Label23.Visible:=true;
    Label24.Visible:=true;
    Edit89Stk.Visible:=true;
    Edit127Stk.Visible:=true;
    Edit89Ord.Visible:=true;
    Edit127Ord.Visible:=true;
    EditFWAlloc.Visible:=true;
    Edit89Alloc.Visible:=true;
    Edit127Alloc.Visible:=true;
    Label22.Visible:=true;
    Label10.Visible:=true;
    EditFWRemain.Visible:=true;
    Edit89Remain.Visible:=true;
    Edit127Remain.Visible:=true;
    Label19.Visible:=true;
    EditFWMin.Visible:=true;
    Edit89Min.Visible:=true;
    Edit127Min.Visible:=true;
  end;*)
end;

procedure TVBOrdHdrForm.VBOrdHdrSourceDataChange(Sender: TObject;
  Field: TField);
var
  FindUse:boolean; {set true if alloc,despatch or completed line}
begin
  if VBOrdDet.Active then
  begin
    if LastCompleteOrdNo<>VBOrdHdrVTOrdNo.Value then
    begin {do checks, eg:check if any completed order lines on this order}
      LastCompleteOrdNo:=VBOrdHdrVTOrdNo.Value;
      FindUse:=false;
      VBOrdDet.First;
      if VBOrdDet.BOF<>VBOrdDet.EOF then
      begin
        EditCustRef.ReadOnly:=true;
        EditCustRef.Color:=clSilver;
        EditOrdDate.ReadOnly:=true;
        EditOrdDate.Color:=clSilver;
        CustSearchSpdBtn.Enabled:=false;
        DateSearchSpdBtn.Enabled:=false;
      end
      else
      begin
        EditCustRef.ReadOnly:=false;
        EditCustRef.Color:=clWindow;
        EditOrdDate.ReadOnly:=false;
        EditOrdDate.Color:=clWindow;
        CustSearchSpdBtn.Enabled:=true;
        DateSearchSpdBtn.Enabled:=true;
      end;
//      VBOrdDet.First;
//      while not VBOrdDet.EOF do
//      begin
//        if {(VBOrdDetQtyAlloc.Value<>0) or (VBOrdDetQtyDel.Value<>0) or}
//           (VBOrdDetStatus.Value='C') then
//        begin
//          FindUse:=true;
//          break;
//        end;
//        VBOrdDet.Next;
//      end;
      CheckLineCompleteQuery.Close;
      CheckLineCompleteQuery.Params[0].AsInteger:=VBOrdHdrVTOrdNo.Value;
      CheckLineCompleteQuery.Open;
      if CheckLineCompleteQuery.Fields[0].AsInteger>0 then
        FindUse:=true;
      CheckLineCompleteQuery.Close;
      if FindUse then
      begin
        EditPriceType.ReadOnly:=true;
        EditPriceType.Color:=clSilver;
      end
      else
      begin
        EditPriceType.ReadOnly:=false;
        EditPriceType.Color:=clWindow;
      end;
      VBOrdDet.First;
    end;
  end;
end;

procedure TVBOrdHdrForm.VBOrdDetAfterDelete(DataSet: TDataSet);
begin
  VBOrdHdrSourceDataChange(Self,nil);
end;

procedure TVBOrdHdrForm.VBOrdDetAfterInsert(DataSet: TDataSet);
begin
{  VBOrdHdrSourceDataChange(Self,nil);}
end;

procedure TVBOrdHdrForm.VBOrdDetDATERQDValidate(Sender: TField);
begin
  if (VBOrdDetQtyAlloc.Value<>0) or (VBOrdDetQtyDel.Value<>0) then
    raise Exception.Create('Cannot modify as already picked or despatched')
  else
    if VBOrdDetDateRqd.Value>VBOrdDetEstDate.Value then
      VBOrdDetEstDate.Value:=VBOrdDetDateRqd.Value;
end;

procedure TVBOrdHdrForm.VBOrdDetESTDATEValidate(Sender: TField);
begin
  if VBOrdDetEstDate.Value<VBOrdDetDateRqd.Value then
    raise Exception.Create('Estimated Date must be >= DateRequired');
end;

procedure TVBOrdHdrForm.VBOrdDetQTYValidate(Sender: TField);
begin
  if (VBOrdDetQtyAlloc.Value<>0) or (VBOrdDetQtyDel.Value<>0) then
    if (VBOrdDetQty.Value<VBOrdDetQtyAlloc.Value) or
      (VBOrdDetQty.Value<VBOrdDetQtyDel.Value) then
      raise Exception.Create('Qty cannot be made less than picked or despatched qty');
end;

procedure TVBOrdHdrForm.FindFastNextIncompleteSpnBtnClick(Sender: TObject);
begin
  if VBOrdHdr.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    VBOrdDet.DisableControls;
    try
      FindFastQuery.Close;
      FindFastQuery.Params[0].AsInteger:=VBOrdHdrVTOrdNo.Value;
      FindFastQuery.Open;
      if FindFastQuery.BOF=FindFastQuery.EOF then
        ShowMessage('No more outstanding orders after this one')
      else
      begin
        VBOrdHdr.SetKey;
        VBOrdHdr.FieldByName('VTOrdNo').AsInteger:=FindFastQueryVTOrdNo.Value;
        VBOrdHdr.GotoKey;
      end
    finally
      VBOrdDet.EnableControls;
    end;
  end;
  FindFastQuery.Close;
  Screen.Cursor:=crDefault;
end;

procedure TVBOrdHdrForm.VBOrdDetGridDblClick(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  VBPickDlgForm.ShowModalDespatches(VBOrdDetVTOrdNo.AsInteger,
    VBOrdDetVBStru.Value,VBOrdDetVBCol.Value,
    VBOrdDetVBWidth.Value,VBOrdDetDateRqd.Value);
  Screen.Cursor:=crDefault;
end;

procedure TVBOrdHdrForm.FormResize(Sender: TObject);
begin
  if VBOrdHdrForm.WindowState=wsMinimized then
    Application.Minimize;
end;

procedure TVBOrdHdrForm.CustOrdSearchSpdBtnClick(Sender: TObject);
begin
  if PassValue=0 then
  begin
    if VBOrdHdr.State in [dsInsert, dsEdit] then
      ShowMessage('Cannot search when in Receive or Edit Mode')
    else
      if VBPickDlgForm.ShowModalVTOrderNo(1) = mrOk then {CU for customers}
      begin
        VBOrdHdr.SetKey;
        VBOrdHdr.FieldByName('VTOrdNo').AsInteger:=VBPickDlgForm.VTOrderNo;
        VBOrdHdr.GotoKey;
      end;
  end
  else
    ShowMessage('Cannot search when called by another program!');
  Screen.Cursor:=crDefault;
end;

procedure TVBOrdHdrForm.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button=nbRefresh) and (VBOrdHdr.State in [dsInsert, dsEdit]) then
  begin
    ShowMessage('Cannot refresh while in Insert or Edit Mode');
    Abort;
  end;
end;

procedure TVBOrdHdrForm.Edit127OrdDblClick(Sender: TObject);
begin
  if MessageDlg('127 Orders: Show All (or Total By Held)?  Yes for All; No for Total By Held.',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    VBPickDlgForm.ShowModalVTOrderNoEnq(VBOrdDetVBStru.Value,VBOrdDetVBCol.Value,
      VBOrdDetVBFin.Value,16) {DL100198}
  else //Held Totals added DL151199
    VBPickDlgForm.ShowModalVTOrderNoEnqTotals(VBOrdDetVBStru.Value,VBOrdDetVBCol.Value,
      VBOrdDetVBFin.Value,16); {DL100198}
  Screen.Cursor:=crDefault;
end;

procedure TVBOrdHdrForm.Edit89OrdDblClick(Sender: TObject);
begin
  if MessageDlg('89 Orders: Show All (or Total By Held)?  Yes for All; No for Total By Held.',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    VBPickDlgForm.ShowModalVTOrderNoEnq(VBOrdDetVBStru.Value,VBOrdDetVBCol.Value,
      VBOrdDetVBFin.Value,23) {DL100198}
  else
    VBPickDlgForm.ShowModalVTOrderNoEnqTotals(VBOrdDetVBStru.Value,VBOrdDetVBCol.Value,
      VBOrdDetVBFin.Value,23); {DL100198}
  Screen.Cursor:=crDefault;
end;

procedure TVBOrdHdrForm.EditFWOrdDblClick(Sender: TObject);
begin
  if MessageDlg('FW Orders: Show All (or Total By Held)?  Yes for All; No for Total By Held.',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    VBPickDlgForm.ShowModalVTOrderNoEnq(VBOrdDetVBStru.Value,VBOrdDetVBCol.Value,
      VBOrdDetVBFin.Value,1) {DL100198} // 1 was 2070 DL030215
  else
    VBPickDlgForm.ShowModalVTOrderNoEnqTotals(VBOrdDetVBStru.Value,VBOrdDetVBCol.Value,
      VBOrdDetVBFin.Value,1); {DL100198} // 1 was 2070 DL030215
  Screen.Cursor:=crDefault;
end;


procedure TVBOrdHdrForm.VBOrdDetGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if VBOrdDet.FieldByName('Status').AsString<>'C' then
  begin
    VBOrdDetGrid.Canvas.Font.Color:=clRed;
    VBOrdDetGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TVBOrdHdrForm.PrintFormSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TVBOrdHdrForm.VBOrdDetGridCellClick(Column: TColumn);
begin
{  if Column.Title.Caption = 'Stru' then
    ShowMessage('Stru')
  else
    ShowMessage('Not stru');}
end;

procedure TVBOrdHdrForm.btnVBEnqClick(Sender: TObject);
begin
  PassString:=VBOrdDetVBSTRU.AsString+VBOrdDetVBCOL.AsString+
    VBOrdDetVBFIN.AsString;
  VBEnqForm:=TVBEnqForm.Create(Application);
  VBEnqForm.Show;
end;

procedure TVBOrdHdrForm.EditFWStkDblClick(Sender: TObject);
begin
  VBPickDlgForm.ShowModalVTStockEnq(VBOrdDetVBStru.Value,VBOrdDetVBCol.Value,
    VBOrdDetVBFin.Value,1); // added DL110599 - 1 was 2070 DL030215
  Screen.Cursor:=crDefault;
end;

procedure TVBOrdHdrForm.Edit89StkDblClick(Sender: TObject);
begin
  VBPickDlgForm.ShowModalVTStockEnq(VBOrdDetVBStru.Value,VBOrdDetVBCol.Value,
    VBOrdDetVBFin.Value,23); // added DL110599 - 23 was 89 DL030215
  Screen.Cursor:=crDefault;
end;

procedure TVBOrdHdrForm.Edit127StkDblClick(Sender: TObject);
begin
  VBPickDlgForm.ShowModalVTStockEnq(VBOrdDetVBStru.Value,VBOrdDetVBCol.Value,
    VBOrdDetVBFin.Value,16); // added DL110599 - 16 was 127 DL030215
  Screen.Cursor:=crDefault;
end;

procedure TVBOrdHdrForm.VBMakeSourceDataChange(Sender: TObject;
  Field: TField);
begin
  //modified DL25102000 to use Discontinued flag in VBMake_Fin
  if VBMake_FinDISCON127.AsString='Y' then
  begin
    EditFWOrd.Font.Color:=clRed;
    Edit89Ord.Font.Color:=clRed;
    Edit127Ord.Font.Color:=clRed;
  end
  else
  begin
    EditFWOrd.Font.Color:=clBlack;
    Edit89Ord.Font.Color:=clBlack;
    Edit127Ord.Font.Color:=clBlack;
  end;

  {qryStockMin.Close;
  qryStockMin.ParamByName('VBStru').AsString:=
      VBOrdDetVBSTRU.AsString;
  qryStockMin.ParamByName('VBCol').AsString:=
      VBOrdDetVBCOL.AsString;
  qryStockMin.ParamByName('VBFin').AsString:=
      VBOrdDetVBFIN.AsString;
  //qryStockMin.ParamByName('VBWidth').AsInteger:=
  //    VBOrdDetVBWIDTH.AsInteger;
  qryStockMin.Open;
  if not qryStockMinSALEGROUP.IsNull then
  begin
    if qryStockMinSALEGROUP.AsString='DISCON' then
    begin
      EditFWOrd.Font.Color:=clRed;
      Edit89Ord.Font.Color:=clRed;
      Edit127Ord.Font.Color:=clRed;
    end
    else
    begin
      EditFWOrd.Font.Color:=clBlack;
      Edit89Ord.Font.Color:=clBlack;
      Edit127Ord.Font.Color:=clBlack;
    end;
  end
  else
  begin
    EditFWOrd.Font.Color:=clBlack;
    Edit89Ord.Font.Color:=clBlack;
    Edit127Ord.Font.Color:=clBlack;
  end;}
end;

end.
