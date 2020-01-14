unit Vbstru;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, ExtCtrls,
  Dialogs, Mask;

type
  TVBStruForm = class(TForm)
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    VBStruSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    WarpTypeSource: TDataSource;
    EditWarpStru1: TDBEdit;
    EditWarpTwist1: TDBEdit;
    VBStru: TTable;
    VBStruVBSTRU: TStringField;
    VBStruDESCR: TStringField;
    VBStruLABELSTYLEDESCR: TStringField;
    VBStruWARPTYPE: TStringField;
    WarpType: TTable;
    WarpTypeWARP1STRU: TStringField;
    WarpTypeWARP1TWIST: TStringField;
    WarpTypeWARPTYPE: TStringField;
    Label4: TLabel;
    EditWarpLength: TDBEdit;
    WarpTypeWARPLENGTH: TSmallintField;
    VBStruTAKEUP: TFloatField;
    VBStruWARPFINWIDTH: TSmallintField;
    VBStruPCEFINLENGTH: TSmallintField;
    VBStruPCEWARPLENGTH: TSmallintField;
    VBStruCALCPCSPERBEAM: TFloatField;
    VBStruNETPCSPERBEAM: TFloatField;
    VBStruCALCWARPPCEWEIGHT: TFloatField;
    VBStruWARPPCEWEIGHT: TFloatField;
    VBStruWARP1PCEWEIGHT: TFloatField;
    VBStruWARP2PCEWEIGHT: TFloatField;
    VBStruWARP3PCEWEIGHT: TFloatField;
    VBStruWARP4PCEWEIGHT: TFloatField;
    VBStruFINPICSPERCM: TFloatField;
    VBStruENDSPERDENT: TSmallintField;
    VBStruREEDWIDTH: TSmallintField;
    VBStruWASTEPERPICK: TSmallintField;
    VBStruPICKTAKEUP: TFloatField;
    VBStruWEFTWEIGHTPERPIECE: TFloatField;
    VBStruPICKSPERMIN: TSmallintField;
    VBStruEFFICIENCY: TFloatField;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EditVBStru: TDBEdit;
    EditLabelStyleDescr: TDBEdit;
    EditDescr: TDBEdit;
    EditWarpType: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    EditPceWarpLength: TDBEdit;
    EditPcsFinLength: TDBEdit;
    EditCalcPcePerBeam: TDBEdit;
    EditNetPcsPerBeam: TDBEdit;
    EditWarpPceWeight: TDBEdit;
    EditWarp1PceWeight: TDBEdit;
    EditWarp2PceWeight: TDBEdit;
    EditWarp3PceWeight: TDBEdit;
    EditWarp4PceWeight: TDBEdit;
    EditTakeUp: TDBEdit;
    EditWarpFinWidth: TDBEdit;
    EditCalcWarpFinLength: TDBEdit;
    Label29: TLabel;
    EditReed: TDBEdit;
    WarpTypeREED: TFloatField;
    Label9: TLabel;
    EditWeftYnCount: TDBEdit;
    YarnStru: TTable;
    YarnStruSource: TDataSource;
    YarnStruYNSTRU: TStringField;
    YarnStruYNCOUNT: TSmallintField;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    EditFinPicsPerCm: TDBEdit;
    EditEndsPerDent: TDBEdit;
    EditReedWidth: TDBEdit;
    EditWastePerPic: TDBEdit;
    EditPickTakeUp: TDBEdit;
    EditWeftLengthPerPic: TDBEdit;
    EditWeftLengthPerWarp: TDBEdit;
    EditWeftLengthPerPiece: TDBEdit;
    EditWeftWeightPerPiece: TDBEdit;
    Label38: TLabel;
    Label39: TLabel;
    VBStruWEFT1STRU: TStringField;
    VBStruWEFT1TWIST: TStringField;
    EditWeft1Stru: TDBEdit;
    EditWeft1Twist: TDBEdit;
    Label42: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    EditPicksPerMin: TDBEdit;
    EditEfficiency: TDBEdit;
    EditHrsPerPiece: TDBEdit;
    WarpTypeWARP2WEIGHT: TFloatField;
    WarpTypeWARP3WEIGHT: TFloatField;
    WarpTypeWARP4WEIGHT: TFloatField;
    WarpTypeWARP1WEIGHT: TFloatField;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    VBStruWEFT1WEIGHT: TFloatField;
    VBStruWEFT2WEIGHT: TFloatField;
    VBStruWEFT3WEIGHT: TFloatField;
    VBStruWEFT4WEIGHT: TFloatField;
    EditWeft1Weight: TDBEdit;
    EditWeft2Weight: TDBEdit;
    EditWeft3Weight: TDBEdit;
    EditWeft4Weight: TDBEdit;
    Label45: TLabel;
    Label52: TLabel;
    EditCalcWarpPceWeight: TDBEdit;
    WarpTypeWARPWEIGHT: TFloatField;
    Label53: TLabel;
    EditWarpWeight: TDBEdit;
    VBStruCALCWARPFINLENGTH: TFloatField;
    VBStruWEFTLENGTHPERPICK: TFloatField;
    VBStruWEFTLENGTHPERWARP: TFloatField;
    VBStruWEFTLENGTHPERPIECE: TFloatField;
    YarnStruYNTWIST: TStringField;
    VBStruHRSPERPIECE: TFloatField;
    VBStruWIPLSPRICE: TFloatField;
    VBStruWIPFINPRICE: TFloatField;
    EditWIPFinPrice: TDBEdit;
    EditWIPLSPrice: TDBEdit;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    VBStruOLDDESCR: TStringField;
    Label57: TLabel;
    EditOldDescr: TDBEdit;
    VBStruGREXTPRODREF: TStringField;
    VBStruFNEXTPRODREF: TStringField;
    VBStruDATEENT: TDateTimeField;
    VBStruUSERENT: TStringField;
    VBStruDATEMOD: TDateTimeField;
    VBStruUSERMOD: TStringField;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    ShowGRExtProdRef: TDBEdit;
    ShowFinExtProdRef: TDBEdit;
    ShowDateMod: TDBEdit;
    PrintSpdBtn: TSpeedButton;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VBStruAfterCancel(DataSet: TDataset);
    procedure VBStruAfterDelete(DataSet: TDataset);
    procedure VBStruAfterPost(DataSet: TDataset);
    procedure VBStruBeforeEdit(DataSet: TDataset);
    procedure VBStruBeforeInsert(DataSet: TDataset);
    procedure VBStruBeforeDelete(DataSet: TDataset);
    procedure VBStruDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure VBStruBeforePost(DataSet: TDataSet);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  VBStruForm: TVBStruForm;

