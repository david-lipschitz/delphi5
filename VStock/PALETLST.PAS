unit Prnpg0;
interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, DB, DBTables, Menus, StdCtrls, Spin,
  Gauges, ExtCtrls;

type
  TColReportForm = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Print1: TMenuItem;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpinEdit5: TSpinEdit;
    Label6: TLabel;
    SpinEdit6: TSpinEdit;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    Button1: TButton;
    FontDialog1: TFontDialog;
    procedure Print1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    PixelsInInchx: integer;       { Stores Pixels per inch }
    LineHeight: Integer;          { Stores the line height }
    AmountPrinted: integer;       { Stores amount, in pixels, printed on a page }
    TenthsOfInchPixelsY: integer; { Pixels in 1/10 of an inch used for line spacing }
    procedure PrintLine(Items: TStringList);
    procedure PrintHeader;
    procedure PrintColumnNames;
  end;

var
  ColReportForm: TColReportForm;
  a: Boolean;

implementation
uses printers, abortbx;

{$R *.DFM}

procedure TColReportForm.PrintLine(Items: TStringList);
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

procedure TColReportForm.PrintHeader;
var
  SaveFont: TFont;
begin
  { Save the current printer's font and assign Edit1's font to Printer }
  SaveFont := TFont.Create;
  Savefont.Assign(Printer.Canvas.Font);
  Printer.Canvas.Font.Assign(Edit1.Font);
  { Print out the Header }
  with Printer do begin
    if not Printer.Aborted then
      Canvas.TextOut((PageWidth div 2)-(Canvas.TextWidth(Edit1.Text) div 2),
                      0, Edit1.Text);
    { Increment AmountPrinted by the LineHeight }
    AmountPrinted := AmountPrinted + LineHeight+TenthsOfInchPixelsY;
  end;
  Printer.Canvas.Font.Assign(SaveFont);   { Re-assign the old font }
  SaveFont.Free;                          { Free the saved font }
end;

procedure TColReportForm.PrintColumnNames;
var
  ColNames: TStringList;
begin
  ColNames := TStringList.Create;                     { Create the string list }
  Printer.Canvas.Font.Style := [fsBold, fsUnderline]; { Use a Bold/underline style }
  with ColNames do begin
    { Create the column headers }
    AddObject('LAST NAME',  pointer(SpinEdit1.Value));
    AddObject('FIRST NAME', pointer(SpinEdit2.Value));
    AddObject('ADDRESS',    pointer(SpinEdit3.Value));
    AddObject('CITY',       pointer(SpinEdit4.Value));
    AddObject('STATE',      pointer(SpinEdit5.Value));
    AddObject('ZIP',        pointer(SpinEdit6.Value));
  end;
  PrintLine(ColNames);                 { Print the line }
  Printer.Canvas.Font.Style := [];     { Set to normal style }
  ColNames.Free;                       { Free the string list }
end;

procedure TColReportForm.Print1Click(Sender: TObject);
var
  Items: TStringList;
begin
  Items := TStringList.Create;              { Create a new TStringList }
  PixelsInInchx := GetDeviceCaps(Printer.Handle, LOGPIXELSX); { Get Pixels per inch horizonally}
  TenthsOfInchPixelsY := GetDeviceCaps(Printer.Handle, LOGPIXELSY) div 10;

  AmountPrinted := 0;                            { Set to zero }
  try
    ColReportForm.Enabled := false;                    { Disable the parent Form }
    Printer.BeginDoc;                                  { Initiate a print job }
    AbortForm.Show;
    Application.ProcessMessages;                       { Allow Drawing of abort box }
    { Calculate a arbitrary line height }
    LineHeight := Printer.Canvas.TextHeight('X')+TenthsOfInchPixelsY;
    if Edit1.Text <> '' then
      PrintHeader;                                     { Print the header }
    PrintColumnNames;                                  { Print the column Names }
    Table1.First;                                      { Go to the first record }
    { Add the data in the fields into a TStringList in the order that they are }
    { Going to be printed }
    while (not Table1.Eof) or Printer.Aborted do begin
      Application.ProcessMessages;
      with Items do begin
        AddObject(Table1.FieldByName('LAST_NAME').AsString,
                        pointer(SpinEdit1.Value));
        AddObject(Table1.FieldByName('FIRST_NAME').AsString,
                        pointer(SpinEdit2.Value));
        AddObject(Table1.FieldByName('ADDRESS_1').AsString,
                        pointer(SpinEdit3.Value));
        AddObject(Table1.FieldByName('CITY').AsString,
                        pointer(SpinEdit4.Value));
        AddObject(Table1.FieldByName('STATE').AsString,
                        pointer(SpinEdit5.Value));
        AddObject(Table1.FieldByName('ZIP').AsString,
                        pointer(SpinEdit6.Value));
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
      Table1.Next;                  { Go to the next record }
    end;
    AbortForm.Hide;                 { Hide the abort form, no longer needed }
    if not Printer.Aborted then
      Printer.EndDoc;               { End the print job }
    ColReportForm.Enabled := true;
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end;
  Items.Free;                       { Free the TStringList }
end;

procedure TColReportForm.Button1Click(Sender: TObject);
begin
{ Assign a new font to Edit1 }
  FontDialog1.Font.Assign(Edit1.Font);
  if FontDialog1.Execute then
    Edit1.Font.Assign(FontDialog1.Font);
end;

end.
