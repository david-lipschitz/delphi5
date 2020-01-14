unit Vbmain;

//fix reports Reports2Click some time DL161199 (rs_api.dll)

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, DB, Buttons, ExtCtrls, DBTables, ComCtrls;

type
  TMainForm = class(TForm)
    Database: TDatabase;
    MainMenu1: TMainMenu;
    Strip1: TMenuItem;
    oldReceive1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Options1: TMenuItem;
    YnMaint1: TMenuItem;
    VBSpecs1: TMenuItem;
    Structure1: TMenuItem;
    Security1: TMenuItem;
    Initials1: TMenuItem;
    PrintBoxLabels1: TMenuItem;
    InitialsQuery: TQuery;
    InitialsQueryINITIALS: TStringField;
    Users1: TMenuItem;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    N1: TMenuItem;
    CloseApplication1: TMenuItem;
    Palletize1: TMenuItem;
    Despatch1: TMenuItem;
    PalletLabels1: TMenuItem;
    YarnCol1: TMenuItem;
    Reports1: TMenuItem;
    Yarn2: TMenuItem;
    ByWeek1: TMenuItem;
    ByJob1: TMenuItem;
    PiecesForecast1: TMenuItem;
    ByWeekNo1: TMenuItem;
    ByStructure1: TMenuItem;
    StockPosition1: TMenuItem;
    BarCode1: TMenuItem;
    YarnStru1: TMenuItem;
    YarnType1: TMenuItem;
    YnLotNos1: TMenuItem;
    Width1: TMenuItem;
    WorkingHours1: TMenuItem;
    LoomMaint1: TMenuItem;
    LoomType1: TMenuItem;
    LoomSpec1: TMenuItem;
    StruLoom1: TMenuItem;
    StockMinima1: TMenuItem;
    WarpType1: TMenuItem;
    WarpCol1: TMenuItem;
    Receive1: TMenuItem;
    Warp1: TMenuItem;
    Delivery1: TMenuItem;
    Knot1: TMenuItem;
    Start1: TMenuItem;
    Summary1: TMenuItem;
    FinishReceipt1: TMenuItem;
    Cut1: TMenuItem;
    Complete1: TMenuItem;
    WorWLots1: TMenuItem;
    FabricLots1: TMenuItem;
    VBType1: TMenuItem;
    Customers1: TMenuItem;
    Edit2: TMenuItem;
    Agents2: TMenuItem;
    Orders1: TMenuItem;
    Picking1: TMenuItem;
    Planning1: TMenuItem;
    VBMake1: TMenuItem;
    Weeks1: TMenuItem;
    WorkingHours2: TMenuItem;
    PreLoomLoad1: TMenuItem;
    NoEntryQuery: TQuery;
    EndofMonth1: TMenuItem;
    Purchases1: TMenuItem;
    Category1: TMenuItem;
    Product1: TMenuItem;
    PackagingOrders1: TMenuItem;
    GoodsRcvd1: TMenuItem;
    WIPRcpt1: TMenuItem;
    Issues1: TMenuItem;
    WeftYarnRcvd1: TMenuItem;
    StockSituation1: TMenuItem;
    VBSalesSitu1: TMenuItem;
    Enquiries1: TMenuItem;
    YarnLotNo1: TMenuItem;
    Stripforme1: TMenuItem;
    VBBalanceAnalysis1: TMenuItem;
    FinishType1: TMenuItem;
    GreigeRcpt1: TMenuItem;
    StatusBar1: TStatusBar;
    spdOrders: TSpeedButton;
    spdVBRcpt: TSpeedButton;
    spdVBMake: TSpeedButton;
    spdVBType: TSpeedButton;
    spdPalletise: TSpeedButton;
    spdDespatch: TSpeedButton;
    spdPick: TSpeedButton;
    IssuesEnquiry1: TMenuItem;
    PartNumbers1: TMenuItem;
    Qualty1: TMenuItem;
    vbParams: TTable;
    vbParamsBARCODEPRINTERTYPE: TStringField;
    Parameters1: TMenuItem;
    spdVBMaint: TSpeedButton;
    VBQuery1: TMenuItem;
    NewTrace1: TMenuItem;
    Cubesslow1: TMenuItem;
    LocalvsExportCubesinceJan981: TMenuItem;
    spdEnquiries: TSpeedButton;
    SpecialDespatch1: TMenuItem;
    ImportCalemard1: TMenuItem;
    UpdateDataWarehouse1: TMenuItem;
    CheckRowNo1: TMenuItem;
    Refabric1: TMenuItem;
    spdRefabric: TSpeedButton;
    SetVBRedundant1: TMenuItem;
    procedure About1Click(Sender: TObject);
    procedure CloseApp(Sender: TObject);
    procedure oldReceive1Click(Sender: TObject);
    procedure Structure1Click(Sender: TObject);
    procedure Width1Click(Sender: TObject);
    procedure PrintBoxLabels1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DatabaseLogin(Database: TDatabase; LoginParams: TStrings);
    procedure Login1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure CloseApplication1Click(Sender: TObject);
    procedure Initials1Click(Sender: TObject);
    procedure Despatch1Click(Sender: TObject);
    procedure PalletLabels1Click(Sender: TObject);
    procedure BarCode1Click(Sender: TObject);
    procedure YarnStru1Click(Sender: TObject);
    procedure YarnCol1Click(Sender: TObject);
    procedure YarnType1Click(Sender: TObject);
    procedure YnLotNos1Click(Sender: TObject);
    procedure LoomType1Click(Sender: TObject);
    procedure LoomSpec1Click(Sender: TObject);
    procedure StruLoom1Click(Sender: TObject);
    procedure StockMinima1Click(Sender: TObject);
    procedure WarpType1Click(Sender: TObject);
    procedure WarpCol1Click(Sender: TObject);
    procedure Receive1Click(Sender: TObject);
    procedure Delivery1Click(Sender: TObject);
    procedure Summary1Click(Sender: TObject);
    procedure FinishReceipt1Click(Sender: TObject);
    procedure WorWLots1Click(Sender: TObject);
    procedure FabricLots1Click(Sender: TObject);
    procedure VBType1Click(Sender: TObject);
    procedure Orders1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure VBMake1Click(Sender: TObject);
    procedure Palletize1Click(Sender: TObject);
    procedure Weeks1Click(Sender: TObject);
    procedure Picking1Click(Sender: TObject);
    procedure StockPosition1Click(Sender: TObject);
    procedure PreLoomLoad1Click(Sender: TObject);
    procedure Agents2Click(Sender: TObject);
    procedure EndofMonth1Click(Sender: TObject);
    procedure Category1Click(Sender: TObject);
    procedure Product1Click(Sender: TObject);
    procedure PackagingOrders1Click(Sender: TObject);
    procedure GoodsRcvd1Click(Sender: TObject);
    procedure WIPRcpt1Click(Sender: TObject);
    procedure Issues1Click(Sender: TObject);
    procedure WeftYarnRcvd1Click(Sender: TObject);
    procedure StockSituation1Click(Sender: TObject);
    procedure VBSalesSitu1Click(Sender: TObject);
    procedure Enquiries1Click(Sender: TObject);
    procedure YarnLotNo1Click(Sender: TObject);
    procedure Stripforme1Click(Sender: TObject);
    procedure VBBalanceAnalysis1Click(Sender: TObject);
    procedure FinishType1Click(Sender: TObject);
    procedure GreigeRcpt1Click(Sender: TObject);
    procedure spdOrdersClick(Sender: TObject);
    procedure spdVBTypeClick(Sender: TObject);
    procedure spdVBMakeClick(Sender: TObject);
    procedure spdPickClick(Sender: TObject);
    procedure spdPalletiseClick(Sender: TObject);
    procedure spdDespatchClick(Sender: TObject);
    procedure IssuesEnquiry1Click(Sender: TObject);
    procedure PartNumbers1Click(Sender: TObject);
    procedure Reports2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Qualty1Click(Sender: TObject);
    procedure Parameters1Click(Sender: TObject);
    procedure spdVBMaintClick(Sender: TObject);
    procedure VBQuery1Click(Sender: TObject);
    procedure NewTrace1Click(Sender: TObject);
    procedure LocalvsExportCubesinceJan981Click(Sender: TObject);
    procedure spdEnquiriesClick(Sender: TObject);
    procedure spdVBRcptClick(Sender: TObject);
    procedure SpecialDespatch1Click(Sender: TObject);
    procedure ImportCalemard1Click(Sender: TObject);
    procedure UpdateDataWarehouse1Click(Sender: TObject);
    procedure CheckRowNo1Click(Sender: TObject);
    procedure Refabric1Click(Sender: TObject);
    procedure SetVBRedundant1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoginUser;
    procedure EnableMenuItems(EnableThem: Boolean);
    procedure GetInitials;
  public
    { Public declarations }
    UserLoginName:string[8];
    UserPassword:string[8];
  end;

