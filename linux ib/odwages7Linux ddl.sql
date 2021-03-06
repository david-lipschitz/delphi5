 
/*SET SQL DIALECT 1; 
 
CREATE DATABASE 'commander:/usr/interbase/wages6.gdb' PAGE_SIZE 4096

 DEFAULT CHARACTER SET  

/* CREATE DATABASE 'odwages7.gdb' PAGE_SIZE 4096 
 */


/* Table: COMPANY, Owner: SYSDBA */
CREATE TABLE COMPANY (REF INTEGER NOT NULL,
        CONAME CHAR(40),
        COMPRESSSEL CHAR(15),
        COMPRESSCLR CHAR(15),
        BOLDSEL CHAR(15),
        BOLDCLR CHAR(15),
        FORMFEED CHAR(15),
        LINESONPAGE INTEGER,
        MINPAYRATE DOUBLE PRECISION,
        MAXPAYRATE DOUBLE PRECISION,
        MINSTARTAGE INTEGER,
        MAXSTARTAGE INTEGER,
        RENTALLOWANCE DOUBLE PRECISION,
        OTHER1 DOUBLE PRECISION,
        ANNUALBONMIN DOUBLE PRECISION,
        LASTWEEK date,
        STARTNUMBER INTEGER,
        ATXWK INTEGER,
        WEEKSINYEAR INTEGER,
        HOLIDAYPAYDAYS INTEGER,
        NORMALHRS INTEGER,
        NORMALMINS INTEGER,
        NORMALOT13HRS INTEGER,
        NORMALOT13MINS INTEGER,
        NORMALOT12HRS INTEGER,
        NORMALOT12MINS INTEGER,
        NORMALOTX2HRS INTEGER,
        NORMALOTX2MINS INTEGER,
        NORMALATTDAYS DOUBLE PRECISION,
        COUNCILDEDUCT DOUBLE PRECISION,
        PROVFUNDPERCENT DOUBLE PRECISION,
        SICKFUNDPERCENT DOUBLE PRECISION,
        MAXPAIDSICKDAYS DOUBLE PRECISION,
        UIFPERCENT DOUBLE PRECISION,
        NIGHTSHIFTPERCENT DOUBLE PRECISION,
        PENSIONPERCENT DOUBLE PRECISION,
        HOLIDAYWEEKS INTEGER,
        ATAXYEAR INTEGER,
        NORMALFONT CHAR(25),
        COMPRESSEDFONT CHAR(25),
        PRINTER CHAR(50),
        BATUSERNAME CHAR(10),
        PAYKIND CHAR(2),
        SICKFUNDPAYPERCENT DOUBLE PRECISION,
        SERVICEBONUS DOUBLE PRECISION,
CONSTRAINT PCOMPANY PRIMARY KEY (REF));

/* Table: DEPTSUMMARY, Owner: SYSDBA */
CREATE TABLE DEPTSUMMARY (DEPREF CHAR(2) NOT NULL,
        EMPPERDEPT INTEGER,
        TAXEARNINGS DOUBLE PRECISION,
        NORMALHH INTEGER,
        NORMALMM INTEGER,
        OT13HH INTEGER,
        OT13MM INTEGER,
        OT12HH INTEGER,
        OT12MM INTEGER,
        OTX2HH INTEGER,
        OTX2MM INTEGER,
        PRODBONUS DOUBLE PRECISION,
        THISWEEK date NOT NULL,
        PAYKIND CHAR(2) NOT NULL,
CONSTRAINT PDEPTSUMMARY PRIMARY KEY (THISWEEK, PAYKIND, DEPREF));

