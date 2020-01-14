unit fsetvbredundant;
//form added DL060510

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, ExtCtrls, ODPopCal;

type
  TfrmSetVBRedundant = class(TForm)
    Panel1: TPanel;
    gbxAllInfo: TGroupBox;
    Panel2: TPanel;
    gbxSummary: TGroupBox;
    gbxRequirements: TGroupBox;
    qryAllInfo: TQuery;
    datAllInfo: TDataSource;
    qrySummaryInfo: TQuery;
    datSummaryInfo: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    gbxQuality: TGroupBox;
    qryQlty: TQuery;
    datQlty: TDataSource;
    DBGrid3: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtVBStru: TEdit;
    edtVBCol: TEdit;
    edtVBFin: TEdit;
    edtMetricWidth: TEdit;
    edtToManuDate: TODPopupCalendar;
    edtFromDespDate: TODPopupCalendar;
    btnFind: TButton;
    btnZeroValueRating: TButton;
    btnClose: TButton;
    qryUpdateVBRcptDespAll: TQuery;
    qrySummaryInfoQLTY: TStringField;
    qrySummaryInfoDESP: TStringField;
    qryUpdateVBRcptDesp0: TQuery;
    gbxAllQltySum: TGroupBox;
    dbgAllQltySum: TDBGrid;
    qryAllQltySum: TQuery;
    datAllQltySum: TDataSource;
    qryAllQltySumNETLENGTH: TFloatField;
    qrySummaryInfoNETLENGTH: TFloatField;
    qryAllInfoVBSTRU: TStringField;
    qryAllInfoVBCOL: TStringField;
    qryAllInfoVBFIN: TStringField;
    qryAllInfoMETRICWIDTH: TSmallintField;
    qryAllInfoDATEMANU: TDateTimeField;
    qryAllInfoDESPNO: TIntegerField;
    qryAllInfoQLTY: TStringField;
    qryAllInfoNETLENGTH: TFloatField;
    qryAllInfoDESPDATE: TDateTimeField;
    qryAllInfoVALUERATING: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnZeroValueRatingClick(Sender: TObject);
  private
    { Private declarations }
    aStartDate:TDateTime;
  public
    { Public declarations }
  end;

var
  frmSetVBRedundant: TfrmSetVBRedundant;

implementation

{$R *.DFM}

uses VBMain; {, PickDate, VBModal, VBUtils,
  VBBarCde, Dialogs, Vbboxlab;}


procedure TfrmSetVBRedundant.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

procedure TfrmSetVBRedundant.FormShow(Sender: TObject);
begin
  qryQlty.Open;
  edtVBStru.Clear;
  edtVBCol.Clear;
  edtVBFin.Clear;
  edtMetricWidth.Clear;
  aStartDate:=encodeDate(2003,12,31);
  edtToManuDate.StartDate:=aStartDate;
  aStartDate:=encodeDate(2005,1,1);
  edtFromDespDate.StartDate:=aStartDate;
  edtVBStru.SetFocus;
end;

procedure TfrmSetVBRedundant.btnFindClick(Sender: TObject);
begin
  qryAllInfo.Close;
  qrySummaryInfo.Close;
  qryAllQltySum.Close;
  qryAllInfo.ParamByName('VBStru').AsString:=edtVBStru.Text;
  qryAllInfo.ParamByName('VBCol').AsString:=edtVBCol.Text;
  qryAllInfo.ParamByName('VBFin').AsString:=edtVBFin.Text;
  qryAllInfo.ParamByName('MetricWidth').AsInteger:=strtoint(edtMetricWidth.Text);
  qryAllInfo.ParamByName('ToDateManu').AsDateTime:=edtToManuDate.StartDate;
  qryAllInfo.ParamByName('FromDespDate').AsDateTime:=edtFromDespDate.StartDate;
  qryAllInfo.Open;
  qrySummaryInfo.ParamByName('VBStru').AsString:=edtVBStru.Text;
  qrySummaryInfo.ParamByName('VBCol').AsString:=edtVBCol.Text;
  qrySummaryInfo.ParamByName('VBFin').AsString:=edtVBFin.Text;
  qrySummaryInfo.ParamByName('MetricWidth').AsInteger:=strtoint(edtMetricWidth.Text);
  qrySummaryInfo.ParamByName('ToDateManu').AsDateTime:=edtToManuDate.StartDate;
  qrySummaryInfo.ParamByName('FromDespDate').AsDateTime:=edtFromDespDate.StartDate;
  qrySummaryInfo.Open;
  qryAllQltySum.ParamByName('VBStru').AsString:=edtVBStru.Text;
  qryAllQltySum.ParamByName('VBCol').AsString:=edtVBCol.Text;
  //qryAllQltySum.ParamByName('VBFin').AsString:=edtVBFin.Text;
  qryAllQltySum.ParamByName('MetricWidth').AsInteger:=strtoint(edtMetricWidth.Text);
  qryAllQltySum.ParamByName('ToDateManu').AsDateTime:=edtToManuDate.StartDate;
  qryAllQltySum.ParamByName('FromDespDate').AsDateTime:=edtFromDespDate.StartDate;
  qryAllQltySum.Open;
end;

