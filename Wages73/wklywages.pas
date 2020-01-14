unit wklywages;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ComCtrls, ExtCtrls, Db, DBTables, Buttons, Mask, Printers,
  Menus, ODDBFind, ODPopCal, ODDBCal, XLSDbRead4, XLSReadWriteII4; //plus XLS!!!

type
  TfrmWeeklyWages = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    edtEmployeeFullName: TEdit;
    dbnEmployee: TDBNavigator;
    tabPaySlip: TTable;
    datPaySlip: TDataSource;
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
    tabEmployeeBANKSORTCODE: TStringField;
    tabEmployeeBANKACCREF: TStringField;
    tabEmployeeBANKACCTYPE: TStringField;
    tabCompany: TTable;
    pgeWeeklyWages: TPageControl;
    tshPayslipEntry: TTabSheet;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtNormalHH: TDBEdit;
    edtNormalMM: TDBEdit;
    edtOT13HH: TDBEdit;
    edtOT13MM: TDBEdit;
    edtOT12HH: TDBEdit;
    edtOT12MM: TDBEdit;
    edtOTX2HH: TDBEdit;
    edtOTX2MM: TDBEdit;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    edtAttDays: TDBEdit;
    edtLeavePayDays: TDBEdit;
    edtSickPayDays: TDBEdit;
    GroupBox2: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edtMedAid: TDBEdit;
    edtOther1: TDBEdit;
    edtOther2: TDBEdit;
    gbxAdditions: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label21: TLabel;
    edtProdBonus: TDBEdit;
    edtNightShiftAllow: TDBEdit;
    edtLoanGiven: TDBEdit;
    edtSavingsPaidOut: TDBEdit;
    shwSaveAC: TDBEdit;
    edtRepayLnWk: TDBEdit;
    shwLoanAC: TDBEdit;
    tshPaySlip: TTabSheet;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Panel2: TPanel;
    btnCreateBatch: TButton;
    btnPrintBatch: TButton;
    btnPrintPaySlip: TButton;
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
    Label29: TLabel;
    DBEdit5: TDBEdit;
    Label30: TLabel;
    DBEdit6: TDBEdit;
    Label31: TLabel;
    DBEdit7: TDBEdit;
    Label32: TLabel;
    DBEdit8: TDBEdit;
    Label33: TLabel;
    DBEdit9: TDBEdit;
    Label34: TLabel;
    DBEdit10: TDBEdit;
    Label35: TLabel;
    DBEdit11: TDBEdit;
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
    Label44: TLabel;
    DBEdit20: TDBEdit;
    Label45: TLabel;
    DBEdit21: TDBEdit;
    Label46: TLabel;
    edtOther2Deduct: TDBEdit;
    Label47: TLabel;
    DBEdit23: TDBEdit;
    Label48: TLabel;
    DBEdit24: TDBEdit;
    Label49: TLabel;
    DBEdit25: TDBEdit;
    tabCompanyATAXYEAR: TIntegerField;
    Label50: TLabel;
    DBEdit26: TDBEdit;
    shwSavingsPerWeek: TDBEdit;
    Label52: TLabel;
    edtTotalDeduct: TDBEdit;
    Label53: TLabel;
    DBEdit28: TDBEdit;
    Label54: TLabel;
    edtRentRepay: TDBEdit;
    Label55: TLabel;
    DBEdit30: TDBEdit;
    Label56: TLabel;
    DBEdit31: TDBEdit;
    Label57: TLabel;
    DBEdit32: TDBEdit;
    Label58: TLabel;
    DBEdit33: TDBEdit;
    Label59: TLabel;
    DBEdit34: TDBEdit;
    Label60: TLabel;
    DBEdit35: TDBEdit;
    qrySickFundTable: TQuery;
    dbnPaySlip: TDBNavigator;
    PrintDialog1: TPrintDialog;
    qryPostBatch: TQuery;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    popFindMenu: TODFindMenu;
    tabPaySlipSummary: TTable;
    qryDepartmental: TQuery;
    qryPaymentTotals: TQuery;
    qryInsertOneRow: TQuery;
    tabDeptSummary: TTable;
    tabEmployeeDEPREF: TStringField;
    qryPaySlipHistInsert: TQuery;
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
    tabPaySlipCLKNO: TIntegerField;
    tabPaySlipTHISWEEK: TDateTimeField;
    tabPaySlipNORMALHH: TIntegerField;
    tabPaySlipNORMALMM: TIntegerField;
    tabPaySlipOT13HH: TIntegerField;
    tabPaySlipOT13MM: TIntegerField;
    tabPaySlipOT12HH: TIntegerField;
    tabPaySlipOT12MM: TIntegerField;
    tabPaySlipOTX2HH: TIntegerField;
    tabPaySlipOTX2MM: TIntegerField;
    tabPaySlipATTDAYS: TIntegerField;
    tabPaySlipLEAVEPAYDAYS: TIntegerField;
    tabPaySlipSICKPAYDAYS: TIntegerField;
    tabPaySlipPRODBONUS: TFloatField;
    tabPaySlipNIGHTSHIFTALLOW: TFloatField;
    tabPaySlipSAVINGSPAID: TFloatField;
    tabPaySlipLOANGIVEN: TFloatField;
    tabPaySlipLOANREPAYRATE: TFloatField;
    tabPaySlipMEDAID: TFloatField;
    tabPaySlipOTHER2: TFloatField;
    tabPaySlipOTHER1: TFloatField;
    tabPaySlipPOSTED: TStringField;
    tabPaySlipNORMALPAY: TFloatField;
    tabPaySlipOT13PAY: TFloatField;
    tabPaySlipOT12PAY: TFloatField;
    tabPaySlipOTX2PAY: TFloatField;
    tabPaySlipATTBONUSPAY: TFloatField;
    tabPaySlipPRODBONUSPAY: TFloatField;
    tabPaySlipNIGHTSHIFTPAY: TFloatField;
    tabPaySlipLEAVEPAY: TFloatField;
    tabPaySlipRENTALLOWPAY: TFloatField;
    tabPaySlipPENSIONDEDUCT: TFloatField;
    tabPaySlipTAXDEDUCT: TFloatField;
    tabPaySlipUIFDEDUCT: TFloatField;
    tabPaySlipPROVFUNDDEDUCT: TFloatField;
    tabPaySlipCOUNCILDEDUCT: TFloatField;
    tabPaySlipSICKFUNDDEDUCT: TFloatField;
    tabPaySlipMEDAIDDEDUCT: TFloatField;
    tabPaySlipOTHER1DEDUCT: TFloatField;
    tabPaySlipOTHER2DEDUCT: TFloatField;
    tabPaySlipRENTDEDUCT: TFloatField;
    tabPaySlipSAVINGSPERWEEKDEDUCT: TFloatField;
    tabPaySlipREPAYLOANPERWEEKDEDUCT: TFloatField;
    tabPaySlipRENTACBALANCE: TFloatField;
    tabPaySlipRENTREPAY: TFloatField;
    tabPaySlipSAVEACBALANCE: TFloatField;
    tabPaySlipLOANACBALANCE: TFloatField;
    tabPaySlipFULLWEEK: TFloatField;
    tabPaySlipPARTWEEK: TFloatField;
    tabPaySlipSICKFUNDPAY: TFloatField;
    tabPaySlipTAXEARNINGS: TFloatField;
    tabPaySlipTOTALEARNINGS: TFloatField;
    tabPaySlipTOTALDEDUCT: TFloatField;
    tabPaySlipTOTALPAY: TFloatField;
    tabPaySlipINSURANCEDEDUCT: TFloatField;
    tabPaySlipLEAVEDAYS: TFloatField;
    tabPaySlipSICKDAYS: TFloatField;
    tabPaySlipFULLWEEKS: TFloatField;
    tabPaySlipPARTWEEKS: TFloatField;
    tabPaySlipNEGPAYLOAN: TFloatField;
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
    qryPaymentTotalsMEDAIDDEDUCT: TFloatField;
    qryPaymentTotalsINSURANCEDEDUCT: TFloatField;
    qryPaymentTotalsOTHER1DEDUCT: TFloatField;
    qryPaymentTotalsOTHER2DEDUCT: TFloatField;
    qryPaymentTotalsRENTDEDUCT: TFloatField;
    qryPaymentTotalsSAVINGSDEDUCT: TFloatField;
    qryPaymentTotalsREPAYLNDEDUCT: TFloatField;
    qryPaymentTotalsLOANGIVEN: TFloatField;
    qryPaymentTotalsNEGPAYLOAN: TFloatField;
    qryPaymentTotalsSICKFUNDPAY: TFloatField;
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
    qryViewDataCLKNO: TIntegerField;
    qryViewDataTHISWEEK: TDateTimeField;
    qryViewDataNORMALHH: TIntegerField;
    qryViewDataNORMALMM: TIntegerField;
    qryViewDataOT13HH: TIntegerField;
    qryViewDataOT13MM: TIntegerField;
    qryViewDataOT12HH: TIntegerField;
    qryViewDataOT12MM: TIntegerField;
    qryViewDataOTX2HH: TIntegerField;
    qryViewDataOTX2MM: TIntegerField;
    qryViewDataATTDAYS: TIntegerField;
    qryViewDataLEAVEPAYDAYS: TIntegerField;
    qryViewDataSICKPAYDAYS: TIntegerField;
    qryViewDataPRODBONUS: TFloatField;
    qryViewDataNIGHTSHIFTALLOW: TFloatField;
    qryViewDataSAVINGSPAID: TFloatField;
    qryViewDataLOANGIVEN: TFloatField;
    qryViewDataLOANREPAYRATE: TFloatField;
    qryViewDataMEDAID: TFloatField;
    qryViewDataOTHER2: TFloatField;
    qryViewDataOTHER1: TFloatField;
    qryViewDataPOSTED: TStringField;
    qryViewDataNORMALPAY: TFloatField;
    qryViewDataOT13PAY: TFloatField;
    qryViewDataOT12PAY: TFloatField;
    qryViewDataOTX2PAY: TFloatField;
    qryViewDataATTBONUSPAY: TFloatField;
    qryViewDataPRODBONUSPAY: TFloatField;
    qryViewDataNIGHTSHIFTPAY: TFloatField;
    qryViewDataLEAVEPAY: TFloatField;
    qryViewDataRENTALLOWPAY: TFloatField;
    qryViewDataPENSIONDEDUCT: TFloatField;
    qryViewDataTAXDEDUCT: TFloatField;
    qryViewDataUIFDEDUCT: TFloatField;
    qryViewDataPROVFUNDDEDUCT: TFloatField;
    qryViewDataCOUNCILDEDUCT: TFloatField;
    qryViewDataSICKFUNDDEDUCT: TFloatField;
    qryViewDataMEDAIDDEDUCT: TFloatField;
    qryViewDataOTHER1DEDUCT: TFloatField;
    qryViewDataOTHER2DEDUCT: TFloatField;
    qryViewDataRENTDEDUCT: TFloatField;
    qryViewDataSAVINGSPERWEEKDEDUCT: TFloatField;
    qryViewDataREPAYLOANPERWEEKDEDUCT: TFloatField;
    qryViewDataRENTACBALANCE: TFloatField;
    qryViewDataRENTREPAY: TFloatField;
    qryViewDataSAVEACBALANCE: TFloatField;
    qryViewDataLOANACBALANCE: TFloatField;
    qryViewDataFULLWEEK: TFloatField;
    qryViewDataPARTWEEK: TFloatField;
    qryViewDataSICKFUNDPAY: TFloatField;
    qryViewDataTAXEARNINGS: TFloatField;
    qryViewDataTOTALEARNINGS: TFloatField;
    qryViewDataTOTALDEDUCT: TFloatField;
    qryViewDataTOTALPAY: TFloatField;
    qryViewDataINSURANCEDEDUCT: TFloatField;
    qryViewDataLEAVEDAYS: TFloatField;
    qryViewDataSICKDAYS: TFloatField;
    qryViewDataFULLWEEKS: TFloatField;
    qryViewDataPARTWEEKS: TFloatField;
    qryViewDataNEGPAYLOAN: TFloatField;
    tabPaySlipPAYKIND: TStringField;
    tabPaySlipDISCHARGEDATE: TDateTimeField;
    tabCompanyPAYKIND: TStringField;
    qryViewDataPAYKIND: TStringField;
    qryViewDataDISCHARGEDATE: TDateTimeField;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblDischargeDate: TLabel;
    Label17: TLabel;
    shwDischargeDate: TDBEdit;
    tabPaySlipSummaryPAYKIND: TStringField;
    qryPaymentTotalsTAXEARNINGS: TFloatField;
    qryPaymentTotalsSAVINGSPAID: TFloatField;
    qryPaymentTotalsSAVINGS: TFloatField;
    qryPaymentTotalsLOAN: TFloatField;
    tabPaySlipSummaryTOTALEARNINGS: TFloatField;
    calDischargeDate: TODDBPopupCalendar;
    Label15: TLabel;
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
    qryViewEmployeeBANKSORTCODE: TStringField;
    qryViewEmployeeBANKACCREF: TStringField;
    qryViewEmployeeBANKACCTYPE: TStringField;
    qryCheckRent: TQuery;
    qryCheckRentCOUNTRENTREPAY: TIntegerField;
    tabCompanySICKFUNDPAYPERCENT: TFloatField;
    tabPaySlipSummaryHOLIDAYPAYDAYS: TIntegerField;
    tabPaySlipSummaryHOLIDAYPAY: TFloatField;
    tabPaySlipSummaryCHRISTMASBONUS: TFloatField;
    tabPaySlipSummarySERVICEBONUS: TFloatField;
    tabPaySlipSummarySPECIALBONUS: TFloatField;
    qryDepartmentalEMPPERDEPT: TIntegerField;
    qryDepartmentalTAXEARNINGS: TFloatField;
    qryDepartmentalNORMALHH: TIntegerField;
    qryDepartmentalNORMALMM: TIntegerField;
    qryDepartmentalOT13HH: TIntegerField;
    qryDepartmentalOT13MM: TIntegerField;
    qryDepartmentalOT12HH: TIntegerField;
    qryDepartmentalOT12MM: TIntegerField;
    qryDepartmentalOTX2HH: TIntegerField;
    qryDepartmentalOTX2MM: TIntegerField;
    qryDepartmentalPRODBONUS: TFloatField;
    qryDepartmentalTHISWEEK: TDateTimeField;
    qryDepartmentalPAYKIND: TStringField;
    tabDeptSummaryPAYKIND: TStringField;
    tabPaySlipABOLDBAL: TFloatField;
    tabPaySlipABLESSREPAY: TFloatField;
    tabPaySlipABADDNEW: TFloatField;
    tabPaySlipABNEWBAL: TFloatField;
    qryViewEmployeeABLOANACCNO: TStringField;
    qryViewEmployeeABLOANSTARTVALUE: TFloatField;
    qryViewEmployeeABLOANAC: TFloatField;
    qryViewEmployeeABREPAYLNMONTH: TFloatField;
    qryViewEmployeeABREPAYTERM: TIntegerField;
    qryViewEmployeeABREPAYFROMYEAR: TIntegerField;
    qryViewEmployeeABREPAYFROMMONTH: TIntegerField;
    Label2: TLabel;
    edtABNewBal: TDBEdit;
    Label18: TLabel;
    edtABLessRepay: TDBEdit;
    qryViewDataABOLDBAL: TFloatField;
    qryViewDataABLESSREPAY: TFloatField;
    qryViewDataABADDNEW: TFloatField;
    qryViewDataABNEWBAL: TFloatField;
    tabEmployeeABLOANACCNO: TStringField;
    tabEmployeeABLOANSTARTVALUE: TFloatField;
    tabEmployeeABLOANAC: TFloatField;
    tabEmployeeABREPAYLNMONTH: TFloatField;
    tabEmployeeABREPAYTERM: TIntegerField;
    tabEmployeeABREPAYFROMYEAR: TIntegerField;
    tabEmployeeABREPAYFROMMONTH: TIntegerField;
    qryWeeksInMonth: TQuery;
    qryWeeksInMonthNUMBEROFWEEKS: TIntegerField;
    qryPaymentTotalsABLOANDEDUCT: TFloatField;
    tabPaySlipSummaryABLOANDEDUCT: TFloatField;
    qryCheckABRepayment: TQuery;
    qryCheckABRepaymentCOUNTABLESSREPAY: TIntegerField;
    tabEmployeeABLOANACTIVE: TStringField;
    qryViewEmployeeABLOANACTIVE: TStringField;
    Label51: TLabel;
    qryFetchABMinWeek: TQuery;
    qryFetchABMinWeekFIRSTWEEKINMONTH: TDateTimeField;
    Label70: TLabel;
    tabEmployeePFLOANACCNO: TStringField;
    tabEmployeePFLOANSTARTVALUE: TFloatField;
    tabEmployeePFLOANAC: TFloatField;
    tabEmployeePFREPAYLNMONTH: TFloatField;
    tabEmployeePFREPAYTERM: TIntegerField;
    tabEmployeePFREPAYFROMYEAR: TIntegerField;
    tabEmployeePFREPAYFROMMONTH: TIntegerField;
    tabEmployeePFLOANACTIVE: TStringField;
    tabEmployeeLAWYERMONTH: TFloatField;
    tabPaySlipPFOLDBAL: TFloatField;
    tabPaySlipPFLESSREPAY: TFloatField;
    tabPaySlipPFADDNEW: TFloatField;
    tabPaySlipPFNEWBAL: TFloatField;
    tabPaySlipLAWYERDEDUCT: TFloatField;
    Label71: TLabel;
    edtLawyerDeduct: TDBEdit;
    edtPFNewBal: TDBEdit;
    tabPaySlipSummaryPFLOANDEDUCT: TFloatField;
    tabPaySlipSummaryLAWYERDEDUCT: TFloatField;
    qryPaymentTotalsLAWYERDEDUCT: TFloatField;
    qryPaymentTotalsPFLOANDEDUCT: TFloatField;
    Label72: TLabel;
    edtPFLessRepay: TDBEdit;
    qryViewDataPFOLDBAL: TFloatField;
    qryViewDataPFLESSREPAY: TFloatField;
    qryViewDataPFADDNEW: TFloatField;
    qryViewDataPFNEWBAL: TFloatField;
    qryViewDataLAWYERDEDUCT: TFloatField;
    qryFetchPFMinWeek: TQuery;
    qryCheckPFRepayment: TQuery;
    qryFetchPFMinWeekFIRSTWEEKINMONTH: TDateTimeField;
    qryCheckPFRepaymentCOUNTPFLESSREPAY: TIntegerField;
    tabEmployeeBANKREF: TStringField;
    tabEmployeeBANKFEES: TFloatField;
    Label73: TLabel;
    edtStandbyAllowance: TDBEdit;
    Label74: TLabel;
    edtBankFees: TDBEdit;
    Label75: TLabel;
    edtOveralls: TDBEdit;
    Label76: TLabel;
    edtTools: TDBEdit;
    Label77: TLabel;
    edtOther3: TDBEdit;
    tabPaySlipSummaryDEPREF: TStringField;
    tabPaySlipSummaryANNUALBONUS: TFloatField;
    tabDeptSummaryDEPREF: TStringField;
    qryDepartmentalDEPREF: TStringField;
    tabPaySlipSTANDBYALLOWANCE: TFloatField;
    tabPaySlipBANKFEES: TFloatField;
    tabPaySlipOVERALLS: TFloatField;
    tabPaySlipTOOLS: TFloatField;
    tabPaySlipOTHER3: TFloatField;
    tabPaySlipSTANDBYALLOWANCEPAY: TFloatField;
    tabPaySlipBANKFEESPAY: TFloatField;
    tabPaySlipOVERALLSDEDUCT: TFloatField;
    tabPaySlipTOOLSDEDUCT: TFloatField;
    tabPaySlipOTHER3DEDUCT: TFloatField;
    tabPaySlipSummarySTANDBYALLOWANCEPAY: TFloatField;
    tabPaySlipSummaryBANKFEESPAY: TFloatField;
    tabPaySlipSummaryOVERALLSDEDUCT: TFloatField;
    tabPaySlipSummaryTOOLSDEDUCT: TFloatField;
    tabPaySlipSummaryOTHER3DEDUCT: TFloatField;
    qryPaymentTotalsSTANDBYALLOWANCEPAY: TFloatField;
    qryPaymentTotalsBANKFEESPAY: TFloatField;
    qryPaymentTotalsOVERALLSDEDUCT: TFloatField;
    qryPaymentTotalsTOOLSDEDUCT: TFloatField;
    qryPaymentTotalsOTHER3DEDUCT: TFloatField;
    qryViewDataSTANDBYALLOWANCE: TFloatField;
    qryViewDataBANKFEES: TFloatField;
    qryViewDataOVERALLS: TFloatField;
    qryViewDataTOOLS: TFloatField;
    qryViewDataOTHER3: TFloatField;
    qryViewDataSTANDBYALLOWANCEPAY: TFloatField;
    qryViewDataBANKFEESPAY: TFloatField;
    qryViewDataOVERALLSDEDUCT: TFloatField;
    qryViewDataTOOLSDEDUCT: TFloatField;
    qryViewDataOTHER3DEDUCT: TFloatField;
    qryViewEmployeeBANKREF: TStringField;
    qryViewEmployeeDEPREF: TStringField;
    qryViewEmployeePFLOANACCNO: TStringField;
    qryViewEmployeePFLOANSTARTVALUE: TFloatField;
    qryViewEmployeePFLOANAC: TFloatField;
    qryViewEmployeePFREPAYLNMONTH: TFloatField;
    qryViewEmployeePFREPAYTERM: TIntegerField;
    qryViewEmployeePFREPAYFROMYEAR: TIntegerField;
    qryViewEmployeePFREPAYFROMMONTH: TIntegerField;
    qryViewEmployeePFLOANACTIVE: TStringField;
    qryViewEmployeeLAWYERMONTH: TFloatField;
    qryViewEmployeeBANKFEES: TFloatField;
    Label78: TLabel;
    DBEdit22: TDBEdit;
    Label79: TLabel;
    DBEdit27: TDBEdit;
    Label80: TLabel;
    edtOverallsDeduct: TDBEdit;
    Label81: TLabel;
    edtToolsDeduct: TDBEdit;
    Label82: TLabel;
    edtOther3Deduct: TDBEdit;
    tabEmployeeINSURANCEWM: TStringField;
    tabEmployeeLAWYERWM: TStringField;
    btnExportBatch: TButton;
    qryReport: TQuery;
    tabCompanyUNIONSUBSPERCENT: TFloatField;
    tabCompanyUNIONMINEXCLFUNERALLEVY: TFloatField;
    tabCompanyUNIONMAXEXCLFUNERALLEVY: TFloatField;
    tabCompanyFUNERALLEVY: TFloatField;
    XLS: TXLSReadWriteII4;
    XLSDb: TXLSDbRead4;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure datEmployeeDataChange(Sender: TObject; Field: TField);
    procedure datCompanyDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCreateBatchClick(Sender: TObject);
    procedure datPaySlipStateChange(Sender: TObject);
    procedure tabPaySlipBeforeEdit(DataSet: TDataSet);
    procedure tabPaySlipBeforeInsert(DataSet: TDataSet);
    procedure edtNormalHHExit(Sender: TObject);
    procedure datPaySlipDataChange(Sender: TObject; Field: TField);
    procedure pgeWeeklyWagesChange(Sender: TObject);
    procedure tabPaySlipBeforePost(DataSet: TDataSet);
    procedure btnPostBatchClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure tabEmployeeAfterCancel(DataSet: TDataSet);
    procedure tabEmployeeAfterPost(DataSet: TDataSet);
    procedure calDischargeDateStartClick(Sender: TObject;
      var ADate: TDateTime);
    procedure btnPrintReportsClick(Sender: TObject);
    procedure popFindMenuPopup(Sender: TObject);
    procedure cbDatesChange(Sender: TObject);
    procedure udDatesClick(Sender: TObject; Button: TUDBtnType);
    procedure edtNormalMMExit(Sender: TObject);
    procedure edtEmployeeFullNameChange(Sender: TObject);
    procedure tabEmployeeAfterEdit(DataSet: TDataSet);
    procedure tabEmployeeBeforePost(DataSet: TDataSet);
    procedure dbnPaySlipClick(Sender: TObject; Button: TNavigateBtn);
    procedure tabPaySlipAfterPost(DataSet: TDataSet);
    procedure tabPaySlipAfterCancel(DataSet: TDataSet);
    procedure edtNormalHHEnter(Sender: TObject);
    procedure tabPaySlipNewRecord(DataSet: TDataSet);
    procedure btnExportBatchClick(Sender: TObject);
  private
    { Private declarations }
    {Note: LastWeek: Week that wages system was started or last week that
                    wages was run.
          ThisWeek: Current week that wages is being run.
          NextWeek: Next week that wages will be run. Used in end of
                    month finding calculations, eg: for paying rent. }
    WeeksThisMonth:integer; //added DL050201
    WeeksNextMonth:integer; //added DL121201
    ThisWeekMM, NextWeekMM, LastWeekMM : word;
    DisplayWeek: TDateTime;  //displayweek is only used in view mode
    BatchMode: Boolean; // Are you creating a batch
    CreatingBatch : boolean;  //true whilst a batch is being created
    THundreds,TFifties,TTwenties,TTens, { Tens rand notes: Total eg R270. }
    TFives, TTwos, TOnes, TFiftyC, TTwentyC, TTenC, TFiveC, TTwoC, TOneC : double;
    OldNormalHH:integer;
    procedure CopyToPaySummary;
    procedure Coinage(PSP:double);
    procedure ChangeToViewMode;//Can only view data
    procedure ChangeToEditMode;//You can edit data for WW and FP
    procedure MakeEmpBatch;
    procedure PostEmployee;
  public
    { Public declarations }
    ThisWeekEnd, NextWeekEnd:TDateTime;
  end;

