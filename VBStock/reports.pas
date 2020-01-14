unit reports;
//ReportSmith code removed DL170701

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Buttons;

type
  TReportsForm = class(TForm)
    ReportTree: TTreeView;
    Panel1: TPanel;
    CloseBitBtn: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure ReportTreeDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportsForm: TReportsForm;

implementation

uses VBMain;

{$R *.DFM}

procedure TReportsForm.FormShow(Sender: TObject);
begin
(*  with MainForm do      //JT030798
    Report1.Connect({ServerType: Word}6, 'INTRBASE',
      UserLoginName, UserPassword, Database.DatabaseName);*)
end;

procedure TReportsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //MainForm.Report1.CloseApplication(False);    //JT030798 - removed DL170701
  Release;
end;

procedure TReportsForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TReportsForm.ReportTreeDblClick(Sender: TObject);
var
  SelNode,ParentNode: TTreeNode;
  DespNo:string;
begin
  if ReportTree.Selected=nil then
    exit;
  SelNode := ReportTree.Selected;
  ParentNode := SelNode.Parent;
{  ShowMessage(inttostr(SelNode.AbsoluteIndex)+' found');
  ShowMessage(SelNode.Text+' found');
  if ParentNode = nil then
    ShowMessage('Please select a child')
  else
    ShowMessage('Parent '+ParentNode.Text+' found');}
  if ParentNode = nil then
  begin
    ShowMessage('Please select a child');
    exit;
  end;
  //MainForm.Report1.InitialValues.Clear;  - removed DL170701
  if ParentNode.Text='Despatch' then
  begin
    if SelNode.Text='Packing List Metres' then
    begin
      DespNo:='';
      if InputQuery('Despatch Packing List Metres',
        'Enter despatch number',
        DespNo) then
      begin
//if Report1.SetVariable(‘LName’, ‘Smythe’) then
//Report1.Run;
        //MainForm.Report1.InitialValues.Add('@DespNo=<'+DespNo+'>'); - removed DL170701
      end;
    end;
  end;
//  Report1.AutoUnload:=false;
//  MainForm.Report1.ReportDir:='N:\';
  //MainForm.Report1.ReportName:=ParentNode.Text+' '+SelNode.Text+'.rpt';  - removed DL170701
  //MainForm.Report1.Run; - removed DL170701

//  Report1.Connect(67,'vbstksql',
//    MainForm.UserLoginName,MainForm.UserPassword,
//    'vt_weaving1:c:\a_usr\vstock\vbstock.gdb');
end;

end.
