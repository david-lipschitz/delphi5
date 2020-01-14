program Stock;
{ OD Spin: Spinning Factory Program - Version 5.0
  Copyright: My Power Station Technology (Pty) Ltd 1995 - 2006
  Start Date:   August 1995.
  Last Update:  January 2006.  By DL.
}

uses
  Forms,
  Initials in 'INITIALS.PAS' {InitialsForm},
  Param in 'PARAM.PAS' {ParamForm},
  Curr in 'CURR.PAS' {CurrencyForm},
  Terms in 'TERMS.PAS' {TermsForm},
  Prodcat in 'PRODCAT.PAS' {ProdCatForm},
  Measunit in 'MEASUNIT.PAS' {MeasUnitForm},
  Vtdept in 'VTDEPT.PAS' {DeptForm},
  Agent in 'AGENT.PAS' {AgentForm},
  Supplier in 'SUPPLIER.PAS' {SupplierForm},
  Product in 'PRODUCT.PAS' {ProductForm},
  Brmodal in 'BRMODAL.PAS' {PickDlgForm},
  Aporder in 'APORDER.PAS' {APOrderForm},
  Pickdate in 'PICKDATE.PAS' {BrDateForm},
  Utils in 'UTILS.PAS',
  Delin in 'DELIN.PAS' {DelInForm},
  Barcode in 'BARCODE.PAS' {BarCodeForm},
  Delissue in 'DELISSUE.PAS' {DelIssueForm},
  Ynkind in 'YNKIND.PAS' {YnKindForm},
  Ynstru in 'YNSTRU.PAS' {YarnStruForm},
  ctrlacct in 'ctrlacct.pas' {CtrlAcctForm},
  Ynrcpt in 'YNRCPT.PAS' {YnRcptForm},
  Yntype in 'YNTYPE.PAS' {YarnTypeForm},
  Ynpalhdr in 'YNPALHDR.PAS' {YnPalHdrForm},
  Wiprcpt in 'WIPRCPT.PAS' {WIPRcptForm},
  Password in 'PASSWORD.PAS' {PasswordDlg},
  Ynpallet in 'YNPALLET.PAS' {YnPalletForm},
  Pallabel in 'PALLABEL.PAS' {GenPalLabelForm},
  Lotnocnt in 'LOTNOCNT.PAS' {LotNoCountForm},
  Yneffgrp in 'YNEFFGRP.PAS' {YnEffGroupForm},
  Abortbx in 'ABORTBX.PAS' {AbortForm},
  Ynlotno in 'YNLOTNO.PAS' {YarnLotNoForm},
  speom in 'speom.pas' {SPeomForm},
  Main in 'Main.pas' {MainForm},
  issuerep in 'issuerep.pas' {IssueRepForm},
  Warptype in 'warptype.PAS' {WarpTypeForm},
  Yncol in 'Yncol.pas' {YarnColForm},
  About in 'About.pas' {frmAbout};

{$R *.RES}

begin
  //SplashForm := TSplashForm.Create(Application);
  //SplashForm.Show;
  //SplashForm.Update;
  Application.Title := 'OD Spinning Factory System';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPickDlgForm, PickDlgForm);
  Application.CreateForm(TBrDateForm, BrDateForm);
  Application.CreateForm(TBarCodeForm, BarCodeForm);
  Application.CreateForm(TAbortForm, AbortForm);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
