unit fMakeRedundant;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Buttons, Db, DBTables, Grids, DBGrids,
  ODPopCal, ODDBCal, DBCtrls, XLSDbRead2, XLSReadWriteII2;

type
  TfrmMakeRedundant = class(TForm)
    pgeMakeRedundant: TPageControl;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    tshRM: TTabSheet;
    tshYarn: TTabSheet;
    tshVB: TTabSheet;
    btnClose: TBitBtn;
    gbxTxnDetMovement: TGroupBox;
    datTDMRM: TDataSource;
    dbgTDMRM: TDBGrid;
    qryTDMRM: TQuery;
    gbxTxnDetMovementNotes: TGroupBox;
    gbxDelPallet: TGroupBox;
    gbxWIPRcpt: TGroupBox;
    gbxTxnDet: TGroupBox;
    gbxTotals: TGroupBox;
    Label2: TLabel;
    edtNotesRM: TEdit;
    cbxMakeRedundantRM: TCheckBox;
    qryDelPalletRM: TQuery;
    qryWIPRcptRM: TQuery;
    qryTxnDetByQltyRM: TQuery;
    qryDelPalletTotalRM: TQuery;
    qryWIPRcptTotalRM: TQuery;
    qryUpdateTDMRM: TQuery;
    datDelPalletRM: TDataSource;
    datWIPRcptRM: TDataSource;
    datTxnDetByQltyRM: TDataSource;
    datDelPalletTotalRM: TDataSource;
    datWIPRcptTotalRM: TDataSource;
    dbgDelPalletRM: TDBGrid;
    dbgWIPRcptRM: TDBGrid;
    dbgTxnDetByQltyRM: TDBGrid;
    dbgTxnDetByTxnCodeRM: TDBGrid;
    qryTxnDetByTxnCodeRM: TQuery;
    datTxnDetByTxnCodeRM: TDataSource;
    qryTxnDetRM: TQuery;
    datTxnDetRM: TDataSource;
    dbgTxnDetRM: TDBGrid;
    dbgDelPalletTotalRM: TDBGrid;
    dbgWIPRcptTotalRM: TDBGrid;
    btnUpdateRM: TButton;
    btnMakeRedundantRM: TButton;
    qryMakeWIPRedundantRM: TQuery;
    Label1: TLabel;
    edtTotalStockRM: TEdit;
    qryDelPalletTotalRMQTYRCVD: TFloatField;
    qryDelPalletTotalRMQTYISSUED: TFloatField;
    qryDelPalletTotalRMQTYINSTOCK: TFloatField;
    qryWIPRcptTotalRMQLTY: TStringField;
    qryWIPRcptTotalRMNETWEIGHT: TFloatField;
    qryWIPRcptTotalRMITEMS: TIntegerField;
    qryWIPRcptRMREFNO: TIntegerField;
    qryWIPRcptRMPRODREF: TStringField;
    qryWIPRcptRMRCPTDATE: TDateTimeField;
    qryWIPRcptRMRCPTINITIALS: TStringField;
    qryWIPRcptRMNETWEIGHT: TFloatField;
    qryWIPRcptRMLOTNO1: TSmallintField;
    qryWIPRcptRMLOTNO2: TSmallintField;
    qryWIPRcptRMSHIFT: TStringField;
    qryWIPRcptRMDATEMANU: TDateTimeField;
    qryWIPRcptRMDATEISSUED: TDateTimeField;
    qryWIPRcptRMISSUEINITIALS: TStringField;
    qryWIPRcptRMISSUETO: TStringField;
    qryWIPRcptRMVALUERATING: TFloatField;
    qryWIPRcptRMVALUERATINGDATE: TDateTimeField;
    qryWIPRcptRMSTOCKAREA: TIntegerField;
    qryWIPRcptRMBATREF: TIntegerField;
    qryWIPRcptRMDATEENT: TDateTimeField;
    qryWIPRcptRMUSERENT: TStringField;
    qryWIPRcptRMDATEMOD: TDateTimeField;
    qryWIPRcptRMUSERMOD: TStringField;
    qryWIPRcptRMFACTORYNO: TIntegerField;
    qryWIPRcptRMQLTY: TStringField;
    qryDelPalletRMDELNO: TIntegerField;
    qryDelPalletRMPALLETNO: TSmallintField;
    qryDelPalletRMPRODREF: TStringField;
    qryDelPalletRMBAGCARTBALEDEL: TSmallintField;
    qryDelPalletRMQTYRCVD: TFloatField;
    qryDelPalletRMMERGENO: TStringField;
    qryDelPalletRMQTYISSUED: TFloatField;
    qryDelPalletRMBCBISSUED: TFloatField;
    qryDelPalletRMVALUERATING: TFloatField;
    qryDelPalletRMVALUERATINGDATE: TDateTimeField;
    qryTxnDetByQltyRMQLTY: TStringField;
    qryTxnDetByQltyRMSUM: TFloatField;
    qryTxnDetByTxnCodeRMTXNCODE: TStringField;
    qryTxnDetByTxnCodeRMSUM: TFloatField;
    GroupBox1: TGroupBox;
    dbgTDMYarn: TDBGrid;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtNotesYarn: TEdit;
    cbxMakeRedundantYarn: TCheckBox;
    btnUpdateYN: TButton;
    btnMakeRedundantYN: TButton;
    GroupBox3: TGroupBox;
    dbgTxnDetByQltyYarn: TDBGrid;
    dbgTxnDetByTxnCodeYarn: TDBGrid;
    dbgTxnDetYarn: TDBGrid;
    qryTDMYarn: TQuery;
    datTDMYarn: TDataSource;
    qryUpdateTDMYarn: TQuery;
    qryMakeYarnRedundantVT1: TQuery;
    qryTxnDetByQltyYarn: TQuery;
    datTxnDetByQltyYarn: TDataSource;
    qryTxnDetByTxnCodeYarn: TQuery;
    datTxnDetByTxnCodeYarn: TDataSource;
    qryTxnDetYarn: TQuery;
    datTxnDetYarn: TDataSource;
    gbxVT1Yarn: TGroupBox;
    dbgVT1Yarn: TDBGrid;
    qryVT1Yarn: TQuery;
    datVT1Yarn: TDataSource;
    qryVT1YarnYNQLTY: TStringField;
    qryVT1YarnYNNET: TFloatField;
    qryTxnDetByQltyYarnQLTY: TStringField;
    qryTxnDetByQltyYarnSUM: TFloatField;
    qryTxnDetByTxnCodeYarnTXNCODE: TStringField;
    qryTxnDetByTxnCodeYarnSUM: TFloatField;
    qryVT2Yarn: TQuery;
    datVT2Yarn: TDataSource;
    gbxVT2Yarn: TGroupBox;
    dbgVT2Yarn: TDBGrid;
    qryMakeYarnRedundantVT2: TQuery;
    qryVT2YarnYNQLTY: TStringField;
    qryVT2YarnYNNET: TFloatField;
    gbxVBMovement: TGroupBox;
    dbgVBM: TDBGrid;
    gbxVBMNotes: TGroupBox;
    Label4: TLabel;
    edtNotesVB: TEdit;
    cbxMakeRedundantVB: TCheckBox;
    btnUpdateVBM: TButton;
    btnMakeVBRedundant: TButton;
    qryVBM: TQuery;
    datVBM: TDataSource;
    qryUpdateVBM: TQuery;
    qryMakeVBRedundant: TQuery;
    qryVBMVBSTRU: TStringField;
    qryVBMVBCOL: TStringField;
    qryVBMVBFIN: TStringField;
    qryVBMVBWIDTH: TIntegerField;
    qryVBMOPENINGQTY: TFloatField;
    qryVBMINMOVEMENTQTY: TFloatField;
    qryVBMOUTMOVEMENTQTY: TFloatField;
    qryVBMCLOSINGQTY: TFloatField;
    qryVBMMANUAFTERCLOSING: TFloatField;
    qryVBMSTKPRICE: TFloatField;
    qryVBMSTKVALUE: TFloatField;
    qryVBMMAKEREDUNDANT: TStringField;
    qryVBMNOTES: TStringField;
    gbxVB: TGroupBox;
    dbgVBRcpt: TDBGrid;
    qryVBRcpt: TQuery;
    datVBRcpt: TDataSource;
    qryVBRcptVBSTRU: TStringField;
    qryVBRcptVBCOL: TStringField;
    qryVBRcptVBFIN: TStringField;
    qryVBRcptMETRICWIDTH: TSmallintField;
    qryVBRcptBOXNO: TIntegerField;
    qryVBRcptNETLENGTH: TFloatField;
    qryVBRcptDESPNO: TIntegerField;
    qryVBRcptDATEMANU: TDateTimeField;
    qryVBRcptVALUERATING: TIntegerField;
    gbxVBTotals: TGroupBox;
    dbgVBTotals: TDBGrid;
    qryVBRcptQLTY: TStringField;
    qryVBTotals: TQuery;
    datVBTotals: TDataSource;
    tshFindRedundantStock: TTabSheet;
    btnFindRedundant: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cbxRMFound: TDBCheckBox;
    cbxYarnFound: TDBCheckBox;
    cbxVBFound: TDBCheckBox;
    dbgRMRedundant: TDBRadioGroup;
    rdgVBRedundant: TDBRadioGroup;
    odpYearEnd: TODDBPopupCalendar;
    odpMovement: TODDBPopupCalendar;
    odpAfterMovement: TODDBPopupCalendar;
    odpPriceDate: TODDBPopupCalendar;
    rdgYarnRedundant: TDBRadioGroup;
    sprFindRedundantRM: TStoredProc;
    sprFindRedundantYarn: TStoredProc;
    sprFindRedundantVB: TStoredProc;
    tabRedundantStockParams: TTable;
    tabRedundantStockParamsYEARENDDATE: TDateTimeField;
    tabRedundantStockParamsMOVEMENTFROMDATE: TDateTimeField;
    tabRedundantStockParamsMOVEMENTTODATE: TDateTimeField;
    tabRedundantStockParamsAFTERMOVEMENTDATE: TDateTimeField;
    tabRedundantStockParamsPRICEDATE: TDateTimeField;
    tabRedundantStockParamsRMFOUND: TStringField;
    tabRedundantStockParamsYARNFOUND: TStringField;
    tabRedundantStockParamsVBFOUND: TStringField;
    tabRedundantStockParamsRMREDUNDANT: TStringField;
    tabRedundantStockParamsYARNREDUNDANT: TStringField;
    tabRedundantStockParamsVBREDUNDANT: TStringField;
    datRedundantStockParams: TDataSource;
    dbnRedundantStockParams: TDBNavigator;
    qryUpdateRedFound: TQuery;
    btnExportFiles: TButton;
    Label9: TLabel;
    edtExportDirectory: TEdit;
    qryExportRM: TQuery;
    qryExportYarn: TQuery;
    qryExportVB: TQuery;
    Label10: TLabel;
    qryVBMDESPAFTERCLOSING: TFloatField;
    qryVBMLASTMOVEMENTDATEMANU: TDateTimeField;
    qryVBMLASTMOVEMENTDATEDESP: TDateTimeField;
    XLS: TXLSReadWriteII2;
    XLSDbRead: TXLSDbRead2;
    Label11: TLabel;
    cbxSpeedUpRMWIP: TCheckBox;
    tabRedundantStockParamsHISTORYCOPIED: TStringField;
    qryTDMRMEXTPRODREF: TStringField;
    qryTDMRMINMOVEMENTQTY: TFloatField;
    qryTDMRMOUTMOVEMENTQTY: TFloatField;
    qryTDMRMAFTERMOVEMENTQTY: TFloatField;
    qryTDMRMVERYLASTMOVEMENTDATE: TDateTimeField;
    qryTDMRMCURRENTSTOCK: TFloatField;
    qryTDMRMSTDPRICE: TFloatField;
    qryTDMRMSTKVALUE: TFloatField;
    qryTDMRMMAKEREDUNDANT: TStringField;
    qryTDMRMNOTES: TStringField;
    qryTDMRMPRODREF: TStringField;
    qryTDMYarnEXTPRODREF: TStringField;
    qryTDMYarnINMOVEMENTQTY: TFloatField;
    qryTDMYarnOUTMOVEMENTQTY: TFloatField;
    qryTDMYarnAFTERMOVEMENTQTY: TFloatField;
    qryTDMYarnVERYLASTMOVEMENTDATE: TDateTimeField;
    qryTDMYarnCURRENTSTOCK: TFloatField;
    qryTDMYarnSTDPRICE: TFloatField;
    qryTDMYarnSTKVALUE: TFloatField;
    qryTDMYarnMAKEREDUNDANT: TStringField;
    qryTDMYarnNOTES: TStringField;
    qryTDMYarnYNSTRU: TStringField;
    qryTDMYarnYNCOL: TStringField;
    qryTDMYarnYNTWIST: TStringField;
    qryTDMRMOPENINGSTOCK: TFloatField;
    qryTDMRMCLOSINGSTOCK: TFloatField;
    qryTDMYarnOPENINGSTOCK: TFloatField;
    qryTDMYarnCLOSINGSTOCK: TFloatField;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure datTDMRMDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnUpdateRMClick(Sender: TObject);
    procedure btnMakeRedundantRMClick(Sender: TObject);
    procedure datTDMYarnDataChange(Sender: TObject; Field: TField);
    procedure btnUpdateYNClick(Sender: TObject);
    procedure btnMakeRedundantYNClick(Sender: TObject);
    procedure datVBMDataChange(Sender: TObject; Field: TField);
    procedure btnUpdateVBMClick(Sender: TObject);
    procedure btnMakeVBRedundantClick(Sender: TObject);
    procedure btnFindRedundantClick(Sender: TObject);
    procedure btnExportFilesClick(Sender: TObject);
    procedure datRedundantStockParamsStateChange(Sender: TObject);
  private
    procedure CloseAllQueries;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMakeRedundant: TfrmMakeRedundant;

