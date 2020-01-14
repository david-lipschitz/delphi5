unit Ynlotno;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons,
  Dialogs, Mask;

type
  TYarnLotNoForm = class(TForm)
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    YarnLotNoSource: TDataSource;
    Panel2: TPanel;
    YarnLotNo: TTable;
    YarnLotNoLOTNO1: TIntegerField;
    YarnLotNoLOTNO2: TSmallintField;
    YarnLotNoYNCOL: TStringField;
    YarnLotNoDATEMANU: TDateTimeField;
    YarnLotNoDATERCVD: TDateTimeField;
    YarnLotNoRCVDBY: TStringField;
    Label1: TLabel;
    EditLotNo1: TDBEdit;
    Label2: TLabel;
    EditLotNo2: TDBEdit;
    Label3: TLabel;
    EditYnCol: TDBEdit;
    Label4: TLabel;
    EditDateManu: TDBEdit;
    Label5: TLabel;
    EditDateRcvd: TDBEdit;
    Label6: TLabel;
    EditRcvdBy: TDBEdit;
    LotNoSearchSpdBtn: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    YarnLotNoDESCR: TStringField;
    Label9: TLabel;
    EditDescr: TDBEdit;
    PostBtn: TButton;
    CancelBtn: TButton;
    CloseBitBtn: TBitBtn;
    YnColWBSLotNo: TTable;
    YnColWBSLotNoSource: TDataSource;
    ActiveSource: TDataSource;
    YnColWBSLotNoLOTNO1: TIntegerField;
    YnColWBSLotNoLOTNO2: TSmallintField;
    YnColWBSLotNoYNCOL: TStringField;
    YnColWBSLotNoFIBRE: TStringField;
    YnColWBSLotNoRUNNO: TStringField;
    YnColWBSLotNoDESCR: TStringField;
    DBGrid1: TDBGrid;
    YarnLotNoRUNKGS: TFloatField;
    Label10: TLabel;
    EditRunKgs: TDBEdit;
    YnColWBSLotNoRUNKGS: TFloatField;
    YnColSpdBtn: TSpeedButton;
    DateManuSpdBtn: TSpeedButton;
    YnColWBSQuery: TQuery;
    YnColWBSLotNoNUMENDS: TSmallintField;
    DeleteYnColWBSLotNoQuery: TQuery;
    YnColWBSQueryFIBRE: TStringField;
    YnColWBSQueryNUMENDS: TSmallintField;
    YarnLotNoYNSTRU: TStringField;
    YarnLotNoYNTWIST: TStringField;
    Label11: TLabel;
    EditYnStru: TDBEdit;
    Label12: TLabel;
    EditYnTwist: TDBEdit;
    AcrylicReqQuery: TQuery;
    AcrylicReqQueryACRYLREQ: TFloatField;
    Label13: TLabel;
    AcrylicReqQuerySource: TDataSource;
    EditAcrylReq: TDBEdit;
    TotalEndsQuery: TQuery;
    TotalEndsQuerySource: TDataSource;
    TotalEndsQuerySUM: TIntegerField;
    Label14: TLabel;
    EditTotalEnds: TDBEdit;
    procedure YarnLotNoAfterCancel(DataSet: TDataset);
    procedure YarnLotNoAfterDelete(DataSet: TDataset);
    procedure YarnLotNoAfterPost(DataSet: TDataset);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure YarnLotNoBeforeEdit(DataSet: TDataset);
    procedure YarnLotNoBeforeInsert(DataSet: TDataset);
    procedure YarnLotNoBeforeDelete(DataSet: TDataset);
    procedure YarnLotNoNewRecord(DataSet: TDataset);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure YnColWBSLotNoBeforeDelete(DataSet: TDataSet);
    procedure YnColWBSLotNoBeforeEdit(DataSet: TDataSet);
    procedure YnColWBSLotNoBeforeInsert(DataSet: TDataSet);
    procedure YnColWBSLotNoNewRecord(DataSet: TDataSet);
    procedure YarnLotNoSourceStateChange(Sender: TObject);
    procedure LotNoSearchSpdBtnClick(Sender: TObject);
    procedure YnColSpdBtnClick(Sender: TObject);
    procedure DateManuSpdBtnClick(Sender: TObject);
    procedure YarnLotNoRUNKGSChange(Sender: TField);
  private
    { private declarations }
    NoCommit:boolean;
    InTxn:boolean; {added DL250897}
  public
    { public declarations }
  end;

var
  YarnLotNoForm: TYarnLotNoForm;

implementation

uses Main, Brmodal, Pickdate;

{$R *.DFM}

procedure TYarnLotNoForm.YarnLotNoAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  InTxn:=false;
  YarnLotNo.Refresh;
  YnColWBSLotNo.Refresh;
end;

