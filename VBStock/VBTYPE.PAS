unit Vbtype;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons,
  Dialogs, Mask, Menus, ODDBFind;

type
  TVBTypeForm = class(TForm)
    dgbVBType: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    VBTypeSource: TDataSource;
    Panel2: TPanel;
    VBType: TTable;
    VBTypeVBSTRU: TStringField;
    VBTypeVBCOL: TStringField;
    VBTypeWARPCOL: TStringField;
    VBTypeWEFTSTRU: TStringField;
    VBTypeWEFTTWIST: TStringField;
    VBTypeWEFTCOL: TStringField;
    VBTypeWARPTYPE: TStringField;
    Panel3: TPanel;
    Label1: TLabel;
    WarpTypeQuery: TQuery;
    WarpTypeSource: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    EditWarpTwist: TDBEdit;
    EditWarpStru: TDBEdit;
    VBTypeDATEENT: TDateTimeField;
    VBTypeUSERENT: TStringField;
    VBTypeDATEMOD: TDateTimeField;
    VBTypeUSERMOD: TStringField;
    VBTypeVBFIN: TStringField;
    VBTypeEXTPRODREF: TStringField;
    Label4: TLabel;
    EditVBStru: TEdit;
    PrintSpdBtn: TSpeedButton;
    VBTypeLABELDESCR: TStringField;
    Panel4: TPanel;
    VBTypeClient: TTable;
    VBTypeClientSource: TDataSource;
    dgbVBTypeClient: TDBGrid;
    VBTypeClientVBSTRU: TStringField;
    VBTypeClientVBCOL: TStringField;
    VBTypeClientVBFIN: TStringField;
    VBTypeClientLABELSTRU: TStringField;
    VBTypeClientSTYLEDESCR: TStringField;
    VBTypeClientCOLORDESCR: TStringField;
    VBTypeClientPARTNO: TStringField;
    navSource: TDataSource;
    PostBtn: TButton;
    CancelBtn: TButton;
    CloseBitBtn: TBitBtn;
    qryStockMin: TQuery;
    qryStockMinSALEGROUP: TStringField;
    ODFindMenu1: TODFindMenu;
    btnFixExtProdRef: TButton;
    VBTypeFWONLY: TIntegerField;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VBTypeAfterCancel(DataSet: TDataset);
    procedure VBTypeAfterDelete(DataSet: TDataset);
    procedure VBTypeAfterPost(DataSet: TDataset);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure VBTypeBeforeEdit(DataSet: TDataSet);
    procedure VBTypeBeforeInsert(DataSet: TDataSet);
    procedure VBTypeBeforeDelete(DataSet: TDataSet);
    procedure VBTypeDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure VBTypeBeforePost(DataSet: TDataSet);
    procedure EditVBStruChange(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure VBTypeClientBeforeEdit(DataSet: TDataSet);
    procedure VBTypeClientBeforeDelete(DataSet: TDataSet);
    procedure VBTypeClientBeforeInsert(DataSet: TDataSet);
    procedure VBTypeClientNewRecord(DataSet: TDataSet);
    procedure dgbVBTypeClientEnter(Sender: TObject);
    procedure dgbVBTypeEnter(Sender: TObject);
    procedure VBTypeSourceStateChange(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure VBTypeClientBeforePost(DataSet: TDataSet);
    procedure dgbVBTypeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFixExtProdRefClick(Sender: TObject);
  private
    { private declarations }
    NoCommit:boolean;
    InTxn:boolean;
  public
    { public declarations }
  end;

var
  VBTypeForm: TVBTypeForm;

implementation

{$R *.DFM}

uses VBMain;

procedure TVBTypeForm.FormShow(Sender: TObject);
begin
  VBType.Open;
  VBType.Refresh;
  VBTypeClient.Open;
  VBTypeClient.Refresh;
  WarpTypeQuery.Open;
  qryStockMin.Open; //added DL25102000
  navSource.DataSet:=VBType;
end;

procedure TVBTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VBType.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  qryStockMin.Close; //added DL25102000
  WarpTypeQuery.Close;
  VBTypeClient.Close;
  VBType.Close;
  VBTypeForm.Release;
end;

procedure TVBTypeForm.VBTypeAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  InTxn:=false;
  VBType.Refresh;
  VBTypeClient.Refresh;
end;

procedure TVBTypeForm.VBTypeAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBTypeForm.VBTypeAfterPost(DataSet: TDataset);
begin
  if not NoCommit then
  begin
    MainForm.Database.Commit;
    InTxn:=false;
  end;
end;

procedure TVBTypeForm.CloseBitBtnClick(Sender: TObject);
begin
  if VBType.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post VB Types before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBTypeForm.VBTypeBeforeEdit(DataSet: TDataSet);
begin
  if not InTxn then
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TVBTypeForm.VBTypeBeforeInsert(DataSet: TDataSet);
begin
  if VBType.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('A vbtype is being processed. Post changes before inserting new product?',
      mtInformation, mbOKCancel, 0) = mrOK then
        VBType.Post
    else
      Abort;
  end;
  if InTxn then
    raise Exception.Create('Post before inserting')
  else
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TVBTypeForm.VBTypeBeforeDelete(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBTypeForm.VBTypeDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.RollBack;
end;

procedure TVBTypeForm.VBTypeBeforePost(DataSet: TDataSet);
{var
  VBCol:string[3];}
begin
  VBTypeDateMod.ReadOnly:=false;
  VBTypeUserMod.ReadOnly:=false;
  VBTypeExtProdRef.ReadOnly:=false;
  VBTypeDateMod.Value:=now;
  VBTypeUserMod.Value:=UserInitials;
  VBTypeExtProdRef.Value:='VB'+VBTypeVBStru.AsString+
    VBTypeVBCol.AsString+VBTypeVBFin.AsString;
  VBTypeExtProdRef.ReadOnly:=true;
  VBTypeDateMod.ReadOnly:=true;
  VBTypeUserMod.ReadOnly:=true;
end;

procedure TVBTypeForm.EditVBStruChange(Sender: TObject);
begin
  if EditVBStru.Text='' then
    VBType.Filtered:=false
  else
  begin
    VBType.Filter:='vbstru='''+uppercase(EditVBStru.Text)+'''';
    VBType.Filtered:=true;
  end;
end;

procedure TVBTypeForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TVBTypeForm.VBTypeClientBeforeEdit(DataSet: TDataSet);
begin
  VBType.Edit;
end;

procedure TVBTypeForm.VBTypeClientBeforeDelete(DataSet: TDataSet);
begin
  VBType.Edit;
end;

procedure TVBTypeForm.VBTypeClientBeforeInsert(DataSet: TDataSet);
begin
  if VBType.State = dsInsert then
  begin
    NoCommit:=true;
    VBType.Post;
    VBType.Edit;
    NoCommit:=false;
  end
  else
    VBType.Edit;
end;

procedure TVBTypeForm.VBTypeClientNewRecord(DataSet: TDataSet);
begin
  VBTypeClientVBSTRU.AsString:=VBTypeVBSTRU.AsString;
  VBTypeClientVBCOL.AsString:=VBTypeVBCOL.AsString;
  VBTypeClientVBFIN.AsString:=VBTypeVBFIN.AsString;
end;

procedure TVBTypeForm.dgbVBTypeClientEnter(Sender: TObject);
begin
  navSource.DataSet:=VBTypeClient;
end;

procedure TVBTypeForm.dgbVBTypeEnter(Sender: TObject);
begin
  navSource.DataSet:=VBType;
end;

procedure TVBTypeForm.VBTypeSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := VBType.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := VBType.State = dsBrowse;
end;

procedure TVBTypeForm.PostBtnClick(Sender: TObject);
begin
  VBType.Post;
end;

procedure TVBTypeForm.CancelBtnClick(Sender: TObject);
begin
  VBType.Cancel;
end;

procedure TVBTypeForm.VBTypeClientBeforePost(DataSet: TDataSet);
begin
  //check that the labelstru is valid. Added DL230899
  if (VBTypeClientLABELSTRU.AsString<>'VT') and
     (VBTypeClientLABELSTRU.AsString<>'HD') and
     (VBTypeClientLABELSTRU.AsString<>'FB') and
     (VBTypeClientLABELSTRU.AsString<>'FD') and //added DL270100
     (VBTypeClientLABELSTRU.AsString<>'LH') and
     (VBTypeClientLABELSTRU.AsString<>'IA') and //added DL041018
     (VBTypeClientLABELSTRU.AsString<>'CU') then //CU added DL200900
    raise Exception.Create('Label Structure (LS) must be VT,HD,FB,FD,LH,IA, CU');
end;

procedure TVBTypeForm.dgbVBTypeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  //added DL25102000
  {qryStockMin.Close;
  qryStockMin.ParamByName('VBStru').AsString:=
      VBTypeVBSTRU.AsString;
  qryStockMin.ParamByName('VBCol').AsString:=
      VBTypeVBCOL.AsString;
  qryStockMin.ParamByName('VBFin').AsString:=
      VBTypeVBFIN.AsString;
  qryStockMin.ParamByName('VBWidth').AsInteger:=127;
  qryStockMin.Open;
  //if not qryStockMinSALEGROUP.IsNull then
  //begin
    if qryStockMinSALEGROUP.AsString='DISCON' then
    begin
      dgbVBType.Canvas.Font.Color:=clRed;
      dgbVBType.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end;
  //end;}
end;

procedure TVBTypeForm.btnFixExtProdRefClick(Sender: TObject);
begin
  //do this once during the conversion DL090901
  //this process is needed to make the extprodref correct
  //transaction processing done automatically
  VBType.First;
  while not VBType.EOF do
  begin
    VBType.Edit;
    VBType.Post;
    VBType.Next;
  end;
  VBType.Refresh;
end;

end.
