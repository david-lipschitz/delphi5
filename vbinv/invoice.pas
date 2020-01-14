unit invoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, ComCtrls, StdCtrls, Mask, DBCtrls, Buttons,
  Grids, DBGrids, quickrpt, Qrctrls, Menus, ODDBFind;

type
  TfrmInvoice = class(TForm)
    tabVBInvHdr: TTable;
    tabVBInvHdrExtra: TTable;
    tabVBInvDet: TTable;
    datVBInvHdr: TDataSource;
    datVBInvHdrExtra: TDataSource;
    datVBInvDet: TDataSource;
    tabVBInvHdrDESPNO: TIntegerField;
    tabVBInvHdrINVNO: TIntegerField;
    tabVBInvHdrCUSTREF: TStringField;
    tabVBInvHdrINVDATE: TDateTimeField;
    tabVBInvHdrTERMSFROMDATE: TDateTimeField;
    tabVBInvHdrTERMSDAYS: TIntegerField;
    tabVBInvHdrCURRENCY: TStringField;
    tabVBInvHdrAGENTREF: TStringField;
    tabVBInvHdrOURREF: TStringField;
    tabVBInvHdrYOURREF: TStringField;
    tabVBInvHdrEXPORTCODE: TStringField;
    tabVBInvHdrPALLETS: TIntegerField;
    tabVBInvHdrBOXES: TIntegerField;
    tabVBInvHdrNETLENGTH: TFloatField;
    tabVBInvHdrLOC_TOTAL: TFloatField;
    tabVBInvHdrACC_TOTAL: TFloatField;
    tabVBInvHdrPALLETPRICE: TFloatField;
    tabVBInvHdrPALLETVALUE: TFloatField;
    tabVBInvHdrFREIGHTDOCUMENTATION: TFloatField;
    tabVBInvHdrFREIGHTBOXES: TFloatField;
    tabVBInvHdrLOC_GRAND_TOTAL: TFloatField;
    tabVBInvHdrACC_GRAND_TOTAL: TFloatField;
    tabVBInvHdrVATRATE: TFloatField;
    tabVBInvHdrVATAMT: TFloatField;
    tabVBInvHdrEXCHRATE: TFloatField;
    tabVBInvHdrINVBY: TStringField;
    tabVBInvHdrINVSENT: TStringField;
    tabVBInvHdrPHYSICALPALLETS: TIntegerField;
    tabVBInvHdrMETRICORIMPERIAL: TStringField;
    tabVBInvHdrExtraDESPNO: TIntegerField;
    tabVBInvHdrExtraINVNO: TIntegerField;
    tabVBInvHdrExtraSTREETADD1: TStringField;
    tabVBInvHdrExtraSTREETADD2: TStringField;
    tabVBInvHdrExtraSTREETADD3: TStringField;
    tabVBInvHdrExtraSTREETADD4: TStringField;
    tabVBInvHdrExtraSTREETADD5: TStringField;
    tabVBInvHdrExtraPOSTALADD1: TStringField;
    tabVBInvHdrExtraPOSTALADD2: TStringField;
    tabVBInvHdrExtraPOSTALADD3: TStringField;
    tabVBInvHdrExtraPOSTALADD4: TStringField;
    tabVBInvHdrExtraPOSTALADD5: TStringField;
    tabVBInvHdrExtraPLACELOAD: TStringField;
    tabVBInvHdrExtraPLACEDISCHARGE: TStringField;
    tabVBInvHdrExtraINCOTERMS: TStringField;
    tabVBInvHdrExtraPLACEDESTLINE1: TStringField;
    tabVBInvHdrExtraPLACEDESTLINE2: TStringField;
    tabVBInvHdrExtraCARRIAGEBYLINE1: TStringField;
    tabVBInvHdrExtraCARRIAGEBYLINE2: TStringField;
    tabVBInvHdrExtraTERMSLINE1: TStringField;
    tabVBInvHdrExtraTERMSLINE2: TStringField;
    tabVBInvHdrExtraNOTIFYLINE1: TStringField;
    tabVBInvHdrExtraNOTIFYLINE2: TStringField;
    tabVBInvHdrExtraNOTIFYLINE3: TStringField;
    tabVBInvHdrExtraTARRIFFWIDE: TStringField;
    tabVBInvHdrExtraTARRIFFNARROW: TStringField;
    tabVBInvHdrExtraSPECIALINFO: TMemoField;
    tabVBInvDetDESPNO: TIntegerField;
    tabVBInvDetINVNO: TIntegerField;
    tabVBInvDetLINENO: TIntegerField;
    tabVBInvDetVBSTRU: TStringField;
    tabVBInvDetVBFIN: TStringField;
    tabVBInvDetMETRICWIDTH: TIntegerField;
    tabVBInvDetQLTY: TStringField;
    tabVBInvDetNETLENGTHMETRES: TFloatField;
    tabVBInvDetNETLENGTHYARDS: TFloatField;
    tabVBInvDetPRICETYPE: TStringField;
    tabVBInvDetLOC_VALUE: TFloatField;
    tabVBInvDetLOC_PRICE: TFloatField;
    tabVBInvDetOVERRIDE_LOC_PRICE: TFloatField;
    Panel1: TPanel;
    pgcInvoice: TPageControl;
    tshInvHdr: TTabSheet;
    tshExtra: TTabSheet;
    tshDetails: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    edtExchRate: TDBEdit;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    Label28: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    Label39: TLabel;
    lblPlaceLoad: TLabel;
    edtPlaceLoad: TDBEdit;
    lblPlaceDischarge: TLabel;
    edtPlaceDischarge: TDBEdit;
    lblIncoTerms: TLabel;
    edtIncoTerms: TDBEdit;
    lblPlaceDestination: TLabel;
    edtPlaceDestinationLine1: TDBEdit;
    edtPlaceDestinationLine2: TDBEdit;
    lblCarriageBy: TLabel;
    edtCarriageByLine1: TDBEdit;
    edtCarriageByLine2: TDBEdit;
    lblTerms: TLabel;
    edtTermsLine1: TDBEdit;
    edtTermsLine2: TDBEdit;
    tshTariff: TTabSheet;
    tshSpecialInstructions: TTabSheet;
    lblNotifyLine3: TLabel;
    edtNotifyLine1: TDBEdit;
    edtNotifyLine2: TDBEdit;
    edtNotifyLine3: TDBEdit;
    Label31: TLabel;
    DBEdit52: TDBEdit;
    Label32: TLabel;
    DBEdit53: TDBEdit;
    DBMemo1: TDBMemo;
    Panel3: TPanel;
    dbgVBInvDet: TDBGrid;
    DBNavigator1: TDBNavigator;
    btnClose: TBitBtn;
    DBNavigator2: TDBNavigator;
    Label35: TLabel;
    lblNotify: TLabel;
    btnCancel: TButton;
    btnPost: TButton;
    Label37: TLabel;
    DBEdit54: TDBEdit;
    tabSupplier: TTable;
    datSupplier: TDataSource;
    tabSupplierSUPREF: TStringField;
    tabSupplierSUPDESCR: TStringField;
    Label38: TLabel;
    DBEdit55: TDBEdit;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    ModeIndicator: TLabel;
    tabVBInvHdrLOCALOVERSEAS: TStringField;
    Label44: TLabel;
    DBEdit56: TDBEdit;
    edtLocalExVAT: TDBEdit;
    dbcInvSent: TDBCheckBox;
    btnPrintInvoice: TButton;
    tabCurrency: TTable;
    tabCurrencyCURREF: TStringField;
    tabCurrencyDESCR: TStringField;
    tabCurrencyMULTDIV: TStringField;
    tabCurrencyEXCHRATE: TFloatField;
    tabCurrencyBEFOREAFTER: TStringField;
    tabSupplierCURRENCY: TStringField;
    tabVBInvHdrADDITIONALLOCAMT: TFloatField;
    tabVBInvHdrADDITIONALACCAMT: TFloatField;
    Label46: TLabel;
    DBEdit23: TDBEdit;
    Label47: TLabel;
    DBEdit50: TDBEdit;
    Label48: TLabel;
    DBEdit51: TDBEdit;
    tabVBInvHdrADDITIONALDETAILS: TStringField;
    tabCurrencySYMBOL: TStringField;
    qryQuery: TQuery;
    btnFindDespatch: TSpeedButton;
    lblOverrideFreight: TLabel;
    tabVBInvHdrOVERRIDEFREIGHT: TFloatField;
    tabVBInvHdrACC_TOTALBEFOREFREIGHT: TFloatField;
    tabVBInvHdrACC_TOTALINCLFREIGHT: TFloatField;
    edtOverrideFreight: TDBEdit;
    tabSupplierNEDLIBCUSTNO: TStringField;
    Label29: TLabel;
    DBEdit38: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure tabVBInvDetBeforeInsert(DataSet: TDataSet);
    procedure tabVBInvDetBeforeDelete(DataSet: TDataSet);
    procedure tabVBInvDetBeforeEdit(DataSet: TDataSet);
    procedure tabVBInvHdrExtraBeforeEdit(DataSet: TDataSet);
    procedure tabVBInvHdrAfterCancel(DataSet: TDataSet);
    procedure tabVBInvHdrAfterDelete(DataSet: TDataSet);
    procedure tabVBInvHdrAfterPost(DataSet: TDataSet);
    procedure tabVBInvHdrBeforeCancel(DataSet: TDataSet);
    procedure tabVBInvHdrBeforeEdit(DataSet: TDataSet);
    procedure tabVBInvHdrBeforeInsert(DataSet: TDataSet);
    procedure tabVBInvHdrDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tabVBInvDetBeforePost(DataSet: TDataSet);
    procedure datVBInvHdrStateChange(Sender: TObject);
    procedure tabVBInvHdrBeforePost(DataSet: TDataSet);
    procedure datVBInvHdrDataChange(Sender: TObject; Field: TField);
    procedure btnPrintInvoiceClick(Sender: TObject);
    procedure btnFindDespatchClick(Sender: TObject);
  private
    { Private declarations }
    InTxn:boolean;
    OldOverridePrice:double;
    OldExchRate:double;
    LocalValueChange:double;
  public
    { Public declarations }
  end;

