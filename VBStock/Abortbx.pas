unit Abortbx;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Gauges, StdCtrls, Buttons;

type

  TAbortForm = class(TForm)
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AbortForm: TAbortForm;

implementation
{uses Printers;}
  uses VBMain;

{$R *.DFM}
procedure TAbortForm.BitBtn1Click(Sender: TObject);
begin
{  AbortDoc(Printer.Handle);  { This line will disappear when the bug is fixed. }
{  Printer.Abort;             { This procedure is supposed to call the above }
  PrinterAborted:=true;
  Close; 
end;

end.
