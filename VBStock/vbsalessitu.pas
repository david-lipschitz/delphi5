unit vbsalessitu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, mxgrid, mxpivsrc, mxDB, mxstore, Db, DBTables, mxtables, ExtCtrls,
  TeeProcs, TeEngine, Chart, mxgraph, Series;

type
  TVBSalesSituForm = class(TForm)
    Panel1: TPanel;
    VBSalesQuery: TDecisionQuery;
    DecisionCube1: TDecisionCube;
    DecisionSource1: TDecisionSource;
    DecisionPivot1: TDecisionPivot;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Splitter2: TSplitter;
    DecisionGrid1: TDecisionGrid;
    DecisionGraph1: TDecisionGraph;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Series8: TBarSeries;
    Series9: TBarSeries;
    Series10: TBarSeries;
    Series11: TBarSeries;
    Series12: TBarSeries;
    Series13: TBarSeries;
    Series14: TBarSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VBSalesSituForm: TVBSalesSituForm;

implementation

uses
  VBMain;

{$R *.DFM}

procedure TVBSalesSituForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  VBSalesQuery.Close;
  VBSalesSituForm.Release;
end;

procedure TVBSalesSituForm.FormShow(Sender: TObject);
begin
  Screen.Cursor:=crSQLWait;
  VBSalesQuery.Open;
  Screen.Cursor:=crDefault;
end;

end.
