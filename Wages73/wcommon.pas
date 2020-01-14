//wcommon unit used in Wages 7 (Delphi 3) upwards

unit wcommon;

interface

//DecodeDate is in SysUtils;  PayKind is in Main; TTable, etc are in DBTables
uses SysUtils, Utils, DBTables, Main;

//PAY items
//no need to use const when passing object pointers around, eg TTable, TQuery
function GetNormalPay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
function GetOT13Pay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
function GetOT12Pay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
function GetOTX2Pay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
function GetAttBonusPay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
//function GetProdBonusPay: Double;
function GetNightShiftPay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
function GetLeavePay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
function GetRentAllowPay(tabCompany,tabPaySlip,tabEmployee:TTable;FirstMM,SecondMM:integer): Double;
//function GetSavingsPaid: Double;
//function GetLoanGiven: Double;

//total PAY items
{function GetTaxEarnings: Double;
function GetTotalEarnings: Double;}

//DEDUCTION items
function GetPensionDeduct(tabCompany,tabEmployee:TTable;
  Week1: TDateTime; HolidayWeeks: Integer): Double;
function GetTaxDeduct(tabCompany,tabEmployee,tabTaxConstants:TTable;
  var qryTaxTable:TQuery;
  PTaxEarn, PPension: Double; Week1: TDateTime; HolidayWeeks:integer): Double;
function GetUIFDeduct(tabCompany,tabEmployee,tabPaySlip:TTable;
  TaxEarnings:Double): Double; //holidayweeks not required here
function GetProvFundDeduct(tabCompany,tabEmployee:TTable;
  HolidayWeeks: Integer): Double;
function GetCouncilDeduct(tabCompany:TTable;HolidayWeeks:Integer): Double;
function GetSickFundDeduct(tabCompany,tabEmployee:TTable;
  HolidayWeeks: Integer): Double;
//function GetInsuranceDeduct(tabEmployee:TTable;HolidayWeeks:Integer): Double; - old
function GetInsuranceDeduct(tabCompany,tabEmployee,tabPaySlip:TTable;ThisWeekEnd:TDateTime;
  WeeksThisMonth,WeeksNextMonth:integer; HolidayWeeks: Integer): Double; //modified DL060508
function GetOther1Deduct(tabCompany,tabEmployee,tabPaySlip:TTable;HolidayWeeks: Integer): Double;
function GetRentDeduct(tabCompany,tabEmployee:TTable;Week1MM:Integer): Double;
function GetLoanDeduct(tabEmployee,tabPaySlip:TTable): Double;
function GetABLoanDeduct(tabCompany,tabEmployee,tabPaySlip:TTable;ThisWeekEnd:TDateTime;WeeksThisMonth,WeeksNextMonth:integer): Double; //added DL050201
function GetPFLoanDeduct(tabCompany,tabEmployee,tabPaySlip:TTable;ThisWeekEnd:TDateTime;WeeksThisMonth,WeeksNextMonth:integer): Double; //added DL090504
function GetLGLoanDeduct(tabCompany,tabEmployee,tabPaySlip:TTable;ThisWeekEnd:TDateTime;
  WeeksThisMonth,WeeksNextMonth:integer; HolidayWeeks: Integer): Double; //added DL090504

//total DEDUCTIONS
//function GetTotalDeduct: Double;

function GetRentRepay(tabEmployee:TTable;Week1MM, Week2MM: Integer): Double;
function GetSickFundPay(tabCompany,tabEmployee,tabPaySlip:TTable;
  qrySickFundTable:TQuery): Double;

//balances
(*function GetTotalPay: Double;
function GetRentBalance: Double;
function GetSaveBalance: Double;
function GetLoanBalance: Double;*)

//statistics
function GetFullWeeks(tabCompany,tabPaySlip:TTable): Integer;
function GetPartWeeks(tabCompany,tabPaySlip:TTable): Integer;
//function GetLeaveDays: Integer;

function GetHolidayPayDays(tabCompany,tabEmployee,tabHolSlip:TTable;LastWeekYYYY:integer): Integer;
function GetHolidayPay(tabCompany,tabEmployee,tabHolSlip:TTable): Double;
function GetChristmasBonus(
  CoNormalHours,CoAnnualBonMin,EmpHrPayRate:double;EmpStartDate:TDateTime;
  CoWeeksInYear,EmpFullWk,EmpPartWk:integer;
  HolidayWeeks:integer;NextWeekYY:integer): Double;
//old DL030303 function GetChristmasBonus(tabCompany,tabEmployee,tabHolSlip:TTable;NextWeekYY:integer): Double;
//GetAnnualBonus function call added DL041207
function GetAnnualBonus(
  CoNormalHours,EmpHrPayRate:double;{EmpStartDate:TDateTime; could leave this in to calc in case fullwk-partwk removed}
  CoWeeksInYear,EmpFullWk,EmpPartWk:integer;
  HolidayWeeks:integer;AnnualBonusWeeks:double;
  EmpStartDate:TDateTime;NextWeekYYYY:integer): Double;
function GetServiceBonus(tabCompany,tabEmployee,tabHolSlip:TTable;NextWeekYYYY:integer): Double;
//procedure CalcCoinage(PSP:double; var TCoinage: TCoinageType);
//procedure CalcPaySlip;
//procedure CalcYTDTotals;

implementation

function GetNormalPay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
begin
  Result := ODRound100((tabPaySlip.FieldByName('NormalHH').AsFloat
    + tabPaySlip.FieldByName('NormalMM').AsFloat/60)
    * tabEmployee.FieldByName('HRPAYRATE').AsFloat);
end;

function GetOT13Pay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
begin
  Result := ODRound100((tabPaySlip.FieldByName('OT13HH').AsFloat
    + tabPaySlip.FieldByName('OT13MM').AsFloat/60)
    * tabEmployee.FieldByName('HRPAYRATE').AsFloat * 1.3333);
end;

function GetOT12Pay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
begin
  Result := ODRound100((tabPaySlip.FieldByName('OT12HH').AsFloat
    + tabPaySlip.FieldByName('OT12MM').AsFloat/60)
    * tabEmployee.FieldByName('HRPAYRATE').AsFloat * 1.5);
end;

function GetOTX2Pay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
begin
  Result := ODRound100((tabPaySlip.FieldByName('OTX2HH').AsFloat
    + tabPaySlip.FieldByName('OTX2MM').AsFloat/60)
    * tabEmployee.FieldByName('HRPAYRATE').AsFloat * 2);
end;

function GetAttBonusPay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
begin
  Result := ODRound100(tabPaySlip.FieldByName('ATTDAYS').AsInteger
    / tabCompany.FieldByName('NORMALATTDAYS').AsInteger
    * tabEmployee.FieldByName('ATTBONUSWK').AsFloat);
end;

function GetNightShiftPay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
//can we assume that the functions that a function depends on have been called?
//modified DL050306 as the hours are now entered
begin
  Result := ODRound100(tabPaySlip.FieldByName('NIGHTSHIFTALLOW').AsFloat
//    * (GetNormalPay + GetOT13Pay + GetOT12Pay + GetOTX2Pay)
    * (tabPaySlip.FieldByName('NormalPay').AsFloat
       + tabPaySlip.FieldByName('OT13Pay').AsFloat
       + tabPaySlip.FieldByName('OT12Pay').AsFloat
       + tabPaySlip.FieldByName('OTX2Pay').AsFloat)
    * tabCompany.FieldByName('NIGHTSHIFTPERCENT').AsFloat);
  {Result := ODRound100(tabPaySlip.FieldByName('NIGHTSHIFTALLOW').AsFloat/46 //46hrs is a standard week
    * (tabPaySlip.FieldByName('NormalPay').AsFloat
       + tabPaySlip.FieldByName('OT13Pay').AsFloat
       + tabPaySlip.FieldByName('OT12Pay').AsFloat
       + tabPaySlip.FieldByName('OTX2Pay').AsFloat)
    * tabCompany.FieldByName('NIGHTSHIFTPERCENT').AsFloat);}
end;

function GetLeavePay(tabCompany,tabPaySlip,tabEmployee:TTable): Double;
begin
  Result := ODRound100(tabPaySlip.FieldByName('LEAVEPAYDAYS').AsInteger
    * (tabCompany.FieldByName('NORMALHRS').AsInteger
    / tabCompany.FieldByName('NORMALATTDAYS').AsInteger)
    * tabEmployee.FieldByName('HRPAYRATE').AsFloat);