var
  frmWeeklyWages: TfrmWeeklyWages;
//  BatchMode: Boolean; // Are you creating a batch: this is global so moded
//  EditMode: Boolean; // Are you viewing or running weekly wages.
                     // if EditMode then you can run weekly wages.

implementation

uses Main, WCommon, Utils, printslip, Calendar, WagesReport, {DateChoice,}
  {FinalPayslip, }bankrept, rentrept, ABLoanWklyRept, ABLoanMonthlyRept,
  PFLoanWklyRept, PFLoanMonthlyRept;

{$R *.DFM}

procedure TfrmWeeklyWages.PostEmployee;
begin
  if tabPaySlipPOSTED.AsString<>'Y' then
  begin
    StatusBar1.Panels[0].Text:='Please Wait: Posting Batch: Employee '
      +tabPaySlipCLKNO.AsString;
    Application.ProcessMessages;
    tabPaySlip.Edit;
    tabPaySlipPOSTED.AsString := 'Y';
    tabPaySlip.Post; //this updates the payslip
    //update employee balances
    tabEmployee.Edit;
    if PayKind = pkFinal then
      tabEmployeeDISCHARGEDATE.AsDateTime := tabPaySlipDISCHARGEDATE.AsDateTime;
    tabEmployeeTAXEARN.AsFloat:=tabEmployeeTAXEARN.AsFloat
      + tabPaySlipTaxEarnings.AsFloat;
    tabEmployeePENSION.AsFloat:=tabEmployeePENSION.AsFloat
      + tabPaySlipPENSIONDEDUCT.AsFloat;
    tabEmployeeUIFPAY.AsFloat:=tabEmployeeUIFPAY.AsFloat
      + tabPaySlipUIFDEDUCT.AsFloat;
    tabEmployeePROVFD.AsFloat:=tabEmployeePROVFD.AsFloat
      + tabPaySlipPROVFUNDDEDUCT.AsFloat;
    tabEmployeeSICKFD.AsFloat:=tabEmployeeSICKFD.AsFloat
      + tabPaySlipSICKFUNDDEDUCT.AsFloat;
    tabEmployeePAYE.AsFloat:=tabEmployeePAYE.AsFloat
      + tabPaySlipTAXDEDUCT.AsFloat;
    tabEmployeeGROSSPAY.AsFloat:=tabEmployeeGROSSPAY.AsFloat
      + tabPaySlipTaxEarnings.AsFloat
      + tabPaySlipSICKFUNDPAY.AsFloat;
    tabEmployeeRENTAC.AsFloat:=tabPaySlipRENTACBALANCE.AsFloat;
    tabEmployeeSAVEAC.AsFloat:=tabPaySlipSAVEACBALANCE.AsFloat;
    tabEmployeeLOANAC.AsFloat:=tabPaySlipLOANACBALANCE.AsFloat;
    tabEmployeeABLOANAC.AsFloat:=tabPaySlipABNEWBAL.AsFloat; //added DL050201
    tabEmployeePFLOANAC.AsFloat:=tabPaySlipPFNEWBAL.AsFloat; //added DL240504
    if tabPaySlipTOTALPAY.AsFloat>=0 then //incl =0 so that wkspay assigned 0 if rqd
    begin
      tabEmployeeWKSPAY.AsFloat:=tabPaySlipTOTALPAY.AsFloat;
      Coinage(tabPaySlipTOTALPAY.AsFloat);
    end
    else
    begin
      tabEmployeeLOANAC.AsFloat:=tabEmployeeLOANAC.AsFloat
        - tabPaySlipTOTALPAY.AsFloat; //LoanAC is a +ve amount!
      tabEmployeeWKSPAY.AsFloat:=0; //added DL151199
    end;
    tabEmployeeFULLWK.AsInteger:=tabPaySlipFULLWEEKS.AsInteger;
    tabEmployeePARTWK.AsInteger:=tabPaySlipPARTWEEKS.AsInteger;
    tabEmployeeLEAVEDAY.AsInteger:=tabPaySlipLEAVEDAYS.AsInteger;
    tabEmployeeSICKDAY.AsInteger:=tabPaySlipSICKDAYS.AsInteger;
    tabEmployeeTAXWEEK.AsInteger:=tabEmployeeTAXWEEK.AsInteger+1;
    if tabEmployeeREPAYLNWK.AsFloat<>tabPaySlipLOANREPAYRATE.AsFloat then
      tabEmployeeREPAYLNWK.AsFloat:=tabPaySlipLOANREPAYRATE.AsFloat;
    tabEmployee.Post;
  end;
