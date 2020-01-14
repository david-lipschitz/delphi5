{Modifications}
{DL251197: Added Estimated Date for Picking.  Note that daterqd is}
{still required because it is used in the join between the vborddet}
{record and the vbrcpt record (and the vbboxdetails record?)}

unit vbpick;    

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, Mask, DBCtrls, Buttons, ExtCtrls,
  ComCtrls, Report, Menus, DataPrn;

type
  TVBPickForm = class(TForm)
    Label1: TLabel;
    EditWeekNo: TEdit;
    Label2: TLabel;
    EditTodaysDate: TEdit;
    OrderQuery: TQuery;
    OrderQuerySource: TDataSource;
    OrderGrid: TDBGrid;
    OrderQueryYEARNO: TSmallintField;
    OrderQueryWEEKNO: TSmallintField;
    OrderQueryDATERQD: TDateTimeField;
    OrderQueryVBWIDTH: TSmallintField;
    OrderQueryCUSTREF: TStringField;
    OrderQueryQTYREM: TFloatField;
    OrderQueryVTORDNO: TIntegerField;
    MyQuery: TQuery;
    Label3: TLabel;
    EditYearNo: TEdit;
    StockDetGrid: TDBGrid;
    StockDetQuerySource: TDataSource;
    OrderQueryVBSTRU: TStringField;
    OrderQueryVBCOL: TStringField;
    StockLotGrid: TDBGrid;
    StockLotQuery: TQuery;
    StockLotQuerySource: TDataSource;
    StockLotQueryLOTNO: TIntegerField;
    StockLotQueryNETLENGTH: TFloatField;
    StockLotQueryVBSTRU: TStringField;
    StockLotQueryVBCOL: TStringField;
    Label4: TLabel;
    StockTotalQuery: TQuery;
    StockTotalSource: TDataSource;
    EditStockTotal: TDBEdit;
    StockTotalQueryNETLENGTH: TFloatField;
    CloseBitBtn: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    NearStockQuery: TQuery;
    NearStockSource: TDataSource;
    EditWeaving: TDBEdit;
    EditWoven: TDBEdit;
    EditFinished: TDBEdit;
    NearStockQueryWWIP: TFloatField;
    NearStockQueryVWIP: TFloatField;
    NearStockQueryFWIP: TFloatField;
    Label10: TLabel;
    AllocatedQuery: TQuery;
    AllocatedQuerySource: TDataSource;
    EditAllocated: TDBEdit;
    AllocatedQueryALLOCATED: TFloatField;
    Label11: TLabel;
    StockLotQueryVBWIDTH: TSmallintField;
    OrdersByRadioGrp: TRadioGroup;
    Label12: TLabel;
    StockDetQuery: TTable;
    StockDetQueryVBSTRU: TStringField;
    StockDetQueryVBCOL: TStringField;
    StockDetQueryVBWIDTH: TSmallintField;
    StockDetQueryBOXNO: TIntegerField;
    StockDetQueryNETLENGTH: TFloatField;
    StockDetQueryVTORDNO: TIntegerField;
    StockDetQueryPALLETNO: TIntegerField;
    StockDetQueryLOTNO: TIntegerField;
    UpdateVBRcptQuery: TQuery;
    Label13: TLabel;
    EditTotalUnallocated: TDBEdit;
    StockTotalQueryUNALLOCATED: TFloatField;
    StockLotQueryUNALLOCATED: TFloatField;
    StockDetQueryALLOCATED: TFloatField;
    UpdateVBOrdDetQuery: TQuery;
    PickedBtn: TButton;
    UnPickedBtn: TButton;
    StockDetQueryDATERQD: TDateTimeField;
    EditVBStru: TEdit;
    EditVBCol: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    EditEndDate: TEdit;
    EditStartDate: TEdit;
    OrdersBtn: TButton;
    Supplier: TTable;
    SupplierSource: TDataSource;
    Label18: TLabel;
    EditSupDescr: TDBEdit;
    RefreshBtn: TButton;
    Label19: TLabel;
    Label20: TLabel;
    NearStockQuerySTK2070: TIntegerField;
    NearStockQueryORD2070: TIntegerField;
    EditFWStock: TDBEdit;
    EditFWOrd: TDBEdit;
    EditMakeDate: TEdit;
    Report1: TReport;
    Label21: TLabel;
    EditQlty: TEdit;
    GetRowNoQuery: TQuery;
    GetRowNoSource: TDataSource;
    GetRowNoQueryROWNO: TIntegerField;
    ShowRowNoGrid: TDBGrid;
    SPVBBoxDetailsInsert: TStoredProc;
    OrderQueryESTDATE: TDateTimeField;
    Label22: TLabel;
    EditVBFin: TEdit;
    OrderQueryVBFIN: TStringField;
    StockDetQueryVBFIN: TStringField;
    OrderQueryVBTYPE: TStringField;
    StockLotQueryVBFIN: TStringField;
    OrderQueryQTYALLOC: TFloatField;
    Label23: TLabel;
    EditCustRef: TEdit;
    StockDetQueryALLOWANCE: TFloatField;
    rdgBoxSort: TRadioGroup;
    DataPrinter: TODDataPrinter;
    PickDetailQuery: TQuery;
    PickDetailSource: TDataSource;
    PickSummaryQuery: TQuery;
    PickSummarySource: TDataSource;
    PickDetailQueryCUSTREF: TStringField;
    PickDetailQueryVTORDNO: TIntegerField;
    PickDetailQueryDATERQD: TDateTimeField;
    PickDetailQueryVBTYPE: TStringField;
    PickDetailQueryMETRICWIDTH: TSmallintField;
    PickDetailQueryBOXNO: TIntegerField;
    PickDetailQueryLOTNO: TIntegerField;
    PickDetailQueryPALLETNO: TIntegerField;
    PickDetailQueryNETLENGTH: TFloatField;
    PickDetailQueryORDCUSTREF: TStringField;
    PickDetailQueryROWNO: TIntegerField;
    PickSummaryQueryCUSTREF: TStringField;
    PickSummaryQueryVTORDNO: TIntegerField;
    PickSummaryQueryDATERQD: TDateTimeField;
    PickSummaryQueryVBTYPE: TStringField;
    PickSummaryQueryMETRICWIDTH: TSmallintField;
    PickSummaryQueryNETLENGTH: TFloatField;
    PickSummaryQueryORDCUSTREF: TStringField;
    PickDetailQueryDESPNO: TIntegerField;
    RemoveAllocBtn: TButton;
    MyQuerySource: TDataSource;
    PrintSpdBtn: TSpeedButton;
    VbParams: TTable;
    VbParamsPICKING: TStringField;
    VbBoxesInStock: TTable;
    VbBoxesInStockSource: TDataSource;
    VbBoxesInStockVBSTRU: TStringField;
    VbBoxesInStockVBCOL: TStringField;
    VbBoxesInStockVBWIDTH: TSmallintField;
    VbBoxesInStockQLTY: TStringField;
    VbBoxesInStockBOXNO: TIntegerField;
    VbBoxesInStockLOTNO: TIntegerField;
    VbBoxesInStockNETLENGTH: TFloatField;
    VbBoxesInStockVTORDNO: TIntegerField;
    VbBoxesInStockDATERQD: TDateTimeField;
    VbBoxesInStockPALLETNO: TIntegerField;
    VbBoxesInStockDESPNO: TIntegerField;
    VbBoxesInStockLABELSTRU: TStringField;
    VbBoxesInStockROWNO: TIntegerField;
    VbBoxesInStockVBFIN: TStringField;
    VbBoxesInStockQLTYREASON: TStringField;
    StockSumQuery: TQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StockSumQuerySource: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure StockDetGridDblClick(Sender: TObject);
    procedure OrdersByRadioGrpClick(Sender: TObject);
    procedure OrderGridDblClick(Sender: TObject);
    procedure StockDetQueryAfterPost(DataSet: TDataSet);
    procedure StockDetQueryBeforeEdit(DataSet: TDataSet);
    procedure StockDetQueryPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure StockDetQueryEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure StockDetGridEnter(Sender: TObject);
    procedure StockDetQueryBeforePost(DataSet: TDataSet);
    procedure PickedBtnClick(Sender: TObject);
    procedure UnPickedBtnClick(Sender: TObject);
    procedure EditVBStruChange(Sender: TObject);
    procedure EditVBColChange(Sender: TObject);
    procedure EditStartDateExit(Sender: TObject);
    procedure EditEndDateExit(Sender: TObject);
    procedure OrdersBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure StockDetGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StockDetGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditVBFinChange(Sender: TObject);
    procedure EditCustRefExit(Sender: TObject);
    procedure rdgBoxSortClick(Sender: TObject);
    procedure StockLotGridDblClick(Sender: TObject);
    procedure RemoveAllocBtnClick(Sender: TObject);
    procedure DataPrinterBeforeRowPrint(Sender: TObject;
      var RowTop: Integer);
    procedure DataPrinterAfterFinishPrint(Sender: TObject;
      var RowTop: Integer);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure VbParamsBeforeEdit(DataSet: TDataSet);
    procedure VbParamsAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    CurrentWeekNo:shortint;
    CurrentYearNo:word;
//  PixelsInInchx: integer;       { Stores Pixels per inch }
//  LineHeight: Integer;          { Stores the line height }
//  AmountPrinted: integer;       { Stores amount, in pixels, printed on a page }
//  TenthsOfInchPixelsY: integer; { Pixels in 1/10 of an inch used for line spacing }
//  DateHeading:string;
//  CurrentVTOrdNo:word;   JT220698 no longer used
//  CurrentDate:real;
    StartDate,EndDate:string[11]; {eg:20/05/1996}
//  CurrentPageNo:byte; {added DL140197}
    PickQlty:string[1]; {added DL160297}
    CustRef, VBType: string;               {added JT240698 start}
    DespNo, VTOrdNo, MetricWidth: Integer;
    DateRqd: TDateTime;
    TotalLength: Single;
