unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Menus, DBTables, Db, ComCtrls;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Close1: TMenuItem;
    Invoicing1: TMenuItem;
    Currencies1: TMenuItem;
    Generate1: TMenuItem;
    Invoice1: TMenuItem;
    Panel1: TPanel;
    CloseSpdBtn: TSpeedButton;
    Database: TDatabase;
    spdCurrency: TSpeedButton;
    spdGenerate: TSpeedButton;
    spdInvoice: TSpeedButton;
    Help1: TMenuItem;
    About1: TMenuItem;
    StatusBar: TStatusBar;
    procedure Close1Click(Sender: TObject);
    procedure Currencies1Click(Sender: TObject);
    procedure Generate1Click(Sender: TObject);
    procedure Invoice1Click(Sender: TObject);
    procedure CloseSpdBtnClick(Sender: TObject);
    procedure spdCurrencyClick(Sender: TObject);
    procedure spdGenerateClick(Sender: TObject);
    procedure spdInvoiceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure DatabaseLogin(Database: TDatabase; LoginParams: TStrings);
  private
    { Private declarations }
    procedure EnableMenuItems(EnableThem: Boolean);
  public
    { Public declarations }
    UserLoginName:string[8];
    UserPassword:string[8];
  end;

var
  MainForm: TMainForm;

implementation

uses currency, geninvoice, invoice, About, Password;

{$R *.DFM}

procedure TMainForm.EnableMenuItems(EnableThem: Boolean);
{ Receives a boolean value which determines enable / disable of menu items. }
begin
  spdCurrency.Enabled := EnableThem;
  spdGenerate.Enabled := EnableThem;
  spdInvoice.Enabled := EnableThem;
end;

procedure TMainForm.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.Currencies1Click(Sender: TObject);
begin
  frmCurrency:=TfrmCurrency.Create(Application);
  frmCurrency.ShowModal;
end;

procedure TMainForm.Generate1Click(Sender: TObject);
begin
  frmGenInvoice:=TfrmGenInvoice.Create(Application);
  frmGenInvoice.ShowModal;
end;

procedure TMainForm.Invoice1Click(Sender: TObject);
begin
  frmInvoice:=TfrmInvoice.Create(Application);
  frmInvoice.ShowModal;
end;

procedure TMainForm.CloseSpdBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.spdCurrencyClick(Sender: TObject);
begin
  frmCurrency:=TfrmCurrency.Create(Application);
  frmCurrency.ShowModal;
end;

procedure TMainForm.spdGenerateClick(Sender: TObject);
begin
  frmGenInvoice:=TfrmGenInvoice.Create(Application);
  frmGenInvoice.ShowModal;
end;

procedure TMainForm.spdInvoiceClick(Sender: TObject);
begin
  frmInvoice:=TfrmInvoice.Create(Application);
  frmInvoice.ShowModal;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  {set changes to SysUtils unit}
  ShortDateFormat:='dd/mm/yyyy';
  try
    Database.Connected:=true;
//    IBEventAlerter1.Registered:=true;
//    GetInitials;
//    VBParams.Open;
  except
    { If user not able to login, display the reason and show logged out page }
    on E:EDBEngineError do begin
      {MessageDlg(E.Message, mtError, [mbOK], 0);}
      MessageDlg('Invalid User Name or Password', mtError, [mbOK], 0);
      EnableMenuItems(False);
      StatusBar.SimpleText:='';
      Application.Terminate;
    end;
  end;
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
  frmAbout.ShowModal;
end;

procedure TMainForm.DatabaseLogin(Database: TDatabase;
  LoginParams: TStrings);
begin
  if PasswordDlg.GetPassword then
  begin
    { Set login params from PasswordDlg }
    LoginParams.Values['USER NAME'] := PasswordDlg.UName.Text;
    LoginParams.Values['PASSWORD'] := PasswordDlg.PWord.Text;

    UserLoginName:=PasswordDlg.UName.Text;
    UserPassword:=PasswordDlg.PWord.Text;
  end
  else {Application.Terminate}Halt(1);
  { If the user is SYSDBA show supervisor information. }
  StatusBar.SimpleText:='';
  if UpperCase(PasswordDlg.UName.Text) = 'SYSDBA' then begin
    {AccessLevel:=0; {supervisor}
    StatusBar.SimpleText:='SYSDBA';
  end
  else
  begin
    { If user is not SYSDBA show user information. }
    {AccessLevel:=1; {lookup in database}
    StatusBar.SimpleText:=PasswordDlg.UName.Text;
  end;
end;

end.
