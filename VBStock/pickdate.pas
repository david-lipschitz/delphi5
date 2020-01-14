unit Pickdate;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  SysUtils, StdCtrls, Grids, Calendar, ExtCtrls;

type
  TBrDateForm = class(TForm)
    Calendar1: TCalendar;
    OkBtn: TButton;
    CancelBtn: TButton;
    TitleLabel: TLabel;
    PrevMonthBtn: TSpeedButton;
    NextMonthBtn: TSpeedButton;
    Bevel1: TBevel;
    procedure PrevMonthBtnClick(Sender: TObject);
    procedure NextMonthBtnClick(Sender: TObject);
    procedure Calendar1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure SetDate(Date1: TDateTime);
    function GetDate: TDateTime;
  public
    property Date: TDateTime read GetDate write SetDate;
  end;

var
  BrDateForm: TBrDateForm;

implementation

{$R *.DFM}

procedure TBrDateForm.SetDate(Date1: TDateTime);
begin
  if Date<>0 then
    Calendar1.CalendarDate := Date1
  else
    Calendar1.CalendarDate := date; {was now until 8/11/96 DL}
end;

function TBrDateForm.GetDate: TDateTime;
begin
  Result := Calendar1.CalendarDate;
end;
         
procedure TBrDateForm.PrevMonthBtnClick(Sender: TObject);
begin
  Calendar1.PrevMonth;
end;

procedure TBrDateForm.NextMonthBtnClick(Sender: TObject);
begin
  Calendar1.NextMonth;
end;

procedure TBrDateForm.Calendar1Change(Sender: TObject);
begin
  TitleLabel.Caption := FormatDateTime('MMMM, YYYY', Calendar1.CalendarDate);
end;

procedure TBrDateForm.FormActivate(Sender: TObject);
begin
  Calendar1.StartOfWeek:=1;
end;

end.
