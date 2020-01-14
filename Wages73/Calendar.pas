unit Calendar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ODCalend, ODDBCal, Buttons;

type
  TfrmCalendar = class(TForm)
    dbCalendar: TODDBCalendar;
    btnAccept: TSpeedButton;
    btnCancel: TSpeedButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalendar: TfrmCalendar;

implementation

uses wklywages, main;

{$R *.DFM}

procedure TfrmCalendar.btnCancelClick(Sender: TObject);
begin
  frmWeeklyWages.tabEmployee.Cancel;
  frmWeeklyWages.tabPaySlip.Cancel;
  frmMain.Database.Rollback;
  Close;
end;

procedure TfrmCalendar.btnAcceptClick(Sender: TObject);
begin
  frmWeeklyWages.btnSave.Enabled := True;
  frmWeeklyWages.BtnCancel.Enabled := True;
  Close;
end;

procedure TfrmCalendar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

end.
