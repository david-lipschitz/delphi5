unit vbstksum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, Grids, StdCtrls,
  Buttons, DBGrids;

type
  TVBStkSumForm = class(TForm)
    CloseBitBtn: TBitBtn;
    FirstsBtn: TButton;
    LotNoBtn: TButton;
    StockLotQuery: TQuery;
    StockSource: TDataSource;
    StockSumQuery: TQuery;
    DBGrid1: TDBGrid;
    PrintSpdBtn: TSpeedButton;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FirstsBtnClick(Sender: TObject);
    procedure LotNoBtnClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VBStkSumForm: TVBStkSumForm;

implementation

{$R *.DFM}

uses VBMain;

procedure TVBStkSumForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBStkSumForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StockSource.DataSet.Close;
  MainForm.Database.Commit;
  VBStkSumForm.Release;
end;

procedure TVBStkSumForm.FormShow(Sender: TObject);
begin
  StockSource.DataSet.Filtered:=false;
  StockSource.DataSet:=StockLotQuery;
  MainForm.Database.StartTransaction;
  StockSource.DataSet.Open;
end;

procedure TVBStkSumForm.FirstsBtnClick(Sender: TObject);
begin
  if StockSource.DataSet.Filtered then
    StockSource.DataSet.Filtered:=false
  else
  begin
    StockSource.DataSet.Filter:='qlty=''''';
    StockSource.DataSet.Filtered:=true;
  end;
end;

procedure TVBStkSumForm.LotNoBtnClick(Sender: TObject);
var
  OldFilter:boolean;
begin
  Screen.Cursor:=crHourGlass;
  OldFilter:=StockSource.DataSet.Filtered;
  StockSource.DataSet.Filtered:=false;
  StockSource.DataSet.Close;
  if StockSource.DataSet=StockLotQuery then
    StockSource.DataSet:=StockSumQuery
  else
    StockSource.DataSet:=StockLotQuery;
  StockSource.DataSet.Open;
  if OldFilter then
    StockSource.DataSet.Filtered:=true;
  Screen.Cursor:=crDefault;
end;

procedure TVBStkSumForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