const
{  NextWarpNoRef=1; {in the NextNo table}
{  NextPieceNoRef=2; now available}
{  NextStripNoRef=3; now available}
  NextVTOrdNoRef=4;
{  NextVBBoxNoRef=5; now available}
  NextRollNoRef=6;
  NextDespNoRef=7;
  NextPalletNoRef=8;
  SOH = #1;
  STX = #2; {STX, ie Control B or ASCII char 2}
  CR = #13; {carriage return}
  LF = #10; {line feed=#10}
  mtrTOyds = 1.0936; {metres to yards conversion}

var
  MainForm: TMainForm;
  UserInitials:string[4];
  {PassValue is used so that programs can call each other}
  PassValue:integer; {usually assigned 0}
  NoEntryBeforeDate:TDateTime; {added DL190497}
  PrinterAborted:boolean; {added DL250897}
  PassString:string; //used in VBEnq and VBOrdDet added DL100599
  ServerLocal:string; //added DL020319
  ServerLocalSelection:string; //added DL020319

implementation

{$R *.DFM}

uses VBMaint, VBType, VBStru, VBWidth,
  VBBoxLab, Password, VBInitls, VBPalHdr,
  VBPalLbl, VBBarCde,
  {the next line to be removed once factories 1 & 2 integrated}
  VBYnStru, VBYnCol, VBYnType,VBYnLot,
  LoomType, LoomSpec, StruLoom, VBStkMin,
  WarpType, WorWLot, WarpCol, WarpRcpt,
  FabLotNo, GreyRcpt, VBRcpt, VBOrdHdr,
  VBSupCus, VBMake, VBPal, WkNos, VBPick,
  VBStkSum, VBPreLL, Agent, VBeom, ProdCat, Product, Aporder, Delin,
  Wiprcpt, VBDelIss, VBYnRcpt, StokSitu, VBSalesSitu, VBEnq, vbtrace,
  vbbal, fintype, weavesummary, finrcpt, issuerep, custpart, reports,
  QltyReason, vbparams, VBQuery, vbtrace_new, vbsalescube1, vbspecialdesp,
  importcalemard, updatewh, About, checkrowno, vbrefabric, fsetvbredundant;

procedure TMainForm.About1Click(Sender: TObject);
begin
  frmAbout.ShowModal;
end;

procedure TMainForm.CloseApp(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.oldReceive1Click(Sender: TObject);
begin
  VBMaintForm:=TVBMaintForm.Create(Application);
  VBMaintForm.ShowModal;
end;

procedure TMainForm.Structure1Click(Sender: TObject);
begin
  VBStruForm:=TVBStruForm.Create(Application);
  VBStruForm.ShowModal;
end;

procedure TMainForm.Width1Click(Sender: TObject);
begin
  VBWidthForm:=TVBWidthForm.Create(Application);
  VBWidthForm.ShowModal;
end;

procedure TMainForm.PrintBoxLabels1Click(Sender: TObject);
begin
  VBBoxLabelForm:=TVBBoxLabelForm.Create(Application);
  VBBoxLabelForm.ShowModal;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  {set changes to SysUtils unit}
  ShortDateFormat:='dd/mm/yyyy'; //change to 'dd/mm/yyyy' when required Done on DL161199
  try
    Database.Connected:=true;
//    IBEventAlerter1.Registered:=true;
    GetInitials;
    VBParams.Open; //added DL271098
  except
    { If user not able to login, display the reason and show logged out page }
    on E:EDBEngineError do begin
      {MessageDlg(E.Message, mtError, [mbOK], 0);}
      MessageDlg('Invalid User Name or Password', mtError, [mbOK], 0);
      EnableMenuItems(False);
      StatusBar1.Panels[1].Text:='';
      Application.Terminate;
    end;
  end;
end;

procedure TMainForm.DatabaseLogin(Database: TDatabase;
  LoginParams: TStrings);
begin
  if PasswordDlg.GetPassword then
  begin
    { Set login params from PasswordDlg }

    //Params and choice of database added DL020319
    Database.Params.Clear;
    if PasswordDlg.cbxServerOrLocal.Text='Server (no replication)' then
    begin
      Database.AliasName:='VBStock6LinuxSQL';
      Database.Params.Add('SERVER NAME=commander:/usr/interbase/vbstock6.gdb');
      ServerLocalSelection:='S';
    end
    else //LoginForm.cbxServerOrLocal.Text='Replication (local)'
    begin
      Database.AliasName:='VBStock6ReplSQL';
      //Database.Params.Add('SERVER NAME=c:\VStock\Linux\vbstock6.gdb'); - Allan modify for local
      Database.Params.Add('SERVER NAME=C:\ibdatabase\Linux\vbstock6.gdb'); //- Allan modify for local
      ServerLocalSelection:='L';
    end;
    Database.Params.Add('USER NAME=' + PasswordDlg.UName.Text); //added DL020319
    Database.Params.Add('OPEN MODE=READ/WRITE');
    Database.Params.Add('SCHEMA CACHE SIZE=8');
    Database.Params.Add('LANGDRIVER=');
    Database.Params.Add('SQLQRYMODE=');
    Database.Params.Add('SQLPASSTHRU MODE=SHARED NOAUTOCOMMIT');
    Database.Params.Add('SCHEMA CACHE TIME=-1');
    Database.Params.Add('MAX ROWS=-1');
    Database.Params.Add('BATCH COUNT=200');
    Database.Params.Add('ENABLE SCHEMA CACHE=FALSE');
    Database.Params.Add('SCHEMA CACHE DIR=');
    Database.Params.Add('ENABLE BCD=FALSE');
    Database.Params.Add('BLOBS TO CACHE=64');
    Database.Params.Add('BLOB SIZE=32');
    Database.Params.Add('PASSWORD=' + PasswordDlg.PWord.Text); //added DL020319

    LoginParams.Values['USER NAME'] := PasswordDlg.UName.Text; //- removed DL020319
    LoginParams.Values['PASSWORD'] := PasswordDlg.PWord.Text; //- removed DL020319

    UserLoginName:=PasswordDlg.UName.Text;
    UserPassword:=PasswordDlg.PWord.Text;
  end
  else {Application.Terminate}Halt(1);   //JT030798  allow user to cancel gracefully
  { If the user is SYSDBA show supervisor information. }
  StatusBar1.Panels[1].Text:='';
  if UpperCase(PasswordDlg.UName.Text) = 'SYSDBA' then begin
    {AccessLevel:=0; {supervisor}
    StatusBar1.Panels[1].Text:='SYSDBA';
  end
  else
  begin
    { If user is not SYSDBA show user information. }
    {AccessLevel:=1; {lookup in database}
    StatusBar1.Panels[1].Text:=PasswordDlg.UName.Text;
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
      StatusBar1.Panels[1].Text:='';
      UserInitials:='';
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
      StatusBar1.Panels[1].Text:='';
      UserInitials:='';
    end
    else
    begin
      NoEntryBeforeDate:=AsFloat;
    end;
  NoEntryQuery.Active:=false;
  if UpperCase(PasswordDlg.UName.Text) = 'SYSDBA' then begin
    {AccessLevel:=0; {supervisor}
    StatusBar1.Panels[1].Text:='SYSDBA';
  end
  else
  begin
    { If user is not SYSDBA show user information. }
    {AccessLevel:=1; {lookup in database}
    StatusBar1.Panels[1].Text:=PasswordDlg.UName.Text;
  end;
end;

procedure TMainForm.Login1Click(Sender: TObject);
begin
  { If another user is currently logged in, log him(her) out. }
  if Database.Connected then
  begin
//    IBEventAlerter1.Registered:=false;
    Database.Close;
  end;
  LoginUser;                          { Login the new user. }
  if Database.Connected then
    GetInitials;
end;

procedure TMainForm.LoginUser;
begin
  try
    Database.Open;
//    IBEventAlerter1.Registered:=true;
    StatusBar1.Panels[1].Text:='';
    EnableMenuItems(True);
    VBParams.Open; //added DL271098
  except
    { If user not able to login, display the reason and show logged out page }
    on E:EDBEngineError do begin
{      MessageDlg(E.Message, mtError, [mbOK], 0);}
      MessageDlg('Invalid User Name or Password', mtError, [mbOK], 0);
      EnableMenuItems(False);
      StatusBar1.Panels[1].Text:='';
    end;
  end;
end;

procedure TMainForm.Logout1Click(Sender: TObject);
begin
//  IBEventAlerter1.Registered:=false;
  Database.Connected := False;
  {Notebook1.ActivePage := 'Logged Out';}
  StatusBar1.Panels[1].Text:='';
  EnableMenuItems(False);
end;

procedure TMainForm.CloseApplication1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.EnableMenuItems(EnableThem: Boolean);
{ Receives a boolean value which determines enable / disable of menu items. }
begin
  Strip1.Enabled := EnableThem;
  Warp1.Enabled := EnableThem;
  Customers1.Enabled := EnableThem;
  Planning1.Enabled := EnableThem;
  Purchases1.Enabled := EnableThem; {added DL120697}
  //Reports2.Enabled := EnableThem; {added DL040598} //remove until fixed DL161199
  Options1.Enabled := EnableThem;
  spdOrders.Enabled := EnableThem; {added DL040598}
  spdVBRcpt.Enabled := EnableThem; {added DL040598}
  spdVBMake.Enabled := EnableThem; {added DL040598}
  spdVBType.Enabled := EnableThem; {added DL040598}
  spdPick.Enabled := EnableThem; {added DL040598}
  spdPalletise.Enabled := EnableThem; {added DL040598}
  spdDespatch.Enabled := EnableThem; {added DL040598}
  spdVBMaint.Enabled := EnableThem; //added DL271098
  spdEnquiries.Enabled := EnableThem; //added DL100599
end;

procedure TMainForm.Initials1Click(Sender: TObject);
begin
  VBInitlsForm:=TVBInitlsForm.Create(Application);
  VBInitlsForm.ShowModal;
end;

procedure TMainForm.Despatch1Click(Sender: TObject);
begin
  VBPalHdrForm:=TVBPalHdrForm.Create(Application);
  VBPalHdrForm.ShowModal;
end;

procedure TMainForm.PalletLabels1Click(Sender: TObject);
begin
  VBGenPalLabelForm:=TVBGenPalLabelForm.Create(Application);
  VBGenPalLabelForm.ShowModal;
end;

procedure TMainForm.BarCode1Click(Sender: TObject);
begin
  VBBarCodeForm:=TVBBarCodeForm.Create(Application);
  VBBarCodeForm.ShowModal;
end;

procedure TMainForm.YarnStru1Click(Sender: TObject);
begin
  {to be deleted after integration}
  VBYnStruForm:=TVBYnStruForm.Create(Application);
  VBYnStruForm.ShowModal;
end;

procedure TMainForm.YarnCol1Click(Sender: TObject);
begin
  {to be deleted after integration}
  VBYnColForm:=TVBYnColForm.Create(Application);
  VBYnColForm.ShowModal;
end;

procedure TMainForm.YarnType1Click(Sender: TObject);
begin
  {to be deleted after integration}
  VBYnTypeForm:=TVBYnTypeForm.Create(Application);
  VBYnTypeForm.ShowModal;
end;

procedure TMainForm.YnLotNos1Click(Sender: TObject);
begin
  {to be deleted after integration}
  VBYarnLotForm:=TVBYarnLotForm.Create(Application);
  VBYarnLotForm.ShowModal;
end;

procedure TMainForm.LoomType1Click(Sender: TObject);
begin
  LoomTypeForm:=TLoomTypeForm.Create(Application);
  LoomTypeForm.ShowModal;
end;

procedure TMainForm.LoomSpec1Click(Sender: TObject);
begin
  LoomSpecForm:=TLoomSpecForm.Create(Application);
  LoomSpecForm.ShowModal;
end;

procedure TMainForm.StruLoom1Click(Sender: TObject);
begin
  StruLoomForm:=TStruLoomForm.Create(Application);
  StruLoomForm.ShowModal;
end;

procedure TMainForm.StockMinima1Click(Sender: TObject);
begin
  VBStockMinForm:=TVBStockMinForm.Create(Application);
  VBStockMinForm.ShowModal;
end;

procedure TMainForm.WarpType1Click(Sender: TObject);
begin
  WarpTypeForm:=TWarpTypeForm.Create(Application);
  WarpTypeForm.ShowModal;
end;

procedure TMainForm.WarpCol1Click(Sender: TObject);
begin
  WarpColForm:=TWarpColForm.Create(Application);
  WarpColForm.ShowModal;
end;

procedure TMainForm.Receive1Click(Sender: TObject);
begin
  VBRcptForm:=TVBRcptForm.Create(Application);
  VBRcptForm.ShowModal;
end;

procedure TMainForm.Delivery1Click(Sender: TObject);
begin
  WarpRcptForm:=TWarpRcptForm.Create(Application);
  WarpRcptForm.ShowModal;
end;

procedure TMainForm.Summary1Click(Sender: TObject);
begin
  WeaveSummaryForm:=TWeaveSummaryForm.Create(Application);
  WeaveSummaryForm.ShowModal;
end;

procedure TMainForm.FinishReceipt1Click(Sender: TObject);
begin
  frmFinRcpt:=TfrmFinRcpt.Create(Application);
  frmFinRcpt.ShowModal;
end;

procedure TMainForm.WorWLots1Click(Sender: TObject);
begin
  WorWLotNoForm:=TWorWLotNoForm.Create(Application);
  WorWLotNoForm.ShowModal;
end;

procedure TMainForm.FabricLots1Click(Sender: TObject);
begin
  FabricLotNoForm:=TFabricLotNoForm.Create(Application);
  FabricLotNoForm.ShowModal;
end;

procedure TMainForm.VBType1Click(Sender: TObject);
begin
  VBTypeForm:=TVBTypeForm.Create(Application);
  VBTypeForm.ShowModal;
end;

procedure TMainForm.Orders1Click(Sender: TObject);
begin
  PassValue:=0;
  VBOrdHdrForm:=TVBOrdHdrForm.Create(Application);
  VBOrdHdrForm.ShowModal;
end;

procedure TMainForm.Edit2Click(Sender: TObject);
begin
  VBSupCusForm:=TVBSupCusForm.Create(Application);
  VBSupCusForm.ShowModal;
end;

procedure TMainForm.VBMake1Click(Sender: TObject);
begin
  VBMakeForm:=TVBMakeForm.Create(Application);
  VBMakeForm.ShowModal;
end;

procedure TMainForm.Palletize1Click(Sender: TObject);
begin
  VBPalletForm:=TVBPalletForm.Create(Application);
  VBPalletForm.ShowModal;
end;

procedure TMainForm.Weeks1Click(Sender: TObject);
begin
  WkNosForm:=TWkNosForm.Create(Application);
  WkNosForm.ShowModal;
end;

procedure TMainForm.Picking1Click(Sender: TObject);
begin
  VBPickForm:=TVBPickForm.Create(Application);
  VBPickForm.ShowModal;
end;

procedure TMainForm.StockPosition1Click(Sender: TObject);
begin
  VBStkSumForm:=TVBStkSumForm.Create(Application);
  VBStkSumForm.ShowModal;
end;

procedure TMainForm.PreLoomLoad1Click(Sender: TObject);
begin
  VBPreLLForm:=TVBPreLLForm.Create(Application);
  VBPreLLForm.ShowModal;
end;

procedure TMainForm.Agents2Click(Sender: TObject);
begin
  AgentForm:=TAgentForm.Create(Application);
  AgentForm.ShowModal;
end;

procedure TMainForm.EndofMonth1Click(Sender: TObject);
begin
  VBeomForm:=TVBeomForm.Create(Application);
  VBeomForm.ShowModal;
end;

procedure TMainForm.Category1Click(Sender: TObject);
begin
  ProdCatForm:=TProdCatForm.Create(Application);
  ProdCatForm.ShowModal;
end;

procedure TMainForm.Product1Click(Sender: TObject);
begin
  ProductForm:=TProductForm.Create(Application);
  ProductForm.ShowModal;
end;

procedure TMainForm.PackagingOrders1Click(Sender: TObject);
begin
  APOrderForm:=TAPOrderForm.Create(Application);
  APOrderForm.ShowModal;
end;

procedure TMainForm.GoodsRcvd1Click(Sender: TObject);
begin
  DelInForm:=TDelInForm.Create(Application);
  DelInForm.ShowModal;
end;

procedure TMainForm.WIPRcpt1Click(Sender: TObject);
begin
  WIPRcptForm:=TWIPRcptForm.Create(Application);
  WIPRcptForm.ShowModal;
end;

procedure TMainForm.Issues1Click(Sender: TObject);
begin
  VBDelIssForm:=TVBDelIssForm.Create(Application);
  VBDelIssForm.Show; {Modal xxx}
end;

procedure TMainForm.WeftYarnRcvd1Click(Sender: TObject);
begin
  VBYnRcptForm:=TVBYnRcptForm.Create(Application);
  VBYnRcptForm.ShowModal;
end;

procedure TMainForm.StockSituation1Click(Sender: TObject);
begin
  StokSituForm:=TStokSituForm.Create(Application);
  StokSituForm.ShowModal;
end;

procedure TMainForm.VBSalesSitu1Click(Sender: TObject);
begin
  VBSalesSituForm:=TVBSalesSituForm.Create(Application);
  VBSalesSituForm.ShowModal;
end;

procedure TMainForm.Enquiries1Click(Sender: TObject);
begin
  PassString:='';
  VBEnqForm:=TVBEnqForm.Create(Application);
  VBEnqForm.ShowModal;
end;

procedure TMainForm.YarnLotNo1Click(Sender: TObject);
begin
  {to be deleted after integration}
  VBYarnLotForm:=TVBYarnLotForm.Create(Application);
  VBYarnLotForm.ShowModal;
end;

procedure TMainForm.Stripforme1Click(Sender: TObject);
begin
  VBStripTraceForm:=TVBStripTraceForm.Create(Application);
  VBStripTraceForm.Show;
end;

procedure TMainForm.VBBalanceAnalysis1Click(Sender: TObject);
begin
  VBBalForm:=TVBBalForm.Create(Application);
  VBBalForm.Show;
end;

procedure TMainForm.FinishType1Click(Sender: TObject);
begin
  VBFinTypeForm:=TVBFinTypeForm.Create(Application);
  VBFinTypeForm.Show;
end;

procedure TMainForm.GreigeRcpt1Click(Sender: TObject);
begin
  frmGreigeRcpt:=TfrmGreigeRcpt.Create(Application);
  frmGreigeRcpt.Show;
end;

procedure TMainForm.spdOrdersClick(Sender: TObject);
begin
  PassValue:=0;
  VBOrdHdrForm:=TVBOrdHdrForm.Create(Application);
  VBOrdHdrForm.ShowModal;
end;

procedure TMainForm.spdVBTypeClick(Sender: TObject);
begin
  VBTypeForm:=TVBTypeForm.Create(Application);
  VBTypeForm.ShowModal;
end;

procedure TMainForm.spdVBMakeClick(Sender: TObject);
begin
  VBMakeForm:=TVBMakeForm.Create(Application);
  VBMakeForm.ShowModal;
end;

procedure TMainForm.spdPickClick(Sender: TObject);
begin
  VBPickForm:=TVBPickForm.Create(Application);
  VBPickForm.ShowModal;
end;

procedure TMainForm.spdPalletiseClick(Sender: TObject);
begin
  VBPalletForm:=TVBPalletForm.Create(Application);
  VBPalletForm.ShowModal;
end;

procedure TMainForm.spdDespatchClick(Sender: TObject);
begin
  VBPalHdrForm:=TVBPalHdrForm.Create(Application);
  VBPalHdrForm.ShowModal;
end;

procedure TMainForm.IssuesEnquiry1Click(Sender: TObject);
begin
  IssueRepForm:=TIssueRepForm.Create(Application);
  IssueRepForm.ShowModal;
end;

procedure TMainForm.PartNumbers1Click(Sender: TObject);
begin
  CustPartForm:=TCustPartForm.Create(Application);
  CustPartForm.ShowModal;
end;

procedure TMainForm.Reports2Click(Sender: TObject);
begin
  //remove until fixed DL161199
//  ReportsForm:=TReportsForm.Create(Application);
//  ReportsForm.ShowModal;
end;

procedure TMainForm.FormActivate(Sender: TObject);
//var ErrorCode:integer;
begin
{  Report1.AutoUnload:=false;
  Report1.Preview:=true;
  Report1.ReportDir:='N:\';
  ErrorCode:=Report1.Connect(67,'VBStkSQL',
    MainForm.UserLoginName,MainForm.UserPassword,
    'enterprise:c:\a_usr\vstock\vbstock.gdb');}
//  ShowMessage(inttostr(ErrorCode));
//  while Report1.Busy do ; // wait for ReportSmith to load
//  Report1.ReportName:='customers summary report.rpt';
//  Report1.Run;
//  while Report1.Busy do ; // wait for ReportSmith to load
//  Report1.Run;
end;

procedure TMainForm.Qualty1Click(Sender: TObject);
begin
  QualityForm := TQualityForm.Create(Application);
  QualityForm.ShowModal;
end;

procedure TMainForm.Parameters1Click(Sender: TObject);
begin
  // VBParams form added DL271098
  VBParamsForm := TVBParamsForm.Create(Application);
  VBParamsForm.ShowModal;
end;

procedure TMainForm.spdVBMaintClick(Sender: TObject);
begin
  VBMaintForm:=TVBMaintForm.Create(Application);
  VBMaintForm.ShowModal;
end;

procedure TMainForm.VBQuery1Click(Sender: TObject);
begin
  VBQueryForm := TVBQueryForm.Create(Application);
  VbQueryForm.Show;
end;

procedure TMainForm.NewTrace1Click(Sender: TObject);
begin
  NewVBStripTraceForm:=TNewVBStripTraceForm.Create(Application);
  NewVBStripTraceForm.Show;
end;

procedure TMainForm.LocalvsExportCubesinceJan981Click(Sender: TObject);
begin
  if MessageDlg('This cube analyses local/export first quality quantity sales by month, width and structure.'+#13+
    'Continue?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    frmVBSalesCube1:=TfrmVBSalesCube1.Create(Application);
    frmVBSalesCube1.Show;
  end;
end;

procedure TMainForm.spdEnquiriesClick(Sender: TObject);
begin
  PassString:='';
  VBEnqForm:=TVBEnqForm.Create(Application);
  VBEnqForm.ShowModal;
end;

procedure TMainForm.spdVBRcptClick(Sender: TObject);
begin
  VBRcptForm:=TVBRcptForm.Create(Application);
  VBRcptForm.ShowModal;
end;

procedure TMainForm.SpecialDespatch1Click(Sender: TObject);
begin
  if UserInitials='SYS' then
  begin
    frmSpecialDespatch:=TfrmSpecialDespatch.Create(Application);
    frmSpecialDespatch.ShowModal;
  end
  else
    ShowMessage('Only System Administrator can execute this.');
end;

procedure TMainForm.ImportCalemard1Click(Sender: TObject);
begin
  if UserInitials='SYS' then
  begin
    frmImportCalemard:=TfrmImportCalemard.Create(Application);
    frmImportCalemard.ShowModal;
  end
  else
    ShowMessage('Only System Administrator can execute this.');
end;

procedure TMainForm.UpdateDataWarehouse1Click(Sender: TObject);
begin
  if UserInitials='SYS' then
  begin
    frmUpdateWH:=TfrmUpdateWH.Create(Application);
    frmUpdateWH.ShowModal;
  end
  else
    ShowMessage('Only System Administrator can execute this.');
end;

procedure TMainForm.CheckRowNo1Click(Sender: TObject);
begin
  //method added DL030215
  if (UserInitials='SYS') or (UserInitials='KKD') then //KEITH added DL041028; should have been KKD DL070530
  begin
    frmCheckRowNo:=TfrmCheckRowNo.Create(Application);
    frmCheckRowNo.ShowModal;
  end
  else
    ShowMessage('Only System Administrator can execute this.');
end;

procedure TMainForm.Refabric1Click(Sender: TObject);
begin
  frmVBRefabric:=TfrmVBRefabric.Create(Application);
  frmVBRefabric.ShowModal;
end;

procedure TMainForm.SetVBRedundant1Click(Sender: TObject);
begin
  //method added DL060510
  if StatusBar1.Panels[1].Text <> 'SYSDBA' then
    raise Exception.Create('Only SYSDBA can run this process.');
  frmSetVBRedundant:=TfrmSetVBRedundant.Create(Application);
  frmSetVBRedundant.ShowModal;
end;

end.
