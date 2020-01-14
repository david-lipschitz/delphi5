unit vbparams;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, DBTables, ExtCtrls;

type
  TVBParamsForm = class(TForm)
    VBParams: TTable;
    VBParamsREF: TSmallintField;
    VBParamsMAKEDATE: TDateTimeField;
    VBParamsNOENTRYBEFOREDATE: TDateTimeField;
    VBParamsLASTMEYEARNO: TSmallintField;
    VBParamsLASTMEPERIODNO: TSmallintField;
    VBParamsMEINPROGRESS: TStringField;
    VBParamsPICKING: TStringField;
    VBParamsBARCODEPRINTERTYPE: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    datVBParams: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBNavigator1: TDBNavigator;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    btnClose: TButton;
    procedure VBParamsBeforeEdit(DataSet: TDataSet);
    procedure VBParamsAfterPost(DataSet: TDataSet);
    procedure VBParamsAfterCancel(DataSet: TDataSet);
    procedure VBParamsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VBParamsForm: TVBParamsForm;

implementation

uses VBMain;

{$R *.DFM}

procedure TVBParamsForm.VBParamsBeforeEdit(DataSet: TDataSet);
begin
  if (UserInitials='SYS') or (UserInitials='PB') then
    MainForm.Database.StartTransaction
  else
    raise Exception.Create('Only System Adminstrator can modify these details directly.');
end;

procedure TVBParamsForm.VBParamsAfterPost(DataSet: TDataSet);
begin
  MainForm.Database.Commit;
end;

procedure TVBParamsForm.VBParamsAfterCancel(DataSet: TDataSet);
begin
  MainForm.Database.Rollback;
end;

procedure TVBParamsForm.VBParamsPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MainForm.Database.Rollback;
end;

procedure TVBParamsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VBParams.Close;
  Release;
end;

procedure TVBParamsForm.FormShow(Sender: TObject);
begin
  VBParams.Open;
end;

procedure TVBParamsForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
