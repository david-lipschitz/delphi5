unit holidaypay;
{ This procedure will pay each employee his holiday pay and also print out
  a list of employee's whose rent we pay.  The rent account will not be
  increased, but rather the balance in it will be used to pay this year
  end rent.  The rent account appears on this special format payslip.
  1) Loan and Savings paid out automatically.
  2) All functions that use "skipweeks" in their calculations have Temporary
     variables for clarity. }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ComCtrls, ExtCtrls, Db, DBTables, Buttons, Mask, Printers,
  Menus, ODDBFind;

type
  TfrmHolidayPay = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    edtEmployeeFullName: TEdit;
    dbnEmployee: TDBNavigator;
    tabHolSlip: TTable;
    datHolSlip: TDataSource;
    tabEmployee: TTable;
    datEmployee: TDataSource;
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
    tabEmployeeBANKREF: TStringField;
    tabEmployeeBANKSORTCODE: TStringField;
    tabEmployeeBANKACCREF: TStringField;
    tabEmployeeBANKACCTYPE: TStringField;
    tabCompany: TTable;
    pgeWeeklyWages: TPageControl;
    tshPayslipEntry: TTabSheet;
    GroupBox2: TGroupBox;
    Label24: TLabel;
    edtOther1: TDBEdit;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    edtSpecialBonus: TDBEdit;
    shwSaveAC: TDBEdit;
    edtRepayLnWk: TDBEdit;
    shwLoanAC: TDBEdit;
    tshPaySlip: TTabSheet;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Panel2: TPanel;
    btnCreateBatch: TButton;
    btnPrintBatch: TButton;
    btnPrintHolSlip: TButton;
    btnPrintReports: TButton;
    btnPostBatch: TButton;
    lblLastWeekPosted: TLabel;
    datCompany: TDataSource;
    tabCompanyREF: TIntegerField;
    tabCompanyCONAME: TStringField;
    tabCompanyCOMPRESSSEL: TStringField;
    tabCompanyCOMPRESSCLR: TStringField;
    tabCompanyBOLDSEL: TStringField;
    tabCompanyBOLDCLR: TStringField;
    tabCompanyFORMFEED: TStringField;
    tabCompanyLINESONPAGE: TIntegerField;
    tabCompanyMINPAYRATE: TFloatField;
    tabCompanyMAXPAYRATE: TFloatField;
    tabCompanyMINSTARTAGE: TIntegerField;
    tabCompanyMAXSTARTAGE: TIntegerField;
    tabCompanyRENTALLOWANCE: TFloatField;
    tabCompanyOTHER1: TFloatField;
    tabCompanyANNUALBONMIN: TFloatField;
    tabCompanyLASTWEEK: TDateTimeField;
    tabCompanySTARTNUMBER: TIntegerField;
    tabCompanyATXWK: TIntegerField;
    tabCompanyWEEKSINYEAR: TIntegerField;
    tabCompanyHOLIDAYPAYDAYS: TIntegerField;
    tabCompanyNORMALHRS: TIntegerField;
    tabCompanyNORMALMINS: TIntegerField;
    tabCompanyNORMALOT13HRS: TIntegerField;
    tabCompanyNORMALOT13MINS: TIntegerField;
    tabCompanyNORMALOT12HRS: TIntegerField;
    tabCompanyNORMALOT12MINS: TIntegerField;
    tabCompanyNORMALOTX2HRS: TIntegerField;
    tabCompanyNORMALOTX2MINS: TIntegerField;
    tabCompanyNORMALATTDAYS: TFloatField;
    tabCompanyCOUNCILDEDUCT: TFloatField;
    tabCompanyPROVFUNDPERCENT: TFloatField;
    tabCompanySICKFUNDPERCENT: TFloatField;
    tabCompanyMAXPAIDSICKDAYS: TFloatField;
    tabCompanyUIFPERCENT: TFloatField;
    tabCompanyNIGHTSHIFTPERCENT: TFloatField;
    tabCompanyPENSIONPERCENT: TFloatField;
    tabCompanyHOLIDAYWEEKS: TIntegerField;
    shwLastWeek: TDBEdit;
    lblThisWeekEnd: TLabel;
    shwThisWeekEnd: TEdit;
    lblshwDischargeDate: TLabel;
    shwPosted: TDBEdit;
    qryClearBatch: TQuery;
    Label20: TLabel;
    DBEdit1: TDBEdit;
    Label26: TLabel;
    DBEdit2: TDBEdit;
    Label27: TLabel;
    DBEdit3: TDBEdit;
    Label28: TLabel;
    DBEdit4: TDBEdit;
    Label33: TLabel;
    DBEdit9: TDBEdit;
    Label34: TLabel;
    DBEdit10: TDBEdit;
    Label36: TLabel;
    DBEdit12: TDBEdit;
    Label37: TLabel;
    DBEdit13: TDBEdit;
    qryTaxTable: TQuery;
    tabTaxConstants: TTable;
    Label38: TLabel;
    DBEdit14: TDBEdit;
    Label39: TLabel;
    DBEdit15: TDBEdit;
    Label40: TLabel;
    DBEdit16: TDBEdit;
    Label41: TLabel;
    DBEdit17: TDBEdit;
    Label42: TLabel;
    DBEdit18: TDBEdit;
    Label43: TLabel;
    DBEdit19: TDBEdit;
    Label45: TLabel;
    DBEdit21: TDBEdit;
    Label49: TLabel;
    DBEdit25: TDBEdit;
    tabCompanyATAXYEAR: TIntegerField;
    Label50: TLabel;
    DBEdit26: TDBEdit;
    Label52: TLabel;
    DBEdit27: TDBEdit;
    Label53: TLabel;
    DBEdit28: TDBEdit;
    Label54: TLabel;
    DBEdit29: TDBEdit;
    Label55: TLabel;
    DBEdit30: TDBEdit;
    Label56: TLabel;
    DBEdit31: TDBEdit;
    Label60: TLabel;
    DBEdit35: TDBEdit;
    qrySickFundTable: TQuery;
    dbnHolSlip: TDBNavigator;
    qryPostBatch: TQuery;
    Label66: TLabel;
    Label68: TLabel;
    DBEdit40: TDBEdit;
    DBEdit42: TDBEdit;
    popFindMenu: TODFindMenu;
    tabPaySlipSummary: TTable;
    qryDepartmental: TQuery;
    qryPaymentTotals: TQuery;
    qryInsertOneRow: TQuery;
    tabDeptSummary: TTable;
    tabEmployeeDEPREF: TStringField;
    qryHolSlipHistInsert: TQuery;
    tabPaySlipSummaryTHISWEEK: TDateTimeField;
    tabPaySlipSummaryWEEKLYORFINAL: TStringField;
    tabPaySlipSummaryCOINR100: TFloatField;
    tabPaySlipSummaryCOINR50: TFloatField;
    tabPaySlipSummaryCOINR20: TFloatField;
    tabPaySlipSummaryCOINR10: TFloatField;
    tabPaySlipSummaryCOINR5: TFloatField;
    tabPaySlipSummaryCOINR2: TFloatField;
    tabPaySlipSummaryCOINR1: TFloatField;
    tabPaySlipSummaryCOINC50: TFloatField;
    tabPaySlipSummaryCOINC20: TFloatField;
    tabPaySlipSummaryCOINC10: TFloatField;
    tabPaySlipSummaryCOINC5: TFloatField;
    tabPaySlipSummaryCOINC2: TFloatField;
    tabPaySlipSummaryCOINC1: TFloatField;
    tabPaySlipSummarySICKEMP1: TIntegerField;
    tabPaySlipSummarySICKEMP2: TIntegerField;
    tabPaySlipSummarySICKEMP3: TIntegerField;
    tabPaySlipSummarySICKEMP4: TIntegerField;
    tabPaySlipSummarySICKEMP5: TIntegerField;
    tabPaySlipSummarySICKCONTRIB1: TFloatField;
    tabPaySlipSummarySICKCONTRIB2: TFloatField;
    tabPaySlipSummarySICKCONTRIB3: TFloatField;
    tabPaySlipSummarySICKCONTRIB4: TFloatField;
    tabPaySlipSummarySICKCONTRIB5: TFloatField;
    tabPaySlipSummaryTAXEARN: TFloatField;
    tabPaySlipSummarySAVINGS: TFloatField;
    tabPaySlipSummaryLOAN: TFloatField;
    tabPaySlipSummaryNEGPAYLOAN: TFloatField;
    tabPaySlipSummarySICKPAY: TFloatField;
    tabPaySlipSummaryRENTPAID: TFloatField;
    tabPaySlipSummaryPENSIONDEDUCT: TFloatField;
    tabPaySlipSummaryTAXDEDUCT: TFloatField;
    tabPaySlipSummaryUIFDEDUCT: TFloatField;
    tabPaySlipSummaryPROVFUNDDEDUCT: TFloatField;
    tabPaySlipSummaryCOUNCILDEDUCT: TFloatField;
    tabPaySlipSummarySICKFUNDDEDUCT: TFloatField;
    tabPaySlipSummaryMEDAIDDEDUCT: TFloatField;
    tabPaySlipSummaryINSURANCEDEDUCT: TFloatField;
    tabPaySlipSummaryOTHER1DEDUCT: TFloatField;
    tabPaySlipSummaryOTHER2DEDUCT: TFloatField;
    tabPaySlipSummaryRENTDEDUCT: TFloatField;
    tabPaySlipSummarySAVINGSDEDUCT: TFloatField;
    tabPaySlipSummaryLOANDEDUCT: TFloatField;
    tabPaySlipSummaryTOTALPAYMENTS: TFloatField;
    tabPaySlipSummaryTOTALDEDUCTS: TFloatField;
    tabPaySlipSummaryNETPAY: TFloatField;
    tabPaySlipSummaryEMPLOYEESTOTAL: TIntegerField;
    tabPaySlipSummaryNORMALHHTOTAL: TIntegerField;
    tabPaySlipSummaryNORMALMMTOTAL: TIntegerField;
    tabPaySlipSummaryOT13HHTOTAL: TIntegerField;
    tabPaySlipSummaryOT13MMTOTAL: TIntegerField;
    tabPaySlipSummaryOT12HHTOTAL: TIntegerField;
    tabPaySlipSummaryOT12MMTOTAL: TIntegerField;
    tabPaySlipSummaryOTX2HHTOTAL: TIntegerField;
    tabPaySlipSummaryOTX2MMTOTAL: TIntegerField;
    tabPaySlipSummaryPRODBONUSTOTAL: TFloatField;
    tabPaySlipSummaryDEPREF: TStringField;
    tabHolSlipCLKNO: TIntegerField;
    tabHolSlipTHISWEEK: TDateTimeField;
    tabHolSlipSAVINGSPAID: TFloatField;
    tabHolSlipLOANREPAYRATE: TFloatField;
    tabHolSlipOTHER1: TFloatField;
    tabHolSlipPOSTED: TStringField;
    tabHolSlipRENTALLOWPAY: TFloatField;
    tabHolSlipPENSIONDEDUCT: TFloatField;
    tabHolSlipTAXDEDUCT: TFloatField;
    tabHolSlipUIFDEDUCT: TFloatField;
    tabHolSlipPROVFUNDDEDUCT: TFloatField;
    tabHolSlipCOUNCILDEDUCT: TFloatField;
    tabHolSlipSICKFUNDDEDUCT: TFloatField;
    tabHolSlipOTHER1DEDUCT: TFloatField;
    tabHolSlipREPAYLOANPERWEEKDEDUCT: TFloatField;
    tabHolSlipRENTACBALANCE: TFloatField;
    tabHolSlipRENTREPAY: TFloatField;
    tabHolSlipSAVEACBALANCE: TFloatField;
    tabHolSlipLOANACBALANCE: TFloatField;
    tabHolSlipTAXEARNINGS: TFloatField;
    tabHolSlipTOTALEARNINGS: TFloatField;
    tabHolSlipTOTALDEDUCT: TFloatField;
    tabHolSlipTOTALPAY: TFloatField;
    tabHolSlipINSURANCEDEDUCT: TFloatField;
    tabHolSlipFULLWEEKS: TFloatField;
    tabHolSlipPARTWEEKS: TFloatField;
    tabHolSlipNEGPAYLOAN: TFloatField;
    tabDeptSummaryEMPPERDEPT: TIntegerField;
    tabDeptSummaryTAXEARNINGS: TFloatField;
    tabDeptSummaryNORMALHH: TIntegerField;
    tabDeptSummaryNORMALMM: TIntegerField;
    tabDeptSummaryOT13HH: TIntegerField;
    tabDeptSummaryOT13MM: TIntegerField;
    tabDeptSummaryOT12HH: TIntegerField;
    tabDeptSummaryOT12MM: TIntegerField;
    tabDeptSummaryOTX2HH: TIntegerField;
    tabDeptSummaryOTX2MM: TIntegerField;
    tabDeptSummaryPRODBONUS: TFloatField;
    tabDeptSummaryTHISWEEK: TDateTimeField;
    tabDeptSummaryDEPREF: TStringField;
    qryEPTTotals: TQuery;
    qryEPTTotalsNORMALHHTOTALS: TIntegerField;
    qryEPTTotalsNORMALMMTOTALS: TIntegerField;
    qryEPTTotalsOT13HHTOTALS: TIntegerField;
    qryEPTTotalsOT13MMTOTALS: TIntegerField;
    qryEPTTotalsOT12HHTOTALS: TIntegerField;
    qryEPTTotalsOT12MMTOTALS: TIntegerField;
    qryEPTTotalsOTX2HHTOTALS: TIntegerField;
    qryEPTTotalsOTX2MMTOTALS: TIntegerField;
    qryEPTTotalsEMPPERDEPT: TIntegerField;
    qryEPTTotalsPRODBONUS: TFloatField;
    qryPaymentTotalsPENSIONDEDUCT: TFloatField;
    qryPaymentTotalsTAXDEDUCT: TFloatField;
    qryPaymentTotalsUIFDEDUCT: TFloatField;
    qryPaymentTotalsPROVFUNDDEDUCT: TFloatField;
    qryPaymentTotalsCOUNCILDEDUCT: TFloatField;
    qryPaymentTotalsSICKFUNDDEDUCT: TFloatField;
    qryPaymentTotalsINSURANCEDEDUCT: TFloatField;
    qryPaymentTotalsOTHER1DEDUCT: TFloatField;
    qryPaymentTotalsREPAYLNDEDUCT: TFloatField;
    qryPaymentTotalsNEGPAYLOAN: TFloatField;
    qryPaymentTotalsRENTREPAY: TFloatField;
    qryPaymentTotalsTOTALDEDUCTIONS: TFloatField;
    qryPaymentTotalsTOTALEARNINGS: TFloatField;
    tabCompanyBATUSERNAME: TStringField;
    qryGetDates: TQuery;
    qryGetDatesTHISWEEK: TDateTimeField;
    cbDates: TComboBox;
    udDates: TUpDown;
    qryViewData: TQuery;
    lblCbDates: TStaticText;
    btnClose: TSpeedButton;
    tabHolSlipPAYKIND: TStringField;
    tabCompanyPAYKIND: TStringField;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label17: TLabel;
    shwDischargeDate: TDBEdit;
    tabPaySlipSummaryPAYKIND: TStringField;
    qryPaymentTotalsTAXEARNINGS: TFloatField;
    qryPaymentTotalsSAVINGSPAID: TFloatField;
    qryPaymentTotalsSAVINGS: TFloatField;
    qryPaymentTotalsLOAN: TFloatField;
    tabPaySlipSummaryTOTALEARNINGS: TFloatField;
    tabPaySlipSummarySAVINGSPAID: TFloatField;
    tabPaySlipSummaryLOANGIVEN: TFloatField;
    qryPaySlipSummaryDelete: TQuery;
    qryDeptSummaryDelete: TQuery;
    qryViewEmployee: TQuery;
    qryViewEmployeeCLKNO: TIntegerField;
    qryViewEmployeeSURNAME: TStringField;
    qryViewEmployeeFIRSTNAME: TStringField;
    qryViewEmployeeSTREET: TStringField;
    qryViewEmployeeSUBURB: TStringField;
    qryViewEmployeePOSTCODE: TStringField;
    qryViewEmployeeRENTACNO: TStringField;
    qryViewEmployeeRENTMONTH: TFloatField;
    qryViewEmployeeSAVEACNO: TStringField;
    qryViewEmployeeSTARTDATE: TDateTimeField;
    qryViewEmployeeBIRTHDATE: TDateTimeField;
    qryViewEmployeePAYRATESETDATE: TDateTimeField;
    qryViewEmployeeHUSBANDNAME: TStringField;
    qryViewEmployeeMSTATUS: TStringField;
    qryViewEmployeeNOOFCHILD: TIntegerField;
    qryViewEmployeeOCCUPATION: TStringField;
    qryViewEmployeeIDNO: TStringField;
    qryViewEmployeeUIF: TStringField;
    qryViewEmployeePROVFUNDFLAG: TStringField;
    qryViewEmployeeOTHER1FLAG: TStringField;
    qryViewEmployeeSICKFUNDFLAG: TStringField;
    qryViewEmployeeHRPAYRATE: TFloatField;
    qryViewEmployeeATTBONUSWK: TFloatField;
    qryViewEmployeeSAVEWK: TFloatField;
    qryViewEmployeeREPAYLNWK: TFloatField;
    qryViewEmployeeINSURANCE: TFloatField;
    qryViewEmployeeSAVEAC: TFloatField;
    qryViewEmployeeTAXEARN: TFloatField;
    qryViewEmployeePENSION: TFloatField;
    qryViewEmployeeSICKFD: TFloatField;
    qryViewEmployeePROVFD: TFloatField;
    qryViewEmployeeUIFPAY: TFloatField;
    qryViewEmployeePAYE: TFloatField;
    qryViewEmployeeGROSSPAY: TFloatField;
    qryViewEmployeeWKSPAY: TFloatField;
    qryViewEmployeeRENTAC: TFloatField;
    qryViewEmployeeLOANAC: TFloatField;
    qryViewEmployeeFULLWK: TIntegerField;
    qryViewEmployeePARTWK: TIntegerField;
    qryViewEmployeeLEAVEDAY: TIntegerField;
    qryViewEmployeeSICKDAY: TIntegerField;
    qryViewEmployeeTAXWEEK: TIntegerField;
    qryViewEmployeeDISCHARGEDATE: TDateTimeField;
    qryViewEmployeeBANKREF: TStringField;
    qryViewEmployeeBANKSORTCODE: TStringField;
    qryViewEmployeeBANKACCREF: TStringField;
    qryViewEmployeeBANKACCTYPE: TStringField;
    qryViewEmployeeDEPREF: TStringField;
    qryCheckRent: TQuery;
    qryCheckRentCOUNTRENTREPAY: TIntegerField;
    tabCompanySICKFUNDPAYPERCENT: TFloatField;
    tabHolSlipHOLIDAYPAYDAYS: TIntegerField;
    tabHolSlipHOLIDAYPAY: TFloatField;
    tabHolSlipSERVICEBONUS: TFloatField;
    tabHolSlipSPECIALBONUS: TFloatField;
    GroupBox3: TGroupBox;
    Label21: TLabel;
    edtSavingsPaidOut: TDBEdit;
    Label2: TLabel;
    tabHolSlipHOLIDAYWEEKS: TIntegerField;
    tabHolSlipCHRISTMASBONUS: TFloatField;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    qryViewDataCLKNO: TIntegerField;
    qryViewDataTHISWEEK: TDateTimeField;
    qryViewDataHOLIDAYPAYDAYS: TIntegerField;
    qryViewDataHOLIDAYPAY: TFloatField;
    qryViewDataCHRISTMASBONUS: TFloatField;
    qryViewDataSERVICEBONUS: TFloatField;
    qryViewDataSPECIALBONUS: TFloatField;
    qryViewDataSAVINGSPAID: TFloatField;
    qryViewDataLOANREPAYRATE: TFloatField;
    qryViewDataOTHER1: TFloatField;
    qryViewDataPOSTED: TStringField;
    qryViewDataRENTALLOWPAY: TFloatField;
    qryViewDataPENSIONDEDUCT: TFloatField;
    qryViewDataTAXDEDUCT: TFloatField;
    qryViewDataUIFDEDUCT: TFloatField;
    qryViewDataPROVFUNDDEDUCT: TFloatField;
    qryViewDataCOUNCILDEDUCT: TFloatField;
    qryViewDataSICKFUNDDEDUCT: TFloatField;
    qryViewDataOTHER1DEDUCT: TFloatField;
    qryViewDataREPAYLOANPERWEEKDEDUCT: TFloatField;
    qryViewDataRENTACBALANCE: TFloatField;
    qryViewDataRENTREPAY: TFloatField;
    qryViewDataSAVEACBALANCE: TFloatField;
    qryViewDataLOANACBALANCE: TFloatField;
    qryViewDataTAXEARNINGS: TFloatField;
    qryViewDataTOTALEARNINGS: TFloatField;
    qryViewDataTOTALDEDUCT: TFloatField;
    qryViewDataTOTALPAY: TFloatField;
    qryViewDataINSURANCEDEDUCT: TFloatField;
    qryViewDataFULLWEEKS: TFloatField;
    qryViewDataPARTWEEKS: TFloatField;
    qryViewDataNEGPAYLOAN: TFloatField;
    qryViewDataPAYKIND: TStringField;
    qryViewDataHOLIDAYWEEKS: TIntegerField;
    qryPaymentTotalsHOLIDAYPAY: TFloatField;
    qryPaymentTotalsCHRISTMASBONUS: TFloatField;
    qryPaymentTotalsSERVICEBONUS: TFloatField;
    qryPaymentTotalsSPECIALBONUS: TFloatField;
    tabPaySlipSummaryHOLIDAYPAYDAYS: TIntegerField;
    tabPaySlipSummaryHOLIDAYPAY: TFloatField;
    tabPaySlipSummaryCHRISTMASBONUS: TFloatField;
    tabPaySlipSummarySERVICEBONUS: TFloatField;
    tabPaySlipSummarySPECIALBONUS: TFloatField;
    qryPaymentTotalsHOLIDAYPAYDAYS: TIntegerField;
    tabCompanySERVICEBONUS: TFloatField;
    Label51: TLabel;
    Label18: TLabel;
    edtABLessRepay: TDBEdit;
    tabHolSlipABOLDBAL: TFloatField;
    tabHolSlipABLESSREPAY: TFloatField;
    tabHolSlipABADDNEW: TFloatField;
    tabHolSlipABNEWBAL: TFloatField;
    tabPaySlipSummaryABLOANDEDUCT: TFloatField;
    qryPaymentTotalsABLOANDEDUCT: TFloatField;
    Label8: TLabel;
    edtABNewBal: TDBEdit;
    qryViewDataABOLDBAL: TFloatField;
    qryViewDataABLESSREPAY: TFloatField;
    qryViewDataABADDNEW: TFloatField;
    qryViewDataABNEWBAL: TFloatField;
    qryCheckABRepayment: TQuery;
    qryCheckABRepaymentCOUNTABLESSREPAY: TIntegerField;
    tabEmployeeABLOANACTIVE: TStringField;
    qryViewEmployeeABLOANACTIVE: TStringField;
    tabEmployeeABLOANAC: TFloatField;
    qryWeeksInMonth: TQuery;
    qryWeeksInMonthNUMBEROFWEEKS: TIntegerField;
    tabEmployeeABREPAYFROMYEAR: TIntegerField;
    tabEmployeeABREPAYFROMMONTH: TIntegerField;
    tabEmployeeABLOANACCNO: TStringField;
    tabEmployeeABLOANSTARTVALUE: TFloatField;
    tabEmployeeABREPAYLNMONTH: TFloatField;
    tabEmployeeABREPAYTERM: TIntegerField;
    tabHolSlipANNUALBONUS: TFloatField;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    qryViewDataANNUALBONUS: TFloatField;
    tabPaySlipSummaryPFLOANDEDUCT: TFloatField;
    tabPaySlipSummaryLAWYERDEDUCT: TFloatField;
    tabPaySlipSummaryANNUALBONUS: TFloatField;
    qryPaymentTotalsPFLOANDEDUCT: TFloatField;
    qryPaymentTotalsLAWYERDEDUCT: TFloatField;
    qryPaymentTotalsANNUALBONUS: TFloatField;
    tabHolSlipPFOLDBAL: TFloatField;
    tabHolSlipPFLESSREPAY: TFloatField;
    tabHolSlipPFADDNEW: TFloatField;
    tabHolSlipPFNEWBAL: TFloatField;
    tabHolSlipLAWYERDEDUCT: TFloatField;
    tabCompanyANNUALBONUSWEEKS: TFloatField;
    tabEmployeePFLOANACCNO: TStringField;
    tabEmployeePFLOANSTARTVALUE: TFloatField;
    tabEmployeePFLOANAC: TFloatField;
    tabEmployeePFREPAYLNMONTH: TFloatField;
    tabEmployeePFREPAYTERM: TIntegerField;
    tabEmployeePFREPAYFROMYEAR: TIntegerField;
    tabEmployeePFREPAYFROMMONTH: TIntegerField;
    tabEmployeePFLOANACTIVE: TStringField;
    tabEmployeeLAWYERMONTH: TFloatField;
    qryGetFullAndPartWeeks: TQuery;
    qryGetLastPayRate: TQuery;
    qryGetFullAndPartWeeksFULLWEEK: TFloatField;
    qryGetFullAndPartWeeksPARTWEEK: TFloatField;
    qryGetLastPayRateCLKNO: TIntegerField;
    qryGetLastPayRateFROMDATE: TDateTimeField;
    qryGetLastPayRatePAYRATE: TFloatField;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit20: TDBEdit;
    qryViewDataPFOLDBAL: TFloatField;
    qryViewDataPFLESSREPAY: TFloatField;
    qryViewDataPFADDNEW: TFloatField;
    qryViewDataPFNEWBAL: TFloatField;
    qryViewDataLAWYERDEDUCT: TFloatField;
    qryCheckPFRepayment: TQuery;
    qryCheckPFRepaymentCOUNTPFLESSREPAY: TIntegerField;
    qryFetchPFMinWeek: TQuery;
    qryFetchPFMinWeekFIRSTWEEKINMONTH: TDateTimeField;
    tabEmployeeBANKFEES: TFloatField;
    tabEmployeeINSURANCEWM: TStringField;
    tabEmployeeLAWYERWM: TStringField;
    tabCompanyUNIONSUBSPERCENT: TFloatField;
    tabCompanyUNIONMINEXCLFUNERALLEVY: TFloatField;
    tabCompanyUNIONMAXEXCLFUNERALLEVY: TFloatField;
    tabCompanyFUNERALLEVY: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure datEmployeeDataChange(Sender: TObject; Field: TField);
    procedure datCompanyDataChange(Sender: TObject; Field: TField);
    procedure btnCreateBatchClick(Sender: TObject);
    procedure datHolSlipStateChange(Sender: TObject);
    procedure tabHolSlipBeforeEdit(DataSet: TDataSet);
    procedure tabHolSlipBeforeInsert(DataSet: TDataSet);
    procedure pgeWeeklyWagesChange(Sender: TObject);
    procedure tabHolSlipBeforePost(DataSet: TDataSet);
    procedure btnPostBatchClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure btnPrintReportsClick(Sender: TObject);
    procedure popFindMenuPopup(Sender: TObject);
    procedure cbDatesChange(Sender: TObject);
    procedure udDatesClick(Sender: TObject; Button: TUDBtnType);
    procedure edtEmployeeFullNameChange(Sender: TObject);
    procedure tabHolSlipAfterPost(DataSet: TDataSet);
    procedure tabHolSlipAfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
    {Note: LastWeek: Week that wages system was started or last week that
                    wages was run.
          ThisWeek: Current week that wages is being run.
          NextWeek: Next week that wages will be run. Used in end of
                    month finding calculations, eg: for paying rent. }
    WeeksThisMonth,WeeksNextMonth:integer; //added DL161201
    ThisWeekMM, NextWeekMM, LastWeekMM : word;
    ThisWeekYYYY, LastWeekYYYY, NextWeekYYYY : word; //added DL011299
    DisplayWeek: TDateTime;  //displayweek is only used in view mode
    BatchMode: Boolean; // Are you creating a batch
    CreatingBatch : boolean;  //true whilst a batch is being created
    THundreds,TFifties,TTwenties,TTens, { Tens rand notes: Total eg R270. }
    TFives, TTwos, TOnes, TFiftyC, TTwentyC, TTenC, TFiveC, TTwoC, TOneC : double;
    procedure CopyToPaySummary;
    procedure Coinage(PSP:double);
    procedure ChangeToViewMode;//Can only view data
    procedure ChangeToEditMode;//You can edit data for HP
    procedure MakeEmpBatch;
    procedure PostEmployee;
  public
    { Public declarations }
    ThisWeekEnd, NextWeekEnd:TDateTime;
  end;

