unit reslit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, DBTables, Buttons;

type
  TfrmReslit = class(TForm)
    qryFWAvail: TQuery;
    datFWAvail: TDataSource;
    qrySlit: TQuery;
    datSlit: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    qrySlitWARPNO: TIntegerField;
    qrySlitGREIGENO: TSmallintField;
    qrySlitFINNO: TIntegerField;
    qrySlitRETURNED: TStringField;
    qrySlitVBSTRU: TStringField;
    qrySlitVBCOL: TStringField;
    qrySlitVBFIN: TStringField;
    qrySlitMETRICWIDTH: TSmallintField;
    qrySlitDATEMANU: TDateTimeField;
    qrySlitFW: TFloatField;
    qryFWAvailWARPNO: TIntegerField;
    qryFWAvailGREIGENO: TSmallintField;
    qryFWAvailPIECENO: TSmallintField;
    qryFWAvailFINNO: TIntegerField;
    qryFWAvailRETURNED: TStringField;
    qryFWAvailVBSTRU: TStringField;
    qryFWAvailVBCOL: TStringField;
    qryFWAvailVBFIN: TStringField;
    qryFWAvailMETRICWIDTH: TSmallintField;
    qryFWAvailFW: TFloatField;
    btnClose: TBitBtn;
    DBGrid3: TDBGrid;
    qryDespatched: TQuery;
    datDespatched: TDataSource;
    Label3: TLabel;
    qryDespatchedDESPNO: TIntegerField;
    qryDespatchedDESPDATE: TDateTimeField;
    qryDespatchedWARPNO: TIntegerField;
    qryDespatchedGREIGENO: TSmallintField;
    qryDespatchedPIECENO: TSmallintField;
    qryDespatchedFINNO: TIntegerField;
    qryDespatchedRETURNED: TStringField;
    qryDespatchedVBSTRU: TStringField;
    qryDespatchedVBCOL: TStringField;
    qryDespatchedVBFIN: TStringField;
    qryDespatchedMETRICWIDTH: TSmallintField;
    qryDespatchedFW: TFloatField;
    qrySlitPIECENO: TSmallintField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    WarpNo:integer;
    GreigeNo:integer;
    FinNo:integer;
    MetricWidth:integer
  end;

var
  frmReslit: TfrmReslit;

implementation

{$R *.DFM}

uses VBMain;

procedure TfrmReslit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryDespatched.Close;
  qryFWAvail.Close;
  qrySlit.Close;
  Release;
end;

procedure TfrmReslit.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReslit.FormShow(Sender: TObject);
begin
  qryFWAvail.Close;
  qryFWAvail.ParamByName('WarpNo').AsInteger:=WarpNo;
  qryFWAvail.ParamByName('GreigeNo').AsInteger:=GreigeNo;
  qryFWAvail.ParamByName('FinNo').AsInteger:=FinNo;
  qryFWAvail.Open;
  qrySlit.Close;
  qrySlit.ParamByName('WarpNo').AsInteger:=WarpNo;
  qrySlit.ParamByName('GreigeNo').AsInteger:=GreigeNo;
  qrySlit.ParamByName('FinNo').AsInteger:=FinNo;
  qrySlit.Open;
  qryDespatched.Close;
  qryDespatched.ParamByName('WarpNo').AsInteger:=WarpNo;
  qryDespatched.ParamByName('GreigeNo').AsInteger:=GreigeNo;
  qryDespatched.ParamByName('FinNo').AsInteger:=FinNo;
  qryDespatched.Open;
end;

end.
