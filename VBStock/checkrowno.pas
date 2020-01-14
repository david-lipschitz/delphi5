unit checkrowno;
//method added DL030215

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Buttons, StdCtrls, Grids, DBGrids, DBTables;

type
  TfrmCheckRowNo = class(TForm)
    qryResetBox: TQuery;
    qryInsertBoxes: TQuery;
    qryInsertRows: TQuery;
    qryDisplayBoxRows: TQuery;
    qryUpdateBoxes: TQuery;
    dbgDisplayBoxRows: TDBGrid;
    btnFindBoxes: TButton;
    btnResetBoxRows: TButton;
    btnClose: TBitBtn;
    datDisplayBoxRows: TDataSource;
    qryDisplayBoxRowsBOXNO: TIntegerField;
    qryDisplayBoxRowsROWNO: TIntegerField;
    qryResetBoxRow: TQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnFindBoxesClick(Sender: TObject);
    procedure btnResetBoxRowsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCheckRowNo: TfrmCheckRowNo;

implementation

{$R *.DFM}

uses VBMain;

procedure TfrmCheckRowNo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

procedure TfrmCheckRowNo.btnCloseClick(Sender: TObject);
begin
  Close;
end; //btnCloseClick

procedure TfrmCheckRowNo.btnFindBoxesClick(Sender: TObject);
begin
  qryResetBox.Close;
  qryResetBoxRow.Close;
  qryInsertBoxes.Close;
  qryInsertRows.Close;
  qryDisplayBoxRows.Close;

  MainForm.Database.StartTransaction;
  qryResetBox.ExecSQL;
  qryResetBoxRow.ExecSQL;
  qryInsertBoxes.ExecSQL;
  qryInsertRows.ExecSQL;
  MainForm.Database.Commit;
  qryDisplayBoxRows.Open;
end; //btnFindBoxesClick

procedure TfrmCheckRowNo.btnResetBoxRowsClick(Sender: TObject);
begin
  qryDisplayBoxRows.First;
  while not qryDisplayBoxRows.EOF do
  begin
    qryUpdateBoxes.ParamByName('BoxNo').AsInteger:=qryDisplayBoxRowsBOXNO.AsInteger;
    MainForm.Database.StartTransaction;
    qryUpdateBoxes.ExecSQL;
    MainForm.Database.Commit;
    qryDisplayBoxRows.Next;
  end;
end; //btnResetBoxRowsClick

procedure TfrmCheckRowNo.FormShow(Sender: TObject);
begin
  //if this is not done, a person might reset the wrong rows.
  MainForm.Database.StartTransaction;
  qryResetBox.ExecSQL;
  qryResetBoxRow.ExecSQL;
  MainForm.Database.Commit;
end; //FormShow

end.
