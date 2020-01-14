unit VBYnRcpt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Buttons, DBLookup,
  Dialogs;

type
  TVBYnRcptForm = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditBOXNO: TDBEdit;
    Label2: TLabel;
    EditLOTNO: TDBEdit;
    EditLOTNO2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    EditYNNET: TDBEdit;
    ManuOrReturnedLabel: TLabel;
    EditDATERcvd: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    VBYarnRcptSource: TDataSource;
    Panel2: TPanel;
    VBYarnRcpt: TTable;
    VBYarnRcptBOXNO: TIntegerField;
    VBYarnRcptLOTNO1: TSmallintField;
    VBYarnRcptLOTNO2: TSmallintField;
    VBYarnRcptYNSTRU: TStringField;
    VBYarnRcptYNCOL: TStringField;
    VBYarnRcptYNNET: TFloatField;
    VBYarnRcptDATERCVD: TDateTimeField;
    VBYarnRcptINITIALS: TStringField;
    SetDefaultsBtn: TButton;
    CloseBitBtn: TBitBtn;
    Label10: TLabel;
    ShowStruDescr: TEdit;
    ShowColDescr: TEdit;
    VBYarnRcptYNQLTY: TStringField;
    EditQltyComboBox: TDBComboBox;
    Label11: TLabel;
    EditYarnStru: TDBEdit;
    EditYarnCol: TDBEdit;
    TypeSearchSpdBtn: TSpeedButton;
    ClearDefBtn: TButton;
    PostBtn: TButton;
    YarnStruQuery: TQuery;
    YarnColQuery: TQuery;
    YarnStruQueryDESCR: TStringField;
    YarnColQueryDESCR: TStringField;
    VBSearch: TSpeedButton;
    DateRcvdSpdBtn: TSpeedButton;
    ModeIndicator: TLabel;
    YarnStruQueryLABELDESCR: TStringField;
    ShowStruLabelDescr: TEdit;
    VBYarnRcptYNTWIST: TStringField;
    EditYnTwist: TDBEdit;
    Button1: TButton;
    VBYarnRcptRETURNED: TStringField;
    ReturnedLabel: TLabel;
    EditReturned: TDBComboBox;
    VBYarnRcptSTOCKAREA: TIntegerField;
    Label19: TLabel;
    DBEditStockArea: TDBEdit;
    VBYarnRcptBATREF: TIntegerField;
    Label15: TLabel;
    EditBatRef: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    ShowDateEnt: TDBEdit;
    ShowUserEnt: TDBEdit;
    ShowDateMod: TDBEdit;
    ShowUserMod: TDBEdit;
    VBYarnRcptDATEENT: TDateTimeField;
    VBYarnRcptUSERENT: TStringField;
    VBYarnRcptDATEMOD: TDateTimeField;
    VBYarnRcptUSERMOD: TStringField;
    Label3: TLabel;
    Label6: TLabel;
    EditRcvdBy: TDBEdit;
    SpeedButton1: TSpeedButton;
    PlusBitBtn: TBitBtn;
    CancelBtn: TBitBtn;
    PrintSpdBtn: TSpeedButton;
    procedure VBYarnRcptNewRecord(DataSet: TDataset);
    procedure TypeSearchSpdBtnClick(Sender: TObject);
    procedure EditYarnStruChange(Sender: TObject);
    procedure EditYarnColChange(Sender: TObject);
    procedure ClearDefBtnClick(Sender: TObject);
    procedure SetDefaultsBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure VBYarnRcptSourceStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VBYarnRcptAfterPost(DataSet: TDataset);
    procedure VBYarnRcptAfterDelete(DataSet: TDataset);
    procedure VBYarnRcptAfterCancel(DataSet: TDataset);
    procedure VBYarnRcptBeforeCancel(DataSet: TDataset);
    procedure VBYarnRcptBeforeDelete(DataSet: TDataset);
    procedure DateRcvdSpdBtnClick(Sender: TObject);
    procedure VBSearchClick(Sender: TObject);
    procedure VBYarnRcptBeforeEdit(DataSet: TDataset);
    procedure Button1Click(Sender: TObject);
    procedure VBYarnRcptBeforeInsert(DataSet: TDataSet);
    procedure VBYarnRcptBeforePost(DataSet: TDataSet);
    procedure VBYarnRcptDATERCVDChange(Sender: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EditYnTwistChange(Sender: TObject);
    procedure PlusBitBtnClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
    DefaultsSet:boolean;
    YnStru:string;
    YnTwist:string;
    YnCol:string;
    YnTare:real;
    DateRcvd:real;
    LotNo1:integer;
    LotNo2:integer;
    YnQlty:string;
    Returned:string;
    Shift:string;
{    BPC:integer;}
    CustRef:string;
  public
    { public declarations }
  end;

var
  VBYnRcptForm: TVBYnRcptForm;

implementation

uses VBMain, BrModal, PickDate, VBUtils;

{$R *.DFM}

procedure TVBYnRcptForm.VBYarnRcptNewRecord(DataSet: TDataset);
begin
  {find the next yarnrcpt no}
  {the box number is entered from the physical box}
{  YarnRcptLotNo1.Clear;
  VBYarnRcptLotNo2.Clear;}
  VBYarnRcptYnNet.Clear; {Value:=0;}
  VBYarnRcptYnQlty.Value:='';
  VBYarnRcptDateEnt.Value:=now;
  VBYarnRcptUserEnt.Value:=UserInitials;
  VBYarnRcptDateMod.Value:=VBYarnRcptDateEnt.Value;
  VBYarnRcptUserMod.Value:=UserInitials;
  VBYarnRcptReturned.Value:='N';
  EditQltyComboBox.ItemIndex:=0; {<blank>}
  EditReturned.ItemIndex:=0; {N}
  EditDateRcvd.ReadOnly:=false;
  VBYarnRcptDateRcvd.Value:=date;
  EditDateRcvd.ReadOnly:=true;
  EditRcvdBy.ReadOnly:=false;
  VBYarnRcptInitials.Value:=UserInitials;
  EditRcvdBy.ReadOnly:=true;
  VBYarnRcptLotNo1.Value:=0;
  VBYarnRcptLotNo2.Value:=0;
  if DefaultsSet then
  begin
    EditYarnStru.ReadOnly:=false;
    EditYnTwist.ReadOnly:=false;
    EditYarnCol.ReadOnly:=false;
    EditDateRcvd.ReadOnly:=false;
    EditLotNo.ReadOnly:=false;
    EditLotNo2.ReadOnly:=false;
    EditQltyComboBox.ReadOnly:=false;
    EditReturned.ReadOnly:=false;
    VBYarnRcptYnStru.Value:=YnStru;
    VBYarnRcptYnTwist.Value:=YnTwist;
    VBYarnRcptYnCol.Value:=YnCol;
    VBYarnRcptDateRcvd.Value:=DateRcvd;
    VBYarnRcptLotNo1.Value:=LotNo1;
    VBYarnRcptLotNo2.Value:=LotNo2;
    VBYarnRcptYnQlty.Value:=YnQlty;
    VBYarnRcptReturned.Value:=Returned;
    EditYarnStru.ReadOnly:=true;      
    EditYnTwist.ReadOnly:=true;
    EditYarnCol.ReadOnly:=true;
    EditDateRcvd.ReadOnly:=true;
    EditLotNo.ReadOnly:=true;
    EditLotNo2.ReadOnly:=true;
    EditQltyComboBox.ReadOnly:=true;
    EditReturned.ReadOnly:=true;
  end
  else
  begin
    VBYarnRcptDateRcvd.Value:=date;
  end;
  VBYarnRcptBatRef.Value:=0;
{  if DefaultsSet then}
    EditBoxNo.SetFocus;
end;

procedure TVBYnRcptForm.TypeSearchSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalYarnType = mrOk then
  begin
    EditYarnStru.ReadOnly:=false;
    EditYnTwist.ReadOnly:=false;
    EditYarnCol.ReadOnly:=false;
    VBYarnRcpt.Edit;
    VBYarnRcptYnTwist.Value:=PickDlgForm.YarnTypeYnTwist;
    VBYarnRcptYnStru.Value:=PickDlgForm.YarnTypeStru;
    VBYarnRcptYnCol.Value:=PickDlgForm.YarnTypeCol;
    EditYarnStru.ReadOnly:=true;
    EditYnTwist.ReadOnly:=true;        
    EditYarnCol.ReadOnly:=true;
  end;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TVBYnRcptForm.EditYarnStruChange(Sender: TObject);
begin
  if (VBYarnRcptYnStru.Value<>'') and
    (VBYarnRcptYnTwist.Value<>'') then
  begin
    YarnStruQuery.Active:=false;
    YarnStruQuery.Params[0].AsString:=VBYarnRcptYnStru.Value;
    YarnStruQuery.Params[1].AsString:=VBYarnRcptYnTwist.Value;
    YarnStruQuery.Active:=true;
    with YarnStruQuery.Fields[0] do
      if IsNull then
      begin
        ShowStruDescr.Text := '-1';
        ShowStruLabelDescr.Text := '-1';
      end
      else
      begin
        ShowStruDescr.Text := AsString;
        ShowStruLabelDescr.Text := YarnStruQuery.Fields[1].AsString;
      end;
    YarnStruQuery.Active:=false;
  end
  else
    ShowStruDescr.Clear;
end;

procedure TVBYnRcptForm.EditYarnColChange(Sender: TObject);
begin
  if {(VBYarnRcpt.State in [dsEdit,dsInsert]) and}
    (VBYarnRcptYnCol.Value<>'') then
  begin
    YarnColQuery.Active:=false;
    YarnColQuery.Params[0].AsString:=VBYarnRcptYnCol.Value;
    YarnColQuery.Active:=true;
    with YarnColQuery.Fields[0] do
      if IsNull then
        ShowColDescr.Text := '-1'
      else
        ShowColDescr.Text := AsString;
    YarnColQuery.Active:=false;
  end
  else
    ShowColDescr.Clear;
end;

procedure TVBYnRcptForm.ClearDefBtnClick(Sender: TObject);
begin
  YnStru:='';
  YnTwist:='';
  YnCol:='';
  YnTare:=0;
  DateRcvd:=0;
  LotNo1:=0;
  LotNo2:=0;
  if PassValue=0 then
    Shift:='';
  CustRef:='';
  EditDateRcvd.TabStop:=true;
  EditLotNo.TabStop:=true;
  EditLotNo2.TabStop:=true;
  EditDateRcvd.Color:=clWindow;
  EditLotNo.Color:=clWindow;
  EditLotNo2.Color:=clWindow;
  EditQltyComboBox.Color:=clWindow;
  EditReturned.Color:=clWindow;
  DefaultsSet:=false;
  EditDateRcvd.ReadOnly:=false;
  EditLotNo.ReadOnly:=false;
  EditLotNo2.ReadOnly:=false;
  EditQltyComboBox.ReadOnly:=false;
  EditReturned.ReadOnly:=false;
end;

procedure TVBYnRcptForm.SetDefaultsBtnClick(Sender: TObject);
begin
{  if VBYarnRcpt.State in [dsEdit,dsInsert] then
  begin}
    if (VBYarnRcptYnStru.Value='') or
      (VBYarnRcptYnTwist.Value='') or
      (VBYarnRcptYnCol.Value='') or
      (VBYarnRcptDateRcvd.Value=0) or
      (VBYarnRcptLotNo1.Value=0) or
      (VBYarnRcptLotNo2.Value=0) then
      begin
        ShowMessage('Cannot Set defaults until all defaults have been set');
        Abort;
      end;
    YnStru:=VBYarnRcptYnStru.AsString;
    YnTwist:=VBYarnRcptYnTwist.AsString;
    YnCol:=VBYarnRcptYnCol.AsString;
    DateRcvd:=VBYarnRcptDateRcvd.AsFloat;
    LotNo1:=VBYarnRcptLotNo1.AsInteger;
    LotNo2:=VBYarnRcptLotNo2.AsInteger;
    YnQlty:=VBYarnRcptYnQlty.AsString;
    Returned:=VBYarnRcptReturned.AsString;
    EditYarnStru.TabStop:=false;
    EditYnTwist.TabStop:=false;
    EditYarnCol.TabStop:=false;
    EditDateRcvd.TabStop:=false;
    EditLotNo.TabStop:=false;
    EditLotNo2.TabStop:=false;
    EditDateRcvd.Color:=clSilver;
    EditLotNo.Color:=clSilver;
    EditLotNo2.Color:=clSilver;
    EditQltyComboBox.Color:=clSilver;
    EditReturned.Color:=clSilver;
    DefaultsSet:=true;
    EditBoxNo.SetFocus;
end;

procedure TVBYnRcptForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBYnRcptForm.FormShow(Sender: TObject);
begin
  VBYarnRcpt.Open;
  VBYarnRcpt.Refresh;
  DefaultsSet:=false;
end;

procedure TVBYnRcptForm.PostBtnClick(Sender: TObject);
begin
  VBYarnRcpt.Post;
end;

procedure TVBYnRcptForm.CancelBtnClick(Sender: TObject);
begin
  VBYarnRcpt.Cancel;
end;

procedure TVBYnRcptForm.VBYarnRcptSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := VBYarnRcpt.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  PlusBitBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := VBYarnRcpt.State = dsBrowse;
  if VBYarnRcpt.State = dsEdit then
  begin
    ModeIndicator.Caption := 'Edit';
    ModeIndicator.Font.Color := clRed;
  end
  else
    if VBYarnRcpt.State = dsInsert then
    begin
      ModeIndicator.Caption := 'Receive';
      ModeIndicator.Font.Color := clRed;
    end
    else
    begin
      ModeIndicator.Caption := 'Browse';
      ModeIndicator.Font.Color := clBlue;
    end;
end;

procedure TVBYnRcptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VBYarnRcpt.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  VBYarnRcpt.Close;
  VBYnRcptForm.Release;
end;

procedure TVBYnRcptForm.VBYarnRcptAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBYnRcptForm.VBYarnRcptAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBYnRcptForm.VBYarnRcptAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  VBYarnRcpt.Refresh;
end;

procedure TVBYnRcptForm.VBYarnRcptBeforeCancel(DataSet: TDataset);
begin
  if VBYarnRcpt.State=dsInsert then
    if MessageDlg('Cancel yarn receipt being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TVBYnRcptForm.VBYarnRcptBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete yarn receipt?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TVBYnRcptForm.DateRcvdSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=VBYarnRcptDateRcvd.Value;  {start with current date}
  if BRDateForm.ShowModal=mrOK then
  begin
    VBYarnRcpt.Edit;
    VBYarnRcptDateRcvd.Value:=BRDateForm.Date;
  end;
end;

procedure TVBYnRcptForm.VBSearchClick(Sender: TObject);
begin
  if VBYarnRcpt.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    if PickDlgForm.ShowModalYarnRcpt = mrOk then
    begin
      VBYarnRcpt.SetKey;
      VBYarnRcpt.FieldByName('BoxNo').AsInteger:=PickDlgForm.YarnRcptBoxNo;
      VBYarnRcpt.GotoKey;
    end;
  end;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TVBYnRcptForm.VBYarnRcptBeforeEdit(DataSet: TDataset);
begin
  if VBYarnRcptBatRef.Value<>0 then
  begin
    ShowMessage('Cannot edit as already despatched!');
    Abort;
  end;
  MainForm.Database.StartTransaction;
end;

procedure TVBYnRcptForm.Button1Click(Sender: TObject);
var
  BoxNumberStr:string;
begin
  if VBYarnRcpt.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    BoxNumberStr:='0';
    if InputQuery('Finished Good Search',
      'Enter box number',
      BoxNumberStr) then
    begin
      if length(BoxNumberStr)=8 then {bar code scanned: added DL020397}
        BoxNumberStr:=copy(BoxNumberStr,3,6); {added DL020397}
      VBYarnRcpt.SetKey;
      VBYarnRcpt.FieldByName('BoxNo').AsInteger:=strtoint(BoxNumberStr);
      if not VBYarnRcpt.GotoKey then
        ShowMessage('Box not found')
      else
        VBYarnRcpt.GotoKey;
    end;
  end;
end;

procedure TVBYnRcptForm.VBYarnRcptBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBYnRcptForm.VBYarnRcptBeforePost(DataSet: TDataSet);
begin
  if VBYarnRcpt.State=dsEdit then
  begin
    VBYarnRcptDateMod.Value:=now;
    VBYarnRcptUserMod.Value:=UserInitials;
  end;
end;

procedure TVBYnRcptForm.VBYarnRcptDATERCVDChange(Sender: TField);
begin
  if (VBYarnRcptDATERcvd.Value<NoEntryBeforeDate) then
  begin
    VBYarnRcptDATERcvd.Value:=date;
    raise exception.create('Date cannot be less than '+
      FormatDateTime('dd-mmm-yyyy',NoEntryBeforeDate));
  end;
  if (VBYarnRcptDATERcvd.Value>date) then
  begin
    VBYarnRcptDATERcvd.Value:=date;
    raise exception.create('Date cannot be greater than today');
  end;
end;

procedure TVBYnRcptForm.SpeedButton1Click(Sender: TObject);
begin
  if VBYarnRcpt.State in [dsInsert, dsEdit] then
    ShowMessage('Cannot search when in Receive or Edit Mode')
  else
  begin
    if PickDlgForm.ShowModalYarnRcptLotNo = mrOk then
    begin
      VBYarnRcpt.SetKey;
      VBYarnRcpt.FieldByName('BoxNo').AsInteger:=PickDlgForm.YarnRcptLotNoBoxNo;
      VBYarnRcpt.GotoKey;
    end;
  end;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TVBYnRcptForm.EditYnTwistChange(Sender: TObject);
begin
  if (VBYarnRcptYnStru.Value<>'') and
    (VBYarnRcptYnTwist.Value<>'') then
  begin
    YarnStruQuery.Active:=false;
    YarnStruQuery.Params[0].AsString:=VBYarnRcptYnStru.Value;
    YarnStruQuery.Params[1].AsString:=VBYarnRcptYnTwist.Value;
    YarnStruQuery.Active:=true;
    with YarnStruQuery.Fields[0] do
      if IsNull then
      begin
        ShowStruDescr.Text := '-1';
        ShowStruLabelDescr.Text := '-1';
      end
      else
      begin
        ShowStruDescr.Text := AsString;
        ShowStruLabelDescr.Text := YarnStruQuery.Fields[1].AsString;
      end;
    YarnStruQuery.Active:=false;
  end
  else
    ShowStruDescr.Clear;
end;

procedure TVBYnRcptForm.PlusBitBtnClick(Sender: TObject);
begin
  VBYarnRcpt.Insert;
end;

procedure TVBYnRcptForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
