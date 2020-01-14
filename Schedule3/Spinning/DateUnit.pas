unit DateUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TDateForm = class(TForm)
    DatePicker: TDateTimePicker;
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DatePickerChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DateForm: TDateForm;

implementation

{$R *.DFM}

procedure TDateForm.FormShow(Sender: TObject);
begin
  OKButton.Enabled := False;
end;

procedure TDateForm.DatePickerChange(Sender: TObject);
begin
  OKButton.Enabled := True;
end;

end.
