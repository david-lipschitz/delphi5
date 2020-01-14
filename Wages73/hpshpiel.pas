unit hpshpiel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Db, DBTables;

type
  TfrmHPShpiel = class(TForm)
    Label1: TLabel;
    btnContinue: TSpeedButton;
    btnCancel: TSpeedButton;
    Memo1: TMemo;
    Label2: TLabel;
    tabCompany: TTable;
    tabCompanyREF: TIntegerField;
    tabCompanyWEEKSINYEAR: TIntegerField;
    tabCompanyHOLIDAYPAYDAYS: TIntegerField;
    tabCompanyHOLIDAYWEEKS: TIntegerField;
    tabCompanySERVICEBONUS: TFloatField;
    datCompany: TDataSource;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    Label41: TLabel;
    Label3: TLabel;
    tabCompanyANNUALBONMIN: TFloatField;
    DBEdit1: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinueClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHPShpiel: TfrmHPShpiel;

implementation

{$R *.DFM}

procedure TfrmHPShpiel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabCompany.Close;
  //Release; do this in the calling program
end;

procedure TfrmHPShpiel.btnContinueClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure TfrmHPShpiel.btnCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmHPShpiel.FormShow(Sender: TObject);
begin
  tabCompany.Open;
end;

end.