end;

function GetRentAllowPay(tabCompany,tabPaySlip,tabEmployee:TTable;
  FirstMM, SecondMM: Integer): Double;
{ This function decides when rent must be paid and how much.
  Months different happens at the end of the month.
  FirstMM: was ThisWeekMM in R2nWages.Pas;
           was Company.LastWeekMM in YearEnd2.Inc.
  NB: This allowance is only paid to people who pay rent.
      -> RentMonth > 0. }
begin                                                         { Months diff. }
  if (FirstMM <> SecondMM) and (tabEmployee.FieldByName('RENTMONTH').AsFloat > 0) then
    Result := tabCompany.FieldByName('RENTALLOWANCE').AsFloat
  else
    Result := 0;
end;

(*function GetTaxEarnings(tabCompany: Double;
{ This function totals the above functions.  Yields Taxable earnings.}
begin
  with ParamsForm do
  begin
    DecodeDate(ParamsPAYWEEK.AsDateTime, YY, ThisWeekMM, DD);
    DecodeDate(ParamsPAYWEEK.AsDateTime - 7, YY, LastWeekMM, DD);
    DecodeDate(ParamsPAYWEEK.AsDateTime + 7, YY, NextWeekMM, DD);
  end;
  with MainForm do
  begin
    if PayKind = pkHoliday then
      Result := GetHolidayPay + GetChristmasBonus + GetServiceBonus
        + GetRentAllowPay(LastWeekMM, NextWeekMM)
        + tabCompany.FieldByName('SPECIALBONUS').AsFloat { Automatic addition if SpeclBon <> 0. }
    else
    begin
      Result := GetNormalPay + GetOT13Pay + GetOT12Pay + GetOTX2Pay
        + GetAttBonusPay + GetNightShiftPay + GetLeavePay
        + tabPaySlip.FieldByName('PRODBONUS').AsFloat;
      if PayKind <> pkFinal then
        Result := Result + GetRentAllowPay(ThisWeekMM, NextWeekMM);
    end;
  end;
end;

function GetTotalEarnings: Double;
{ This function totals the PAY column. }
begin                                                 { TotalEarnings. }
  with MainForm do
  begin
    Result := GetTaxEarnings;
    if PayKind = pkNormal then
      Result := Result + tabPaySlip.FieldByName('SAVINGSPAIDOUT').AsFloat + tabPaySlip.FieldByName('LOANGIVEN').AsFloat
    else {if PayKind in [pkFinal, pkHoliday] then}
      Result := Result + tabEmployee.FieldByName('SAVEAC').AsFloat;
  end;
end;                                                  { TotalEarnings. }*)

function GetPensionDeduct(tabCompany,tabEmployee:TTable;
  Week1: TDateTime; HolidayWeeks: Integer): Double;
{ This function calculates pension which comes into effect after
  1 year.
  PensionPercent added here on 29/3/90 to replace 0.05.
  Week1YY, Week1MM, Week1DD replace ThisWeek.. in R2nWages.Pas and
  replace Company.LastWeek.. in YearEnd2.Inc.  29/3/90  (see comment below
  for additional DateType change).
  HolidayWeeks is used at the year end; 1 means normal week.}
var
  YearsDiff,MonthsDiff,DaysDiff:integer;
begin                                                       { PensionDeduct. }
  ODGetAge(tabEmployee.FieldByName('STARTDATE').AsDateTime,Week1,
    YearsDiff,MonthsDiff,DaysDiff);
  if YearsDiff>= 1 then
    Result := ODRound100(tabCompany.FieldByName('NORMALHRS').AsInteger
      * tabEmployee.FieldByName('HRPAYRATE').AsFloat
      * tabCompany.FieldByName('PENSIONPERCENT').AsFloat) * HolidayWeeks
  else
    Result := 0;
end;                                                        { PensionDeduct. }

function GetTaxDeduct(tabCompany,tabEmployee,tabTaxConstants:TTable;
  var qryTaxTable:TQuery;
  PTaxEarn, PPension: Double; Week1: TDateTime;HolidayWeeks:integer): Double;
{ Calculate PAYE (Tax) for this week. }
{ Don't forget to update taxweek. - done in main program as at 1/Oct/1989}
{ Parameters are: 1) PTaxEarn and PPension being amounts to be used
  to find out the amount to charge tax on for this year.  PTaxEarn and
  PPension are TaxEarnings and PensionDeduct in R2nWages.Inc;
    2) Week1 replacing ThisWeek and Company.LastWeek;  }
{Reprogrammed on 16 March 1996}
var
  TaxThisYear, AveTaxPerWk, AnnualTaxable,
  TotTaxable, BasicTax, PrimaryRebate,
  Person65,        { Persons over 65 years of age. }
  TotalRebate,
  TotYrTax, TotalTax: Double;
  YearsDiff,MonthsDiff,DaysDiff:integer;
begin                                                           { TaxDeduct. }
  Result := 0;
  { 1) Calculate taxable this year (so far). }
  TaxThisYear := tabEmployee.FieldByName('TAXEARN').AsFloat
    - tabEmployee.FieldByName('PENSION').AsFloat
    + PTaxEarn - PPension;
  { 2) Calculate average taxable per week - (1)/Weeks this year. }
  //NB: +1 below signifies that all employee data only updated during week's
  //posting.
  AveTaxPerWk := TaxThisYear / (tabEmployee.FieldByName('TAXWEEK').AsInteger+HolidayWeeks); //HW was 1 DL011299
  { 3) Calculate average taxable income per year - (2)*52. }
  AnnualTaxable := AveTaxPerWk * (tabCompany.FieldByName('WeeksInYear').AsInteger+
    tabCompany.FieldByName('HolidayWeeks').AsInteger); //was 52 DL011299; added HolidayWeeks DL061121
  TotTaxable := AnnualTaxable;
  if AnnualTaxable = 0 then                         { do the calculations. }
    TotYrTax := 0
  else
  begin
    { 5) Calculate basic tax. Use all people table. ('A'). }
    { 5.1) Find the relevant values. }
    {qryTaxConstants.Close;
    qryTaxConstants.ParamByName('TaxYr').AsInteger:=
      tabCompany.FieldByName('AYxYear').AsInteger;
    qryTaxConstants.Open;}
    qryTaxTable.Close;
    qryTaxTable.ParamByName('TaxYr').AsInteger:=
      tabCompany.FieldByName('ATaxYear').AsInteger;
    qryTaxTable.ParamByName('TaxableIncome').AsFloat:=
      TotTaxable;
    qryTaxTable.Open;
    //?xx if not found
    { 5.2) Calculate %tage on left over amount and add to above. }
    BasicTax := ((TotTaxable - qryTaxTable.FieldByName('FromTaxableIncome').AsFloat)
      * (qryTaxTable.FieldByName('ExtraPercent').AsFloat/100))
      + qryTaxTable.FieldByName('Tax').AsFloat;           { '/100' for %tage. }
    { Calculate Rebates. }
    { 6) Calculate primary rebate. Same for married and unmarried 16/3/96 }
    PrimaryRebate := tabTaxConstants.FieldByName('PrimReb').AsFloat;
    { 9) Calculate additional Rebate for persons over and including 65. }
    ODGetAge(tabEmployee.FieldByName('BirthDate').AsDateTime,Week1,
      YearsDiff,MonthsDiff,DaysDiff);
    if YearsDiff>=65 then
      Person65:=tabTaxConstants.FieldByName('PrimReb').AsFloat
    else
      Person65 := 0;
    { 11) Calculate total rebate - (6)+(9). }
    TotalRebate := PrimaryRebate + Person65;
    { 13) Calculate total years tax up to now. }
    TotalTax := BasicTax - TotalRebate;
    if TotalTax > 0 then
      //added HolidayWeeks in next line DL061121
      TotYrTax := ODRound100((TotalTax/(tabCompany.FieldByName('WeeksInYear').AsInteger+
                                        tabCompany.FieldByName('HolidayWeeks').AsInteger)) * //was 52 DL011299
        (tabEmployee.FieldByName('TaxWeek').AsInteger+HolidayWeeks)) //HW was 1 DL011299
    else
      TotYrTax := 0;
  end;                                              { if AnnualTaxable = 0 }
  { 14) Therefore, tax this week - (13)-Tax paid to date. }
  if (TotYrTax - tabEmployee.FieldByName('PAYE').AsFloat > 0) then
    Result := TotYrTax - tabEmployee.FieldByName('PAYE').AsFloat;
