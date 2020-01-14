unit Ynpallet;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DB, Grids, DBGrids, DBTables, Buttons, ExtCtrls;

type
  TYnPalletForm = class(TForm)
    PalletQuery: TQuery;
    PalletQueryLOTNO1: TSmallintField;
    PalletQueryLOTNO2: TSmallintField;
    PalletQueryYNSTRU: TStringField;
    PalletQueryYNTWIST: TStringField;
    PalletQueryYNCOL: TStringField;
    PalletQueryYNNET: TFloatField;
    PalletQueryDATERCVD: TDateTimeField;
    PalletQueryYNQLTY: TStringField;
    PalletQueryDESPNO: TIntegerField;
    PalletQuerySource: TDataSource;
    PalletQueryBOXNO: TIntegerField;
    PalletQueryPALLETNO: TIntegerField;
    PalletPanel: TPanel;
    PalletDBGrid: TDBGrid;
    EntryPanel: TPanel;
    EditPalletBarCode: TEdit;
    EditBoxBarCode: TEdit;
    CloseBitBtn: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    ShowPalletNumber: TEdit;
    ShowBoxNumber: TEdit;
    PalletCountPanel: TPanel;
    PalletCountQuery: TQuery;
    PalletCountQueryDESPNO: TIntegerField;
    PalletCountQueryPALLETNO: TIntegerField;
    PalletCountQueryLOTNO1: TSmallintField;
    PalletCountQueryLOTNO2: TSmallintField;
    PalletCountQueryYNSTRU: TStringField;
    PalletCountQueryYNTWIST: TStringField;
    PalletCountQueryYNCOL: TStringField;
    PalletCountQueryYNQLTY: TStringField;
    PalletCountQuerySUM: TFloatField;
    PalletCountQuerySource: TDataSource;
    PalletCountDBGrid: TDBGrid;
    PalletCountQueryCOUNT: TIntegerField;
    Label1: TLabel;
    Label2: TLabel;
    UpdatePalletCountBitBtn: TBitBtn;
    ExportBitBtn: TBitBtn;
    ImportBitBtn: TBitBtn;
    EraseBitBtn: TBitBtn;
    UpdateYarnRcptQuery: TQuery;
    CheckBoxExistsQuery: TQuery;
    MyQuery: TQuery;
    ImportAreaDataBitBtn: TBitBtn;
    ClearStockAreaBitBtn: TBitBtn;
    procedure EditPalletBarCodeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditBoxBarCodeChange(Sender: TObject);
    procedure UpdatePalletCountBitBtnClick(Sender: TObject);
    procedure ExportBitBtnClick(Sender: TObject);
    procedure ImportBitBtnClick(Sender: TObject);
    procedure EraseBitBtnClick(Sender: TObject);
    procedure ImportAreaDataBitBtnClick(Sender: TObject);
    procedure ClearStockAreaBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    PalletBarCodeType,BoxBarCodeType,
    PalletNo,BoxNo:integer;
    ImportDataExists:boolean;
    procedure ClearForm(ClearAll:boolean);
    procedure UpdatePalletCount;
  public
    { Public declarations }
  end;

var
  YnPalletForm: TYnPalletForm;

implementation

{$R *.DFM}

uses Main,Utils;

procedure TYnPalletForm.ClearForm(ClearAll:boolean);
begin
  {ClearAll is set when the bar code must be included in the clear}
  if ClearAll then
    EditPalletBarCode.Clear;
  EditBoxBarCode.Clear;
  ShowPalletNumber.Clear;
  ShowBoxNumber.Clear;
  PalletQuery.Close;
  PalletCountQuery.Close;
end;