/* Table: EMPLOYEE, Owner: SYSDBA */
CREATE TABLE EMPLOYEE (CLKNO INTEGER NOT NULL,
        SURNAME CHAR(30),
        FIRSTNAME CHAR(20),
        STREET CHAR(30),
        SUBURB CHAR(30),
        POSTCODE CHAR(4),
        RENTACNO CHAR(18),
        RENTMONTH DOUBLE PRECISION,
        SAVEACNO CHAR(14),
        STARTDATE date,
        BIRTHDATE date,
        PAYRATESETDATE date,
        HUSBANDNAME CHAR(15),
        MSTATUS CHAR(1),
        NOOFCHILD INTEGER,
        OCCUPATION CHAR(20),
        IDNO CHAR(13),
        UIF CHAR(1),
        PROVFUNDFLAG CHAR(1),
        OTHER1FLAG CHAR(1),
        SICKFUNDFLAG CHAR(1),
        HRPAYRATE DOUBLE PRECISION,
        ATTBONUSWK DOUBLE PRECISION,
        SAVEWK DOUBLE PRECISION,
        REPAYLNWK DOUBLE PRECISION,
        INSURANCE DOUBLE PRECISION,
        SAVEAC DOUBLE PRECISION,
        TAXEARN DOUBLE PRECISION,
        PENSION DOUBLE PRECISION,
        SICKFD DOUBLE PRECISION,
        PROVFD DOUBLE PRECISION,
        UIFPAY DOUBLE PRECISION,
        PAYE DOUBLE PRECISION,
        GROSSPAY DOUBLE PRECISION,
        WKSPAY DOUBLE PRECISION,
        RENTAC DOUBLE PRECISION,
        LOANAC DOUBLE PRECISION,
        FULLWK INTEGER,
        PARTWK INTEGER,
        LEAVEDAY INTEGER,
        SICKDAY INTEGER,
        TAXWEEK INTEGER,
        DISCHARGEDATE date,
        BANKREF CHAR(1),
        BANKSORTCODE CHAR(6),
        BANKACCREF CHAR(16),
        BANKACCTYPE CHAR(1),
        DEPREF CHAR(2),
        ABLOANACCNO CHAR(20),
        ABLOANSTARTVALUE DOUBLE PRECISION,
        ABLOANAC DOUBLE PRECISION,
        ABREPAYLNMONTH DOUBLE PRECISION,
        ABREPAYTERM INTEGER,
        ABREPAYFROMYEAR INTEGER,
        ABREPAYFROMMONTH INTEGER,
        ABLOANACTIVE CHAR(1),
CONSTRAINT PEMPLOYEE PRIMARY KEY (CLKNO));

/* Table: EMPPAYRATE, Owner: SYSDBA */
CREATE TABLE EMPPAYRATE (CLKNO INTEGER NOT NULL,
        FROMDATE date NOT NULL,
        PAYRATE DOUBLE PRECISION,
CONSTRAINT PEMPPAYRATE PRIMARY KEY (CLKNO, FROMDATE));

/* Table: HOLSLIP, Owner: SYSDBA */
CREATE TABLE HOLSLIP (CLKNO INTEGER NOT NULL,
        THISWEEK date NOT NULL,
        HOLIDAYPAYDAYS INTEGER,
        HOLIDAYPAY DOUBLE PRECISION,
        CHRISTMASBONUS DOUBLE PRECISION,
        SERVICEBONUS DOUBLE PRECISION,
        SPECIALBONUS DOUBLE PRECISION,
        SAVINGSPAID DOUBLE PRECISION,
        LOANREPAYRATE DOUBLE PRECISION,
        OTHER1 DOUBLE PRECISION,
        POSTED CHAR(1),
        RENTALLOWPAY DOUBLE PRECISION,
        PENSIONDEDUCT DOUBLE PRECISION,
        TAXDEDUCT DOUBLE PRECISION,
        UIFDEDUCT DOUBLE PRECISION,
        PROVFUNDDEDUCT DOUBLE PRECISION,
        COUNCILDEDUCT DOUBLE PRECISION,
        SICKFUNDDEDUCT DOUBLE PRECISION,
        OTHER1DEDUCT DOUBLE PRECISION,
        REPAYLOANPERWEEKDEDUCT DOUBLE PRECISION,
        RENTACBALANCE DOUBLE PRECISION,
        RENTREPAY DOUBLE PRECISION,
        SAVEACBALANCE DOUBLE PRECISION,
        LOANACBALANCE DOUBLE PRECISION,
        TAXEARNINGS DOUBLE PRECISION,
        TOTALEARNINGS DOUBLE PRECISION,
        TOTALDEDUCT DOUBLE PRECISION,
        TOTALPAY DOUBLE PRECISION,
        INSURANCEDEDUCT DOUBLE PRECISION,
        FULLWEEKS DOUBLE PRECISION,
        PARTWEEKS DOUBLE PRECISION,
        NEGPAYLOAN DOUBLE PRECISION,
        PAYKIND CHAR(2) NOT NULL,
        HOLIDAYWEEKS INTEGER,
CONSTRAINT PHOLSLIP PRIMARY KEY (CLKNO, THISWEEK, PAYKIND));

