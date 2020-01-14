unit vbtrace;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, StdCtrls, Grids, DBGrids, Mask, DBCtrls, Buttons, ExtCtrls,
  ODPopCal;

type
  TVBStripTraceForm = class(TForm)
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
    Label4: TLabel;
    EditDespNo: TEdit;
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
    Label1: TLabel;
    EditBoxNo: TEdit;
    CloseBitBtn: TBitBtn;
    Label11: TLabel;
    EditColour: TEdit;
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
    BoxDetailsQueryQLTYREASON: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure EditDespNoExit(Sender: TObject);
    procedure EditColourExit(Sender: TObject);
    procedure EditBoxNoExit(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VBStripTraceForm: TVBStripTraceForm;

implementation

{$R *.DFM}

uses VBMain;

procedure TVBStripTraceForm.FormShow(Sender: TObject);
begin
  BoxDetailsQuery.Prepare;
  BoxDetailsQuery.Params[0].AsInteger:=0;
  BoxDetailsQuery.Open;
  VBRcpt.Open;
  GreigeRcpt.Open;
  VBType.Open;
  WarpType.Open;
  WorWLotNo1.Open;
  WorWLotNo2.Open;
  VBDespHdr.Open;  
end;

procedure TVBStripTraceForm.FormClose(Sender: TObject;
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
  VBStripTraceForm.Release;
end;

procedure TVBStripTraceForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBStripTraceForm.EditDespNoExit(Sender: TObject);
begin
  if EditDespNo.Text = '' then
    EditDespNo.Text:='0'
  else
  begin
    EditBoxNo.Text:='0';
    EditColour.Text:='';
  end;
  BoxDetailsQuery.Close;
  BoxDetailsQuery.Params[0].AsInteger:=strtoint(EditDespNo.Text);
  BoxDetailsQuery.Open;
end;

procedure TVBStripTraceForm.EditColourExit(Sender: TObject);
begin
  if EditColour.Text='' then
  begin
    BoxDetailsQuery.Filtered:=false;
  end
  else
  begin
    BoxDetailsQuery.Filter:='vbcol='+EditColour.Text;
    BoxDetailsQuery.Filtered:=true;
  end;
end;

procedure TVBStripTraceForm.EditBoxNoExit(Sender: TObject);
begin
  if EditBoxNo.Text='' then
    EditBoxNo.Text:='0';
  if EditBoxNo.Text='0' then
  begin
    BoxDetailsQuery.Filtered:=false;
  end
  else
  begin
    BoxDetailsQuery.Filter:='boxno='+EditBoxNo.Text;
    BoxDetailsQuery.Filtered:=true;
  end;
end;

procedure TVBStripTraceForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
