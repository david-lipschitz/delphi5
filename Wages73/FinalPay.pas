unit FinalPay;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Menus, ODDBFind, Db, ODPopCal, ODDBCal, DBTables, Mask, DBCtrls,
  StdCtrls, ExtCtrls;

type
  TfrmFinalPay = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtEmployeeFullName: TEdit;
    dbnEmployee: TDBNavigator;
    Panel2: TPanel;
    Label61: TLabel;
    Label2: TLabel;
    edtClkNo: TDBEdit;
    edtSurname: TDBEdit;
    edtFirstName: TDBEdit;
    edtBirthDate: TDBEdit;
    edtStartDate: TDBEdit;
    edtHrPayRate: TDBEdit;
    edtPayRateSetDate: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label28: TLabel;
    Label13: TLabel;
    Label22: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    edtBankAccRef: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    edtDeptNo: TDBEdit;
    edtInsurance: TDBEdit;
    edtRepayLnWk: TDBEdit;
    edtAttBonusWk: TDBEdit;
    edtIDNo: TDBEdit;
    edtOccupation: TDBEdit;
    edtHusbandName: TDBEdit;
    edtNoOfChild: TDBEdit;
    edtSaveWk: TDBEdit;
    edtRentMonth: TDBEdit;
    edtRentAcNo: TDBEdit;
    edtSaveAcNo: TDBEdit;
    edtPostCode: TDBEdit;
    edtSuburb: TDBEdit;
    edtStreet: TDBEdit;
    Label21: TLabel;
    edtProvFund: TDBEdit;
    edtDeductOther1: TDBEdit;
    edtBankRef: TDBEdit;
    edtSickFund: TDBEdit;
    edtAcctType: TDBEdit;
    edtMStatus: TDBEdit;
    edtUif: TDBEdit;
    tabFinalPay: TTable;
    datFinalPay: TDataSource;
    DlgDischargeDate: TODDBPopupCalendar;
    tabFinalPayCLKNO: TIntegerField;
    tabFinalPaySURNAME: TStringField;
    tabFinalPayFIRSTNAME: TStringField;
    tabFinalPaySTREET: TStringField;
    tabFinalPaySUBURB: TStringField;
    tabFinalPayPOSTCODE: TStringField;
    tabFinalPayRENTACNO: TStringField;
    tabFinalPayRENTMONTH: TFloatField;
    tabFinalPaySAVEACNO: TStringField;
    tabFinalPaySTARTDATE: TDateTimeField;
    tabFinalPayBIRTHDATE: TDateTimeField;
    tabFinalPayPAYRATESETDATE: TDateTimeField;
    tabFinalPayHUSBANDNAME: TStringField;
    tabFinalPayMSTATUS: TStringField;
    tabFinalPayNOOFCHILD: TIntegerField;
    tabFinalPayOCCUPATION: TStringField;
    tabFinalPayIDNO: TStringField;
    tabFinalPayUIF: TStringField;
    tabFinalPayPROVFUNDFLAG: TStringField;
    tabFinalPayOTHER1FLAG: TStringField;
    tabFinalPaySICKFUNDFLAG: TStringField;
    tabFinalPayHRPAYRATE: TFloatField;
    tabFinalPayATTBONUSWK: TFloatField;
    tabFinalPaySAVEWK: TFloatField;
    tabFinalPayREPAYLNWK: TFloatField;
    tabFinalPayINSURANCE: TFloatField;
    tabFinalPayDEPTNO: TIntegerField;
    tabFinalPaySAVEAC: TFloatField;
    tabFinalPayTAXEARN: TFloatField;
    tabFinalPayPENSION: TFloatField;
    tabFinalPaySICKFD: TFloatField;
    tabFinalPayPROVFD: TFloatField;
    tabFinalPayUIFPAY: TFloatField;
    tabFinalPayPAYE: TFloatField;
    tabFinalPayGROSSPAY: TFloatField;
    tabFinalPayWKSPAY: TFloatField;
    tabFinalPayRENTAC: TFloatField;
    tabFinalPayLOANAC: TFloatField;
    tabFinalPayFULLWK: TIntegerField;
    tabFinalPayPARTWK: TIntegerField;
    tabFinalPayLEAVEDAY: TIntegerField;
    tabFinalPaySICKDAY: TIntegerField;
    tabFinalPayTAXWEEK: TIntegerField;
    tabFinalPayDISCHARGEDATE: TDateTimeField;
    tabFinalPayBANKREF: TStringField;
    tabFinalPayBANKSORTCODE: TStringField;
    tabFinalPayBANKACCREF: TStringField;
    tabFinalPayBANKACCTYPE: TStringField;
    DBEdit1: TDBEdit;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    btnFPay: TBitBtn;
    popFind: TODFindMenu;
    procedure datFinalPayDataChange(Sender: TObject; Field: TField);
    procedure DlgDischargeDatePopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure datFinalPayStateChange(Sender: TObject);
    procedure DlgDischargeDateChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnFPayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
      procedure btnEnabled(State: Boolean);
  public
    { Public declarations }
  end;

