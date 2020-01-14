unit vbrefabric;
(*
Written DL030701
Modified DL040306 as not used or completed yet.
Notes:
  VBRefabricChanges holds the Changes that are to be made to the current roll;
  VBRefabric holds changes that have been posted already.

*)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Spin, DBLookup, Mask, Db, DBTables,
  Grids, DBGrids, ComCtrls;

type
  TfrmVBRefabric = class(TForm)
    Panel1: TPanel;
    gbxOrigPiece: TGroupBox;
    btnClose: TBitBtn;
    btnBoxSearch: TBitBtn;
    datOrigPiece: TDataSource;
    qryOrigPiece: TQuery;
    PrintSpdBtn: TSpeedButton;
    Label33: TLabel;
    Label11: TLabel;
    EditVBSTRU: TDBEdit;
    Label12: TLabel;
    EditVBCOL: TDBEdit;
    Label18: TLabel;
    EditVBFin: TDBEdit;
    Label9: TLabel;
    edtMetricWidth: TDBEdit;
    Label5: TLabel;
    EditBOXNO: TDBEdit;
    Label26: TLabel;
    DBEdit5: TDBEdit;
    Label41: TLabel;
    EditCustRef: TDBEdit;
    Label39: TLabel;
    EditSEQNO: TDBEdit;
    EditRollNo: TDBEdit;
    Label25: TLabel;
    EditLotNo: TDBEdit;
    Label4: TLabel;
    EditDATEMANU: TDBEdit;
    Label6: TLabel;
    EditStripNo: TDBEdit;
    Label8: TLabel;
    EditPieceNo: TDBEdit;
    Label16: TLabel;
    Label1: TLabel;
    EditFinNo: TDBEdit;
    EditGreigeNo: TDBEdit;
    Label27: TLabel;
    Label15: TLabel;
    EditWarpNo: TDBEdit;
    Label7: TLabel;
    EditFAULTS: TDBEdit;
    Label21: TLabel;
    EditLongLength: TDBEdit;
    Label20: TLabel;
    DBEdit3: TDBEdit;
    Label40: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    EditGROSSLENGTH: TDBEdit;
    Label3: TLabel;
    EditAllowance: TDBEdit;
    Label13: TLabel;
    EditNetLength: TDBEdit;
    Label30: TLabel;
    EditRowNo: TDBEdit;
    Label28: TLabel;
    EditReturned: TDBEdit;
    EditDespDate: TDBEdit;
    Label35: TLabel;
    EditDespNo: TDBEdit;
    Label17: TLabel;
    EditPalletNo: TDBEdit;
    Label23: TLabel;
    Label34: TLabel;
    ShowDatePicked: TDBEdit;
    Label37: TLabel;
    Label36: TLabel;
    EditVTOrdNo: TDBEdit;
    Label31: TLabel;
    EditDateRcvd: TDBEdit;
    EditInitials: TDBEdit;
    Label32: TLabel;
    ShowDateMod: TDBEdit;
    ShowUserMod: TDBEdit;
    Label2: TLabel;
    Label14: TLabel;
    Panel2: TPanel;
    Label24: TLabel;
    edtLabelCount: TEdit;
    LabelCountBtn: TSpinButton;
    tabNewPieces: TTable;
    datNewPieces: TDataSource;
    pgeNewPieces: TPageControl;
    tshNewPieces: TTabSheet;
    qryPieceHistory: TQuery;
    datPieceHistory: TDataSource;
    tshHistory: TTabSheet;
    dbgNewPieces: TDBGrid;
    dbgPieceHistory: TDBGrid;
    qryOrigPieceVBSTRU: TStringField;
    qryOrigPieceVBCOL: TStringField;
    qryOrigPieceLOTNO: TIntegerField;
    qryOrigPieceBOXNO: TIntegerField;
    qryOrigPieceDATEMANU: TDateTimeField;
    qryOrigPieceFAULTS: TSmallintField;
    qryOrigPieceMETRICWIDTH: TSmallintField;
    qryOrigPieceGROSSLENGTH: TFloatField;
    qryOrigPieceWARPNO: TIntegerField;
    qryOrigPiecePIECENO: TSmallintField;
    qryOrigPieceSTRIPNO: TSmallintField;
    qryOrigPieceINITIALS: TStringField;
    qryOrigPieceDESPNO: TIntegerField;
    qryOrigPieceDATERCVD: TDateTimeField;
    qryOrigPieceQLTY: TStringField;
    qryOrigPieceROLLNO: TIntegerField;
    qryOrigPieceLONGLENGTH: TFloatField;
    qryOrigPiecePALLETNO: TIntegerField;
    qryOrigPieceNETLENGTH: TFloatField;
    qryOrigPieceALLOWANCE: TFloatField;
    qryOrigPieceGREIGENO: TSmallintField;
    qryOrigPieceRETURNED: TStringField;
    qryOrigPieceVTORDNO: TIntegerField;
    qryOrigPieceDATERQD: TDateTimeField;
    qryOrigPieceROWNO: TIntegerField;
    qryOrigPieceDATEMOD: TDateTimeField;
    qryOrigPieceUSERMOD: TStringField;
    qryOrigPieceDESPDATE: TDateTimeField;
    qryOrigPieceFINNO: TIntegerField;
    qryOrigPieceVBFIN: TStringField;
    qryOrigPieceSEQNO: TIntegerField;
    qryOrigPieceQLTYREASON: TStringField;
    qryOrigPieceLABELSTRU: TStringField;
    qryOrigPieceLABELSTRUCUSTREF: TStringField;
    qryOrigPieceVTORDDETITEMNO: TIntegerField;
    qryOrigPieceVALUERATING: TIntegerField;
    qryBoxStripCount: TQuery;
    qryBoxStripCountSTRIPSINBOX: TIntegerField;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnPost: TBitBtn;
    btnClear: TBitBtn;
    edtStripsInBox: TDBEdit;
    Label19: TLabel;
    datBoxStripCount: TDataSource;
    tabNewPiecesROLLNO: TIntegerField;
    tabNewPiecesLINENO: TIntegerField;
    tabNewPiecesBOXNO: TIntegerField;
    tabNewPiecesGROSSLENGTH: TFloatField;
    tabNewPiecesFAULTS: TIntegerField;
    tabNewPiecesNETLENGTH: TFloatField;
    tabNewPiecesREFABRICDATE: TDateTimeField;
    qryPieceHistoryREF: TIntegerField;
    qryPieceHistoryORIGROLLNO: TIntegerField;
    qryPieceHistoryNEWROLLNO: TIntegerField;
    qryPieceHistoryORIGBOXNO: TIntegerField;
    qryPieceHistoryNEWBOXNO: TIntegerField;
    qryPieceHistoryMANUDATE: TDateTimeField;
    qryPieceHistoryREFABRICDATE: TDateTimeField;
    qryPieceHistoryGROSSLENGTH: TFloatField;
    qryPieceHistoryFAULTS: TIntegerField;
    qryPieceHistoryNETLENGTH: TFloatField;
    qryPieceHistoryROWNO: TIntegerField;
    qryPieceHistoryDATEENT: TDateTimeField;
    qryPieceHistoryUSERENT: TStringField;
    qryPieceHistorySTARTROLLNO: TIntegerField;
    qryFetchNextLineNo: TQuery;
    qryFetchNextLineNoMAXLINENO: TIntegerField;
    qryDeleteChanges: TQuery;
    tabNewPiecesALLOWANCE: TFloatField;
    qryCheckChanges: TQuery;
    qryCheckChangesGROSSLENGTH: TFloatField;
    qryCheckChangesALLOWANCE: TFloatField;
    qryCheckChangesNETLENGTH: TFloatField;
    qryGetMaxStripNo: TQuery;
    qryGetMaxStripNoMAXSTRIPNO: TSmallintField;
    qryGetMaxBoxNo: TQuery;
    qryGetMaxBoxNoMAXBOXNO: TIntegerField;
    qryInsertVBRcpt: TQuery;
    qryInsertVBRefabric: TQuery;
    StatusBar: TStatusBar;
    Label22: TLabel;
    GenRollNoProc: TStoredProc;
    spGenRefabricRef: TStoredProc;
    qryGetStartRollNo: TQuery;
    qryGetStartRollNoSTARTROLLNO: TIntegerField;
    FindFastNextIncompleteSpnBtn: TSpeedButton;
    qryGetTotals: TQuery;
    qryGetTotalsGROSSLENGTH: TFloatField;
    qryGetTotalsALLOWANCE: TFloatField;
    qryGetTotalsNETLENGTH: TFloatField;
    qryGetTotalsFAULTS: TIntegerField;
    Panel3: TPanel;
    Label29: TLabel;
    edtNewGrossLength: TDBEdit;
    edtNewFaults: TDBEdit;
    edtNewAllowance: TDBEdit;
    edtNewNet: TDBEdit;
    datGetTotals: TDataSource;
    tabNewPiecesMETRICWIDTH: TIntegerField;
    tabNewPiecesQLTY: TStringField;
    tabNewPiecesQLTYREASON: TStringField;
    tabNewPiecesLABELSTRU: TStringField;
    qryPieceHistoryALLOWANCE: TFloatField;
    qryPieceHistoryMETRICWIDTH: TIntegerField;
    qryPieceHistoryQLTY: TStringField;
    qryPieceHistoryQLTYREASON: TStringField;
    qryPieceHistoryLABELSTRU: TStringField;
    qryUpdateVBRcpt: TQuery;
    btnStrips: TBitBtn;
    QltyReasonQuery: TQuery;
    qryCheckIfDifferentMW: TQuery;
    qryCheckIfDifferentMWROLLNO: TIntegerField;
    qryRecalcGrossm: TQuery;
    qryRecalcGrossmRECALCGROSSMETRES: TFloatField;
    Label38: TLabel;
    qryGetTotalsRECALCGROSSMETRES: TFloatField;
    edtRecalcGross: TDBEdit;
    qryFirstRoll: TQuery;
    qryFirstRollBOXNO: TIntegerField;
    qryQuery: TQuery;
    qryLabels: TQuery;
    qryLabelsVBSTRU: TStringField;
    qryLabelsVBCOL: TStringField;
    qryLabelsLOTNO: TIntegerField;
    qryLabelsBOXNO: TIntegerField;
    qryLabelsDATEMANU: TDateTimeField;
    qryLabelsFAULTS: TSmallintField;
    qryLabelsMETRICWIDTH: TSmallintField;
    qryLabelsGROSSLENGTH: TFloatField;
    qryLabelsWARPNO: TIntegerField;
    qryLabelsPIECENO: TSmallintField;
    qryLabelsSTRIPNO: TSmallintField;
    qryLabelsINITIALS: TStringField;
    qryLabelsDESPNO: TIntegerField;
    qryLabelsDATERCVD: TDateTimeField;
    qryLabelsQLTY: TStringField;
    qryLabelsROLLNO: TIntegerField;
    qryLabelsLONGLENGTH: TFloatField;
    qryLabelsPALLETNO: TIntegerField;
    qryLabelsNETLENGTH: TFloatField;
    qryLabelsALLOWANCE: TFloatField;
    qryLabelsGREIGENO: TSmallintField;
    qryLabelsRETURNED: TStringField;
    qryLabelsVTORDNO: TIntegerField;
    qryLabelsDATERQD: TDateTimeField;
    qryLabelsROWNO: TIntegerField;
    qryLabelsDATEMOD: TDateTimeField;
    qryLabelsUSERMOD: TStringField;
    qryLabelsDESPDATE: TDateTimeField;
    qryLabelsFINNO: TIntegerField;
    qryLabelsVBFIN: TStringField;
    qryLabelsSEQNO: TIntegerField;
    qryLabelsQLTYREASON: TStringField;
    qryLabelsLABELSTRU: TStringField;
    qryLabelsLABELSTRUCUSTREF: TStringField;
    qryLabelsVTORDDETITEMNO: TIntegerField;
    qryLabelsVALUERATING: TIntegerField;
    qryLabelsIMPERIALWIDTH: TStringField;
    qryLabelsMETRICLABELDESCR: TStringField;
    qryCustPart: TQuery;
    qryCustPartDESCR: TStringField;
    qryCustPartSTYLEDESCR: TStringField;
    qryCustPartPARTNO: TStringField;
    Timer1: TTimer;
    btnRefabricBoxSearch: TBitBtn;
    btnRefabricWIP: TBitBtn;
    qryPieceHistoryDESPDATE: TDateTimeField;
    dbnNewPieces: TDBNavigator;
    tabNewPiecesLABELSTRUCUSTREF: TStringField;
    qryPieceHistoryLABELSTRUCUSTREF: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnBoxSearchClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure tabNewPiecesBeforeEdit(DataSet: TDataSet);
    procedure tabNewPiecesBeforeInsert(DataSet: TDataSet);
    procedure tabNewPiecesBeforeCancel(DataSet: TDataSet);
    procedure tabNewPiecesAfterCancel(DataSet: TDataSet);
    procedure tabNewPiecesAfterDelete(DataSet: TDataSet);
    procedure tabNewPiecesAfterPost(DataSet: TDataSet);
    procedure tabNewPiecesBeforeDelete(DataSet: TDataSet);
    procedure tabNewPiecesBeforePost(DataSet: TDataSet);
    procedure tabNewPiecesPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tabNewPiecesNewRecord(DataSet: TDataSet);
    procedure datNewPiecesStateChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnStripsClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnRefabricBoxSearchClick(Sender: TObject);
    procedure btnRefabricWIPClick(Sender: TObject);
    procedure dbgPieceHistoryDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgPieceHistoryDblClick(Sender: TObject);
    procedure LabelCountBtnDownClick(Sender: TObject);
    procedure LabelCountBtnUpClick(Sender: TObject);
  private
    { Private declarations }
    BarCodePrinterReady:boolean;
    LabelDescr:string[8];
    StyleDescr:string[8];
    ColorDescr:string[9];
    PartNo:string[11];
    Heading:string[25];
    procedure CalcAllowance(Faults:integer;LongLength:real;MetricWidth:integer);
    procedure RecalcTotals;
    procedure PositionOriginalBox(BoxNo: integer);
    procedure PrintLabels;
  public
    { Public declarations }
  end;

