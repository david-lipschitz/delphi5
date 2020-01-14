unit FinalPayslip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, quickrpt, ExtCtrls;

type
  TfrmFinalPaySlip = class(TForm)
    qrpFinalPayslip: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape1: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRShape4: TQRShape;
    QRShape2: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText39: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText44: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText45: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText55: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText49: TQRDBText;
    QRShape6: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText65: TQRDBText;
    QRDBText64: TQRDBText;
    QRShape3: TQRShape;
    QRDBText66: TQRDBText;
    QRLabel59: TQRLabel;
    QRLabel58: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel61: TQRLabel;
    qryFinalPaySlip: TQuery;
    QRShape5: TQRShape;
    QRLabel43: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText40: TQRDBText;
    QRShape7: TQRShape;
    QRLabel47: TQRLabel;
    QRDBText41: TQRDBText;
    tabCompany: TTable;
    tabCompanyCONAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinalPaySlip: TfrmFinalPaySlip;

implementation

{$R *.DFM}

procedure TfrmFinalPaySlip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

end.
