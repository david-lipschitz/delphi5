unit Brmodal;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids, Buttons, ExtCtrls;

type
  string1=string[1];
  TPickDlgForm = class(TForm)
    DataSource: TDataSource;
    SelectQuery: TQuery;
    Panel1: TPanel;
    Label1: TLabel;
    FieldNameLabel: TLabel;
    EditSearchValue: TEdit;
    SearchSpdBtn: TSpeedButton;
    Panel2: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    Panel3: TPanel;
    SelectQueryGrid: TDBGrid;
    procedure EditSearchValueChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SearchSpdBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectQueryGridDblClick(Sender: TObject);
    procedure EditSearchValueEnter(Sender: TObject);
    procedure EditSearchValueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OKBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    FilterLHS:string[40];
    FilterType:smallint; {0 for string; 1 for integer}
    FilterIndex: Integer;  //JT150798 the index of the search filter line in SelectQuery.SQL
    FilterPrefix: string;  //JT150798 'where' or 'and'
    procedure ResetQueries;
    function GetSupRef : string;
    function GetProdRef : string;
    function GetVTOrdNo : integer;
    function GetExpDelDate : double;
    function GetOrdProdRef : string;
    function GetOutSupRef : string;
    function GetOutVTOrdNo : integer;
    function GetOutExpDelDate : double;
    function GetOutProdRef : string;
    function GetDelNo : integer;
    function GetProductRef : string;
    function GetYarnCol : string;
    function GetYarnStru : string;
    function GetYnTwist : string;
    function GetYarnTypeStru : string; {for structure from yarn type form}
    function GetYarnTypeYnTwist : string;
    function GetYarnTypeCol : string;
    function GetYarnTypeBDStru : string; {for structure from yarn type form}
    function GetYarnTypeBDYnTwist : string;
    function GetYarnTypeBDCol : string;
    function GetYarnRcptBoxNo : integer;
    function GetDeptRef : string;
    function GetDeptCtrlAcct : string;
    function GetDeptIssueYarnTo : string;
    function GetYnDespHdrDespNo : integer;
    function GetWIPRcptRefNo : integer;
    function GetBatRef : integer;
    function GetYarnRcptLotNoBoxNo : integer;
    function GetYarnLotNoLotNo1 : integer;
    function GetYarnLotNoLotNo2 : integer;
    function GetYarnLotNoYarnCol : string;
  public
    UseFilterProp: Boolean;  //if to use TQuery.Filter property instead
    { Public declarations }
    property SupRef : string read GetSupRef;
    property ProdRef : string read GetProdRef;
    property VTOrdNo : integer read GetVTOrdNo;
    property ExpDelDate : double read GetExpDelDate;
    property OrdProdRef : string read GetOrdProdRef;
    property OutSupRef : string read GetOutSupRef;
    property OutVTOrdNo : integer read GetOutVTOrdNo;
    property OutExpDelDate : double read GetOutExpDelDate;
    property OutProdRef : string read GetOutProdRef;
    property DelNo : integer read GetDelNo;
    property ProductRef : string read GetProductRef;
    property YarnCol : string read GetYarnCol;
    property YarnStru : string read GetYarnStru;
    property YnTwist : string read GetYnTwist;
    property YarnTypeStru : string read GetYarnTypeStru;
    property YarnTypeYnTwist : string read GetYarnTypeYnTwist;
    property YarnTypeCol : string read GetYarnTypeCol;
    property YarnTypeBDStru : string read GetYarnTypeBDStru;
    property YarnTypeBDYnTwist : string read GetYarnTypeBDYnTwist;
    property YarnTypeBDCol : string read GetYarnTypeBDCol;
    property YarnRcptBoxNo : integer read GetYarnRcptBoxNo;
    property DeptRef : string read GetDeptRef;
    property DeptCtrlAcct : string read GetDeptCtrlAcct;
    property DeptIssueYarnTo : string read GetDeptIssueYarnTo;
    property YnDespHdrDespNo : integer read GetYnDespHdrDespNo;
    property WIPRcptRefNo : integer read GetWIPRcptRefNo;
    property BatRef : integer read GetBatRef;
    property YarnRcptLotNoBoxNo : integer read GetYarnRcptLotNoBoxNo;
    property YarnLotNoLotNo1 : integer read GetYarnLotNoLotNo1;
    property YarnLotNoLotNo2 : integer read GetYarnLotNoLotNo2;
    property YarnLotNoYarnCol : string read GetYarnLotNoYarnCol;
    function ShowModalSups(SCType:string): Integer;
    function ShowModalProds(SupRef:string): Integer;
    function ShowModalOrds(SupRef:string): Integer;
    function ShowModalOutOrds(SearchType:string1) : Integer;
    function ShowModalDelNo : Integer;
    function ShowModalProducts : Integer;
    function ShowModalYarnCol : Integer;
    function ShowModalYarnStru : Integer;
    function ShowModalYarnType{(SearchType:char)} : Integer;
    function ShowModalYarnTypeBreakDown : Integer;
    function ShowModalYarnRcpt : Integer;
    function ShowModalDepts(PassValue:integer) : Integer;
    function ShowModalYnDesp : Integer;
    function ShowModalWIPRcpt : Integer;
    function ShowModalBatRef(PassValue:integer) : Integer;
    function ShowModalYarnRcptLotNo : Integer;
    function ShowModalYarnLotNo : integer;
    function ShowModalIssued(DelNo,PalletNo,BCBNo:integer) : integer;
  end;

