program summary;
{ OD Admin: Administration Program - Version 6.2.5
  Copyright: Orbital Decisions 1995 - 2006
  Start Date:   August 1995.
  Last Update:  July 2007.  By DL.
}


uses
  Forms,
  main in 'main.pas' {MainForm},
  txndetmonth in 'txndetmonth.pas' {TxnDetSummaryMonthForm},
  audit in 'audit.pas' {AuditForm},
  wipadjust in 'wipadjust.pas' {WIPAdjustForm},
  ctrlaccp in 'ctrlaccp.pas' {CtrlAccPForm},
  product in 'product.pas' {ProductForm},
  stdqlty in 'stdqlty.pas' {StdQltyForm},
  vblsp in 'vblsp.pas' {VBLSPForm},
  vbqlty in 'vbqlty.pas' {VBQltyForm},
  vbssp in 'vbssp.pas' {VBSSPForm},
  ynprices in 'ynprices.pas' {YnPricesForm},
  vbscp in 'vbscp.pas' {VBSCPForm},
  vbssp_new in 'vbssp_new.pas' {NewVBSSPForm},
  vblsp_new in 'vblsp_new.pas' {NewVBLSPForm},
  vbscp_new in 'vbscp_new.pas' {NewVBSCPForm},
  ynprices_new in 'ynprices_new.pas' {NewYnPricesForm},
  product_new in 'product_new.pas' {NewProductForm},
  ctrlaccp_new in 'ctrlaccp_new.pas' {NewCtrlAccPForm},
  EditStru in 'EditStru.pas' {VBStruForm},
  vbosp in 'vbosp.pas' {frmVBOSP},
  txndet in 'txndet.pas' {TxnDetSummaryForm},
  About in 'About.pas' {frmAbout},
  Password in 'password.pas' {PasswordDlg},
  fMakeRedundant in 'fMakeRedundant.pas' {frmMakeRedundant},
  fRMStock in 'fRMStock.pas' {frmRMStock};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'OD Administration System';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.Run;
end.
