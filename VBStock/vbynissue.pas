unit vbynissue;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, DB, DBTables, Mask, DBCtrls, ExtCtrls,
  ComCtrls, Grids, DBGrids;

type
  TVBYnIssueForm = class(TForm)
    IssuePageControl: TPageControl;
    BatchControlTabSheet: TTabSheet;
    SetDefaultsBtn: TButton;
    DeptSearchBtn: TSpeedButton;
    EditIssueTo: TEdit;
    EditIssueDate: TEdit;
    IssueDateSpdBtn: TSpeedButton;
    IssueDateLabel: TLabel;
    IssueToLabel: TLabel;
    Panel1: TPanel;
    IssuesTabSheet: TTabSheet;
    SummaryTabSheet: TTabSheet;
    Label1: TLabel;
    EditBarCode: TEdit;
    IssueBitBtn: TBitBtn;
    ShowPalletBox: TEdit;
    ClearFormBtn: TButton;
    ShowDescr: TEdit;
    ShowMeasUnit: TEdit;
    ShowFixedWeight: TCheckBox;
    Label4: TLabel;
    ShowUnitWeight: TEdit;
    ShowQtyAvail: TEdit;
    ShowQtyIssued: TEdit;
    ShowUnitsAvail: TEdit;
    ShowBatchNumber:TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditUnits: TEdit;
    Warning: TLabel;
    Warning2: TLabel;
    StartBatchButton: TButton;
    Label9: TLabel;
    SearchForBatchSpdBtn: TSpeedButton;
    NumberOfItemsInBatchLabel: TLabel;
    EditNumItems: TEdit;
    SaveBatchBtn: TButton;
    AbortBatchBtn: TButton;
    PrintBatchBtn: TButton;
    CloseBitBtn: TBitBtn;
    SPBatchRef: TStoredProc;
    NumberOfItemsIssuedLabel: TLabel;
    ShowNumItemsIssued: TEdit;
    Panel3: TPanel;
    Label14: TLabel;
    VBYnRcptSummaryQuery: TQuery;
    VBYnRcptSummaryQuerySource: TDataSource;
    YnRcptGrid: TDBGrid;
    VBYnRcptSummaryQuerySUMNETWEIGHT: TFloatField;
    VBYnRcptSummaryQueryNUMITEMS: TIntegerField;
    VBYnRcptSummaryQueryYNTYPE: TStringField;
    VBYnRcptQuery: TQuery;
    Label16: TLabel;
    Label17: TLabel;
    ShowIssueTo: TEdit;
    ShowIssueDate: TEdit;
    VBYarnRcpt: TTable;
    VBYarnRcptBOXNO: TIntegerField;
    VBYarnRcptYNSTRU: TStringField;
    VBYarnRcptYNCOL: TStringField;
    VBYarnRcptYNTWIST: TStringField;
    VBYarnRcptBATREF: TIntegerField;
    YarnType: TTable;
    YarnTypeYNSTRU: TStringField;
    YarnTypeINSTOCK: TFloatField;
    YarnTypeYNTWIST: TStringField;
    YarnTypeYNCOL: TStringField;
    VBYarnIssued: TTable;
    VBYarnRcptYNNET: TFloatField;
    VBYarnIssuedBOXNO: TIntegerField;
    VBYarnIssuedISSUEDTO: TStringField;
    VBYarnIssuedISSUEDDATE: TDateTimeField;
    VBYarnIssuedISSUEDBY: TStringField;
    VBYarnIssuedISSUEDQTY: TFloatField;
    VBYarnIssuedBATREF: TIntegerField;
    Label7: TLabel;
    ShowBatchNumber2: TEdit;
    YarnTypeMODDATE: TDateTimeField;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditBarCodeChange(Sender: TObject);
    procedure IssueBitBtnClick(Sender: TObject);
    procedure ClearFormBtnClick(Sender: TObject);
    procedure SetDefaultsBtnClick(Sender: TObject);
    procedure DeptSearchBtnClick(Sender: TObject);
    procedure IssueDateSpdBtnClick(Sender: TObject);
    procedure StartBatchButtonClick(Sender: TObject);
    procedure IssuePageControlEnter(Sender: TObject);
    procedure AbortBatchBtnClick(Sender: TObject);
    procedure SaveBatchBtnClick(Sender: TObject);
    procedure IssuePageControlChange(Sender: TObject);
    procedure EditNumItemsExit(Sender: TObject);
    procedure SearchForBatchSpdBtnClick(Sender: TObject);
  private
    { Private declarations }
    BarCodeType,DelNo,PalletNo,BoxNo:integer;
    RefNo:integer;
    IssueInitials:string;
    ProdRef:string;
    DefaultsSet:boolean;
    IssueTo:string;
    IssueDate:string; {added DL250297}
    InTxn:boolean; {added DL010697}
    BatchNumber:integer; {added DL010697}
    ItemsInBatch:integer; {added DL010697}
    ItemsIssued:integer; {added DL010697}
    CtrlAcct,IssueYarnTo:string; {added DL080697}
    {TransferTo:integer; {added DL100697}
    procedure ClearForm(ClearAll:boolean);
  public
    { Public declarations }
  end;

var
  VBYnIssueForm: TVBYnIssueForm;

implementation

uses VBUtils, VBMain, BrModal, Pickdate;

{$R *.DFM}

procedure TVBYnIssueForm.ClearForm(ClearAll:boolean);
begin
  {ClearAll is set when the bar code must be included in the clear}
  if ClearAll then
    EditBarCode.Clear;
  ShowPalletBox.Clear;
  ShowDescr.Clear;
  ShowMeasUnit.Clear;
  ShowFixedWeight.Checked:=false;
  ShowUnitsAvail.Clear;
  ShowQtyAvail.Clear;
  EditUnits.Clear;
  ShowQtyIssued.Clear;
  IssueBitBtn.Enabled:=false;
  ShowUnitWeight.Clear;
  {EditIssueTo.Text:='VB'; {was WIP DL121295}
  Warning.Caption:='';
  Warning2.Caption:='';
  VBYnIssueForm.ActiveControl:=EditBarCode;
  BarCodeType:=0;
  DelNo:=0;
  PalletNo:=0;
  BoxNo:=0;
  RefNo:=0;
  if DefaultsSet then
  begin
    EditIssueTo.Text:=IssueTo;
    EditIssueDate.Text:=IssueDate;
  end
  else
  begin
    EditIssueTo.Text:='';
    EditIssueDate.Text:='';
  end;
end;

procedure TVBYnIssueForm.FormShow(Sender: TObject);
begin
  VBYarnRcpt.Open;
  YarnType.Open;
  VBYarnIssued.Open;
  IssuePageControl.ActivePage:=BatchControlTabSheet;
  InTxn:=false;
  ItemsIssued:=0;
  BatchNumber:=0;
  ShowBatchNumber.Text:=inttostr(BatchNumber);
end;

procedure TVBYnIssueForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  VBYarnIssued.Close;
  VBYarnRcpt.Close;
  YarnType.Close;
  VBYnIssueForm.Release;
end;

procedure TVBYnIssueForm.EditBarCodeChange(Sender: TObject);
var
  AlreadyIssued:boolean;
  CheckBatRef:integer; {added by DL080697}
begin
  {allowed lengths, code started with:}
  {02->8 Yarn: issue to Looms,Factory 1}
  RefNo:=0;
  ProdRef:='-1';
  if length(EditBarCode.Text)<8 then {8 is smallest barcode length}
  begin
    ClearForm(false);
    Exit; {don't do anything yet}
  end;
  BarCodeType:=strtoint(Copy(EditBarCode.Text,1,2));
  if BarCodeType=2 then
    BarCodeType:=12
  else
    if BarCodeType<>12 then
    begin
      ClearForm(false);
      Exit;
    end;
  if (BarCodeType=12) and (length(EditBarCode.Text)<>8) then
  begin
    ClearForm(false);
    Exit;
  end;
  {if we get to here then the barcode format is ok.}
  {transaction added because of "Another user has modified this record message"}
  AlreadyIssued:=false;
  if BarCodeType=12 then {yarn issue}
  begin
    {show product reference and pallet info}
    ShowPalletBox.Text:='Yarn Box';
    VBYnRcptQuery.Active:=false;
    RefNo:=strtoint(Copy(EditBarCode.Text,3,6)); {RefNo=BoxNo here}
    VBYnRcptQuery.Params[0].AsInteger:=RefNo;
    VBYnRcptQuery.Active:=true;
    with VBYnRcptQuery.Fields[0] do
    begin
      if IsNull then
        ProdRef := '-1'
      else
      begin
        ProdRef := '';
        ShowDescr.Text := AsString+':'+VBYnRcptQuery.Fields[1].AsString+':'+
          VBYnRcptQuery.Fields[2].AsString+'. Lot:'+
          VBYnRcptQuery.Fields[5].AsString+'/'+
          VBYnRcptQuery.Fields[6].AsString;
        ShowUnitsAvail.Text:='1';
        ShowQtyAvail.Text:=VBYnRcptQuery.Fields[3].AsString;
        CheckBatRef:=VBYnRcptQuery.Fields[4].AsInteger;
        if CheckBatRef<>0 then {xx can also include despsent = 'Y' from yndesphdr}
          AlreadyIssued:=true;
      end;
      VBYnRcptQuery.Active:=false;
    end;
  end;
  if ProdRef='-1' then
    ShowMessage('Bar Code not found.  Please call David')
  else
    if ShowPalletBox.Text='Yarn Box' then
    begin
      ShowQtyIssued.Text:=ShowQtyAvail.Text;
      EditUnits.Text:=ShowUnitsAvail.Text;
      EditUnits.TabStop:=false;
      EditUnits.ReadOnly:=true;
      IssueBitBtn.Enabled:=true;
      Warning.Caption:='';
    end;
  if AlreadyIssued then
  begin
    Warning2.Caption:='Already Issued';
    IssueBitBtn.Enabled:=false;
  end;
end;

procedure TVBYnIssueForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBYnIssueForm.IssueBitBtnClick(Sender: TObject);
var
  IssueNo:integer;
  ErrorMessageShown:boolean;
begin
  ErrorMessageShown:=false;
  {can only click on Issue Button if allowed to}
  {defaults must be set first: DL240197}
  if not InTxn then
    ShowMessage('Cannot issue until batch started')
  else
  if not DefaultsSet then
    ShowMessage('Cannot issue until defaults set')
  else
  begin
    if strtofloat(EditUnits.Text)=0 then
      ShowMessage('Please enter number of units to issue')
    else
    begin
      if (BarCodeType=12) then
      begin
        VBYarnRcpt.SetKey;
        VBYarnRcpt.FieldByName('BoxNo').AsInteger:=RefNo;
        if VBYarnRcpt.GotoKey then
        begin
          VBYarnRcpt.Edit;
          VBYarnRcptBatRef.AsInteger:=BatchNumber;
          VBYarnRcpt.Post;
          with VBYarnIssued do
          begin
            Insert;
            FieldByName('BoxNo').AsInteger:=VBYarnRcptBoxNo.AsInteger;
            FieldByName('IssuedTo').AsString:=EditIssueTo.Text;
            FieldByName('IssuedDate').AsFloat:=strtodate(IssueDate);
            FieldByName('IssuedBy').AsString:=UserInitials;
            FieldByName('IssuedQty').AsFloat:=VBYarnRcptYnNet.AsFloat;
            FieldByName('BatRef').AsInteger:=BatchNumber;
            Post;
          end;
        end
        else
        begin
          ErrorMessageShown:=true;
          ShowMessage('Yarn Rcpt Error: cannot issue');
        end;
      end;
      if not ErrorMessageShown then
      begin
        {update yarntype}
        YarnType.SetKey;
        YarnType.FieldByName('YnStru').AsString:=VBYarnRcptYnStru.AsString;
        YarnType.FieldByName('YnTwist').AsString:=VBYarnRcptYnTwist.AsString;
        YarnType.FieldByName('YnCol').AsString:=VBYarnRcptYnCol.AsString;
        if YarnType.GotoKey then
        begin
          YarnType.Edit;
          YarnTypeInStock.Value:=YarnTypeInStock.Value-
            strtofloat(ShowQtyIssued.Text);
          YarnTypeModDate.Value:=date;
          YarnType.Post;
        end;
      end;
      ItemsIssued:=ItemsIssued+1;
      ShowNumItemsIssued.ReadOnly:=false;
      ShowNumItemsIssued.Text:=inttostr(ItemsIssued);
      ShowNumItemsIssued.ReadOnly:=true;
      {lastly update warning2}
      Warning2.Caption:='Issued';
      IssueBitBtn.Enabled:=false;
    end;
  end;
end;

procedure TVBYnIssueForm.ClearFormBtnClick(Sender: TObject);
begin
  ClearForm(true);
end;

procedure TVBYnIssueForm.SetDefaultsBtnClick(Sender: TObject);
begin
  if not DefaultsSet then
  begin
    if (EditIssueTo.Text='') or (EditIssueDate.Text='') or
      (EditNumItems.Text='') then
    begin
      ShowMessage('Cannot "Set defaults" until defaults set');
      Abort;
    end;
    IssueTo:=EditIssueTo.Text;
    IssueDate:=EditIssueDate.Text;
    ItemsInBatch:=strtoint(EditNumItems.Text);
    EditNumItems.TabStop:=false;
    EditNumItems.Color:=clSilver;
    EditIssueTo.TabStop:=false;
    EditIssueTo.Color:=clSilver;
    EditIssueDate.TabStop:=false;
    EditIssueDate.Color:=clSilver;
    DefaultsSet:=true;
    SetDefaultsBtn.Caption:='Clear Defaults';
  end
  else {defaults are set}
  begin
    if strtoint(EditNumItems.Text)=strtoint(ShowNumItemsIssued.Text) then
    begin
      IssueTo:='';
      IssueDate:='';
      EditIssueTo.Text:='';
      EditIssueDate.Text:='';
    end;
    DefaultsSet:=false;
    SetDefaultsBtn.Caption:='Set Defaults';
    EditIssueTo.TabStop:=true;
    EditIssueTo.Color:=clWindow;
    EditIssueDate.TabStop:=true;
    EditIssueDate.Color:=clWindow;
    EditNumItems.TabStop:=true;
    EditNumItems.Color:=clWindow;
  end;
end;

procedure TVBYnIssueForm.DeptSearchBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalDepts(0) = mrOk then {PassValue=0 (zero)}
    EditIssueTo.Text:=PickDlgForm.DeptRef;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TVBYnIssueForm.IssueDateSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=date;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    if (BRDateForm.Date<NoEntryBeforeDate) then
    begin
      EditIssueDate.Text:='';
      raise exception.create('Date cannot be less than '+
        FormatDateTime('dd-mmm-yyyy',NoEntryBeforeDate));
    end;
    if (BRDateForm.Date>date) then
    begin
      EditIssueDate.Text:='';
      raise exception.create('Date cannot be greater than today');
    end;
    EditIssueDate.Text:=formatdatetime('dd/mm/yyyy',BRDateForm.Date);
  end;
end;

procedure TVBYnIssueForm.StartBatchButtonClick(Sender: TObject);
begin
  if InTxn then
    ShowMessage('Already in Batch')
  else
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
    CloseBitBtn.Enabled:=false;
    SaveBatchBtn.Enabled:=true;
    AbortBatchBtn.Enabled:=true;
    SearchForBatchSpdBtn.Enabled:=false;
    SPBatchRef.ExecProc;
    ShowBatchNumber.Text:=SPBatchRef.ParamByName('Code').AsString;
    BatchNumber:=SPBatchRef.ParamByName('Code').AsInteger;
    ItemsIssued:=0;
    ShowNumItemsIssued.Text:='0';
  end;
end;

procedure TVBYnIssueForm.IssuePageControlEnter(Sender: TObject);
begin
  Warning.Caption:='';
  Warning2.Caption:='';
  ShowIssueTo.Text:=IssueTo;
  ShowIssueDate.Text:=IssueDate;
end;

procedure TVBYnIssueForm.AbortBatchBtnClick(Sender: TObject);
begin
  if MessageDlg('Do you wish to abort this batch?',
      mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    MainForm.Database.Rollback;
    InTxn:=false;
    CloseBitBtn.Enabled:=true;
    SaveBatchBtn.Enabled:=false;
    AbortBatchBtn.Enabled:=false;
    SearchForBatchSpdBtn.Enabled:=false;
    DefaultsSet:=true; {force the defaults to be unset}
    SetDefaultsBtnClick(Self);
    ItemsIssued:=0;
    BatchNumber:=0;
  end;
end;

procedure TVBYnIssueForm.SaveBatchBtnClick(Sender: TObject);
begin
  if strtoint(EditNumItems.Text)<>strtoint(ShowNumItemsIssued.Text) then
    ShowMessage('Cannot Complete Batch Until Number of Items Issued matches Items in Batch')
  else
  begin
    MainForm.Database.Commit;
    InTxn:=false;
    CloseBitBtn.Enabled:=true;
    SaveBatchBtn.Enabled:=false;
    AbortBatchBtn.Enabled:=false;
    SearchForBatchSpdBtn.Enabled:=true;
    DefaultsSet:=true; {force the defaults to be unset}
    SetDefaultsBtnClick(Self);
    ItemsIssued:=0;
    BatchNumber:=0;
    EditNumItems.Clear;
    EditIssueTo.Clear;
    EditIssueDate.Clear;
    ShowNumItemsIssued.Clear;
  end;
end;

procedure TVBYnIssueForm.IssuePageControlChange(Sender: TObject);
begin
  if IssuePageControl.ActivePage=SummaryTabSheet then
  begin
    ShowBatchNumber2.ReadOnly:=false;
    ShowBatchNumber2.Text:=inttostr(BatchNumber);
    ShowBatchNumber2.ReadOnly:=true;
    VBYnRcptSummaryQuery.Active:=false;
    VBYnRcptSummaryQuery.Params[0].AsInteger:=BatchNumber;
    VBYnRcptSummaryQuery.Active:=true;
  end
  else
  begin
    VBYnRcptSummaryQuery.Active:=false;
    if IssuePageControl.ActivePage=IssuesTabSheet then
    begin
      ShowIssueTo.Text:=IssueTo;
      ShowIssueDate.Text:=IssueDate;
      EditBarCode.SetFocus;
    end;
  end;
end;

procedure TVBYnIssueForm.EditNumItemsExit(Sender: TObject);
begin
  ItemsInBatch:=strtoint(EditNumItems.Text);
end;

procedure TVBYnIssueForm.SearchForBatchSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalBatRef = mrOk then
  begin
    BatchNumber:=PickDlgForm.BatRef;
    ShowBatchNumber.Text:=inttostr(BatchNumber);
  end;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

end.
