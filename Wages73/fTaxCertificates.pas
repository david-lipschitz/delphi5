{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Orbital Decisions

System          : Wages
Module          : fTaxCertificates.pas and fTaxCertificates.dfm
Description     : Create the Tax Certificate File required for importing into EasyFile

Version	 Date		Author	      Actions
----------------------------------------------------------------------------
1.0.0.0	 31/07/2008	D. Lipschitz  Creation

//remember to set screen centre when complete.
}

unit fTaxCertificates;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Db, DBTables, ExtCtrls, ODPopCal, ComCtrls; //, StrUtils;

type
  TfrmTaxCertificates = class(TForm)
    Label1: TLabel;
    cbxTaxYear: TComboBox;
    Label2: TLabel;
    edtExportFilePath: TEdit;
    btnCreateCertificates: TButton;
    btnClose: TBitBtn;
    qryGetTaxYears: TQuery;
    qryGetTaxYearsTAXYR: TIntegerField;
    qryEmployeePay: TQuery;
    qryGetEmployeeData: TQuery;
    odpTaxYearDates: TODPopupCalendar;
    Label3: TLabel;
    qryGetEmployeeDataCLKNO: TIntegerField;
    qryGetEmployeeDataSURNAME: TStringField;
    qryGetEmployeeDataFIRSTNAME: TStringField;
    qryGetEmployeeDataSTREET: TStringField;
    qryGetEmployeeDataSUBURB: TStringField;
    qryGetEmployeeDataPOSTCODE: TStringField;
    qryGetEmployeeDataRENTACNO: TStringField;
    qryGetEmployeeDataRENTMONTH: TFloatField;
    qryGetEmployeeDataSAVEACNO: TStringField;
    qryGetEmployeeDataSTARTDATE: TDateTimeField;
    qryGetEmployeeDataBIRTHDATE: TDateTimeField;
    qryGetEmployeeDataPAYRATESETDATE: TDateTimeField;
    qryGetEmployeeDataHUSBANDNAME: TStringField;
    qryGetEmployeeDataMSTATUS: TStringField;
    qryGetEmployeeDataNOOFCHILD: TIntegerField;
    qryGetEmployeeDataOCCUPATION: TStringField;
    qryGetEmployeeDataIDNO: TStringField;
    qryGetEmployeeDataUIF: TStringField;
    qryGetEmployeeDataPROVFUNDFLAG: TStringField;
    qryGetEmployeeDataOTHER1FLAG: TStringField;
    qryGetEmployeeDataSICKFUNDFLAG: TStringField;
    qryGetEmployeeDataHRPAYRATE: TFloatField;
    qryGetEmployeeDataATTBONUSWK: TFloatField;
    qryGetEmployeeDataSAVEWK: TFloatField;
    qryGetEmployeeDataREPAYLNWK: TFloatField;
    qryGetEmployeeDataINSURANCE: TFloatField;
    qryGetEmployeeDataSAVEAC: TFloatField;
    qryGetEmployeeDataTAXEARN: TFloatField;
    qryGetEmployeeDataPENSION: TFloatField;
    qryGetEmployeeDataSICKFD: TFloatField;
    qryGetEmployeeDataPROVFD: TFloatField;
    qryGetEmployeeDataUIFPAY: TFloatField;
    qryGetEmployeeDataPAYE: TFloatField;
    qryGetEmployeeDataGROSSPAY: TFloatField;
    qryGetEmployeeDataWKSPAY: TFloatField;
    qryGetEmployeeDataRENTAC: TFloatField;
    qryGetEmployeeDataLOANAC: TFloatField;
    qryGetEmployeeDataFULLWK: TIntegerField;
    qryGetEmployeeDataPARTWK: TIntegerField;
    qryGetEmployeeDataLEAVEDAY: TIntegerField;
    qryGetEmployeeDataSICKDAY: TIntegerField;
    qryGetEmployeeDataTAXWEEK: TIntegerField;
    qryGetEmployeeDataDISCHARGEDATE: TDateTimeField;
    qryGetEmployeeDataBANKREF: TStringField;
    qryGetEmployeeDataBANKSORTCODE: TStringField;
    qryGetEmployeeDataBANKACCREF: TStringField;
    qryGetEmployeeDataBANKACCTYPE: TStringField;
    qryGetEmployeeDataDEPREF: TStringField;
    qryGetEmployeeDataABLOANACCNO: TStringField;
    qryGetEmployeeDataABLOANSTARTVALUE: TFloatField;
    qryGetEmployeeDataABLOANAC: TFloatField;
    qryGetEmployeeDataABREPAYLNMONTH: TFloatField;
    qryGetEmployeeDataABREPAYTERM: TIntegerField;
    qryGetEmployeeDataABREPAYFROMYEAR: TIntegerField;
    qryGetEmployeeDataABREPAYFROMMONTH: TIntegerField;
    qryGetEmployeeDataABLOANACTIVE: TStringField;
    qryGetEmployeeDataPFLOANACCNO: TStringField;
    qryGetEmployeeDataPFLOANSTARTVALUE: TFloatField;
    qryGetEmployeeDataPFLOANAC: TFloatField;
    qryGetEmployeeDataPFREPAYLNMONTH: TFloatField;
    qryGetEmployeeDataPFREPAYTERM: TIntegerField;
    qryGetEmployeeDataPFREPAYFROMYEAR: TIntegerField;
    qryGetEmployeeDataPFREPAYFROMMONTH: TIntegerField;
    qryGetEmployeeDataPFLOANACTIVE: TStringField;
    qryGetEmployeeDataLAWYERMONTH: TFloatField;
    qryGetEmployeeDataBANKFEES: TFloatField;
    qryGetEmployeeDataINSURANCEWM: TStringField;
    qryGetEmployeeDataLAWYERWM: TStringField;
    qryGetEmployeeDataGRADECODE: TStringField;
    qryGetEmployeeDataGRADESETDATE: TDateTimeField;
    qryEmployeePayCLKNO: TIntegerField;
    qryEmployeePayTAXDEDUCT: TFloatField;
    qryEmployeePayTAXEARNINGS: TFloatField;
    qryGetWeeksWorked: TQuery;
    qryGetWeeksWorkedWEEKSWORKED: TFloatField;
    qryEmployeePayPROVFUNDDEDUCT: TFloatField;
    qryEmployeePaySICKFUNDDEDUCT: TFloatField;
    qryGetHolidayPay: TQuery;
    qryGetHolidayPayPROVFUNDDEDUCT: TFloatField;
    qryGetHolidayPayTAXDEDUCT: TFloatField;
    qryGetHolidayPayTOTALTAXEARNINGS: TFloatField;
    qryGetHolidayPaySICKFUNDDEDUCT: TFloatField;
    qryGetHolidayPayBONUS: TFloatField;
    qryGetHolidayPayHOLIDAYWEEKS: TIntegerField;
    StatusBar: TStatusBar;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCreateCertificatesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fDiskFileName:string;
    fDiskFile:TextFile;
  public
    { Public declarations }
  end;

