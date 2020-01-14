unit vbDeliss;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, DB, DBTables, Mask, DBCtrls, ExtCtrls,
  ComCtrls, Grids, DBGrids;

type
  TVBDelIssForm = class(TForm)
    DelPalletQuery: TQuery;
    Product: TTable;
    ProductMEASUNIT: TStringField;
    ProductRCVUNIT: TStringField;
    ProductFIXEDWEIGHT: TStringField;
    ProductPRODREF: TStringField;
    ProductDESCR: TStringField;
    ProductUNITWEIGHT: TSmallintField;
    ProductINSTOCK: TFloatField;
    DelBCB: TTable;
    DelPallet: TTable;
    DelPalletDELNO: TIntegerField;
    DelPalletPALLETNO: TSmallintField;
    DelPalletQTYISSUED: TFloatField;
    DelBCBDELNO: TIntegerField;
    DelBCBPALLETNO: TSmallintField;
    DelBCBBCBNO: TSmallintField;
    DelBCBBCBISSUED: TStringField;
    DelBCBQuery: TQuery;
    IssueDet: TTable;
    DelPalletBCBISSUED: TFloatField;
    WIPRcpt: TTable;
    WIPRcptQuery: TQuery;
    WIPRcptQueryPRODREF: TStringField;
    WIPRcptQueryNETWEIGHT: TFloatField;
    WIPRcptQueryISSUEINITIALS: TStringField;
    WIPRcptREFNO: TIntegerField;
    WIPRcptDATEISSUED: TDateTimeField;
    WIPRcptISSUETO: TStringField;
    DelBCBQTYISSUED: TFloatField;
    DelBCBQTY: TFloatField;
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
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditUnits: TEdit;
    Warning: TLabel;
    Warning2: TLabel;
    StartBatchButton: TButton;
    Label9: TLabel;
    ShowBatchNumber: TEdit;
    SearchForBatchSpdBtn: TSpeedButton;
    NumberOfItemsInBatchLabel: TLabel;
    EditNumItems: TEdit;
    SaveBatchBtn: TButton;
    AbortBatchBtn: TButton;
    PrintBatchBtn: TButton;
    CloseBitBtn: TBitBtn;
    SPBatchRef: TStoredProc;
    SPIssueNo: TStoredProc;
    NumberOfItemsIssuedLabel: TLabel;
    ShowNumItemsIssued: TEdit;
    WIPRcptBATREF: TIntegerField;
    DelInSummaryQuery: TQuery;
    DelInSummaryQuerySource: TDataSource;
    WIPIssueSummaryQuery: TQuery;
    WIPIssueSummaryQuerySource: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DelInGrid: TDBGrid;
    WIPIssueGrid: TDBGrid;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DelInSummaryQueryPRODREF: TStringField;
    DelInSummaryQuerySUMQTYISSUED: TFloatField;
    DelInSummaryQueryNUMITEMS: TIntegerField;
    WIPIssueSummaryQueryPRODREF: TStringField;
    WIPIssueSummaryQuerySUMNETWEIGHT: TFloatField;
    WIPIssueSummaryQueryNUMITEMS: TIntegerField;
    Label15: TLabel;
    ShowBatchNumber2: TEdit;
    DelInSummaryQueryISSUETO: TStringField;
    WIPIssueSummaryQueryISSUETO: TStringField;
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
    DelBCBSTOCKAREA: TIntegerField;
    DelBCBFACTORYNO: TIntegerField;
    WIPRcptSTOCKAREA: TIntegerField;
    WIPRcptFACTORYNO: TIntegerField;
    TransferSummaryQuery: TQuery;
    TransferSummaryQuerySource: TDataSource;
    TransferSummaryQueryPRODREF: TStringField;
    TransferSummaryQuerySUMQTYISSUED: TFloatField;
    TransferSummaryQueryNUMITEMS: TIntegerField;
    TransferSummaryQueryTRANSFEREDTO: TStringField;
    WIPRcptQueryFACTORYNO: TIntegerField;
    VBYarnRcptYNNET: TFloatField;
    YarnTypeMODDATE: TDateTimeField;
    VBYnRcptSummaryQueryISSUEDTO: TStringField;
    VBYarnRcptISSUEDTO: TStringField;
    VBYarnRcptISSUEDDATE: TDateTimeField;
    WIPRcptISSUEINITIALS: TStringField;
    VBYarnRcptISSUEDBY: TStringField;
    PrintSpdBtn: TSpeedButton;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditBarCodeChange(Sender: TObject);
    procedure IssueBitBtnClick(Sender: TObject);
    procedure EditUnitsExit(Sender: TObject);
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
    procedure PrintSpdBtnClick(Sender: TObject);
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
{    CtrlAcct:string; {added DL080697}
    procedure ClearForm(ClearAll:boolean);
  public
    { Public declarations }
  end;

var
  VBDelIssForm: TVBDelIssForm;

implementation

uses VBUtils, VBMain, BrModal, Pickdate;

{$R *.DFM}

procedure TVBDelIssForm.ClearForm(ClearAll:boolean);
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
  VBDelIssForm.ActiveControl:=EditBarCode;
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

procedure TVBDelIssForm.FormShow(Sender: TObject);
begin
  Product.Open;
  DelPallet.Open;
  DelBCB.Open;
  WIPRcpt.Open;
  IssueDet.Open;
  VBYarnRcpt.Open;
  YarnType.Open;
  Product.Refresh;
  WIPRcpt.Refresh;
  IssueBitBtn.Enabled:=false;
  DefaultsSet:=false;
  EditIssueTo.Text:='';
  EditIssueDate.Text:='';
  SetDefaultsBtn.Caption:='Set Defaults';
  EditIssueTo.TabStop:=true;
  EditIssueDate.TabStop:=true;
  EditIssueTo.Color:=clWindow;
  EditIssueDate.Color:=clWindow;
  IssuePageControl.ActivePage:=BatchControlTabSheet;
  InTxn:=false;
  ItemsIssued:=0;
  BatchNumber:=0;
  ShowBatchNumber.Text:=inttostr(BatchNumber);
{  ClearForm(true); xx}
end;

procedure TVBDelIssForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Product.Close;
  DelPallet.Close;
  DelBCB.Close;
  WIPRcpt.Close;
  IssueDet.Close;
  VBYarnRcpt.Close;
  YarnType.Close;
  VBDelIssForm.Release;
end;

procedure TVBDelIssForm.EditBarCodeChange(Sender: TObject);
var
  {ProdRef:string;}
  AlreadyIssued:boolean;
  CheckBatRef:integer; {added by DL080697}
begin
  {allowed lengths, code started with:}
  {01->12 Delivery, already done}
  {02->8 Yarn: issue to Weaving, Yarn WIP}
  {03->8 WIP: issue to VB, Dye House, Twister (VB,Twister=WIP)}
  DelNo:=0;
  RefNo:=0;
  ProdRef:='-1';
  if length(EditBarCode.Text)<8 then {8 is smallest barcode length}
  begin
    ClearForm(false);
    Exit; {don't do anything yet}
  end;
  BarCodeType:=strtoint(Copy(EditBarCode.Text,1,2));
  if BarCodeType=1 then BarCodeType:=11
  else if BarCodeType=2 then BarCodeType:=12
  else if BarCodeType=3 then BarCodeType:=13;
  if (BarCodeType=11) and (length(EditBarCode.Text)<>12) then
  begin
    ClearForm(false);
    Exit;
  end
  else if (BarCodeType=12) and (length(EditBarCode.Text)<>8) then
  begin
    ClearForm(false);
    Exit;
  end
  else if (BarCodeType=13) and (length(EditBarCode.Text)<>8) then
  begin
    ClearForm(false);
    Exit;
  end
  else if (BarCodeType<>11) and (BarCodeType<>12) and (BarCodeType<>13) then
  begin
    ClearForm(false);
    Exit;
  end;
  {if we get to here then the barcode format is ok.}
  {transaction added because of "Another user has modified this record message"}
  AlreadyIssued:=false;
  if length(EditBarCode.Text)=12 then
  begin
    BarCodeType:=strtoint(Copy(EditBarCode.Text,1,2));
    DelNo:=strtoint(Copy(EditBarCode.Text,3,4));
    PalletNo:=strtoint(Copy(EditBarCode.Text,7,3));
    BoxNo:=strtoint(Copy(EditBarCode.Text,10,3));
    if BarCodeType=1 then BarCodeType:=11;
    if BarCodeType<>11 then
      ShowMessage('Incorrect Bar Code Type for this transaction')
    else
    begin
      if BoxNo = 0 then
        ShowPalletBox.Text:='Pallet'
      else
        ShowPalletBox.Text:='Box';
      {show product reference and pallet info}
      DelPalletQuery.Active:=false;
      DelPalletQuery.Params[0].AsInteger:=DelNo;
      DelPalletQuery.Params[1].AsInteger:=PalletNo;
      DelPalletQuery.Active:=true;
      with DelPalletQuery.Fields[0] do
        if IsNull then
          ProdRef := '-1'
        else
        begin
          ProdRef := AsString;
          ShowUnitsAvail.Text:=DelPalletQuery.Fields[2].AsString;
          ShowQtyAvail.Text:=DelPalletQuery.Fields[1].AsString;
          if strtofloat(ShowQtyAvail.Text)=0 then
            AlreadyIssued:=true;
        end;
      DelPalletQuery.Active:=false;
      if BoxNo <> 0 then
      begin
        {fill in box issue information}
        DelBCBQuery.Active:=false;
        DelBCBQuery.Params[0].AsInteger:=DelNo;
        DelBCBQuery.Params[1].AsInteger:=PalletNo;
        DelBCBQuery.Params[2].AsInteger:=BoxNo;
        DelBCBQuery.Active:=true;
        with DelBCBQuery do
        begin
          if Fields[0].IsNull then
            ProdRef := '-1'
          else
          if Fields[2].AsInteger=1 then {should never happen}
          begin
            Warning.Caption:='Cannot issue as not at factory 2! Transfer first.';
            EditUnits.TabStop:=false;
            EditUnits.ReadOnly:=true;
            IssueBitBtn.Enabled:=false;
            Exit;
          end
          else
          begin
            ShowUnitsAvail.Text:='1'; {one at a time}
            ShowQtyAvail.Text:=Fields[0].AsString;
            if Fields[1].AsString='Y' then
              AlreadyIssued:=true;
          end;
        end;
        DelBCBQuery.Active:=false;
      end;
      {show available quantity to issue}
    end;
  end
  else {length =8}
  begin
    ShowPalletBox.Text:='Box';
    if BarCodeType=12 then {yarn issue}
    begin
      {show product reference and pallet info}
      ShowPalletBox.Text:='Yarn Box';
      VBYnRcptQuery.Active:=false;
      RefNo:=strtoint(Copy(EditBarCode.Text,3,6)); {RefNo=BoxNo here}
      VBYnRcptQuery.Params[0].AsInteger:=RefNo;
      VBYnRcptQuery.Active:=true;
      with VBYnRcptQuery.Fields[0] do
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
    end
    else {BarCodeType=3 or BarCodeType=13}
    begin
      {show product reference and pallet info}
      WIPRcptQuery.Active:=false;
      RefNo:=strtoint(Copy(EditBarCode.Text,3,6)); {RefNo is wiprcpt no here}
      WIPRcptQuery.Params[0].AsInteger:=RefNo;
      WIPRcptQuery.Active:=true;
      if WIPRcptQuery.Fields[0].IsNull then
        ProdRef := '-1'
      else
        if WIPRcptQuery.Fields[3].AsInteger<>2 then
        begin
          Warning.Caption:='Cannot issue as not at factory 2.  Transfer required.';
          EditUnits.TabStop:=false;
          EditUnits.ReadOnly:=true;
          IssueBitBtn.Enabled:=false;
          Exit;
        end
        else
        begin
          ProdRef := WIPRcptQuery.Fields[0].AsString;
          ShowUnitsAvail.Text:='1';
          ShowQtyAvail.Text:=WIPRcptQuery.Fields[1].AsString;
          IssueInitials:=WIPRcptQuery.Fields[2].AsString;
          if IssueInitials<>'' then
            AlreadyIssued:=true;
        end;
      WIPRcptQuery.Active:=false;
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
  end
  else
  begin
    {search for product reference info}
    Product.SetKey;
    Product.FieldByName('ProdRef').AsString:=ProdRef;
    Product.GotoKey;
    ShowMeasUnit.Text:=ProductMeasUnit.Value;
    ShowDescr.Text:=ProductDescr.Value;
    ShowFixedWeight.Checked:=ProductFixedWeight.Value='Y';
    {show the unit weight for fixed unit products}
    if ShowFixedWeight.Checked then
      ShowUnitWeight.Text:=floattostr(ProductUnitWeight.Value)
    else
      ShowUnitWeight.Text:='0';
    if ShowPalletBox.Text<>'Pallet'{='Box'} then
    begin
      {allow issue to work and fill in Box issued weights}
      if ShowFixedWeight.Checked and (BoxNo<>0) then
      begin
        Warning.Caption:='Cannot issue from this box.  Must issue from Pallet.';
        EditUnits.TabStop:=false;
        EditUnits.ReadOnly:=true;
        IssueBitBtn.Enabled:=false;
      end
      else
      begin
        ShowQtyIssued.Text:=ShowQtyAvail.Text;
        EditUnits.Text:=ShowUnitsAvail.Text;
        EditUnits.TabStop:=false;
        EditUnits.ReadOnly:=true;
        IssueBitBtn.Enabled:=true;
        Warning.Caption:='';
      end;
    end
    else
    begin
      {ShowPalletBox='Pallet'}
      if not ShowFixedWeight.Checked then
      begin
        Warning.Caption:='Cannot issue from this Pallet.  Must issue from Box.';
        EditUnits.TabStop:=false;
        EditUnits.ReadOnly:=true;
        IssueBitBtn.Enabled:=false;
      end
      else
      begin
        {allow entry of bag details to be issued from a Fixed Weight Pallet}
        EditUnits.TabStop:=true;
        EditUnits.ReadOnly:=false;
        ShowQtyIssued.Text:='0';
        EditUnits.Text:='0';
        IssueBitBtn.Enabled:=true;
        Warning.Caption:='';
      end;
    end;
  end;
  if AlreadyIssued then
  begin
    Warning2.Caption:='Already Issued';
    IssueBitBtn.Enabled:=false;
  end;
end;

procedure TVBDelIssForm.CloseBitBtnClick(Sender: TObject);
begin
{  ClearForm(true);}
  Close;
end;

procedure TVBDelIssForm.IssueBitBtnClick(Sender: TObject);
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
      if BarCodeType=11 then
      begin
        {update pallet issued bcbs and quantities}
        DelPallet.SetKey;
        DelPallet.FieldByName('DelNo').AsInteger:=DelNo;
        DelPallet.FieldByName('PalletNo').AsInteger:=PalletNo;
        if not DelPallet.GotoKey then
        begin
          ErrorMessageShown:=true;
          ShowMessage('Pallet Error: cannot issue');
        end;
        {update box issued flag (if required), but check that able to get to DelBCB info}
        if ShowPalletBox.Text='Box' then
        begin
          DelBCB.SetKey;
          DelBCB.FieldByName('DelNo').AsInteger:=DelNo;
          DelBCB.FieldByName('PalletNo').AsInteger:=PalletNo;
          DelBCB.FieldByName('BCBNo').AsInteger:=BoxNo;
          if not DelBCB.GotoKey then
          begin
            ErrorMessageShown:=true;
            ShowMessage('Box Error: cannot issue');
          end;
        end;
        if ShowPalletBox.Text='Pallet' then {added DL010697 for fixed weight pallets}
        begin
          DelBCB.SetKey;
          DelBCB.FieldByName('DelNo').AsInteger:=DelNo;
          DelBCB.FieldByName('PalletNo').AsInteger:=PalletNo;
          DelBCB.FieldByName('BCBNo').AsInteger:=1; {there is only one box here}
          if not DelBCB.GotoKey then
          begin
            ErrorMessageShown:=true;
            ShowMessage('Box Error: cannot issue');
          end;
        end;
        {if all records found then insert issued record into issue table}
        if not ErrorMessageShown then
        begin
          DelPallet.Edit;
          DelPalletBCBIssued.Value:=DelPalletBCBIssued.Value+
            strtofloat(EditUnits.Text);
          DelPalletQtyIssued.Value:=DelPalletQtyIssued.Value+
            strtofloat(ShowQtyIssued.Text);
          DelPallet.Post;
          if ShowPalletBox.Text='Box' then
          begin
            DelBCB.SetKey;
            DelBCB.FieldByName('DelNo').AsInteger:=DelNo;
            DelBCB.FieldByName('PalletNo').AsInteger:=PalletNo;
            DelBCB.FieldByName('BCBNo').AsInteger:=BoxNo;
            DelBCB.GotoKey; {no need for if statement because already checked}
            DelBCB.Edit;
            DelBCBQtyIssued.Value:=DelBCBQty.Value; {added DL290897}
            DelBCBBCBIssued.Value:='Y';
            DelBCBFactoryNo.Value:=0; {issued : added DL290897}
            DelBCBStockArea.Value:=0; {added DL290897}
            DelBCB.Post;
          end;
          if ShowPalletBox.Text='Pallet' then {added DL010697 for fixed weight pallets}
          begin
            {check that complete pallet can be sent to factory 2}
            DelBCB.SetKey;
            DelBCB.FieldByName('DelNo').AsInteger:=DelNo;
            DelBCB.FieldByName('PalletNo').AsInteger:=PalletNo;
            DelBCB.FieldByName('BCBNo').AsInteger:=1; {there is only one box here}
            DelBCB.GotoKey;
            DelBCB.Edit;
            DelBCBQtyIssued.Value:=DelBCBQtyIssued.Value+
              strtofloat(ShowQtyIssued.Text);
            if DelBCBQty.Value=DelBCBQtyIssued.Value then
            begin
              DelBCBBCBIssued.Value:='Y';
              DelBCBFactoryNo.Value:=0; {issued : DL100697}
              DelBCBStockArea.Value:=0; {DL100697}
            end;
            DelBCB.Post;
          end;
          with IssueDet do
          begin
            Insert; {IssueDet.Insert a new record}
            SPIssueNo.ExecProc;
            IssueNo:=SPIssueNo.ParamByName('Code').AsInteger;
            {IssueNo assigned by generator}
            FieldByName('IssueNo').AsInteger:=IssueNo;
            FieldByName('DelNo').AsInteger:=DelNo;
            FieldByName('PalletNo').AsInteger:=PalletNo;
            FieldByName('BCBNo').AsInteger:=BoxNo;
            FieldByName('DateIssued').AsFloat:=strtodate(IssueDate);
            FieldByName('Initials').AsString:=UserInitials;
            FieldByName('BCBIssued').AsFloat:=strtofloat(EditUnits.Text);
            FieldByName('QtyIssued').AsFloat:=strtofloat(ShowQtyIssued.Text);
            FieldByName('IssueTo').AsString:=EditIssueTo.Text;
            FieldByName('ProdRef').AsString:=ProdRef;
            FieldByName('BatRef').AsInteger:=BatchNumber;
            FieldByName('DateEnt').AsFloat:=now;
            FieldByName('UserEnt').AsString:=UserInitials;
            Post;
          end;
        end;
      end
      else
        if BarCodeType=13 then
        begin
          WIPRcpt.SetKey;
          WIPRcpt.FieldByName('RefNo').AsInteger:=RefNo;
          if WIPRcpt.GotoKey then
          begin
            WIPRcpt.Edit;
            WIPRcptDateIssued.Value:=strtodate(IssueDate);
            WIPRcptIssueTo.Value:=EditIssueTo.Text;
            WIPRcptIssueInitials.AsString:=UserInitials;
            WIPRcptBatRef.AsInteger:=BatchNumber;
            WIPRcptFactoryNo.Value:=0; {DL100697}
            WIPRcptStockArea.Value:=0; {DL100697}
            WIPRcpt.Post;
          end
          else
          begin
            ErrorMessageShown:=true;
            ShowMessage('WIP Rcpt Error: cannot issue');
          end;
        end
        else
          if (BarCodeType=12) then {added DL080697}
          begin
            VBYarnRcpt.SetKey;
            VBYarnRcpt.FieldByName('BoxNo').AsInteger:=RefNo;
            if VBYarnRcpt.GotoKey then
            begin
              VBYarnRcpt.Edit;
              VBYarnRcptBatRef.AsInteger:=BatchNumber;
              VBYarnRcptIssuedTo.AsString:=EditIssueTo.Text;
              VBYarnRcptIssuedDate.AsFloat:=strtodate(IssueDate);
              VBYarnRcptIssuedBy.AsString:=UserInitials;
              VBYarnRcpt.Post;
            end
            else
            begin
              ErrorMessageShown:=true;
              ShowMessage('Yarn Rcpt Error: cannot issue');
            end;
          end;
      {update product instock and wip figures}
      {we've already found the product to update, but find again because
      {of "cannot update because another user has modified" error message}
      if not ErrorMessageShown then
      begin
        if ((BarCodeType=11) or (BarCodeType=13)) then
        begin
          Product.SetKey;
          Product.FieldByName('ProdRef').AsString:=ProdRef;
          Product.GotoKey;
          Product.Edit;
          ProductInStock.Value:=ProductInStock.Value-
            strtofloat(ShowQtyIssued.Text);
          Product.Post;
        end;
        //removed as in update trigger DL290798
        (*else {BarCodeType=12}
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
        end;*)
        ItemsIssued:=ItemsIssued+1;
        ShowNumItemsIssued.ReadOnly:=false;
        ShowNumItemsIssued.Text:=inttostr(ItemsIssued);
        ShowNumItemsIssued.ReadOnly:=true;
      end;
      {lastly update warning2}
      Warning2.Caption:='Issued';
      IssueBitBtn.Enabled:=false;
    end;
  end;
end;

procedure TVBDelIssForm.EditUnitsExit(Sender: TObject);
begin
  if EditUnits.Text<>'' then
  begin
    ShowQtyIssued.Text:=floattostr(strtofloat(EditUnits.Text)*
      strtofloat(ShowUnitWeight.Text));
    if strtofloat(ShowQtyAvail.Text)<strtofloat(ShowQtyIssued.Text) then
      raise Exception.Create('Cannot issue more than you have!');
  end
  else
    EditUnits.Text:='0';
end;

procedure TVBDelIssForm.ClearFormBtnClick(Sender: TObject);
begin
  ClearForm(true);
end;

procedure TVBDelIssForm.SetDefaultsBtnClick(Sender: TObject);
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
    if EditNumItems.Text='' then EditNumItems.Text:='0';
    if ShowNumItemsIssued.Text='' then ShowNumItemsIssued.Text:='0';
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

procedure TVBDelIssForm.DeptSearchBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalDepts(PassValue) = mrOk then
    EditIssueTo.Text:=PickDlgForm.DeptRef;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TVBDelIssForm.IssueDateSpdBtnClick(Sender: TObject);
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

procedure TVBDelIssForm.StartBatchButtonClick(Sender: TObject);
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

procedure TVBDelIssForm.IssuePageControlEnter(Sender: TObject);
begin
  Warning.Caption:='';
  Warning2.Caption:='';
  ShowIssueTo.Text:=IssueTo;
  ShowIssueDate.Text:=IssueDate;
end;

procedure TVBDelIssForm.AbortBatchBtnClick(Sender: TObject);
begin
  if EditNumItems.Text='' then EditNumItems.Text:='0';
  if ShowNumItemsIssued.Text='' then ShowNumItemsIssued.Text:='0';
  if MessageDlg('Do you wish to abort this batch?',
      mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    MainForm.Database.Rollback;
    InTxn:=false;
    CloseBitBtn.Enabled:=true;
    SaveBatchBtn.Enabled:=false;
    AbortBatchBtn.Enabled:=false;
    SearchForBatchSpdBtn.Enabled:=true;
    ItemsIssued:=0;
    BatchNumber:=0;
    ShowBatchNumber.Text:=inttostr(BatchNumber);
    DefaultsSet:=true; {force the defaults to be unset}
    SetDefaultsBtnClick(Self);
  end;
end;

procedure TVBDelIssForm.SaveBatchBtnClick(Sender: TObject);
begin
  if EditNumItems.Text='' then EditNumItems.Text:='0';
  if ShowNumItemsIssued.Text='' then ShowNumItemsIssued.Text:='0';
  if (strtoint(EditNumItems.Text)<>strtoint(ShowNumItemsIssued.Text))
    or (strtoint(EditNumItems.Text)=0)
    or (strtoint(ShowNumItemsIssued.Text)=0)
    then
    ShowMessage('Cannot Complete Batch Until Number of Items Issued matches Items in Batch')
  else
  begin
    MainForm.Database.Commit;
    InTxn:=false;
    CloseBitBtn.Enabled:=true;
    SaveBatchBtn.Enabled:=false;
    AbortBatchBtn.Enabled:=false;
    SearchForBatchSpdBtn.Enabled:=true;
    ItemsIssued:=0;
    BatchNumber:=0;
{    ShowBatchNumber.Text:=inttostr(BatchNumber);}
    DefaultsSet:=true; {force the defaults to be unset}
    SetDefaultsBtnClick(Self);
  end;
end;

procedure TVBDelIssForm.IssuePageControlChange(Sender: TObject);
begin
  if IssuePageControl.ActivePage=SummaryTabSheet then
  begin
    ShowBatchNumber2.ReadOnly:=false;
    ShowBatchNumber2.Text:=inttostr(BatchNumber);
    ShowBatchNumber2.ReadOnly:=true;
    DelInSummaryQuery.Active:=false;
    DelInSummaryQuery.Params[0].AsInteger:=BatchNumber;
    DelInSummaryQuery.Active:=true;
    WIPIssueSummaryQuery.Active:=false;
    WIPIssueSummaryQuery.Params[0].AsInteger:=BatchNumber;
    WIPIssueSummaryQuery.Active:=true;
    VBYnRcptSummaryQuery.Active:=false;
    VBYnRcptSummaryQuery.Params[0].AsInteger:=BatchNumber;
    VBYnRcptSummaryQuery.Active:=true;
  end
  else
  begin
    DelInSummaryQuery.Active:=false;
    WIPIssueSummaryQuery.Active:=false;
    VBYnRcptSummaryQuery.Active:=false;
    TransferSummaryQuery.Active:=false;
    if IssuePageControl.ActivePage=IssuesTabSheet then
    begin
      ShowIssueTo.Text:=IssueTo;
      ShowIssueDate.Text:=IssueDate;
      EditBarCode.SetFocus;
    end;
  end;
end;

procedure TVBDelIssForm.EditNumItemsExit(Sender: TObject);
begin
  ItemsInBatch:=strtoint(EditNumItems.Text);
end;

procedure TVBDelIssForm.SearchForBatchSpdBtnClick(Sender: TObject);
begin
{  if DelHead.State in [dsInsert,dsEdit] then
    ShowMessage('Cannot search whilst in Insert or Edit Mode')
  else}
  if PickDlgForm.ShowModalBatRef = mrOk then
  begin
    BatchNumber:=PickDlgForm.BatRef;
    ShowBatchNumber.Text:=inttostr(BatchNumber);
  end;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TVBDelIssForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
