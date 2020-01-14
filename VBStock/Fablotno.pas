unit Fablotno;
{mods: 5/2/97: made windows as large as possible; added colour filter}
{      10/2/97: add suggest lot no}

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls, Buttons;

type
  TFabricLotNoForm = class(TForm)
    FabLotNoGrid: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    FabricLotNoSource: TDataSource;
    Panel2: TPanel;
    CloseBitBtn: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    FabricLotNo: TTable;
    FabricLotNoLOTNO: TIntegerField;
    FabricLotNoWARPLOTNO1: TIntegerField;
    FabricLotNoWARPLOTNO2: TSmallintField;
    FabricLotNoWARPSINGLEMULTIPLE: TStringField;
    FabricLotNoWEFTLOTNO1: TIntegerField;
    FabricLotNoWEFTLOTNO2: TSmallintField;
    FabricLotNoWEFTSINGLEMULTIPLE: TStringField;
    FabricLotNoVBSTRU: TStringField;
    FabricLotNoVBCOL: TStringField;
    StruColSearchSpdBtn: TSpeedButton;
    WarpLotSearchSpdBtn: TSpeedButton;
    WeftLotSearchSpdBtn: TSpeedButton;
    FabricLotNoDATERCVD: TDateTimeField;
    FabricLotNoRCVDBY: TStringField;
    Label2: TLabel;
    EditColSearch: TEdit;
    SuggestSpdBtn1: TSpeedButton;
    MyQuery: TQuery;
    FabricLotNoVBFIN: TStringField;
    PrintSpdBtn: TSpeedButton;
    procedure CloseBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FabricLotNoAfterCancel(DataSet: TDataset);
    procedure FabricLotNoAfterDelete(DataSet: TDataset);
    procedure FabricLotNoAfterPost(DataSet: TDataset);
    procedure FabricLotNoBeforeEdit(DataSet: TDataset);
    procedure FabricLotNoBeforeInsert(DataSet: TDataset);
    procedure FabricLotNoBeforeDelete(DataSet: TDataset);
    procedure StruColSearchSpdBtnClick(Sender: TObject);
    procedure WarpLotSearchSpdBtnClick(Sender: TObject);
    procedure WeftLotSearchSpdBtnClick(Sender: TObject);
    procedure FabricLotNoSourceStateChange(Sender: TObject);
    procedure FabricLotNoNewRecord(DataSet: TDataset);
    procedure FabricLotNoDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure EditColSearchChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SuggestSpdBtn1Click(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
  private
    { private declarations }
    WarpCol:string[3];
    WeftCol:string[3];
    OldVBStru:string[3]; //DL310801 was string[1]
    OldVBCol:string[3];
    OldVBFin:string[2];
  public
    { public declarations }
  end;

var
  FabricLotNoForm: TFabricLotNoForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs,VBModal;

procedure TFabricLotNoForm.CloseBitBtnClick(Sender: TObject);
begin
  if FabricLotNo.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Fabric Lot Nos before closing',
      mtInformation, [mbOK], 0)
  else
    Close;
end;

procedure TFabricLotNoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FabricLotNo.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;
  FabricLotNo.Close;
  FabricLotNoForm.Release;
end;

procedure TFabricLotNoForm.FormShow(Sender: TObject);
begin
  FabricLotNo.Open;
  FabricLotNo.Filter:='';
  FabricLotNo.Filtered:=false;
  OldVBStru:='';
  OldVBCol:='';
  OldVBFin:='';
end;

procedure TFabricLotNoForm.FabricLotNoAfterCancel(DataSet: TDataset);
begin
  MainForm.Database.Rollback;
end;

