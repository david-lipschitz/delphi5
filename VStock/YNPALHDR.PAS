unit Ynpalhdr;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, Mask, ExtCtrls,
  DBLookup, Buttons, Dialogs;

type
  TYnPalHdrForm = class(TForm)
    ScrollBox: TScrollBox;
    EditDESPNO: TDBEdit;
    Label3: TLabel;
    EditDESPDATE: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    EditBoxes: TDBEdit;
    Label6: TLabel;
    EditQTYDESP: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    EditWAYBILLNO: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    YnDespHdrSource: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    YnDespHdr: TTable;
    YnDespHdrDESPNO: TIntegerField;
    YnDespHdrCUSTREF: TStringField;
    YnDespHdrDESPDATE: TDateTimeField;
    YnDespHdrDESPBY: TStringField;
    YnDespHdrBOXES: TSmallintField;
    YnDespHdrQTYDESP: TFloatField;
    YnDespHdrTRANSBY: TStringField;
    Label9: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    EditTransBy: TDBLookupCombo;
    Label11: TLabel;
    Agent: TTable;
    AgentSource: TDataSource;
    CalSpdBtn: TSpeedButton;
    ModeIndicator: TLabel;
    ActiveSource: TDataSource;
    YnPalletGrid: TDBGrid;
    CustSpdBtn: TSpeedButton;
    EditCustRef: TDBEdit;
    YarnType: TTable;
    YarnTypeYNSTRU: TStringField;
    YarnTypeYNCOL: TStringField;
    YarnTypeINSTOCK: TFloatField;
    YnDespHdrWAYBILLNO: TStringField;
    YnDespHdrSEALS: TStringField;
    YnDespHdrCONTREF: TStringField;
    YnDespHdrVTCONTREF: TStringField;
    YnDespHdrEXPORTER: TStringField;
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
    YnDespHdrCUSTORDNO: TStringField;
    EditCustOrNo: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    YarnTypeYNTWIST: TStringField;
    DespSearchSpdBtn: TSpeedButton;
    YnDespHdrDESPSENT: TStringField;
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
    PalletQueryLOTNO1: TSmallintField;
    PalletQueryLOTNO2: TSmallintField;
    PalletQueryYNSTRU: TStringField;
    PalletQueryYNTWIST: TStringField;
    PalletQueryYNCOL: TStringField;
    PalletQueryYNQLTY: TStringField;
    PalletQueryYnNetSum: TFloatField;
    PalletQueryBoxesCount: TIntegerField;
    PalletCountQuery: TQuery;
    CheckPalletExistsQuery: TQuery;
    CheckPalletExistsQueryPALLETNO: TIntegerField;
    CheckPalletExistsQueryDESPNO: TIntegerField;
    UpdateYarnRcptQuery: TQuery;
    Label21: TLabel;
    YnDespHdrPALLETS: TSmallintField;
    EditPallets: TDBEdit;
    ShowPallets: TButton;
    PrintPalletList: TButton;
    PrintPalListQuery: TQuery;
    SPDespNo: TStoredProc;
    SPBatchRef: TStoredProc;
    YnDespHdrBATREF: TIntegerField;
    Label22: TLabel;
    ShowBatRef: TDBEdit;
    YnDespHdrDATEENT: TDateTimeField;
    YnDespHdrUSERENT: TStringField;
    YnDespHdrDATEMOD: TDateTimeField;
    YnDespHdrUSERMOD: TStringField;
    Label23: TLabel;
    PostBtn: TButton;
    CancelBtn: TButton;
    Label24: TLabel;
    ShowDateEnt: TDBEdit;
    ShowUserEnt: TDBEdit;
    ShowDateMod: TDBEdit;
    ShowUserMod: TDBEdit;
    CloseBitBtn: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure CalSpdBtnClick(Sender: TObject);
    procedure YnDespHdrSourceStateChange(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure YnPalletGridExit(Sender: TObject);
    procedure YnDespHdrBeforeClose(DataSet: TDataset);
    procedure YnDespHdrAfterPost(DataSet: TDataset);
    procedure CustSpdBtnClick(Sender: TObject);
    procedure YnDespHdrBeforeInsert(DataSet: TDataset);
    procedure YnDespHdrBeforeCancel(DataSet: TDataset);
    procedure YnDespHdrAfterCancel(DataSet: TDataset);
    procedure YnDespHdrBeforeDelete(DataSet: TDataset);
    procedure YnDespHdrNewRecord(DataSet: TDataset);
    procedure SortBtnClick(Sender: TObject);
    procedure DespSearchSpdBtnClick(Sender: TObject);
    procedure YnDespHdrBeforeEdit(DataSet: TDataset);
    procedure EditPalletBarCodeChange(Sender: TObject);
    procedure EditDESPNOChange(Sender: TObject);
    procedure YnDespHdrDESPSENTValidate(Sender: TField);
    procedure ShowPalletsClick(Sender: TObject);
    procedure PrintPalletListClick(Sender: TObject);
    procedure YnDespHdrDESPDATEChange(Sender: TField);
    procedure YnDespHdrAfterDelete(DataSet: TDataSet);
    procedure YnDespHdrDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure YnDespHdrBeforePost(DataSet: TDataSet);
  private
    { private declarations }
    NoCommit: Boolean;
    CancelInProgress : Boolean;
    DeleteDets : Boolean;
    PalletBarCodeType,PalletNo:integer;
    Closing:boolean;  {set true when form is closing}
{    PalletQueryOpen:boolean;}
    PixelsInInchx: integer;       { Stores Pixels per inch }
    LineHeight: Integer;          { Stores the line height }
    AmountPrinted: integer;       { Stores amount, in pixels, printed on a page }
    TenthsOfInchPixelsY: integer; { Pixels in 1/10 of an inch used for line spacing }
    RedisplayOk:boolean; {added DL260597 so that search can take place}
    procedure DeleteItems;
    procedure RedisplayQueries;
    procedure PrintLine(Items: TStringList);
    procedure PrintHeader;
    procedure PrintColumnNames;
  public
    { public declarations }
  end;

var
  YnPalHdrForm: TYnPalHdrForm;

implementation

uses Main, PickDate, Utils, BrModal,
  printers, abortbx;

{$R *.DFM}

procedure TYnPalHdrForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if YnDespHdr.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post this despatch before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  YnDespHdr.Close;
  YnPalHdrForm.Release;
end;

procedure TYnPalHdrForm.FormShow(Sender: TObject);
begin
  RedisplayOk:=false;
  PalletQuery.Close;
  PalletCountQuery.Close;
  CheckPalletExistsQuery.Close;
  UpdateYarnRcptQuery.Close;

  YnDespHdr.Open;
{  YarnRcpt.Open;}
  YarnType.Open;
  Agent.Open;
  InvFrom.Open;
{  MainForm.Database.StartTransaction;}
  YnDespHdr.Refresh;
{  YarnRcpt.Refresh;}
  YarnType.Refresh;
  Agent.Refresh;
  InvFrom.Refresh;

  CancelInProgress:=false;
  NoCommit:=false;
  DeleteDets:=false;
  Closing:=false;
end;

procedure TYnPalHdrForm.CloseBitBtnClick(Sender: TObject);
begin
  Closing:=true;
  PalletQuery.Close;
  PalletCountQuery.Close;
  CheckPalletExistsQuery.Close;
  UpdateYarnRcptQuery.Close;
  Close;
end;

procedure TYnPalHdrForm.CalSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=YnDespHdrDespDate.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    YnDespHdr.Edit;
    YnDespHdrDespDate.Value:=BRDateForm.Date;
  end;
end;

procedure TYnPalHdrForm.YnDespHdrSourceStateChange(Sender: TObject);
begin
  if Closing then
    Exit;
  PostBtn.Enabled := YnDespHdr.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := YnDespHdr.State = dsBrowse;
  if YnDespHdr.State in [dsEdit, dsInsert] then
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

procedure TYnPalHdrForm.PostBtnClick(Sender: TObject);
begin
  EditPalletBarCode.Clear;
  ShowPalletNumber.Clear;
  YnDespHdr.Post;
end;

procedure TYnPalHdrForm.CancelBtnClick(Sender: TObject);
begin
  EditPalletBarCode.Clear;
  ShowPalletNumber.Clear;
  YnDespHdr.Cancel;
end;

procedure TYnPalHdrForm.YnPalletGridExit(Sender: TObject);
begin
  ActiveSource.DataSet := YnDespHdr;
{  BrowseProductSpeedBtn.Enabled:=false;}
end;

procedure TYnPalHdrForm.YnDespHdrBeforeClose(DataSet: TDataset);
begin
{  YarnRcpt.Close;}
  YarnType.Close;
  Agent.Close;
  InvFrom.Close;
end;

procedure TYnPalHdrForm.YnDespHdrAfterPost(DataSet: TDataset);
begin
  if not NoCommit then
  begin
    MainForm.Database.Commit;
{    MainForm.Database.StartTransaction;}
  end;
end;

procedure TYnPalHdrForm.CustSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalSups('CU') = mrOk then {CU for customers}
    YnDespHdrCustRef.AsString:=PickDlgForm.SupRef;
  Screen.Cursor := crDefault; { Always restore to normal }    
end;

procedure TYnPalHdrForm.YnDespHdrBeforeInsert(DataSet: TDataset);
begin
  if YnDespHdr.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('A despatch is being processed. Post changes before inserting new despatch?',
      mtInformation, mbOKCancel, 0) = mrOK then
        YnDespHdr.Post
    else
      Abort;
  end;
  MainForm.Database.StartTransaction;
end;

procedure TYnPalHdrForm.YnDespHdrBeforeCancel(DataSet: TDataset);
begin
  CancelInProgress:=true;
  if (YnDespHdr.State=dsInsert) {and not (APOrdDet.BOF and APOrdDet.EOF)} then
    if MessageDlg('Cancel despatch being inserted and delete all line items?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TYnPalHdrForm.YnDespHdrAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  YnDespHdr.Refresh;
  RedisplayQueries;
{  MainForm.Database.StartTransaction;}
  CancelInProgress:=false;
end;

procedure TYnPalHdrForm.DeleteItems;
begin
  DeleteDets := true;
  {remove all the pallets from the despatch}
  {ie set the despatch number to zero}
  {no need to modify YarnType.Instock as not yet changed}
end;

procedure TYnPalHdrForm.YnDespHdrBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete despatch and line items?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;      
  DeleteItems;
end;

procedure TYnPalHdrForm.YnDespHdrNewRecord(DataSet: TDataset);
begin
  if not RedisplayOK then
  begin
    RedisplayOK:=true;
    RedisplayQueries;
    ShowPallets.Caption:='Clear Pallets';
  end;
  {find next despatch number}
  SPDespNo.ExecProc;
  YnDespHdr.FieldByName('DespNo').AsInteger:=SPDespNo.ParamByName('Code').AsInteger;
  YnDespHdrDespSent.Value:='N';
  SPBatchRef.ExecProc;
  YnDespHdr.FieldByName('BatRef').AsInteger:=SPBatchRef.ParamByName('Code').AsInteger;
  EditDespBy.ReadOnly:=false;
  YnDespHdrDespBy.Value:=UserInitials;
  EditDespBy.ReadOnly:=true;
  YnDespHdrDESPDATE.Value:=date;
  YnDespHdrDateEnt.Value:=now;
  YnDespHdrUserEnt.Value:=UserInitials;
  YnDespHdrDateMod.Value:=YnDespHdrDateEnt.Value;
  YnDespHdrUserMod.Value:=UserInitials;
end;

procedure TYnPalHdrForm.SortBtnClick(Sender: TObject);
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

procedure TYnPalHdrForm.DespSearchSpdBtnClick(Sender: TObject);
begin
  PalletQuery.Close;
  PalletCountQuery.Close;
  RedisplayOk:=false;
  if PickDlgForm.ShowModalYnDesp = mrOk then
  begin
    YnDespHdr.SetKey;
    YnDespHdr.FieldByName('DespNo').AsInteger:=PickDlgForm.YnDespHdrDespNo;
    YnDespHdr.GotoKey;
  end;
end;

procedure TYnPalHdrForm.YnDespHdrBeforeEdit(DataSet: TDataset);
begin
  if YnDespHdrDespSent.Value='Y' then
  begin
    ShowMessage('Cannot edit a despatch already sent.');
    Abort;
  end;
  if not RedisplayOK then
  begin
    RedisplayOk:=true;
    RedisplayQueries;
    ShowPallets.Caption:='Clear Pallets';
  end;
  MainForm.Database.StartTransaction;
end;

procedure TYnPalHdrForm.EditPalletBarCodeChange(Sender: TObject);
var
  RemovePallet:boolean;
begin
  if length(EditPalletBarCode.Text)>0 then
    if YnDespHdrDespSent.Value='Y' then
    begin
      ShowMessage('Cannot edit a despatch already sent.');
      EditPalletBarCode.Clear;
      Exit;
    end;
  if length(EditPalletBarCode.Text)<>8 then {8 is smallest barcode length}
    Exit
  else
  begin
    PalletBarCodeType:=strtoint(Copy(EditPalletBarCode.Text,1,2));
    if (PalletBarCodeType<>17) then
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
  if CheckPalletExistsQuery.Fields[1].AsInteger=YnDespHdrDespNo.Value then {despno}
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
  PalletQuery.Close;
  PalletCountQuery.Close;
  UpdateYarnRcptQuery.Close;
  YnDespHdr.Edit; {start transaction (if not already in txn)}
  if RemovePallet then
    {set desp no to zero thus removing the pallet from the despatch}
  begin
    UpdateYarnRcptQuery.Params[0].AsInteger:=0;
    UpdateYarnRcptQuery.Params[1].AsInteger:=0;
    YnDespHdrPallets.Value:=YnDespHdrPallets.AsInteger-1;
  end
  else
  begin
    UpdateYarnRcptQuery.Params[0].AsInteger:=YnDespHdrDespNo.Value;
    UpdateYarnRcptQuery.Params[1].AsInteger:=YnDespHdrBatRef.Value;
    YnDespHdrPallets.Value:=YnDespHdrPallets.AsInteger+1;
  end;
  UpdateYarnRcptQuery.Params[2].AsInteger:=PalletNo;
  UpdateYarnRcptQuery.ExecSQL;
  {UpdateYarnRcptQuery.Post;}
  {UpdateYarnRcptQuery.Active:=false;}
  ShowPalletNumber.Text:=inttostr(PalletNo);
  RedisplayQueries;
end;

procedure TYnPalHdrForm.RedisplayQueries;
{redisplay the pallet array and the despatch totals}
begin
  if Closing then
    Exit;
  PalletQuery.Close;
  PalletCountQuery.Close;
  PalletQuery.Params[0].AsInteger:=YnDespHdrDespNo.Value;
  PalletCountQuery.Params[0].AsInteger:=YnDespHdrDespNo.Value;
  PalletQuery.Open;
  PalletCountQuery.Open;
  EditQtyDesp.Text:=floattostrf(PalletCountQuery.Fields[0].AsFloat,
    ffFixed,6,2);
  EditBoxes.Text:=PalletCountQuery.Fields[1].AsString;
end;

procedure TYnPalHdrForm.EditDESPNOChange(Sender: TObject);
begin
  if RedisplayOk then
    RedisplayQueries;
end;

procedure TYnPalHdrForm.YnDespHdrDESPSENTValidate(Sender: TField);
begin
  {update the instock values only after the despatch flag has been set}
  {do for all boxes in this despatch}
  (*if EditDespSent.Checked then - removed DL050416
  begin
    PalletQuery.First;
    while not PalletQuery.EOF do
    begin
      YarnType.SetKey;
      YarnType.FieldByName('YnStru').AsString:=PalletQueryYnStru.Value;
      YarnType.FieldByName('YnTwist').AsString:=PalletQueryYnTwist.Value;
      YarnType.FieldByName('YnCol').AsString:=PalletQueryYnCol.Value;
      if YarnType.GotoKey then
      begin
        YarnType.Edit;
        YarnTypeInStock.Value:=YarnTypeInStock.Value-
          PalletQueryYnNetSum.Value;
        YarnType.Post;
      end;
      PalletQuery.Next;
    end;
  end;*)
end;

procedure TYnPalHdrForm.ShowPalletsClick(Sender: TObject);
begin
  if YnDespHdr.State in [dsEdit, dsInsert] then
    ShowMessage('Cannot change the Show Pallet status when in insert or edit mode')
  else
  begin
    if not RedisplayOK then
    begin
      {YnPalHdrForm.Cursor:=crHourGlass;}
      RedisplayOK:=true;
      RedisplayQueries;
      ShowPallets.Caption:='Clear Pallets';
    end
    else
    begin
      RedisplayOK:=false;
      PalletQuery.Close;
      PalletCountQuery.Close;
      ShowPallets.Caption:='Show Pallets';
    end;
  end;
end;

procedure TYnPalHdrForm.PrintLine(Items: TStringList);
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

procedure TYnPalHdrForm.PrintHeader;
var
  {SaveFont: TFont;}
  HeaderDescr:string;
begin
  { Save the current printer's font and assign Edit1's font to Printer }
{  SaveFont := TFont.Create;
  Savefont.Assign(Printer.Canvas.Font);
  {Printer.Canvas.Font.Assign(Edit1.Font);}
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  HeaderDescr:='Pallet Details for Despatch: '+YnDespHdrDespNo.AsString;
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

procedure TYnPalHdrForm.PrintColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  with ColNames do begin
    { Create the column headers }
    AddObject('Pallet', pointer(6));
    AddObject('Box', pointer(5));
    AddObject('Stru', pointer(4));
    AddObject('Twist', pointer(5));
    AddObject('Col', pointer(4));
    AddObject('LotNo', pointer(7));
    AddObject('Net Weight', pointer(10));
  end;
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;

procedure TYnPalHdrForm.PrintPalletListClick(Sender: TObject);
var
  Items: TStringList;
  {PalletNoWidth:smallint;}
begin
  {PalletNoWidth:=20;}
  Items := TStringList.Create;              { Create a new TStringList }
  PixelsInInchx := GetDeviceCaps(Printer.Handle, LOGPIXELSX); { Get Pixels per inch horizonally}
  TenthsOfInchPixelsY := GetDeviceCaps(Printer.Handle, LOGPIXELSY) div 10;

  AmountPrinted := 0;
  PrintPalListQuery.Close;
  PrintPalListQuery.Params[0].AsInteger := YnDespHdrDespNo.Value;
  PrintPalListQuery.Open;
  try
{    ColReportForm.Enabled := false;                    { Disable the parent Form }
    Printer.BeginDoc;                                  { Initiate a print job }
    AbortForm.Show;
    Application.ProcessMessages;                       { Allow Drawing of abort box }
    { Calculate an arbitrary line height }
    LineHeight := Printer.Canvas.TextHeight('X')+TenthsOfInchPixelsY;
    PrintHeader;                                     { Print the header }
    PrintColumnNames;                                  { Print the column Names }
    PrintPalListQuery.First;                                      { Go to the first record }
    { Add the data in the fields into a TStringList in the order that they are }
    { Going to be printed }
    while (not PrintPalListQuery.Eof) or Printer.Aborted do begin
      Application.ProcessMessages;
      with Items do begin
        AddObject(PrintPalListQuery.FieldByName('PALLETNO').AsString,
                        pointer(6));
        AddObject(PrintPalListQuery.FieldByName('BOXNO').AsString,
                        pointer(5));
        AddObject(PrintPalListQuery.FieldByName('YNSTRU').AsString,
                        pointer(5));
        AddObject(PrintPalListQuery.FieldByName('YNTWIST').AsString,
                        pointer(5));
        AddObject(PrintPalListQuery.FieldByName('YNCOL').AsString,
                        pointer(4));
        AddObject(PrintPalListQuery.FieldByName('LOTNO').AsString,
                        pointer(7));
        AddObject(PrintPalListQuery.FieldByName('YNNET').AsString,
                        pointer(10));
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
        PrintColumnNames;           { Print the column names again }
      end;
      Items.Clear;                  { Clear this record from the TStringList }
      PrintPalListQuery.Next;                  { Go to the next record }
    end;
    AbortForm.Hide;                 { Hide the abort form, no longer needed }
    if not Printer.Aborted then
      Printer.EndDoc;               { End the print job }
{    ColReportForm.Enabled := true;}
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end;
  Items.Free;                       { Free the TStringList }
  PrintPalListQuery.Open;
end;

procedure TYnPalHdrForm.YnDespHdrDESPDATEChange(Sender: TField);
begin
  if (YnDespHdrDESPDATE.Value<NoEntryBeforeDate) then
  begin
    YnDespHdrDESPDATE.Value:=date;
    raise exception.create('Date cannot be less than '+
      FormatDateTime('dd-mmm-yyyy',NoEntryBeforeDate));
  end;
  if (YnDespHdrDESPDATE.Value>date) then
  begin
    YnDespHdrDESPDATE.Value:=date;
    raise exception.create('Date cannot be greater than today');
  end;
end;

procedure TYnPalHdrForm.YnDespHdrAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TYnPalHdrForm.YnDespHdrDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TYnPalHdrForm.YnDespHdrBeforePost(DataSet: TDataSet);
begin
  if YnDespHdr.State=dsEdit then
  begin
    YnDespHdrDateMod.Value:=now;
    YnDespHdrUserMod.Value:=UserInitials;
  end;
end;

end.
