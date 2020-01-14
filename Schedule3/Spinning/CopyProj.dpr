program CopyProj;

uses
  Forms,
  CopyUnit in 'CopyUnit.pas' {CopyForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TCopyForm, CopyForm);
  Application.Run;
end.
