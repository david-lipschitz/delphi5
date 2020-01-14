unit geninvoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, DBLookup, Buttons, Mask, Grids, DBGrids, Db,
  DBTables, Menus, ODDBFind;

type
  TfrmGenInvoice = class(TForm)
    Panel1: TPanel;
    Label9: TLabel;
    Label1: TLabel;
    EditDESPNO: TDBEdit;
    Label3: TLabel;
    CalSpdBtn: TSpeedButton;
    EditDESPDATE: TDBEdit;
    Label4: TLabel;
    EditDespBy: TDBEdit;
    Label15: TLabel;
    Label24: TLabel;
    EditInvDate: TDBEdit;
    InvDateSpdBtn: TSpeedButton;
    Label10: TLabel;
    Label18: TLabel;
    EditCustRef: TDBEdit;
    Label11: TLabel;
    Label21: TLabel;
    EditPallets: TDBEdit;
    Label22: TLabel;
    EditBoxes: TDBEdit;
    Label6: TLabel;
    EditNetLength: TDBEdit;
    EditDespSent: TDBCheckBox;
    tabVBInvHdr: TTable;
    datDespHdr: TDataSource;
    datVBInvHdr: TDataSource;
    Panel2: TPanel;
    dbgVBInvHdr: TDBGrid;
    Panel3: TPanel;
    btnGenerate: TButton;
    tabVBInvHdrDESPNO: TIntegerField;
    tabVBInvHdrINVNO: TIntegerField;
    tabVBInvHdrINVDATE: TDateTimeField;
    tabVBInvHdrNETLENGTH: TFloatField;
    DBNavigator1: TDBNavigator;
    tabVBInvHdrLOC_GRAND_TOTAL: TFloatField;
    tabVBInvHdrACC_GRAND_TOTAL: TFloatField;
    btnClose: TBitBtn;
    DBEdit1: TDBEdit;
    qryInsertInvHdr: TQuery;
    tabVBInvHdrINVSENT: TStringField;
    qryInsertInvDet: TQuery;
    qryFetchHdrInfo: TQuery;
    qryLocalDet: TQuery;
    qryOverseasDet: TQuery;
    Label2: TLabel;
    Label5: TLabel;
    cbxPriceType: TComboBox;
    DBEdit2: TDBEdit;
    qryDespHdr: TQuery;
    qryDespHdrDESPNO: TIntegerField;
    qryDespHdrCUSTREF: TStringField;
    qryDespHdrDESPSENT: TStringField;
    qryDespHdrPALLETS: TSmallintField;
    qryDespHdrBOXES: TSmallintField;
    qryDespHdrNETLENGTHDESP: TFloatField;
    qryDespHdrDESPDATE: TDateTimeField;
    qryDespHdrDESPBY: TStringField;
    qryDespHdrEXPORTER: TStringField;
    qryDespHdrINVDATE: TDateTimeField;
    qryDespHdrLOCALOVERSEAS: TStringField;
    qryInsertInvHdrExtra: TQuery;
    btnDelete: TButton;
    qryDeleteInvHdr: TQuery;
    qryDeleteInvHdrExtra: TQuery;
    qryDeleteInvDet: TQuery;
    qryGetItemNo: TQuery;
    qryGetItemNoITEMNO: TIntegerField;
    btnFindDespatch: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure datDespHdrDataChange(Sender: TObject; Field: TField);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnFindDespatchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGenInvoice: TfrmGenInvoice;

implementation

{$R *.DFM}

uses Main, VBUtils, Vbmodal;

procedure TfrmGenInvoice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

procedure TfrmGenInvoice.btnCloseClick(Sender: TObject);
begin
  qryDeleteInvHdr.Close;
  qryDeleteInvHdrExtra.Close;
  qryDeleteInvDet.Close;
  qryFetchHdrInfo.Close;
  qryInsertInvDet.Close;
  qryLocalDet.Close;
  qryOverseasDet.Close;
  qryInsertInvHdrExtra.Close;
  qryInsertInvHdr.Close;
  tabVBInvHdr.Close;
  qryDespHdr.Close;
  Close;
end;

procedure TfrmGenInvoice.FormShow(Sender: TObject);
begin
  qryDespHdr.Close;
  qryDespHdr.ParamByName('DespNo').AsInteger:=1;
  qryDespHdr.Open;
  tabVBInvHdr.Open;
end;

procedure TfrmGenInvoice.btnGenerateClick(Sender: TObject);
var
  LineNo:integer;
  YourRef:string;
  Loc_Total,Loc_Value,Loc_Freight,FreightBoxesTotal,FreightDocumentation,
    NetLengthYards,VATAmt,PalletValue,TotalInclFreight:double;
begin
  //check that there are no detail lines (invoices) for the despatch
  if tabVBInvHdrDESPNO.AsString<>'' then
    raise Exception.Create('Cannot generate invoice as already done');
  //check that despatch is sent and that invoice date is filled in
