unit Pallabel;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Buttons;

type
  TGenPalLabelForm = class(TForm)
    GenPalLabel: TButton;
    CloseBitBtn: TBitBtn;
    SPPalletNo: TStoredProc;
    procedure GenPalLabelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GenPalLabelForm: TGenPalLabelForm;

implementation

{$R *.DFM}

uses Main, BarCode, Utils;

procedure TGenPalLabelForm.GenPalLabelClick(Sender: TObject);
var
  NextPalletNo:integer;  {next pallet no from file}
  LabelData,Label1Data:string[20];
begin
  {no real need to have txn because only contains a generator}
  MainForm.Database.StartTransaction;
  SPPalletNo.ExecProc;
  NextPalletNo:=SPPalletNo.ParamByName('Code').AsInteger;
  MainForm.Database.Commit;
  BarCodeForm.StartLabel(true); {true for lastlabel}
  BarCodeForm.SendLabelData(10,'','');  {Vrede Textiles + address}
  LabelData:='Yarn Despatch Pallet';
  BarCodeForm.SendLabelData(1,LabelData,'');
  LabelData:='Number';
  Label1Data:=ZeroFill(NextPalletNo,6);
  BarCodeForm.SendLabelData(2,LabelData,Label1Data);
  LabelData:='17'+ZeroFill(NextPalletNo,6);
  BarCodeForm.SendLabelData(6,LabelData,'');
  BarCodeForm.EndLabel;
end;

procedure TGenPalLabelForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GenPalLabelForm.Release;
end;

procedure TGenPalLabelForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

end.
