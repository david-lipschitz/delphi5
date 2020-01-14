unit ReqUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  DBCtrls;

type
  TReqmtsForm = class(TForm)
    ToolPanel: TPanel;
    PrintButton: TSpeedButton;
    ExitButton: TSpeedButton;
    GroupCombo: TComboBox;
    RegGrid: TDBGrid;
    WeftReqDateQuery: TQuery;
    ReqSource: TDataSource;
    TypeCombo: TComboBox;
    WeftReqDateQuerySTARTDATE: TDateTimeField;
    WeftReqDateQueryWEFTCOL: TStringField;
    WeftReqDateQueryWEFTPCEWGT: TFloatField;
    WeftReqDateQueryWEFTWEIGHT: TFloatField;
    WeftReqJobQuery: TQuery;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    WeftReqJobQueryJOBNO: TIntegerField;
    WarpReqDateQuery: TQuery;
    DateTimeField2: TDateTimeField;
    WarpReqDateQueryWARPTYPE: TStringField;
    WarpReqDateQueryWARPCOL: TStringField;
    WarpReqDateQueryWARPWEIGHT: TFloatField;
    WarpReqJobQuery: TQuery;
    DateTimeField3: TDateTimeField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField3: TFloatField;
    WarpReqJobQueryJOBNO: TIntegerField;
    WeftReqDateQueryWEFTSTRU: TStringField;
    WeftReqDateQueryWEFTTWIST: TStringField;
    WeftReqJobQueryWEFTSTRU: TStringField;
    WeftReqJobQueryWEFTTWIST: TStringField;
    WeftReqJobQueryWEFTCOL: TStringField;
    StkGrid: TDBGrid;
    Splitter1: TSplitter;
    WarpStkQuery: TQuery;
    WeftStkQuery: TQuery;
    StkSource: TDataSource;
    WarpStkQueryWARPTYPE: TStringField;
    WarpStkQueryWARPCOL: TStringField;
    WarpStkQueryWARPNO: TIntegerField;
    WarpStkQueryWARPLEFT: TFloatField;
    WeftStkQueryYNSTRU: TStringField;
    WeftStkQueryYNTWIST: TStringField;
    WeftStkQueryYNCOL: TStringField;
    WeftStkQueryCOLUMN4: TStringField;
    WeftStkQuerySUM: TFloatField;
    WarpStkQueryCOLUMN4: TStringField;
    WarpStkQueryWARPLENGTH: TIntegerField;
    LinkCheck: TCheckBox;
    NavBtns: TDBNavigator;
    WarpReqDateQueryWARPLEN: TFloatField;
    WarpReqJobQueryWARPLEN: TFloatField;
    WeftReqDateQuerySUM: TFloatField;
    WeftReqJobQuerySUM: TFloatField;
    procedure WeftReqQueryCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ComboChange(Sender: TObject);
    procedure LinkCheckClick(Sender: TObject);
    procedure WeftReqQueryAfterScroll(DataSet: TDataSet);
    procedure RegGridEnter(Sender: TObject);
    procedure StkGridEnter(Sender: TObject);
  private
    Searching: Boolean;
    procedure FindStockWeft;
  end;

var
  ReqmtsForm: TReqmtsForm;

implementation

uses MainUnit;

{$R *.DFM}

procedure TReqmtsForm.FormCreate(Sender: TObject);
begin
  TypeCombo.ItemIndex := 0;
  TypeCombo.OnChange := ComboChange;
  GroupCombo.ItemIndex := 0;
  GroupCombo.OnChange := ComboChange;
end;

procedure TReqmtsForm.FormShow(Sender: TObject);
begin
  ComboChange(nil);
end;

procedure TReqmtsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReqSource.DataSet.Close;
  StkSource.DataSet.Close;
end;

procedure TReqmtsForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TReqmtsForm.ComboChange(Sender: TObject);
  procedure OpenQuery(Query: TQuery; DataSource: TDataSource);
  begin
    DataSource.DataSet.Close;
    DataSource.DataSet := Query;
    Query.Open;
  end;
