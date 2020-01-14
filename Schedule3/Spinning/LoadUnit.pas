unit LoadUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TLoadForm = class(TForm)
    ScenarioGrid: TDBGrid;
    Scenario: TDataSource;
    Label1: TLabel;
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    DBNavigator1: TDBNavigator;
    procedure ScenarioGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoadForm: TLoadForm;

implementation

uses Main;

{$R *.DFM}

procedure TLoadForm.FormShow(Sender: TObject);
begin
  OKButton.Enabled := MainForm.Scenario.RecordCount > 0;
end;

procedure TLoadForm.ScenarioGridDblClick(Sender: TObject);
begin
  if OKButton.Enabled then ModalResult := mrOK;
end;

end.
