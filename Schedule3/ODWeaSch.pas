unit ODWeaSch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Menus, Buttons, ODSched;

type
  TODWeaveJob = class;

  TODWeaveJobItem = class(TODJobItem)
  private
    FFabricStruct, FFabricColor, FWeftColor: string;
    FWeftPieces: double; //was Integer; DL020716
    function GetJob: TODWeaveJob;
    function GetCaption: TCaption;
    function GetDescr: string;
    procedure SetFabricStruct(const Value: string);
    procedure SetFabricColor(const Value: string);
    procedure SetWeftColor(const Value: string);
    procedure SetWeftPieces(Value: double);
  protected
    procedure SetCaption;
  public
    property Job: TODWeaveJob read GetJob;
    property Caption: TCaption read GetCaption;   //make read only
    property Descr: string read GetDescr;
    property FabricStruct: string read FFabricStruct write SetFabricStruct;
    property FabricColor: string read FFabricColor write SetFabricColor;
    property WeftColor: string read FWeftColor write SetWeftColor;
    property WeftPieces: double read FWeftPieces write SetWeftPieces;
  end;

  TODWeaveJob = class(TODJob)
  private
    FWarpType, FWarpColor: string;
    FWarpLength, FLengthRem {FWeightRem,} : double;
    FWeaveHours: integer; //Integer;
    function GetItem(Index: Integer): TODWeaveJobItem;
    procedure SetItem(Index: Integer; Value: TODWeaveJobItem);
    function GetUpperCaption: string;
    function GetStatus: string;
    function GetDescr: string;
    procedure SetWarpType(const Value: string);
    procedure SetWarpColor(const Value: string);
    procedure SetWarpLength(Value: double);
    procedure SetLengthRem(Value: double {Integer});
//  procedure SetWeightRem(Value: Integer);
    procedure SetWeaveHours(Value: Integer);
  protected
    procedure SetUpperCaption;
    procedure SetStatus;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AddItem(Item: TODWeaveJobItem);
    function AddNewItem: TODWeaveJobItem;
    function AddItemFrom(AItemNo: Integer;
      const AFabricStruct, AFabricColor, AWeftColor: string;
      AWeftPieces: double): TODWeaveJobItem;
    procedure InsertItem(Index: Integer; Item: TODWeaveJobItem);
    function ItemByNo(AItemNo: Longint): TODWeaveJobItem;
    function ItemByCaption(const ACaption: string): TODWeaveJobItem;
    property UpperCaption read GetUpperCaption;  //make read only
    property Status: string read GetStatus;
    property Descr: string read GetDescr;
    property WarpType: string read FWarpType write SetWarpType;
    property WarpColor: string read FWarpColor write SetWarpColor;
    property WarpLength: double read FWarpLength write SetWarpLength;
    property LengthRem: double read FLengthRem write SetLengthRem;
//  property WeightRem: Integer read FWeightRem write SetWeightRem;
    property WeaveHours: Integer read FWeaveHours write SetWeaveHours;
    property Items[Index: Integer]: TODWeaveJobItem read GetItem write SetItem; default;
  end;

  TODReedJob = class(TODJob)
  private
    FTotalEnds: Integer;
    FDentsPerCm: Single;
    function GetUpperCaption: string;
    function GetDescr: string;
    procedure SetTotalEnds(Value: Integer);
    procedure SetDentsPerCm(Value: Single);
  protected
    procedure SetUpperCaption;
  public
    constructor Create(AOwner: TComponent); override;
    property UpperCaption read GetUpperCaption;  //make read only
    property Descr: string read GetDescr;
    property TotalEnds: Integer read FTotalEnds write SetTotalEnds;
    property DentsPerCm: Single read FDentsPerCm write SetDentsPerCm;
  end;

  TODDowntimeJob = class(TODJob)
  private
    FDescr: string;
    function GetUpperCaption: string;
    procedure SetDescr(const Value: string);
  protected
    procedure SetUpperCaption;
  public
    constructor Create(AOwner: TComponent); override;
    property UpperCaption read GetUpperCaption;  //make read only
    property Descr: string read FDescr write SetDescr;
  end;

implementation

// TODWeaveJobItem

function TODWeaveJobItem.GetJob: TODWeaveJob;
begin
  Result := inherited Job as TODWeaveJob;
end;

function TODWeaveJobItem.GetCaption: TCaption;
begin
  Result := inherited Caption;
end;

function TODWeaveJobItem.GetDescr: string;
begin
  Result := FabricStruct + FFabricColor + ' : ' + FWeftColor;
end;

procedure TODWeaveJobItem.SetCaption;
{var
  st: string;}
begin
//  if FWeftPieces > 1 then st := 's' else st := '';
  inherited Caption := Descr + '/' + FloatToStr(FWeftPieces) {+ 'pc' + st};
end;

procedure TODWeaveJobItem.SetFabricStruct(const Value: string);
begin
  FFabricStruct := Value;
  SetCaption;
end;

procedure TODWeaveJobItem.SetFabricColor(const Value: string);
begin
  FFabricColor := Value;
  SetCaption;
end;

procedure TODWeaveJobItem.SetWeftColor(const Value: string);
begin
  FWeftColor := Value;
  SetCaption;
