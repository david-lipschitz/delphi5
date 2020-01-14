unit OutUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, Buttons, ExtCtrls, DBTables, StdCtrls,
  DBCtrls;

type
  TOutputForm = class(TForm)
    OutDateQuery: TQuery;
    ToolPanel: TPanel;
    PrintButton: TSpeedButton;
    ExitButton: TSpeedButton;
    DBGrid1: TDBGrid;
    OutDateQueryENDDATE: TDateTimeField;
    OutSource: TDataSource;
    GroupCombo: TComboBox;
    OutJobQuery: TQuery;
    OutJobQueryJOBNO: TIntegerField;
    OutJobQueryENDDATE: TDateTimeField;
    OutDateQueryFABRICSTRU: TStringField;
    OutDateQueryFABRICCOL: TStringField;
    OutJobQueryFABRICSTRU: TStringField;
    OutJobQueryFABRICCOL: TStringField;
    OutDateQueryFABRICLEN: TIntegerField;
    FabricLen: TTable;
    FabricLenFABRICSTRU: TStringField;
    FabricLenFABRICCOL: TStringField;
    FabricLenPIECELEN: TIntegerField;
    OutJobQueryFABRICLEN: TIntegerField;
    NavBtns: TDBNavigator;
    OutDateQuerySUM: TFloatField;
    OutJobQuerySUM: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupComboChange(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure OutDateQueryCalcFields(DataSet: TDataSet);
    procedure OutJobQueryCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OutputForm: TOutputForm;

implementation

uses MainUnit;

{$R *.DFM}

procedure TOutputForm.FormCreate(Sender: TObject);
begin
  GroupCombo.ItemIndex := 0;
  GroupCombo.OnChange := GroupComboChange;
end;

procedure TOutputForm.FormShow(Sender: TObject);
begin
  FabricLen.Open;
  GroupComboChange(nil);
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

procedure TOutputForm.GroupComboChange(Sender: TObject);
begin
  case GroupCombo.ItemIndex of
    0: begin
         OutJobQuery.Close;
         OutSource.DataSet := OutDateQuery;
         OutDateQuery.Open;
       end;
    1: begin
         OutDateQuery.Close;
         OutSource.DataSet := OutJobQuery;
         OutJobQuery.Open;
       end;
  end;
end;

procedure TOutputForm.PrintButtonClick(Sender: TObject);
begin
  with MainForm.DataPrinter do
  begin
    Title := Caption;
    SubTitles.Clear;
    SubTitles.Add(GroupCombo.Items[GroupCombo.ItemIndex]);
    DataSet := OutSource.DataSet;
    Print;
  end;
end;

procedure TOutputForm.OutDateQueryCalcFields(DataSet: TDataSet);
begin
  if FabricLen.FindKey([
     OutDateQueryFABRICSTRU.AsString, OutDateQueryFABRICCOL.AsString]) then
    OutDateQueryFABRICLEN.AsInteger :=
      OutDateQuerySUM.AsInteger * FabricLenPIECELEN.AsInteger;
end;

procedure TOutputForm.OutJobQueryCalcFields(DataSet: TDataSet);
begin
  if FabricLen.FindKey([
     OutJobQueryFABRICSTRU.AsString, OutJobQueryFABRICCOL.AsString]) then
    OutJobQueryFABRICLEN.AsInteger :=
      OutJobQuerySUM.AsInteger * FabricLenPIECELEN.AsInteger;
end;

end.