end;

procedure TfrmWeeklyWages.MakeEmpBatch;
//insert a record for an employee into the payslip table
begin
  if tabEmployeeDischargeDate.IsNull then //employee not discharged
  begin
    StatusBar1.Panels[0].Text:='Creating ClkNo: '+tabEmployeeClkNo.AsString;
    Application.ProcessMessages;
    tabPaySlip.Insert;
    tabPaySlipCLKNO.AsInteger:=tabEmployeeClkNo.AsInteger;
    tabPaySlipTHISWEEK.AsDateTime:=ThisWeekEnd;
    if PayKind=pkNormal then
      tabPaySlipPAYKIND.AsString:='AW'
    else if PayKind=pkFinal then
      tabPaySlipPAYKIND.AsString:='BF';
    tabPaySlipNORMALHH.AsInteger:=tabCompanyNormalHrs.AsInteger;
    tabPaySlipNORMALMM.AsInteger:=tabCompanyNormalMins.AsInteger;
    tabPaySlipOT13HH.AsInteger:=tabCompanyNormalOT13Hrs.AsInteger;
    tabPaySlipOT13MM.AsInteger:=tabCompanyNormalOT13Mins.AsInteger;
    tabPaySlipOT12HH.AsInteger:=tabCompanyNormalOT12Hrs.AsInteger;
    tabPaySlipOT12MM.AsInteger:=tabCompanyNormalOT12Mins.AsInteger;
    tabPaySlipOTX2HH.AsInteger:=tabCompanyNormalOTX2Hrs.AsInteger;
    tabPaySlipOTX2MM.AsInteger:=tabCompanyNormalOTX2Mins.AsInteger;
    tabPaySlipATTDAYS.AsInteger:=tabCompanyNormalAttDays.AsInteger;
    tabPaySlipLEAVEPAYDAYS.AsInteger:=0;
    tabPaySlipSICKPAYDAYS.AsInteger:=0;
    tabPaySlipPRODBONUS.AsFloat:=0;
    tabPaySlipNIGHTSHIFTALLOW.AsFloat:=0;
    tabPaySlipSAVINGSPAID.AsFloat:=0;
    tabPaySlipLOANGIVEN.AsFloat:=0;
    tabPaySlipABADDNEW.AsFloat:=0; //added DL050201
    tabPaySlipPFADDNEW.AsFloat:=0; //added DL240504
    if PayKind=pkNormal then //added DL301199
      tabPaySlipLOANREPAYRATE.AsFloat:=tabEmployeeREPAYLNWK.AsFloat
    else if PayKind=pkFinal then //added DL301199
      tabPaySlipLOANREPAYRATE.AsFloat:=tabEmployeeLOANAC.AsFloat; //added DL301199
    tabPaySlipMEDAID.AsFloat:=0;
    tabPaySlipOTHER2.AsFloat:=0;
    if tabEmployeeOTHER1FLAG.AsString='Y' then //This is the union deduction: variable from 061101
      tabPaySlipOTHER1.AsFloat:=tabCompanyOTHER1.AsFloat
    else
      tabPaySlipOTHER1.AsFloat:=0;
    tabPaySlipSTANDBYALLOWANCE.AsCurrency:=0; //added DL050306
    tabPaySlipBANKFEES.AsCurrency:=tabEmployeeBANKFEES.AsCurrency; //added DL050306
    tabPaySlipOVERALLS.AsCurrency:=0; //added DL050306
    tabPaySlipTOOLS.AsCurrency:=0; //added DL050306
    tabPaySlipOTHER3.AsCurrency:=0; //added DL050306
    tabPaySlipPOSTED.AsString:='N';
    tabPaySlip.Post;
  end;
end;

procedure TfrmWeeklyWages.ChangeToViewMode;
var
  ix: Integer;
begin
  BatchMode:=false;
  //set up the dates which can be viewed
  qryGetDates.Close;
  if PayKind=pkNormal then
    qryGetDates.ParamByName('PayKind').AsString:='AW'
  else if PayKind=pkFinal then
    qryGetDates.ParamByName('PayKind').AsString:='BF';
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
  tabPaySlip.Close; //because going into view mode
  tabEmployee.Close;
  tabEmployee.Filter:='';
  tabEmployee.Filtered:=false;
  qryViewData.Close; //opened when dates changed or employee changed in view mode
  qryViewEmployee.Close;
  datPaySlip.DataSet := qryViewData;
  datEmployee.DataSet := qryViewEmployee;

  btnCancel.Enabled := False;
  btnSave.Enabled := False;
  dbnPaySlip.Enabled:=false;
  calDischargeDate.Visible := False;
  lblDischargeDate.Visible:=false;
  btnPostBatch.Enabled := False;
  btnPrintBatch.Enabled := True;
  btnPrintPaySlip.Enabled := True;
  btnPrintReports.Enabled := True;
  btnCreateBatch.Enabled:=true;
//  lblLastWeekPosted.Visible := False;
//  lblThisWeekEnd.Visible := False;
//  shwLastWeek.Visible := False;
//  shwThisWeekEnd.Visible := False;

  edtSickPayDays.ReadOnly := True;
  edtSickPayDays.Color := cl3DLight;

  lblCbDates.Visible := True;
  udDates.Visible := True;  // UpDown connected to cbDates
  cbDatesChange(nil);
  //calDischargeDate.DataSource := datEmployee;
  if PayKind=pkNormal then
    frmWeeklyWages.Caption:='Weekly Wages Routine: View Mode'
  else if PayKind=pkFinal then // Finalpay
  begin
    frmWeeklyWages.Caption:='Final Pay Routine: View Mode';
//    shwLastWeek.Visible := False;
//    edtRepayLnWk.Visible := False;
  end
  else
  begin
    ShowMessage('Invalid PayKind.  Please phone support');
    Exit;
  end;
end;

procedure TfrmWeeklyWages.ChangeToEditMode;
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
  qryViewEmployee.Close;
  datPaySlip.DataSet := tabPaySlip;
  datEmployee.DataSet := tabEmployee;
  tabEmployee.Filter:='dischargedate=null';
  tabEmployee.Filtered:=true;
  tabEmployee.Open;
  tabPaySlip.Open; //must be opened here because closed when going into view mode
  cbDates.Visible := False;
  udDates.Visible := False;
  lblCbDates.Visible := False;
  // Can't print in editmode
  btnPrintBatch.Enabled := False;
  btnPrintPayslip.Enabled := False;
  btnPrintReports.Enabled := False;

  btnCancel.Enabled := False; //enabled in the normal way when editing a record
  btnSave.Enabled := False;
  btnPostBatch.Enabled := True;
  dbnPaySlip.Enabled:=true;
//  btnCreateBatch.Enabled := true;
  btnCreateBatch.Caption := 'Abort Batch';
  if PayKind=pkFinal then
  begin
    calDischargeDate.Visible := true;
    lblDischargeDate.Visible := true;
    edtSavingsPaidOut.tabStop:=false;
    edtSavingsPaidOut.ReadOnly:=true;
    edtSavingsPaidOut.Color:=clBtnFace;
    edtLoanGiven.tabStop:=false;
    edtLoanGiven.ReadOnly:=true;
    edtLoanGiven.Color:=clBtnFace;
  end
  else
  begin
    calDischargeDate.Visible := False;
    lblDischargeDate.Visible := false;
    //if tabEmployeeSICKFUNDFLAG.AsString='Y' then
    //begin xx check if reqd because used in datEmployeeDataChange
      edtSickPayDays.tabStop:=true;
      edtSickPayDays.ReadOnly:=false;
      edtSickPayDays.Color:=clWindow;
    //end
    //else
    //begin
    //  edtSickPayDays.tabStop:=false;
    //  edtSickPayDays.ReadOnly:=true;
    //  edtSickPayDays.Color:=clBtnFace;
    //end;
    edtLoanGiven.tabStop:=true;
    edtLoanGiven.ReadOnly:=false;
    edtLoanGiven.Color:=clWindow;
  end;
//  lblLastWeekPosted.Visible := False;
//  lblThisWeekEnd.Visible := False;
//  shwLastWeek.Visible := False;
//  shwThisWeekEnd.Visible := False;
  if PayKind=pkNormal then
    frmWeeklyWages.Caption:='Weekly Wages Routine: Batch Mode'
  else if PayKind=pkFinal then // Finalpay
    frmWeeklyWages.Caption:='Final Pay Routine: Batch Mode'
  else
  begin
    ShowMessage('Invalid PayKind.  Please phone support');
    Exit;
  end;
end;

procedure TfrmWeeklyWages.CopyToPaySummary;
//this only happens in edit mode
var
//  FirstDept,LastDept,
//  MinTotal,SubMin: Integer; // for calculating Hours and Minutes
//  HourSum,MinSum: Integer;
  DeptNo: Integer;
