unit impv35;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ComCtrls, Db, DBTables;

type
  TfrmImportv35 = class(TForm)
    btnCompany: TButton;
    btnEmployee: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    StatusBar1: TStatusBar;
    tabCompany: TTable;
    tabCompanyREF: TIntegerField;
    tabCompanyCONAME: TStringField;
    tabCompanyCOMPRESSSEL: TStringField;
    tabCompanyCOMPRESSCLR: TStringField;
    tabCompanyBOLDSEL: TStringField;
    tabCompanyBOLDCLR: TStringField;
    tabCompanyFORMFEED: TStringField;
    tabCompanyLINESONPAGE: TIntegerField;
    tabCompanyMINPAYRATE: TFloatField;
    tabCompanyMAXPAYRATE: TFloatField;
    tabCompanyMINSTARTAGE: TIntegerField;
    tabCompanyMAXSTARTAGE: TIntegerField;
    tabCompanyRENTALLOWANCE: TFloatField;
    tabCompanyOTHER1: TFloatField;
    tabCompanyANNUALBONMIN: TFloatField;
    tabCompanyLASTWEEK: TDateTimeField;
    tabCompanySTARTNUMBER: TIntegerField;
    tabCompanyATXWK: TIntegerField;
    tabCompanyWEEKSINYEAR: TIntegerField;
    tabCompanyHOLIDAYPAYDAYS: TIntegerField;
    tabCompanyNORMALHRS: TIntegerField;
    tabCompanyNORMALMINS: TIntegerField;
    tabCompanyNORMALOT13HRS: TIntegerField;
    tabCompanyNORMALOT13MINS: TIntegerField;
    tabCompanyNORMALOT12HRS: TIntegerField;
    tabCompanyNORMALOT12MINS: TIntegerField;
    tabCompanyNORMALOTX2HRS: TIntegerField;
    tabCompanyNORMALOTX2MINS: TIntegerField;
    tabCompanyNORMALATTDAYS: TFloatField;
    tabCompanyCOUNCILDEDUCT: TFloatField;
    tabCompanyPROVFUNDPERCENT: TFloatField;
    tabCompanySICKFUNDPERCENT: TFloatField;
    tabCompanyMAXPAIDSICKDAYS: TFloatField;
    tabCompanyUIFPERCENT: TFloatField;
    tabCompanyNIGHTSHIFTPERCENT: TFloatField;
    tabCompanyPENSIONPERCENT: TFloatField;
    tabCompanyHOLIDAYWEEKS: TIntegerField;
    tabEmployee: TTable;
    tabEmployeeCLKNO: TIntegerField;
    tabEmployeeSURNAME: TStringField;
    tabEmployeeFIRSTNAME: TStringField;
    tabEmployeeSTREET: TStringField;
    tabEmployeeSUBURB: TStringField;
    tabEmployeePOSTCODE: TStringField;
    tabEmployeeRENTACNO: TStringField;
    tabEmployeeRENTMONTH: TFloatField;
    tabEmployeeSAVEACNO: TStringField;
    tabEmployeeSTARTDATE: TDateTimeField;
    tabEmployeeBIRTHDATE: TDateTimeField;
    tabEmployeePAYRATESETDATE: TDateTimeField;
    tabEmployeeHUSBANDNAME: TStringField;
    tabEmployeeMSTATUS: TStringField;
    tabEmployeeNOOFCHILD: TIntegerField;
    tabEmployeeOCCUPATION: TStringField;
    tabEmployeeIDNO: TStringField;
    tabEmployeeUIF: TStringField;
    tabEmployeePROVFUNDFLAG: TStringField;
    tabEmployeeOTHER1FLAG: TStringField;
    tabEmployeeSICKFUNDFLAG: TStringField;
    tabEmployeeHRPAYRATE: TFloatField;
    tabEmployeeATTBONUSWK: TFloatField;
    tabEmployeeSAVEWK: TFloatField;
    tabEmployeeREPAYLNWK: TFloatField;
    tabEmployeeINSURANCE: TFloatField;
    tabEmployeeSAVEAC: TFloatField;
    tabEmployeeTAXEARN: TFloatField;
    tabEmployeePENSION: TFloatField;
    tabEmployeeSICKFD: TFloatField;
    tabEmployeePROVFD: TFloatField;
    tabEmployeeUIFPAY: TFloatField;
    tabEmployeePAYE: TFloatField;
    tabEmployeeGROSSPAY: TFloatField;
    tabEmployeeWKSPAY: TFloatField;
    tabEmployeeRENTAC: TFloatField;
    tabEmployeeLOANAC: TFloatField;
    tabEmployeeFULLWK: TIntegerField;
    tabEmployeePARTWK: TIntegerField;
    tabEmployeeLEAVEDAY: TIntegerField;
    tabEmployeeSICKDAY: TIntegerField;
    tabEmployeeTAXWEEK: TIntegerField;
    tabEmployeeDISCHARGEDATE: TDateTimeField;
    tabEmployeeBANKREF: TStringField;
    tabEmployeeBANKSORTCODE: TStringField;
    tabEmployeeBANKACCREF: TStringField;
    tabEmployeeBANKACCTYPE: TStringField;
    tabEmpPayRate: TTable;
    tabEmpPayRateCLKNO: TIntegerField;
    tabEmpPayRateFROMDATE: TDateTimeField;
    tabEmpPayRatePAYRATE: TFloatField;
    datEmpPayRate: TDataSource;
    datEmployee: TDataSource;
    datCompany: TDataSource;
    tabEmployeeDEPREF: TStringField;
    tabCompanyBATUSERNAME: TStringField;
    tabCompanyATAXYEAR: TIntegerField;
    tabCompanyNORMALFONT: TStringField;
    tabCompanyCOMPRESSEDFONT: TStringField;
    tabCompanyPRINTER: TStringField;
    tabCompanyPAYKIND: TStringField;
    procedure btnEmployeeClick(Sender: TObject);
    procedure btnCompanyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  string40=string[40];
  string15=string[15];
  CompanyType = packed record
    CoName : string40;
    CompressSel,                         { Code for select Compressed Print. }
    CompressClr,                         { Code for clear  Compressed Print. }
    BoldSel,                             { Code for select Bold       Print. }
    BoldClr,                             { Code for clear  Bold       Print. }
    FormFeed : string15;                 { Code for Form Feed.               }
    MinPayRate, MaxPayRate : real;
    MinStartAge, MaxStartAge : smallint;
    RentAllowance : real;
    Other1 : real; { In the payslip - used as a constant for some employees. }
    AnnualBonMin : real; { Annual Bonus Min - used in Christmas Bonus Calc.}
    LastWeekYY, LastWeekMM, LastWeekDD : smallint; { Last week that wages was run. }
    StartNumber : smallint; { Code that tells us how far thru the startup
                             procedures we are:
                             0 = nothing done;
                             1 = Company setup has been run;
                             2 = Employee List erased - enter new employee's
                             3 = Enter opening balances (at least 1 emp ent);
                             4 = Opening balances entered - ready to run. }
    ATxWk : smallint; { Actual tax week being run this year.
                       ie: Total Week ends since March 1.
                       Entered at beginning of opening balance procedure. }
  end;                                                        { CompanyType. }
  //change integers to smallint
  EmployeeType = packed record
    { Clock number not needed here. }
    Surname : string15;       { Use surname as guide for if employee exists. }
    FirstName : string[10];
    Street : string[25];
    Suburb : string15;
    PostCode  : string[4];
    RentACNo  : string[18];
    RentMonth : real;
    SaveACNo  : string[14];
    STYY,STMM,STDD,                                            { Start Date. }
    BDYY,BDMM,BDDD,                                            { Birth Date. }
    PRYY,PRMM,PRDD : smallint;                           { Pay Rate Set Date. }
    HusbandName : string15;
    Mstatus   : char;      { Subrange... }   { (Single, Married, FemMarried) }
    NoofChild : smallint;
    Occupation : string[20];
    IDNo : string[13];
    UIF  : char;
    ProvFundFlag : char;                    { if Y then calculate prov fund. }
    Other1Flag : char;                            { if Y then deduct Other1. }
    SickFundFlag : char;         { if Y then deduct and calculate Sick Fund. }
    HrPayRate  : real;                                    { Hourly Pay Rate. }
    AttBonusWk : real;
    SaveWK     : real;
    RepayLnWk  : real;
    Insurance  : real;
    DeptNo     : smallint;  { no subrange due to format of readall procedure. }
    SaveAC,                                                       { balance. }
    TaxEarn,                                    { taxable earnings for year. }
    Pension, SickFD, ProvFD,
    UIFPay, PAYE, GrossPay, WksPay,             { all these are YTD figures. }
    LastRate : real;                                           { prior rate. }
    LastYY,LastMM,LastDD : smallint;                { date last rate was set. }
    PrevRate :  real;
    PrevYY,PrevMM,PrevDD : smallint;
    RentAC,LoanAC : real;
    FullWk,PartWk : smallint;
    LeaveDay, SickDay : smallint;
    TaxWeek : smallint;  { Taxable weeks worked by employee this (txable) yr. }
    DischargeYY,DischargeMM,DischargeDD : smallint; { yy=0 -> not discharged. }
    BankRef : char;
    BankSortCode : string[6];
    BankAccRef : string[16];
    BankAccType : char;
  end;                                                       { EmployeeType. }

