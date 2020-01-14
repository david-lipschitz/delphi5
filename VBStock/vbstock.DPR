program Vbstock;
{ OD Weaving: Weaving Textile Factory Program - Version 6.5.8
  v6.2 includes Consignment Stock Capabilities
  Copyright: My Power Station Technology (Pty) Ltd 1986 - 2011
  Written: by David H Lipschitz
  Start Date:   August 1995.
  Last Update:  April 2011.  By DL.
}

uses
  Forms,
  Vbmain in 'VBMAIN.PAS' {MainForm},
  Vbmaint in 'VBMAINT.PAS' {VBMaintForm},
  Vbmodal in 'VBMODAL.PAS' {VBPickDlgForm},
  Pickdate in 'PICKDATE.PAS' {BrDateForm},
  Vbstru in 'VBSTRU.PAS' {VBStruForm},
  Vbtype in 'VBTYPE.PAS' {VBTypeForm},
  Vbwidth in 'VBWIDTH.PAS' {VBWidthForm},
  Vbutils in 'VBUTILS.PAS',
  Vbboxlab in 'VBBOXLAB.PAS' {VBBoxLabelForm},
  Password in 'PASSWORD.PAS' {PasswordDlg},
  Vbinitls in 'VBINITLS.PAS' {VBInitlsForm},
  Vbpalhdr in 'VBPALHDR.PAS' {VBPalHdrForm},
  Vbpallbl in 'VBPALLBL.PAS' {VBGenPalLabelForm},
  Vbbarcde in 'VBBARCDE.PAS' {VBBarCodeForm},
  Vbynstru in 'VBYNSTRU.PAS' {VBYnStruForm},
  Vbyncol in 'VBYNCOL.PAS' {VBYnColForm},
  Vbyntype in 'VBYNTYPE.PAS' {VBYnTypeForm},
  Vbynlot in 'VBYNLOT.PAS' {VBYarnLotForm},
  Loomtype in 'LOOMTYPE.PAS' {LoomTypeForm},
  Loomspec in 'LOOMSPEC.PAS' {LoomSpecForm},
  Struloom in 'STRULOOM.PAS' {StruLoomForm},
  Vbstkmin in 'VBSTKMIN.PAS' {VBStockMinForm},
  Warptype in 'WARPTYPE.PAS' {WarpTypeForm},
  Worwlot in 'WORWLOT.PAS' {WorWLotNoForm},
  Warpcol in 'WARPCOL.PAS' {WarpColForm},
  Warprcpt in 'WARPRCPT.PAS' {WarpRcptForm},
  Fablotno in 'FABLOTNO.PAS' {FabricLotNoForm},
  Vbrcpt in 'VBRCPT.PAS' {VBRcptForm},
  Vbordhdr in 'VBORDHDR.PAS' {VBOrdHdrForm},
  Vbsupcus in 'VBSUPCUS.PAS' {VBSupCusForm},
  vbpal in 'vbpal.pas' {VBPalletForm},
  wknos in 'wknos.pas' {WkNosForm},
  vbpick in 'vbpick.pas' {VBPickForm},
  vbstksum in 'vbstksum.pas' {VBStkSumForm},
  vbprell in 'vbprell.pas' {VBPreLLForm},
  agent in 'agent.pas' {AgentForm},
  vbeom in 'vbeom.PAS' {VBEOMForm},
  Prodcat in 'Prodcat.pas' {ProdCatForm},
  Product in 'Product.pas' {ProductForm},
  Aporder in 'Aporder.pas' {APOrderForm},
  Delin in 'Delin.pas' {DelInForm},
  Wiprcpt in 'Wiprcpt.pas' {WIPRcptForm},
  VBYnRcpt in 'VBYnRcpt.pas' {VBYnRcptForm},
  vbDeliss in 'vbDeliss.pas' {VBDelIssForm},
  stoksitu in 'stoksitu.pas' {StokSituForm},
  vbsalessitu in 'vbsalessitu.pas' {VBSalesSituForm},
  vbenq in 'vbenq.pas' {VBEnqForm},
  Brmodal in 'Brmodal.pas' {PickDlgForm},
  Abortbx in 'Abortbx.pas' {AbortForm},
  vbtrace in 'vbtrace.pas' {VBStripTraceForm},
  vbbal in 'vbbal.pas' {VBBalForm},
  fintype in 'fintype.pas' {VBFinTypeForm},
  weavesummary in 'weavesummary.pas' {WeaveSummaryForm},
  finrcpt in 'finrcpt.PAS' {frmFinRcpt},
  greyrcpt in 'greyrcpt.PAS' {frmGreigeRcpt},
  Vbmake in 'vbmake.PAS' {VBMakeForm},
  custpart in 'custpart.pas' {CustPartForm},
  reports in 'reports.pas' {ReportsForm},
  VBPckRep in 'VBPckRep.pas' {VBPickRepForm},
  QltyReason in 'QltyReason.pas' {QualityForm},
  vbparams in 'vbparams.pas' {VBParamsForm},
  VBQuery in 'VBQuery.pas' {VBQueryForm},
  vbtrace_new in 'vbtrace_new.pas' {NewVBStripTraceForm},
  reslit in 'reslit.pas' {frmReslit},
  vbspecialdesp in 'vbspecialdesp.pas' {frmSpecialDespatch},
  importcalemard in 'importcalemard.pas' {frmImportCalemard},
  updatewh in 'updatewh.pas' {frmUpdateWH},
  About in 'About.pas' {frmAbout},
  checkrowno in 'checkrowno.pas' {frmCheckRowNo},
  vbrefabric in 'vbrefabric.pas' {frmVBRefabric},
  fsetvbredundant in 'fsetvbredundant.pas' {frmSetVBRedundant};

{$R *.RES}

begin
  {Application.CreateForm(TVBTypeForm, VBTypeForm);}
  {Application.CreateForm(TVBStruForm, VBStruForm);}
  {Application.CreateForm(TVBWidthForm, VBWidthForm);}
  {Application.CreateForm(TVBLotNoForm, VBLotNoForm);}
  //Application.Title := 'Vertical Blind Stock System';
  Application.Title := 'OD Weaving Factory System';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TVBPickDlgForm, VBPickDlgForm);
  Application.CreateForm(TBrDateForm, BrDateForm);
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.CreateForm(TVBBarCodeForm, VBBarCodeForm);
  Application.CreateForm(TPickDlgForm, PickDlgForm);
  Application.CreateForm(TAbortForm, AbortForm);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmCheckRowNo, frmCheckRowNo);
  Application.Run;
end.