var
  frmHolidayPay: TfrmHolidayPay;
//  BatchMode: Boolean; // Are you creating a batch: this is global so moded
//  EditMode: Boolean; // Are you viewing or running weekly wages.
                     // if EditMode then you can run weekly wages.

implementation

uses Main, WCommon, Utils, PrintHolSlip, {Calendar, }WagesReport, {DateChoice,}
  {FinalPayslip, }bankrept, rentrept, HPShpiel, ABLoanWklyRept, abloanmonthlyrept,
  pfloanwklyrept, pfloanmonthlyrept;

{$R *.DFM}

procedure TfrmHolidayPay.PostEmployee;
begin
  if tabHolSlipPOSTED.AsString<>'Y' then
  begin
    StatusBar1.Panels[0].Text:='Please Wait: Posting Batch: Employee '
      +tabHolSlipCLKNO.AsString;
    Application.ProcessMessages;
    tabHolSlip.Edit;
    tabHolSlipPOSTED.AsString := 'Y';
    tabHolSlip.Post; //this updates the payslip
    //update employee balances
    tabEmployee.Edit;
    tabEmployeeTAXEARN.AsFloat:=tabEmployeeTAXEARN.AsFloat
      + tabHolSlipTaxEarnings.AsFloat;
    tabEmployeePENSION.AsFloat:=tabEmployeePENSION.AsFloat
      + tabHolSlipPENSIONDEDUCT.AsFloat;
    tabEmployeeUIFPAY.AsFloat:=tabEmployeeUIFPAY.AsFloat
      + tabHolSlipUIFDEDUCT.AsFloat;
    tabEmployeePROVFD.AsFloat:=tabEmployeePROVFD.AsFloat
      + tabHolSlipPROVFUNDDEDUCT.AsFloat;
    tabEmployeeSICKFD.AsFloat:=tabEmployeeSICKFD.AsFloat
      + tabHolSlipSICKFUNDDEDUCT.AsFloat;
    tabEmployeePAYE.AsFloat:=tabEmployeePAYE.AsFloat
      + tabHolSlipTAXDEDUCT.AsFloat;
    tabEmployeeGROSSPAY.AsFloat:=tabEmployeeGROSSPAY.AsFloat
      + tabHolSlipTaxEarnings.AsFloat;
    tabEmployeeRENTAC.AsFloat:=tabHolSlipRENTACBALANCE.AsFloat;
    tabEmployeeSAVEAC.AsFloat:=tabHolSlipSAVEACBALANCE.AsFloat;
    tabEmployeeLOANAC.AsFloat:=tabHolSlipLOANACBALANCE.AsFloat;
    tabEmployeeABLOANAC.AsFloat:=tabHolSlipABNEWBAL.AsFloat; //added DL161201
    tabEmployeePFLOANAC.AsFloat:=tabHolSlipPFNEWBAL.AsFloat; //added DL050116!
    if tabHolSlipTOTALPAY.AsFloat>=0 then //incl =0 so that wkspay assigned 0 if rqd
    begin
      tabEmployeeWKSPAY.AsFloat:=tabHolSlipTOTALPAY.AsFloat;
      Coinage(tabHolSlipTOTALPAY.AsFloat);
    end
    else
    begin
      tabEmployeeLOANAC.AsFloat:=tabEmployeeLOANAC.AsFloat
        - tabHolSlipTOTALPAY.AsFloat; //LoanAC is a +ve amount!
      tabEmployeeWKSPAY.AsFloat:=0; //added DL151199
    end;
    tabEmployeeFULLWK.AsInteger:=tabHolSlipFULLWEEKS.AsInteger;
    tabEmployeePARTWK.AsInteger:=tabHolSlipPARTWEEKS.AsInteger;
    tabEmployeeTAXWEEK.AsInteger:=tabEmployeeTAXWEEK.AsInteger+tabCompanyHolidayWeeks.AsInteger;
    if tabEmployeeREPAYLNWK.AsFloat<>tabHolSlipLOANREPAYRATE.AsFloat then
      tabEmployeeREPAYLNWK.AsFloat:=tabHolSlipLOANREPAYRATE.AsFloat;
    tabEmployee.Post;
  end;