begin
  if GroupCombo.ItemIndex > -1 then
    case TypeCombo.ItemIndex of
      0: begin
           OpenQuery(WarpStkQuery, StkSource);
           if GroupCombo.ItemIndex = 0 then
             OpenQuery(WarpReqDateQuery, ReqSource)
           else
             OpenQuery(WarpReqJobQuery, ReqSource);
         end;
      1: begin
           OpenQuery(WeftStkQuery, StkSource);
           if GroupCombo.ItemIndex = 0 then
             OpenQuery(WeftReqDateQuery, ReqSource)
           else
             OpenQuery(WeftReqJobQuery, ReqSource);
         end;
    end;
  LinkCheck.Visible := TypeCombo.ItemIndex > 0;
  FindStockWeft;
end;

procedure TReqmtsForm.WeftReqQueryCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    FieldByName('WEFTWEIGHT').AsFloat := Round(
      FieldByName('WEFTPCEWGT').AsFloat * FieldByName('SUM').AsInteger);
end;

procedure TReqmtsForm.PrintButtonClick(Sender: TObject);
begin
  with MainForm.DataPrinter do
  begin
{    AutoClose := False;}
    //print warp/weft requirements
    Title := Caption;
    SubTitles.Clear;
    SubTitles.Add(TypeCombo.Items[TypeCombo.ItemIndex] + ' ' +
      GroupCombo.Items[GroupCombo.ItemIndex]);
    DataSet := ReqSource.DataSet;
    Print;
    //print warp/weft in stock
{    DoTimeStamp := False;
    DoPageNumbers := False;
    Title := ' ';
    SubTitles.Clear;
    SubTitles.Add('Amount in stock');
    DataSet := StkSource.DataSet;
    Print;
    Printer.EndDoc;
    AutoClose := True;
    DoTimeStamp := True;
    DoPageNumbers := True;}
  end;
end;

procedure TReqmtsForm.LinkCheckClick(Sender: TObject);
begin
  if LinkCheck.Checked then
    FindStockWeft
  else
    StkGrid.Options := StkGrid.Options - [dgRowSelect, dgAlwaysShowSelection];
end;

procedure TReqmtsForm.FindStockWeft;
var
  bm: TBookmark;
  stru, twist, col: string;
begin
  if WeftStkQuery.Active and LinkCheck.Visible and LinkCheck.Checked then
  begin
    with ReqSource.DataSet do
    begin
      stru := FieldByName('WEFTSTRU').AsString;
      twist := FieldByName('WEFTTWIST').AsString;
      col := FieldByName('WEFTCOL').AsString;
    end;
    Searching := True;
    bm := WeftStkQuery.GetBookmark;
    WeftStkQuery.DisableControls;
    try
      WeftStkQuery.First;
      while not WeftStkQuery.EOF do
        if (stru = WeftStkQueryYNSTRU.AsString) and
           (twist = WeftStkQueryYNTWIST.AsString) and
           (col = WeftStkQueryYNCOL.AsString) then
          Break
        else
          WeftStkQuery.Next;
      if (stru = WeftStkQueryYNSTRU.AsString) and
         (twist = WeftStkQueryYNTWIST.AsString) and
         (col = WeftStkQueryYNCOL.AsString) then
        StkGrid.Options := StkGrid.Options + [dgRowSelect, dgAlwaysShowSelection]
      else
      begin
        StkGrid.Options := StkGrid.Options - [dgRowSelect, dgAlwaysShowSelection];
        WeftStkQuery.GotoBookmark(bm);
      end;
    finally
      WeftStkQuery.EnableControls;
      WeftStkQuery.FreeBookmark(bm);
      Searching := False;
    end;
  end;
end;

procedure TReqmtsForm.WeftReqQueryAfterScroll(DataSet: TDataSet);
begin
  if not Searching then FindStockWeft;
end;

procedure TReqmtsForm.RegGridEnter(Sender: TObject);
begin
  NavBtns.DataSource := ReqSource;
end;

procedure TReqmtsForm.StkGridEnter(Sender: TObject);
begin
  NavBtns.DataSource := StkSource;
end;

end.
