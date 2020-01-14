program Spinning;
{ OD Spinning Planner: Spinning Factory Spinning Machine Planning - Version 1.1
  Copyright: Orbital Decisions 1995 - 2006
  Start Date:   August 1995.
  Last Update:  January 2006.  By DL.
}

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  SpinShed in 'SpinShed.pas',
  AboutUnit in 'AboutUnit.pas' {ODAboutForm},
  DBLogin in 'DBLogin.pas' {LoginForm},
  LoadUnit in 'LoadUnit.pas' {LoadForm},
  SaveUnit in 'SaveUnit.pas' {SaveForm},
  DelUnit in 'DelUnit.pas' {DeleteForm},
  PrnUnit in 'PrnUnit.pas' {PrintForm},
  JobUnit in 'JobUnit.pas' {JobForm},
  ItemUnit in 'ItemUnit.pas' {ItemForm},
  MaintUnit in 'MaintUnit.pas' {MaintForm},
  DateUnit in 'DateUnit.pas' {DateForm},
  ReqUnit in 'ReqUnit.pas' {ReqmtsForm},
  OutUnit in 'OutUnit.pas' {OutputForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'OD Spinning Planner';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TODAboutForm, ODAboutForm);
  Application.CreateForm(TLoadForm, LoadForm);
  Application.CreateForm(TSaveForm, SaveForm);
  Application.CreateForm(TDeleteForm, DeleteForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TJobForm, JobForm);
  Application.CreateForm(TItemForm, ItemForm);
  Application.CreateForm(TMaintForm, MaintForm);
  Application.CreateForm(TDateForm, DateForm);
  Application.CreateForm(TReqmtsForm, ReqmtsForm);
  Application.CreateForm(TOutputForm, OutputForm);
  Application.Run;
end.
