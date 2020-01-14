unit Vbmodal;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids, Buttons, Menus,
  {ODDBFind,} ExtCtrls, ODPopCal;

type
  TSearchMethod = (smLocalFilter, smSQLFilter, smManualSearch);  //JT150798

  TVBPickDlgForm = class(TForm)
    DataSource: TDataSource;
    SelectQuery: TQuery;
    Panel1: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    Panel2: TPanel;
    SelectDBGrid: TDBGrid;
    Panel3: TPanel;
    Search: TLabel;
    FieldNameLabel: TLabel;
    EditSearchValue: TEdit;
    SearchSpdBtn: TSpeedButton;
    Label2: TLabel;
    calDatesAfter: TODPopupCalendar;
    procedure EditSearchValueChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SearchSpdBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SelectDBGridDblClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure EditSearchValueEnter(Sender: TObject);
    procedure EditSearchValueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FilterLHS:string[40];
    FilterType:smallint; {0 for string, 1 for integer}
    FilterIndex: Integer;  //JT150798 the index of the search filter line in SelectQuery.SQL
    FilterPrefix: string;  //JT150798 'where' or 'and'
    SearchMethod: TSearchMethod; //JT150798
    procedure ResetQueries;
    function GetVBStru : string;
    function GetVBCol : string;
    function GetVBFin : string;
    function GetWarpNo : integer;
    {function GetPieceNo : integer;
    function GetStripNo : integer;}
    function GetRollNo : integer;
    function GetBoxNo : integer;  //JT050898
    function GetSeqNo : integer;  //JT050898
    function GetWarpType : string;
{    function GetWarpTwist : string;}
    function GetWarpCol : string;
    function GetWeftStru : string;
    function GetWeftTwist : string;
    function GetWeftCol : string;
    {function GetLotNo : longint;
    function GetWarpLotNo1 : integer;
    function GetWarpLotNo2 : integer;
    function GetWeftLotNo1 : integer;
    function GetWeftLotNo2 : integer;}
    function GetSupRef : string;
    function GetVBDespHdrDespNo : integer;
    function GetVBDespHdrDateDespNo : integer;
    function GetVBTypeLabelStru : string;
    function GetWCWarpType : string;
    function GetWCWarpCol : string;
    function GetWCWarp1Ends : integer; //added DL270100
    function GetWorWLotNo1 : integer;
    function GetWorWLotNo2 : integer;
    function GetWorWSingleMultiple : string;
    function GetFLNWeftLotNo1:integer;
    function GetFLNWeftLotNo2:integer;
    function GetFLNWeftSingleMultiple : string;
    function GetFLNLotNo:longint;
    function GetVBWarpStru : string;
    function GetVBWarpCol : string;
    function GetLoomRef : string;
    function GetVTOrderNo : integer;
    function GetRefabricBoxNo : integer;
  public
    { Public declarations }
    property VBStru : string read GetVBStru;
    property VBCol : string read GetVBCol;
    property VBFin : string read GetVBFin;
    property WarpNo : integer read GetWarpNo;
    {property PieceNo : integer read GetPieceNo;
    property StripNo : integer read GetStripNo;}
    property RollNo : integer read GetRollNo;
    property BoxNo : integer read GetBoxNo;  //JT050898
    property SeqNo : integer read GetSeqNo;  //JT050898
    property WarpType : string read GetWarpType;
{    property WarpTwist : string read GetWarpTwist;}
    property WarpCol : string read GetWarpCol;
    property WeftStru : string read GetWeftStru;
    property WeftTwist : string read GetWeftTwist;
    property WeftCol : string read GetWeftCol;
    {property LotNo : longint read GetLotNo;
    property WarpLotNo1 : integer read GetWarpLotNo1;
    property WarpLotNo2 : integer read GetWarpLotNo2;
    property WeftLotNo1 : integer read GetWeftLotNo1;
    property WeftLotNo2 : integer read GetWeftLotNo2;}
    property SupRef : string read GetSupRef;
    property VBDespHdrDespNo : integer read GetVBDespHdrDespNo;
    property VBDespHdrDateDespNo : integer read GetVBDespHdrDateDespNo;
    property LabelStru : string read GetVBTypeLabelStru;
    property WCWarpType : string read GetWCWarpType;
    property WCWarpCol : string read GetWCWarpCol;
    property WCWarp1Ends : integer read GetWCWarp1Ends; //added DL270100
    property WorWLotNo1 : integer read GetWorWLotNo1;
    property WorWLotNo2 : integer read GetWorWLotNo2;
    property WorWSingleMultiple : string read GetWorWSingleMultiple;
    property FLNWeftLotNo1:integer read GetFLNWeftLotNo1;
    property FLNWeftLotNo2:integer read GetFLNWeftLotNo2;
    property FLNWeftSingleMultiple:string read GetFLNWeftSingleMultiple;
    property FLNLotNo:longint read GetFLNLotNo;
    property VBWarpStru : string read GetVBWarpStru;
    property VBWarpCol : string read GetVBWarpCol;
    property LoomRef : string read GetLoomRef;
    property VTOrderNo : integer read GetVTOrderNo;
    property RefabricBoxNo : integer read GetRefabricBoxNo;
    function ShowModalVBType: Integer;
    function ShowModalVBRoll: Integer;
    {function ShowModalVBLotNo(VBStru,VBCol:string): Integer;}
    {function ShowModalVBAllLotNo: Integer;}
    function ShowModalSups(SCType:string): Integer;
    function ShowModalVBDesp : Integer;
    function ShowModalVBDespByDate : Integer;
    function ShowModalWarpCol : integer;
    function ShowModalWorWLotNo(W1YnCol:string) : integer;
    function ShowModalVBWarpType(WarpType:string): Integer;
    function ShowModalFabricLotNo(VBStru:string;
      VBCol:string;WarpLotNo1:integer;WarpLotNo2:integer;
      WarpSingleMultiple:string):integer;
    function ShowModalLoomRef(WarpType:string):integer;
    function ShowModalWarpRcpt:integer;
    function ShowModalDespatches(vtordno:integer;
      vbstru:string;vbcol:string;metricwidth:integer;daterqd:TDateTime):integer;
    function ShowModalVTOrderNo(searchtype:integer):integer;
    function ShowModalVTOrderNoEnq(const VBStru,VBCol,VBFin:string;Strips:integer):integer;
    function ShowModalVTOrderNoNoFin(const VBStru,VBCol:string;Strips:integer):integer; //added DL110607
    function ShowModalVTOrderNoEnqTotals(const VBStru,VBCol,VBFin:string;Strips:integer):integer; //added DL151199
    function ShowModalVTOrderNoTotalsNoFin(const VBStru,VBCol:string;Strips:integer):integer; //added DL110607
    function ShowModalVBBox: Integer;  //JT050898
    function ShowModalVTStockEnq(const VBStru,VBCol,VBFin:string;Strips:integer):integer; //DL030599
    function ShowModalVTStockNoFin(const VBStru,VBCol:string;Strips:integer):integer; //DL110607
    function ShowModalRefabrickedBoxes:integer; //added DL040306
    function ShowModalRefabricWIP:integer; //added DL040306
  end;

var
  VBPickDlgForm: TVBPickDlgForm;

implementation

{$R *.DFM}

function TVBPickDlgForm.GetVBStru : string;
begin
{  Result := VBTypeQueryVBStru.Value;}
  Result := SelectQuery.Fields[0].AsString; {VBTypeQueryVBStru}
end;

function TVBPickDlgForm.GetVBCol : string;
begin
{  Result := VBTypeQueryVBCol.Value;}
  Result := SelectQuery.Fields[1].AsString; {VBTypeQueryVBCol}
end;

function TVBPickDlgForm.GetVBFin : string;
begin
  Result := SelectQuery.Fields[2].AsString; {VBTypeQueryVBFin}
end;

function TVBPickDlgForm.GetWarpNo : integer;
begin
{  Result := WarpRcptQueryWarpNo.Value;}
  Result := SelectQuery.Fields[0].AsInteger; {Warp No}
end;

{function TPickDlgForm.GetPieceNo : integer;
begin
  Result := VBRollQueryPieceNo.Value;
end;

function TPickDlgForm.GetStripNo : integer;
begin
  Result := VBRollQueryStripNo.Value;
end;}

function TVBPickDlgForm.GetRollNo : integer;
begin
{  Result := VBRollQueryRollNo.Value;}
  Result := SelectQuery.Fields[10].AsInteger; {VBRollQueryRollNo}
end;

function TVBPickDlgForm.GetBoxNo : integer;  //JT050898
begin
  Result := SelectQuery.FieldByName('BoxNo').AsInteger; {VBRcptBoxNo}
end;

function TVBPickDlgForm.GetSeqNo : integer;  //JT050898
begin
  Result := SelectQuery.FieldByName('SeqNo').AsInteger; {VBRRcptSeqNo}
end;