implementation

uses Main;

{$R *.DFM}

procedure TfrmMakeRedundant.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMakeRedundant.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseAllQueries;
  Release;
end;

procedure TfrmMakeRedundant.datTDMRMDataChange(Sender: TObject;
  Field: TField);
begin
  if qryTDMRMMAKEREDUNDANT.AsString='N' then
    cbxMakeRedundantRM.Checked:=false
  else
    cbxMakeRedundantRM.Checked:=true;
  edtNotesRM.Text:=qryTDMRMNOTES.AsString;
  qryDelPalletRM.Close;
  qryWIPRcptRM.Close;
  qryTxnDetByQltyRM.Close;
  qryTxnDetByTxnCodeRM.Close;
  qryTxnDetRM.Close;
  if not cbxSpeedUpRMWIP.Checked then
  begin
    qryDelPalletRM.ParamByName('ProdRef').AsString:=qryTDMRMPRODREF.AsString;
    qryDelPalletRM.Open;
    qryWIPRcptRM.ParamByName('ProdRef').AsString:=qryTDMRMPRODREF.AsString;
    qryWIPRcptRM.Open;
    qryTxnDetByQltyRM.ParamByName('ExtProdRef').AsString:=qryTDMRMEXTPRODREF.AsString;
    qryTxnDetByQltyRM.Open;
    qryTxnDetByTxnCodeRM.ParamByName('ExtProdRef').AsString:=qryTDMRMEXTPRODREF.AsString;
    qryTxnDetByTxnCodeRM.Open;
    qryTxnDetRM.ParamByName('ExtProdRef').AsString:=qryTDMRMEXTPRODREF.AsString;
    qryTxnDetRM.Open;
  end;
  qryDelPalletTotalRM.Close;
  qryDelPalletTotalRM.ParamByName('ProdRef').AsString:=qryTDMRMPRODREF.AsString;
  qryDelPalletTotalRM.Open;
  qryWIPRcptTotalRM.Close;
  qryWIPRcptTotalRM.ParamByName('ProdRef').AsString:=qryTDMRMPRODREF.AsString;
  qryWIPRcptTotalRM.Open;
  edtTotalStockRM.Text:=floattostr(qryDelPalletTotalRMQTYINSTOCK.AsFloat+qryWIPRcptTotalRMNETWEIGHT.AsFloat);
