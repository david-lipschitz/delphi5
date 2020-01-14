unit Utils;

interface
  function DLRound(amtvalue,amtprecision:real):real;
  function ZeroFill(FillValue:LongInt;FillLength:smallint):string;
{  function DLCopyStr(FromString:string;StartPosn,Length:smallint):string;}
{DLCopyStr is replaced with Copy (same parameters)}

implementation

uses SysUtils;

function DLRound(amtvalue,amtprecision:real):real;
begin
  Result:=int((amtvalue*amtprecision)+0.500001)/amtprecision;
end;

function ZeroFill(FillValue:LongInt;FillLength:smallint):string;
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

function DLCopyStr(FromString:string;StartPosn,Length:smallint):string;
var
  ix:smallint;
begin
  for ix := 1 to Length do
    Result[ix]:=FromString[StartPosn+ix-1];
  SetLength(Result,Length);
{  Result[0]:=chr(Length);}
end;

end.