end;

procedure TODWeaveJobItem.SetWeftPieces(Value: double);
begin
  FWeftPieces := Value;
  SetCaption;
end;

// TODWeaveJob

constructor TODWeaveJob.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Font.Style := [];
end;

function TODWeaveJob.GetItem(Index: Integer): TODWeaveJobItem;
begin
  Result := TODWeaveJobItem(inherited Items[Index]);
end;

procedure TODWeaveJob.SetItem(Index: Integer; Value: TODWeaveJobItem);
begin
  inherited Items[Index] := Value;
end;

function TODWeaveJob.GetUpperCaption: string;
begin
  Result := inherited UpperCaption;
end;

function TODWeaveJob.GetStatus: string;
begin
  Result := inherited Status;
end;

function TODWeaveJob.GetDescr: string;
begin
  Result := FWarpType + '-' + FWarpColor;
end;

procedure TODWeaveJob.SetUpperCaption;
begin
  inherited UpperCaption := IntToStr(JobNo) + ': ' + //was ':  ' DL081002
    Descr + ' ' + FloatToStr(FWarpLength){ + 'm'};
end;

procedure TODWeaveJob.SetStatus;
begin
{ inherited Status := 'Rem: ' + IntToStr(FLengthRem) +
    'm / ' + IntToStr(FWeightRem) + 'kg';}
  inherited Status := 'Rem: ' + FloatToStr(FLengthRem) + 'm';
end;

procedure TODWeaveJob.SetWarpType(const Value: string);
begin
  FWarpType := Value;
  SetUpperCaption;
end;

procedure TODWeaveJob.SetWarpColor(const Value: string);
begin
  FWarpColor := Value;
  SetUpperCaption;
end;

procedure TODWeaveJob.SetWarpLength(Value: double);
begin
  FWarpLength := Value;
  SetUpperCaption;
end;

procedure TODWeaveJob.SetLengthRem(Value: double);
begin
  FLengthRem := Value;
  SetStatus;
end;

procedure TODWeaveJob.SetWeaveHours(Value: Integer);
begin
  FWeaveHours := Value;
  FDateText.ShowHint := Value > 0;
  FDateText.Hint := 'Est weave time: ' + IntToStr(Value) + 'hrs';
end;
{
procedure TODWeaveJob.SetWeightRem(Value: Integer);
begin
  FWeightRem := Value;
  SetStatus;
end;
}
procedure TODWeaveJob.AddItem(Item: TODWeaveJobItem);
begin
  inherited AddItem(Item);
end;

function TODWeaveJob.AddNewItem: TODWeaveJobItem;
begin
  Result := TODWeaveJobItem.Create(Self);
  inherited AddItem(Result);
end;

function TODWeaveJob.AddItemFrom(AItemNo: Integer;
  const AFabricStruct, AFabricColor, AWeftColor: string;
  AWeftPieces: double): TODWeaveJobItem;
begin
  Result := TODWeaveJobItem.Create(Self);
  with Result do
  begin
    ItemNo := AItemNo;
    FabricStruct := AFabricStruct;
    FabricColor := AFabricColor;
    WeftColor := AWeftColor;
    WeftPieces := AWeftPieces;
  end;
  inherited AddItem(Result);
end;

procedure TODWeaveJob.InsertItem(Index: Integer; Item: TODWeaveJobItem);
begin
  inherited InsertItem(Index, Item);
end;

function TODWeaveJob.ItemByNo(AItemNo: Longint): TODWeaveJobItem;
begin
  Result := TODWeaveJobItem(inherited ItemByNo(AItemNo));
end;

function TODWeaveJob.ItemByCaption(const ACaption: string): TODWeaveJobItem;
begin
  Result := TODWeaveJobItem(inherited ItemByCaption(ACaption));
end;

// TODReedJob

constructor TODReedJob.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Color := clGreen;
  Font.Style := [];
end;

function TODReedJob.GetUpperCaption: string;
begin
  Result := inherited UpperCaption;
end;

function TODReedJob.GetDescr: string;
begin
  Result := IntToStr(FTotalEnds){ + '/' + FloatToStr(FDentsPerCm)};
end;

procedure TODReedJob.SetUpperCaption;
begin
  inherited UpperCaption := IntToStr(JobNo) + ': Reed ' + Descr;
end;

procedure TODReedJob.SetTotalEnds(Value: Integer);
begin
  FTotalEnds := Value;
  SetUpperCaption;
end;

procedure TODReedJob.SetDentsPerCm(Value: Single);
begin
  FDentsPerCm := Value;
  SetUpperCaption;
end;

// TODDowntimeJob

constructor TODDowntimeJob.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Color := clPurple;
  Font.Style := [];
end;

function TODDowntimeJob.GetUpperCaption: string;
begin
  Result := inherited UpperCaption;
end;

procedure TODDowntimeJob.SetUpperCaption;
begin
  inherited UpperCaption := IntToStr(JobNo) + ': ' + Descr;
end;

procedure TODDowntimeJob.SetDescr(const Value: string);
begin
  FDescr := Value;
  SetUpperCaption;
end;

end.
