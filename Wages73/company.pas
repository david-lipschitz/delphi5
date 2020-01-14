unit company;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, ExtCtrls, Db,
  DBTables, Printers;

type
  TfrmCompany = class(TForm)
    pgeCompany: TPageControl;
    tshCompany: TTabSheet;
    tshPrinter: TTabSheet;
    tshTaxInfo: TTabSheet;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    Label1: TLabel;
    edtCoName: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label8: TLabel;
    Label9: TLabel;
    btnEdit: TBitBtn;
    tshUserConstants: TTabSheet;
    edtRentAllowance: TDBEdit;
    edtOther1: TDBEdit;
    edtAnnualBonMin: TDBEdit;
    edtLastWeek: TDBEdit;
    edtStartNumber: TDBEdit;
    tshSystemConstants: TTabSheet;
    edtATxWk: TDBEdit;
    edtWeeksInYear: TDBEdit;
    Label14: TLabel;
    Panel1: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtMaxPayRate: TDBEdit;
    edtMinPayRate: TDBEdit;
    Label13: TLabel;
    edtMinStartAge: TDBEdit;
    edtMaxStartAge: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    tabCompany: TTable;
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
    datTaxTable: TDataSource;
    datTaxConstants: TDataSource;
    datCompany: TDataSource;
    DBEdit35: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    tabCompanyATAXYEAR: TIntegerField;
    Label37: TLabel;
    edtATaxYear: TDBEdit;
    tabCompanyNORMALFONT: TStringField;
    tabCompanyCOMPRESSEDFONT: TStringField;
    cmbPrinter: TDBComboBox;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    cmbNormalFont: TDBComboBox;
    cmbCompressedFont: TDBComboBox;
    tabCompanyPRINTER: TStringField;
    btnDefaultPrinter: TButton;
    btnTestPrint: TButton;
    dlgSetup: TPrinterSetupDialog;
    dlgPrint: TPrintDialog;
    Label5: TLabel;
    edtBatUserName: TDBEdit;
    Label6: TLabel;
    tabCompanyBATUSERNAME: TStringField;
    Label38: TLabel;
    Label39: TLabel;
    DBEdit1: TDBEdit;
    tabCompanySICKFUNDPAYPERCENT: TFloatField;
    tabCompanySERVICEBONUS: TFloatField;
    Label40: TLabel;
    DBEdit2: TDBEdit;
    Label41: TLabel;
    btnFixBalances: TButton;
    qryGetPaySlipHist: TQuery;
    qryFixTable: TQuery;
    StatusBar: TStatusBar;
    Label42: TLabel;
    btnFixPFBalances: TButton;
    qryPFFixNulls: TQuery;
    qryPFFetchPaySlipHist: TQuery;
    qryPFUpdatePaySlipHist: TQuery;
    qryPFUpdateEmployee: TQuery;
    qryPFFetchPaySlipHistCLKNO: TIntegerField;
    qryPFFetchPaySlipHistTHISWEEK: TDateTimeField;
    qryPFFetchPaySlipHistPFOLDBAL: TFloatField;
    qryPFFetchPaySlipHistPFLESSREPAY: TFloatField;
    qryPFFetchPaySlipHistPFADDNEW: TFloatField;
    qryPFFetchPaySlipHistPFNEWBAL: TFloatField;
    Label43: TLabel;
    DBEdit3: TDBEdit;
    Label44: TLabel;
    tabCompanyANNUALBONUSWEEKS: TFloatField;
    Label45: TLabel;
    Label46: TLabel;
    tabCompanyUNIONSUBSPERCENT: TFloatField;
    tabCompanyUNIONMINEXCLFUNERALLEVY: TFloatField;
    tabCompanyUNIONMAXEXCLFUNERALLEVY: TFloatField;
    tabCompanyFUNERALLEVY: TFloatField;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label53: TLabel;
    qryTaxConstants: TQuery;
    qryTaxTable: TQuery;
    qryTaxConstantsTAXYR: TIntegerField;
    qryTaxConstantsPRIMREB: TFloatField;
    qryTaxConstantsPERSON65R: TFloatField;
    qryTaxTableTAXYR: TIntegerField;
    qryTaxTableFROMTAXABLEINCOME: TFloatField;
    qryTaxTableTOTAXABLEINCOME: TFloatField;
    qryTaxTableTAX: TFloatField;
    qryTaxTableEXTRAPERCENT: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure datCompanyStateChange(Sender: TObject);
    procedure tabCompanyBeforeEdit(DataSet: TDataSet);
    procedure tabCompanyAfterPost(DataSet: TDataSet);
    procedure tabCompanyAfterCancel(DataSet: TDataSet);
    procedure btnDefaultPrinterClick(Sender: TObject);
    procedure cmbPrinterChange(Sender: TObject);
    procedure btnTestPrintClick(Sender: TObject);
    procedure btnFixBalancesClick(Sender: TObject);
    procedure btnFixPFBalancesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompany: TfrmCompany;

