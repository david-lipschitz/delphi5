unit vbqlty;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, DBCtrls, Grids, DBGrids, DBTables;

type
  TVBQltyForm = class(TForm)
    VBQlty: TTable;
    VBQltySource: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    VBQltyQLTY: TStringField;
    VBQltyDESCR: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VBQltyForm: TVBQltyForm;

implementation

{$R *.DFM}

uses Main;

procedure TVBQltyForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VBQlty.Close;
  VBQltyForm.Release;
end;

procedure TVBQltyForm.FormShow(Sender: TObject);
begin
  VBQlty.Open;
end;

end.