var
  frmVBRefabric: TfrmVBRefabric;

implementation

{$R *.DFM}

uses Vbmain, Vbbarcde, Vbmodal {, VBBarCde, VBBoxLab, Reslit};

procedure TfrmVBRefabric.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

procedure TfrmVBRefabric.btnCloseClick(Sender: TObject);
begin
  //Close; - not rqd because form is modal
end;

procedure TfrmVBRefabric.PositionOriginalBox(BoxNo:integer);
begin
  //the original box is the box that was originally changed (the internal box)
  //but note that the box no. does not change.
  qryBoxStripCount.Close;
  qryPieceHistory.Close;
  tabNewPieces.Close;
  edtStripsInBox.Color:=clRed;
  dbgNewPieces.ReadOnly:=true;
  dbgNewPieces.Color:=clBtnFace;
  tshNewPieces.TabVisible:=false;
  //btnPost.Enabled:=false; - not required because all the buttons in the middle
  //of the screen link to VBRefabricChanges which holds the records until they
  //are posted to VBRefabric.  At this point the Barcode labels are printed.
  //xx NB add an extra (explanatory) bar code label.
  //btnClear.Enabled:=false;

  qryOrigPiece.Close;
  qryOrigPiece.ParamByName('BoxNo').AsInteger:=BoxNo;
  qryOrigPiece.Open;
  if qryOrigPieceBOXNO.IsNull then
    ShowMessage('Box '+qryOrigPieceBOXNO.AsString+' not found')
  else if (qryOrigPiecePALLETNO.AsInteger<>0) or (qryOrigPieceDESPNO.AsInteger<>0) then
  begin
    qryBoxStripCount.Close;
    qryBoxStripCount.ParamByName('BoxNo').AsInteger:=BoxNo;
    qryBoxStripCount.Open;
    qryPieceHistory.Close;
    qryPieceHistory.ParamByName('OrigRollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
    qryPieceHistory.Open;
    pgeNewPieces.ActivePage:=tshHistory;
  end
  else
  begin
    qryBoxStripCount.Close;
    qryBoxStripCount.ParamByName('BoxNo').AsInteger:=BoxNo;
    qryBoxStripCount.Open;
    if qryBoxStripCountSTRIPSINBOX.AsInteger=1 then
    begin
      edtStripsInBox.Color:=clBtnFace;
      qryPieceHistory.Close;
      qryPieceHistory.ParamByName('OrigRollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
      qryPieceHistory.Open;
      tabNewPieces.Close;
      tabNewPieces.Filter:='RollNo='+qryOrigPieceROLLNO.AsString;
      tabNewPieces.Filtered:=true;
      tabNewPieces.Open;
      tshNewPieces.TabVisible:=true;
      pgeNewPieces.ActivePage:=tshNewPieces;
      dbgNewPieces.ReadOnly:=false;
      dbgNewPieces.Color:=clWindow;
      //btnPost.Enabled:=true;
      //btnClear.Enabled:=true;
      RecalcTotals;
    end;
    //else - this else is redundant (ie it will never be called)
    //  pgeNewPieces.ActivePage:=tshHistory;
    if not tabNewPiecesROLLNO.IsNull then
      pgeNewPieces.ActivePage:=tshNewPieces
    else
    begin
      if not qryPieceHistoryREF.IsNull then
        pgeNewPieces.ActivePage:=tshHistory;
    end;
  end;
end;

procedure TfrmVBRefabric.btnBoxSearchClick(Sender: TObject);
var
  BoxStr:string;
begin
  if not tabNewPiecesROLLNO.IsNull then
    raise Exception.Create('Cannot search if new piece information exists');
  if InputQuery('Box Search',
    'Enter box code',
    BoxStr) then
  begin
    PositionOriginalBox(strtoint(BoxStr));
  end;
end;

procedure TfrmVBRefabric.btnRefabricWIPClick(Sender: TObject);
begin
  //show boxes that have already been 'refabricked'
  if VBPickDlgForm.ShowModalRefabricWIP = mrOk then
    PositionOriginalBox(VBPickDlgForm.RefabricBoxNo);
end;

procedure TfrmVBRefabric.btnRefabricBoxSearchClick(Sender: TObject);
begin
  //show boxes that have already been 'refabricked'
  if VBPickDlgForm.ShowModalRefabrickedBoxes = mrOk then
    PositionOriginalBox(VBPickDlgForm.RefabricBoxNo);
end;

procedure TfrmVBRefabric.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TfrmVBRefabric.tabNewPiecesBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TfrmVBRefabric.tabNewPiecesBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TfrmVBRefabric.tabNewPiecesBeforeCancel(DataSet: TDataSet);
begin
  if tabNewPieces.State=dsInsert then
    if MessageDlg('Cancel roll being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TfrmVBRefabric.tabNewPiecesAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
end;

procedure TfrmVBRefabric.tabNewPiecesAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TfrmVBRefabric.RecalcTotals;
begin
  qryGetTotals.Close;
  qryGetTotals.ParamByName('RollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
  qryGetTotals.Open;
end;

procedure TfrmVBRefabric.tabNewPiecesAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit; //DL170698 was at eo routine
  RecalcTotals;
end;

procedure TfrmVBRefabric.tabNewPiecesBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete rollno?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TfrmVBRefabric.tabNewPiecesBeforePost(DataSet: TDataSet);
begin
  //added qlty and labelstru checking DL070531
  if (tabNewPiecesQLTY.AsString<>'') and
    (tabNewPiecesQLTY.AsString<>'S') and
    (tabNewPiecesQLTY.AsString<>'N') and
    (tabNewPiecesQLTY.AsString<>'T') and
    (tabNewPiecesQLTY.AsString<>'A') then
    raise Exception.Create('Qlty must be <b>,S,N,T,A');
  //check that the labelstru is valid. Added DL230899
  if (tabNewPiecesLABELSTRU.AsString<>'VT') and
     (tabNewPiecesLABELSTRU.AsString<>'HD') and
     (tabNewPiecesLABELSTRU.AsString<>'FB') and
     (tabNewPiecesLABELSTRU.AsString<>'FD') and //FD added DL270100
     (tabNewPiecesLABELSTRU.AsString<>'LH') and
     (tabNewPiecesLABELSTRU.AsString<>'IA') and
     (tabNewPiecesLABELSTRU.AsString<>'CU') then //CU added DL230400
    raise Exception.Create('Label Structure (LS) must be VT,HD,FB,FD,LH,IA,CU');
  //check that qltyreason is valid for this type of qlty
  //qltyreason cannot be blank
  QltyReasonQuery.Close;
  if tabNewPiecesQLTY.AsString='' then
    QltyReasonQuery.ParamByName('FirstQlty').AsString:='Y'
  else
    QltyReasonQuery.ParamByName('FirstQlty').AsString:='N';
  QltyReasonQuery.ParamByName('QltyReason').AsString:=tabNewPiecesQLTYREASON.AsString;
  QltyReasonQuery.Open;
  if QltyReasonQuery.BOF=QltyReasonQuery.EOF then
    raise Exception.Create('Invalid Reason for this quality type');

  //added DL070601
  if tabNewPiecesLABELSTRU.AsString='CU' then
  begin
    //get the customer reference
    if VBPickDlgForm.ShowModalSups('CU') = mrOk then {CU for customers}
      tabNewPiecesLABELSTRUCUSTREF.AsString:=VBPickDlgForm.SupRef;
  end;

  CalcAllowance(tabNewPiecesFAULTS.AsInteger,qryOrigPieceLONGLENGTH.AsFloat,qryOrigPieceMETRICWIDTH.AsInteger);
end;

procedure TfrmVBRefabric.CalcAllowance(Faults:integer;LongLength:real;MetricWidth:integer);
var
  Allowance:real;
begin
  if MetricWidth=0 then
  begin
    ShowMessage('MetricWidth = 0; Please tell David');
    MetricWidth:=89;
  end;
  LongLength:=0;
  if MetricWidth>=2000 then //.5m per fault
    Allowance:=(Faults/2)+LongLength
  else
    Allowance:=Faults+LongLength;
  if (Allowance>15) and (qryOrigPieceQLTY.Value='') then
    qryOrigPieceQLTY.Value:='N';  {second if faults>15, ie Allowance>30}
  //Hunter Douglas or Levolor Label
  if (qryOrigPieceLABELSTRU.Value='HD') or (qryOrigPieceLABELSTRU.Value='LH')  or (qryOrigPieceLABELSTRU.Value='IA') then
    Allowance:=Allowance/mtrToyds;
  tabNewPiecesALLOWANCE.ReadOnly:=false;
  tabNewPiecesALLOWANCE.AsFloat:=Allowance;
  tabNewPiecesALLOWANCE.ReadOnly:=true;
  tabNewPiecesNETLENGTH.ReadOnly:=false;
  tabNewPiecesNETLENGTH.AsFloat:=tabNewPiecesGROSSLENGTH.AsFloat-Allowance;
  tabNewPiecesNETLENGTH.ReadOnly:=false;
end;

procedure TfrmVBRefabric.tabNewPiecesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TfrmVBRefabric.tabNewPiecesNewRecord(DataSet: TDataSet);
begin
  tabNewPiecesRollNo.ReadOnly:=false;
  tabNewPiecesLINENO.ReadOnly:=false;
  tabNewPiecesBOXNO.ReadOnly:=false;
  tabNewPiecesMETRICWIDTH.ReadOnly:=false; //for now: cannot modify
  tabNewPiecesROLLNO.AsInteger:=qryOrigPieceROLLNO.AsInteger;
  qryFetchNextLineNo.Close;
  qryFetchNextLineNo.ParamByName('RollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
  qryFetchNextLineNo.Open;
  if (qryFetchNextLineNoMAXLINENO.AsInteger=0) or (qryFetchNextLineNoMAXLINENO.IsNull) then
    tabNewPiecesLINENO.AsInteger:=1
  else
    tabNewPiecesLINENO.AsInteger:=qryFetchNextLineNoMAXLINENO.AsInteger+1;
  tabNewPiecesBOXNO.AsInteger:=qryOrigPieceBOXNO.AsInteger;
  tabNewPiecesREFABRICDATE.AsDateTime:=date;
  tabNewPiecesMETRICWIDTH.AsInteger:=qryOrigPieceMETRICWIDTH.AsInteger;
  tabNewPiecesQLTY.AsString:=qryOrigPieceQLTY.AsString;
  tabNewPiecesQLTYREASON.AsString:=qryOrigPieceQLTYREASON.AsString;
  tabNewPiecesLABELSTRU.AsString:=qryOrigPieceLABELSTRU.AsString;
  tabNewPiecesFAULTS.AsInteger:=0;
  tabNewPiecesMETRICWIDTH.ReadOnly:=true;
  tabNewPiecesRollNo.ReadOnly:=true;
  tabNewPiecesLINENO.ReadOnly:=true;
  tabNewPiecesBOXNO.ReadOnly:=true;
end;

procedure TfrmVBRefabric.datNewPiecesStateChange(Sender: TObject);
begin
  btnSave.Enabled := tabNewPieces.State in [dsEdit, dsInsert];
  btnCancel.Enabled := btnSave.Enabled;
  if tabNewPiecesROLLNO.IsNull then
    btnClose.Enabled:=true
  else
    btnClose.Enabled := tabNewPieces.State = dsBrowse;
  btnPost.Enabled := (tabNewPieces.State = dsBrowse) and (not tabNewPiecesROLLNO.IsNull); //xx but only if records exist (all records in VBRefabricChanges are not posted)
  btnClear.Enabled := (tabNewPieces.State = dsBrowse) and (not tabNewPiecesROLLNO.IsNull);
end;

procedure TfrmVBRefabric.btnClearClick(Sender: TObject);
var
  lBoxNo:integer;
begin
  lBoxNo:=qryOrigPieceBOXNO.AsInteger;
  //if MessageDlg('Clear New Pieces?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
  //  Abort;
  qryDeleteChanges.Close;
  qryDeleteChanges.ParamByName('RollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
  MainForm.Database.StartTransaction;
  qryDeleteChanges.ExecSQL;
  MainForm.Database.Commit;
  PositionOriginalBox(lBoxNo);
end;

procedure TfrmVBRefabric.FormShow(Sender: TObject);
begin
  qryOrigPiece.Close;
  qryBoxStripCount.Close;
  qryBoxStripCount.Close;
  qryPieceHistory.Close;
  tabNewPieces.Close;
  //if current roll then go to it
  qryFirstRoll.Close;
  qryFirstRoll.Open;
  if not qryFirstRollBOXNO.IsNull then
    PositionOriginalBox(qryFirstRollBOXNO.AsInteger);
end;

procedure TfrmVBRefabric.btnCancelClick(Sender: TObject);
begin
  tabNewPieces.Cancel;
end;

procedure TfrmVBRefabric.btnSaveClick(Sender: TObject);
begin
  tabNewPieces.Post;
end;

procedure TfrmVBRefabric.btnPostClick(Sender: TObject);
var
  lStartRollNo,lNextStripNo,lNextBoxNo,lNextRollNo,lNextRefabricRef:integer;
  lFirstRoll:boolean; //set to false after first roll (which is changed iso added)
    //has been processed
begin
  //check that the sum of gross = total gross on header and that
  //sum of netlength <= sum of
  qryCheckChanges.Close;
  qryCheckChanges.ParamByName('ROLLNO').AsInteger:=qryOrigPieceROLLNO.AsInteger;
  qryCheckChanges.Open;
  if (qryCheckChangesGROSSLENGTH.AsFloat=0) or (qryCheckChangesGROSSLENGTH.IsNull) then
    raise Exception.Create('Error: No Gross Length to Post.');

  //sum the gross length in case one of the new strips are not full width
  //make it a 'do you want to continue' message
  //if new strips all the same width as the original then the gross length must be
  //equal
  qryCheckIfDifferentMW.Close;
  qryCheckIfDifferentMW.ParamByName('RollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
  qryCheckIfDifferentMW.ParamByName('OriginalMetricWidth').AsInteger:=qryOrigPieceMETRICWIDTH.AsInteger;
  qryCheckIfDifferentMW.Open;
  if qryCheckIfDifferentMWROLLNO.IsNull then
    if (qryCheckChangesGROSSLENGTH.AsFloat<>qryOrigPieceGROSSLENGTH.AsFloat) then
      raise Exception.Create('Error: New Gross Length must equal Existing Gross Length.');
  //if new strips different length, then display a message
  qryRecalcGrossm.Close;
  qryRecalcGrossm.ParamByName('RollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
  qryRecalcGrossm.Open;
  if qryOrigPieceGROSSLENGTH.AsFloat<>qryRecalcGrossmRECALCGROSSMETRES.AsFloat then
    if MessageDlg('Warning: New Net Length or Allowance < existing net length or allowance: continue?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;

  if (qryCheckChangesALLOWANCE.AsFloat<qryOrigPieceALLOWANCE.AsFloat)
    or (qryCheckChangesNETLENGTH.AsFloat<qryOrigPieceNETLENGTH.AsFloat) then
  begin
    if MessageDlg('Warning: New Net Length or Allowance < existing net length or allowance: continue?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
  end;
//ShowMessage('No Implemented Yet');

  if MessageDlg('Warning: Do you wish to create new full width rolls?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    //create the rolls: after creation, add records to vbrefabric and remove
    //  records from vbrefabricchange.  Then refresh top of screen (using bookmark)

    //Get StartingRollNo
    qryGetStartRollNo.Close;
    qryGetStartRollNo.ParamByName('NewRollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
    qryGetStartRollNo.Open;
    if qryGetStartRollNoSTARTROLLNO.IsNull then
      lStartRollNo:=qryOrigPieceROLLNO.AsInteger
    else
      lStartRollNo:=qryGetStartRollNoSTARTROLLNO.AsInteger;

    MainForm.Database.StartTransaction;
    try
      lFirstRoll:=true;
      tabNewPieces.First;
      while not tabNewPieces.EOF do
      begin
        //check all the qualities and quality reasons
        StatusBar.SimpleText:='Posting Boxes';
        Application.ProcessMessages;
        (*Only do this check if qlty or qltyreason can change in the program xx DL040307
        if (tabNewPiecesQLTY.AsString<>'') and
          (tabNewPiecesQLTY.AsString<>'S') and
          (tabNewPiecesQLTY.AsString<>'N') and
          (tabNewPiecesQLTY.AsString<>'T') and
          (tabNewPiecesQLTY.AsString<>'A') then
          raise Exception.Create('Qlty must be <b>,S,N,T,A');
        //check that the labelstru is valid. Added DL230899
        if (tabNewPiecesLABELSTRU.AsString<>'VT') and
           (tabNewPiecesLABELSTRU.AsString<>'HD') and
           (tabNewPiecesLABELSTRU.AsString<>'FB') and
           (tabNewPiecesLABELSTRU.AsString<>'FD') and //FD added DL270100
           (tabNewPiecesLABELSTRU.AsString<>'LH') and
           (tabNewPiecesLABELSTRU.AsString<>'IA') and
           (tabNewPiecesLABELSTRU.AsString<>'CU') then //CU added DL230400
          raise Exception.Create('Label Structure (LS) must be VT,HD,FB,FD,LH,IA,CU');
        //check that qltyreason is valid for this type of qlty
        //qltyreason cannot be blank
        QltyReasonQuery.Close;
        if tabNewPiecesQLTY.AsString='' then
          QltyReasonQuery.ParamByName('FirstQlty').AsString:='Y'
        else
          QltyReasonQuery.ParamByName('FirstQlty').AsString:='N';
        QltyReasonQuery.ParamByName('QltyReason').AsString:=tabNewPiecesQLTYREASON.AsString;
        QltyReasonQuery.Open;
        if QltyReasonQuery.BOF=QltyReasonQuery.EOF then
          raise Exception.Create('Invalid Reason for this quality type');
        *)

        if lFirstRoll then
        begin
          //modify the first VBRcpt record
          qryUpdateVBRcpt.Close;
          //qryUpdateVBRcpt.ParamByName('BoxNo').AsInteger:=lNextBoxNo;
          lNextRollNo:=qryOrigPieceROLLNO.AsInteger;
          qryUpdateVBRcpt.ParamByName('RollNo').AsInteger:=lNextRollNo; //rollno is the key
          qryUpdateVBRcpt.ParamByName('Qlty').AsString:=tabNewPiecesQLTY.AsString;
          qryUpdateVBRcpt.ParamByName('QltyReason').AsString:=tabNewPiecesQLTYREASON.AsString;
          qryUpdateVBRcpt.ParamByName('MetricWidth').AsInteger:=tabNewPiecesMETRICWIDTH.AsInteger;
          qryUpdateVBRcpt.ParamByName('GrossLength').AsFloat:=tabNewPiecesGROSSLENGTH.AsFloat;
          qryUpdateVBRcpt.ParamByName('Faults').AsInteger:=tabNewPiecesFAULTS.AsInteger;
          qryUpdateVBRcpt.ParamByName('LongLength').AsFloat:=0;
          qryUpdateVBRcpt.ParamByName('Allowance').AsFloat:=tabNewPiecesALLOWANCE.AsFloat;
          qryUpdateVBRcpt.ParamByName('NetLength').AsFloat:=tabNewPiecesNETLENGTH.AsFloat;
          qryUpdateVBRcpt.ParamByName('LabelStru').AsString:=tabNewPiecesLABELSTRU.AsString;
          qryUpdateVBRcpt.ParamByName('LabelStruCustRef').AsString:=qryOrigPieceLABELSTRUCUSTREF.AsString;
          qryUpdateVBRcpt.ExecSQL;
          lFirstRoll:=false;

          //create the -ve vbrefabric record
          spGenRefabricRef.ExecProc;
          lNextRefabricRef:=spGenRefabricRef.Params[0].AsInteger;
          lNextBoxNo:=qryOrigPieceBOXNO.AsInteger;
          qryInsertVBRefabric.Close;
          qryInsertVBRefabric.ParamByName('Ref').AsInteger:=lNextRefabricRef;
          qryInsertVBRefabric.ParamByName('OrigRollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
          qryInsertVBRefabric.ParamByName('NewRollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
          qryInsertVBRefabric.ParamByName('OrigBoxNo').AsInteger:=qryOrigPieceBOXNO.AsInteger;
          qryInsertVBRefabric.ParamByName('NewBoxNo').AsInteger:=qryOrigPieceBOXNO.AsInteger;
          qryInsertVBRefabric.ParamByName('ManuDate').AsDateTime:=qryOrigPieceDATEMANU.AsDateTime;
          qryInsertVBRefabric.ParamByName('RefabricDate').AsDateTime:=tabNewPiecesREFABRICDATE.AsDateTime;
          qryInsertVBRefabric.ParamByName('GrossLength').AsFloat:=-qryOrigPieceGROSSLENGTH.AsFloat; //-ve (note can display -ve rows in red) xx
          qryInsertVBRefabric.ParamByName('Faults').AsInteger:=-qryOrigPieceFAULTS.AsInteger;
          qryInsertVBRefabric.ParamByName('Allowance').AsFloat:=-qryOrigPieceALLOWANCE.AsFloat;
          qryInsertVBRefabric.ParamByName('NetLength').AsFloat:=-qryOrigPieceNETLENGTH.AsFloat;
          qryInsertVBRefabric.ParamByName('RowNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
          qryInsertVBRefabric.ParamByName('DateEnt').AsDateTime:=qryOrigPieceDATERCVD.AsDateTime;
          qryInsertVBRefabric.ParamByName('UserEnt').AsString:=qryOrigPieceINITIALS.AsString;
          //the very first roll in case refabricked a number of times
          qryInsertVBRefabric.ParamByName('StartRollNo').AsInteger:=lStartRollNo; //was qryOrigPieceROLLNO.AsInteger; fixed DL040307
          qryInsertVBRefabric.ParamByName('MetricWidth').AsInteger:=qryOrigPieceMETRICWIDTH.AsInteger;
          qryInsertVBRefabric.ParamByName('Qlty').AsString:=qryOrigPieceQLTY.AsString;
          qryInsertVBRefabric.ParamByName('QltyReason').AsString:=qryOrigPieceQLTYREASON.AsString;
          qryInsertVBRefabric.ParamByName('LabelStru').AsString:=qryOrigPieceLABELSTRU.AsString;
          qryInsertVBRefabric.ExecSQL;
        end
        else
        begin
          //create the other VBRcpt record
          qryGetMaxStripNo.Close;
          qryGetMaxStripNo.ParamByName('WarpNo').AsInteger:=qryOrigPieceWARPNO.AsInteger;
          qryGetMaxStripNo.ParamByName('PieceNo').AsInteger:=qryOrigPiecePIECENO.AsInteger;
          qryGetMaxStripNo.Open;
          if (qryGetMaxStripNoMAXSTRIPNO.IsNull) or (qryGetMaxStripNoMAXSTRIPNO.AsInteger=0) then
            raise Exception.Create('Error with Strip No. Cannot post. Please tell David.');
          lNextStripNo:=qryGetMaxStripNoMAXSTRIPNO.AsInteger+1;
          qryGetMaxBoxNo.Close;
          qryGetMaxBoxNo.Open;
          lNextBoxNo:=qryGetMaxBoxNoMAXBOXNO.AsInteger+1;
          GenRollNoProc.ExecProc; //Generate next RollNo
          lNextRollNo:=GenRollNoProc.Params[0].AsInteger;

          qryInsertVBRcpt.Close;
          qryInsertVBRcpt.ParamByName('VBStru').AsString:=qryOrigPieceVBSTRU.AsString;
          qryInsertVBRcpt.ParamByName('VBCol').AsString:=qryOrigPieceVBCOL.AsString;
          qryInsertVBRcpt.ParamByName('VBFin').AsString:=qryOrigPieceVBFIN.AsString;
          qryInsertVBRcpt.ParamByName('LotNo').AsInteger:=qryOrigPieceLOTNO.AsInteger;
          qryInsertVBRcpt.ParamByName('BoxNo').AsInteger:=lNextBoxNo;
          qryInsertVBRcpt.ParamByName('DateManu').AsDateTime:=qryOrigPieceDATEMANU.AsDateTime;
          qryInsertVBRcpt.ParamByName('Qlty').AsString:=tabNewPiecesQLTY.AsString;
          qryInsertVBRcpt.ParamByName('QltyReason').AsString:=tabNewPiecesQLTYREASON.AsString;
          qryInsertVBRcpt.ParamByName('MetricWidth').AsInteger:=tabNewPiecesMETRICWIDTH.AsInteger;
          qryInsertVBRcpt.ParamByName('GrossLength').AsFloat:=tabNewPiecesGROSSLENGTH.AsFloat;
          qryInsertVBRcpt.ParamByName('Faults').AsInteger:=tabNewPiecesFAULTS.AsInteger;
          qryInsertVBRcpt.ParamByName('LongLength').AsFloat:=0;
          qryInsertVBRcpt.ParamByName('Allowance').AsFloat:=tabNewPiecesALLOWANCE.AsFloat;
          qryInsertVBRcpt.ParamByName('NetLength').AsFloat:=tabNewPiecesNETLENGTH.AsFloat;
          qryInsertVBRcpt.ParamByName('WarpNo').AsInteger:=qryOrigPieceWARPNO.AsInteger;
          qryInsertVBRcpt.ParamByName('PieceNo').AsInteger:=qryOrigPiecePIECENO.AsInteger;
          qryInsertVBRcpt.ParamByName('StripNo').AsInteger:=lNextStripNo;
          qryInsertVBRcpt.ParamByName('RollNo').AsInteger:=lNextRollNo;
          qryInsertVBRcpt.ParamByName('Initials').AsString:=UserInitials;
          qryInsertVBRcpt.ParamByName('DateRcvd').AsDateTime:=now;
          qryInsertVBRcpt.ParamByName('GreigeNo').AsInteger:=qryOrigPieceGREIGENO.AsInteger;
          qryInsertVBRcpt.ParamByName('Returned').AsString:=qryOrigPieceRETURNED.AsString;
          qryInsertVBRcpt.ParamByName('RowNo').AsInteger:=qryOrigPieceROWNO.AsInteger;
          qryInsertVBRcpt.ParamByName('DateMod').AsDateTime:=now;
          qryInsertVBRcpt.ParamByName('UserMod').AsString:=UserInitials;
          qryInsertVBRcpt.ParamByName('FinNo').AsInteger:=qryOrigPieceFINNO.AsInteger;
          qryInsertVBRcpt.ParamByName('SeqNo').AsInteger:=0; //qryOrigPieceSEQNO
          qryInsertVBRcpt.ParamByName('LabelStru').AsString:=tabNewPiecesLABELSTRU.AsString;
          qryInsertVBRcpt.ParamByName('LabelStruCustRef').AsString:=qryOrigPieceLABELSTRUCUSTREF.AsString;
          qryInsertVBRcpt.ParamByName('ValueRating').AsInteger:=qryOrigPieceVALUERATING.AsInteger;
          qryInsertVBRcpt.ParamByName('PalletNo').AsInteger:=0;
          qryInsertVBRcpt.ParamByName('Despno').AsInteger:=0;
          qryInsertVBRcpt.ExecSQL;
          //qryOrigPieceDESPNO: TIntegerField;
          //qryOrigPiecePALLETNO: TIntegerField;
          //qryOrigPieceVTORDNO: TIntegerField;
          //qryOrigPieceDATERQD: TDateTimeField;
          //qryOrigPieceDESPDATE: TDateTimeField;
          //qryOrigPieceVTORDDETITEMNO: TIntegerField;
        end;

        //create the VBRefabric record
        spGenRefabricRef.ExecProc; //Generate next RollNo
        lNextRefabricRef:=spGenRefabricRef.Params[0].AsInteger;
        qryInsertVBRefabric.Close;
        qryInsertVBRefabric.ParamByName('Ref').AsInteger:=lNextRefabricRef;
        qryInsertVBRefabric.ParamByName('OrigRollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
        qryInsertVBRefabric.ParamByName('NewRollNo').AsInteger:=lNextRollNo;
        qryInsertVBRefabric.ParamByName('OrigBoxNo').AsInteger:=qryOrigPieceBOXNO.AsInteger;
        qryInsertVBRefabric.ParamByName('NewBoxNo').AsInteger:=lNextBoxNo;
        qryInsertVBRefabric.ParamByName('ManuDate').AsDateTime:=qryOrigPieceDATEMANU.AsDateTime;
        qryInsertVBRefabric.ParamByName('RefabricDate').AsDateTime:=tabNewPiecesREFABRICDATE.AsDateTime;
        qryInsertVBRefabric.ParamByName('GrossLength').AsFloat:=tabNewPiecesGROSSLENGTH.AsFloat;
        qryInsertVBRefabric.ParamByName('Faults').AsInteger:=tabNewPiecesFAULTS.AsInteger;
        qryInsertVBRefabric.ParamByName('Allowance').AsFloat:=tabNewPiecesALLOWANCE.AsFloat;
        qryInsertVBRefabric.ParamByName('NetLength').AsFloat:=tabNewPiecesNETLENGTH.AsFloat;
        qryInsertVBRefabric.ParamByName('RowNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
        qryInsertVBRefabric.ParamByName('DateEnt').AsDateTime:=now;
        qryInsertVBRefabric.ParamByName('UserEnt').AsString:=UserInitials;
        //the very first roll in case refabricked a number of times
        qryInsertVBRefabric.ParamByName('StartRollNo').AsInteger:=lStartRollNo;
        qryInsertVBRefabric.ParamByName('MetricWidth').AsInteger:=tabNewPiecesMETRICWIDTH.AsInteger;
        qryInsertVBRefabric.ParamByName('Qlty').AsString:=tabNewPiecesQLTY.AsString;
        qryInsertVBRefabric.ParamByName('QltyReason').AsString:=tabNewPiecesQLTYREASON.AsString;
        qryInsertVBRefabric.ParamByName('LabelStru').AsString:=tabNewPiecesLABELSTRU.AsString;
        qryInsertVBRefabric.ExecSQL;

        tabNewPieces.Next;
      end;
      //Delete the New Pieces
      qryDeleteChanges.Close;
      qryDeleteChanges.ParamByName('RollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
      qryDeleteChanges.ExecSQL;
      MainForm.Database.Commit;
    except
      MainForm.Database.Rollback;
    end;

    //refresh the entire form
    //move to Piece History tab
    try //added try-finally so that even if the labels don't print the screen still refreshes DL040307
      PrintLabels;
    finally
      btnClearClick(Sender); //includes refresh
      pgeNewPieces.ActivePage:=tshHistory;
      StatusBar.SimpleText:='Ready';
      Application.ProcessMessages;
    end;
  end;
end; //btnPostClick

procedure TfrmVBRefabric.btnStripsClick(Sender: TObject);
begin
  //this needs to display a screen where the user can enter the number
  //of each width labels required: for narrow only
end;

procedure TfrmVBRefabric.PrintLabels;
var
  ix:smallint;
  LabelsRequired:smallint;
  EvenOdd,iy:smallint;
begin
  StatusBar.SimpleText:='Printing Labels';
  Application.ProcessMessages;
  Timer1.Enabled:=true;
  try
    qryQuery.Close;
    qryLabels.Close;
    qryLabels.ParamByName('OrigRollNo').AsInteger:=qryOrigPieceROLLNO.AsInteger;
    qryLabels.Open;
    qryLabels.First;
    for ix:=1 to strtoint(edtLabelCount.Text) do //mod 2 to edtLabelCount so that can prevent printing error
    begin
      {first print the odd numbered strips, then print the even numbered ones}
      for iy:=1 to 2 do {EvenOdd=1->odd numbers;=2->even numbers}
      begin
        if iy=1 then
          EvenOdd:=1 {odd}
        else {iy=2}
          EvenOdd:=0; {even}
        qryLabels.First;
        while not qryLabels.EOF do
        begin
          if (((qryLabelsStripNo.Value mod 2) = EvenOdd) and (ix=1))
            or (ix=2) then {on the first loop print the odds then the evens}
            {on the second loop print all in order}
          begin
            if ix=1 then
              LabelsRequired:=1
            else
            begin
              if iy=2 then
                LabelsRequired:=0 {don't print}
              else
              begin
                //assumption is that first strip is for correct client
                //IA labels are packed the same as South African, ie 3 in a box, not 1 in a box DL041028
                if (qryLabelsLABELSTRU.Value='HD') or (qryLabelsLABELSTRU.Value='LH') {or (qryLabelsLABELSTRU.Value='IA')} then
                  LabelsRequired:=2  {Hunter Douglas, Levolor: 3-1=2}
                else
                  LabelsRequired:=1; {Vrede Textiles, IA: 2-1=1}
              end;
            end;
            qryQuery.Close;
            qryQuery.SQL.Clear;
            qryQuery.SQL.Add('select vc.labelstru,vc.partno,vc.styledescr,vc.colordescr,vt.labeldescr,vs.descr');
            qryQuery.SQL.Add('from vbtype vt,vbtypeclient vc,vblabelstru vs');
            qryQuery.SQL.Add('where vt.vbstru=:vbstru');
            qryQuery.SQL.Add('and vt.vbcol=:vbcol');
            qryQuery.SQL.Add('and vt.vbfin=:vbfin');
            qryQuery.SQL.Add('and vt.vbstru=vc.vbstru');
            qryQuery.SQL.Add('and vt.vbcol=vc.vbcol');
            qryQuery.SQL.Add('and vt.vbfin=vc.vbfin');
            qryQuery.SQL.Add('and vc.labelstru=vs.labelstru');
            qryQuery.SQL.Add('and vc.labelstru=:labelstru');
            qryQuery.Prepare;
            qryQuery.Params[0].AsString:=qryLabelsVBStru.Value;
            qryQuery.Params[1].AsString:=qryLabelsVBCol.Value;
            qryQuery.Params[2].AsString:=qryLabelsVBFin.Value;
            qryQuery.Params[3].AsString:=qryLabelsLABELSTRU.Value;
            qryQuery.Open;
            if (qryLabelsLABELSTRU.Value='CU') and (not qryLabelsLABELSTRU.IsNull) then //override what's found DL230400
            begin
              qryCustPart.Close;
              qryCustPart.ParamByName('CustRef').AsString:=qryLabelsLABELSTRUCUSTREF.AsString;
              qryCustPart.ParamByName('VBStru').AsString:=qryLabelsVBStru.Value;
              qryCustPart.ParamByName('VBCol').AsString:=qryLabelsVBCol.Value;
              qryCustPart.ParamByName('VBFin').AsString:=qryLabelsVBFin.Value;
              qryCustPart.ParamByName('VBWidth').AsInteger:=qryLabelsMETRICWIDTH.AsInteger;
              qryCustPart.Open;
              if not qryCustPartDESCR.IsNull then
              begin
                PartNo:=qryCustPartPARTNO.AsString;
                StyleDescr:=qryCustPartSTYLEDESCR.AsString;
                ColorDescr:=qryCustPartDESCR.AsString;
                LabelDescr:='VT'+qryLabelsVBStru.AsString+qryLabelsVBCol.AsString;
                Heading:='Vrede Fabrics';
              end
              else
              begin
                PartNo:=qryQuery.Fields[1].AsString;
                StyleDescr:=qryQuery.Fields[2].AsString;
                ColorDescr:=qryQuery.Fields[3].AsString;
                LabelDescr:=qryQuery.Fields[4].AsString;
                Heading:=qryQuery.Fields[5].AsString;
              end;
            end
            else
            begin
              PartNo:=qryQuery.Fields[1].AsString;
              StyleDescr:=qryQuery.Fields[2].AsString;
              ColorDescr:=qryQuery.Fields[3].AsString;
              LabelDescr:=qryQuery.Fields[4].AsString;
              Heading:=qryQuery.Fields[5].AsString;
            end;
            qryQuery.Close;
            while LabelsRequired>=1 do {for ix:=1 to LabelsRequired-1 do}
            begin
              if (qryLabelsLabelStru.Value='HD') or (qryLabelsLabelStru.Value='LH')  or (qryLabelsLabelStru.Value='IA') then
                VBBarCodeForm.Print_HD(
                  StyleDescr,ColorDescr,LabelDescr,
                  PartNo,qryLabelsLotNo.Value,
                  qryLabelsBoxNo.Value,qryLabelsDateManu.Value,
                  qryLabelsFaults.Value,qryLabelsStripNo.Value,
                  qryLabelsIMPERIALWIDTH.Value,
                  qryLabelsGrossLength.Value,qryLabelsAllowance.Value,qryLabelsRollNo.Value,
                  qryLabelsLabelStru.Value)
              else {as normal - for Vrede Textiles}
                VBBarCodeForm.Print_VT(LabelDescr,qryLabelsQlty.Value,
                  qryLabelsLotNo.Value,
                  qryLabelsBoxNo.Value,qryLabelsDateManu.Value,qryLabelsFaults.Value,
                  qryLabelsStripNo.Value,
                  qryLabelsMetricLabelDescr.Value,qryLabelsImperialWidth.Value,
                  qryLabelsGrossLength.Value,qryLabelsAllowance.Value,
                  qryLabelsNetLength.Value,qryLabelsRollNo.Value,
                  StyleDescr,ColorDescr,PartNo,Heading);
              {delay until label has finished printing before sending next one}
              BarCodePrinterReady:=false;
              while not (BarCodePrinterReady {and not PausePrinting}) do
                Application.ProcessMessages;
              LabelsRequired:=LabelsRequired-1;
            end; {while LabelsRequired}
          end; {end EvenOdd print}
          qryLabels.Next;
        end; {while not tabNewPieces.EOF}
      end; {even odd for iy:=...}
    end; {for ix:=1 to 3}
  except
    on E: Exception do MessageDlg(E.Message, mtError, [mbok], 0);
  end; {try}
  Timer1.Enabled:=false;
end;

procedure TfrmVBRefabric.Timer1Timer(Sender: TObject);
begin
  BarCodePrinterReady:=true;
end;

procedure TfrmVBRefabric.dbgPieceHistoryDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  //method added DL040307 so that we can see which box we are on in the history
  if qryPieceHistory.FieldByName('NewBoxNo').AsInteger=qryOrigPieceBOXNO.AsInteger then
  begin
    dbgPieceHistory.Canvas.Font.Color:=clGreen;
    dbgPieceHistory.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TfrmVBRefabric.dbgPieceHistoryDblClick(Sender: TObject);
begin
  //method added DL040307 so that one can go quickly to another box
  if (qryPieceHistory.FieldByName('NewBoxNo').AsInteger<>qryOrigPieceBOXNO.AsInteger) and
    (qryPieceHistory.FieldByName('GrossLength').AsFloat>0) then
    PositionOriginalBox(qryPieceHistory.FieldByName('NewBoxNo').AsInteger);
end;

procedure TfrmVBRefabric.LabelCountBtnDownClick(Sender: TObject);
begin
  if strtoint(edtLabelCount.Text)>0 then
    edtLabelCount.Text:=inttostr(strtoint(edtLabelCount.Text)-1);
end;

procedure TfrmVBRefabric.LabelCountBtnUpClick(Sender: TObject);
begin
  if strtoint(edtLabelCount.Text)<3 then
    edtLabelCount.Text:=inttostr(strtoint(edtLabelCount.Text)+1);
end;

end.
