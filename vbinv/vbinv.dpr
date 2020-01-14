program vbinv;
{ OD Multi-Currency Invoicing Program - Version 2.0
  Copyright: My Power Station Technology (Pty) Ltd 1999 - 2006
  Written by David H Lipschitz
  Start Date:   May 1999.
  Last Update:  January 2006.  By DL.
  //added NewDespNo so that despno||'A' is printed DL020808
}

uses
  Forms,
  main in 'main.pas' {MainForm},
  currency in 'currency.pas' {frmCurrency},
  geninvoice in 'geninvoice.pas' {frmGenInvoice},
  invoice in 'invoice.pas' {frmInvoice},
  Vbutils in '..\VBStock\vbutils.PAS',
  invrptoy in 'invrptoy.pas' {frmInvoiceOY},
  invrptlm in 'invrptlm.pas' {frmInvoiceLM},
  About in 'about.pas' {frmAbout},
  Password in 'password.pas' {PasswordDlg},
  Vbmodal in '..\VBStock\Vbmodal.pas' {VBPickDlgForm},
  invrptom in 'invrptom.pas' {frmInvoiceOM};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'OD Multi-Currency Invoicing System';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmInvoiceOY, frmInvoiceOY);
  Application.CreateForm(TfrmInvoiceLM, frmInvoiceLM);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.CreateForm(TVBPickDlgForm, VBPickDlgForm);
  Application.CreateForm(TfrmInvoiceOM, frmInvoiceOM);
  Application.Run;
end.