implementation

{$R *.DFM}

uses VBMain;

procedure TVBStruForm.CloseBitBtnClick(Sender: TObject);
begin
  if VBStru.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post VB Structures before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBStruForm.FormShow(Sender: TObject);
begin
  VBStru.Open;
  VBStru.Refresh;
  WarpType.Open;
  YarnStru.Open;
  WarpType.Refresh;
  YarnStru.Refresh;
end;

procedure TVBStruForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VBStru.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  YarnStru.Close;
  WarpType.Close;
  VBStru.Close;
  VBStruForm.Release;
end;

procedure TVBStruForm.VBStruAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
end;

procedure TVBStruForm.VBStruAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBStruForm.VBStruAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBStruForm.VBStruBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBStruForm.VBStruBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBStruForm.VBStruBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBStruForm.VBStruDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBStruForm.VBStruBeforePost(DataSet: TDataSet);
begin
  if VBStruWarpType.Value='' then
    raise Exception.Create('Enter Warp Type');
  if VBStruWeft1Stru.Value='' then
    raise Exception.Create('Enter Weft Structure');
  if VBStruWeft1Twist.Value='' then
    raise Exception.Create('Enter Weft Twist');
  {+ other checks}
  VBStruCalcWarpFinLength.Value:=WarpTypeWarpLength.Value*
    (1-VBStruTakeUp.Value/100);
  VBStruCalcPcsPerBeam.Value:=VBStruCalcWarpFinLength.Value/
    VBStruPceFinLength.Value;
  VBStruCalcWarpPceWeight.Value:=WarpTypeWarpWeight.Value/
    VBStruNetPcsPerBeam.Value;
  VBStruWarp1PceWeight.Value:=VBStruWarpPceWeight.Value/
    WarpTypeWarp1Weight.Value*WarpTypeWarpWeight.Value;
  if WarpTypeWarp2Weight.Value>0 then
    VBStruWarp2PceWeight.Value:=VBStruWarpPceWeight.Value/
      WarpTypeWarp2Weight.Value*WarpTypeWarpWeight.Value
  else
    VBStruWarp2PceWeight.Value:=0;
  if WarpTypeWarp3Weight.Value>0 then
    VBStruWarp3PceWeight.Value:=VBStruWarpPceWeight.Value/
      WarpTypeWarp3Weight.Value*WarpTypeWarpWeight.Value
  else
    VBStruWarp3PceWeight.Value:=0;
  if WarpTypeWarp4Weight.Value>0 then
    VBStruWarp4PceWeight.Value:=VBStruWarpPceWeight.Value/
      WarpTypeWarp4Weight.Value*WarpTypeWarpWeight.Value
  else
    VBStruWarp4PceWeight.Value:=0;
  VBStruWeftLengthPerPick.Value:=int(VBStruReedWidth.Value*
    (1+VBStruPickTakeUp.Value/100)+VBStruWastePerPick.Value);
  VBStruWeftLengthPerWarp.Value:=VBStruWeftLengthPerPick.Value*
    VBStruFinPicsPerCM.Value*VBStruCalcWarpFinLength.Value;
  VBStruWeftLengthPerPiece.Value:=int(VBStruWeftLengthPerWarp.Value/
    VBStruNetPcsPerBeam.Value);
  VBStruWeftWeightPerPiece.Value:=VBStruWeftLengthPerPiece.Value*
    YarnStruYnCount.Value/1000000;
  {insert calcs for picks per roll;picks per piece;weaving eff;picks per piece}
  VBStruHrsPerPiece.Value:=VBStruCalcWarpFinLength.Value*100*
    VBStruFinPicsPerCM.Value/VBStruNetPcsPerBeam.Value/0.8/
    (VBStruPicksPerMin.Value*VBStruEfficiency.Value/100)/60;
  VBStruDateMod.Value:=now;
  VBStruUserMod.Value:=UserInitials;
  VBStruGRExtProdRef.Value:='GR'+VBStruVBStru.AsString;
  VBStruFNExtProdRef.Value:='FN'+VBStruVBStru.AsString;
end;

procedure TVBStruForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