/* Table: HOLSLIPHIST, Owner: SYSDBA */
CREATE TABLE HOLSLIPHIST (CLKNO INTEGER NOT NULL,
        THISWEEK date NOT NULL,
        HOLIDAYPAYDAYS INTEGER,
        HOLIDAYPAY DOUBLE PRECISION,
        CHRISTMASBONUS DOUBLE PRECISION,
        SERVICEBONUS DOUBLE PRECISION,
        SPECIALBONUS DOUBLE PRECISION,
        SAVINGSPAID DOUBLE PRECISION,
        LOANREPAYRATE DOUBLE PRECISION,
        OTHER1 DOUBLE PRECISION,
        POSTED CHAR(1),
        RENTALLOWPAY DOUBLE PRECISION,
        PENSIONDEDUCT DOUBLE PRECISION,
        TAXDEDUCT DOUBLE PRECISION,
        UIFDEDUCT DOUBLE PRECISION,
        PROVFUNDDEDUCT DOUBLE PRECISION,
        COUNCILDEDUCT DOUBLE PRECISION,
        SICKFUNDDEDUCT DOUBLE PRECISION,
        OTHER1DEDUCT DOUBLE PRECISION,
        REPAYLOANPERWEEKDEDUCT DOUBLE PRECISION,
        RENTACBALANCE DOUBLE PRECISION,
        RENTREPAY DOUBLE PRECISION,
        SAVEACBALANCE DOUBLE PRECISION,
        LOANACBALANCE DOUBLE PRECISION,
        TAXEARNINGS DOUBLE PRECISION,
        TOTALEARNINGS DOUBLE PRECISION,
        TOTALDEDUCT DOUBLE PRECISION,
        TOTALPAY DOUBLE PRECISION,
        INSURANCEDEDUCT DOUBLE PRECISION,
        FULLWEEKS DOUBLE PRECISION,
        PARTWEEKS DOUBLE PRECISION,
        NEGPAYLOAN DOUBLE PRECISION,
        PAYKIND CHAR(2) NOT NULL,
        HOLIDAYWEEKS INTEGER,
CONSTRAINT PHOLSLIPHIST PRIMARY KEY (CLKNO, THISWEEK, PAYKIND));

/* Table: INITIALS, Owner: SYSDBA */
CREATE TABLE INITIALS (INITIALS CHAR(4) NOT NULL,
        SURNAME VARCHAR(20),
        FIRSTNAME VARCHAR(10),
        EXT SMALLINT,
        USERNAME CHAR(8),
CONSTRAINT PINITIALS PRIMARY KEY (INITIALS));