procedure TfrmSetVBRedundant.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetVBRedundant.btnZeroValueRatingClick(Sender: TObject);
begin
  if MessageDlg('Zero for chosen information plus qlty = '+qrySummaryInfoQLTY.AsString+' and '+qrySummaryInfoDESP.AsString+' ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if qrySummaryInfoDESP.AsString='alldesp' then
    begin
      qryUpdateVBRcptDespAll.Close;
      qryUpdateVBRcptDespAll.ParamByName('VBStru').AsString:=edtVBStru.Text;
      qryUpdateVBRcptDespAll.ParamByName('VBCol').AsString:=edtVBCol.Text;
      qryUpdateVBRcptDespAll.ParamByName('VBFin').AsString:=edtVBFin.Text;
      qryUpdateVBRcptDespAll.ParamByName('MetricWidth').AsInteger:=strtoint(edtMetricWidth.Text);
      qryUpdateVBRcptDespAll.ParamByName('ToDateManu').AsDateTime:=edtToManuDate.StartDate;
      qryUpdateVBRcptDespAll.ParamByName('FromDespDate').AsDateTime:=edtFromDespDate.StartDate;
      qryUpdateVBRcptDespAll.ParamByName('Qlty').AsString:=qrySummaryInfoQLTY.AsString;
      try
        MainForm.Database.StartTransaction;
        qryUpdateVBRcptDespAll.ExecSQL;
        MainForm.Database.Commit;
        ShowMessage('Update Process completed successfully. Please click Find button to refresh');
      except
        MainForm.Database.Rollback;
        ShowMessage('Update Process failed.');
      end;
    end
    else
    begin
      qryUpdateVBRcptDesp0.Close;
      qryUpdateVBRcptDesp0.ParamByName('VBStru').AsString:=edtVBStru.Text;
      qryUpdateVBRcptDesp0.ParamByName('VBCol').AsString:=edtVBCol.Text;
      qryUpdateVBRcptDesp0.ParamByName('VBFin').AsString:=edtVBFin.Text;
      qryUpdateVBRcptDesp0.ParamByName('MetricWidth').AsInteger:=strtoint(edtMetricWidth.Text);
      qryUpdateVBRcptDesp0.ParamByName('ToDateManu').AsDateTime:=edtToManuDate.StartDate;
      //qryUpdateVBRcptDesp0.ParamByName('FromDespDate').AsDateTime:=edtFromDespDate.StartDate;
      qryUpdateVBRcptDesp0.ParamByName('Qlty').AsString:=qrySummaryInfoQLTY.AsString;
      try
        MainForm.Database.StartTransaction;
        qryUpdateVBRcptDesp0.ExecSQL;
        MainForm.Database.Commit;
        ShowMessage('Update Process completed successfully. Please click Find button to refresh');
      except
        MainForm.Database.Rollback;
        ShowMessage('Update Process failed.');
      end;
    end;
  end;
end;

end.


{select vbstru,vbcol,vbfin,metricwidth,datemanu,despno,qlty,netlength,despdate,valuerating
from vbrcpt
where vbstru='AWN'
and vbcol='221'
and vbfin='AW'
and metricwidth=2100
and datemanu<='31-dec-2004'
and (despdate>='1-jan-2005' or despdate is null)
and valuerating=1

select qlty,sum(netlength)
from vbrcpt
where vbstru='AWN'
and vbcol='221'
and vbfin='AW'
and metricwidth=2100
and datemanu<='31-dec-2004'
and (despdate>='1-jan-2005' or despdate is null)
and valuerating=1
group by qlty

Stock VB Summary New Manu by year report: change to include valuerating=1 only;
change to include only qlties with values, ie '', N, S
SELECT VBRCPT.QLTY,vbrcpt.labelstru,
VBRCPT.METRICWIDTH,
sum(VBRCPT.NETLENGTH),
vbrcpt.vbstru,vbrcpt.vbfin,vr.vbcol,vy.yearno,
vs.stkprice,
sum(VBRCPT.NETLENGTH)*vs.stkprice as stkvalue
FROM VBRCPT vr,vbtype vt,vtyear vy, vbpricesstd vs
WHERE (VBRCPT.VBSTRU= VBTYPE.VBSTRU )
AND (VBRCPT.VBCOL= VBTYPE.VBCOL )
and (vbrcpt.vbfin=vbtype.vbfin)
and ((vbrcpt.despdate >  <<AsAtDate, "'"mm\/dd\/yyyy hh\:mm\:ss"'">>)
 or (vbrcpt.despdate is null))
and (VBrcpt.datemanu <= <<AsAtDate, "'"mm\/dd\/yyyy hh\:mm\:ss"'">>)
and (vbrcpt.grosslength>0)
and (vr.qlty='')
and (vr.datemanu>=vy.startdate) and (vr.datemanu<=vy.finishdate)
and vr.vbstru=vs.vbstru
and vr.metricwidth=vs.vbwidth
and vr.qlty=vs.qlty
and vr.vbfin=vs.vbfin
and (vs.todate >= <<AsAtDate, "'"mm\/dd\/yyyy hh\:mm\:ss"'">>)
and (vs.fromdate <= <<AsAtDate, "'"mm\/dd\/yyyy hh\:mm\:ss"'">>)
group by VBRCPT.QLTY,
VBRCPT.METRICWIDTH,vbrcpt.labelstru,vbrcpt.vbstru,
vbrcpt.vbfin,vr.vbcol,vy.yearno,vs.stkprice
ORDER BY vy.yearno,VBRCPT.QLTY,VBRCPT.METRICWIDTH,
vbrcpt.vbstru,vr.vbcol,vbrcpt.vbfin,vr.labelstru

}
