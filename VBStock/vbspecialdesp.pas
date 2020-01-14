unit vbspecialdesp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, DBLookup, Mask, Db, DBTables;

type
  TfrmSpecialDespatch = class(TForm)
    datVBDespHdr: TDataSource;
    ScrollBox: TScrollBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DespSearchSpdBtn: TSpeedButton;
    Label21: TLabel;
    Label22: TLabel;
    Label5: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    EditDESPNO: TDBEdit;
    EditDESPDATE: TDBEdit;
    EditBoxes: TDBEdit;
    EditNetLength: TDBEdit;
    EditWAYBILLNO: TDBEdit;
    CloseBitBtn: TBitBtn;
    PostBtn: TButton;
    CancelBtn: TButton;
    EditCustRef: TDBEdit;
    EditVTContRef: TDBEdit;
    EditContRef: TDBEdit;
    EditSeals: TDBEdit;
    EditCustOrNo: TDBEdit;
    EditDespSent: TDBCheckBox;
    EditDespBy: TDBEdit;
    EditPallets: TDBEdit;
    EditPhysicalPallets: TDBEdit;
    EditWayBillNo2: TDBEdit;
    EditInvDate: TDBEdit;
    CkbxConsignment: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    tabVBDespHdr: TTable;
    ModeIndicator: TLabel;
    tabVBDespHdrDESPNO: TIntegerField;
    tabVBDespHdrCUSTREF: TStringField;
    tabVBDespHdrDESPDATE: TDateTimeField;
    tabVBDespHdrDESPBY: TStringField;
    tabVBDespHdrBOXES: TSmallintField;
    tabVBDespHdrNETLENGTHDESP: TFloatField;
    tabVBDespHdrTRANSBY: TStringField;
    tabVBDespHdrWAYBILLNO: TStringField;
    tabVBDespHdrSEALS: TStringField;
    tabVBDespHdrCONTREF: TStringField;
    tabVBDespHdrVTCONTREF: TStringField;
    tabVBDespHdrEXPORTER: TStringField;
    tabVBDespHdrCUSTORDNO: TStringField;
    tabVBDespHdrDESPSENT: TStringField;
    tabVBDespHdrPALLETS: TSmallintField;
    tabVBDespHdrPHYSICALPALLETS: TSmallintField;
    tabVBDespHdrWAYBILLNO2: TStringField;
    tabVBDespHdrINVDATE: TDateTimeField;
    tabVBDespHdrCONSIGNMENT: TStringField;
    qryCheckPicked: TQuery;
    qryCheckPickedBOXNO: TIntegerField;
    tabVBDespHdrIGNOREINMINCALC: TStringField;
    cbxIgnoreInMinCalc: TDBCheckBox;
    Label2: TLabel;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure tabVBDespHdrAfterCancel(DataSet: TDataSet);
    procedure tabVBDespHdrAfterPost(DataSet: TDataSet);
    procedure tabVBDespHdrBeforeEdit(DataSet: TDataSet);
    procedure DespSearchSpdBtnClick(Sender: TObject);
    procedure datVBDespHdrStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    OldDespSent:string[1];
  public
    { Public declarations }
  end;

var
  frmSpecialDespatch: TfrmSpecialDespatch;

implementation

uses VBMain, VBModal;

{$R *.DFM}

procedure TfrmSpecialDespatch.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSpecialDespatch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryCheckPicked.Close;
  tabVBDespHdr.Close;
  Release;
end;

procedure TfrmSpecialDespatch.PostBtnClick(Sender: TObject);
begin
  if (OldDespSent='Y') and (tabVBDespHdrDESPSENT.AsString='N') then
    raise Exception.Create('Cannot undespatch a despatch');
  //check that no boxes have been picked: only check when despatching
  if (OldDespSent='N') and (tabVBDespHdrDESPSENT.AsString='Y') then
  begin
    qryCheckPicked.Close;
    qryCheckPicked.ParamByName('DespNo').AsInteger:=tabVBDespHdrDespNo.AsInteger;
    qryCheckPicked.Open;
    if not qryCheckPickedBOXNO.IsNull then
      raise Exception.Create('Cannot despatch as box '+qryCheckPickedBOXNO.AsString+' picked');
  end;
  tabVBDespHdr.Post;
end;

procedure TfrmSpecialDespatch.CancelBtnClick(Sender: TObject);
begin
  tabVBDespHdr.Cancel;
end;

procedure TfrmSpecialDespatch.tabVBDespHdrAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  tabVBDespHdr.Refresh;
end;

procedure TfrmSpecialDespatch.tabVBDespHdrAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TfrmSpecialDespatch.tabVBDespHdrBeforeEdit(DataSet: TDataSet);
begin
  OldDespSent:=tabVBDespHdrDESPSENT.AsString;
  MainForm.Database.StartTransaction;
end;

procedure TfrmSpecialDespatch.DespSearchSpdBtnClick(Sender: TObject);
begin
  if VBPickDlgForm.ShowModalVBDesp = mrOk then
  begin
    tabVBDespHdr.SetKey;
    tabVBDespHdr.FieldByName('DespNo').AsInteger:=VBPickDlgForm.VBDespHdrDespNo;
    tabVBDespHdr.GotoKey;
  end;
  Screen.Cursor:=crDefault;
end;

procedure TfrmSpecialDespatch.datVBDespHdrStateChange(Sender: TObject);
begin
  PostBtn.Enabled := tabVBDespHdr.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := tabVBDespHdr.State in [dsEdit];
  CloseBitBtn.Enabled := tabVBDespHdr.State = dsBrowse;
  if tabVBDespHdr.State in [dsEdit, dsInsert] then
  begin
    ModeIndicator.Caption := 'Edit, Insert';
    ModeIndicator.Font.Color := clRed
  end
  else
  begin
    ModeIndicator.Caption := 'Browse';
    ModeIndicator.Font.Color := clBlue;
  end;
end;

procedure TfrmSpecialDespatch.FormShow(Sender: TObject);
begin
  tabVBDespHdr.Open;
end;

end.