/* Table: PAYSLIP, Owner: SYSDBA */
CREATE TABLE PAYSLIP (CLKNO INTEGER NOT NULL,
        THISWEEK date NOT NULL,
        NORMALHH INTEGER,
        NORMALMM INTEGER,
        OT13HH INTEGER,
        OT13MM INTEGER,
        OT12HH INTEGER,
        OT12MM INTEGER,
        OTX2HH INTEGER,
        OTX2MM INTEGER,
        ATTDAYS INTEGER,
        LEAVEPAYDAYS INTEGER,
        SICKPAYDAYS INTEGER,
        PRODBONUS DOUBLE PRECISION,
        NIGHTSHIFTALLOW DOUBLE PRECISION,
        SAVINGSPAID DOUBLE PRECISION,
        LOANGIVEN DOUBLE PRECISION,
        LOANREPAYRATE DOUBLE PRECISION,
        MEDAID DOUBLE PRECISION,
        OTHER2 DOUBLE PRECISION,
        OTHER1 DOUBLE PRECISION,
        POSTED CHAR(1),
        NORMALPAY DOUBLE PRECISION,
        OT13PAY DOUBLE PRECISION,
        OT12PAY DOUBLE PRECISION,
        OTX2PAY DOUBLE PRECISION,
        ATTBONUSPAY DOUBLE PRECISION,
        PRODBONUSPAY DOUBLE PRECISION,
        NIGHTSHIFTPAY DOUBLE PRECISION,
        LEAVEPAY DOUBLE PRECISION,
        RENTALLOWPAY DOUBLE PRECISION,
        PENSIONDEDUCT DOUBLE PRECISION,
        TAXDEDUCT DOUBLE PRECISION,
        UIFDEDUCT DOUBLE PRECISION,
        PROVFUNDDEDUCT DOUBLE PRECISION,
        COUNCILDEDUCT DOUBLE PRECISION,
        SICKFUNDDEDUCT DOUBLE PRECISION,
        MEDAIDDEDUCT DOUBLE PRECISION,
        OTHER1DEDUCT DOUBLE PRECISION,
        OTHER2DEDUCT DOUBLE PRECISION,
        RENTDEDUCT DOUBLE PRECISION,
        SAVINGSPERWEEKDEDUCT DOUBLE PRECISION,
        REPAYLOANPERWEEKDEDUCT DOUBLE PRECISION,
        RENTACBALANCE DOUBLE PRECISION,
        RENTREPAY DOUBLE PRECISION,
        SAVEACBALANCE DOUBLE PRECISION,
        LOANACBALANCE DOUBLE PRECISION,
        FULLWEEK DOUBLE PRECISION,
        PARTWEEK DOUBLE PRECISION,
        SICKFUNDPAY DOUBLE PRECISION,
        TAXEARNINGS DOUBLE PRECISION,
        TOTALEARNINGS DOUBLE PRECISION,
        TOTALDEDUCT DOUBLE PRECISION,
        TOTALPAY DOUBLE PRECISION,
        INSURANCEDEDUCT DOUBLE PRECISION,
        LEAVEDAYS DOUBLE PRECISION,
        SICKDAYS DOUBLE PRECISION,
        FULLWEEKS DOUBLE PRECISION,
        PARTWEEKS DOUBLE PRECISION,
        NEGPAYLOAN DOUBLE PRECISION,
        DISCHARGEDATE date,
        PAYKIND CHAR(2) NOT NULL,
        ABOLDBAL DOUBLE PRECISION,
        ABLESSREPAY DOUBLE PRECISION,
        ABADDNEW DOUBLE PRECISION,
        ABNEWBAL DOUBLE PRECISION,
CONSTRAINT PPAYSLIP PRIMARY KEY (CLKNO, THISWEEK, PAYKIND));

/* Table: PAYSLIPHIST, Owner: SYSDBA */
CREATE TABLE PAYSLIPHIST (CLKNO INTEGER NOT NULL,
        THISWEEK date NOT NULL,
        NORMALHH INTEGER,
        NORMALMM INTEGER,
        OT13HH INTEGER,
        OT13MM INTEGER,
        OT12HH INTEGER,
        OT12MM INTEGER,
        OTX2HH INTEGER,
        OTX2MM INTEGER,
        ATTDAYS INTEGER,
        LEAVEPAYDAYS INTEGER,
        SICKPAYDAYS INTEGER,
        PRODBONUS DOUBLE PRECISION,
        NIGHTSHIFTALLOW DOUBLE PRECISION,
        SAVINGSPAID DOUBLE PRECISION,
        LOANGIVEN DOUBLE PRECISION,
        LOANREPAYRATE DOUBLE PRECISION,
        MEDAID DOUBLE PRECISION,
        OTHER2 DOUBLE PRECISION,
        OTHER1 DOUBLE PRECISION,
        POSTED CHAR(1),
        NORMALPAY DOUBLE PRECISION,
        OT13PAY DOUBLE PRECISION,
        OT12PAY DOUBLE PRECISION,
        OTX2PAY DOUBLE PRECISION,
        ATTBONUSPAY DOUBLE PRECISION,
        PRODBONUSPAY DOUBLE PRECISION,
        NIGHTSHIFTPAY DOUBLE PRECISION,
        LEAVEPAY DOUBLE PRECISION,
        RENTALLOWPAY DOUBLE PRECISION,
        PENSIONDEDUCT DOUBLE PRECISION,
        TAXDEDUCT DOUBLE PRECISION,
        UIFDEDUCT DOUBLE PRECISION,
        PROVFUNDDEDUCT DOUBLE PRECISION,
        COUNCILDEDUCT DOUBLE PRECISION,
        SICKFUNDDEDUCT DOUBLE PRECISION,
        MEDAIDDEDUCT DOUBLE PRECISION,
        OTHER1DEDUCT DOUBLE PRECISION,
        OTHER2DEDUCT DOUBLE PRECISION,
        RENTDEDUCT DOUBLE PRECISION,
        SAVINGSPERWEEKDEDUCT DOUBLE PRECISION,
        REPAYLOANPERWEEKDEDUCT DOUBLE PRECISION,
        RENTACBALANCE DOUBLE PRECISION,
        RENTREPAY DOUBLE PRECISION,
        SAVEACBALANCE DOUBLE PRECISION,
        LOANACBALANCE DOUBLE PRECISION,
        FULLWEEK DOUBLE PRECISION,
        PARTWEEK DOUBLE PRECISION,
        SICKFUNDPAY DOUBLE PRECISION,
        TAXEARNINGS DOUBLE PRECISION,
        TOTALEARNINGS DOUBLE PRECISION,
        TOTALDEDUCT DOUBLE PRECISION,
        TOTALPAY DOUBLE PRECISION,
        INSURANCEDEDUCT DOUBLE PRECISION,
        LEAVEDAYS DOUBLE PRECISION,
        SICKDAYS DOUBLE PRECISION,
        FULLWEEKS DOUBLE PRECISION,
        PARTWEEKS DOUBLE PRECISION,
        NEGPAYLOAN DOUBLE PRECISION,
        DISCHARGEDATE date,
        PAYKIND CHAR(2) NOT NULL,
        ABOLDBAL DOUBLE PRECISION,
        ABLESSREPAY DOUBLE PRECISION,
        ABADDNEW DOUBLE PRECISION,
        ABNEWBAL DOUBLE PRECISION,
CONSTRAINT PPAYSLIPHIST PRIMARY KEY (CLKNO, THISWEEK, PAYKIND));

