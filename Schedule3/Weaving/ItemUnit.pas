unit ItemUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, ComCtrls, ODSched;

type
  TItemForm = class(TForm)
    GroupBox1: TGroupBox;
    TypeLabel: TLabel;
    TypeCombo: TComboBox;
    PiecesLabel: TLabel;
    PiecesEdit: TEdit;
    PiecesUpDown: TUpDown;
    OKButton: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure CtrlChange(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure PiecesUpDownChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
  public
    ItemJob: TODJob;
    CurPieces: double; //was Integer; DL020716
  end;

var
  ItemForm: TItemForm;

implementation

uses MainUnit;

{$R *.DFM}

procedure TItemForm.FormShow(Sender: TObject);
begin
  OKButton.Enabled := False;
end;

procedure TItemForm.CtrlChange(Sender: TObject);
begin
  if Visible then
  begin
    OKButton.Enabled :=
      (TypeCombo.ItemIndex > -1) and (PiecesEdit.Text <> '');
    PiecesEdit.SetFocus;
  end;
end;

procedure TItemForm.OKButtonClick(Sender: TObject);
begin
  with MainForm do
  try
    CheckRemCapacity(ItemJob,
      GetFabricStruct(TypeCombo.Items[TypeCombo.ItemIndex]),
      StrToFloat(PiecesEdit.Text) - CurPieces);
  except
    PiecesEdit.SetFocus;
    raise;
  end;
  ModalResult := mrOK;
end;

procedure TItemForm.PiecesUpDownChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  //method added DL020716
  if Direction=updUp then
    PiecesEdit.Text:=floattostr(strtofloat(PiecesEdit.Text)+0.5)
  else if Direction=updDown then
    PiecesEdit.Text:=floattostr(strtofloat(PiecesEdit.Text)-0.5);
  if strtofloat(PiecesEdit.Text)<0 then
    PiecesEdit.Text:='0';
end;

end.