end;

procedure TfrmHolidayPay.MakeEmpBatch;
//insert a record for an employee into the payslip table
begin
  if tabEmployeeDischargeDate.IsNull then //employee not discharged
  begin
    StatusBar1.Panels[0].Text:='Creating ClkNo: '+tabEmployeeClkNo.AsString;
    Application.ProcessMessages;
    tabHolSlip.Insert;
    tabHolSlipCLKNO.AsInteger:=tabEmployeeClkNo.AsInteger;
    tabHolSlipTHISWEEK.AsDateTime:=ThisWeekEnd;
    if PayKind=pkHoliday then
      tabHolSlipPAYKIND.AsString:='HP'
    else
      tabHolSlipPAYKIND.AsString:='XX'; //error
    tabHolSlipSPECIALBONUS.AsFloat:=0;
    tabHolSlipSAVINGSPAID.AsFloat:=0;
    tabHolSlipABADDNEW.AsFloat:=0; //added DL161201
    tabHolSlipPFADDNEW.AsFloat:=0; //added DL041207
    tabHolSlipLOANREPAYRATE.AsFloat:=tabEmployeeREPAYLNWK.AsFloat; //xx maybe not reqd
    if tabEmployeeOTHER1FLAG.AsString='Y' then
      tabHolSlipOTHER1.AsFloat:=tabCompanyOTHER1.AsFloat
    else
      tabHolSlipOTHER1.AsFloat:=0;
    tabHolSlipPOSTED.AsString:='N';
    tabHolSlip.Post;
  end;
end;

procedure TfrmHolidayPay.ChangeToViewMode;
var
  ix: Integer;
begin
  BatchMode:=false;
  //set up the dates which can be viewed
  qryGetDates.Close;
  qryGetDates.ParamByName('PayKind').AsString:='HP';
  qryGetDates.Open; //sql gets dates in desc order!
  qryGetDates.First;
  cbDates.Clear;
  while not qryGetDates.EOF do
  begin
    cbDates.Items.Add(DateToStr(qryGetDatesTHISWEEK.AsDateTime));
    qryGetDates.Next;
  end;
  qryGetDates.Close;
  cbDates.Visible := True;
  cbDates.ItemIndex := 0;
  if cbDates.ItemIndex > -1 then
    DisplayWeek := StrToDate(cbDates.Text);
  for ix := 0 to ComponentCount - 1 do
  begin
    if (Components[ix] is TDBEdit) and ((Components[ix] as TDBEdit).Tag = 0) then
    begin
      TDBEdit(Components[ix]).ReadOnly := True;
      TDBEdit(Components[ix]).Color := cl3DLight;
    end;
  end;
  tabHolSlip.Close; //because going into view mode
  tabEmployee.Close; //xxx
  tabEmployee.Filter:='';
  tabEmployee.Filtered:=false;
  qryViewData.Close; //opened when dates changed or employee changed in view mode
  qryViewEmployee.Close; //xxx
  datHolSlip.DataSet := qryViewData;
  datEmployee.DataSet := qryViewEmployee; //xxx

  btnCancel.Enabled := False;
  btnSave.Enabled := False;
  dbnHolSlip.Enabled:=false;
  btnPostBatch.Enabled := False;
  btnPrintBatch.Enabled := True;
  btnPrintHolSlip.Enabled := True;
  btnPrintReports.Enabled := True;
  btnCreateBatch.Enabled:=true;

  lblCbDates.Visible := True;
  udDates.Visible := True;  // UpDown connected to cbDates
  cbDatesChange(nil);
  if PayKind=pkHoliday then
    frmHolidayPay.Caption:='Holiday Pay Routine: View Mode'
  else
  begin
    ShowMessage('Invalid PayKind.  Please phone support');
    Exit;
  end;
end;

procedure TfrmHolidayPay.ChangeToEditMode;
//user has already decided to change to edit mode
var
  ix: Integer;
begin
  BatchMode:=true;
  for ix := 0 to ComponentCount - 1 do
  begin
    if ((Components[ix] is TDBEdit)) and ((Components[ix] as TDBEdit).Tag = 0) then
    begin
      TDBEdit(Components[ix]).ReadOnly := False;
      TDBEdit(Components[ix]).Color := clWindow;
    end;
  end;
  qryViewData.Close;
  qryViewEmployee.Close; //xxx
  datHolSlip.DataSet := tabHolSlip;
  datEmployee.DataSet := tabEmployee; //xxx
  tabEmployee.Filter:='dischargedate=null'; //xxx
  tabEmployee.Filtered:=true;
  tabEmployee.Open; //xxx
  tabHolSlip.Open; //must be opened here because closed when going into view mode
  cbDates.Visible := False;
  udDates.Visible := False;
  lblCbDates.Visible := False;
  // Can't print in editmode
  btnPrintBatch.Enabled := False;
  btnPrintHolSlip.Enabled := False;
  btnPrintReports.Enabled := False;

  btnCancel.Enabled := False; //enabled in the normal way when editing a record
  btnSave.Enabled := False;
  btnPostBatch.Enabled := True;
  dbnHolSlip.Enabled:=true;
  btnCreateBatch.Caption := 'Abort Batch';
  if PayKind=pkHoliday then
    frmHolidayPay.Caption:='Holiday Pay Routine: Batch Mode'
  else
  begin
    ShowMessage('Invalid PayKind.  Please phone support');
    Exit;
  end;
end;

procedure TfrmHolidayPay.CopyToPaySummary;
//this only happens in edit mode
var
//  FirstDept,LastDept,
//  MinTotal,SubMin: Integer; // for calculating Hours and Minutes
//  HourSum,MinSum: Integer;
  DeptNo: Integer;
