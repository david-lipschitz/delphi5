unit Vbstkmin;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons,
  Mask, ComCtrls;

type
  TVBStockMinForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    VBStockMinSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    VBStockMin: TTable;
    VBStockMinVBSTRU: TStringField;
    VBStockMinVBCOL: TStringField;
    VBStockMinVBWIDTH: TSmallintField;
    VBStockMinVBFIN: TStringField;
    PrintSpdBtn: TSpeedButton;
    VBStockMinMINCALCMULTIPLIER: TFloatField;
    VBStockMinMAKESTKMULTIPLIER: TFloatField;
    VBStockMinSALEGROUP: TStringField;
    Label4: TLabel;
    EditVBStru: TEdit;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edtStru: TEdit;
    edtCol: TEdit;
    edtFin: TEdit;
    edtWidth: TEdit;
    Label6: TLabel;
    edtSaleGroup: TEdit;
    Label7: TLabel;
    btnUpdate: TButton;
    qryUpdate: TQuery;
    Panel4: TPanel;
    Splitter1: TSplitter;
    qrySalesPerMonth: TQuery;
    datSalesPerMonth: TDataSource;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid2: TDBGrid;
    qrySalesPerMonthYEARNO: TIntegerField;
    qrySalesPerMonthPERIODNO: TIntegerField;
    qrySalesPerMonthWARPTYPE: TStringField;
    qrySalesPerMonthWARPCOL: TStringField;
    qrySalesPerMonthVBSTRU: TStringField;
    qrySalesPerMonthVBCOL: TStringField;
    qrySalesPerMonthVBFIN: TStringField;
    qrySalesPerMonthVBWIDTH: TIntegerField;
    qrySalesPerMonthNETLENGTH: TIntegerField;
    qrySalesPerMonthPCSNETLENGTH: TFloatField;
    qryVBMake_Fin: TQuery;
    datVBMake_Fin: TDataSource;
    Label8: TLabel;
    qryVBMake_FinAVESALE89: TFloatField;
    qryVBMake_FinAVESALE127: TFloatField;
    qryVBMake_FinAVESALE2070: TFloatField;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label11: TLabel;
    qryVBMake_FinFWCONV: TFloatField;
    DBEdit4: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    VBStockMinSTKMIN: TIntegerField;
    VBStockMinMINSALESORDERQTY: TFloatField;
    StaticText1: TStaticText;
    btnAddMissing: TButton;
    qryGetVBType: TQuery;
    qryInsertStockMin: TQuery;
    StatusBar: TStatusBar;
    qryGetVBTypeVBSTRU: TStringField;
    qryGetVBTypeVBCOL: TStringField;
    qryGetVBTypeLABELDESCR: TStringField;
    qryGetVBTypeWARPCOL: TStringField;
    qryGetVBTypeWEFTSTRU: TStringField;
    qryGetVBTypeWEFTTWIST: TStringField;
    qryGetVBTypeWEFTCOL: TStringField;
    qryGetVBTypeWARPTYPE: TStringField;
    qryGetVBTypeDATEENT: TDateTimeField;
    qryGetVBTypeUSERENT: TStringField;
    qryGetVBTypeDATEMOD: TDateTimeField;
    qryGetVBTypeUSERMOD: TStringField;
    qryGetVBTypeVBFIN: TStringField;
    qryGetVBTypeEXTPRODREF: TStringField;
    qryCheckExistsInMin: TQuery;
    qryCheckExistsInMinVBSTRU: TStringField;
    qryCheckExistsInMinVBCOL: TStringField;
    qryCheckExistsInMinVBWIDTH: TSmallintField;
    qryCheckExistsInMinSTKMIN: TIntegerField;
    qryCheckExistsInMinVBFIN: TStringField;
    qryCheckExistsInMinMINCALCMULTIPLIER: TFloatField;
    qryCheckExistsInMinMAKESTKMULTIPLIER: TFloatField;
    qryCheckExistsInMinSALEGROUP: TStringField;
    qryCheckExistsInMinMINSALESORDERQTY: TFloatField;
    qryGetVBTypeFWONLY: TIntegerField;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure VBStockMinAfterCancel(DataSet: TDataset);
    procedure VBStockMinAfterDelete(DataSet: TDataset);
    procedure VBStockMinAfterPost(DataSet: TDataset);
    procedure VBStockMinBeforeEdit(DataSet: TDataset);
    procedure VBStockMinBeforeInsert(DataSet: TDataset);
    procedure VBStockMinBeforeDelete(DataSet: TDataset);
    procedure VBStockMinDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure EditVBStruChange(Sender: TObject);
    procedure edtStruExit(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure VBStockMinNewRecord(DataSet: TDataSet);
    procedure btnAddMissingClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  VBStockMinForm: TVBStockMinForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs;

procedure TVBStockMinForm.CloseBitBtnClick(Sender: TObject);
begin
  if VBStockMin.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Stock Minimum before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TVBStockMinForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VBStockMin.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  qrySalesPerMonth.Close;
  qryVBMake_Fin.Close;
  VBStockMin.Close;
  VBStockMinForm.Release;
end;

procedure TVBStockMinForm.FormShow(Sender: TObject);
begin
  VBStockMin.Open;
  VBStockMin.Refresh;
  qrySalesPerMonth.Open;
  qryVBMake_Fin.Open;
end;

procedure TVBStockMinForm.VBStockMinAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
end;

procedure TVBStockMinForm.VBStockMinAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TVBStockMinForm.VBStockMinAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
  VBStockMin.Refresh;
end;

procedure TVBStockMinForm.VBStockMinBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBStockMinForm.VBStockMinBeforeInsert(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBStockMinForm.VBStockMinBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TVBStockMinForm.VBStockMinDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBStockMinForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TVBStockMinForm.EditVBStruChange(Sender: TObject);
begin
{  if EditVBStru.Text='' then
    VBStockMin.Filtered:=false
  else
  begin
    VBStockMin.Filter:='vbstru='''+uppercase(EditVBStru.Text)+'''';
    VBStockMin.Filtered:=true;
  end;}
end;

procedure TVBStockMinForm.edtStruExit(Sender: TObject);
begin
  if (edtStru.Text<>'') or (edtCol.Text<>'') or (edtFin.Text<>'')
    or (edtWidth.Text<>'') or (edtSaleGroup.Text<>'') then
  begin
    VBStockMin.Filter:='';
    if edtStru.Text<>'' then
      VBStockMin.Filter:='(VBStru='''+uppercase(edtStru.Text)+''')';
    if edtCol.Text<>'' then
    begin
      if VBStockMin.Filter<>'' then
        VBStockMin.Filter:=VBStockMin.Filter+' and '+
          '(VBCol='''+uppercase(edtCol.Text)+''')'
      else
        VBStockMin.Filter:='(VBCol='''+uppercase(edtCol.Text)+''')';
    end;
    if edtFin.Text<>'' then
    begin
      if VBStockMin.Filter<>'' then
        VBStockMin.Filter:=VBStockMin.Filter+' and '+
          '(VBFin='''+uppercase(edtFin.Text)+''')'
      else
        VBStockMin.Filter:='(VBFin='''+uppercase(edtCol.Text)+''')';
    end;
    if edtWidth.Text<>'' then
    begin
      if VBStockMin.Filter<>'' then
        VBStockMin.Filter:=VBStockMin.Filter+' and '+
          '(VBWidth='+edtWidth.Text+')'
      else
        VBStockMin.Filter:='(VBWidth='+edtWidth.Text+')';
    end;
    if edtSaleGroup.Text<>'' then
    begin
      if VBStockMin.Filter<>'' then
        VBStockMin.Filter:=VBStockMin.Filter+' and '+
          '(SaleGroup='''+uppercase(edtSaleGroup.Text)+''')'
      else
        VBStockMin.Filter:='(SaleGroup='''+uppercase(edtSaleGroup.Text)+''')';
    end;
    VBStockMin.Filtered:=true;
  end
  else
  begin
    VBStockMin.Filtered:=false;
    VBStockMin.Filter:='';
  end;
end;

procedure TVBStockMinForm.btnUpdateClick(Sender: TObject);
begin
  if VBStockMin.State in [dsInsert, dsEdit] then
    raise Exception.Create('Cannot do this in Insert or Edit Mode');
  if MessageDlg('This will set all other values in this group to the current'+#13+
    'multiplier values:'+#13+
    'MinCalc='+VBStockMinMINCALCMULTIPLIER.AsString+
    '; MakeStk='+VBStockMinMAKESTKMULTIPLIER.AsString+#13+
    'Do you wish to continue?',
     mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    qryUpdate.Close;
    qryUpdate.SQL.Clear;
    qryUpdate.SQL.Add('update vbstockmin');
    qryUpdate.SQL.Add('set mincalcmultiplier='+VBStockMinMINCALCMULTIPLIER.AsString);
    qryUpdate.SQL.Add(',makestkmultiplier='+VBStockMinMAKESTKMULTIPLIER.AsString);
    if VBStockMin.Filter<>'' then
      qryUpdate.SQL.Add('where '+(VBStockMin.Filter));
    MainForm.Database.StartTransaction;
    qryUpdate.ExecSQL;
    MainForm.Database.Commit;
    VBStockMin.Refresh;
  end;
end;

procedure TVBStockMinForm.VBStockMinNewRecord(DataSet: TDataSet);
begin
  VBStockMinSTKMIN.AsInteger:=0; //added DL050799
end;

procedure TVBStockMinForm.btnAddMissingClick(Sender: TObject);
  procedure DoCheckAndInsert(aVBWidth:integer);
  begin
    qryCheckExistsInMin.Close;
    qryCheckExistsInMin.ParamByName('VBStru').AsString:=qryGetVBTypeVBSTRU.AsString;
    qryCheckExistsInMin.ParamByName('VBCol').AsString:=qryGetVBTypeVBCOL.AsString;
    qryCheckExistsInMin.ParamByName('VBFin').AsString:=qryGetVBTypeVBFIN.AsString;
    qryCheckExistsInMin.ParamByName('VBWidth').AsInteger:=aVBWidth;
    qryCheckExistsInMin.Open;
    if qryCheckExistsInMinVBSTRU.IsNull then
    begin
      MainForm.Database.StartTransaction;
      qryInsertStockMin.Close;
      qryInsertStockMin.ParamByName('VBStru').AsString:=qryGetVBTypeVBSTRU.AsString;
      qryInsertStockMin.ParamByName('VBCol').AsString:=qryGetVBTypeVBCOL.AsString;
      qryInsertStockMin.ParamByName('VBFin').AsString:=qryGetVBTypeVBFIN.AsString;
      qryInsertStockMin.ParamByName('VBWidth').AsInteger:=aVBWidth;
      qryInsertStockMin.ExecSQL;
      MainForm.Database.Commit;
    end;
  end;
begin //btnAddMissingClick
  if MessageDlg('Check for missing data?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  qryGetVBType.Close;
  qryGetVBType.Open;
  while not qryGetVBType.EOF do
  begin
    StatusBar.SimpleText:='Processing '+qryGetVBTypeEXTPRODREF.AsString;
    Application.ProcessMessages;
    if qryGetVBTypeFWONLY.AsInteger=0 then //added DL060114
    begin
      DoCheckAndInsert(89);
      DoCheckAndInsert(127);
      DoCheckAndInsert(2070);
    end
    else
      DoCheckAndInsert(qryGetVBTypeFWONLY.AsInteger); //added DL060114
    qryGetVBType.Next;
  end;
  qryGetVBType.Close;
  VBStockMin.Close;
  VBStockMin.Open;
  ShowMessage('Check and insert process is complete for 89,127 and 2070.'+#13+
    'Please let David know if you wish to add other widths.');
  StatusBar.SimpleText:='';
  Application.ProcessMessages;
end; //btnAddMissingClick

end.
