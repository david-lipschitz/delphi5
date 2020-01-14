unit finrcpt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, Mask;

type
  TfrmFinRcpt = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    tabFinRcptDaily: TTable;
    datFinRcptDaily: TDataSource;
    DBNavigator1: TDBNavigator;
    bitClose: TBitBtn;
    dbgFinRcpt: TDBGrid;
    Panel3: TPanel;
    qryGreigeRcpt: TQuery;
    datGreigeRcpt: TDataSource;
    datWarpLength: TDataSource;
    qryGreigeRcptGREIGELENGTH: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    qryWarpLength: TQuery;
    qryWarpLengthGREIGELENGTH: TIntegerField;
    edtWarpNo: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    tabGreigeRcpt: TTable;
    tabGreigeRcptWARPNO: TIntegerField;
    tabGreigeRcptGREIGENO: TSmallintField;
    tabGreigeRcptLOOMREF: TStringField;
    tabGreigeRcptVBSTRU: TStringField;
    tabGreigeRcptVBCOL: TStringField;
    tabGreigeRcptSTATUS: TStringField;
    qryGreigeRcptFINLENGTH: TIntegerField;
    tabFinRcptDailyWARPNO: TIntegerField;
    tabFinRcptDailyGREIGENO: TSmallintField;
    tabFinRcptDailyFINNO: TSmallintField;
    tabFinRcptDailyFABRICLOTNO: TIntegerField;
    tabFinRcptDailyWARPLOTNO1: TIntegerField;
    tabFinRcptDailyWARPLOTNO2: TSmallintField;
    tabFinRcptDailyWARPSINGLEMULTIPLE: TStringField;
    tabFinRcptDailyWEFTLOTNO1: TIntegerField;
    tabFinRcptDailyWEFTLOTNO2: TSmallintField;
    tabFinRcptDailyWEFTSINGLEMULTIPLE: TStringField;
    tabFinRcptDailyVBSTRU: TStringField;
    tabFinRcptDailyVBCOL: TStringField;
    tabFinRcptDailyVBFIN: TStringField;
    tabFinRcptDailyFINLENGTH: TIntegerField;
    tabFinRcptDailyFINDATE: TDateTimeField;
    tabFinRcptDailyCOMMENT: TStringField;
    spdWeftSearch: TSpeedButton;
    tabWarpRcpt: TTable;
    tabWarpRcptWARPNO: TIntegerField;
    tabWarpRcptWARPLOTNO1: TIntegerField;
    tabWarpRcptWARPLOTNO2: TSmallintField;
    tabWarpRcptWARPSINGLEMULTIPLE: TStringField;
    Label6: TLabel;
    qryGreigeRcptSTATUS: TStringField;
    EditGreigeStatus: TDBEdit;
    CopySpdBtn: TSpeedButton;
    PrintSpdBtn: TSpeedButton;
    tabFinRcptDailyDATEMOD: TDateTimeField;
    tabFinRcptDailyUSERMOD: TStringField;
    procedure bitCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tabFinRcptDailyAfterCancel(DataSet: TDataSet);
    procedure tabFinRcptDailyAfterDelete(DataSet: TDataSet);
    procedure tabFinRcptDailyAfterPost(DataSet: TDataSet);
    procedure tabFinRcptDailyBeforeDelete(DataSet: TDataSet);
    procedure tabFinRcptDailyBeforeEdit(DataSet: TDataSet);
    procedure tabFinRcptDailyBeforeInsert(DataSet: TDataSet);
    procedure tabFinRcptDailyDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure datFinRcptDailyDataChange(Sender: TObject; Field: TField);
    procedure edtWarpNoChange(Sender: TObject);
    procedure tabFinRcptDailyBeforePost(DataSet: TDataSet);
    procedure spdWeftSearchClick(Sender: TObject);
    procedure CopySpdBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure datFinRcptDailyStateChange(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinRcpt: TfrmFinRcpt;

implementation

{$R *.DFM}

uses VBMain, Vbmodal;

procedure TfrmFinRcpt.bitCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFinRcpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryGreigeRcpt.Close;
  qryWarpLength.Close;
  tabWarpRcpt.Close;
  tabGreigeRcpt.Close;
  tabFinRcptDaily.Close;
  Release;
end;

procedure TfrmFinRcpt.FormShow(Sender: TObject);
begin
  tabFinRcptDaily.Open;
  tabGreigeRcpt.Open;
  tabWarpRcpt.Open;
  qryGreigeRcpt.Open;
  qryWarpLength.Open;
end;

procedure TfrmFinRcpt.tabFinRcptDailyAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  tabFinRcptDaily.Refresh;
end;

procedure TfrmFinRcpt.tabFinRcptDailyAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TfrmFinRcpt.tabFinRcptDailyAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TfrmFinRcpt.tabFinRcptDailyBeforeDelete(DataSet: TDataSet);
begin
  if qryGreigeRcptSTATUS.AsString<>'S' then
    MainForm.Database.StartTransaction
  else
    raise Exception.Create('Cannot modify as already slit');
end;

procedure TfrmFinRcpt.tabFinRcptDailyBeforeEdit(DataSet: TDataSet);
begin
  if qryGreigeRcptSTATUS.AsString<>'S' then
    MainForm.Database.StartTransaction
  else
    raise Exception.Create('Cannot modify as already slit');
end;

procedure TfrmFinRcpt.tabFinRcptDailyBeforeInsert(DataSet: TDataSet);
begin
  if tabFinRcptDaily.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('A receipt is being processed.  Post before adding new?',
      mtInformation, mbOKCancel, 0) = mrOK then
        tabFinRcptDaily.Post
    else
      Abort;                                                                         
  end;
//  if qryGreigeRcptSTATUS.AsString = 'S' then  //added JT180698
//    raise Exception.Create('Greige already slit');
  MainForm.Database.StartTransaction;
end;

procedure TfrmFinRcpt.tabFinRcptDailyDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TfrmFinRcpt.datFinRcptDailyDataChange(Sender: TObject;
  Field: TField);
begin
  qryGreigeRcpt.Close;
  qryWarpLength.Close;
  qryGreigeRcpt.Open;
  qryWarpLength.Open;
end;

procedure TfrmFinRcpt.edtWarpNoChange(Sender: TObject);
begin
  if edtWarpNo.Text='' then
    tabFinRcptDaily.Filtered:=false
  else
  begin
//  tabFinRcptDaily.Filter:='warpno>='+edtWarpNo.Text; changed JT180698
    tabFinRcptDaily.Filter:='warpno='+edtWarpNo.Text;
    tabFinRcptDaily.Filtered:=true;
  end;
end;

procedure TfrmFinRcpt.tabFinRcptDailyBeforePost(DataSet: TDataSet);
begin
  {check validity of data input}
    if (tabFinRcptDailyVBSTRU.AsString<>tabGreigeRcptVBSTRU.AsString)
    OR (tabFinRcptDailyVBCOL.AsString<>tabGreigeRcptVBCOL.AsString) then
    raise Exception.Create('Cannot post as VBType incorrect');
  if (tabFinRcptDailyFinDate.Value<NoEntryBeforeDate) then
  begin
    raise exception.create('Date cannot be less than '+
      FormatDateTime('dd-mmm-yyyy',NoEntryBeforeDate));
  end;
  tabFinRcptDailyDateMod.ReadOnly:=false;
  tabFinRcptDailyUserMod.ReadOnly:=false;
  tabFinRcptDailyDateMod.Value:=now;
  tabFinRcptDailyUserMod.Value:=UserInitials;
  tabFinRcptDailyDateMod.ReadOnly:=true;
  tabFinRcptDailyUserMod.ReadOnly:=true;
end;

procedure TfrmFinRcpt.spdWeftSearchClick(Sender: TObject);
begin
//  dbgGreigeRcpt.SelectedField := GreigeRcptWarpLotNo1;
  if not (tabFinRcptDaily.State in [dsEdit,dsInsert]) then
    raise Exception.Create('Must be in edit or insert mode to search');
  if tabWarpRcpt.BOF=tabWarpRcpt.EOF then
    raise Exception.Create('Must search/enter for VB Type first');
  tabFinRcptDailyWarpLotNo1.Value:=tabWarpRcptWarpLotNo1.Value;
  tabFinRcptDailyWarpLotNo2.Value:=tabWarpRcptWarpLotNo2.Value;
  tabFinRcptDailyWarpSingleMultiple.Value:=tabWarpRcptWarpSingleMultiple.Value;
  if VBPickDlgForm.ShowModalFabricLotNo(
    tabFinRcptDailyVBStru.Value,
    tabFinRcptDailyVBCol.Value,
    tabFinRcptDailyWarpLotNo1.Value,
    tabFinRcptDailyWarpLotNo2.Value,
    tabFinRcptDailyWarpSingleMultiple.Value) = mrOk then
  begin
//    GreigeRcpt.SelectedField := GreigeRcptWarpLotNo1;
    tabFinRcptDailyWeftLotNo1.Value:=VBPickDlgForm.FLNWeftLotNo1; {FLN=Fabric Lot NO}
//    GreigeGrid.SelectedField := GreigeRcptWarpLotNo2;
    tabFinRcptDailyWeftLotNo2.Value:=VBPickDlgForm.FLNWeftLotNo2;
//    GreigeGrid.SelectedField := GreigeRcptWarpSingleMultiple;
    tabFinRcptDailyWeftSingleMultiple.Value:=VBPickDlgForm.FLNWeftSingleMultiple;
//    GreigeGrid.SelectedField := GreigeRcptFabricLotNo;
    tabFinRcptDailyFabricLotNo.Value:=VBPickDlgForm.FLNLotNo;
  end;
  Screen.Cursor:=crDefault;
end;
           //added JT170698   append row & copy field values
procedure TfrmFinRcpt.CopySpdBtnClick(Sender: TObject);
var
  WarpNo, GreigeNo, FinNo{, FabricLotNo}: Integer;
  FinDate: TDateTime;
  VBStru, VBCol, VBFin: string;
begin
//tabFinRcptDaily.Last;
  if qryGreigeRcptSTATUS.AsString = 'S' then
    raise Exception.Create('Greige already slit');
  WarpNo := tabFinRcptDailyWARPNO.AsInteger;
  GreigeNo := tabFinRcptDailyGREIGENO.AsInteger;
  FinNo := tabFinRcptDailyFINNO.AsInteger;
//FabricLotNo := tabFinRcptDailyFABRICLOTNO.AsInteger;
  FinDate := tabFinRcptDailyFINDATE.AsDateTime;
  VBSTru := tabFinRcptDailyVBSTRU.AsString;
  VBCol := tabFinRcptDailyVBCOL.AsString;
  VBFin := tabFinRcptDailyVBFIN.AsString;
  tabFinRcptDaily.Append;
  tabFinRcptDailyWARPNO.AsInteger := WarpNo;
  tabFinRcptDailyGREIGENO.AsInteger := GreigeNo;
  tabFinRcptDailyFINNO.AsInteger := FinNo;
//tabFinRcptDailyFABRICLOTNO.AsInteger := FabricLotNo;
  tabFinRcptDailyFINDATE.AsDateTime := FinDate;
  tabFinRcptDailyVBSTRU.AsString := VBSTru;
  tabFinRcptDailyVBCOL.AsString := VBCol;
  tabFinRcptDailyVBFIN.AsString := VBFin;
  dbgFinRcpt.SetFocus;
  dbgFinRcpt.SelectedField := tabFinRcptDailyFINDATE;
end;
      //added JT170698   enforce transaction completion
procedure TfrmFinRcpt.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := tabFinRcptDaily.State = dsBrowse;
  if not CanClose then
    MessageDlg('First post or cancel this edit', mtError, [mbOK], 0);
end;

procedure TfrmFinRcpt.datFinRcptDailyStateChange(Sender: TObject);
begin
  bitClose.Enabled := tabFinRcptDaily.State = dsBrowse;  //added JT180698
end;

procedure TfrmFinRcpt.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