implementation

{$R *.DFM}

uses Main, printslip;

procedure TfrmCompany.FormShow(Sender: TObject);
begin
//  dmCompany:=TdmCompany.Create(Application);
  Width:=544; //added DL050305

  cmbPrinter.Items.Assign(Printer.Printers);       //JT040199

  qryTaxTable.Close;
  qryTaxConstants.Close;

  tabCompany.Open;
  tabCompany.FindKey([1]);
  qryTaxConstants.Open;
  qryTaxTable.Open;

  pgeCompany.ActivePage:=tshCompany;

  cmbPrinterChange(nil);  //JT040199  update
end;

procedure TfrmCompany.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryFixTable.Close; //added DL080501
  qryTaxTable.Close;
  qryTaxConstants.Close;
  tabCompany.Close;
//  dmCompany.Free; when using data modules
  Release;
end;

procedure TfrmCompany.btnSaveClick(Sender: TObject);
begin         //JT040199
  if (cmbNormalFont.ItemIndex = -1) or (cmbCompressedFont.ItemIndex = -1) then
    MessageDlg('The printer normal & compressed fonts must be selected',
      mtError, [mbOK], 0)
  else
    tabCompany.Post;
end;

procedure TfrmCompany.btnCancelClick(Sender: TObject);
begin
  tabCompany.Cancel;
end;

procedure TfrmCompany.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCompany.btnEditClick(Sender: TObject);
begin
  tabCompany.Edit;
end;

procedure TfrmCompany.datCompanyStateChange(Sender: TObject);
begin
  btnSave.Enabled := tabCompany.State in [dsEdit, dsInsert];
  btnCancel.Enabled := btnSave.Enabled;
  btnClose.Enabled := tabCompany.State = dsBrowse;
  if tabCompany.State = dsBrowse then
  begin
    cmbPrinter.ItemIndex :=      //select default printer
      cmbPrinter.Items.IndexOf(tabCompanyPRINTER.AsString);
    cmbPrinterChange(nil);  //JT040199  update font combos & current printer}
  end;
end;

procedure TfrmCompany.tabCompanyBeforeEdit(DataSet: TDataSet);
begin
  if UserLoginName<>'SYSDBA' then
    raise Exception.Create('Only the system administrator can modify these constants');
  frmMain.Database.StartTransaction;
end;

procedure TfrmCompany.tabCompanyAfterPost(DataSet: TDataSet);
begin
  frmMain.Database.Commit;
end;

procedure TfrmCompany.tabCompanyAfterCancel(DataSet: TDataSet);
begin
  frmMain.Database.Rollback;
end;

procedure TfrmCompany.btnDefaultPrinterClick(Sender: TObject);
begin   //JT040199   assign default printer
  Printer.PrinterIndex := -1;  //set to default printer
  tabCompany.Edit;
  cmbPrinter.ItemIndex :=      //select default printer
    cmbPrinter.Items.IndexOf(Printer.Printers[Printer.PrinterIndex]);
  tabCompanyPRINTER.AsString := cmbPrinter.Text;
  cmbPrinterChange(nil);  //update
end;

procedure TfrmCompany.cmbPrinterChange(Sender: TObject);
begin   //JT040199    the available fonts will change
  if Sender <> nil then  //if genuine cmbPrinterChange
    Printer.PrinterIndex := Printer.Printers.IndexOf(cmbPrinter.Text);
  cmbNormalFont.Items.Assign(Printer.Fonts);
  cmbCompressedFont.Items.Assign(Printer.Fonts);
  cmbNormalFont.ItemIndex :=
    cmbNormalFont.Items.IndexOf(tabCompanyNORMALFONT.AsString);
  cmbCompressedFont.ItemIndex :=
    cmbCompressedFont.Items.IndexOf(tabCompanyCOMPRESSEDFONT.AsString);
