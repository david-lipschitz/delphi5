unit vbbal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, TeeProcs, TeEngine, Chart, DBChart, Series,
  StdCtrls, Buttons;

type
  TVBBalForm = class(TForm)
    VBBalQuerySource: TDataSource;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    VBBalQueryChart: TDBChart;
    VBBalQuery: TQuery;
    VBBalQueryBALANCEDATE: TDateTimeField;
    VBBalQueryNETLENGTH: TIntegerField;
    Series1: TFastLineSeries;
    PrintBtn: TButton;
    CloseBitBtn: TBitBtn;
    Series2: TFastLineSeries;
    VBBalQueryAVESALES: TIntegerField;
    Label3: TLabel;
    EditVBWidth: TEdit;
    Label1: TLabel;
    EditVBType: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure EditVBTypeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VBStru:string[3]; //DL310801
    VBCol:string[3];
  end;

var
  VBBalForm: TVBBalForm;

implementation

{$R *.DFM}

uses VBMain;

procedure TVBBalForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VBBalQuery.Close;
  VBBalForm.Release;
end;

procedure TVBBalForm.FormShow(Sender: TObject);
begin
  VBBalQuery.Prepare;
  VBBalQuery.Open;
end;

procedure TVBBalForm.PrintBtnClick(Sender: TObject);
begin
  VBBalQueryChart.PrintLandscape;
end;

procedure TVBBalForm.CloseBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBBalForm.EditVBTypeChange(Sender: TObject);
var
  TempStr:string;
begin
  if length(EditVBType.Text)=4 then
  begin
    EditVBType.Text:=uppercase(EditVBType.Text);
    VBStru:=copy(EditVBType.Text,1,3); //DL310801
    VBCol:=copy(EditVBType.Text,4,3); //DL310801
    TempStr:='VB Balance '+VBStru+VBCol+' '+EditVBWidth.Text;
    VBBalQueryChart.Title.Text.Clear;
    VBBalQueryChart.Title.Text.Add(TempStr);
    VBBalQuery.Close;
    VBBalQuery.Params[0].AsString:=VBStru;
    VBBalQuery.Params[1].AsString:=VBCol;
    VBBalQuery.Params[2].AsInteger:=strtoint(EditVBWidth.Text);
    VBBalQuery.Open;
  end
  else
  begin
    VBStru:='';
    VBCol:='';
  end;
end;

end.
