unit Expynpal;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Buttons, Gauges, ExtCtrls;

type
  TExportYarnRcptForm = class(TForm)
    LapTopYarnRcpt: TTable;
    CopyProgressGauge: TGauge;
    CloseBitBtn: TBitBtn;
    DoCommsBtn: TButton;
    StockYarnRcptQuery: TQuery;
    StockYarnRcptQueryBOXNO: TIntegerField;
    StockYarnRcptQueryLOTNO1: TSmallintField;
    StockYarnRcptQueryLOTNO2: TSmallintField;
    StockYarnRcptQueryYNSTRU: TStringField;
    StockYarnRcptQueryYNCOL: TStringField;
    StockYarnRcptQueryYNNET: TFloatField;
    StockYarnRcptQueryDATERCVD: TDateTimeField;
    StockYarnRcptQueryYNQLTY: TStringField;
    StockYarnRcptQueryDESPNO: TIntegerField;
    StockYarnRcptQueryYNTWIST: TStringField;
    StockYarnRcptQueryPALLETNO: TIntegerField;
    LapTopYarnRcptBOXNO: TIntegerField;
    LapTopYarnRcptLOTNO1: TSmallintField;
    LapTopYarnRcptLOTNO2: TSmallintField;
    LapTopYarnRcptYNSTRU: TStringField;
    LapTopYarnRcptYNCOL: TStringField;
    LapTopYarnRcptYNNET: TFloatField;
    LapTopYarnRcptDATERCVD: TDateTimeField;
    LapTopYarnRcptYNQLTY: TStringField;
    LapTopYarnRcptDESPNO: TIntegerField;
    LapTopYarnRcptYNTWIST: TStringField;
    LapTopYarnRcptPALLETNO: TIntegerField;
    StockCountBoxesQuery: TQuery;
    StockCountBoxesQueryCOUNT: TIntegerField;
    MessageLabel: TLabel;
    UpdateGuageTimer: TTimer;
    LapTopYarnRcptQuery: TQuery;
    StockYarnRcpt: TTable;
    StockYarnRcptBOXNO: TIntegerField;
    StockYarnRcptPALLETNO: TIntegerField;
    LapTopYarnRcptQueryBOXNO: TIntegerField;
    LapTopYarnRcptQueryLOTNO1: TSmallintField;
    LapTopYarnRcptQueryLOTNO2: TSmallintField;
    LapTopYarnRcptQueryYNSTRU: TStringField;
    LapTopYarnRcptQueryYNCOL: TStringField;
    LapTopYarnRcptQueryYNNET: TFloatField;
    LapTopYarnRcptQueryDATERCVD: TDateTimeField;
    LapTopYarnRcptQueryYNQLTY: TStringField;
    LapTopYarnRcptQueryDESPNO: TIntegerField;
    LapTopYarnRcptQueryYNTWIST: TStringField;
    LapTopYarnRcptQueryPALLETNO: TIntegerField;
    LapTopYarnRcptDelete: TQuery;
    StockYarnRcptDESPNO: TIntegerField;
    procedure DoCommsBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpdateGuageTimerTimer(Sender: TObject);
  private
    { Private declarations }
    Boxes,BoxesDone:integer;
    CopyInProgress:boolean;
    ScreenLabel:string[40];
    procedure ExportData;
    procedure ImportData;
  public
    { Public declarations }
  end;

var
  ExportYarnRcptForm: TExportYarnRcptForm;

implementation

{$R *.DFM}

uses Main;

procedure TExportYarnRcptForm.ExportData;
begin
  MainForm.LapTopDatabase.StartTransaction;
  LapTopYarnRcptQuery.Close;
  StockYarnRcptQuery.Close;
  StockYarnRcptQuery.Open;
  StockYarnRcptQuery.First;
  BoxesDone:=0; {boxes copied so far}
  CopyInProgress:=true;
  UpdateGuageTimer.Enabled:=true;
  while not StockYarnRcptQuery.EOF do
  begin
    LapTopYarnRcpt.Insert;
    LapTopYarnRcpt.FieldByName('BoxNo').AsInteger:=StockYarnRcptQueryBoxNo.Value;
    LapTopYarnRcpt.FieldByName('LotNo1').AsInteger:=StockYarnRcptQueryLotNo1.Value;
    LapTopYarnRcpt.FieldByName('LotNo2').AsInteger:=StockYarnRcptQueryLotNo2.Value;
    LapTopYarnRcpt.FieldByName('YnStru').AsString:=StockYarnRcptQueryYnStru.Value;
    LapTopYarnRcpt.FieldByName('YnCol').AsString:=StockYarnRcptQueryYnCol.Value;
    LapTopYarnRcpt.FieldByName('YnNet').AsFloat:=StockYarnRcptQueryYnNet.Value;
    LapTopYarnRcpt.FieldByName('YnQlty').AsString:=StockYarnRcptQueryYnQlty.Value;
    LapTopYarnRcpt.FieldByName('DespNo').AsInteger:=StockYarnRcptQueryDespNo.Value;
    LapTopYarnRcpt.FieldByName('DateRcvd').AsFloat:=StockYarnRcptQueryDateRcvd.Value;
    LapTopYarnRcpt.FieldByName('YnTwist').AsString:=StockYarnRcptQueryYnTwist.Value;
    LapTopYarnRcpt.FieldByName('PalletNo').AsInteger:=StockYarnRcptQueryPalletNo.Value;
    LapTopYarnRcpt.Post;
    inc(BoxesDone);
    StockYarnRcptQuery.Next;
    if (BoxesDone mod 10) = 0 then
      Application.ProcessMessages;
  end;
  CopyInProgress:=false;
  CopyProgressGauge.Progress:=100;
  UpdateGuageTimer.Enabled:=false;
  DoCommsBtn.Caption:='&Import';
  StockYarnRcptQuery.Close;
  MainForm.LapTopDatabase.Commit;
