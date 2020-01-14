unit Password;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label2: TLabel;
    UName: TEdit;
    PWord: TEdit;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

initialization
  PasswordDlg := TPasswordDlg.Create(Application);
end.

