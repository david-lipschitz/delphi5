unit vblocalinvoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, DBCtrls, Buttons, QuickRpt, ExtCtrls;

type
  TfrmLocalInvoice = class(TForm)
    Panel1: TPanel;
    QuickRep1: TQuickRep;
    btnClose: TBitBtn;
    Discount: TLabel;
    DBEdit1: TDBEdit;
    tabVBDespHdr: TTable;
    datVBDespHdr: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalInvoice: TfrmLocalInvoice;

implementation

{$R *.DFM}

procedure TfrmLocalInvoice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end; //FormClose

procedure TfrmLocalInvoice.btnCloseClick(Sender: TObject);
begin
  Close;
end; //btnCloseClick

end.