end;

procedure TfrmCompany.btnTestPrintClick(Sender: TObject);
//var
//  OldPrinterIndex:integer;
begin
//  if not {dlgSetup}dlgPrint.Execute then Exit;
  frmPrintSlip := TfrmPrintSlip.Create(Application);
//  frmPrintSlip.qryPaySlip.SQL.Add('where clkno = 1');
//  OldPrinterIndex:=Printer.PrinterIndex;
  Printer.PrinterIndex := Printer.Printers.IndexOf(tabCompanyPRINTER.AsString);
  frmPrintSlip.qrpPaySlip.Font.Name := tabCompanyNORMALFONT.AsString;
  frmPrintSlip.QRDBText2.Font.Style := [fsBold];
  frmPrintSlip.QRDBText3.Font.Style := [fsBold];
  frmPrintSlip.qryPaySlip.Open;
  frmPrintSlip.qrpPaySlip.Preview; //xx then the user can decide what to print
  frmPrintSlip.qryPaySlip.Close;
  frmPrintSlip.Release;
  Printer.PrinterIndex:=-1; //sets to default or := OldPrinterIndex
end;

procedure TfrmCompany.btnFixBalancesClick(Sender: TObject);
begin
  //added DL080501
{select clkno,thisweek,taxdeduct,cast((taxdeduct*100) as integer)/100 tax100int
from paysliphist
order by clkno,thisweek
update paysliphist
set taxdeduct=cast((taxdeduct*100) as integer)/100
update employee
set repaylnwk=cast((repaylnwk*100) as integer)/100
  saveac=cast((saveac*100) as integer)/100,
  sickfd=cast((sickfd*100) as integer)/100,
  provfd=cast((provfd*100) as integer)/100,
  grosspay=cast((grosspay*100) as integer)/100,
  wkspay=cast((wkspay*100) as integer)/100
}
  StatusBar.SimpleText:='Please Wait: Fixing Employee Balances (due to rounding errors)';
  Application.ProcessMessages;
  qryFixTable.Close;
  qryFixTable.SQL.Clear;
  qryFixTable.SQL.Add('update employee');
  qryFixTable.SQL.Add('set repaylnwk=cast((repaylnwk*100) as integer)/100,');
  qryFixTable.SQL.Add('  saveac=cast((saveac*100) as integer)/100,');
  qryFixTable.SQL.Add('  sickfd=cast((sickfd*100) as integer)/100,');
  qryFixTable.SQL.Add('  provfd=cast((provfd*100) as integer)/100,');
  qryFixTable.SQL.Add('  grosspay=cast((grosspay*100) as integer)/100,');
  qryFixTable.SQL.Add('  wkspay=cast((wkspay*100) as integer)/100');
  frmMain.Database.StartTransaction;
  qryFixTable.ExecSQL;
  frmMain.Database.Commit;
  StatusBar.SimpleText:='Ready';
  Application.ProcessMessages;
end;

procedure TfrmCompany.btnFixPFBalancesClick(Sender: TObject);
var
  //LastClkNo:integer;
  //FirstTime:boolean;
  LoanAcFinalBalance:Currency;
  Date090504{,Date160504,Date20504}:TDateTime;