var
  frmInvoice: TfrmInvoice;

implementation

{$R *.DFM}

uses Main,VBUtils,invrptom, invrptoy, Vbmodal, invrptlm;

procedure TfrmInvoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tabVBInvHdr.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  tabCurrency.Close;
  tabSupplier.Close;
  tabVBInvDet.Close;
  tabVBInvHdrExtra.Close;
  tabVBInvHdr.Close;
  Release;
end;

procedure TfrmInvoice.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInvoice.FormShow(Sender: TObject);
begin
  tabVBInvHdr.Open;
  tabVBInvHdrExtra.Open;
  tabVBInvDet.Open;
  tabSupplier.Open;
  tabCurrency.Open;
  InTxn:=false;
  LocalValueChange:=0;
  pgcInvoice.ActivePage:=tshInvHdr;
end;

procedure TfrmInvoice.btnPostClick(Sender: TObject);
begin
  tabVBInvHdr.Post;
end;

procedure TfrmInvoice.btnCancelClick(Sender: TObject);
begin
  tabVBInvHdr.Cancel;
end;

procedure TfrmInvoice.tabVBInvDetBeforeInsert(DataSet: TDataSet);
begin
  raise Exception.Create('Sorry, cannot insert detail lines');
end;

procedure TfrmInvoice.tabVBInvDetBeforeDelete(DataSet: TDataSet);
begin
  raise Exception.Create('Sorry, cannot delete detail lines');
