unit Password;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, SysUtils;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label2: TLabel;
    UName: TEdit;
    PWord: TEdit;
    Panel1: TPanel;
    Memo1: TMemo;
    Label3: TLabel;
    edtTodaysDate: TEdit;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  public
    function GetPassword: Boolean;
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

{$R *.DFM}

function TPasswordDlg.GetPassword: Boolean;
begin
  UName.Text := '';
  PWord.Text := '';
  ActiveControl := UName;
  Result := ShowModal = mrOk;
end;

procedure TPasswordDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{  PasswordDlg.Release;}
end;

procedure TPasswordDlg.FormShow(Sender: TObject);
begin
  edtTodaysDate.Text:=FormatDateTime('dddd, dd/mm/yyyy',now);
end;

initialization
  PasswordDlg := TPasswordDlg.Create(Application);

end.

