unit LoadUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, StdCtrls, Buttons, ExtCtrls, DBCtrls, DBTables, Mask;

type
  TLoadForm = class(TForm)
    ScenarioGrid: TDBGrid;
    ScenarioSource: TDataSource;
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    tabParams: TTable;
    datParams: TDataSource;
    tabParamsACTIVESCENARIO: TIntegerField;
    procedure ScenarioGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoadForm: TLoadForm;

implementation

uses MainUnit;

{$R *.DFM}

procedure TLoadForm.FormShow(Sender: TObject);
begin
  tabParams.Open;
  OKButton.Enabled := MainForm.Scenario.RecordCount > 0;
end;

procedure TLoadForm.ScenarioGridDblClick(Sender: TObject);
begin
  if OKButton.Enabled then ModalResult := mrOK;
end;

procedure TLoadForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tabParams.Close;
end;

end.