var
  frmFinalPay: TfrmFinalPay;

implementation

uses main, utils;

{$R *.DFM}

procedure TfrmFinalPay.btnEnabled(State: Boolean);
begin
  btnFPay.Enabled := State;
  btnCancel.Enabled := State;
end;

procedure TfrmFinalPay.datFinalPayDataChange(Sender: TObject;
  Field: TField);
begin
  edtEmployeeFullName.Text:=tabFinalPayClkNo.AsString+': '+
    tabFinalPaySurname.AsString+', '+tabFinalPayFirstName.AsString;
end;

procedure TfrmFinalPay.DlgDischargeDatePopup(Sender: TObject);
begin
  if DlgDischargeDate.Text <> '' then begin
    if messagedlg('Change existing date?',mtConfirmation,[mbYes,mbNo],0) =
      idNo then
    begin
      Abort;
    end;
  end;
end;

procedure TfrmFinalPay.FormCreate(Sender: TObject);
begin
  btnEnabled(False);
  tabFinalPay.Open;
end;

procedure TfrmFinalPay.datFinalPayStateChange(Sender: TObject);
begin
  btnFPay.Enabled := tabFinalPay.State in [dsEdit];
  btnCancel.Enabled := btnFPay.Enabled;
end;

procedure TfrmFinalPay.DlgDischargeDateChange(Sender: TObject);
begin
  if not frmMain.Database.InTransaction then
    frmMain.Database.StartTransaction;
  btnEnabled(True);
end;

procedure TfrmFinalPay.btnCancelClick(Sender: TObject);
begin
  if frmMain.Database.InTransaction then
  begin
    tabFinalPay.Cancel;
    frmMain.Database.Rollback;
    btnEnabled(False);
  end;
end;

procedure TfrmFinalPay.btnFPayClick(Sender: TObject);
begin
  if frmMain.Database.InTransaction then
  begin
    if MessageDlg('Are you sure you want to assign final pay to '+
       Format('%s',[edtEmployeeFullname.Text]),mtConfirmation,[mbYes,mbNo],0)
       = idYes then
    begin   //  Yes save changes
      tabFinalPay.Post;
      frmMain.Database.Commit;
      btnEnabled(False);
    end
    else
    begin // Cancel changes
      tabFinalPay.Cancel;
      frmMain.Database.Rollback;
      btnEnabled(False);
    end;
  end;
end;

procedure TfrmFinalPay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.Database.InTransaction then
  begin
    if MessageDlg('Database has been modified, Save changes?',mtConfirmation,
      [mbYes,mbNo],0) = idYes then
    begin   //  Yes save changes
      tabFinalPay.Post;
      frmMain.Database.Commit;
      btnEnabled(False);
    end
    else
    begin // Cancel changes
      tabFinalPay.Cancel;
      frmMain.Database.Rollback;
      btnEnabled(False);
    end;
  end;
  tabFinalPay.Close;
  Release;
end;

end.