end;

procedure TfrmMakeRedundant.FormShow(Sender: TObject);
begin
  //cbxMakeRedundant.Checked:=false;
  //edtNotes.Text:='';
  pgeMakeRedundant.ActivePage:=tshFindRedundantStock;
  tabRedundantStockParams.Close;
  tabRedundantStockParams.Open;
  qryTDMRM.Close;
  qryTDMRM.Open;
  qryTDMYarn.Close;
  qryTDMYarn.Open;
  if MainForm.DatabaseAlias.Text='VBStock6LinuxSQL' then
  begin
    dbgVT1Yarn.Visible:=false;
    dbgVT2Yarn.Visible:=true;
    cbxVBFound.Visible:=true;
    tshVB.TabVisible:=true;
    qryVBM.Close;
    qryVBM.ParamByName('PriceDate').AsDateTime:=tabRedundantStockParamsPRICEDATE.AsDateTime; //added DL091012
    qryVBM.Open;
  end
  else
  begin
    dbgVT1Yarn.Visible:=true;
    dbgVT2Yarn.Visible:=false;
    cbxVBFound.Visible:=false;
    tshVB.TabVisible:=false;
  end;
end;

procedure TfrmMakeRedundant.btnUpdateRMClick(Sender: TObject);
var
  lSavePlace: TBookmark;
  lMessageResult:boolean;
