unit Vbutils;

interface
  function DLRound(amtvalue,amtprecision:real):real;
  function ZeroFill(FillValue:longint;FillLength:smallint) : string;
  procedure ODMeanAndStdDev(const Data: array of Double; var Mean, StdDev: double;
    const ArrayElements:integer; const lSum:double);
{  function DLCopyStr(FromString:string;StartPosn,Length:smallint):string;}
{DLCopyStr is replaced with Copy (same parameters)}

implementation

uses SysUtils;

function DLRound(amtvalue,amtprecision:real):real;
begin
  Result:=int((amtvalue*amtprecision)+0.5000001)/amtprecision; //000001 added DL041001
end;

function ZeroFill(FillValue:longint;FillLength:smallint) : string;
begin
  ZeroFill:='ZZZZZ';

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
  if FillLength=4 then
  begin
    if FillValue>999 then
      Result:=inttostr(FillValue)
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
  if FillLength=2 then
  begin
    if FillValue>9 then
      Result:=inttostr(FillValue)
    else
      Result:='0'+inttostr(FillValue)
  end;
end;

{function DLCopyStr(FromString:string;StartPosn,Length:smallint):string;
var
  ix:smallint;
begin
  for ix := 1 to Length do
    Result[ix]:=FromString[StartPosn+ix-1];
  SetLength(Result,Length);
{  Result[0]:=chr(Length);}
{end;}

procedure ODMeanAndStdDev(const Data: array of Double; var Mean, StdDev: double;
  const ArrayElements:integer; const lSum:double);
var
  Sx: Extended;
  //N,I: Integer;
  ix:integer;
begin
  //N := High(Data)- Low(Data) + 1;
  if ArrayElements = 1 then
  begin
    Mean := Data[0];
    StdDev := Data[0];
    Exit;
  end;
  Mean := lSum / ArrayElements;
  Sx := 0;               // sum differences from the mean, for greater accuracy
  for Ix := 0 to ArrayElements-1 do
    Sx := Sx + Sqr(Mean - Data[Ix]);
  StdDev := Sqrt(Sx / (ArrayElements - 1));
end;


end.
