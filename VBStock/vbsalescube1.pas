unit vbsalescube1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, TeeProcs, TeEngine, Chart, mxgraph, Grids,
  mxgrid, mxpivsrc, mxDB, mxstore, Db, DBTables, mxtables, Series;

type
  TfrmVBSalesCube1 = class(TForm)
    Panel1: TPanel;
    btnClose: TBitBtn;
    DecisionPivot1: TDecisionPivot;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    DecisionGrid1: TDecisionGrid;
    DecisionGraph1: TDecisionGraph;
    DecisionQuery1: TDecisionQuery;
    DecisionCube1: TDecisionCube;
    DecisionSource1: TDecisionSource;
    btnPrint: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVBSalesCube1: TfrmVBSalesCube1;

implementation

{$R *.DFM}

uses VBMain;

procedure TfrmVBSalesCube1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVBSalesCube1.FormShow(Sender: TObject);
begin
  Screen.Cursor:=crSQLWait;
  DecisionQuery1.Open;
  Beep;
  Screen.Cursor:=crDefault;
end;

procedure TfrmVBSalesCube1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DecisionQuery1.Close;
  Release;
end;

procedure TfrmVBSalesCube1.btnPrintClick(Sender: TObject);
begin
  Print;
end;

end.