end;                                                            { TaxDeduct. }

function GetUIFDeduct(tabCompany,tabEmployee,tabPaySlip:TTable;
  TaxEarnings:Double): Double;
{ U.I.F. is calculated according to the rules layed down by the
  Unemployment Insurance Fund.  The rate is UIFPercent.  An
  Employee must work at least one day to pay this deduction.
  For holiday pay, UIF is always "SkipWeeks" weeks deductions. }
//TaxEarnings added DL020903 as now the UIF is 1% of Gross Income instead of
//  NormalHrs*HrPayRate*UIFPercent
begin                                                     { UIFDeduct. }
  {if (PayKind = pkHoliday) or
     (tabPaySlip.FieldByName('NORMALHH').AsInteger >=
       tabCompany.FieldByName('NORMALHRS').AsInteger
       / tabCompany.FieldByName('NORMALATTDAYS').AsInteger) then
    Result := ODRound100(tabCompany.FieldByName('NORMALHRS').AsInteger
      * tabEmployee.FieldByName('HRPAYRATE').AsFloat
      * tabCompany.FieldByName('UIFPERCENT').AsFloat)
  else
    Result := 0; - removed DL020903}
  if (PayKind = pkHoliday) or (TaxEarnings>0) then
    Result := ODRound100(TaxEarnings
      * tabCompany.FieldByName('UIFPERCENT').AsFloat) //added DL020903
  else
    Result := 0;
  //don't do next two lines because TaxEarnings for Holiday Pay will already be
  //for the full period (HolidayWeeks=3 weeks) DL030121
  //if PayKind = pkHoliday then
  //  Result := Result * tabCompany.FieldByName('HOLIDAYWEEKS').AsInteger;
end;

function GetProvFundDeduct(tabCompany,tabEmployee:TTable;HolidayWeeks: Integer): Double;
{ Calculate Provident Fund deduction which comes into effect if:
  a) Employee worked for > 6 months (removed July 1990) and
  b) Employee < 55 years old when he started! }
var
  YearsDiff,MonthsDiff,DaysDiff:integer;
begin                                                      { ProvFundDeduct. }
  Result := 0;
  ODGetAge(tabEmployee.FieldByName('BirthDate').AsDateTime,
    tabEmployee.FieldByName('StartDate').AsDateTime,
    YearsDiff,MonthsDiff,DaysDiff);
  if (tabEmployee.FieldByName('PROVFUNDFLAG').AsString = 'Y') then
  begin
    if YearsDiff<55 then
      Result := ODRound100(tabCompany.FieldByName('NORMALHRS').AsInteger
        * tabEmployee.FieldByName('HRPAYRATE').AsFloat
        * tabCompany.FieldByName('PROVFUNDPERCENT').AsFloat) * HolidayWeeks
  end;
end;                                                       { ProvFundDeduct. }

function GetCouncilDeduct(tabCompany:TTable;HolidayWeeks:Integer): Double;
//get the council deduction
begin
  Result := tabCompany.FieldByName('COUNCILDEDUCT').AsFloat * HolidayWeeks;
end;

function GetSickFundDeduct(tabCompany,tabEmployee:TTable;
  HolidayWeeks: Integer): Double;
{ This function computes the sick fund deduction according to the
  SickFundPercent percentage.  An Employee must work at least one
  day in a week to pay this deduction. At least 1 day taken out 10/7/89. }
begin                                                      { SickFundDeduct. }
  if tabEmployee.FieldByName('SICKFUNDFLAG').AsString = 'Y' then
    Result := ODRound100(tabCompany.FieldByName('NORMALHRS').AsInteger
      * tabEmployee.FieldByName('HRPAYRATE').AsFloat
      * tabCompany.FieldByName('SICKFUNDPERCENT').AsFloat
      * HolidayWeeks)
  else
    Result := 0;
end;                                                       { SickFundDeduct. }

//function GetInsuranceDeduct(tabEmployee:TTable;HolidayWeeks:Integer): Double;
function GetInsuranceDeduct(tabCompany,tabEmployee,tabPaySlip:TTable;ThisWeekEnd:TDateTime;
  WeeksThisMonth,WeeksNextMonth:integer; HolidayWeeks: Integer): Double; //modified DL060508
var
  Year,Month,Day:word;
  InsRepayThisWeek:double;
  InsRepayNextMonth:double;
begin
  //changed from being weekly only to being weekly or monthly DL060505
  if tabEmployee.FieldByName('INSURANCEWM').AsString='W' then
    Result := tabEmployee.FieldByName('INSURANCE').AsFloat * HolidayWeeks
  else
  begin
    DecodeDate(ThisWeekEnd, Year, Month, Day);
    Result := 0;
    InsRepayThisWeek:=0;
    InsRepayNextMonth:=0;
    if (tabEmployee.FieldByName('INSURANCE').AsFloat > 0) then
    begin
      //find out the deduction this week based on the number of weeks in this month
      InsRepayThisWeek:=tabEmployee.FieldByName('INSURANCE').AsFloat/WeeksThisMonth;
      if WeeksNextMonth>0 then //end of year process in operation
      begin
        //HowManyWeeks left to go this month? constants removed DL051213 - Used SundaysLeft and HolidayWeeks instead
        InsRepayThisWeek:=InsRepayThisWeek*SundaysLeft; //SundaysLeft normally = 2 which is two weeks this year
        InsRepayNextMonth:=tabEmployee.FieldByName('INSURANCE').AsFloat/WeeksNextMonth*  //this line gives deduction amount per week
          (tabCompany.FieldByName('HOLIDAYWEEKS').AsInteger-SundaysLeft); //divisor usually = 1 which is one week next year
        InsRepayThisWeek:=InsRepayThisWeek+InsRepayNextMonth;
      end;
      Result := ODRound100(InsRepayThisWeek)
    end;
  end;
end;                                                   { GetInsuranceDeduct. }

function GetOther1Deduct(tabCompany,tabEmployee,tabPaySlip:TTable; //tabCompany added DL061101
  HolidayWeeks: Integer): Double;
{ Calculate the other1 deduction/Union Levy. }
{ For the YearEnd routine.
  This function deducts a mandatory deduction for some Employees
  if Other1Flag = 'Y'.  It multiplies this amount by HolidayWeeks
  as Other1 must be deducted for all the weeks during the
  holiday.  Update: 15/12/87. }
var
  NormalPay:double; //added DL061101
begin                                              { Other1Deduct. }
  //was: DL061101
  {if tabEmployee.FieldByName('OTHER1FLAG').AsString = 'Y' then
    Result := tabPaySlip.FieldByName('OTHER1').AsFloat * HolidayWeeks
  else
    Result := 0;}
  //now: DL061101
  if tabEmployee.FieldByName('OTHER1FLAG').AsString = 'Y' then
  begin
    NormalPay := ODRound100((tabCompany.FieldByName('NormalHrs').AsFloat
      + tabCompany.FieldByName('NormalMins').AsFloat/60)
      * tabEmployee.FieldByName('HRPAYRATE').AsFloat); //added DL221101
    //NormalPay:=GetNormalPay(tabCompany,tabPaySlip,tabEmployee); - removed DL221101
    //this should be parameterised in the Company Table!
    Result := ODRound100(NormalPay * tabCompany.FieldByName('UnionSubsPercent').AsFloat); //1%
    Result := Result + tabCompany.FieldByName('FuneralLevy').AsFloat; //added DL050815: add R1 to the deduction re funeral scheme levy; changed to 1.20 DL061003; made "soft" DL080513
    //min incl Funeral Levy was R3.50 DL020716; was R3.70 DL040906; was R4.20 DL050830; was R5.40 DL060821; was R5.60 DL061003
    //  was R5.80 DL080513 and made "soft"
    //max incl Funeral Levy line was R6.00 DL020716 was 6.50 DL040906; was 7.35 DL050816; was 8.35 DL050830;
    //  was R9 DL060821; was R9.50 DL061003; was R9.70 DL080513 and made "soft"
    if Result<(tabCompany.FieldByName('UnionMinExclFuneralLevy').AsFloat+tabCompany.FieldByName('FuneralLevy').AsFloat) then
      Result:=(tabCompany.FieldByName('UnionMinExclFuneralLevy').AsFloat+tabCompany.FieldByName('FuneralLevy').AsFloat)
    else if Result>(tabCompany.FieldByName('UnionMaxExclFuneralLevy').AsFloat+tabCompany.FieldByName('FuneralLevy').AsFloat) then
      Result:=(tabCompany.FieldByName('UnionMaxExclFuneralLevy').AsFloat+tabCompany.FieldByName('FuneralLevy').AsFloat);
    Result := Result * HolidayWeeks;
  end
  else
    Result := 0;
