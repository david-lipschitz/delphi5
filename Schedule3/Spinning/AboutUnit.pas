unit AboutUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ShellAPI;

type
  TodAboutForm = class(TForm)
    Panel: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel3: TBevel;
    Label8: TLabel;
    OKButton: TBitBtn;
    Label12: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    Label11: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    procedure ShowAsSplash;
  end;

var
  odAboutForm: TodAboutForm;

implementation

{$R *.DFM}

procedure TodAboutForm.ShowAsSplash;
begin
  Caption := '';
  BorderStyle := bsNone;
  BorderIcons := [];
  Height := 352; //244;
  Width := 408; //398;
  Panel.BevelOuter := bvRaised;
  OKButton.Visible := False;
  Show;
  Refresh;
end;

procedure TodAboutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Caption = '' then
  begin
    Caption := 'About';
    BorderStyle := bsDialog;
    BorderIcons := [biSystemMenu,biMinimize,biMaximize];
    Height := 433; //313;
    Width := 404; //402;
    Panel.BevelOuter := bvNone;
    OKButton.Visible := True;
  end;
end;

end.
