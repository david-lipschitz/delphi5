unit Param;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Dialogs, DBLookup,
  Buttons;

type
  TParamForm = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditREF: TDBEdit;
    Label2: TLabel;
    EditCONAME: TDBEdit;
    Label3: TLabel;
    EditSHORTCONAME: TDBEdit;
    Label4: TLabel;
    EditINVOICECONAME: TDBEdit;
    Label5: TLabel;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    ParamSource: TDataSource;
    Panel2: TPanel;
    Param: TTable;
    PostBtn: TButton;
    CancelBtn: TButton;
    Currency: TTable;
    CurrencySource: TDataSource;
    CurrencyCURREF: TStringField;
    CurrencyDESCR: TStringField;
    DBLookupCombo1: TDBLookupCombo;
    CloseBitBtn: TBitBtn;
    EditVATRate: TDBEdit;
    VATRate: TLabel;
    ParamREF: TSmallintField;
    ParamCONAME: TStringField;
    ParamSHORTCONAME: TStringField;
    ParamINVOICECONAME: TStringField;
    ParamCENTRALCURRENCY: TStringField;
    ParamVATRate: TFloatField;
    ParamMAKEDATE: TDateTimeField;
    ParamNOENTRYBEFOREDATE: TDateTimeField;
    ParamLASTMEYEARNO: TSmallintField;
    ParamLASTMEPERIODNO: TSmallintField;
    ParamMEINPROGRESS: TStringField;
    Label6: TLabel;
    ShowMakeDate: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Year: TLabel;
    procedure PostBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ParamSourceStateChange(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ParamAfterPost(DataSet: TDataset);
    procedure ParamAfterCancel(DataSet: TDataset);
    procedure ParamBeforeEdit(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ParamForm: TParamForm;

implementation

uses Main;

{$R *.DFM}

procedure TParamForm.PostBtnClick(Sender: TObject);
begin
  Param.Post;
end;

procedure TParamForm.CancelBtnClick(Sender: TObject);
begin
  Param.Cancel;
end;

procedure TParamForm.ParamSourceStateChange(Sender: TObject);
begin
  PostBtn.Enabled := Param.State in [dsEdit, dsInsert];
  CancelBtn.Enabled := PostBtn.Enabled;
  CloseBitBtn.Enabled := Param.State = dsBrowse;
end;

procedure TParamForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TParamForm.FormShow(Sender: TObject);
begin
  Param.Open;
  Param.Refresh;
end;

procedure TParamForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Param.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  Param.Close;
  ParamForm.Release;
end;

procedure TParamForm.ParamAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TParamForm.ParamAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
  Param.Refresh;
end;

procedure TParamForm.ParamBeforeEdit(DataSet: TDataSet);
begin
  if UserInitials='SYS' then
    MainForm.Database.StartTransaction
  else
    ShowMessage('Only David can modify these details');
end;

end.
