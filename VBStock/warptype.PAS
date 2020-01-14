unit Warptype;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons,
  Mask;

type
  TWarpTypeForm = class(TForm)
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    WarpTypeSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    WarpType: TTable;
    WarpTypeWARPTYPE: TStringField;
    WarpTypeWARP1STRU: TStringField;
    WarpTypeWARP1TWIST: TStringField;
    WarpTypeWARP1WEIGHT: TFloatField;
    Panel3: TPanel;
    YarnStruSource: TDataSource;
    Label1: TLabel;
    EditCount1: TDBEdit;
    YarnStru: TTable;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
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
    EditWarpType: TDBEdit;
    WarpTypeWARP1ENDS: TSmallintField;
    WarpTypeENDSPERSECTION: TSmallintField;
    WarpTypeSECTIONS: TSmallintField;
    WarpTypeTOTALENDS: TSmallintField;
    WarpTypeWARPLENGTH: TSmallintField;
    WarpTypeYARNLENGTH: TIntegerField;
    WarpTypeSINGLESLENGTH: TIntegerField;
    WarpTypeWARPWEIGHTEXWASTE: TFloatField;
    WarpTypeWARPWEIGHT: TFloatField;
    WarpTypeWARP2STRU: TStringField;
    WarpTypeWARP2TWIST: TStringField;
    WarpTypeWARP2ENDS: TSmallintField;
    WarpTypeWARP2WEIGHT: TFloatField;
    WarpTypeWARP3STRU: TStringField;
    WarpTypeWARP3TWIST: TStringField;
    WarpTypeWARP3ENDS: TSmallintField;
    WarpTypeWARP3WEIGHT: TFloatField;
    WarpTypeWARP4STRU: TStringField;
    WarpTypeWARP4TWIST: TStringField;
    WarpTypeWARP4ENDS: TSmallintField;
    WarpTypeWARP4WEIGHT: TFloatField;
    EditReed: TDBEdit;
    EditEndsPerSection: TDBEdit;
    EditSections: TDBEdit;
    EditTotalEnds: TDBEdit;
    EditWarpLength: TDBEdit;
    EditYarnLength: TDBEdit;
    EditSinglesLength: TDBEdit;
    EditWarpingWaste: TDBEdit;
    EditAssembleWaste: TDBEdit;
    EditWarpWeightExWaste: TDBEdit;
    EditWarpWeight: TDBEdit;
    EditWarp1Stru: TDBEdit;
    EditWarp1Twist: TDBEdit;
    EditWarp1Ends: TDBEdit;
    EditWarp1Weight: TDBEdit;
    EditWarp2Stru: TDBEdit;
    EditWarp2Twist: TDBEdit;
    EditWarp2Ends: TDBEdit;
    EditWarp2Weight: TDBEdit;
    EditWarp3Stru: TDBEdit;
    EditWarp3Twist: TDBEdit;
    EditWarp3Ends: TDBEdit;
    EditWarp3Weight: TDBEdit;
    EditWarp4Stru: TDBEdit;
    EditWarp4Twist: TDBEdit;
    EditWarp4Ends: TDBEdit;
    EditWarp4Weight: TDBEdit;
    YarnStruYNCOUNT: TSmallintField;
    YarnStruYNSTRU: TStringField;
    YarnStruYNTWIST: TStringField;
    WarpTypeREED: TFloatField;
    WarpTypeWARPINGWASTE: TFloatField;
    WarpTypeASSEMBLEWASTE: TFloatField;
    YarnStruPLY: TSmallintField;
    Label26: TLabel;
    EditPly: TDBEdit;
    WarpTypeWIPPRICE: TFloatField;
    Label27: TLabel;
    EditWIPPrice: TDBEdit;
    WarpTypeEXTPRODREF: TStringField;
    WarpTypeDATEENT: TDateTimeField;
    WarpTypeUSERENT: TStringField;
    WarpTypeDATEMOD: TDateTimeField;
    WarpTypeUSERMOD: TStringField;
    Label28: TLabel;
    ShowExtWarpType: TDBEdit;
    Label29: TLabel;
    Label31: TLabel;
    ShowDateEnt: TDBEdit;
    ShowUserEnt: TDBEdit;
    ShowDateMod: TDBEdit;
    ShowUserMod: TDBEdit;
    WarpTypeWPYNMETRESTOKGS: TFloatField;
    Label30: TLabel;
    EditMetresToKgs: TDBEdit;
    PrintButton: TButton;
    PrintSpdBtn: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure WarpTypeAfterCancel(DataSet: TDataset);
    procedure WarpTypeAfterDelete(DataSet: TDataset);
    procedure WarpTypeAfterPost(DataSet: TDataset);
    procedure WarpTypeBeforeEdit(DataSet: TDataset);
    procedure WarpTypeBeforeInsert(DataSet: TDataset);
    procedure WarpTypeBeforeDelete(DataSet: TDataset);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure WarpTypeDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure WarpTypeBeforePost(DataSet: TDataSet);
    procedure WarpTypeNewRecord(DataSet: TDataSet);
    procedure PrintButtonClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  WarpTypeForm: TWarpTypeForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs;

