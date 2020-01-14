//NB: program is 800x600 and must be modified as same
//NB: if a week is ever run over a year end this program must be checked first

unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, ComCtrls, DBTables, Db, StdCtrls, Grids,
  DBGrids;

type
  TPayKind = (pkNormal, pkFinal, pkHoliday);

  TCoinageType = record                       { for Coinage Analysis Totals. }
    TTens,TFives,TTwos,TOnes,TFiftyC,TTwentyC,TTenC,TFiveC,
    TTwoC,TOneC : Double;
  end;

  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Modify1: TMenuItem;
    Wages1: TMenuItem;
    Weekly1: TMenuItem;
    FinalPay1: TMenuItem;
    HolidayPay1: TMenuItem;
    Reports1: TMenuItem;
    EmployeeList1: TMenuItem;
    DischargeList1: TMenuItem;
    YearEnd1: TMenuItem;
    Setup1: TMenuItem;
    Help1: TMenuItem;
    Company1: TMenuItem;
    PrintSetupInfo1: TMenuItem;
    Employee1: TMenuItem;
    Tax1: TMenuItem;
    FinancialYearEnd1: TMenuItem;
    Panel1: TPanel;
    spdExit: TSpeedButton;
    About1: TMenuItem;
    Users1: TMenuItem;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    N1: TMenuItem;
    CloseApplication1: TMenuItem;
    StatusBar1: TStatusBar;
    IO1: TMenuItem;
    ImportCompanydat1: TMenuItem;
    Database: TDatabase;
    qryInitials: TQuery;
    qryInitialsINITIALS: TStringField;
    UserInitials1: TMenuItem;
    spdEmployee: TSpeedButton;
    spdWeeklyWages: TSpeedButton;
    spdFinalPay: TSpeedButton;
    PrintDialog1: TPrintDialog;
    tabCompany: TTable;
    tabCompanyBATUSERNAME: TStringField;
    tabCompanyPAYKIND: TStringField;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    shwBirthdayMonth: TEdit;
    qryBirthDays: TQuery;
    qryBirthDaysSURNAME: TStringField;
    qryBirthDaysFIRSTNAME: TStringField;
    qryBirthDaysBIRTHDATE: TDateTimeField;
    datBirthDays: TDataSource;
    lbxBirthDays: TListBox;
    DischargedFullList1: TMenuItem;
    Banks1: TMenuItem;
    Departments1: TMenuItem;
    SummaryTotals1: TMenuItem;
    MonthlyDeductions1: TMenuItem;
    TaxCertificates1: TMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure spdExitClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure CloseApplication1Click(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImportCompanydat1Click(Sender: TObject);
    procedure Company1Click(Sender: TObject);
    procedure DatabaseLogin(Database: TDatabase; LoginParams: TStrings);
    procedure OpeningBalances1Click(Sender: TObject);
    procedure UserInitials1Click(Sender: TObject);
    procedure spdEmployeeClick(Sender: TObject);
    procedure spdWeeklyWagesClick(Sender: TObject);
    procedure FinalPay1Click(Sender: TObject);
    procedure EmployeeList1Click(Sender: TObject);
    procedure DischargeList1Click(Sender: TObject);
    procedure Tax1Click(Sender: TObject);
    procedure FinancialYearEnd1Click(Sender: TObject);
    procedure HolidayPay1Click(Sender: TObject);
    procedure DischargedFullList1Click(Sender: TObject);
    procedure Banks1Click(Sender: TObject);
    procedure Departments1Click(Sender: TObject);
    procedure SummaryTotals1Click(Sender: TObject);
    procedure MonthlyDeductions1Click(Sender: TObject);
    procedure TaxCertificates1Click(Sender: TObject);
  private
    { Private declarations }
    TodaysDate{,StartDate,EndDate}:TDateTime;
    Year, Month, Day: Word;
    BDYear, BDMonth, BDDay: Word;
    procedure LoginUser;
    procedure EnableMenuItems(EnableThem: Boolean);
    procedure GetInitials;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  UserInitials:string[4];
  UserLoginName:string[8];
  UserPassword:string[8];
  CurrentDate:TDateTime; //today's date
  PayKind: TPayKind;
  PrintFile : TextFile;
  Username: String; // Name user loged on as
  LastDateOfYear:TDateTime; //added DL131299; used in Holiday Pay routine
  //MidDateOfYear:TDateTime; //added DL041208; used in Holiday Pay routine - removed DL051213
  MidDateOf2010Year:TDateTime; //added DL101212; used in Holiday Pay routine
  SundaysLeft:integer; //added DL051213 to determine how many weeks (Sundays) are left this year.

implementation

uses Password, impv35, company, initials, employee, wklywages, About,
  prnempfullhs, prnempfulrhs, prndischarge, {FinalPay,} TaxYearEnd,
  CalendarYEnd, holidaypay, prnempchoice, banks, departments, GetDates,
  WagesReportSummary, rptGenDeduction, fTaxCertificates;

{$R *.DFM}

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.spdExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.About1Click(Sender: TObject);
begin
//  ShowMessage('Wages version 7.0');
  frmAbout.ShowModal;
end;

procedure TfrmMain.CloseApplication1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.Login1Click(Sender: TObject);
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

procedure TfrmMain.LoginUser;
begin
  try
    Database.Open;
//    IBEventAlerter1.Registered:=true;
    StatusBar1.Panels[1].Text:='';
    EnableMenuItems(True);
  except
    { If user not able to login, display the reason and show logged out page }
    on E:EDBEngineError do begin
      MessageDlg('Invalid User Name or Password', mtError, [mbOK], 0);
      EnableMenuItems(False);
      StatusBar1.Panels[1].Text:='';
    end;
  end;
end;

procedure TfrmMain.Logout1Click(Sender: TObject);
begin
//  IBEventAlerter1.Registered:=false;
  Database.Connected := False;
  {Notebook1.ActivePage := 'Logged Out';}
  StatusBar1.Panels[1].Text:='';
  EnableMenuItems(False);
end;

procedure TfrmMain.EnableMenuItems(EnableThem: Boolean);
{ Receives a boolean value which determines enable / disable of menu items. }
begin
  Modify1.Enabled := EnableThem;
  Wages1.Enabled := EnableThem;
  Reports1.Enabled := EnableThem;
  YearEnd1.Enabled := EnableThem;
  Setup1.Enabled := EnableThem;
end;

procedure TfrmMain.GetInitials;
begin
  qryInitials.Active:=false;
  qryInitials.Params[0].AsString:=UserLoginName;
  qryInitials.Active:=true;
  with qryInitials.Fields[0] do
  begin
    if IsNull then
    begin
      Logout1Click(Self);
      ShowMessage('Invalid User');
      StatusBar1.Panels[1].Text:='';
      UserInitials:='';
    end
    else
      UserInitials:=AsString;
  end;
  qryInitials.Active:=false;
  if Database.Connected then
  begin
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
    EnableMenuItems(True);
{    dmMain.tabCompany.Open;
    dmMain.tabEmployee.Open;
    dmMain.tabCompany.FindKey([1]);}

    shwBirthdayMonth.Text:=FormatDateTime('mmmm, yyyy',now);
    TodaysDate:=now;
    DecodeDate(TodaysDate, Year, Month, Day);
{    StartDate:=EncodeDate(Year, Month, 1);
    Month:=Month+1;
    if Month=13 then
      Month:=1;
    EndDate:=EncodeDate(Year, Month, 1)-1; //start of next month -1 day}
    qryBirthDays.Close;
{    qryBirthDays.ParamByName('StartDate').AsDate:=StartDate;
    qryBirthDays.ParamByName('EndDate').AsDate:=EndDate;}
    qryBirthDays.Open;
    qryBirthDays.First;
    lbxBirthDays.Clear;
    while not qryBirthDays.EOF do
    begin
      DecodeDate(qryBirthDaysBIRTHDATE.AsDateTime, BDYear, BDMonth, BDDay);
      if BDMonth=Month then
        lbxBirthDays.Items.Add(
          FormatDateTime('dd/mm/yyyy',qryBirthDaysBIRTHDATE.AsDateTime)+
          ': '+
          qryBirthDaysSURNAME.AsString+ ', '+
          qryBirthDaysFIRSTNAME.AsString);
      qryBirthDays.Next;
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  TDYear,TDMonth,TDDay:word; //TD=Today added DL131299
begin
  {set changes to SysUtils unit}
  ShortDateFormat:='dd/mm/yyyy';
  DecodeDate(date, TDYear, TDMonth, TDDay); //added DL131299
  LastDateOfYear:=EncodeDate(TDYear,12,31); //added DL131299
  //MidDateOfYear:=EncodeDate(TDYear,6,30); //added DL041208 - removed DL051213
  MidDateOf2010Year:=EncodeDate(2010,6,30); //added DL101212
  SundaysLeft:=0; //set in HolidayPay Routine.
  try
    Database.Open;
  except
    { If user not able to login, display the reason and show logged out page }
    on E:EDBEngineError do begin
      {MessageDlg(E.Message, mtError, [mbOK], 0);}
      MessageDlg('Invalid User Name or Password', mtError, [mbOK], 0);
      EnableMenuItems(False);
      StatusBar1.Panels[1].Text:='';
      Halt(1); //Application.Terminate;
    end;
  end;
  if Database.Connected then     //JT040199  temp remove
    GetInitials;
end;

procedure TfrmMain.ImportCompanydat1Click(Sender: TObject);
begin
  frmImportv35:=TfrmImportv35.Create(Application);
  frmImportv35.ShowModal;
end;

procedure TfrmMain.Company1Click(Sender: TObject);
begin
  frmCompany:=TfrmCompany.Create(Application);
  frmCompany.ShowModal;
end;

procedure TfrmMain.DatabaseLogin(Database: TDatabase;
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
  else
    Halt(1);   //JT030798  allow user to cancel gracefully
  StatusBar1.Panels[1].Text:='';
  if UpperCase(PasswordDlg.UName.Text) = 'SYSDBA' then
  begin
    {AccessLevel:=0; {supervisor}
    StatusBar1.Panels[1].Text:='SYSDBA';
    Username := 'SYSDBA';
  end
  else
  begin
    { If user is not SYSDBA show user information. }
    {AccessLevel:=1; {lookup in database}
    StatusBar1.Panels[1].Text:=PasswordDlg.UName.Text;
    Username := PasswordDlg.UName.Text;
  end;
end;

procedure TfrmMain.OpeningBalances1Click(Sender: TObject);
begin
  //put erase employee list button onto this form
end;

procedure TfrmMain.UserInitials1Click(Sender: TObject);
begin
  frmInitials:=TfrmInitials.Create(Application);
  frmInitials.ShowModal;
end;

procedure TfrmMain.spdEmployeeClick(Sender: TObject);
begin
{  tabCompany.Open;
  if tabCompanyPAYKIND.AsString <>   then
  begin
    ShowMessage('You are busy with a different wages application');
    tabCompany.Close;
    Exit;
  end
  else
  begin
    tabCompany.Close;}
    frmEmployee:=TfrmEmployee.Create(Application);
    frmEmployee.ShowModal;
{  end;}
end;

procedure TfrmMain.spdWeeklyWagesClick(Sender: TObject);
begin
  tabCompany.Open;
  if (tabCompanyPAYKIND.AsString <> 'AW') and (tabCompanyPAYKIND.AsString <> '') then
  begin
    ShowMessage('You are busy with a different wages application');
    tabCompany.Close;
    Exit;
  end;
  tabCompany.Close;
//  if tabCompanyBATUSERNAME.AsString <> Username then
//    EditMode := False // Ither 'None' or other user running WW or FP
//  else
//    EditMode := True; // You are WW or FP already
  PayKind := pkNormal;
  frmWeeklyWages := TfrmWeeklyWages.Create(Application);
  frmWeeklyWages.ShowModal;
//  tabCompany.Close;
{  tabCompany.Open;
  if tabCompanyBATUSERNAME.AsString = 'None' then
  begin
   if MessageDlg('Do you want to run weekly wages',mtConfirmation,[mbYes,mbNo],0) = idYes then
   begin
     PayKind := pkNormal;
     Database.StartTransaction;
     tabCompany.Edit;
     tabCompanyBATUSERNAME.AsString := Username;
     tabCompanyPAYKIND.AsString := 'WW';
     tabCompany.Post;
     Database.Commit;
     EditMode := True;
     frmWeeklyWages := TfrmWeeklyWages.Create(Application);
     frmWeeklyWages.ShowModal;
   end
   else
   begin
     EditMode := False;
     PayKind := pkNormal;
     frmWeeklyWages := TfrmWeeklyWages.Create(Application);
     frmWeeklyWages.ShowModal;
   end;
  end
  else  // tabCompanyBATUSERNAME.AsString <> 'None'
  begin
   if tabCompanyBATUSERNAME.AsString = Username then
   begin
     if tabCompanyPAYKIND.AsString = 'WW' then // you are allready running wages
     begin
       EditMode := True;
       PayKind := pkNormal;
       frmWeeklyWages := TfrmWeeklyWages.Create(Application);
       frmWeeklyWages.ShowModal;
     end
     else
     begin
       ShowMessage('You are busy with a diferent wages application');
     end;
   end
   else
   begin
     ShowMessage('Another user is editing wages');
   end;
  end;
  tabCompany.Close;}
end;

procedure TfrmMain.FinalPay1Click(Sender: TObject);
begin
  tabCompany.Open;
  if (tabCompanyPAYKIND.AsString <> 'BF') and (tabCompanyPAYKIND.AsString <> '') then
  begin
    ShowMessage('You are busy with a different wages application');
    tabCompany.Close;
    Exit;
  end;
  tabCompany.Close;
{  tabCompany.Open;
  if tabCompanyBATUSERNAME.AsString = 'None' then
  begin
    PayKind := pkFinal;
    Database.StartTransaction;
    tabCompany.Edit;
    tabCompanyBATUSERNAME.AsString := Username;
    tabCompanyPAYKIND.AsString := 'fp';
    tabCompany.Post;
    Database.Commit;
    EditMode := True;
    frmWeeklyWages := TfrmWeeklyWages.Create(Application);
    frmWeeklyWages.ShowModal;
  end
  else  // tabCompanyBATUSERNAME.AsString <> 'None'
  begin
    if tabCompanyBATUSERNAME.AsString = Username then
    begin
      if tabCompanyPAYKIND.AsString = 'FP' then // you are allready running wages
      begin
        EditMode := True;
        PayKind := pkFinal;
        frmWeeklyWages := TfrmWeeklyWages.Create(Application);
        frmWeeklyWages.ShowModal;
      end
      else
      begin
        ShowMessage('You are bussy with a diferent wages application');
      end;
    end
    else
    begin
      ShowMessage('A nother user is editing wages');
    end;
  end;
  tabCompany.Close;}
//  EditMode := False;
  PayKind := pkFinal;
  frmWeeklyWages := TfrmWeeklyWages.Create(Application);
  frmWeeklyWages.ShowModal;
end;

procedure TfrmMain.EmployeeList1Click(Sender: TObject);
begin
  //Modified DL030622
  frmPrnEmpChoice:=TfrmPrnEmpChoice.Create(Application);
  frmPrnEmpChoice.ShowModal;
end;

procedure TfrmMain.DischargeList1Click(Sender: TObject);
begin
//allow the selection of dates or financial / calendar years
  frmPrnDischarge:=TfrmPrnDischarge.Create(Application);
  frmPrnDischarge.tabCompany.Open;
  frmPrnDischarge.qryDisch.Open;
  frmPrnDischarge.qrpDischarge.Preview;
  frmPrnDischarge.qryDisch.Close;
  frmPrnDischarge.tabCompany.Close;
  frmPrnDischarge.Release;
end;

procedure TfrmMain.Tax1Click(Sender: TObject);
begin
  frmTaxYearEnd := TfrmTaxYearEnd.Create(Application);
  frmTaxYearEnd.ShowModal;
  frmTaxYearEnd.Release;
end;

procedure TfrmMain.FinancialYearEnd1Click(Sender: TObject);
begin
  frmCalendarYEnd := TfrmCalendarYEnd.Create(Application);
  frmCalendarYEnd.ShowModal;
  frmCalendarYEnd.Release;
end;

procedure TfrmMain.HolidayPay1Click(Sender: TObject);
begin
  tabCompany.Open;
  if (tabCompanyPAYKIND.AsString <> 'HP') and (tabCompanyPAYKIND.AsString <> '') then
  begin
    ShowMessage('You are busy with a different wages application');
    tabCompany.Close;
    Exit;
  end;
  tabCompany.Close;
  PayKind := pkHoliday;
  frmHolidayPay := TfrmHolidayPay.Create(Application);
  frmHolidayPay.ShowModal;
end;

procedure TfrmMain.DischargedFullList1Click(Sender: TObject);
//var
//  FromDateString,ToDateString:string;
begin
  //added by DL05122000
  //enter the start date
  //enter the end date

  {removed FromDateString and ToDateString and added Standard Calendar Lookup Screen DL060219
  FromDateString:= InputBox('Discharge List',
    'Please enter the start date (dd-mmm-yyyy)', '');
  ToDateString:= InputBox('Discharge List',
    'Please enter the end date (dd-mmm-yyyy)', '');}

  frmGetDates.Caption:='Full Discharge List Date Selection';
  frmGetDates.calDates.DisplayDate:=date;
  if frmGetDates.ShowModal=mrCancel then
    Exit;

  frmPrnEmpFulLHS:=TfrmPrnEmpFulLHS.Create(Application);
  frmPrnEmpFulLHS.tabCompany.Open;
  frmPrnEmpFulLHS.qryEmployee.Close;
  frmPrnEmpFulLHS.qryEmployee.SQL.Clear;
  frmPrnEmpFulLHS.qryEmployee.SQL.Add('select *');
  frmPrnEmpFulLHS.qryEmployee.SQL.Add('from employee');
  //frmPrnEmpFulLHS.qryEmployee.SQL.Add('where dischargedate >= '''+FromDateString+'''');
  //frmPrnEmpFulLHS.qryEmployee.SQL.Add('and dischargedate <= '''+ToDateString+'''');
  frmPrnEmpFulLHS.qryEmployee.SQL.Add('where dischargedate >= '''+
    formatdatetime('dd-mmm-yyyy',frmGetDates.calDates.StartDate)+'''');
  frmPrnEmpFulLHS.qryEmployee.SQL.Add('and dischargedate <= '''+
    formatdatetime('dd-mmm-yyyy',frmGetDates.calDates.FinishDate)+'''');
  frmPrnEmpFulLHS.qryEmployee.SQL.Add('order by clkno');
  frmPrnEmpFulLHS.qryEmployee.Open; //modify for start and end date
  frmPrnEmpFulLHS.qrlHeading.Caption:='Employee Discharge Listing from '+
    //FromDateString+' to '+ToDateString;
    formatdatetime('dd-mmm-yyyy',frmGetDates.calDates.StartDate)+' to '+
    formatdatetime('dd-mmm-yyyy',frmGetDates.calDates.FinishDate);
  frmPrnEmpFulLHS.qrpEmployeeLHS.Preview;
  frmPrnEmpFulLHS.qryEmployee.Close;
  frmPrnEmpFulLHS.tabCompany.Close;

  frmPrnEmpFulRHS:=TfrmPrnEmpFulRHS.Create(Application);
  frmPrnEmpFulRHS.tabCompany.Open;
  frmPrnEmpFulRHS.qryEmployee.Close;
  frmPrnEmpFulRHS.qryEmployee.SQL.Clear;
  frmPrnEmpFulRHS.qryEmployee.SQL.Add('select *');
  frmPrnEmpFulRHS.qryEmployee.SQL.Add('from employee');
  frmPrnEmpFulRHS.qryEmployee.SQL.Add('where dischargedate >= '''+
    formatdatetime('dd-mmm-yyyy',frmGetDates.calDates.StartDate)+'''');
  frmPrnEmpFulRHS.qryEmployee.SQL.Add('and dischargedate <= '''+
    formatdatetime('dd-mmm-yyyy',frmGetDates.calDates.FinishDate)+'''');
  frmPrnEmpFulRHS.qryEmployee.SQL.Add('order by clkno');
  frmPrnEmpFulRHS.qryEmployee.Open; //modify for start and end date
  frmPrnEmpFulRHS.qrlHeading.Caption:='Employee Discharge Listing from '+
    formatdatetime('dd-mmm-yyyy',frmGetDates.calDates.StartDate)+' to '+
    formatdatetime('dd-mmm-yyyy',frmGetDates.calDates.FinishDate);
  frmPrnEmpFulRHS.qrpEmployeeRHS.Preview;
  frmPrnEmpFulRHS.qryEmployee.Close;
  frmPrnEmpFulRHS.tabCompany.Close;
end;

procedure TfrmMain.Banks1Click(Sender: TObject);
begin
  frmBanks:=TfrmBanks.Create(Application);
  frmBanks.ShowModal;
end;

procedure TfrmMain.Departments1Click(Sender: TObject);
begin
  frmDepartments:=TfrmDepartments.Create(Application);
  frmDepartments.ShowModal;
end;

procedure TfrmMain.SummaryTotals1Click(Sender: TObject);
begin
  //method added DL060414
  frmPayReportSummary := TfrmPayReportSummary.Create(Application);
  frmPayReportSummary.ShowModal;
end;

procedure TfrmMain.MonthlyDeductions1Click(Sender: TObject);
begin
  //method added DL060508
  frmGenDeductionReport := TfrmGenDeductionReport.Create(Application);
  frmGenDeductionReport.ShowModal;
end;

procedure TfrmMain.TaxCertificates1Click(Sender: TObject);
begin
  //method added DL080731
  frmTaxCertificates := TfrmTaxCertificates.Create(Application);
  frmTaxCertificates.ShowModal;
end;

end.
