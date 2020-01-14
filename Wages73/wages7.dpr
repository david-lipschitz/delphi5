program wages7;
{ OD Wages Program - Version 7.6.5
  Copyright: David Lipschitz 1986-2006
  Copyright: My Power Station Technology (Pty) Ltd 1994 - 2006
  Development Start Date: December 1985. (Implemented April 1986 at Vrede Textiles Pty Ltd)
  Last Update:            January 2006.  By DL.
  Version Control:
    1: Wages program in LOTUS 1-2-3 version 1A by Barry Lipschitz;
    2: Wages program upgrade to Turbo Pascal v3 by David Lipschitz;
    3.5: Wages program upgraded to version 3 using Turbo Pascal v5.5;
      the '.5' shows that it has been running for 5 years.
    6.0: Inbetween Delphi upgrade version by JT.
    7.3: Upgraded into Delphi and Interbase}
//210999: Added the ability to discharge an employee without doing final pay
//151199: Coinage checked; Set all PAY (tabEmployeeWKSPAY) balances to zero on
//        employee before update; Rounding problems checked
//  7.4: Added the Year End Holiday Pay Routine
//  7.5: Added African Bank Loan Account
//  7.6: Upgraded in Delphi 6. DL170701
//  Added Sort Order Ability for Employee List DL030622
//  7.6.1: Added Lawyers/Garnishee Deductions DL040508
//         Added Provident Fund Loan Repayment Deductions
//  7.6.2: Year End 2004: Annual Bonus now 3 weeks, calculated based on
//         actual basic hourly rate, effective 1 July.  First 6 months based
//         on full weeks - part weeks. DL041207
//  also tabPaySlipLeavePayDays.MaxValue:=17;
//  7.6.4: Added the following fields: StandbyAllowance, BankFees,
//         OverallsDeduction, ToolsDeduction, Other3Deduction
//         Added Banks and Departments tables and lookups
//  7.6.5: Changed constants to allow for 1 week of holidays in this year and 2 in next year
//         or 2 weeks this year and 1 next year.  This is only applicable to holidays taken
//         over the end of the year.  Also modified yearend payslip format.  Also modified
//         weekly deductions and their weekly and monthly report.
//  7.6.6: Added GetDates form DL060219
//  7.6.6: Bank Analysis Sort by FirstName DL060314
//  7.6.8: Summary Totals Report Added DL060414
//  7.6.9: Insurance and Lawyer Garnishee changes to allow weekly or monthly deductions
//  7.6.10: Modified General Deduction Report to include Weekly or Monthly Deduction
//  7.6.11: Added Grade Information
//  7.6.12: Changed Union Deduction: min and max increased.
//  7.6.13: Changed Union Deduction: Funeral Scheme deduction now R1.20 instead of R1.00.
//  7.6.14: Fixed PAYE calculation
//  7.6.15: Added Export to Excel
//  7.6.16: Made Union Calculation Soft by adding fields to Company table.
//  7.6.17: DL080731: added extra fields and added SARS EasyFile Export.
//  7.6.18:
//  7.6.19: DL101212: changed annual bonus for people who started after 30 June 2010
//          Show the grade code for the employee, ie add the foreign key relationship on the employee screen.
//  7.6.20: DL111211: Annual Bonus = 0 for 2011; Change order of Tax Constants in Company.pas

uses
  Forms,
  About in 'About.pas' {frmAbout},
  CalendarYEnd in 'CalendarYEnd.pas' {frmCalendarYEnd},
  company in 'company.pas' {frmCompany},
  employee in 'employee.pas' {frmEmployee},
  impv35 in 'impv35.pas' {frmImportv35},
  initials in 'initials.pas' {frmInitials},
  main in 'main.pas' {frmMain},
  Password in 'password.pas' {PasswordDlg},
  printholslip in 'printholslip.pas' {frmPrintHolSlip},
  prndischarge in 'prndischarge.pas' {frmPrnDischarge},
  prnempfullhs in 'prnempfullhs.pas' {frmPrnEmpFulLHS},
  prnempfulrhs in 'prnempfulrhs.pas' {frmPrnEmpFulRHS},
  TaxYearEnd in 'TaxYearEnd.pas' {frmTaxYearEnd},
  Utils in 'Utils.pas',
  WagesReportSummary in 'WagesReportSummary.pas' {frmPayReportSummary},
  wcommon in 'wcommon.pas',
  bankrept in 'bankrept.pas' {frmBankReport},
  pfloanwklyrept in 'pfloanwklyrept.pas' {frmPFLoanWklyReport},
  wklywages in 'wklywages.pas' {frmWeeklyWages},
  holidaypay in 'holidaypay.pas' {frmHolidayPay},
  hpshpiel in 'hpshpiel.pas' {frmHPShpiel},
  printslip in 'printslip.pas' {frmPrintSlip},
  rptGenDeduction in 'rptGenDeduction.pas' {frmGenDeductionReport},
  pfloanmonthlyrept in 'pfloanmonthlyrept.pas' {frmPFLoanMonthlyReport},
  prnempchoice in 'prnempchoice.pas' {frmPrnEmpChoice},
  abloanwklyrept in 'abloanwklyrept.pas' {frmABLoanWklyReport},
  abloanmonthlyrept in 'abloanmonthlyrept.pas' {frmABLoanMonthlyReport},
  banks in 'banks.pas' {frmBanks},
  departments in 'departments.pas' {frmDepartments},
  GetDates in 'GetDates.pas' {frmGetDates},
  WagesReport in 'WagesReport.pas' {frmPayReport},
  rentrept in 'rentrept.pas' {frmRentReport},
  fTaxCertificates in 'fTaxCertificates.pas' {frmTaxCertificates};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Orbital Decisions Wages';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmPrnEmpChoice, frmPrnEmpChoice);
  Application.CreateForm(TfrmGetDates, frmGetDates);
  Application.Run;
end.