procedure TYarnLotNoForm.YarnLotNoAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TYarnLotNoForm.YarnLotNoAfterPost(DataSet: TDataset);
begin
  if not NoCommit then
  begin
    MainForm.Database.Commit;
    InTxn:=false;
  end;
end;

procedure TYarnLotNoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if YarnLotNo.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  TotalEndsQuery.Close;
  AcrylicReqQuery.Close;
  YnColWBSLotNo.Close;
  YarnLotNo.Close;
  YarnLotNoForm.Release;
end;

procedure TYarnLotNoForm.FormShow(Sender: TObject);
begin
  YarnLotNo.Open;
  YnColWBSLotNo.Open;
  AcrylicReqQuery.Open;
  TotalEndsQuery.Open;
  InTxn:=false;
  NoCommit:=false;
  DeleteYnColWBSLotNoQuery.Close;
  DeleteYnColWBSLotNoQuery.Prepare;
  YnColWBSQuery.Prepare;
end;

procedure TYarnLotNoForm.CloseBitBtnClick(Sender: TObject);
begin
  if YarnLotNo.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post yarn lots before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TYarnLotNoForm.YarnLotNoBeforeEdit(DataSet: TDataset);
begin
  if not InTxn then
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TYarnLotNoForm.YarnLotNoBeforeInsert(DataSet: TDataset);
begin
  if InTxn then
    raise Exception.Create('Post before inserting')
  else
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TYarnLotNoForm.YarnLotNoBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TYarnLotNoForm.YarnLotNoNewRecord(DataSet: TDataset);
begin
  YarnLotNoDateRcvd.Value:=date;
  YarnLotNoRcvdBy.Value:=UserInitials;
  YarnLotNoDateManu.Value:=date;
  YarnLotNoRunKgs.Value:=0;
end;


procedure TYarnLotNoForm.PostBtnClick(Sender: TObject);
begin
  YarnLotNo.Post;
end;

procedure TYarnLotNoForm.CancelBtnClick(Sender: TObject);
begin
  YarnLotNo.Cancel;
end;

procedure TYarnLotNoForm.YnColWBSLotNoBeforeDelete(DataSet: TDataSet);
begin
  YarnLotNo.Edit;
end;

procedure TYarnLotNoForm.YnColWBSLotNoBeforeEdit(DataSet: TDataSet);
begin
  YarnLotNo.Edit;
end;

procedure TYarnLotNoForm.YnColWBSLotNoBeforeInsert(DataSet: TDataSet);
begin
  if YarnLotNo.State = dsInsert then
  begin
    NoCommit:=true;
    YarnLotNo.Post;
    YarnLotNo.Edit;
    NoCommit:=false;
  end
  else
    YarnLotNo.Edit;
end;

procedure TYarnLotNoForm.YnColWBSLotNoNewRecord(DataSet: TDataSet);
begin
  {records created automatically}
  {YnColWBSYnCol.Value:=YarnColYnCol.Value;}
end;

procedure TYarnLotNoForm.YarnLotNoSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := YarnLotNo.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := YarnLotNo.State = dsBrowse;
end;

procedure TYarnLotNoForm.LotNoSearchSpdBtnClick(Sender: TObject);
begin
  if YarnLotNo.State in [dsEdit,dsInsert] then
    ShowMessage('Cannot search when in Insert or Edit Mode')
  else
  begin
    if PickDlgForm.ShowModalYarnLotNo = mrOk then
    begin
      YarnLotNo.SetKey;
      YarnLotNo.FieldByName('LotNo1').AsInteger:=PickDlgForm.YarnLotNoLotNo1;
      YarnLotNo.FieldByName('LotNo2').AsInteger:=PickDlgForm.YarnLotNoLotNo2;
      YarnLotNo.FieldByName('YnCol').AsString:=PickDlgForm.YarnLotNoYarnCol;
      YarnLotNo.GotoKey;
    end;
  end;
end;

procedure TYarnLotNoForm.YnColSpdBtnClick(Sender: TObject);
begin
  if YarnLotNoRunKgs.Value<>0 then
    ShowMessage('Set Kgs to Zero before searching')
  else
  if PickDlgForm.ShowModalYarnType = mrOk then
  begin
    YarnLotNo.Edit;
    EditYnStru.ReadOnly:=false;
    EditYnTwist.ReadOnly:=false;
    EditYnCol.ReadOnly:=false;
{    YarnRcpt.Edit;}
    YarnLotNoYnStru.Value:=PickDlgForm.YarnTypeStru;
    YarnLotNoYnTwist.Value:=PickDlgForm.YarnTypeYnTwist;
    YarnLotNoYnCol.Value:=PickDlgForm.YarnTypeCol;
    EditYnStru.ReadOnly:=true;
    EditYnTwist.ReadOnly:=true;
    EditYnCol.ReadOnly:=true;
    AcrylicReqQuery.Close;
    TotalEndsQuery.Close;
    AcrylicReqQuery.Open;
    TotalEndsQuery.Open;
  end;
  Screen.Cursor := crDefault; { Always restore to normal }
