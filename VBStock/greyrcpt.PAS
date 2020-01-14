unit greyrcpt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, Mask;

type
  TfrmGreigeRcpt = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    tabGreigeRcptDaily: TTable;
    datGreigeRcptDaily: TDataSource;
    tabGreigeRcptDailyWARPNO: TIntegerField;
    tabGreigeRcptDailyGREIGENO: TSmallintField;
    tabGreigeRcptDailyGREIGEDATE: TDateTimeField;
    tabGreigeRcptDailyLOOMREF: TStringField;
    tabGreigeRcptDailyVBSTRU: TStringField;
    tabGreigeRcptDailyVBCOL: TStringField;
    tabGreigeRcptDailyGREIGELENGTH: TIntegerField;
    tabGreigeRcptDailyCOMMENT: TStringField;
    DBNavigator1: TDBNavigator;
    bitClose: TBitBtn;
    DBGrid1: TDBGrid;
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
    qryGreigeRcptSTATUS: TStringField;
    Label6: TLabel;
    EditGreigeStatus: TDBEdit;
    qryFinRcptDaily: TQuery;
    CopySpdBtn: TSpeedButton;
    PrintSpdBtn: TSpeedButton;
    tabGreigeRcptDailyDATEMOD: TDateTimeField;
    tabGreigeRcptDailyUSERMOD: TStringField;
    procedure bitCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tabGreigeRcptDailyAfterCancel(DataSet: TDataSet);
    procedure tabGreigeRcptDailyAfterDelete(DataSet: TDataSet);
    procedure tabGreigeRcptDailyAfterPost(DataSet: TDataSet);
    procedure tabGreigeRcptDailyBeforeDelete(DataSet: TDataSet);
    procedure tabGreigeRcptDailyBeforeEdit(DataSet: TDataSet);
    procedure tabGreigeRcptDailyBeforeInsert(DataSet: TDataSet);
    procedure tabGreigeRcptDailyDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure datGreigeRcptDailyDataChange(Sender: TObject; Field: TField);
    procedure edtWarpNoChange(Sender: TObject);
    procedure tabGreigeRcptDailyBeforePost(DataSet: TDataSet);
    procedure CopySpdBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure datGreigeRcptDailyStateChange(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGreigeRcpt: TfrmGreigeRcpt;

implementation

{$R *.DFM}

uses VBMain;

procedure TfrmGreigeRcpt.bitCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGreigeRcpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryFinRcptDaily.Close;
  qryGreigeRcpt.Close;
  qryWarpLength.Close;
  tabGreigeRcpt.Close;
  tabGreigeRcptDaily.Close;
  Release;
end;

procedure TfrmGreigeRcpt.FormShow(Sender: TObject);
begin
  tabGreigeRcptDaily.Open;
  tabGreigeRcpt.Open;
  qryGreigeRcpt.Open;
  qryWarpLength.Open;
  qryFinRcptDaily.Open;
end;

procedure TfrmGreigeRcpt.tabGreigeRcptDailyAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  tabGreigeRcptDaily.Refresh;
  qryFinRcptDaily.Close;
  qryFinRcptDaily.Open;
end;

procedure TfrmGreigeRcpt.tabGreigeRcptDailyAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TfrmGreigeRcpt.tabGreigeRcptDailyAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TfrmGreigeRcpt.tabGreigeRcptDailyBeforeDelete(DataSet: TDataSet);
begin
  if qryGreigeRcptSTATUS.AsString<>'S' then
  begin
    if (qryGreigeRcptFINLENGTH.AsInteger>0) or
      (qryFinRcptDaily.BOF<>qryFinRcptDaily.EOF) then
      raise Exception.Create('Cannot delete as already finished')
    else
      MainForm.Database.StartTransaction;
  end
  else
    raise Exception.Create('Cannot modify as already slit');
end;

procedure TfrmGreigeRcpt.tabGreigeRcptDailyBeforeEdit(DataSet: TDataSet);
begin
  if qryGreigeRcptSTATUS.AsString<>'S' then
    MainForm.Database.StartTransaction
  else
    raise Exception.Create('Cannot modify as already slit');
end;

procedure TfrmGreigeRcpt.tabGreigeRcptDailyBeforeInsert(DataSet: TDataSet);
begin
  if tabGreigeRcptDaily.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('A receipt is being processed.  Post before adding new?',
      mtInformation, mbOKCancel, 0) = mrOK then
        tabGreigeRcptDaily.Post
    else
      Abort;
  end;
//  if qryGreigeRcptSTATUS.AsString = 'S' then  //added JT180698
//    raise Exception.Create('Greige already slit');
  MainForm.Database.StartTransaction;
end;

procedure TfrmGreigeRcpt.tabGreigeRcptDailyDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TfrmGreigeRcpt.datGreigeRcptDailyDataChange(Sender: TObject;
  Field: TField);
begin
  qryGreigeRcpt.Close;
  qryWarpLength.Close;
  qryGreigeRcpt.Open;
  qryWarpLength.Open;
end;

procedure TfrmGreigeRcpt.edtWarpNoChange(Sender: TObject);
begin
  if edtWarpNo.Text='' then
    tabGreigeRcptDaily.Filtered:=false
  else
  begin
//  tabGreigeRcptDaily.Filter:='warpno>='+edtWarpNo.Text; changed JT180698
    tabGreigeRcptDaily.Filter:='warpno='+edtWarpNo.Text;
    tabGreigeRcptDaily.Filtered:=true;
  end;
end;

procedure TfrmGreigeRcpt.tabGreigeRcptDailyBeforePost(DataSet: TDataSet);
begin
  {check validity of data input}
  if (tabGreigeRcptDailyLOOMREF.AsString<>tabGreigeRcptLOOMREF.AsString)
    OR (tabGreigeRcptDailyVBSTRU.AsString<>tabGreigeRcptVBSTRU.AsString)
    OR (tabGreigeRcptDailyVBCOL.AsString<>tabGreigeRcptVBCOL.AsString) then
    raise Exception.Create('Cannot post as LoomRef or VBType incorrect');
  if (tabGreigeRcptDailyGreigeDate.Value<NoEntryBeforeDate) then
  begin
    raise exception.create('Date cannot be less than '+
      FormatDateTime('dd-mmm-yyyy',NoEntryBeforeDate));
  end;
  tabGreigeRcptDailyDateMod.ReadOnly:=false;
  tabGreigeRcptDailyUserMod.ReadOnly:=false;
  tabGreigeRcptDailyDateMod.Value:=now;
  tabGreigeRcptDailyUserMod.Value:=UserInitials;
  tabGreigeRcptDailyDateMod.ReadOnly:=true;
  tabGreigeRcptDailyUserMod.ReadOnly:=true;
end;
        //added JT170698   append row & copy field values
procedure TfrmGreigeRcpt.CopySpdBtnClick(Sender: TObject);
var
  WarpNo, GreigeNo: Integer;
  GreigeDate: TDateTime;
  LoomRef, VBStru, VBCol: string;
begin
//tabGreigeRcptDaily.Last;
  if qryGreigeRcptSTATUS.AsString = 'S' then
    raise Exception.Create('Greige already slit');
  WarpNo := tabGreigeRcptDailyWARPNO.AsInteger;
  GreigeNo := tabGreigeRcptDailyGREIGENO.AsInteger;
  GreigeDate := tabGreigeRcptDailyGREIGEDATE.AsDateTime;
  LoomRef := tabGreigeRcptDailyLOOMREF.AsString;
  VBSTru := tabGreigeRcptDailyVBSTRU.AsString;
  VBCol := tabGreigeRcptDailyVBCOL.AsString;
  tabGreigeRcptDaily.Append;
  tabGreigeRcptDailyWARPNO.AsInteger := WarpNo;
  tabGreigeRcptDailyGREIGENO.AsInteger := GreigeNo;
  tabGreigeRcptDailyGREIGEDATE.AsDateTime := GreigeDate;
  tabGreigeRcptDailyLOOMREF.AsString := LoomRef;
  tabGreigeRcptDailyVBSTRU.AsString := VBStru;
  tabGreigeRcptDailyVBCOL.AsString := VBCol;
  DBGrid1.SetFocus;
  DBGrid1.SelectedField := tabGreigeRcptDailyGREIGEDATE;
end;
      //added JT170698   enforce transaction completion
procedure TfrmGreigeRcpt.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := tabGreigeRcptDaily.State = dsBrowse;
  if not CanClose then
    MessageDlg('First post or cancel this edit', mtError, [mbOK], 0);
end;

procedure TfrmGreigeRcpt.datGreigeRcptDailyStateChange(Sender: TObject);
begin
  bitClose.Enabled := tabGreigeRcptDaily.State = dsBrowse;  //added JT180698
end;

procedure TfrmGreigeRcpt.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
