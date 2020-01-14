{$A+,B-,D+,F-,G+,I+,K+,L+,N+,P+,Q+,R+,S+,T-,V+,W-,X+,Y+}
{ $ M 20480,8192}
unit Password;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Registry;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label2: TLabel;
    UName: TEdit;
    PWord: TEdit;
    Memo1: TMemo;
    Label3: TLabel;
    cbxServerOrLocal: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    //
  public
    function GetPassword: Boolean;
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

uses vbmain;

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
end;

initialization
  PasswordDlg := TPasswordDlg.Create(Application);
end.

