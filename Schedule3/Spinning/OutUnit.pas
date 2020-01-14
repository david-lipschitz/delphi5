unit OutUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, Buttons, ExtCtrls, DBTables, StdCtrls,
  DBCtrls, ODPopCal;

type
  TOutputForm = class(TForm)
    OutDateQuery: TQuery;
    ToolPanel: TPanel;
    PrintButton: TSpeedButton;
    ExitButton: TSpeedButton;
    DBGrid1: TDBGrid;
    OutSource: TDataSource;
    GroupCombo: TComboBox;
    OutJobQuery: TQuery;
    NavBtns: TDBNavigator;
    OutDateQueryFINISHDATE: TDateTimeField;
    OutDateQuerySTRUCT: TStringField;
    OutDateQueryTWIST: TStringField;
    OutDateQueryCOLOR: TStringField;
    OutDateQueryYARNWEIGHT: TIntegerField;
    OutJobQueryJOBNO: TIntegerField;
    OutJobQueryFINISHDATE: TDateTimeField;
    OutJobQuerySTRUCT: TStringField;
    OutJobQueryTWIST: TStringField;
    OutJobQueryCOLOR: TStringField;
    OutJobQueryYARNWEIGHT: TIntegerField;
    RangeCalendar: TODPopupCalendar;
    DateQuery: TQuery;
    DateQueryMIN: TDateTimeField;
    DateQueryMAX: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboChange(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure OutDateQueryCalcFields(DataSet: TDataSet);
    procedure OutJobQueryCalcFields(DataSet: TDataSet);
  public
    ScenarioNo: Integer;
  end;

var
  OutputForm: TOutputForm;

implementation

uses Main;

{$R *.DFM}

procedure TOutputForm.FormCreate(Sender: TObject);
begin
  GroupCombo.ItemIndex := 0;
end;

procedure TOutputForm.FormShow(Sender: TObject);
begin
  DateQuery.ParamByName('ScenarioNo').AsInteger :=
    MainForm.ScenarioSCENARIONO.AsInteger;
  DateQuery.Open;
  RangeCalendar.StartDate := DateQueryMIN.AsDateTime;
  RangeCalendar.FinishDate := DateQueryMAX.AsDateTime;
  DateQuery.Close;
  ComboChange(nil);
end;

procedure TOutputForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OutDateQuery.Close;
  OutJobQuery.Close;
end;

procedure TOutputForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TOutputForm.ComboChange(Sender: TObject);
begin
  if not Visible then Exit;
  with OutSource do
  begin
    DataSet.Close;
    case GroupCombo.ItemIndex of
      0: DataSet := OutDateQuery;
      1: DataSet := OutJobQuery;
    end;
    TQuery(DataSet).ParamByName('ScenarioNo').AsInteger := ScenarioNo;
    TQuery(DataSet).ParamByName('StartDate').AsDateTime := RangeCalendar.StartDate;
    TQuery(DataSet).ParamByName('FinishDate').AsDateTime := RangeCalendar.FinishDate;
    DataSet.Open;
  end;
end;

procedure TOutputForm.PrintButtonClick(Sender: TObject);
begin
  with MainForm.DataPrinter do
  begin
    Title := Caption;
    SubTitles.Clear;
    SubTitles.Add(GroupCombo.Text);
    DataSet := OutSource.DataSet;
    Print;
  end;
end;

procedure TOutputForm.OutDateQueryCalcFields(DataSet: TDataSet);
begin
{  if FabricLen.FindKey([
     OutDateQueryFABRICSTRU.AsString, OutDateQueryFABRICCOL.AsString]) then
    OutDateQueryFABRICLEN.AsInteger :=
      OutDateQuerySUM.AsInteger * FabricLenPIECELEN.AsInteger;}
end;

procedure TOutputForm.OutJobQueryCalcFields(DataSet: TDataSet);
begin
{  if FabricLen.FindKey([
     OutJobQueryFABRICSTRU.AsString, OutJobQueryFABRICCOL.AsString]) then
    OutJobQueryFABRICLEN.AsInteger :=
      OutJobQuerySUM.AsInteger * FabricLenPIECELEN.AsInteger;}
end;

end.
