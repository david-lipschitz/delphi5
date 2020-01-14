unit vbssp_new;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ODPrCtrl, Grids, DBGrids, ComCtrls, StdCtrls, ExtCtrls,
  DBCtrls, Buttons, iqPrep, iqDlg, iqFtrDlg, iqDBInf, iqQryInf, iqFndDlg;

type
  TNewVBSSPForm = class(TForm)
    ItemSource: TDataSource;
    VBTypesGrid: TDBGrid;
    VBPricesGrid: TDBGrid;
    Label3: TLabel;
    PricesSource: TDataSource;
    ItemQuery: TQuery;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    PriceEdit: TEdit;
    StartDateEdit: TDateTimePicker;
    AddSingleButton: TSpeedButton;
    Items: TLabel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    AddAllButton: TSpeedButton;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    FilterButton: TSpeedButton;
    CloseButton: TBitBtn;
    DBInfo: TiqDBInfo;
    QueryInfo: TiqQueryInfo;
    FilterDialog: TiqFilterDialog;
    ClearButton: TSpeedButton;
    DBNavigator3: TDBNavigator;
    ItemQueryVBSTRU: TStringField;
    ItemQueryVBFIN: TStringField;
    ItemQueryVBWIDTH: TSmallintField;
    VerifyButton: TSpeedButton;
    VerifyCheck: TCheckBox;
    PricesQuery: TQuery;
    PricesQueryFROMDATE: TDateTimeField;
    PricesQueryTODATE: TDateTimeField;
    PricesQueryPRICE: TFloatField;
    PriceController: TODPriceController;
    SearchButton: TSpeedButton;
    FindDialog: TiqFindDialog;
    FindNextButton: TSpeedButton;
    procedure AddSingleButtonClick(Sender: TObject);
    procedure PriceEditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PriceControllerBeforeUpdate(Sender: TObject);
    procedure PriceControllerAfterUpdate(Sender: TObject);
    procedure DatabaseStartTransaction(DataSet: TDataSet);
    procedure DatabaseCommit(DataSet: TDataSet);
    procedure DatabaseRollback(DataSet: TDataSet);
    procedure PriceControllerVerificationError(Sender: TObject;
      const FieldValues: String);
    procedure FilterButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure QueryInfoChange(Sender: TObject; Changed: TiqChangeKinds);
    procedure AddAllButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure VerifyButtonClick(Sender: TObject);
    procedure VerifyCheckClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PriceControllerUpdateError(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure FindNextButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewVBSSPForm: TNewVBSSPForm;

implementation

uses main;

{$R *.DFM}

procedure TNewVBSSPForm.FormShow(Sender: TObject);
begin
  ItemQuery.Open;
  PricesQuery.Open;
  StartDateEdit.Date := Date;
  QueryInfo.Query := ItemQuery;
end;

procedure TNewVBSSPForm.PriceEditChange(Sender: TObject);
begin
  AddSingleButton.Enabled := PriceEdit.Text <> '';
  AddAllButton.Enabled := AddSingleButton.Enabled and ClearButton.Enabled;
end;

procedure TNewVBSSPForm.AddSingleButtonClick(Sender: TObject);
begin
  PriceController.AddPrice(StartDateEdit.Date, StrToFloat(PriceEdit.Text));
  PricesQuery.Close;
  PricesQuery.Open;
  PriceEdit.Text := '';
end;

procedure TNewVBSSPForm.PriceControllerBeforeUpdate(Sender: TObject);
begin
  MainForm.Database.StartTransaction;
end;

procedure TNewVBSSPForm.PriceControllerAfterUpdate(Sender: TObject);
begin
  MainForm.Database.Commit;
end;

procedure TNewVBSSPForm.PriceControllerUpdateError(Sender: TObject);
begin
  MainForm.Database.Rollback;
end;

procedure TNewVBSSPForm.DatabaseStartTransaction(DataSet: TDataSet);
begin
  MainForm.Database.StartTransaction;
end;

procedure TNewVBSSPForm.DatabaseCommit(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TNewVBSSPForm.DatabaseRollback(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
end;

procedure TNewVBSSPForm.PriceControllerVerificationError(Sender: TObject;
  const FieldValues: String);
begin
  MessageDlg('Pricing error: ' + FieldValues, mtWarning, [mbOK], 0);
end;

procedure TNewVBSSPForm.FilterButtonClick(Sender: TObject);
begin
  FilterDialog.Execute;
  ItemQuery.Open;
end;

procedure TNewVBSSPForm.ClearButtonClick(Sender: TObject);
begin
  QueryInfo.Filters.Clear(True);
  QueryInfo.ChangeNotify(Self, [ckFilter]);
  ItemQuery.Open;
end;

procedure TNewVBSSPForm.QueryInfoChange(Sender: TObject;
  Changed: TiqChangeKinds);
begin
  ClearButton.Enabled := QueryInfo.Filters.Count > 0;
  AddAllButton.Enabled := AddSingleButton.Enabled and ClearButton.Enabled;
end;

procedure TNewVBSSPForm.AddAllButtonClick(Sender: TObject);
var
  bm: TBookmark;
begin
  if MessageDlg('Add this price to ALL the filtered items?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  with ItemQuery do
  begin
    bm := GetBookmark;
//    DisableControls;
    try
      First;
      while not EOF do
      begin
        PriceController.AddPrice(StartDateEdit.Date, StrToFloat(PriceEdit.Text));
        Next;
      end;
      GotoBookmark(bm);
    finally
//      EnableControls;
      FreeBookmark(bm);
    end;
  end;
  PricesQuery.Close;
  PricesQuery.Open;
  PriceEdit.Text := '';
end;

procedure TNewVBSSPForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TNewVBSSPForm.VerifyButtonClick(Sender: TObject);
begin
  PriceController.VerifyDates;
end;

procedure TNewVBSSPForm.VerifyCheckClick(Sender: TObject);
begin
  PriceController.VerifyUpdate := VerifyCheck.Checked;
end;

procedure TNewVBSSPForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if PricesQuery.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  PricesQuery.Close;
  ItemQuery.Close;
  Release;
end;

procedure TNewVBSSPForm.SearchButtonClick(Sender: TObject);
begin
  if FindDialog.Execute then
    FindNextButton.Enabled := FindDialog.FindFirst;
end;

procedure TNewVBSSPForm.FindNextButtonClick(Sender: TObject);
begin
  FindDialog.FindNext;
end;

end.