end;

procedure TExportYarnRcptForm.ImportData;
begin
  MainForm.LapTopDatabase.StartTransaction;
  StockYarnRcptQuery.Close;
  LapTopYarnRcptQuery.Close;
  StockYarnRcpt.Open;
  StockYarnRcpt.Refresh;
  LapTopYarnRcptQuery.Open;
  LapTopYarnRcptQuery.First;
  BoxesDone:=0; {boxes copied so far}
  CopyInProgress:=true;
  UpdateGuageTimer.Enabled:=true;
  while not LapTopYarnRcptQuery.EOF do
  begin
    StockYarnRcpt.SetKey;
    StockYarnRcpt.FieldByName('BoxNo').AsInteger:=
      LapTopYarnRcptQueryBoxNo.Value;
    if StockYarnRcpt.GotoKey then
      if (StockYarnRcptPalletNo.Value<>LapTopYarnRcptQueryPalletNo.Value)
        and (StockYarnRcptDespNo.Value=0) then {added DL240197}
      begin
        StockYarnRcpt.Edit;
        StockYarnRcpt.FieldByName('PalletNo').AsInteger:=
          LapTopYarnRcptQueryPalletNo.Value;
        StockYarnRcpt.Post;
      end;
    inc(BoxesDone);
    LapTopYarnRcptQuery.Next;
    if (BoxesDone mod 10) = 0 then
      Application.ProcessMessages;
  end;
  CopyInProgress:=false;
  CopyProgressGauge.Progress:=100;
  UpdateGuageTimer.Enabled:=false;
  DoCommsBtn.Caption:='&Export';
  LapTopYarnRcptQuery.Close;
  StockYarnRcpt.Close;
  LapTopYarnRcptDelete.ExecSQL;
  MainForm.LapTopDatabase.Commit;
end;

procedure TExportYarnRcptForm.DoCommsBtnClick(Sender: TObject);
var
  MessageText:string[7];
begin
  if DoCommsBtn.Caption='&Import' then
    MessageText:='Import?'
  else
    MessageText:='Export?';
  if MessageDlg(MessageText,
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if DoCommsBtn.Caption='&Import' then
      ImportData
    else
      ExportData;
  end;
end;

procedure TExportYarnRcptForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LapTopYarnRcpt.Close;
  MainForm.LapTopDatabase.Connected:=false;
  ExportYarnRcptForm.Release;
end;

procedure TExportYarnRcptForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TExportYarnRcptForm.FormShow(Sender: TObject);
begin
  MessageLabel.Caption:='';
  ScreenLabel:='';
  CopyInProgress:=false;
  MainForm.LapTopDatabase.Connected:=true;
  ScreenLabel:='Please wait.  Checking for boxes on laptop';
  LapTopYarnRcpt.Open;
  LapTopYarnRcpt.Refresh;
  LapTopYarnRcpt.First;
  if LapTopYarnRcpt.BOF<>LapTopYarnRcpt.EOF then {Data on LapTop}
    DoCommsBtn.Caption:='&Import'
  else {No Data on LapTop}
    DoCommsBtn.Caption:='&Export';
  ScreenLabel:='Please wait.  Check for boxes on PC.';
  StockCountBoxesQuery.Close;
  StockCountBoxesQuery.Open;
  Boxes:=StockCountBoxesQuery.Fields[0].AsInteger;
  ScreenLabel:='';
  if (Boxes=0) and (DoCommsBtn.Caption='&Export') then
    ShowMessage('Cannot copy as no boxes to despatch or palletise!')
  {else
    if (Boxes<PCBoxes=0 and DoCommsBtn.Caption='&Import) then
    Database error: shouldn't happen}
end;

procedure TExportYarnRcptForm.UpdateGuageTimerTimer(Sender: TObject);
begin
  if CopyInProgress and (Boxes>0) then
    CopyProgressGauge.Progress:=trunc(BoxesDone/Boxes*100)
  else
    CopyProgressGauge.Progress:=0; {refresh screen}
  MessageLabel.Caption:=ScreenLabel;
end;

end.
