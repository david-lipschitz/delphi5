unit stdqlty;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, Db, DBTables;

type
  TStdQltyForm = class(TForm)
    StdQltyValues: TTable;
    StdQltyValuesSource: TDataSource;
    StdQltyValuesPRODTYPE: TStringField;
    StdQltyValuesQLTY: TStringField;
    StdQltyValuesVALUERATING: TFloatField;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StdQltyForm: TStdQltyForm;

implementation

{$R *.DFM}

procedure TStdQltyForm.FormShow(Sender: TObject);
begin
  StdQltyValues.Open;
end;

procedure TStdQltyForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StdQltyValues.Close;
  StdQltyForm.Release;
end;

end.
