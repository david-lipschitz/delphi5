unit SpinJob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Menus, Buttons, ODSched;

type
  TODSpinJob = class;

  TODSpindleItem = class(TODJobItem)
  private
    function GetJob: TODSpinJob;
    function GetCaption: TCaption;
    function GetSpindleNo: Integer;
    procedure SetSpindleNo(Value: Integer);
  protected
    procedure SetCaption;
  public
    property Job: TODSpinJob read GetJob;
    property Caption: TCaption read GetCaption;   //make read only
    property SpindleNo: Integer read GetSpindleNo write SetSpindleNo;
  end;

  TODSpinJob = class(TODJob)
  private
    FStruct, FTwist, FColor: string;
    FWeight, FHoursPerKg: Integer;
    function GetItem(Index: Integer): TODSpindleItem;
    procedure SetItem(Index: Integer; Value: TODSpindleItem);
    function GetCaption: TCaption;
    function GetStatus: string;
    function GetExtProdRef: string;
    procedure SetStruct(const Value: string);
    procedure SetTwist(const Value: string);
    procedure SetColor(const Value: string);
    procedure SetWeight(Value: Integer);
    procedure SetHoursPerKg(Value: Integer);
  protected
    procedure SetCaption;
    procedure SetStatus;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AddItem(Item: TODSpindleItem);
    function AddNewItem: TODSpindleItem;
    function AddItemFrom(ASpindleNo: Integer): TODSpindleItem;
    procedure InsertItem(Index: Integer; Item: TODSpindleItem);
    procedure DeleteItem(Index: Integer; ToFree: Boolean);
    function ItemByNo(ASpindleNo: Longint): TODSpindleItem;
    property Caption read GetCaption;
    property Status: string read GetStatus;
    property ExtProdRef: string read GetExtProdRef;
    property Struct: string read FStruct write SetStruct;
    property Twist: string read FTwist write SetTwist;
    property Color: string read FColor write SetColor;
    property Weight: Integer read FWeight write SetWeight;
    property HoursPerKg: Integer read FHoursPerKg write SetHoursPerKg;
    property Items[Index: Integer]: TODSpindleItem read GetItem write SetItem; default;
  end;

  TODCleanJob = class(TODJob)
  private
    function GetCaption: TCaption;
  public
    constructor Create(AOwner: TComponent); override;
    property Caption read GetCaption;
  end;

implementation

// TODSpindleItem

function TODSpindleItem.GetJob: TODSpinJob;
begin
  Result := inherited Job as TODSpinJob;
end;

function TODSpindleItem.GetCaption: TCaption;
begin
  Result := inherited Caption;
end;

function TODSpindleItem.GetSpindleNo: Integer;
begin
  Result := ItemNo;
end;

procedure TODSpindleItem.SetCaption;
begin
  inherited Caption := 'Spindle ' + IntToStr(ItemNo);
end;

procedure TODSpindleItem.SetSpindleNo(Value: Integer);
begin
  ItemNo := Value;
  SetCaption;
end;

// TODSpinJob

constructor TODSpinJob.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Font.Style := [];
end;

function TODSpinJob.GetItem(Index: Integer): TODSpindleItem;
begin
  Result := TODSpindleItem(inherited Items[Index]);
end;

procedure TODSpinJob.SetItem(Index: Integer; Value: TODSpindleItem);
begin
  inherited Items[Index] := Value;
end;

function TODSpinJob.GetCaption: TCaption;
begin
  Result := UpperCaption;
end;

function TODSpinJob.GetExtProdRef: string;
begin
  Result := FTwist;
  if Length(Result) = 1 then
    Result := '0' + Result;
  Result := FStruct + Result + FColor;
end;

function TODSpinJob.GetStatus: string;
begin
  Result := inherited Status;
end;

procedure TODSpinJob.SetCaption;
begin
  UpperCaption := IntToStr(JobNo) + ':  ' +  FStruct + '-' +
    FTwist + '-' + FColor + ' ' + IntToStr(FWeight){ + 'kg'};
end;

procedure TODSpinJob.SetStatus;
var
  st: string;
begin
  st := IntToStr(Round(FHoursPerKg * FWeight)) + '/' + IntToStr(ItemCount);
  if ItemCount > 0 then
    st := st + ' = ' + IntToStr(Round(FHoursPerKg * FWeight) div ItemCount);
  inherited Status := st;
end;

procedure TODSpinJob.SetStruct(const Value: string);
begin
  FStruct := Value;
  SetCaption;
end;

procedure TODSpinJob.SetTwist(const Value: string);
begin
  FTwist := Value;
  SetCaption;
end;

procedure TODSpinJob.SetColor(const Value: string);
begin
  FColor := Value;
  SetCaption;
end;

procedure TODSpinJob.SetWeight(Value: Integer);
begin
  FWeight := Value;
  SetCaption;
  SetStatus;
end;

procedure TODSpinJob.SetHoursPerKg(Value: Integer);
begin
  FHoursPerKg := Value;
  SetStatus;
end;

procedure TODSpinJob.AddItem(Item: TODSpindleItem);
begin
  inherited AddItem(Item);
  SetStatus;
end;

function TODSpinJob.AddNewItem: TODSpindleItem;
begin
  Result := TODSpindleItem.Create(Self);
  inherited AddItem(Result);
end;

function TODSpinJob.AddItemFrom(ASpindleNo: Integer): TODSpindleItem;
begin
  Result := TODSpindleItem.Create(Self);
  Result.SpindleNo := ASpindleNo;
  inherited AddItem(Result);
end;

procedure TODSpinJob.InsertItem(Index: Integer; Item: TODSpindleItem);
begin
  inherited InsertItem(Index, Item);
end;

procedure TODSpinJob.DeleteItem(Index: Integer; ToFree: Boolean);
begin
  inherited DeleteItem(Index, ToFree);
  SetStatus;
end;

function TODSpinJob.ItemByNo(ASpindleNo: Longint): TODSpindleItem;
begin
  Result := TODSpindleItem(inherited ItemByNo(ASpindleNo));
end;

// TODCleanJob

constructor TODCleanJob.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Color := clMaroon;
  Font.Style := [];
  UpperCaption := 'Cleaning';
end;

function TODCleanJob.GetCaption: TCaption;
begin
  Result := UpperCaption;
end;

end.
