unit custpart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, Db, DBTables, DBCtrls, Buttons, StdCtrls;

type
  TCustPartForm = class(TForm)
    Panel2: TPanel;
    CustPart: TTable;
    CustQuerySource: TDataSource;
    VBTypeQuerySource: TDataSource;
    CustPartSource: TDataSource;
    SupplierGrid: TDBGrid;
    CustPartCUSTREF: TStringField;
    CustPartVBSTRU: TStringField;
    CustPartVBCOL: TStringField;
    CustPartVBFIN: TStringField;
    CustPartDESCR: TStringField;
    CustQuery: TQuery;
    VBTypeGrid: TDBGrid;
    CustQuerySUPREF: TStringField;
    CustQuerySUPDESCR: TStringField;
    VBTypeQuery: TQuery;
    VBTypeQuerySTYLEDESCR: TStringField;
    VBTypeQueryCOLORDESCR: TStringField;
    VBTypeQueryVBTYPE: TStringField;
    CustPartGrid: TDBGrid;
    CustPartNavigator: TDBNavigator;
    CloseBitBtn: TBitBtn;
    spdAddSelection: TSpeedButton;
    VBTypeQueryVBSTRU: TStringField;
    VBTypeQueryVBCOL: TStringField;
    VBTypeQueryVBFIN: TStringField;
    CheckExistsQuery: TQuery;
    VBTypeQueryVBWIDTH: TSmallintField;
    CustPartVBWIDTH: TIntegerField;
    PrintSpdBtn: TSpeedButton;
    CustPartSTYLEDESCR: TStringField;
    StaticText1: TStaticText;
    Label1: TLabel;
    CustPartPARTNO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CustPartAfterCancel(DataSet: TDataSet);
    procedure CustPartAfterDelete(DataSet: TDataSet);
    procedure CustPartAfterPost(DataSet: TDataSet);
    procedure CustPartBeforeCancel(DataSet: TDataSet);
    procedure CustPartBeforeDelete(DataSet: TDataSet);
    procedure CustPartBeforeEdit(DataSet: TDataSet);
    procedure CustPartBeforeInsert(DataSet: TDataSet);
    procedure CustPartDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure spdAddSelectionClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustPartForm: TCustPartForm;

implementation

{$R *.DFM}

uses VBMain;

procedure TCustPartForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CustQuery.Close;
  VBTypeQuery.Close;
  CustPart.Close;
  CheckExistsQuery.Close;
  Release;
end;

procedure TCustPartForm.CloseBitBtnClick(Sender: TObject);
begin
  if CustPart.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post customer''s part description before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TCustPartForm.FormShow(Sender: TObject);
begin
  CustQuery.Open;
  VBTypeQuery.Open;
  CustPart.Open;
  CheckExistsQuery.Prepare;
  CustPart.Refresh;
end;

procedure TCustPartForm.CustPartAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
  CustPart.Refresh;
  CustPart.Refresh;
end;

procedure TCustPartForm.CustPartAfterDelete(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TCustPartForm.CustPartAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TCustPartForm.CustPartBeforeCancel(DataSet: TDataSet);
begin
  if CustPart.State=dsInsert then
    if MessageDlg('Cancel customer''s part description being inserted?',
        mtConfirmation,mbOKCancel,0) <> mrOK then
      Abort;
end;

procedure TCustPartForm.CustPartBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete this customer''s part description?',
    mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
  MainForm.Database.StartTransaction;
end;

procedure TCustPartForm.CustPartBeforeEdit(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TCustPartForm.CustPartBeforeInsert(DataSet: TDataSet);
begin
  if CustPart.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('A customer''s part description is being processed.'+#13+
        'Post changes before inserting new description?',
      mtInformation, mbOKCancel, 0) = mrOK then
        CustPart.Post
    else
      Abort;
  end;
  MainForm.Database.StartTransaction;
end;

procedure TCustPartForm.CustPartDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TCustPartForm.spdAddSelectionClick(Sender: TObject);
begin
  if CustPart.State in [dsInsert, dsEdit] then
    raise exception.create('A customer''s part description is being processed.'+#13+
        'Post or cancel changes before adding a new description.');
  //make sure that line does not exists already
  with CheckExistsQuery do
  begin
    Close;
    Params[0].AsString:=CustQuerySupRef.AsString;
    Params[1].AsString:=VBTypeQueryVBStru.AsString;
    Params[2].AsString:=VBTypeQueryVBCol.AsString;
    Params[3].AsString:=VBTypeQueryVBFin.AsString;
    Params[4].AsInteger:=VBTypeQueryVBWidth.AsInteger;
    Open;
    if Fields[0].AsInteger>0 then
      raise Exception.Create('Cannot create as already exists');
  end;
  CustPart.Insert;
  CustPartCustRef.AsString:=CustQuerySupRef.AsString;
  CustPartVBStru.AsString:=VBTypeQueryVBStru.AsString;
  CustPartVBCol.AsString:=VBTypeQueryVBCol.AsString;
  CustPartVBFin.AsString:=VBTypeQueryVBFin.AsString;
  CustPartVBWidth.AsInteger:=VBTypeQueryVBWidth.AsInteger;
  CustPartGrid.SelectedField:=CustPartDescr; // xx why doesn't this work?
end;

procedure TCustPartForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