//  if qryDespHdrDESPSENT.AsString<>'Y' then
//    raise Exception.Create('Cannot generate invoice as despatch not sent');
  if qryDespHdrINVDATE.AsDateTime=0 then
    raise Exception.Create('Cannot generate invoice as invoice date not filled in on despatch');
  if qryDespHdrLOCALOVERSEAS.AsString='V' then
    if cbxPriceType.Text='' then
      raise Exception.Create('Overseas Despatch requires price type. Please enter.');
  //check that all detail lines have prices
  //check that the agentfreight details exist
  //fill in the header
  Screen.Cursor:=crSQLWait;
  MainForm.Database.StartTransaction;
  tabVBInvHdr.Close;
  qryFetchHdrInfo.Close;
  qryFetchHdrInfo.ParamByName('DespNo').AsInteger:=qryDespHdrDESPNO.AsInteger;
  qryFetchHdrInfo.Open;
  Loc_Total:=0;
  FreightBoxesTotal:=0;
  Loc_Value:=0;
  Loc_Freight:=0;
  FreightDocumentation:=0;
  NetLengthYards:=0;
  VATAmt:=0;
  PalletValue:=0;
  TotalInclFreight:=0;
  if qryFetchHdrInfo.RecordCount=0 then
  begin
    qryFetchHdrInfo.Close;
    Screen.Cursor:=crDefault;
    raise Exception.Create('Invoice Creation: Data Missing');
  end
  else if qryFetchHdrInfo.RecordCount>1 then
  begin
    qryFetchHdrInfo.Close;
    Screen.Cursor:=crDefault;
    raise Exception.Create('Invoice Creation: More than one header record');
  end;
  qryInsertInvHdr.Close;
  qryInsertInvHdr.ParamByName('DespNo').AsInteger:=qryFetchHdrInfo.FieldByName('DespNo').AsInteger;
  qryInsertInvHdr.ParamByName('InvNo').AsInteger:=1;
  qryInsertInvHdr.ParamByName('CustRef').AsString:=qryFetchHdrInfo.FieldByName('CustRef').AsString;
  qryInsertInvHdr.ParamByName('InvDate').AsDateTime:=qryFetchHdrInfo.FieldByName('InvDate').AsDateTime;
  qryInsertInvHdr.ParamByName('TermsFromDate').AsDateTime:=qryFetchHdrInfo.FieldByName('InvDate').AsDateTime;
  qryInsertInvHdr.ParamByName('TermsDays').AsInteger:=qryFetchHdrInfo.FieldByName('TermsDays').AsInteger;
  qryInsertInvHdr.ParamByName('Currency').AsString:=qryFetchHdrInfo.FieldByName('Currency').AsString;
  qryInsertInvHdr.ParamByName('AgentRef').AsString:=qryFetchHdrInfo.FieldByName('TransBy').AsString;
  //qryInsertInvHdr.ParamByName('SupDescr').AsString:=qryFetchHdrInfo.FieldByName('Descr').AsString;
  qryInsertInvHdr.ParamByName('OurRef').AsString:='DESPATCH NUMBER '+qryFetchHdrInfo.FieldByName('DespNo').AsString;
  qryInsertInvHdr.ParamByName('YourRef').AsString:='to be built';
  qryInsertInvHdr.ParamByName('ExportCode').AsString:='354182';
  qryInsertInvHdr.ParamByName('Pallets').AsInteger:=qryFetchHdrInfo.FieldByName('Pallets').AsInteger;
  qryInsertInvHdr.ParamByName('Boxes').AsInteger:=qryFetchHdrInfo.FieldByName('Boxes').AsInteger;
  qryInsertInvHdr.ParamByName('NetLength').AsFloat:=qryFetchHdrInfo.FieldByName('NetLengthDesp').AsFloat;
  qryInsertInvHdr.ParamByName('Loc_Total').AsFloat:=0;
  qryInsertInvHdr.ParamByName('Acc_Total').AsFloat:=0;
  qryInsertInvHdr.ParamByName('AdditionalLocAmt').AsFloat:=0; //added DL011199
  qryInsertInvHdr.ParamByName('AdditionalAccAmt').AsFloat:=0; //added DL011199
  if qryDespHdrLOCALOVERSEAS.AsString='V' then
  begin
    qryInsertInvHdr.ParamByName('PhysicalPallets').AsInteger:=0;
    qryInsertInvHdr.ParamByName('PalletPrice').AsFloat:=0;
    PalletValue:=0;
    FreightDocumentation:=0;
    qryInsertInvHdr.ParamByName('PalletValue').AsFloat:=0;
    qryInsertInvHdr.ParamByName('FreightDocumentation').AsFloat:=0;
    qryInsertInvHdr.ParamByName('FreightBoxes').AsFloat:=0;
    qryInsertInvHdr.ParamByName('VATRate').AsFloat:=0;
    qryInsertInvHdr.ParamByName('VATAmt').AsFloat:=0;
    qryInsertInvHdr.ParamByName('ExchRate').AsFloat:=qryFetchHdrInfo.FieldByName('ExchRate').AsFloat;
  end
  else
  begin
    qryInsertInvHdr.ParamByName('PhysicalPallets').AsInteger:=qryFetchHdrInfo.FieldByName('PhysicalPallets').AsInteger;
    qryInsertInvHdr.ParamByName('PalletPrice').AsFloat:=50; //xx make variable
    PalletValue:=qryFetchHdrInfo.FieldByName('PhysicalPallets').AsInteger*50;
    FreightDocumentation:=0;
    qryInsertInvHdr.ParamByName('PalletValue').AsFloat:=PalletValue;
    qryInsertInvHdr.ParamByName('FreightDocumentation').AsFloat:=0;
    qryInsertInvHdr.ParamByName('FreightBoxes').AsFloat:=0;
    qryInsertInvHdr.ParamByName('VATRate').AsFloat:=14;
    qryInsertInvHdr.ParamByName('VATAmt').AsFloat:=0;
    qryInsertInvHdr.ParamByName('ExchRate').AsFloat:=1;
  end;
  qryInsertInvHdr.ParamByName('Loc_Grand_Total').AsFloat:=0;
  qryInsertInvHdr.ParamByName('Acc_Grand_Total').AsFloat:=0;
  qryInsertInvHdr.ParamByName('InvBy').AsString:=''; //for now
  qryInsertInvHdr.ParamByName('InvSent').AsString:='N';
  qryInsertInvHdr.ParamByName('MetricOrImperial').AsString:=qryFetchHdrInfo.FieldByName('MetricOrImperial').AsString;
  qryInsertInvHdr.ParamByName('LocalOverseas').AsString:=qryDespHdrLOCALOVERSEAS.AsString;
  //xxqryInsertInvHdr.ParamByName('PriceType').AsString:=cbxPriceType.Text;

  if (qryDespHdrLOCALOVERSEAS.AsString='V') and
     (qryDespHdrDESPNO.AsInteger>=4524) then //insert overseas extra data
  begin
    //invoices before number 4524 do not have additional info, so
    //this information has been ignored.
    qryInsertInvHdrExtra.Close;
    qryInsertInvHdrExtra.ParamByName('DespNo').AsInteger:=qryFetchHdrInfo.FieldByName('DespNo').AsInteger;
    qryInsertInvHdrExtra.ParamByName('InvNo').AsInteger:=1;
    qryInsertInvHdrExtra.ParamByName('StreetAdd1').AsString:=qryFetchHdrInfo.FieldByName('StreetAdd1').AsString;
    qryInsertInvHdrExtra.ParamByName('StreetAdd2').AsString:=qryFetchHdrInfo.FieldByName('StreetAdd2').AsString;
    qryInsertInvHdrExtra.ParamByName('StreetAdd3').AsString:=qryFetchHdrInfo.FieldByName('StreetAdd3').AsString;
    qryInsertInvHdrExtra.ParamByName('StreetAdd4').AsString:=qryFetchHdrInfo.FieldByName('StreetAdd4').AsString;
    qryInsertInvHdrExtra.ParamByName('StreetAdd5').AsString:=qryFetchHdrInfo.FieldByName('StreetAdd5').AsString;
    qryInsertInvHdrExtra.ParamByName('PostalAdd1').AsString:=qryFetchHdrInfo.FieldByName('PostalAdd1').AsString;
    qryInsertInvHdrExtra.ParamByName('PostalAdd2').AsString:=qryFetchHdrInfo.FieldByName('PostalAdd2').AsString;
    qryInsertInvHdrExtra.ParamByName('PostalAdd3').AsString:=qryFetchHdrInfo.FieldByName('PostalAdd3').AsString;
    qryInsertInvHdrExtra.ParamByName('PostalAdd4').AsString:=qryFetchHdrInfo.FieldByName('PostalAdd4').AsString;
    qryInsertInvHdrExtra.ParamByName('PostalAdd5').AsString:=qryFetchHdrInfo.FieldByName('PostalAdd5').AsString;
    qryInsertInvHdrExtra.ParamByName('PlaceLoad').AsString:=qryFetchHdrInfo.FieldByName('PlaceLoad').AsString;
    qryInsertInvHdrExtra.ParamByName('PlaceDischarge').AsString:=qryFetchHdrInfo.FieldByName('PlaceDischarge').AsString;
    qryInsertInvHdrExtra.ParamByName('IncoTerms').AsString:=qryFetchHdrInfo.FieldByName('IncoTerms').AsString;
    qryInsertInvHdrExtra.ParamByName('PlaceDestLine1').AsString:=qryFetchHdrInfo.FieldByName('PlaceDestLine1').AsString;
    qryInsertInvHdrExtra.ParamByName('PlaceDestLine2').AsString:=qryFetchHdrInfo.FieldByName('PlaceDestLine2').AsString;
    qryInsertInvHdrExtra.ParamByName('CarriageByLine1').AsString:=qryFetchHdrInfo.FieldByName('CarriageByLine1').AsString;
    qryInsertInvHdrExtra.ParamByName('CarriageByLine2').AsString:=qryFetchHdrInfo.FieldByName('CarriageByLine2').AsString;
    qryInsertInvHdrExtra.ParamByName('TermsLine1').AsString:=qryFetchHdrInfo.FieldByName('TermsLine1').AsString;
    qryInsertInvHdrExtra.ParamByName('TermsLine2').AsString:=qryFetchHdrInfo.FieldByName('TermsLine2').AsString;
    qryInsertInvHdrExtra.ParamByName('NotifyLine1').AsString:=qryFetchHdrInfo.FieldByName('NotifyLine1').AsString;
    qryInsertInvHdrExtra.ParamByName('NotifyLine2').AsString:=qryFetchHdrInfo.FieldByName('NotifyLine2').AsString;
    qryInsertInvHdrExtra.ParamByName('NotifyLine3').AsString:=qryFetchHdrInfo.FieldByName('NotifyLine3').AsString;
    qryInsertInvHdrExtra.ParamByName('TarriffWide').AsString:=qryFetchHdrInfo.FieldByName('TarriffWide').AsString;
    qryInsertInvHdrExtra.ParamByName('TarriffNarrow').AsString:=qryFetchHdrInfo.FieldByName('TarriffNarrow').AsString;
    qryInsertInvHdrExtra.ParamByName('SpecialInfo').AsString:=qryFetchHdrInfo.FieldByName('SpecialInfo').AsString;
  end;

  if (qryDespHdrLOCALOVERSEAS.AsString='L') and
     (qryDespHdrDESPNO.AsInteger>=4524) then //insert local extra (address, etc) data
  begin
    //invoices before number 4524 do not have additional info, so
    //this information has been ignored.
    qryInsertInvHdrExtra.Close;
    qryInsertInvHdrExtra.ParamByName('DespNo').AsInteger:=qryFetchHdrInfo.FieldByName('DespNo').AsInteger;
    qryInsertInvHdrExtra.ParamByName('InvNo').AsInteger:=1;
    qryInsertInvHdrExtra.ParamByName('StreetAdd1').AsString:=qryFetchHdrInfo.FieldByName('StreetAdd1').AsString;
    qryInsertInvHdrExtra.ParamByName('StreetAdd2').AsString:=qryFetchHdrInfo.FieldByName('StreetAdd2').AsString;
    qryInsertInvHdrExtra.ParamByName('StreetAdd3').AsString:=qryFetchHdrInfo.FieldByName('StreetAdd3').AsString;
    qryInsertInvHdrExtra.ParamByName('StreetAdd4').AsString:=qryFetchHdrInfo.FieldByName('StreetAdd4').AsString;
    qryInsertInvHdrExtra.ParamByName('StreetAdd5').AsString:=qryFetchHdrInfo.FieldByName('StreetAdd5').AsString;
    qryInsertInvHdrExtra.ParamByName('PostalAdd1').AsString:=qryFetchHdrInfo.FieldByName('PostalAdd1').AsString;
    qryInsertInvHdrExtra.ParamByName('PostalAdd2').AsString:=qryFetchHdrInfo.FieldByName('PostalAdd2').AsString;
    qryInsertInvHdrExtra.ParamByName('PostalAdd3').AsString:=qryFetchHdrInfo.FieldByName('PostalAdd3').AsString;
    qryInsertInvHdrExtra.ParamByName('PostalAdd4').AsString:=qryFetchHdrInfo.FieldByName('PostalAdd4').AsString;
    qryInsertInvHdrExtra.ParamByName('PostalAdd5').AsString:=qryFetchHdrInfo.FieldByName('PostalAdd5').AsString;
    qryInsertInvHdrExtra.ParamByName('PlaceLoad').AsString:=qryFetchHdrInfo.FieldByName('PlaceLoad').AsString;
    qryInsertInvHdrExtra.ParamByName('PlaceDischarge').Clear;
    qryInsertInvHdrExtra.ParamByName('IncoTerms').Clear;
    qryInsertInvHdrExtra.ParamByName('PlaceDestLine1').Clear;
    qryInsertInvHdrExtra.ParamByName('PlaceDestLine2').Clear;
    qryInsertInvHdrExtra.ParamByName('CarriageByLine1').Clear;
    qryInsertInvHdrExtra.ParamByName('CarriageByLine2').Clear;
    qryInsertInvHdrExtra.ParamByName('TermsLine1').Clear;
    qryInsertInvHdrExtra.ParamByName('TermsLine2').Clear;
    qryInsertInvHdrExtra.ParamByName('NotifyLine1').Clear;
    qryInsertInvHdrExtra.ParamByName('NotifyLine2').Clear;
    qryInsertInvHdrExtra.ParamByName('NotifyLine3').Clear;
    qryInsertInvHdrExtra.ParamByName('TarriffWide').Clear;
    qryInsertInvHdrExtra.ParamByName('TarriffNarrow').Clear;
    qryInsertInvHdrExtra.ParamByName('SpecialInfo').AsString:=qryFetchHdrInfo.FieldByName('SpecialInfo').AsString;
  end;

  //fill in the details
  //include the relevant updates for the header  qryInsertInvHdr.ParamByName('YourRef').AsString:='to be built';
  if qryDespHdrLOCALOVERSEAS.AsString='V' then
  begin
    //fill in overseas invoice details, and do the totals for the summary
    //assume that the prices are checked by now
    LineNo:=1;
    qryOverseasDet.Close;
    qryOverseasDet.ParamByName('DespNo').AsInteger:=qryDespHdr.FieldByName('DespNo').AsInteger;
    qryOverseasDet.ParamByName('PriceType').AsString:=cbxPriceType.Text;
    qryOverseasDet.Open;
    YourRef:='O/NO''s';
    while not qryOverseasDet.EOF do
    begin
      //make sure that order number doesn't already exist in YourRef
      if Pos(qryOverseasDet.FieldByName('CustOrdNo').AsString,YourRef)=0 then
        YourRef:=YourRef+' '+qryOverseasDet.FieldByName('CustOrdNo').AsString;
      qryInsertInvDet.ParamByName('DespNo').AsInteger:=qryDespHdr.FieldByName('DespNo').AsInteger;
      qryInsertInvDet.ParamByName('InvNo').AsInteger:=1;
      qryInsertInvDet.ParamByName('LineNo').AsInteger:=LineNo;
      qryInsertInvDet.ParamByName('VBStru').AsString:=qryOverseasDet.FieldByName('VBStru').AsString;
      qryInsertInvDet.ParamByName('VBFin').AsString:=qryOverseasDet.FieldByName('VBFin').AsString;
      qryInsertInvDet.ParamByName('MetricWidth').AsInteger:=qryOverseasDet.FieldByName('MetricWidth').AsInteger;
      qryInsertInvDet.ParamByName('ImperialWidth').AsFloat:=qryOverseasDet.FieldByName('ImperialWidth').AsFloat;
      qryInsertInvDet.ParamByName('Qlty').AsString:=qryOverseasDet.FieldByName('Qlty').AsString;
      qryInsertInvDet.ParamByName('VBStruDescr').AsString:=qryOverseasDet.FieldByName('VBStruDescr').AsString;
      qryInsertInvDet.ParamByName('LabelDescr').AsString:=qryOverseasDet.FieldByName('LabelDescr').AsString;
      qryInsertInvDet.ParamByName('CustPartStyleDescr').AsString:=qryOverseasDet.FieldByName('StyleDescr').AsString;
      qryInsertInvDet.ParamByName('CustPartDescr').AsString:=qryOverseasDet.FieldByName('ColourDescr').AsString;
      qryInsertInvDet.ParamByName('VTOrdNo').AsInteger:=qryOverseasDet.FieldByName('VTOrdNo').AsInteger;
      qryInsertInvDet.ParamByName('CustOrdNo').AsString:=qryOverseasDet.FieldByName('CustOrdNo').AsString;
      qryInsertInvDet.ParamByName('GrossLengthMetres').AsFloat:=
        DLRound(qryOverseasDet.FieldByName('GrossLength').AsFloat,10);
      qryInsertInvDet.ParamByName('NetLengthMetres').AsFloat:=
        DLRound(qryOverseasDet.FieldByName('NetLength').AsFloat,10);
      NetLengthYards:=DLRound(qryOverseasDet.FieldByName('NetLength').AsFloat*1.0936,10);
      qryInsertInvDet.ParamByName('NetLengthYards').AsFloat:=NetLengthYards;
      qryInsertInvDet.ParamByName('PriceType').AsString:=cbxPriceType.Text;
      qryInsertInvDet.ParamByName('Loc_Price').AsFloat:=qryOverseasDet.FieldByName('Price').AsFloat;
      qryInsertInvDet.ParamByName('Override_Loc_Price').AsFloat:=qryOverseasDet.FieldByName('Price').AsFloat;
      if qryFetchHdrInfo.FieldByName('MetricOrImperial').AsString='M' then
        Loc_Value:=
          DLRound(qryOverseasDet.FieldByName('NetLength').AsFloat*
          qryOverseasDet.FieldByName('Price').AsFloat,100)
      else //imperial -> prices per yards
        Loc_Value:=
          DLRound(NetLengthYards*
          qryOverseasDet.FieldByName('Price').AsFloat,100);
      qryInsertInvDet.ParamByName('Loc_Value').AsFloat:=Loc_Value;
      qryInsertInvDet.ParamByName('Boxes').AsInteger:=qryOverseasDet.FieldByName('Boxes').AsInteger;
      qryInsertInvDet.ParamByName('Loc_Freight').AsFloat:=0; //not reqd for overseas because incl in price

      //added DL060301: need extra itemno field from order detail table
      qryGetItemNo.Close;
      qryGetItemNo.ParamByName('VTOrdNo').AsInteger:=qryOverseasDet.FieldByName('VTOrdNo').AsInteger;
      qryGetItemNo.ParamByName('VBSTRU').AsString:=qryOverseasDet.FieldByName('VBStru').AsString;
      qryGetItemNo.ParamByName('VBCOL').AsString:=qryOverseasDet.FieldByName('VBCol').AsString; //VBCol lookup added DL060301
      qryGetItemNo.ParamByName('VBFIN').AsString:=qryOverseasDet.FieldByName('VBFin').AsString;
      qryGetItemNo.ParamByName('VBWIDTH').AsInteger:=qryOverseasDet.FieldByName('MetricWidth').AsInteger;
      qryGetItemNo.ParamByName('DATERQD').AsDateTime:=qryOverseasDet.FieldByName('DateRqd').AsDateTime; //DateRqd lookup added DL060301
      qryGetItemNo.Open;
      if not qryGetItemNoITEMNO.IsNull then
        qryInsertInvDet.ParamByName('ItemNo').AsInteger:=qryGetItemNo.FieldByName('ItemNo').AsInteger
      else
        qryInsertInvDet.ParamByName('ItemNo').Clear;

      qryInsertInvDet.ExecSQL;
      Loc_Total:=Loc_Total+Loc_Value;
      //FreightBoxesTotal:=FreightBoxesTotal+;
      LineNo:=LineNo+1;
      qryOverseasDet.Next;
    end;
    qryInsertInvHdr.ParamByName('YourRef').AsString:=copy(YourRef,1,40);
    qryInsertInvHdr.ParamByName('FreightDocumentation').AsFloat:=0;
    qryInsertInvHdr.ParamByName('FreightBoxes').AsFloat:=0;
    qryInsertInvHdr.ParamByName('Loc_Total').AsFloat:=Loc_Total;
    qryInsertInvHdr.ParamByName('Acc_Total').AsFloat:=
      DLRound(Loc_Total*qryFetchHdrInfo.FieldByName('ExchRate').AsFloat,100);
    qryInsertInvHdr.ParamByName('Loc_Grand_Total').AsFloat:=Loc_Total;
    qryInsertInvHdr.ParamByName('Acc_Grand_Total').AsFloat:=
      DLRound(Loc_Total*qryFetchHdrInfo.FieldByName('ExchRate').AsFloat,100);
    qryInsertInvHdr.ParamByName('VATAmt').AsFloat:=0;
  end
  else
  begin
    //fill in local invoice details, and do the totals for the summary
    //assume that the prices are checked by now
    //local invoices are always in metres
    LineNo:=1;
    qryLocalDet.Close;
    qryLocalDet.ParamByName('DespNo').AsInteger:=qryDespHdr.FieldByName('DespNo').AsInteger;
    qryLocalDet.Open;
    YourRef:='';
    while not qryLocalDet.EOF do
    begin
      if FreightDocumentation=0 then
        FreightDocumentation:=qryLocalDet.FieldByName('FreightPerDespatch').AsFloat;
      //YourRef:= there is no yourref in local
      qryInsertInvDet.ParamByName('DespNo').AsInteger:=qryDespHdr.FieldByName('DespNo').AsInteger;
      qryInsertInvDet.ParamByName('InvNo').AsInteger:=1;
      qryInsertInvDet.ParamByName('LineNo').AsInteger:=LineNo;
      qryInsertInvDet.ParamByName('VBStru').AsString:=qryLocalDet.FieldByName('VBStru').AsString;
      qryInsertInvDet.ParamByName('VBFin').AsString:=qryLocalDet.FieldByName('VBFin').AsString;
      qryInsertInvDet.ParamByName('MetricWidth').AsInteger:=qryLocalDet.FieldByName('MetricWidth').AsInteger;
      qryInsertInvDet.ParamByName('ImperialWidth').AsFloat:=qryLocalDet.FieldByName('ImperialWidth').AsFloat;
      qryInsertInvDet.ParamByName('Qlty').AsString:=qryLocalDet.FieldByName('Qlty').AsString;
      qryInsertInvDet.ParamByName('VBStruDescr').AsString:=qryLocalDet.FieldByName('VBStruDescr').AsString;
      qryInsertInvDet.ParamByName('LabelDescr').AsString:=qryLocalDet.FieldByName('LabelDescr').AsString;
      qryInsertInvDet.ParamByName('CustPartStyleDescr').AsString:=qryLocalDet.FieldByName('StyleDescr').AsString;
      qryInsertInvDet.ParamByName('CustPartDescr').AsString:=qryLocalDet.FieldByName('ColourDescr').AsString;
      qryInsertInvDet.ParamByName('VTOrdNo').AsInteger:=qryLocalDet.FieldByName('VTOrdNo').AsInteger;
      qryInsertInvDet.ParamByName('CustOrdNo').AsString:=qryLocalDet.FieldByName('CustOrdNo').AsString;
      qryInsertInvDet.ParamByName('GrossLengthMetres').AsFloat:=
        DLRound(qryLocalDet.FieldByName('GrossLength').AsFloat,10);
      qryInsertInvDet.ParamByName('NetLengthMetres').AsFloat:=
        DLRound(qryLocalDet.FieldByName('NetLength').AsFloat,10);
      qryInsertInvDet.ParamByName('NetLengthYards').AsFloat:=0;
      qryInsertInvDet.ParamByName('PriceType').AsString:=qryLocalDet.FieldByName('PriceType').AsString;
      qryInsertInvDet.ParamByName('Loc_Price').AsFloat:=qryLocalDet.FieldByName('Price').AsFloat;
      qryInsertInvDet.ParamByName('Override_Loc_Price').AsFloat:=qryLocalDet.FieldByName('Price').AsFloat;
      Loc_Value:=
        DLRound(qryLocalDet.FieldByName('NetLength').AsFloat*
        qryLocalDet.FieldByName('Price').AsFloat,100);
      qryInsertInvDet.ParamByName('Loc_Value').AsFloat:=Loc_Value;
      qryInsertInvDet.ParamByName('Boxes').AsInteger:=qryLocalDet.FieldByName('Boxes').AsInteger;
      {Loc_Freight:= - actual in ReportSmith depends on length of an average piece as well
        DLRound((qryLocalDet.FieldByName('Boxes').AsInteger*
        qryLocalDet.FieldByName('FreightPerBox').AsFloat)+
        (qryLocalDet.FieldByName('FreightPerMetre').AsFloat*
        qryLocalDet.FieldByName('GrossLength').AsFloat),100);}
      Loc_Freight:= //modified DL030203
        DLRound(
         ((qryLocalDet.FieldByName('Boxes').AsInteger*
           qryLocalDet.FieldByName('FreightPerBox').AsFloat*
           qryLocalDet.FieldByName('GrossLength').AsFloat)
           /
          (qryLocalDet.FieldByName('PceFinLength').AsInteger*3*
           qryLocalDet.FieldByName('Boxes').AsInteger)
         )+
         (qryLocalDet.FieldByName('FreightPerMetre').AsFloat*
          qryLocalDet.FieldByName('GrossLength').AsFloat),100
               );
      qryInsertInvDet.ParamByName('Loc_Freight').AsFloat:=Loc_Freight;

      //added DL060301: need extra itemno field from order detail table
      qryGetItemNo.Close;
      qryGetItemNo.ParamByName('VTOrdNo').AsInteger:=qryLocalDet.FieldByName('VTOrdNo').AsInteger;
      qryGetItemNo.ParamByName('VBSTRU').AsString:=qryLocalDet.FieldByName('VBStru').AsString;
      qryGetItemNo.ParamByName('VBCOL').AsString:=qryLocalDet.FieldByName('VBCol').AsString; //VBCol lookup added DL060301
      qryGetItemNo.ParamByName('VBFIN').AsString:=qryLocalDet.FieldByName('VBFin').AsString;
      qryGetItemNo.ParamByName('VBWIDTH').AsInteger:=qryLocalDet.FieldByName('MetricWidth').AsInteger;
      qryGetItemNo.ParamByName('DATERQD').AsDateTime:=qryLocalDet.FieldByName('DateRqd').AsDateTime; //DateRqd lookup added DL060301
      qryGetItemNo.Open;
      if not qryGetItemNoITEMNO.IsNull then
        qryInsertInvDet.ParamByName('ItemNo').AsInteger:=qryLocalDet.FieldByName('ItemNo').AsInteger
      else
        qryInsertInvDet.ParamByName('ItemNo').Clear;

      qryInsertInvDet.ExecSQL;
      Loc_Total:=Loc_Total+Loc_Value;
      FreightBoxesTotal:=FreightBoxesTotal+Loc_Freight;
      LineNo:=LineNo+1;
      qryLocalDet.Next;
    end;
    //create local totals in invhdr record
    qryInsertInvHdr.ParamByName('PalletValue').AsFloat:=PalletValue;
    qryInsertInvHdr.ParamByName('FreightDocumentation').AsFloat:=FreightDocumentation;
    qryInsertInvHdr.ParamByName('FreightBoxes').AsFloat:=FreightBoxesTotal;
    qryInsertInvHdr.ParamByName('Loc_Total').AsFloat:=Loc_Total;
    qryInsertInvHdr.ParamByName('Acc_Total').AsFloat:=Loc_Total;
    qryInsertInvHdr.ParamByName('OverrideFreight').AsFloat:=0; //added DL030204
    qryInsertInvHdr.ParamByName('Acc_TotalBeforeFreight').AsFloat:=Loc_Total; //added DL030204
    TotalInclFreight:=Loc_Total+
      PalletValue+FreightBoxesTotal+FreightDocumentation; //added DL030204
    qryInsertInvHdr.ParamByName('Acc_TotalInclFreight').AsFloat:=TotalInclFreight;
    VATAmt:=DLRound((TotalInclFreight)*0.14,100);
    qryInsertInvHdr.ParamByName('VATAmt').AsFloat:=VATAmt;
    qryInsertInvHdr.ParamByName('Loc_Grand_Total').AsFloat:=
      Loc_Total+PalletValue+FreightBoxesTotal+FreightDocumentation+VATAmt;
    qryInsertInvHdr.ParamByName('Acc_Grand_Total').AsFloat:=
      Loc_Total+PalletValue+FreightBoxesTotal+FreightDocumentation+VATAmt;
  end;
  //May need to move this if there is a referential integrity problem
  qryInsertInvHdr.ExecSQL; //move this and extra insert to after detail inserts
  //if (qryDespHdrLOCALOVERSEAS.AsString='V') and - removed as generated for
  //local and overseas invoices: DL030204
  if (qryDespHdrDESPNO.AsInteger>=4524) then //insert overseas extra data
    qryInsertInvHdrExtra.ExecSQL;
  MainForm.Database.Commit;
  tabVBInvHdr.Open;
  Screen.Cursor:=crDefault;