/* Table: PAYSLIPSUMMARY, Owner: SYSDBA */
CREATE TABLE PAYSLIPSUMMARY (THISWEEK date NOT NULL,
        WEEKLYORFINAL CHAR(1),
        COINR100 DOUBLE PRECISION,
        COINR50 DOUBLE PRECISION,
        COINR20 DOUBLE PRECISION,
        COINR10 DOUBLE PRECISION,
        COINR5 DOUBLE PRECISION,
        COINR2 DOUBLE PRECISION,
        COINR1 DOUBLE PRECISION,
        COINC50 DOUBLE PRECISION,
        COINC20 DOUBLE PRECISION,
        COINC10 DOUBLE PRECISION,
        COINC5 DOUBLE PRECISION,
        COINC2 DOUBLE PRECISION,
        COINC1 DOUBLE PRECISION,
        SICKEMP1 INTEGER,
        SICKEMP2 INTEGER,
        SICKEMP3 INTEGER,
        SICKEMP4 INTEGER,
        SICKEMP5 INTEGER,
        SICKCONTRIB1 DOUBLE PRECISION,
        SICKCONTRIB2 DOUBLE PRECISION,
        SICKCONTRIB3 DOUBLE PRECISION,
        SICKCONTRIB4 DOUBLE PRECISION,
        SICKCONTRIB5 DOUBLE PRECISION,
        TAXEARN DOUBLE PRECISION,
        SAVINGS DOUBLE PRECISION,
        LOAN DOUBLE PRECISION,
        NEGPAYLOAN DOUBLE PRECISION,
        SICKPAY DOUBLE PRECISION,
        RENTPAID DOUBLE PRECISION,
        PENSIONDEDUCT DOUBLE PRECISION,
        TAXDEDUCT DOUBLE PRECISION,
        UIFDEDUCT DOUBLE PRECISION,
        PROVFUNDDEDUCT DOUBLE PRECISION,
        COUNCILDEDUCT DOUBLE PRECISION,
        SICKFUNDDEDUCT DOUBLE PRECISION,
        MEDAIDDEDUCT DOUBLE PRECISION,
        INSURANCEDEDUCT DOUBLE PRECISION,
        OTHER1DEDUCT DOUBLE PRECISION,
        OTHER2DEDUCT DOUBLE PRECISION,
        RENTDEDUCT DOUBLE PRECISION,
        SAVINGSDEDUCT DOUBLE PRECISION,
        LOANDEDUCT DOUBLE PRECISION,
        TOTALPAYMENTS DOUBLE PRECISION,
        TOTALDEDUCTS DOUBLE PRECISION,
        NETPAY DOUBLE PRECISION,
        EMPLOYEESTOTAL INTEGER,
        NORMALHHTOTAL INTEGER,
        NORMALMMTOTAL INTEGER,
        OT13HHTOTAL INTEGER,
        OT13MMTOTAL INTEGER,
        OT12HHTOTAL INTEGER,
        OT12MMTOTAL INTEGER,
        OTX2HHTOTAL INTEGER,
        OTX2MMTOTAL INTEGER,
        PRODBONUSTOTAL DOUBLE PRECISION,
        DEPREF CHAR(2),
        PAYKIND CHAR(2) NOT NULL,
        TOTALEARNINGS DOUBLE PRECISION,
        SAVINGSPAID DOUBLE PRECISION,
        LOANGIVEN DOUBLE PRECISION,
        HOLIDAYPAYDAYS INTEGER,
        HOLIDAYPAY DOUBLE PRECISION,
        CHRISTMASBONUS DOUBLE PRECISION,
        SERVICEBONUS DOUBLE PRECISION,
        SPECIALBONUS DOUBLE PRECISION,
        ABLOANDEDUCT DOUBLE PRECISION,
CONSTRAINT PPAYSLIPSUMMARY PRIMARY KEY (THISWEEK, PAYKIND));