function TVBPickDlgForm.GetWarpType : string;
begin
{  Result := VBTypeQueryWarpType.Value;}
  Result := SelectQuery.Fields[11].AsString; {VBTypeQueryWarpType}
end;

{function TPickDlgForm.GetWarpTwist : string;
begin
  Result := VBTypeQueryWarpTwist.Value;
end;}

function TVBPickDlgForm.GetWarpCol : string;
begin
{  Result := VBTypeQueryWarpCol.Value;}
  Result := SelectQuery.Fields[4].AsString; {VBTypeQueryWarpCol}
end;

function TVBPickDlgForm.GetWeftStru : string;
begin
{  Result := VBTypeQueryWeftStru.Value;}
  Result := SelectQuery.Fields[5].AsString; {VBTypeQueryWeftStru}
end;

function TVBPickDlgForm.GetWeftTwist : string;
begin
{  Result := VBTypeQueryWeftTwist.Value;}
  Result := SelectQuery.Fields[6].AsString; {VBTypeQueryWeftTwist}
end;

function TVBPickDlgForm.GetWeftCol : string;
begin
{  Result := VBTypeQueryWeftCol.Value;}
  Result := SelectQuery.Fields[7].AsString; {VBTypeQueryWeftCol}
end;

{function TPickDlgForm.GetLotNo : longint;
begin
  Result := VBLotNoQueryLotNo.Value;
end;}

{function TPickDlgForm.GetWarpLotNo1 : integer;
begin
  Result := VBAllLotNoQueryWarpLotNo1.Value;
end;}

{function TPickDlgForm.GetWarpLotNo2 : integer;
begin
  Result := VBAllLotNoQueryWarpLotNo2.Value;
end;}

{function TPickDlgForm.GetWeftLotNo1 : integer;
begin
  Result := VBAllLotNoQueryWeftLotNo1.Value;
end;}

{function TPickDlgForm.GetWeftLotNo2 : integer;
begin
  Result := VBAllLotNoQueryWeftLotNo2.Value;
end;}

function TVBPickDlgForm.GetSupRef : string;
begin
{  Result := SupplierQuerySUPREF.Value;}
  Result := SelectQuery.Fields[0].AsString; {SupplierQuerySUPREF}
end;

function TVBPickDlgForm.GetVBDespHdrDespNo : integer;
begin
  Result := SelectQuery.Fields[0].AsInteger; {VBDespQueryDespNo}
end;

function TVBPickDlgForm.GetVBDespHdrDateDespNo : integer;
begin
  Result := SelectQuery.Fields[2].AsInteger; {VBDespQueryDespNo}
end;

function TVBPickDlgForm.GetVBTypeLabelStru : string;
begin
{  Result := VBTypeQueryLabelStru.Value;}
  Result := SelectQuery.Fields[8].AsString; {VBTypeQueryLabelStru}
end;

function TVBPickDlgForm.GetWCWarpType : string;
begin
{  Result := WarpColQueryWarpType.Value;}
  Result := SelectQuery.Fields[0].AsString; {WarpColQueryWarpType}
end;

function TVBPickDlgForm.GetWCWarpCol : string;
begin
{  Result := WarpColQueryWarpCol.Value;}
  Result := SelectQuery.Fields[1].AsString; {WarpColQueryWarpCol}
end;

//added GetWCWarp1Ends DL270100
function TVBPickDlgForm.GetWCWarp1Ends : integer;
begin
  Result := SelectQuery.Fields[5].AsInteger; {WarpColQueryWarp1Ends}
end;

function TVBPickDlgForm.GetWorWLotNo1 : integer;
begin
{  Result := WorWLotNoQueryLotNoRef1.Value;}
  Result := SelectQuery.Fields[3].AsInteger; {WorWLotNoQueryLotNoRef1}
end;

function TVBPickDlgForm.GetWorWLotNo2 : integer;
begin
{  Result := WorWLotNoQueryLotNoRef2.Value;}
  Result := SelectQuery.Fields[4].AsInteger; {WorWLotNoQueryLotNoRef2}
end;

function TVBPickDlgForm.GetWorWSingleMultiple : string;
begin
{  Result := WorWLotNoQuerySingleMultiple.Value;}
  Result := SelectQuery.Fields[5].AsString; {WorWLotNoQuerySingleMultiple}
end;

function TVBPickDlgForm.GetVBWarpStru : string;
begin
{  Result := VBWarpTypeQueryVBStru.Value;}
  Result := SelectQuery.Fields[0].AsString; {VBWarpTypeQueryVBStru}
end;

function TVBPickDlgForm.GetVBWarpCol : string;
begin
{  Result := VBWarpTypeQueryVBCol.Value;}
  Result := SelectQuery.Fields[1].AsString; {VBWarpTypeQueryVBCol}
end;

function TVBPickDlgForm.GetFLNWeftLotNo1 : integer;
begin
{  Result := FabricLotNoQueryWeftLotNo1.Value;}
  Result := SelectQuery.Fields[2].AsInteger; {FabricLotNoQueryWeftLotNo1}
end;

function TVBPickDlgForm.GetFLNWeftLotNo2 : integer;
begin
{  Result := FabricLotNoQueryWeftLotNo2.Value;}
  Result := SelectQuery.Fields[3].AsInteger; {FabricLotNoQueryWeftLotNo2}
end;

function TVBPickDlgForm.GetFLNWeftSingleMultiple : string;
begin
{  Result := FabricLotNoQueryWeftSingleMultiple.Value;}
  Result := SelectQuery.Fields[4].AsString; {FabricLotNoQueryWeftSingleMultiple}
end;

function TVBPickDlgForm.GetFLNLotNo : longint;
begin
{  Result := FabricLotNoQueryLotNo.Value;}
  Result := SelectQuery.Fields[5].Value; {FabricLotNoQueryLotNo}
end;

function TVBPickDlgForm.GetLoomRef : string;
begin
{  Result := LoomRefQueryLoomRef.Value;}
  Result := SelectQuery.Fields[0].AsString; {LoomRefQueryLoomRef}
end;

function TVBPickDlgForm.GetVTOrderNo : integer;
begin
  Result := SelectQuery.Fields[0].AsInteger; {VBOrdHdrVTOrdNo}
end;

function TVBPickDlgForm.GetRefabricBoxNo : integer;
begin
  //method added DL040306
  Result := SelectQuery.Fields[0].AsInteger;
end;

procedure TVBPickDlgForm.ResetQueries;
begin
{  VBLotNoQuery.Close;
  VBAllLotNoQuery.Close;}

{  FabricLotNoQuery.Close;}
{  VBWarpTypeQuery.Close;}

  SelectDBGrid.Columns.RestoreDefaults;
  DataSource.DataSet := SelectQuery;
  SelectQuery.Close;
  SelectQuery.SQL.Clear;
  SelectQuery.Filtered:=false;
  SelectQuery.Filter:='';
  EditSearchValue.Text:='';
end;

function TVBPickDlgForm.ShowModalVBType: Integer;
begin
  SearchMethod := smSQLFilter;  //JT150798  the search method used
  ResetQueries;
  FilterType:=0; {string}
  FilterLHS:='vbstru>=';
  FieldNameLabel.Caption:='Structure';
  Caption := 'Select a VB Type';
  SelectQuery.SQL.Add('select vbtype.vbstru,vbtype.vbcol,vbtype.vbfin,warptype.warp1stru,');
  SelectQuery.SQL.Add('warptype.warp1twist,vbtype.warpcol,');
  SelectQuery.SQL.Add('vbtype.weftstru,vbtype.wefttwist,vbtype.weftcol,');
  SelectQuery.SQL.Add('vbtypeclient.labelstru,vbtype.warptype,vbtypeclient.styledescr,vbtypeclient.colordescr');
  SelectQuery.SQL.Add('from vbtype,warptype,vbtypeclient');
  SelectQuery.SQL.Add('where vbtype.warptype=warptype.warptype');
  SelectQuery.SQL.Add('and vbtype.vbstru=vbtypeclient.vbstru');
  SelectQuery.SQL.Add('and vbtype.vbcol=vbtypeclient.vbcol');
  SelectQuery.SQL.Add('and vbtype.vbfin=vbtypeclient.vbfin');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by vbtype.vbstru,vbtype.vbcol,vbtype.vbfin');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Structure';
  SelectQuery.Fields[0].DisplayWidth:=5;
  SelectQuery.Fields[1].DisplayLabel:='Colour';
  SelectQuery.Fields[1].DisplayWidth:=3;
  SelectQuery.Fields[2].DisplayLabel:='Fin';
  SelectQuery.Fields[2].DisplayWidth:=3;
  SelectQuery.Fields[3].DisplayLabel:='Warp Stru';
  SelectQuery.Fields[3].DisplayWidth:=9;
  SelectQuery.Fields[4].DisplayLabel:='Twist';
  SelectQuery.Fields[4].DisplayWidth:=5;
  SelectQuery.Fields[5].DisplayLabel:='Col';
  SelectQuery.Fields[5].DisplayWidth:=5;
  SelectQuery.Fields[6].DisplayLabel:='Weft Stru';
  SelectQuery.Fields[6].DisplayWidth:=9;
  SelectQuery.Fields[7].DisplayLabel:='Twist';
  SelectQuery.Fields[7].DisplayWidth:=5;
  SelectQuery.Fields[8].DisplayLabel:='Col';
  SelectQuery.Fields[8].DisplayWidth:=5;
  SelectQuery.Fields[9].DisplayLabel:='LabelStru';
  SelectQuery.Fields[9].DisplayWidth:=2;
  SelectQuery.Fields[9].Visible:=false;
  SelectQuery.Fields[10].DisplayLabel:='Warp';
  SelectQuery.Fields[10].DisplayWidth:=4;
  SelectQuery.Fields[11].DisplayLabel:='Style';
  SelectQuery.Fields[11].DisplayWidth:=8;
  SelectQuery.Fields[12].DisplayLabel:='Colour';
  SelectQuery.Fields[12].DisplayWidth:=11;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalVBRoll: Integer;
