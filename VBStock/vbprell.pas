unit vbprell;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, Mask, DBCtrls, Buttons, ExtCtrls,
  ComCtrls;

type
  TVBPreLLForm = class(TForm)
    Label1: TLabel;
    EditWeekNo: TEdit;
    Label2: TLabel;
    EditTodaysDate: TEdit;
    OrderQuery: TQuery;
    OrderQuerySource: TDataSource;
    OrderGrid: TDBGrid;
    OrderQueryYEARNO: TSmallintField;
    OrderQueryWEEKNO: TSmallintField;
    OrderQueryQTYREM: TFloatField;
    MyQuery: TQuery;
    Label3: TLabel;
    EditYearNo: TEdit;
    OrderQueryVBSTRU: TStringField;
    OrderQueryVBCOL: TStringField;
    CloseBitBtn: TBitBtn;
    OrdersByRadioGrp: TRadioGroup;
    OrderQueryVBTYPE: TStringField;
    EditVBStru: TEdit;
    EditVBCol: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    EditEndDate: TEdit;
    EditStartDate: TEdit;
    OrdersBtn: TButton;
    OrderQuerySTK2070: TIntegerField;
    OrderQueryORD2070: TIntegerField;
    OrderQueryWWIP: TFloatField;
    OrderQueryVWIP: TFloatField;
    OrderQueryFWIP: TFloatField;
    OrderQueryPTOTORD: TFloatField;
    PrintSpdBtn: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure OrdersByRadioGrpClick(Sender: TObject);
    procedure EditVBStruChange(Sender: TObject);
    procedure EditVBColChange(Sender: TObject);
    procedure EditStartDateExit(Sender: TObject);
    procedure EditEndDateExit(Sender: TObject);
    procedure OrdersBtnClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { Private declarations }
    CurrentWeekNo:shortint;
    CurrentYearNo:word;
    PixelsInInchx: integer;       { Stores Pixels per inch }
    LineHeight: Integer;          { Stores the line height }
    AmountPrinted: integer;       { Stores amount, in pixels, printed on a page }
    TenthsOfInchPixelsY: integer; { Pixels in 1/10 of an inch used for line spacing }
    DateHeading:string;
{    CurrentVTOrdNo:word;}
{    CurrentDate:real;}
    StartDate,EndDate:string[11]; {eg:20/05/1996}
    CurrentPageNo:byte; {added DL140197}    
    procedure PrintHeader;
    procedure PrintOrdersColumnNames;
    procedure PrintLine(Items: TStringList);
  public
    { Public declarations }
  end;

var
  VBPreLLForm: TVBPreLLForm;

implementation

{$R *.DFM}

uses VBMain,printers; {?rqd?}

procedure TVBPreLLForm.FormShow(Sender: TObject);
begin
  EditTodaysDate.Text:=FormatDateTime('dd/mm/yyyy', date);
{  StatusBar.Panels.Items[0].Text:='Fetching Date Info';}
  MainForm.Database.StartTransaction;
  MyQuery.Close;
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
  MainForm.Database.Commit;
  OrderQuery.Open;
end;

procedure TVBPreLLForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {OrderQuery is not live, so rather check if in txn}
{  if OrderQuery.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;}
  OrderQuery.Close;
  VBPreLLForm.Release;
end;

procedure TVBPreLLForm.CloseBitBtnClick(Sender: TObject);
begin
{  if GreigeRcpt.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Greige Receipts before closing',
      mtInformation, [mbOK], 0)
  else}
    Close;
end;

