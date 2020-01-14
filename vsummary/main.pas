unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBTables, Buttons, ExtCtrls, StdCtrls, Db, ComCtrls;

type
  TMainForm = class(TForm)
    Database: TDatabase;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Summarise1: TMenuItem;
    Close1: TMenuItem;
    TxnDetWIP1: TMenuItem;
    Panel1: TPanel;
    CloseSpdBtn: TSpeedButton;
    DatabaseAlias: TComboBox;
    Label1: TLabel;
    ConnectBtn: TButton;
    Audit1: TMenuItem;
    All1: TMenuItem;
    MonthEndWIPAdjust1: TMenuItem;
    Prices1: TMenuItem;
    StdQltyValues1: TMenuItem;
    Product1: TMenuItem;
    N1: TMenuItem;
    YarnPrices1: TMenuItem;
    VBQualities1: TMenuItem;
    VBCostPricesnotdone1: TMenuItem;
    VBLocalSellingPrices1: TMenuItem;
    VBStandardSellingPrices1: TMenuItem;
    Prices2: TMenuItem;
    VBStandardSellingPrices2: TMenuItem;
    VBLocalSellingPrices2: TMenuItem;
    VBCostPrices1: TMenuItem;
    YarnPrices2: TMenuItem;
    ControlAccts1: TMenuItem;
    Product2: TMenuItem;
    VBOverseasSellingPrices1: TMenuItem;
    Txn1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    StatusBar: TStatusBar;
    MakeRedundant1: TMenuItem;
    Stock1: TMenuItem;
    RMReport1: TMenuItem;
    procedure Close1Click(Sender: TObject);
    procedure TxnDetWIP1Click(Sender: TObject);
    procedure CloseSpdBtnClick(Sender: TObject);
    procedure ConnectBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure All1Click(Sender: TObject);
    procedure MonthEndWIPAdjust1Click(Sender: TObject);
    procedure StdQltyValues1Click(Sender: TObject);
    procedure Product1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure YarnPrices1Click(Sender: TObject);
    procedure VBQualities1Click(Sender: TObject);
    procedure VBLocalSellingPrices1Click(Sender: TObject);
    procedure VBStandardSellingPrices1Click(Sender: TObject);
    procedure VBCostPricesnotdone1Click(Sender: TObject);
    procedure VBStandardSellingPrices2Click(Sender: TObject);
    procedure VBLocalSellingPrices2Click(Sender: TObject);
    procedure VBCostPrices1Click(Sender: TObject);
    procedure YarnPrices2Click(Sender: TObject);
    procedure ControlAccts1Click(Sender: TObject);
    procedure DatabaseAliasChange(Sender: TObject);
    procedure Product2Click(Sender: TObject);
    procedure VBOverseasSellingPrices1Click(Sender: TObject);
    procedure Txn1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure DatabaseLogin(Database: TDatabase; LoginParams: TStrings);
    procedure MakeRedundant1Click(Sender: TObject);
    procedure RMReport1Click(Sender: TObject);
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

{$R *.DFM}

uses txndet, audit, wipadjust, stdqlty, product, ctrlaccp, ynprices, vbqlty,
  vblsp, vbssp, vbscp, vbssp_new, vblsp_new, vbscp_new, ynprices_new,
  product_new, ctrlaccp_new, vbosp, txndetmonth, About, Password,
  fMakeRedundant, fRMStock;

procedure TMainForm.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.TxnDetWIP1Click(Sender: TObject);
begin
//  if Database.Connected then
//  begin
    TxnDetSummaryForm:=TTxnDetSummaryForm.Create(Application);
    TxnDetSummaryForm.ShowModal;
//  end
//  else
//  begin
//    ShowMessage('Connect to database first');
//  end;
end;

procedure TMainForm.CloseSpdBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ConnectBtnClick(Sender: TObject);
begin
  if DatabaseAlias.Text='' then
    raise Exception.Create('Connect to database first');
  if ConnectBtn.Caption='Connect' then
  begin
    Database.AliasName:=DatabaseAlias.Text;
    Database.Connected:=true;
    ConnectBtn.Caption:='Disconnect';
    MainForm.Caption:='DB Maintenance: Connected to '+DatabaseAlias.Text;
    EnableMenuItems(true);
  end
  else
  begin
    Database.Connected:=false;
    ConnectBtn.Caption:='Connect';
    MainForm.Caption:='DB Maintenance: not connected';
    EnableMenuItems(false);
  end;
end;

procedure TMainForm.EnableMenuItems(EnableThem: Boolean);
begin
  Summarise1.Enabled:=EnableThem;
  Audit1.Enabled:=EnableThem;
  Prices1.Enabled:=EnableThem;
  Prices2.Enabled:=EnableThem;
  Stock1.Enabled:=EnableThem;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  ShortDateFormat:='dd/mm/yyyy'; //changed to yyyy DL030200
  EnableMenuItems(false);
  Database.Connected:=false;
end;

procedure TMainForm.All1Click(Sender: TObject);
begin
  AuditForm:=TAuditForm.Create(Application);
  AuditForm.ShowModal;
end;