begin
  tabPaySlipSummary.Insert;
  qryPaymentTotals.Close;
  qryPaymentTotals.ParamByName('ThisWeek').AsDateTime := ThisWeekEnd; //not DisplayWeek
  qryPaymentTotals.ParamByName('PayKind').AsString := tabCompanyPayKind.AsString;
  qryPaymentTotals.Open;
  tabPaySlipSummaryTHISWEEK.AsDateTime := ThisWeekEnd;
  tabPaySlipSummaryPayKind.AsString := tabCompanyPayKind.AsString;
  // TOTAL AMOUNTS PAID TO THE EMPLOYEES

  tabPaySlipSummaryHOLIDAYPAYDAYS.AsInteger:=qryPaymentTotalsHOLIDAYPAYDAYS.AsInteger;
  tabPaySlipSummaryHOLIDAYPAY.AsFloat:=qryPaymentTotalsHOLIDAYPAY.AsFloat;
  tabPaySlipSummaryCHRISTMASBONUS.AsFloat:=qryPaymentTotalsCHRISTMASBONUS.AsFloat;
  tabPaySlipSummaryANNUALBONUS.AsFloat:=qryPaymentTotalsANNUALBONUS.AsFloat; //added DL041207
  tabPaySlipSummarySERVICEBONUS.AsFloat:=qryPaymentTotalsSERVICEBONUS.AsFloat;
  tabPaySlipSummarySPECIALBONUS.AsFloat:=qryPaymentTotalsSPECIALBONUS.AsFloat;

  tabPaySlipSummaryTAXEARN.AsFloat := qryPaymentTotalsTAXEARNINGS.AsFloat;
  tabPaySlipSummaryTOTALEARNINGS.AsFloat := qryPaymentTotalsTOTALEARNINGS.AsFloat;

  tabPaySlipSummarySAVINGS.AsFloat := qryPaymentTotalsSAVINGS.AsFloat;
  tabPaySlipSummarySAVINGSPAID.AsFloat := qryPaymentTotalsSAVINGSPAID.AsFloat;
  tabPaySlipSummaryLOAN.AsFloat := qryPaymentTotalsLOAN.AsFloat;
  tabPaySlipSummaryLOANGIVEN.AsFloat := 0; //not applicable in holiday pay routine

  tabPaySlipSummaryNEGPAYLOAN.AsFloat := qryPaymentTotalsNEGPAYLOAN.AsFloat;
  tabPaySlipSummarySICKPAY.AsFloat := 0; //not applicable in holiday pay routine
  tabPaySlipSummaryRENTPAID.AsFloat := qryPaymentTotalsRENTREPAY.AsFloat;
  // TOTAL DEDUCTIONS FROM WEEKLY PAY
  tabPaySlipSummaryPENSIONDEDUCT.AsFloat := qryPaymentTotalsPENSIONDEDUCT.AsFloat;
  tabPaySlipSummaryTAXDEDUCT.AsFloat := qryPaymentTotalsTAXDEDUCT.AsFloat;
  tabPaySlipSummaryUIFDEDUCT.AsFloat := qryPaymentTotalsUIFDEDUCT.AsFloat;
  tabPaySlipSummaryPROVFUNDDEDUCT.AsFloat := qryPaymentTotalsPROVFUNDDEDUCT.AsFloat;
  tabPaySlipSummaryCOUNCILDEDUCT.AsFloat := qryPaymentTotalsCOUNCILDEDUCT.AsFloat;
  tabPaySlipSummarySICKFUNDDEDUCT.AsFloat := qryPaymentTotalsSICKFUNDDEDUCT.AsFloat;
  tabPaySlipSummaryMEDAIDDEDUCT.AsFloat := 0; //not applicable in holiday pay routine
  tabPaySlipSummaryINSURANCEDEDUCT.AsFloat := qryPaymentTotalsINSURANCEDEDUCT.AsFloat;
  tabPaySlipSummaryOTHER1DEDUCT.AsFloat := qryPaymentTotalsOTHER1DEDUCT.AsFloat;
  tabPaySlipSummaryOTHER2DEDUCT.AsFloat := 0; //not applicable in holiday pay routine
  tabPaySlipSummaryRENTDEDUCT.AsFloat := 0; //not applicable in holiday pay routine

  tabPaySlipSummarySAVINGSDEDUCT.AsFloat := 0; //not applicable in holiday pay routine
  tabPaySlipSummaryLOANDEDUCT.AsFloat := qryPaymentTotalsREPAYLNDEDUCT.AsFloat;
  tabPaySlipSummaryABLOANDEDUCT.AsFloat := qryPaymentTotalsABLOANDEDUCT.AsFloat; //added DL161201
  tabPaySlipSummaryPFLOANDEDUCT.AsFloat := qryPaymentTotalsPFLOANDEDUCT.AsFloat; //added DL041207
  tabPaySlipSummaryLAWYERDEDUCT.AsFloat := qryPaymentTotalsLAWYERDEDUCT.AsFloat; //added DL041207

  // GROSS TOTALS FOR PAYMENTS
  tabPaySlipSummaryTOTALPAYMENTS.AsFloat :=
    tabPaySlipSummaryTAXEARN.AsFloat
   +tabPaySlipSummarySAVINGSPAID.AsFloat
   +tabPaySlipSummaryNEGPAYLOAN.AsFloat;

  tabPaySlipSummaryTOTALDEDUCTS.AsFloat :=
    tabPaySlipSummaryPENSIONDEDUCT.AsFloat
   +tabPaySlipSummaryTAXDEDUCT.AsFloat
   +tabPaySlipSummaryUIFDEDUCT.AsFloat
   +tabPaySlipSummaryPROVFUNDDEDUCT.AsFloat
   +tabPaySlipSummaryCOUNCILDEDUCT.AsFloat
   +tabPaySlipSummarySICKFUNDDEDUCT.AsFloat
   +tabPaySlipSummaryINSURANCEDEDUCT.AsFloat
   +tabPaySlipSummaryOTHER1DEDUCT.AsFloat
   +tabPaySlipSummaryRENTDEDUCT.AsFloat
   +tabPaySlipSummarySAVINGSDEDUCT.AsFloat
   +tabPaySlipSummaryLOANDEDUCT.AsFloat
   +tabPaySlipSummaryABLOANDEDUCT.AsFloat  //added DL161201
   +tabPaySlipSummaryPFLOANDEDUCT.AsFloat  //added DL041207
   +tabPaySlipSummaryLAWYERDEDUCT.AsFloat; //added DL041207
  tabPaySlipSummaryNETPAY.AsFloat :=  // Calculate Netpay
    tabPaySlipSummaryTOTALPAYMENTS.AsFloat - tabPaySlipSummaryTOTALDEDUCTS.AsFloat;
  qryPaymentTotals.Close;

  qryDepartmental.Close;
  qryDepartmental.ParamByName('ThisWeek').AsDateTime:=ThisWeekEnd; //not DisplayWeek;
  qryDepartmental.ParamByName('PayKind').AsString:=tabCompanyPayKind.AsString;
  qryDepartmental.ExecSQL;

//  tabDeptSummary.Open;
  tabDeptSummary.Close;
  tabDeptSummary.Open;
  tabDeptSummary.First;

  tabPaySlipSummaryEMPLOYEESTOTAL.AsInteger:=0;
  tabPaySlipSummaryPRODBONUSTOTAL.AsInteger:=0;
{  DeptNo:=0;
  //xx assign hh and mm totals to zero
  // qryDepartmental already inserted the calculated values into DeptSummary Table
  while DeptNo<10 do //Depts go from 0 to 9
  begin
    //ensure records exist for all departments
    while (DeptNo<>StrToInt(tabDeptSummaryDepRef.AsString)) and (DeptNo<10) do
    begin
      qryInsertOneRow.Close;
      qryInsertOneRow.ParamByName('Depref').AsString:=IntToStr(DeptNo);
      qryInsertOneRow.ParamByName('ThisWeek').AsDateTime:=ThisWeekEnd;
      qryInsertOneRow.ParamByName('PayKind').AsString:=tabCompanyPayKind.AsString;
      qryInsertOneRow.ExecSQL;
      DeptNo:=DeptNo+1;
    end;
    DeptNo:=DeptNo+1;
    tabDeptSummary.Next;
  end;}
  // BEGIN CALCULATE NORMAL,OT13,OT12,OTX2 HH AND MM TOTALS, EMPLOYEESTOTAL, PRODBONUSTOTAL
  qryEPTTotals.Close;
  qryEPTTotals.ParamByName('ThisWeek').AsDateTime:=ThisWeekEnd; //not DisplayWeek;
  qryEPTTotals.ParamByName('PayKind').AsString:=tabCompanyPayKind.AsString;
  qryEPTTotals.Open;
  tabPaySlipSummaryEMPLOYEESTOTAL.AsInteger := qryEPTTotalsEMPPERDEPT.AsInteger;
  tabPaySlipSummaryPRODBONUSTOTAL.AsFloat := qryEPTTotalsPRODBONUS.AsFloat;
  tabPaySlipSummaryNORMALHHTOTAL.AsInteger := qryEPTTotalsNORMALHHTOTALS.AsInteger;
  tabPaySlipSummaryNORMALMMTOTAL.AsInteger := qryEPTTotalsNORMALMMTOTALS.AsInteger;
  tabPaySlipSummaryOT13HHTOTAL.AsInteger := qryEPTTotalsOT13HHTOTALS.AsInteger;
  tabPaySlipSummaryOT13MMTOTAL.AsInteger := qryEPTTotalsOT13MMTOTALS.AsInteger;
  tabPaySlipSummaryOT12HHTOTAL.AsInteger := qryEPTTotalsOT12HHTOTALS.AsInteger;
  tabPaySlipSummaryOT12MMTOTAL.AsInteger := qryEPTTotalsOT12MMTOTALS.AsInteger;
  tabPaySlipSummaryOTX2HHTOTAL.AsInteger := qryEPTTotalsOTX2HHTOTALS.AsInteger;
  tabPaySlipSummaryOTX2MMTOTAL.AsInteger := qryEPTTotalsOTX2MMTOTALS.AsInteger;
  qryEPTTotals.Close;
  qryDepartmental.Close;
  // END CALCULATE NORMAL,OT13,OT12,OTX2 HH AND MM TOTALS

  // Coinage analysis and calculations
//  Coinage(tabPaySlipSummaryNETPAY.AsFloat); - this is the wrong place to calc
  //coinage as coinage is per payslip being paid!
  //coinage calculated with PostEmployee
  tabPaySlipSummaryCOINR100.AsFloat := THundreds;
  tabPaySlipSummaryCOINR50.AsFloat := TFifties;
  tabPaySlipSummaryCOINR20.AsFloat := TTwenties;
  tabPaySlipSummaryCOINR10.AsFloat := TTens;
  tabPaySlipSummaryCOINR5.AsFloat := TFives;
  tabPaySlipSummaryCOINR2.AsFloat := TTwos;
  tabPaySlipSummaryCOINR1.AsFloat := TOnes;
  tabPaySlipSummaryCOINC50.AsFloat := TFiftyC;
  tabPaySlipSummaryCOINC20.AsFloat := TTwentyC;
  tabPaySlipSummaryCOINC10.AsFloat := TTenC;
  tabPaySlipSummaryCOINC5.AsFloat := TFiveC;
  tabPaySlipSummaryCOINC2.AsFloat := TTwoC;
  tabPaySlipSummaryCOINC1.AsFloat := TOneC;

  tabPaySlipSummary.Post;
//  tabPaySlipSummary.Close;
end;

procedure TfrmHolidayPay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabDeptSummary.Close;
  tabPaySlipSummary.Close;
  qryInsertOneRow.Close;
  tabDeptSummary.Close;
  qrySickFundTable.Close;
  tabTaxConstants.Close;
  qryTaxTable.Close;
  qryClearBatch.Close;
  tabEmployee.Close;
  tabHolSlip.Close;
  tabCompany.Close;
  Release;
end;

procedure TfrmHolidayPay.btnSaveClick(Sender: TObject);
begin
  if tabHolSlip.State in [dsEdit,dsInsert] then //dsInsert required for Final Pay
    tabHolSlip.Post;
end;

procedure TfrmHolidayPay.btnCancelClick(Sender: TObject);
begin
  if tabHolSlip.State in [dsEdit,dsInsert] then //dsInsert required for Final Pay
  begin
    tabHolSlip.Cancel;
    btnCancel.Enabled := False;
    btnSave.Enabled := False;
  end;
end;

procedure TfrmHolidayPay.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHolidayPay.FormShow(Sender: TObject);
begin
  pgeWeeklyWages.ActivePage:=tshPayslipEntry;
  tabCompany.Open;
  tabPaySlipSummary.Open;
  tabDeptSummary.Open;
  qryClearBatch.Prepare;
  tabTaxConstants.Open;
  tabTaxConstants.FindKey([tabCompany.FieldByName('ATaxYear').AsInteger]); //xx what if not found
  qryTaxTable.Close;
  qryTaxTable.Prepare;
  qrySickFundTable.Close;
  qrySickFundTable.Prepare;
  //set minimum and maximum values - done per employee
  //tabEmployee.Open;
  //tabHolSlip.Open; this is set in changeto[view|edit]mode
  //tabHolSlip must be opened after tabEmployee because
  //it is dependant on tabEmployee in a master detail relationship

  tabCompany.FindKey([1]);
  if tabCompanyBATUSERNAME.AsString='None' then
    ChangeToViewMode
  else
    ChangeToEditMode;

  //frmMain.StatusBar1.Panels[2].Text := '';
end;

procedure TfrmHolidayPay.datEmployeeDataChange(Sender: TObject;
  Field: TField);