begin
  //added DL240504 to fix incorrect PFBalances
  if MessageDlg('Fix Prov Fund Balances: must only be run once before week ending 23/5/2004?',
      mtConfirmation,[mbYes,mbNo],0) = mrNo then
    Exit;
  //LastClkNo:=0;
  //FirstTime:=false;
  Date090504:=strtodatetime('09/05/2004');
  //Date160504:=strtodatetime('16/05/2004');
  //Date020504:=strtodatetime('02/05/2004');
  StatusBar.SimpleText:='Please Wait: Fixing Prov Fund Balances';
  Application.ProcessMessages;
  frmMain.Database.StartTransaction;

  qryPFFixNulls.Close;
  qryPFFixNulls.ExecSQL;

  qryPFFetchPaySlipHist.Close;
  qryPFFetchPaySlipHist.Open;
  while not qryPFFetchPaySlipHist.EOF do
  begin
    StatusBar.SimpleText:='Processing '+qryPFFetchPaySlipHistCLKNO.AsString;
    Application.ProcessMessages;
    if qryPFFetchPaySlipHistTHISWEEK.AsDateTime=Date090504 then
    begin
      //update employee
      qryPFUpdateEmployee.Close;
      qryPFUpdateEmployee.ParamByName('PFLoanAc').AsCurrency:=
        qryPFFetchPaySlipHistPFOLDBAL.AsCurrency-(qryPFFetchPaySlipHistPFLESSREPAY.AsCurrency*2);
      qryPFUpdateEmployee.ParamByName('ClkNo').AsInteger:=qryPFFetchPaySlipHistCLKNO.AsInteger;
      qryPFUpdateEmployee.ExecSQL;

      //update weekending 16th May
      qryPFUpdatePaySlipHist.Close;
      qryPFUpdatePaySlipHist.ParamByName('PFOldBal').AsCurrency:=qryPFFetchPaySlipHistPFNEWBAL.AsCurrency;
      qryPFUpdatePaySlipHist.ParamByName('PFNewBal').AsCurrency:=qryPFFetchPaySlipHistPFNEWBAL.AsCurrency-qryPFFetchPaySlipHistPFLESSREPAY.AsCurrency;
      qryPFUpdatePaySlipHist.ParamByName('ClkNo').AsInteger:=qryPFFetchPaySlipHistCLKNO.AsInteger;
      qryPFUpdatePaySlipHist.ParamByName('ThisWeek').AsDateTime:=qryPFFetchPaySlipHistTHISWEEK.AsDateTime+7;
      qryPFUpdatePaySlipHist.ExecSQL;

      //update weekending 2nd May
      qryPFUpdatePaySlipHist.Close;
      qryPFUpdatePaySlipHist.ParamByName('PFOldBal').AsCurrency:=qryPFFetchPaySlipHistPFOLDBAL.AsCurrency;
      qryPFUpdatePaySlipHist.ParamByName('PFNewBal').AsCurrency:=qryPFFetchPaySlipHistPFOLDBAL.AsCurrency;
      qryPFUpdatePaySlipHist.ParamByName('ClkNo').AsInteger:=qryPFFetchPaySlipHistCLKNO.AsInteger;
      qryPFUpdatePaySlipHist.ParamByName('ThisWeek').AsDateTime:=qryPFFetchPaySlipHistTHISWEEK.AsDateTime-7;
      qryPFUpdatePaySlipHist.ExecSQL;

    end;
    {if LastClkNo<>qryPFFetchPaySlipHistCLKNO.AsInteger then
    begin
      if LastClkNo<>0 then
      begin
        qryPFUpdateEmployee.Close;
        qryPFUpdateEmployee.ParamByName('PFLoanAc').AsCurrency:=LoanAcFinalBalance;
        qryPFUpdateEmployee.ParamByName('ClkNo').AsInteger:=qryPFFetchPaySlipHistCLKNO.AsInteger;
        qryPFUpdateEmployee.ExecSQL;
      end;
      LastClkNo:=qryPFFetchPaySlipHistCLKNO.AsInteger;
      FirstTime:=true;
    end;
    if FirstTime then
    begin
      qryPFUpdatePaySlipHist.Close;
      qryPFUpdatePaySlipHist.ParamByName('PFOldBal').AsCurrency:=qryPFFetchPaySlipHistPFOLDBAL.AsCurrency;
      qryPFUpdatePaySlipHist.ParamByName('PFNewBal').AsCurrency:=qryPFFetchPaySlipHistPFOLDBAL.AsCurrency;
      qryPFUpdatePaySlipHist.ParamByName('ClkNo').AsInteger:=qryPFFetchPaySlipHistCLKNO.AsInteger;
      qryPFUpdatePaySlipHist.ParamByName('ThisWeek').AsDateTime:=qryPFFetchPaySlipHistTHISWEEK.AsDateTime-7;
      qryPFUpdatePaySlipHist.ExecSQL;
    end;
    FirstTime:=false;}
    qryPFFetchPaySlipHist.Next;
  end;
  qryPFFetchPaySlipHist.Close;


  frmMain.Database.Commit;
  StatusBar.SimpleText:='Ready';
  Application.ProcessMessages;
end;

end.
