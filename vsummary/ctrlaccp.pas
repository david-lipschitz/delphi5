unit ctrlaccp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, DBTables, ExtCtrls, Grids, DBGrids, Buttons;

type
  TCtrlAccPForm = class(TForm)
    CtrlAcct: TTable;
    CtrlAcctSource: TDataSource;
    CtrlAcctACCNAME: TStringField;
    CtrlAcctDESCRIPTION: TStringField;
    CtrlAcctEXTACCNAME: TStringField;
    CtrlAcctQTY: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    TxnDetSummary: TTable;
    TxnDetSummaryEXTPRODREF: TStringField;
    TxnDetSummaryCATEGORY: TStringField;
    Label9: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    TxnDetSummarySource: TDataSource;
    Label14: TLabel;
    DBGrid1: TDBGrid;
    StdCostPrices: TTable;
    StdCostPricesEXTPRODREF: TStringField;
    StdCostPricesFROMDATE: TDateTimeField;
    StdCostPricesTODATE: TDateTimeField;
    StdCostPricesSTDPRICE: TFloatField;
    StdCostPricesSource: TDataSource;
    DBNavigator1: TDBNavigator;
    ActiveSource: TDataSource;
    Label10: TLabel;
    edtSearch: TEdit;
    CloseBitBtn: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CtrlAccPForm: TCtrlAccPForm;

implementation

{$R *.DFM}

uses Main;

procedure TCtrlAccPForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StdCostPrices.Close;
  TxnDetSummary.Close;
  CtrlAcct.Close;
  CtrlAccPForm.Release;
end;

procedure TCtrlAccPForm.DBGrid1Enter(Sender: TObject);
begin
  ActiveSource.DataSet:=StdCostPrices;
end;

procedure TCtrlAccPForm.DBGrid1Exit(Sender: TObject);
begin
  ActiveSource.DataSet:=CtrlAcct;
end;

procedure TCtrlAccPForm.edtSearchChange(Sender: TObject);
begin
  if edtSearch.Text<>'' then
  begin
    CtrlAcct.Filter:='AccName>='''+uppercase(edtSearch.Text)+'''';
    CtrlAcct.Filtered:=true;
  end
  else
  begin
    CtrlAcct.Filtered:=false;
  end;
end;

procedure TCtrlAccPForm.FormShow(Sender: TObject);
begin
  CtrlAcct.Open;
  TxnDetSummary.Open;
  StdCostPrices.Open;
end;

procedure TCtrlAccPForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

end.