begin
  tabHolSlipSPECIALBONUS.MinValue:=0;
  tabHolSlipSPECIALBONUS.MaxValue:=9999.99;

  if BatchMode then //xxx
    edtEmployeeFullName.Text:=tabEmployeeClkNo.AsString+': '+
      tabEmployeeSurname.AsString+', '+tabEmployeeFirstName.AsString+
      '.  Dept:'+tabEmployeeDepRef.AsString
  else
    edtEmployeeFullName.Text:=qryViewEmployeeClkNo.AsString+': '+
      qryViewEmployeeSurname.AsString+', '+qryViewEmployeeFirstName.AsString+
      '.  Dept:'+qryViewEmployeeDepRef.AsString;
  if pgeWeeklyWages.ActivePage=tshPayslipEntry then
  begin
    edtSpecialBonus.SetFocus;
    edtSpecialBonus.SelectAll;  //this done so that whole field is highlighted
  end;
end;

procedure TfrmHolidayPay.datCompanyDataChange(Sender: TObject;
  Field: TField);
var
  {YY,} DD: word;
begin
  //+1 in lines below required because end of week
  ThisWeekEnd:=tabCompanyLASTWEEK.AsDateTime+((tabCompanyHOLIDAYWEEKS.AsInteger+1)*7); //xxx + 21 ?
  NextWeekEnd:=tabCompanyLASTWEEK.AsDateTime+((tabCompanyHOLIDAYWEEKS.AsInteger+1)*7)+7; //xxx + 28 ?
  shwThisWeekEnd.Text:=FormatDateTime('dd/mm/yyyy',ThisWeekEnd);
  DecodeDate(tabCompanyLASTWEEK.AsDateTime, LastWeekYYYY, LastWeekMM, DD); //was YY DL011299
  DecodeDate(ThisWeekEnd, ThisWeekYYYY, ThisWeekMM, DD); //was YY DL011299

  //qryWeeksInDecember lookup added DL161201
  qryWeeksInMonth.Close;
  qryWeeksInMonth.ParamByName('YearNo').AsInteger:=ThisWeekYYYY-1; //only works if holiday pay over end of year xx
  qryWeeksInMonth.ParamByName('MonthNo').AsInteger:=12; //only works if holiday pay over end of year
  qryWeeksInMonth.Open;
  WeeksThisMonth:=qryWeeksInMonthNUMBEROFWEEKS.AsInteger;
  //qryWeeksInJanuary lookup added DL050201
  qryWeeksInMonth.Close;
  qryWeeksInMonth.ParamByName('YearNo').AsInteger:=ThisWeekYYYY; //only works if holiday pay over end of year xx
  qryWeeksInMonth.ParamByName('MonthNo').AsInteger:=1; //only works if holiday pay over end of year
  qryWeeksInMonth.Open;
  WeeksNextMonth:=qryWeeksInMonthNUMBEROFWEEKS.AsInteger;

  DecodeDate(NextWeekEnd, NextWeekYYYY, NextWeekMM, DD); //was YY DL011299
end;

procedure TfrmHolidayPay.btnCreateBatchClick(Sender: TObject);
//used for creating and aborting a batch
var
  CurrentWeekEnd:TDateTime; //added DL051213
