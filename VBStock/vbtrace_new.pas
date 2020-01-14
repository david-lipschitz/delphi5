unit vbtrace_new;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, StdCtrls, Grids, DBGrids, Mask, DBCtrls, Buttons, ExtCtrls,
  Menus, ODDBFind;

type
  TNewVBStripTraceForm = class(TForm)
    BoxDetailsGrid: TDBGrid;
    VBRcptGrid: TDBGrid;
    BoxDetailsQuery: TQuery;
    BoxDetailsQuerySource: TDataSource;
    VBRcpt: TTable;
    VBRcptSource: TDataSource;
    BoxDetailsQueryLOTNO: TIntegerField;
    BoxDetailsQueryBOXNO: TIntegerField;
    BoxDetailsQueryMETRICWIDTH: TSmallintField;
    BoxDetailsQueryQLTY: TStringField;
    BoxDetailsQuerySUM: TFloatField;
    BoxDetailsQueryLABELSTRU: TStringField;
    VBRcptDATEMANU: TDateTimeField;
    VBRcptFAULTS: TSmallintField;
    VBRcptWARPNO: TIntegerField;
    VBRcptPIECENO: TSmallintField;
    VBRcptSTRIPNO: TSmallintField;
    VBRcptDESPNO: TIntegerField;
    VBRcptROLLNO: TIntegerField;
    VBRcptPALLETNO: TIntegerField;
    VBRcptNETLENGTH: TFloatField;
    VBRcptGREIGENO: TSmallintField;
    VBRcptVTORDNO: TIntegerField;
    VBRcptDATERQD: TDateTimeField;
    VBRcptROWNO: TIntegerField;
    BoxDetailsQueryVBSTRU: TStringField;
    BoxDetailsQueryVBCOL: TStringField;
    VBRcptBOXNO: TIntegerField;
    BoxDetailsQueryCOUNT: TIntegerField;
    GreigeRcptSource: TDataSource;
    GreigeRcptGrid: TDBGrid;
    VBType: TTable;
    VBTypeSource: TDataSource;
    VBTypeVBSTRU: TStringField;
    VBTypeVBCOL: TStringField;
    VBTypeWARPCOL: TStringField;
    VBTypeWEFTSTRU: TStringField;
    VBTypeWEFTTWIST: TStringField;
    VBTypeWEFTCOL: TStringField;
    VBTypeWARPTYPE: TStringField;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    WarpType: TTable;
    WarpTypeSource: TDataSource;
    WarpTypeWARPTYPE: TStringField;
    WarpTypeWARP1STRU: TStringField;
    WarpTypeWARP1TWIST: TStringField;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit8: TDBEdit;
    CloseBitBtn: TBitBtn;
    WorWLotNo1: TTable;
    WorWLotNo1LOTNOREF1: TIntegerField;
    WorWLotNo1LOTNOREF2: TSmallintField;
    WorWLotNo1SINGLEMULTIPLE: TStringField;
    WorWLotNo1W1LOTNO1: TIntegerField;
    WorWLotNo1W1LOTNO2: TSmallintField;
    WorWLotNo1W1YNCOL: TStringField;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    WorWLotNo1Source: TDataSource;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    WorWLotNo2: TTable;
    WorWLotNo2Source: TDataSource;
    WorWLotNo2LOTNOREF1: TIntegerField;
    WorWLotNo2LOTNOREF2: TSmallintField;
    WorWLotNo2SINGLEMULTIPLE: TStringField;
    WorWLotNo2W1LOTNO1: TIntegerField;
    WorWLotNo2W1LOTNO2: TSmallintField;
    WorWLotNo2W1YNCOL: TStringField;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    VBDespHdr: TTable;
    VBDespHdrSource: TDataSource;
    VBDespHdrDESPNO: TIntegerField;
    VBDespHdrCUSTREF: TStringField;
    VBDespHdrDESPDATE: TDateTimeField;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    BoxDetailsQueryCOLUMN1: TStringField;
    BoxDetailsQueryVBFIN: TStringField;
    VBTypeVBFIN: TStringField;
    VBRcptFINNO: TIntegerField;
    VBRcptVBFIN: TStringField;
    GreigeRcpt: TQuery;
    GreigeRcptWARPNO: TIntegerField;
    GreigeRcptGREIGENO: TSmallintField;
    GreigeRcptVBSTRU: TStringField;
    GreigeRcptVBCOL: TStringField;
    GreigeRcptGREIGELENGTH: TIntegerField;
    GreigeRcptGREIGEDATE: TDateTimeField;
    GreigeRcptVBFIN: TStringField;
    GreigeRcptFINLENGTH: TIntegerField;
    GreigeRcptFINDATE: TDateTimeField;
    GreigeRcptFABRICLOTNO: TIntegerField;
    GreigeRcptWARPLOTNO1: TIntegerField;
    GreigeRcptWARPLOTNO2: TSmallintField;
    GreigeRcptWARPSINGLEMULTIPLE: TStringField;
    GreigeRcptWEFTLOTNO1: TIntegerField;
    GreigeRcptWEFTLOTNO2: TSmallintField;
    GreigeRcptWEFTSINGLEMULTIPLE: TStringField;
    PrintSpdBtn: TSpeedButton;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    EditDespNo: TEdit;
    EditBoxNo: TEdit;
    EditColour: TEdit;
    BoxDetailsQueryQLTYREASON: TStringField;
    OpenQueryBtn: TSpeedButton;
    ApplyFilterCheck: TCheckBox;
    DBNavigator: TDBNavigator;
    ODFindMenu1: TODFindMenu;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure OpenQueryBtnClick(Sender: TObject);
    procedure GridEnter(Sender: TObject);
    procedure ApplyFilterCheckClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  NewVBStripTraceForm: TNewVBStripTraceForm;