var
  frmImportv35: TfrmImportv35;
  Employee : EmployeeType;
  EmployeeFile  : file of EmployeeType;
  Company : CompanyType;
  CompanyFile : file of CompanyType;

implementation

{$R *.DFM}

uses Main;

procedure TfrmImportv35.btnCompanyClick(Sender: TObject);
begin
  assignFile(CompanyFile, 't:\wages7\data\company.dat');  //may need to get current directory name
  reset(CompanyFile);
  read(CompanyFile, Company);
  //assign the variables
  //make sure that the constants from the old system are assigned
  frmMain.Database.StartTransaction;
  with tabCompany do
  begin
    Edit;
    FieldByName('Ref').AsInteger := 1; // xx Put 1 for test purpose Ref may not be null
    FieldByName('CONAME').AsString:=Company.CoName;
    FieldByName('COMPRESSSEL').AsString:=Company.CompressSel;
    FieldByName('COMPRESSCLR').AsString:=Company.CompressClr;
    FieldByName('BOLDSEL').AsString:=Company.BoldSel;
    FieldByName('BOLDCLR').AsString:=Company.BoldClr;
    FieldByName('FORMFEED').AsString:=Company.FormFeed;
    FieldByName('MINPAYRATE').AsFloat:=Company.MinPayRate;
    FieldByName('MAXPAYRATE').AsFloat:=Company.MaxPayRate;
    FieldByName('MINSTARTAGE').AsInteger:=Company.MinStartAge;
    FieldByName('MAXSTARTAGE').AsInteger:=Company.MaxStartAge;
    FieldByName('RENTALLOWANCE').AsFloat:=Company.RentAllowance;
    FieldByName('OTHER1').AsFloat:=Company.Other1;
    FieldByName('ANNUALBONMIN').AsFloat:=Company.AnnualBonMin;
    FieldByName('LASTWEEK').AsDateTime:=EncodeDate(Company.LastWeekYY,Company.LastWeekMM,Company.LastWeekDD);
    FieldByName('STARTNUMBER').AsInteger:=Company.StartNumber;
    FieldByName('ATXWK').AsInteger:=Company.ATxWk;
    FieldByName('BATUSERNAME').AsString:='None';
    Post;
  end;
  frmMain.Database.Commit;
  StatusBar1.Panels[0].Text:='Importing Complete';
  Application.ProcessMessages;