begin
//  tabPaySlipSummary.Open;
//  tabPaySlipSummary.First;
  //delete records from payslipsummary and from deptsummary where PayKind=FinalPay
  //reason for this is that final pay can be run more than once per week
  if PayKind=pkFinal then
  begin
    qryPaySlipSummaryDelete.Close;
    qryPaySlipSummaryDelete.ParamByName('ThisWeek').AsDateTime := ThisWeekEnd;
    qryPaySlipSummaryDelete.ParamByName('PayKind').AsString:='BF';
    qryPaySlipSummaryDelete.ExecSQL;
    qryDeptSummaryDelete.Close;
    qryDeptSummaryDelete.ParamByName('ThisWeek').AsDateTime := ThisWeekEnd;
    qryDeptSummaryDelete.ParamByName('PayKind').AsString:='BF';
    qryDeptSummaryDelete.ExecSQL;
  end;
  tabPaySlipSummary.Insert;
  qryPaymentTotals.Close;
  qryPaymentTotals.ParamByName('ThisWeek').AsDateTime := ThisWeekEnd; //not DisplayWeek
  qryPaymentTotals.ParamByName('PayKind').AsString := tabCompanyPayKind.AsString;
  qryPaymentTotals.Open;
  tabPaySlipSummaryTHISWEEK.AsDateTime := ThisWeekEnd;
  tabPaySlipSummaryPayKind.AsString := tabCompanyPayKind.AsString;
  // TOTAL AMOUNTS PAID TO THE EMPLOYEES
  tabPaySlipSummaryTAXEARN.AsFloat := qryPaymentTotalsTAXEARNINGS.AsFloat;
  tabPaySlipSummaryTOTALEARNINGS.AsFloat := qryPaymentTotalsTOTALEARNINGS.AsFloat;

  tabPaySlipSummarySAVINGS.AsFloat := qryPaymentTotalsSAVINGS.AsFloat;
  tabPaySlipSummarySAVINGSPAID.AsFloat := qryPaymentTotalsSAVINGSPAID.AsFloat;
  tabPaySlipSummaryLOAN.AsFloat := qryPaymentTotalsLOAN.AsFloat;
  tabPaySlipSummaryLOANGIVEN.AsFloat := qryPaymentTotalsLOANGIVEN.AsFloat;

  tabPaySlipSummaryNEGPAYLOAN.AsFloat := qryPaymentTotalsNEGPAYLOAN.AsFloat;
  tabPaySlipSummarySICKPAY.AsFloat := qryPaymentTotalsSICKFUNDPAY.AsFloat;
  tabPaySlipSummaryRENTPAID.AsFloat := qryPaymentTotalsRENTREPAY.AsFloat;

  tabPaySlipSummarySTANDBYALLOWANCEPAY.AsCurrency:=qryPaymentTotalsSTANDBYALLOWANCEPAY.AsCurrency; //added DL050306
  tabPaySlipSummaryBANKFEESPAY.AsCurrency:=qryPaymentTotalsBANKFEESPAY.AsCurrency; //added DL050306

  // TOTAL DEDUCTIONS FROM WEEKLY PAY
  tabPaySlipSummaryPENSIONDEDUCT.AsFloat := qryPaymentTotalsPENSIONDEDUCT.AsFloat;
  tabPaySlipSummaryTAXDEDUCT.AsFloat := qryPaymentTotalsTAXDEDUCT.AsFloat;
  tabPaySlipSummaryUIFDEDUCT.AsFloat := qryPaymentTotalsUIFDEDUCT.AsFloat;
  tabPaySlipSummaryPROVFUNDDEDUCT.AsFloat := qryPaymentTotalsPROVFUNDDEDUCT.AsFloat;
  tabPaySlipSummaryCOUNCILDEDUCT.AsFloat := qryPaymentTotalsCOUNCILDEDUCT.AsFloat;
  tabPaySlipSummarySICKFUNDDEDUCT.AsFloat := qryPaymentTotalsSICKFUNDDEDUCT.AsFloat;
  tabPaySlipSummaryMEDAIDDEDUCT.AsFloat := qryPaymentTotalsMEDAIDDEDUCT.AsFloat;
  tabPaySlipSummaryINSURANCEDEDUCT.AsFloat := qryPaymentTotalsINSURANCEDEDUCT.AsFloat;
  tabPaySlipSummaryOTHER1DEDUCT.AsFloat := qryPaymentTotalsOTHER1DEDUCT.AsFloat;
  tabPaySlipSummaryOTHER2DEDUCT.AsFloat := qryPaymentTotalsOTHER2DEDUCT.AsFloat;
  tabPaySlipSummaryRENTDEDUCT.AsFloat := qryPaymentTotalsRENTDEDUCT.AsFloat;
  tabPaySlipSummaryLAWYERDEDUCT.AsFloat := qryPaymentTotalsLAWYERDEDUCT.AsFloat; //added DL080504 ddmmyy

  tabPaySlipSummarySAVINGSDEDUCT.AsFloat := qryPaymentTotalsSAVINGSDEDUCT.AsFloat;
  tabPaySlipSummaryLOANDEDUCT.AsFloat := qryPaymentTotalsREPAYLNDEDUCT.AsFloat;
  tabPaySlipSummaryABLOANDEDUCT.AsFloat := qryPaymentTotalsABLOANDEDUCT.AsFloat; //added DL050201
  tabPaySlipSummaryPFLOANDEDUCT.AsFloat := qryPaymentTotalsPFLOANDEDUCT.AsFloat; //added DL090504

  tabPaySlipSummaryOVERALLSDEDUCT.AsCurrency:=qryPaymentTotalsOVERALLSDEDUCT.AsCurrency; //added DL050306
  tabPaySlipSummaryTOOLSDEDUCT.AsCurrency:=qryPaymentTotalsTOOLSDEDUCT.AsCurrency; //added DL050306
  tabPaySlipSummaryOTHER3DEDUCT.AsCurrency:=qryPaymentTotalsOTHER3DEDUCT.AsCurrency; //added DL050306
  tabPaySlipSummaryANNUALBONUS.AsCurrency:=0; //added DL050308

  // GROSS TOTALS FOR PAYMENTS
  tabPaySlipSummaryTOTALPAYMENTS.AsFloat :=
    tabPaySlipSummaryTAXEARN.AsFloat
   +tabPaySlipSummarySAVINGSPAID.AsFloat
   +tabPaySlipSummaryLOANGIVEN.AsFloat
   +tabPaySlipSummaryNEGPAYLOAN.AsFloat
   +tabPaySlipSummarySICKPAY.AsFloat;
   //don't add next line because not paid of totalpayments to employee
   //+tabPaySlipSummaryRENTPAID.AsFloat;
  tabPaySlipSummaryTOTALDEDUCTS.AsFloat :=
    tabPaySlipSummaryPENSIONDEDUCT.AsFloat
   +tabPaySlipSummaryTAXDEDUCT.AsFloat
   +tabPaySlipSummaryUIFDEDUCT.AsFloat
   +tabPaySlipSummaryPROVFUNDDEDUCT.AsFloat
   +tabPaySlipSummaryCOUNCILDEDUCT.AsFloat
   +tabPaySlipSummarySICKFUNDDEDUCT.AsFloat
   +tabPaySlipSummaryMEDAIDDEDUCT.AsFloat
   +tabPaySlipSummaryINSURANCEDEDUCT.AsFloat
   +tabPaySlipSummaryOTHER1DEDUCT.AsFloat
   +tabPaySlipSummaryOTHER2DEDUCT.AsFloat
   +tabPaySlipSummaryRENTDEDUCT.AsFloat
   +tabPaySlipSummarySAVINGSDEDUCT.AsFloat
   +tabPaySlipSummaryLOANDEDUCT.AsFloat
   +tabPaySlipSummaryABLOANDEDUCT.AsFloat  //added DL050201
   +tabPaySlipSummaryLAWYERDEDUCT.AsFloat  //added DL080504
   +tabPaySlipSummaryPFLOANDEDUCT.AsFloat //added DL080504
   +tabPaySlipSummaryOVERALLSDEDUCT.AsCurrency //added DL050306
   +tabPaySlipSummaryTOOLSDEDUCT.AsCurrency //added DL050306
   +tabPaySlipSummaryOTHER3DEDUCT.AsCurrency; //added DL050306

  tabPaySlipSummaryNETPAY.AsFloat :=  // Calculate Netpay
    tabPaySlipSummaryTOTALPAYMENTS.AsFloat - tabPaySlipSummaryTOTALDEDUCTS.AsFloat;
  qryPaymentTotals.Close;

  qryDepartmental.Close;
  qryDepartmental.ParamByName('ThisWeek').AsDateTime:=ThisWeekEnd; //not DisplayWeek;
  qryDepartmental.ParamByName('PayKind').AsString:=tabCompanyPayKind.AsString;
  //qryDepartmental.ExecSQL; - removed DL131299
  qryDepartmental.Open;
  qryDepartmental.First;
  //the following was an insert query DL131299
  while not qryDepartmental.EOF do
  begin
    tabDeptSummary.Insert;
    tabDeptSummaryDEPREF.AsString:=qryDepartmentalDEPREF.AsString;
    tabDeptSummaryTHISWEEK.AsDateTime:=qryDepartmentalTHISWEEK.AsDateTime;
    tabDeptSummaryPAYKIND.AsString:=qryDepartmentalPAYKIND.AsString;
    tabDeptSummaryPRODBONUS.AsFloat:=qryDepartmentalPRODBONUS.AsFloat;
    tabDeptSummaryEMPPERDEPT.AsInteger:=qryDepartmentalEMPPERDEPT.AsInteger;
    tabDeptSummaryTAXEARNINGS.AsFloat:=qryDepartmentalTAXEARNINGS.AsFloat;
    tabDeptSummaryNORMALHH.AsInteger:=qryDepartmentalNORMALHH.AsInteger;
    tabDeptSummaryNORMALMM.AsInteger:=qryDepartmentalNORMALMM.AsInteger;
    tabDeptSummaryOT13HH.AsInteger:=qryDepartmentalOT13HH.AsInteger;
    tabDeptSummaryOT13MM.AsInteger:=qryDepartmentalOT13MM.AsInteger;
    tabDeptSummaryOT12HH.AsInteger:=qryDepartmentalOT12HH.AsInteger;
    tabDeptSummaryOT12MM.AsInteger:=qryDepartmentalOT12MM.AsInteger;
    tabDeptSummaryOTX2HH.AsInteger:=qryDepartmentalOTX2HH.AsInteger;
    tabDeptSummaryOTX2MM.AsInteger:=qryDepartmentalOTX2MM.AsInteger;
    if (tabDeptSummaryNORMALMM.AsInteger>=60) //= added in all these lines DL131299
      or (tabDeptSummaryOT13MM.AsInteger>=60)
      or (tabDeptSummaryOT12MM.AsInteger>=60)
      or (tabDeptSummaryOTX2MM.AsInteger>=60) then
    begin
      tabDeptSummaryNormalHH.AsInteger:=tabDeptSummaryNormalHH.AsInteger+
        tabDeptSummaryNormalMM.AsInteger div 60;
      tabDeptSummaryNormalMM.AsInteger:=tabDeptSummaryNormalMM.AsInteger mod 60;

      tabDeptSummaryOT13HH.AsInteger:=tabDeptSummaryOT13HH.AsInteger+
        tabDeptSummaryOT13MM.AsInteger div 60;
      tabDeptSummaryOT13MM.AsInteger:=tabDeptSummaryOT13MM.AsInteger mod 60;

      tabDeptSummaryOT12HH.AsInteger:=tabDeptSummaryOT12HH.AsInteger+
        tabDeptSummaryOT12MM.AsInteger div 60;
      tabDeptSummaryOT12MM.AsInteger:=tabDeptSummaryOT12MM.AsInteger mod 60;

      tabDeptSummaryOTX2HH.AsInteger:=tabDeptSummaryOTX2HH.AsInteger+
        tabDeptSummaryOTX2MM.AsInteger div 60;
      tabDeptSummaryOTX2MM.AsInteger:=tabDeptSummaryOTX2MM.AsInteger mod 60;
    end;
    tabDeptSummary.Post;
    qryDepartmental.Next;
  end;
  qryDepartmental.Close;

  tabDeptSummary.Close;
  tabDeptSummary.Open;
  tabDeptSummary.First;

  tabPaySlipSummaryEMPLOYEESTOTAL.AsInteger:=0;
  tabPaySlipSummaryPRODBONUSTOTAL.AsInteger:=0;
  (*DeptNo:=0; ERROR this must be changed to a qry to get the DeptSummary for THISWEEK! DL131299
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
  end;*)
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
  if (tabPaySlipSummaryNORMALMMTOTAL.AsInteger>=60) //= added in all these lines DL131299
      or (tabPaySlipSummaryOT13MMTOTAL.AsInteger>=60)
      or (tabPaySlipSummaryOT12MMTOTAL.AsInteger>=60)
      or (tabPaySlipSummaryOTX2MMTOTAL.AsInteger>=60) then
  begin
    tabPaySlipSummaryNormalHHTOTAL.AsInteger:=tabPaySlipSummaryNormalHHTOTAL.AsInteger+
      tabPaySlipSummaryNormalMMTOTAL.AsInteger div 60;
    tabPaySlipSummaryNormalMMTOTAL.AsInteger:=tabPaySlipSummaryNormalMMTOTAL.AsInteger mod 60;

    tabPaySlipSummaryOT13HHTOTAL.AsInteger:=tabPaySlipSummaryOT13HHTOTAL.AsInteger+
      tabPaySlipSummaryOT13MMTOTAL.AsInteger div 60;
    tabPaySlipSummaryOT13MMTOTAL.AsInteger:=tabPaySlipSummaryOT13MMTOTAL.AsInteger mod 60;

    tabPaySlipSummaryOT12HHTOTAL.AsInteger:=tabPaySlipSummaryOT12HHTOTAL.AsInteger+
      tabPaySlipSummaryOT12MMTOTAL.AsInteger div 60;
    tabPaySlipSummaryOT12MMTOTAL.AsInteger:=tabPaySlipSummaryOT12MMTOTAL.AsInteger mod 60;

    tabPaySlipSummaryOTX2HHTOTAL.AsInteger:=tabPaySlipSummaryOTX2HHTOTAL.AsInteger+
      tabPaySlipSummaryOTX2MMTOTAL.AsInteger div 60;
    tabPaySlipSummaryOTX2MMTOTAL.AsInteger:=tabPaySlipSummaryOTX2MMTOTAL.AsInteger mod 60;
  end;
  //qryDepartmental.Close;
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

  tabPaySlipSummaryHOLIDAYPAYDAYS.AsInteger:=0; //added DL021299 re holiday pay totals
  tabPaySlipSummaryHOLIDAYPAY.AsFloat:=0; //added DL021299 re holiday pay totals
  tabPaySlipSummaryCHRISTMASBONUS.AsFloat:=0; //added DL021299 re holiday pay totals
  tabPaySlipSummarySERVICEBONUS.AsFloat:=0; //added DL021299 re holiday pay totals
  tabPaySlipSummarySPECIALBONUS.AsFloat:=0; //added DL021299 re holiday pay totals
  tabPaySlipSummary.Post;
//  tabPaySlipSummary.Close;
end;

procedure TfrmWeeklyWages.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryCheckABRepayment.Close; //added DL050201
  qryPostBatch.Close; //added DL190701
  qryGetDates.Close; //added DL190701
  qryPaySlipHistInsert.Close; //added DL190701
  qryViewData.Close; //added DL190701
  qryViewEmployee.Close; //added DL190701
  qryCheckRent.Close; //added DL190701
  qryInsertOneRow.Close; //added DL190701
  qryEPTTotals.Close; //added DL190701
  qryDepartmental.Close; //added DL190701
  qryPaymentTotals.Close; //added DL190701
  qryWeeksInMonth.Close; //added DL050201
  tabDeptSummary.Close;
  tabPaySlipSummary.Close;
  qryInsertOneRow.Close;
  tabDeptSummary.Close;
  qrySickFundTable.Close;
  tabTaxConstants.Close;
  qryTaxTable.Close;
  qryClearBatch.Close;
  tabEmployee.Close;
  tabPaySlip.Close;
  tabCompany.Close;
  Release;
end;

procedure TfrmWeeklyWages.btnSaveClick(Sender: TObject);
begin
  if PayKind = pkFinal then
    if calDischargeDate.Text = '' then
    begin
      ShowMessage('First fill in discharge date');
      Exit;
    end;
  if tabPaySlip.State in [dsEdit,dsInsert] then //dsInsert required for Final Pay
    tabPaySlip.Post;
end;

procedure TfrmWeeklyWages.btnCancelClick(Sender: TObject);
begin
  if tabPaySlip.State in [dsEdit,dsInsert] then //dsInsert required for Final Pay
  begin
    tabPaySlip.Cancel;
    btnCancel.Enabled := False;
    btnSave.Enabled := False;
  end;
end;

procedure TfrmWeeklyWages.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmWeeklyWages.FormShow(Sender: TObject);
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
  tabEmployee.Open;
  //tabPaySlip.Open; this is set in changeto[view|edit]mode
  //tabPaySlip must be opened after tabEmployee because
  //it is dependant on tabEmployee in a master detail relationship

  tabCompany.FindKey([1]);
  if tabCompanyBATUSERNAME.AsString='None' then
    ChangeToViewMode
  else
    ChangeToEditMode;

  //frmMain.StatusBar1.Panels[2].Text := '';
end;

procedure TfrmWeeklyWages.datEmployeeDataChange(Sender: TObject;
  Field: TField);
begin
//  if BatchMode then
//  begin
//    while tabEmployeeDISCHARGEDATE.AsDateTime<>0 do
//      tabEmployee.Next;
//    tabPaySlip.Close;
//    tabPaySlip.Open;
//  end;
  tabPaySlipNORMALHH.MinValue:=0;
  tabPaySlipNORMALHH.MaxValue:=48;
  tabPaySlipNORMALMM.MinValue:=0;
  tabPaySlipNORMALMM.MaxValue:=59;
  tabPaySlipOT13HH.MinValue:=0;
  tabPaySlipOT13HH.MaxValue:=48;
  tabPaySlipOT13MM.MinValue:=0;
  tabPaySlipOT13MM.MaxValue:=59;
  tabPaySlipOT12HH.MinValue:=0;
  tabPaySlipOT12HH.MaxValue:=48;
  tabPaySlipOT12MM.MinValue:=0;
  tabPaySlipOT12MM.MaxValue:=59;
  tabPaySlipOTX2HH.MinValue:=0;
  tabPaySlipOTX2HH.MaxValue:=48;
  tabPaySlipOTX2MM.MinValue:=0;
  tabPaySlipOTX2MM.MaxValue:=59;
  tabPaySlipProdBonus.MinValue:=0;
  tabPaySlipProdBonus.MaxValue:=2000; //DL050799 was 200; 051129 was 500!
  tabPaySlipNightShiftAllow.MinValue:=0;
  tabPaySlipNightShiftAllow.MaxValue:=2; //was 1 DL050306
  tabPaySlipSavingsPaid.MinValue:=0;
  tabPaySlipSavingsPaid.MaxValue:=tabEmployeeSAVEAC.AsFloat;
  tabPaySlipLoanGiven.MinValue:=0;
  tabPaySlipLoanGiven.MaxValue:=5000.00; //DL040701 was 1999.99
  tabPaySlipAttDays.MinValue:=0;
  tabPaySlipAttDays.MaxValue:=tabCompanyNORMALATTDAYS.AsInteger;
  tabPaySlipLeavePayDays.MinValue:=0;
  tabPaySlipLeavePayDays.MaxValue:=15;
  tabPaySlipSickPayDays.MinValue:=0;
  tabPaySlipSickPayDays.MaxValue:=5;
  tabPaySlipMedAid.MinValue:=0;
  tabPaySlipMedAid.MaxValue:=99.99;
  tabPaySlipOther2.MinValue:=0;
  tabPaySlipOther2.MaxValue:=500.00; //was 99.99 DL020502
  tabPaySlipLOANREPAYRATE.MinValue:=0;
  tabPaySlipLOANREPAYRATE.MaxValue:=999.99;
  //added from here on DL050306
  tabPaySlipSTANDBYALLOWANCE.MinValue:=0;
  tabPaySlipSTANDBYALLOWANCE.MaxValue:=500;
  tabPaySlipBANKFEES.MinValue:=0;
  tabPaySlipBANKFEES.MaxValue:=500;
  tabPaySlipOVERALLS.MinValue:=0;
  tabPaySlipOVERALLS.MaxValue:=500;
  tabPaySlipTOOLS.MinValue:=0;
  tabPaySlipTOOLS.MaxValue:=500;
  tabPaySlipOTHER3.MinValue:=0;
  tabPaySlipOTHER3.MaxValue:=500;

  if BatchMode then
    edtEmployeeFullName.Text:=tabEmployeeClkNo.AsString+': '+
      tabEmployeeSurname.AsString+', '+tabEmployeeFirstName.AsString+
      '.  Dept:'+tabEmployeeDepRef.AsString
  else
    edtEmployeeFullName.Text:=qryViewEmployeeClkNo.AsString+': '+
      qryViewEmployeeSurname.AsString+', '+qryViewEmployeeFirstName.AsString+
      '.  Dept:'+qryViewEmployeeDepRef.AsString;

  if tabEmployeeSICKFUNDFLAG.AsString='Y' then
  begin
    edtSickPayDays.tabStop:=true;
    edtSickPayDays.ReadOnly:=false;
    edtSickPayDays.Color:=clWindow;
  end
  else
  begin
    edtSickPayDays.tabStop:=false;
    edtSickPayDays.ReadOnly:=true;
    edtSickPayDays.Color:=clBtnFace;
  end;
  if PayKind=pkNormal then //no savings paid in FinalPay mode
  begin
    if tabEmployeeSAVEAC.AsFloat>0 then
    begin
      edtSavingsPaidOut.tabStop:=true;
      edtSavingsPaidOut.ReadOnly:=false;
      edtSavingsPaidOut.Color:=clWindow;
    end
    else
    begin
      edtSavingsPaidOut.tabStop:=false;
      edtSavingsPaidOut.ReadOnly:=true;
      edtSavingsPaidOut.Color:=clBtnFace;
    end;
  end;
  if pgeWeeklyWages.ActivePage=tshPayslipEntry then
  begin
    edtNormalHH.SetFocus;
    edtNormalHH.SelectAll;  //this done so that whole field is highlighted
  end;
