unit stoksitu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, mxgrid, ExtCtrls, mxpivsrc, mxDB, mxstore, Db, DBTables, mxtables;

type
  TStokSituForm = class(TForm)
    StockSituQuery: TDecisionQuery;
    DecisionCube1: TDecisionCube;
    DecisionSource1: TDecisionSource;
    DecisionPivot1: TDecisionPivot;
    DecisionGrid1: TDecisionGrid;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StokSituForm: TStokSituForm;

implementation

uses
  VBMain;

{$R *.DFM}

procedure TStokSituForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StockSituQuery.Close;
  StokSituForm.Release;
end;

procedure TStokSituForm.FormShow(Sender: TObject);
begin
  StockSituQuery.Open;
end;

end.
