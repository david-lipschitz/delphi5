unit About;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ShellAPI;

type
  TfrmAbout = class(TForm)
    Panel: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
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
    Label15: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label16: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    procedure ShowAsSplash;
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.DFM}

procedure TfrmAbout.ShowAsSplash;
begin
  Caption := '';
  BorderStyle := bsNone;
  BorderIcons := [];
  Height := 244;
  Width := 398;
  Panel.BevelOuter := bvRaised;
  OKButton.Visible := False;
  Show;
  Refresh;
end;

procedure TfrmAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Caption = '' then
  begin
    Caption := 'About';
    BorderStyle := bsDialog;
    BorderIcons := [biSystemMenu,biMinimize,biMaximize];
    Height := 313;
    Width := 402;
    Panel.BevelOuter := bvNone;
    OKButton.Visible := True;
  end;
end;

end.
