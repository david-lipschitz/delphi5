unit DelUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TDeleteForm = class(TForm)
    Label1: TLabel;
    DeleteButton: TSpeedButton;
    ScenarioSource: TDataSource;
    ScenarioGrid: TDBGrid;
    DBNavigator1: TDBNavigator;
    CancelButton: TBitBtn;
    DeleteQuery: TQuery;
    procedure DeleteButtonClick(Sender: TObject);
  public
    procedure DeleteScenario;
  end;

var
  DeleteForm: TDeleteForm;

implementation

uses MainUnit;

{$R *.DFM}

procedure TDeleteForm.DeleteScenario;
var
  st: string;
begin
  st := 'where scenariono = ' + MainForm.ScenarioSCENARIONO.AsString;
  with DeleteQuery do
  begin
    SQL.Clear;
    SQL.Add('delete from weaveitem');
    SQL.Add(st);
    ExecSQL;
    SQL.Clear;
    SQL.Add('delete from weavejob');
    SQL.Add(st);
    ExecSQL;
    SQL.Clear;
    SQL.Add('delete from reedjob');
    SQL.Add(st);
    ExecSQL;
    SQL.Clear;
    SQL.Add('delete from downtimejob');
    SQL.Add(st);
    ExecSQL;
{    SQL.Clear;
    SQL.Add('delete from scenario');
    SQL.Add(st);
    ExecSQL;}
  end;
  MainForm.Scenario.Delete;
end;

procedure TDeleteForm.DeleteButtonClick(Sender: TObject);
begin
  MainForm.SchedDB.StartTransaction;
  try
    DeleteScenario;
  except
    on Exception do
    begin
      MainForm.SchedDB.Rollback;
      raise;
    end;
  end;
  MainForm.SchedDB.Commit;
end;

end.
