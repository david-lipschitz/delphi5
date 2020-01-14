unit GetDates;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ODPopCal;

type
  TfrmGetDates = class(TForm)
    calDates: TODPopupCalendar;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGetDates: TfrmGetDates;

implementation

{$R *.DFM}

end.
