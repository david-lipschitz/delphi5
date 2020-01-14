{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
unit Product;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBLookup, DBTables, Mask, ExtCtrls, Buttons,
  Grids, DBGrids, Dialogs;

type
  TProductForm = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditPRODREF: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    EditDESCR: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    EditREORDER: TDBEdit;
    Label7: TLabel;
    EditWARNING: TDBEdit;
    Label8: TLabel;
    EditMERGELEVEL: TDBEdit;
    Label9: TLabel;
    EditUNITWEIGHT: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    ProductSource: TDataSource;
    Panel2: TPanel;
    Product: TTable;
    DBLookupCombo1: TDBLookupCombo;
    DBLookupCombo2: TDBLookupCombo;
    Category: TTable;
    CategorySource: TDataSource;
    UnitRef: TTable;
    UnitRefSource: TDataSource;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    PostBtn: TButton;
    CancelBtn: TButton;
    CloseBitBtn: TBitBtn;
    ProductPRODREF: TStringField;
    ProductCATEGORY: TStringField;
    ProductDESCR: TStringField;
    ProductREORDER: TIntegerField;
    ProductWARNING: TIntegerField;
    ProductMERGELEVEL: TIntegerField;
    ProductUNITWEIGHT: TSmallintField;
    ProdSup: TTable;
    ProdSupSource: TDataSource;
    SupGrid: TDBGrid;
    ProdSupPRODREF: TStringField;
    ProdSupSUPREF: TStringField;
    ProdSupMATSUPREF: TStringField;
    ProdSupMATSUPDESC: TStringField;
    ActiveSource: TDataSource;
    Label15: TLabel;
    Label16: TLabel;
    DBLookupCombo3: TDBLookupCombo;
    ProductMEASUNIT: TStringField;
    ProductRCVUNIT: TStringField;
    ProductFIXEDWEIGHT: TStringField;
    ProductONORDER: TFloatField;
    ProductINSTOCK: TFloatField;
    DBCheckBox3: TDBCheckBox;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    EditOnOrder: TDBEdit;
    edtTxnDetQty: TDBEdit;
    ProductLABELDESCR: TStringField;
    UnitRefUNITREF: TStringField;
    UnitRefDESCR: TStringField;
    CategoryCATEGORY: TStringField;
    CategoryDESCR: TStringField;
    ProdSearchSpdBtn: TSpeedButton;
    WIPTotalsBtn: TButton;
    Label5: TLabel;
    ProductPURCHCATEGORY: TStringField;
    Label21: TLabel;
    ProductCTRLACCT: TStringField;
    Label22: TLabel;
    Label20: TLabel;
    EditExtProdRef: TDBEdit;
    ProductEXTPRODREF: TStringField;
    CtrlAcct: TTable;
    CtrlAcctSource: TDataSource;
    EditCtrlAcct: TDBLookupComboBox;
    EditPurchCategory: TDBLookupComboBox;
    RMTxnDetCategory: TTable;
    RMTxnDetCategorySource: TDataSource;
    EditLabelDescr: TDBEdit;
    CopyProductBtn: TButton;
    MyQuery: TQuery;
    CopiedLabel: TLabel;
    ProductRMDONOTSHOW: TStringField;
    dbRMDoNotShow: TDBCheckBox;
    qryFetchBalance: TQuery;
    datFetchBalance: TDataSource;
    qryFetchBalanceQTY: TFloatField;
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure ProductSourceStateChange(Sender: TObject);
    procedure ProdSupNewRecord(DataSet: TDataset);
    procedure ProdSupSourceStateChange(Sender: TObject);
    procedure SupGridEnter(Sender: TObject);
    procedure SupGridExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ProductNewRecord(DataSet: TDataset);
    procedure FormShow(Sender: TObject);
    procedure ProdSupBeforeInsert(DataSet: TDataset);
    procedure ProductAfterPost(DataSet: TDataset);
    procedure ProductAfterCancel(DataSet: TDataset);
    procedure ProductAfterDelete(DataSet: TDataset);
    procedure ProductBeforeCancel(DataSet: TDataset);
    procedure ProductBeforeDelete(DataSet: TDataset);
    procedure ProdSupBeforeEdit(DataSet: TDataset);
    procedure ProdSupBeforeDelete(DataSet: TDataset);
    procedure ProdSearchSpdBtnClick(Sender: TObject);
    procedure WIPTotalsBtnClick(Sender: TObject);
    procedure ProductBeforeInsert(DataSet: TDataSet);
    procedure ProductBeforeEdit(DataSet: TDataSet);
    procedure ProductDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure SupGridEditButtonClick(Sender: TObject);
    procedure ProductBeforePost(DataSet: TDataSet);
    procedure CopyProductBtnClick(Sender: TObject);
  private
    { private declarations }
    NoCommit:boolean;
    InTxn:boolean; {added DL250897}
    procedure DeleteItems;
  public
    { public declarations }
  end;

var
  ProductForm: TProductForm;

implementation

uses
  Main, Brmodal;

{$R *.DFM}

procedure TProductForm.FormShow(Sender: TObject);
begin
  CopiedLabel.Visible:=false;
  Product.Open;
  ProdSup.Open;
  Category.Open;
  UnitRef.Open;
  CtrlAcct.Open;
  RMTxnDetCategory.Open;
{  MainForm.Database.StartTransaction;}
  Product.Refresh;
  ProdSup.Refresh;
  Category.Refresh;
  UnitRef.Refresh;
  CtrlAcct.Refresh;
  RMTxnDetCategory.Refresh;
  NoCommit:=false;
  InTxn:=false;
  if UserInitials='SYS' then
  begin
    EditPurchCategory.ReadOnly:=false;
    EditCtrlAcct.ReadOnly:=false;
  end;
  qryFetchBalance.Open; //added DL050416
end;

procedure TProductForm.PostBtnClick(Sender: TObject);
begin
  Product.Post;
end;

procedure TProductForm.CancelBtnClick(Sender: TObject);
begin
  Product.Cancel;
end;

procedure TProductForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TProductForm.ProductSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := Product.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := Product.State = dsBrowse;
end;

procedure TProductForm.ProdSupNewRecord(DataSet: TDataset);
begin
{  Product.Edit; put in when commit put in}
  ProdSupPRODREF.Value:=ProductPRODREF.Value;
end;

procedure TProductForm.ProdSupSourceStateChange(Sender: TObject);
begin
{  PostBtn.Enabled := ProdSup.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := ProdSup.State = dsBrowse;}
end;

procedure TProductForm.SupGridEnter(Sender: TObject);
begin
  ActiveSource.Dataset := ProdSup;
{  BrowseSupSpeedButton.Enabled := true;}
end;

procedure TProductForm.SupGridExit(Sender: TObject);
begin
  ActiveSource.Dataset := Product;
{  BrowseSupSpeedButton.Enabled := false;}
end;

procedure TProductForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (Product.State in [dsEdit,dsInsert]) or
    (ProdSup.State in [dsEdit,dsInsert]) then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
{  MainForm.Database.Commit;}
  qryFetchBalance.Close; //added DL050416
  RMTxnDetCategory.Close;
  CtrlAcct.Close;
  UnitRef.Close;
  Category.Close;
  Product.Close;
  ProdSup.Close;
  ProductForm.Release;
end;

procedure TProductForm.ProductNewRecord(DataSet: TDataset);
begin
  ProductOnOrder.ReadOnly:=false;
  ProductOnOrder.Value:=0;
  ProductOnOrder.ReadOnly:=true;
  ProductInStock.ReadOnly:=false;
  ProductInStock.Value:=0;
  ProductInStock.ReadOnly:=true;
  ProductFixedWeight.Value:='N';
  ProductRMDoNotShow.AsString:='N'; //added DL020411
  ProductReOrder.Value:=0;
  ProductWarning.Value:=0;
  ProductMergeLevel.Value:=0;
  ProductPurchCategory.ReadOnly:=false;
  ProductCtrlAcct.ReadOnly:=false;
  ProductPurchCategory.Value:='OTHER';
  ProductCtrlAcct.Value:='ZOTHER';
  if UserInitials<>'SYS' then
  begin
    EditPurchCategory.ReadOnly:=true;
    EditCtrlAcct.ReadOnly:=true;
  end;
end;

procedure TProductForm.ProdSupBeforeInsert(DataSet: TDataset);
begin
  if Product.State = dsInsert then
  begin
    NoCommit:=true;
    Product.Post;
    Product.Edit;
    {ProdSup.Edit;}
    NoCommit:=false;
  end
  else
    Product.Edit;
end;

procedure TProductForm.ProductAfterPost(DataSet: TDataset);
begin
  if not NoCommit then
  begin
    MainForm.Database.Commit;
    CopiedLabel.Visible:=false;    
    InTxn:=false;
  end;
end;

procedure TProductForm.ProductAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  CopiedLabel.Visible:=false;  
  InTxn:=false;
  Product.Refresh;
  ProdSup.Refresh;
end;

procedure TProductForm.ProductAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
  CopiedLabel.Visible:=false;  
{  MainForm.Database.StartTransaction;}
end;

procedure TProductForm.ProductBeforeCancel(DataSet: TDataset);
begin
  if Product.State=dsInsert then
    if MessageDlg('Cancel product being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TProductForm.DeleteItems;
begin
{  DeletingItems := true; {suppress recalc of totals during delete}
  ProdSup.DisableControls;
  try
    ProdSup.First;
    while not ProdSup.EOF do
      ProdSup.Delete;
  finally
{    DeletingItems := false;}
    ProdSup.EnableControls;
  end;
end;

procedure TProductForm.ProductBeforeDelete(DataSet: TDataset);
begin
  if MessageDlg('Delete product?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
  DeleteItems;
end;

procedure TProductForm.ProdSupBeforeEdit(DataSet: TDataset);
begin
  Product.Edit;
end;

procedure TProductForm.ProdSupBeforeDelete(DataSet: TDataset);
begin
  Product.Edit;
end;

procedure TProductForm.ProdSearchSpdBtnClick(Sender: TObject);
begin
  if PickDlgForm.ShowModalProducts = mrOk then
  begin
    Product.SetKey;
    Product.FieldByName('ProdRef').AsString:=PickDlgForm.ProductRef;
    Product.GotoKey;
  end;
end;

procedure TProductForm.WIPTotalsBtnClick(Sender: TObject);
{var
  DateFrom,DateTo:double;}
begin
  {DateFrom:=strtodate(InputBox('RM Issues','Enter start date (format=dd/yy/yyyy)',''));
  DateTo:=strtodate(InputBox('RM Issues','Enter end date (format=dd/mm/yyyy)',''));
  if PickDlgForm.ShowModalRMIssues(DateFrom,DateTo) = mrOk then
  begin
    Product.SetKey;
    Product.FieldByName('ProdRef').AsString:=PickDlgForm.RMProdRef;
    Product.GotoKey;
  end;
  Screen.Cursor := crDefault;}
end;

procedure TProductForm.ProductBeforeInsert(DataSet: TDataSet);
begin
  if Product.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('A product is being processed. Post changes before inserting new product?',
      mtInformation, mbOKCancel, 0) = mrOK then
        Product.Post
    else
      Abort;
  end;
  if InTxn then
    raise Exception.Create('Post before inserting')
  else
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TProductForm.ProductBeforeEdit(DataSet: TDataSet);
begin
  if not InTxn then
  begin
    MainForm.Database.StartTransaction;
    InTxn:=true;
  end;
end;

procedure TProductForm.ProductDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TProductForm.SupGridEditButtonClick(Sender: TObject);
begin
  if SupGrid.SelectedField.Name='ProdSupSUPREF' then
  begin
    SupGrid.SelectedField := ProdSupSUPREF;
    if PickDlgForm.ShowModalSups('SU') = mrOk then {SU for suppliers}
    begin
      ProdSup.Edit;
      ProdSupSUPREF.Value := PickDlgForm.SupRef;
    end;
  end;
end;

procedure TProductForm.ProductBeforePost(DataSet: TDataSet);
begin
  ProductExtProdRef.Value:='RM'+ProductProdRef.Value;
end;

procedure TProductForm.CopyProductBtnClick(Sender: TObject);
var
  OldProdRef:string[6];oldcategory:string[3];olddescr:string[30];
  OldReorder,OldWarning,OldMergeLevel,OldUnitWeight:integer;
  OldMeasUnit:string[4];OldRcvUnit:string[4];OldFixedWeight:string[1];
  OldLabelDescr:string[10];OldPurchCategory:string[6];OldCtrlAcct:string[6];
begin
  if (Product.State in [dsEdit,dsInsert]) or
    (ProdSup.State in [dsEdit,dsInsert]) then
  begin
    MessageDlg('Cancel edits or post before copying',
      mtInformation, [mbOK], 0);
    Exit;
  end;
  OldProdRef:=ProductProdRef.AsString;
  OldCategory:=ProductCategory.AsString;
  OldDescr:=ProductDescr.AsString;
  OldReorder:=ProductReorder.AsInteger;
  OldWarning:=ProductWarning.AsInteger;
  OldMergeLevel:=ProductMergeLevel.AsInteger;
  OldUnitWeight:=ProductUnitWeight.AsInteger;
  OldMeasUnit:=ProductMeasUnit.AsString;
  OldRcvUnit:=ProductRcvUnit.AsString;
  OldFixedWeight:=ProductFixedWeight.AsString;
  OldLabelDescr:=ProductLabelDescr.AsString;
  OldPurchCategory:=ProductPurchCategory.AsString;
  OldCtrlAcct:=ProductCtrlAcct.AsString;
  Product.Insert;
  ProductProdRef.AsString:=OldProdRef;
  ProductCategory.AsString:=OldCategory;
  ProductDescr.AsString:= OldDescr;
  ProductReorder.AsInteger:=OldReorder;
  ProductWarning.AsInteger:=OldWarning;
  ProductMergeLevel.AsInteger:=OldMergeLevel;
  ProductUnitWeight.AsInteger:=OldUnitWeight;
  ProductMeasUnit.AsString:=OldMeasUnit;
  ProductRcvUnit.AsString:=OldRcvUnit;
  ProductFixedWeight.AsString:=OldFixedWeight;
  {OnOrder and InStock are automatically assigned zeros}
  ProductLabelDescr.AsString:=OldLabelDescr;
  ProductPurchCategory.AsString:=OldPurchCategory;
  ProductCtrlAcct.AsString:=OldCtrlAcct;
  CopiedLabel.Visible:=true;
end;

end.