var
  PickDlgForm: TPickDlgForm;

implementation

{$R *.DFM}

function TPickDlgForm.GetSupRef : string;
begin
  Result:=SelectQuery.Fields[0].AsString; {SupplierQuerySUPREF.Value;}
end;

function TPickDlgForm.GetProdRef : string;
begin
  Result:=SelectQuery.Fields[0].AsString; {ProdSupQueryProdRef.Value;}
end;

function TPickDlgForm.GetVTOrdNo : integer;
begin
  Result:=SelectQuery.Fields[2].AsInteger; {VTOrderQueryVTOrdNo.Value;}
end;

function TPickDlgForm.GetExpDelDate : double;
begin
  Result:=SelectQuery.Fields[1].AsFloat; {VTOrderQueryExpDelDate.Value;}
end;

function TPickDlgForm.GetOrdProdRef : string;
begin
  Result:=SelectQuery.Fields[0].AsString; {VTOrderQueryProdRef.Value;}
end;

function TPickDlgForm.GetOutSupRef : string;
begin
  Result:=SelectQuery.Fields[2].AsString; {OutOrderQuerySupRef.Value;}
end;

function TPickDlgForm.GetOutVTOrdNo : integer;
begin
  Result:=SelectQuery.Fields[3].AsInteger; {OutOrderQueryVTOrdNo.Value;}
end;

function TPickDlgForm.GetOutExpDelDate : double;
begin
  Result:=SelectQuery.Fields[1].AsFloat; {OutOrderQueryExpDelDate.Value;}
end;

function TPickDlgForm.GetOutProdRef : string;
begin
  Result:=SelectQuery.Fields[0].AsString; {OutOrderQueryProdRef.Value;}
end;

function TPickDlgForm.GetDelNo : integer;
begin
  Result:=SelectQuery.Fields[1].AsInteger; {DelHeadQueryDelNo.Value;}
end;

function TPickDlgForm.GetProductRef : string;
begin
  Result:=SelectQuery.Fields[0].AsString; {ProductQueryProdRef.Value;}
end;

function TPickDlgForm.GetYarnCol : string;
begin
  Result:=SelectQuery.Fields[0].AsString; {YarnColQueryYnCol.Value;}
end;

function TPickDlgForm.GetYarnStru : string;
begin
  Result:=SelectQuery.Fields[0].AsString; {YarnStruQueryYnStru.Value;}
end;

function TPickDlgForm.GetYnTwist : string;
begin
  Result:=SelectQuery.Fields[1].AsString; {YarnStruQueryYnTwist.Value;}
end;

function TPickDlgForm.GetYarnTypeStru : string;
begin
  Result:=SelectQuery.Fields[0].AsString; {YarnTypeQueryYnStru.Value;}
end;

function TPickDlgForm.GetYarnTypeYnTwist : string;
begin
  Result:=SelectQuery.Fields[1].AsString; {YarnTypeQueryYnTwist.Value;}
end;

function TPickDlgForm.GetYarnTypeCol : string;
begin
  Result:=SelectQuery.Fields[2].AsString; {YarnTypeQueryYnCol.Value;}
end;

function TPickDlgForm.GetYarnTypeBDStru : string;
begin
  Result:=SelectQuery.Fields[0].AsString; {YarnTypeBreakDownQueryYnStru.Value;}
end;

function TPickDlgForm.GetYarnTypeBDYnTwist : string;
begin
  Result:=SelectQuery.Fields[1].AsString; {YarnTypeBreakDownQueryYnTwist.Value;}
end;

function TPickDlgForm.GetYarnTypeBDCol : string;
begin
  Result:=SelectQuery.Fields[2].AsString; {YarnTypeBreakDownQueryYnCol.Value;}
end;

function TPickDlgForm.GetYarnRcptBoxNo : Integer;
begin
  Result:=SelectQuery.Fields[6].AsInteger; {YarnRcptQueryBoxNo.Value;}
end;

function TPickDlgForm.GetDeptRef : string;
begin
  Result:=SelectQuery.Fields[0].AsString; {DeptQueryDeptRef.Value;}
end;

function TPickDlgForm.GetDeptCtrlAcct : string;
begin
  Result:=SelectQuery.Fields[2].AsString;
end;

function TPickDlgForm.GetDeptIssueYarnTo : string;
begin
  Result:=SelectQuery.Fields[3].AsString;
end;

function TPickDlgForm.GetYnDespHdrDespNo : integer;
begin
  Result:=SelectQuery.Fields[2].AsInteger; {YnDespQueryDespNo.Value;}
end;

function TPickDlgForm.GetWIPRcptRefNo : integer;
begin
  Result:=SelectQuery.Fields[3].AsInteger; {WIPRcptQueryRefNo.Value;}
end;

function TPickDlgForm.GetBatRef : integer;
begin
  Result:=SelectQuery.Fields[0].AsInteger;
end;