var
  frmTaxCertificates: TfrmTaxCertificates;

implementation

{$R *.DFM}

procedure TfrmTaxCertificates.btnCloseClick(Sender: TObject);
begin
  Close;
end; //btnCloseClick

procedure TfrmTaxCertificates.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end; //FormClose

procedure TfrmTaxCertificates.FormShow(Sender: TObject);
var
  ix:integer;
begin
  cbxTaxYear.Items.Clear;
  qryGetTaxYears.Close;
  qryGetTaxYears.Open;
  ix:=0;
  while not qryGetTaxYears.eof do
  begin
    cbxTaxYear.Items.Add(qryGetTaxYearsTAXYR.AsString);
    inc(ix);
    qryGetTaxYears.Next;
  end;
  qryGetTaxYears.Close;
  if ix>3 then
    cbxTaxYear.ItemIndex:=ix-3; //we want the third last one and the list starts at zero.
  //xx set the tax year dates dynamically, but for now set manually
  odpTaxYearDates.StartDate:=encodedate(2007,3,1);
  odpTaxYearDates.FinishDate:=encodedate(2008,2,29);
  edtExportFilePath.Text:='c:\';
  edtExportFilePath.Enabled:=false;
end; //FormShow

procedure TfrmTaxCertificates.btnCreateCertificatesClick(Sender: TObject);
type
  //stringarray = packed array[1..500] of char;
  stringtype = ansistring; //string[250];