//  Greyed: Boolean;                       {added JT240698 end}
//  procedure PrintHeader;
//  procedure PrintPickedColumnNames;
//  procedure PrintOrdersColumnNames;
//  procedure PrintLine(Items: TStringList);
    procedure UpdateAllocated(VTOrdNo: Integer);
  public
    { Public declarations }
  end;

var
  VBPickForm: TVBPickForm;

implementation

{$R *.DFM}

uses VBMain,VBOrdHdr,printers,VBPckRep; {?rqd?}

procedure TVBPickForm.FormShow(Sender: TObject);
var
  InputPickQlty:string;
  UpdateBoxes:boolean; //added DL040698
begin
  EditTodaysDate.Text:=FormatDateTime('dd/mm/yyyy', date);
  if not InputQuery('Picking Quality', {added DL160297}
    'Enter qlty you wish to pick (blank for firsts,A,N,S,T,Z)', InputPickQlty) then
  begin
    ModalResult = mrNone;  //JT210798  make to close at once
    Exit; {program}
  end;
  if (InputPickQlty='') or (InputPickQlty=' ') then
  begin
    PickQlty:='';
    EditQlty.Text:=PickQlty;
    EditQlty.Color:=clWindow;
  end
  else
  begin
    PickQlty:=uppercase(InputPickQlty);
    EditQlty.Text:=PickQlty;
    EditQlty.Color:=clRed;
  end;
{ if (UserInitials='SYS') then  //maybe leave this as a refresh option
  begin
    if MessageDlg('Do you wish to update boxes?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      UpdateBoxes:=true
    else
      UpdateBoxes:=false;
  end
  else
    UpdateBoxes:=true;}
  MyQuery.Close;
  {fetch current week details}
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select yearno,weekno');
  MyQuery.SQL.Add('from wkno');
  MyQuery.SQL.Add('where :date1 between fromdate and todate');
  MyQuery.Prepare;
  MyQuery.Params[0].AsString:=FormatDateTime('d/mmm/yyyy', date);
  MyQuery.Open;
  CurrentYearNo:=MyQuery.Fields[0].AsInteger;
  CurrentWeekNo:=MyQuery.Fields[1].AsInteger;
  EditYearNo.Text:=MyQuery.Fields[0].AsString;
  EditWeekNo.Text:=MyQuery.Fields[1].AsString;
  MyQuery.Close;
  {fetch last make date}
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select makedate');
  MyQuery.SQL.Add('from vbparams');
  MyQuery.SQL.Add('where ref=1');
  MyQuery.Prepare;
  MyQuery.Open;
  EditMakeDate.Text:=FormatDateTime('dd/mm/yyyy hh:mm',MyQuery.Fields[0].AsFloat);
  MyQuery.Close;
(*if UpdateBoxes then // aded DL040698   //JT210798 removed
  begin
    Screen.Cursor:=crSQLWait;
    MainForm.Database.StartTransaction;
    SPVBBoxDetailsInsert.Params[0].AsString:=PickQlty;
    SPVBBoxDetailsInsert.ExecProc; {added DL180697}
    MainForm.Database.Commit;
  end;*)
  Screen.Cursor:=crDefault;
  OrderQuery.Open;
  StockDetQuery.Open;
  StockLotQuery.Open;
  StockTotalQuery.Open;
  NearStockQuery.Open;
  AllocatedQuery.Open;
  Supplier.Open;
  GetRowNoQuery.Prepare;
  VBParams.Open;              //JT210798
end;

procedure TVBPickForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Supplier.Close;
  AllocatedQuery.Close;
  NearStockQuery.Close;
  StockTotalQuery.Close;
  StockLotQuery.Close;
  StockDetQuery.Close;
  OrderQuery.Close;
  VBPickForm.Release;
  VBParams.Close;        //JT210798
end;

procedure TVBPickForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBPickForm.StockDetQueryBeforePost(DataSet: TDataSet);
begin(*//JT220698   moved to procedure UpdateAllocated
          - called by StockDetGridDblClick and StockLotGridDblClick
//xx  {StockDetQuery has already been updated by this point}
    UpdateVBRcptQuery.Params[0].AsInteger:=StockDetQueryVTOrdNo.Value;
    if StockDetQueryVTOrdNo.Value<>0 then
      UpdateVBRcptQuery.Params[1].AsString:=FormatDateTime('d/mmm/yyyy', OrderQueryDateRqd.Value);
//    else
//      UpdateVBRcptQuery.Params[1].AsString:=''; {null - doesn't work}
    UpdateVBRcptQuery.Params[2].AsInteger:=StockDetQueryBoxNo.Value;
    UpdateVBRcptQuery.ExecSQL;
    {update the VBOrdDet table: stockdetquery has already been updated at this point}
    if StockDetQueryVTOrdNo.Value=0 then {subtract}
      UpdateVBOrdDetQuery.Params[0].AsFloat:=(StockDetQueryNetLength.Value*-1)
    else {add}
      UpdateVBOrdDetQuery.Params[0].AsFloat:=StockDetQueryNetLength.Value;
    UpdateVBOrdDetQuery.Params[1].AsInteger:=CurrentVTOrdNo;
    UpdateVBOrdDetQuery.Params[2].AsString:=OrderQueryVBStru.Value;
    UpdateVBOrdDetQuery.Params[3].AsString:=OrderQueryVBCol.Value;
    UpdateVBOrdDetQuery.Params[4].AsString:=OrderQueryVBFin.Value;
    UpdateVBOrdDetQuery.Params[5].AsInteger:=OrderQueryVBWidth.Value;
    UpdateVBOrdDetQuery.Params[6].AsString:=FormatDateTime('d/mmm/yyyy', CurrentDate);
    UpdateVBOrdDetQuery.ExecSQL;*)
end;

//JT220698 here for multiple calling from other routines
procedure TVBPickForm.UpdateAllocated(VTOrdNo: Integer);
var
  ThisVTOrdNo: Integer;
  ThisDateRqd: TDateTime;
begin
  VBParams.Refresh;
  if VBParamsPicking.AsString <> 'N' then
    raise Exception.Create('Someone else is currently picking - please wait');
  VBParams.Edit;
  VBParamsPicking.AsString := 'Y';
  VBParams.Post;
  //update VBBoxDetail table
  StockDetQuery.Edit;
  if VTOrdNo = 0 then     //removing
  begin
    ThisVTOrdNo := StockDetQueryVTOrdNo.AsInteger;
    ThisDateRqd := StockDetQueryDateRqd.AsDateTime;
    StockDetQueryVTOrdNo.AsInteger := 0;
    StockDetQueryDateRqd.AsString := '';
    StockDetQueryAllocated.AsFloat := 0
  end
  else
  begin            //allocating
    ThisVTOrdNo := VTOrdNo;
    ThisDateRqd := OrderQueryDateRqd.AsDateTime;
    StockDetQueryVTOrdNo.AsInteger := VTOrdNo;
    StockDetQueryDateRqd.AsDateTime := OrderQueryDateRqd.AsDateTime;
    StockDetQueryAllocated.AsFloat := StockDetQueryNetLength.Value;
  end;
//StockDetQuery.Post;  moved to bottom so that following updates in same transaction
  //update VBRcpt table -
  UpdateVBRcptQuery.ParamByName('vtordno').AsInteger := VTOrdNo;
  if VTOrdNo <> 0 then
    UpdateVBRcptQuery.ParamByName('daterqd').AsString :=
      FormatDateTime('d/mmm/yyyy', OrderQueryDateRqd.AsDateTime);
{  else
    UpdateVBRcptQuery.ParamByName('daterqd').AsString := '';{null - doesn't work}
  UpdateVBRcptQuery.ParamByName('boxno').AsInteger := StockDetQueryBOXNO.AsInteger;
  UpdateVBRcptQuery.ExecSQL;
  {update the VBOrdDet table: stockdetquery has already been updated at this point}
  if VTOrdNo = 0 then {subtract}
    UpdateVBOrdDetQuery.ParamByName('qtyalloc').AsFloat :=
      (StockDetQueryNetLength.Value * -1)
  else {add}
    UpdateVBOrdDetQuery.ParamByName('qtyalloc').AsFloat :=
      StockDetQueryNetLength.Value;
//  UpdateVBOrdDetQuery.ParamByName('vtordno').AsInteger := OrderQueryVTORDNO.AsInteger;
  UpdateVBOrdDetQuery.ParamByName('vtordno').AsInteger := ThisVTOrdNo;  //JT090798 must be original, not current if deleting
  UpdateVBOrdDetQuery.ParamByName('vbstru').AsString := OrderQueryVBStru.AsString;
  UpdateVBOrdDetQuery.ParamByName('vbcol').AsString := OrderQueryVBCol.AsString;
  UpdateVBOrdDetQuery.ParamByName('vbfin').AsString := OrderQueryVBFin.AsString;
  UpdateVBOrdDetQuery.ParamByName('vbwidth').AsInteger := OrderQueryVBWidth.AsInteger;
{  UpdateVBOrdDetQuery.ParamByName('daterqd').AsString :=
    FormatDateTime('d/mmm/yyyy', OrderQueryDateRqd.AsDateTime);}
  UpdateVBOrdDetQuery.ParamByName('daterqd').AsString :=      //JT090798 must be original, not current if deleting
    FormatDateTime('d/mmm/yyyy', ThisDateRqd);
  UpdateVBOrdDetQuery.ExecSQL;
  StockDetQuery.Post;  //commits transaction
  VBParams.Edit;
  VBParamsPicking.AsString := 'N';
  VBParams.Post;
end;

procedure TVBPickForm.StockDetGridDblClick(Sender: TObject);
var
  {OrderQueryBookmark: TBookmark;
  StockLotQueryBookmark: TBookmark;
  StockDetQueryBookmark: TBookmark;}
  PostandUpdate:boolean; {added DL230197}
  TempMessage:string[50]; {added DL230197}
begin
  {if carton is on a pallet and the pallet is on a despatch, check}
  {that the custrefs are the same}
  PostAndUpdate:=true;
  if StockDetQueryVTOrdNo.Value=0 then
  begin
{   StockDetQuery.Edit;
    CurrentVTOrdNo:=OrderQueryVTOrdNo.Value;   //JT220698  moved to proc below
    CurrentDate:=OrderQueryDateRqd.Value;
    StockDetQueryVTOrdNo.Value:=OrderQueryVTOrdNo.Value;
    StockDetQueryDateRqd.Value:=OrderQueryDateRqd.Value;
    StockDetQueryAllocated.Value:=StockDetQueryNetLength.Value;}
    //edit vbboxdetail as above, and update vbrcpt & vborddet
    UpdateAllocated(OrderQueryVTOrdNo.AsInteger);
  end
  else
  begin {ask if must remove? DL230197}
    if StockDetQueryVTOrdNo.Value=OrderQueryVTOrdNo.Value then
      TempMessage:='Carton is already on this order. Remove?'
    else
      TempMessage:='Carton is on another order, number: '+
        StockDetQueryVTOrdNo.AsString+'. Remove?';
    if MessageDlg(TempMessage,mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
(*    StockDetQuery.Edit;
      CurrentVTOrdNo:=StockDetQueryVTOrdNo.Value;
      CurrentDate:=StockDetQueryDateRqd.Value;
      StockDetQueryVTOrdNo.Value:=0;
//    StockDetQueryDateRqd.Value:=0; {how to set to null?}
      StockDetQueryAllocated.Value:=0;*)
      UpdateAllocated(0);   //JT220698  see above - zero indicates removing
    end
    else
      PostAndUpdate:=false;
  end;
  if PostAndUpdate then
  begin
//  StockDetQuery.Post;  //JT220698   done in procedure UpdateAllocated
    AllocatedQuery.Close; { remove DL? 101296}
    AllocatedQuery.Open;
    StockLotQuery.Close;
    StockLotQuery.Open;
    StockTotalQuery.Close;
    StockTotalQuery.Open;
{    RefreshBtnClick(Sender);}
  end;
end;
      //Added JT220698  select multiple boxes for an input amount
procedure TVBPickForm.StockLotGridDblClick(Sender: TObject);
var
  SelAmountStr: string;
  SelAmount, AmountLeft: Single;
  BoxesAlloc: Integer;
  Bookmark: TBookmark;
begin
  if StockLotQueryUNALLOCATED.Value > 0 then
  begin
    SelAmountStr := '';
    //get amount to select input -
    if InputQuery('Allocate Length From Lot (Rem='+
      IntToStr(OrderQueryQTYREM.AsInteger-
        OrderQueryQTYALLOC.AsInteger) + 'm)',
        'Length Required  (Available: ' +
        StockLotQueryUNALLOCATED.AsString + 'm)', SelAmountStr) then
    begin
      if SelAmountStr = '' then Exit;
      SelAmount := StrToFloat(SelAmountStr);
      if SelAmount > StockLotQueryUNALLOCATED.AsFloat then
        raise Exception.Create('Selected amount more than available');
      StockDetQuery.DisableControls;
      try
        StockDetQuery.First;
        //select boxes until amount allocated -
        AmountLeft := SelAmount;
        BoxesAlloc := 0;
        while (AmountLeft > 0) and not StockDetQuery.EOF do
        begin
          if (StockDetQueryLotNo.AsInteger = StockLotQueryLotNo.AsInteger) and
             (StockDetQueryVTOrdNo.AsInteger = 0) then  //not already selected
          begin
            //edit vbboxdetail, update vbrcpt & vborddet
            UpdateAllocated(OrderQueryVTOrdNo.AsInteger);
            AmountLeft := AmountLeft - StockDetQueryNETLENGTH.AsFloat;
            Inc(BoxesAlloc);
          end;
          StockDetQuery.Next;
{         if StockDetQuery.EOF then
          begin
            MainForm.Database.RollBack;
            raise Exception.Create('Selection process error');
          end;}
        end;
      finally
        StockDetQuery.EnableControls;
      end;
      AllocatedQuery.Close; { remove DL? 101296}
      AllocatedQuery.Open;
      Bookmark := StockLotQuery.GetBookmark;
      StockLotQuery.Close;
      StockLotQuery.Open;
      StockLotQuery.GotoBookmark(Bookmark);
      StockLotQuery.FreeBookmark(Bookmark);
      StockTotalQuery.Close;
      StockTotalQuery.Open;
{     MessageDlg(
        Format('%d boxes selected = %fm'#13'(%fm more that required)',
          [BoxesAlloc, SelAmount + (AmountLeft * -1), AmountLeft * -1]),
        mtInformation, [mbOK], 0);}
      MessageDlg(IntToStr(BoxesAlloc) + ' boxes selected = ' +
        FloatToStr(SelAmount + (AmountLeft * -1)) + 'm'#13 +
        '(' + FloatToStr(AmountLeft * -1) + 'm more than required)',
        mtInformation, [mbOK], 0);
    end;
  end
  else MessageDlg('Lot is fully allocated', mtError, [mbOK], 0);
end;

procedure TVBPickForm.RemoveAllocBtnClick(Sender: TObject);
var
  Bookmark: TBookmark;
begin
  if MessageDlg('Remove all allocations on this lot no for this order?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Bookmark := StockDetQuery.GetBookmark;
    StockDetQuery.DisableControls;
    try
      //go to first unselected box for this lot no -
      StockDetQuery.First;
      while not StockDetQuery.EOF do
      begin
        if ((StockDetQueryLotNo.AsInteger = StockLotQueryLotNo.AsInteger) and
            (StockDetQueryVTOrdNo.AsInteger = OrderQueryVTOrdNo.AsInteger) and
            (StockDetQueryDateRqd.AsDateTime = OrderQueryDateRqd.AsDateTime)) then
        begin
          UpdateAllocated(0);    //< means being removed
        end;
        StockDetQuery.Next;
      end;
      StockDetQuery.GotoBookmark(Bookmark);
    finally
      StockDetQuery.EnableControls;
      StockDetQuery.FreeBookmark(Bookmark);
    end;
    AllocatedQuery.Close; { remove DL? 101296}
    AllocatedQuery.Open;
    Bookmark := StockLotQuery.GetBookmark;
    StockLotQuery.Close;
    StockLotQuery.Open;
    StockLotQuery.GotoBookmark(Bookmark);
    StockLotQuery.FreeBookmark(Bookmark);
    StockTotalQuery.Close;
    StockTotalQuery.Open;
  end;
end;
(*       JT160698  redone below
procedure TVBPickForm.OrdersByRadioGrpClick(Sender: TObject);
begin
  case OrdersByRadioGrp.ItemIndex of
    0: {default; sort by week,type}
    begin
      OrderQuery.Close;
      OrderQuery.SQL.Clear;
      OrderQuery.SQL.Add('select wn.yearno,wn.weekno,vo.estdate,');
      OrderQuery.SQL.Add('vo.vbstru||vo.vbcol||vo.vbfin vbtype,');
      OrderQuery.SQL.Add('vo.vbwidth,vh.custref,');
      OrderQuery.SQL.Add('vo.qty-vo.qtydel qtyrem,vh.vtordno,vo.vbstru,vo.vbcol,vo.vbfin,');
      OrderQuery.SQL.Add('vo.qtyalloc,vo.daterqd');
      OrderQuery.SQL.Add('from vbordhdr vh,wkno wn,vborddet vo');
      OrderQuery.SQL.Add('where (vo.status<>''C'')');
      OrderQuery.SQL.Add('and (vo.vtordno=vh.vtordno)');
      OrderQuery.SQL.Add('and (vo.estdate between wn.fromdate and wn.todate)');
      if EditVBStru.Text<>'' then
        OrderQuery.SQL.Add('and (vo.vbstru='''+EditVBStru.Text+''')');
      if EditVBCol.Text<>'' then
        if strtoint(EditVBCol.Text)>=100 then
          OrderQuery.SQL.Add('and (vo.vbcol='+EditVBCol.Text+')');
      if EditVBFin.Text<>'' then
        OrderQuery.SQL.Add('and (vo.vbfin='''+EditVBFin.Text+''')');
      if StartDate<>'' then
        OrderQuery.SQL.Add('and (vo.estdate>='''+StartDate+''')');
      if EndDate<>'' then
        OrderQuery.SQL.Add('and (vo.estdate<='''+EndDate+''')');
      if EditCustRef.Text<>'' then
        OrderQuery.SQL.Add('and (vh.custref starting with '''+EditCustRef.Text+''')');
      OrderQuery.SQL.Add('group by wn.yearno,wn.weekno,vo.daterqd,vo.estdate,vo.vbstru,vo.vbcol,vo.vbfin,');
      OrderQuery.SQL.Add('vo.vbwidth,vh.custref,vh.vtordno,vo.qty,vo.qtydel,vo.qtyalloc');
      OrderQuery.SQL.Add('order by wn.yearno,wn.weekno,vo.vbstru,vo.vbcol,vo.vbfin,vo.vbwidth,vh.custref');
      OrderQuery.Prepare;
      OrderQuery.Open;
      OrderGrid.Columns.Items[0].FieldName:='YEARNO';
      OrderGrid.Columns.Items[1].FieldName:='WEEKNO';
      OrderGrid.Columns.Items[2].FieldName:='ESTDATE';
      OrderGrid.Columns.Items[3].FieldName:='VBTYPE';
      OrderGrid.Columns.Items[4].FieldName:='VBWIDTH';
      OrderGrid.Columns.Items[5].FieldName:='CUSTREF';
      OrderGrid.Columns.Items[6].FieldName:='QTYREM';
      OrderGrid.Columns.Items[7].FieldName:='VTORDNO';
      OrderGrid.Columns.Items[8].FieldName:='QTYALLOC';
      OrderGrid.Columns.Items[9].FieldName:='DATERQD';
    end;
    1:
    begin {sort by week,client; was client,type: DL140197}
      OrderQuery.Close;
      OrderQuery.SQL.Clear;
      OrderQuery.SQL.Add('select wn.yearno,wn.weekno,vo.estdate,');
      OrderQuery.SQL.Add('vo.vbstru||vo.vbcol||vo.vbfin vbtype,');
      OrderQuery.SQL.Add('vo.vbwidth,vh.custref,');
      OrderQuery.SQL.Add('vo.qty-vo.qtydel qtyrem,vh.vtordno,vo.vbstru,vo.vbcol,vo.vbfin,');
      OrderQuery.SQL.Add('vo.qtyalloc,vo.daterqd');
      OrderQuery.SQL.Add('from vbordhdr vh,wkno wn,vborddet vo');
      OrderQuery.SQL.Add('where (vo.status<>''C'')');
      OrderQuery.SQL.Add('and (vo.vtordno=vh.vtordno)');
      OrderQuery.SQL.Add('and (vo.estdate between wn.fromdate and wn.todate)');
      if EditVBStru.Text<>'' then
        OrderQuery.SQL.Add('and (vo.vbstru='''+EditVBStru.Text+''')');
      if EditVBCol.Text<>'' then
        if strtoint(EditVBCol.Text)>=100 then
          OrderQuery.SQL.Add('and (vo.vbcol='+EditVBCol.Text+')');
      if EditVBFin.Text<>'' then
        OrderQuery.SQL.Add('and (vo.vbfin='''+EditVBFin.Text+''')');
      if StartDate<>'' then
        OrderQuery.SQL.Add('and (vo.estdate>='''+StartDate+''')');
      if EndDate<>'' then
        OrderQuery.SQL.Add('and (vo.estdate<='''+EndDate+''')');
      if EditCustRef.Text<>'' then
        OrderQuery.SQL.Add('and (vh.custref='''+EditCustRef.Text+''')');
      OrderQuery.SQL.Add('group by wn.yearno,wn.weekno,vo.daterqd,vo.estdate,vo.vbstru,vo.vbcol,vo.vbfin,');
      OrderQuery.SQL.Add('vo.vbwidth,vh.custref,vh.vtordno,vo.qty,vo.qtydel,vo.qtyalloc');
      OrderQuery.SQL.Add('order by wn.yearno,wn.weekno,vh.custref,vo.vbstru,vo.vbcol,vo.vbfin,vo.vbwidth');
      OrderQuery.Prepare;
      OrderQuery.Open;
      OrderGrid.Columns.Items[0].FieldName:='YEARNO';
      OrderGrid.Columns.Items[1].FieldName:='WEEKNO';
      OrderGrid.Columns.Items[2].FieldName:='ESTDATE';
      OrderGrid.Columns.Items[3].FieldName:='CUSTREF';
      OrderGrid.Columns.Items[4].FieldName:='VBTYPE';
      OrderGrid.Columns.Items[5].FieldName:='VBWIDTH';
      OrderGrid.Columns.Items[6].FieldName:='QTYREM';
      OrderGrid.Columns.Items[7].FieldName:='VTORDNO';
      OrderGrid.Columns.Items[8].FieldName:='QTYALLOC';
      OrderGrid.Columns.Items[9].FieldName:='DATERQD';
    end;
    2:
    begin {sort by client,order}
      OrderQuery.Close;
      OrderQuery.SQL.Clear;
      OrderQuery.SQL.Add('select wn.yearno,wn.weekno,vo.estdate,');
      OrderQuery.SQL.Add('vo.vbstru||vo.vbcol||vo.vbfin vbtype,');
      OrderQuery.SQL.Add('vo.vbwidth,vh.custref,');
      OrderQuery.SQL.Add('vo.qty-vo.qtydel qtyrem,vh.vtordno,vo.vbstru,vo.vbcol,vo.vbfin,');
      OrderQuery.SQL.Add('vo.qtyalloc,vo.daterqd');
      OrderQuery.SQL.Add('from vbordhdr vh,wkno wn,vborddet vo');
      OrderQuery.SQL.Add('where (vo.status<>''C'')');
      OrderQuery.SQL.Add('and (vo.vtordno=vh.vtordno)');
      OrderQuery.SQL.Add('and (vo.estdate between wn.fromdate and wn.todate)');
      if EditVBStru.Text<>'' then
        OrderQuery.SQL.Add('and (vo.vbstru='''+EditVBStru.Text+''')');
      if EditVBCol.Text<>'' then
        if strtoint(EditVBCol.Text)>=100 then
          OrderQuery.SQL.Add('and (vo.vbcol='+EditVBCol.Text+')');
      if EditVBFin.Text<>'' then
        OrderQuery.SQL.Add('and (vo.vbfin='''+EditVBFin.Text+''')');
      if StartDate<>'' then
        OrderQuery.SQL.Add('and (vo.estdate>='''+StartDate+''')');
      if EndDate<>'' then
        OrderQuery.SQL.Add('and (vo.estdate<='''+EndDate+''')');
      if EditCustRef.Text<>'' then
        OrderQuery.SQL.Add('and (vh.custref='''+EditCustRef.Text+''')');
      OrderQuery.SQL.Add('group by wn.yearno,wn.weekno,vo.daterqd,vo.estdate,vo.vbstru,vo.vbcol,vo.vbfin,');
      OrderQuery.SQL.Add('vo.vbwidth,vh.custref,vh.vtordno,vo.qty,vo.qtydel,vo.qtyalloc');
      OrderQuery.SQL.Add('order by vh.custref,vh.vtordno,vo.vbstru,vo.vbcol,vo.vbfin,vo.vbwidth,wn.yearno,wn.weekno');
      OrderQuery.Prepare;
      OrderQuery.Open;
      OrderGrid.Columns.Items[0].FieldName:='CUSTREF';
      OrderGrid.Columns.Items[1].FieldName:='VTORDNO';
      OrderGrid.Columns.Items[2].FieldName:='VBTYPE';
      OrderGrid.Columns.Items[3].FieldName:='VBWIDTH';
      OrderGrid.Columns.Items[4].FieldName:='YEARNO';
      OrderGrid.Columns.Items[5].FieldName:='WEEKNO';
      OrderGrid.Columns.Items[6].FieldName:='ESTDATE';
      OrderGrid.Columns.Items[7].FieldName:='QTYREM';
      OrderGrid.Columns.Items[8].FieldName:='QTYALLOC';
      OrderGrid.Columns.Items[9].FieldName:='DATERQD';
    end;
    3: {default; sort by type,week}
    begin
      OrderQuery.Close;
      OrderQuery.SQL.Clear;
      OrderQuery.SQL.Add('select wn.yearno,wn.weekno,vo.estdate,');
      OrderQuery.SQL.Add('vo.vbstru||vo.vbcol||vo.vbfin vbtype,');
      OrderQuery.SQL.Add('vo.vbwidth,vh.custref,');
      OrderQuery.SQL.Add('vo.qty-vo.qtydel qtyrem,vh.vtordno,vo.vbstru,vo.vbcol,vo.vbfin,');
      OrderQuery.SQL.Add('vo.qtyalloc,vo.daterqd');
      OrderQuery.SQL.Add('from vbordhdr vh,wkno wn,vborddet vo');
      OrderQuery.SQL.Add('where (vo.status<>''C'')');
      OrderQuery.SQL.Add('and (vo.vtordno=vh.vtordno)');
      OrderQuery.SQL.Add('and (vo.estdate between wn.fromdate and wn.todate)');
      if EditVBStru.Text<>'' then
        OrderQuery.SQL.Add('and (vo.vbstru='''+EditVBStru.Text+''')');
      if EditVBCol.Text<>'' then
        if strtoint(EditVBCol.Text)>=100 then
          OrderQuery.SQL.Add('and (vo.vbcol='+EditVBCol.Text+')');
      if EditVBFin.Text<>'' then
        OrderQuery.SQL.Add('and (vo.vbfin='''+EditVBFin.Text+''')');
      if StartDate<>'' then
        OrderQuery.SQL.Add('and (vo.estdate>='''+StartDate+''')');
      if EndDate<>'' then
        OrderQuery.SQL.Add('and (vo.estdate<='''+EndDate+''')');
      if EditCustRef.Text<>'' then
        OrderQuery.SQL.Add('and (vh.custref='''+EditCustRef.Text+''')');
      OrderQuery.SQL.Add('group by wn.yearno,wn.weekno,vo.daterqd,vo.estdate,vo.vbstru,vo.vbcol,vo.vbfin,');
      OrderQuery.SQL.Add('vo.vbwidth,vh.custref,vh.vtordno,vo.qty,vo.qtydel,vo.qtyalloc');
      OrderQuery.SQL.Add('order by vo.vbstru,vo.vbcol,vo.vbfin,vo.vbwidth,wn.yearno,wn.weekno,vh.custref');
      OrderQuery.Prepare;
      OrderQuery.Open;
      OrderGrid.Columns.Items[0].FieldName:='VBTYPE';
      OrderGrid.Columns.Items[1].FieldName:='VBWIDTH';
      OrderGrid.Columns.Items[2].FieldName:='YEARNO';
      OrderGrid.Columns.Items[3].FieldName:='WEEKNO';
      OrderGrid.Columns.Items[4].FieldName:='ESTDATE';
      OrderGrid.Columns.Items[5].FieldName:='CUSTREF';
      OrderGrid.Columns.Items[6].FieldName:='QTYREM';
      OrderGrid.Columns.Items[7].FieldName:='VTORDNO';
      OrderGrid.Columns.Items[8].FieldName:='QTYALLOC';
      OrderGrid.Columns.Items[9].FieldName:='DATERQD';
    end;
  end; {case OrdersByRadioGrp.ItemIndex}
end;
*)
           //JT160698  reorder TFields for DataPrinter aswell
procedure TVBPickForm.OrdersByRadioGrpClick(Sender: TObject);

  procedure AddStrs(Strs: TStrings);
  begin
    with Strs do
    begin
      Add('select wn.yearno,wn.weekno,vo.estdate,');
      Add('vo.vbstru||vo.vbcol||vo.vbfin vbtype,');
      Add('vo.vbwidth,vh.custref,');
      Add('vo.qty-vo.qtydel qtyrem,vh.vtordno,vo.vbstru,vo.vbcol,vo.vbfin,');
      Add('vo.qtyalloc,vo.daterqd');
      Add('from vbordhdr vh,wkno wn,vborddet vo');
      Add('where (vo.status<>''C'')');
      Add('and (vo.vtordno=vh.vtordno)');
      Add('and (vo.estdate between wn.fromdate and wn.todate)');
      if EditVBStru.Text<>'' then
        Add('and (vo.vbstru='''+EditVBStru.Text+''')');
      if (EditVBCol.Text<>'') and (strtoint(EditVBCol.Text)>=100) then
        Add('and (vo.vbcol='+EditVBCol.Text+')');
      if EditVBFin.Text<>'' then
        Add('and (vo.vbfin='''+EditVBFin.Text+''')');
      if StartDate<>'' then
        Add('and (vo.estdate>='''+StartDate+''')');
      if EndDate<>'' then
        Add('and (vo.estdate<='''+EndDate+''')');
      if EditCustRef.Text<>'' then
        Add('and (vh.custref starting with '''+EditCustRef.Text+''')');
      Add('group by wn.yearno,wn.weekno,vo.daterqd,vo.estdate,vo.vbstru,vo.vbcol,vo.vbfin,');
      Add('vo.vbwidth,vh.custref,vh.vtordno,vo.qty,vo.qtydel,vo.qtyalloc');
    end;
  end;

var
  ix: Integer;
begin  {OrdersByRadioGrpClick}
  with OrderQuery do
    case OrdersByRadioGrp.ItemIndex of
      0: {default; sort by week,type}
      begin
        Close;
        SQL.Clear;
        AddStrs(SQL);
        SQL.Add('order by wn.yearno,wn.weekno,vo.vbstru,vo.vbcol,vo.vbfin,vo.vbwidth,vh.custref');
        Prepare;
        Open;
        OrderQueryYEARNO.Index := 0;
        OrderQueryWEEKNO.Index := 1;
        OrderQueryVBTYPE.Index := 2;
        OrderQueryESTDATE.Index := 3;
        OrderQueryVBWIDTH.Index := 4;
        OrderQueryCUSTREF.Index := 5;
        OrderQueryQTYREM.Index := 6;
        OrderQueryVTORDNO.Index := 7;
        OrderQueryQTYALLOC.Index := 8;
        OrderQueryDATERQD.Index := 9;
      end;
      1:
      begin {sort by week,client; was client,type: DL140197}
        Close;
        SQL.Clear;
        AddStrs(SQL);
        SQL.Add('order by wn.yearno,wn.weekno,vh.custref,vo.vbstru,vo.vbcol,vo.vbfin,vo.vbwidth');
        Prepare;
        Open;
        OrderQueryYEARNO.Index := 0;
        OrderQueryWEEKNO.Index := 1;
        OrderQueryESTDATE.Index := 2;
        OrderQueryCUSTREF.Index := 3;
        OrderQueryVBTYPE.Index := 4;
        OrderQueryVBWIDTH.Index := 5;
        OrderQueryQTYREM.Index := 6;
        OrderQueryVTORDNO.Index := 7;
        OrderQueryQTYALLOC.Index := 8;
        OrderQueryDATERQD.Index := 9;
      end;
      2:
      begin {sort by client,order}
        Close;
        SQL.Clear;
        AddStrs(SQL);
        SQL.Add('order by vh.custref,vh.vtordno,vo.vbstru,vo.vbcol,vo.vbfin,vo.vbwidth,wn.yearno,wn.weekno');
        Prepare;
        Open;
        OrderQueryCUSTREF.Index := 0;
        OrderQueryVTORDNO.Index := 1;
        OrderQueryVBTYPE.Index := 2;
        OrderQueryVBWIDTH.Index := 3;
        OrderQueryYEARNO.Index := 4;
        OrderQueryWEEKNO.Index := 5;
        OrderQueryESTDATE.Index := 6;
        OrderQueryQTYREM.Index := 7;
        OrderQueryQTYALLOC.Index := 8;
        OrderQueryDATERQD.Index := 9;
      end;
      3: {default; sort by type,week}
      begin
        Close;
        SQL.Clear;
        AddStrs(SQL);
        SQL.Add('order by vo.vbstru,vo.vbcol,vo.vbfin,vo.vbwidth,wn.yearno,wn.weekno,vh.custref');
        Prepare;
        Open;
        OrderQueryVBTYPE.Index := 0;
        OrderQueryVBWIDTH.Index := 1;
        OrderQueryYEARNO.Index := 2;
        OrderQueryWEEKNO.Index := 3;
        OrderQueryESTDATE.Index := 4;
        OrderQueryCUSTREF.Index := 5;
        OrderQueryQTYREM.Index := 6;
        OrderQueryVTORDNO.Index := 7;
        OrderQueryQTYALLOC.Index := 8;
        OrderQueryDATERQD.Index := 9;
      end;
    end; {case OrdersByRadioGrp.ItemIndex}
  for ix := 0 to OrderGrid.Columns.Count-1 do
    OrderGrid.Columns[ix].FieldName := OrderQuery.Fields[ix].FieldName;
end;

procedure TVBPickForm.OrderGridDblClick(Sender: TObject);
begin
  PassValue:=OrderQueryVTOrdNo.Value;
  VBOrdHdrForm:=TVBOrdHdrForm.Create(Application);
  VBOrdHdrForm.ShowModal;
  Screen.Cursor:=crDefault;
end;

procedure TVBPickForm.StockDetQueryAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TVBPickForm.StockDetQueryBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBPickForm.StockDetQueryPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.RollBack;
end;

procedure TVBPickForm.StockDetQueryEditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  ShowMessage('Edit Error');
  MainForm.Database.RollBack;
end;

procedure TVBPickForm.StockDetGridEnter(Sender: TObject);
begin
  StockDetQuery.Refresh;
  if GetRowNoQuery.Active then
  begin
    GetRowNoQuery.Close;
    ShowRowNoGrid.Visible:=false;
  end;
{  StockDetQuery.First;}
end;
(*
procedure TVBPickForm.PrintHeader;
var
{  SaveFont: TFont;}
  HeaderDescr:string;
begin
  { Save the current printer's font and assign Edit1's font to Printer }
{  SaveFont := TFont.Create;
  Savefont.Assign(Printer.Canvas.Font);
  {Printer.Canvas.Font.Assign(Edit1.Font);}
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  CurrentPageNo:=CurrentPageNo+1;
  HeaderDescr:=DateHeading+', Page '+inttostr(CurrentPageNo);

  { Print out the Header }
  with Printer do begin
    if not Printer.Aborted then
      Canvas.TextOut((PageWidth div 2)-(Canvas.TextWidth(HeaderDescr) div 2),
                      0, HeaderDescr);
    { Increment AmountPrinted by the LineHeight }
    AmountPrinted := AmountPrinted + LineHeight+TenthsOfInchPixelsY;
  end;
{  Printer.Canvas.Font.Assign(SaveFont);   { Re-assign the old font }
{  SaveFont.Free;                          { Free the saved font }
end;

procedure TVBPickForm.PrintLine(Items: TStringList);
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
procedure TVBPickForm.PrintPickedColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  with ColNames do begin
    { Create the column headers }
    AddObject('DespCust', pointer(8));
    AddObject('Order', pointer(6));
    AddObject('DateRqd', pointer(8));
    AddObject('Type', pointer(4));
    AddObject('Width', pointer(5));
    AddObject('Box', pointer(6));
    AddObject('Pallet', pointer(6));
    AddObject('NetLength', pointer(6));
    AddObject('OrdCust', pointer(7));
  end;
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;
(*           //JT210698  replaced below
procedure TVBPickForm.PickedBtnClick(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  Report1.ReportDir:=ExtractFilePath(ParamStr(0));
  Report1.ReportName:='despatch picked'; {was picked DL191197}
  {Report1.InitialValues.Add('@DespNo=<'+VBDespHdrDespNo.AsString+'>');}
  Report1.Preview:=true;
  Report1.Run;
  Screen.Cursor:=crDefault;
end;
*)      //JT210698 added picked details & summary printout
procedure TVBPickForm.PickedBtnClick(Sender: TObject);

  procedure AddSQLParams(SQL: TStrings);
  begin
    if EditVBStru.Text<>'' then
      SQL.Add('and (vr.vbstru='''+EditVBStru.Text+''')');
    if (EditVBCol.Text<>'') and (strtoint(EditVBCol.Text)>=100) then
      SQL.Add('and (vr.vbcol='+EditVBCol.Text+')');
    if EditVBFin.Text<>'' then
      SQL.Add('and (vr.vbfin='''+EditVBFin.Text+''')');
    if EditCustRef.Text<>'' then
      SQL.Add('and (vh.custref starting with '''+EditCustRef.Text+''')');
  end;

  procedure SetParams(Params: TStrings);
    procedure AddParam(var ParStr: string; const AddStr: string);
    begin
      if ParStr = '' then
        ParStr := AddStr
      else
        ParStr := ParStr + ' and ' + AddStr;
    end;
  var
    st: string;
  begin
    Params.Clear;
    Params.Add('As at ' + FormatDateTime('dddd, mmmm d, yyyy hh:mm am/pm', Now) +
      ' - Current Week: ' + EditWeekNo.Text);
    st := '';
    if EditVBStru.Text <> '' then
      AddParam(st, 'VB Stru = ' + EditVBStru.Text);
    if (EditVBCol.Text <> '') and (StrToInt(EditVBCol.Text) >= 100) then
      AddParam(st, 'VB Colour = ' + EditVBCol.Text);
    if EditVBFin.Text <> '' then
      AddParam(st, 'VB Finish = ' + EditVBFin.Text);
    if EditCustRef.Text <> '' then
      AddParam(st, 'Cust Ref starting with "' + EditCustRef.Text + '"');
    if st <> '' then
      Params.Add('Where ' + st);
  end;

  procedure PrintDetails;
  begin
    CustRef := '';      //form variables for printing group subtotals
    VTOrdNo := 0;           // - see DataPrinterBeforeRowPrint
    VBType := '';
    TotalLength := 0;
    with PickDetailQuery do
    begin
      SQL.Clear;
      SQL.Add('select vh.custref,vr.despno,vr.vtordno,vr.daterqd,');
      SQL.Add('vr.vbstru||vr.vbcol||vr.vbfin vbtype,vr.metricwidth,vr.boxno,vr.lotno,');
      SQL.Add('vr.palletno,sum(vr.netlength) netlength,voh.custref ordcustref,vr.rowno');
      SQL.Add('from vbrcpt vr left join vbdesphdr vh on vbrcpt.despno=vbdesphdr.despno,');
      SQL.Add('vbordhdr voh');
      SQL.Add('where ((vbdesphdr.despsent="N") or (vr.despno=0))');
      SQL.Add('and vr.vtordno=voh.vtordno');
      AddSQLParams(SQL);
      SQL.Add('group by vh.custref,vr.vbstru,vr.vbcol,vr.metricwidth,vr.boxno,vr.vtordno,');
      SQL.Add('vr.palletno,voh.custref,vr.daterqd,vr.despno,vr.rowno,vr.vbfin,vr.lotno');
      SQL.Add('order by voh.custref,vr.vtordno,vr.daterqd,vr.vbstru,vr.vbcol,vr.vbfin,vr.metricwidth,vr.boxno');
      Open;
      DataPrinter.DataSet := PickDetailQuery;
      DataPrinter.Title := 'Picked Boxes - Details';
      SetParams(DataPrinter.SubTitles);
//    DataPrinter.Script.Add('Grouped by Type');
      DataPrinter.Print;
      Close;
    end;
  end;

  procedure PrintSummary;
  begin
    with PickSummaryQuery do
    begin
      SQL.Clear;
      SQL.Add('select vh.custref,vr.vtordno,vr.daterqd,vr.vbstru||vr.vbcol||vr.vbfin vbtype,');
      SQL.Add('vr.metricwidth,sum(vr.netlength) netlength,voh.custref as ordcustref');
      SQL.Add('from vbrcpt vr left join vbdesphdr vh on vbrcpt.despno=vbdesphdr.despno,');
      SQL.Add('vbordhdr voh');
      SQL.Add('where ((vbdesphdr.despsent="N") or (vr.despno=0))');
      SQL.Add('and vr.vtordno = voh.vtordno');
      AddSQLParams(SQL);
      SQL.Add('group by vh.custref,vr.vtordno,vr.daterqd,vr.vbstru,vr.vbcol,vr.vbfin,');
      SQL.Add('vr.metricwidth,voh.custref');
      Open;
      DataPrinter.DataSet := PickSummaryQuery;
      DataPrinter.Title := 'Picked Boxes - Summary';
      SetParams(DataPrinter.SubTitles);
      DataPrinter.Print;
      Close;
    end;
  end;

  procedure PrintOriginal;
  begin
    Report1.ReportDir:=ExtractFilePath(ParamStr(0));
    Report1.ReportName:='despatch picked'; {was picked DL191197}
    {Report1.InitialValues.Add('@DespNo=<'+VBDespHdrDespNo.AsString+'>');}
    Report1.Preview:=true;
    Report1.Run;
  end;

begin {PickedBtnClick}
  with TVBPickRepForm.Create(Application) do
  try
    Screen.Cursor := crHourGlass;
    if ShowModal = ID_OK then
      case KindRadios.ItemIndex of
        0: PrintDetails;
        1: PrintSummary;
        2: PrintOriginal;
      end;
  finally
    Screen.Cursor := crDefault;
    Free;
  end;
end;
(*      //JT230698     redone below
procedure TVBPickForm.UnPickedBtnClick(Sender: TObject);
var
  Items: TStringList;
  TempStr:string[20];
begin
  Screen.Cursor:=crHourGlass;
  CurrentPageNo:=0;
  DateHeading:='Unpicked Boxes as at '+FormatDateTime('dddd, mmmm d, yyyy hh:mm AM/PM',Now);
  Items := TStringList.Create;              { Create a new TStringList }
  PixelsInInchx := GetDeviceCaps(Printer.Handle, LOGPIXELSX); { Get Pixels per inch horizonally}
  TenthsOfInchPixelsY := GetDeviceCaps(Printer.Handle, LOGPIXELSY) div 10;

  AmountPrinted := 0;
  try
{    ColReportForm.Enabled := false;                    { Disable the parent Form }
    Printer.BeginDoc;                                  { Initiate a print job }
{    AbortForm.Show;
    Application.ProcessMessages;                       { Allow Drawing of abort box }
    { Calculate an arbitrary line height }
    LineHeight := Printer.Canvas.TextHeight('X')+TenthsOfInchPixelsY;
    PrintHeader;                                     { Print the header }
    PrintPickedColumnNames;                          { Print the column Names }
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,vr.vbfin,vr.metricwidth,vr.boxno,vr.vtordno,vr.palletno,sum(vr.netlength) netlength,vh.custref,vr.daterqd');
    MyQuery.SQL.Add('from vbrcpt vr left join vbdesphdr vh');
    MyQuery.SQL.Add('on vbrcpt.despno=vbdesphdr.despno');
    MyQuery.SQL.Add('where ((vbdesphdr.despsent=''N'')');
    MyQuery.SQL.Add('or (vr.despno=0))');
    MyQuery.SQL.Add('and (vr.vtordno=0)');
    MyQuery.SQL.Add('and (vr.palletno<>0)');
    MyQuery.SQL.Add('group by vh.custref,vr.vbstru,vr.vbcol,vr.vbfin,vr.metricwidth,vr.boxno,vr.vtordno,vr.palletno,vr.daterqd');
    MyQuery.SQL.Add('order by vh.custref,vr.vtordno,vr.daterqd,vr.vbstru,vr.vbcol,vr.vbfin,vr.metricwidth,vr.palletno,vr.boxno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    { Add the data in the fields into a TStringList in the order that they are }
    { Going to be printed }
    while not MyQuery.EOF do
    begin
{      Application.ProcessMessages;
      if Printer.Aborted then
        exit;}
      with Items do begin
        AddObject(MyQuery.FieldByName('CUSTREF').AsString,pointer(8));
        AddObject(MyQuery.FieldByName('VTORDNO').AsString,pointer(6));
        TempStr:=FormatDateTime('dd/mm/yyyy', MyQuery.FieldByName('DATERQD').AsFloat);
        AddObject(TempStr,pointer(8));
        TempStr:=MyQuery.FieldByName('VBSTRU').AsString+
          MyQuery.FieldByName('VBCOL').AsString+
          MyQuery.FieldByName('VBFIN').AsString;
        AddObject(TempStr,pointer(6));
        AddObject(MyQuery.FieldByName('METRICWIDTH').AsString,pointer(5));
        AddObject(MyQuery.FieldByName('BOXNO').AsString,pointer(6));
        AddObject(MyQuery.FieldByName('PALLETNO').AsString,pointer(6));
        TempStr:=FormatFloat('0.0;0.0', MyQuery.FieldByName('NETLENGTH').AsFloat);
        AddObject(TempStr,pointer(6));
{        TempStr:=FormatFloat('#', MyQuery.FieldByName('ORD2070').AsFloat);
        AddObject(TempStr,pointer(6));}
      end;
      PrintLine(Items);   { Print the line }
      { Force printjob to begin a new page if printed output has exceeded the }
      { Page height }
      if AmountPrinted + LineHeight > Printer.PageHeight then
      begin
        AmountPrinted := 0;         { Reset to zero }
        if not Printer.Aborted then
          Printer.NewPage;          { Force page eject }
        PrintHeader;                { Print the header again }
        PrintPickedColumnNames;           { Print the column names again }
      end;
      Items.Clear;                  { Clear this record from the TStringList }
      MyQuery.Next;                  { Go to the next record }
    end;
{    AbortForm.Hide;                 { Hide the abort form, no longer needed }
    if not Printer.Aborted then
      Printer.EndDoc;               { End the print job }
{    ColReportForm.Enabled := true;}
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end;
  Items.Clear;
  Items.Free;                       { Free the TStringList }
  MyQuery.Close;
  Screen.Cursor:=crDefault;
end;*)
         //JT240698   print group totals
procedure TVBPickForm.DataPrinterBeforeRowPrint(Sender: TObject;
  var RowTop: Integer);
begin
  if DataPrinter.DataSet = PickDetailQuery then
  begin
    if (CustRef <> PickDetailQueryCustRef.AsString) or
       (DespNo <> PickDetailQueryDespNo.AsInteger) or
       (VTOrdNo <> PickDetailQueryVTOrdNo.AsInteger) or
       (DateRqd <> PickDetailQueryDateRqd.AsDateTime) or
       (VBType <> PickDetailQueryVBType.AsString) or
       (MetricWidth <> PickDetailQueryMetricWidth.AsInteger) then
    begin        //start of new group so print subtotal of last
      if VBType <> '' then    //if not starting first group
      begin           //then print subtotal
        //this prints outside the component using the printer
        //object which is global to the whole program
        //no check for page end required here - DataPrinter prints col headers before this event
//        Printer.Canvas.TextOut({585}1250, RowTop, 'Total:  ' +
//          Format('%*.*f', [6, 1, TotalLength]));
        Printer.Canvas.Font.Style := [fsUnderline];
        Printer.Canvas.TextOut(DataPrinter.Margin, RowTop,
          '                                                   ' +
          '                                                   ' +
          'Total:  ' + Format('%*.*f', [6, 1, TotalLength]) + 'm' +
          '                                                   ');
        Printer.Canvas.Font.Style := [];
        Inc(RowTop, Round(Printer.Canvas.TextHeight('A') * 1.5));  //row & gap
      end;
      //update group variables -
      TotalLength := PickDetailQueryNetLength.AsFloat;
      CustRef := PickDetailQueryCustRef.AsString;
      DespNo := PickDetailQueryDespNo.AsInteger;
      VTOrdNo := PickDetailQueryVTOrdNo.AsInteger;
      DateRqd := PickDetailQueryDateRqd.AsDateTime;
      VBType := PickDetailQueryVBType.AsString;
      MetricWidth := PickDetailQueryMetricWidth.AsInteger;
    end
    else        //within group so increment subtotal
      TotalLength := TotalLength + PickDetailQueryNetLength.AsFloat;
  end;
end;

procedure TVBPickForm.DataPrinterAfterFinishPrint(Sender: TObject;
  var RowTop: Integer);
begin            //print last group's subtotal
  if DataPrinter.DataSet = PickDetailQuery then
  begin
    if RowTop + Printer.Canvas.TextHeight('A') > Printer.PageHeight then
    begin
      Printer.NewPage;       //start new page
      RowTop := 0;
    end;
//    Printer.Canvas.TextOut({585}1250, RowTop, 'Total:  ' +
//      Format('%*.*f', [6, 1, TotalLength]));
      Printer.Canvas.TextOut(DataPrinter.Margin, RowTop,
        '                                                   ' +
        '                                                   ' +
        'Total:  ' + Format('%*.*f', [6, 1, TotalLength]) + 'm' +
        '                                                   ');
  end;
end;
      //JT230698         - to upgrade
procedure TVBPickForm.UnPickedBtnClick(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  try
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select vr.vbstru,vr.vbcol,vr.vbfin,vr.metricwidth,vr.boxno,vr.vtordno,vr.palletno,sum(vr.netlength) netlength,vh.custref,vr.daterqd');
    MyQuery.SQL.Add('from vbrcpt vr left join vbdesphdr vh');
    MyQuery.SQL.Add('on vbrcpt.despno=vbdesphdr.despno');
    MyQuery.SQL.Add('where ((vbdesphdr.despsent=''N'')');
    MyQuery.SQL.Add('or (vr.despno=0))');
    MyQuery.SQL.Add('and (vr.vtordno=0)');
    MyQuery.SQL.Add('and (vr.palletno<>0)');
    MyQuery.SQL.Add('group by vh.custref,vr.vbstru,vr.vbcol,vr.vbfin,vr.metricwidth,vr.boxno,vr.vtordno,vr.palletno,vr.daterqd');
    MyQuery.SQL.Add('order by vh.custref,vr.vtordno,vr.daterqd,vr.vbstru,vr.vbcol,vr.vbfin,vr.metricwidth,vr.palletno,vr.boxno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    DataPrinter.DataSet := MyQuery;
    DataPrinter.Title := 'Unpicked Boxes';
    DataPrinter.SubTitles.Clear;
    DataPrinter.SubTitles.Add('As at ' +
      FormatDateTime('dddd, mmmm d, yyyy hh:mm am/pm', Now) +
      ' - Current Week: ' + EditWeekNo.Text);
    DataPrinter.Print;
    MyQuery.Close;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TVBPickForm.EditVBStruChange(Sender: TObject);
begin
  EditVBStru.Text:=uppercase(EditVBStru.Text);
  if (length(EditVBStru.Text)=0) or (length(EditVBStru.Text)=1) then
    OrdersByRadioGrpClick(Sender);
end;

procedure TVBPickForm.EditVBColChange(Sender: TObject);
begin
  if (length(EditVBCol.Text)=0) or (length(EditVBCol.Text)=3) then
    OrdersByRadioGrpClick(Sender);
end;

procedure TVBPickForm.EditStartDateExit(Sender: TObject);
begin
  if EditStartDate.Text<>'' then
  begin
    try
      StartDate:=FormatDateTime('dd mmm yyyy',strtodate(EditStartDate.Text)); {dd mmm yyyy}
      OrdersByRadioGrpClick(Sender);
    except
      ShowMessage('Invalid Date');
      Abort;
    end;
  end
  else
  begin
    StartDate:='';
    OrdersByRadioGrpClick(Sender);
  end;
end;

procedure TVBPickForm.EditEndDateExit(Sender: TObject);
begin
  if EditEndDate.Text<>'' then
  begin
    try
      EndDate:=FormatDateTime('dd mmm yyyy',strtodate(EditEndDate.Text)); {dd mmm yyyy}
      OrdersByRadioGrpClick(Sender);
    except
      ShowMessage('Invalid Date');
      Abort;
    end;
  end
  else
  begin
    EndDate:='';
    OrdersByRadioGrpClick(Sender);
  end;
end;
(*      JT190698   replaced below
procedure TVBPickForm.PrintOrdersColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  case OrdersByRadioGrp.ItemIndex of
    0:{week,type}
    begin
      with ColNames do begin
        { Create the column headers }
        AddObject('Year', pointer(4));
        AddObject('Week', pointer(4));
        AddObject('Est', pointer(8));
        AddObject('Rqd', pointer(8));
        AddObject('Type', pointer(4));
        AddObject('Width', pointer(5));
        AddObject('Cust', pointer(6));
        AddObject('QtyRem', pointer(6));
        AddObject('VTOrdNo', pointer(7));
      end;
    end; {week,type}
    1:{week,client}
    begin
      with ColNames do begin
        { Create the column headers }
        AddObject('Year', pointer(4));
        AddObject('Week', pointer(4));
        AddObject('Est', pointer(8));
        AddObject('Rqd', pointer(8));
        AddObject('Cust', pointer(6));
        AddObject('Type', pointer(4));
        AddObject('Width', pointer(5));
        AddObject('QtyRem', pointer(6));
        AddObject('VTOrdNo', pointer(7));
      end;
    end; {client,type}
    2:{client,order}
    begin
      with ColNames do begin
        { Create the column headers }
        AddObject('Cust', pointer(6));
        AddObject('VTOrdNo', pointer(7));
        AddObject('Type', pointer(4));
        AddObject('Width', pointer(5));
        AddObject('Year', pointer(4));
        AddObject('Week', pointer(4));
        AddObject('Est', pointer(8));
        AddObject('Rqd', pointer(8));
        AddObject('QtyRem', pointer(6));
        AddObject('Alloc', pointer(6));
      end;
    end; {client,order}
    3:{type,week}
    begin
      with ColNames do begin
        { Create the column headers }
        AddObject('Type', pointer(4));
        AddObject('Width', pointer(5));
        AddObject('Year', pointer(4));
        AddObject('Week', pointer(4));
        AddObject('Est', pointer(8));
        AddObject('Rqd', pointer(8));
        AddObject('Cust', pointer(6));
        AddObject('QtyRem', pointer(6));
        AddObject('VTOrdNo', pointer(7));
      end;
    end; {type,week}
  end;  {case OrdersByRadioGrp.ItemIndex of}
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;

procedure TVBPickForm.OrdersBtnClick(Sender: TObject);
var
  Items: TStringList;
  TempStr:string[20];
  MyBookmark: TBookmark;
begin
  Screen.Cursor:=crHourGlass;
  CurrentPageNo:=0;
  MyBookMark:=OrderQuery.GetBookMark;
  case OrdersByRadioGrp.ItemIndex of
    0:DateHeading:='Orders By Week,Type as at '+FormatDateTime('dddd, mmmm d, yyyy hh:mm AM/PM',Now)+'; Current Week='+EditWeekNo.Text;
    1:DateHeading:='Orders By Week,Client as at '+FormatDateTime('dddd, mmmm d, yyyy hh:mm AM/PM',Now)+'; Current Week='+EditWeekNo.Text;
    2:DateHeading:='Orders By Client,Order as at '+FormatDateTime('dddd, mmmm d, yyyy hh:mm AM/PM',Now)+'; Current Week='+EditWeekNo.Text;
    3:DateHeading:='Orders By Type,Week as at '+FormatDateTime('dddd, mmmm d, yyyy hh:mm AM/PM',Now)+'; Current Week='+EditWeekNo.Text;
  end; {case OrdersByRadioGrp.ItemIndex}
  Items := TStringList.Create;              { Create a new TStringList }
  PixelsInInchx := GetDeviceCaps(Printer.Handle, LOGPIXELSX); { Get Pixels per inch horizonally}
  TenthsOfInchPixelsY := GetDeviceCaps(Printer.Handle, LOGPIXELSY) div 10;
  AmountPrinted := 0;
  try
{    ColReportForm.Enabled := false;                    { Disable the parent Form }
    Printer.BeginDoc;                                  { Initiate a print job }
{    AbortForm.Show;
    Application.ProcessMessages;                       { Allow Drawing of abort box }
    { Calculate an arbitrary line height }
    LineHeight := Printer.Canvas.TextHeight('X')+TenthsOfInchPixelsY;
    PrintHeader;                                     { Print the header }
    PrintOrdersColumnNames;                          { Print the column Names }
    OrderQuery.First;
    { Add the data in the fields into a TStringList in the order that they are }
    { Going to be printed }
    while not OrderQuery.EOF do
    begin
{      Application.ProcessMessages;
      if Printer.Aborted then
        exit;}
      case OrdersByRadioGrp.ItemIndex of
        0:{week,type}
        begin
          with Items do begin
            AddObject(OrderQuery.FieldByName('YEARNO').AsString,pointer(4));
            AddObject(OrderQuery.FieldByName('WEEKNO').AsString,pointer(4));
            TempStr:=FormatDateTime('dd/mm/yyyy', OrderQuery.FieldByName('ESTDATE').AsFloat);
            AddObject(TempStr,pointer(8));
            TempStr:=FormatDateTime('dd/mm/yyyy', OrderQuery.FieldByName('DATERQD').AsFloat);
            AddObject(TempStr,pointer(8));
            TempStr:=OrderQuery.FieldByName('VBTYPE').AsString;
            AddObject(TempStr,pointer(4));
            AddObject(OrderQuery.FieldByName('VBWIDTH').AsString,pointer(5));
            AddObject(OrderQuery.FieldByName('CUSTREF').AsString,pointer(6));
            {TempStr:=FormatFloat('0.0;0.0', OrderQuery.FieldByName('QTYREM').AsFloat);
            AddObject(TempStr,pointer(6));}
            TempStr:=FormatFloat('0;0', OrderQuery.FieldByName('QTYREM').AsFloat);
            AddObject(TempStr,pointer(6));
            AddObject(OrderQuery.FieldByName('VTORDNO').AsString,pointer(7));
          end; {with Items}
        end; {week,type}
        1:{week,client}
        begin
          with Items do begin
            AddObject(OrderQuery.FieldByName('YEARNO').AsString,pointer(4));
            AddObject(OrderQuery.FieldByName('WEEKNO').AsString,pointer(4));
            TempStr:=FormatDateTime('dd/mm/yyyy', OrderQuery.FieldByName('ESTDATE').AsFloat);
            AddObject(TempStr,pointer(8));
            TempStr:=FormatDateTime('dd/mm/yyyy', OrderQuery.FieldByName('DATERQD').AsFloat);
            AddObject(TempStr,pointer(8));
            AddObject(OrderQuery.FieldByName('CUSTREF').AsString,pointer(6));
            TempStr:=OrderQuery.FieldByName('VBTYPE').AsString;
            AddObject(TempStr,pointer(4));
            AddObject(OrderQuery.FieldByName('VBWIDTH').AsString,pointer(5));
            TempStr:=FormatFloat('0;0', OrderQuery.FieldByName('QTYREM').AsFloat);
            AddObject(TempStr,pointer(6));
            AddObject(OrderQuery.FieldByName('VTORDNO').AsString,pointer(7));
          end; {with Items}
        end; {client,type}
        2:{client,order}
        begin
          with Items do begin
            AddObject(OrderQuery.FieldByName('CUSTREF').AsString,pointer(6));
            AddObject(OrderQuery.FieldByName('VTORDNO').AsString,pointer(7));
            TempStr:=OrderQuery.FieldByName('VBTYPE').AsString;
            AddObject(TempStr,pointer(4));
            AddObject(OrderQuery.FieldByName('VBWIDTH').AsString,pointer(5));
            AddObject(OrderQuery.FieldByName('YEARNO').AsString,pointer(4));
            AddObject(OrderQuery.FieldByName('WEEKNO').AsString,pointer(4));
            TempStr:=FormatDateTime('dd/mm/yyyy', OrderQuery.FieldByName('ESTDATE').AsFloat);
            AddObject(TempStr,pointer(8));
            TempStr:=FormatDateTime('dd/mm/yyyy', OrderQuery.FieldByName('DATERQD').AsFloat);
            AddObject(TempStr,pointer(8));
            TempStr:=FormatFloat('0;0', OrderQuery.FieldByName('QTYREM').AsFloat);
            AddObject(TempStr,pointer(6));
            TempStr:=FormatFloat('0;0', OrderQuery.FieldByName('ALLOCATED').AsFloat);
            AddObject(TempStr,pointer(6));
          end; {with Items}
        end; {client,order}
        3:{type,week}
        begin
          with Items do begin
            TempStr:=OrderQuery.FieldByName('VBTYPE').AsString;
            AddObject(TempStr,pointer(4));
            AddObject(OrderQuery.FieldByName('VBWIDTH').AsString,pointer(5));
            AddObject(OrderQuery.FieldByName('YEARNO').AsString,pointer(4));
            AddObject(OrderQuery.FieldByName('WEEKNO').AsString,pointer(4));
            TempStr:=FormatDateTime('dd/mm/yyyy', OrderQuery.FieldByName('ESTDATE').AsFloat);
            AddObject(TempStr,pointer(8));
            TempStr:=FormatDateTime('dd/mm/yyyy', OrderQuery.FieldByName('DATERQD').AsFloat);
            AddObject(TempStr,pointer(8));
            AddObject(OrderQuery.FieldByName('CUSTREF').AsString,pointer(6));
            TempStr:=FormatFloat('0;0', OrderQuery.FieldByName('QTYREM').AsFloat);
            AddObject(TempStr,pointer(6));
            AddObject(OrderQuery.FieldByName('VTORDNO').AsString,pointer(7));
          end; {with Items}
        end; {type,week}
      end;  {case OrdersByRadioGrp.ItemIndex of}
      PrintLine(Items);   { Print the line }
      { Force printjob to begin a new page if printed output has exceeded the }
      { Page height }
      if AmountPrinted + LineHeight > Printer.PageHeight then
      begin
        AmountPrinted := 0;         { Reset to zero }
        if not Printer.Aborted then
          Printer.NewPage;          { Force page eject }
        PrintHeader;                { Print the header again }
        PrintOrdersColumnNames;           { Print the column names again }
      end;
      Items.Clear;                  { Clear this record from the TStringList }
      OrderQuery.Next;                  { Go to the next record }
    end;
{    AbortForm.Hide;                 { Hide the abort form, no longer needed }
    if not Printer.Aborted then
      Printer.EndDoc;               { End the print job }
{    ColReportForm.Enabled := true;}
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end;
  Items.Clear;
  Items.Free;                       { Free the TStringList }
  Screen.Cursor:=crDefault;
  OrderQuery.GotoBookMark(MyBookMark);
  OrderQuery.FreeBookmark(MyBookmark);
end;
*)
procedure TVBPickForm.OrdersBtnClick(Sender: TObject);  //JT190698
  procedure AddParam(var ParStr: string; const AddStr: string);
  begin
    if ParStr = '' then
      ParStr := AddStr
    else
      ParStr := ParStr + ' and ' + AddStr;
  end;
var
  st: string;
begin
  DataPrinter.SubTitles.Clear;
  case OrdersByRadioGrp.ItemIndex of
    0: st := 'By Week, Type' + st;
    1: st := 'By Week, Client' + st;
    2: st := 'By Client, Order' + st;
    3: st := 'By Type, Week' + st;
  end;
  DataPrinter.SubTitles.Add(st + ' as at ' +
    FormatDateTime('dddd, mmmm d, yyyy hh:mm am/pm', Now) +
    ' - Current Week: ' + EditWeekNo.Text);
//  OrdersRepForm := TOrdersRepForm.Create(Application);
  OrderQuery.DisableControls;
  try
//    OrdersRepForm.ParamsMemo.Lines.Add(st);
    st := '';
    if EditVBStru.Text <> '' then
      AddParam(st, 'VB Stru = ' + EditVBStru.Text);
    if (EditVBCol.Text <> '') and (StrToInt(EditVBCol.Text) >= 100) then
      AddParam(st, 'VB Colour = ' + EditVBCol.Text);
    if EditVBFin.Text <> '' then
      AddParam(st, 'VB Finish = ' + EditVBFin.Text);
    if EditStartDate.Text <> '' then
      AddParam(st, 'Est Date is >= ' + EditStartDate.Text);
    if EditEndDate.Text <> '' then
      AddParam(st, 'Est Date is <= ' + EditEndDate.Text);
    if EditCustRef.Text <> '' then
      AddParam(st, 'Cust Ref starting with "' + EditCustRef.Text + '"');
    if st <> '' then
//    OrdersRepForm.ParamsMemo.Lines.Add('Where ' + st);
    DataPrinter.SubTitles.Add('Where ' + st);
//  OrdersRepForm.OrdersRep.Preview;
{   for ix := 0 to OrderQuery.FieldCount-1 do
      with OrderQuery.Fields[ix] do
        DisplayWidth := DisplayWidth + 2;  //print columns wider}
    DataPrinter.DataSet := OrderQuery;
    DataPrinter.Title := 'Vertical Blind Orders';
    DataPrinter.Print;
{   for ix := 0 to OrderQuery.FieldCount-1 do
      with OrderQuery.Fields[ix] do
        DisplayWidth := DisplayWidth - 2;}
  finally
    OrderQuery.EnableControls;
//    OrdersRepForm.Release;
  end;
end;

procedure TVBPickForm.RefreshBtnClick(Sender: TObject);
var
  OrderQueryBookmark: TBookmark;
  StockLotQueryBookmark: TBookmark;
  StockDetQueryBookmark: TBookmark;
begin
  OrderQueryBookMark:=OrderQuery.GetBookMark;
  StockLotQueryBookMark:=StockLotQuery.GetBookMark;
  StockDetQueryBookmark:=StockDetQuery.GetBookMark;
  StockDetQuery.Close;
  StockLotQuery.Close;
  OrderQuery.Close;
  OrderQuery.Open;
  OrderQuery.GotoBookMark(OrderQueryBookMark);
  OrderQuery.FreeBookmark(OrderQueryBookmark);
  StockLotQuery.Open;
  StockLotQuery.GotoBookMark(StockLotQueryBookMark);
  StockLotQuery.FreeBookMark(StockLotQueryBookMark);
  StockDetQuery.Open;
  StockDetQuery.GotoBookMark(StockDetQueryBookMark);
  StockDetQuery.FreeBookMark(StockDetQueryBookMark);
end;

procedure TVBPickForm.StockDetGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift <> [ssShift] then Exit;  //added JT10798
  GetRowNoQuery.Params[0].AsInteger:=StockDetQueryBoxNo.AsInteger;
  GetRowNoQuery.Open;
  ShowRowNoGrid.Visible:=true;
end;

procedure TVBPickForm.StockDetGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  GetRowNoQuery.Close;
  ShowRowNoGrid.Visible:=false;
end;

procedure TVBPickForm.EditVBFinChange(Sender: TObject);
begin
  EditVBFin.Text:=uppercase(EditVBFin.Text);
  if (length(EditVBFin.Text)=0) or (length(EditVBFin.Text)=2) then
    OrdersByRadioGrpClick(Sender);
end;

procedure TVBPickForm.EditCustRefExit(Sender: TObject);
begin
  EditCustRef.Text:=uppercase(EditCustRef.Text);
  OrdersByRadioGrpClick(Sender);
end;

procedure TVBPickForm.rdgBoxSortClick(Sender: TObject);
begin
  if rdgBoxSort.ItemIndex=0 then // sort by box number
  begin
    StockDetQuery.Close;
    StockDetQuery.IndexName:='IVBD_TWLB';
    StockDetQuery.Open;
  end
  else // sort by allowance
  begin
    StockDetQuery.Close;
    StockDetQuery.IndexName:='IVBD_TWLA';
    StockDetQuery.Open;
  end;
end;

procedure TVBPickForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TVBPickForm.VbParamsBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBPickForm.VbParamsAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

end.