function TPickDlgForm.GetYarnRcptLotNoBoxNo : Integer;
begin
  Result:=SelectQuery.Fields[6].AsInteger; {YarnRcptQueryBoxNo.Value;}
end;

function TPickDlgForm.GetYarnLotNoLotNo1 : Integer;
begin
  Result:=SelectQuery.Fields[0].AsInteger;
end;

function TPickDlgForm.GetYarnLotNoLotNo2 : Integer;
begin
  Result:=SelectQuery.Fields[1].AsInteger;
end;

function TPickDlgForm.GetYarnLotNoYarnCol : string;
begin
  Result:=SelectQuery.Fields[4].AsString;
end;

procedure TPickDlgForm.ResetQueries;
begin
  DataSource.DataSet:=SelectQuery;
  SelectQuery.Close;
  SelectQuery.SQL.Clear;
  SelectQuery.Filtered:=false;
  SelectQuery.Filter:='';
  EditSearchValue.Text:='';
end;

function TPickDlgForm.ShowModalSups(SCType:string): Integer;
{SCType is CU for Customer and SU for supplier}
begin
{  DataSource.DataSet := SupplierQuery;
  SupplierQuery.Params[0].AsString:=SCType;
  SupplierQuery.Active:=true;
  Result := ShowModal;}
  ResetQueries;
  if SCType='SU' then
  begin
    Caption := 'Select a supplier';
    FieldNameLabel.Caption:='Sup Ref';
  end
  else
  begin
    Caption := 'Select a customer';
    FieldNameLabel.Caption:='Cust Ref';
  end;
  FilterType:=0; {string}
  FilterLHS:='supref>=';
  //Caption:='Select a Supplier'; removed DL241199
  SelectQuery.SQL.Add('select supref,supdescr');
  SelectQuery.SQL.Add('from supplier');
  SelectQuery.SQL.Add('where sctype=:sctype');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by supref');
  SelectQuery.Params[0].AsString:=SCType;
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Reference';
  SelectQuery.Fields[0].DisplayWidth:=6;
  SelectQuery.Fields[1].DisplayLabel:='Description';
  SelectQuery.Fields[1].DisplayWidth:=30;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalProds(SupRef:string): Integer;