begin
  //set the txndetmovement notes field and makeredundant flag information
  if (qryTDMRMMAKEREDUNDANT.AsString='Y') and (not cbxMakeRedundantRM.Checked) then
    lMessageResult:=(MessageDlg('Are you sure you want to make an item that is set redundant, not redundant?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  else
    lMessageResult:=true;
  if lMessageResult then
  begin
    qryUpdateTDMRM.Close;
    qryUpdateTDMRM.ParamByName('ExtProdRef').AsString:=qryTDMRMEXTPRODREF.AsString;
    if cbxMakeRedundantRM.Checked then
      qryUpdateTDMRM.ParamByName('MakeRedundant').AsString:='Y'
    else
      qryUpdateTDMRM.ParamByName('MakeRedundant').AsString:='N';
    qryUpdateTDMRM.ParamByName('Notes').AsString:=edtNotesRM.Text;
    MainForm.Database.StartTransaction;
    qryUpdateTDMRM.ExecSQL;
    MainForm.Database.Commit;
    lSavePlace:=qryTDMRM.GetBookmark;
    try
      qryTDMRM.Close;
      qryTDMRM.Open;
      qryTDMRM.GotoBookmark(lSavePlace);
    finally
      qryTDMRM.FreeBookmark(lSavePlace);
    end;
  end;
end;

procedure TfrmMakeRedundant.btnMakeRedundantRMClick(Sender: TObject);
var
  lSavePlace: TBookmark;
  lMessageResult:boolean;
begin
  //make the WIP Redundant
  if qryTDMRMMAKEREDUNDANT.AsString='N' then
    raise Exception.Create('Please set the make redundant flag first and then click this button again.');
  if not cbxMakeRedundantRM.Checked then
  begin
    if qryWIPRcptRMREFNO.IsNull then
    begin
      if qryDelPalletRMDELNO.IsNull then
        raise Exception.Create('Nothing To Make Redundant.')
      else
        raise Exception.Create('No WIP To Make Redundant; But there still may be Pallet Info to make redundant');
    end;
  end;
  if qryTDMRMAFTERMOVEMENTQTY.AsFloat<>0 then
    lMessageResult:=(MessageDlg('After Movement Quantity Is Not Zero. Are you sure?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  else
    lMessageResult:=true;
  if lMessageResult then
  begin
    qryMakeWIPRedundantRM.Close;
    qryMakeWIPRedundantRM.ParamByName('ProdRef').AsString:=qryTDMRMPRODREF.AsString;
    qryMakeWIPRedundantRM.ParamByName('DateManu').AsDateTime:=tabRedundantStockParamsYEARENDDATE.AsDateTime; // encodedate(2006,12,31); //xx make variable after parameter file added
    MainForm.Database.StartTransaction;
    qryMakeWIPRedundantRM.ExecSQL;
    MainForm.Database.Commit;
    lSavePlace:=qryTDMRM.GetBookmark;
    try
      qryTDMRM.Close;
      qryTDMRM.Open;
      qryTDMRM.GotoBookmark(lSavePlace);
    finally
      qryTDMRM.FreeBookmark(lSavePlace);
    end;
  end;
end;

procedure TfrmMakeRedundant.datTDMYarnDataChange(Sender: TObject;
  Field: TField);
begin
  if qryTDMYarnMAKEREDUNDANT.AsString='N' then
    cbxMakeRedundantYarn.Checked:=false
  else
    cbxMakeRedundantYarn.Checked:=true;
  edtNotesYarn.Text:=qryTDMYarnNOTES.AsString;
  qryTxnDetByQltyYarn.Close;
  qryTxnDetByQltyYarn.ParamByName('ExtProdRef').AsString:=qryTDMYarnEXTPRODREF.AsString;
  qryTxnDetByQltyYarn.Open;
  qryTxnDetByTxnCodeYarn.Close;
  qryTxnDetByTxnCodeYarn.ParamByName('ExtProdRef').AsString:=qryTDMYarnEXTPRODREF.AsString;
  qryTxnDetByTxnCodeYarn.Open;
  qryTxnDetYarn.Close;
  qryTxnDetYarn.ParamByName('ExtProdRef').AsString:=qryTDMYarnEXTPRODREF.AsString;
  qryTxnDetYarn.Open;
  if MainForm.DatabaseAlias.Text='VBStock6LinuxSQL' then
  begin
    qryVT2Yarn.Close;
    qryVT2Yarn.ParamByName('YnStru').AsString:=qryTDMYarnYNSTRU.AsString;
    qryVT2Yarn.ParamByName('YnTwist').AsString:=qryTDMYarnYNTWIST.AsString;
    qryVT2Yarn.ParamByName('YnCol').AsString:=qryTDMYarnYNCOL.AsString;
    qryVT2Yarn.Open;
  end
  else
  begin
    qryVT1Yarn.Close;
    qryVT1Yarn.ParamByName('YnStru').AsString:=qryTDMYarnYNSTRU.AsString;
    qryVT1Yarn.ParamByName('YnTwist').AsString:=qryTDMYarnYNTWIST.AsString;
    qryVT1Yarn.ParamByName('YnCol').AsString:=qryTDMYarnYNCOL.AsString;
    qryVT1Yarn.Open;
  end;
end;

procedure TfrmMakeRedundant.btnUpdateYNClick(Sender: TObject);
var
  lSavePlace: TBookmark;
  lMessageResult:boolean;
begin
  //set the txndetmovementyarn notes field and makeredundant flag information
  if (qryTDMYarnMAKEREDUNDANT.AsString='Y') and (not cbxMakeRedundantYarn.Checked) then
    lMessageResult:=(MessageDlg('Are you sure you want to make an item that is set redundant, not redundant?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  else
    lMessageResult:=true;
  if lMessageResult then
  begin
    qryUpdateTDMYarn.Close;
    qryUpdateTDMYarn.ParamByName('ExtProdRef').AsString:=qryTDMYarnEXTPRODREF.AsString;
    if cbxMakeRedundantYarn.Checked then
      qryUpdateTDMYarn.ParamByName('MakeRedundant').AsString:='Y'
    else
      qryUpdateTDMYarn.ParamByName('MakeRedundant').AsString:='N';
    qryUpdateTDMYarn.ParamByName('Notes').AsString:=edtNotesYarn.Text;
    MainForm.Database.StartTransaction;
    qryUpdateTDMYarn.ExecSQL;
    MainForm.Database.Commit;
    lSavePlace:=qryTDMYarn.GetBookmark;
    try
      qryTDMYarn.Close;
      qryTDMYarn.Open;
      qryTDMYarn.GotoBookmark(lSavePlace);
    finally
      qryTDMYarn.FreeBookmark(lSavePlace);
    end;
  end;
end;

procedure TfrmMakeRedundant.btnMakeRedundantYNClick(Sender: TObject);
var
  lSavePlace: TBookmark;
  lMessageResult:boolean;

  procedure MakeVT1YarnRedundant;
  begin
    if qryVT1YarnYNNET.IsNull then
      raise Exception.Create('No WIP To Make Redundant; But there still may be Pallet Info to make redundant');
    if qryTDMYarnAFTERMOVEMENTQTY.AsFloat<>0 then
      lMessageResult:=(MessageDlg('After Movement Quantity Is Not Zero. Are you sure?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    else
      lMessageResult:=true;
    if lMessageResult then
    begin
      qryVT1Yarn.First;
      while not qryVT1Yarn.Eof do
      begin
        qryMakeYarnRedundantVT1.Close;
        qryMakeYarnRedundantVT1.ParamByName('YnStru').AsString:=qryTDMYarnYNSTRU.AsString;
        qryMakeYarnRedundantVT1.ParamByName('YnTwist').AsString:=qryTDMYarnYNTWIST.AsString;
        qryMakeYarnRedundantVT1.ParamByName('YnCol').AsString:=qryTDMYarnYNCOL.AsString;
        qryMakeYarnRedundantVT1.ParamByName('FromYnQlty').AsString:=qryVT1YarnYNQLTY.AsString;
        if (qryVT1YarnYNQLTY.AsString='') or (qryVT1YarnYNQLTY.AsString=' ') then //firsts
          qryMakeYarnRedundantVT1.ParamByName('ToYnQlty').AsString:='6'
        else if (qryVT1YarnYNQLTY.AsString='T') then //yarn for twister
          qryMakeYarnRedundantVT1.ParamByName('ToYnQlty').AsString:='7'
        else if (qryVT1YarnYNQLTY.AsString='S') then //substandard yarn
          qryMakeYarnRedundantVT1.ParamByName('ToYnQlty').AsString:='8'
        else if (qryVT1YarnYNQLTY.AsString='R') then //rewinds
          qryMakeYarnRedundantVT1.ParamByName('ToYnQlty').AsString:='9';
        qryMakeYarnRedundantVT1.ParamByName('DateManu').AsDateTime:=tabRedundantStockParamsYEARENDDATE.AsDateTime; // encodedate(2006,12,31); //xx make variable after parameter file added
        MainForm.Database.StartTransaction;
        qryMakeYarnRedundantVT1.ExecSQL;
        MainForm.Database.Commit;
        qryVT1Yarn.Next;
      end;
      lSavePlace:=qryTDMYarn.GetBookmark;
      try
        qryTDMYarn.Close;
        qryTDMYarn.Open;
        qryTDMYarn.GotoBookmark(lSavePlace);
      finally
        qryTDMYarn.FreeBookmark(lSavePlace);
      end;
    end;
  end; //MakeVT1YarnRedundant;

  procedure MakeVT2YarnRedundant;
  begin
    if qryVT2YarnYNNET.IsNull then
      raise Exception.Create('No WIP To Make Redundant; But there still may be Pallet Info to make redundant');
    if qryTDMYarnAFTERMOVEMENTQTY.AsFloat<>0 then
      lMessageResult:=(MessageDlg('After Movement Quantity Is Not Zero. Are you sure?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    else
      lMessageResult:=true;
    if lMessageResult then
    begin
      qryVT2Yarn.First;
      while not qryVT2Yarn.Eof do
      begin
        qryMakeYarnRedundantVT2.Close;
        qryMakeYarnRedundantVT2.ParamByName('YnStru').AsString:=qryTDMYarnYNSTRU.AsString;
        qryMakeYarnRedundantVT2.ParamByName('YnTwist').AsString:=qryTDMYarnYNTWIST.AsString;
        qryMakeYarnRedundantVT2.ParamByName('YnCol').AsString:=qryTDMYarnYNCOL.AsString;
        qryMakeYarnRedundantVT2.ParamByName('FromYnQlty').AsString:=qryVT2YarnYNQLTY.AsString;
        if (qryVT2YarnYNQLTY.AsString='') or (qryVT2YarnYNQLTY.AsString=' ') then //firsts
          qryMakeYarnRedundantVT2.ParamByName('ToYnQlty').AsString:='6'
        else if (qryVT2YarnYNQLTY.AsString='T') then //yarn for twister
          qryMakeYarnRedundantVT2.ParamByName('ToYnQlty').AsString:='7'
        else if (qryVT2YarnYNQLTY.AsString='S') then //substandard yarn
          qryMakeYarnRedundantVT2.ParamByName('ToYnQlty').AsString:='8'
        else if (qryVT2YarnYNQLTY.AsString='R') then //rewinds
          qryMakeYarnRedundantVT2.ParamByName('ToYnQlty').AsString:='9';
        qryMakeYarnRedundantVT2.ParamByName('DateRcvd').AsDateTime:=tabRedundantStockParamsYEARENDDATE.AsDateTime; // encodedate(2006,12,31); //xx make variable after parameter file added
        MainForm.Database.StartTransaction;
        qryMakeYarnRedundantVT2.ExecSQL;
        MainForm.Database.Commit;
        qryVT2Yarn.Next;
      end;
      lSavePlace:=qryTDMYarn.GetBookmark;
      try
        qryTDMYarn.Close;
        qryTDMYarn.Open;
        qryTDMYarn.GotoBookmark(lSavePlace);
      finally
        qryTDMYarn.FreeBookmark(lSavePlace);
      end;
    end;
  end; //MakeVT2YarnRedundant;

begin
  //make the WIP Redundant
  if qryTDMYarnMAKEREDUNDANT.AsString='N' then
    raise Exception.Create('Please set the make redundant flag first and then click this button again.');
  if MainForm.DatabaseAlias.Text='VBStock6LinuxSQL' then
    MakeVT2YarnRedundant
  else
    MakeVT1YarnRedundant;

end;

procedure TfrmMakeRedundant.datVBMDataChange(Sender: TObject;
  Field: TField);
begin
  if qryVBMMAKEREDUNDANT.AsString='N' then
    cbxMakeRedundantVB.Checked:=false
  else
    cbxMakeRedundantVB.Checked:=true;
  edtNotesVB.Text:=qryVBMNOTES.AsString;
  qryVBRcpt.Close;
  qryVBRcpt.ParamByName('VBStru').AsString:=qryVBMVBSTRU.AsString;
  qryVBRcpt.ParamByName('VBCol').AsString:=qryVBMVBCOL.AsString;
  qryVBRcpt.ParamByName('VBFin').AsString:=qryVBMVBFIN.AsString;
  qryVBRcpt.ParamByName('MetricWidth').AsInteger:=qryVBMVBWIDTH.AsInteger;
  qryVBRcpt.ParamByName('DateManu').AsDateTime:=tabRedundantStockParamsYEARENDDATE.AsDateTime; // encodedate(2006,12,31); //xx make variable after parameter file added
  qryVBRcpt.Open;
  qryVBTotals.Close;
  qryVBTotals.ParamByName('VBStru').AsString:=qryVBMVBSTRU.AsString;
  qryVBTotals.ParamByName('VBCol').AsString:=qryVBMVBCOL.AsString;
  qryVBTotals.ParamByName('VBFin').AsString:=qryVBMVBFIN.AsString;
  qryVBTotals.ParamByName('MetricWidth').AsInteger:=qryVBMVBWIDTH.AsInteger;
  qryVBTotals.ParamByName('DateManu').AsDateTime:=tabRedundantStockParamsYEARENDDATE.AsDateTime; // encodedate(2006,12,31); //xx make variable after parameter file added
  qryVBTotals.Open;
end;

procedure TfrmMakeRedundant.btnUpdateVBMClick(Sender: TObject);
var
  lSavePlace: TBookmark;
  lMessageResult:boolean;
begin
  //set the vbmovement notes field and makeredundant flag information
  if (qryVBMMAKEREDUNDANT.AsString='Y') and (not cbxMakeRedundantVB.Checked) then
    lMessageResult:=(MessageDlg('Are you sure you want to make an item that is set redundant, not redundant?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  else
    lMessageResult:=true;
  if lMessageResult then
  begin
    qryUpdateVBM.Close;
    qryUpdateVBM.ParamByName('VBStru').AsString:=qryVBMVBStru.AsString;
    qryUpdateVBM.ParamByName('VBCol').AsString:=qryVBMVBCol.AsString;
    qryUpdateVBM.ParamByName('VBFin').AsString:=qryVBMVBFin.AsString;
    qryUpdateVBM.ParamByName('VBWidth').AsInteger:=qryVBMVBWidth.AsInteger;
    if cbxMakeRedundantVB.Checked then
      qryUpdateVBM.ParamByName('MakeRedundant').AsString:='Y'
    else
      qryUpdateVBM.ParamByName('MakeRedundant').AsString:='N';
    qryUpdateVBM.ParamByName('Notes').AsString:=edtNotesVB.Text;
    MainForm.Database.StartTransaction;
    qryUpdateVBM.ExecSQL;
    MainForm.Database.Commit;
    lSavePlace:=qryVBM.GetBookmark;
    try
      qryVBM.Close;
      qryVBM.ParamByName('PriceDate').AsDateTime:=tabRedundantStockParamsPRICEDATE.AsDateTime; //added DL091012
      qryVBM.Open;
      qryVBM.GotoBookmark(lSavePlace);
    finally
      qryVBM.FreeBookmark(lSavePlace);
    end;
  end;
end;

procedure TfrmMakeRedundant.btnMakeVBRedundantClick(Sender: TObject);
var
  lSavePlace: TBookmark;
  lMessageResult:boolean;
begin
  //make the VB Redundant
  if qryVBMMAKEREDUNDANT.AsString='N' then
    raise Exception.Create('Please set the make redundant flag first and then click this button again.');
  if qryVBMVBSTRU.IsNull then
    raise Exception.Create('Nothing To Make Redundant.');
  if qryVBMMANUAFTERCLOSING.AsFloat<>0 then
    lMessageResult:=(MessageDlg('After Movement Quantity Is Not Zero. Are you sure?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  else
    lMessageResult:=true;
  if lMessageResult then
  begin
    qryMakeVBRedundant.Close;
    qryMakeVBRedundant.ParamByName('VBStru').AsString:=qryVBMVBStru.AsString;
    qryMakeVBRedundant.ParamByName('VBCol').AsString:=qryVBMVBCol.AsString;
    qryMakeVBRedundant.ParamByName('VBFin').AsString:=qryVBMVBFin.AsString;
    qryMakeVBRedundant.ParamByName('MetricWidth').AsInteger:=qryVBMVBWidth.AsInteger;
    qryMakeVBRedundant.ParamByName('DateManu').AsDateTime:=tabRedundantStockParamsYEARENDDATE.AsDateTime; // encodedate(2006,12,31); //xx make variable after parameter file added
    MainForm.Database.StartTransaction;
    qryMakeVBRedundant.ExecSQL;
    MainForm.Database.Commit;
    lSavePlace:=qryVBM.GetBookmark;
    try
      qryVBM.Close;
      qryVBM.ParamByName('PriceDate').AsDateTime:=tabRedundantStockParamsPRICEDATE.AsDateTime; //added DL091012
      qryVBM.Open;
      qryVBM.GotoBookmark(lSavePlace);
    finally
      qryVBM.FreeBookmark(lSavePlace);
    end;
  end;
end;

procedure TfrmMakeRedundant.btnFindRedundantClick(Sender: TObject);
var
  lMessage:string;
begin
  if tabRedundantStockParams.State=dsEdit then
    raise Exception.Create('Please save or cancel first');
  if tabRedundantStockParamsHISTORYCOPIED.AsString='Y' then
    raise Exception.Create('Cannot Find (and replace) Stock if already copied');
  lMessage:='Do you wish to find the redundant stock for the entered dates?';
    //+#13+
    //'History will be cleared, so if you wish to keep it, click ''Keep History'' first'+#13+
    //'Clicking Keep History will also update the dates';
  if MessageDlg(lMessage, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    CloseAllQueries;

    MainForm.Database.StartTransaction;

    StatusBar.SimpleText:='Finding Redundant RM and WIPRcpt Stock';
    Application.ProcessMessages;
    sprFindRedundantRM.Close;
    sprFindRedundantRM.ParamByName('pYearEndDate').AsDateTime:=tabRedundantStockParamsYEARENDDATE.AsDateTime;
    sprFindRedundantRM.ParamByName('pMovementFrom').AsDateTime:=tabRedundantStockParamsMOVEMENTFROMDATE.AsDateTime;
    sprFindRedundantRM.ParamByName('pMovementTo').AsDateTime:=tabRedundantStockParamsMOVEMENTTODATE.AsDateTime;
    sprFindRedundantRM.ParamByName('pAfterMovementFrom').AsDateTime:=tabRedundantStockParamsAFTERMOVEMENTDATE.AsDateTime;
    sprFindRedundantRM.ParamByName('pPriceDate').AsDateTime:=tabRedundantStockParamsPRICEDATE.AsDateTime;
    sprFindRedundantRM.ExecProc;

    StatusBar.SimpleText:='Finding Redundant Yarn Stock';
    Application.ProcessMessages;
    sprFindRedundantYarn.Close;
    sprFindRedundantYarn.ParamByName('pYearEndDate').AsDateTime:=tabRedundantStockParamsYEARENDDATE.AsDateTime;
    sprFindRedundantYarn.ParamByName('pMovementFrom').AsDateTime:=tabRedundantStockParamsMOVEMENTFROMDATE.AsDateTime;
    sprFindRedundantYarn.ParamByName('pMovementTo').AsDateTime:=tabRedundantStockParamsMOVEMENTTODATE.AsDateTime;
    sprFindRedundantYarn.ParamByName('pAfterMovementFrom').AsDateTime:=tabRedundantStockParamsAFTERMOVEMENTDATE.AsDateTime;
    sprFindRedundantYarn.ParamByName('pPriceDate').AsDateTime:=tabRedundantStockParamsPRICEDATE.AsDateTime;
    sprFindRedundantYarn.ExecProc;

    if MainForm.DatabaseAlias.Text='VBStock6LinuxSQL' then
    begin
      StatusBar.SimpleText:='Finding Redundant VB Stock';
      Application.ProcessMessages;
      sprFindRedundantVB.Close;
      sprFindRedundantVB.ParamByName('pYearEndDate').AsDateTime:=tabRedundantStockParamsYEARENDDATE.AsDateTime;
      sprFindRedundantVB.ParamByName('pMovementFrom').AsDateTime:=tabRedundantStockParamsMOVEMENTFROMDATE.AsDateTime;
      sprFindRedundantVB.ParamByName('pMovementTo').AsDateTime:=tabRedundantStockParamsMOVEMENTTODATE.AsDateTime;
      sprFindRedundantVB.ParamByName('pAfterMovementFrom').AsDateTime:=tabRedundantStockParamsAFTERMOVEMENTDATE.AsDateTime;
      sprFindRedundantVB.ParamByName('pPriceDate').AsDateTime:=tabRedundantStockParamsPRICEDATE.AsDateTime;
      sprFindRedundantVB.ExecProc;
    end;
    qryUpdateRedFound.Close;
    qryUpdateRedFound.ExecSQL;
    MainForm.Database.Commit;

    StatusBar.SimpleText:='Completed finding redundant stocks';
    Application.ProcessMessages;
  end;
end;

procedure TfrmMakeRedundant.btnExportFilesClick(Sender: TObject);
var
  lDataSheetIndex:integer;
  lRow:integer;
begin
  if MessageDlg('Do you wish to Export to Excel?',mtWarning,[mbYes,mbNo], 0) = mrYes then
  begin
    StatusBar.SimpleText:='Exporting RM';
    Application.ProcessMessages;
    qryExportRM.Close;
    XLSDbRead.Dataset:=qryExportRM;
    XLS.Clear;
    qryExportRM.Open;
    XLSDbRead.Read;
    XLS.FileName:=edtExportDirectory.Text+'RedundantRM.xls';
    XLS.Write;
    //autosize the columns
    XLS.Sheets[0].AutoWidthCols(0,12);
    XLS.Write;
    //set the column formats for the date and amount
    XLS.Sheets[0].Columns[6].NumberFormat:='dd/mm/yyyy'; //date
    //XLS.Sheets[0].Columns[8].NumberFormat:='dd/mm/yyyy'; //date
    XLS.Sheets[0].Columns[1].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[2].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[3].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[4].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[5].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[7].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[8].NumberFormat:='#,##0.00'; //number
    XLS.Sheets[0].Columns[9].NumberFormat:='#,##0.00'; //number
    XLS.Write;
    //autosize the columns
    XLS.Sheets[0].AutoWidthCols(0,12);
    XLS.Write;

    StatusBar.SimpleText:='Exporting Yarn';
    Application.ProcessMessages;
    qryExportYarn.Close;
    XLSDbRead.Dataset:=qryExportYarn;
    XLS.Clear;
    qryExportYarn.Open;
    XLSDbRead.Read;
    XLS.FileName:=edtExportDirectory.Text+'RedundantYarn.xls';
    XLS.Write;
    //autosize the columns
    XLS.Sheets[0].AutoWidthCols(0,14);
    XLS.Write;
    //set the column formats for the date and amount
    XLS.Sheets[0].Columns[6].NumberFormat:='dd/mm/yyyy'; //date
    //XLS.Sheets[0].Columns[8].NumberFormat:='dd/mm/yyyy'; //date
    XLS.Sheets[0].Columns[1].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[2].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[3].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[4].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[5].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[7].NumberFormat:='#,##0.0'; //number
    XLS.Sheets[0].Columns[8].NumberFormat:='#,##0.00'; //number
    XLS.Sheets[0].Columns[9].NumberFormat:='#,##0.00'; //number
    XLS.Write;
    //autosize the columns
    XLS.Sheets[0].AutoWidthCols(0,14);
    XLS.Write;

    if MainForm.DatabaseAlias.Text='VBStock6LinuxSQL' then
    begin
      StatusBar.SimpleText:='Exporting VB';
      Application.ProcessMessages;
      qryExportVB.Close;
      qryExportVB.ParamByName('PriceDate').AsDateTime:=tabRedundantStockParamsPRICEDATE.AsDateTime;
      XLSDbRead.Dataset:=qryExportVB;
      XLS.Clear;
      qryExportVB.Open;
      XLSDbRead.Read;
      XLS.FileName:=edtExportDirectory.Text+'RedundantVB.xls';
      XLS.Write;
      //autosize the columns
      XLS.Sheets[0].AutoWidthCols(0,15);
      XLS.Write;
      //set the column formats for the date and amount
      XLS.Sheets[0].Columns[10].NumberFormat:='dd/mm/yyyy'; //date
      XLS.Sheets[0].Columns[11].NumberFormat:='dd/mm/yyyy'; //date
      XLS.Sheets[0].Columns[4].NumberFormat:='#,##0.0'; //number
      XLS.Sheets[0].Columns[5].NumberFormat:='#,##0.0'; //number
      XLS.Sheets[0].Columns[6].NumberFormat:='#,##0.0'; //number
      XLS.Sheets[0].Columns[7].NumberFormat:='#,##0.0'; //number
      XLS.Sheets[0].Columns[8].NumberFormat:='#,##0.0'; //number
      XLS.Sheets[0].Columns[9].NumberFormat:='#,##0.0'; //number
      XLS.Sheets[0].Columns[12].NumberFormat:='#,##0.00'; //number
      XLS.Sheets[0].Columns[13].NumberFormat:='#,##0.00'; //number
      XLS.Write;
      //autosize the columns
      XLS.Sheets[0].AutoWidthCols(0,15);
      XLS.Write;
    end;

    qryExportRM.Close;
    qryExportYarn.Close;
    qryExportVB.Close;

    StatusBar.SimpleText:='Ready';
    Application.ProcessMessages;
  end;
end;

procedure TfrmMakeRedundant.CloseAllQueries;
begin
  qryTxnDetByQltyRM.Close;
  qryTxnDetByQltyYarn.Close;
  qryTxnDetByTxnCodeRM.Close;
  qryTxnDetByTxnCodeYarn.Close;
  qryVBTotals.Close;
  qryDelPalletTotalRM.Close;
  qryWIPRcptTotalRM.Close;
  qryWIPRcptRM.Close;
  qryDelPalletRM.Close;
  qryVT1Yarn.Close;
  qryVT2Yarn.Close;
  qryTDMRM.Close;
  qryTDMYarn.Close;
  qryVBM.Close;
end;

procedure TfrmMakeRedundant.datRedundantStockParamsStateChange(
  Sender: TObject);
begin
  if datRedundantStockParams.State=dsEdit then
  begin
    if tabRedundantStockParamsHISTORYCOPIED.AsString='Y' then
    begin
      raise Exception.Create('Cannot change anything if history copied');
    end;
  end;
end;

end.
