unit Vbsupcus;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Buttons, DBLookup,
  Dialogs, ComCtrls, ODDBCbx;

type
  TVBSupCusForm = class(TForm)
    ScrollBox: TScrollBox;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    SupplierSource: TDataSource;
    Panel2: TPanel;
    Supplier: TTable;
    SupplierSUPREF: TStringField;
    SupplierTERMS: TStringField;
    SupplierCURRENCY: TStringField;
    SupplierAGENTREF: TStringField;
    SupplierSUPACCNO: TStringField;
    SupplierVATNO: TStringField;
    SupplierSTREETADD1: TStringField;
    SupplierSTREETADD2: TStringField;
    SupplierSTREETADD3: TStringField;
    SupplierSTREETADD4: TStringField;
    SupplierSTREETADD5: TStringField;
    SupplierPOSTALADD1: TStringField;
    SupplierPOSTALADD2: TStringField;
    SupplierPOSTALADD3: TStringField;
    SupplierPOSTALADD4: TStringField;
    SupplierPOSTALADD5: TStringField;
    SupplierPHONE: TStringField;
    SupplierFAX: TStringField;
    SupplierTELEX: TStringField;
    SupplierCONTACT: TStringField;
    SupplierEARLYDISC: TIntegerField;
    SupplierNARRATIVE: TStringField;
    SupplierEMAIL: TStringField;
    SupplierCELLPHONE: TStringField;
    Terms: TTable;
    TermsSource: TDataSource;
    Currency: TTable;
    CurrencySource: TDataSource;
    Agent: TTable;
    AgentSource: TDataSource;
    SupplierSCTYPE: TStringField;
    SupplierDEPTLINK: TStringField;
    Dept: TTable;
    DeptSource: TDataSource;
    SupplierCRLIMIT: TFloatField;
    SupplierSUPDESCR: TStringField;
    SupplierBANK: TStringField;
    SupplierBRANCH: TStringField;
    SupplierACCNO: TStringField;
    SupplierCOREG: TStringField;
    SupplierNEDLIBLIMIT: TFloatField;
    SupplierCRGUARREQ: TFloatField;
    SupplierCRGUARLIMIT: TFloatField;
    SupplierCRGUARRET: TStringField;
    SupplierCRGUARCOMMENT: TStringField;
    SupplierAPPROXMSALES: TFloatField;
    SupPageControl: TPageControl;
    AddressTabSheet: TTabSheet;
    Label27: TLabel;
    DBEdit1: TDBEdit;
    Label28: TLabel;
    DBEdit2: TDBEdit;
    Label29: TLabel;
    DBEdit3: TDBEdit;
    Label30: TLabel;
    DBEdit4: TDBEdit;
    Label31: TLabel;
    DBComboBox2: TDBComboBox;
    SupSearchSpdBtn: TSpeedButton;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    DBLookupCombo5: TDBLookupCombo;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label39: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label40: TLabel;
    DBLookupCombo6: TDBLookupCombo;
    DBEdit13: TDBEdit;
    Label41: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label52: TLabel;
    DBEdit23: TDBEdit;
    CreditTabSheet: TTabSheet;
    Label47: TLabel;
    Label45: TLabel;
    DBLookupCombo7: TDBLookupCombo;
    Label48: TLabel;
    Label49: TLabel;
    DBEdit21: TDBEdit;
    Label51: TLabel;
    DBEdit22: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    PostBtn: TButton;
    CancelBtn: TButton;
    CloseBitBtn: TBitBtn;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit31: TDBEdit;
    EditMSales: TDBEdit;
    DBComboBox1: TDBComboBox;
    EditQuarterly: TEdit;
    Label17: TLabel;
    DBEdit30: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    SupplierLOCALOVERSEAS: TStringField;
    DBComboBox3: TDBComboBox;
    Label20: TLabel;
    PrintSpdBtn: TSpeedButton;
    Label50: TLabel;
    DBLookupCombo8: TDBLookupCombo;
    TermsTERMS: TStringField;
    DBEdit32: TDBEdit;
    Label22: TLabel;
    CurrencyCURREF: TStringField;
    CurrencyDESCR: TStringField;
    TermsDESCR: TStringField;
    AgentAGENTREF: TStringField;
    AgentDESCR: TStringField;
    Label21: TLabel;
    DBComboBox4: TDBComboBox;
    SupplierSALECLIENT: TStringField;
    IntlInvoiceTabSheet: TTabSheet;
    Label23: TLabel;
    DBEdit35: TDBEdit;
    Label24: TLabel;
    DBEdit36: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label46: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    SupplierPLACEDISCHARGE: TStringField;
    SupplierINCOTERMS: TStringField;
    SupplierPLACEDESTLINE1: TStringField;
    SupplierPLACEDESTLINE2: TStringField;
    SupplierCARRIAGEBYLINE1: TStringField;
    SupplierCARRIAGEBYLINE2: TStringField;
    SupplierTERMSLINE1: TStringField;
    SupplierTERMSLINE2: TStringField;
    SupplierNOTIFYLINE1: TStringField;
    SupplierNOTIFYLINE2: TStringField;
    SupplierNOTIFYLINE3: TStringField;
    SupplierNOTIFYLINE4: TStringField;
    SupplierTARRIFFWIDE: TStringField;
    SupplierTARRIFFNARROW: TStringField;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    Label65: TLabel;
    DBComboBox5: TDBComboBox;
    SupplierMETRICORIMPERIAL: TStringField;
    SupplierSPECIALINFO: TMemoField;
    SpecialInfoTabSheet: TTabSheet;
    DBMemo1: TDBMemo;
    Panel3: TPanel;
    Label66: TLabel;
    DBEdit54: TDBEdit;
    Label67: TLabel;
    DBEdit55: TDBEdit;
    SupplierCONSIGNMENTCLIENT: TStringField;
    SupplierCONSIGNMENTROWNO: TIntegerField;
    gbxConsignmentClient: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    dbcConsignmentClient: TDBComboBox;
    Label71: TLabel;
    edtConsignmentRowNo: TDBEdit;
    Label72: TLabel;
    qryCheckConsignmentRowNo: TQuery;
    qryCheckConsignmentRowNoSUPREF: TStringField;
    SupplierPLACELOAD: TStringField;
    SupplierNEDLIBCUSTNO: TStringField;
    Label73: TLabel;
    DBEdit56: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure SupplierSourceStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SupplierAfterPost(DataSet: TDataset);
    procedure SupplierAfterDelete(DataSet: TDataset);
    procedure SupplierAfterCancel(DataSet: TDataset);
    procedure SupplierBeforeCancel(DataSet: TDataset);
    procedure SupplierBeforeDelete(DataSet: TDataset);
    procedure SupSearchSpdBtnClick(Sender: TObject);
    procedure SupplierBeforeEdit(DataSet: TDataSet);
    procedure SupplierBeforeInsert(DataSet: TDataSet);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure EditMSalesExit(Sender: TObject);
    procedure SupplierSourceDataChange(Sender: TObject; Field: TField);
    procedure SupplierDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure SupplierBeforePost(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  VBSupCusForm: TVBSupCusForm;

implementation

uses VBMain, VBModal;

{$R *.DFM}

procedure TVBSupCusForm.FormCreate(Sender: TObject);
begin
{  Supplier.Open;}
end;

procedure TVBSupCusForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBSupCusForm.PostBtnClick(Sender: TObject);
begin
  Supplier.Post;
end;

procedure TVBSupCusForm.CancelBtnClick(Sender: TObject);
begin
  Supplier.Cancel;
end;

procedure TVBSupCusForm.SupplierSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := Supplier.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := Supplier.State = dsBrowse;
end;

procedure TVBSupCusForm.FormShow(Sender: TObject);
begin
  Supplier.Open;
  Supplier.Refresh;
  Dept.Open;
  Terms.Open;
  Currency.Open;
  Agent.Open;
  Dept.Refresh;
  Terms.Refresh;
  Currency.Refresh;
  Agent.Refresh;
  SupPageControl.ActivePage:=AddressTabSheet;
{  MainForm.Database.StartTransaction;}
end;

procedure TVBSupCusForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Supplier.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  Dept.Close;
  Terms.Close;
  Currency.Close;
  Agent.Close;
  Supplier.Close;
  VBSupCusForm.Release;
end;

procedure TVBSupCusForm.SupplierAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TVBSupCusForm.SupplierAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TVBSupCusForm.SupplierAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  Supplier.Refresh;
end;

procedure TVBSupCusForm.SupplierBeforeCancel(DataSet: TDataset);
begin
  if Supplier.State=dsInsert then
    if MessageDlg('Cancel supplier being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TVBSupCusForm.SupplierBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete supplier?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;      
end;

procedure TVBSupCusForm.SupSearchSpdBtnClick(Sender: TObject);
begin
  if VBPickDlgForm.ShowModalSups('CU') = mrOk then
  begin
    Supplier.SetKey;
    Supplier.FieldByName('SupRef').AsString:=VBPickDlgForm.SupRef;
    Supplier.GotoKey;
  end;
  Screen.Cursor:=crDefault;
end;

procedure TVBSupCusForm.SupplierBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBSupCusForm.SupplierBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBSupCusForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TVBSupCusForm.EditMSalesExit(Sender: TObject);
begin
  EditQuarterly.Text:=FormatFloat('0.00',strtofloat(EditMSales.Text)*3);
end;

procedure TVBSupCusForm.SupplierSourceDataChange(Sender: TObject;
  Field: TField);
begin
  if EditMSales.Text<>'' then
    EditQuarterly.Text:=FormatFloat('0.00',strtofloat(EditMSales.Text)*3);
end;

procedure TVBSupCusForm.SupplierDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBSupCusForm.SupplierBeforePost(DataSet: TDataSet);
begin
  //added DL030203
  if SupplierCONSIGNMENTCLIENT.AsString='Y' then
  begin
    if SupplierSALECLIENT.AsString='Y' then
    begin
      raise Exception.Create('For Consignment Customer, Sale Customer flag must be set to ''N''');
    end;
    if (SupplierCONSIGNMENTROWNO.AsInteger<9900) or
       (SupplierCONSIGNMENTROWNO.AsInteger>9999) then
      raise Exception.Create('For Consignment Customer, Row Number must be between 9900 and 9999');
    //check that Row Number is Not Used Anywhere else
    qryCheckConsignmentRowNo.Close;
    qryCheckConsignmentRowNo.ParamByName('ConsignmentRowNo').AsInteger:=
      SupplierCONSIGNMENTROWNO.AsInteger;
    qryCheckConsignmentRowNo.ParamByName('SupRef').AsString:=
      SupplierSUPREF.AsString;
    qryCheckConsignmentRowNo.Open;
    if not qryCheckConsignmentRowNoSUPREF.IsNull then
      raise Exception.Create('Cannot use this row number as already used for '+
        qryCheckConsignmentRowNoSUPREF.AsString);
    qryCheckConsignmentRowNo.Close;
  end;
end; //SupplierBeforePost

end.
