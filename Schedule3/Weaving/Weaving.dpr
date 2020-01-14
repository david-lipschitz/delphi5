program Weaving;
{ OD LoomLoading: Weaving Factory Loom Loading Planning - Version 3.4.6
  Copyright: My Power Station Technology cc trading as Orbital Decisions 1995 - 2011
  Start Date:   August 1995.
  Last Update:  June 2011.  By DL.
  Added Replication Feb 2002 - removed
  Added Half Pieces Jul 2002
  Added Three More Looms April/May 2011
  Split printing into two pages; Orders and Stock Searches added Jun 2011
  Changed the Orders Double Click Search Jul 2011
}

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  JobUnit in 'JobUnit.pas' {JobForm},
  ItemUnit in 'ItemUnit.pas' {ItemForm},
  LoadUnit in 'LoadUnit.pas' {LoadForm},
  SaveUnit in 'SaveUnit.pas' {SaveForm},
  ReqUnit in 'ReqUnit.pas' {ReqmtsForm},
  OutUnit in 'OutUnit.pas' {OutputForm},
  ODWeaSch in '..\ODWeaSch.pas',
  PrnUnit in 'PrnUnit.pas' {PrintForm},
  MaintUnit in 'MaintUnit.pas' {MaintForm},
  DBLogin in 'DBLogin.pas' {LoginForm},
  DelUnit in 'DelUnit.pas' {DeleteForm},
  AboutUnit in 'AboutUnit.pas' {odAboutForm},
  Vbmodal in '..\..\VBStock\VBMODAL.PAS' {VBPickDlgForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'OD Loom Loading';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TJobForm, JobForm);
  Application.CreateForm(TItemForm, ItemForm);
  Application.CreateForm(TLoadForm, LoadForm);
  Application.CreateForm(TSaveForm, SaveForm);
  Application.CreateForm(TReqmtsForm, ReqmtsForm);
  Application.CreateForm(TOutputForm, OutputForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TMaintForm, MaintForm);
  Application.CreateForm(TDeleteForm, DeleteForm);
  Application.CreateForm(TodAboutForm, odAboutForm);
  Application.CreateForm(TVBPickDlgForm, VBPickDlgForm);
  Application.Run;
end.
