unit Supplier;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Buttons, DBLookup,
  Dialogs;

type
  TSupplierForm = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditSUPREF: TDBEdit;
    Label2: TLabel;
    EditSUPDESCR: TDBEdit;
    Label3: TLabel;
    EditSUPACCNO: TDBEdit;
    Label4: TLabel;
    EditVATNO: TDBEdit;
    Label5: TLabel;
    EditSTREETADD: TDBEdit;
    EditSTREETADD2: TDBEdit;
    EditSTREETADD3: TDBEdit;
    EditSTREETADD4: TDBEdit;
    EditSTREETADD5: TDBEdit;
    Label10: TLabel;
    EditPOSTALADD: TDBEdit;
    EditPOSTALADD2: TDBEdit;
    EditPOSTALADD3: TDBEdit;
    EditPOSTALADD4: TDBEdit;
    EditPOSTALADD5: TDBEdit;
    Label15: TLabel;
    EditPHONE: TDBEdit;
    Label16: TLabel;
    EditFAX: TDBEdit;
    Label17: TLabel;
    EditTELEX: TDBEdit;
    Label18: TLabel;
    EditCONTACT: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    EditEARLYDISC: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    EditNARRATIVE: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    SupplierSource: TDataSource;
    Panel2: TPanel;
    Supplier: TTable;
    Label24: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PostBtn: TButton;
    CancelBtn: TButton;
    CloseBitBtn: TBitBtn;
    EditEMAIL: TDBEdit;
    EditCELLPHONE: TDBEdit;
    SupplierSUPREF: TStringField;
    SupplierTERMS: TStringField;
    SupplierCURRENCY: TStringField;
    SupplierAGENTREF: TStringField;
    SupplierSUPDESCR: TStringField;
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
    DBLookupCombo1: TDBLookupCombo;
    DBLookupCombo2: TDBLookupCombo;
    DBLookupCombo3: TDBLookupCombo;
    Terms: TTable;
    TermsSource: TDataSource;
    Currency: TTable;
    CurrencySource: TDataSource;
    Agent: TTable;
    AgentSource: TDataSource;
    Label11: TLabel;
    SupSearchSpdBtn: TSpeedButton;
    Label12: TLabel;
    SupplierSCTYPE: TStringField;
    DBComboBox1: TDBComboBox;
    SupplierDEPTLINK: TStringField;
    Dept: TTable;
    DeptSource: TDataSource;
    DBLookupCombo4: TDBLookupCombo;
    Label13: TLabel;
    SupplierDFCTRLACCT: TStringField;
    Label14: TLabel;
    EditDFCtrlAcct: TDBEdit;
    SupplierVT1WIP: TStringField;
    Label25: TLabel;
    EditVT1WIP: TDBComboBox;
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
    procedure SupplierNewRecord(DataSet: TDataSet);
    procedure SupplierDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure SupplierBeforeEdit(DataSet: TDataSet);
    procedure SupplierBeforeInsert(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SupplierForm: TSupplierForm;

implementation

uses Main, BrModal;

{$R *.DFM}

procedure TSupplierForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSupplierForm.PostBtnClick(Sender: TObject);
begin
  Supplier.Post;
end;

procedure TSupplierForm.CancelBtnClick(Sender: TObject);
begin
  Supplier.Cancel;
end;

procedure TSupplierForm.SupplierSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := Supplier.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := Supplier.State = dsBrowse;
end;

procedure TSupplierForm.FormShow(Sender: TObject);
begin
  Dept.Open;
  Agent.Open;
  Currency.Open;
  Terms.Open;
  Supplier.Open;
  Supplier.Refresh;
  Dept.Refresh;
  Agent.Refresh;
  Currency.Refresh;
  Terms.Refresh;
{  MainForm.Database.StartTransaction;}
end;

procedure TSupplierForm.FormClose(Sender: TObject;
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
  Agent.Close;
  Currency.Close;
  Terms.Close;
  Supplier.Close;
  SupplierForm.Release;
end;

procedure TSupplierForm.SupplierAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TSupplierForm.SupplierAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
{  MainForm.Database.StartTransaction;}
end;

procedure TSupplierForm.SupplierAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  Supplier.Refresh;
{  MainForm.Database.StartTransaction;}
end;

procedure TSupplierForm.SupplierBeforeCancel(DataSet: TDataset);
begin
  if Supplier.State=dsInsert then
    if MessageDlg('Cancel supplier being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TSupplierForm.SupplierBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete supplier?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;      
end;

procedure TSupplierForm.SupSearchSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalSups('SU') = mrOk then
  begin
    Supplier.SetKey;
    Supplier.FieldByName('SupRef').AsString:=PickDlgForm.SupRef;
    Supplier.GotoKey;
  end;
end;

procedure TSupplierForm.SupplierNewRecord(DataSet: TDataSet);
begin
  SupplierDFCtrlAcct.Value:='ZOTHER';
end;

procedure TSupplierForm.SupplierDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TSupplierForm.SupplierBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TSupplierForm.SupplierBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

end.