/* Table: SICKFUNDTABLE, Owner: SYSDBA */
CREATE TABLE SICKFUNDTABLE (FROMDATE date NOT NULL,
        TODATE date NOT NULL,
        FROMWAGES DOUBLE PRECISION NOT NULL,
        TOWAGES DOUBLE PRECISION NOT NULL,
        CONTRIBPERWEEK DOUBLE PRECISION,
        BENEFITPERDAY DOUBLE PRECISION,
CONSTRAINT PSICKFUNDTABLE PRIMARY KEY (FROMDATE, TODATE, FROMWAGES, TOWAGES));

/* Table: SPSLIP, Owner: SYSDBA */
CREATE TABLE SPSLIP (CLKNO INTEGER NOT NULL,
        SPECIALBONUS DOUBLE PRECISION,
CONSTRAINT PSPSLIP PRIMARY KEY (CLKNO));

/* Table: TAXCONSTANTS, Owner: SYSDBA */
CREATE TABLE TAXCONSTANTS (TAXYR INTEGER NOT NULL,
        PRIMREB DOUBLE PRECISION,
        PERSON65R DOUBLE PRECISION,
CONSTRAINT PTAXCONSTANTS PRIMARY KEY (TAXYR));

/* Table: TAXCONSTANTS1, Owner: SYSDBA */
CREATE TABLE TAXCONSTANTS1 (TAXYR INTEGER NOT NULL,
        PRIMREB DOUBLE PRECISION,
        PERSON65R DOUBLE PRECISION);

/* Table: TAXTABLE, Owner: SYSDBA */
CREATE TABLE TAXTABLE (TAXYR INTEGER NOT NULL,
        FROMTAXABLEINCOME DOUBLE PRECISION NOT NULL,
        TOTAXABLEINCOME DOUBLE PRECISION NOT NULL,
        TAX DOUBLE PRECISION,
        EXTRAPERCENT DOUBLE PRECISION,
CONSTRAINT PTAXTABLE PRIMARY KEY (TAXYR, FROMTAXABLEINCOME, TOTAXABLEINCOME));

/* Table: TAXTABLE1, Owner: SYSDBA */
CREATE TABLE TAXTABLE1 (TAXYR INTEGER NOT NULL,
        FROMTAXABLEINCOME DOUBLE PRECISION NOT NULL,
        TOTAXABLEINCOME DOUBLE PRECISION NOT NULL,
        TAX DOUBLE PRECISION,
        EXTRAPERCENT DOUBLE PRECISION);

/* Table: WEEKSINMONTH, Owner: SYSDBA */
CREATE TABLE WEEKSINMONTH (YEARNO INTEGER NOT NULL,
        MONTHNO INTEGER NOT NULL,
        NUMBEROFWEEKS INTEGER,
        FROMWAGESWEEKEND date,
        TOWAGESWEEKEND date,
CONSTRAINT PWEEKSINMONTH PRIMARY KEY (YEARNO, MONTHNO));
 
