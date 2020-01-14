unit vbenq;

//made replication aware: DL020321

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, Buttons,
  Menus;

type
  TVBEnqForm = class(TForm)
    Edit127Ord: TDBEdit;
    Label14: TLabel;
    EditWWIP: TDBEdit;
    Label15: TLabel;
    EditVWIP: TDBEdit;
    Label16: TLabel;
    EditFWIP: TDBEdit;
    Label24: TLabel;
    Edit127Stk: TDBEdit;
    Edit127Alloc: TDBEdit;
    Edit127Remain: TDBEdit;
    Edit89Remain: TDBEdit;
    Edit89Alloc: TDBEdit;
    Edit89Ord: TDBEdit;
    Edit89Stk: TDBEdit;
    Label23: TLabel;
    Label22: TLabel;
    EditFWStk: TDBEdit;
    EditFWOrd: TDBEdit;
    EditFWAlloc: TDBEdit;
    EditFWRemain: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label13: TLabel;
    EditMakeDate: TDBEdit;
    Label1: TLabel;
    EditVBType: TEdit;
    VBMakeQuery: TQuery;
    VBMakeQuerySource: TDataSource;
    VBMakeQueryVBSTRU: TStringField;
    VBMakeQueryVBCOL: TStringField;
    VBMakeQueryMIN127: TIntegerField;
    VBMakeQuerySTK127: TIntegerField;
    VBMakeQueryORD127: TIntegerField;
    VBMakeQueryPORD127: TFloatField;
    VBMakeQueryPSTK127: TFloatField;
    VBMakeQueryMIN89: TIntegerField;
    VBMakeQuerySTK89: TIntegerField;
    VBMakeQueryORD89: TIntegerField;
    VBMakeQueryPORD89: TFloatField;
    VBMakeQueryPSTK89: TFloatField;
    VBMakeQueryMIN2070: TIntegerField;
    VBMakeQuerySTK2070: TIntegerField;
    VBMakeQueryORD2070: TIntegerField;
    VBMakeQueryPORD2070: TFloatField;
    VBMakeQueryPSTK2070: TFloatField;
    VBMakeQueryFWIP: TFloatField;
    VBMakeQuerySALE89: TFloatField;
    VBMakeQuerySALE127: TFloatField;
    VBMakeQuerySALE2070: TFloatField;
    VBMakeQueryFIRSTSALEDATE: TDateTimeField;
    VBMakeQueryALLOC127: TIntegerField;
    VBMakeQueryALLOC89: TIntegerField;
    VBMakeQueryALLOC2070: TIntegerField;
    VBMakeQueryREMAIN127: TIntegerField;
    VBMakeQueryREMAIN89: TIntegerField;
    VBMakeQueryREMAIN2070: TIntegerField;
    CloseBtn: TButton;
    VBParamsQuery: TQuery;
    VBParamsQuerySource: TDataSource;
    VBParamsQueryMAKEDATE: TDateTimeField;
    Edit127Min: TDBEdit;
    Edit89Min: TDBEdit;
    Label6: TLabel;
    EditFWMin: TDBEdit;
    VBMake_WarpQuery: TQuery;
    VBMake_WarpSource: TDataSource;
    VBMake_WarpQueryWWIP: TFloatField;
    VBMake_WarpQueryVWIP: TFloatField;
    AllFinsQuery: TQuery;
    AllFinsSource: TDataSource;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    AllFinsQueryVBFIN: TStringField;
    AllFinsQuerySTK2070: TIntegerField;
    AllFinsQueryORD89: TIntegerField;
    AllFinsQueryORD127: TIntegerField;
    AllFinsQueryORD2070: TIntegerField;
    VBTypeLabel: TLabel;
    VBFinLabel: TLabel;
    PrintSpdBtn: TSpeedButton;
    DBGrid2: TDBGrid;
    VBTypeClientQuery: TQuery;
    VBTypeClientSource: TDataSource;
    VBTypeClientQueryLABELSTRU: TStringField;
    VBTypeClientQueryCOLORDESCR: TStringField;
    VBTypeClientQuerySTYLEDESCR: TStringField;
    VBTypeClientQueryPARTNO: TStringField;
    qryWeaving: TQuery;
    Database1: TDatabase;
    datWeaving: TDataSource;
    DBGrid3: TDBGrid;
    qryWeavingSTARTDATE: TDateTimeField;
    qryWeavingENDDATE: TDateTimeField;
    qryOrders: TQuery;
    datOrders: TDataSource;
    DBGrid4: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    qryOrdersESTDATE: TDateTimeField;
    qryOrdersVBWIDTH: TSmallintField;
    qryOrdersCUSTREF: TStringField;
    qryOrdersRQD: TFloatField;
    qryOrdersALLOC: TFloatField;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    datWeavParams: TDataSource;
    EditAveSale2070: TDBEdit;
    EditAveSale89: TDBEdit;
    EditAveSale127: TDBEdit;
    Label7: TLabel;
    VBMakeQueryAVESALE89: TFloatField;
    VBMakeQueryAVESALE127: TFloatField;
    VBMakeQueryAVESALE2070: TFloatField;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    VBMakeQueryPCSMIN127: TFloatField;
    VBMakeQueryPCSAVESALE127: TFloatField;
    VBMakeQueryPCSSTK127: TFloatField;
    VBMakeQueryPCSORD127: TFloatField;
    VBMakeQueryPCSALLOC127: TFloatField;
    VBMakeQueryPCSREMAIN127: TFloatField;
    VBMakeQueryPCSMIN89: TFloatField;
    VBMakeQueryPCSAVESALE89: TFloatField;
    VBMakeQueryPCSSTK89: TFloatField;
    VBMakeQueryPCSORD89: TFloatField;
    VBMakeQueryPCSALLOC89: TFloatField;
    VBMakeQueryPCSREMAIN89: TFloatField;
    VBMakeQueryPCSMIN2070: TFloatField;
    VBMakeQueryPCSAVESALE2070: TFloatField;
    VBMakeQueryPCSSTK2070: TFloatField;
    VBMakeQueryPCSORD2070: TFloatField;
    VBMakeQueryPCSALLOC2070: TFloatField;
    VBMakeQueryPCSREMAIN2070: TFloatField;
    VBMakeQueryPCSFWIP: TFloatField;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label9: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label12: TLabel;
    Label19: TLabel;
    DBEdit20: TDBEdit;
    Label20: TLabel;
    DBEdit21: TDBEdit;
    Label21: TLabel;
    DBEdit22: TDBEdit;
    VBMake_WarpQueryPCSWWIP: TFloatField;
    VBMake_WarpQueryPCSVWIP: TFloatField;
    Label25: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    VBMakeQuerySTK2070OK: TIntegerField;
    VBMakeQuerySTK2070RESLIT: TIntegerField;
    VBMakeQueryPCSSTK2070OK: TFloatField;
    VBMakeQueryPCSSTK2070RESLIT: TFloatField;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    gbxStock89: TGroupBox;
    gbxStock127: TGroupBox;
    gbxStockFWInternal: TGroupBox;
    dbgStockFWInternal: TDBGrid;
    dbgStock127: TDBGrid;
    dbgStock89: TDBGrid;
    qryGetStock89: TQuery;
    qryGetStock127: TQuery;
    qryGetStockFWInternal: TQuery;
    datGetStock89: TDataSource;
    datGetStock127: TDataSource;
    datGetStockFWInternal: TDataSource;
    qryGetStock89QLTY: TStringField;
    qryGetStock89QLTYREASON: TStringField;
    qryGetStock89NETLENGTH: TIntegerField;
    qryGetStock127QLTY: TStringField;
    qryGetStock127QLTYREASON: TStringField;
    qryGetStock127NETLENGTH: TIntegerField;
    qryGetStockFWInternalQLTY: TStringField;
    qryGetStockFWInternalQLTYREASON: TStringField;
    qryGetStockFWInternalNETLENGTH: TIntegerField;
    VBMakeQueryDISCON127: TStringField;
    VBMakeQueryDISCON89: TStringField;
    VBMakeQueryDISCON2070: TStringField;
    tabWeavParams: TTable;
    tabWeavParamsACTIVESCENARIO: TIntegerField;
    qryWeavingWEAVELEN: TFloatField;
    gbxStock100: TGroupBox;
    DBGrid5: TDBGrid;
    qryGetStock100: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    datGetStock100: TDataSource;
    gbxStockFWExternal: TGroupBox;
    dbgStockFWExternal: TDBGrid;
    qryGetStockFWExternal: TQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField2: TIntegerField;
    datGetStockFWExternal: TDataSource;
    qryGetStockFWExternalROWNO: TIntegerField;
    procedure EditVBTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBtnClick(Sender: TObject);
    procedure Edit127OrdDblClick(Sender: TObject);
    procedure Edit89OrdDblClick(Sender: TObject);
    procedure EditFWOrdDblClick(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure Database1Login(Database: TDatabase; LoginParams: TStrings);
    procedure EditFWStkDblClick(Sender: TObject);
    procedure Edit89StkDblClick(Sender: TObject);
    procedure Edit127StkDblClick(Sender: TObject);
  private
    { Private declarations }
    VBStru:string[3]; //was 1 DL060901
    VBCol:string[3];
    VBFin:string[2];
    OldVBType:string[6];
  public
    { Public declarations }
  end;

var
  VBEnqForm: TVBEnqForm;

implementation

uses Vbmodal, Vbmain;

{$R *.DFM}

{uses
  VBMain;}
 
procedure TVBEnqForm.EditVBTypeChange(Sender: TObject);
begin
  if (length(EditVBType.Text)=8) then //was 6 DL060901
  begin
    EditVBType.Text:=uppercase(EditVBType.Text);
    if OldVBType=EditVBType.Text then
      Exit;
    OldVBType:=EditVBType.Text;
    VBStru:=copy(EditVBType.Text,1,3); //was 1,3 DL060901
    VBCol:=copy(EditVBType.Text,4,3); //was 2,3 DL060901
    VBFin:=copy(EditVBType.Text,7,2); {DL100198} //was 5,2 DL060901
    VBMake_WarpQuery.Close;
    AllFinsQuery.Close;
    VBMakeQuery.Close;
    VBTypeClientQuery.Close;
    qryGetStock89.Close;
    qryGetStock100.Close; //added DL021112
    qryGetStock127.Close;
    qryGetStockFWInternal.Close; //was qryGetStockFW DL030215
    qryGetStockFWExternal.Close;
    VBMakeQuery.Params[0].AsString:=VBStru;
    VBMakeQuery.Params[1].AsString:=VBCol;
    VBMakeQuery.Params[2].AsString:=VBFin;
    VBTypeLabel.Caption:=VBStru+' '+VBCol;
    VBFinLabel.Caption:=VBFin;
    VBMakeQuery.Open;
    VBMake_WarpQuery.Open;
    AllFinsQuery.Open;
    VBTypeClientQuery.Params[0].AsString:=VBStru;
    VBTypeClientQuery.Params[1].AsString:=VBCol;
    VBTypeClientQuery.Params[2].AsString:=VBFin;
    VBTypeClientQuery.Open;
    qryGetStock89.ParamByName('VBStru').AsString:=VBStru;
    qryGetStock89.ParamByName('VBCol').AsString:=VBCol;
    qryGetStock89.ParamByName('VBFin').AsString:=VBFin;
    qryGetStock89.Open;
    //qryGetStock100 added DL021106
    qryGetStock100.ParamByName('VBStru').AsString:=VBStru;
    qryGetStock100.ParamByName('VBCol').AsString:=VBCol;
    qryGetStock100.ParamByName('VBFin').AsString:=VBFin;
    qryGetStock100.Open;
    qryGetStock127.ParamByName('VBStru').AsString:=VBStru;
    qryGetStock127.ParamByName('VBCol').AsString:=VBCol;
    qryGetStock127.ParamByName('VBFin').AsString:=VBFin;
    qryGetStock127.Open;
    qryGetStockFWInternal.ParamByName('VBStru').AsString:=VBStru;
    qryGetStockFWInternal.ParamByName('VBCol').AsString:=VBCol;
    qryGetStockFWInternal.ParamByName('VBFin').AsString:=VBFin;
    qryGetStockFWInternal.Open;
    qryGetStockFWExternal.ParamByName('VBStru').AsString:=VBStru;
    qryGetStockFWExternal.ParamByName('VBCol').AsString:=VBCol;
    qryGetStockFWExternal.ParamByName('VBFin').AsString:=VBFin;
    qryGetStockFWExternal.Open;
    //added DL25102000
    if VBMakeQueryDISCON127.AsString='Y' then
      EditVBType.Color:=clRed
    else
      EditVBType.Color:=clWindow;
  end
  else
  begin
    VBStru:='';
    VBCol:='';
    VBFin:='';
    EditVBType.Color:=clWindow;
  end;
end;

procedure TVBEnqForm.FormShow(Sender: TObject);
begin
{  VBMakeQuery.Open;}
  VBParamsQuery.Open;
  VBMakeQuery.Close;
  VBMakeQuery.Prepare;
  VBTypeLabel.Caption:='';
  VBFinLabel.Caption:='';
  VBTypeClientQuery.Close;
  VBTypeClientQuery.Prepare;
  qryOrders.Open;
  Database1.Connected:=true;
  tabWeavParams.Open;
  qryWeaving.Open;
  if PassString<>'' then
    EditVBType.Text:=PassString;
end;

procedure TVBEnqForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{  VBMakeQuery.Close;}
  qryGetStock89.Close; //added DL110800
  qryGetStock100.Close; //added DL021106
  qryGetStock127.Close; //added DL110800
  qryGetStockFWInternal.Close; //added DL110800
  qryGetStockFWExternal.Close; //added DL030215
  qryOrders.Close;
  VBParamsQuery.Close;
  VBTypeClientQuery.Close;
  tabWeavParams.Close;  
  qryWeaving.Close;
  Database1.Connected:=false;
  VBEnqForm.Release;
end;

procedure TVBEnqForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TVBEnqForm.Edit127OrdDblClick(Sender: TObject);
begin
  if MessageDlg('127 Orders: Show All (or Total By Held)?  Yes for All; No for Total By Held.',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    VBPickDlgForm.ShowModalVTOrderNoEnq(VBStru,VBCol,VBFin,16) //16 was 127 DL030215
  else
    VBPickDlgForm.ShowModalVTOrderNoEnqTotals(VBStru,VBCol,VBFin,16);
  Screen.Cursor:=crDefault;
end;

procedure TVBEnqForm.Edit89OrdDblClick(Sender: TObject);
begin
  if MessageDlg('89 Orders: Show All (or Total By Held)?  Yes for All; No for Total By Held.',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    VBPickDlgForm.ShowModalVTOrderNoEnq(VBStru,VBCol,VBFin,23) //23 was 89 DL030215
  else
    VBPickDlgForm.ShowModalVTOrderNoEnqTotals(VBStru,VBCol,VBFin,23);
  Screen.Cursor:=crDefault;
end;

procedure TVBEnqForm.EditFWOrdDblClick(Sender: TObject);
begin
  //held added DL151199
  if MessageDlg('FW Orders: Show All (or Total By Held)?  Yes for All; No for Total By Held.',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    VBPickDlgForm.ShowModalVTOrderNoEnq(VBStru,VBCol,VBFin,1) //1 was 2070 DL030215
  else
    VBPickDlgForm.ShowModalVTOrderNoEnqTotals(VBStru,VBCol,VBFin,1);
  Screen.Cursor:=crDefault;
end;

procedure TVBEnqForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TVBEnqForm.Database1Login(Database: TDatabase;
  LoginParams: TStrings);
begin
  Database1.Connected:=false;
  Database1.Params.Clear;
  if ServerLocalSelection='S' then //server connection
  begin
    Database1.AliasName:='Weaving6LinuxSQL';
    Database1.Params.Add('SERVER NAME=commander:/usr/interbase/weaving6.gdb');
  end
  else //local connection
  begin
    Database1.AliasName:='Weaving6ReplSQL';
    Database1.Params.Add('SERVER NAME=D:\a_usr\ibdatabase\Linux\weaving6.gdb');
  end;
  Database1.Params.Add('USER NAME=' + MainForm.UserLoginName);
  Database1.Params.Add('OPEN MODE=READ/WRITE');
  Database1.Params.Add('SCHEMA CACHE SIZE=8');
  Database1.Params.Add('LANGDRIVER=');
  Database1.Params.Add('SQLQRYMODE=');
  Database1.Params.Add('SQLPASSTHRU MODE=SHARED NOAUTOCOMMIT');
  Database1.Params.Add('SCHEMA CACHE TIME=-1');
  Database1.Params.Add('MAX ROWS=-1');
  Database1.Params.Add('BATCH COUNT=200');
  Database1.Params.Add('ENABLE SCHEMA CACHE=FALSE');
  Database1.Params.Add('SCHEMA CACHE DIR=');
  Database1.Params.Add('ENABLE BCD=FALSE');
  Database1.Params.Add('BLOBS TO CACHE=64');
  Database1.Params.Add('BLOB SIZE=32');
  Database1.Params.Add('PASSWORD=' + MainForm.UserPassword);

  LoginParams.Values['USER NAME'] := MainForm.UserLoginName;
  LoginParams.Values['PASSWORD'] := MainForm.UserPassword;
end;

procedure TVBEnqForm.EditFWStkDblClick(Sender: TObject);
begin
  VBPickDlgForm.ShowModalVTStockEnq(VBStru,VBCol,VBFin,1); //1 was 2070 DL030215
  Screen.Cursor:=crDefault;
end;

procedure TVBEnqForm.Edit89StkDblClick(Sender: TObject);
begin
  VBPickDlgForm.ShowModalVTStockEnq(VBStru,VBCol,VBFin,23); //23 was 89 DL030215
  Screen.Cursor:=crDefault;
end;

procedure TVBEnqForm.Edit127StkDblClick(Sender: TObject);
begin
  VBPickDlgForm.ShowModalVTStockEnq(VBStru,VBCol,VBFin,16); //16 was 127 DL030215
  Screen.Cursor:=crDefault;
end;

end.
