unit DBLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TLoginForm = class(TForm)
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    Bevel1: TBevel;
    PasswordEdit: TEdit;
    DatabaseEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    UserNameEdit: TEdit;
    Label3: TLabel;
    Memo1: TMemo;
    procedure EditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.DFM}

procedure TLoginForm.EditChange(Sender: TObject);
begin
  OKButton.Enabled := (UserNameEdit.Text <> '') and (PasswordEdit.Text <> '');
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  if UserNameEdit.Text = '' then
    UserNameEdit.SetFocus
  else
    PasswordEdit.SetFocus;
end;

end.