end;

procedure TfrmGenInvoice.datDespHdrDataChange(Sender: TObject;
  Field: TField);
begin
  cbxPriceType.Text:='';
  if qryDespHdrLOCALOVERSEAS.AsString='V' then //overseas
  begin
    cbxPriceType.Color:=clWindow;
    cbxPriceType.Enabled:=true;
  end
  else //local
  begin
    cbxPriceType.Color:=clSilver;
    cbxPriceType.Enabled:=false;
  end;
end;

procedure TfrmGenInvoice.btnDeleteClick(Sender: TObject);
begin
  if tabVBInvHdr.BOF=tabVBInvHdr.EOF then
    raise Exception.Create('No invoice to delete.');
  if tabVBInvHdrINVSENT.AsString='Y' then
    raise Exception.Create('Cannot delete sent invoice');
  if MessageDlg('Delete current invoice?',
      mtConfirmation,mbOKCancel,0) <> mrOK then
    Abort;
  //do the delete
  MainForm.Database.StartTransaction;
  qryDeleteInvDet.Close;
  qryDeleteInvDet.ParamByName('DespNo').AsInteger:=tabVBInvHdrDESPNO.AsInteger;
  qryDeleteInvDet.ParamByName('InvNo').AsInteger:=tabVBInvHdrINVNO.AsInteger;
  qryDeleteInvDet.ExecSQL;
  qryDeleteInvHdrExtra.Close;
  qryDeleteInvHdrExtra.ParamByName('DespNo').AsInteger:=tabVBInvHdrDESPNO.AsInteger;
  qryDeleteInvHdrExtra.ParamByName('InvNo').AsInteger:=tabVBInvHdrINVNO.AsInteger;
  qryDeleteInvHdrExtra.ExecSQL;
  qryDeleteInvHdr.Close;
  qryDeleteInvHdr.ParamByName('DespNo').AsInteger:=tabVBInvHdrDESPNO.AsInteger;
  qryDeleteInvHdr.ParamByName('InvNo').AsInteger:=tabVBInvHdrINVNO.AsInteger;
  qryDeleteInvHdr.ExecSQL;
  MainForm.Database.Commit;
  tabVBInvHdr.Refresh;
end;

procedure TfrmGenInvoice.btnFindDespatchClick(Sender: TObject);
begin
  //replaced ODFind with this DL030203
  if tabVBInvHdr.State=dsEdit then
    raise Exception.Create('Cannot search whilst in Edit Mode');
  if VBPickDlgForm.ShowModalVBDesp = mrOk then
  begin
    tabVBInvHdr.Close;
    qryDespHdr.Close;
    //RedisplayOK:=false;
    //DisplayDetBitBtn.Caption:='Display Details';
    //DisplayDetBitBtn.Enabled:=true;
    qryDespHdr.ParamByName('DespNo').AsInteger:=VBPickDlgForm.VBDespHdrDespNo;
    qryDespHdr.Open;
    tabVBInvHdr.Open;
  end;
  Screen.Cursor:=crDefault;
end; // btnFindDespatchClick

end.