begin
  if tabHolSlip.State in [dsEdit] then
  begin
    ShowMessage('Paylip in edit mode.'#13#10'First cancel the edit');
    Exit;
  end;

  if tabCompanyBATUSERNAME.AsString = 'None' then
  begin
    // no batch, so create one
    //BatchMode:=true; - in changetoeditmode

    //Show the Holiday Pay Routine information and ask if the user wishes to continue
    frmHPShpiel := TfrmHPShpiel.Create(Application);
    frmHPShpiel.ShowModal;
    if frmHPShpiel.ModalResult=mrCancel then
    begin
      frmHPShpiel.Release;
      ShowMessage('Nothing done as cancelled');
      Exit;
    end;
    frmHPShpiel.Release;

    //SundaysLeft calculation added DL051213 tells us how may weeks of the holiday
    // are in this year and how many are in next year.
    SundaysLeft:=0;
    CurrentWeekEnd:=tabCompanyLASTWEEK.AsDateTime+7;
    while CurrentWeekEnd<LastDateOfYear do
    begin
      SundaysLeft:=SundaysLeft+1;
      CurrentWeekEnd:=CurrentWeekEnd+7;
    end;

    ChangeToEditMode;
    frmMain.Database.StartTransaction;
    tabCompany.Edit;
    tabCompanyBATUSERNAME.AsString:=UserName;
    if PayKind=pkHoliday then
      tabCompanyPayKind.AsString:='HP'
    else
      tabCompanyPayKind.AsString:='XX'; //error
    tabCompany.Post;
    CreatingBatch:=true;
    tabEmployee.DisableControls;
    tabHolSlip.DisableControls;
    try
      tabEmployee.First;
      while not tabEmployee.EOF do
      begin
        MakeEmpBatch;
        tabEmployee.next;
      end;
      StatusBar1.Panels[0].Text:='Batch Created';
      Application.ProcessMessages;
      frmMain.Database.Commit;
      CreatingBatch:=false;
    except
      frmMain.Database.Rollback;
      //BatchMode:=false;-in changetoviewmode
      ChangeToViewMode;
      CreatingBatch:=false;
    end;
    tabHolSlip.EnableControls;
    tabEmployee.EnableControls;
    tabEmployee.First;
  end
  else // Abort, Clear Batch
  begin
    if MessageDlg('Are you sure you want to abort this batch?',mtWarning,
      [mbYes,mbNo],0) = idYes then
    begin
      frmMain.Database.StartTransaction;
      tabCompany.Edit;
      tabCompanyBATUSERNAME.AsString := 'None'; // No users locking weekly wages
      tabCompanyPAYKIND.AsString := '';
      tabCompany.Post;
      qryClearBatch.Close;
      qryClearBatch.ExecSQL;
      frmMain.Database.Commit;
      btnCreateBatch.Caption := 'Create Batch';
      ChangeToViewMode;
      //BatchMode := false;-in changetoviewmode
      StatusBar1.Panels[0].Text:='Batch Deleted';
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmHolidayPay.btnPostBatchClick(Sender: TObject);
begin
  if tabHolSlip.State = dsEdit then
  begin
    ShowMessage('First save your edits');
    Exit;
  end;

  if MessageDlg('Have you entered all the data for the wages?',mtConfirmation,
    [mbYes,mbNo],0) = mrYes then
  begin
    if MessageDlg('Are you sure you want to post this batch - ' +#13+
      'You will no longer be able to change any holiday payslips afterwards.',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
//      btnCreateBatch.Enabled := False;
      CreatingBatch:=true;
      StatusBar1.Panels[0].Text:='Please Wait: Posting Batch';
      Application.ProcessMessages;

//      tabHolSlip.DisableControls;  don't do this because of master detail problem
//      tabEmployee.DisableControls;
      //xx optimise because at the moment this cycles through the whole
      //employee table even if there is only one final pay or even if
      //most of the employee table is discharged!
      tabEmployee.First;
      //reset coinage
      THundreds := 0; TFifties := 0; TTwenties := 0; TTens := 0; TFives := 0;
      TTwos := 0; TOnes := 0;
      TFiftyC := 0; TTwentyC := 0; TTenC := 0; TFiveC := 0; TTwoC := 0; TOneC := 0;
      frmMain.Database.StartTransaction;
      while not tabEmployee.EOF do
      begin
        //the next if allows for final pay
        if tabHolSlipCLKNO.AsInteger=tabEmployeeCLKNO.AsInteger then
        begin
          if tabEmployeeDISCHARGEDATE.AsDateTime <> 0 then //discharged
          begin //discharge date is only set during PostEmployee
            tabEmployee.Next;
            continue;
          end;
          PostEmployee; //includes updating the employee's totals
        end;
        tabEmployee.Next;
      end;
      qryHolSlipHistInsert.Close;   // Update Holsliphist file includes weekly balances
      qryHolSlipHistInsert.ExecSQL;

      //create the summary information
      //by this time the coinage has been calculated as included with PostEmployee
      CopyToPaySummary;

      //now clear and set the batch information
      tabEmployee.First;
//      tabEmployee.EnableControls;
//      tabHolSlip.EnableControls;
      qryClearBatch.Close;   // Clear the batch
      qryClearBatch.ExecSQL;
      tabCompany.Edit;
      tabCompanyBATUSERNAME.AsString := 'None';
      tabCompanyPAYKIND.AsString := '';
      tabCompanyLASTWEEK.AsDateTime := tabCompanyLASTWEEK.AsDateTime +
        (7*tabCompanyHolidayWeeks.AsInteger);
      tabCompanyATxWk.AsInteger := tabCompanyATxWk.AsInteger+tabCompanyHolidayWeeks.AsInteger;
      tabCompany.Post;
      frmMain.Database.Commit;
      dbnEmployee.Enabled := True;
      //BatchMode := False; - in changetoviewmode
      //EditMode := False; not used
      ChangeToViewMode;
      btnCreateBatch.Caption := 'Create Batch';
      StatusBar1.Panels[0].Text:='Batch Posted - You can now print';
      Application.ProcessMessages;
      CreatingBatch:=false;
    end;// Message2
  end; // Message1
end;

procedure TfrmHolidayPay.datHolSlipStateChange(Sender: TObject);
begin
  if BatchMode then
  begin
    btnSave.Enabled := tabHolSlip.State in [dsEdit, dsInsert];
    btnCancel.Enabled := btnSave.Enabled;
    btnClose.Enabled := tabHolSlip.State = dsBrowse;
  end;
end;

procedure TfrmHolidayPay.tabHolSlipBeforeEdit(DataSet: TDataSet);
begin
//  if tabEmployeeDISCHARGEDATE.AsDateTime>0 then
//    raise Exception.Create('Cannot edit this payslip as employee has been discharged');
  if not BatchMode then
    raise Exception.Create('You can''t edit if you are not in batch mode, First Create a new batch');
  if not CreatingBatch then
    frmMain.Database.StartTransaction;
end;

procedure TfrmHolidayPay.tabHolSlipBeforeInsert(DataSet: TDataSet);
begin
  //happens here as no payslip data for this employee
  if tabEmployeeDISCHARGEDATE.AsDateTime<>0 then
    raise Exception.Create('Cannot edit this payslip as employee has been discharged');
  if not CreatingBatch then
    frmMain.Database.StartTransaction;
end;

procedure TfrmHolidayPay.pgeWeeklyWagesChange(Sender: TObject);
begin
  if pgeWeeklyWages.ActivePage=tshPayslipEntry then
    edtSpecialBonus.SetFocus;
end;

procedure TfrmHolidayPay.tabHolSlipBeforePost(DataSet: TDataSet);
begin
  //do all the required calculations
  // --- Getvalues --- //
  //xxx all calculations
  //HolidayWeeks stored here just in case it changes or if it changes per employee later on
  tabHolSlipHolidayWeeks.AsInteger:=tabCompanyHolidayWeeks.AsInteger;
  tabHolSlipHolidayPayDays.AsInteger:=GetHolidayPayDays(tabCompany,tabEmployee,tabHolSlip,LastWeekYYYY);
  tabHolSlipHolidayPay.AsFloat:=GetHolidayPay(tabCompany,tabEmployee,tabHolSlip);
  //find the fullweeks and partweeks for the first half of 2004 and the payrate in the first half of the year DL041207
  {Christmas Bonus Removed DL051213 as not paid anymore.
  qryGetFullAndPartWeeks.Close;
  qryGetFullAndPartWeeks.ParamByName('ClkNo').AsInteger:=tabEmployee.FieldByName('ClkNo').AsInteger;
  qryGetFullAndPartWeeks.ParamByName('FromDate').AsString:='1-jan-2004';
  qryGetFullAndPartWeeks.ParamByName('ToDate').AsString:='30-jun-2004';
  qryGetFullAndPartWeeks.Open;
  if (qryGetFullAndPartWeeksFULLWEEK.AsFloat+qryGetFullAndPartWeeksPARTWEEK.AsFloat)=0 then
    tabHolSlipChristmasBonus.AsFloat:=0
  else
  begin
    qryGetLastPayRate.Close;
    qryGetLastPayRate.ParamByName('ClkNo').AsInteger:=tabEmployee.FieldByName('ClkNo').AsInteger;
    qryGetLastPayRate.Open;
    if qryGetLastPayRatePAYRATE.IsNull then
      tabHolSlipChristmasBonus.AsFloat:=
        GetChristmasBonus(
          tabCompany.FieldByName('NormalHRS').AsFloat,
          tabCompany.FieldByName('AnnualBonMin').AsFloat,
          tabEmployee.FieldByName('HRPayRate').AsFloat, //if no last pay rate use current payrate!
          //qryGetLastPayRatePAYRATE.AsFloat,
          tabEmployee.FieldByName('StartDate').AsDateTime,
          tabCompany.FieldByName('WeeksInYear').AsInteger,
          //tabEmployee.FieldByName('FullWK').AsInteger,
          //tabEmployee.FieldByName('PartWK').AsInteger,
          qryGetFullAndPartWeeksFULLWEEK.AsInteger,
          qryGetFullAndPartWeeksPARTWEEK.AsInteger,
          tabHolSlip.FieldByName('HolidayWeeks').AsInteger,
          NextWeekYYYY)
    else
      tabHolSlipChristmasBonus.AsFloat:=
        GetChristmasBonus(
          tabCompany.FieldByName('NormalHRS').AsFloat,
          tabCompany.FieldByName('AnnualBonMin').AsFloat,
          //tabEmployee.FieldByName('HRPayRate').AsFloat,
          qryGetLastPayRatePAYRATE.AsFloat,
          tabEmployee.FieldByName('StartDate').AsDateTime,
          tabCompany.FieldByName('WeeksInYear').AsInteger,
          //tabEmployee.FieldByName('FullWK').AsInteger,
          //tabEmployee.FieldByName('PartWK').AsInteger,
          qryGetFullAndPartWeeksFULLWEEK.AsInteger,
          qryGetFullAndPartWeeksPARTWEEK.AsInteger,
          tabHolSlip.FieldByName('HolidayWeeks').AsInteger,
          NextWeekYYYY);
  end;}
  tabHolSlipChristmasBonus.AsFloat:=0;
  //AnnualBonus calc added DL041207
  //find the fullweeks and partweeks for the second half of 2004 and the payrate in the first half of the year DL041207
  {removed DL051213
  qryGetFullAndPartWeeks.Close;
  qryGetFullAndPartWeeks.ParamByName('ClkNo').AsInteger:=tabEmployee.FieldByName('ClkNo').AsInteger;
  qryGetFullAndPartWeeks.ParamByName('FromDate').AsString:='1-jul-2004';
  qryGetFullAndPartWeeks.ParamByName('ToDate').AsString:='31-dec-2004';
  qryGetFullAndPartWeeks.Open;
  if (qryGetFullAndPartWeeksFULLWEEK.AsFloat+qryGetFullAndPartWeeksPARTWEEK.AsFloat)=0 then
    tabHolSlipChristmasBonus.AsFloat:=0
  else}
  tabHolSlipAnnualBonus.AsFloat:=0; //added :=0 DL111211
    (*GetAnnualBonus( - removed DL111211
      tabCompany.FieldByName('NormalHRS').AsFloat,
      tabEmployee.FieldByName('HRPayRate').AsFloat, //current pay rate
      tabCompany.FieldByName('WeeksInYear').AsInteger,
      tabEmployee.FieldByName('FullWK').AsInteger,
      tabEmployee.FieldByName('PartWK').AsInteger,
      ( *qryGetFullAndPartWeeksFULLWEEK.AsInteger, //remove in 2005
      qryGetFullAndPartWeeksPARTWEEK.AsInteger, //remove in 2005* )
      tabHolSlip.FieldByName('HolidayWeeks').AsInteger,
      tabCompany.FieldByName('AnnualBonusWeeks').AsFloat,
      tabEmployee.FieldByName('StartDate').AsDateTime, //added DL101212
      NextWeekYYYY); //added DL101212*)
  //old DL030303 tabHolSlipChristmasBonus.AsFloat:=GetChristmasBonus(tabCompany,tabEmployee,tabHolSlip,NextWeekYYYY);
  tabHolSlipServiceBonus.AsFloat:=0; //GetServiceBonus(tabCompany,tabEmployee,tabHolSlip,NextWeekYYYY); - modified DL051213
  //tabHolSlipSpecialBonus.AsFloat:=GetAttBonusPay(tabCompany,tabHolSlip,tabEmployee); entered

  // -- Rent allow pay -- //
  tabHolSlipRentAllowPay.AsFloat:=GetRentAllowPay(tabCompany,tabHolSlip,
    tabEmployee,LastWeekMM,NextWeekMM); //note: in the PKNormal this is ThisWeek

  tabHolSlipTaxEarnings.AsFloat:=tabHolSlipHolidayPay.AsFloat
    + tabHolSlipChristmasBonus.AsFloat + tabHolSlipServiceBonus.AsFloat
    + tabHolSlipSpecialBonus.AsFloat + tabHolSlipRentAllowPay.AsFloat
    + tabHolSlipAnnualBonus.AsFloat ;

  tabHolSlipSavingsPaid.AsFloat := tabEmployee.FieldByName('SAVEAC').AsFloat;
  tabHolSlipTotalEarnings.AsFloat := tabHolSlipTaxEarnings.AsFloat
    + tabEmployee.FieldByName('SAVEAC').AsFloat;

  tabHolSlipPENSIONDEDUCT.AsFloat:=
    GetPensionDeduct(tabCompany,tabEmployee,tabHolSlipThisWeek.AsDateTime,tabCompanyHolidayWeeks.AsInteger);
  tabHolSlipTAXDEDUCT.AsFloat:=GetTaxDeduct(tabCompany,tabEmployee,
    tabTaxConstants,qryTaxTable,
    tabHolSlipTaxEarnings.AsFloat,tabHolSlipPENSIONDEDUCT.AsFloat,
    tabHolSlipThisWeek.AsDateTime,tabCompanyHolidayWeeks.AsInteger);
  tabHolSlipUIFDEDUCT.AsFloat:=GetUIFDeduct(tabCompany,tabEmployee,tabHolSlip,tabHolSlipTaxEarnings.AsFloat); //TaxEarnings added DL020903
  tabHolSlipPROVFUNDDEDUCT.AsFloat:=GetProvFundDeduct(tabCompany,tabEmployee,tabCompanyHolidayWeeks.AsInteger);
  tabHolSlipCOUNCILDEDUCT.AsFloat:=GetCouncilDeduct(tabCompany,tabCompanyHolidayWeeks.AsInteger);
  tabHolSlipSICKFUNDDEDUCT.AsFloat:=GetSickFundDeduct(tabCompany,tabEmployee,tabCompanyHolidayWeeks.AsInteger);
  tabHolSlipINSURANCEDEDUCT.AsFloat:=GetInsuranceDeduct(tabCompany,tabEmployee,tabHolSlip,ThisWeekEnd,WeeksThisMonth,WeeksNextMonth,tabCompanyHolidayWeeks.AsInteger); //was GetInsuranceDeduct(tabEmployee,tabCompanyHolidayWeeks.AsInteger); DL060508
  tabHolSlipOTHER1DEDUCT.AsFloat:=GetOther1Deduct(tabCompany,tabEmployee,tabHolSlip,tabCompanyHolidayWeeks.AsInteger);

  //if there is a loan, it must be deducted in full
  tabHolSlipREPAYLOANPERWEEKDEDUCT.AsFloat:=tabEmployeeLOANAC.AsFloat;

  tabHolSlipABLESSREPAY.AsFloat:=GetABLoanDeduct(tabCompany,tabEmployee,tabHolSlip,ThisWeekEnd,WeeksThisMonth,WeeksNextMonth); //added DL161201
  tabHolSlipLAWYERDEDUCT.AsFloat:=GetLGLoanDeduct(tabCompany,tabEmployee,tabHolSlip,ThisWeekEnd,WeeksThisMonth,WeeksNextMonth,tabCompanyHolidayWeeks.AsInteger); //added DL040509;041207 - function call because must calculate weekly deduction
  tabHolSlipPFLESSREPAY.AsFloat:=GetPFLoanDeduct(tabCompany,tabEmployee,tabHolSlip,ThisWeekEnd,WeeksThisMonth,WeeksNextMonth); //added DL040509;041207

  tabHolSlipTOTALDEDUCT.AsFloat:=tabHolSlipPENSIONDEDUCT.AsFloat
   +tabHolSlipTAXDEDUCT.AsFloat+tabHolSlipUIFDEDUCT.AsFloat
   +tabHolSlipPROVFUNDDEDUCT.AsFloat+tabHolSlipCOUNCILDEDUCT.AsFloat
   +tabHolSlipSICKFUNDDEDUCT.AsFloat+
   +tabHolSlipINSURANCEDEDUCT.AsFloat+tabHolSlipOTHER1DEDUCT.AsFloat
   +tabHolSlipREPAYLOANPERWEEKDEDUCT.AsFloat
   +tabHolSlipABLESSREPAY.AsFloat //added DL161201
   +tabHolSlipPFLESSREPAY.AsFloat   //added DL090504;041207
   +tabHolSlipLAWYERDEDUCT.AsFloat; //added DL090504;041207

  //on next line GetRentRepay is LastWeek,NextWeek in pkHoliday
  tabHolSlipRENTREPAY.AsFloat:=GetRentRepay(tabEmployee,LastWeekMM, NextWeekMM); //in pkNormal ThisWeek, NextWeek

  //Full Weeks and PartWeeks not changed in Holiday Pay
  tabHolSlipFULLWEEKS.AsInteger:=tabEmployeeFULLWK.AsInteger;
  tabHolSlipPARTWEEKS.AsInteger:=tabEmployeePARTWK.AsInteger;

  tabHolSlipTOTALPAY.AsFloat:=tabHolSlipTotalEarnings.AsFloat
    - tabHolSlipTOTALDEDUCT.AsFloat;

  //tabHolSlipRENTACBALANCE.AsFloat:=0; - fixed DL111201
  tabHolSlipRENTACBALANCE.AsFloat:=tabEmployeeRENTAC.AsFloat
    - tabHolSlipRENTREPAY.AsFloat; // + tabHolSlipRENTDEDUCT.AsFloat; - no rent deduction in holiday pay, but still repayment

  tabHolSlipSAVEACBALANCE.AsFloat:=0;
  tabHolSlipLOANACBALANCE.AsFloat:=0;

  tabHolSlipABOLDBAL.AsFloat:=tabEmployeeABLOANAC.AsFloat;       //added DL161201
  tabHolSlipABNEWBAL.AsFloat:=tabHolSlipABOLDBAL.AsFloat         //added DL161201
    -tabHolSlipABLESSREPAY.AsFloat + tabHolSlipABADDNEW.AsFloat; //added DL161201
  tabHolSlipPFOLDBAL.AsFloat:=tabEmployeePFLOANAC.AsFloat;       //added DL040509;041207
  tabHolSlipPFNEWBAL.AsFloat:=tabHolSlipPFOLDBAL.AsFloat         //added DL040509;041207
    -tabHolSlipPFLESSREPAY.AsFloat + tabHolSlipPFADDNEW.AsFloat; //added DL040509;041207

  //handle negative pay loans: done in save employee info
  if tabHolSlipTotalPay.AsFloat < 0 then
    tabHolSlipNegPayLoan.AsFloat := -tabHolSlipTOTALPAY.AsFloat
  else
    tabHolSlipNegPayLoan.AsFloat := 0;
end;
                         //JT031298  prints current payslip or whole batch
procedure TfrmHolidayPay.PrintClick(Sender: TObject);
begin
  frmPrintHolSlip := TfrmPrintHolSlip.Create(Application);
  if Sender = btnPrintHolSlip then   //only print current payslip
  begin
    frmPrintHolSlip.qryHolSlip.Close;
    frmPrintHolSlip.qryHolSlip.ParamByName('FromClkNo').AsInteger:=
      qryViewData.FieldByName('ClkNo').AsInteger;
    frmPrintHolSlip.qryHolSlip.ParamByName('ToClkNo').AsInteger:=
      qryViewData.FieldByName('ClkNo').AsInteger;
  end
  else
  begin
    frmPrintHolSlip.qryHolSlip.Close;
    frmPrintHolSlip.qryHolSlip.ParamByName('FromClkNo').AsInteger:=1;
    frmPrintHolSlip.qryHolSlip.ParamByName('ToClkNo').AsInteger:=99999;
  end;
  frmPrintHolSlip.qryHolSlip.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
  if PayKind = pkHoliday then
    frmPrintHolSlip.qryHolSlip.ParamByName('PayKind').AsString:='HP'
  else  //don't print anything
    frmPrintHolSlip.qryHolSlip.ParamByName('PayKind').AsString:='XX';
  frmPrintHolSlip.qryHolSlip.Open;
  frmPrintHolSlip.qrpHolSlip.Preview;
  frmPrintHolSlip.qryHolSlip.Close;
end;

procedure TfrmHolidayPay.btnPrintReportsClick(Sender: TObject);
var
  YearNo,MonthNo,DayNo:word; //added 161201
  RptThisWeekMM,RptNextWeekMM:word; //added DL161201
  YY,DD:word; //added DL161201
  RptThisWeekEnd, RptNextWeekEnd:TDateTime; //added DL161201
begin
  if Batchmode then
  begin
    ShowMessage('You are still in batch mode. Post batch or Clear batch before you continue');
  end
  else
  begin
(*    qryClearDepSummary.Close;
    if not frmMain.Database.InTransaction then
      frmMain.Database.StartTransaction;
    qryClearDepSummary.ExecSQL;
    frmMain.Database.Commit;    *)
    //CopyToPaySummary; - done only once per batch when posting the batch
    frmPayReport := TfrmPayReport.Create(Application);
    frmPayReport.qryReport.Close;
    frmPayReport.qryReport.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
    frmPayReport.qryReport.ParamByName('PayKind').AsString:='HP';
    frmPayReport.qryReport.Open;
    frmPayReport.tabCompany.Open;
    frmPayReport.qrpReport.Preview;
    frmPayReport.qryReport.Close;
    frmPayReport.tabCompany.Close;

    //Print the Bank Account Payment Summary
    frmBankReport:=TfrmBankReport.Create(Application);
    frmBankReport.qryReport.Close;
    frmBankReport.qryReport.SQL.Clear;
    frmBankReport.qryReport.SQL.Add('select emp.surname,emp.firstname,emp.bankref,');
    frmBankReport.qryReport.SQL.Add('  emp.banksortcode,emp.bankaccref,emp.bankacctype,');
    frmBankReport.qryReport.SQL.Add('  ph.totalpay,ph.thisweek,ph.paykind');
    frmBankReport.qryReport.SQL.Add('from employee emp,holsliphist ph');
    frmBankReport.qryReport.SQL.Add('where emp.clkno=ph.clkno');
    frmBankReport.qryReport.SQL.Add('and ph.paykind=:paykind');
    frmBankReport.qryReport.SQL.Add('and ph.thisweek=:thisweek');
    frmBankReport.qryReport.SQL.Add('and ( ((emp.bankref>=:frombankref)');
    frmBankReport.qryReport.SQL.Add('  and (emp.bankref<=:tobankref))');
    frmBankReport.qryReport.SQL.Add('   or (emp.bankref=''9'') )');
    frmBankReport.qryReport.SQL.Add('and ph.totalpay>0');
    frmBankReport.qryReport.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
    frmBankReport.qryReport.ParamByName('PayKind').AsString:='HP';
    frmBankReport.qryReport.ParamByName('FromBankRef').AsString:='A';
    frmBankReport.qryReport.ParamByName('ToBankRef').AsString:='Z';
    frmBankReport.qrlFromBank.Caption:='A';
    frmBankReport.qrlToBank.Caption:='Z';
    frmBankReport.qryReport.Open;
    frmBankReport.tabCompany.Open;
    frmBankReport.qrpReport.Preview;
    frmBankReport.qryReport.Close;
    frmBankReport.tabCompany.Close;

    //Print the Rent Analysis if required
    //One way is to compare if the months are different
    //Another way is to see if there are any rent replayments this week
    //The second option works at the year end, but nothing is printed
    //if there are no rent deductions.
    qryCheckRent.Close;
    qryCheckRent.SQL.Clear;
    qryCheckRent.SQL.Add('select count(*) countrentrepay');
    qryCheckRent.SQL.Add('from holsliphist ph');
    qryCheckRent.SQL.Add('where ph.thisweek = :thisweek');
    qryCheckRent.SQL.Add('and ph.paykind = :paykind');
    qryCheckRent.SQL.Add('and ph.rentrepay>0');
    qryCheckRent.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
    qryCheckRent.ParamByName('PayKind').AsString:='HP';
    qryCheckRent.Open;
    if qryCheckRentCOUNTRENTREPAY.AsInteger>0 then
    begin
      frmRentReport:=TfrmRentReport.Create(Application);
      frmRentReport.qryReport.Close;
      frmRentReport.qryReport.SQL.Clear;
      frmRentReport.qryReport.SQL.Add('select emp.surname,emp.firstname,');
      frmRentReport.qryReport.SQL.Add('  emp.street,emp.suburb,emp.postcode,');
      frmRentReport.qryReport.SQL.Add('  emp.rentacno,ph.rentrepay,');
      frmRentReport.qryReport.SQL.Add('  ph.thisweek,ph.paykind,emp.clkno');
      frmRentReport.qryReport.SQL.Add('from employee emp,holsliphist ph');
      frmRentReport.qryReport.SQL.Add('where emp.clkno=ph.clkno');
      frmRentReport.qryReport.SQL.Add('and ph.paykind=:paykind');
      frmRentReport.qryReport.SQL.Add('and ph.thisweek=:thisweek');
      frmRentReport.qryReport.SQL.Add('and ph.rentrepay>0');
      frmRentReport.qryReport.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
      frmRentReport.qryReport.ParamByName('PayKind').AsString:='HP';
      frmRentReport.qryReport.Open;
      frmRentReport.tabCompany.Open;
      frmRentReport.qrpReport.Preview;
      frmRentReport.qryReport.Close;
      frmRentReport.tabCompany.Close;
    end;

    //African Bank Weekly Report added DL050201 - added here 161201
    //Print the African Bank Weekly Loan Repayment Report if required
    //One way is to compare if the months are different
    //Another way is to see if there are any rent repayments this week
    //The second option works at the year end, but nothing is printed
    //if there are no rent deductions.
    qryCheckABRepayment.Close;
    qryCheckABRepayment.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
    qryCheckABRepayment.ParamByName('PayKind').AsString:='HP';
    qryCheckABRepayment.Open;
    if qryCheckABRepaymentCOUNTABLESSREPAY.AsInteger>0 then
    begin
      frmABLoanWklyReport:=TfrmABLoanWklyReport.Create(Application);
      frmABLoanWklyReport.qryReport.Close;
      frmABLoanWklyReport.qryReport.SQL.Clear;
      frmABLoanWklyReport.qryReport.SQL.Add('select emp.surname,emp.firstname,');
      frmABLoanWklyReport.qryReport.SQL.Add('  emp.street,emp.suburb,emp.postcode,');
      frmABLoanWklyReport.qryReport.SQL.Add('  emp.abloanaccno,emp.abloanstartvalue,');
      frmABLoanWklyReport.qryReport.SQL.Add('  emp.abloanac,emp.abrepaylnmonth,emp.abrepayterm,');
      frmABLoanWklyReport.qryReport.SQL.Add('  ph.aboldbal,ph.ablessrepay,ph.abaddnew,ph.abnewbal,');
      frmABLoanWklyReport.qryReport.SQL.Add('  ph.thisweek,ph.paykind,emp.clkno');
      frmABLoanWklyReport.qryReport.SQL.Add('from employee emp,holsliphist ph');
      frmABLoanWklyReport.qryReport.SQL.Add('where emp.clkno=ph.clkno');
      frmABLoanWklyReport.qryReport.SQL.Add('and ph.paykind=:paykind');
      frmABLoanWklyReport.qryReport.SQL.Add('and ph.thisweek=:thisweek');
      frmABLoanWklyReport.qryReport.SQL.Add('and ph.ablessrepay>0');
      frmABLoanWklyReport.qryReport.SQL.Add('order by emp.clkno');
      frmABLoanWklyReport.qryReport.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
      frmABLoanWklyReport.qryReport.ParamByName('PayKind').AsString:='HP';
      frmABLoanWklyReport.qryReport.Open;
      frmABLoanWklyReport.tabCompany.Open;
      frmABLoanWklyReport.qrpReport.Preview;
      frmABLoanWklyReport.qryReport.Close;
      frmABLoanWklyReport.tabCompany.Close;
    end;

    //African Bank Monthly Report added DL050201 - added here 161201
    //Print the African Bank Weekly Loan Repayment Report if required
    //DL260401: note that thisweekmm and nextweekmm must be calculated
    //differently because these reports are printed outside the batch
    RptThisWeekEnd:=DisplayWeek;
    RptNextWeekEnd:=DisplayWeek+tabCompanyHOLIDAYWEEKS.AsInteger; //tabCompanyHOLIDAYWEEKS added here DL161201
    DecodeDate(RptThisWeekEnd, YY, RptThisWeekMM, DD);
    DecodeDate(RptNextWeekEnd, YY, RptNextWeekMM, DD);

    //if RptThisWeekMM <> RptNextWeekMM then
    //begin
      DecodeDate(DisplayWeek, YearNo, MonthNo, DayNo); //DisplayWeek was ThisWeekEnd DL030501
      YearNo:=YearNo-1; //this only works assuming that the y/e is December
      MonthNo:=12; //this only works assuming that the y/e is December
      frmABLoanMonthlyReport:=TfrmABLoanMonthlyReport.Create(Application);
      frmABLoanMonthlyReport.qryReport.Close;
      frmABLoanMonthlyReport.qryReport.SQL.Clear;
      frmABLoanMonthlyReport.qryReport.SQL.Add('select emp.clkno,emp.surname,emp.firstname,');
      frmABLoanMonthlyReport.qryReport.SQL.Add('  emp.abloanaccno,emp.abloanstartvalue,');
      frmABLoanMonthlyReport.qryReport.SQL.Add('  emp.abloanac,emp.abrepaylnmonth,');
      frmABLoanMonthlyReport.qryReport.SQL.Add('  emp.abrepayterm,');
      frmABLoanMonthlyReport.qryReport.SQL.Add('  ph.aboldbal,ph.thisweek,ph.paykind,');
      frmABLoanMonthlyReport.qryReport.SQL.Add('  (sum(ph2.ablessrepay)+hh.ablessrepay) ablessrepay,');
      frmABLoanMonthlyReport.qryReport.SQL.Add('  (ph.aboldbal-sum(ph2.ablessrepay)-hh.ablessrepay) endofmonthbal');
      //? next line paysliphist or holsliphist!!
      frmABLoanMonthlyReport.qryReport.SQL.Add('from employee emp,paysliphist ph,paysliphist ph2,weeksinmonth wim, holsliphist hh');
      frmABLoanMonthlyReport.qryReport.SQL.Add('where ph.thisweek=');
      frmABLoanMonthlyReport.qryReport.SQL.Add('(');
      frmABLoanMonthlyReport.qryReport.SQL.Add('select wi.fromwagesweekend');
      frmABLoanMonthlyReport.qryReport.SQL.Add('from weeksinmonth wi');
      frmABLoanMonthlyReport.qryReport.SQL.Add('where wi.yearno=:yearno');
      frmABLoanMonthlyReport.qryReport.SQL.Add('and wi.monthno=:monthno');
      frmABLoanMonthlyReport.qryReport.SQL.Add(')');
      frmABLoanMonthlyReport.qryReport.SQL.Add('and ph.aboldbal<>0');
      frmABLoanMonthlyReport.qryReport.SQL.Add('and emp.clkno=ph.clkno');
      frmABLoanMonthlyReport.qryReport.SQL.Add('and ph.clkno=ph2.clkno');
      frmABLoanMonthlyReport.qryReport.SQL.Add('and ph.paykind=ph2.paykind');
      frmABLoanMonthlyReport.qryReport.SQL.Add('and wim.yearno=:yearno');
      frmABLoanMonthlyReport.qryReport.SQL.Add('and wim.monthno=:monthno');
      frmABLoanMonthlyReport.qryReport.SQL.Add('and ph2.thisweek between wim.fromwagesweekend and wim.towagesweekend');
      frmABLoanMonthlyReport.qryReport.SQL.Add('and emp.clkno=hh.clkno');
      //frmABLoanMonthlyReport.qryReport.SQL.Add('and hh.thisweek=''9-jan-2005'''); //xx to be fixed based on finding the first record in the year in holsliphist - removed DL051213
      //modified DL051213
      frmABLoanMonthlyReport.qryReport.SQL.Add('and hh.thisweek=');
      frmABLoanMonthlyReport.qryReport.SQL.Add('(');
      frmABLoanMonthlyReport.qryReport.SQL.Add(' select min(thisweek)');
      frmABLoanMonthlyReport.qryReport.SQL.Add(' from holsliphist');
      frmABLoanMonthlyReport.qryReport.SQL.Add(' where thisweek>:LastDateofYear'); //'1-jan-2005'
      frmABLoanMonthlyReport.qryReport.SQL.Add(')');
      frmABLoanMonthlyReport.qryReport.SQL.Add('group by emp.clkno,emp.surname,emp.firstname,');
      frmABLoanMonthlyReport.qryReport.SQL.Add('  emp.abloanaccno,emp.abloanstartvalue,');
      frmABLoanMonthlyReport.qryReport.SQL.Add('  emp.abloanac,emp.abrepaylnmonth,');
      frmABLoanMonthlyReport.qryReport.SQL.Add('  emp.abrepayterm,');
      frmABLoanMonthlyReport.qryReport.SQL.Add('  ph.aboldbal,ph.thisweek,ph.paykind,hh.ablessrepay');
      frmABLoanMonthlyReport.qryReport.SQL.Add('order by emp.clkno');
      frmABLoanMonthlyReport.qrlYearMonth.Caption:='Year / Month: '+
        inttostr(YearNo) + ' / '+
        inttostr(MonthNo);
      frmABLoanMonthlyReport.qryReport.ParamByName('YearNo').AsInteger:=YearNo;
      frmABLoanMonthlyReport.qryReport.ParamByName('MonthNo').AsInteger:=MonthNo;
      frmABLoanMonthlyReport.qryReport.ParamByName('LastDateofYear').AsDateTime:=LastDateofYear;
      frmABLoanMonthlyReport.qryReport.Open;
      frmABLoanMonthlyReport.tabCompany.Open;
      frmABLoanMonthlyReport.qrpReport.Preview;
      frmABLoanMonthlyReport.qryReport.Close;
      frmABLoanMonthlyReport.tabCompany.Close;
    //end;

    //Provident Fund Weekly Report added DL040509; 041207
    //Print the Provident Fund Weekly Loan Repayment Report if required
    //One way is to compare if the months are different
    qryCheckPFRepayment.Close;
    qryCheckPFRepayment.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
    qryCheckPFRepayment.ParamByName('PayKind').AsString:='HP';
    qryCheckPFRepayment.Open;
    if qryCheckPFRepaymentCOUNTPFLESSREPAY.AsInteger>0 then
    begin
      frmPFLoanWklyReport:=TfrmPFLoanWklyReport.Create(Application);
      frmPFLoanWklyReport.qryReport.Close;
      frmPFLoanWklyReport.qryReport.SQL.Clear;
      frmPFLoanWklyReport.qryReport.SQL.Add('select emp.surname,emp.firstname,');
      frmPFLoanWklyReport.qryReport.SQL.Add('  emp.street,emp.suburb,emp.postcode,');
      frmPFLoanWklyReport.qryReport.SQL.Add('  emp.PFloanaccno,emp.PFloanstartvalue,');
      frmPFLoanWklyReport.qryReport.SQL.Add('  emp.PFloanac,emp.PFrepaylnmonth,emp.PFrepayterm,');
      frmPFLoanWklyReport.qryReport.SQL.Add('  ph.PFoldbal,ph.PFlessrepay,ph.PFaddnew,ph.PFnewbal,');
      frmPFLoanWklyReport.qryReport.SQL.Add('  ph.thisweek,ph.paykind,emp.clkno');
      frmPFLoanWklyReport.qryReport.SQL.Add('from employee emp,holsliphist ph');
      frmPFLoanWklyReport.qryReport.SQL.Add('where emp.clkno=ph.clkno');
      frmPFLoanWklyReport.qryReport.SQL.Add('and ph.paykind=:paykind');
      frmPFLoanWklyReport.qryReport.SQL.Add('and ph.thisweek=:thisweek');
      frmPFLoanWklyReport.qryReport.SQL.Add('and ph.PFlessrepay>0');
      frmPFLoanWklyReport.qryReport.SQL.Add('order by emp.clkno');
      frmPFLoanWklyReport.qryReport.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
      frmPFLoanWklyReport.qryReport.ParamByName('PayKind').AsString:='HP';
      frmPFLoanWklyReport.qryReport.Open;
      frmPFLoanWklyReport.tabCompany.Open;
      frmPFLoanWklyReport.qrpReport.Preview;
      frmPFLoanWklyReport.qryReport.Close;
      frmPFLoanWklyReport.tabCompany.Close;
    end; //Provident Fund Weekly Report

    //Provident Fund Monthly Report added DL040509; 041207
    //Print the Provident Fund Loan Repayment Report if required
    //note that thisweekmm and nextweekmm must be calculated
    //differently because these reports are printed outside the batch
    RptThisWeekEnd:=DisplayWeek;
    RptNextWeekEnd:=DisplayWeek+tabCompanyHOLIDAYWEEKS.AsInteger;
    DecodeDate(RptThisWeekEnd, YY, RptThisWeekMM, DD);
    DecodeDate(RptNextWeekEnd, YY, RptNextWeekMM, DD);
    //if RptThisWeekMM <> RptNextWeekMM then
    //begin
      //fetch min fromweekend: added DL030303 bec. doesn't work in January due
      // to annual year end
      DecodeDate(DisplayWeek, YearNo, MonthNo, DayNo); //DisplayWeek was ThisWeekEnd DL030501
      YearNo:=YearNo-1; //this only works assuming that the y/e is December
      MonthNo:=12; //this only works assuming that the y/e is December
      frmPFLoanMonthlyReport:=TfrmPFLoanMonthlyReport.Create(Application);
      frmPFLoanMonthlyReport.qryReport.Close;
      frmPFLoanMonthlyReport.qryReport.SQL.Clear;
      frmPFLoanMonthlyReport.qryReport.SQL.Add('select emp.clkno,emp.surname,emp.firstname,');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('  emp.PFloanaccno,emp.PFloanstartvalue,');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('  emp.PFloanac,emp.PFrepaylnmonth,');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('  emp.PFrepayterm,');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('  ph.PFoldbal,ph.thisweek,ph.paykind,');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('  (sum(ph2.PFlessrepay)+hh.pflessrepay) PFlessrepay,');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('  (ph.PFoldbal-sum(ph2.PFlessrepay)-hh.pflessrepay) endofmonthbal');
      //? next line paysliphist or holsliphist!!
      frmPFLoanMonthlyReport.qryReport.SQL.Add('from employee emp,paysliphist ph,paysliphist ph2,weeksinmonth wim, holsliphist hh');
      //frmPFLoanMonthlyReport.qryReport.SQL.Add('where ph.thisweek=:firstweekinmonth'); //added parameter DL030303
      frmPFLoanMonthlyReport.qryReport.SQL.Add('where ph.thisweek=');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('(');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('select wi.fromwagesweekend');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('from weeksinmonth wi');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('where wi.yearno=:yearno');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('and wi.monthno=:monthno');
      frmPFLoanMonthlyReport.qryReport.SQL.Add(')');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('and ph.PFoldbal<>0');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('and emp.clkno=ph.clkno');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('and ph.clkno=ph2.clkno');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('and ph.paykind=ph2.paykind');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('and wim.yearno=:yearno');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('and wim.monthno=:monthno');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('and ph2.thisweek between wim.fromwagesweekend and wim.towagesweekend');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('and emp.clkno=hh.clkno');
      //frmPFLoanMonthlyReport.qryReport.SQL.Add('and hh.thisweek=''9-jan-2005'''); //xx to be fixed based on finding the first record in the year in holsliphist - removed DL051213
      //modified DL051213
      frmABLoanMonthlyReport.qryReport.SQL.Add('and hh.thisweek=');
      frmABLoanMonthlyReport.qryReport.SQL.Add('(');
      frmABLoanMonthlyReport.qryReport.SQL.Add(' select min(thisweek)');
      frmABLoanMonthlyReport.qryReport.SQL.Add(' from holsliphist');
      frmABLoanMonthlyReport.qryReport.SQL.Add(' where thisweek>:LastDateofYear'); //'1-jan-2005'
      frmABLoanMonthlyReport.qryReport.SQL.Add(')');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('group by emp.clkno,emp.surname,emp.firstname,');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('  emp.PFloanaccno,emp.PFloanstartvalue,');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('  emp.PFloanac,emp.PFrepaylnmonth,');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('  emp.PFrepayterm,');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('  ph.PFoldbal,ph.thisweek,ph.paykind,hh.pflessrepay');
      frmPFLoanMonthlyReport.qryReport.SQL.Add('order by emp.clkno');
      frmPFLoanMonthlyReport.qrlYearMonth.Caption:='Year / Month: '+
        inttostr(YearNo) + ' / '+
        inttostr(MonthNo);
      frmPFLoanMonthlyReport.qryReport.ParamByName('YearNo').AsInteger:=YearNo;
      frmPFLoanMonthlyReport.qryReport.ParamByName('MonthNo').AsInteger:=MonthNo;
      //frmPFLoanMonthlyReport.qryReport.ParamByName('FirstWeekInMonth').AsDateTime:=
      //  qryFetchPFMinWeekFIRSTWEEKINMONTH.AsDateTime;
      frmPFLoanMonthlyReport.qryReport.Open;
      frmPFLoanMonthlyReport.tabCompany.Open;
      frmPFLoanMonthlyReport.qrpReport.Preview;
      frmPFLoanMonthlyReport.qryReport.Close;
      frmPFLoanMonthlyReport.tabCompany.Close;
      qryFetchPFMinWeek.Close;
    //end; //Provident Fund Monthly Report

  end;
end;

procedure TfrmHolidayPay.popFindMenuPopup(Sender: TObject);
begin
  if not dbnEmployee.Enabled then
    Abort;
  if popFindMenu.PopupComponent = edtEmployeeFullName then
    popFindMenu.DataField := 'ClkNo';
end;

procedure TfrmHolidayPay.cbDatesChange(Sender: TObject);
begin
  //this can only happen in view mode
  //displayweek is only used in view mode
  if cbDates.ItemIndex > -1 then
  begin
    DisplayWeek := StrToDate(cbDates.Text);
    qryViewData.Close;

    qryViewEmployee.Close;
    qryViewEmployee.ParamByName('ThisWeek').AsDateTime := StrToDate(cbDates.Text);
    qryViewEmployee.ParamByName('PayKind').AsString:='HP';
    qryViewEmployee.Open; //xxx

    if BatchMode then //xxx
      qryViewData.ParamByName('ClkNo').AsInteger := tabEmployeeCLKNO.AsInteger
    else
      qryViewData.ParamByName('ClkNo').AsInteger := qryViewEmployeeCLKNO.AsInteger;
    qryViewData.ParamByName('ThisWeek').AsDateTime := DisplayWeek;
    qryViewData.ParamByName('PayKind').AsString:='HP';
    qryViewData.Open;
  end;
end;

procedure TfrmHolidayPay.udDatesClick(Sender: TObject;
  Button: TUDBtnType);
begin
  if Button = btNext  then
  begin
    if cbDates.ItemIndex > 0 then
      cbDates.ItemIndex := cbDates.ItemIndex - 1
  end
  else
  begin
    cbDates.ItemIndex := cbDates.ItemIndex + 1;
  end;
  cbDatesChange(nil);
end;

procedure TfrmHolidayPay.edtEmployeeFullNameChange(Sender: TObject);
begin
  if cbDates.Visible then
  begin
    if cbDates.ItemIndex > -1 then
    begin
      if not BatchMode then
      begin
        qryViewData.Close;
        if BatchMode then //xxx
          qryViewData.ParamByName('ClkNo').AsInteger := tabEmployeeCLKNO.AsInteger
        else
          qryViewData.ParamByName('ClkNo').AsInteger := qryViewEmployeeCLKNO.AsInteger;
//        qryViewData.ParamByName('ClkNo').AsInteger := tabEmployeeCLKNO.AsInteger;
        qryViewData.ParamByName('ThisWeek').AsDateTime := StrToDate(cbDates.Text);
        qryViewData.ParamByName('PayKind').AsString:='HP';
        qryViewData.Open;
      end;
    end;
    {else
    begin
      Close;
    end;}
  end;
end;

procedure TfrmHolidayPay.tabHolSlipAfterPost(DataSet: TDataSet);
begin
  if not CreatingBatch then
    frmMain.Database.Commit;
end;

procedure TfrmHolidayPay.tabHolSlipAfterCancel(DataSet: TDataSet);
begin
  if not CreatingBatch then
    frmMain.Database.Rollback;
end;

procedure TfrmHolidayPay.Coinage(PSP:double);
var
  Hundreds,Fifties,Twenties,Tens, { Tens rand notes: Total eg R270. }
  Fives, Twos, Ones, FiftyC, TwentyC, TenC, FiveC, TwoC, OneC : double;
  RoundAmount:double; //added DL151199
begin
  RoundAmount:=0.000001; //added DL151199
  Hundreds := 0; Fifties := 0; Twenties := 0;
  Tens := 0; Fives := 0; Twos := 0; Ones := 0;
  FiftyC := 0; TwentyC := 0; TenC := 0; FiveC := 0; TwoC := 0; OneC := 0;
  //can put an algorithm here to only give hundreds if payment over a certain
  //amount.  Note that there are also Two Hundred rand notes.
  Hundreds := int((PSP/100)+RoundAmount)*100;
  Fifties := int(((PSP-Hundreds)/50)+RoundAmount)*50;
  Twenties := int(((PSP-Hundreds-Fifties)/20)+RoundAmount)*20;
  Tens := int(((PSP-Hundreds-Fifties-Twenties)/10)+RoundAmount)*10;
  Fives := int(((PSP-Hundreds-Fifties-Twenties-Tens)/5)+RoundAmount)*5;
  Twos := int(((PSP-Hundreds-Fifties-Twenties-Tens-Fives)/2)+RoundAmount)*2;
  Ones := int((PSP-Hundreds-Fifties-Twenties-Tens-Fives-Twos)+RoundAmount);
  FiftyC := int(((PSP-int(PSP))*2)+RoundAmount)*0.5;
  TwentyC := int(((PSP-int(PSP)-FiftyC)*5)+RoundAmount)*0.2;
  TenC := int(((PSP-int(PSP)-FiftyC-TwentyC)*10)+RoundAmount)*0.1;
  FiveC := int(((PSP-int(PSP)-FiftyC-TwentyC-TenC)*20)+RoundAmount)*0.05;
  TwoC := int(((PSP-int(PSP)-FiftyC-TwentyC-TenC-FiveC)*50)+RoundAmount)*0.02;
  OneC := int(((PSP-int(PSP)-FiftyC-TwentyC-TenC-FiveC-TwoC)*100)+RoundAmount)*0.01;
  THundreds := THundreds+Hundreds; TFifties:=TFifties+Fifties;
  TTwenties := TTwenties+Twenties;
  TTens := TTens+Tens; TFives := TFives+Fives; TTwos := TTwos+Twos;
  TOnes := TOnes+Ones; TFiftyC := TFiftyC+FiftyC;
  TTwentyC := TTwentyC+TwentyC; TTenC := TTenC+TenC; TFiveC := TFiveC+FiveC;
  TTwoC := TTwoC+TwoC; TOneC := TOneC+OneC;
end;

end.

