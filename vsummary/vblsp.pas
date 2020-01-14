unit vblsp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, ExtCtrls, DBCtrls, DBTables, StdCtrls, Buttons;

type
  TVBLSPForm = class(TForm)
    VBLSP: TTable;
    VBLSPSource: TDataSource;
    VBLSPVBSTRU: TStringField;
    VBLSPVBWIDTH: TSmallintField;
    VBLSPQLTY: TStringField;
    VBLSPPRICETYPE: TStringField;
    VBLSPFROMDATE: TDateTimeField;
    VBLSPTODATE: TDateTimeField;
    VBLSPPRICE: TFloatField;
    VBLSPVBFIN: TStringField;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VBLSPAfterCancel(DataSet: TDataSet);
    procedure VBLSPAfterEdit(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VBLSPForm: TVBLSPForm;

implementation

{$R *.DFM}

uses Main;

procedure TVBLSPForm.FormShow(Sender: TObject);
begin
  VBLSP.Open;
end;

procedure TVBLSPForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VBLSP.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  VBLSP.Close;
  Release;
end;

procedure TVBLSPForm.VBLSPAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
end;

procedure TVBLSPForm.VBLSPAfterEdit(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TVBLSPForm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
