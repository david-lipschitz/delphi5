unit issuerep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Db, DBTables;

type
  TIssueRepForm = class(TForm)
    DelIssueQuery: TQuery;
    WIPIssueQuery: TQuery;
    YnIssueQuery: TQuery;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    EditBatchNo: TEdit;
    EditDateIssued: TEdit;
    CloseBitBtn: TBitBtn;
    PrintBtn: TButton;
    DelIssueQueryBATREF: TIntegerField;
    DelIssueQueryPRODREF: TStringField;
    DelIssueQuerySUMQTYISSUED: TFloatField;
    DelIssueQueryNUMITEMS: TIntegerField;
    DelIssueQueryISSUETO: TStringField;
    DelIssueQuerySource: TDataSource;
    WIPIssueQuerySource: TDataSource;
    YnIssueSource: TDataSource;
    WIPIssueQueryBATREF: TIntegerField;
    WIPIssueQueryPRODREF: TStringField;
    WIPIssueQuerySUMNETWEIGHT: TFloatField;
    WIPIssueQueryNUMITEMS: TIntegerField;
    WIPIssueQueryISSUETO: TStringField;
    YnIssueQueryYNTYPE: TStringField;
    YnIssueQuerySUMNETWEIGHT: TFloatField;
    YnIssueQueryNUMITEMS: TIntegerField;
    YnIssueQueryCUSTREF: TStringField;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DateEntSpdBtn: TSpeedButton;
    YnIssueQueryDESPNO: TIntegerField;
    YnIssueQueryBATREF: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure DateEntSpdBtnClick(Sender: TObject);
    procedure EditBatchNoChange(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
  private
    { Private declarations }
    DateIssued:TDateTime;
    PixelsInInchx: integer;       { Stores Pixels per inch }
    LineHeight: Integer;          { Stores the line height }
    AmountPrinted: integer;       { Stores amount, in pixels, printed on a page }
    TenthsOfInchPixelsY: integer; { Pixels in 1/10 of an inch used for line spacing }
    {DateHeading:string;}
    HeaderDescr:string;
    procedure PrintHeader;
    procedure PrintLine(Items: TStringList);
    procedure PrintDelIssueColumnNames;
    procedure PrintDelIssueItems;
    procedure PrintWIPIssueColumnNames;
    procedure PrintWIPIssueItems;
    procedure PrintYnIssueColumnNames;
    procedure PrintYnIssueItems;
  public
    { Public declarations }
  end;

var
  IssueRepForm: TIssueRepForm;

implementation

uses Main, PickDate, Printers;
{$R *.DFM}

procedure TIssueRepForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DelIssueQuery.Close;
  WIPIssueQuery.Close;
  YnIssueQuery.Close;
  IssueRepForm.Release;
end;

procedure TIssueRepForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TIssueRepForm.DateEntSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=date;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    if (BRDateForm.Date>date) then
    begin
      EditDateIssued.Text:='';
      raise exception.create('Date cannot be greater than today');
    end;
    DateIssued:=BRDateForm.Date;
    EditDateIssued.ReadOnly:=false;
    EditDateIssued.Text:=formatdatetime('dd-mmm-yyyy',BRDateForm.Date);
    EditDateIssued.ReadOnly:=true;
    DelIssueQuery.Close;
    DelIssueQuery.Params[0].AsDate:=BRDateForm.Date;
    DelIssueQuery.Open;
    WIPIssueQuery.Close;
    WIPIssueQuery.Params[0].AsDate:=BRDateForm.Date;
    WIPIssueQuery.Open;
    YnIssueQuery.Close;
    YnIssueQuery.Params[0].AsDate:=BRDateForm.Date;
    YnIssueQuery.Open;
  end;
end;

procedure TIssueRepForm.EditBatchNoChange(Sender: TObject);
begin
  if (EditDateIssued.Text<>'') and (EditBatchNo.Text<>'') then
  begin
    DelIssueQuery.Filter:='batref='+EditBatchNo.Text;
    DelIssueQuery.Filtered:=true;
    WIPIssueQuery.Filter:='batref='+EditBatchNo.Text;
    WIPIssueQuery.Filtered:=true;
    YnIssueQuery.Filter:='batref='+EditBatchNo.Text;
    YnIssueQuery.Filtered:=true;
  end
  else
  begin
    DelIssueQuery.Filtered:=false;
    WIPIssueQuery.Filtered:=false;
    YnIssueQuery.Filtered:=false;
  end;
end;

procedure TIssueRepForm.PrintHeader;
{var
  SaveFont: TFont;}
begin
  { Save the current printer's font and assign Edit1's font to Printer }
{  SaveFont := TFont.Create;
  Savefont.Assign(Printer.Canvas.Font);
  {Printer.Canvas.Font.Assign(Edit1.Font);}
  Printer.Canvas.Font.Style := [];     { Set to normal style }

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

procedure TIssueRepForm.PrintLine(Items: TStringList);
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

procedure TIssueRepForm.PrintDelIssueColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  with ColNames do begin
    { Create the column headers }
    AddObject('Del', pointer(3));
    AddObject('BatRef', pointer(7));
    AddObject('ProdRef', pointer(12));
    AddObject('Qty', pointer(8));
    AddObject('Items', pointer(5));
    AddObject('To', pointer(9));
  end;
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;

procedure TIssueRepForm.PrintWIPIssueColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  with ColNames do begin
    { Create the column headers }
    AddObject('WIP', pointer(3));
    AddObject('BatRef', pointer(7));
    AddObject('ProdRef', pointer(12));
    AddObject('Qty', pointer(8));
    AddObject('Items', pointer(5));
    AddObject('To', pointer(9));
  end;
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;

procedure TIssueRepForm.PrintYnIssueColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  with ColNames do begin
    { Create the column headers }
    AddObject('Yn', pointer(3));
    AddObject('Desp No', pointer(7));
    AddObject('Yn Type', pointer(12));
    AddObject('Qty', pointer(8));
    AddObject('Items', pointer(5));
    AddObject('To', pointer(9));
    AddObject('BatRef', pointer(7));
  end;
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;

procedure TIssueRepForm.PrintDelIssueItems;
var
  Items: TStringList;
  TempStr:string[20];
begin
  Items := TStringList.Create;              { Create a new TStringList }
  try
    { Calculate an arbitrary line height }
    DelIssueQuery.First;
    { Add the data in the fields into a TStringList in the order that they are }
    { Going to be printed }
    while not DelIssueQuery.EOF do
    begin
      with Items do begin
        AddObject('', pointer(3));
        AddObject(DelIssueQuery.FieldByName('BATREF').AsString,
                        pointer(7));
        AddObject(DelIssueQuery.FieldByName('PRODREF').AsString,
                        pointer(12));
        TempStr:=FormatFloat('0.00', DelIssueQuery.FieldByName('SUMQTYISSUED').AsFloat);
        AddObject(TempStr,pointer(8));
        AddObject(DelIssueQuery.FieldByName('NUMITEMS').AsString,
                        pointer(5));
        AddObject(DelIssueQuery.FieldByName('ISSUETO').AsString,
                        pointer(9));
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
        PrintDelIssueColumnNames;           { Print the column names again }
      end;
      Items.Clear;                  { Clear this record from the TStringList }
      DelIssueQuery.Next;                  { Go to the next record }
    end;
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end;
  Items.Free;                       { Free the TStringList }
end;

procedure TIssueRepForm.PrintWIPIssueItems;
var
  Items: TStringList;
  TempStr:string[20];
begin
  Items := TStringList.Create;              { Create a new TStringList }
  try
    { Calculate an arbitrary line height }
    WIPIssueQuery.First;
    { Add the data in the fields into a TStringList in the order that they are }
    { Going to be printed }
    while not WIPIssueQuery.EOF do
    begin
      with Items do begin
        AddObject('', pointer(3));
        AddObject(WIPIssueQuery.FieldByName('BATREF').AsString,
                        pointer(7));
        AddObject(WIPIssueQuery.FieldByName('PRODREF').AsString,
                        pointer(12));
        TempStr:=FormatFloat('0.00', WIPIssueQuery.FieldByName('SUMNETWEIGHT').AsFloat);
        AddObject(TempStr,pointer(8));
        AddObject(WIPIssueQuery.FieldByName('NUMITEMS').AsString,
                        pointer(5));
        AddObject(WIPIssueQuery.FieldByName('ISSUETO').AsString,
                        pointer(9));
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
        PrintWIPIssueColumnNames;           { Print the column names again }
      end;
      Items.Clear;                  { Clear this record from the TStringList }
      WIPIssueQuery.Next;                  { Go to the next record }
    end;
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end;
  Items.Free;                       { Free the TStringList }
end;

procedure TIssueRepForm.PrintYnIssueItems;
var
  Items: TStringList;
  TempStr:string[20];
begin
  Items := TStringList.Create;              { Create a new TStringList }
  try
    { Calculate an arbitrary line height }
    YnIssueQuery.First;
    { Add the data in the fields into a TStringList in the order that they are }
    { Going to be printed }
    while not YnIssueQuery.EOF do
    begin
      with Items do begin
        AddObject('', pointer(3));
        AddObject(YnIssueQuery.FieldByName('DESPNO').AsString,
                        pointer(7));
        AddObject(YnIssueQuery.FieldByName('YNTYPE').AsString,
                        pointer(12));
        TempStr:=FormatFloat('0.00', YnIssueQuery.FieldByName('SUMNETWEIGHT').AsFloat);
        AddObject(TempStr,pointer(8));
        AddObject(YnIssueQuery.FieldByName('NUMITEMS').AsString,
                        pointer(5));
        AddObject(YnIssueQuery.FieldByName('CUSTREF').AsString,
                        pointer(9));
        AddObject(YnIssueQuery.FieldByName('BATREF').AsString,
                        pointer(7));
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
        PrintYnIssueColumnNames;           { Print the column names again }
      end;
      Items.Clear;                  { Clear this record from the TStringList }
      YnIssueQuery.Next;                  { Go to the next record }
    end;
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end;
  Items.Free;                       { Free the TStringList }
end;

procedure TIssueRepForm.PrintBtnClick(Sender: TObject);
begin
  if EditDateIssued.Text<>'' then
  begin
    HeaderDescr:='Issues Summary for '+EditDateIssued.Text;
    AmountPrinted := 0;
    Printer.BeginDoc;                                  { Initiate a print job }
    LineHeight := Printer.Canvas.TextHeight('X')+TenthsOfInchPixelsY;
    PixelsInInchx := GetDeviceCaps(Printer.Handle, LOGPIXELSX); { Get Pixels per inch horizonally}
    TenthsOfInchPixelsY := GetDeviceCaps(Printer.Handle, LOGPIXELSY) div 10;
    PrintHeader;
    PrintDelIssueColumnNames;
    PrintDelIssueItems;
    PrintWIPIssueColumnNames;
    PrintWIPIssueItems;
    PrintYnIssueColumnNames;
    PrintYnIssueItems;
    Printer.EndDoc;               { End the print job }
    DelIssueQuery.First;
    WIPIssueQuery.First;
    YnIssueQuery.First;
  end;
end;

end.
