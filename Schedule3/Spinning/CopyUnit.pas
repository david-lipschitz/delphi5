unit CopyUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables;

type
  TCopyForm = class(TForm)
    SrcDB: TDatabase;
    DstDB: TDatabase;
    Src: TTable;
    Dst: TTable;
    CopyButton: TButton;
    procedure CopyButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CopyForm: TCopyForm;

implementation

{$R *.DFM}

procedure TCopyForm.FormShow(Sender: TObject);
begin
  Caption := 'Copy ' + Src.TableName + ' from ' +
    SrcDB.AliasName + ' to ' + DstDB.AliasName;
end;

procedure TCopyForm.CopyButtonClick(Sender: TObject);
var
  ix: Integer;
begin
  CopyButton.Enabled := False;
  Dst.Close;
  Dst.EmptyTable;
  Dst.Open;
  Src.Open;
  Src.First;
  DstDB.StartTransaction;
  try
    while not Src.EOF do
    begin
      Dst.Insert;
      for ix := 0 to Src.FieldCount-1 do
        Dst.Fields[ix].AsString := Src.Fields[ix].AsString;
      Dst.Post;
      Src.Next;
    end;
    DstDB.Commit;
  except
    DstDB.Rollback;
  end;
  ShowMessage(Src.TableName + ' copied');
end;

end.
