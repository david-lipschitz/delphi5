unit Utils;

interface
  //all these functions are public
  //real values changed to double DL181098
  function ODRound(amtvalue,amtprecision:double):double;
  function ODRound100(amtvalue:double):double;
  function ODZeroFill(FillValue:LongInt;FillLength:smallint):string;
  function ODIsLeapYear(Year:integer): Boolean;
  function ODDaysThisMonth(Month,Year:integer): Integer;
  procedure ODGetAge(LowerDate,HigherDate:TDateTime;
    var YearsDiff,MonthsDiff,DaysDiff:integer);
  procedure PRept(ReptChar : char; ReptNo : integer);
{  function DLCopyStr(FromString:string;StartPosn,Length:smallint):string;}
{DLCopyStr is replaced with Copy (same parameters)}

implementation

uses SysUtils,Main;

function ODRound(AmtValue,AmtPrecision:double):double;
{ dlround rounds a double number to 2 decimal places taking into account
  computer calculation errors.  Written by DH Lipschitz on 25 March 1990.
  Modified DL181098.  AmtPrecision is usually 100 for 2 decimal places precision }
begin
  if AmtValue>=0 then
    ODRound:=int((AmtValue*AmtPrecision)+0.500001)/amtprecision
  else
    ODRound:=int((AmtValue*AmtPrecision)-0.500001)/amtprecision
end;

function ODRound100(AmtValue:double):double;
//round monetary values (Rands and Cents)
begin
  ODRound100:=ODRound(AmtValue,100);
end;

function ODZeroFill(FillValue:LongInt;FillLength:smallint):string;
begin
  Result:='ZZZZZ';

  if FillLength=6 then
  begin
    if FillValue>99999 then
      Result:=IntToStr(FillValue)
    else
      if FillValue>9999 then
        Result:='0'+IntToStr(FillValue)
      else
        if FillValue>999 then
          Result:='00'+inttostr(FillValue)
        else
          if FillValue>99 then
            Result:='000'+inttostr(FillValue)
          else
            if FillValue>9 then
              Result:='0000'+inttostr(FillValue)
            else
              Result:='00000'+inttostr(FillValue);
  end;
  if FillLength=5 then
  begin
    if FillValue>9999 then
      Result:=IntToStr(FillValue)
    else
      if FillValue>999 then
        Result:='0'+inttostr(FillValue)
      else
        if FillValue>99 then
          Result:='00'+inttostr(FillValue)
        else
          if FillValue>9 then
            Result:='000'+inttostr(FillValue)
          else
            Result:='0000'+inttostr(FillValue);
  end;
  if FillLength=4 then {added DL020397}
  begin
    if FillValue>999 then
      Result:=IntToStr(FillValue)
    else
      if FillValue>99 then
        Result:='0'+inttostr(FillValue)
      else
        if FillValue>9 then
          Result:='00'+inttostr(FillValue)
        else
          Result:='000'+inttostr(FillValue);
  end;
  if FillLength=3 then
  begin
    if FillValue>99 then
      Result:=inttostr(FillValue)
    else
      if FillValue>9 then
        Result:='0'+inttostr(FillValue)
      else
        Result:='00'+inttostr(FillValue)
  end;
end;

(*function ODCopyStr(FromString:string;StartPosn,Length:smallint):string;
var
  ix:smallint;
begin
  for ix := 1 to Length do
    Result[ix]:=FromString[StartPosn+ix-1];
  SetLength(Result,Length);
{  Result[0]:=chr(Length);}
end;*)

function ODIsLeapYear(Year:integer): Boolean;
begin
  Result := (Year mod 4 = 0) 	{ years divisible by 4 are... }
    and ((Year mod 100 <> 0)	{ ...except century years... }
    or (Year mod 400 = 0));	{ ...unless it's divisible by 400 }
end;

function ODDaysThisMonth(Month,Year:integer): Integer;
const
  DaysPerMonth: array[1..12] of Integer =
    (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);	{ usual numbers of days }
begin
  Result := DaysPerMonth[Month];	{ normally, just return number }
  if (Month = 2) and ODIsLeapYear(Year) then Inc(Result);	{ plus 1 in leap February }
end;

procedure ODGetAge(LowerDate,HigherDate:TDateTime;
            var YearsDiff,MonthsDiff,DaysDiff:integer);
var
  LowerYear,LowerMonth,LowerDay: Word;
  HigherYear,HigherMonth,HigherDay: Word;
begin
  //note for calling program: if YearsDiff<0 then error,
  //  lower date after higher date
  DecodeDate(LowerDate,LowerYear,LowerMonth,LowerDay);
  DecodeDate(HigherDate,HigherYear,HigherMonth,HigherDay);
  YearsDiff:=HigherYear-LowerYear;
  MonthsDiff:=HigherMonth-LowerMonth;
  DaysDiff:=HigherDay-LowerDay;
  if (YearsDiff>=0) and (MonthsDiff>=0) and (DaysDiff>=0) then
    Exit;
  if YearsDiff<0 then
    Exit; //error, lower date after higher date
  if MonthsDiff<0 then
  begin
    YearsDiff:=YearsDiff-1;
    MonthsDiff:=MonthsDiff+12; //carry forward 12 months for 1 year subtracted
  end;
  if YearsDiff<0 then
    Exit; //error, lower date after higher date
  if DaysDiff<0 then
  begin
    MonthsDiff:=MonthsDiff-1;
    //DaysDiff:=days remaining in lower month + days in to month
    DaysDiff:=ODDaysThisMonth(LowerMonth,LowerYear)-LowerDay+HigherDay;
  end;
  if MonthsDiff<0 then
  begin
    YearsDiff:=YearsDiff-1;
    MonthsDiff:=MonthsDiff+12;
  end;
  if YearsDiff < 0 then
    Exit; //error lower date after higher date
  //now do the 26/2/95 to 2/3/96 problem, ie where the higher year is a leap year
  // and the higher month is March and the lower month is February.  An extra
  // day must be added.
  // Note: no problem for 26/2/94 to 2/3/95.  (Non leap years)
  // and for 26/2/96 to 26/3/97.  Note: this problem is the same for
  // 26/2/92 to 2/3/96 where the from year and to year are both leap years
  // -> an extra day must be added.
  if (LowerMonth=2) and (HigherMonth=3) and ODIsLeapYear(HigherYear) then
    DaysDiff:=DaysDiff+1;
end;

procedure PRept(ReptChar : char; ReptNo : integer);
{ This procedure prints a character to the printer a specified
  number of times. }
var
  ix:integer;
begin                                                              { PRept. }
  for ix := 1 to ReptNo do write(PrintFile, ReptChar);
end;                                                               { PRept. }

end.