end;                                                         { Other1Deduct. }

function GetRentDeduct(tabCompany,tabEmployee:TTable;Week1MM:Integer): Double;
{ Calculate rent to deduct according to the following
  algorithm: (numbered). What about person whose rent we stop paying
  for him -> transfer rent balance out. }
var
  MonthsToGo, WeeksToGo : integer;
  TotalRental : double;
begin                                                        { RentDeduct. }
  Result := 0;
  if tabEmployee.FieldByName('RENTMONTH').AsFloat > 0 then { Calculate rent deduction. }
  begin
    { 1) Calculate months to February (incl.) }
    if Week1MM > 2 then
      MonthsToGo := 14 - Week1MM + 1
    else
      MonthsToGo := 2 - Week1MM + 1;
    { 2) Calculate total rental from now to fol Feb incl. - RentAC. }
    TotalRental := tabEmployee.FieldByName('RENTMONTH').AsFloat
      * MonthsToGo - tabEmployee.FieldByName('RENTAC').AsFloat;
    { 3) Calculate weeks. }
    if (Week1MM >= 3) and (Week1MM <= 12) then
      WeeksToGo := 49 - tabCompany.FieldByName('ATXWK').AsInteger  { To incl. Dec holidays. }
    else                                { Actual tax week to give actual }
      WeeksToGo := 52 - tabCompany.FieldByName('ATXWK').AsInteger; { weeks left till end Feb. }
    if WeeksToGo < 1 then
      Result:=0 // WeeksToGo := 1;
    else // 4) Calculate RentDeduct.
      Result := ODRound100(TotalRental / WeeksToGo);
  end
  else      { Check for outstanding balance in account and if so reverse it. }
    if tabEmployee.FieldByName('RENTAC').AsFloat <> 0 then      { could be less if just started.}
      Result := -tabEmployee.FieldByName('RENTAC').AsFloat;
end;                                                           { RentDeduct. }

function GetLoanDeduct(tabEmployee,tabPaySlip:TTable): Double;
{ Calculate the amount to be repaid on the LoanAC this week. }
begin                                                          { LoanDeduct. }
  Result := 0;
  if tabPaySlip.FieldByName('LOANGIVEN').AsFloat = 0 then { No loan given this week. }
  begin
    if tabEmployee.FieldByName('LOANAC').AsFloat > 0 then { Loan amount outstanding. }
    begin
      if tabEmployee.FieldByName('LOANAC').AsFloat > tabEmployee.FieldByName('REPAYLNWK').AsFloat then
        Result := tabEmployee.FieldByName('REPAYLNWK').AsFloat
      else
        Result := tabEmployee.FieldByName('LOANAC').AsFloat;   { else write amnt left over. }
    end;
  end;
//xx assign this later.
//  else                               {new loan ded -> new loan ded rate}
//    tabEmployee.FieldByName('REPAYLNWK').AsFloat := tabPaySlip.FieldByName('LOANREPAYRATE').AsFloat;
end;                                                           { LoanDeduct. }

//xxxx
function GetABLoanDeduct(tabCompany,tabEmployee,tabPaySlip:TTable;ThisWeekEnd:TDateTime;WeeksThisMonth,WeeksNextMonth:integer): Double;
{ Calculate the amount to be repaid on the African Bank LoanAC this week. }
//added DL050201
var
  OKToCalc:boolean;
  Year,Month,Day:word;
  ABRepayThisWeek:double;
  ABRepayNextMonth:double; //added DL161201
begin                                                     { GetABLoanDeduct. }
  DecodeDate(ThisWeekEnd, Year, Month, Day);
  Result := 0;
  OKToCalc:=false;
  ABRepayThisWeek:=0;
  ABRepayNextMonth:=0;
  if (tabEmployee.FieldByName('ABLOANAC').AsFloat > 0) { Loan amount outstanding. }
    and (tabEmployee.FieldByName('ABLOANACTIVE').AsString = 'Y') then //added DL040701
  begin
    if Year > tabEmployee.FieldByName('ABREPAYFROMYEAR').AsInteger then
      OKToCalc:=true
    else
    begin
      if Month >= tabEmployee.FieldByName('ABREPAYFROMMONTH').AsInteger then
        OKToCalc:=true;
    end;
  end;
  if OKToCalc then
  begin
    //find out the deduction this week based on the number of weeks in this month
    ABRepayThisWeek:=tabEmployee.FieldByName('ABREPAYLNMONTH').AsFloat/WeeksThisMonth;
    if WeeksNextMonth>0 then //end of year process in operation
    begin
      //HowManyWeeks left to go this month? constants removed DL051213 - Used SundaysLeft and HolidayWeeks instead
      ABRepayThisWeek:=ABRepayThisWeek*SundaysLeft; //SundaysLeft normally = 2 which is two weeks this year
      ABRepayNextMonth:=tabEmployee.FieldByName('ABREPAYLNMONTH').AsFloat/WeeksNextMonth*  //this line gives deduction amount per week
        (tabCompany.FieldByName('HOLIDAYWEEKS').AsInteger-SundaysLeft); //divisor usually = 1 which is one week next year
      ABRepayThisWeek:=ABRepayThisWeek+ABRepayNextMonth;
    end;
    if tabEmployee.FieldByName('ABLOANAC').AsFloat > ABRepayThisWeek then
      Result := ODRound100(ABRepayThisWeek)
    else
      Result := ODRound100(tabEmployee.FieldByName('ABLOANAC').AsFloat);   { else return amnt left over. }
  end;
end;                                                      { GetABLoanDeduct. }

function GetPFLoanDeduct(tabCompany,tabEmployee,tabPaySlip:TTable;ThisWeekEnd:TDateTime;WeeksThisMonth,WeeksNextMonth:integer): Double;
{ Calculate the amount to be repaid on the Provident Fund LoanAC this week. }
//added DL090504
var
  OKToCalc:boolean;
  Year,Month,Day:word;
  PFRepayThisWeek:double;
  PFRepayNextMonth:double;
begin                                                     { GetPFLoanDeduct. }
  DecodeDate(ThisWeekEnd, Year, Month, Day);
  Result := 0;
  OKToCalc:=false;
  PFRepayThisWeek:=0;
  PFRepayNextMonth:=0;
  if (tabEmployee.FieldByName('PFLOANAC').AsFloat > 0) { Loan amount outstanding. }
    and (tabEmployee.FieldByName('PFLOANACTIVE').AsString = 'Y') then
  begin
    if Year > tabEmployee.FieldByName('PFREPAYFROMYEAR').AsInteger then
      OKToCalc:=true
    else
    begin
      if Month >= tabEmployee.FieldByName('PFREPAYFROMMONTH').AsInteger then
        OKToCalc:=true;
    end;
  end;
  if OKToCalc then
  begin
    //find out the deduction this week based on the number of weeks in this month
    if (Year=2004) and (Month=5) then
      WeeksThisMonth:=4; //reason for this if is that this process started in the 2nd payweek of May 2004 which has a 5 week month
    PFRepayThisWeek:=tabEmployee.FieldByName('PFREPAYLNMONTH').AsFloat/WeeksThisMonth;
    if WeeksNextMonth>0 then //end of year process in operation
    begin
      //HowManyWeeks left to go this month? constants removed DL051213 - Used SundaysLeft and HolidayWeeks instead
      PFRepayThisWeek:=PFRepayThisWeek*SundaysLeft; //SundaysLeft normally = 2 which is two weeks this year
      PFRepayNextMonth:=tabEmployee.FieldByName('PFREPAYLNMONTH').AsFloat/WeeksNextMonth*  //this line gives deduction amount per week
        (tabCompany.FieldByName('HOLIDAYWEEKS').AsInteger-SundaysLeft); //divisor usually = 1 which is one week next year
      PFRepayThisWeek:=PFRepayThisWeek+PFRepayNextMonth;
    end;
    if tabEmployee.FieldByName('PFLOANAC').AsFloat > PFRepayThisWeek then
      Result := ODRound100(PFRepayThisWeek)
    else
      Result := ODRound100(tabEmployee.FieldByName('PFLOANAC').AsFloat);   { else return amnt left over. }
  end;