begin
  SearchMethod := smSQLFilter;  //JT150798  the search method used
{  ResetQueries;
  DataSource.DataSet := VBRollQuery;
  VBRollQuery.Open;
  Caption := 'Select a VB Roll';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=1; {integer}
  FilterLHS:='boxno>=';
  FieldNameLabel.Caption:='Carton No.';
  Caption := 'Select a VB Roll';
  SelectQuery.SQL.Add('select boxno,lotno,warpno,pieceno,stripno,');
  SelectQuery.SQL.Add('vbstru,vbcol,vbfin,qlty,grosslength,rollno');
  SelectQuery.SQL.Add('from vbrcpt');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'where';
  SelectQuery.SQL.Add('order by boxno,warpno,pieceno,stripno');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Carton';
  SelectQuery.Fields[0].DisplayWidth:=5;
  SelectQuery.Fields[1].DisplayLabel:='Lot No';
  SelectQuery.Fields[1].DisplayWidth:=7;
  SelectQuery.Fields[2].DisplayLabel:='Warp';
  SelectQuery.Fields[2].DisplayWidth:=4;
  SelectQuery.Fields[3].DisplayLabel:='Piece';
  SelectQuery.Fields[3].DisplayWidth:=4;
  SelectQuery.Fields[4].DisplayLabel:='Strip';
  SelectQuery.Fields[4].DisplayWidth:=4;
  SelectQuery.Fields[5].DisplayLabel:='Struc';
  SelectQuery.Fields[5].DisplayWidth:=5;
  SelectQuery.Fields[6].DisplayLabel:='Col';
  SelectQuery.Fields[6].DisplayWidth:=4;
  SelectQuery.Fields[7].DisplayLabel:='Col';
  SelectQuery.Fields[7].DisplayWidth:=4;
  SelectQuery.Fields[8].DisplayLabel:='Qlty';
  SelectQuery.Fields[8].DisplayWidth:=4;
  SelectQuery.Fields[9].DisplayLabel:='Gross (m)';
  SelectQuery.Fields[9].DisplayWidth:=7;
  SelectQuery.Fields[10].Visible:=false;
  Result := ShowModal;
end;

{function TPickDlgForm.ShowModalVBLotNo(VBStru,VBCol:string): Integer;
begin
  ResetQueries;
  DataSource.DataSet := VBLotNoQuery;
  VBLotNoQuery.Params[0].AsString:=VBStru;
  VBLotNoQuery.Params[1].AsString:=VBCol;
  VBLotNoQuery.Open;
  Caption := 'Select a Lot Number for '+
    VBStru+VBCol;
  Result := ShowModal;
end;}

{function TPickDlgForm.ShowModalVBAllLotNo: Integer;
begin
  ResetQueries;
  DataSource.DataSet := VBAllLotNoQuery;
  VBAllLotNoQuery.Open;
  Caption := 'Select a Lot Number';
  Result := ShowModal;
end;}

function TVBPickDlgForm.ShowModalSups(SCType:string): Integer;
{SCType is CU for Customer and SU for supplier}
begin
  SearchMethod := smSQLFilter;  //JT150798  the search method used
{  ResetQueries;
  DataSource.DataSet := SupplierQuery;
  SupplierQuery.Params[0].AsString:=SCType;
  SupplierQuery.Active:=true;
  if SCType='SU' then
    Caption := 'Select a supplier'
  else
    Caption := 'Select a customer';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
  FilterLHS:='supref>=';
  if SCType='SU' then
  begin
    Caption := 'Select a supplier';
    FieldNameLabel.Caption:='Supplier Ref';
  end
  else
  begin
    Caption := 'Select a customer';
    FieldNameLabel.Caption:='Customer Ref';
  end;
  SelectQuery.SQL.Add('select supref,supdescr');
  SelectQuery.SQL.Add('from supplier');
  SelectQuery.SQL.Add('where sctype=:sctype');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by supref');
  SelectQuery.Prepare;
  SelectQuery.Params[0].AsString:=SCType;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Reference';
  SelectQuery.Fields[0].DisplayWidth:=8;
  SelectQuery.Fields[1].DisplayLabel:='Description';
  SelectQuery.Fields[1].DisplayWidth:=40;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalVBDesp: Integer;
begin
  SearchMethod := smSQLFilter;  //JT150798  the search method used
  ResetQueries;
  FilterType:=1; {integer}
  FilterLHS:='despno>=';
  FieldNameLabel.Caption:='Despatch No.';
  Caption := 'Vertical Blind (VB) Despatches';
  SelectQuery.SQL.Add('select despno,custref,despdate,waybillno,netlengthdesp');
  SelectQuery.SQL.Add('from vbdesphdr');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'where';
  SelectQuery.SQL.Add('order by despno');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Desp No.';
  SelectQuery.Fields[0].DisplayWidth:=8;
{  SelectQuery.Fields[0].DisplayWidth:=10; {format}
  SelectQuery.Fields[1].DisplayLabel:='Cust Ref';
  SelectQuery.Fields[1].DisplayWidth:=8;
  SelectQuery.Fields[2].DisplayLabel:='Desp. Date';
  SelectQuery.Fields[2].DisplayWidth:=10;
  SelectQuery.Fields[3].DisplayLabel:='Waybill';
  SelectQuery.Fields[3].DisplayWidth:=10;
  SelectQuery.Fields[4].DisplayLabel:='Net Length';
  SelectQuery.Fields[4].DisplayWidth:=5; {+format}
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalVBDespByDate: Integer;
begin
  SearchMethod := smSQLFilter;  //JT150798  the search method used
  ResetQueries;
  FilterType:=2; {date}
  FilterLHS:='despdate>=';
  FieldNameLabel.Caption:='Despatch date';
  Caption := 'Vertical Blind (VB) Despatches';
  SelectQuery.SQL.Add('select despdate,custref,despno,waybillno,netlengthdesp');
  SelectQuery.SQL.Add('from vbdesphdr');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'where';
  SelectQuery.SQL.Add('order by despdate,custref,waybillno');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Desp. Date';
  SelectQuery.Fields[0].DisplayWidth:=10;
  SelectQuery.Fields[1].DisplayLabel:='Cust Ref';
  SelectQuery.Fields[1].DisplayWidth:=8;
  SelectQuery.Fields[2].DisplayLabel:='Desp No.';
  SelectQuery.Fields[2].DisplayWidth:=8;
  SelectQuery.Fields[3].DisplayLabel:='Waybill';
  SelectQuery.Fields[3].DisplayWidth:=10;
  SelectQuery.Fields[4].DisplayLabel:='Net Length';
  SelectQuery.Fields[4].DisplayWidth:=5; {+format}
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalWarpCol: Integer;
begin
  SearchMethod := smSQLFilter;  //JT150798  the search method used
{  ResetQueries;
  DataSource.DataSet := WarpColQuery;
  WarpColQuery.Active:=true;
  Caption := 'Select a Warp Colour';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
  FilterLHS:='warptype>=';
  FieldNameLabel.Caption:='Warp Type';
  Caption := 'Select a Warp Colour';
  SelectQuery.SQL.Add('select wc.warptype,wc.warpcol,wc.ynstru1,');
  SelectQuery.SQL.Add('  wc.yntwist1,wc.yncol1,wt.warp1ends'); //added warptype DL270100
  SelectQuery.SQL.Add('from warpcol wc,warptype wt'); //added warptype DL270100
  SelectQuery.SQL.Add('where wc.warptype=wt.warptype'); //added DL 270100
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and'; //was where DL270100 - changed bec. where clause added above
  SelectQuery.SQL.Add('order by wc.warptype,wc.warpcol');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Type';
  SelectQuery.Fields[0].DisplayWidth:=5;
  SelectQuery.Fields[1].DisplayLabel:='Colour';
  SelectQuery.Fields[1].DisplayWidth:=6;
  SelectQuery.Fields[2].DisplayLabel:='YnStru1';
  SelectQuery.Fields[2].DisplayWidth:=6;
  SelectQuery.Fields[3].DisplayLabel:='YnTwist1';
  SelectQuery.Fields[3].DisplayWidth:=6;
  SelectQuery.Fields[4].DisplayLabel:='YnCol1';
  SelectQuery.Fields[4].DisplayWidth:=6;
  SelectQuery.Fields[5].DisplayLabel:='Warp1Ends';
  SelectQuery.Fields[5].DisplayWidth:=10;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalWorWLotNo(W1YnCol:string): Integer;
begin
  SearchMethod := smSQLFilter;  //JT150798  the search method used
{  ResetQueries;
  DataSource.DataSet := WorWLotNoQuery;
  WorWLotNoQuery.Params[0].AsString:=W1YnCol;
  WorWLotNoQuery.Active:=true;
  Caption := 'Select a Warp (WorW) Colour';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=1; {integer}
  FilterLHS:='w1lotno1>=';
  FieldNameLabel.Caption:='Structure';
  Caption := 'Select a Warp (WorW) Colour';
  SelectQuery.SQL.Add('select w1lotno1,w1lotno2,w1yncol,');
  SelectQuery.SQL.Add('lotnoref1,lotnoref2,singlemultiple');
  SelectQuery.SQL.Add('from worwlotno');
  SelectQuery.SQL.Add('where w1yncol=:w1yncol');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by w1lotno1,w1lotno2,w1yncol');
  SelectQuery.Prepare;
  SelectQuery.Params[0].AsString:=W1YnCol;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='W1Lot';
  SelectQuery.Fields[0].DisplayWidth:=5;
  SelectQuery.Fields[1].DisplayLabel:='No';
  SelectQuery.Fields[1].DisplayWidth:=3;
  SelectQuery.Fields[2].DisplayLabel:='YnCol';
  SelectQuery.Fields[2].DisplayWidth:=3;
  SelectQuery.Fields[3].DisplayLabel:='LotNo1';
  SelectQuery.Fields[3].DisplayWidth:=5;
  SelectQuery.Fields[4].DisplayLabel:='LotNo2';
  SelectQuery.Fields[4].DisplayWidth:=5;
  SelectQuery.Fields[5].DisplayLabel:='SingleMultiple';
  SelectQuery.Fields[5].DisplayWidth:=10;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalVBWarpType(WarpType:string): Integer;
begin
  SearchMethod := smSQLFilter;  //JT150798  the search method used
{  ResetQueries;
  DataSource.DataSet := VBWarpTypeQuery;
  VBWarpTypeQuery.Params[0].AsString:=WarpType;
  VBWarpTypeQuery.Active:=true;
  Caption := 'Select a VB Type (for the current warp type)';
  Result := ShowModal;}
  ResetQueries;
  FilterLHS:='vbstru>=';
  FilterType:=0; {string}
  FieldNameLabel.Caption:='VB Structure';
  Caption := 'Select a VB Type (for the current warp type)';
  SelectQuery.SQL.Add('select distinct vbtype.vbstru,vbtype.vbcol,warptype.warp1stru,');
  SelectQuery.SQL.Add('warptype.warp1twist,vbtype.warpcol,');
  SelectQuery.SQL.Add('vbtype.weftstru,vbtype.wefttwist,vbtype.weftcol,vbtypeclient.labelstru');
  SelectQuery.SQL.Add('from vbtype,warptype,vbtypeclient');
  SelectQuery.SQL.Add('where warptype.warptype=vbtype.warptype');
  SelectQuery.SQL.Add('and warptype.warptype=:warptype');
  SelectQuery.SQL.Add('and vbtype.vbstru=vbtypeclient.vbstru');
  SelectQuery.SQL.Add('and vbtype.vbcol=vbtypeclient.vbcol');
  SelectQuery.SQL.Add('and vbtype.vbfin=vbtypeclient.vbfin');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by vbtype.vbstru,vbtype.vbcol');
  SelectQuery.Prepare;
  SelectQuery.Params[0].AsString:=WarpType;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Structure';
  SelectQuery.Fields[0].DisplayWidth:=5;
  SelectQuery.Fields[1].DisplayLabel:='Colour';
  SelectQuery.Fields[1].DisplayWidth:=3;
  SelectQuery.Fields[2].DisplayLabel:='WpStru';
  SelectQuery.Fields[2].DisplayWidth:=9;
  SelectQuery.Fields[3].DisplayLabel:='Twist';
  SelectQuery.Fields[3].DisplayWidth:=5;
  SelectQuery.Fields[4].DisplayLabel:='Col';
  SelectQuery.Fields[4].DisplayWidth:=5;
  SelectQuery.Fields[5].DisplayLabel:='WtStru';
  SelectQuery.Fields[5].DisplayWidth:=9;
  SelectQuery.Fields[6].DisplayLabel:='Twist';
  SelectQuery.Fields[6].DisplayWidth:=5;
  SelectQuery.Fields[7].DisplayLabel:='Col';
  SelectQuery.Fields[7].DisplayWidth:=5;
  SelectQuery.Fields[8].DisplayLabel:='LabelStru';
  SelectQuery.Fields[8].DisplayWidth:=2;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalFabricLotNo(VBStru:string;
  VBCol:string;WarpLotNo1:integer;WarpLotNo2:integer;
  WarpSingleMultiple:string):integer;
begin
  SearchMethod := smSQLFilter;  //JT150798  the search method used
{  ResetQueries;
  DataSource.DataSet := FabricLotNoQuery;
  FabricLotNoQuery.Params[0].AsString:=VBStru;
  FabricLotNoQuery.Params[1].AsString:=VBCol;
  FabricLotNoQuery.Params[2].AsInteger:=WarpLotNo1;
  FabricLotNoQuery.Params[3].AsInteger:=WarpLotNo2;
  FabricLotNoQuery.Params[4].AsString:=WarpSingleMultiple;
  FabricLotNoQuery.Active:=true;
  Caption := 'Select a Fabric Lot No';
  Result := ShowModal;}
{  FabricLotNoQuery.Params[5].AsString:=WarpCol;
  FabricLotNoQuery.Params[6].AsString:=WeftCol;}
  ResetQueries;
  FilterLHS:='vbstru>=';
  FilterType:=0; {string}
  FieldNameLabel.Caption:='VB Structure';
  Caption := 'Select a Fabric Lot No';
  SelectQuery.SQL.Add('select vbstru,vbcol,weftlotno1,weftlotno2,weftsinglemultiple,lotno');
  SelectQuery.SQL.Add('from fabriclotno');
  SelectQuery.SQL.Add('where vbstru=:vbstru');
  SelectQuery.SQL.Add('and vbcol=:vbcol');
  SelectQuery.SQL.Add('and warplotno1=:warplotno1');
  SelectQuery.SQL.Add('and warplotno2=:warplotno2');
  SelectQuery.SQL.Add('and warpsinglemultiple=:warpsinglemultiple');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.Prepare;
  SelectQuery.Params[0].AsString:=VBStru;
  SelectQuery.Params[1].AsString:=VBCol;
  SelectQuery.Params[2].AsInteger:=WarpLotNo1;
  SelectQuery.Params[3].AsInteger:=WarpLotNo2;
  SelectQuery.Params[4].AsString:=WarpSingleMultiple;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Struc';
  SelectQuery.Fields[0].DisplayWidth:=5;
  SelectQuery.Fields[1].DisplayLabel:='Colour';
  SelectQuery.Fields[1].DisplayWidth:=5;
  SelectQuery.Fields[2].DisplayLabel:='Wt Lot No1';
  SelectQuery.Fields[2].DisplayWidth:=6;
  SelectQuery.Fields[3].DisplayLabel:='Wt Lot No2';
  SelectQuery.Fields[3].DisplayWidth:=6;
  SelectQuery.Fields[4].DisplayLabel:='Wt SM';
  SelectQuery.Fields[4].DisplayWidth:=6;
  SelectQuery.Fields[5].DisplayLabel:='Fabric Lot No';
  SelectQuery.Fields[5].DisplayWidth:=10;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalLoomRef(WarpType:string):integer;
begin
  SearchMethod := smSQLFilter;  //JT150798  the search method used
{  ResetQueries;
  DataSource.DataSet := LoomRefQuery;
  LoomRefQuery.Params[0].AsString:=WarpType;
  LoomRefQuery.Active:=true;
  Caption := 'Select a Loom Reference';
  Result := ShowModal;}
  ResetQueries;
  FilterLHS:='loomref>=';
  FilterType:=0; {string}
  FieldNameLabel.Caption:='Loom Ref';
  Caption := 'Select a Loom Reference';
  SelectQuery.SQL.Add('select distinct loomspec.loomref');
  SelectQuery.SQL.Add('from loomspec,struloom,vbstru');
  SelectQuery.SQL.Add('where loomspec.loomtype=struloom.loomtype');
  SelectQuery.SQL.Add('and struloom.vbstru=vbstru.vbstru');
  SelectQuery.SQL.Add('and vbstru.warptype=:warptype');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.Prepare;
  SelectQuery.Params[0].AsString:=WarpType;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Loom Ref';
  SelectQuery.Fields[0].DisplayWidth:=6;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalWarpRcpt:integer;
begin
  SearchMethod := smSQLFilter;  //JT150798  the search method used
  {ResetQueries;
  DataSource.DataSet := WarpRcptQuery;
  WarpRcptQuery.Active:=true;
  Caption := 'Select a Warp Delivery';
  Result := ShowModal;}
  ResetQueries;
  FilterLHS:='WarpNo>=';
  FilterType:=1; {integer}
  FieldNameLabel.Caption:='Warp No';
  Caption := 'Select a Warp Delivery';
  SelectQuery.SQL.Add('select warpno,warplength,warptype,warpcol,warplotno1,warplotno2');
  SelectQuery.SQL.Add('from warprcpt');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'where';
  SelectQuery.SQL.Add('order by warpno');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='No';
  SelectQuery.Fields[0].DisplayWidth:=5;
  SelectQuery.Fields[1].DisplayLabel:='Length';
  SelectQuery.Fields[1].DisplayWidth:=6;
  SelectQuery.Fields[2].DisplayLabel:='Type';
  SelectQuery.Fields[2].DisplayWidth:=5;
  SelectQuery.Fields[3].DisplayLabel:='Colour';
  SelectQuery.Fields[3].DisplayWidth:=6;
  SelectQuery.Fields[4].DisplayLabel:='Wp Lot 1';
  SelectQuery.Fields[4].DisplayWidth:=6;
  SelectQuery.Fields[5].DisplayLabel:='Wp Lot 2';
  SelectQuery.Fields[5].DisplayWidth:=6;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalDespatches(vtordno:integer;
  vbstru:string;vbcol:string;metricwidth:integer;daterqd:TDateTime):integer;
begin
  SearchMethod := smSQLFilter;  //JT150798  the search method used
  {show the deliveries for the current order line}
  ResetQueries;
  FilterLHS:='';
  FilterType:=1; {integer}
  FieldNameLabel.Caption:='None';
  Caption := 'Order Despatch Display';
  SelectQuery.SQL.Add('select vh.despno,vh.custref,');
  SelectQuery.SQL.Add('cast(vh.despdate as character(11)),cast(sum(vr.netlength) as integer),');
  SelectQuery.SQL.Add('vh.waybillno');
  SelectQuery.SQL.Add('from vbdesphdr vh,vbrcpt vr');
  SelectQuery.SQL.Add('where vh.despno=vr.despno');
  SelectQuery.SQL.Add('and vr.vtordno='+inttostr(VTOrdNo));
  SelectQuery.SQL.Add('and vr.vbstru='''+VBStru+'''');
  SelectQuery.SQL.Add('and vr.vbcol='''+VBCol+'''');
  SelectQuery.SQL.Add('and vr.metricwidth='+inttostr(MetricWidth));
  SelectQuery.SQL.Add('and vr.daterqd='''+formatdatetime('dd-mmm-yyyy',DateRqd)+'''');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('group by vh.despno,vh.custref,vh.despdate,vh.waybillno');
  SelectQuery.SQL.Add('order by vh.despno,vh.custref,vh.despdate');
  SelectQuery.Prepare;
  SelectQuery.Open;
{  SelectDBGrid.Columns.Add;}
  SelectQuery.Fields[0].DisplayLabel:='No';
  SelectQuery.Fields[0].DisplayWidth:=5;
  SelectQuery.Fields[1].DisplayLabel:='Cust';
  SelectQuery.Fields[1].DisplayWidth:=8;
  SelectQuery.Fields[2].DisplayLabel:='Date';
  SelectQuery.Fields[2].DisplayWidth:=11;
  SelectQuery.Fields[3].DisplayLabel:='Length';
  SelectQuery.Fields[3].DisplayWidth:=5;
  SelectQuery.Fields[4].DisplayLabel:='WaybillNo';
  SelectQuery.Fields[4].DisplayWidth:=25;
  Result := ShowModal;
end;

procedure TVBPickDlgForm.EditSearchValueChange(Sender: TObject);
begin
  SearchSpdBtn.Enabled := True;
  OKBitBtn.Enabled := false; //added DL060114
end;

procedure TVBPickDlgForm.SearchSpdBtnClick(Sender: TObject);
var
  TempStr: string;
  TempNum: Double;
  TempField: TField;
  ix: Integer;
  TempList: TStrings;
begin
  SearchSpdBtn.Enabled := False;
  Cursor := crSQLWait;
  Update;
  SelectQuery.DisableControls;
  try
    case SearchMethod of
      smLocalFilter:
      begin
        if EditSearchValue.Text='' then
          SelectQuery.Filtered:=false
        else
        begin
          if FilterType=0 then {String}
          begin
            TempStr:=uppercase(EditSearchValue.Text);
            SelectQuery.Filter:=FilterLHS+''''+TempStr+'''';
            SelectQuery.Filtered:=true;
          end
          else
          if FilterType=1 then {integer}
          begin
            SelectQuery.Filter:=FilterLHS+EditSearchValue.Text;
            SelectQuery.Filtered:=true;
          end
          else
          if FilterType=2 then {date}
          begin
            if (length(EditSearchValue.Text)=8) or (length(EditSearchValue.Text)=10) then
            begin
              SelectQuery.Filter:=FilterLHS+''''+
                EditSearchValue.Text+'''';
              SelectQuery.Filtered:=true;
            end;
          end;
        end;
      end;
      smSQLFilter:
      begin
        TempList := TStringList.Create;
        try
          for ix := 0 to SelectQuery.FieldCount-1 do
            with SelectQuery.Fields[ix] do
              TempList.AddObject(DisplayLabel, Pointer(DisplayWidth));
          SelectQuery.Close;
          if EditSearchValue.Text = '' then
            SelectQuery.SQL[FilterIndex] := ''
          else
          begin
            case FilterType of
              0: {string} SelectQuery.SQL[FilterIndex] :=
                FilterPrefix + ' ' + FilterLHS + '''' +
                UpperCase(EditSearchValue.Text) + '''';
              1: {numeric} SelectQuery.SQL[FilterIndex] :=
                FilterPrefix + ' ' + FilterLHS + EditSearchValue.Text;
              2: {date} SelectQuery.SQL[FilterIndex] :=
                  FilterPrefix + ' ' + FilterLHS + ''''+FormatDateTime(
                    'dd-mmm-yyyy', StrToDate(EditSearchValue.Text))+'''';
            end;
          end;
          SelectQuery.Open;
          //next if and else and contents added DL060114
          if SelectQuery.Eof then
            OKBitBtn.Enabled := false
          else
            OKBitBtn.Enabled := true;
          for ix := 0 to SelectQuery.FieldCount-1 do
            if ix > TempList.Count-1 then Break
            else
              with SelectQuery.Fields[ix] do
              begin
                DisplayLabel := TempList[ix];
                DisplayWidth := Longint(TempList.Objects[ix]);
              end;
        finally
          TempList.Free;
        end;
      end;
      smManualSearch:
      begin
        if EditSearchValue.Text <> '' then
        begin
          TempStr := '';
          for ix := 1 to Length(FilterLHS) do      //extract field name
            if FilterLHS[ix] in ['=','<','>'] then
              Break
            else
              TempStr := TempStr + FilterLHS[ix];
          TempField := SelectQuery.FieldByName(TempStr);
          if TempField is TNumericField then
          begin
            TempNum := StrToFloat(EditSearchValue.Text);
            if TempNum < TempField.AsFloat then
              while not SelectQuery.BOF and (TempNum < TempField.AsFloat) do
                SelectQuery.Prior
            else
              while not SelectQuery.EOF and (TempNum > TempField.AsFloat) do
                SelectQuery.Next;
          end
          else
          begin
            TempStr := Uppercase(EditSearchValue.Text);
            if TempStr < TempField.AsString then
              while not SelectQuery.BOF and (TempStr < TempField.AsString) do
                SelectQuery.Prior
            else
              while not SelectQuery.EOF and (TempStr > TempField.AsString) do
                SelectQuery.Next;
          end;
        end;
      end;
    end;
  finally
    SelectQuery.EnableControls;
    Cursor := crDefault;
  end;
end;

procedure TVBPickDlgForm.FormActivate(Sender: TObject);
begin
  EditSearchValue.SetFocus;
  SearchSpdBtn.Enabled := False;
end;

function TVBPickDlgForm.ShowModalVTOrderNo(SearchType:integer):integer;
begin
  ResetQueries;
  SearchMethod := smSQLFilter;  //JT150798  the search method used
  if SearchType=0 then
  begin
    FilterLHS:='VTOrdNo>=';
    FilterType:=1; {integer}
    SelectQuery.SQL.Add('select vtordno,custref,cast(orddate as character(11)),custordno,pricetype');
    SelectQuery.SQL.Add('from vbordhdr');
    FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
    FilterPrefix := 'where';
    SelectQuery.SQL.Add('order by vtordno');
    FieldNameLabel.Caption:='VT Order No';
    Caption := 'Select a Customer''s Order';
  end
  else
  begin
    FilterLHS:='CustOrdNo>=';
    FilterType:=0;
    SelectQuery.SQL.Add('select vtordno,custref,cast(orddate as character(11)),custordno,pricetype');
    SelectQuery.SQL.Add('from vbordhdr');
    FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
    FilterPrefix := 'where';
    SelectQuery.SQL.Add('order by custordno,custref');
    FieldNameLabel.Caption:='Cust Order No';
    Caption := 'Select a Customer''s Order';
  end;
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='VT Order';
  SelectQuery.Fields[0].DisplayWidth:=8;
  SelectQuery.Fields[1].DisplayLabel:='Cust';
  SelectQuery.Fields[1].DisplayWidth:=8;
  SelectQuery.Fields[2].DisplayLabel:='Date';
  SelectQuery.Fields[2].DisplayWidth:=12;
  SelectQuery.Fields[3].DisplayLabel:='CustOrder';
  SelectQuery.Fields[3].DisplayWidth:=10;
  SelectQuery.Fields[4].DisplayLabel:='PriceType';
  SelectQuery.Fields[4].DisplayWidth:=8;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalVTOrderNoEnq(const VBStru,VBCol,VBFin:string;Strips:integer):integer;
begin
  //VBWidth changed to Strips DL030215
  ResetQueries;
  SearchMethod := smSQLFilter;  //JT150798  the search method used
  FilterLHS:='VTOrdNo>=';
  FilterType:=1; {integer}
//  SelectQuery.SQL.Add('select cast(vo.daterqd as character(11)),vh.custref,');
  SelectQuery.SQL.Add('select vh.orderheld,vo.daterqd,vh.custref,');
  SelectQuery.SQL.Add('vo.vtordno,vo.vbstru||vo.vbcol||vo.vbfin,vo.vbwidth,vo.qty-vo.qtydel,');
  SelectQuery.SQL.Add('vo.estdate,vh.orddate,vh.datercvd');
  SelectQuery.SQL.Add('from vborddet vo,vbordhdr vh,vbwidth vw'); //vbwidth added DL030215
  SelectQuery.SQL.Add('where vo.vbstru='''+VBStru+'''');
  SelectQuery.SQL.Add('and vo.vbcol='''+VBCol+'''');
  SelectQuery.SQL.Add('and vo.vbfin='''+VBFin+''''); {DL100198}
  //100 const here for now DL021106 xx
  if Strips=16 then //show 100 as well
    SelectQuery.SQL.Add('and ((vw.strips=16 or vw.strips=20)) ') //for 100 or 127mm
  else
    SelectQuery.SQL.Add('and vw.strips='+inttostr(Strips));
  SelectQuery.SQL.Add('and vo.status<>''C''');
  SelectQuery.SQL.Add('and vo.vtordno=vh.vtordno');
  SelectQuery.SQL.Add('and vo.vbwidth=vw.metricwidth'); //added DL030215
  SelectQuery.SQL.Add('and vw.qlty=''F'''); //added DL030215
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by vo.daterqd,vh.custref,vo.vtordno');
  FieldNameLabel.Caption:='VT Order No';
  Caption := 'Select a Customer''s Order';
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Held';
  SelectQuery.Fields[0].DisplayWidth:=4;
  SelectQuery.Fields[1].DisplayLabel:='Required';
  SelectQuery.Fields[1].DisplayWidth:=8; //11
  SelectQuery.Fields[2].DisplayLabel:='Cust';
  SelectQuery.Fields[2].DisplayWidth:=8;
  SelectQuery.Fields[3].DisplayLabel:='VT Order';
  SelectQuery.Fields[3].DisplayWidth:=8;
  SelectQuery.Fields[4].DisplayLabel:='Type';
  SelectQuery.Fields[4].DisplayWidth:=9; //was 7 DL110901
  SelectQuery.Fields[5].DisplayLabel:='Width';
  SelectQuery.Fields[5].DisplayWidth:=5;
  SelectQuery.Fields[6].DisplayLabel:='Qty Rem';
  SelectQuery.Fields[6].DisplayWidth:=8;
  SelectQuery.Fields[7].DisplayLabel:='Estimated';
  SelectQuery.Fields[7].DisplayWidth:=8; //11
  SelectQuery.Fields[8].DisplayLabel:='Ordered';
  SelectQuery.Fields[8].DisplayWidth:=8; //11
  SelectQuery.Fields[9].DisplayLabel:='Entered';
  SelectQuery.Fields[9].DisplayWidth:=8; //11
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalVTOrderNoEnqTotals(const VBStru,VBCol,VBFin:string;Strips:integer):integer;
begin
  //VBWidth changed to Strips DL030215
  //this function added DL151199
  ResetQueries;
  SearchMethod := smSQLFilter;  //JT150798  the search method used
  FilterLHS:='OrderHeld>=';
  FilterType:=1; {integer}
//  SelectQuery.SQL.Add('select cast(vo.daterqd as character(11)),vh.custref,');
  SelectQuery.SQL.Add('select vh.orderheld,');
  SelectQuery.SQL.Add('vo.vbstru||vo.vbcol||vo.vbfin,vo.vbwidth,sum(vo.qty-vo.qtydel) qtysum');
  SelectQuery.SQL.Add('from vborddet vo,vbordhdr vh,vbwidth vw');
  SelectQuery.SQL.Add('where vo.vbstru='''+VBStru+'''');
  SelectQuery.SQL.Add('and vo.vbcol='''+VBCol+'''');
  SelectQuery.SQL.Add('and vo.vbfin='''+VBFin+''''); {DL100198}
  //100 const here for now DL021106 xx
  if Strips=16 then //show 100 as well
    SelectQuery.SQL.Add('and ((vw.strips=16 or vw.strips=20)) ') //for 100 or 127mm
  else
    SelectQuery.SQL.Add('and vw.strips='+inttostr(Strips));
  SelectQuery.SQL.Add('and vo.status<>''C''');
  SelectQuery.SQL.Add('and vo.vtordno=vh.vtordno');
  SelectQuery.SQL.Add('and vo.vbwidth=vw.metricwidth'); //added DL030215
  SelectQuery.SQL.Add('and vw.qlty=''F'''); //added DL030215
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('group by vh.orderheld,vo.vbstru,vo.vbcol,vo.vbfin,vo.vbwidth');
  SelectQuery.SQL.Add('order by vh.orderheld');
  FieldNameLabel.Caption:='Order Held';
  Caption := 'Select Order Held';
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Held';
  SelectQuery.Fields[0].DisplayWidth:=4;
  SelectQuery.Fields[1].DisplayLabel:='Type';
  SelectQuery.Fields[1].DisplayWidth:=9; //was 7 DL110901
  SelectQuery.Fields[2].DisplayLabel:='Width';
  SelectQuery.Fields[2].DisplayWidth:=5;
  SelectQuery.Fields[3].DisplayLabel:='Total Qty Rem';
  SelectQuery.Fields[3].DisplayWidth:=12;
  Result := ShowModal;
end;

procedure TVBPickDlgForm.FormShow(Sender: TObject);
begin
  SearchSpdBtn.Enabled := False;
  OKBitBtn.Enabled:=false; //added DL060114
  calDatesAfter.DisplayDate:=date; //added DL060114
  calDatesAfter.Clear; //added DL060114
end;

function TVBPickDlgForm.ShowModalVBBox: Integer;  //JT050898
begin
  SearchMethod := smSQLFilter;  //the search method used
  ResetQueries;
  FilterType:=1; {integer}
  FilterLHS:='boxno>=';
  FieldNameLabel.Caption:='Carton No.';
  Caption := 'Select a VB Carton No';
  SelectQuery.SQL.Add('select distinct boxno,seqno,lotno,warpno,pieceno,');
  SelectQuery.SQL.Add('vbstru,vbcol,vbfin,qlty,grosslength');
  SelectQuery.SQL.Add('from vbrcpt');
  FilterIndex := SelectQuery.SQL.Add('');  //provide for search filter
  FilterPrefix := 'where';
  SelectQuery.SQL.Add('order by boxno,seqno,warpno,pieceno');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Carton';
  SelectQuery.Fields[0].DisplayWidth:=5;
  SelectQuery.Fields[1].DisplayLabel:='Seq No';
  SelectQuery.Fields[1].DisplayWidth:=5;
  SelectQuery.Fields[2].DisplayLabel:='Lot No';
  SelectQuery.Fields[2].DisplayWidth:=7;
  SelectQuery.Fields[3].DisplayLabel:='Warp';
  SelectQuery.Fields[3].DisplayWidth:=4;
  SelectQuery.Fields[4].DisplayLabel:='Piece';
  SelectQuery.Fields[4].DisplayWidth:=4;
  SelectQuery.Fields[5].DisplayLabel:='Struc';
  SelectQuery.Fields[5].DisplayWidth:=5;
  SelectQuery.Fields[6].DisplayLabel:='Col';
  SelectQuery.Fields[6].DisplayWidth:=4;
  SelectQuery.Fields[7].DisplayLabel:='Fin';
  SelectQuery.Fields[7].DisplayWidth:=4;
  SelectQuery.Fields[8].DisplayLabel:='Qlty';
  SelectQuery.Fields[8].DisplayWidth:=4;
  SelectQuery.Fields[9].DisplayLabel:='Gross (m)';
  SelectQuery.Fields[9].DisplayWidth:=7;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalVTStockEnq(const VBStru,VBCol,VBFin:string;Strips:integer):integer;
begin
  //RowNo removed DL031016
  ResetQueries;
  SearchMethod := smSQLFilter;  //DL030599  the search method used
  FilterLHS:='qlty>=';
  FilterType:=0; {string}
  SelectQuery.SQL.Add('select vr.vbstru||vr.vbcol||vr.vbfin,vr.metricwidth,');
  SelectQuery.SQL.Add('vr.qlty,vr.qltyreason,0 as boxno,cast(sum(vr.netlength) as integer)');
  SelectQuery.SQL.Add('from vbrcpt vr,vbwidth vw');
  SelectQuery.SQL.Add('where vr.vbstru='''+VBStru+'''');
  SelectQuery.SQL.Add('and vr.vbcol='''+VBCol+'''');
  SelectQuery.SQL.Add('and vr.vbfin='''+VBFin+'''');
  //100 const here for now DL021106 xx
  if Strips=16 then //show 100 as well
    SelectQuery.SQL.Add('and ((vw.strips=16 or vw.strips=20)) ') //for 100 or 127mm
  else
    SelectQuery.SQL.Add('and vw.strips='+inttostr(Strips));
  SelectQuery.SQL.Add('and vr.despdate is null');
  SelectQuery.SQL.Add('and vr.metricwidth=vw.metricwidth'); //added DL030215
  SelectQuery.SQL.Add('and vw.qlty=''F'''); //added DL030215
  FilterIndex := SelectQuery.SQL.Add('');  //provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('group by vr.vbstru,vr.vbcol,vr.vbfin,vr.metricwidth,vr.qlty,vr.qltyreason');
  if strips<>1 then
    SelectQuery.SQL.Add('order by vr.qlty,vr.qltyreason')
  else //added DL031013 union to show box breakdown: especially important for FW
  begin
    SelectQuery.SQL.Add('union');
    SelectQuery.SQL.Add('select vr.vbstru||vr.vbcol||vr.vbfin,vr.metricwidth,');
    SelectQuery.SQL.Add('vr.qlty,vr.qltyreason,vr.boxno,cast(sum(vr.netlength) as integer)');
    SelectQuery.SQL.Add('from vbrcpt vr,vbwidth vw');
    SelectQuery.SQL.Add('where vr.vbstru='''+VBStru+'''');
    SelectQuery.SQL.Add('and vr.vbcol='''+VBCol+'''');
    SelectQuery.SQL.Add('and vr.vbfin='''+VBFin+'''');
    if Strips=16 then
      SelectQuery.SQL.Add('and ((vw.strips=16 or vw.strips=20)) ')
    else
      SelectQuery.SQL.Add('and vw.strips='+inttostr(Strips));
    SelectQuery.SQL.Add('and vr.despdate is null');
    SelectQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
    SelectQuery.SQL.Add('and vw.qlty=''F''');
    SelectQuery.SQL.Add('group by vr.vbstru,vr.vbcol,vr.vbfin,vr.metricwidth,vr.qlty,vr.qltyreason,vr.boxno');
    SelectQuery.SQL.Add('order by 3,4,5'); //added DL031013
  end;
  FieldNameLabel.Caption:='Qlty';
  Caption := 'Select a Qlty';
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Type';
  SelectQuery.Fields[0].DisplayWidth:=10; //was 7 DL110901 - was 9 DL030215
  SelectQuery.Fields[1].DisplayLabel:='Width';
  SelectQuery.Fields[1].DisplayWidth:=5;
  SelectQuery.Fields[2].DisplayLabel:='Qlty';
  SelectQuery.Fields[2].DisplayWidth:=5;
  SelectQuery.Fields[3].DisplayLabel:='Reason';
  SelectQuery.Fields[3].DisplayWidth:=5;
  SelectQuery.Fields[4].DisplayLabel:='Box';
  SelectQuery.Fields[4].DisplayWidth:=8;
  SelectQuery.Fields[5].DisplayLabel:='Net m';
  SelectQuery.Fields[5].DisplayWidth:=8;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalRefabrickedBoxes:integer;
begin
  //method added DL040306
  SearchMethod := smSQLFilter;  //the search method used
  ResetQueries;
  FilterLHS:='BoxNo>=';
  FilterType:=1; {integer}
  FieldNameLabel.Caption:='Box No';
  Caption := 'Select a Refabricked Box';
  SelectQuery.SQL.Add('select origboxno,newboxno,grosslength,netlength');
  SelectQuery.SQL.Add('from vbrefabric');
  FilterIndex := SelectQuery.SQL.Add('');  //provide for search filter
  FilterPrefix := 'where';
  SelectQuery.SQL.Add('order by origboxno,ref');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='OrigBoxNo';
  SelectQuery.Fields[0].DisplayWidth:=10;
  SelectQuery.Fields[1].DisplayLabel:='NewBoxNo';
  SelectQuery.Fields[1].DisplayWidth:=10;
  SelectQuery.Fields[2].DisplayLabel:='Gross Length';
  SelectQuery.Fields[2].DisplayWidth:=10;
  SelectQuery.Fields[3].DisplayLabel:='Net Length';
  SelectQuery.Fields[3].DisplayWidth:=10;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalRefabricWIP:integer;
begin
  //method added DL040306
  SearchMethod := smSQLFilter;  //the search method used
  ResetQueries;
  FilterLHS:='BoxNo>=';
  FilterType:=1; {integer}
  FieldNameLabel.Caption:='Orig Box No';
  Caption := 'Select a Current Refabric Box (Refabric WIP)';
  SelectQuery.SQL.Add('select boxno,cast(sum(grosslength) as integer),cast(sum(netlength) as integer)');
  SelectQuery.SQL.Add('from vbrefabricchanges');
  SelectQuery.SQL.Add('group by boxno');
  FilterIndex := SelectQuery.SQL.Add('');  //provide for search filter
  FilterPrefix := 'where';
  SelectQuery.SQL.Add('order by boxno');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='BoxNo';
  SelectQuery.Fields[0].DisplayWidth:=10;
  SelectQuery.Fields[1].DisplayLabel:='Gross Length';
  SelectQuery.Fields[1].DisplayWidth:=10;
  SelectQuery.Fields[2].DisplayLabel:='Net Length';
  SelectQuery.Fields[2].DisplayWidth:=10;
  Result := ShowModal;
end;

procedure TVBPickDlgForm.SelectDBGridDblClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure TVBPickDlgForm.OKBitBtnClick(Sender: TObject);
begin
  //method added DL060114
  ModalResult := mrOk;  //not required, but here because also called from DoubleClick event
end;

procedure TVBPickDlgForm.EditSearchValueEnter(Sender: TObject);
begin
  //added DL060114
  OKBitBtn.Enabled := false;
end;

procedure TVBPickDlgForm.EditSearchValueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //method added DL060114
  if (key=VK_RETURN) then
    SearchSpdBtnClick(Sender);
end;

function TVBPickDlgForm.ShowModalVTStockNoFin(const VBStru,VBCol:string;Strips:integer):integer;
begin
  //Method added DL110607
  ResetQueries;
  SearchMethod := smSQLFilter;  //DL030599  the search method used
  FilterLHS:='qlty>=';
  FilterType:=0; {string}
  SelectQuery.SQL.Add('select vr.vbstru||vr.vbcol||vr.vbfin,vr.metricwidth,');
  SelectQuery.SQL.Add('vr.qlty,vr.qltyreason,0 as boxno,cast(sum(vr.netlength) as integer)');
  SelectQuery.SQL.Add('from vbrcpt vr,vbwidth vw');
  SelectQuery.SQL.Add('where vr.vbstru='''+VBStru+'''');
  SelectQuery.SQL.Add('and vr.vbcol='''+VBCol+'''');
  //SelectQuery.SQL.Add('and vr.vbfin='''+VBFin+''''); - removed DL110607
  //100 const here for now DL021106 xx
  if Strips=16 then //show 100 as well
    SelectQuery.SQL.Add('and ((vw.strips=16 or vw.strips=20)) ') //for 100 or 127mm
  else
    SelectQuery.SQL.Add('and vw.strips='+inttostr(Strips));
  SelectQuery.SQL.Add('and vr.despdate is null');
  SelectQuery.SQL.Add('and vr.metricwidth=vw.metricwidth'); //added DL030215
  SelectQuery.SQL.Add('and vw.qlty=''F'''); //added DL030215
  FilterIndex := SelectQuery.SQL.Add('');  //provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('group by vr.vbstru,vr.vbcol,vr.vbfin,vr.metricwidth,vr.qlty,vr.qltyreason');
  if strips<>1 then
    SelectQuery.SQL.Add('order by vr.qlty,vr.qltyreason')
  else //added DL031013 union to show box breakdown: especially important for FW
  begin
    SelectQuery.SQL.Add('union');
    SelectQuery.SQL.Add('select vr.vbstru||vr.vbcol||vr.vbfin,vr.metricwidth,');
    SelectQuery.SQL.Add('vr.qlty,vr.qltyreason,vr.boxno,cast(sum(vr.netlength) as integer)');
    SelectQuery.SQL.Add('from vbrcpt vr,vbwidth vw');
    SelectQuery.SQL.Add('where vr.vbstru='''+VBStru+'''');
    SelectQuery.SQL.Add('and vr.vbcol='''+VBCol+'''');
    //SelectQuery.SQL.Add('and vr.vbfin='''+VBFin+''''); - removed DL110607
    if Strips=16 then
      SelectQuery.SQL.Add('and ((vw.strips=16 or vw.strips=20)) ')
    else
      SelectQuery.SQL.Add('and vw.strips='+inttostr(Strips));
    SelectQuery.SQL.Add('and vr.despdate is null');
    SelectQuery.SQL.Add('and vr.metricwidth=vw.metricwidth');
    SelectQuery.SQL.Add('and vw.qlty=''F''');
    SelectQuery.SQL.Add('group by vr.vbstru,vr.vbcol,vr.vbfin,vr.metricwidth,vr.qlty,vr.qltyreason,vr.boxno');
    SelectQuery.SQL.Add('order by 3,4,5'); //added DL031013
  end;
  FieldNameLabel.Caption:='Qlty';
  Caption := 'Select a Qlty';
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Type';
  SelectQuery.Fields[0].DisplayWidth:=10; //was 7 DL110901 - was 9 DL030215
  SelectQuery.Fields[1].DisplayLabel:='Width';
  SelectQuery.Fields[1].DisplayWidth:=5;
  SelectQuery.Fields[2].DisplayLabel:='Qlty';
  SelectQuery.Fields[2].DisplayWidth:=5;
  SelectQuery.Fields[3].DisplayLabel:='Reason';
  SelectQuery.Fields[3].DisplayWidth:=5;
  SelectQuery.Fields[4].DisplayLabel:='Box';
  SelectQuery.Fields[4].DisplayWidth:=8;
  SelectQuery.Fields[5].DisplayLabel:='Net m';
  SelectQuery.Fields[5].DisplayWidth:=8;
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalVTOrderNoNoFin(const VBStru,VBCol:string;Strips:integer):integer;
begin
  //Method added DL110607
  //VBWidth changed to Strips DL030215
  ResetQueries;
  SearchMethod := smSQLFilter;  //JT150798  the search method used
  FilterLHS:='VTOrdNo>=';
  FilterType:=1; {integer}
//  SelectQuery.SQL.Add('select cast(vo.daterqd as character(11)),vh.custref,');
  SelectQuery.SQL.Add('select vh.orderheld,vo.daterqd,vh.custref,');
  SelectQuery.SQL.Add('vo.vtordno,vo.vbstru||vo.vbcol||vo.vbfin,vo.vbwidth,vo.qty-vo.qtydel,');
  SelectQuery.SQL.Add('vo.estdate,vh.orddate,vh.datercvd');
  SelectQuery.SQL.Add('from vborddet vo,vbordhdr vh,vbwidth vw'); //vbwidth added DL030215
  SelectQuery.SQL.Add('where vo.vbstru='''+VBStru+'''');
  SelectQuery.SQL.Add('and vo.vbcol='''+VBCol+'''');
  //SelectQuery.SQL.Add('and vo.vbfin='''+VBFin+''''); {DL100198} - removed DL110607
  //100 const here for now DL021106 xx
  if Strips=16 then //show 100 as well
    SelectQuery.SQL.Add('and ((vw.strips=16 or vw.strips=20)) ') //for 100 or 127mm
  else
    SelectQuery.SQL.Add('and vw.strips='+inttostr(Strips));
  SelectQuery.SQL.Add('and vo.status<>''C''');
  SelectQuery.SQL.Add('and vo.vtordno=vh.vtordno');
  SelectQuery.SQL.Add('and vo.vbwidth=vw.metricwidth'); //added DL030215
  SelectQuery.SQL.Add('and vw.qlty=''F'''); //added DL030215
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by vo.daterqd,vh.custref,vo.vtordno');
  FieldNameLabel.Caption:='VT Order No';
  Caption := 'Select a Customer''s Order';
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Held';
  SelectQuery.Fields[0].DisplayWidth:=4;
  SelectQuery.Fields[1].DisplayLabel:='Required';
  SelectQuery.Fields[1].DisplayWidth:=8; //11
  SelectQuery.Fields[2].DisplayLabel:='Cust';
  SelectQuery.Fields[2].DisplayWidth:=8;
  SelectQuery.Fields[3].DisplayLabel:='VT Order';
  SelectQuery.Fields[3].DisplayWidth:=8;
  SelectQuery.Fields[4].DisplayLabel:='Type';
  SelectQuery.Fields[4].DisplayWidth:=9; //was 7 DL110901
  SelectQuery.Fields[5].DisplayLabel:='Width';
  SelectQuery.Fields[5].DisplayWidth:=5;
  SelectQuery.Fields[6].DisplayLabel:='Qty Rem';
  SelectQuery.Fields[6].DisplayWidth:=8;
  SelectQuery.Fields[7].DisplayLabel:='Estimated';
  SelectQuery.Fields[7].DisplayWidth:=8; //11
  SelectQuery.Fields[8].DisplayLabel:='Ordered';
  SelectQuery.Fields[8].DisplayWidth:=8; //11
  SelectQuery.Fields[9].DisplayLabel:='Entered';
  SelectQuery.Fields[9].DisplayWidth:=8; //11
  Result := ShowModal;
end;

function TVBPickDlgForm.ShowModalVTOrderNoTotalsNoFin(const VBStru,VBCol:string;Strips:integer):integer;
begin
  //method added DL110607
  //VBWidth changed to Strips DL030215
  ResetQueries;
  SearchMethod := smSQLFilter;  //JT150798  the search method used
  FilterLHS:='OrderHeld>=';
  FilterType:=1; {integer}
//  SelectQuery.SQL.Add('select cast(vo.daterqd as character(11)),vh.custref,');
  SelectQuery.SQL.Add('select vh.orderheld,');
  SelectQuery.SQL.Add('vo.vbstru||vo.vbcol||vo.vbfin,vo.vbwidth,sum(vo.qty-vo.qtydel) qtysum');
  SelectQuery.SQL.Add('from vborddet vo,vbordhdr vh,vbwidth vw');
  SelectQuery.SQL.Add('where vo.vbstru='''+VBStru+'''');
  SelectQuery.SQL.Add('and vo.vbcol='''+VBCol+'''');
  //SelectQuery.SQL.Add('and vo.vbfin='''+VBFin+''''); {DL100198} - removed DL110607
  //100 const here for now DL021106 xx
  if Strips=16 then //show 100 as well
    SelectQuery.SQL.Add('and ((vw.strips=16 or vw.strips=20)) ') //for 100 or 127mm
  else
    SelectQuery.SQL.Add('and vw.strips='+inttostr(Strips));
  SelectQuery.SQL.Add('and vo.status<>''C''');
  SelectQuery.SQL.Add('and vo.vtordno=vh.vtordno');
  SelectQuery.SQL.Add('and vo.vbwidth=vw.metricwidth'); //added DL030215
  SelectQuery.SQL.Add('and vw.qlty=''F'''); //added DL030215
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('group by vh.orderheld,vo.vbstru,vo.vbcol,vo.vbfin,vo.vbwidth');
  SelectQuery.SQL.Add('order by vh.orderheld');
  FieldNameLabel.Caption:='Order Held';
  Caption := 'Select Order Held';
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Held';
  SelectQuery.Fields[0].DisplayWidth:=4;
  SelectQuery.Fields[1].DisplayLabel:='Type';
  SelectQuery.Fields[1].DisplayWidth:=9; //was 7 DL110901
  SelectQuery.Fields[2].DisplayLabel:='Width';
  SelectQuery.Fields[2].DisplayWidth:=5;
  SelectQuery.Fields[3].DisplayLabel:='Total Qty Rem';
  SelectQuery.Fields[3].DisplayWidth:=12;
  Result := ShowModal;
end;

end.