procedure TFabricLotNoForm.FabricLotNoAfterDelete(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TFabricLotNoForm.FabricLotNoAfterPost(DataSet: TDataset);
begin
  MainForm.Database.Commit;
end;

procedure TFabricLotNoForm.FabricLotNoBeforeEdit(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TFabricLotNoForm.FabricLotNoBeforeInsert(DataSet: TDataset);
begin
  OldVBStru:=FabricLotNoVBSTRU.AsString;
  OldVBCol:=FabricLotNoVBCOL.AsString;
  OldVBFin:=FabricLotNoVBFIN.AsString;
  MainForm.Database.StartTransaction;
end;

procedure TFabricLotNoForm.FabricLotNoBeforeDelete(DataSet: TDataset);
begin
  MainForm.Database.StartTransaction;
end;

procedure TFabricLotNoForm.StruColSearchSpdBtnClick(Sender: TObject);
begin
  if VBPickDlgForm.ShowModalVBType = mrOk then
  begin
{    EditVBStru.ReadOnly:=false;
    EditVBCol.ReadOnly:=false;}
{    FabricLotNoQuery.Edit;}
    FabLotNoGrid.SelectedField := FabricLotNoVBStru;
    FabricLotNoVBStru.Value:=VBPickDlgForm.VBStru;
    FabLotNoGrid.SelectedField := FabricLotNoVBCol;
    FabricLotNoVBCol.Value:=VBPickDlgForm.VBCol;
    FabricLotNoVBFin.Value:=VBPickDlgForm.VBFin;
    {WarpCol:=VBVBPickDlgForm.WarpCol; -removed DL100297 so that numbers can be entered}
    {WeftCol:=VBVBPickDlgForm.WeftCol; -removed DL100297 so that numbers can be entered}
{    EditVBStru.ReadOnly:=true;
    EditVBCol.ReadOnly:=true;}
  end;
end;

procedure TFabricLotNoForm.WarpLotSearchSpdBtnClick(Sender: TObject);
begin
  if FabricLotNoVBCol.Value='' then
    raise Exception.Create('Must search for VB Type first');
  {get the warp colour for this colour}
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select warpcol');
  MyQuery.SQL.Add('from vbtype');
  MyQuery.SQL.Add('where vbstru=:vbstru');
  MyQuery.SQL.Add('and vbcol=:vbcol');
  MyQuery.SQL.Add('and vbfin=:vbfin');
  MyQuery.Prepare;
  MyQuery.Params[0].AsString:=FabricLotNoVBStru.Value;
  MyQuery.Params[1].AsString:=FabricLotNoVBCol.Value;
  MyQuery.Params[2].AsString:=FabricLotNoVBFin.Value;
  MyQuery.Open;
  if MyQuery.BOF=MyQuery.EOF then
    raise Exception.Create('Error with VBStru, VBCol and VBFin. Please check')
  else
    WarpCol:=MyQuery.Fields[0].AsString;
  MyQuery.Close;
  if VBPickDlgForm.ShowModalWorWLotNo(WarpCol) = mrOk then
  begin
{    EditVBStru.ReadOnly:=false;
    EditVBCol.ReadOnly:=false;}
{    FabricLotNoQuery.Edit;}
    FabLotNoGrid.SelectedField := FabricLotNoWarpLotNo1;
    FabricLotNoWarpLotNo1.Value:=VBPickDlgForm.WorWLotNo1;
    FabLotNoGrid.SelectedField := FabricLotNoWarpLotNo2;
    FabricLotNoWarpLotNo2.Value:=VBPickDlgForm.WorWLotNo2;
    FabLotNoGrid.SelectedField := FabricLotNoWarpSingleMultiple;
    FabricLotNoWarpSingleMultiple.Value:=VBPickDlgForm.WorWSingleMultiple;
{    EditVBStru.ReadOnly:=true;
    EditVBCol.ReadOnly:=true;}
  end;
end;

procedure TFabricLotNoForm.WeftLotSearchSpdBtnClick(Sender: TObject);
begin
  if FabricLotNoVBCol.Value='' then
    raise Exception.Create('Must search for VB Type first');
  {get the weft colour for this colour}
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select weftcol,weftstru'); //weftstru added DL240798
  MyQuery.SQL.Add('from vbtype');
  MyQuery.SQL.Add('where vbstru=:vbstru');
  MyQuery.SQL.Add('and vbcol=:vbcol');
  MyQuery.SQL.Add('and vbfin=:vbfin');
  MyQuery.Prepare;
  MyQuery.Params[0].AsString:=FabricLotNoVBStru.Value;
  MyQuery.Params[1].AsString:=FabricLotNoVBCol.Value;
  MyQuery.Params[2].AsString:=FabricLotNoVBFin.Value;
  MyQuery.Open;
  if MyQuery.BOF=MyQuery.EOF then
    raise Exception.Create('Error with VBStru, VBCol and VBFin. Please check');
  WeftCol:=MyQuery.Fields[0].AsString;
  //xxDL240798 modify this to look up mixed weft colours where reqd
  if MyQuery.FieldByName('WeftStru').AsString='W001' then
  begin
    //xx here we need a WEFTWBSLookup Table DL240798
    if WeftCol='R01' then
      WeftCol:='WHT'
    else if WeftCol='R02' then
      WeftCol:='CR2'
    else if WeftCol='R03' then
      WeftCol:='205'
    else if WeftCol='R04' then
      WeftCol:='434'
    else if WeftCol='R05' then
      WeftCol:='114'
    else if WeftCol='R06' then
      WeftCol:='471'
    else if WeftCol='R07' then
      WeftCol:='108'
    else if WeftCol='R08' then
      WeftCol:='137'
    else if WeftCol='R09' then
      WeftCol:='205'
    else if WeftCol='R10' then
      WeftCol:='WHT'
    else
      raise Exception.Create('Invalid W001/ Weft Colour');
  end;
  MyQuery.Close;
  if VBPickDlgForm.ShowModalWorWLotNo(WeftCol) = mrOk then
  begin
{    EditVBStru.ReadOnly:=false;
    EditVBCol.ReadOnly:=false;}
{    FabricLotNoQuery.Edit;}
    FabLotNoGrid.SelectedField := FabricLotNoWeftLotNo1;
    FabricLotNoWeftLotNo1.Value:=VBPickDlgForm.WorWLotNo1;
    FabLotNoGrid.SelectedField := FabricLotNoWeftLotNo2;
    FabricLotNoWeftLotNo2.Value:=VBPickDlgForm.WorWLotNo2;
    FabLotNoGrid.SelectedField := FabricLotNoWeftSingleMultiple;
    FabricLotNoWeftSingleMultiple.Value:=VBPickDlgForm.WorWSingleMultiple;
{    EditVBStru.ReadOnly:=true;
    EditVBCol.ReadOnly:=true;}
  end;
end;

procedure TFabricLotNoForm.FabricLotNoSourceStateChange(Sender: TObject);
begin
  StruColSearchSpdBtn.Enabled:=FabricLotNo.State in [dsInsert,dsEdit];
  WarpLotSearchSpdBtn.Enabled:=StruColSearchSpdBtn.Enabled;
  WeftLotSearchSpdBtn.Enabled:=StruColSearchSpdBtn.Enabled;
end;

procedure TFabricLotNoForm.FabricLotNoNewRecord(DataSet: TDataset);
begin
  FabricLotNoDateRcvd.ReadOnly:=false;
  FabricLotNoRcvdBy.ReadOnly:=false;
  FabricLotNoDateRcvd.Value:=date;
  FabricLotNoRcvdBy.Value:=UserInitials;
  FabricLotNoDateRcvd.ReadOnly:=true;
  FabricLotNoRcvdBy.ReadOnly:=true;
  if (OldVBStru<>'') and (EditColSearch.Text<>'') then //added DL161199
  begin
    FabricLotNoVBSTRU.AsString:=OldVBStru;
    FabricLotNoVBCOL.AsString:=OldVBCol;
    FabricLotNoVBFIN.AsString:=OldVBFin;
  end;
end;

procedure TFabricLotNoForm.FabricLotNoDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MainForm.Database.RollBack;
end;

procedure TFabricLotNoForm.EditColSearchChange(Sender: TObject);
begin
  if EditColSearch.Text='' then
    FabricLotNo.Filtered:=false
  else
  begin
    FabricLotNo.Filter:='vbcol='+EditColSearch.Text;
    FabricLotNo.Filtered:=true;
  end;
end;

procedure TFabricLotNoForm.FormActivate(Sender: TObject);
begin
  EditColSearch.SetFocus;
end;

procedure TFabricLotNoForm.SuggestSpdBtn1Click(Sender: TObject);
begin
  if not (FabricLotNo.State in [{dsEdit,}dsInsert]) then
    raise Exception.Create('Must be in insert mode to suggest')
  else
  begin
    if (FabricLotNoVBCol.AsString='') or (FabricLotNoWarpLotNo1.AsString='')
      or (FabricLotNoWeftLotNo1.AsString='') then
      raise Exception.Create('Please search first');
  end;
  {1.Check existence of vbstru and vbcol}
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select warpcol,weftcol,weftstru'); //weftstru added DL240798
  MyQuery.SQL.Add('from vbtype');
  MyQuery.SQL.Add('where vbstru=:vbstru');
  MyQuery.SQL.Add('and vbcol=:vbcol');
  MyQuery.SQL.Add('and vbfin=:vbfin');
  MyQuery.Prepare;
  MyQuery.Params[0].AsString:=FabricLotNoVBStru.Value;
  MyQuery.Params[1].AsString:=FabricLotNoVBCol.Value;
  MyQuery.Params[2].AsString:=FabricLotNoVBFin.Value;
  MyQuery.Open;
  if MyQuery.BOF=MyQuery.EOF then
    raise Exception.Create('Error with VBStru, VBCol and VBFin. Please check');
  {2.check existence of warp lot number}
  WarpCol:=MyQuery.Fields[0].AsString;
  WeftCol:=MyQuery.Fields[1].AsString;
  //xxDL240798 modify this to look up mixed weft colours where reqd
  if MyQuery.FieldByName('WeftStru').AsString='W001' then
  begin
    //xx here we need a WEFTWBSLookup Table DL240798
    if WeftCol='R01' then
      WeftCol:='WHT'
    else if WeftCol='R02' then
      WeftCol:='CR2'
    else if WeftCol='R03' then
      WeftCol:='205'
    else if WeftCol='R04' then
      WeftCol:='434'
    else if WeftCol='R05' then
      WeftCol:='114'
    else if WeftCol='R06' then
      WeftCol:='471'
    else if WeftCol='R07' then
      WeftCol:='108'
    else if WeftCol='R08' then
      WeftCol:='137'
    else if WeftCol='R09' then
      WeftCol:='205'
    else if WeftCol='R10' then
      WeftCol:='WHT'
    else
      raise Exception.Create('Invalid W001/ Weft Colour');
  end;
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select lotnoref1');
  MyQuery.SQL.Add('from worwlotno');
  MyQuery.SQL.Add('where lotnoref1=:lnr1');
  MyQuery.SQL.Add('and lotnoref2=:lnr2');
  MyQuery.SQL.Add('and singlemultiple=:wpsm');
  MyQuery.SQL.Add('and w1yncol=:warpcol'); {warp yarn colour}
  MyQuery.Prepare;
  MyQuery.Params[0].AsInteger:=FabricLotNoWarpLotNo1.Value;
  MyQuery.Params[1].AsInteger:=FabricLotNoWarpLotNo2.Value;
  MyQuery.Params[2].AsString:=FabricLotNoWarpSingleMultiple.Value;
  MyQuery.Params[3].AsString:=WarpCol;
  MyQuery.Open;
  if MyQuery.BOF=MyQuery.EOF then
    raise Exception.Create('Error with Warp Lot Number. Please check');
  {3.check existence of weft lot number}
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select lotnoref1');
  MyQuery.SQL.Add('from worwlotno');
  MyQuery.SQL.Add('where lotnoref1=:lnr1');
  MyQuery.SQL.Add('and lotnoref2=:lnr2');
  MyQuery.SQL.Add('and singlemultiple=:wpsm');
  MyQuery.SQL.Add('and w1yncol=:weftcol'); {weft yarn colour}
  MyQuery.Prepare;
  MyQuery.Params[0].AsInteger:=FabricLotNoWeftLotNo1.Value;
  MyQuery.Params[1].AsInteger:=FabricLotNoWeftLotNo2.Value;
  MyQuery.Params[2].AsString:=FabricLotNoWeftSingleMultiple.Value;
  MyQuery.Params[3].AsString:=WeftCol;
  MyQuery.Open;
  if MyQuery.BOF=MyQuery.EOF then
    raise Exception.Create('Error with Weft Lot Number. Please check');
  {4.Suggest a lot number}
  //first search where the warplotno and weftlotno are equal the entered lotnumbers
  MyQuery.Close;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select max(lotno)');
  MyQuery.SQL.Add('from fabriclotno');
  MyQuery.SQL.Add('where warplotno1=:wpln1');
  MyQuery.SQL.Add('and warpsinglemultiple=:wpsm');
  MyQuery.SQL.Add('and weftlotno1=:wtln1');
  MyQuery.SQL.Add('and weftsinglemultiple=:wtsm');
  MyQuery.SQL.Add('and vbstru=:vbstru'); {for safety}
  MyQuery.SQL.Add('and vbcol=:vbcol'); {for safety}
  //next line removed because lot numbers are unique by stru and col
  //and different finishes for a stru and col have unique lot numbers.
  //MyQuery.SQL.Add('and vbfin=:vbfin'); {for safety} //removed DL290699
  MyQuery.Prepare;
  MyQuery.Params[0].AsInteger:=FabricLotNoWarpLotNo1.Value;
  MyQuery.Params[1].AsString:=FabricLotNoWarpSingleMultiple.Value;
  MyQuery.Params[2].AsInteger:=FabricLotNoWeftLotNo1.Value;
  MyQuery.Params[3].AsString:=FabricLotNoWeftSingleMultiple.Value;
  MyQuery.Params[4].AsString:=FabricLotNoVBStru.Value;
  MyQuery.Params[5].AsString:=FabricLotNoVBCol.Value;
  //MyQuery.Params[6].AsString:=FabricLotNoVBFin.Value; removed DL290699
  MyQuery.Open;
  {a row is always returned by a max function}
  //if MyQuery.BOF<>MyQuery.EOF then {lot no found, so suggest it}
  if MyQuery.Fields[0].AsInteger<>0 then
  begin
    FabricLotNoLotNo.Value:=MyQuery.Fields[0].AsInteger;
    //DL290699 add a query to check if there is already this lot number
    //for another finish for this vbstru and vbcol, if so add one.
    //Note: 1 must be added to the maximum, not to the fabriclotno found already DL161199
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select max(lotno)');
    MyQuery.SQL.Add('from fabriclotno');
    MyQuery.SQL.Add('where vbstru=:vbstru');
    MyQuery.SQL.Add('and vbcol=:vbcol');
    MyQuery.SQL.Add('and vbfin<>:vbfin'); //this must be left in because of uniqueness for vbfin
    MyQuery.SQL.Add('and lotno=:lotno'); //added DL161199
    MyQuery.Prepare;
    MyQuery.Params[0].AsString:=FabricLotNoVBStru.Value;
    MyQuery.Params[1].AsString:=FabricLotNoVBCol.Value;
    MyQuery.Params[2].AsString:=FabricLotNoVBFin.Value;
    MyQuery.Params[3].AsInteger:=FabricLotNoLotNo.Value; //added DL161199
    MyQuery.Open;
    if MyQuery.Fields[0].AsInteger<>0 then {lot number found, so suggest the next one}
    begin
      //FabricLotNoLotNo.AsInteger:=FabricLotNoLotNo.AsInteger+1 removed DL161199
      //added the rest of this begin end (without vbfin) DL161199
      MyQuery.Close;
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('select max(lotno)');
      MyQuery.SQL.Add('from fabriclotno');
      MyQuery.SQL.Add('where vbstru=:vbstru');
      MyQuery.SQL.Add('and vbcol=:vbcol');
      MyQuery.Prepare;
      MyQuery.Params[0].AsString:=FabricLotNoVBStru.Value;
      MyQuery.Params[1].AsString:=FabricLotNoVBCol.Value;
      MyQuery.Open;
      if MyQuery.Fields[0].AsInteger<>0 then {lot number found, so suggest the next one}
        FabricLotNoLotNo.Value:=MyQuery.Fields[0].AsInteger+1
      else
        FabricLotNoLotNo.Value:=0; //for safety
    end;
  end
  else
  begin
    MyQuery.Close;
    MyQuery.SQL.Clear;
    MyQuery.SQL.Add('select max(lotno)');
    MyQuery.SQL.Add('from fabriclotno');
    MyQuery.SQL.Add('where vbstru=:vbstru');
    MyQuery.SQL.Add('and vbcol=:vbcol');
    MyQuery.SQL.Add('and vbfin=:vbfin'); //this must be left in because of uniqueness for vbfin
    MyQuery.Prepare;
    MyQuery.Params[0].AsString:=FabricLotNoVBStru.Value;
    MyQuery.Params[1].AsString:=FabricLotNoVBCol.Value;
    MyQuery.Params[2].AsString:=FabricLotNoVBFin.Value;
    MyQuery.Open;
    if MyQuery.Fields[0].AsInteger<>0 then {lot number found, so suggest the next one}
      FabricLotNoLotNo.Value:=MyQuery.Fields[0].AsInteger+1
    else {lot no not found,so suggest the first (new) one}
      FabricLotNoLotNo.Value:=(strtoint(FabricLotNoVBCol.Value)*1000)+1;
  end;
  MyQuery.Close;
end;

procedure TFabricLotNoForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

end.