procedure TVBPreLLForm.OrdersByRadioGrpClick(Sender: TObject);
begin
  case OrdersByRadioGrp.ItemIndex of
    0: {default; sort by week,type}
    begin
      OrderQuery.Close;
      OrderQuery.SQL.Clear;
      OrderQuery.SQL.Add('select wn.yearno,wn.weekno,');
      OrderQuery.SQL.Add('vo.vbstru||vo.vbcol vbtype,');
      OrderQuery.SQL.Add('sum((vo.qty-vo.qtydel)/vw.strips) qtyrem,');
      OrderQuery.SQL.Add('vo.vbstru,vo.vbcol,');
      OrderQuery.SQL.Add('vm.ptotord,vm.stk2070,vm.ord2070,vm.wwip,vm.vwip,vm.fwip');
      OrderQuery.SQL.Add('from vborddet vo,wkno wn,vbwidth vw,vbmake vm');
      OrderQuery.SQL.Add('where (vo.status<>''C'')');
      OrderQuery.SQL.Add('and (vo.daterqd between wn.fromdate and wn.todate)');
      OrderQuery.SQL.Add('and (vo.vbwidth=vw.metricwidth)');
      OrderQuery.SQL.Add('and (vm.vbstru=vo.vbstru)');
      OrderQuery.SQL.Add('and (vm.vbcol=vo.vbcol)');
      {if EditVBStru.Text<>'' then
        OrderQuery.SQL.Add('and (vo.vbstru='''+EditVBStru.Text+''')');
      if EditVBCol.Text<>'' then
        if strtoint(EditVBCol.Text)>=100 then
          OrderQuery.SQL.Add('and (vo.vbcol='+EditVBCol.Text+')');
      if StartDate<>'' then
        OrderQuery.SQL.Add('and (vo.daterqd>='''+StartDate+''')');
      if EndDate<>'' then
        OrderQuery.SQL.Add('and (vo.daterqd<='''+EndDate+''')');}
      OrderQuery.SQL.Add('group by wn.yearno,wn.weekno,vo.vbstru,vo.vbcol,');
      OrderQuery.SQL.Add('vm.ptotord,vm.stk2070,vm.ord2070,vm.wwip,vm.vwip,vm.fwip');
      OrderQuery.SQL.Add('order by wn.yearno,wn.weekno,vo.vbstru,vo.vbcol');
      OrderQuery.Prepare;
      OrderQuery.Open;
      OrderGrid.Columns.Items[0].FieldName:='YEARNO';
      OrderGrid.Columns.Items[1].FieldName:='WEEKNO';
      OrderGrid.Columns.Items[2].FieldName:='VBTYPE';
      OrderGrid.Columns.Items[4].FieldName:='QTYREM';
      OrderGrid.Columns.Items[4].FieldName:='PTOTORD';
      OrderGrid.Columns.Items[5].FieldName:='STK2070';
      OrderGrid.Columns.Items[6].FieldName:='ORD2070';
      OrderGrid.Columns.Items[7].FieldName:='WWIP';
      OrderGrid.Columns.Items[8].FieldName:='VWIP';
      OrderGrid.Columns.Items[9].FieldName:='FWIP';
    end;
    1: {sort by type,week}
    begin
      OrderQuery.Close;
      OrderQuery.SQL.Clear;
      OrderQuery.SQL.Add('select wn.yearno,wn.weekno,');
      OrderQuery.SQL.Add('vo.vbstru||vo.vbcol vbtype,');
      OrderQuery.SQL.Add('sum((vo.qty-vo.qtydel)/vw.strips) qtyrem,');
      OrderQuery.SQL.Add('vo.vbstru,vo.vbcol,');
      OrderQuery.SQL.Add('vm.ptotord,vm.stk2070,vm.ord2070,vm.wwip,vm.vwip,vm.fwip');
      OrderQuery.SQL.Add('from vborddet vo,wkno wn,vbwidth vw,vbmake vm');
      OrderQuery.SQL.Add('where (vo.status<>''C'')');
      OrderQuery.SQL.Add('and (vo.daterqd between wn.fromdate and wn.todate)');
      OrderQuery.SQL.Add('and (vo.vbwidth=vw.metricwidth)');
      OrderQuery.SQL.Add('and (vm.vbstru=vo.vbstru)');
      OrderQuery.SQL.Add('and (vm.vbcol=vo.vbcol)');
      {if EditVBStru.Text<>'' then
        OrderQuery.SQL.Add('and (vo.vbstru='''+EditVBStru.Text+''')');
      if EditVBCol.Text<>'' then
        if strtoint(EditVBCol.Text)>=100 then
          OrderQuery.SQL.Add('and (vo.vbcol='+EditVBCol.Text+')');
      if StartDate<>'' then
        OrderQuery.SQL.Add('and (vo.daterqd>='''+StartDate+''')');
      if EndDate<>'' then
        OrderQuery.SQL.Add('and (vo.daterqd<='''+EndDate+''')');}
      OrderQuery.SQL.Add('group by wn.yearno,wn.weekno,vo.vbstru,vo.vbcol,');
      OrderQuery.SQL.Add('vm.ptotord,vm.stk2070,vm.ord2070,vm.wwip,vm.vwip,vm.fwip');
      OrderQuery.SQL.Add('order by vo.vbstru,vo.vbcol,wn.yearno,wn.weekno');
      OrderQuery.Prepare;
      OrderQuery.Open;
      OrderGrid.Columns.Items[0].FieldName:='VBTYPE';
      OrderGrid.Columns.Items[1].FieldName:='YEARNO';
      OrderGrid.Columns.Items[2].FieldName:='WEEKNO';
      OrderGrid.Columns.Items[3].FieldName:='QTYREM';
      OrderGrid.Columns.Items[4].FieldName:='PTOTORD';
      OrderGrid.Columns.Items[5].FieldName:='STK2070';
      OrderGrid.Columns.Items[6].FieldName:='ORD2070';
      OrderGrid.Columns.Items[7].FieldName:='WWIP';
      OrderGrid.Columns.Items[8].FieldName:='VWIP';
      OrderGrid.Columns.Items[9].FieldName:='FWIP';
    end;
  end; {case OrdersByRadioGrp.ItemIndex}
end;

procedure TVBPreLLForm.PrintHeader;
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

procedure TVBPreLLForm.PrintLine(Items: TStringList);
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

procedure TVBPreLLForm.EditVBStruChange(Sender: TObject);
begin
  EditVBStru.Text:=uppercase(EditVBStru.Text);
  OrdersByRadioGrpClick(Sender);
end;

procedure TVBPreLLForm.EditVBColChange(Sender: TObject);
begin
  OrdersByRadioGrpClick(Sender);
end;

procedure TVBPreLLForm.EditStartDateExit(Sender: TObject);
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

procedure TVBPreLLForm.EditEndDateExit(Sender: TObject);
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

procedure TVBPreLLForm.PrintOrdersColumnNames;
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
        AddObject('Type', pointer(4));
        AddObject('QtyRem', pointer(6));
        AddObject('m TotOrd', pointer(8));
        AddObject('m FW Stk', pointer(8));
        AddObject('m FW Ord', pointer(8));
        AddObject('m WWIP', pointer(6));
        AddObject('m VWIP', pointer(6));
        AddObject('m FWIP', pointer(6));
      end;
    end; {week,type}
    1:{type,week}
    begin
      with ColNames do begin
        { Create the column headers }
        AddObject('Type', pointer(4));
        AddObject('Year', pointer(4));
        AddObject('Week', pointer(4));
        AddObject('QtyRem', pointer(6));
        AddObject('m TotOrd', pointer(8));
        AddObject('m FW Stk', pointer(8));
        AddObject('m FW Ord', pointer(8));
        AddObject('m WWIP', pointer(6));
        AddObject('m VWIP', pointer(6));
        AddObject('m FWIP', pointer(6));
      end;
    end; {type,week}
  end;  {case OrdersByRadioGrp.ItemIndex of}
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;

procedure TVBPreLLForm.OrdersBtnClick(Sender: TObject);
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
    1:DateHeading:='Orders By Type,Week as at '+FormatDateTime('dddd, mmmm d, yyyy hh:mm AM/PM',Now)+'; Current Week='+EditWeekNo.Text;
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
            TempStr:=OrderQuery.FieldByName('VBTYPE').AsString;
            AddObject(TempStr,pointer(4));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('QTYREM').AsFloat);
            AddObject(TempStr,pointer(6));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('PTOTORD').AsFloat);
            AddObject(TempStr,pointer(8));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('STK2070').AsFloat);
            AddObject(TempStr,pointer(8));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('ORD2070').AsFloat);
            AddObject(TempStr,pointer(8));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('WWIP').AsFloat);
            AddObject(TempStr,pointer(6));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('VWIP').AsFloat);
            AddObject(TempStr,pointer(6));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('FWIP').AsFloat);
            AddObject(TempStr,pointer(6));
          end; {with Items}
        end; {week,type}
        1:{type,week}
        begin
          with Items do begin
            TempStr:=OrderQuery.FieldByName('VBTYPE').AsString;
            AddObject(TempStr,pointer(4));
            AddObject(OrderQuery.FieldByName('YEARNO').AsString,pointer(4));
            AddObject(OrderQuery.FieldByName('WEEKNO').AsString,pointer(4));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('QTYREM').AsFloat);
            AddObject(TempStr,pointer(6));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('PTOTORD').AsFloat);
            AddObject(TempStr,pointer(8));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('STK2070').AsFloat);
            AddObject(TempStr,pointer(8));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('ORD2070').AsFloat);
            AddObject(TempStr,pointer(8));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('WWIP').AsFloat);
            AddObject(TempStr,pointer(6));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('VWIP').AsFloat);
            AddObject(TempStr,pointer(6));
            TempStr:=FormatFloat('#', OrderQuery.FieldByName('FWIP').AsFloat);
            AddObject(TempStr,pointer(6));
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

procedure TVBPreLLForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