ALTER TABLE EMPPAYRATE ADD CONSTRAINT FEPR_EMPLOYEE FOREIGN KEY (CLKNO) REFERENCES EMPLOYEE (CLKNO);

CREATE GENERATOR GENCLKNO;

COMMIT WORK;
SET AUTODDL OFF;
SET TERM ^ ;

/* Stored procedures */
CREATE PROCEDURE SPCLKNO RETURNS (CODE INTEGER)
AS 
BEGIN EXIT; END ^

ALTER PROCEDURE SPCLKNO RETURNS (CODE INTEGER)
AS 
 
begin
  code=gen_id(genClkNo,1);
end ^
SET TERM ; ^
COMMIT WORK ;
SET AUTODDL ON;

/* Grant permissions for this database */
GRANT SELECT ON COMPANY TO BARRY;
GRANT SELECT, UPDATE ON COMPANY TO SHAHIEDA;
GRANT SELECT ON COMPANY TO SUSAN;
GRANT SELECT ON DEPTSUMMARY TO BARRY;
GRANT DELETE, INSERT, SELECT, UPDATE, REFERENCES ON DEPTSUMMARY TO SHAHIEDA;
GRANT SELECT ON DEPTSUMMARY TO SUSAN;
GRANT SELECT ON EMPLOYEE TO BARRY;
GRANT INSERT, SELECT, UPDATE ON EMPLOYEE TO SHAHIEDA;
GRANT SELECT ON EMPLOYEE TO SUSAN;
GRANT SELECT ON EMPPAYRATE TO BARRY;
GRANT INSERT, SELECT, UPDATE ON EMPPAYRATE TO SHAHIEDA;
GRANT SELECT ON EMPPAYRATE TO SUSAN;
GRANT DELETE, INSERT, SELECT, UPDATE, REFERENCES ON HOLSLIP TO SHAHIEDA;
GRANT INSERT, SELECT, UPDATE ON HOLSLIPHIST TO SHAHIEDA;
GRANT SELECT ON INITIALS TO BARRY;
GRANT SELECT ON INITIALS TO SHAHIEDA;
GRANT SELECT ON INITIALS TO SUSAN;
GRANT SELECT ON PAYSLIP TO BARRY;
GRANT DELETE, INSERT, SELECT, UPDATE ON PAYSLIP TO SHAHIEDA;
GRANT SELECT ON PAYSLIP TO SUSAN;
GRANT SELECT ON PAYSLIPHIST TO BARRY;
GRANT INSERT, SELECT, UPDATE ON PAYSLIPHIST TO SHAHIEDA;
GRANT SELECT ON PAYSLIPHIST TO SUSAN;
GRANT SELECT ON PAYSLIPSUMMARY TO BARRY;
GRANT DELETE, INSERT, SELECT, UPDATE, REFERENCES ON PAYSLIPSUMMARY TO SHAHIEDA;
GRANT SELECT ON PAYSLIPSUMMARY TO SUSAN;
GRANT SELECT ON SICKFUNDTABLE TO BARRY;
GRANT SELECT ON SICKFUNDTABLE TO SHAHIEDA;
GRANT SELECT ON SICKFUNDTABLE TO SUSAN;
GRANT SELECT ON SPSLIP TO BARRY;
GRANT DELETE, INSERT, SELECT, UPDATE ON SPSLIP TO SHAHIEDA;
GRANT SELECT ON SPSLIP TO SUSAN;
GRANT SELECT ON TAXCONSTANTS TO BARRY;
GRANT SELECT ON TAXCONSTANTS TO SHAHIEDA;
GRANT SELECT ON TAXCONSTANTS TO SUSAN;
GRANT SELECT ON TAXCONSTANTS1 TO BARRY;
GRANT SELECT ON TAXCONSTANTS1 TO SUSAN;
GRANT SELECT ON TAXTABLE TO BARRY;
GRANT SELECT ON TAXTABLE TO SHAHIEDA;
GRANT SELECT ON TAXTABLE TO SUSAN;
GRANT SELECT ON TAXTABLE1 TO BARRY;
GRANT SELECT ON TAXTABLE1 TO SUSAN;
GRANT SELECT ON WEEKSINMONTH TO PUBLIC;
GRANT EXECUTE ON PROCEDURE SPCLKNO TO SHAHIEDA;