var
  lTotalRecordCount:integer;
  lEmployerRecordCount:integer;
  lHashTotal:integer;
  lValueTotal:real;
  st:stringtype; //st = string
  lCertificateNumber:integer; //last number used will need to be stored in the database.

  {procedure SetDateField(var astring180:string;adate:TDateTime);
  begin
    //set a date field (format ccyymmdd)
    //insert(formatdatetime('yyyymmdd',adate),astring,
    //astring:=stuffstring(astring,astartposn,alength,formatdatetime('yyyymmdd',adate));
    //StuffString(const AText: string; AStart, ALength: Cardinal; const ASubText: string): string;
  end; //SetDateField}

  procedure CreateTextFile;
  begin
    fDiskFileName:=edtExportFilePath.Text + 'IRP5.08';
    AssignFile(fDiskFile, fDiskFileName);
    ReWrite(fDiskFile);
  end; //CreateTextFile

  procedure CreateHeader;
  begin
    //see if it's necessary to register as an organisation for Orbital Decisions.
    st:='1010,"ORBITAL DECISIONS CC",1020,7360730693,1030,"DAVID LIPSCHITZ",1040,"(021) 551-9935"';
    st:=st+',1060,"PO BOX 1080",1070,"MILNERTON",1100,7435,1110,'+formatdatetime('yyyymmdd',date);
    st:=st+',1120,0001,1130,"TEST",9999'; //or "TEST" or "LIVE"
    //inc(lRecordCount); -this isn't included in the recordcount
    inc(lTotalRecordCount);
    WriteLn(fDiskFile, st);
  end; //CreateHeader

  procedure CreateEmployerHeader;
  begin
    st:='2010,"VREDE TEXTILES (PTY) LTD",2020,7190704249,2030,'+cbxTaxYear.Text; //get Vrede PAYE number
    st:=st+',2040,"PO BOX 1421",2050,"DASSENBERG",2080,7350,9999';
    inc(lEmployerRecordCount);
    inc(lTotalRecordCount);
    lHashTotal:=2010+2020+2030+2040+2050+2080+9999; //lHashTotal starts here.
    WriteLn(fDiskFile, st);
    //Writeln(fDiskFile, inttostr(lHashTotal));
  end; //CreateEmployerHeader

  procedure CreateEmployeesCertificates;
  var
    lTempFromDate:TDateTime;
    lTotalTaxEarnings:real;
    function GetFirstTwoNames(aName:string):string;
    var
      ix:integer;
      //lSpaceFound:boolean;
      lNamesFound:integer;
    begin
      //get the first two names of an employee
      Result:='';
      //lSpaceFound:=false;
      lNamesFound:=0;
      for ix:=1 to length(aName) do
      begin
        Result:=Result+aName[ix];
        if aName[ix]=' ' then
          inc(lNamesFound);
        if lNamesFound>2 then
          break;
      end;
    end; //FirstTwoNames
    function GetInitials(aName:string):string;
    var
      ix:integer;
      lSpaceFound:boolean;
    begin
      //get the initials of an employee
      Result:='';
      lSpaceFound:=false;
      for ix:=1 to length(aName) do
      begin
        if ix=1 then
          Result:=aName[ix]; //the first initial
        if lSpaceFound then //this happens on the letter after the space
        begin
          Result:=Result+aName[ix];
          lSpaceFound:=false;
        end;
        if aName[ix]=' ' then
          lSpaceFound:=true;
      end;
    end; //GetInitials
    function SetNumberField(var anumber:integer;alength:integer):string;
    begin
      //set a number field (left pad with zeros)
      Result:=copy(StringOfChar('0',alength),1,(alength-length(inttostr(anumber))))+inttostr(anumber);
    end; //SetNumberFieldS
  begin //CreateEmployeesCertificates
    //if an employee was employed during a year, but not paid, do they need an EMP5?
    //fetch the payslip data.
    //fetch the employee data.
    //create the record.
//lHashTotal:=0; //while testing
    qryEmployeePay.Close;
    qryEmployeePay.ParamByName('FromWeek').AsDateTime:=odpTaxYearDates.StartDate;
    qryEmployeePay.ParamByName('ToWeek').AsDateTime:=odpTaxYearDates.FinishDate;
    qryEmployeePay.Open;
    while not qryEmployeePay.eof do
    begin
      StatusBar.SimpleText:='Processing ClkNo '+qryEmployeePayCLKNO.AsString;
      Application.ProcessMessages;
      qryGetEmployeeData.Close;
      qryGetEmployeeData.ParamByName('ClkNo').AsInteger:=qryEmployeePayCLKNO.AsInteger;
      qryGetEmployeeData.Open;
      if qryGetEmployeeDataCLKNO.IsNull then
      begin
        //should never happen because of the way the query is structured.
        ShowMessage('Potential problem with '+qryGetEmployeeDataCLKNO.AsString+'. Please tell David');
        break;
      end;
      //get holiday pay and add it to annual pay.
      qryGetHolidayPay.Close;
      qryGetHolidayPay.ParamByName('FromWeek').AsDateTime:=odpTaxYearDates.StartDate;
      qryGetHolidayPay.ParamByName('ToWeek').AsDateTime:=odpTaxYearDates.FinishDate;
      qryGetHolidayPay.ParamByName('ClkNo').AsInteger:=qryEmployeePayCLKNO.AsInteger;
      qryGetHolidayPay.Open;

      inc(lCertificateNumber);
      st:='3010,"'+SetNumberField(lCertificateNumber,8)+'"';
      if length(qryGetEmployeeDataIDNO.AsString)=13 then
      begin
        //employee with ID Number: 3010 then certificate number
        st:=st+',3020,"A",3030,"'+uppercase(qryGetEmployeeDataSURNAME.AsString)+'"';
        st:=st+',3040,"'+uppercase(GetFirstTwoNames(qryGetEmployeeDataFIRSTNAME.AsString))+'"';
        st:=st+',3050,"'+uppercase(GetInitials(qryGetEmployeeDataFIRSTNAME.AsString))+'"';
        st:=st+',3060,'+qryGetEmployeeDataIDNO.AsString+',';
        lHashTotal:=lHashTotal+3010+3020+3030+3040+3050+3060;
      end
      else
      begin
        //employee without ID Number
        st:=st+',3020,"B",3030,"'+uppercase(qryGetEmployeeDataSURNAME.AsString)+'"';
        st:=st+',3040,"'+uppercase(GetFirstTwoNames(qryGetEmployeeDataFIRSTNAME.AsString))+'"';
        st:=st+',3050,"'+uppercase(GetInitials(qryGetEmployeeDataFIRSTNAME.AsString))+'",';
        //st:=st+',3060,'+qryGetEmployeeDataIDNO.AsString; - no 3060!
        lHashTotal:=lHashTotal+3010+3020+3030+3040+3050;
      end;
      //WriteLn(fDiskFile, st);
      st:=st+'3080,'+formatdatetime('yyyymmdd',qryGetEmployeeDataBIRTHDATE.AsDateTime);
      //do any wage earning employees have income tax reference numbers? code 3100
      st:=st+',3110,"'+uppercase(qryGetEmployeeDataSTREET.AsString)+'"';
      st:=st+',3120,"'+uppercase(qryGetEmployeeDataSUBURB.AsString)+'"';
      st:=st+',3150,'+qryGetEmployeeDataPOSTCODE.AsString;
      st:=st+',3160,"'+qryGetEmployeeDataCLKNO.AsString+'"';
      //period employed from - first date
      if qryGetEmployeeDataSTARTDATE.AsDateTime>odpTaxYearDates.StartDate then
        st:=st+',3170,'+formatdatetime('yyyymmdd',qryGetEmployeeDataSTARTDATE.AsDateTime)
      else
        st:=st+',3170,'+formatdatetime('yyyymmdd',odpTaxYearDates.StartDate);
      //period employed to - last date
      if qryGetEmployeeDataDISCHARGEDATE.IsNull or
         (qryGetEmployeeDataDISCHARGEDATE.AsDateTime>odpTaxYearDates.FinishDate) then
        st:=st+',3180,'+formatdatetime('yyyymmdd',odpTaxYearDates.FinishDate)+','
      else
        st:=st+',3180,'+formatdatetime('yyyymmdd',qryGetEmployeeDataDISCHARGEDATE.AsDateTime)+',';
      //WriteLn(fDiskFile, st);
      lHashTotal:=lHashTotal+3080+3110+3120+3150+3160+3170+3180;
      //get total pay periods in the year: probably needs to be stored in a table as I have
      //  been changing it each year, ie 52 (in 2008 tax year) or 53.
      //  Also need number of weeks worked, ie 49 in 2008 tax year
      //  and number of weeks holidays, ie 3 weeks in 2008 tax year
      //  and start date of holidays and end date of holidays because if
      //  and employee worked over the holidays we must add 3 to his weeks worked
      //  New employees are taken on on 1 year contracts, but still get holiday pay, therefore, assume that
      //  if an employee started after 1/7 in the tax year, we don't add the 3 weeks.
      //  Check with Susan.
      //  Or perhaps if weeksworked>26
      {select count(distinct thisweek)
      from paysliphist
      where thisweek>='1-mar-2007' and thisweek<='29-feb-2008';
      select ph.clkno,sum(ph.fullweek+ph.partweek) weeksworked,em.startdate
      from paysliphist ph, employee em
      where ph.thisweek>='1-mar-2007' and ph.thisweek<='29-feb-2008'
      and ph.clkno=em.clkno
      group by ph.clkno,em.startdate;}
      //get the
      qryGetWeeksWorked.Close;
      qryGetWeeksWorked.ParamByName('FromWeek').AsDateTime:=odpTaxYearDates.StartDate;
      qryGetWeeksWorked.ParamByName('ToWeek').AsDateTime:=odpTaxYearDates.FinishDate;
      qryGetWeeksWorked.ParamByName('ClkNo').AsInteger:=qryEmployeePayCLKNO.AsInteger;
      qryGetWeeksWorked.Open;
      //lTempFromDate:=encodedate(2007,6,30);
      lTempFromDate:=encodedate(2007,12,14); //start of the holiday
      //possibly add the weeksworked from the holsliphist table
      if qryGetEmployeeDataSTARTDATE.AsDateTime<=lTempFromDate then
        st:=st+'3200,52.0000,3210,'+inttostr(qryGetWeeksWorkedWEEKSWORKED.AsInteger+3)+'.0000' //these decimals are in case less than one day is worked
      else
        st:=st+'3200,52.0000,3210,'+inttostr(qryGetWeeksWorkedWEEKSWORKED.AsInteger)+'.0000';
      lHashTotal:=lHashTotal+3200+3210;
      //retirement funding decision - are prov fund contributions considered retirement funding? NO
//      if qryGetEmployeeDataPROVFUNDFLAG.AsString='Y' then
//        st:=st+',3601,"Y",'+format('%.0f',[qryEmployeePayTAXEARNINGS.AsFloat * 1.0])
//      else
//        st:=st+',3601,"N",'+format('%.0f',[qryEmployeePayTAXEARNINGS.AsFloat * 1.0]);
        st:=st+',3601,'+format('%.0f',[(qryEmployeePayTAXEARNINGS.AsFloat+qryGetHolidayPayTOTALTAXEARNINGS.AsFloat) * 1.0]);
      lHashTotal:=lHashTotal+3601;
      lValueTotal:=lValueTotal+int(qryEmployeePayTAXEARNINGS.AsFloat+qryGetHolidayPayTOTALTAXEARNINGS.AsFloat);
      //other possible flags:
      // 3605: annual payment; 3607 - overtime; 3701 to 3718: various allowances
      if qryGetHolidayPayBONUS.AsFloat>0 then
      begin
        st:=st+',3605,'+format('%.0f',[qryGetHolidayPayBONUS.AsFloat * 1.0]);
        st:=st+',3695,'+format('%.0f',[qryGetHolidayPayBONUS.AsFloat * 1.0]); //3695 is required when 3605 happens.
        lHashTotal:=lHashTotal+3605+3695;
        lValueTotal:=lValueTotal+int(qryGetHolidayPayBONUS.AsFloat+qryGetHolidayPayBONUS.AsFloat);
      end;
      lTotalTaxEarnings:=qryEmployeePayTAXEARNINGS.AsFloat++qryGetHolidayPayTOTALTAXEARNINGS.AsFloat+
        qryGetHolidayPayBONUS.AsFloat;

      //Totals all are 3698; so don't use the if statement
      //if qryGetEmployeeDataPROVFUNDFLAG.AsString='Y' then
      //begin
      //  st:=st+',3697,'+format('%.0f',[qryEmployeePayTAXEARNINGS.AsFloat * 1.0]);
      //  lHashTotal:=lHashTotal+3697;
      //end
      //else
      //begin
      st:=st+',3698,'+format('%.0f',[lTotalTaxEarnings * 1.0]);
      lHashTotal:=lHashTotal+3698;
      //end;
      st:=st+',3699,'+format('%.0f',[lTotalTaxEarnings * 1.0]);
      lHashTotal:=lHashTotal+3699; //+4003; xx
      lValueTotal:=lValueTotal+int(lTotalTaxEarnings)+int(lTotalTaxEarnings);
      //provfunddeduct with clearance number of fund = 18204032042
      st:=st+',4003,18204032042,'+format('%.0f',[qryEmployeePayPROVFUNDDEDUCT.AsFloat+qryGetHolidayPayPROVFUNDDEDUCT.AsFloat * 1.0]);
      lHashTotal:=lHashTotal+4003;
      lValueTotal:=lValueTotal+int(qryEmployeePayPROVFUNDDEDUCT.AsFloat+qryGetHolidayPayPROVFUNDDEDUCT.AsFloat);
      //4005 medical aid contributions
      st:=st+',4005,'+format('%.0f',[qryEmployeePaySICKFUNDDEDUCT.AsFloat+qryGetHolidayPaySICKFUNDDEDUCT.AsFloat * 1.0]);
      lHashTotal:=lHashTotal+4005;
      lValueTotal:=lValueTotal+int(qryEmployeePaySICKFUNDDEDUCT.AsFloat+qryGetHolidayPaySICKFUNDDEDUCT.AsFloat);

      //4101: SITE
      //4102: PAYE
      //4103: Total SITE + PAYE

      st:=st+',4101,'+format('%.2f',[qryEmployeePayTAXDEDUCT.AsFloat+qryGetHolidayPayTAXDEDUCT.AsFloat * 1.0]); //VT puts wages as SITE
      st:=st+',4103,'+format('%.2f',[qryEmployeePayTAXDEDUCT.AsFloat+qryGetHolidayPayTAXDEDUCT.AsFloat * 1.0]);
      lHashTotal:=lHashTotal+4101+4103;
      if (qryEmployeePayTAXDEDUCT.AsFloat+qryGetHolidayPayTAXDEDUCT.AsFloat)=0 then //reason required
      begin
        st:=st+',4150,2';
        lHashTotal:=lHashTotal+4150;
      end;
      st:=st+',9999';
      lHashTotal:=lHashTotal+9999;
      lValueTotal:=lValueTotal+qryEmployeePayTAXDEDUCT.AsFloat+qryGetHolidayPayTAXDEDUCT.AsFloat
        +qryEmployeePayTAXDEDUCT.AsFloat+qryGetHolidayPayTAXDEDUCT.AsFloat;

      inc(lEmployerRecordCount);
      inc(lTotalRecordCount);
      WriteLn(fDiskFile, st);
      //Writeln(fDiskFile, inttostr(lHashTotal));

      //if lTotalRecordCount=89 then
      //  break; //while testing
      qryEmployeePay.Next;
    end;
    qryEmployeePay.Close;
  end; //CreateEmployeesCertificates

  procedure CreateEmployerTrailer;
  var
    lTempString:string;
  begin
    lTempString:=format('%.2f',[lValueTotal * 1.0]);
    st:='6010,'+inttostr(lEmployerRecordCount)+',6020,'+inttostr(lHashTotal);
    st:=st+',6030,'+lTempString+',9999';
    inc(lTotalRecordCount);
    WriteLn(fDiskFile, st);
    //Writeln(fDiskFile, inttostr(lHashTotal));
  end; //CreateEmployerTrailer

  procedure CreateTrailer;
  begin
    st:='7010,'+inttostr(lTotalRecordCount)+',9999';
    WriteLn(fDiskFile, st);
  end; //CreateTrailer

  procedure CloseTextFile;
  begin
    CloseFile(fDiskFile);
  end; //CloseTextFile

begin //btnCreateCertificatesClick
  if MessageDlg('Create Tax Certificate for '+cbxTaxYear.Text+'?',
      mtConfirmation,[mbYes,mbNo],0) = mrNo then
    Exit;

  //find the relevant records
  StatusBar.SimpleText:='Fetching Data';
  Application.ProcessMessages;
  lTotalRecordCount:=0;
  lEmployerRecordCount:=0;
  lHashTotal:=0;
  lValueTotal:=0;
  lCertificateNumber:=1000000; //for the wages certificate numbers in first year.
  CreateTextFile;
  CreateHeader;
  CreateEmployerHeader;
  CreateEmployeesCertificates;
  CreateEmployerTrailer;
  CreateTrailer;
  CloseTextFile;
  StatusBar.SimpleText:='File Creation Complete';
  Application.ProcessMessages;

end; //btnCreateCertificatesClick

end.