end;

procedure TfrmInvoice.tabVBInvDetBeforeEdit(DataSet: TDataSet);
begin
  if tabVBInvHdrLOCALOVERSEAS.AsString<>'V' then
    raise Exception.Create('Nothing to edit as local client');
  tabVBInvHdr.Edit;
  OldOverridePrice:=tabVBInvDetOVERRIDE_LOC_PRICE.AsFloat;
end;

procedure TfrmInvoice.tabVBInvHdrExtraBeforeEdit(DataSet: TDataSet);
begin
  tabVBInvHdr.Edit;
end;

procedure TfrmInvoice.tabVBInvHdrAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  InTxn:=false;
  tabVBInvHdr.Refresh;
  tabVBInvHdrExtra.Refresh;
  tabVBInvDet.Refresh;
end;

procedure TfrmInvoice.tabVBInvHdrAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TfrmInvoice.tabVBInvHdrAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
  InTxn:=false;
end;

procedure TfrmInvoice.tabVBInvHdrBeforeCancel(DataSet: TDataSet);
begin
  if tabVBInvHdr.State=dsEdit then
    if MessageDlg('Cancel invoice being edited?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TfrmInvoice.tabVBInvHdrBeforeEdit(DataSet: TDataSet);
begin
  if tabVBInvHdrINVSENT.AsString='Y' then
    raise Exception.Create('Cannot edit sent despatch');
  if not InTxn then
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
  OldExchRate:=tabVBInvHdrEXCHRATE.AsFloat;
end;

procedure TfrmInvoice.tabVBInvHdrBeforeInsert(DataSet: TDataSet);
begin
  raise Exception.Create('Sorry, inserts not allowed');
end;

procedure TfrmInvoice.tabVBInvHdrDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TfrmInvoice.tabVBInvDetBeforePost(DataSet: TDataSet);
begin
  //can only override overseas prices, therefore freight not an issue
  //and doesn't need to be recalculated
  if OldOverridePrice<>tabVBInvDetOVERRIDE_LOC_PRICE.AsFloat then
  begin
    //subtract old value
    LocalValueChange:=LocalValueChange-tabVBInvDetLOC_VALUE.AsFloat;
    ModeIndicator.Caption:='Header Modification Rqd';
    ModeIndicator.Font.Color := clRed;
    if tabVBInvHdrMETRICORIMPERIAL.AsString='M' then
      tabVBInvDetLOC_VALUE.AsFloat:=
        DLRound(tabVBInvDetOVERRIDE_LOC_PRICE.AsFloat*
        tabVBInvDetNETLENGTHMETRES.AsFloat,100)
    else //imperial -> prices per yards
      tabVBInvDetLOC_VALUE.AsFloat:=
        DLRound(tabVBInvDetOVERRIDE_LOC_PRICE.AsFloat*
        tabVBInvDetNETLENGTHYARDS.AsFloat,100);
    //add new value
    LocalValueChange:=LocalValueChange+tabVBInvDetLOC_VALUE.AsFloat;
  end;
end;

procedure TfrmInvoice.datVBInvHdrStateChange(Sender: TObject);
begin
  btnPost.Enabled := tabVBInvHdr.State in [dsEdit, dsInsert];
  btnCancel.Enabled := tabVBInvHdr.State in [dsEdit];
  btnClose.Enabled := tabVBInvHdr.State = dsBrowse;
  btnPrintInvoice.Enabled:=btnClose.Enabled;
//  PrintBtn.Enabled:=CloseBitBtn.Enabled; {can only print after save or cancel}
  if tabVBInvHdr.State in [dsEdit, dsInsert] then
  begin
    {if DetailPriceChanged then
    begin
      ModeIndicator.Caption:='Header Modification Rqd';
      ModeIndicator.Font.Color := clRed;
    end;}
    ModeIndicator.Caption := 'Edit, Insert';
    ModeIndicator.Font.Color := clRed;
  end
  else
  begin
    ModeIndicator.Caption := 'Browse';
    ModeIndicator.Font.Color := clBlue;
  end;
end;

procedure TfrmInvoice.tabVBInvHdrBeforePost(DataSet: TDataSet);
var
  FreightBoxes,VATAmt:double;
begin
{  if DetailPriceChanged then
  begin
    //Update the total summary fields on the header record that
    //are changed when there is a detail price change, ie local total,
    //freight, etc
  end;}
  //make the adjustment in the local value
  if tabVBInvHdrLOCALOVERSEAS.AsString='V' then
  begin
    if LocalValueChange<>0 then
      tabVBInvHdrLOC_TOTAL.AsFloat:=tabVBInvHdrLOC_TOTAL.AsFloat+
        LocalValueChange;
    //if (tabVBInvHdrEXCHRATE.AsFloat<>OldExchRate) then
    tabVBInvHdrACC_TOTAL.AsFloat:=tabVBInvHdrLOC_TOTAL.AsFloat*
      tabVBInvHdrEXCHRATE.AsFloat;
    if tabVBInvHdrADDITIONALLOCAMT.AsFloat<>0 then
    begin
      tabVBInvHdrADDITIONALACCAMT.AsFloat:=tabVBInvHdrADDITIONALLOCAMT.AsFloat*
        tabVBInvHdrEXCHRATE.AsFloat;
    end;
    tabVBInvHdrLOC_GRAND_TOTAL.AsFloat:=tabVBInvHdrLOC_TOTAL.AsFloat+
      tabVBInvHdrADDITIONALLOCAMT.AsFloat;
    tabVBInvHdrACC_GRAND_TOTAL.AsFloat:=tabVBInvHdrACC_TOTAL.AsFloat+
      tabVBInvHdrADDITIONALACCAMT.AsFloat;
  end
  else
  begin
    //else local customer
    FreightBoxes:=0;
    if tabVBInvHdrLOCALOVERSEAS.AsString='V' then
      tabVBInvHdrACC_TOTALINCLFREIGHT.AsFloat:=0
    else
    begin
      if tabVBInvHdrOVERRIDEFREIGHT.AsFloat=0 then //added DL030204
        FreightBoxes:=tabVBInvHdrFREIGHTBOXES.AsFloat
      else
        FreightBoxes:=tabVBInvHdrOVERRIDEFREIGHT.AsFloat;
      tabVBInvHdrACC_TOTALBEFOREFREIGHT.AsFloat:=
        tabVBInvHdrLOC_TOTAL.AsFloat+
        tabVBInvHdrADDITIONALLOCAMT.AsFloat;
      tabVBInvHdrACC_TOTALINCLFREIGHT.AsFloat:=
        tabVBInvHdrACC_TOTALBEFOREFREIGHT.AsFloat+
        tabVBInvHdrPALLETVALUE.AsFloat+
        tabVBInvHdrFREIGHTDOCUMENTATION.AsFloat+
        FreightBoxes; //might be OverrideFreight or Computer Calc
      VATAmt:=DLRound((tabVBInvHdrACC_TOTALINCLFREIGHT.AsFloat)*tabVBInvHdrVATRATE.AsFloat/100,100);
      tabVBInvHdrVATAMT.AsFloat:=VATAmt;
      tabVBInvHdrLOC_GRAND_TOTAL.AsFloat:=
        tabVBInvHdrACC_TOTALINCLFREIGHT.AsFloat+VATAmt;
      tabVBInvHdrACC_GRAND_TOTAL.AsFloat:=
        tabVBInvHdrACC_TOTALINCLFREIGHT.AsFloat+VATAmt;
    end;
  end;
  OldExchRate:=0;
  LocalValueChange:=0;
end;

procedure TfrmInvoice.datVBInvHdrDataChange(Sender: TObject;
  Field: TField);
begin
  if tabVBInvHdrLOCALOVERSEAS.AsString='V' then
  begin
    edtExchRate.ReadOnly:=false;
    edtExchRate.Color:=clWindow;
    dbgVBInvDet.Columns[9].Color:=clWindow;
    dbgVBInvDet.Columns[9].ReadOnly:=false;
    //tshExtra.TabVisible:=true; - removed DL030204
    tshTariff.TabVisible:=true;
    //tshSpecialInstructions.TabVisible:=true; - removed DL030204
  end
  else
  begin
    edtExchRate.ReadOnly:=true;
    edtExchRate.Color:=clSilver;
    dbgVBInvDet.Columns[9].Color:=cl3DLight;
    dbgVBInvDet.Columns[9].ReadOnly:=true;
    //tshExtra.TabVisible:=false; - removed DL030204
    tshTariff.TabVisible:=false;
    //tshSpecialInstructions.TabVisible:=false; - removed DL030204
  end;
end;

procedure TfrmInvoice.btnPrintInvoiceClick(Sender: TObject);
begin
  if tabVBInvHdr.State in [dsEdit,dsInsert] then
    raise Exception.Create('Please save before printing');
  //DL041001: do a cast update before printing to ensure no rounding problem
  MainForm.Database.StartTransaction;
  qryQuery.Close;
  qryQuery.SQL.Clear;
  qryQuery.SQL.Add('update vbinvdet');
  qryQuery.SQL.Add('set loc_value=cast(loc_value*100 as integer)/100,');
  qryQuery.SQL.Add('  netlengthyards=cast(netlengthyards*100 as integer)/100');
  qryQuery.SQL.Add('where despno='+tabVBInvHdrDESPNO.AsString);
  qryQuery.ExecSQL;
  MainForm.Database.Commit;

  if tabVBInvHdrLOCALOVERSEAS.AsString='V' then
  begin
    if tabVBInvHdrMETRICORIMPERIAL.AsString='M' then
    begin
      if tabCurrencyBEFOREAFTER.AsString='B' then //currency symbol is before amount
      begin
        frmInvoiceOM.qrdPricePerM.Mask:=tabCurrencySYMBOL.AsString+'0.000';
        frmInvoiceOM.qrdLoc_Value.Mask:=tabCurrencySYMBOL.AsString+'#,##0.00';
        frmInvoiceOM.qreLoc_ValueTotal.Mask:=tabCurrencySYMBOL.AsString+'#,##0.00';
        frmInvoiceOM.qrdAdditionalLocAmt.Mask:=tabCurrencySYMBOL.AsString+'#,##0.00';
        frmInvoiceOM.qrdLoc_GrandTotal.Mask:=tabCurrencySYMBOL.AsString+'#,##0.00';
      end
      else //currency symbol after amount
      begin
        frmInvoiceOM.qrdPricePerM.Mask:='0.000'+tabCurrencySYMBOL.AsString;
        frmInvoiceOM.qrdLoc_Value.Mask:='#,##0.00'+tabCurrencySYMBOL.AsString;
        frmInvoiceOM.qreLoc_ValueTotal.Mask:='#,##0.00'+tabCurrencySYMBOL.AsString;
        frmInvoiceOM.qrdAdditionalLocAmt.Mask:='#,##0.00'+tabCurrencySYMBOL.AsString;
        frmInvoiceOM.qrdLoc_GrandTotal.Mask:='#,##0.00'+tabCurrencySYMBOL.AsString;
      end;
      frmInvoiceOM.qryVBInvHdr.Close;
      frmInvoiceOM.qryVBInvHdr.ParamByName('DespNo').AsInteger:=tabVBInvHdrDESPNO.AsInteger;
      frmInvoiceOM.qryVBInvHdr.ParamByName('InvNo').AsInteger:=tabVBInvHdrINVNO.AsInteger;
      frmInvoiceOM.qryVBInvHdr.Open;
      frmInvoiceOM.qryVBInvDet.Close;
      frmInvoiceOM.qryVBInvDet.ParamByName('DespNo').AsInteger:=tabVBInvHdrDESPNO.AsInteger;
      frmInvoiceOM.qryVBInvDet.ParamByName('InvNo').AsInteger:=tabVBInvHdrINVNO.AsInteger;
      frmInvoiceOM.qryVBInvDet.Open;
      frmInvoiceOM.qrpInvoiceM.Preview;
    end
    else
    begin
      if tabCurrencyBEFOREAFTER.AsString='B' then //currency symbol is before amount
      begin
        frmInvoiceOY.qrdPricePerM.Mask:=tabCurrencySYMBOL.AsString+'0.000';
        frmInvoiceOY.qrdLoc_Value.Mask:=tabCurrencySYMBOL.AsString+'#,##0.00';
        frmInvoiceOY.qreLoc_ValueTotal.Mask:=tabCurrencySYMBOL.AsString+'#,##0.00';
        frmInvoiceOY.qrdAdditionalLocAmt.Mask:=tabCurrencySYMBOL.AsString+'#,##0.00';
        frmInvoiceOY.qrdLoc_GrandTotal.Mask:=tabCurrencySYMBOL.AsString+'#,##0.00';
      end
      else //currency symbol after amount
      begin
        frmInvoiceOY.qrdPricePerM.Mask:='0.000'+tabCurrencySYMBOL.AsString;
        frmInvoiceOY.qrdLoc_Value.Mask:='#,##0.00'+tabCurrencySYMBOL.AsString;
        frmInvoiceOY.qreLoc_ValueTotal.Mask:='#,##0.00'+tabCurrencySYMBOL.AsString;
        frmInvoiceOY.qrdAdditionalLocAmt.Mask:='#,##0.00'+tabCurrencySYMBOL.AsString;
        frmInvoiceOY.qrdLoc_GrandTotal.Mask:='#,##0.00'+tabCurrencySYMBOL.AsString;
      end;
      frmInvoiceOY.qryVBInvHdr.Close;
      frmInvoiceOY.qryVBInvHdr.ParamByName('DespNo').AsInteger:=tabVBInvHdrDESPNO.AsInteger;
      frmInvoiceOY.qryVBInvHdr.ParamByName('InvNo').AsInteger:=tabVBInvHdrINVNO.AsInteger;
      frmInvoiceOY.qryVBInvHdr.Open;
      frmInvoiceOY.qryVBInvDet.Close;
      frmInvoiceOY.qryVBInvDet.ParamByName('DespNo').AsInteger:=tabVBInvHdrDESPNO.AsInteger;
      frmInvoiceOY.qryVBInvDet.ParamByName('InvNo').AsInteger:=tabVBInvHdrINVNO.AsInteger;
      frmInvoiceOY.qryVBInvDet.Open;
      frmInvoiceOY.qrpInvoiceY.Preview;
    end;
  end
  else  //local invoice: added DL030204
  begin
    frmInvoiceLM.qrdPricePerM.Mask:='0.000';
    frmInvoiceLM.qrdLoc_Value.Mask:='#,##0.00';
    frmInvoiceLM.qreLoc_ValueTotal.Mask:='#,##0.00';
    frmInvoiceLM.qrdAdditionalLocAmt.Mask:='#,##0.00';
    frmInvoiceLM.qrdLoc_GrandTotal.Mask:='#,##0.00';
    frmInvoiceLM.qrlPhysicalPallets.Caption:=
      inttostr(tabVBInvHdrPHYSICALPALLETS.AsInteger) +
      ' @ R'+formatfloat('#,##0.00',tabVBInvHdrPALLETPRICE.AsFloat)+
      ' per pallet';
    if tabVBInvHdrExtraPLACELOAD.IsNull or (tabVBInvHdrExtraPLACELOAD.AsString='') then
      frmInvoiceLM.qrlPlaceLoad.Caption:='Vrede Factory'
    else
      frmInvoiceLM.qrlPlaceLoad.Caption:=tabVBInvHdrExtraPLACELOAD.AsString;
    if tabVBInvHdrOVERRIDEFREIGHT.AsFloat=0 then
      frmInvoiceLM.qrlFreight.Caption:=formatfloat('#,##0.00',
        tabVBInvHdrFREIGHTBOXES.AsFloat)
    else
      frmInvoiceLM.qrlFreight.Caption:=formatfloat('#,##0.00',
        tabVBInvHdrOVERRIDEFREIGHT.AsFloat);
    if tabVBInvHdrADDITIONALDETAILS.AsString='' then
      frmInvoiceLM.qrlDiscountSurcharge.Caption:='Discount/Surcharge'
    else
      frmInvoiceLM.qrlDiscountSurcharge.Caption:=
        tabVBInvHdrADDITIONALDETAILS.AsString;
    frmInvoiceLM.qryVBInvHdr.Close;
    frmInvoiceLM.qryVBInvHdr.ParamByName('DespNo').AsInteger:=tabVBInvHdrDESPNO.AsInteger;
    frmInvoiceLM.qryVBInvHdr.ParamByName('InvNo').AsInteger:=tabVBInvHdrINVNO.AsInteger;
    frmInvoiceLM.qryVBInvHdr.Open;
    frmInvoiceLM.qryVBInvDet.Close;
    frmInvoiceLM.qryVBInvDet.ParamByName('DespNo').AsInteger:=tabVBInvHdrDESPNO.AsInteger;
    frmInvoiceLM.qryVBInvDet.ParamByName('InvNo').AsInteger:=tabVBInvHdrINVNO.AsInteger;
    frmInvoiceLM.qryVBInvDet.Open;
    frmInvoiceLM.qrpInvoiceM.Preview;
  end; //local invoice
end; //btnPrintInvoiceClick

procedure TfrmInvoice.btnFindDespatchClick(Sender: TObject);
begin
  //replaced ODFind with this DL030203
  if datVBInvHdr.State=dsEdit then
    raise Exception.Create('Cannot search whilst in Edit Mode');
  if VBPickDlgForm.ShowModalVBDesp = mrOk then
  begin
    tabVBInvDet.Close;
    tabVBInvHdrExtra.Close;
    tabVBInvHdr.Close;
    tabVBInvHdr.Filter:='Despno>='+inttostr(VBPickDlgForm.VBDespHdrDespNo);
    tabVBInvHdr.Filtered:=true;
    tabVBInvHdr.Open;
    tabVBInvHdrExtra.Open;
    tabVBInvDet.Open;
  end;
  Screen.Cursor:=crDefault;
end; //btnFindDespatchClick

end.