end;

procedure TfrmWeeklyWages.datCompanyDataChange(Sender: TObject;
  Field: TField);
var
  YY, DD: word;
begin
  ThisWeekEnd:=tabCompanyLASTWEEK.AsDateTime+7;
  NextWeekEnd:=tabCompanyLASTWEEK.AsDateTime+14;
  shwThisWeekEnd.Text:=FormatDateTime('dd/mm/yyyy',ThisWeekEnd);
  DecodeDate(tabCompanyLASTWEEK.AsDateTime, YY, LastWeekMM, DD);
  DecodeDate(ThisWeekEnd, YY, ThisWeekMM, DD);

  //qryWeeksInMonth lookup added DL050201
  qryWeeksInMonth.Close;
  qryWeeksInMonth.ParamByName('YearNo').AsInteger:=YY;
  qryWeeksInMonth.ParamByName('MonthNo').AsInteger:=ThisWeekMM;
  qryWeeksInMonth.Open;
  WeeksThisMonth:=qryWeeksInMonthNUMBEROFWEEKS.AsInteger;
  WeeksNextMonth:=0; //only used in year end routine (for calc ABLoanRepayments) added DL161201

  DecodeDate(NextWeekEnd, YY, NextWeekMM, DD);
end;

procedure TfrmWeeklyWages.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //note: Key=vk_tab not being run as this function is not being called
  //when tab is pressed
  if (Key = vk_return) {or (Key = vk_tab)} then
  begin
    if ssCtrl in Shift then
    begin
      if (ActiveControl=edtNormalHH) then
        frmWeeklyWages.ActiveControl:=edtOther2
      else
        selectnext(activecontrol,false,true);
    end
    else
    begin
      if (ActiveControl=edtOther2) then
      begin
        if edtRepayLnWk.ReadOnly then
          frmWeeklyWages.ActiveControl:=edtNormalHH
        else
          frmWeeklyWages.ActiveControl:=edtRepayLnWk;
      end
      else if (ActiveControl=edtRepayLnWk) then
        frmWeeklyWages.ActiveControl:=edtNormalHH
      else
        selectnext(activecontrol,true,true);

    end;
    Key:=0;
  end;
end;

