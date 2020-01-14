unit employee;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls, Mask,
  Grids, DBGrids, Menus, ODDBFind, ODPopCal, ODDBCal;

type
  TfrmEmployee = class(TForm)
    tabEmployee: TTable;
    datEmployee: TDataSource;
    tabEmpPayRate: TTable;
    datEmpPayRate: TDataSource;
    pgeEmployee: TPageControl;
    tshDetails: TTabSheet;
    tshBalances: TTabSheet;
    btnSave: TBitBtn;
    BtnCancel: TBitBtn;
    btnClose: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    edtEmployeeFullName: TEdit;
    dbnEmployee: TDBNavigator;
    tabEmployeeCLKNO: TIntegerField;
    tabEmployeeSURNAME: TStringField;
    tabEmployeeFIRSTNAME: TStringField;
    tabEmployeeSTREET: TStringField;
    tabEmployeeSUBURB: TStringField;
    tabEmployeePOSTCODE: TStringField;
    tabEmployeeRENTACNO: TStringField;
    tabEmployeeRENTMONTH: TFloatField;
    tabEmployeeSAVEACNO: TStringField;
    tabEmployeeSTARTDATE: TDateTimeField;
    tabEmployeeBIRTHDATE: TDateTimeField;
    tabEmployeePAYRATESETDATE: TDateTimeField;
    tabEmployeeHUSBANDNAME: TStringField;
    tabEmployeeMSTATUS: TStringField;
    tabEmployeeNOOFCHILD: TIntegerField;
    tabEmployeeOCCUPATION: TStringField;
    tabEmployeeIDNO: TStringField;
    tabEmployeeUIF: TStringField;
    tabEmployeePROVFUNDFLAG: TStringField;
    tabEmployeeOTHER1FLAG: TStringField;
    tabEmployeeSICKFUNDFLAG: TStringField;
    tabEmployeeHRPAYRATE: TFloatField;
    tabEmployeeATTBONUSWK: TFloatField;
    tabEmployeeSAVEWK: TFloatField;
    tabEmployeeREPAYLNWK: TFloatField;
    tabEmployeeINSURANCE: TFloatField;
    tabEmployeeSAVEAC: TFloatField;
    tabEmployeeTAXEARN: TFloatField;
    tabEmployeePENSION: TFloatField;
    tabEmployeeSICKFD: TFloatField;
    tabEmployeePROVFD: TFloatField;
    tabEmployeeUIFPAY: TFloatField;
    tabEmployeePAYE: TFloatField;
    tabEmployeeGROSSPAY: TFloatField;
    tabEmployeeWKSPAY: TFloatField;
    tabEmployeeRENTAC: TFloatField;
    tabEmployeeLOANAC: TFloatField;
    tabEmployeeFULLWK: TIntegerField;
    tabEmployeePARTWK: TIntegerField;
    tabEmployeeLEAVEDAY: TIntegerField;
    tabEmployeeSICKDAY: TIntegerField;
    tabEmployeeTAXWEEK: TIntegerField;
    tabEmployeeDISCHARGEDATE: TDateTimeField;
    tabEmployeeBANKSORTCODE: TStringField;
    tabEmployeeBANKACCREF: TStringField;
    tabEmployeeBANKACCTYPE: TStringField;
    tabEmpPayRateCLKNO: TIntegerField;
    tabEmpPayRateFROMDATE: TDateTimeField;
    tabEmpPayRatePAYRATE: TFloatField;
    Label5: TLabel;
    edtStreet: TDBEdit;
    Label6: TLabel;
    edtSuburb: TDBEdit;
    Label7: TLabel;
    edtPostCode: TDBEdit;
    Label8: TLabel;
    edtRentAcNo: TDBEdit;
    Label9: TLabel;
    edtRentMonth: TDBEdit;
    Label10: TLabel;
    edtSaveAcNo: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    edtHusbandName: TDBEdit;
    Label16: TLabel;
    edtNoOfChild: TDBEdit;
    Label17: TLabel;
    edtOccupation: TDBEdit;
    Label18: TLabel;
    edtIDNo: TDBEdit;
    Label19: TLabel;
    Label21: TLabel;
    tshPayRates: TTabSheet;
    edtMStatus: TDBComboBox;
    edtUIF: TDBComboBox;
    Label22: TLabel;
    Label23: TLabel;
    edtAttBonusWk: TDBEdit;
    Label24: TLabel;
    edtSaveWk: TDBEdit;
    Label25: TLabel;
    edtRepayLnWk: TDBEdit;
    Label26: TLabel;
    edtInsurance: TDBEdit;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    edtBankSortCode: TDBEdit;
    Label34: TLabel;
    edtBankAccRef: TDBEdit;
    Label35: TLabel;
    edtProvFundFlag: TDBComboBox;
    edtOther1Flag: TDBComboBox;
    edtSickFundFlag: TDBComboBox;
    edtBankAccType: TDBComboBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    SPClkNo: TStoredProc;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    tabCompany: TTable;
    datCompany: TDataSource;
    tabCompanyREF: TIntegerField;
    tabCompanySTARTNUMBER: TIntegerField;
    tabCompanyATXWK: TIntegerField;
    tabCompanyLASTWEEK: TDateTimeField;
    Label42: TLabel;
    edtStartNumber: TDBEdit;
    edtATxWk: TDBEdit;
    edtLastWeek: TDBEdit;
    Label43: TLabel;
    edtSaveAc: TDBEdit;
    Label44: TLabel;
    edtTaxEarn: TDBEdit;
    Label45: TLabel;
    edtPension: TDBEdit;
    Label46: TLabel;
    edtSickFd: TDBEdit;
    Label47: TLabel;
    edtProvFd: TDBEdit;
    Label48: TLabel;
    edtUIFPay: TDBEdit;
    Label49: TLabel;
    edtPAYE: TDBEdit;
    Label50: TLabel;
    edtGrossPay: TDBEdit;
    Label51: TLabel;
    edtRentAC: TDBEdit;
    Label52: TLabel;
    edtLoanAC: TDBEdit;
    Label53: TLabel;
    edtFullWk: TDBEdit;
    Label54: TLabel;
    edtPartWk: TDBEdit;
    Label55: TLabel;
    edtLeaveDay: TDBEdit;
    Label56: TLabel;
    edtSickDay: TDBEdit;
    Label57: TLabel;
    edtTaxWeek: TDBEdit;
    Label58: TLabel;
    shwStartDate: TDBEdit;
    Label59: TLabel;
    tabCompanyMINPAYRATE: TFloatField;
    tabCompanyMAXPAYRATE: TFloatField;
    tabCompanyMINSTARTAGE: TIntegerField;
    tabCompanyMAXSTARTAGE: TIntegerField;
    dbgEmpGrade: TDBGrid;
    Label60: TLabel;
    Label2: TLabel;
    edtClkNo: TDBEdit;
    Label3: TLabel;
    edtSurname: TDBEdit;
    Label4: TLabel;
    edtFirstName: TDBEdit;
    Label11: TLabel;
    edtStartDate: TDBEdit;
    Label12: TLabel;
    edtBirthDate: TDBEdit;
    Label28: TLabel;
    edtHrPayRate: TDBEdit;
    Label13: TLabel;
    edtPayRateSetDate: TDBEdit;
    Label20: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    shwHrPayRate: TDBEdit;
    shwPayRateSetDate: TDBEdit;
    Label64: TLabel;
    btnApplyNewPayRate: TButton;
    edtNewEmpPayRate: TEdit;
    popFind: TODFindMenu;
    calDischargeDate: TODDBPopupCalendar;
    tshABLoan: TTabSheet;
    tabEmployeeABLOANACCNO: TStringField;
    tabEmployeeABLOANSTARTVALUE: TFloatField;
    tabEmployeeABLOANAC: TFloatField;
    tabEmployeeABREPAYLNMONTH: TFloatField;
    tabEmployeeABREPAYTERM: TIntegerField;
    tabEmployeeABREPAYFROMYEAR: TIntegerField;
    tabEmployeeABREPAYFROMMONTH: TIntegerField;
    Label65: TLabel;
    edtABLoanAccNo: TDBEdit;
    Label66: TLabel;
    edtABLoanStartValue: TDBEdit;
    Label67: TLabel;
    edtABLoanAC: TDBEdit;
    Label68: TLabel;
    edtABRepayLnMonth: TDBEdit;
    Label69: TLabel;
    edtABRepayTerm: TDBEdit;
    Label70: TLabel;
    edtRepayFromYear: TDBEdit;
    Label71: TLabel;
    edtRepayFromMonth: TDBEdit;
    tabEmployeeABLOANACTIVE: TStringField;
    dbcABLoanActive: TDBCheckBox;
    cbxAllEmployees: TCheckBox;
    Label72: TLabel;
    tabEmployeePFLOANACCNO: TStringField;
    tabEmployeePFLOANSTARTVALUE: TFloatField;
    tabEmployeePFLOANAC: TFloatField;
    tabEmployeePFREPAYLNMONTH: TFloatField;
    tabEmployeePFREPAYTERM: TIntegerField;
    tabEmployeePFREPAYFROMYEAR: TIntegerField;
    tabEmployeePFREPAYFROMMONTH: TIntegerField;
    tabEmployeePFLOANACTIVE: TStringField;
    tabEmployeeLAWYERMONTH: TFloatField;
    edtLawyerMonth: TDBEdit;
    tshProvFundLoan: TTabSheet;
    Label73: TLabel;
    edtPFLoanAccNo: TDBEdit;
    Label74: TLabel;
    edtPFLoanStartValue: TDBEdit;
    Label75: TLabel;
    edtPFLoanAC: TDBEdit;
    Label76: TLabel;
    edtPFRepayLnMonth: TDBEdit;
    Label77: TLabel;
    edtPFRepayTerm: TDBEdit;
    Label78: TLabel;
    edtPFRepayFromYear: TDBEdit;
    Label79: TLabel;
    edtPFRepayFromMonth: TDBEdit;
    dbcPFLoanActive: TDBCheckBox;
    tabEmployeeBANKREF: TStringField;
    tabEmployeeDEPREF: TStringField;
    edtBankRef: TDBLookupComboBox;
    edtDeptNo: TDBLookupComboBox;
    tabBank: TTable;
    tabDepartment: TTable;
    datBank: TDataSource;
    datDepartment: TDataSource;
    tabEmployeeBANKFEES: TFloatField;
    Label80: TLabel;
    edtBankFees: TDBEdit;
    edtInsuranceWM: TDBComboBox;
    edtLaywerWM: TDBComboBox;
    tabEmployeeINSURANCEWM: TStringField;
    tabEmployeeLAWYERWM: TStringField;
    Label81: TLabel;
    tabEmployeeGRADECODE: TStringField;
    Label82: TLabel;
    shwGradeCode: TDBEdit;
    dbgEmpPayRate: TDBGrid;
    Label83: TLabel;
    edtNewGradeCode: TEdit;
    btnApplyNewGradeCode: TButton;
    tabEmpGrade: TTable;
    datEmpGrade: TDataSource;
    tabEmployeeGRADESETDATE: TDateTimeField;
    tabEmpGradeCLKNO: TIntegerField;
    tabEmpGradeFROMDATE: TDateTimeField;
    tabEmpGradeGRADECODE: TStringField;
    Label84: TLabel;
    shwGradeSetDate: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure datEmployeeStateChange(Sender: TObject);
    procedure datEmployeeDataChange(Sender: TObject; Field: TField);
    procedure tabEmployeeBeforeInsert(DataSet: TDataSet);
    procedure tabEmployeeBeforeEdit(DataSet: TDataSet);
    procedure tabEmployeeBeforeDelete(DataSet: TDataSet);
    procedure tabEmployeeAfterDelete(DataSet: TDataSet);
    procedure tabEmployeeAfterPost(DataSet: TDataSet);
    procedure tabEmployeeAfterCancel(DataSet: TDataSet);
    procedure tabEmployeeBeforeCancel(DataSet: TDataSet);
    procedure tabEmployeeDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tabEmpPayRateDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure tabEmployeeNewRecord(DataSet: TDataSet);
    procedure tabEmpPayRateBeforeEdit(DataSet: TDataSet);
    procedure tabEmpPayRateBeforeDelete(DataSet: TDataSet);
    procedure tabEmpPayRateBeforeInsert(DataSet: TDataSet);
    procedure tabEmpPayRateNewRecord(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFlagChange(Sender: TObject);
    procedure edtRqdFlagExit(Sender: TObject);
    procedure edtHrPayRateExit(Sender: TObject);
    procedure edtBirthStartDateExit(Sender: TObject);
    procedure btnApplyNewPayRateClick(Sender: TObject);
    procedure pgeEmployeeChange(Sender: TObject);
    procedure edtDeptNoChange(Sender: TObject);
    procedure popFindPopup(Sender: TObject);
    procedure edtPayRateSetDateExit(Sender: TObject);
    procedure calDischargeDateEnter(Sender: TObject);
    procedure tabEmployeeDISCHARGEDATEChange(Sender: TField);
    procedure calDischargeDatePopup(Sender: TObject);
    procedure cbxAllEmployeesClick(Sender: TObject);
    procedure btnApplyNewGradeCodeClick(Sender: TObject);
    procedure tabEmpGradeBeforeDelete(DataSet: TDataSet);
    procedure tabEmpGradeBeforeEdit(DataSet: TDataSet);
    procedure tabEmpGradeBeforeInsert(DataSet: TDataSet);
    procedure tabEmpGradeDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tabEmpGradeNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    NoCommit:boolean;
    InTxn:boolean;
    Changing:boolean;
    PostInProgress:boolean; //added DL210999
  public
    { Public declarations }
  end;

var
  frmEmployee: TfrmEmployee;

implementation

{$R *.DFM}

uses Main,Utils;

procedure TfrmEmployee.FormShow(Sender: TObject);
begin
  pgeEmployee.ActivePage:=tshDetails;
  InTxn:=false;
  NoCommit:=false;
  Changing:=false;
  PostInProgress:=false; //added DL210999
  tabBank.Open; //added DL050305
  tabDepartment.Open; //added DL050305
  tabEmployee.Filter:='DischargeDate is null'; //added DL030303
  tabEmployee.Filtered:=true;
  tabEmployee.Open;
  tabEmpPayRate.Open;
  tabEmpGrade.Open; //added DL060731
  tabCompany.Open;
  tabCompany.FindKey([1]);
end;

procedure TfrmEmployee.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabCompany.Close;
  tabEmpGrade.Close; //added DL060731
  tabEmpPayRate.Close;
  tabEmployee.Close;
  tabBank.Close; //added DL050305
  tabDepartment.Close; //added DL050305
end;

procedure TfrmEmployee.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmployee.BtnCancelClick(Sender: TObject);
begin
  tabEmployee.Cancel;
end;

procedure TfrmEmployee.btnSaveClick(Sender: TObject);
begin
  tabEmployee.Post;
end;

procedure TfrmEmployee.datEmployeeStateChange(Sender: TObject);
begin
  btnSave.Enabled := tabEmployee.State in [dsEdit, dsInsert];
  btnCancel.Enabled := btnSave.Enabled;
  btnClose.Enabled := tabEmployee.State = dsBrowse;
end;

procedure TfrmEmployee.datEmployeeDataChange(Sender: TObject;
  Field: TField);
begin
  if tabEmployeeDischargeDate.IsNull then //employee not discharged
     edtEmployeeFullName.color:=clInfoBk
  else //employee discharged
     edtEmployeeFullName.color:=clRed;
  edtEmployeeFullName.Text:=tabEmployeeClkNo.AsString+': '+
    tabEmployeeSurname.AsString+', '+tabEmployeeFirstName.AsString;
end;

procedure TfrmEmployee.tabEmployeeBeforeInsert(DataSet: TDataSet);
begin
  if InTxn then
    raise Exception.Create('Post before inserting')
  else
  begin
    frmMain.Database.StartTransaction;
    InTxn:=true;
    pgeEmployee.ActivePage:=tshDetails;
    edtSurname.ReadOnly:=false;
    edtFirstName.ReadOnly:=false;
    edtStartDate.ReadOnly:=false;
    edtBirthDate.ReadOnly:=false;
    edtHrPayRate.ReadOnly:=false;
    edtPayRateSetDate.ReadOnly:=false;
    edtSurname.tabStop:=true;
    edtFirstName.tabStop:=true;
    edtStartDate.tabStop:=true;
    edtBirthDate.tabStop:=true;
    edtHrPayRate.tabStop:=true;
    edtPayRateSetDate.tabStop:=true;
    edtSurname.Color:=clWindow;
    edtFirstName.Color:=clWindow;
    edtStartDate.Color:=clWindow;
    edtBirthDate.Color:=clWindow;
    edtHrPayRate.Color:=clWindow;
    edtPayRateSetDate.Color:=clWindow;
    edtSurname.SetFocus;
  end;
end;

procedure TfrmEmployee.tabEmployeeBeforeEdit(DataSet: TDataSet);
begin
  if not tabEmployeeDISCHARGEDATE.IsNull then
    raise Exception.Create('Cannot edit as discharged');
  if not InTxn then
  begin
    frmMain.Database.StartTransaction;
    InTxn:=true;
    //make sure
    edtSurname.ReadOnly:=true;
    edtFirstName.ReadOnly:=true;
    edtStartDate.ReadOnly:=true;
    edtBirthDate.ReadOnly:=true;
    edtHrPayRate.ReadOnly:=true;
    edtPayRateSetDate.ReadOnly:=true;
    edtSurname.tabStop:=false;
    edtFirstName.tabStop:=false;
    edtStartDate.tabStop:=false;
    edtBirthDate.tabStop:=false;
    edtHrPayRate.tabStop:=false;
    edtPayRateSetDate.tabStop:=false;
    edtSurname.Color:=clBtnFace;
    edtFirstName.Color:=clBtnFace;
    edtStartDate.Color:=clBtnFace;
    edtBirthDate.Color:=clBtnFace;
    edtHrPayRate.Color:=clBtnFace;
    edtPayRateSetDate.Color:=clBtnFace;
  end;
end;

procedure TfrmEmployee.tabEmployeeBeforeDelete(DataSet: TDataSet);
begin
  ShowMessage('Can an Employee be deleted?  If so, when?');
  Abort;
{  if MessageDlg('Delete employee?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  frmMain.Database.StartTransaction;}
end;

procedure TfrmEmployee.tabEmployeeAfterDelete(DataSet: TDataSet);
begin
  frmMain.Database.Commit;
end;

procedure TfrmEmployee.tabEmployeeAfterPost(DataSet: TDataSet);
begin
  if not NoCommit then
  begin
    frmMain.Database.Commit;
    InTxn:=false;
    edtSurname.ReadOnly:=true;
    edtFirstName.ReadOnly:=true;
    edtStartDate.ReadOnly:=true;
    edtBirthDate.ReadOnly:=true;
    edtHrPayRate.ReadOnly:=true;
    edtPayRateSetDate.ReadOnly:=true;
    edtSurname.tabStop:=false;
    edtFirstName.tabStop:=false;
    edtStartDate.tabStop:=false;
    edtBirthDate.tabStop:=false;
    edtHrPayRate.tabStop:=false;
    edtPayRateSetDate.tabStop:=false;
    edtSurname.Color:=clBtnFace;
    edtFirstName.Color:=clBtnFace;
    edtStartDate.Color:=clBtnFace;
    edtBirthDate.Color:=clBtnFace;
    edtHrPayRate.Color:=clBtnFace;
    edtPayRateSetDate.Color:=clBtnFace;
    if pgeEmployee.ActivePage=tshDetails then
      edtStreet.SetFocus;
  end;
end;

procedure TfrmEmployee.tabEmployeeAfterCancel(DataSet: TDataSet);
begin
  frmMain.Database.Rollback;
  InTxn:=false;
  tabEmployee.Refresh;
  tabEmpPayRate.Refresh;
  tabEmpGrade.Refresh; //added DL060731
  edtSurname.ReadOnly:=true;
  edtFirstName.ReadOnly:=true;
  edtStartDate.ReadOnly:=true;
  edtBirthDate.ReadOnly:=true;
  edtHrPayRate.ReadOnly:=true;
  edtPayRateSetDate.ReadOnly:=true;
  edtSurname.tabStop:=false;
  edtFirstName.tabStop:=false;
  edtStartDate.tabStop:=false;
  edtBirthDate.tabStop:=false;
  edtHrPayRate.tabStop:=false;
  edtPayRateSetDate.tabStop:=false;
  edtSurname.Color:=clBtnFace;
  edtFirstName.Color:=clBtnFace;
  edtStartDate.Color:=clBtnFace;
  edtBirthDate.Color:=clBtnFace;
  edtHrPayRate.Color:=clBtnFace;
  edtPayRateSetDate.Color:=clBtnFace;
  if pgeEmployee.ActivePage=tshDetails then
    edtStreet.SetFocus;
end;

procedure TfrmEmployee.tabEmployeeBeforeCancel(DataSet: TDataSet);
begin
  if tabEmployee.State=dsInsert then
    if MessageDlg('Cancel employee being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TfrmEmployee.tabEmployeeDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  frmMain.Database.Rollback;
end;

procedure TfrmEmployee.tabEmpPayRateDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  frmMain.Database.Rollback;
end;

procedure TfrmEmployee.tabEmployeeNewRecord(DataSet: TDataSet);
begin
  {find next Clock number}
  SPClkNo.ExecProc;
  tabEmployee.FieldByName('ClkNo').AsInteger:=SPClkNo.ParamByName('Code').AsInteger;
  {initialise variables}
  tabEmployeeStartDate.AsDateTime:=date;
  tabEmployeeBirthDate.AsDateTime:=date;
  tabEmployeePayRateSetDate.AsDateTime:=date;
  tabEmployeeRentMonth.AsFloat   := 0;
  tabEmployeeMStatus.AsString    := 'S'; { now taxstatus - 10/7/89. }
  tabEmployeeNoOfChild.AsInteger := 0;
  tabEmployeeUIF.AsString        := 'N';
  tabEmployeeProvFundFlag.AsString:= 'Y';
  tabEmployeeOther1Flag.AsString := 'N';
  tabEmployeeSickFundFlag.AsString:= 'N';
  tabEmployeeHrPayRate.AsFloat   := 0;
  tabEmployeeAttBonusWk.AsFloat  := 0;
  tabEmployeeSaveWK.AsFloat      := 0;
  tabEmployeeRepayLnWk.AsFloat   := 0;
  tabEmployeeInsurance.AsFloat   := 0;
  tabEmployeeDepRef.AsString    := '0';
  tabEmployeeSaveAC.AsFloat      := 0;
  tabEmployeeTaxEarn.AsFloat     := 0;
  tabEmployeePension.AsFloat     := 0;
  tabEmployeeSickFD.AsFloat      := 0;
  tabEmployeeProvFD.AsFloat      := 0;
  tabEmployeeUIFPay.AsFloat      := 0;
  tabEmployeePAYE.AsFloat        := 0;
  tabEmployeeGrossPay.AsFloat    := 0;
{  LastRate := 0;
  LastYY := 0; LastMM := 1; LastDD := 1;
  PrevRate := 0;
  PrevYY := 0; PrevMM := 1; PrevDD := 1;}
  tabEmployeeRentAC.AsFloat      := 0;
  tabEmployeeLoanAC.AsFloat      := 0;
  tabEmployeeFullWk.AsInteger    := 0;
  tabEmployeePartWk.AsInteger    := 0;
  tabEmployeeLeaveDay.AsInteger  := 0;
  tabEmployeeSickDay.AsInteger   := 0;
  tabEmployeeTaxWeek.AsInteger   := 0;
  tabEmployeeBankRef.AsString    := '9';  {added 140895}
  tabEmployeeBankAccType.AsString:= 'S';  {added 140895}
  tabEmployeeABLOANSTARTVALUE.AsFloat   := 0; //added DL050201
  tabEmployeeABLOANAC.AsFloat           := 0; //added DL050201
  tabEmployeeABREPAYLNMONTH.AsFloat     := 0; //added DL050201
  tabEmployeeABREPAYTERM.AsInteger      := 0; //added DL050201
  tabEmployeeABREPAYFROMYEAR.AsInteger  := 0; //added DL050201
  tabEmployeeABREPAYFROMMONTH.AsInteger := 0; //added DL050201
  tabEmployeeABLOANACTIVE.AsString      := 'N'; //added DL040701
  tabEmployeeBANKFEES.AsCurrency        := 0; //added DL050306
  tabEmployeeINSURANCEWM.AsString       :='W'; //added DL060505
  tabEmployeeLAWYERWM.AsString          :='M'; //added DL060505
end;

procedure TfrmEmployee.tabEmpPayRateBeforeEdit(DataSet: TDataSet);
begin
  if not tabEmployeeDISCHARGEDATE.IsNull then
    raise Exception.Create('Cannot edit as discharged');
  tabEmployee.Edit;
end;

procedure TfrmEmployee.tabEmpPayRateBeforeDelete(DataSet: TDataSet);
begin
  ShowMessage('Cannot delete employee''s pay history');
  Abort;
{  if MessageDlg('Delete pay history?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  tabEmployee.Edit;}
end;

procedure TfrmEmployee.tabEmpPayRateBeforeInsert(DataSet: TDataSet);
begin
  if tabEmployee.State = dsInsert then
  begin
    NoCommit:=true;
    tabEmployee.Post;
    tabEmployee.Edit;
    NoCommit:=false;
  end
  else
    tabEmployee.Edit;
end;

procedure TfrmEmployee.tabEmpPayRateNewRecord(DataSet: TDataSet);
begin
  tabEmpPayRateCLKNO.AsInteger:=tabEmployeeClkNo.AsInteger;
end;

procedure TfrmEmployee.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //note: Key=vk_tab not being run as this function is not being called
  //when tab is pressed
  if (Key = vk_return) {or (Key = vk_tab)} then
  begin
    if ActiveControl=edtBankAccType then
      frmEmployee.ActiveControl:=edtStreet
    else
      selectnext(activecontrol,true,true);
    Key:=0;
  end;
end;

procedure TfrmEmployee.edtFlagChange(Sender: TObject);
var
  DBCombo:TDBComboBox;
begin
  if Changing then exit;
  DBCombo:=Sender As TDBComboBox;
  //check length because if Text[1] is blank we get a GPF
  if length(DBCombo.Text)=0 then
    exit; //abort not used because this is the onchange method
  Changing:=true;
  DBCombo.Text:=uppercase(DBCombo.Text);
  // edtProvFundFlag.Text:=uppercase(edtProvFundFlag.Text);
  Changing:=false;
  // lookup the entered text in DBCombo in the DBCombo's Items List
  //   so that this procedure can be used for any flag change
  if DBCombo.Items.IndexOf(DBCombo.Text)=-1 then
    raise Exception.Create('Invalid entry.');
  if ActiveControl=edtMStatus then
  begin
    edtSurname.ReadOnly:=false;
    edtSurname.tabStop:=true;
    edtSurname.Color:=clWindow;
  end;
  if ActiveControl=edtBankAccType then
    frmEmployee.ActiveControl:=edtStreet
  else
    selectnext(activecontrol,true,true);
end;

procedure TfrmEmployee.edtRqdFlagExit(Sender: TObject);
begin
  if length((Sender As TDBComboBox).Text)=0 then
  begin
    (Sender As TDBComboBox).SetFocus;
    raise Exception.Create('Field is required');
  end;
end;

procedure TfrmEmployee.edtHrPayRateExit(Sender: TObject);
begin
  if tabEmployeeHRPAYRATE.AsFloat<tabCompanyMINPAYRATE.AsFloat then
  begin
    edtHrPayRate.SetFocus;
    raise Exception.Create('Hourly pay rate cannot be less than '+
      Format('%8.4f', [tabCompanyMINPAYRATE.AsFloat]));
  end;
  if tabEmployeeHRPAYRATE.AsFloat>tabCompanyMAXPAYRATE.AsFloat then
  begin
    edtHrPayRate.SetFocus;
    raise Exception.Create('Hourly pay rate cannot be more than '+
      Format('%8.4f', [tabCompanyMAXPAYRATE.AsFloat]));
  end;
end;

procedure TfrmEmployee.edtBirthStartDateExit(Sender: TObject);
//use the same function to check the birth and start date fields
var
  YearsDiff,MonthsDiff,DaysDiff:integer;
begin
  ODGetAge(tabEmployeeBIRTHDATE.AsDateTime,tabEmployeeSTARTDATE.AsDateTime,
    YearsDiff,MonthsDiff,DaysDiff);
  if YearsDiff<0 then
  begin
    (Sender As TDBEdit).SetFocus; //edtBirthDate or edtStartDate.SetFocus;
    raise Exception.Create('Error: Employee cannot start before he is born!');
  end;
  if YearsDiff > tabCompanyMAXSTARTAGE.AsInteger then
  begin
    (Sender As TDBEdit).SetFocus; //edtBirthDate or edtStartDate.SetFocus;
    raise Exception.Create('Error: Age > '+ tabCompanyMAXSTARTAGE.AsString);
  end;
  if YearsDiff < tabCompanyMINSTARTAGE.AsInteger then
  begin
    (Sender As TDBEdit).SetFocus; //edtBirthDate or edtStartDate.SetFocus;
    raise Exception.Create('Error: Age < '+ tabCompanyMINSTARTAGE.AsString);
  end;
  if (Sender As TDBEdit).Name='edtStartDate' then
  begin
    if (tabEmployeePAYRATESETDATE.AsDateTime=date) or
       (tabEmployeeSTARTDATE.AsDateTime>tabEmployeePAYRATESETDATE.AsDateTime) then
      tabEmployeePAYRATESETDATE.AsDateTime:=tabEmployeeSTARTDATE.AsDateTime;
  end;
end;

procedure TfrmEmployee.btnApplyNewPayRateClick(Sender: TObject);
var
  NewEmpPayRate:double;
begin
  if not tabEmployeeDISCHARGEDATE.IsNull then
    raise Exception.Create('Cannot edit as discharged');
  try
    NewEmpPayRate:=strtofloat(edtNewEmpPayRate.Text);
  except
    on E: EConvertError do
    begin
      edtNewEmpPayRate.SetFocus;
      raise Exception.Create('Invalid Value Entered');
    end;
  end;
  if NewEmpPayRate<tabCompanyMINPAYRATE.AsFloat then
  begin
    edtNewEmpPayRate.SetFocus;
    raise Exception.Create('Hourly pay rate cannot be less than '+
      Format('%8.4f', [tabCompanyMINPAYRATE.AsFloat]));
  end;
  if NewEmpPayRate>tabCompanyMAXPAYRATE.AsFloat then
  begin
    edtNewEmpPayRate.SetFocus;
    raise Exception.Create('Hourly pay rate cannot be more than '+
      Format('%8.4f', [tabCompanyMAXPAYRATE.AsFloat]));
  end;
  if tabEmployeePAYRATESETDATE.AsDateTime=date then
  begin
    edtNewEmpPayRate.SetFocus;
    raise Exception.Create('New Pay Rate already exists for today');
  end;
  tabEmployee.Edit;
  tabEmpPayRate.Insert;
  tabEmpPayRateClkNo.AsInteger:=tabEmployeeClkNo.AsInteger;
  tabEmpPayRateFromDate.AsDateTime:=tabEmployeePAYRATESETDATE.AsDateTime;
  tabEmpPayRatePayRate.AsFloat:=tabEmployeeHRPAYRATE.AsFloat;
  tabEmpPayRate.Post;
  tabEmployeePAYRATESETDATE.AsDateTime:=date;
  tabEmployeeHRPAYRATE.AsFloat:=NewEmpPayRate;
end;

procedure TfrmEmployee.pgeEmployeeChange(Sender: TObject);
begin
  if pgeEmployee.ActivePage=tshDetails then
    edtStreet.SetFocus;
  if pgeEmployee.ActivePage=tshPayRates then
    edtNewEmpPayRate.SetFocus;
end;

procedure TfrmEmployee.edtDeptNoChange(Sender: TObject);
begin
  if edtDeptNo.Focused and (tabEmployee.State in [dsEdit, dsInsert]) then
    selectnext(activecontrol,true,true);
end;
                  //JT041298
procedure TfrmEmployee.popFindPopup(Sender: TObject);
begin
  if popFind.PopupComponent = edtEmployeeFullName then
    popFind.DataField := 'ClkNo';
end;

procedure TfrmEmployee.edtPayRateSetDateExit(Sender: TObject);
begin
  if (tabEmployeeSTARTDATE.AsDateTime>tabEmployeePAYRATESETDATE.AsDateTime) then
  begin
    edtPayRateSetDate.SetFocus; //edtBirthDate or edtStartDate.SetFocus;
    raise Exception.Create('Error: Pay Rate Date must be >= Start Date');
  end;
end;

procedure TfrmEmployee.calDischargeDateEnter(Sender: TObject);
begin
  //this whole procedure added DL210999
  if (tabEmployee.State = dsInsert) then
    raise Exception.Create('Cannot discharge an employee at the same time as inserting the employee!');
  if (tabEmployee.State = dsEdit) then
    raise Exception.Create('You cannot discharge an employee at the same time as making other changes');
end;

procedure TfrmEmployee.tabEmployeeDISCHARGEDATEChange(Sender: TField);
begin
  //this whole procedure added DL210999
  if PostInProgress then
    Exit;
  if (calDischargeDate.StartDate <> null) and (calDischargeDate.StartDate <> 0) then
  begin
    //see calDischargeDateEnter procedure for the following lines
    {if (tabEmployee.State = dsInsert) then
      raise Exception.Create('Cannot discharge an employee at the same time as inserting the employee!');
    if (tabEmployee.State = dsEdit) then
      raise Exception.Create('You cannot discharge an employee at the same time as making other changes');}
    if MessageDlg('You have chosen to discharge an employee without running final pay first'+
      #13+'Are you sure?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PostInProgress:=true; //otherwise recursive into this procedure
      tabEmployee.Post;
      PostInProgress:=false; //otherwise recursive into this procedure
      tabEmployee.Refresh;
    end
    else
    begin
      calDischargeDate.StartDate:=0;
      tabEmployee.Cancel;
    end;
  end;
end;

procedure TfrmEmployee.calDischargeDatePopup(Sender: TObject);
begin
  //added this procedure DL210999
  if not tabEmployeeDISCHARGEDATE.IsNull then
    raise Exception.Create('Cannot edit as discharged');
end;

procedure TfrmEmployee.cbxAllEmployeesClick(Sender: TObject);
begin
  //method added DL030303
  if cbxAllEmployees.Checked then
    tabEmployee.Filtered:=false
  else
  begin
    tabEmployee.Filter:='DischargeDate is null';
    tabEmployee.Filtered:=true;
  end;
end; //cbxAllEmployeesClick

procedure TfrmEmployee.btnApplyNewGradeCodeClick(Sender: TObject);
begin
  //method added DL060731
  if not tabEmployeeDISCHARGEDATE.IsNull then
    raise Exception.Create('Cannot edit as discharged');
  if length(edtNewGradeCode.Text)>2 then
    raise Exception.Create('Maximum Grade Code Width is 2 characters');
  if length(edtNewGradeCode.Text)=0 then //added DL101212
    raise Exception.Create('Please enter a grade code');
  if tabEmployeeGRADESETDATE.AsDateTime=date then
  begin
    edtNewGradeCode.SetFocus;
    raise Exception.Create('New Grade already exists for today');
  end;
  tabEmployee.Edit;
  if not tabEmployeeGRADECODE.IsNull then
  begin
    tabEmpGrade.Insert;
    tabEmpGradeClkNo.AsInteger:=tabEmployeeClkNo.AsInteger;
    tabEmpGradeFromDate.AsDateTime:=tabEmployeeGRADESETDATE.AsDateTime;
    tabEmpGradeGradeCode.AsString:=tabEmployeeGRADECODE.AsString;
    tabEmpGrade.Post;
  end;
  tabEmployeeGRADESETDATE.AsDateTime:=date;
  tabEmployeeGRADECODE.AsString:=edtNewGradeCode.Text;
  edtNewGradeCode.Text:=''; //added DL101212
end;

procedure TfrmEmployee.tabEmpGradeBeforeDelete(DataSet: TDataSet);
begin
  //method added DL060731
  ShowMessage('Cannot delete employee''s grade history');
  Abort;
end;

procedure TfrmEmployee.tabEmpGradeBeforeEdit(DataSet: TDataSet);
begin
  //method added DL060731
  if not tabEmployeeDISCHARGEDATE.IsNull then
    raise Exception.Create('Cannot edit as discharged');
  tabEmployee.Edit;
end;

procedure TfrmEmployee.tabEmpGradeBeforeInsert(DataSet: TDataSet);
begin
  //method added DL060731
  if tabEmployee.State = dsInsert then
  begin
    NoCommit:=true;
    tabEmployee.Post;
    tabEmployee.Edit;
    NoCommit:=false;
  end
  else
    tabEmployee.Edit;
end;

procedure TfrmEmployee.tabEmpGradeDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  //method added DL060731
  frmMain.Database.Rollback;
end;

procedure TfrmEmployee.tabEmpGradeNewRecord(DataSet: TDataSet);
begin
  //method added DL060731
  tabEmpGradeCLKNO.AsInteger:=tabEmployeeClkNo.AsInteger;
end;

end.
