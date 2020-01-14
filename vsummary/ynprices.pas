unit ynprices;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, Mask, DBCtrls, DBTables, ExtCtrls, Buttons;

type
  TYnPricesForm = class(TForm)
    YarnType: TTable;
    YarnTypeSource: TDataSource;
    YarnTypeYNSTRU: TStringField;
    YarnTypeYNCOL: TStringField;
    YarnTypeYNTWIST: TStringField;
    YarnTypeYNTYPE: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    TxnDetSummary: TTable;
    TxnDetSummaryEXTPRODREF: TStringField;
    TxnDetSummaryCATEGORY: TStringField;
    TxnDetSummarySource: TDataSource;
    DBGrid1: TDBGrid;
    StdCostPrices: TTable;
    StdCostPricesEXTPRODREF: TStringField;
    StdCostPricesFROMDATE: TDateTimeField;
    StdCostPricesTODATE: TDateTimeField;
    StdCostPricesSTDPRICE: TFloatField;
    StdCostPricesSource: TDataSource;
    Label14: TLabel;
    DBNavigator1: TDBNavigator;
    ActiveSource: TDataSource;
    CloseBitBtn: TBitBtn;
    edtSearch: TEdit;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YnPricesForm: TYnPricesForm;

implementation

{$R *.DFM}

uses Main;


procedure TYnPricesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StdCostPrices.Close;
  TxnDetSummary.Close;
  YarnType.Close;
  YnPricesForm.Release;
end;

procedure TYnPricesForm.FormShow(Sender: TObject);
begin
  YarnType.Open;
  TxnDetSummary.Open;
  StdCostPrices.Open;
end;

procedure TYnPricesForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TYnPricesForm.edtSearchChange(Sender: TObject);
begin
  if edtSearch.Text<>'' then
  begin
    YarnType.Filter:='YnType>='''+uppercase(edtSearch.Text)+'''';
    YarnType.Filtered:=true;
  end
  else
  begin
    YarnType.Filtered:=false;
  end;
end;

procedure TYnPricesForm.DBGrid1Enter(Sender: TObject);
begin
  ActiveSource.DataSet:=StdCostPrices;
end;

procedure TYnPricesForm.DBGrid1Exit(Sender: TObject);
begin
  ActiveSource.DataSet:=YarnType;
end;

end.