implementation

{$R *.DFM}

uses VBMain;

procedure TNewVBStripTraceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  VBDespHdr.Close;
  WorWLotNo2.Close;
  WorWLotNo1.Close;
  WarpType.Close;
  VBType.Close;
  GreigeRcpt.Close;
  VBRcpt.Close;
  BoxDetailsQuery.Close;
  Release;
end;

procedure TNewVBStripTraceForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TNewVBStripTraceForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TNewVBStripTraceForm.OpenQueryBtnClick(Sender: TObject);
var
  st: string;
begin
  VBDespHdr.Close;
  WorWLotNo2.Close;
  WorWLotNo1.Close;
  WarpType.Close;
  VBType.Close;
  GreigeRcpt.Close;
  VBRcpt.Close;
  BoxDetailsQuery.Close;
  if OpenQueryBtn.Down then
  begin
    with BoxDetailsQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select vbstru||vbcol||vbfin, lotno, boxno, metricwidth,');
      SQL.Add(' qlty, qltyreason, sum(netlength), labelstru, vbstru, vbcol,count(*),vbfin');
      SQL.Add('from vbrcpt');
      st := 'where';
      if ApplyFilterCheck.Checked then
      begin
        if (EditDespNo.Text <> '') and (EditDespNo.Text <> '0') then
        begin
          SQL.Add(st + ' despno = ' + EditDespNo.Text);
          st := 'and';
        end;
        if (EditBoxNo.Text <> '') and (EditBoxNo.Text <> '0') then
        begin
          SQL.Add(st + ' boxno = ' + EditBoxNo.Text);
          st := 'and';
        end;
        if EditColour.Text <> '' then
        begin
          SQL.Add(st + ' vbcol = "' + EditColour.Text + '"');
          st := 'and';
        end;
      end;
      SQL.Add('group by vbstru, vbcol, vbfin, lotno, boxno, metricwidth,');
      SQL.Add(' qlty, qltyreason, labelstru');
      Open;
    end;
    VBRcpt.Open;
    GreigeRcpt.Open;
    VBType.Open;
    WarpType.Open;
    WorWLotNo1.Open;
    WorWLotNo2.Open;
    VBDespHdr.Open;
  end;
end;

procedure TNewVBStripTraceForm.ApplyFilterCheckClick(Sender: TObject);
begin
  OpenQueryBtnClick(nil);  //redo query
end;

procedure TNewVBStripTraceForm.GridEnter(Sender: TObject);
begin
//  DBNavigator.DataSource := (Sender as TDBGrid).DataSource;
end;

end.