end;                                                      { GetPFLoanDeduct. }

function GetLGLoanDeduct(tabCompany,tabEmployee,tabPaySlip:TTable;ThisWeekEnd:TDateTime;
  WeeksThisMonth,WeeksNextMonth:integer; HolidayWeeks: Integer): Double;
{ Calculate the amount to be repaid on the Lawyer Repayments this week. }
//added DL090504
var
  Year,Month,Day:word;
  LGRepayThisWeek:double;
  LGRepayNextMonth:double;
begin                                                     { GetLGLoanDeduct. }
  if tabEmployee.FieldByName('LawyerWM').AsString='W' then   //added DL060505
    Result := tabEmployee.FieldByName('LAWYERMONTH').AsFloat * HolidayWeeks //added DL060505
  else
  begin
    DecodeDate(ThisWeekEnd, Year, Month, Day);
    Result := 0;
    LGRepayThisWeek:=0;
    LGRepayNextMonth:=0;
    if (tabEmployee.FieldByName('LAWYERMONTH').AsFloat > 0) then
    begin
      //find out the deduction this week based on the number of weeks in this month
      if (Year=2004) and (Month=5) then
        WeeksThisMonth:=4; //reason for this if is that this process started in the 2nd payweek of May 2004 which has a 5 week month
      LGRepayThisWeek:=tabEmployee.FieldByName('LAWYERMONTH').AsFloat/WeeksThisMonth;
      if WeeksNextMonth>0 then //end of year process in operation
      begin
        //HowManyWeeks left to go this month? constants removed DL051213 - Used SundaysLeft and HolidayWeeks instead
        LGRepayThisWeek:=LGRepayThisWeek*SundaysLeft; //SundaysLeft normally = 2 which is two weeks this year
        LGRepayNextMonth:=tabEmployee.FieldByName('LAWYERMONTH').AsFloat/WeeksNextMonth*  //this line gives deduction amount per week
          (tabCompany.FieldByName('HOLIDAYWEEKS').AsInteger-SundaysLeft); //divisor usually = 1 which is one week next year
        LGRepayThisWeek:=LGRepayThisWeek+LGRepayNextMonth;
      end;
      Result := ODRound100(LGRepayThisWeek)
    end;
  end;
end;                                                      { GetLGLoanDeduct. }

function GetRentRepay(tabEmployee:TTable;Week1MM, Week2MM: Integer): Double;
{ This function decides when the rent is paid by us.  'Repay' column in
  Accounts section since 'deduction.'  Rent is paid by us during the first
  tax week of the month (<=7 days into the month or month different).  But
  deducted off account in last week of (previous) month.
  Note: Only for Employees whose rent we pay.}