procedure TWarpTypeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if WarpType.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  YarnStru.Close;
  WarpType.Close;
  WarpTypeForm.Release;
end;

procedure TWarpTypeForm.FormShow(Sender: TObject);
begin
  WarpType.Open;
  WarpType.Refresh;
  YarnStru.Open;
  YarnStru.Refresh;
end;

procedure TWarpTypeForm.WarpTypeAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
end;

procedure TWarpTypeForm.WarpTypeAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TWarpTypeForm.WarpTypeAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  WarpType.Close;
  WarpType.Open;}
end;

procedure TWarpTypeForm.WarpTypeBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWarpTypeForm.WarpTypeBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWarpTypeForm.WarpTypeBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TWarpTypeForm.CloseBitBtnClick(Sender: TObject);
begin
  if WarpType.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Warp Types before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TWarpTypeForm.WarpTypeDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TWarpTypeForm.WarpTypeBeforePost(DataSet: TDataSet);
begin
  if YarnStruYnCount.AsString='' then
    raise Exception.Create('Enter Yarn Structure and Colour');
  WarpTypeTotalEnds.Value:=WarpTypeEndsPerSection.Value*
    WarpTypeSections.Value;
  WarpTypeYarnLength.Value:=WarpTypeWarpLength.Value*
    WarpTypeTotalEnds.Value;
  WarpTypeSinglesLength.Value:=WarpTypeYarnLength.Value*
    YarnStruPly.Value;
  WarpTypeWarp2Stru.Value:=WarpTypeWarp1Stru.Value;
  WarpTypeWarp3Stru.Value:=WarpTypeWarp1Stru.Value;
  WarpTypeWarp4Stru.Value:=WarpTypeWarp1Stru.Value;
  WarpTypeWarp2Twist.Value:=WarpTypeWarp1Twist.Value;
  WarpTypeWarp3Twist.Value:=WarpTypeWarp1Twist.Value;
  WarpTypeWarp4Twist.Value:=WarpTypeWarp1Twist.Value;
  WarpTypeWarpWeightExWaste.Value:=WarpTypeYarnLength.Value*
    YarnStruYnCount.Value/1000000;
  WarpTypeWarpWeight.Value:=WarpTypeWarpWeightExWaste.Value*
    (1+WarpTypeWarpingWaste.Value/100)*(1+WarpTypeAssembleWaste.Value/100);
  WarpTypeWarp1Weight.Value:=WarpTypeWarp1Ends.Value/
    WarpTypeTotalEnds.Value*WarpTypeWarpWeight.Value;
  WarpTypeWarp2Weight.Value:=WarpTypeWarp2Ends.Value/
    WarpTypeTotalEnds.Value*WarpTypeWarpWeight.Value;
  WarpTypeWarp3Weight.Value:=WarpTypeWarp3Ends.Value/
    WarpTypeTotalEnds.Value*WarpTypeWarpWeight.Value;
  WarpTypeWarp4Weight.Value:=WarpTypeWarp4Ends.Value/
    WarpTypeTotalEnds.Value*WarpTypeWarpWeight.Value;
  WarpTypeDateMod.Value:=now;
  WarpTypeUserMod.Value:=UserInitials;
  WarpTypeExtProdRef.Value:='WP'+WarpTypeWarpType.AsString;
end;

procedure TWarpTypeForm.WarpTypeNewRecord(DataSet: TDataSet);
begin
  WarpTypeWarp1Ends.Value:=0;
  WarpTypeWarp2Ends.Value:=0;
  WarpTypeWarp3Ends.Value:=0;
  WarpTypeWarp4Ends.Value:=0;
end;

procedure TWarpTypeForm.PrintButtonClick(Sender: TObject);
begin
  Print;
end;

procedure TWarpTypeForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