procedure TYnPalletForm.EditPalletBarCodeChange(Sender: TObject);
begin
  if length(EditPalletBarCode.Text)<>8 then {8 is smallest barcode length}
  begin
    ClearForm(false); {don't clear the Pallet Bar Code field}
    Exit;
  end
  else
  begin
    PalletBarCodeType:=strtoint(Copy(EditPalletBarCode.Text,1,2));
    if (PalletBarCodeType<>17) then
    begin
      ShowMessage('Invalid Bar Code Type.  Re-enter.');
      ClearForm(false);
      {IssueBitBtn.Enabled:=false;}
      Exit;
    end;
  end;
  PalletNo:=strtoint(Copy(EditPalletBarCode.Text,3,6));
  PalletQuery.Close;
  PalletQuery.Params[0].AsInteger:=PalletNo;
  PalletQuery.Open;
  if PalletQueryDespNo.Value<>0 then {this pallet already on despatch}
  begin
    EditBoxBarCode.Text:='on despatch';
    EditBoxBarCode.Enabled:=false;
  end
  else
  begin
    EditBoxBarCode.Text:='';
    EditBoxBarCode.Enabled:=true;
  end;
  {if PalletQuery.BOF=PalletQuery.EOF then unless undespatched pallet
  begin
    ShowMessage('Pallet Number not found.  Re-enter');
    ClearForm(false);
    Exit;
  end;}
  ShowPalletNumber.Text:=inttostr(PalletNo);
  PalletCountQuery.Close;
  PalletCountQuery.Params[0].AsInteger:=PalletNo;
  PalletCountQuery.Open;
end;

procedure TYnPalletForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{  MainForm.Database.Connected:=false;}
  YnPalletForm.Release;
end;

procedure TYnPalletForm.CloseBitBtnClick(Sender: TObject);
begin
  ClearForm(true);
  Close;
end;

procedure TYnPalletForm.FormShow(Sender: TObject);
const
  StockDBFileName='c:\stockdbs\upload\stockdb.csv'; {xx get correct name}
var
  TempList:TStringList;
begin
  ClearForm(true);
  {find out if data has been exported.  If yes, display Import Data}
  TempList:=TStringList.Create;
  try
    TempList.LoadFromFile(StockDBFileName);
    if TempList.Count>0 then
      ImportDataExists:=true
    else
      ImportDataExists:=false;
{      ExpImpBitBtn.Caption:='Import Data';
      ExpImpBitBtn.Glyph.LoadFromFile('import.BMP');
      ExpImpBitBtn.Caption:='Export Data';
      ExpImpBitBtn.Glyph.LoadFromFile('export.BMP');}
  finally
    TempList.Free;
  end;
{  MainForm.Database.Connected:=true;}
{  YarnRcpt.Open;
  YarnRcpt.Refresh;}
end;

procedure TYnPalletForm.EditBoxBarCodeChange(Sender: TObject);
var
  RemoveBox:boolean;
begin
  if length(EditBoxBarCode.Text)<>8 then {8 is smallest barcode length}
    Exit
  else
  begin
    BoxBarCodeType:=strtoint(Copy(EditBoxBarCode.Text,1,2));
    if ((BoxBarCodeType<>2) and (BoxBarCodeType<>12)) then
    begin
      ShowMessage('Invalid Bar Code Type.  Re-enter.');
      {IssueBitBtn.Enabled:=false;}
      EditBoxBarCode.Clear;
      EditBoxBarCode.SetFocus;
      Exit; {Abort;}
    end;
  end;
  BoxNo:=strtoint(Copy(EditBoxBarCode.Text,3,6)); {entered boxno}

  CheckBoxExistsQuery.Close;
  CheckBoxExistsQuery.Params[0].AsInteger:=BoxNo;
  CheckBoxExistsQuery.Open;
  if CheckBoxExistsQuery.Fields[0].IsNull then   {palletno}
  begin
    CheckBoxExistsQuery.Close;
    ShowMessage('Box Number not found.  Re-enter');
    Exit;
  end;
  RemoveBox:=false;
  if CheckBoxExistsQuery.Fields[1].AsInteger=PalletNo then
  begin
    if MessageDlg('Box is already on this pallet.  Remove?',
       mtWarning, [mbYes, mbNo], 0) = mrYes then
      {remove this box from this pallet}
      RemoveBox:=true
    else
      Exit;
  end
  else
    if CheckBoxExistsQuery.Fields[1].AsInteger<>0 then
    begin
      ShowMessage('Box already on pallet: '+
        CheckBoxExistsQuery.Fields[1].AsString+'.  Re-enter');
      CheckBoxExistsQuery.Close;
      Exit;
    end;
  {if we get here update the box onto or off the pallet}
  PalletQuery.Close;
  PalletCountQuery.Close;
  UpdateYarnRcptQuery.Close;
  MainForm.Database.StartTransaction;
  if RemoveBox then
    {set pallet no to zero thus removing the box from the pallet}
    UpdateYarnRcptQuery.Params[0].AsInteger:=0
  else
    UpdateYarnRcptQuery.Params[0].AsInteger:=PalletNo;
  UpdateYarnRcptQuery.Params[1].AsInteger:=BoxNo;
  UpdateYarnRcptQuery.ExecSQL;
  ShowBoxNumber.Text:=inttostr(BoxNo);
{  RedisplayQueries;}
  MainForm.Database.Commit;
  PalletQuery.Close; {iso Refresh}
  PalletQuery.Open;
  if UpdatePalletCountBitBtn.Caption='&Update Count' then
  begin
    PalletCountQuery.Close;
    PalletCountQuery.Open;
  end;
  EditBoxBarCode.Clear;
  EditBoxBarCode.SetFocus;
end;

procedure TYnPalletForm.UpdatePalletCount;
begin
  if UpdatePalletCountBitBtn.Caption='&Update Count' then
    PalletCountQuery.Open
  else
    PalletCountQuery.Close;
end;

procedure TYnPalletForm.UpdatePalletCountBitBtnClick(Sender: TObject);
begin
  if UpdatePalletCountBitBtn.Caption='&Update Count' then
    UpdatePalletCountBitBtn.Caption:='&Don''t Update'
  else
    UpdatePalletCountBitBtn.Caption:='&Update Count';
  UpdatePalletCount;
end;

procedure TYnPalletForm.ExportBitBtnClick(Sender: TObject);
const
  {export file names}
  DeliveryDBFileName='c:\stockdbs\download\delivdb.csv'; {exp}
  WIPDBFileName='c:\stockdbs\download\wipdb.csv'; {exp}
  YarnBoxDBFileName='c:\stockdbs\download\yarndb.csv'; {exp}
  {import file names}
  StockDBFileName='c:\stockdbs\upload\stockdb.csv'; {imp}
var
  TempList:TStringList;
  TempMessage:string[80];
  {WhatToPick:string;}

  procedure ResetImpFiles;
  {reset the 3 import files}
  begin
    TempList.Clear;
    TempList.SaveToFile(DeliveryDBFileName);
    TempList.SaveToFile(WIPDBFileName);
    TempList.SaveToFile(YarnBoxDBFileName);
  end;
  procedure GetDeliveryDBData;
  {get the delivdb.csv data}
  var
    TempStr:string[80];
  begin
    TempList.Clear;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select dp.delno,dp.palletno,db.bcbno,dp.prodref,dp.qtyrcvd-dp.qtyissued,');
    MyQuery.SQL.Add('''X'',pr.fixedweight,db.qty,dp.bagcartbaledel-dp.bcbissued');
    MyQuery.SQL.Add('from product pr,delpallet dp left join delbcb db');
    MyQuery.SQL.Add('on dp.delno=db.delno and dp.palletno=db.palletno');
    MyQuery.SQL.Add('where ((((dp.qtyrcvd-dp.qtyissued)<>0) and (pr.fixedweight=''Y''))');
    MyQuery.SQL.Add('or ((db.bcbissued=''N'') and (pr.fixedweight=''N'') and (db.qty<>0)))');
    MyQuery.SQL.Add('and (dp.prodref=pr.prodref)');
    MyQuery.SQL.Add('order by dp.delno,dp.palletno,db.bcbno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    while not MyQuery.eof do
    begin
      if MyQuery.Fields[6].AsString='Y' then {fixed weight}
        TempStr:=MyQuery.Fields[0].AsString+
          ZeroFill(MyQuery.Fields[1].Value,3)+'000,'
      else
        TempStr:=MyQuery.Fields[0].AsString+
          ZeroFill(MyQuery.Fields[1].Value,3)+
          ZeroFill(MyQuery.Fields[2].Value,3)+',';
      TempStr:=TempStr+MyQuery.Fields[3].Value+','; {prodref}
      if MyQuery.Fields[6].AsString='Y' then {fixed weight}
        TempStr:=TempStr+FormatFloat('0.0',MyQuery.Fields[4].Value)+',X,' {X is firsts xx}
      else
        TempStr:=TempStr+FormatFloat('0.0',MyQuery.Fields[7].Value)+',X,'; {xx}
      if MyQuery.Fields[6].AsString='Y' then {fixed weight}
        TempStr:=TempStr+'1,'+ {1,1 for yes, 1 default for #bags}
          MyQuery.Fields[8].AsString
      else
        TempStr:=TempStr+'0,1'; {0 for no}
      TempList.Add(TempStr);
      MyQuery.Next;
    end;
    TempList.SaveToFile(DeliveryDBFileName);
    MyQuery.Close;
  end;
  procedure GetWIPDBData;
  {get the wipdb.csv data}
  {var
    TempQlty:string[1];}
  begin
    TempList.Clear;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select refno,prodref,lotno1,lotno2,netweight,''X''');
    MyQuery.SQL.Add('from wiprcpt');
    MyQuery.SQL.Add('where issueto is null');
    MyQuery.SQL.Add('order by refno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    while not MyQuery.eof do
    begin
      TempList.Add(MyQuery.Fields[0].AsString+','+
        MyQuery.Fields[1].AsString+','+
        MyQuery.Fields[2].AsString+'/'+
        MyQuery.Fields[3].AsString+','+
        FormatFloat('0.0',MyQuery.Fields[4].Value)+',X');
      MyQuery.Next;
    end;
    TempList.SaveToFile(WIPDBFileName);
    MyQuery.Close;
  end;
  procedure GetYarnBoxDBData;
  {get the yarndb.csv data}
  var
    TempQlty:string[1];
  begin
    TempList.Clear;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select yr.boxno,yr.lotno1||''/''||yr.lotno2,yr.ynstru,yr.yncol,');
    MyQuery.SQL.Add('yr.yntwist,yr.ynnet,yr.ynqlty');
    MyQuery.SQL.Add('from yarnrcpt yr left join yndesphdr yd on yr.despno=yd.despno');
    MyQuery.SQL.Add('where (yr.despno=0 and yd.despsent is null)');
    MyQuery.SQL.Add('or (yr.despno<>0 and yd.despsent=''N'')');
    MyQuery.SQL.Add('order by yr.boxno');
    MyQuery.Prepare;
    MyQuery.Open;
    MyQuery.First;
    while not MyQuery.eof do
    begin
      if MyQuery.Fields[6].AsString='' then
        TempQlty:='X'
      else
        TempQlty:=MyQuery.Fields[6].AsString;
        TempList.Add(MyQuery.Fields[0].AsString+','+
          MyQuery.Fields[1].AsString+','+
          MyQuery.Fields[2].AsString+','+
          MyQuery.Fields[3].AsString+','+
          MyQuery.Fields[4].AsString+','+
          FormatFloat('0.0',MyQuery.Fields[5].Value)+','+
          TempQlty);
      MyQuery.Next;
    end;
    TempList.SaveToFile(YarnBoxDBFileName);
    MyQuery.Close;
  end;
begin
  if ImportDataExists then
    TempMessage:='Import Data Exists:  Do you wish clear and export?'
  else
    TempMessage:='Do you wish to export data?';
  if MessageDlg(TempMessage,
     mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    Screen.Cursor := crHourglass;               { Show hourglass cursor }
{    Application.ProcessMessages;}
    TempList:=TStringList.Create;
    try
      ResetImpFiles;
      GetDeliveryDBData;
      GetWIPDBData;
      GetYarnBoxDBData;
      ShowMessage('Finished exporting data.  Ready for transfer.');
      Screen.Cursor := crDefault;
    finally
      TempList.Free;
    end;
  end
  else
  begin
    ShowMessage('Invalid selection.  Cannot export.');
    Screen.Cursor := crDefault;
  end;
end;

procedure TYnPalletForm.ImportBitBtnClick(Sender: TObject);
const
  {export file names}
  DeliveryDBFileName='c:\stockdbs\download\delivdb.csv'; {exp}
  WIPDBFileName='c:\stockdbs\download\wipdb.csv'; {exp}
  YarnBoxDBFileName='c:\stockdbs\download\yarndb.csv'; {exp}
  {import file names}
  StockDBFileName='c:\stockdbs\upload\stockdb.csv'; {imp}
var
  TempList:TStringList;

  procedure ResetImpFiles;
  {reset the import file}
  begin
    TempList.Clear;
    TempList.SaveToFile(StockDBFileName);
  end;
  procedure ImportData;
  {import all the pallet data from the stockdb.csv file}
  var
    ix:integer;
    PalletNo:integer;
    BoxNo:integer;
    procedure DecodeStockItem;
    {this procedure must decode delin, yarn and wip}
    var
      iy:integer;
      DecodeStr:string[10];
      TempString:string[20];
    begin
      {the first integer is the palletno}
      {the second integer is the stock item numer including the bar code}
      PalletNo:=-1;
      BoxNo:=-1;
      DecodeStr:='';
      TempString:=TempList[ix];
      for iy:=1 to length(TempString) do
      begin
        if (TempString[iy]<>',') then
          DecodeStr:=DecodeStr+TempString[iy]
        else
        if PalletNo=-1 then  {the palletno is first}
        begin
          PalletNo:=strtoint(DecodeStr);
          DecodeStr:='';
        end;
      end;
      if (length(TempString)>0) and (PalletNo<>-1) then {palletno found}
      begin
        PalletBarCodeType:=strtoint(Copy(DecodeStr,1,2));
        if PalletBarCodeType<10 then
          PalletBarCodeType:=10+PalletBarCodeType;
        if PalletBarCodeType=12 then {yarn box}
          BoxNo:=strtoint(Copy(DecodeStr,3,6));
      end;
    end;
  begin
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('update yarnrcpt');
    MyQuery.SQL.Add('set palletno=:palletno');
    MyQuery.SQL.Add('where boxno=:boxno');
    {MyQuery.SQL.Add('and palletno=0');{remove}
    MyQuery.SQL.Add('and despno=0');
    MyQuery.Prepare;
    for ix:=0 to TempList.Count-1 do
    begin
      DecodeStockItem;
      if PalletBarCodeType=12 then {yarn box}
      begin
        MyQuery.Params[0].AsInteger:=PalletNo;
        MyQuery.Params[1].AsInteger:=BoxNo;
        MyQuery.ExecSQL;
      end;
    end;
    MyQuery.Close;
  end;
begin
  if not ImportDataExists then
    ShowMessage('No data to import')
  else
  if MessageDlg('Do you wish to import data?',
     mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    Screen.Cursor := crHourglass;               { Show hourglass cursor }
    MainForm.Database.StartTransaction;
    TempList:=TStringList.Create;
    try
      TempList.LoadFromFile(StockDBFileName);
      if TempList.Count>0 then
      begin
        ImportData;
        {ResetImpFiles;
        ImportDataExists:=false;}
        if PalletQuery.Active then {redisplay pallet details}
        begin
          Screen.Cursor:=crHourglass;
          PalletQuery.Close;
          PalletQuery.Open;
          PalletCountQuery.Close;
          if UpdatePalletCountBitBtn.Caption='&Update Count' then
            PalletCountQuery.Open;
          Screen.Cursor := crDefault;
        end;
        ShowMessage('Finished importing data.');
      end;
      Screen.Cursor := crDefault;
    finally
      TempList.Free;
    end;
    MainForm.Database.Commit;    
  end;
end;

procedure TYnPalletForm.EraseBitBtnClick(Sender: TObject);
begin
  if (not PalletQuery.Active) or (EditBoxBarCode.Text='on despatch') then
    ShowMessage('Select Pallet (not on despatch) first!') {not on despatch}
  else
  begin
    if MessageDlg('Do you wish to clear pallet '+inttostr(PalletNo)+'?',
       mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      Screen.Cursor := crHourglass;               { Show hourglass cursor }
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('update yarnrcpt');
      MyQuery.SQL.Add('set palletno=0');
      MyQuery.SQL.Add('where palletno=:palletno');
      MyQuery.SQL.Add('and despno=0'); {so that data not overwritten}{maybe change later}
      MyQuery.Prepare;
      MyQuery.Params[0].AsInteger:=PalletNo;
      MyQuery.ExecSQL;
      PalletQuery.Close;
      PalletQuery.Open;
      PalletCountQuery.Close;
      if UpdatePalletCountBitBtn.Caption='&Update Count' then
        PalletCountQuery.Open;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TYnPalletForm.ImportAreaDataBitBtnClick(Sender: TObject);
const
  {export file names}
  DeliveryDBFileName='c:\stockdbs\download\delivdb.csv'; {exp}
  WIPDBFileName='c:\stockdbs\download\wipdb.csv'; {exp}
  YarnBoxDBFileName='c:\stockdbs\download\yarndb.csv'; {exp}
  {import file names}
  StockDBFileName='c:\stockdbs\upload\stockdb.csv'; {imp}
var
  TempList:TStringList;
  AreaBarCodeType:integer;

  procedure ResetImpFiles;
  {reset the import file}
  begin
    TempList.Clear;
    TempList.SaveToFile(StockDBFileName);
  end;
  procedure ImportAreaData(RMType:byte);
  {import all the stock data from the stockdb.csv file}
  var
    ix:integer;
    AreaNo:integer;
    BoxNo:integer;
    DelInDelNo:integer;
    DelInPalletNo:integer;
    DelInBCBNo:integer;
    WIPRef:integer;

    procedure DecodeStockItem;
    {this procedure must decode delin, yarn and wip}
    var
      iy:integer;
      DecodeStr:string[20];
      TempString:string[20];
    begin
      {the first integer is the palletno}
      {the second integer is the stock item numer including the bar code}
      AreaNo:=-1;
      BoxNo:=-1;
      DelInDelNo:=-1;
      DelInPalletNo:=-1;
      DelInBCBNo:=-1;
      DecodeStr:='';
      TempString:=TempList[ix];
      for iy:=1 to length(TempString) do
      begin
        if (TempString[iy]<>',') then
          DecodeStr:=DecodeStr+TempString[iy]
        else
        if AreaNo=-1 then  {the palletno is first}
        begin
          AreaNo:=strtoint(DecodeStr);
          DecodeStr:='';
        end;
      end;
      if (length(TempString)>0) and (AreaNo<>-1) then {areano found}
      begin
        AreaBarCodeType:=strtoint(Copy(DecodeStr,1,2));
        if AreaBarCodeType<10 then
          AreaBarCodeType:=10+AreaBarCodeType;
        if AreaBarCodeType=11 then {delivery}
        begin
          DelInDelNo:=strtoint(Copy(DecodeStr,3,4));
          DelInPalletNo:=strtoint(Copy(DecodeStr,7,3));
          DelInBCBNo:=strtoint(Copy(DecodeStr,10,3));
        end;
        if AreaBarCodeType=12 then {yarn box}
          BoxNo:=strtoint(Copy(DecodeStr,3,6));
        if AreaBarCodeType=13 then {wiprcpt}
          WIPRef:=strtoint(Copy(DecodeStr,3,6));
      end;
    end;
  begin
    if RMType=11 then {Delivery}
    begin
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('update delbcb');
      MyQuery.SQL.Add('set stockarea=:stockarea');
      MyQuery.SQL.Add('where delno=:delno');
      MyQuery.SQL.Add('and palletno=:palletno');
      MyQuery.SQL.Add('and bcbno=:bcbno');
      MyQuery.Prepare;
      for ix:=0 to TempList.Count-1 do
      begin
        DecodeStockItem;
        if AreaBarCodeType=11 then
        begin
          if DelInBCBNo=0 then DelInBCBNo:=1; {pallet}
          MyQuery.Params[0].AsInteger:=AreaNo;
          MyQuery.Params[1].AsInteger:=DelInDelNo;
          MyQuery.Params[2].AsInteger:=DelInPalletNo;
          MyQuery.Params[3].AsInteger:=DelInBCBNo;
          MyQuery.ExecSQL;
        end;
      end;
      MyQuery.Close;
    end; {RMType=11}
    if RMType=12 then {yarn box}
    begin
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('update yarnrcpt');
      MyQuery.SQL.Add('set stockarea=:stockarea');
      MyQuery.SQL.Add('where boxno=:boxno');
      MyQuery.Prepare;
      for ix:=0 to TempList.Count-1 do
      begin
        DecodeStockItem;
        if AreaBarCodeType=12 then {yarn box}
        begin
          MyQuery.Params[0].AsInteger:=AreaNo;
          MyQuery.Params[1].AsInteger:=BoxNo;
          MyQuery.ExecSQL;
        end;
      end;
      MyQuery.Close;
    end; {RMType=12}
    if RMType=13 then {wiprcpt}
    begin
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('update wiprcpt');
      MyQuery.SQL.Add('set stockarea=:stockarea');
      MyQuery.SQL.Add('where refno=:refno');
      MyQuery.Prepare;
      for ix:=0 to TempList.Count-1 do
      begin
        DecodeStockItem;
        if AreaBarCodeType=13 then
        begin
          MyQuery.Params[0].AsInteger:=AreaNo;
          MyQuery.Params[1].AsInteger:=WIPRef;
          MyQuery.ExecSQL;
        end;
      end;
      MyQuery.Close;
    end; {RMType=13}
  end;
begin
  if not ImportDataExists then
    ShowMessage('No data to import')
  else
  if MessageDlg('Do you wish to import area (stock take) data?',
     mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    Screen.Cursor := crHourglass;               { Show hourglass cursor }
    MainForm.Database.StartTransaction;
    TempList:=TStringList.Create;
    try
      TempList.LoadFromFile(StockDBFileName);
      if TempList.Count>0 then
      begin
        ImportAreaData(11); {import for delivery first,then yarnboxes,then wiprcpt}
        ImportAreaData(12);
        ImportAreaData(13);
        {ResetImpFiles;
        ImportDataExists:=false;}
        if PalletQuery.Active then {redisplay pallet details}
        begin
          Screen.Cursor:=crHourglass;
          PalletQuery.Close;
          PalletQuery.Open;
          PalletCountQuery.Close;
          if UpdatePalletCountBitBtn.Caption='&Update Count' then
            PalletCountQuery.Open;
          Screen.Cursor := crDefault;
        end;
        ShowMessage('Finished importing data.');
      end;
      Screen.Cursor := crDefault;
    finally
      TempList.Free;
    end;
    MainForm.Database.Commit;
  end;
end;

procedure TYnPalletForm.ClearStockAreaBitBtnClick(Sender: TObject);
begin
  if (UserInitials='MAA') or (UserInitials='SYS') then
  begin
    if MessageDlg('Clearing Stock Areas should only happen after stock take.  Are you sure?',
       mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      Screen.Cursor := crHourglass;               { Show hourglass cursor }
      MainForm.Database.StartTransaction;
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('update delbcb set stockarea=0 where stockarea<>0');
      MyQuery.Prepare;
      MyQuery.ExecSQL;
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('update wiprcpt set stockarea=0 where stockarea<>0');
      MyQuery.Prepare;
      MyQuery.ExecSQL;
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('update yarnrcpt set stockarea=0 where stockarea<>0');
      MyQuery.Prepare;
      MyQuery.ExecSQL;
      MainForm.Database.Commit;
      Screen.Cursor := crDefault;
      ShowMessage('Stock Areas Cleared');
    end;
  end
  else
    ShowMessage('Only Monique, David and Paul can do this!');
end;

end.
