unit DarkUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DataPrn, Grids, DBGrids, Db, DBTables;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    Table1YNCOL: TStringField;
    Table1DESCR: TStringField;
    Table1Darkness: TStringField;
    DBGrid1: TDBGrid;
    ODDataPrinter1: TODDataPrinter;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ODDataPrinter1.Print;
end;

end.