end;

procedure TfrmImportv35.btnEmployeeClick(Sender: TObject);
var
  ClkNo:smallint;
begin
  assignFile(EmployeeFile, 't:\wages7\data\emp.dat');  //may need to get current directory name
  reset(EmployeeFile);
  //make sure employee table is empty first
  frmMain.Database.StartTransaction;
  with tabEmployee do
  begin
    for ClkNo := 1 to 150 do
    begin
      StatusBar1.Panels[0].Text:='Importing ClkNo: '+inttostr(ClkNo);
      Application.ProcessMessages;
      read(EmployeeFile, Employee);
      if Employee.Surname<>'' then
      begin
        Insert;
        FieldByName('CLKNO').AsInteger:=ClkNo;
        FieldByName('SURNAME').AsString:=Employee.Surname;
        FieldByName('FIRSTNAME').AsString:=Employee.FirstName;
        FieldByName('STREET').AsString:=Employee.Street;
        FieldByName('SUBURB').AsString:=Employee.Suburb;
        FieldByName('POSTCODE').AsString:=Employee.PostCode;
        FieldByName('RENTACNO').AsString:=Employee.RentAcNo;
        FieldByName('RENTMONTH').AsFloat:=Employee.RentMonth;
        FieldByName('SAVEACNO').AsString:=Employee.SaveAcNo;
        FieldByName('STARTDATE').AsDateTime:=
          EncodeDate(Employee.STYY,Employee.STMM,Employee.STDD);
        FieldByName('BIRTHDATE').AsDateTime:=
          EncodeDate(Employee.BDYY,Employee.BDMM,Employee.BDDD);
        FieldByName('PAYRATESETDATE').AsDateTime:=
          EncodeDate(Employee.PRYY,Employee.PRMM,Employee.PRDD);
        FieldByName('HUSBANDNAME').AsString:=Employee.HusbandName;
        FieldByName('MSTATUS').AsString:=Employee.MStatus;
        FieldByName('NOOFCHILD').AsInteger:=Employee.NoOfChild;
        FieldByName('OCCUPATION').AsString:=Employee.Occupation;
        FieldByName('IDNO').AsString:=Employee.IDNo;
        FieldByName('UIF').AsString:=Employee.UIF;
        FieldByName('PROVFUNDFLAG').AsString:=Employee.ProvFundFlag;
        FieldByName('OTHER1FLAG').AsString:=Employee.Other1Flag;
        FieldByName('SICKFUNDFLAG').AsString:=Employee.SickFundFlag;
        FieldByName('HRPAYRATE').AsFloat:=Employee.HRPayRate;
        FieldByName('ATTBONUSWK').AsFloat:=Employee.AttBonusWk;
        FieldByName('SAVEWK').AsFloat:=Employee.SaveWk;
        FieldByName('REPAYLNWK').AsFloat:=Employee.RepayLnWk;
        FieldByName('INSURANCE').AsFloat:=Employee.Insurance;
        FieldByName('DEPREF').AsInteger:=Employee.DeptNo;
        FieldByName('SAVEAC').AsFloat:=Employee.SaveAc;
        FieldByName('TAXEARN').AsFloat:=Employee.TaxEarn;
        FieldByName('PENSION').AsFloat:=Employee.Pension;
        FieldByName('SICKFD').AsFloat:=Employee.SickFd;
        FieldByName('PROVFD').AsFloat:=Employee.ProvFd;
        FieldByName('UIFPAY').AsFloat:=Employee.UIFPay;
        FieldByName('PAYE').AsFloat:=Employee.PAYE;
        FieldByName('GROSSPAY').AsFloat:=Employee.GrossPay;
        FieldByName('WKSPAY').AsFloat:=Employee.WksPay;
        FieldByName('RENTAC').AsFloat:=Employee.RentAc;
        FieldByName('LOANAC').AsFloat:=Employee.LoanAc;
        FieldByName('FULLWK').AsInteger:=Employee.FullWk;
        FieldByName('PARTWK').AsInteger:=Employee.PartWk;
        FieldByName('LEAVEDAY').AsInteger:=Employee.LeaveDay;
        FieldByName('SICKDAY').AsInteger:=Employee.SickDay;
        FieldByName('TAXWEEK').AsInteger:=Employee.TaxWeek;
        if Employee.DischargeYY<>0 then
          FieldByName('DISCHARGEDATE').AsDateTime:=
            EncodeDate(Employee.DischargeYY,Employee.DischargeMM,Employee.DischargeDD);
        FieldByName('BANKREF').AsString:=Employee.BankRef;
        FieldByName('BANKSORTCODE').AsString:=Employee.BankSortCode;
        FieldByName('BANKACCREF').AsString:=Employee.BankAccRef;
        FieldByName('BANKACCTYPE').AsString:=Employee.BankAccType;
        Post;
        if Employee.LastYY<>0 then
        begin
          tabEmpPayRate.Insert;
          tabEmpPayRate.FieldByName('ClkNo').AsInteger:=ClkNo;
          tabEmpPayRate.FieldByName('FromDate').AsDateTime:=
            EncodeDate(Employee.LastYY,Employee.LastMM,Employee.LastDD);
          tabEmpPayRate.FieldByName('PayRate').AsFloat:=Employee.LastRate;
          tabEmpPayRate.Post;
        end;
        if Employee.PrevYY<>0 then
        begin
          tabEmpPayRate.Insert;
          tabEmpPayRate.FieldByName('ClkNo').AsInteger:=ClkNo;
          tabEmpPayRate.FieldByName('FromDate').AsDateTime:=
            EncodeDate(Employee.PrevYY,Employee.PrevMM,Employee.PrevDD);
          tabEmpPayRate.FieldByName('PayRate').AsFloat:=Employee.PrevRate;
          tabEmpPayRate.Post;
        end;
      end;
    end;
  end;
  frmMain.Database.Commit;
  closeFile(EmployeeFile);
  StatusBar1.Panels[0].Text:='Importing Complete';
  Application.ProcessMessages;
end;

procedure TfrmImportv35.FormShow(Sender: TObject);
begin
//  dmImpv35:=TdmImpv35.Create(Application); when using datamodule

  tabCompany.Open;
  tabEmployee.Open;
  tabEmpPayRate.Open;
  tabCompany.FindKey([1]);
end;

procedure TfrmImportv35.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabEmpPayRate.Close;
  tabEmployee.Close;
  tabCompany.Close;

//  dmImpv35.Free; when using datamodule
  Release;
end;

end.
