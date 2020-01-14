unit Warprcpt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Buttons;

type
  TWarpRcptForm = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditWARPNO: TDBEdit;
    Label2: TLabel;
    EditWARPLENGTH: TDBEdit;
    Label3: TLabel;
    EditNOOFBREAKS: TDBEdit;
    Label4: TLabel;
    EditWARPTYPE: TDBEdit;
    Label5: TLabel;
    EditWARPCOL: TDBEdit;
    Label6: TLabel;
    EditWARPLOTNO1: TDBEdit;
    Label7: TLabel;
    EditWARPLOTNO2: TDBEdit;
    Label8: TLabel;
    EditWARPSINGLEMULTIPLE: TDBEdit;
    Label9: TLabel;
    EditDATEMANU: TDBEdit;
    Label10: TLabel;
    EditDATERCVD: TDBEdit;
    Label11: TLabel;
    EditRCVDBY: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    WarpRcptSource: TDataSource;
    Panel2: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    CloseBitBtn: TBitBtn;
    DateManuSpdBtn: TSpeedButton;
    WarpColSpdBtn: TSpeedButton;
    WarpLotNoSpdBtn: TSpeedButton;
    WarpRcpt: TTable;
    WarpRcptWARPNO: TIntegerField;
    WarpRcptWARPLENGTH: TIntegerField;
    WarpRcptNOOFBREAKS: TSmallintField;
    WarpRcptWARPTYPE: TStringField;
    WarpRcptWARPCOL: TStringField;
    WarpRcptWARPLOTNO1: TIntegerField;
    WarpRcptWARPLOTNO2: TSmallintField;
    WarpRcptWARPSINGLEMULTIPLE: TStringField;
    WarpRcptDATEMANU: TDateTimeField;
    WarpRcptDATERCVD: TDateTimeField;
    WarpRcptRCVDBY: TStringField;
    WarpSearchSpdBtn: TSpeedButton;
    Label17: TLabel;
    EditComment: TDBEdit;
    WarpRcptCOMMENT: TStringField;
    GreigeRcpt: TTable;
    GreigeRcptWARPNO: TIntegerField;
    GreigeRcptGREIGENO: TSmallintField;
    Label18: TLabel;
    EditComplete: TDBEdit;
    WarpRcptCOMPLETE: TStringField;
    WarpRcptWARPLEFT: TFloatField;
    Label19: TLabel;
    EditWarpLeft: TDBEdit;
    PrintSpdBtn: TSpeedButton;
    Label20: TLabel;
    Label21: TLabel;
    EditYarnBoxNo: TDBEdit;
    WarpRcptYARNBOXNO: TIntegerField;
    EditWarp1Ends: TDBEdit;
    WarpRcptWARP1ENDS: TIntegerField;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure WarpRcptAfterCancel(DataSet: TDataset);
    procedure WarpRcptAfterDelete(DataSet: TDataset);
    procedure WarpRcptAfterPost(DataSet: TDataset);
    procedure WarpRcptBeforeEdit(DataSet: TDataset);
    procedure WarpRcptBeforeInsert(DataSet: TDataset);
    procedure WarpRcptBeforeDelete(DataSet: TDataset);
    procedure WarpRcptNewRecord(DataSet: TDataset);
    procedure DateManuSpdBtnClick(Sender: TObject);
    procedure WarpColSpdBtnClick(Sender: TObject);
    procedure WarpLotNoSpdBtnClick(Sender: TObject);
    procedure WarpSearchSpdBtnClick(Sender: TObject);
    procedure WarpRcptDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure WarpRcptDATEMANUChange(Sender: TField);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure WarpRcptBeforePost(DataSet: TDataSet);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
    OldWarpUsed:integer; //added DL011299 to deal with the problem of what to update after a change is made to the record
  public
    { public declarations }
  end;

var
  WarpRcptForm: TWarpRcptForm;

implementation

{$R *.DFM}

uses VBMain, Dialogs, VBModal, PickDate;

procedure TWarpRcptForm.CloseBitBtnClick(Sender: TObject);
begin
  if WarpRcpt.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Warp Receipts before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TWarpRcptForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if WarpRcpt.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  GreigeRcpt.Close;
  WarpRcpt.Close;
  WarpRcptForm.Release;
end;

procedure TWarpRcptForm.FormShow(Sender: TObject);
begin
  OldWarpUsed:=0;
  WarpRcpt.Open;
  GreigeRcpt.Open; {used so that cannot modify after greige received}
end;

procedure TWarpRcptForm.WarpRcptAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
end;

procedure TWarpRcptForm.WarpRcptAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TWarpRcptForm.WarpRcptAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  WarpRcpt.Close;
  WarpRcpt.Open;}
end;

procedure TWarpRcptForm.WarpRcptBeforeEdit(DataSet: TDataset);
begin
  OldWarpUsed:=WarpRcptWARPLENGTH.AsInteger-WarpRcptWARPLEFT.AsInteger; //added DL011299
  MainForm.Database.StartTransaction;
end;

procedure TWarpRcptForm.WarpRcptBeforeInsert(DataSet: TDataset);
begin
  OldWarpUsed:=0;
  MainForm.Database.StartTransaction;
  EditWarpNo.SetFocus;
end;

procedure TWarpRcptForm.WarpRcptBeforeDelete(DataSet: TDataset);
begin
  GreigeRcpt.First;
  if GreigeRcpt.EOF<>GreigeRcpt.BOF then
    raise Exception.Create('Cannot delete as greige already received');
  MainForm.Database.StartTransaction;
end;

