unit SaveUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, Buttons, Grids, DBGrids, Menus, ExtCtrls, DBCtrls, DBTables;

type
  TSaveForm = class(TForm)
    ScenarioGrid: TDBGrid;
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    ScenarioSource: TDataSource;
    NumberEdit: TEdit;
    Label1: TLabel;
    DescrEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    EditItem: TMenuItem;
    DeleteItem: TMenuItem;
    NumberButton: TSpeedButton;
    DBNavigator1: TDBNavigator;
    ParamsTable: TTable;
    ParamsTableACTIVESCENARIO: TIntegerField;
    ParamsSource: TDataSource;
    ThisScenarioCheck: TCheckBox;
    procedure OKButtonClick(Sender: TObject);
    procedure EditItemClick(Sender: TObject);
    procedure DeleteItemClick(Sender: TObject);
    procedure ScenarioSourceStateChange(Sender: TObject);
    procedure ScenarioSourceDataChange(Sender: TObject; Field: TField);
    procedure NumberButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure ScenarioGridDblClick(Sender: TObject);
    procedure ScenarioGridCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaveForm: TSaveForm;

implementation

uses MainUnit;

{$R *.DFM}

procedure TSaveForm.FormShow(Sender: TObject);
begin                      //not to change initial value
  ScenarioSource.OnDataChange := ScenarioSourceDataChange;
  ThisScenarioCheck.Checked := False;
  ParamsTable.Open;
end;

procedure TSaveForm.FormHide(Sender: TObject);
begin
  ScenarioSource.OnDataChange := nil;  //prevent final value from changing
  if ParamsTable.State = dsEdit then
    ParamsTable.Post;
  ParamsTable.Close;
end;

procedure TSaveForm.OKButtonClick(Sender: TObject);
begin
  if NumberEdit.Text <> '' then   //jt990430 saving scenario (otherwise changing active scenario)
  begin
    try
      StrToInt(NumberEdit.Text);
    except
      on Exception do
      begin
        MessageDlg('A valid number must be entered.', mtError, [mbOK], 0);
        NumberEdit.SetFocus;
        Exit;
      end;
    end;
    if MainForm.Scenario.FindKey([StrToInt(NumberEdit.Text)]) then
      case MessageDlg('Overwrite scenario "' + MainForm.ScenarioDESCR.Value +
          '" stored under the same number?', mtConfirmation,
          [mbYes, mbNo, mbCancel], 0) of
        mrYes: ModalResult := mrYes;   //close to overwrite existing scenario
        mrNo: NumberButtonClick(nil);  //stay open
        mrCancel: ModalResult := mrCancel;   //close without saving
      end
    else
      ModalResult := mrOK;    //close to save new scenario
    if (ModalResult <> mrCancel) and ThisScenarioCheck.Checked then
    begin
      ParamsTable.Edit;
      ParamsTableACTIVESCENARIO.AsInteger := StrToInt(NumberEdit.Text);
      ParamsTable.Post;
    end;
  end
  else
    ModalResult := mrOK;    //close to only change active scenario
end;

procedure TSaveForm.EditItemClick(Sender: TObject);
var
  st: string;
begin
  with MainForm do
  begin
    st := ScenarioDESCR.Value;
    if InputQuery('Edit Scenario Description', 'Description', st) then
    begin
      SchedDB.StartTransaction;
      try
        Scenario.Edit;
        ScenarioDESCR.Value := st;
        Scenario.Post;
        SchedDB.Commit;
      except
        SchedDB.Rollback;
        raise;
      end;
    end;
  end;
end;

procedure TSaveForm.DeleteItemClick(Sender: TObject);
begin
{  if MessageDlg('Delete this scenario?', mtConfirmation,
      [mbYes, mbNo, mbCancel], 0) = mrYes then
    with MainForm do
    begin
      SchedDB.StartTransaction;
      try
        DeleteScenarioJobs;
        Scenario.Delete;
        SchedDB.Commit;
      except
        SchedDB.Rollback;
        raise;
      end;
    end;}
end;

procedure TSaveForm.ScenarioSourceStateChange(Sender: TObject);
begin
  EditItem.Enabled := MainForm.Scenario.RecordCount > 0;
  DeleteItem.Enabled := EditItem.Enabled;
end;

procedure TSaveForm.ScenarioSourceDataChange(Sender: TObject; Field: TField);
begin
  NumberEdit.Text := MainForm.ScenarioSCENARIONO.AsString;
  DescrEdit.Text := MainForm.ScenarioDESCR.Value;
end;

procedure TSaveForm.NumberButtonClick(Sender: TObject);
begin
  NumberEdit.Text := IntToStr(NumberEdit.Tag);
  DescrEdit.Text := 'Scenario ' + NumberEdit.Text;
  DescrEdit.SetFocus;
end;

procedure TSaveForm.ScenarioGridDblClick(Sender: TObject);
begin
  if MainForm.Scenario.RecordCount > 0 then
    OKButtonClick(nil);
end;

procedure TSaveForm.ScenarioGridCellClick(Column: TColumn);
begin
  if MainForm.Scenario.RecordCount > 0 then
    ScenarioSourceDataChange(nil, nil);
end;

end.
