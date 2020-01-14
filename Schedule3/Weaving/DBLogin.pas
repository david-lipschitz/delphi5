unit DBLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Registry;

type
  TLoginForm = class(TForm)
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    Bevel1: TBevel;
    PasswordEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    UserNameEdit: TEdit;
    Label3: TLabel;
    Memo1: TMemo;
    cbxServerOrLocal: TComboBox;
    procedure EditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
    ServerLocal:string; //added DL020319
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
var
  Reg: TRegistry; //added DL020319
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    //if Reg.OpenKey('\Software\OrbitalDecisions\Textiles\ServerLocal', True) then
    Reg.OpenKey('\Software\Orbital Decisions\Textiles', True);
    ServerLocal := Reg.ReadString('ServerLocal');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  if (ServerLocal='S') or (ServerLocal='') then //server
  begin
    cbxServerOrLocal.ItemIndex:=0; //'Server (no replication)';
    cbxServerOrLocal.Enabled:=false;
  end
  else if ServerLocal='L' then //local
  begin
    cbxServerOrLocal.ItemIndex:=1; //'Replication (local)';
    cbxServerOrLocal.Enabled:=false;
  end
  else if ServerLocal='D' then //choice
  begin
    cbxServerOrLocal.Enabled:=true;
  end;
  if UserNameEdit.Text = '' then
    UserNameEdit.SetFocus
  else
    PasswordEdit.SetFocus;
end;

procedure TLoginForm.OKButtonClick(Sender: TObject);
begin
  if cbxServerOrLocal.Text='' then
  begin
    ModalResult:=mrNone;
    raise Exception.Create('Please choose a database name');
  end
  else
    ModalResult:=mrOK;
end;

end.
