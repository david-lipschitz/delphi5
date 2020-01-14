unit product;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons;

type
  TProductForm = class(TForm)
    Product: TTable;
    ProductSource: TDataSource;
    ProductPRODREF: TStringField;
    ProductCATEGORY: TStringField;
    ProductDESCR: TStringField;
    ProductCTRLACCT: TStringField;
    ProductEXTPRODREF: TStringField;
    TxnDetSummary: TTable;
    TxnDetSummarySource: TDataSource;
    TxnDetSummaryEXTPRODREF: TStringField;
    TxnDetSummaryCATEGORY: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    StdCostPrices: TTable;
    StdCostPricesSource: TDataSource;
    StdCostPricesEXTPRODREF: TStringField;
    StdCostPricesFROMDATE: TDateTimeField;
    StdCostPricesTODATE: TDateTimeField;
    StdCostPricesSTDPRICE: TFloatField;
    Label14: TLabel;
    DBGrid1: TDBGrid;
    ActiveSource: TDataSource;
    DBNavigator1: TDBNavigator;
    CloseBitBtn: TBitBtn;
    Label10: TLabel;
    edtSearch: TEdit;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProductForm: TProductForm;

implementation

{$R *.DFM}

uses Main;

procedure TProductForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TProductForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if StdCostPrices.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  StdCostPrices.Close;
  TxnDetSummary.Close;
  Product.Close;
  ProductForm.Release;
end;

procedure TProductForm.FormShow(Sender: TObject);
begin
  Product.Open;
  TxnDetSummary.Open;
  StdCostPrices.Open;
end;

procedure TProductForm.edtSearchChange(Sender: TObject);
begin
  if edtSearch.Text<>'' then
  begin
    Product.Filter:='ProdRef>='''+uppercase(edtSearch.Text)+'''';
    Product.Filtered:=true;
  end
  else
  begin
    Product.Filtered:=false;
  end;
end;

procedure TProductForm.DBGrid1Enter(Sender: TObject);
begin
  ActiveSource.DataSet:=StdCostPrices;
end;

procedure TProductForm.DBGrid1Exit(Sender: TObject);
begin
  ActiveSource.DataSet:=Product;
end;

end.
