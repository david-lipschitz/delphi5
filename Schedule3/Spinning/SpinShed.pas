unit SpinShed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Menus, Buttons, ODSched;

type
  TODSpinJob = class;

  TODSpinJobItem = class(TODJobItem)
  private
    FStruct, FTwist, FColor: string;
    FWeight, FSpindles: Integer;
    FHoursPerKg: Double;
    function GetJob: TODSpinJob;
    function GetCaption: TCaption;
    function GetExtProdRef: string;
    procedure SetStruct(const Value: string);
    procedure SetTwist(const Value: string);
    procedure SetColor(const Value: string);
    procedure SetWeight(Value: Integer);
    procedure SetSpindles(Value: Integer);
    function GetDuration: Double;
//    function GetHint: string;
  protected
    procedure SetCaption;
  public
    constructor Create(AOwner: TComponent); override;
    property Job: TODSpinJob read GetJob;
    property Caption: TCaption read GetCaption;   //make read only
    property ExtProdRef: string read GetExtProdRef;
    property Struct: string read FStruct write SetStruct;
    property Twist: string read FTwist write SetTwist;
    property Color: string read FColor write SetColor;
    property Weight: Integer read FWeight write SetWeight;
    property HoursPerKg: Double read FHoursPerKg write FHoursPerKg;
    property Spindles: Integer read FSpindles write SetSpindles;
    property Duration: Double read GetDuration;
{  protected
    property Hint: string read GetHint;}
  end;

  TODSpinJob = class(TODJob)
  private
    FDuration: Double;
    function GetItem(Index: Integer): TODSpinJobItem;
    procedure SetItem(Index: Integer; Value: TODSpinJobItem);
    function GetJobNo: Integer;
    procedure SetJobNo(Value: Integer);
    function GetCaption: TCaption;
    function GetStatus: string;
    procedure SetDuration(Value: Double);
    function GetSpindles: Integer;
  protected
    procedure SetCaption;
    procedure SetStatus;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AddItem(Item: TODSpinJobItem);
    function AddNewItem: TODSpinJobItem;
    function AddItemFrom(AItemNo: Integer;
      AStruct, ATwist, AColor: string; AWeight, ASpindles: Integer;
      AHoursPerKg: Double): TODSpinJobItem;
    procedure InsertItem(Index: Integer; Item: TODSpinJobItem);
//    procedure DeleteItem(Index: Integer; ToFree: Boolean);
//    function ItemByNo(AItemNo: Longint): TODSpinJobItem;
    property JobNo read GetJobNo write SetJobNo;
    property Caption read GetCaption;
    property Status read GetStatus;  //no type as overidding inherited Status property
    property Duration: Double read FDuration write SetDuration;
    property Spindles: Integer read GetSpindles;
    property Items[Index: Integer]: TODSpinJobItem read GetItem write SetItem; default;
  end;

  TODCleanJob = class(TODJob)
  private
    function GetJobNo: Integer;
    procedure SetJobNo(Value: Integer);
    function GetCaption: TCaption;
  protected
    procedure SetCaption;
  public
    constructor Create(AOwner: TComponent); override;
    property JobNo read GetJobNo write SetJobNo;
    property Caption read GetCaption;
  end;

implementation

// TODSpinJobItem

constructor TODSpinJobItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ShowHint := True;
end;

function TODSpinJobItem.GetJob: TODSpinJob;
begin
  Result := inherited Job as TODSpinJob;
end;

function TODSpinJobItem.GetCaption: TCaption;
begin
  Result := inherited Caption;
end;

procedure TODSpinJobItem.SetCaption;
begin
  inherited Caption := FStruct + '-' + FTwist + '-' + FColor +
    ' ' + IntToStr(FWeight) + '/' + IntToStr(FSpindles);
end;

function TODSpinJobItem.GetExtProdRef: string;
begin
  Result := FTwist;
  if Length(Result) = 1 then
    Result := '0' + Result;
  Result := FStruct + Result + FColor;
end;

procedure TODSpinJobItem.SetStruct(const Value: string);
begin
  FStruct := Value;
  SetCaption;
end;

procedure TODSpinJobItem.SetTwist(const Value: string);
begin
  FTwist := Value;
  SetCaption;
end;