begin
{  DataSource.DataSet := ProdSupQuery;
  ProdSupQuery.Params[0].AsString:=SupRef;
  ProdSupQuery.Active:=true;
  Caption := 'Select a product';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
  FilterLHS:='prodref>=';
  FieldNameLabel.Caption:='Product Ref';
  Caption:='Select a Product';
  SelectQuery.SQL.Add('select prodref,descr');
  SelectQuery.SQL.Add('from product,prodsup');
  SelectQuery.SQL.Add('where product.prodref=prodsup.prodref');
  SelectQuery.SQL.Add('and prodsup.supref=:supref');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by prodref');
  SelectQuery.Params[0].AsString:=SupRef;
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Prod Ref';
  SelectQuery.Fields[0].DisplayWidth:=6;
  SelectQuery.Fields[1].DisplayLabel:='Description';
  SelectQuery.Fields[1].DisplayWidth:=30;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalOrds(SupRef:string): Integer;
begin
{  DataSource.DataSet := VTOrderQuery;
  VTOrderQuery.Params[0].AsString:=SupRef;
  VTOrderQuery.Active:=true;
  Caption := 'Select an order for supplier: ' +
    SupRef;
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
  FilterLHS:='prodref>=';
  FieldNameLabel.Caption:='Order Number';
  Caption:='Select an Order for Supplier: ' + SupRef;
  SelectQuery.SQL.Add('select ad.prodref,ad.expdeldate,ad.vtordno,ah.orddate,');
  SelectQuery.SQL.Add('cast(ad.qty as integer),cast(ad.qtyrcvd as integer)');
  SelectQuery.SQL.Add('from aporddet ad, apordhdr ah');
  SelectQuery.SQL.Add('where ah.supref=:supref');
  SelectQuery.SQL.Add('and ad.vtordno=ah.vtordno');
  SelectQuery.SQL.Add('and ad.ordlinecomplete=''N''');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by ad.prodref,ad.expdeldate');
  SelectQuery.Params[0].AsString:=SupRef;
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Prod Ref';
  SelectQuery.Fields[0].DisplayWidth:=6;
  SelectQuery.Fields[1].DisplayLabel:='ExpDel';
  SelectQuery.Fields[1].DisplayWidth:=10;
{  SelectQuery.Fields[1].DisplayFormat:='dd/mm/yy';}
  SelectQuery.Fields[2].DisplayLabel:='Ord No';
  SelectQuery.Fields[2].DisplayWidth:=5;
  SelectQuery.Fields[3].DisplayLabel:='Order Date';
  SelectQuery.Fields[3].DisplayWidth:=10;
{  SelectQuery.Fields[4].DisplayFormat:='dd/mm/yy';}
  SelectQuery.Fields[4].DisplayLabel:='Qty Ord';
  SelectQuery.Fields[4].DisplayWidth:=8;
  SelectQuery.Fields[5].DisplayLabel:='Qty Rcvd';
  SelectQuery.Fields[5].DisplayWidth:=8;
  Result:=ShowModal;
end;

{show all orders: later allow narrow down by orders}
function TPickDlgForm.ShowModalOutOrds(SearchType:string1) : Integer;
begin
{  DataSource.DataSet := OutOrderQuery;
  OutOrderQuery.Active:=true;
  Caption := 'Select an outstanding order';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
//  FilterLHS:='prodref>=';
  FilterLHS:='ad.prodref>=';
  FieldNameLabel.Caption:='Product Ref';
  SelectQuery.SQL.Add('select ad.prodref,ad.expdeldate,ah.supref,ad.vtordno,ah.orddate,');
  SelectQuery.SQL.Add('cast(ad.qty as integer),cast(ad.qtyrcvd as integer)');
  SelectQuery.SQL.Add('from apordhdr ah, aporddet ad');
  SelectQuery.SQL.Add('where ah.vtordno=ad.vtordno');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  if SearchType='O' then {show outstanding orders only}
  begin
    SelectQuery.SQL.Add('and ad.ordlinecomplete=''N''');
    Caption:='Select an Outstanding Order';
  end
  else
    Caption:='Select an Order';
  {SelectQuery.SQL.Add('and ad.ordlinecomplete='N'');}
  SelectQuery.SQL.Add('order by ad.prodref,ad.expdeldate,ah.supref,ad.vtordno');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Prod Ref';
  SelectQuery.Fields[0].DisplayWidth:=7;
  SelectQuery.Fields[1].DisplayLabel:='ExpDel';
  SelectQuery.Fields[1].DisplayWidth:=10;
{  SelectQuery.Fields[1].DisplayFormat:='dd/mm/yy';}
  SelectQuery.Fields[2].DisplayLabel:='Sup Ref';
  SelectQuery.Fields[2].DisplayWidth:=8;
  SelectQuery.Fields[3].DisplayLabel:='Ord No';
  SelectQuery.Fields[3].DisplayWidth:=5;
  SelectQuery.Fields[4].DisplayLabel:='Ord Date';
  SelectQuery.Fields[4].DisplayWidth:=10;
{  SelectQuery.Fields[4].DisplayFormat:='dd/mm/yy';}
  SelectQuery.Fields[5].DisplayLabel:='Qty Ord';
  SelectQuery.Fields[5].DisplayWidth:=8;
  SelectQuery.Fields[6].DisplayLabel:='Qty Rcvd';
  SelectQuery.Fields[6].DisplayWidth:=8;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalDelNo : Integer;
begin
{  DataSource.DataSet := DelHeadQuery;
  DelHeadQuery.Active:=true;
  Caption := 'Select a delivery note';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
//  FilterLHS:='prodref>=';
  FilterLHS:='dp.prodref>=';
  FieldNameLabel.Caption:='Product Ref';
  Caption:='Select a Delivery';
  SelectQuery.SQL.Add('select dp.prodref,dh.delno,dh.expdeldate,dh.vtordno,'); {distinct}
  SelectQuery.SQL.Add('dh.supref,cast(sum(dp.qtyrcvd) as integer),cast(sum(dp.qtyissued) as integer)');
  SelectQuery.SQL.Add('from delhead dh,delpallet dp');
  SelectQuery.SQL.Add('where dh.delno=dp.delno');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('group by dp.prodref,dh.expdeldate,dh.delno,');
  SelectQuery.SQL.Add('dh.supref,dh.vtordno');
  SelectQuery.SQL.Add('order by dp.prodref,dh.delno');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Prod Ref';
  SelectQuery.Fields[0].DisplayWidth:=7;
  SelectQuery.Fields[1].DisplayLabel:='Del No';
  SelectQuery.Fields[1].DisplayWidth:=5;
  SelectQuery.Fields[2].DisplayLabel:='ExpDel';
  SelectQuery.Fields[2].DisplayWidth:=10;
{  SelectQuery.Fields[1].DisplayFormat:='dd/mm/yy';}
  SelectQuery.Fields[3].DisplayLabel:='Ord No';
  SelectQuery.Fields[3].DisplayWidth:=4;
  SelectQuery.Fields[4].DisplayLabel:='Sup Ref';
  SelectQuery.Fields[4].DisplayWidth:=8;
  SelectQuery.Fields[5].DisplayLabel:='Received';
  SelectQuery.Fields[5].DisplayWidth:=8;
{  SelectQuery.Fields[4].DisplayFormat:='dd/mm/yy';}
  SelectQuery.Fields[6].DisplayLabel:='Issued';
  SelectQuery.Fields[6].DisplayWidth:=8;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalProducts : Integer;
begin
{  DataSource.DataSet := ProductQuery;
  ProductQuery.Active:=true;
  Caption := 'Select a product';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
  FilterLHS:='prodref>=';
  FieldNameLabel.Caption:='Product Ref';
  Caption:='Select a Product';
  //SelectQuery.SQL.Add('select prodref,descr,onorder,cast(instock as integer)');
  SelectQuery.SQL.Add('select prodref,descr');
  SelectQuery.SQL.Add('from product');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'where';
  SelectQuery.SQL.Add('order by prodref');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Prod Ref';
  SelectQuery.Fields[0].DisplayWidth:=6;
  SelectQuery.Fields[1].DisplayLabel:='Description';
  SelectQuery.Fields[1].DisplayWidth:=25;
  //SelectQuery.Fields[2].DisplayLabel:='On Order';
  //SelectQuery.Fields[2].DisplayWidth:=8;
  //SelectQuery.Fields[3].DisplayLabel:='In Stock';
  //SelectQuery.Fields[3].DisplayWidth:=8;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalYarnCol : Integer;
begin
{  DataSource.DataSet := YarnColQuery;
  YarnColQuery.Active:=true;
  Caption := 'Select a yarn colour';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
//  FilterLHS:='yncol>=';
  FilterLHS:='yc.yncol>=';
  FieldNameLabel.Caption:='Colour';
  Caption:='Select a Yarn Colour';
  SelectQuery.SQL.Add('select yc.yncol,yc.descr,sum(yw.numends)');
  SelectQuery.SQL.Add('from yarncol yc left join yncolwbs yw on yc.yncol=yw.yncol');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'where';
  SelectQuery.SQL.Add('group by yc.yncol,yc.descr');
  SelectQuery.SQL.Add('order by yc.yncol');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Colour';
  SelectQuery.Fields[0].DisplayWidth:=8;
  SelectQuery.Fields[1].DisplayLabel:='Description';
  SelectQuery.Fields[1].DisplayWidth:=25;
  SelectQuery.Fields[2].DisplayLabel:='Ends';
  SelectQuery.Fields[2].DisplayWidth:=6;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalYarnStru : Integer;
begin
{  DataSource.DataSet := YarnStruQuery;
  YarnStruQuery.Active:=true;
  Caption := 'Select a yarn structure';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
  FilterLHS:='ynstru>=';
  FieldNameLabel.Caption:='Structure';
  Caption:='Select a Yarn Structure';
  SelectQuery.SQL.Add('select ynstru,yntwist,descr');
  SelectQuery.SQL.Add('from yarnstru');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'where';
  SelectQuery.SQL.Add('order by ynstru,yntwist');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Structure';
  SelectQuery.Fields[0].DisplayWidth:=8;
  SelectQuery.Fields[1].DisplayLabel:='Twist';
  SelectQuery.Fields[1].DisplayWidth:=5;
  SelectQuery.Fields[2].DisplayLabel:='Description';
  SelectQuery.Fields[2].DisplayWidth:=25;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalYarnType{(SearchType:char)} : Integer;
begin
{  DataSource.DataSet := YarnTypeQuery;
  Caption := 'All Yarn Types: Select a yarn type';
  YarnTypeQuery.Active:=true;
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
//  FilterLHS:='ynstru>=';
  FilterLHS:='yt.ynstru>=';
  FieldNameLabel.Caption:='Structure';
  Caption:='Select a Yarn Type';
  {mod DL050416}
  {SelectQuery.SQL.Add('select yt.ynstru,yt.yntwist,yt.yncol,yc.descr,cast(yt.instock as integer),');
  SelectQuery.SQL.Add('sum(yw.numends)');
  SelectQuery.SQL.Add('from yarntype yt, yarncol yc left join yncolwbs yw on yc.yncol=yw.yncol');
  SelectQuery.SQL.Add('where yt.yncol=yc.yncol');}
  SelectQuery.SQL.Add('select yt.ynstru,yt.yntwist,yt.yncol,yc.descr');
  SelectQuery.SQL.Add('from yarntype yt, yarncol yc');
  SelectQuery.SQL.Add('where yt.yncol=yc.yncol');
  //SelectQuery.SQL.Add('and yt.yntype=td.extprodref');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  //SelectQuery.SQL.Add('group by yt.ynstru,yt.yntwist,yt.yncol,yc.descr,yt.instock');
  //SelectQuery.SQL.Add('group by yt.ynstru,yt.yntwist,yt.yncol,yc.descr');
  SelectQuery.SQL.Add('order by yt.ynstru,yt.yntwist,yt.yncol');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Struc';
  SelectQuery.Fields[0].DisplayWidth:=6;
  SelectQuery.Fields[1].DisplayLabel:='Tw';
  SelectQuery.Fields[1].DisplayWidth:=2;
  SelectQuery.Fields[2].DisplayLabel:='Col';
  SelectQuery.Fields[2].DisplayWidth:=5;
  SelectQuery.Fields[3].DisplayLabel:='Col Description';
  SelectQuery.Fields[3].DisplayWidth:=25;
  //SelectQuery.Fields[4].DisplayLabel:='Net';
  //SelectQuery.Fields[4].DisplayWidth:=7;
  //SelectQuery.Fields[5].DisplayLabel:='Ends';
  //SelectQuery.Fields[5].DisplayWidth:=4;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalYarnTypeBreakDown : Integer;
begin
{  DataSource.DataSet := YarnTypeBreakDownQuery;
  Caption := 'Yarn Type Breakdown: Select a yarn type';
  YarnTypeBreakDownQuery.Active:=true;
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
//  FilterLHS:='ynstru>=';
  FilterLHS:='yr.ynstru>=';
  FieldNameLabel.Caption:='Structure';
  Caption := 'Yarn Type Breakdown: Select a yarn type';
  //SelectQuery.SQL.Add('select yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,yc.descr,cast(sum(yr.ynnet) as integer)');
  SelectQuery.SQL.Add('select yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,yc.descr');
  SelectQuery.SQL.Add('from yarnrcpt yr, yarncol yc');
  SelectQuery.SQL.Add('where yr.despno=0'); {xx}
  SelectQuery.SQL.Add('and yr.yncol=yc.yncol');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  //SelectQuery.SQL.Add('group by yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty,yc.descr');
  SelectQuery.SQL.Add('order by yr.ynstru,yr.yntwist,yr.yncol,yr.ynqlty');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Struc';
  SelectQuery.Fields[0].DisplayWidth:=6;
  SelectQuery.Fields[1].DisplayLabel:='Tw';
  SelectQuery.Fields[1].DisplayWidth:=2;
  SelectQuery.Fields[2].DisplayLabel:='Col';
  SelectQuery.Fields[2].DisplayWidth:=5;
  SelectQuery.Fields[3].DisplayLabel:='Qlty';
  SelectQuery.Fields[3].DisplayWidth:=4;
  SelectQuery.Fields[4].DisplayLabel:='Col Description';
  SelectQuery.Fields[4].DisplayWidth:=25;
  //SelectQuery.Fields[5].DisplayLabel:='Net';
  //SelectQuery.Fields[5].DisplayWidth:=7;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalYarnRcpt : Integer;
begin
{  DataSource.DataSet := YarnRcptQuery;
  YarnRcptQuery.Active:=true;
  Caption := 'Select a yarn receipt';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
  FilterLHS:='ynstru>=';
  FieldNameLabel.Caption:='Structure';
  Caption:='Select a Yarn Rcpt';
  SelectQuery.SQL.Add('select ynstru,yntwist,yncol,ynqlty,lotno1,lotno2,boxno,cast(ynnet as integer)');
  SelectQuery.SQL.Add('from yarnrcpt');
  SelectQuery.SQL.Add('where despno=0'); {added DL229897}
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by ynstru,yntwist,yncol,ynqlty,lotno1,lotno2,boxno');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Struc';
  SelectQuery.Fields[0].DisplayWidth:=5;
  SelectQuery.Fields[1].DisplayLabel:='Tw';
  SelectQuery.Fields[1].DisplayWidth:=2;
  SelectQuery.Fields[2].DisplayLabel:='Col';
  SelectQuery.Fields[2].DisplayWidth:=4;
  SelectQuery.Fields[3].DisplayLabel:='Qlty';
  SelectQuery.Fields[3].DisplayWidth:=4;
  SelectQuery.Fields[4].DisplayLabel:='Lot1';
  SelectQuery.Fields[4].DisplayWidth:=5;
  SelectQuery.Fields[5].DisplayLabel:='Lot2';
  SelectQuery.Fields[5].DisplayWidth:=5;
  SelectQuery.Fields[6].DisplayLabel:='Box No';
  SelectQuery.Fields[6].DisplayWidth:=6;
  SelectQuery.Fields[7].DisplayLabel:='Net (kg)';
  SelectQuery.Fields[7].DisplayWidth:=8;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalDepts(PassValue:integer) : Integer;
begin
  ResetQueries;
  FilterType:=0; {string}
  FilterLHS:='deptref>=';
  FieldNameLabel.Caption:='Department';
  Caption:='Select a Department';
  SelectQuery.SQL.Add('select deptref,descr,ctrlacct,issueyarnto');
  SelectQuery.SQL.Add('from dept');
  if PassValue=0 then
    SelectQuery.SQL.Add('where transferallowed=''N''')
  else
    if PassValue=1 then
      SelectQuery.SQL.Add('where transferallowed=''Y''');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  {else show everything}
  SelectQuery.SQL.Add('order by deptref');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Dept Ref';
  SelectQuery.Fields[0].DisplayWidth:=8;
  SelectQuery.Fields[1].DisplayLabel:='Description';
  SelectQuery.Fields[1].DisplayWidth:=30;
  SelectQuery.Fields[2].DisplayLabel:='Ctrl Acct';
  SelectQuery.Fields[2].DisplayWidth:=8;
  SelectQuery.Fields[3].DisplayLabel:='Issue Yarn To';
  SelectQuery.Fields[3].DisplayWidth:=12;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalYnDesp: Integer;
begin
{  DataSource.DataSet := YnDespQuery;
  YnDespQuery.Active:=true;
  Caption := 'Yarn Despatches';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
  FilterLHS:='custref>=';
  FieldNameLabel.Caption:='Customer';
  Caption:='Select a Yarn Despatch';
  SelectQuery.SQL.Add('select despdate,custref,despno,cast(qtydesp as integer)');
  SelectQuery.SQL.Add('from yndesphdr');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'where';
  SelectQuery.SQL.Add('order by despdate,custref');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Desp Date';
  SelectQuery.Fields[0].DisplayWidth:=10;
  SelectQuery.Fields[1].DisplayLabel:='Customer';
  SelectQuery.Fields[1].DisplayWidth:=10;
  SelectQuery.Fields[2].DisplayLabel:='Desp No';
  SelectQuery.Fields[2].DisplayWidth:=8;
  SelectQuery.Fields[3].DisplayLabel:='Net (kg)';
  SelectQuery.Fields[3].DisplayWidth:=8;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalWIPRcpt: Integer;
begin
{  DataSource.DataSet := WIPRcptQuery;
  WIPRcptQuery.Active:=true;
  Caption := 'WIP Receipts';
  Result := ShowModal;}
  ResetQueries;
  FilterType:=0; {string}
  FilterLHS:='prodref>=';
  FieldNameLabel.Caption:='Product';
  Caption:='Select a WIP Rcpt';
  SelectQuery.SQL.Add('select prodref,datemanu,cast(netweight as integer),refno');
  SelectQuery.SQL.Add('from wiprcpt');
  SelectQuery.SQL.Add('where dateissued is null');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by prodref,datemanu');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Prod Ref';
  SelectQuery.Fields[0].DisplayWidth:=8;
  SelectQuery.Fields[1].DisplayLabel:='Manu';
  SelectQuery.Fields[1].DisplayWidth:=10;
  SelectQuery.Fields[2].DisplayLabel:='Net (kg)';
  SelectQuery.Fields[2].DisplayWidth:=8;
  SelectQuery.Fields[3].DisplayLabel:='Reference';
  SelectQuery.Fields[3].DisplayWidth:=6;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalBatRef(PassValue:integer) : Integer;
begin
  ResetQueries;
  FilterType:=1; {integer}
  FilterLHS:='batref>=';
  FieldNameLabel.Caption:='Batch Ref.';
  Caption:='Select a Batch Number';
  if PassValue=0 then
  begin
    SelectQuery.SQL.Add('select batref');
    SelectQuery.SQL.Add('from wiprcpt');
    SelectQuery.SQL.Add('where batref>25000');
    SelectQuery.SQL.Add('union');
    SelectQuery.SQL.Add('select batref');
    SelectQuery.SQL.Add('from issuedet');
    SelectQuery.SQL.Add('where batref>25000');
    SelectQuery.SQL.Add('union');
    SelectQuery.SQL.Add('select batref');
    SelectQuery.SQL.Add('from yarnrcpt');
    SelectQuery.SQL.Add('where batref>25000');
    UseFilterProp := True;
  end
  else
  begin
    SelectQuery.SQL.Add('select distinct batref');
    SelectQuery.SQL.Add('from transferdet');
    SelectQuery.SQL.Add('where batref>25000');
    FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
    FilterPrefix := 'and';
    SelectQuery.SQL.Add('order by batref');
  end;
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Bat Ref';
  SelectQuery.Fields[0].DisplayWidth:=8;
  Result:=ShowModal;
end;

procedure TPickDlgForm.EditSearchValueChange(Sender: TObject);
begin
  SearchSpdBtn.Enabled := True;
  OKBitBtn.Enabled := false; //added DL060114
end;

procedure TPickDlgForm.SearchSpdBtnClick(Sender: TObject);
var
  TempStr: string;
  TempNum: Double;
  TempField: TField;
  TempList: TStrings;
  ix: Integer;
begin
  with EditSearchValue do
    Text := Uppercase(Text);
  SearchSpdBtn.Enabled := False;
  Cursor := crSQLWait;
  Update;
  TempList := TStringList.Create;
  SelectQuery.DisableControls;
  try
    for ix := 0 to SelectQuery.FieldCount-1 do
      with SelectQuery.Fields[ix] do
        TempList.AddObject(DisplayLabel, Pointer(DisplayWidth));
    SelectQuery.Close;
    SelectQuery.Filtered := False;
    if UseFilterProp then
      if EditSearchValue.Text = '' then
        SelectQuery.Filter := ''
      else
      begin
        SelectQuery.Filter := FilterLHS + EditSearchValue.Text;
        SelectQuery.Filtered := True;
      end
    else
      if EditSearchValue.Text = '' then
        SelectQuery.SQL[FilterIndex] := ''
      else
        SelectQuery.SQL[FilterIndex] :=
          FilterPrefix + ' ' + FilterLHS + '"' + EditSearchValue.Text + '"';
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
    SelectQuery.EnableControls;
    Cursor := crDefault;
    TempList.Free;
  end;
end;

procedure TPickDlgForm.FormActivate(Sender: TObject);
begin
  EditSearchValue.SetFocus;
end;

function TPickDlgForm.ShowModalYarnRcptLotNo : Integer;
begin
  {added DL220897}
  ResetQueries;
  FilterType:=1; {integer}
  FilterLHS:='lotno1>=';
  FieldNameLabel.Caption:='LotNo1';
  Caption:='Select a Yarn Rcpt';
  SelectQuery.SQL.Add('select lotno1,lotno2,ynstru,yntwist,yncol,ynqlty,boxno,cast(ynnet as integer)');
  SelectQuery.SQL.Add('from yarnrcpt');
  SelectQuery.SQL.Add('where despno=0');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by lotno1,lotno2,ynstru,yntwist,yncol,ynqlty,boxno');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Lot1';
  SelectQuery.Fields[0].DisplayWidth:=5;
  SelectQuery.Fields[1].DisplayLabel:='Lot2';
  SelectQuery.Fields[1].DisplayWidth:=5;
  SelectQuery.Fields[2].DisplayLabel:='Struc';
  SelectQuery.Fields[2].DisplayWidth:=5;
  SelectQuery.Fields[3].DisplayLabel:='Tw';
  SelectQuery.Fields[3].DisplayWidth:=2;
  SelectQuery.Fields[4].DisplayLabel:='Col';
  SelectQuery.Fields[4].DisplayWidth:=4;
  SelectQuery.Fields[5].DisplayLabel:='Qlty';
  SelectQuery.Fields[5].DisplayWidth:=4;
  SelectQuery.Fields[6].DisplayLabel:='Box No';
  SelectQuery.Fields[6].DisplayWidth:=6;
  SelectQuery.Fields[7].DisplayLabel:='Net (kg)';
  SelectQuery.Fields[7].DisplayWidth:=8;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalYarnLotNo : Integer;
begin
  {added DL250897}
  ResetQueries;
  FilterType:=1; {integer}
  FilterLHS:='lotno1>=';
  FieldNameLabel.Caption:='LotNo1';
  Caption:='Select a Yarn Lot No';
  SelectQuery.SQL.Add('select lotno1,lotno2,ynstru,yntwist,yncol,cast(datemanu as character(11))');
  SelectQuery.SQL.Add('from yarnlotno');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'where';
  SelectQuery.SQL.Add('order by lotno1,lotno2');
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Lot1';
  SelectQuery.Fields[0].DisplayWidth:=5;
  SelectQuery.Fields[1].DisplayLabel:='Lot2';
  SelectQuery.Fields[1].DisplayWidth:=5;
  SelectQuery.Fields[2].DisplayLabel:='Stru';
  SelectQuery.Fields[2].DisplayWidth:=6;
  SelectQuery.Fields[3].DisplayLabel:='Tw';
  SelectQuery.Fields[3].DisplayWidth:=4;
  SelectQuery.Fields[4].DisplayLabel:='Col';
  SelectQuery.Fields[4].DisplayWidth:=6;
  SelectQuery.Fields[5].DisplayLabel:='Date Manu';
  SelectQuery.Fields[5].DisplayWidth:=12;
  Result:=ShowModal;
end;

function TPickDlgForm.ShowModalIssued(DelNo,PalletNo,BCBNo:integer) : integer;
begin
  {added DL250897}
  ResetQueries;
  FilterType:=0; {string}
  FilterLHS:='issueto>=';
  FieldNameLabel.Caption:='Issue To';
  Caption:='Select Issued To';
  SelectQuery.SQL.Add('select cast(dateissued as character(11)),initials,issueto,qtyissued,prodref,batref');
  SelectQuery.SQL.Add('from issuedet');
  SelectQuery.SQL.Add('where delno=:delno');
  SelectQuery.SQL.Add('and palletno=:palletno');
  SelectQuery.SQL.Add('and bcbno=:bcbno');
  FilterIndex := SelectQuery.SQL.Add('');  //JT150798  provide for search filter
  FilterPrefix := 'and';
  SelectQuery.SQL.Add('order by dateissued');
  SelectQuery.Params[0].AsInteger:=DelNo;
  SelectQuery.Params[1].AsInteger:=PalletNo;
  SelectQuery.Params[2].AsInteger:=BCBNo;
  SelectQuery.Prepare;
  SelectQuery.Open;
  SelectQuery.Fields[0].DisplayLabel:='Issued';
  SelectQuery.Fields[0].DisplayWidth:=12;
  SelectQuery.Fields[1].DisplayLabel:='Initials';
  SelectQuery.Fields[1].DisplayWidth:=6;
  SelectQuery.Fields[2].DisplayLabel:='To';
  SelectQuery.Fields[2].DisplayWidth:=7;
  SelectQuery.Fields[3].DisplayLabel:='Qty';
  SelectQuery.Fields[3].DisplayWidth:=7;
  SelectQuery.Fields[4].DisplayLabel:='Prod Ref';
  SelectQuery.Fields[4].DisplayWidth:=8;
  SelectQuery.Fields[5].DisplayLabel:='Bat Ref';
  SelectQuery.Fields[5].DisplayWidth:=7;
  Result:=ShowModal;
end;

procedure TPickDlgForm.FormShow(Sender: TObject);
begin
  SearchSpdBtn.Enabled := False;
  OKBitBtn.Enabled:=false; //added DL060114
  //calDatesAfter.DisplayDate:=date; //added DL060114
  //calDatesAfter.Clear; //added DL060114
end;

procedure TPickDlgForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  UseFilterProp := False;
end;

procedure TPickDlgForm.SelectQueryGridDblClick(Sender: TObject);
begin
  //method added DL060114
  OKBitBtnClick(Sender);
  //ModalResult:=mrOk; - removed DL060114
end;

procedure TPickDlgForm.EditSearchValueEnter(Sender: TObject);
begin
  //added DL060114
  OKBitBtn.Enabled := false;
end;

procedure TPickDlgForm.EditSearchValueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //method added DL060114
  if (key=VK_RETURN) then
    SearchSpdBtnClick(Sender);
end;

procedure TPickDlgForm.OKBitBtnClick(Sender: TObject);
begin
  //method added DL060114
  ModalResult := mrOk;  //not required, but here because also called from DoubleClick event
end;

end.