procedure TMainForm.MonthEndWIPAdjust1Click(Sender: TObject);
begin
  if DatabaseAlias.Text<>'Stock6LinuxSQL' then //was StockSQL DL210901
    raise Exception.Create('Can only do this in VT1');
  WIPAdjustForm:=TWIPAdjustForm.Create(Application);
  WIPAdjustForm.ShowModal;
end;

procedure TMainForm.StdQltyValues1Click(Sender: TObject);
begin
  StdQltyForm:=TStdQltyForm.Create(Application);
  StdQltyForm.ShowModal;
end;

procedure TMainForm.Product1Click(Sender: TObject);
begin
  ProductForm:=TProductForm.Create(Application);
  ProductForm.ShowModal;
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
  CtrlAccPForm:=TCtrlAccPForm.Create(Application);
  CtrlAccPForm.ShowModal;
end;

procedure TMainForm.YarnPrices1Click(Sender: TObject);
begin
  YnPricesForm:=TYnPricesForm.Create(Application);
  YnPricesForm.ShowModal;
end;

procedure TMainForm.VBQualities1Click(Sender: TObject);
begin
  if DatabaseAlias.Text<>'VBStock6LinuxSQL' then //was VBStkSQL DL210901
    raise Exception.Create('Can only do this in VT2');
  VBQltyForm:=TVBQltyForm.Create(Application);
  VBQltyForm.ShowModal;
end;

procedure TMainForm.VBLocalSellingPrices1Click(Sender: TObject);
begin
  if DatabaseAlias.Text<>'VBStock6LinuxSQL' then //was VBStkSQL DL210901
    raise Exception.Create('Can only do this in VT2');
  VBLSPForm:=TVBLSPForm.Create(Application);
  VBLSPForm.ShowModal;
end;

procedure TMainForm.VBStandardSellingPrices1Click(Sender: TObject);
begin
  if DatabaseAlias.Text<>'VBStock6LinuxSQL' then //was VBStkSQL DL210901
    raise Exception.Create('Can only do this in VT2');
  VBSSPForm:=TVBSSPForm.Create(Application);
  VBSSPForm.ShowModal;
end;

procedure TMainForm.VBCostPricesnotdone1Click(Sender: TObject);
begin
  if DatabaseAlias.Text<>'VBStock6LinuxSQL' then //was VBStkSQL DL210901
    raise Exception.Create('Can only do this in VT2');
  VBSCPForm:=TVBSCPForm.Create(Application);
  VBSCPForm.ShowModal;
end;

procedure TMainForm.VBStandardSellingPrices2Click(Sender: TObject);
begin
  if DatabaseAlias.Text<>'VBStock6LinuxSQL' then //was VBStkSQL DL210901
    raise Exception.Create('Can only do this in VT2');
  NewVBSSPForm:=TNewVBSSPForm.Create(Application);
  NewVBSSPForm.ShowModal;
end;

procedure TMainForm.VBLocalSellingPrices2Click(Sender: TObject);
begin
  if DatabaseAlias.Text<>'VBStock6LinuxSQL' then //was VBStkSQL DL210901
    raise Exception.Create('Can only do this in VT2');
  NewVBLSPForm:=TNewVBLSPForm.Create(Application);
  NewVBLSPForm.ShowModal;
end;

procedure TMainForm.VBCostPrices1Click(Sender: TObject);
begin
  if DatabaseAlias.Text<>'VBStock6LinuxSQL' then //was VBStkSQL DL210901
    raise Exception.Create('Can only do this in VT2');
  NewVBSCPForm:=TNewVBSCPForm.Create(Application);
  NewVBSCPForm.ShowModal;
end;

procedure TMainForm.YarnPrices2Click(Sender: TObject);
begin
  NewYnPricesForm:=TNewYnPricesForm.Create(Application);
  NewYnPricesForm.ShowModal;
end;

procedure TMainForm.ControlAccts1Click(Sender: TObject);
begin
  NewCtrlAccPForm:=TNewCtrlAccPForm.Create(Application);
  NewCtrlAccPForm.ShowModal;
end;

procedure TMainForm.Product2Click(Sender: TObject);
begin
  NewProductForm:=TNewProductForm.Create(Application);
  NewProductForm.ShowModal;
end;

procedure TMainForm.DatabaseAliasChange(Sender: TObject);
begin
  ConnectBtn.Enabled := True;
end;

procedure TMainForm.VBOverseasSellingPrices1Click(Sender: TObject);
begin
  if DatabaseAlias.Text<>'VBStock6LinuxSQL' then //was VBStkSQL DL210901
    raise Exception.Create('Can only do this in VT2');
  frmVBOSP:=TfrmVBOSP.Create(Application);
  frmVBOSP.ShowModal;
end;

procedure TMainForm.Txn1Click(Sender: TObject);
begin
  //added DL080300
  TxnDetSummaryMonthForm:=TTxnDetSummaryMonthForm.Create(Application);
  TxnDetSummaryMonthForm.ShowModal;
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

procedure TMainForm.MakeRedundant1Click(Sender: TObject);
begin
  //method added DL070701
  frmMakeRedundant:=TfrmMakeRedundant.Create(Application);
  frmMakeRedundant.ShowModal;
end;

procedure TMainForm.RMReport1Click(Sender: TObject);
begin
  //method added DL110425
  frmRMStock:=TfrmRMStock.Create(Application);
  frmRMStock.ShowModal;
end;

end.
