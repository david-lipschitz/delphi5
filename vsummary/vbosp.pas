//VBOSP: VBOverseas Selling Prices
//added DL270799

unit vbosp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, Buttons, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  Menus, ODDBFind;

type
  TfrmVBOSP = class(TForm)
    Panel1: TPanel;
    Label18: TLabel;
    DBEdit33: TDBEdit;
    Label19: TLabel;
    DBEdit34: TDBEdit;
    tabSupplier: TTable;
    datSupplier: TDataSource;
    tabVBOSP: TTable;
    datVBOSP: TDataSource;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DBNavigator2: TDBNavigator;
    DBGrid1: TDBGrid;
    tabVBOSPCUSTREF: TStringField;
    tabVBOSPVBSTRU: TStringField;
    tabVBOSPVBWIDTH: TSmallintField;
    tabVBOSPQLTY: TStringField;
    tabVBOSPPRICETYPE: TStringField;
    tabVBOSPFROMDATE: TDateTimeField;
    tabVBOSPTODATE: TDateTimeField;
    tabVBOSPPRICE: TFloatField;
    tabVBOSPVBFIN: TStringField;
    tabSupplierSUPREF: TStringField;
    tabSupplierSUPDESCR: TStringField;
    tabSupplierSCTYPE: TStringField;
    ODFindMenu1: TODFindMenu;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tabVBOSPBeforeEdit(DataSet: TDataSet);
    procedure tabVBOSPBeforeInsert(DataSet: TDataSet);
    procedure tabVBOSPBeforeDelete(DataSet: TDataSet);
    procedure tabVBOSPAfterCancel(DataSet: TDataSet);
    procedure tabVBOSPDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tabVBOSPNewRecord(DataSet: TDataSet);
    procedure tabVBOSPBeforePost(DataSet: TDataSet);
    procedure tabVBOSPBeforeCancel(DataSet: TDataSet);
    procedure tabVBOSPAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVBOSP: TfrmVBOSP;

implementation

{$R *.DFM}

uses Main;

procedure TfrmVBOSP.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmVBOSP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tabVBOSP.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  tabVBOSP.Close;
  tabSupplier.Close;
  Release;
end;

procedure TfrmVBOSP.FormShow(Sender: TObject);
begin
  tabSupplier.Open;
  tabSupplier.Refresh;
  tabVBOSP.Open;
  tabVBOSP.Refresh;
end;

procedure TfrmVBOSP.tabVBOSPBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TfrmVBOSP.tabVBOSPBeforeInsert(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TfrmVBOSP.tabVBOSPBeforeDelete(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TfrmVBOSP.tabVBOSPAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  tabSupplier.Refresh;
end;

procedure TfrmVBOSP.tabVBOSPDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TfrmVBOSP.tabVBOSPNewRecord(DataSet: TDataSet);
begin
  tabVBOSPCUSTREF.AsString:=tabSupplierSUPREF.AsString;
  tabVBOSPQLTY.AsString:='';
  tabVBOSPFROMDATE.AsDateTime:=EncodeDate(1996,4,15);
  tabVBOSPTODATE.AsDateTime:=EncodeDate(2049,12,31);
end;

procedure TfrmVBOSP.tabVBOSPBeforePost(DataSet: TDataSet);
begin
//  if tabVBOSPPRICETYPE.AsString <> 'FCA' etc
//add all the required checks for stru, fin, width, qlty, etc
end;

procedure TfrmVBOSP.tabVBOSPBeforeCancel(DataSet: TDataSet);
begin
  if tabVBOSP.State=dsInsert then
    if MessageDlg('Cancel price being modified?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TfrmVBOSP.tabVBOSPAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

end.