begin                                                           { RentRepay. }
  if (Week1MM <> Week2MM) and (tabEmployee.FieldByName('RENTMONTH').AsFloat > 0) then
    Result := tabEmployee.FieldByName('RENTMONTH').AsFloat
  else
    Result := 0; { Don't pay the rent this week. }
end;                                                            { RentRepay. }

function GetSickFundPay(tabCompany,tabEmployee,tabPaySlip:TTable;
  qrySickFundTable:TQuery): Double;
{ This function calculates the amount owed to an Employee who was sick. }
//DL011199 modified to pay the employee 60% of normal pay
//->SickFundTable not used anymore
var
  StdPay: Double;         { Standard weeks pay. }
  PaidSickDays: Integer;  { Actual number of days to pay sick pay on. }
  TotalSickDays: Integer; //added DL261098
begin                                                         { SickFundPay. }
  Result := 0;
  TotalSickDays := tabPaySlip.FieldByName('SICKPAYDAYS').AsInteger
          + tabEmployee.FieldByName('SICKDAY').AsInteger;
  if (tabPaySlip.FieldByName('SICKPAYDAYS').AsInteger > 0) and
     (tabEmployee.FieldByName('SICKDAY').AsInteger <
      tabCompany.FieldByName('MAXPAIDSICKDAYS').AsInteger) then
  begin
    PaidSickDays := tabPaySlip.FieldByName('SICKPAYDAYS').AsInteger;
    if TotalSickDays > tabCompany.FieldByName('MAXPAIDSICKDAYS').AsInteger then
      PaidSickDays := PaidSickDays
        - (TotalSickDays - tabCompany.FieldByName('MAXPAIDSICKDAYS').AsInteger);
    StdPay := tabCompany.FieldByName('NORMALHRS').AsFloat
      * tabEmployee.FieldByName('HRPAYRATE').AsFloat;
    (*qrySickFundTable.Close; - lookup removed and formula changed DL011199
    qrySickFundTable.ParamByName('ThisWeek').AsDateTime:=
      tabPaySlip.FieldByName('ThisWeek').AsDateTime;
    qrySickFundTable.ParamByName('StdWages').AsFloat:=StdPay;
    qrySickFundTable.Open;
    //xx? if not found
    Result:=qrySickFundTable.FieldByName('BenefitPerDay').AsFloat * PaidSickDays;*)
    Result:=ODRound100(StdPay/5*tabCompany.FieldByName('SICKFUNDPAYPERCENT').AsFloat*
      PaidSickDays); //added DL011199; ODRound100 added DL151199 bec. of division
  end;
end;                                                          { SickFundPay. }

function GetFullWeeks(tabCompany,tabPaySlip:TTable): Integer;
{ Add 1 to FullWk when >= 46 (made up of 45 NormalHours and 1 OT13 Hour which
  makes up the original 46 hour week) are worked. }
begin                                                           { FullWeeks. }
  Result := 0; //tabEmployee.FieldByName('FULLWK').AsInteger;        { Initialise to current value. }
  if (tabPaySlip.FieldByName('NORMALHH').AsFloat >=
        tabCompany.FieldByName('NormalHrs').AsInteger)
      and (tabPaySlip.FieldByName('OT13HH').AsFloat >=
        tabCompany.FieldByName('NormalOT13Hrs').AsInteger)
      and (tabPaySlip.FieldByName('OT12HH').AsFloat >= //added DL261098
        tabCompany.FieldByName('NormalOT12Hrs').AsInteger)
      and (tabPaySlip.FieldByName('OTX2HH').AsFloat >= //added DL261098
        tabCompany.FieldByName('NormalOTX2Hrs').AsInteger) then
    Result := 1; // Inc(Result, 1);
end;                                                            { FullWeeks. }

function GetPartWeeks(tabCompany,tabPaySlip:TTable): Integer;
{ If Employee less than 46 hours per week; ie greater than 6 hours not
  worked then the Employee has worked a part week.  PartWeek if Employee
  works less than (45 normal hours + 1 OT13 overtime hour). }
begin                                                           { PartWeeks. }
  Result := 0; //tabEmployee.FieldByName('PARTWK').AsInteger;
  {if (tabPaySlip.FieldByName('NORMALHH').AsFloat < 45) or
     ((tabPaySlip.FieldByName('NORMALHH').AsFloat = 45)
       and (tabPaySlip.FieldByName('OT13HH').AsFloat = 0)) then}
  if not ((tabPaySlip.FieldByName('NORMALHH').AsFloat >=
        tabCompany.FieldByName('NormalHrs').AsInteger)
      and (tabPaySlip.FieldByName('OT13HH').AsFloat >=
        tabCompany.FieldByName('NormalOT13Hrs').AsInteger)
      and (tabPaySlip.FieldByName('OT12HH').AsFloat >= //added DL261098
        tabCompany.FieldByName('NormalOT12Hrs').AsInteger)
      and (tabPaySlip.FieldByName('OTX2HH').AsFloat >= //added DL261098
        tabCompany.FieldByName('NormalOTX2Hrs').AsInteger)) then
    Result := 1; // Inc(Result, 1);
end;                                                            { PartWeeks. }

function GetHolidayPayDays(tabCompany,tabEmployee,tabHolSlip:TTable;LastWeekYYYY:integer): Integer;
{ This function calculates the number of days this employee earns holiday pay. }
var
  STYYYY,STMM,STDD:word;
  lMonthsWorked:integer;
begin
  DecodeDate(tabEmployee.FieldByName('StartDate').AsDateTime, STYYYY, STMM, STDD);
  if LastWeekYYYY - STYYYY > 0 then // 0: for this year
    Result := 15 + tabCompany.FieldByName('HolidayPayDays').AsInteger //Religious hols are added. 15 was 12 DL111213
  else
  begin
    //Removed the following DL111213
    //Result := 15 + tabCompany.FieldByName('HolidayPayDays').AsInteger - STMM +1; // +1: Inclusive. 15 was 12 DL111213
    //if STDD > 16 then // Start at <= 15 implies a full month worked
    //  Result := Result - 1; //not a full month worked

    //Added the following DL111213
    lMonthsWorked:=12-STMM+1; // +1: Inclusive.
    if STDD > 16 then // Start at <= 15 implies a full month worked; 16 is the 16th day of the month
      lMonthsWorked := lMonthsWorked - 1; //not a full month worked
    Result := trunc(lMonthsWorked / 12 * (15 + tabCompany.FieldByName('HolidayPayDays').AsInteger));
  end;
end;

function GetHolidayPay(tabCompany,tabEmployee,tabHolSlip:TTable): Double;
{ This function calculates the holiday pay for all the holiday pay days. }
begin
  Result := ODRound100(tabHolSlip.FieldByName('HolidayPayDays').AsInteger *
    (tabCompany.FieldByName('NormalHrs').AsInteger/5) *
    tabEmployee.FieldByName('HRPayRate').AsFloat);
end;

//function call modified DL030303
function GetChristmasBonus(
  CoNormalHours,CoAnnualBonMin,EmpHrPayRate:double;EmpStartDate:TDateTime;
  CoWeeksInYear,EmpFullWk,EmpPartWk:integer;
  HolidayWeeks:integer;NextWeekYY:integer): Double;
//function GetChristmasBonus(tabCompany,tabEmployee,tabHolSlip:TTable;NextWeekYY:integer): Double;
{ This function calculates the Christmas Bonus at the year end.
  WorkWeeks is a constant for this section showing the actual
  number of weeks that should have been worked this year.
  The tabEmployee.FieldByName(' gets the bonus based on his attendance in the
  current year and loyalty (service) to the company. }
var
  StdPay,            { This tabEmployee.FieldByName(''s standard week's pay. }
  Pay2,                                                     { Minimum Bonus. }
  Service: Double;                                { Number of years service. }
  WeeksDiff: Integer;                { Week difference for difference check. }
  STYYYY, STMM, STDD: Word;
  WorkWeeks: integer; //weeks available to work this year
begin
(*  StdPay := 0; Service := 0; WeeksDiff := 0; Pay2 := 0;
  DecodeDate(EmpStartDate, STYYYY, STMM, STDD);
  Service := NextWeekYY - STYYYY - 1;
  //if Service <= 0 then             { exclude January for 1st yr. } //was 0 DL161201 - removed DL161201
  //  Result := 0 {ChristmasBonus := 0} - removed DL161201
  //else - removed DL161201
  //begin - removed DL161201
  if Service<=0 then //added DL161201
    Service:=1; //added DL161201
  WorkWeeks:=25; //CoWeeksInYear - HolidayWeeks; revert in 2005
  if Service > 4 then Service := 4;
  WeeksDiff := EmpFullWK - EmpPartWK;
  if WeeksDiff < 0 then WeeksDiff := 0;
  //next line:
  //"round" to WorkWeeks (for weekly payslip) added DL030303
  //added as a check that fullweeks plus partweeks=total weeks to work
{  if (EmpFullWk + EmpPartWk) < WorkWeeks then - removed DL041207!
    WeeksDiff := trunc(WeeksDiff / (EmpFullWk + EmpPartWk) * WorkWeeks);}
  StdPay := CoNormalHours * EmpHRPayRate / 2; // /2 added DL041207: 1/2 a week in 2004!
  Pay2 := WeeksDiff * CoAnnualBonMin / 2 / CoWeeksInYear; // /2 added DL041207
  if Pay2 > (WeeksDiff * StdPay / WorkWeeks * Service) then
     Result := ODRound100(Pay2)
  else
     Result := ODRound100(WeeksDiff * StdPay / WorkWeeks * Service);
  //end; - removed DL161201*)
Result:=0;
end; //GetChristmasBonus

//function call added DL041207
function GetAnnualBonus(
  CoNormalHours,EmpHrPayRate:double;{EmpStartDate:TDateTime; could leave this in to calc in case fullwk-partwk removed}
  CoWeeksInYear,EmpFullWk,EmpPartWk:integer;
  HolidayWeeks:integer;AnnualBonusWeeks:double;
  EmpStartDate:TDateTime;NextWeekYYYY:integer): Double;
var
  StdPay:double;              { This tabEmployee.FieldByName(''s standard week's pay. }
  WeeksWorked: Integer;    { Week Worked in this year: used for pro-rated pay. }
  AvailableWorkWeeks: integer; //weeks available to work this year
  AnnualBonus:Double; //added DL041207
  Service:integer; //added DL101212
  STYYYY, STMM, STDD: Word; //StartDate decoded into YYYY, MM, DD added DL101212
begin
  StdPay := 0; WeeksWorked := 0; AnnualBonus:=0;
  AvailableWorkWeeks:=CoWeeksInYear; // - HolidayWeeks; //52-49! - mod DL051213
  WeeksWorked := EmpFullWK + EmpPartWK; //NB: the plus here!!
  if WeeksWorked < 0 then WeeksWorked := 0;
  //next line:
  //"round" to AvailableWorkWeeks (for weekly payslip) added DL030303
  //added as a check that fullweeks plus partweeks=total weeks to work
{  if (EmpFullWk + EmpPartWk) < AvailableWorkWeeks then - removed DL041207
    WeeksWorked := trunc(WeeksWorked / (EmpFullWk + EmpPartWk) * AvailableWorkWeeks);}
  StdPay := CoNormalHours * EmpHRPayRate (*/ 2*); // /2 added DL041207: 1/2 a week in 2004!

  //added DL041207 - this will be the whole calculation next year! 3 = weeks * StdPay per week
  //except that we still need to multiply by fullweeks - partweeks in case person started this year
  //and needs to get a 'proportional' bonus
  //AnnualBonusWeeks = 3 in 2004; set in Company Table

  if EmpStartDate<=MidDateOf2010Year then //if statement added DL101212
    AnnualBonus:=AnnualBonusWeeks * StdPay { the rest removed DL081217 * WeeksWorked / AvailableWorkWeeks {* Service} //already has /2 in it - service not applicable in Annual Bonus!
  else
  begin
    //added DL101212
    DecodeDate(EmpStartDate, STYYYY, STMM, STDD);
    Service := NextWeekYYYY - STYYYY;
    if Service=1 then //employee started this year; because NextWeekYYYY is next year
      AnnualBonus:=StdPay*WeeksWorked/AvailableWorkWeeks //one week of pay prorated
    else if Service=2 then //employee started the year before last (within the past 2 years)
      AnnualBonus:=StdPay //one week of pay
    else //employee started more than 2 years ago
      AnnualBonus:=StdPay*4; //four weeks of pay
  end;

  Result := ODRound100(AnnualBonus);
end; //GetAnnualBonus

function GetServiceBonus(tabCompany,tabEmployee,tabHolSlip:TTable;NextWeekYYYY:integer): Double;
{ This function calculates the Service Bonus at the year end.
  WorkWeeks is a constant for this section showing the actual
  number of weeks that should have been worked this year.
  The Employee gets the bonus for min 3 years and max 12 years
  at 24.50 per full year}
{Modified: DL131299 to give employees R2.00 per week per year of service}
{Modified: DL221101 to give employees R2.50 per week per year of service up to 4 years max}
{Modified: DL051207 to give employees R0 service bonus, ie service bonus is removed, same as last year!}
var
  //Service : real;                     { Number of years service. }
  //STYYYY, STMM, STDD: Word; //StartDate decoded into YYYY, MM, DD
  YearsDiff,MonthsDiff,DaysDiff:integer; //added DL131299
  Service:integer; //added DL131299
begin
  {old formula
  Service := 0;
  DecodeDate(tabEmployee.FieldByName('StartDate').AsDateTime, STYYYY, STMM, STDD);
  Service := NextWeekYYYY - STYYYY;
  if Service < 3 then Service := 0;
  if Service > 12 then Service := 12;
  Result := ODRound100(Service * tabCompany.FieldByName('ServiceBonus').AsFloat);}
  {new formula}
(*  if tabEmployee.FieldByName('StartDate').AsDateTime<MidDateOfYear then //added DL041208
  begin
    ODGetAge(tabEmployee.FieldByName('StartDate').AsDateTime,{LastDateOfYear} MidDateOfYear,
      YearsDiff,MonthsDiff,DaysDiff);
    Service:=(YearsDiff*52) + trunc(MonthsDiff*4.3333) + (DaysDiff div 7);
    if Service>209 then //3x52+1x53 - added DL221101
      Service:=209; //added DL221101
    Result := ODRound100(Service * tabCompany.FieldByName('ServiceBonus').AsFloat / 2); //only for half a year DL041208
  end
  else //added DL041208*)
    Result:=0;
end;

(*function GetTotalDeduct: Double;
{ Calculate the total deduction. }
begin                                                   { TotalDeduct. }
  with MainForm, ParamsForm do
  begin
    if PayKind = pkHoliday then
    begin                         {**}
      Result := GetPensionDeduct(ParamsPAYWEEK.AsDateTime - 7,
                                 ParamsHOLIDAYWEEKS').AsInteger)
        + tabPaySlip.FieldByName('TAXWK').AsInteger + GetUIFDeduct
        + GetProvFundDeduct(ParamsHOLIDAYWEEKS').AsInteger)
        + ParamsCOUNCILDEDUCT').AsFloat
        + GetSickFundDeduct(ParamsHOLIDAYWEEKS').AsInteger)
        + GetInsuranceDed + tabEmployee.FieldByName('LOANAC').AsFloat
        + GetOther1Deduct(ParamsHOLIDAYWEEKS').AsInteger);
    end
    else {if PayKind in [pkNormal, pkFinal] then}
    begin
      Result := tabPaySlip.FieldByName('TAXWK').AsInteger + GetUIFDeduct + GetProvFundDeduct(1)
        + ParamsCOUNCILDEDUCT').AsFloat + GetSickFundDeduct(1) + tabPaySlip.FieldByName('MEDAID').AsFloat
        + GetOther1Deduct(1) + tabPaySlip.FieldByName('OTHER2').AsFloat;
      if PayKind = pkFinal then
        Result := Result
          + tabEmployee.FieldByName('LOANAC').AsFloat - tabEmployee.FieldByName('RENTAC').AsFloat
      else {if PayKind = pkNormal then}
        Result := Result
          + GetPensionDeduct(ParamsPAYWEEK.AsDateTime, 1)
          + tabEmployee.FieldByName('INSURANCE').AsFloat + tabPaySlip.FieldByName('RENTDED').AsFloat
          + tabEmployee.FieldByName('SAVEWK').AsFloat + tabPaySlip.FieldByName('LOANDED').AsFloat;
    end;
  end;
end;                                                    { TotalDeduct. }

function GetTotalPay: Double;
{ Calculate the total pay owed to the tabEmployee.FieldByName('. }
begin                                                      { TotalPay. }
  with MainForm do
  begin
    Result := ODRound100(GetTotalEarnings - GetTotalDeduct);
    if PayKind = pkHoliday then
    begin
//      tabEmployee.FieldByName('.Edit;
      if Result >= 0 then tabEmployee.FieldByName('NEGPAYLOAN').AsFloat := 0
      else tabEmployee.FieldByName('NEGPAYLOAN').AsFloat := -Result;
      tabEmployee.FieldByName('HOLSLIPPAY').AsFloat := Result;
//      tabEmployee.FieldByName('.Post;
    end
    else {if PayKind in [pkNormal, pkFinal] then}
    begin
      Result := Result + GetSickFundPay(tabEmployee.FieldByName('SICKDAYS').AsInteger);
//      tabPaySlip.FieldByName('.Edit;
      tabPaySlip.FieldByName('NETPAY').AsFloat := Result;
//      tabPaySlip.FieldByName('.Post;
    end;
  end;
end;                                                       { TotalPay. }

function GetRentBalance: Double;
{ Calculate the balance on the RENT AC.
 Note: RentAC = Rent account balance (last week);
       RentRepay = Rent paid out of account to council.
       RentDeduct = Weekly Rent Deduction into account. }
var
  ThisWeekMM, LastWeekMM, NextWeekMM, YY, DD: Word;                    { RentBalance. }
begin
  DecodeDate(tabCompany.FieldByName('PAYWEEK.AsDateTime, YY, ThisWeekMM, DD);
  DecodeDate(tabCompany.FieldByName('PAYWEEK.AsDateTime-7, YY, LastWeekMM, DD);
  DecodeDate(tabCompany.FieldByName('PAYWEEK.AsDateTime+7, YY, NextWeekMM, DD);
  with MainForm do
    if PayKind = pkHoliday then
      Result := tabEmployee.FieldByName('RENTAC').AsFloat -
        GetRentRepay(LastWeekMM, NextWeekMM)
    else
      Result := ODRound100(tabEmployee.FieldByName('RENTAC').AsFloat -
        GetRentRepay(ThisWeekMM, NextWeekMM) + tabPaySlip.FieldByName('RENTDED').AsFloat);
end;                                                    { RentBalance. }

function GetSaveBalance: Double;
{ Calculate the balance on the SAVE AC.
Note: SavingsPaid = Savings Paid out of savings account to tabEmployee.FieldByName(' this week;
      SaveWk = Extra Weekly savings added on. }
begin                                                   { SaveBalance. }
  with MainForm do
    Result := tabEmployee.FieldByName('SAVEAC').AsFloat -
      tabPaySlip.FieldByName('SAVINGSPAIDOUT').AsFloat + tabEmployee.FieldByName('SAVEWK').AsInteger;
end;                                                    { SaveBalance. }

function GetLoanBalance: Double;
{ Calculate the balance on the LOAN AC.
  Note: LoanDed = Weekly deduction from loan;
      LoanGiven = (Extra) Loan given this week. }
begin                                                   { LoanBalance. }
  with MainForm do
    if PayKind = pkHoliday then
      Result := tabEmployee.FieldByName('NEGPAYLOAN').AsFloat
    else
      Result := tabEmployee.FieldByName('LOANAC').AsFloat -
        tabPaySlip.FieldByName('LOANDED').AsFloat + tabPaySlip.FieldByName('LOANGIVEN').AsFloat;
end;                                                    { LoanBalance. }

function GetLeaveDays: Integer;
begin                                                           { LeaveDays. }
  with MainForm do
    Result := tabEmployee.FieldByName('LEAVEDAYS').AsInteger + tabPaySlip.FieldByName('LEAVEPAYDAYS').AsInteger;
end;                                                            { LeaveDays. }

procedure AutoAdjust(Which : integer);
{ This procedure does the automatic adjustments required by the
  FinalPay procedure.  (before the run!) }
begin
  with MainForm do                                                { AutoAdjust. }
    if Which = 1 then
    begin                          { Adjustment before wages calculated. }
      tabEmployee.FieldByName('DISCHARGEDATE.AsDateTime := tabCompany.FieldByName('PAYWEEK.AsDateTime;
      { Reset variables not used anymore. }
      tabEmployee.FieldByName('RENTMONTH').AsFloat := 0;
      tabEmployee.FieldByName('SAVEWK').AsFloat    := 0;
      tabEmployee.FieldByName('REPAYLNWK').AsFloat := tabEmployee.FieldByName('LOANAC').AsFloat; { So that entire balance repaid this month. }
      tabEmployee.FieldByName('INSURANCE').AsFloat := 0;
    end
    { or leave out balances dependent on what is stored in the
      discharge file. Balances zeroed here first though for completeness.}
    else                             { Which = 2. }
    begin
      tabEmployee.FieldByName('RENTAC').AsFloat := 0;
      tabEmployee.FieldByName('RENTACNO.AsString := '';
      tabEmployee.FieldByName('SAVEAC').AsFloat := 0;
      tabEmployee.FieldByName('SAVEACNO.AsString := '';
      tabEmployee.FieldByName('LOANAC').AsFloat := 0;
      tabEmployee.FieldByName('REPAYLNWK').AsFloat := 0;
      tabEmployee.FieldByName('ATTBONUSWK').AsFloat := 0;
      tabEmployee.FieldByName('WKSPAY').AsFloat := 0;
    end;
end;                                                     { AutoAdjust. }

procedure CalcYTDTotals;
{ This procedure calculates YTD tabEmployee.FieldByName(' totals. }
var
  SickFundResult: Double;
  TTaxEarn, TSavingsPd, TNegPayLn, TRentPd, TPension, TTax, TUIF,
    TProvFd, TCouncil, TSickFd, TInsurance, TOther1: Double;
  TSickAnal : array[1..5] of Double;   { total of tabEmployee.FieldByName(''s contribut. }
  TSickEmps : array[1..5] of Integer;  { total number of tabEmployee.FieldByName(''s c  " . }
  ix: Integer;
begin                                              { CalcYTDTotals. }
  with MainForm, ParamsForm do
  begin
    tabEmployee.FieldByName('.First;
    while not tabEmployee.FieldByName('.EOF do
    begin
      tabEmployee.FieldByName('.Edit;
      { 1) tabEmployee.FieldByName(''s totals. }
      tabEmployee.FieldByName('TAXEARN').AsFloat := tabEmployee.FieldByName('TAXEARN').AsFloat + GetTaxEarnings;
      tabEmployee.FieldByName('UIFPAY').AsFloat := tabEmployee.FieldByName('UIFPAY').AsFloat + GetUIFDeduct;
      tabEmployee.FieldByName('PENSION').AsFloat := tabEmployee.FieldByName('PENSION').AsFloat + GetPensionDeduct(
        ParamsPAYWEEK.AsDateTime-7, ParamsHOLIDAYWEEKS').AsInteger);
      tabEmployee.FieldByName('PROVFD').AsFloat := tabEmployee.FieldByName('PROVFD').AsFloat
        + GetProvFundDeduct(ParamsHOLIDAYWEEKS').AsInteger);
      tabEmployee.FieldByName('SICKFD').AsFloat := tabEmployee.FieldByName('SICKFD').AsFloat
        + GetSickFundDeduct(ParamsHOLIDAYWEEKS').AsInteger);
      { Finally, update sick fund analysis. Note use of ix here. }
      SickFundResult := GetSickFundDeduct(ParamsHOLIDAYWEEKS').AsInteger);
      if SickFundResult <= 2.1 then ix := 1
      else if SickFundResult <= 2.2 then ix := 2
      else if SickFundResult <= 2.3 then ix := 3
      else if SickFundResult <= 2.4 then ix := 4
      else ix := 5;
      TSickAnal[ix] := TSickAnal[ix] + SickFundResult;
      TSickEmps[ix] := TSickEmps[ix] + 1;
      tabEmployee.FieldByName('PAYE').AsFloat := tabEmployee.FieldByName('PAYE').AsFloat + tabEmployee.FieldByName('TAXWK').AsFloat;
      if tabEmployee.FieldByName('HOLSLIPPAY').AsFloat >= 0 then { = here so that HolSlipPay assigned 0.}
        TotAnalTOTALPAY').AsFloat := TotAnalTOTALPAY').AsFloat + tabEmployee.FieldByName('HOLSLIPPAY').AsFloat;
      tabEmployee.FieldByName('GROSSPAY').AsFloat := tabEmployee.FieldByName('GROSSPAY').AsFloat + GetTaxEarnings;
      tabEmployee.FieldByName('RENTAC').AsFloat := GetRentBalance;
      TotAnalLOANDED').AsFloat := TotAnalLOANDED').AsFloat + tabEmployee.FieldByName('LOANAC').AsFloat; { Add in before account set to NegPayLn. }
      tabEmployee.FieldByName('LOANAC').AsFloat := GetLoanBalance;

      { 2) Totals for this week. }
      TTaxEarn   := TTaxEarn   + GetTaxEarnings;
      TSavingsPd := TSavingsPd + tabEmployee.FieldByName('SAVEAC').AsFloat;
      tabEmployee.FieldByName('SAVEAC').AsFloat := 0;
      if tabEmployee.FieldByName('HOLSLIPPAY').AsFloat < 0 then            { Neg Pay Ln. }
        TNegPayLn := TNegPayLn - tabEmployee.FieldByName('HOLSLIPPAY').AsFloat; { must be +ve (--=+). }
      TRentPd    := TRentPd  { Out of acc to council. }
        + GetRentRepay(GetLastWeekMM, GetNextWeekMM);
      TPension   := TPension   + GetPensionDeduct(
        ParamsPAYWEEK.AsDateTime, ParamsHOLIDAYWEEKS').AsInteger);
      TTax       := TTax       + tabEmployee.FieldByName('TAXWK').AsFloat;
      TUIF       := TUIF       + GetUIFDeduct;
      TProvFd    := TProvFd    + GetProvFundDeduct(ParamsHOLIDAYWEEKS').AsInteger);
      TCouncil   := TCouncil   + GetCouncilDed;
      TSickFd    := TSickFd    + GetSickFundDeduct(ParamsHOLIDAYWEEKS').AsInteger);
      TInsurance := TInsurance + GetInsuranceDed;
      TOther1    := TOther1    + GetOther1Deduct(ParamsHOLIDAYWEEKS').AsInteger);
      tabEmployee.FieldByName('.Post;

      { 3) Dept totals for the week. }
      DeptAnal.FindKey([tabEmployee.FieldByName('DEPTNO').AsInteger]);
      DeptAnal.Edit;
      DeptAnaltabEmployee.FieldByName('S').AsInteger := DeptAnaltabEmployee.FieldByName('S').AsInteger + 1;
      DeptAnalTAXEARNINGS').AsFloat := DeptAnalTAXEARNINGS').AsFloat + GetTaxEarnings;
      DeptAnalHOLIDAYPAY').AsFloat  := DeptAnalHOLIDAYPAY').AsFloat  + GetHolidayPay;
      DeptAnalXMASBONUS').AsFloat   := DeptAnalXMASBONUS').AsFloat   + GetChristmasBonus;
      DeptAnalSPECIALBONUS').AsFloat := DeptAnalSPECIALBONUS').AsFloat + ParamsSPECIALBONUS').AsFloat;
      DeptAnalSERVICEBONUS').AsFloat := DeptAnalSERVICEBONUS').AsFloat + GetServiceBonus;
      DeptAnal.Post;
    end;

    //save the totals
    TotAnal.Edit;
    TotAnalTAXEARN').AsFloat := TTaxEarn;
    TotAnalSAVINGSPD').AsFloat := TSavingsPd;
    TotAnalNEGPAYLN').AsFloat := TNegPayLn;
    TotAnalRENTPD').AsFloat := TRentPd;
    TotAnalPENSION').AsFloat := TPension;
    TotAnalTAX').AsFloat := TTax;
    TotAnalUIF').AsFloat := TUIF;
    TotAnalPROVFD').AsFloat := TProvFd;
    TotAnalCOUNCIL').AsFloat := TCouncil;
    TotAnalSICKFD').AsFloat := TSickFd;
    TotAnalINSURANCE').AsFloat := TInsurance;
    TotAnalOTHER1').AsFloat := TOther1;
    TotAnal.Post;
    SickAnal.First;
    for ix := 1 to 5 do
    begin
      SickAnal.Edit;
      SickAnalAMOUNT').AsFloat := TSickAnal[ix];
      SickAnaltabEmployee.FieldByName('S').AsFloat := TSickEmps[ix];
      SickAnal.Post;
      SickAnal.Next;
    end;
  end;
end;                                               { CalcYTDTotals. }
*)

end.