procedure TODSpinJobItem.SetColor(const Value: string);
begin
  FColor := Value;
  SetCaption;
end;

procedure TODSpinJobItem.SetWeight(Value: Integer);
begin
  FWeight := Value;
  SetCaption;
end;

procedure TODSpinJobItem.SetSpindles(Value: Integer);
begin
  FSpindles := Value;
  SetCaption;
end;

function TODSpinJobItem.GetDuration: Double;
begin
  if FSpindles > 0 then
    Result := FWeight * FHoursPerKg / FSpindles
  else
    Result := 0;
  Hint := 'Spin time: ' + IntToStr(Round(Result)) + ' hrs';
end;
{
function TODSpinJobItem.GetHint: string;
begin
  Result := 'Spin time: ' + IntToStr(Round(GetDuration)) + ' hrs';
end;
}
// TODSpinJob

constructor TODSpinJob.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUpperLabel.Alignment := taLeftJustify;
//  Font.Style := [];
end;

function TODSpinJob.GetItem(Index: Integer): TODSpinJobItem;
begin
  Result := TODSpinJobItem(inherited Items[Index]);
end;

procedure TODSpinJob.SetItem(Index: Integer; Value: TODSpinJobItem);
begin
  inherited Items[Index] := Value;
end;

function TODSpinJob.GetJobNo: Integer;
begin
  Result := inherited JobNo;
end;

procedure TODSpinJob.SetJobNo(Value: Integer);
begin
  inherited JobNo := Value;
  SetCaption;
end;

function TODSpinJob.GetCaption: TCaption;
begin
  Result := UpperCaption;
end;

function TODSpinJob.GetStatus: string;
begin
  Result := inherited Status;
end;

procedure TODSpinJob.SetDuration(Value: Double);
begin
  FDuration := Value;
  SetStatus;
end;

procedure TODSpinJob.SetCaption;
begin
  UpperCaption := IntToStr(JobNo) + ':  Spinning';
end;

procedure TODSpinJob.SetStatus;
begin
  inherited Status := 'Spin Time = ' + IntToStr(Round(FDuration)) + 'hrs';
end;

function TODSpinJob.GetSpindles: Integer;
var
  ix: Integer;
begin
  Result := 0;
  for ix := 0 to ItemCount-1 do
    Inc(Result, TODSpinJobItem(Items[ix]).Spindles);
end;

procedure TODSpinJob.AddItem(Item: TODSpinJobItem);
begin
  inherited AddItem(Item);
//  SetStatus;
end;

function TODSpinJob.AddNewItem: TODSpinJobItem;
begin
  Result := TODSpinJobItem.Create(Self);
  inherited AddItem(Result);
end;

function TODSpinJob.AddItemFrom(AItemNo: Integer;
  AStruct, ATwist, AColor: string; AWeight, ASpindles: Integer;
  AHoursPerKg: Double): TODSpinJobItem;
begin
  Result := TODSpinJobItem.Create(Self);
  Result.ItemNo := AItemNo;
  Result.Struct := AStruct;
  Result.Twist := ATwist;
  Result.Color := AColor;
  Result.Weight := AWeight;
  Result.Spindles := ASpindles;
  Result.HoursPerKg := AHoursPerKg;
  inherited AddItem(Result);
end;

procedure TODSpinJob.InsertItem(Index: Integer; Item: TODSpinJobItem);
begin
  inherited InsertItem(Index, Item);
end;
{
procedure TODSpinJob.DeleteItem(Index: Integer; ToFree: Boolean);
begin
  inherited DeleteItem(Index, ToFree);
  SetStatus;
end;
}

// TODCleanJob

constructor TODCleanJob.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUpperLabel.Alignment := taLeftJustify;
  Color := clMaroon;
//  Font.Style := [];
end;

function TODCleanJob.GetJobNo: Integer;
begin
  Result := inherited JobNo;
end;

procedure TODCleanJob.SetJobNo(Value: Integer);
begin
  inherited JobNo := Value;
  SetCaption;
end;

function TODCleanJob.GetCaption: TCaption;
begin
  Result := UpperCaption;
end;

procedure TODCleanJob.SetCaption;
begin
  UpperCaption := IntToStr(JobNo) + ':  Cleaning';
end;

end.
