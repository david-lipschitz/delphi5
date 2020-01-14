{version control}
{1.0 Delphi 1}
{2.01 Delphi 2}
{2.02 including transaction processing}
{3.01 Delphi 3}
{5.01 Delphi 5}

unit Main;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, Menus, Buttons, ExtCtrls, DBTables;

type
  TMainForm = class(TForm)
    StockMenu: TMainMenu;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    Options1: TMenuItem;
    Initials2: TMenuItem;
    Initials1: TMenuItem;
    Maint1: TMenuItem;
    Currencies1: TMenuItem;
    Terms1: TMenuItem;
    Parameters1: TMenuItem;
    ProdCategories1: TMenuItem;
    Unit1: TMenuItem;
    Department1: TMenuItem;
    Agent1: TMenuItem;
    Supplier1: TMenuItem;
    Product1: TMenuItem;
    Store1: TMenuItem;
    Receive: TMenuItem;
    DelIssue1: TMenuItem;
    Purchases1: TMenuItem;
    Order1: TMenuItem;
    Database: TDatabase;
    Panel1: TPanel;
    ExitBtn: TSpeedButton;
    About: TMenuItem;
    WIPRcpt1: TMenuItem;
    YnSpecs1: TMenuItem;
    YnKind1: TMenuItem;
    YnStruc1: TMenuItem;
    YnCol1: TMenuItem;
    YnType1: TMenuItem;
    YnRcpt1: TMenuItem;
    BarCode1: TMenuItem;
    PrinterSetup: TPrinterSetupDialog;
    PrinterSetup1: TMenuItem;
    Reports1: TMenuItem;
    Users1: TMenuItem;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    N1: TMenuItem;
    StatusPanel: TPanel;
    UserPanel: TPanel;
    Panel4: TPanel;
    InitialsQuery: TQuery;
    InitialsQueryINITIALS: TStringField;
    DesptoPallet1: TMenuItem;
    DesptoClient1: TMenuItem;
    PalletLabel1: TMenuItem;
    LotNoCount1: TMenuItem;
    EffGroups1: TMenuItem;
    YarnLotNo1: TMenuItem;
    NoEntryQuery: TQuery;
    EndofMonth1: TMenuItem;
    Transfer121: TMenuItem;
    Sales1: TMenuItem;
    ControlAccounts1: TMenuItem;
    YarnReturn1: TMenuItem;
    DeliveryIssues1: TMenuItem;
    spdYarnRcpt: TSpeedButton;
    spdPalletise: TSpeedButton;
    spdDespatch: TSpeedButton;
    spdYarnType: TSpeedButton;
    WarpType1: TMenuItem;
    procedure Initials1Click(Sender: TObject);
    procedure Parameters1Click(Sender: TObject);
    procedure CloseApp(Sender: TObject);
    procedure Currencies1Click(Sender: TObject);
    procedure Terms1Click(Sender: TObject);
    procedure ProdCategories1Click(Sender: TObject);
    procedure Unit1Click(Sender: TObject);
    procedure Department1Click(Sender: TObject);
    procedure Agent1Click(Sender: TObject);
    procedure Supplier1Click(Sender: TObject);
    procedure Product1Click(Sender: TObject);
    procedure Order1Click(Sender: TObject);
    procedure ReceiveClick(Sender: TObject);
    {procedure BarCodeClick(Sender: TObject);}
    procedure DelIssue1Click(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure YnKind1Click(Sender: TObject);
    procedure YnStruc1Click(Sender: TObject);
    procedure YnCol1Click(Sender: TObject);
    procedure YnType1Click(Sender: TObject);
    procedure YnRcpt1Click(Sender: TObject);
    procedure BarCode1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure DatabaseLogin(Database: TDatabase; LoginParams: TStrings);
    procedure Login1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure WIPRcpt1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DesptoPallet1Click(Sender: TObject);
    procedure DesptoClient1Click(Sender: TObject);
    procedure PalletLabel1Click(Sender: TObject);
    procedure LaptopComms1Click(Sender: TObject);
    procedure LotNoCount1Click(Sender: TObject);
    procedure EffGroups1Click(Sender: TObject);
    procedure YarnLotNo1Click(Sender: TObject);
    procedure EndofMonth1Click(Sender: TObject);
    procedure ControlAccounts1Click(Sender: TObject);
    procedure YarnReturn1Click(Sender: TObject);
    procedure Transfer121Click(Sender: TObject);
    procedure DeliveryIssues1Click(Sender: TObject);
    procedure spdYarnRcptClick(Sender: TObject);
    procedure spdPalletiseClick(Sender: TObject);
    procedure spdDespatchClick(Sender: TObject);
    procedure spdYarnTypeClick(Sender: TObject);
    procedure WarpType1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoginUser;
    procedure EnableMenuItems(EnableThem: Boolean);
    procedure GetInitials;
  public
    { Public declarations }
    {AccessLevel:integer;}
    UserLoginName:string[8];
  end;

{const
  in the NextNo table
  NextOrdNoRef=1;
  NextDelNoRef=2;
  NextIssueNoRef=3;
  NextBoxNoRef=4;
  NextDespNoRef=5;
  NextWIPRcptNoRef=6;
  NextPalletNoRef=7;}

var
  MainForm: TMainForm;
  UserInitials:string[4];
  {PassValue is used so that programs can call each other}
  PassValue:integer; {usually assigned 0}
  NoEntryBeforeDate:TDateTime; {added DL190497}

implementation

uses Initials, Param, Curr, Terms, ProdCat,
     MeasUnit, VTDept, Agent, Supplier,
     Product, APOrder, DelIn, BarCode,
     DelIssue, YnKind, YnStru, YnCol,
     YnType, YnRcpt, {YnDesp,} Password,
     WIPRcpt,YnPallet, YnPalHdr, PalLabel,
     {ExpYnPal,} LotNoCnt, YnEffGrp,
     YnLotNo,SPeom,
     CtrlAcct,IssueRep, Warptype, About;

{$R *.DFM}

procedure TMainForm.Initials1Click(Sender: TObject);
begin
  InitialsForm:=TInitialsForm.Create(Application);
  InitialsForm.ShowModal;
end;

procedure TMainForm.Parameters1Click(Sender: TObject);
begin
  ParamForm:=TParamForm.Create(Application);
  ParamForm.ShowModal;
end;

procedure TMainForm.CloseApp(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.Currencies1Click(Sender: TObject);
begin
  CurrencyForm:=TCurrencyForm.Create(Application);
  CurrencyForm.ShowModal;
end;

procedure TMainForm.Terms1Click(Sender: TObject);
begin
  TermsForm:=TTermsForm.Create(Application);
  TermsForm.ShowModal;
end;

procedure TMainForm.ProdCategories1Click(Sender: TObject);
begin
  ProdCatForm:=TProdCatForm.Create(Application);
  ProdCatForm.ShowModal;
end;

procedure TMainForm.Unit1Click(Sender: TObject);
begin
  MeasUnitForm:=TMeasUnitForm.Create(Application);
  MeasUnitForm.ShowModal;
end;

procedure TMainForm.Department1Click(Sender: TObject);
begin
  DeptForm:=TDeptForm.Create(Application);
  DeptForm.ShowModal;
{  DeptForm.Release; - in forms close event}
end;

procedure TMainForm.Agent1Click(Sender: TObject);
begin
  AgentForm:=TAgentForm.Create(Application);
  AgentForm.ShowModal;
end;

procedure TMainForm.Supplier1Click(Sender: TObject);
begin
  SupplierForm:=TSupplierForm.Create(Application);
  SupplierForm.ShowModal;
end;

procedure TMainForm.Product1Click(Sender: TObject);
begin
  ProductForm:=TProductForm.Create(Application);
  ProductForm.ShowModal;
end;

procedure TMainForm.Order1Click(Sender: TObject);
begin
  APOrderForm:=TAPOrderForm.Create(Application);
  APOrderForm.Enter;
end;

procedure TMainForm.ReceiveClick(Sender: TObject);
begin
  DelInForm:=TDelInForm.Create(Application);
  DelInForm.Enter;
end;

{procedure TMainForm.BarCodeClick(Sender: TObject);
begin
  BarCodeForm.ShowModal;
end;}

procedure TMainForm.DelIssue1Click(Sender: TObject);
begin
  PassValue:=0;
  DelIssueForm:=TDelIssueForm.Create(Application);
  DelIssueForm.Show; {Modalxxx}
end;

procedure TMainForm.AboutClick(Sender: TObject);
begin
  frmAbout.ShowModal;
end;

procedure TMainForm.YnKind1Click(Sender: TObject);
begin
  YnKindForm:=TYnKindForm.Create(Application);
  YnKindForm.ShowModal;
end;

procedure TMainForm.YnStruc1Click(Sender: TObject);
begin
  YarnStruForm:=TYarnStruForm.Create(Application);
  YarnStruForm.ShowModal;
end;

procedure TMainForm.YnCol1Click(Sender: TObject);
begin
  YarnColForm:=TYarnColForm.Create(Application);
  YarnColForm.ShowModal;
end;

procedure TMainForm.YnType1Click(Sender: TObject);
begin
  YarnTypeForm:=TYarnTypeForm.Create(Application);
  YarnTypeForm.ShowModal;
end;

procedure TMainForm.YnRcpt1Click(Sender: TObject);
begin
  PassValue:=0; {receipt from factory}
  YnRcptForm:=TYnRcptForm.Create(Application);
  YnRcptForm.ShowModal;
end;

procedure TMainForm.BarCode1Click(Sender: TObject);
begin
  if UserInitials='SYS' then
    BarCodeForm.ShowModal;
end;

procedure TMainForm.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetup.Execute;
end;

procedure TMainForm.DatabaseLogin(Database: TDatabase;
  LoginParams: TStrings);
{ Receives a user name and password to log into the Store database.  If user }
{ name or password are incorrect, display the logged out user screen. }
begin
  if PasswordDlg.GetPassword then
  begin
    { Set login params from PasswordDlg }
    LoginParams.Values['USER NAME'] := PasswordDlg.UName.Text;
    LoginParams.Values['PASSWORD'] := PasswordDlg.PWord.Text;
    UserLoginName:=PasswordDlg.UName.Text;
  end;
  { If the user is SYSDBA show supervisor information. }
  StatusPanel.Caption:='';
  Panel4.Caption:='';
  if UpperCase(PasswordDlg.UName.Text) = 'SYSDBA' then begin
    {AccessLevel:=0; {supervisor}
    UserPanel.Caption := 'User: SYSDBA';
  end
  else
  begin
    { If user is not SYSDBA show user information. }
    {AccessLevel:=1; {lookup in database}
    UserPanel.Caption := 'User: ' + PasswordDlg.UName.Text;
  end;
end;

procedure TMainForm.EnableMenuItems(EnableThem: Boolean);
{ Receives a boolean value which determines enable / disable of menu items. }
begin
  Store1.Enabled := EnableThem;
  Purchases1.Enabled := EnableThem;
  Options1.Enabled := EnableThem;
  Reports1.Enabled := EnableThem;
  Sales1.Enabled:=EnableThem;
  //buttons
  spdYarnRcpt.Enabled := EnableThem; {added DL151199}
  spdYarnType.Enabled := EnableThem; {added DL151199}
  spdPalletise.Enabled := EnableThem; {added DL151199}
  spdDespatch.Enabled := EnableThem; {added DL151199}
end;

procedure TMainForm.LoginUser;
begin
  try
    Database.Open;
    StatusPanel.Caption:='';
    Panel4.Caption := '';
    EnableMenuItems(True);
  except
    { If user not able to login, display the reason and show logged out page }
    on E:EDBEngineError do begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      EnableMenuItems(False);
      StatusPanel.Caption := '';
      Panel4.Caption := '';
      UserPanel.Caption := '';
    end;
  end;
end;

procedure TMainForm.Login1Click(Sender: TObject);
{ Login the new user to the database. }
begin
  { If another user is currently logged in, log him(her) out. }
  if Database.Connected then
    Database.Close;
  LoginUser;                          { Login the new user. }
  if Database.Connected then
    GetInitials;
end;

procedure TMainForm.Logout1Click(Sender: TObject);
{ Logout the current user and show the logged out screen. }
begin
  Database.Connected := False;
  {Notebook1.ActivePage := 'Logged Out';}
  StatusPanel.Caption := '';
  UserPanel.Caption := '';
  Panel4.Caption := '';
  EnableMenuItems(False);
end;

procedure TMainForm.WIPRcpt1Click(Sender: TObject);
begin
  WIPRcptForm:=TWIPRcptForm.Create(Application);
  WIPRcptForm.ShowModal;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ShortDateFormat:='dd/mm/yyyy'; //change to 'dd/mm/yyyy' when required: Done DL030200
  try
    Database.Connected:=true;
    GetInitials;
{    InitialsQuery.Active:=false;
    InitialsQuery.Params[0].AsString:=UserLoginName;
    InitialsQuery.Active:=true;
    with InitialsQuery.Fields[0] do
      if IsNull then
      begin
        Logout1Click(Self);
        ShowMessage('Invalid User');
      end
      else
        UserInitials:=AsString;}
    except
      { If user not able to login, display the reason and show logged out page }
      on E:EDBEngineError do begin
        {MessageDlg(E.Message, mtError, [mbOK], 0);}
        MessageDlg('Invalid User Name or Password', mtError, [mbOK], 0);
{        EnableMenuItems(False);
        StatusPanel.Caption := '';
        Panel4.Caption := '';
        UserPanel.Caption := '';}
        Application.Terminate;
      end;
    end;
end;

procedure TMainForm.GetInitials;
begin
  InitialsQuery.Active:=false;
  InitialsQuery.Params[0].AsString:=UserLoginName;
  InitialsQuery.Active:=true;
  with InitialsQuery.Fields[0] do
    if IsNull then
    begin
      Logout1Click(Self);
      ShowMessage('Invalid User');
      UserPanel.Caption:='';
    end
    else
      UserInitials:=AsString;
  InitialsQuery.Active:=false;
  {get noentrybeforedate}
  NoEntryQuery.Active:=false;
  NoEntryQuery.Active:=true;
  with NoEntryQuery.Fields[0] do
    if IsNull then
    begin
      Logout1Click(Self);
      ShowMessage('Invalid Parameter');
      UserPanel.Caption:='';
    end
    else
      NoEntryBeforeDate:=AsFloat;
  NoEntryQuery.Active:=false;
end;

procedure TMainForm.DesptoPallet1Click(Sender: TObject);
begin
  YnPalletForm:=TYnPalletForm.Create(Application);
  YnPalletForm.ShowModal;
end;

procedure TMainForm.DesptoClient1Click(Sender: TObject);
begin
  YnPalHdrForm:=TYnPalHdrForm.Create(Application);
  YnPalHdrForm.ShowModal;
end;

procedure TMainForm.PalletLabel1Click(Sender: TObject);
begin
  GenPalLabelForm:=TGenPalLabelForm.Create(Application);
  GenPalLabelForm.ShowModal;
end;

procedure TMainForm.LaptopComms1Click(Sender: TObject);
begin
{  ExportYarnRcptForm:=TExportYarnRcptForm.Create(Application);
  ExportYarnRcptForm.ShowModal;}
end;

procedure TMainForm.LotNoCount1Click(Sender: TObject);
begin
  LotNoCountForm:=TLotNoCountForm.Create(Application);
  LotNoCountForm.ShowModal;
end;

procedure TMainForm.EffGroups1Click(Sender: TObject);
begin
  YnEffGroupForm:=TYnEffGroupForm.Create(Application);
  YnEffGroupForm.ShowModal;
end;

procedure TMainForm.YarnLotNo1Click(Sender: TObject);
begin
  YarnLotNoForm:=TYarnLotNoForm.Create(Application);
  YarnLotNoForm.ShowModal;
end;

procedure TMainForm.EndofMonth1Click(Sender: TObject);
begin
  SPeomForm:=TSPeomForm.Create(Application);
  SPeomForm.ShowModal;
end;

procedure TMainForm.ControlAccounts1Click(Sender: TObject);
begin
  CtrlAcctForm:=TCtrlAcctForm.Create(Application);
  CtrlAcctForm.ShowModal;
end;

procedure TMainForm.YarnReturn1Click(Sender: TObject);
begin
  PassValue:=1; {return from client}
  YnRcptForm:=TYnRcptForm.Create(Application);
  YnRcptForm.ShowModal;
end;

procedure TMainForm.Transfer121Click(Sender: TObject);
begin
  PassValue:=1; {transfer using the issue program but no stock or WIP changes}
  DelIssueForm:=TDelIssueForm.Create(Application);
  DelIssueForm.ShowModal;
end;

procedure TMainForm.DeliveryIssues1Click(Sender: TObject);
begin
  IssueRepForm:=TIssueRepForm.Create(Application);
  IssueRepForm.ShowModal;
end;

procedure TMainForm.spdYarnRcptClick(Sender: TObject);
begin
  PassValue:=0; {receipt from factory}
  YnRcptForm:=TYnRcptForm.Create(Application);
  YnRcptForm.ShowModal;
end;

procedure TMainForm.spdPalletiseClick(Sender: TObject);
begin
  YnPalletForm:=TYnPalletForm.Create(Application);
  YnPalletForm.ShowModal;
end;

procedure TMainForm.spdDespatchClick(Sender: TObject);
begin
  YnPalHdrForm:=TYnPalHdrForm.Create(Application);
  YnPalHdrForm.ShowModal;
end;

procedure TMainForm.spdYarnTypeClick(Sender: TObject);
begin
  YarnTypeForm:=TYarnTypeForm.Create(Application);
  YarnTypeForm.ShowModal;
end;

procedure TMainForm.WarpType1Click(Sender: TObject);
begin
  //added DL230400
  WarpTypeForm:=TWarpTypeForm.Create(Application);
  WarpTypeForm.ShowModal;
end;

end.

