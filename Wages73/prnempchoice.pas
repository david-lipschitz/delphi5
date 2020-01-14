//added DL030622

unit prnempchoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TfrmPrnEmpChoice = class(TForm)
    btnPrintReport: TBitBtn;
    btnCancelReport: TBitBtn;
    rdgPrnEmpChoice: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure btnPrintReportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrnEmpChoice: TfrmPrnEmpChoice;

implementation

uses prnempfullhs, prnempfulrhs;

{$R *.DFM}

procedure TfrmPrnEmpChoice.FormShow(Sender: TObject);
begin
  rdgPrnEmpChoice.ItemIndex:=0;
end;

procedure TfrmPrnEmpChoice.btnPrintReportClick(Sender: TObject);
begin
  frmPrnEmpFulLHS:=TfrmPrnEmpFulLHS.Create(Application);
  case rdgPrnEmpChoice.ItemIndex of
    0:frmPrnEmpFulLHS.qryEmployee.SQL[3]:='order by clkno';
    1:frmPrnEmpFulLHS.qryEmployee.SQL[3]:='order by wkspay';
    2:frmPrnEmpFulLHS.qryEmployee.SQL[3]:='order by wkspay desc';
    3:frmPrnEmpFulLHS.qryEmployee.SQL[3]:='order by surname,firstname';
    4:frmPrnEmpFulLHS.qryEmployee.SQL[3]:='order by firstname,surname';
  end;
  frmPrnEmpFulLHS.tabCompany.Open;
  frmPrnEmpFulLHS.qryEmployee.Open;
  frmPrnEmpFulLHS.qrpEmployeeLHS.Preview;
  frmPrnEmpFulLHS.qryEmployee.Close;
  frmPrnEmpFulLHS.tabCompany.Close;

  frmPrnEmpFulRHS:=TfrmPrnEmpFulRHS.Create(Application);
  case rdgPrnEmpChoice.ItemIndex of
    0:frmPrnEmpFulRHS.qryEmployee.SQL[3]:='order by clkno';
    1:frmPrnEmpFulRHS.qryEmployee.SQL[3]:='order by wkspay';
    2:frmPrnEmpFulRHS.qryEmployee.SQL[3]:='order by wkspay desc';
    3:frmPrnEmpFulRHS.qryEmployee.SQL[3]:='order by surname,firstname';
    4:frmPrnEmpFulRHS.qryEmployee.SQL[3]:='order by firstname,surname';
  end;
  frmPrnEmpFulRHS.tabCompany.Open;
  frmPrnEmpFulRHS.qryEmployee.Open;
  frmPrnEmpFulRHS.qrpEmployeeRHS.Preview;
  frmPrnEmpFulRHS.qryEmployee.Close;
  frmPrnEmpFulRHS.tabCompany.Close;
end;

procedure TfrmPrnEmpChoice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

end.