procedure TWarpRcptForm.WarpRcptNewRecord(DataSet: TDataset);
begin
  EditDateRcvd.ReadOnly:=false;
  WarpRcptDateRcvd.Value:=date;
  EditDateRcvd.ReadOnly:=true;
  EditRcvdBy.ReadOnly:=false;
  WarpRcptRcvdBy.Value:=UserInitials;
  EditRcvdBy.ReadOnly:=true;
  WarpRcptDateManu.Value:=date;
  EditComplete.ReadOnly:=false;
  WarpRcptComplete.Value:='N';
  EditComplete.ReadOnly:=true;
end;

procedure TWarpRcptForm.DateManuSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=WarpRcptDateManu.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    WarpRcpt.Edit;
    WarpRcptDateManu.Value:=BRDateForm.Date;
  end;
end;

procedure TWarpRcptForm.WarpColSpdBtnClick(Sender: TObject);
begin
  GreigeRcpt.First;
  if GreigeRcpt.EOF<>GreigeRcpt.BOF then
    raise Exception.Create('Cannot change as greige already received');
  if VBPickDlgForm.ShowModalWarpCol = mrOk then
  begin
    EditWarpType.ReadOnly:=false;
    EditWarpCol.ReadOnly:=false;
    EditWarp1Ends.ReadOnly:=false; //added DL270100
    WarpRcpt.Edit;
    WarpRcptWarpType.Value:=VBPickDlgForm.WCWarpType;
    WarpRcptWarpCol.Value:=VBPickDlgForm.WCWarpCol;
    WarpRcptWarp1Ends.AsInteger:=VBPickDlgForm.WCWarp1Ends; //added DL270100
    EditWarpType.ReadOnly:=true;
    EditWarpCol.ReadOnly:=true;
    EditWarp1Ends.ReadOnly:=true; //added DL270100
    EditWarpLotNo1.ReadOnly:=false;
    EditWarpLotNo1.ReadOnly:=false;
    EditWarpSingleMultiple.ReadOnly:=false;
    WarpRcptWarpLotNo1.Value:=0;
    WarpRcptWarpLotNo2.Value:=0;
    WarpRcptWarpSingleMultiple.Value:='';
    EditWarpLotNo1.ReadOnly:=true;
    EditWarpLotNo2.ReadOnly:=true;
    EditWarpSingleMultiple.ReadOnly:=true;
  end;
  Screen.Cursor:=crDefault;  
end;

procedure TWarpRcptForm.WarpLotNoSpdBtnClick(Sender: TObject);
begin
  GreigeRcpt.First;
  if GreigeRcpt.EOF<>GreigeRcpt.BOF then
    raise Exception.Create('Cannot change as greige already received');
  if WarpRcptWarpCol.Value='' then
    raise Exception.Create('Please select warp colour first');
  if VBPickDlgForm.ShowModalWorWLotNo(WarpRcptWarpCol.Value) = mrOk then
  begin
    EditWarpLotNo1.ReadOnly:=false;
    EditWarpLotNo1.ReadOnly:=false;
    EditWarpSingleMultiple.ReadOnly:=false;
    WarpRcpt.Edit;
    WarpRcptWarpLotNo1.Value:=VBPickDlgForm.WorWLotNo1;
    WarpRcptWarpLotNo2.Value:=VBPickDlgForm.WorWLotNo2;
    WarpRcptWarpSingleMultiple.Value:=VBPickDlgForm.WorWSingleMultiple;
    EditWarpLotNo1.ReadOnly:=true;
    EditWarpLotNo2.ReadOnly:=true;
    EditWarpSingleMultiple.ReadOnly:=true;
  end;
  Screen.Cursor:=crDefault;  
end;

procedure TWarpRcptForm.WarpSearchSpdBtnClick(Sender: TObject);
begin
  if WarpRcpt.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    if VBPickDlgForm.ShowModalWarpRcpt = mrOk then
    begin
      WarpRcpt.SetKey;
      WarpRcpt.FieldByName('WarpNo').AsInteger:=VBPickDlgForm.WarpNo;
      WarpRcpt.GotoKey;
    end;
  end;
  Screen.Cursor:=crDefault;
end;

procedure TWarpRcptForm.WarpRcptDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
{  MessageDlg('Cannot delete as used in Warp Delivery or elsewhere',
    mtError, [mbOK], 0);}
{  try
  except
    on E:OnDeleteError do begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;}
end;

procedure TWarpRcptForm.WarpRcptDATEMANUChange(Sender: TField);
begin
  if (WarpRcptDATEMANU.Value<NoEntryBeforeDate) then
  begin
    WarpRcptDATEMANU.Value:=date;
    raise exception.create('Date cannot be less than '+
      FormatDateTime('dd-mmm-yyyy',NoEntryBeforeDate));
  end;
  if (WarpRcptDATEMANU.Value>date) then
  begin
    WarpRcptDATEMANU.Value:=date;
    raise exception.create('Date cannot be greater than today');
  end;
end;

procedure TWarpRcptForm.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button=nbRefresh) and (WarpRcpt.State in [dsInsert, dsEdit]) then
  begin
    ShowMessage('Cannot refresh while in Receive or Edit Mode');
    Abort;
  end;
end;

procedure TWarpRcptForm.WarpRcptBeforePost(DataSet: TDataSet);
begin
  if (WarpRcptWarpLength.IsNull) or (WarpRcptWarpLength.AsInteger=0) then
    raise Exception.Create('Please enter warp length'); //added DL011299
  WarpRcptWarpLeft.Value:=WarpRcptWarpLength.AsFloat-OldWarpUsed;
end;

procedure TWarpRcptForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
