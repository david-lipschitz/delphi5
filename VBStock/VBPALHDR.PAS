unit Vbpalhdr;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, Mask, ExtCtrls,
  DBLookup, Buttons, Dialogs, Menus, ODDBFind;

type
  TVBPalHdrForm = class(TForm)
    ScrollBox: TScrollBox;
    EditDESPNO: TDBEdit;
    Label3: TLabel;
    EditDESPDATE: TDBEdit;
    Label4: TLabel;
    EditBoxes: TDBEdit;
    Label6: TLabel;
    EditNetLength: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    EditWAYBILLNO: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    VBDespHdrSource: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    VBDespHdr: TTable;
    VBDespHdrDESPNO: TIntegerField;
    VBDespHdrCUSTREF: TStringField;
    VBDespHdrDESPDATE: TDateTimeField;
    VBDespHdrDESPBY: TStringField;
    VBDespHdrBOXES: TSmallintField;
    VBDespHdrTRANSBY: TStringField;
    Label9: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    EditTransBy: TDBLookupCombo;
    Label11: TLabel;
    Agent: TTable;
    AgentSource: TDataSource;
    CloseBitBtn: TBitBtn;
    CalSpdBtn: TSpeedButton;
    ModeIndicator: TLabel;
    ActiveSource: TDataSource;
    PostBtn: TButton;
    CancelBtn: TButton;
    VBPalletGrid: TDBGrid;
    CustSpdBtn: TSpeedButton;
    EditCustRef: TDBEdit;
    VBDespHdrWAYBILLNO: TStringField;
    VBDespHdrSEALS: TStringField;
    VBDespHdrCONTREF: TStringField;
    VBDespHdrVTCONTREF: TStringField;
    VBDespHdrEXPORTER: TStringField;
    EditVTContRef: TDBEdit;
    EditContRef: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EditSeals: TDBEdit;
    Label15: TLabel;
    EditExporterCombo: TDBLookupCombo;
    InvFrom: TTable;
    InvFromSource: TDataSource;
    VBDespHdrCUSTORDNO: TStringField;
    EditCustOrNo: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DespSearchSpdBtn: TSpeedButton;
    VBDespHdrDESPSENT: TStringField;
    EditDespSent: TDBCheckBox;
    EditDespBy: TDBEdit;
    Panel4: TPanel;
    Label2: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    EditPalletBarCode: TEdit;
    ShowPalletNumber: TEdit;
    PalletQuery: TQuery;
    PalletQuerySource: TDataSource;
    PalletQueryDESPNO: TIntegerField;
    PalletQueryPALLETNO: TIntegerField;
    PalletQueryYnNetSum: TFloatField;
    PalletQueryBoxesCount: TIntegerField;
    TotalsQuery: TQuery;
    CheckPalletExistsQuery: TQuery;
    CheckPalletExistsQueryPALLETNO: TIntegerField;
    CheckPalletExistsQueryDESPNO: TIntegerField;
    Label21: TLabel;
    VBDespHdrPALLETS: TSmallintField;
    EditPallets: TDBEdit;
    InvFromPOSTALADD1: TStringField;
    InvFromPOSTALADD2: TStringField;
    InvFromPOSTALADD3: TStringField;
    InvFromPOSTALADD4: TStringField;
    InvFromPOSTALADD5: TStringField;
    InvFromPHONENO: TStringField;
    InvFromFAXNO: TStringField;
    InvFromINVREF: TStringField;
    InvFromDESCR: TStringField;
    VBDespHdrNETLENGTHDESP: TFloatField;
    AgentAGENTREF: TStringField;
    AgentDESCR: TStringField;
    PalletQueryVBSTRU: TStringField;
    PalletQueryVBCOL: TStringField;
    PalletQueryLOTNO: TIntegerField;
    PalletQueryQLTY: TStringField;
    TotalsQuerySUM: TFloatField;
    TotalsQueryCOUNT: TIntegerField;
    UpdateVBRcptQuery: TQuery;
    Label22: TLabel;
    PalletQueryCOUNT_1: TIntegerField;
    TotalsQueryCOUNT_1: TIntegerField;
    PalletQueryMETRICWIDTH: TSmallintField;
    MyQuery: TQuery;
    UpdateVBOrdDetQuery: TQuery;
    PreviewBtn: TButton;
    VBDespHdrPHYSICALPALLETS: TSmallintField;
    Label5: TLabel;
    EditPhysicalPallets: TDBEdit;
    Label23: TLabel;
    EditWayBillNo2: TDBEdit;
    VBDespHdrWAYBILLNO2: TStringField;
    DisplayDetBitBtn: TBitBtn;
    btnPrintInvoice: TButton;
    VBDespHdrINVDATE: TDateTimeField;
    Label24: TLabel;
    EditInvDate: TDBEdit;
    InvDateSpdBtn: TSpeedButton;
    PalletQueryVBFIN: TStringField;
    spdDespByDate: TSpeedButton;
    GenDespNoProc: TStoredProc;
    PrintSpdBtn: TSpeedButton;
    VBDespHdrCONSIGNMENT: TStringField;
    CkbxConsignment: TDBCheckBox;
    ODFindMenu1: TODFindMenu;
    VBDespHdrIGNOREINMINCALC: TStringField;
    cbxIgnoreInMinCalc: TDBCheckBox;
    Panel5: TPanel;
    datDespDet: TDataSource;
    dbgDespDet: TDBGrid;
    qryDespDet: TQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField3: TIntegerField;
    StringField4: TStringField;
    SmallintField1: TSmallintField;
    FloatField1: TFloatField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    qryDespDetTotals: TQuery;
    qryDespDetTotalsSUM: TFloatField;
    qryDespDetTotalsCOUNT: TIntegerField;
    qryDespDetTotalsCOUNT_1: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure CalSpdBtnClick(Sender: TObject);
    procedure VBDespHdrSourceStateChange(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure VBPalletGridExit(Sender: TObject);
    procedure VBDespHdrBeforeClose(DataSet: TDataset);
    procedure VBDespHdrAfterPost(DataSet: TDataset);
    procedure CustSpdBtnClick(Sender: TObject);
    procedure VBDespHdrBeforeInsert(DataSet: TDataset);
    procedure VBDespHdrBeforeCancel(DataSet: TDataset);
    procedure VBDespHdrAfterCancel(DataSet: TDataset);
    procedure VBDespHdrBeforeDelete(DataSet: TDataset);
    procedure VBDespHdrNewRecord(DataSet: TDataset);
    procedure SortBtnClick(Sender: TObject);
    procedure DespSearchSpdBtnClick(Sender: TObject);
    procedure VBDespHdrBeforeEdit(DataSet: TDataset);
    procedure EditPalletBarCodeChange(Sender: TObject);
    procedure EditDESPNOChange(Sender: TObject);
    procedure PalletQueryCalcFields(DataSet: TDataset);
    procedure VBDespHdrDESPSENTChange(Sender: TField);
    procedure VBDespHdrAfterDelete(DataSet: TDataSet);
    procedure VBDespHdrDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure PreviewBtnClick(Sender: TObject);
    procedure DisplayDetBitBtnClick(Sender: TObject);
    procedure btnPrintInvoiceClick(Sender: TObject);
    procedure InvDateSpdBtnClick(Sender: TObject);
    procedure EditDESPDATEExit(Sender: TObject);
    procedure spdDespByDateClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure EditDespSentClick(Sender: TObject);
  private
    { private declarations }
    NoCommit: Boolean;
    CancelInProgress : Boolean;
    DeleteDets : Boolean;
    PalletBarCodeType,PalletNo:integer;
    Closing:boolean;  {set true when form is closing}
    RedisplayOk:boolean; {added DL300197 so that search can take place}
    PixelsInInchx: integer;       { Stores Pixels per inch }
    LineHeight: Integer;          { Stores the line height }
    AmountPrinted: integer;       { Stores amount, in pixels, printed on a page }
    TenthsOfInchPixelsY: integer; { Pixels in 1/10 of an inch used for line spacing }
    Inserting:boolean; //added DL230400
    procedure DeleteItems;
    procedure RedisplayQueries;
//    procedure PrintLine(Items: TStringList);
//   procedure PrintWaybill;
  public
    { public declarations }
  end;

var
  VBPalHdrForm: TVBPalHdrForm;

implementation

uses VBMain, PickDate, VBUtils, VBModal, Printers;

{$R *.DFM}

procedure TVBPalHdrForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VBDespHdr.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post this despatch before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  VBDespHdr.Close;
  VBPalHdrForm.Release;
end;

procedure TVBPalHdrForm.FormShow(Sender: TObject);
begin
  Inserting:=false; //added DL230400
  RedisplayOK:=false;
  DisplayDetBitBtn.Caption:='Display Details';
  DisplayDetBitBtn.Enabled:=true;
  qryDespDet.Close; //added DL030210
  PalletQuery.Close;
  TotalsQuery.Close;
  qryDespDetTotals.Close; //added DL030210
{  TotalBoxCountQuery.Close;}
{  PalletBoxCountQuery.Close;}
  UpdateVBRcptQuery.Close;
  CheckPalletExistsQuery.Close;

  VBDespHdr.Open;
{  VBRcpt.Open;}
  Agent.Open;
  InvFrom.Open;
//VBNextNo.Open;  //JT 110698   replaced by GenDespNoProc
{  MainForm.Database.StartTransaction;}
  VBDespHdr.Refresh;
{  VBRcpt.Refresh;}
  Agent.Refresh;
  InvFrom.Refresh;
//VBNextNo.Refresh;    //JT 110698   replaced by GenDespNoProc
  CancelInProgress:=false;
  NoCommit:=false;
  DeleteDets:=false;
  Closing:=false;
  if ((UserInitials='SYS') or (UserInitials='SJ')
    or (UserInitials='PB')) then
  begin
    EditInvDate.Color:=clWindow;
    EditInvDate.ReadOnly:=false;
    CkbxConsignment.ReadOnly := False; //JT200798
  end;
end;

procedure TVBPalHdrForm.CloseBitBtnClick(Sender: TObject);
begin
  Closing:=true;
  qryDespDet.Close; //added DL030210
  PalletQuery.Close;
  TotalsQuery.Close;
  qryDespDetTotals.Close; //added DL030210
  UpdateVBRcptQuery.Close;
  CheckPalletExistsQuery.Close;
  Close;
end;

procedure TVBPalHdrForm.CalSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=VBDespHdrDespDate.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    VBDespHdr.Edit;
    VBDespHdrDespDate.Value:=BRDateForm.Date;
    EditDespDate.SetFocus;
  end;
end;

procedure TVBPalHdrForm.VBDespHdrSourceStateChange(Sender: TObject);
begin
  if Closing then
    Exit;
  PostBtn.Enabled := VBDespHdr.State in [dsEdit, dsInsert];
//CancelBtn.Enabled := PostBtn.Enabled;
// Cannot cancel an insert so that generated DespNo sequence not lost
// - causes problems in accounting. User must insert blank row instead
  CancelBtn.Enabled := VBDespHdr.State in [dsEdit];  //JT020798
  CloseBitBtn.Enabled := VBDespHdr.State = dsBrowse;
  //PrintBtn.Enabled:=CloseBitBtn.Enabled; {can only print after save or cancel} - removed DL030203
  if VBDespHdr.State in [dsEdit, dsInsert] then
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

procedure TVBPalHdrForm.PostBtnClick(Sender: TObject);
begin
  if (VBDespHdrCustRef.AsString='ADJUST') and (VBDespHdrDespSent.AsString='Y') then
    if (UserInitials<>'SJ') and (UserInitials<>'PB') and (UserInitials<>'SYS') then
    begin
      VBDespHdrDespSent.AsString:='N';
      raise Exception.Create('Only Susan, Paul and System Adminstrator can confirm a despatch to adjust');
    end;
  EditPalletBarCode.Clear;
  ShowPalletNumber.Clear;
  VBDespHdr.Post;
  DisplayDetBitBtn.Enabled:=true;  
end;

procedure TVBPalHdrForm.CancelBtnClick(Sender: TObject);
begin
  EditPalletBarCode.Clear;
  ShowPalletNumber.Clear;
  VBDespHdr.Cancel;
  DisplayDetBitBtn.Enabled:=true;
end;

procedure TVBPalHdrForm.VBPalletGridExit(Sender: TObject);
begin
  ActiveSource.DataSet := VBDespHdr;
end;

procedure TVBPalHdrForm.VBDespHdrBeforeClose(DataSet: TDataset);
begin
{  VBRcpt.Close;}
  Agent.Close;
  InvFrom.Close;
//VBNextNo.Close;    //JT 110698   replaced by GenDespNoProc
end;

procedure TVBPalHdrForm.VBDespHdrAfterPost(DataSet: TDataset);
begin
  if not NoCommit then {xx redundant?}
  begin
    MainForm.Database.Commit;
{    MainForm.Database.StartTransaction;}
    //refresh the bottom queries - added DL030210
    PalletQuery.Close;
    qryDespDet.Close;
    PalletQuery.ParamByName('DespNo').AsInteger:=VBDespHdrDESPNO.AsInteger;
    qryDespDet.ParamByName('DespNo').AsInteger:=VBDespHdrDESPNO.AsInteger;
    PalletQuery.Open;
    qryDespDet.Open;
  end;
end;

procedure TVBPalHdrForm.CustSpdBtnClick(Sender: TObject);
begin
  if VBPickDlgForm.ShowModalSups('CU') = mrOk then {CU for customers}
    VBDespHdrCustRef.AsString:=VBPickDlgForm.SupRef;
  Screen.Cursor:=crDefault;
end;

procedure TVBPalHdrForm.VBDespHdrBeforeInsert(DataSet: TDataset);
begin
  if VBDespHdr.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('A despatch is being processed. Post changes before inserting new despatch?',
      mtInformation, mbOKCancel, 0) = mrOK then
        VBDespHdr.Post
    else
      Abort;
  end;
  MainForm.Database.StartTransaction;
end;

procedure TVBPalHdrForm.VBDespHdrBeforeCancel(DataSet: TDataset);
begin
  CancelInProgress:=true;
  if (VBDespHdr.State=dsInsert) {and not (APOrdDet.BOF and APOrdDet.EOF)} then
    if MessageDlg('Cancel despatch being inserted and delete all line items?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TVBPalHdrForm.VBDespHdrAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  VBDespHdr.Refresh;
//VBNextNo.Refresh;    //JT 110698   replaced by GenDespNoProc
  {RedisplayQueries;}
  CancelInProgress:=false;
end;

procedure TVBPalHdrForm.DeleteItems;
begin
  DeleteDets := true;
  {remove all the pallets from the despatch}
  {ie set the despatch number to zero}
  {no need to modify YarnType.Instock as not yet changed}
end;

procedure TVBPalHdrForm.VBDespHdrBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete despatch and line items?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
  DeleteItems;
end;

procedure TVBPalHdrForm.VBDespHdrNewRecord(DataSet: TDataset);
begin
(*{find next despatch number}  //JT 110698 replaced by generator below
  if VBNextNo.FindKey([NextDespNoRef]) then
  begin
    VBNextNo.Edit;
    VBDespHdrDespNo.Value:=VBNextNoNextNo.Value;
    VBDespHdrDespSent.Value:='N';
    VBNextNoNextNo.Value:=VBNextNoNextNo.Value+1;
    VBNextNo.Post;
    EditDespBy.ReadOnly:=false;
    VBDespHdrDespBy.Value:=UserInitials;
    EditDespBy.ReadOnly:=true;
    VBDespHdrDespDate.Value:=date;
  end
  else
  begin
    {duplicate key set here for safety so that a YnDespHdr}
    {Post causes an error}
    VBDespHdrDespNo.Value:=1;
    ShowMessage('Problem getting next Despatch Number.  Please call David');
  end;*)
  GenDespNoProc.ExecProc;        //JT 110698  generate DespNo
  VBDespHdrDespNo.Value := GenDespNoProc.Params[0].AsInteger;
  Inserting:=true; //added DL230400
  VBDespHdrDespSent.Value:='N';
  Inserting:=false; //added DL230400
  EditDespBy.ReadOnly:=false;
  VBDespHdrDespBy.Value:=UserInitials;
  EditDespBy.ReadOnly:=true;
  VBDespHdrDespDate.Value:=date;
  VBDespHdrConsignment.Value:='N';
end;

procedure TVBPalHdrForm.SortBtnClick(Sender: TObject);
begin
{  if SortBtn.Caption='Don''t Sort' then
  begin
    alter index RDB$PRIMARY121 inactive;
    SortBtn.Caption:='Sort';
  end
  else
  begin
    alter index RDB$PRIMARY121 active;
    SortBtn.Caption:='Don''t Sort ';
  end;}
end;

procedure TVBPalHdrForm.DespSearchSpdBtnClick(Sender: TObject);
begin
  if VBPickDlgForm.ShowModalVBDesp = mrOk then
  begin
    qryDespDet.Close; //added DL030210
    PalletQuery.Close; {added DL300197}
    TotalsQuery.Close; {added DL300197}
    qryDespDetTotals.Close; //added DL030210
    RedisplayOK:=false;
    DisplayDetBitBtn.Caption:='Display Details';
    DisplayDetBitBtn.Enabled:=true;
    VBDespHdr.SetKey;
    VBDespHdr.FieldByName('DespNo').AsInteger:=VBPickDlgForm.VBDespHdrDespNo;
    VBDespHdr.GotoKey;
  end;
  Screen.Cursor:=crDefault;
end;

procedure TVBPalHdrForm.VBDespHdrBeforeEdit(DataSet: TDataset);
begin
  if (VBDespHdrDespSent.Value='Y') then
  begin
    if ((UserInitials='SYS') or (UserInitials='SJ')
      or (UserInitials='PB')) then
    begin
      EditInvDate.Color:=clWindow;
      EditInvDate.ReadOnly:=false;
      EditDespDate.Color:=clSilver;
      EditDespDate.ReadOnly:=true;
      EditExporterCombo.Color:=clSilver;
      EditExporterCombo.ReadOnly:=true;
      EditCustRef.Color:=clSilver;
      EditCustRef.ReadOnly:=true;
      EditTransBy.Color:=clSilver;
      EditTransBy.ReadOnly:=true;
      EditWaybillNo.Color:=clSilver;
      EditWaybillNo.ReadOnly:=true;
      EditWaybillNo2.Color:=clSilver;
      EditWaybillNo2.ReadOnly:=true;
      EditVTContRef.Color:=clSilver;
      EditVTContRef.ReadOnly:=true;
      EditContRef.Color:=clSilver;
      EditContRef.ReadOnly:=true;
      EditSeals.Color:=clSilver;
      EditSeals.ReadOnly:=true;
      EditPhysicalPallets.Color:=clSilver;
      EditPhysicalPallets.ReadOnly:=true;
      EditDespSent.Color:=clSilver;
      EditDespSent.ReadOnly:=true;
      EditPalletBarCode.Color:=clSilver;
      EditPalletBarCode.ReadOnly:=true;
    end
    else
    begin
      ShowMessage('Cannot edit a despatch already sent.');
      Abort;
    end;
  end
  else
  begin
    EditDespDate.Color:=clWindow;
    EditDespDate.ReadOnly:=false;
    EditExporterCombo.Color:=clWindow;
    EditExporterCombo.ReadOnly:=false;
    EditCustRef.Color:=clWindow;
    EditCustRef.ReadOnly:=false;
    EditTransBy.Color:=clWindow;
    EditTransBy.ReadOnly:=false;
    EditWaybillNo.Color:=clWindow;
    EditWaybillNo.ReadOnly:=false;
    EditWaybillNo2.Color:=clWindow;
    EditWaybillNo2.ReadOnly:=false;
    EditVTContRef.Color:=clWindow;
    EditVTContRef.ReadOnly:=false;
    EditContRef.Color:=clWindow;
    EditContRef.ReadOnly:=false;
    EditSeals.Color:=clWindow;
    EditSeals.ReadOnly:=false;
    EditPhysicalPallets.Color:=clWindow;
    EditPhysicalPallets.ReadOnly:=false;
    EditDespSent.Color:=clWindow;
    EditDespSent.ReadOnly:=false;
    EditPalletBarCode.Color:=clWindow;
    EditPalletBarCode.ReadOnly:=false;
  end;
  if not RedisplayOK then
  begin
    RedisplayOK:=true;
    RedisplayQueries;
  end;
  DisplayDetBitBtn.Caption:='Hide Details';
  DisplayDetBitBtn.Enabled:=false;
  MainForm.Database.StartTransaction;  
end;

procedure TVBPalHdrForm.EditPalletBarCodeChange(Sender: TObject);
var
  RemovePallet:boolean;
begin
  if length(EditPalletBarCode.Text)>0 then
    if VBDespHdrDespSent.Value='Y' then
    begin
      ShowMessage('Cannot edit a despatch already sent.');
      EditPalletBarCode.Clear;
      Exit;
    end;
  if length(EditPalletBarCode.Text)<>8 then {8 is smallest barcode length}
    Exit
  else
  begin
    {next line was DLCopyStr}
    PalletBarCodeType:=strtoint(Copy(EditPalletBarCode.Text,1,2));
    if (PalletBarCodeType<>18) then
    begin
      ShowMessage('Invalid Bar Code Type.  Re-enter.');
      Exit;
    end;
  end;
  {find out if pallet exists}
  PalletNo:=strtoint(Copy(EditPalletBarCode.Text,3,6));
  CheckPalletExistsQuery.Close;
  CheckPalletExistsQuery.Params[0].AsInteger:=PalletNo;
  CheckPalletExistsQuery.Open;
  if CheckPalletExistsQuery.Fields[0].IsNull then   {palletno}
  begin
    CheckPalletExistsQuery.Close;
    ShowMessage('Pallet Number not found.  Re-enter');
    Exit;
  end;
  RemovePallet:=false;
  if CheckPalletExistsQuery.Fields[1].AsInteger=VBDespHdrDespNo.Value then {despno}
  begin
    if MessageDlg('Pallet is already on this despatch.  Remove?',
       mtWarning, [mbYes, mbNo], 0) = mrYes then
      {remove this pallet from this despatch}
      RemovePallet:=true
    else
      Exit;
  end
  else
    if CheckPalletExistsQuery.Fields[1].AsInteger<>0 then {despno}
    begin
      ShowMessage('Pallet already on despatch: '+
        CheckPalletExistsQuery.Fields[1].AsString+'.  Re-enter');
      CheckPalletExistsQuery.Close;
      Exit;
    end;
  {if we get here update the pallet onto or off the despatch}
  qryDespDet.Close; //added DL030210
  PalletQuery.Close;
  TotalsQuery.Close;
  qryDespDetTotals.Close; //added DL030210
  UpdateVBRcptQuery.Close;
  VBDespHdr.Edit; {start transaction (if not already in txn)}
  if RemovePallet then
  begin
    {set desp no to zero thus removing the pallet from the despatch}
    VBDespHdrPallets.Value:=VBDespHdrPallets.AsInteger-1;
    UpdateVBRcptQuery.Params[0].AsInteger:=0;
  end
  else
  begin
    VBDespHdrPallets.Value:=VBDespHdrPallets.AsInteger+1;
    UpdateVBRcptQuery.Params[0].AsInteger:=VBDespHdrDespNo.Value;
  end;
  UpdateVBRcptQuery.Params[1].AsInteger:=PalletNo;
  UpdateVBRcptQuery.ExecSQL;
  ShowPalletNumber.Text:=inttostr(PalletNo);
  RedisplayQueries;
end;

procedure TVBPalHdrForm.RedisplayQueries;
{redisplay the pallet array and the despatch totals}
begin
  if Closing then
    Exit;
  qryDespDet.Close; //added DL030210
  PalletQuery.Close;
  TotalsQuery.Close;
  qryDespDetTotals.Close; //added DL030210
  PalletQuery.Params[0].AsInteger:=VBDespHdrDespNo.Value;
  TotalsQuery.Params[0].AsInteger:=VBDespHdrDespNo.Value;
  qryDespDet.ParamByName('DespNo').AsInteger:=VBDespHdrDespNo.Value; //added DL030210
  PalletQuery.Open;
  TotalsQuery.Open;
  qryDespDet.Open; //added DL030210
  if not TotalsQuery.Fields[0].IsNull then //added DL030210
  begin
    EditNetLength.Text:=floattostrf(TotalsQuery.Fields[0].AsFloat,
      ffFixed,6,2);
    EditPallets.Text:=inttostr(TotalsQuery.Fields[1].AsInteger);
    EditBoxes.Text:=inttostr(TotalsQuery.Fields[2].AsInteger);
  end
  else //use consignment stock totals - added DL030210
  begin
    qryDespDetTotals.Close;
    qryDespDetTotals.ParamByName('DespNo').AsInteger:=VBDespHdrDespNo.Value;
    qryDespDetTotals.Open;
    EditNetLength.Text:=floattostrf(qryDespDetTotals.Fields[0].AsFloat,
      ffFixed,6,2);
    EditPallets.Text:=inttostr(qryDespDetTotals.Fields[1].AsInteger);
    EditBoxes.Text:=inttostr(qryDespDetTotals.Fields[2].AsInteger);
  end;
{  EditStrips.Text:=StripCountQuery.Fields[1].AsString;}
{  EditBoxes.Text:=inttostr(TotalBoxCountQuery.RecordCount);}
  TotalsQuery.Close;
  qryDespDetTotals.Close; //added DL030210
end;

procedure TVBPalHdrForm.EditDESPNOChange(Sender: TObject);
begin
  if RedisplayOk then
    RedisplayQueries;
end;

procedure TVBPalHdrForm.PalletQueryCalcFields(DataSet: TDataset);
begin
{  PalletBoxCountQuery.Close;
  PalletBoxCountQuery.Params[0].AsInteger:=PalletQueryPalletNo.Value;
  PalletBoxCountQuery.Open;
  PalletQueryBoxes.Text:=inttostr(PalletBoxCountQuery.RecordCount);
  PalletBoxCountQuery.Close;}
end;

procedure TVBPalHdrForm.VBDespHdrDESPSENTChange(Sender: TField);
var
  BoxNoStr:string[10];
  OkToContinue:boolean; {added DL290897}
begin
  OkToContinue:=true;
  if not (VBDespHdr.State in [dsEdit]) then
  begin
    Screen.Cursor := crDefault;                  { Always restore to normal }
    exit;
  end;
  {check that all boxes on this order have been picked}
  {note: can pick, then despatch, then complete despatch -> all ok}
  { but if despatch and not picked then cannot complete the despatch}
  {Also check that the custref=order custref}
  if VBDespHdrDespSent.Value='Y' then
  begin
    {if customer='ZSLITT' or 'ADJUST' then allow completion without other checks}
    {or 'SAMPLE' added DL 13/3/97; removed DL290897}
    if (VBDespHdrCustRef.AsString='ZSLITT') or (VBDespHdrCustRef.AsString='ADJUST')
      {or (VBDespHdrCustRef.AsString='SAMPLE')} then
      exit;
    if VBDespHdrCustRef.AsString<>'SAMPLE' then {must be picked}
    begin
      MyQuery.Close;
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('select distinct boxno');
      MyQuery.SQL.Add('from vbrcpt');
      MyQuery.SQL.Add('where (vtordno=0 and despno=:despno)');
      MyQuery.SQL.Add('and (qlty='''')'); // ignore check for picked seconds DL049698
      MyQuery.Prepare;
      MyQuery.Params[0].AsInteger:=VBDespHdrDespNo.Value;
      MyQuery.Open;
      MyQuery.First;
      if not (MyQuery.EOF and MyQuery.BOF) then {records found}
      begin
        OkToContinue:=false;
        BoxNoStr:=MyQuery.Fields[0].AsString;
        MyQuery.Close;
        ShowMessage('Box '+BoxNoStr+' not picked. Cannot complete');
        Screen.Cursor := crDefault;                  { Always restore to normal }
        VBDespHdr.Cancel;
      end
    end;
    {note samples are let through just in case an order exists}
    if OkToContinue then
    begin
      {all boxes picked so update vbrcpt}
      {xx change to stored procedure}
      MyQuery.Close;
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('select vtordno,vbstru,vbcol,vbfin,metricwidth,daterqd,sum(netlength)');
      MyQuery.SQL.Add('from vbrcpt');
      MyQuery.SQL.Add('where (despno=:despno)');
      MyQuery.SQL.Add('and (qlty='''')'); // ignore update for picked seconds DL049698
      MyQuery.SQL.Add('group by vtordno,vbstru,vbcol,vbfin,metricwidth,daterqd');
      MyQuery.Prepare;
      MyQuery.Params[0].AsInteger:=VBDespHdrDespNo.Value;
      MyQuery.Open;
      MyQuery.First;
      while not MyQuery.EOF do
      begin
        if MyQuery.Fields[0].AsInteger<>0 then //VTOrdNo <> 0 added DL160998
        begin
          {xx check for post problems}
          UpdateVBOrdDetQuery.Params[0].AsFloat:=MyQuery.Fields[6].Value; {qtydel}
          UpdateVBOrdDetQuery.Params[1].AsInteger:=MyQuery.Fields[0].Value; {vtordno}
          UpdateVBOrdDetQuery.Params[2].AsString:=MyQuery.Fields[1].Value; {vbstru}
          UpdateVBOrdDetQuery.Params[3].AsString:=MyQuery.Fields[2].Value; {vbcol}
          UpdateVBOrdDetQuery.Params[4].AsString:=MyQuery.Fields[3].Value; {vbfin}
          UpdateVBOrdDetQuery.Params[5].AsInteger:=MyQuery.Fields[4].Value; {vbwidth}
          UpdateVBOrdDetQuery.Params[6].Value:=MyQuery.Fields[5].Value; {daterqd}
          UpdateVBOrdDetQuery.ExecSQL;
        end;
        MyQuery.Next;
      end;
      MyQuery.Close;
    end;
  end;
end;

procedure TVBPalHdrForm.VBDespHdrAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TVBPalHdrForm.VBDespHdrDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBPalHdrForm.PreviewBtnClick(Sender: TObject);
begin
  //ReportSmith code removed DL170701
  (*Report1.ReportDir:=ExtractFilePath(ParamStr(0));
  Report1.ReportName:='despatch packing list metres'; {was packlstm DL191197}
  Report1.InitialValues.Add('@DespNo= <'+VBDespHdrDespNo.AsString+'>');
  Report1.Preview:=true;
  Report1.Run;*)
end;

procedure TVBPalHdrForm.DisplayDetBitBtnClick(Sender: TObject);
begin
  if RedisplayOK then
  begin
    DisplayDetBitBtn.Caption:='Display Details';
    RedisplayOK:=false;
    qryDespDet.Close; //added DL030210
    PalletQuery.Close;
    TotalsQuery.Close;
    qryDespDetTotals.Close; //added DL030210
  end
  else
  begin
    DisplayDetBitBtn.Caption:='Hide Details';
    RedisplayOK:=true;
    RedisplayQueries;
  end;
end;

procedure TVBPalHdrForm.btnPrintInvoiceClick(Sender: TObject);
begin
{  //only Paul can do this
  if (UserInitials<>'SJ') and (UserInitials<>'PB') and (UserInitials<>'SYS') then
  begin
    raise Exception.Create('Only Susan, Paul and System Adminstrator can use this invoice button');
  end;
  frmLocalInvoice:=TfrmLocalInvoice.Create(Application);
  frmLocalInvoice.ShowModal;
}
end; //added DL030203

procedure TVBPalHdrForm.InvDateSpdBtnClick(Sender: TObject);
begin
  if VBDespHdrInvDate.Value<VBDespHdrDespDate.Value then
    BrDateForm.Date:=date
  else
    BrDateForm.Date:=VBDespHdrInvDate.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    VBDespHdr.Edit;
    VBDespHdrInvDate.Value:=BRDateForm.Date;
  end;
  if VBDespHdrInvDate.Value<VBDespHdrDespDate.Value then
    raise Exception.Create('Invoice Date cannot be less than despatch date');
end;
(*
procedure TVBPalHdrForm.PrintLine(Items: TStringList);
var
  OutRect: TRect;
  Inches: double;
  i: integer;
begin
  OutRect.Left := 0;                           { left position is zero }
  OutRect.Top := AmountPrinted;                { Set Top to Amount printed }
  OutRect.Bottom := OutRect.Top + LineHeight;  { Set bottom position }
  With Printer.Canvas do
    for i := 0 to Items.Count - 1 do begin
      Inches := longint(Items.Objects[i]) * 0.1;                     { Get inches }
      OutRect.Right := OutRect.Left + round(PixelsInInchx*Inches);   { Determine Right position }
      if not Printer.Aborted then
        TextRect(OutRect, OutRect.Left, OutRect.Top, Items[i]);      { Print the line }
      OutRect.Left := OutRect.Right;                                 { Set left to Right }
    end;
  { Increment the amount printed }
  AmountPrinted := AmountPrinted + TenthsOfInchPixelsY*2;
end;
(*
procedure TVBPalHdrForm.PrintWaybill;
var
  Items: TStringList;
{ TempStr:string[20];}
begin
  Items := TStringList.Create;
  PixelsInInchx := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
  TenthsOfInchPixelsY := GetDeviceCaps(Printer.Handle, LOGPIXELSY) div 10;

  AmountPrinted := 0;
  try
    Printer.PrinterIndex:=0; {should be LPT1}
    Printer.BeginDoc;                                  { Initiate a print job }
    LineHeight := Printer.Canvas.TextHeight('X')+TenthsOfInchPixelsY;
    Items.Clear;
    PrintLine(Items); {print a blank line}
    PrintLine(Items);
{    AddObject(MyQuery.FieldByName('WARPTYPE').AsString,
                        pointer(5));}


{    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select vm.warptype,vm.vbstru,vm.vbcol,vm.min127,vm.stk127,vm.ord127,');
    MyQuery.SQL.Add('vm.pord127,vm.pstk127,vm.min89,vm.stk89,vm.ord89,vm.pord89,vm.pstk89,vm.monthssales');
    MyQuery.SQL.Add('from vbmake vm');
    MyQuery.SQL.Add('where VBStru<>''ZZZ''');
    MyQuery.SQL.Add('order by vm.warptype,vm.vbstru,vm.vbcol');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    while not MyQuery.EOF do
    begin
      with Items do begin
        AddObject(MyQuery.FieldByName('WARPTYPE').AsString,
                        pointer(5));
        TempStr:=MyQuery.FieldByName('VBSTRU').AsString+
          MyQuery.FieldByName('VBCOL').AsString;
        AddObject(TempStr,pointer(4));
        if (MyQuery.FieldByName('MONTHSSALES').AsInteger>=6) then
          TempStr:=''
        else
          TempStr:=FormatFloat('0', MyQuery.FieldByName('MONTHSSALES').AsFloat);
        AddObject(TempStr,pointer(2));
      end;
      PrintLine(Items);
      Items.Clear;
      MyQuery.Next;
    end;}
    if not Printer.Aborted then
      Printer.EndDoc;
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end;
  Items.Free;                       { Free the TStringList }
  MyQuery.Close;
end;
*)
procedure TVBPalHdrForm.EditDESPDATEExit(Sender: TObject);
begin
  if (VBDespHdrDESPDATE.Value<NoEntryBeforeDate) then
  begin
//    VBDespHdrDESPDATE.Value:=date;
    raise exception.create('Date cannot be less than '+
      FormatDateTime('dd-mmm-yyyy',NoEntryBeforeDate));
  end;
  if (VBDespHdrDESPDATE.Value>date) then
    ShowMessage(FormatDateTime('dd-mmm-yyyy',VBDespHdrDESPDATE.Value)+' is after today');
end;

procedure TVBPalHdrForm.spdDespByDateClick(Sender: TObject);
begin
  if VBPickDlgForm.ShowModalVBDespByDate = mrOk then
  begin
    qryDespDet.Close; //added DL030210
    PalletQuery.Close; {added DL300197}
    TotalsQuery.Close; {added DL300197}
    qryDespDetTotals.Close; //added DL030210
    RedisplayOK:=false;
    DisplayDetBitBtn.Caption:='Display Details';
    DisplayDetBitBtn.Enabled:=true;
    VBDespHdr.SetKey;
    VBDespHdr.FieldByName('DespNo').AsInteger:=VBPickDlgForm.VBDespHdrDateDespNo;
    VBDespHdr.GotoKey;
  end;
  Screen.Cursor:=crDefault;
end;

procedure TVBPalHdrForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TVBPalHdrForm.EditDespSentClick(Sender: TObject);
begin
  if Inserting then //added DL230400
    Exit;
  if VBDespHdr.State=dsInsert then //added DL060400
  begin
    Inserting:=true; //added DL230400 (prevent recursion)
    VBDespHdrDespSent.Value:='N';
    Inserting:=false; //added DL230400
    raise Exception.Create('Cannot modify during Insert');
  end;
end;

end.
