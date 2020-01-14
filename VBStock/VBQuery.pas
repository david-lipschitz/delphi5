unit VBQuery;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, iqDBInf, Buttons, iqOrdDlg, iqGrpDlg, iqFtrDlg, iqDlg,
  iqSelDlg, Grids, DBGrids, Db, DBTables, ExtCtrls, iqQryInf, iqPrep,
  iqIniRep, iqWizDlg, iqFndDlg, DBCtrls, Menus, ODDBFind, MemoDlg, iqPrint;

type
  TVBQueryForm = class(TForm)
    VBDataInfo: TiqDBInfo;
    VBQueryInfo: TiqQueryInfo;
    Panel1: TPanel;
    VBStockQuery: TQuery;
    VBStockSource: TDataSource;
    SelectDlg: TiqSelectDialog;
    FilterDlg: TiqFilterDialog;
    GroupDlg: TiqGroupDialog;
    OrderDlg: TiqOrderDialog;
    SelectBtn: TSpeedButton;
    FilterBtn: TSpeedButton;
    GroupBtn: TSpeedButton;
    OrderBtn: TSpeedButton;
    ExecBtn: TSpeedButton;
    iqFieldsPreparer1: TiqFieldsPreparer;
    FindDlg: TiqFindDialog;
    FindBtn: TSpeedButton;
    WizardBtn: TSpeedButton;
    WizardDlg: TiqWizardDialog;
    Repositor: TiqIniRepositor;
    LoadBtn: TSpeedButton;
    SaveBtn: TSpeedButton;
    FindNextBtn: TSpeedButton;
    FindMenu: TODFindMenu;
    DBNavigator1: TDBNavigator;
    CloseBtn: TBitBtn;
    SQLDlg: TMemoDialog;
    SQLBtn: TSpeedButton;
    Panel2: TPanel;
    VBQueryMemo: TMemo;
    VBQueryGrid: TDBGrid;
    Splitter1: TSplitter;
    Printer: TiqResultPrinter;
    PrintBtn: TSpeedButton;
    PrintDlg: TPrintDialog;
    procedure SelectDlgExecute(Sender: TObject);
    procedure FilterDlgExecute(Sender: TObject);
    procedure GroupDlgExecute(Sender: TObject);
    procedure OrderDlgExecute(Sender: TObject);
    procedure ExecBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VBStockQueryAfterClose(DataSet: TDataSet);
    procedure FindDlgExecute(Sender: TObject);
    procedure VBQueryInfoChange(Sender: TObject; Changed: TiqChangeKinds);
    procedure WizardDlgExecute(Sender: TObject);
    procedure RepositorLoad(Sender: TObject);
    procedure RepositorStore(Sender: TObject);
    procedure FindDlgFindNext(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure SQLBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VBQueryForm: TVBQueryForm;

implementation

{$R *.DFM}

procedure TVBQueryForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VBStockQuery.Close;
  VBQueryForm.Release;
end;

procedure TVBQueryForm.SelectDlgExecute(Sender: TObject);
begin
  SelectDlg.Execute;
end;

procedure TVBQueryForm.FilterDlgExecute(Sender: TObject);
begin
  FilterDlg.Execute;
end;

procedure TVBQueryForm.GroupDlgExecute(Sender: TObject);
begin
  GroupDlg.Execute;
end;

procedure TVBQueryForm.OrderDlgExecute(Sender: TObject);
begin
  OrderDlg.Execute;
end;

procedure TVBQueryForm.ExecBtnClick(Sender: TObject);
var
  ix: Integer;
begin
  VBStockQuery.Active := ExecBtn.Down;
  if VBStockQuery.Active then
    for ix := 0 to VBStockQuery.FieldCount-1 do
      if VBStockQuery.Fields[ix] is TDateTimeField then
        TDateTimeField(VBStockQuery.Fields[ix]).DisplayFormat := 'dd/mm/yyyy';
//  FindBtn.Enabled := VBStockQuery.Active;
  PrintBtn.Enabled := VBStockQuery.Active;
end;

procedure TVBQueryForm.VBStockQueryAfterClose(DataSet: TDataSet);
begin
  ExecBtn.Down := False;
  FindBtn.Enabled := False;
  FindNextBtn.Enabled := False;
  PrintBtn.Enabled := False;
end;

procedure TVBQueryForm.FindDlgExecute(Sender: TObject);
begin
  FindNextBtn.Enabled := FindDlg.Execute;
end;

procedure TVBQueryForm.FindDlgFindNext(Sender: TObject);
begin
  FindDlg.FindNext;
end;

procedure TVBQueryForm.VBQueryInfoChange(Sender: TObject;
  Changed: TiqChangeKinds);
begin
  ExecBtn.Enabled := VBQueryInfo.Selects.Count > 0;
end;

procedure TVBQueryForm.WizardDlgExecute(Sender: TObject);
begin
  WizardDlg.Execute;
end;

procedure TVBQueryForm.RepositorLoad(Sender: TObject);
begin
  Repositor.Load;
end;

procedure TVBQueryForm.RepositorStore(Sender: TObject);
begin
  Repositor.Store;
end;

procedure TVBQueryForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBQueryForm.SQLBtnClick(Sender: TObject);
begin
  if SQLDlg.Execute(VBStockQuery.SQL) then
    VBStockQuery.Close;
end;

procedure TVBQueryForm.PrintBtnClick(Sender: TObject);
begin
  if PrintDlg.Execute then
    Printer.Print(VBQueryInfo.Title, VBQueryMemo.Lines);
end;

end.
