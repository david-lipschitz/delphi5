unit PrnUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Printers;

type
  TPrintForm = class(TForm)
    StartButton: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    PrinterRadio: TRadioButton;
    FileRadio: TRadioButton;
    SetupButton: TBitBtn;
    SetupDialog: TPrinterSetupDialog;
    SaveDialog: TSaveDialog;
    procedure RadioClick(Sender: TObject);
    procedure SetupButtonClick(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
  private
    procedure PrintToPrinter;
    procedure PrintToFile;
  public
    Title, FileName: string;
    Headers: TStrings;
    PrintList: TList;
    MaxRow: Integer;
    ScenarioName: string;
  end;

var
  PrintForm: TPrintForm;

implementation

{$R *.DFM}

procedure TPrintForm.RadioClick(Sender: TObject);
begin
  SetupButton.Enabled := PrinterRadio.Checked;
end;

procedure TPrintForm.SetupButtonClick(Sender: TObject);
begin
  SetupDialog.Execute;
end;

procedure TPrintForm.StartButtonClick(Sender: TObject);
begin
  if PrinterRadio.Checked then
    PrintToPrinter
  else
  begin
    SaveDialog.FileName := FileName;
    if SaveDialog.Execute then
      PrintToFile;
  end;
end;

procedure TPrintForm.PrintToPrinter;
const
  Margin: Integer = 100;
var
  iTop, iCol, iRow, ColWidth, DivWidth: Integer;
  st: string;
begin
  Printer.BeginDoc;
  with Printer.Canvas do
  try
    Font.Name := 'Arial';
    Font.Size := 12;
    Font.Style := [fsBold];
    iTop := TextHeight('A') + 5;
    TextOut(Margin, 0, Title);
    Font.Size := 10;
    Font.Style := [];
    TextOut((Printer.PageWidth div 3 * 2) - 50, 0, 'Printed: ' +
      FormatDateTime('dd/mm/yyyy hh:mm am/pm', Now));
    st := 'Page ' + IntToStr(Printer.PageNumber);
    TextOut(Printer.PageWidth - TextWidth(st) - 50, 0, st);
    ColWidth := TextWidth('A') * 13; //was 12 DL081001
    DivWidth := TextWidth('|'); 
    Font.Size := 9;
    Font.Style := [fsBold, fsUnderline];
    for iCol := 0 to Headers.Count-1 do
      TextOut(Margin + ((ColWidth + DivWidth) * iCol) + 20, iTop, Headers[iCol]);
    Inc(iTop, TextHeight('A') + 10);
    for iRow := 0 to MaxRow-1 do
    begin
      for iCol := 0 to PrintList.Count-1 do
      begin
        if iRow < TStrings(PrintList[iCol]).Count then
        begin
          st := TStrings(PrintList[iCol])[iRow];
          if TStrings(PrintList[iCol]).Objects[iRow] <> nil then
            Font.Style := [fsBold]    //print job header in bold
          else
            Font.Style := [];
        end
        else st := '';    //finished schedule so print blank
        TextOut(Margin + ((ColWidth + DivWidth) * iCol), iTop, st);
        Font.Style := [];
        TextOut(Margin + ((ColWidth + DivWidth) * iCol) - DivWidth, iTop, '|');
      end;
      TextOut(Margin + ((ColWidth + DivWidth) * iCol) - DivWidth, iTop, '|');
      Inc(iTop, TextHeight('A'));
    end;
  finally
    Printer.EndDoc;
  end;
end;

procedure TPrintForm.PrintToFile;
var
  tf: TextFile;
  iCol, iRow: Integer;
begin
  AssignFile(tf, FileName);
  try
    Rewrite(tf);
    Write(tf, Title + '         Printed: ' +
      FormatDateTime('dd/mm/yyyy hh:mm am/pm', Now) + ',');
    Writeln(tf, '');
    for iCol := 0 to Headers.Count-1 do
      Write(tf, '<<' + Headers[iCol] + '>>,');
    Writeln(tf, '');
    for iCol := 0 to Headers.Count-1 do
      Write(tf, ',');
    Writeln(tf, '');
    for iRow := 0 to MaxRow-1 do
    begin
      for iCol := 0 to PrintList.Count-1 do
        if iRow < TStrings(PrintList[iCol]).Count then
          if TStrings(PrintList[iCol]).Objects[iRow] <> nil then
            Write(tf, '<' + TStrings(PrintList[iCol])[iRow] + '>,')
          else
            Write(tf, TStrings(PrintList[iCol])[iRow] + ',')
        else Write(tf, ',');   //finished this col so write blank
      Writeln(tf, '');
    end;
  finally
    CloseFile(tf);
  end;
end;

end.