end;

procedure TYarnLotNoForm.DateManuSpdBtnClick(Sender: TObject);
begin
  BrDateForm.Date:=date;
  if BRDateForm.ShowModal=mrOK then
  begin
    YarnLotNo.Edit;
    YarnLotNoDateManu.Value:=BRDateForm.Date;
  end;
end;

procedure TYarnLotNoForm.YarnLotNoRUNKGSChange(Sender: TField);
begin
  if NoCommit then
    Exit;
  if ((YarnLotNoLotNo1.Value=0) or (YarnLotNoLotNo2.Value=0) or
    (YarnLotNoYnCol.Value='')) and (YarnLotNoRunKgs.Value<>0) then
  begin
    ShowMessage('Must fill in Lot No and Colour before weight');
{    YarnLotNoRunKgs.Value:=0;}
    Abort; {procedure}
  end;
  if (YarnLotNo.State in [dsEdit,dsInsert]) and (YarnLotNoRunKgs.Value<>0) then
  begin
    if (AcrylicReqQueryACRYLREQ.Value=0) then
    begin
      ShowMessage('Must enter Structure WBS before entering weight');
{      YarnLotNoRunKgs.Value:=0;}
      Abort; {procedure}
    end;
    if (TotalEndsQuerySUM.Value=0) then
    begin
      ShowMessage('Must enter Colour WBS before entering weight');
{      YarnLotNoRunKgs.Value:=0;}
      Abort; {procedure}
    end;
  end;
  if YarnLotNoRunKgs.Value=0 then
  begin
    DeleteYnColWBSLotNoQuery.Params[0].AsInteger:=YarnLotNoLotNo1.AsInteger;
    DeleteYnColWBSLotNoQuery.Params[1].AsInteger:=YarnLotNoLotNo2.AsInteger;
    DeleteYnColWBSLotNoQuery.Params[2].AsString:=YarnLotNoYnCol.AsString;
    DeleteYnColWBSLotNoQuery.ExecSQL;
    YnColWBSLotNo.Refresh;
  end
  else {if details don't exist then insert}
  begin
    NoCommit:=true;
    YarnLotNo.Post;
    YarnLotNo.Edit;
    NoCommit:=false;
    {fill in the WBS if it doesn't already exist}
{    if (not (YnColWBSLotNo.FindKey([YarnLotNoLotNo1.Value,
      YarnLotNoLotNo2.Value,YarnLotNoYnCol.Value]))) then
    begin}
    DeleteYnColWBSLotNoQuery.Params[0].AsInteger:=YarnLotNoLotNo1.AsInteger;
    DeleteYnColWBSLotNoQuery.Params[1].AsInteger:=YarnLotNoLotNo2.AsInteger;
    DeleteYnColWBSLotNoQuery.Params[2].AsString:=YarnLotNoYnCol.AsString;
    DeleteYnColWBSLotNoQuery.ExecSQL;
    YnColWBSLotNo.Refresh; {xxx is slow; find another way}
      YnColWBSQuery.Close;
      YnColWBSQuery.Params[0].AsString:=YarnLotNoYnCol.Value;
      YnColWBSQuery.Open;
      YnColWBSQuery.First;
      while not YnColWBSQuery.EOF do
      begin
        with YnColWBSLotNo do
        begin
          Insert;
          FieldByName('LotNo1').AsInteger:=YarnLotNoLotNo1.Value;
          FieldByName('LotNo2').AsInteger:=YarnLotNoLotNo2.Value;
          FieldByName('YnCol').AsString:=YarnLotNoYnCol.Value;
          FieldByName('Fibre').ReadOnly:=false;
          FieldByName('Fibre').AsString:=YnColWBSQueryFibre.Value;
          FieldByName('Fibre').ReadOnly:=true;
          FieldByName('NumEnds').ReadOnly:=false;
          FieldByName('NumEnds').AsInteger:=YnColWBSQueryNumEnds.Value;
          FieldByName('NumEnds').ReadOnly:=true;
          FieldByName('RunKgs').ReadOnly:=false;
          FieldByName('RunKgs').AsFloat:=YarnLotNoRUNKGS.AsFloat*
            AcrylicReqQueryACRYLREQ.AsFloat*YnColWBSQueryNumEnds.AsFloat/
            TotalEndsQuerySUM.AsFloat;
          FieldByName('RunKgs').ReadOnly:=true;
          Post;
        end;
        YnColWBSQuery.Next;
      end;
      YnColWBSQuery.Close;
    {end;}
  end;
end;

end.