procedure TfrmWeeklyWages.btnCreateBatchClick(Sender: TObject);
//used for creating and aborting a batch
begin
  if tabPayslip.State in [dsEdit] then
  begin
    ShowMessage('Paylip in edit mode.'#13#10'First cancel the edit');
    Exit;
  end;

  if tabCompanyBATUSERNAME.AsString = 'None' then
  begin
    // no batch, so create one
    //BatchMode:=true; - in changetoeditmode
    ChangeToEditMode;
    frmMain.Database.StartTransaction;
    tabCompany.Edit;
    tabCompanyBATUSERNAME.AsString:=UserName;
    if PayKind=pkNormal then
      tabCompanyPayKind.AsString:='AW'
    else if PayKind=pkFinal then
      tabCompanyPayKind.AsString:='BF';
    tabCompany.Post;

    if PayKind = pkFinal then //batch is not created, but each final pay emp is added as reqd
    begin
      frmMain.Database.Commit;
      ShowMessage('Chose employee to discharge and click on edit button');
    end
    else //PayKind=pkNormal, so create batch
    begin
      CreatingBatch:=true;
      tabEmployee.DisableControls;
      tabPaySlip.DisableControls;
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
      tabPaySlip.EnableControls;
      tabEmployee.EnableControls;
      tabEmployee.First;
    end;
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
      //note: if pkfinal mode then exit this program at this point
      if PayKind=pkFinal then
      begin
        ShowMessage('Final Pay Batch has been cleared.  Program will now exit.');
        Close; //Form.Close
      end;
    end;
  end;
end;

procedure TfrmWeeklyWages.btnPostBatchClick(Sender: TObject);
begin
  if tabPaySlip.State = dsEdit then
  begin
    ShowMessage('First save your edits');
    Exit;
  end;

  if MessageDlg('Have you entered all the data for the wages?',mtConfirmation,
    [mbYes,mbNo],0) = mrYes then
  begin
    if MessageDlg('Are you sure you want to post this batch - ' +#13+
      'You will no longer be able to change any payslips afterwards.',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
//      btnCreateBatch.Enabled := False;
      CreatingBatch:=true;
      StatusBar1.Panels[0].Text:='Please Wait: Posting Batch';
      Application.ProcessMessages;

//      tabPaySlip.DisableControls;  don't do this because of master detail problem
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
        if tabPaySlipCLKNO.AsInteger=tabEmployeeCLKNO.AsInteger then
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
      qryPaySlipHistInsert.Close;   // Update Paysliphist file includes weekly balances
      qryPaySlipHistInsert.ExecSQL;

      //create the summary information
      //by this time the coinage has been calculated as included with PostEmployee
      CopyToPaySummary;

      //now clear and set the batch information
      tabEmployee.First;
//      tabEmployee.EnableControls;
//      tabPaySlip.EnableControls;
      qryClearBatch.Close;   // Clear the batch
      qryClearBatch.ExecSQL;
      tabCompany.Edit;
      tabCompanyBATUSERNAME.AsString := 'None';
      tabCompanyPAYKIND.AsString := '';
      if PayKind=pkNormal then //only increment weekend after weekly wages
      begin
        tabCompanyLASTWEEK.AsDateTime := tabCompanyLASTWEEK.AsDateTime + 7;
        tabCompanyATxWk.AsInteger := tabCompanyATxWk.AsInteger+1;
      end;
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

procedure TfrmWeeklyWages.datPaySlipStateChange(Sender: TObject);
begin
  if BatchMode then
  begin
    btnSave.Enabled := tabPaySlip.State in [dsEdit, dsInsert];
    btnCancel.Enabled := btnSave.Enabled;
    btnClose.Enabled := tabPaySlip.State = dsBrowse;
  end;
end;

procedure TfrmWeeklyWages.tabPaySlipBeforeEdit(DataSet: TDataSet);
begin
//  if tabEmployeeDISCHARGEDATE.AsDateTime>0 then
//    raise Exception.Create('Cannot edit this payslip as employee has been discharged');
  if (not BatchMode) and (PayKind <> pkFinal) then
    raise Exception.Create('You can''t edit if you are not in batch mode, First Create a new batch');
  if not CreatingBatch then
    frmMain.Database.StartTransaction;
end;

procedure TfrmWeeklyWages.tabPaySlipBeforeInsert(DataSet: TDataSet);
begin
  //happens here as no payslip data for this employee
  if tabEmployeeDISCHARGEDATE.AsDateTime<>0 then
    raise Exception.Create('Cannot edit this payslip as employee has been discharged');
  if not CreatingBatch then
    frmMain.Database.StartTransaction;
end;

procedure TfrmWeeklyWages.edtNormalHHExit(Sender: TObject);
begin
  if tabPaySlip.State in [dsEdit, dsInsert] then
  begin
    if (tabPaySlipNORMALHH.AsInteger<tabCompanyNORMALHRS.AsInteger) and
       (OldNormalHH=tabCompanyNORMALHRS.AsInteger) then
    begin
      tabPaySlipATTDAYS.AsInteger:=0;
      tabPaySlipOT13HH.AsInteger:=0;
      tabPaySlipOT13MM.AsInteger:=0;
      tabPaySlipOT12HH.AsInteger:=0;
      tabPaySlipOT12MM.AsInteger:=0;
      tabPaySlipOTX2HH.AsInteger:=0;
      tabPaySlipOTX2MM.AsInteger:=0;
    end;
    if edtNormalHH.Text = '' then
      tabPaySlipNORMALHH.AsInteger := 0;
  end;
end;

procedure TfrmWeeklyWages.datPaySlipDataChange(Sender: TObject;
  Field: TField);
begin
  if PayKind=pkNormal then //cannot give a loan in FinalPay
  begin
    if tabPaySlipLOANGIVEN.AsFloat>0 then
    begin
      edtRepayLnWk.tabStop:=true;
      edtRepayLnWk.ReadOnly:=false;
      edtRepayLnWk.Color:=clWindow;
    end
    else
    begin
      edtRepayLnWk.tabStop:=false;
      edtRepayLnWk.ReadOnly:=true;
      edtRepayLnWk.Color:=clBtnFace;
    end;
  end;
end;

procedure TfrmWeeklyWages.pgeWeeklyWagesChange(Sender: TObject);
begin
  if pgeWeeklyWages.ActivePage=tshPayslipEntry then
    edtNormalHH.SetFocus;
end;

procedure TfrmWeeklyWages.tabPaySlipBeforePost(DataSet: TDataSet);
begin
  if (PayKind = pkFinal) and (BatchMode) and (calDischargeDate.Text = '') then
  begin
    ShowMessage('First fill in discharge date');
    Abort;
  end;
  //do all the required calculations
  // --- Getvalues --- //
  tabPaySlipNormalPay.AsFloat:=GetNormalPay(tabCompany,tabPaySlip,tabEmployee);
  tabPaySlipOT13Pay.AsFloat:=GetOT13Pay(tabCompany,tabPaySlip,tabEmployee);
  tabPaySlipOT12Pay.AsFloat:=GetOT12Pay(tabCompany,tabPaySlip,tabEmployee);
  tabPaySlipOTX2Pay.AsFloat:=GetOTX2Pay(tabCompany,tabPaySlip,tabEmployee);
  tabPaySlipAttBonusPay.AsFloat:=GetAttBonusPay(tabCompany,tabPaySlip,tabEmployee);
  tabPaySlipProdBonusPay.AsFloat:=tabPaySlipProdBonus.AsFloat;
  tabPaySlipNightShiftPay.AsFloat:=GetNightShiftPay(tabCompany,tabPaySlip,tabEmployee);
  tabPaySlipLeavePay.AsFloat:=GetLeavePay(tabCompany,tabPaySlip,tabEmployee);
  tabPaySlipSTANDBYALLOWANCEPAY.AsCurrency:=tabPaySlipSTANDBYALLOWANCE.AsCurrency; //added DL050306
  tabPaySlipBANKFEESPAY.AsCurrency:=tabPaySlipBANKFEES.AsCurrency; //added DL050306

  // -- Rent allow pay -- //
  if PayKind = pkNormal then
    tabPaySlipRentAllowPay.AsFloat:=GetRentAllowPay(tabCompany,tabPaySlip,
      tabEmployee,ThisWeekMM,NextWeekMM)
  else if PayKind = pkHoliday then
    tabPaySlipRentAllowPay.AsFloat:=GetRentAllowPay(tabCompany,tabPaySlip,
      tabEmployee,LastWeekMM,NextWeekMM)
  else //PayKind=FinalPay
    tabPaySlipRentAllowPay.AsFloat:=0;
(*  if PayKind = pkHoliday then
    tabPaySlipTaxEarnings.AsFloat := GetHolidayPay + GetChristmasBonus + GetServiceBonus
      + tabPaySlipRentAllowPay.AsFloat
      + tabCompany.FieldByName('SPECIALBONUS').AsFloat { Automatic addition if SpeclBon <> 0.}
  else
  begin*)
  tabPaySlipTaxEarnings.AsFloat:=tabPaySlipNormalPay.AsFloat
    + tabPaySlipOT13Pay.AsFloat + tabPaySlipOT12Pay.AsFloat
    + tabPaySlipOTX2Pay.AsFloat
    + tabPaySlipAttBonusPay.AsFloat + tabPaySlipProdBonusPay.AsFloat
    + tabPaySlipNightShiftPay.AsFloat + tabPaySlipLeavePay.AsFloat
    + tabPaySlipRentAllowPay.AsFloat
    + tabPaySlipSTANDBYALLOWANCEPAY.AsCurrency + tabPaySlipBANKFEESPAY.AsCurrency; //added DL050305

{  end;}
  if PayKind = pkNormal then
    tabPaySlipTotalEarnings.AsFloat := tabPaySlipTaxEarnings.AsFloat
      + tabPaySlipSavingsPaid.AsFloat
      + tabPaySlipLoanGiven.AsFloat
  else {if PayKind in [pkFinal, pkHoliday] then}
  begin
    tabPaySlipSavingsPaid.AsFloat := tabEmployee.FieldByName('SAVEAC').AsFloat;
    tabPaySlipTotalEarnings.AsFloat := tabPaySlipTaxEarnings.AsFloat
      + tabEmployee.FieldByName('SAVEAC').AsFloat;
  end;

  tabPaySlipPENSIONDEDUCT.AsFloat:=
    GetPensionDeduct(tabCompany,tabEmployee,tabPaySlipThisWeek.AsDateTime,1);
  tabPaySlipTAXDEDUCT.AsFloat:=GetTaxDeduct(tabCompany,tabEmployee,
    tabTaxConstants,qryTaxTable,
    tabPaySlipTaxEarnings.AsFloat,tabPaySlipPENSIONDEDUCT.AsFloat,
    tabPaySlipThisWeek.AsDateTime,1); //,1 added DL011299
  tabPaySlipUIFDEDUCT.AsFloat:=GetUIFDeduct(tabCompany,tabEmployee,tabPaySlip,
    tabPaySlipTaxEarnings.AsFloat); //TaxEarnings added DL020903
  tabPaySlipPROVFUNDDEDUCT.AsFloat:=GetProvFundDeduct(tabCompany,tabEmployee,1);
  tabPaySlipCOUNCILDEDUCT.AsFloat:=GetCouncilDeduct(tabCompany,1);
  tabPaySlipSICKFUNDDEDUCT.AsFloat:=GetSickFundDeduct(tabCompany,tabEmployee,1);
  tabPaySlipMEDAIDDEDUCT.AsFloat:=tabPaySlipMEDAID.AsFloat;
  if PayKind<>pkFinal then
    tabPaySlipINSURANCEDEDUCT.AsFloat:=
      GetInsuranceDeduct(tabCompany,tabEmployee,tabPaySlip,ThisWeekEnd,WeeksThisMonth,WeeksNextMonth,1) //was GetInsuranceDeduct(tabEmployee,1) DL060508
  else
    tabPaySlipINSURANCEDEDUCT.AsFloat:=0;
  tabPaySlipOTHER1DEDUCT.AsFloat:=GetOther1Deduct(tabCompany,tabEmployee,tabPaySlip,1);
  tabPaySlipOTHER2DEDUCT.AsFloat:=tabPaySlipOTHER2.AsFloat;
  if PayKind<>pkFinal then
    tabPaySlipRENTDEDUCT.AsFloat:=
      GetRentDeduct(tabCompany,tabEmployee,ThisWeekMM)
  else
    tabPaySlipRENTDEDUCT.AsFloat:=-tabEmployeeRENTAC.AsFloat;
  if PayKind<>pkFinal then
    tabPaySlipSAVINGSPERWEEKDEDUCT.AsFloat:=tabEmployeeSAVEWK.AsFloat
  else
    tabPaySlipSAVINGSPERWEEKDEDUCT.AsFloat:=0;
  if PayKind<>pkFinal then
    tabPaySlipREPAYLOANPERWEEKDEDUCT.AsFloat:=GetLoanDeduct(tabEmployee,tabPaySlip)
  else //if there is a loan, it must be deducted in full in final pay DL301199
    tabPaySlipREPAYLOANPERWEEKDEDUCT.AsFloat:=tabEmployeeLOANAC.AsFloat; //was 0 DL301199
  //For final pay we still deduct the weekly deduction for AB AND we do not deduct
  //the amount outstanding as this amount is only outstanding by the employee
  //and not by the employee.  Modified DL130301
  //if PayKind<>pkFinal then //added DL050201
  tabPaySlipABLESSREPAY.AsFloat:=GetABLoanDeduct(tabCompany,tabEmployee,tabPaySlip,ThisWeekEnd,WeeksThisMonth,WeeksNextMonth); //added DL050201
  //else //if there is a loan, it must be deducted in full in final pay DL050201
  //  tabPaySlipABLESSREPAY.AsFloat:=tabEmployeeABLOANAC.AsFloat; //added DL050201
  tabPaySlipLAWYERDEDUCT.AsFloat:=GetLGLoanDeduct(tabCompany,tabEmployee,tabPaySlip,ThisWeekEnd,WeeksThisMonth,WeeksNextMonth,1); //added DL090504 - function call because must calculate weekly deduction
  tabPaySlipPFLESSREPAY.AsFloat:=GetPFLoanDeduct(tabCompany,tabEmployee,tabPaySlip,ThisWeekEnd,WeeksThisMonth,WeeksNextMonth); //added DL090504
  tabPaySlipOVERALLSDEDUCT.AsCurrency:=tabPaySlipOVERALLS.AsCurrency; //added DL050306
  tabPaySlipTOOLSDEDUCT.AsCurrency:=tabPaySlipTOOLS.AsCurrency; //added DL050306
  tabPaySlipOTHER3DEDUCT.AsCurrency:=tabPaySlipOTHER3.AsCurrency; //added DL050306
  if PayKind = pkFinal then
  begin
    tabPaySlipTOTALDEDUCT.AsFloat:=
      tabPaySlipTAXDEDUCT.AsFloat
      +tabPaySlipUIFDEDUCT.AsFloat
      +tabPaySlipPROVFUNDDEDUCT.AsFloat
      +tabPaySlipCOUNCILDEDUCT.AsFloat
      +tabPaySlipSICKFUNDDEDUCT.AsFloat
      +tabPaySlipMEDAIDDEDUCT.AsFloat
      +tabPaySlipOTHER1DEDUCT.AsFloat
      +tabPaySlipOTHER2DEDUCT.AsFloat
      +tabEmployeeLOANAC.AsFloat
      -tabEmployeeRENTAC.AsFloat
      //+tabEmployeeABLOANAC.AsFloat;  //added DL050201 - removed DL130301 See note above
      +tabPaySlipABLESSREPAY.AsFloat   //added DL050201 - added DL130301
      +tabPaySlipPFLESSREPAY.AsFloat   //added DL090504
      +tabPaySlipLAWYERDEDUCT.AsFloat //added DL090504
      +tabPaySlipOVERALLSDEDUCT.AsCurrency //added DL050306
      +tabPaySlipTOOLSDEDUCT.AsCurrency //added DL050306
      +tabPaySlipOTHER3DEDUCT.AsCurrency; //added DL050306
  end
  else
  begin
    tabPaySlipTOTALDEDUCT.AsFloat:=tabPaySlipPENSIONDEDUCT.AsFloat
     +tabPaySlipTAXDEDUCT.AsFloat+tabPaySlipUIFDEDUCT.AsFloat
     +tabPaySlipPROVFUNDDEDUCT.AsFloat+tabPaySlipCOUNCILDEDUCT.AsFloat
     +tabPaySlipSICKFUNDDEDUCT.AsFloat+tabPaySlipMEDAIDDEDUCT.AsFloat
     +tabPaySlipINSURANCEDEDUCT.AsFloat+tabPaySlipOTHER1DEDUCT.AsFloat
     +tabPaySlipOTHER2DEDUCT.AsFloat+tabPaySlipRENTDEDUCT.AsFloat
     +tabPaySlipSAVINGSPERWEEKDEDUCT.AsFloat
     +tabPaySlipREPAYLOANPERWEEKDEDUCT.AsFloat
     +tabPaySlipABLESSREPAY.AsFloat  //added DL050201
     +tabPaySlipLAWYERDEDUCT.AsFloat //added DL090504
     +tabPaySlipPFLESSREPAY.AsFloat //added DL090504
     +tabPaySlipOVERALLSDEDUCT.AsCurrency //added DL050306
     +tabPaySlipTOOLSDEDUCT.AsCurrency //added DL050306
     +tabPaySlipOTHER3DEDUCT.AsCurrency; //added DL050306
  end;

  //on next line GetRentRepay is LastWeek,NextWeek in pkHoliday
  if PayKind<>pkFinal then
    tabPaySlipRENTREPAY.AsFloat:=GetRentRepay(tabEmployee,ThisWeekMM, NextWeekMM)
  else
    //because employee must pay own rent if discharged in the last week of the month
    tabPaySlipRENTREPAY.AsFloat:=0;
  tabPaySlipFULLWEEK.AsInteger:=GetFullWeeks(tabCompany,tabPaySlip);
  tabPaySlipPARTWEEK.AsInteger:=GetPartWeeks(tabCompany,tabPaySlip);
  //note: having these total lines here isn't a problem because
  //this calculation can only happen BEFORE the employee record
  //is updated with this year's totals.
  tabPaySlipFULLWEEKS.AsInteger:=tabEmployeeFULLWK.AsInteger+
    tabPaySlipFULLWEEK.AsInteger;
  tabPaySlipPARTWEEKS.AsInteger:=tabEmployeePARTWK.AsInteger+
    tabPaySlipPARTWEEK.AsInteger;

  tabPaySlipSICKFUNDPAY.AsFloat:=
    GetSickFundPay(tabCompany,tabEmployee,tabPaySlip,qrySickFundTable);

  tabPaySlipTOTALPAY.AsFloat:=tabPaySlipTotalEarnings.AsFloat
    - tabPaySlipTOTALDEDUCT.AsFloat + tabPaySlipSICKFUNDPAY.AsFloat;

  if PayKind <> pkFinal then
  begin
    tabPaySlipRENTACBALANCE.AsFloat:=tabEmployeeRENTAC.AsFloat
      - tabPaySlipRENTREPAY.AsFloat + tabPaySlipRENTDEDUCT.AsFloat;
    tabPaySlipSAVEACBALANCE.AsFloat:=tabEmployeeSAVEAC.AsFloat
      - tabPaySlipSavingsPaid.AsFloat + tabPaySlipSAVINGSPERWEEKDEDUCT.AsFloat;
    tabPaySlipLOANACBALANCE.AsFloat:=tabEmployeeLOANAC.AsFloat
      - tabPaySlipREPAYLOANPERWEEKDEDUCT.AsFloat+tabPaySlipLoanGiven.AsFloat;
    tabPaySlipABOLDBAL.AsFloat:=tabEmployeeABLOANAC.AsFloat;       //added DL050201
    tabPaySlipABNEWBAL.AsFloat:=tabPaySlipABOLDBAL.AsFloat         //added DL050201
      -tabPaySlipABLESSREPAY.AsFloat + tabPaySlipABADDNEW.AsFloat; //added DL050201
    tabPaySlipPFOLDBAL.AsFloat:=tabEmployeePFLOANAC.AsFloat;       //added DL090504
    tabPaySlipPFNEWBAL.AsFloat:=tabPaySlipPFOLDBAL.AsFloat         //added DL090504
      -tabPaySlipPFLESSREPAY.AsFloat + tabPaySlipPFADDNEW.AsFloat; //added DL090504
  end
  else
  begin
    tabPaySlipRENTACBALANCE.AsFloat:=0;
    tabPaySlipSAVEACBALANCE.AsFloat:=0;
    tabPaySlipLOANACBALANCE.AsFloat:=0;
    tabPaySlipABNEWBAL.AsFloat:=0; //added DL050201
    tabPaySlipPFNEWBAL.AsFloat:=0; //added DL090504
  end;

  tabPaySlipLEAVEDAYS.AsInteger:=tabEmployeeLEAVEDAY.AsInteger+
    tabPaySlipLEAVEPAYDAYS.AsInteger;
  tabPaySlipSICKDAYS.AsInteger:=tabEmployeeSICKDAY.AsInteger+
    tabPaySlipSICKPAYDAYS.AsInteger;
  //handle negative pay loans: done in save employee info
  if tabPaySlipTotalPay.AsFloat < 0 then
    tabPaySlipNegPayLoan.AsFloat := -tabPaySlipTOTALPAY.AsFloat
  else
    tabPaySlipNegPayLoan.AsFloat := 0;
end;
                         //JT031298  prints current payslip or whole batch
procedure TfrmWeeklyWages.PrintClick(Sender: TObject);
begin
  frmPrintSlip := TfrmPrintSlip.Create(Application);
  if Sender = btnPrintPaySlip then   //only print current payslip
  begin
  {  frmPrintSlip.qryPaySlip.ParamByName('FromClkNo').AsInteger:=
      tabPaySlipCLKNO.AsInteger;
    frmPrintSlip.qryPaySlip.ParamByName('ToClkNo').AsInteger:=
      tabPaySlipCLKNO.AsInteger; }
    frmPrintSlip.qryPaySlip.Close;
    frmPrintSlip.qryPaySlip.ParamByName('FromClkNo').AsInteger:=
      qryViewData.FieldByName('ClkNo').AsInteger;
    frmPrintSlip.qryPaySlip.ParamByName('ToClkNo').AsInteger:=
      qryViewData.FieldByName('ClkNo').AsInteger;
   // frmPrintSlip.qryPaySlip.ParamByName('ThisWeek').AsDateTime:=
   //   DisplayWeek;
  end
  else
  begin
    frmPrintSlip.qryPaySlip.Close;
    frmPrintSlip.qryPaySlip.ParamByName('FromClkNo').AsInteger:=1;
    frmPrintSlip.qryPaySlip.ParamByName('ToClkNo').AsInteger:=99999;
  end;
  frmPrintSlip.qryPaySlip.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
  if PayKind = pkNormal then
    frmPrintSlip.qryPaySlip.ParamByName('PayKind').AsString:='AW'
  else if PayKind = pkFinal then
    frmPrintSlip.qryPaySlip.ParamByName('PayKind').AsString:='BF'
  else  //don't print anything
    frmPrintSlip.qryPaySlip.ParamByName('PayKind').AsString:='XX';
  frmPrintSlip.qryPaySlip.Open;
  frmPrintSlip.qrpPaySlip.Preview;
  frmPrintSlip.qryPaySlip.Close;
end;

procedure TfrmWeeklyWages.tabEmployeeAfterCancel(DataSet: TDataSet);
begin
  btnSave.Enabled := False;
  BtnCancel.Enabled := False;
end;

procedure TfrmWeeklyWages.tabEmployeeAfterPost(DataSet: TDataSet);
begin
  btnSave.Enabled := False;
  BtnCancel.Enabled := False;
end;

procedure TfrmWeeklyWages.calDischargeDateStartClick(Sender: TObject;
  var ADate: TDateTime);
begin
  if ADate < ThisWeekEnd then
  begin
    MessageDlg('Date can''t be smaller than This Week',mtError,[mbOk],0);
    Abort;
  end;
end;

procedure TfrmWeeklyWages.btnPrintReportsClick(Sender: TObject);
var
  YearNo,MonthNo,DayNo:word;
  RptThisWeekMM,RptNextWeekMM:word; //added DL260401
  YY,DD:word; //added DL260401
  RptThisWeekEnd, RptNextWeekEnd:TDateTime; //added DL260401
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
    if PayKind = pkNormal then
      frmPayReport.qryReport.ParamByName('PayKind').AsString:='AW'
    else if PayKind = pkFinal then
      frmPayReport.qryReport.ParamByName('PayKind').AsString:='BF'
    else  //don't print anything
      frmPayReport.qryReport.ParamByName('PayKind').AsString:='XX';
    frmPayReport.qryReport.Open;
    frmPayReport.tabCompany.Open;
    frmPayReport.qrpReport.Preview;
    frmPayReport.qryReport.Close;
    frmPayReport.tabCompany.Close;

    //Print the Bank Account Payment Summary
    frmBankReport:=TfrmBankReport.Create(Application);
    frmBankReport.qryReport.Close;
    frmBankReport.qryReport.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
    if PayKind = pkNormal then
      frmBankReport.qryReport.ParamByName('PayKind').AsString:='AW'
    else if PayKind = pkFinal then
      frmBankReport.qryReport.ParamByName('PayKind').AsString:='BF'
    else  //don't print anything
      frmBankReport.qryReport.ParamByName('PayKind').AsString:='XX';
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
    qryCheckRent.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
    if PayKind = pkNormal then
      qryCheckRent.ParamByName('PayKind').AsString:='AW'
    else if PayKind = pkFinal then
      qryCheckRent.ParamByName('PayKind').AsString:='BF'
    else  //don't print anything
      qryCheckRent.ParamByName('PayKind').AsString:='XX';
    qryCheckRent.Open;
    if qryCheckRentCOUNTRENTREPAY.AsInteger>0 then
    begin
      frmRentReport:=TfrmRentReport.Create(Application);
      frmRentReport.qryReport.Close;
      frmRentReport.qryReport.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
      if PayKind = pkNormal then
        frmRentReport.qryReport.ParamByName('PayKind').AsString:='AW'
      else if PayKind = pkFinal then
        frmRentReport.qryReport.ParamByName('PayKind').AsString:='BF'
      else  //don't print anything
        frmRentReport.qryReport.ParamByName('PayKind').AsString:='XX';
      frmRentReport.qryReport.Open;
      frmRentReport.tabCompany.Open;
      frmRentReport.qrpReport.Preview;
      frmRentReport.qryReport.Close;
      frmRentReport.tabCompany.Close;
    end; //Print the Rent Analysis

    //African Bank Weekly Report added DL050201
    //Print the African Bank Weekly Loan Repayment Report if required
    qryCheckABRepayment.Close;
    qryCheckABRepayment.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
    if PayKind = pkNormal then
      qryCheckABRepayment.ParamByName('PayKind').AsString:='AW'
    else if PayKind = pkFinal then
      qryCheckABRepayment.ParamByName('PayKind').AsString:='BF'
    else  //don't print anything
      qryCheckABRepayment.ParamByName('PayKind').AsString:='XX';
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
      frmABLoanWklyReport.qryReport.SQL.Add('from employee emp,paysliphist ph');
      frmABLoanWklyReport.qryReport.SQL.Add('where emp.clkno=ph.clkno');
      frmABLoanWklyReport.qryReport.SQL.Add('and ph.paykind=:paykind');
      frmABLoanWklyReport.qryReport.SQL.Add('and ph.thisweek=:thisweek');
      frmABLoanWklyReport.qryReport.SQL.Add('and ph.ablessrepay>0');
      frmABLoanWklyReport.qryReport.SQL.Add('order by emp.clkno');
      frmABLoanWklyReport.qryReport.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
      if PayKind = pkNormal then
        frmABLoanWklyReport.qryReport.ParamByName('PayKind').AsString:='AW'
      else if PayKind = pkFinal then
        frmABLoanWklyReport.qryReport.ParamByName('PayKind').AsString:='BF'
      else  //don't print anything
        frmABLoanWklyReport.qryReport.ParamByName('PayKind').AsString:='XX';
      frmABLoanWklyReport.qryReport.Open;
      frmABLoanWklyReport.tabCompany.Open;
      frmABLoanWklyReport.qrpReport.Preview;
      frmABLoanWklyReport.qryReport.Close;
      frmABLoanWklyReport.tabCompany.Close;
    end; //African Bank Weekly Report

    //African Bank Monthly Report added DL050201
    //Print the African Bank Monthly Loan Repayment Report if required
    //DL260401: note that thisweekmm and nextweekmm must be calculated
    //differently because these reports are printed outside the batch
    RptThisWeekEnd:=DisplayWeek;
    RptNextWeekEnd:=DisplayWeek+7;
    DecodeDate(RptThisWeekEnd, YY, RptThisWeekMM, DD);
    DecodeDate(RptNextWeekEnd, YY, RptNextWeekMM, DD);
    if RptThisWeekMM <> RptNextWeekMM then
    begin
      //fetch min fromweekend: added DL030303 bec. doesn't work in January due
      // to annual year end
      DecodeDate(DisplayWeek, YearNo, MonthNo, DayNo); //DisplayWeek was ThisWeekEnd DL030501
      qryFetchABMinWeek.Close;
      qryFetchABMinWeek.ParamByName('YearNo').AsInteger:=YearNo;
      qryFetchABMinWeek.ParamByName('MonthNo').AsInteger:=MonthNo;
      qryFetchABMinWeek.Open;
      if not qryFetchABMinWeekFIRSTWEEKINMONTH.IsNull then
      begin
        frmABLoanMonthlyReport:=TfrmABLoanMonthlyReport.Create(Application);
        frmABLoanMonthlyReport.qryReport.Close;
        frmABLoanMonthlyReport.qryReport.SQL.Clear;
        frmABLoanMonthlyReport.qryReport.SQL.Add('select emp.clkno,emp.surname,emp.firstname,');
        frmABLoanMonthlyReport.qryReport.SQL.Add('  emp.abloanaccno,emp.abloanstartvalue,');
        frmABLoanMonthlyReport.qryReport.SQL.Add('  emp.abloanac,emp.abrepaylnmonth,');
        frmABLoanMonthlyReport.qryReport.SQL.Add('  emp.abrepayterm,');
        frmABLoanMonthlyReport.qryReport.SQL.Add('  ph.aboldbal,ph.thisweek,ph.paykind,');
        frmABLoanMonthlyReport.qryReport.SQL.Add('  sum(ph2.ablessrepay) ablessrepay,');
        frmABLoanMonthlyReport.qryReport.SQL.Add('  (ph.aboldbal-sum(ph2.ablessrepay)) endofmonthbal');
        frmABLoanMonthlyReport.qryReport.SQL.Add('from employee emp,paysliphist ph,paysliphist ph2,weeksinmonth wim');
        frmABLoanMonthlyReport.qryReport.SQL.Add('where ph.thisweek=:firstweekinmonth'); //added parameter DL030303
        {frmABLoanMonthlyReport.qryReport.SQL.Add('('); - removed DL030303 Made a separate query: qryFetchABMinWeek
        frmABLoanMonthlyReport.qryReport.SQL.Add('select wi.fromwagesweekend');
        frmABLoanMonthlyReport.qryReport.SQL.Add('from weeksinmonth wi');
        frmABLoanMonthlyReport.qryReport.SQL.Add('where wi.yearno=:yearno');
        frmABLoanMonthlyReport.qryReport.SQL.Add('and wi.monthno=:monthno');
        frmABLoanMonthlyReport.qryReport.SQL.Add(')');}
        frmABLoanMonthlyReport.qryReport.SQL.Add('and ph.aboldbal<>0');
        frmABLoanMonthlyReport.qryReport.SQL.Add('and emp.clkno=ph.clkno');
        frmABLoanMonthlyReport.qryReport.SQL.Add('and ph.clkno=ph2.clkno');
        frmABLoanMonthlyReport.qryReport.SQL.Add('and ph.paykind=ph2.paykind');
        frmABLoanMonthlyReport.qryReport.SQL.Add('and wim.yearno=:yearno');
        frmABLoanMonthlyReport.qryReport.SQL.Add('and wim.monthno=:monthno');
        frmABLoanMonthlyReport.qryReport.SQL.Add('and ph2.thisweek between wim.fromwagesweekend and wim.towagesweekend');
        frmABLoanMonthlyReport.qryReport.SQL.Add('group by emp.clkno,emp.surname,emp.firstname,');
        frmABLoanMonthlyReport.qryReport.SQL.Add('  emp.abloanaccno,emp.abloanstartvalue,');
        frmABLoanMonthlyReport.qryReport.SQL.Add('  emp.abloanac,emp.abrepaylnmonth,');
        frmABLoanMonthlyReport.qryReport.SQL.Add('  emp.abrepayterm,');
        frmABLoanMonthlyReport.qryReport.SQL.Add('  ph.aboldbal,ph.thisweek,ph.paykind');
        frmABLoanMonthlyReport.qryReport.SQL.Add('order by emp.clkno');
        frmABLoanMonthlyReport.qrlYearMonth.Caption:='Year / Month: '+
          inttostr(YearNo) + ' / '+
          inttostr(MonthNo);
        frmABLoanMonthlyReport.qryReport.ParamByName('YearNo').AsInteger:=YearNo;
        frmABLoanMonthlyReport.qryReport.ParamByName('MonthNo').AsInteger:=MonthNo;
        frmABLoanMonthlyReport.qryReport.ParamByName('FirstWeekInMonth').AsDateTime:=
          qryFetchABMinWeekFIRSTWEEKINMONTH.AsDateTime;
        frmABLoanMonthlyReport.qryReport.Open;
        frmABLoanMonthlyReport.tabCompany.Open;
        frmABLoanMonthlyReport.qrpReport.Preview;
        frmABLoanMonthlyReport.qryReport.Close;
        frmABLoanMonthlyReport.tabCompany.Close;
      end;
      qryFetchABMinWeek.Close;
    end; //African Bank Monthly Report

    //Provident Fund Weekly Report added DL090504
    //Print the Provident Fund Weekly Loan Repayment Report if required
    //One way is to compare if the months are different
    qryCheckPFRepayment.Close;
    qryCheckPFRepayment.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
    if PayKind = pkNormal then
      qryCheckPFRepayment.ParamByName('PayKind').AsString:='AW'
    else if PayKind = pkFinal then
      qryCheckPFRepayment.ParamByName('PayKind').AsString:='BF'
    else  //don't print anything
      qryCheckPFRepayment.ParamByName('PayKind').AsString:='XX';
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
      frmPFLoanWklyReport.qryReport.SQL.Add('from employee emp,paysliphist ph');
      frmPFLoanWklyReport.qryReport.SQL.Add('where emp.clkno=ph.clkno');
      frmPFLoanWklyReport.qryReport.SQL.Add('and ph.paykind=:paykind');
      frmPFLoanWklyReport.qryReport.SQL.Add('and ph.thisweek=:thisweek');
      frmPFLoanWklyReport.qryReport.SQL.Add('and ph.PFlessrepay>0');
      frmPFLoanWklyReport.qryReport.SQL.Add('order by emp.clkno');
      frmPFLoanWklyReport.qryReport.ParamByName('ThisWeek').AsDateTime:=DisplayWeek;
      if PayKind = pkNormal then
        frmPFLoanWklyReport.qryReport.ParamByName('PayKind').AsString:='AW'
      else if PayKind = pkFinal then
        frmPFLoanWklyReport.qryReport.ParamByName('PayKind').AsString:='BF'
      else  //don't print anything
        frmPFLoanWklyReport.qryReport.ParamByName('PayKind').AsString:='XX';
      frmPFLoanWklyReport.qryReport.Open;
      frmPFLoanWklyReport.tabCompany.Open;
      frmPFLoanWklyReport.qrpReport.Preview;
      frmPFLoanWklyReport.qryReport.Close;
      frmPFLoanWklyReport.tabCompany.Close;
    end; //Provident Fund Weekly Report

    //Provident Fund Monthly Report added DL090504
    //Print the Provident Fund Loan Repayment Report if required
    //note that thisweekmm and nextweekmm must be calculated
    //differently because these reports are printed outside the batch
    RptThisWeekEnd:=DisplayWeek;
    RptNextWeekEnd:=DisplayWeek+7;
    DecodeDate(RptThisWeekEnd, YY, RptThisWeekMM, DD);
    DecodeDate(RptNextWeekEnd, YY, RptNextWeekMM, DD);
    if RptThisWeekMM <> RptNextWeekMM then
    begin
      //fetch min fromweekend: added DL030303 bec. doesn't work in January due
      // to annual year end
      DecodeDate(DisplayWeek, YearNo, MonthNo, DayNo); //DisplayWeek was ThisWeekEnd DL030501
      qryFetchPFMinWeek.Close;
      qryFetchPFMinWeek.ParamByName('YearNo').AsInteger:=YearNo;
      qryFetchPFMinWeek.ParamByName('MonthNo').AsInteger:=MonthNo;
      qryFetchPFMinWeek.Open;
      if not qryFetchPFMinWeekFIRSTWEEKINMONTH.IsNull then
      begin
        frmPFLoanMonthlyReport:=TfrmPFLoanMonthlyReport.Create(Application);
        frmPFLoanMonthlyReport.qryReport.Close;
        frmPFLoanMonthlyReport.qryReport.SQL.Clear;
        frmPFLoanMonthlyReport.qryReport.SQL.Add('select emp.clkno,emp.surname,emp.firstname,');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('  emp.PFloanaccno,emp.PFloanstartvalue,');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('  emp.PFloanac,emp.PFrepaylnmonth,');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('  emp.PFrepayterm,');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('  ph.PFoldbal,ph.thisweek,ph.paykind,');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('  sum(ph2.PFlessrepay) PFlessrepay,');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('  (ph.PFoldbal-sum(ph2.PFlessrepay)) endofmonthbal');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('from employee emp,paysliphist ph,paysliphist ph2,weeksinmonth wim');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('where ph.thisweek=:firstweekinmonth'); //added parameter DL030303
        //frmPFLoanMonthlyReport.qryReport.SQL.Add('and ph.paykind=:paykind'); //added parameter 060621 - removed parameter DL080513
        frmPFLoanMonthlyReport.qryReport.SQL.Add('and ((ph.paykind = ''AW'') or (ph.paykind = ''BF''))'); //added DL080513
        frmPFLoanMonthlyReport.qryReport.SQL.Add('and (((ph.PFoldbal<>0) and (ph.paykind = ''AW''))');
        frmPFLoanMonthlyReport.qryReport.SQL.Add(' or  ((ph.PFoldbal is null) and (ph.paykind = ''BF'')))'); //deal with the BF (finalpay) exceptions
        frmPFLoanMonthlyReport.qryReport.SQL.Add('and emp.clkno=ph.clkno');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('and ph.clkno=ph2.clkno');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('and ph.paykind=ph2.paykind');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('and wim.yearno=:yearno');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('and wim.monthno=:monthno');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('and ph2.thisweek between wim.fromwagesweekend and wim.towagesweekend');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('group by emp.clkno,emp.surname,emp.firstname,');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('  emp.PFloanaccno,emp.PFloanstartvalue,');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('  emp.PFloanac,emp.PFrepaylnmonth,');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('  emp.PFrepayterm,');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('  ph.PFoldbal,ph.thisweek,ph.paykind');
        frmPFLoanMonthlyReport.qryReport.SQL.Add('order by emp.clkno');
        frmPFLoanMonthlyReport.qrlYearMonth.Caption:='Year / Month: '+
          inttostr(YearNo) + ' / '+
          inttostr(MonthNo);
        frmPFLoanMonthlyReport.qryReport.ParamByName('YearNo').AsInteger:=YearNo;
        frmPFLoanMonthlyReport.qryReport.ParamByName('MonthNo').AsInteger:=MonthNo;
        frmPFLoanMonthlyReport.qryReport.ParamByName('FirstWeekInMonth').AsDateTime:=
          qryFetchPFMinWeekFIRSTWEEKINMONTH.AsDateTime;
        //Paykind condition and elses added DL060621 - removed DL080513
        {if PayKind = pkNormal then
          frmPFLoanMonthlyReport.qryReport.ParamByName('PayKind').AsString:='AW'
        else if PayKind = pkFinal then
          frmPFLoanMonthlyReport.qryReport.ParamByName('PayKind').AsString:='BF'
        else  //don't print anything
          frmPFLoanMonthlyReport.qryReport.ParamByName('PayKind').AsString:='XX';}

        frmPFLoanMonthlyReport.qryReport.Open;
        frmPFLoanMonthlyReport.tabCompany.Open;
        frmPFLoanMonthlyReport.qrpReport.Preview;
        frmPFLoanMonthlyReport.qryReport.Close;
        frmPFLoanMonthlyReport.tabCompany.Close;
      end;
      qryFetchPFMinWeek.Close;
    end; //Provident Fund Monthly Report

    //other monthly reports that Astrid has requested: added DL060508
    //Lawyer/Garnishee
    //Union Levy
    //Insurance
    //Council
    //Sick Fund
    //Medical Aid
    //Community Chest
    //Prov Fund
    //Overalls, Tools, Other

  end;
end;

procedure TfrmWeeklyWages.popFindMenuPopup(Sender: TObject);
begin
  if not dbnEmployee.Enabled then
    Abort;
  if popFindMenu.PopupComponent = edtEmployeeFullName then
    popFindMenu.DataField := 'ClkNo';
end;

procedure TfrmWeeklyWages.cbDatesChange(Sender: TObject);
begin
  //this can only happen in view mode
  //displayweek is only used in view mode
  if cbDates.ItemIndex > -1 then
  begin
    DisplayWeek := StrToDate(cbDates.Text);
    qryViewData.Close;

    qryViewEmployee.Close;
    qryViewEmployee.ParamByName('ThisWeek').AsDateTime := StrToDate(cbDates.Text);
    if PayKind=pkNormal then
      qryViewEmployee.ParamByName('PayKind').AsString:='AW'
    else if PayKind=pkFinal then
      qryViewEmployee.ParamByName('PayKind').AsString:='BF';
    qryViewEmployee.Open; //xxx

    if BatchMode then //xxx
      qryViewData.ParamByName('ClkNo').AsInteger := tabEmployeeCLKNO.AsInteger
    else
      qryViewData.ParamByName('ClkNo').AsInteger := qryViewEmployeeCLKNO.AsInteger;
    qryViewData.ParamByName('ThisWeek').AsDateTime := DisplayWeek;
    if PayKind=pkNormal then
      qryViewData.ParamByName('PayKind').AsString:='AW'
    else if PayKind=pkFinal then
      qryViewData.ParamByName('PayKind').AsString:='BF';
    qryViewData.Open;
  end;
end;

procedure TfrmWeeklyWages.udDatesClick(Sender: TObject;
  Button: TUDBtnType);
begin
  if Button = btNext  then
  begin
    if cbDates.ItemIndex > 0 then
    begin
      cbDates.ItemIndex := cbDates.ItemIndex - 1;
      cbDatesChange(nil);  //cbDatesChange(nil) call was outside the if statement DL050201
    end;
  end
  else
  begin
    cbDates.ItemIndex := cbDates.ItemIndex + 1;
    cbDatesChange(nil);  //cbDatesChange(nil) call was outside the if statement DL050201
  end;
end;

procedure TfrmWeeklyWages.edtNormalMMExit(Sender: TObject);
begin
  //code replaced on DL050201
  if (Sender as TDBEdit).Field.IsNull then
    (Sender as TDBEdit).Field.AsInteger:=0;
//  with Sender as TDBEdit do
//    if Field.IsNull then
//      Field.AsInteger := 0;
end;

procedure TfrmWeeklyWages.edtEmployeeFullNameChange(Sender: TObject);
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
        if PayKind=pkNormal then
          qryViewData.ParamByName('PayKind').AsString:='AW'
        else if PayKind=pkFinal then
          qryViewData.ParamByName('PayKind').AsString:='BF';
        qryViewData.Open;
      end;
    end;
    {else
    begin
      Close;
    end;}
  end;
{  if ((PayKind <> pkFinal) and (BatchMode)) or (PayKind = pkFinal) then
    if tabEmployeeDISCHARGEDATE.AsDateTime <> 0 then
      Panel3.Visible := True
    else
      Panel3.Visible := False;}
end;

procedure TfrmWeeklyWages.tabEmployeeAfterEdit(DataSet: TDataSet);
begin
  btnSave.Enabled := True;
  btnCancel.Enabled := True;
end;

procedure TfrmWeeklyWages.tabEmployeeBeforePost(DataSet: TDataSet);
begin
  if PayKind = pkFinal then
  begin
    tabEmployeeSAVEAC.AsFloat := 0;
    tabEmployeeRENTAC.AsFloat := 0;
    tabEmployeeLOANAC.AsFloat := 0;
  end;
end;

procedure TfrmWeeklyWages.dbnPaySlipClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  //see note in OnNewRecord DL301199
  if (PayKind = pkFinal) and (edtNormalHH.Text='') then
  begin
    calDischargeDate.Visible := True;
    lblDischargeDate.Visible:=true;
    btnPostBatch.Enabled := True;
    MakeEmpBatch; // make a batch entry for this employee
    BatchMode := True; //xx check this
    dbnEmployee.Enabled := False; //is this here to prevent nested transactions?
  end;
end;

procedure TfrmWeeklyWages.tabPaySlipAfterPost(DataSet: TDataSet);
begin
  if not CreatingBatch then
    frmMain.Database.Commit;
end;

procedure TfrmWeeklyWages.tabPaySlipAfterCancel(DataSet: TDataSet);
begin
  if not CreatingBatch then
    frmMain.Database.Rollback;
end;

procedure TfrmWeeklyWages.Coinage(PSP:double);
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

procedure TfrmWeeklyWages.edtNormalHHEnter(Sender: TObject);
begin
  OldNormalHH:=tabPaySlipNORMALHH.AsInteger;
end;

procedure TfrmWeeklyWages.tabPaySlipNewRecord(DataSet: TDataSet);
begin
  //see MakeEmpBatch procedure
end;

procedure TfrmWeeklyWages.btnExportBatchClick(Sender: TObject);
var
  lString:string;
begin
  //export batch to Excel file. Added DL080228
(*  lstring:='c:\weeklywages'+formatdatetime('yyyymmdd',DisplayWeek)+'.xls';
  if MessageDlg('Export to '+lstring+'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    StatusBar1.SimpleText:='Fetching Data';
    Application.ProcessMessages;

    XLS.Clear;
    qryReport.Close;
    qryReport.SQL.Clear;
    qryReport.SQL.Add('select em.firstname,em.surname,');
    qryReport.SQL.Add('  em.bankaccref as accountnumber,');
    qryReport.SQL.Add('  em.banksortcode as branchcode,');
    qryReport.SQL.Add('  ''Vrede Salary'' as statementdescription,');
    qryReport.SQL.Add('  ph.totalpay*100 as amountincents,');
    qryReport.SQL.Add('  ba.description as bankname,');
    qryReport.SQL.Add('  ph.thisweek as weeklywagesdate,');
    qryReport.SQL.Add('  ''Normal'' as wagestype,');
    qryReport.SQL.Add('  ph.clkno');
    qryReport.SQL.Add('from paysliphist ph, employee em, bank ba');
    qryReport.SQL.Add('where ph.thisweek='''+formatdatetime('dd-mmm-yyyy',DisplayWeek)+'''');
    if PayKind = pkNormal then
      qryReport.SQL.Add('and ph.paykind=''AW''')
    else if PayKind = pkFinal then
      qryReport.SQL.Add('and ph.paykind=''BF''')
    else  //don't print anything
      qryReport.SQL.Add('and ph.paykind=''XX''');
    qryReport.SQL.Add('and ph.clkno=em.clkno');
    qryReport.SQL.Add('and em.bankref=ba.bankref');
    qryReport.SQL.Add('order by firstname,surname');

    qryReport.Open;
    XLSDb.Read;

    StatusBar1.SimpleText:='Writing Data';
    Application.ProcessMessages;

    XLS.Filename := lString;
    XLS.Write;

    //autosize the columns
    XLS.Sheets[0].AutoWidthCols(0,9);
    XLS.Write;

    //set the column formats for the dates and amounts
    //XLS.Sheets[0].Columns[8].NumberFormat:='dd/mm/yyyy hh:mm';
    XLS.Sheets[0].Columns[7].NumberFormat:='dd/mm/yyyy';
    //XLS.Sheets[0].Columns[12].NumberFormat:='dd/mm/yyyy';
    //XLS.Sheets[0].Columns[4].NumberFormat:='#,##0.00';

    //autosize the columns
    XLS.Sheets[0].AutoWidthCols(0,9);
    XLS.Write;

    StatusBar1.SimpleText:='XLS File Creation Complete';
    Application.ProcessMessages;
    ShowMessage(lString+' has been created.');
  end;*)
end; //btnExportBatchClick

end.

(*
procedure TfrmWeeklyWages.btnPrintPaySlipClick(Sender: TObject);
var
  ix:integer;
  BlankLines:integer;
  //PrintFile is defined in Main as a global variable
begin
  if not PrintDialog1.Execute then
    Exit;
//  Printer.PageHeight:=Round(Printer.Canvas.TextHeight('A')*5*1.5);
  AssignPrn(PrintFile);	{ associate text file to printer device }
  {System.}Rewrite(PrintFile);

//  PrnUnit.PrintPaySlip;
  try
    BlankLines := 7;                   { Number of blank lines on payslip. }
    writeln(PrintFile); writeln(PrintFile);
    //for I := 1 to Length(CoName) do
    //  write(PrintFile, upcase(CoName[I]));
    write(PrintFile,uppercase(tabCompanyCoName.AsString));
    PRept(' ',(40-Length(tabCompanyCoName.AsString)));
    write(PrintFile, '     WEEK ENDING:- ');
     writeln(PrintFile,FormatDateTime('dd/mm/yyyy',tabPaySlipThisWeek.AsDateTime));

    writeln(PrintFile); writeln(PrintFile);
    with Employee[ClkNo],PaySlip do
    begin
      TaxWeek := TaxWeek + 1;
      SickDays := SickDay + SickPayDays;

      { Update Global Variables that are only calculated once. }
      LoanDed := LoanDeduct;
      TaxWk := TaxDeduct(TaxEarnings,                   { This week's tax. }
                 PensionDeduct(ThisWeekYY,ThisWeekMM,ThisWeekDD,1),
                 ThisWeekYY,ThisWeekMM,ThisWeekDD);
      RentDed := RentDeduct(ThisWeekMM);

      writeln(PrintFile, 'Clock Number','Surname':16,'First Name':19,'Dept':9);
      write(PrintFile, ClkNo:7);
      SelectPrint(Company.BoldSel);
       write(PrintFile,Surname:25, FirstName:15);
       SelectPrint(Company.BoldClr);
       write(PrintFile, DeptNo:8);
       writeln(PrintFile);
      writeln(PrintFile);
      writeln(PrintFile, 'OLD':56, 'less':7, 'add':8, 'NEW':8);
      write(PrintFile, 'ITEM':9,'HRS.MINS':11,'PAY':6,'DEDUCT':12);
       write(PrintFile, 'AMOUNT':8,'BALANCE':10,'REPAY':7);
       write(PrintFile, 'NEW':8,'BALANCE':8);
       writeln(PrintFile);
      PRept('-',79); writeln(PrintFile);              { Underline Headings. }
      write(PrintFile, 'Normal':9,' ':4);
       if NormalHH<10 then write(PrintFile, '0'); write(PrintFile, NormalHH,'h');
       if NormalMM<10 then write(PrintFile, '0'); write(PrintFile, NormalMM);
       write(PrintFile, NormalPay:9:2,'Pension':11,
         PensionDeduct(ThisWeekYY,ThisWeekMM,ThisWeekDD,1):8:2);
       write(PrintFile, 'RENT A/C':10);
       writeln(PrintFile);
      write(PrintFile, 'O/T+1/3':9,' ':4);
       if OT13HH<10 then write(PrintFile, '0'); write(PrintFile, OT13HH,'h');
       if OT13MM<10 then write(PrintFile, '0'); write(PrintFile, OT13MM);
       write(PrintFile, OT13Pay:9:2,'Tax':11,TaxWk:8:2); {was TaxDeduct}
       write(PrintFile, RentAC:10:2,RentRepay(ThisWeekMM,NextWeekMM):7:2);
       write(PrintFile, RentDed:8:2,RentBalance:8:2);  { was RentDeduct }
       writeln(PrintFile);
      write(PrintFile, 'O/T+1/2':9,' ':4);
       if OT12HH<10 then write(PrintFile, '0'); write(PrintFile, OT12HH,'h');
       if OT12MM<10 then write(PrintFile, '0'); write(PrintFile, OT12MM);
       write(PrintFile, OT12Pay:9:2,'U.I.F.':11,UIFDeduct:8:2);
       write(PrintFile, 'SAVE A/C':10);
       writeln(PrintFile);
      write(PrintFile, 'O/Tx2':9,  ' ':4);
       if OTX2HH<10 then write(PrintFile, '0'); write(PrintFile, OTX2HH,'h');
       if OTX2MM<10 then write(PrintFile, '0'); write(PrintFile, OTX2MM);
       write(PrintFile, OTX2Pay:9:2,'Prov.Fund':11,
         ProvFundDeduct(1):8:2);
       write(PrintFile, SaveAC:10:2,SavingsPaid:7:2);
       write(PrintFile, SaveWk:8:2,SaveBalance:8:2);
       writeln(PrintFile);
      write(PrintFile, 'Att.Days':9,AttDays:9);
       write(PrintFile, AttBonusPay:9:2,'Council':11,CouncilDeduct:8:2);
       write(PrintFile, 'LOAN A/C':10);
       writeln(PrintFile);
      write(PrintFile, 'Prod Bon.':9,ProdBonus:18:2);  { No Calc Required. }
       write(PrintFile, 'Sick Fund':11,SickFundDeduct(1):8:2);
       write(PrintFile, LoanAC:10:2,LoanDed:7:2);  { was LoanDeduct }
       write(PrintFile, LoanGiven:8:2,LoanBalance:8:2);
       writeln(PrintFile);
      write(PrintFile, 'Nt Shift':9,NightShiftAllow:9:2);
       write(PrintFile, NightShiftPay:9:2,'Med. Aid':11,MedAid:8:2);
       writeln(PrintFile);
      write(PrintFile, 'Leave Pay-Days':14,LeavePayDays:4);
       write(PrintFile, LeavePay:9:2,'Insurance':11,Insurance:8:2);
       write(PrintFile, 'Full/Part Wks':15);
       write(PrintFile, 'Leave/Sick Days':17);
       writeln(PrintFile);
      write(PrintFile, 'RentAllow':9,
        RentAllowPay(ThisWeekMM,NextWeekMM):18:2); {params added on 29/3/90}
       write(PrintFile, 'Union Levy':11);           { changed on 03/02/93. }
       write(PrintFile, Other1Deduct(1):8:2);
       write(PrintFile, FullWeeks:6,PartWeeks:9);
       write(PrintFile, LeaveDays:7, SickDays:10);
       writeln(PrintFile);
      PRept('=',28); write(PrintFile, 'Other2':10,Other2:8:2);
       writeln(PrintFile);
      write(PrintFile, 'Earnings This Week',TaxEarnings:9:2,'Rent':11);
       write(PrintFile, RentDed:8:2,'SICK PAY':15);
       writeln(PrintFile);
      write(PrintFile, 'Add: Savings',SavingsPaid:15:2,'Savings/Wk':11);
       write(PrintFile, SaveWk:8:2,'Days':8,'Amount (added to pay)':23);
       writeln(PrintFile);
      write(PrintFile, 'Add:    Loan',LoanGiven:15:2,'RepayLn/Wk':11);
       write(PrintFile, LoanDed:8:2,SickPayDays:8,SickFundPay(SickDays):8:2);
       writeln(PrintFile);
      PRept('=',64); writeln(PrintFile);
      write(PrintFile, 'TOTAL':9,TotalEarnings:18:2,'less ':11);
       write(PrintFile, TotalDeduct:8:2,'=  PAY':8,TotalPay:8:2);
       writeln(PrintFile);                   { 1st time Total Pay is calc. }
    end;                                                           { with. }
    if PaySlipPay < 0 then                        { Neg Pay Loan required. }
    begin
      writeln(PrintFile, 'NegPay Ln':54, -PaySlipPay:8:2);
      writeln(PrintFile, '=========':63);
      writeln(PrintFile, 'New Pay':54, 0.0:8:2);
      BlankLines := BlankLines - 3;
    end;
    for I := 1 to BlankLines do writeln(PrintFile);
  finally
   {System.}CloseFile(PrintFile);
  end;
end;
*)

