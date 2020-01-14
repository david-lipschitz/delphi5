unit Lotnocnt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TLotNoCountForm = class(TForm)
    Panel1: TPanel;
    CloseBitBtn: TBitBtn;
    LotNoDBGrid: TDBGrid;
    LotNoQuery: TQuery;
    LotNoQuerySource: TDataSource;
    LotNoQueryYNSTRU: TStringField;
    LotNoQueryYNTWIST: TStringField;
    LotNoQueryYNCOL: TStringField;
    LotNoQuerySUM: TFloatField;
    LotNoQueryCOUNT: TIntegerField;
    LotNoQueryCOLUMN4: TStringField;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LotNoCountForm: TLotNoCountForm;

implementation

{$R *.DFM}

procedure TLotNoCountForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TLotNoCountForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LotNoQuery.Close;
  LotNoCountForm.Release;
end;

procedure TLotNoCountForm.FormShow(Sender: TObject);
begin
  LotNoQuery.Open;
end;

end.
