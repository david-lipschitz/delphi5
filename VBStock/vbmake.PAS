{Unit Name: VBMake
Written By: DH Lipschitz in 1996
Descr: Calculate the production tracking schedule
Mods:  9/12/96   Print metres required rather than pieces required
       4/2/97    Subtract metres already slit from finished pieces
       4/2/97    Added Total Sales: used by stkmin report
       18/3/97   Added Total Allocated: used by order processing
       3/4/97    Added Get To Date for slit calculation
       22/5/97   Added StkMinQty constant
       8/97      Set stock min to average monthly sales
       12/97     Change all these procedures to stored procedures
       1/98      Change to three part structure as a result of VB Finishes.
       2/2003    Changed to allow 2070,2100 and any other FW type to be
                 shown in the FW columns.  Used vbwidth.metricwidth=2070
                 and vw.strips=1 to find the FW products.
  Screen.Cursor:=crSQLWait;
  SPExtractTxnDetSummary.Params[0].AsString:='WIP';
  SPExtractTxnDetSummary.Params[1].AsInteger:=strtoint(EditYearNo.Text);
  SPExtractTxnDetSummary.Params[2].AsInteger:=strtoint(EditPeriodNo.Text);
  SPExtractTxnDetSummary.ExecProc;
  ShowNumRecords.Text:=SPExtractTxnDetSummary.ParamByName('RecordsFound').AsString;
  ShowQtyTotal.Text:=SPExtractTxnDetSummary.ParamByName('QtyTotal').AsString;
  FromDate:=SPExtractTxnDetSummary.ParamByName('FromDate').AsFloat;
  ToDate:=SPExtractTxnDetSummary.ParamByName('ToDate').AsFloat;
  Screen.Cursor:=crDefault;
       }

unit Vbmake;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, {Dialogs,} StdCtrls, Buttons, DBTables, DB, Grids, DBGrids,
  ComCtrls, ExtCtrls, Mask, DBCtrls, Menus, ODDBFind;

type
  TVBMakeForm = class(TForm)
    MyQuery: TQuery;
    StatusBar: TStatusBar;
    VBParamsSource: TDataSource;
    VBParamsQuery: TQuery;
    VBParamsQueryMAKEDATE: TDateTimeField;
    SPVBMAKEDELETE: TStoredProc;
    SPVBMAKESETUP: TStoredProc;
    SPVBMAKEFINDSTOCK: TStoredProc;
    SPVBMAKECALCSALES: TStoredProc;
    VBMake_Fin: TTable;
    VBMake_FinSource: TDataSource;
    VBMake_FinVBSTRU: TStringField;
    VBMake_FinVBCOL: TStringField;
    VBMake_FinVBFIN: TStringField;
    VBMake_FinMIN127: TIntegerField;
    VBMake_FinSTK127: TIntegerField;
    VBMake_FinORD127: TIntegerField;
    VBMake_FinPORD127: TFloatField;
    VBMake_FinPSTK127: TFloatField;
    VBMake_FinMIN89: TIntegerField;
    VBMake_FinSTK89: TIntegerField;
    VBMake_FinORD89: TIntegerField;
    VBMake_FinPORD89: TFloatField;
    VBMake_FinPSTK89: TFloatField;
    VBMake_FinMIN2070: TIntegerField;
    VBMake_FinSTK2070: TIntegerField;
    VBMake_FinORD2070: TIntegerField;
    VBMake_FinPORD2070: TFloatField;
    VBMake_FinPSTK2070: TFloatField;
    VBMake_FinPTOTORD: TFloatField;
    VBMake_FinPTOTSTK: TFloatField;
    VBMake_FinPTOTRQD: TFloatField;
    VBMake_FinFWIP: TFloatField;
    VBMake_FinFWSLITMRQD: TFloatField;
    VBMake_FinPCEWARPLENGTH: TFloatField;
    VBMake_FinPCEFINLENGTH: TFloatField;
    VBMake_FinFWWARPMRQD: TFloatField;
    VBMake_FinSALE89: TFloatField;
    VBMake_FinSALE127: TFloatField;
    VBMake_FinSALE2070: TFloatField;
    VBMake_FinFIRSTSALEDATE: TDateTimeField;
    VBMake_FinALLOC127: TIntegerField;
    VBMake_FinALLOC89: TIntegerField;
    VBMake_FinALLOC2070: TIntegerField;
    VBMake_FinREMAIN127: TIntegerField;
    VBMake_FinREMAIN89: TIntegerField;
    VBMake_FinREMAIN2070: TIntegerField;
    VBMake_FinDIVBYDAYS: TIntegerField;
    VBMake_FinMONTHSSALES: TSmallintField;
    VBMake: TTable;
    VBMakeVBSTRU: TStringField;
    VBMakeVBCOL: TStringField;
    VBMakeWARPTYPE: TStringField;
    VBMakeMIN127: TIntegerField;
    VBMakeSTK127: TIntegerField;
    VBMakeORD127: TIntegerField;
    VBMakePORD127: TFloatField;
    VBMakePSTK127: TFloatField;
    VBMakeMIN89: TIntegerField;
    VBMakeSTK89: TIntegerField;
    VBMakeORD89: TIntegerField;
    VBMakePORD89: TFloatField;
    VBMakePSTK89: TFloatField;
    VBMakeMIN2070: TIntegerField;
    VBMakeSTK2070: TIntegerField;
    VBMakeORD2070: TIntegerField;
    VBMakePORD2070: TFloatField;
    VBMakePSTK2070: TFloatField;
    VBMakePTOTORD: TFloatField;
    VBMakePTOTSTK: TFloatField;
    VBMakePTOTRQD: TFloatField;
    VBMakeWWIP: TFloatField;
    VBMakeVWIP: TFloatField;
    VBMakeFWIP: TFloatField;
    VBMakeWARPCOL: TStringField;
    VBMakePCSRQD: TFloatField;
    VBMakeWEFT1STRU: TStringField;
    VBMakeWEFT1TWIST: TStringField;
    VBMakeWEFT1COL: TStringField;
    VBMakePCEWFT1WEIGHT: TFloatField;
    VBMakeWFT1YNRQD: TFloatField;
    VBMakeWFT1YNSTOCK: TFloatField;
    VBMakeWFT1TOSPIN: TFloatField;
    VBMakeFWSLITMRQD: TFloatField;
    VBMakeFWWARPMRQD: TFloatField;
    VBMakePCEWARPLENGTH: TFloatField;
    VBMakePCEFINLENGTH: TFloatField;
    VBMakeSALE89: TFloatField;
    VBMakeSALE127: TFloatField;
    VBMakeSALE2070: TFloatField;
    VBMakeFIRSTSALEDATE: TDateTimeField;
    VBMakeALLOC127: TIntegerField;
    VBMakeALLOC89: TIntegerField;
    VBMakeALLOC2070: TIntegerField;
    VBMakeREMAIN127: TIntegerField;
    VBMakeREMAIN89: TIntegerField;
    VBMakeREMAIN2070: TIntegerField;
    VBMakeDIVBYDAYS: TIntegerField;
    VBMakeMONTHSSALES: TSmallintField;
    VBMakeVBFIN: TStringField;
    VBMake_WarpSource: TDataSource;
    VBMakeWarpYarnSource: TDataSource;
    Panel1: TPanel;
    RunMakeBtn: TButton;
    PrintAllBtn: TButton;
    CloseBitBtn: TBitBtn;
    Label1: TLabel;
    EditMakeDate: TDBEdit;
    ShowVBStru: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    ShowVBCol: TDBEdit;
    Label5: TLabel;
    ShowVBFin: TDBEdit;
    Label2: TLabel;
    Panel2: TPanel;
    VBMakeFinGrid: TDBGrid;
    Splitter1: TSplitter;
    Panel3: TPanel;
    VBMakeWarpGrid: TDBGrid;
    Splitter2: TSplitter;
    Panel4: TPanel;
    VBMakeWpYarnGrid: TDBGrid;
    VBMakeWeftYarnSource: TDataSource;
    Splitter3: TSplitter;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    qryVBMake_Warp: TQuery;
    qryVBMakeWarpYarn: TQuery;
    qryVBMakeWeftYarn: TQuery;
    qryVBMake_WarpVBSTRU: TStringField;
    qryVBMake_WarpVBCOL: TStringField;
    qryVBMake_WarpFWWARPMRQD: TFloatField;
    qryVBMake_WarpVWIP: TFloatField;
    qryVBMake_WarpWWIP: TFloatField;
    qryVBMake_WarpFWWARPMTOPLAN: TFloatField;
    qryVBMake_WarpPCEWARPLENGTH: TFloatField;
    qryVBMake_WarpPCSRQDTOPLAN: TFloatField;
    qryVBMake_WarpPCEWFT1WEIGHT: TFloatField;
    qryVBMake_WarpWFT1YNRQD: TFloatField;
    qryVBMake_WarpWARPTYPE: TStringField;
    qryVBMake_WarpWARPCOL: TStringField;
    qryVBMake_WarpWEFT1STRU: TStringField;
    qryVBMake_WarpWEFT1TWIST: TStringField;
    qryVBMake_WarpWEFT1COL: TStringField;
    qryVBMakeWarpYarnWPTYPE: TStringField;
    qryVBMakeWarpYarnWPCOL: TStringField;
    qryVBMakeWarpYarnWPYNRQD: TFloatField;
    qryVBMakeWarpYarnWPYNSTOCKMETRES: TFloatField;
    qryVBMakeWarpYarnWPYNMETRESTOKGS: TFloatField;
    qryVBMakeWarpYarnWPYNTOSPIN: TFloatField;
    qryVBMakeWeftYarnWFTYNRQD: TFloatField;
    qryVBMakeWeftYarnWFTYNSTOCK: TFloatField;
    qryVBMakeWeftYarnWFTYNTOSPIN: TFloatField;
    SPVBMakeFindOrders: TStoredProc;
    SPVBMakeFindAlloc: TStoredProc;
    SPVBMakeFindFin: TStoredProc;
    SPVBParams: TStoredProc;
    SPVBMakeFindSlit: TStoredProc;
    SPVBMakeFindWeaving: TStoredProc;
    SPVBMakeFindWoven: TStoredProc;
    SPVBMakeCompute: TStoredProc;
    qryVBMakeWarpYarnWPYNMRQD: TFloatField;
    qryVBMakeWarpYarnYNSTRU: TStringField;
    qryVBMakeWarpYarnYNTWIST: TStringField;
    qryVBMakeWarpYarnYNCOL: TStringField;
    qryVBMakeWeftYarnYNSTRU: TStringField;
    qryVBMakeWeftYarnYNTWIST: TStringField;
    qryVBMakeWeftYarnYNCOL: TStringField;
    Label6: TLabel;
    edtStruSelection: TEdit;
    PrintSpdBtn: TSpeedButton;
    ODFindMenu1: TODFindMenu;
    VBMake_FinAVESALE89: TFloatField;
    VBMake_FinAVESALE127: TFloatField;
    VBMake_FinAVESALE2070: TFloatField;
    VBMake_FinMINCALCMULTIPLIER89: TFloatField;
    VBMake_FinMINCALCMULTIPLIER127: TFloatField;
    VBMake_FinMINCALCMULTIPLIER2070: TFloatField;
    VBMake_FinMAKESTKMULTIPLIER89: TFloatField;
    VBMake_FinMAKESTKMULTIPLIER127: TFloatField;
    VBMake_FinMAKESTKMULTIPLIER2070: TFloatField;
    VBMake_FinPCSMIN127: TFloatField;
    VBMake_FinPCSAVESALE127: TFloatField;
    VBMake_FinPCSSTK127: TFloatField;
    VBMake_FinPCSORD127: TFloatField;
    VBMake_FinPCSALLOC127: TFloatField;
    VBMake_FinPCSREMAIN127: TFloatField;
    VBMake_FinPCSMIN89: TFloatField;
    VBMake_FinPCSAVESALE89: TFloatField;
    VBMake_FinPCSSTK89: TFloatField;
    VBMake_FinPCSORD89: TFloatField;
    VBMake_FinPCSALLOC89: TFloatField;
    VBMake_FinPCSREMAIN89: TFloatField;
    VBMake_FinPCSMIN2070: TFloatField;
    VBMake_FinPCSAVESALE2070: TFloatField;
    VBMake_FinPCSSTK2070: TFloatField;
    VBMake_FinPCSORD2070: TFloatField;
    VBMake_FinPCSALLOC2070: TFloatField;
    VBMake_FinPCSREMAIN2070: TFloatField;
    VBMake_FinPCSFWIP: TFloatField;
    qryVBMake_WarpPCSWWIP: TFloatField;
    qryVBMake_WarpPCSVWIP: TFloatField;
    VBMake_FinPCSPORD127: TFloatField;
    VBMake_FinPCSPSTK127: TFloatField;
    VBMake_FinPCSPORD89: TFloatField;
    VBMake_FinPCSPSTK89: TFloatField;
    VBMake_FinPCSPORD2070: TFloatField;
    VBMake_FinPCSPSTK2070: TFloatField;
    VBMake_FinPCSPTOTORD: TFloatField;
    VBMake_FinPCSPTOTSTK: TFloatField;
    VBMake_FinPCSPTOTRQD: TFloatField;
    VBMake_FinPCSFWSLITMRQD: TFloatField;
    VBMake_FinPCSFWWARPMRQD: TFloatField;
    VBMake_FinSTK2070OK: TIntegerField;
    VBMake_FinSTK2070RESLIT: TIntegerField;
    VBMake_FinPCSSTK2070OK: TFloatField;
    VBMake_FinPCSSTK2070RESLIT: TFloatField;
    btnCalcStat: TButton;
    qryStatAve: TQuery;
    qryStatAveVBSTRU: TStringField;
    qryStatAveVBCOL: TStringField;
    qryStatAveVBFIN: TStringField;
    qryStatAveMETRICWIDTH: TSmallintField;
    qryStatAveNETLENGTH: TFloatField;
    qryUpdateStats: TQuery;
    qryStatAveYEARNO: TSmallintField;
    qryStatAvePERIODNO: TSmallintField;
    SPVBMAKEFINDORDERSHELD: TStoredProc;
    SPVBMAKEFINDORDERSNOTHELD: TStoredProc;
    VBMake_FinPCSPHELDORD127: TFloatField;
    VBMake_FinPCSPHELDORD89: TFloatField;
    VBMake_FinPCSPHELDORD2070: TFloatField;
    VBMake_FinPCSPNOTHELDORD127: TFloatField;
    VBMake_FinPCSPNOTHELDORD89: TFloatField;
    VBMake_FinPCSPNOTHELDORD2070: TFloatField;
    spVBMakeDiscon: TStoredProc;
    VBMake_FinDISCON127: TStringField;
    VBMake_FinDISCON89: TStringField;
    VBMake_FinDISCON2070: TStringField;
    spVBMakeMakeLive: TStoredProc;
    qryGetVBMake_FinTemp: TQuery;
    qryUpdateVBMake_Fin: TQuery;
    qryInsertMissingFin: TQuery;
    qryGetVBMake_WarpTemp: TQuery;
    qryUpdateVBMake_Warp: TQuery;
    qryInsertMissingWarp: TQuery;
    qryGetVBMake_WarpTempVBSTRU: TStringField;
    qryGetVBMake_WarpTempVBCOL: TStringField;
    qryGetVBMake_WarpTempFWWARPMRQD: TFloatField;
    qryGetVBMake_WarpTempVWIP: TFloatField;
    qryGetVBMake_WarpTempWWIP: TFloatField;
    qryGetVBMake_WarpTempFWWARPMTOPLAN: TFloatField;
    qryGetVBMake_WarpTempPCEWARPLENGTH: TFloatField;
    qryGetVBMake_WarpTempPCSRQDTOPLAN: TFloatField;
    qryGetVBMake_WarpTempPCEWFT1WEIGHT: TFloatField;
    qryGetVBMake_WarpTempWFT1YNRQD: TFloatField;
    qryGetVBMake_WarpTempWARPTYPE: TStringField;
    qryGetVBMake_WarpTempWARPCOL: TStringField;
    qryGetVBMake_WarpTempWEFT1STRU: TStringField;
    qryGetVBMake_WarpTempWEFT1TWIST: TStringField;
    qryGetVBMake_WarpTempWEFT1COL: TStringField;
    qryGetVBMake_WarpTempWARP1STRU: TStringField;
    qryGetVBMake_WarpTempWARP1TWIST: TStringField;
    qryGetVBMake_WarpTempWARP1COL: TStringField;
    qryGetVBMake_WarpTempPCSWWIP: TFloatField;
    qryGetVBMake_WarpTempPCSVWIP: TFloatField;
    qryGetVBMake_FinTempVBSTRU: TStringField;
    qryGetVBMake_FinTempVBCOL: TStringField;
    qryGetVBMake_FinTempVBFIN: TStringField;
    qryGetVBMake_FinTempMIN127: TIntegerField;
    qryGetVBMake_FinTempSTK127: TIntegerField;
    qryGetVBMake_FinTempORD127: TIntegerField;
    qryGetVBMake_FinTempPORD127: TFloatField;
    qryGetVBMake_FinTempPSTK127: TFloatField;
    qryGetVBMake_FinTempMIN89: TIntegerField;
    qryGetVBMake_FinTempSTK89: TIntegerField;
    qryGetVBMake_FinTempORD89: TIntegerField;
    qryGetVBMake_FinTempPORD89: TFloatField;
    qryGetVBMake_FinTempPSTK89: TFloatField;
    qryGetVBMake_FinTempMIN2070: TIntegerField;
    qryGetVBMake_FinTempSTK2070: TIntegerField;
    qryGetVBMake_FinTempORD2070: TIntegerField;
    qryGetVBMake_FinTempPORD2070: TFloatField;
    qryGetVBMake_FinTempPSTK2070: TFloatField;
    qryGetVBMake_FinTempPTOTORD: TFloatField;
    qryGetVBMake_FinTempPTOTSTK: TFloatField;
    qryGetVBMake_FinTempPTOTRQD: TFloatField;
    qryGetVBMake_FinTempFWIP: TFloatField;
    qryGetVBMake_FinTempFWSLITMRQD: TFloatField;
    qryGetVBMake_FinTempPCEWARPLENGTH: TFloatField;
    qryGetVBMake_FinTempPCEFINLENGTH: TFloatField;
    qryGetVBMake_FinTempFWWARPMRQD: TFloatField;
    qryGetVBMake_FinTempSALE89: TFloatField;
    qryGetVBMake_FinTempSALE127: TFloatField;
    qryGetVBMake_FinTempSALE2070: TFloatField;
    qryGetVBMake_FinTempFIRSTSALEDATE: TDateTimeField;
    qryGetVBMake_FinTempALLOC127: TIntegerField;
    qryGetVBMake_FinTempALLOC89: TIntegerField;
    qryGetVBMake_FinTempALLOC2070: TIntegerField;
    qryGetVBMake_FinTempREMAIN127: TIntegerField;
    qryGetVBMake_FinTempREMAIN89: TIntegerField;
    qryGetVBMake_FinTempREMAIN2070: TIntegerField;
    qryGetVBMake_FinTempDIVBYDAYS: TIntegerField;
    qryGetVBMake_FinTempMONTHSSALES: TSmallintField;
    qryGetVBMake_FinTempAVESALE89: TFloatField;
    qryGetVBMake_FinTempAVESALE127: TFloatField;
    qryGetVBMake_FinTempAVESALE2070: TFloatField;
    qryGetVBMake_FinTempMINCALCMULTIPLIER89: TFloatField;
    qryGetVBMake_FinTempMINCALCMULTIPLIER127: TFloatField;
    qryGetVBMake_FinTempMINCALCMULTIPLIER2070: TFloatField;
    qryGetVBMake_FinTempMAKESTKMULTIPLIER89: TFloatField;
    qryGetVBMake_FinTempMAKESTKMULTIPLIER127: TFloatField;
    qryGetVBMake_FinTempMAKESTKMULTIPLIER2070: TFloatField;
    qryGetVBMake_FinTempPCSMIN127: TFloatField;
    qryGetVBMake_FinTempPCSAVESALE127: TFloatField;
    qryGetVBMake_FinTempPCSSTK127: TFloatField;
    qryGetVBMake_FinTempPCSORD127: TFloatField;
    qryGetVBMake_FinTempPCSALLOC127: TFloatField;
    qryGetVBMake_FinTempPCSREMAIN127: TFloatField;
    qryGetVBMake_FinTempPCSMIN89: TFloatField;
    qryGetVBMake_FinTempPCSAVESALE89: TFloatField;
    qryGetVBMake_FinTempPCSSTK89: TFloatField;
    qryGetVBMake_FinTempPCSORD89: TFloatField;
    qryGetVBMake_FinTempPCSALLOC89: TFloatField;
    qryGetVBMake_FinTempPCSREMAIN89: TFloatField;
    qryGetVBMake_FinTempPCSMIN2070: TFloatField;
    qryGetVBMake_FinTempPCSAVESALE2070: TFloatField;
    qryGetVBMake_FinTempPCSSTK2070: TFloatField;
    qryGetVBMake_FinTempPCSORD2070: TFloatField;
    qryGetVBMake_FinTempPCSALLOC2070: TFloatField;
    qryGetVBMake_FinTempPCSREMAIN2070: TFloatField;
    qryGetVBMake_FinTempPCSFWIP: TFloatField;
    qryGetVBMake_FinTempPCSPORD127: TFloatField;
    qryGetVBMake_FinTempPCSPSTK127: TFloatField;
    qryGetVBMake_FinTempPCSPORD89: TFloatField;
    qryGetVBMake_FinTempPCSPSTK89: TFloatField;
    qryGetVBMake_FinTempPCSPORD2070: TFloatField;
    qryGetVBMake_FinTempPCSPSTK2070: TFloatField;
    qryGetVBMake_FinTempPCSPTOTORD: TFloatField;
    qryGetVBMake_FinTempPCSPTOTSTK: TFloatField;
    qryGetVBMake_FinTempPCSPTOTRQD: TFloatField;
    qryGetVBMake_FinTempPCSFWSLITMRQD: TFloatField;
    qryGetVBMake_FinTempPCSFWWARPMRQD: TFloatField;
    qryGetVBMake_FinTempSTK2070OK: TIntegerField;
    qryGetVBMake_FinTempSTK2070RESLIT: TIntegerField;
    qryGetVBMake_FinTempPCSSTK2070OK: TFloatField;
    qryGetVBMake_FinTempPCSSTK2070RESLIT: TFloatField;
    qryGetVBMake_FinTempPCSPHELDORD127: TFloatField;
    qryGetVBMake_FinTempPCSPHELDORD89: TFloatField;
    qryGetVBMake_FinTempPCSPHELDORD2070: TFloatField;
    qryGetVBMake_FinTempPCSPNOTHELDORD127: TFloatField;
    qryGetVBMake_FinTempPCSPNOTHELDORD89: TFloatField;
    qryGetVBMake_FinTempPCSPNOTHELDORD2070: TFloatField;
    qryGetVBMake_FinTempDISCON127: TStringField;
    qryGetVBMake_FinTempDISCON89: TStringField;
    qryGetVBMake_FinTempDISCON2070: TStringField;
    qryGetVBMake_WpYarnTemp: TQuery;
    qryUpdateVBMake_WpYarn: TQuery;
    qryInsertMissingWpYarn: TQuery;
    qryGetVBMake_WtYarnTemp: TQuery;
    qryUpdateVBMake_WtYarn: TQuery;
    qryInsertMissingWtYarn: TQuery;
    qryGetVBMake_WpYarnTempWPTYPE: TStringField;
    qryGetVBMake_WpYarnTempWPCOL: TStringField;
    qryGetVBMake_WpYarnTempYNSTRU: TStringField;
    qryGetVBMake_WpYarnTempYNTWIST: TStringField;
    qryGetVBMake_WpYarnTempYNCOL: TStringField;
    qryGetVBMake_WpYarnTempWPYNMRQD: TFloatField;
    qryGetVBMake_WpYarnTempWPYNRQD: TFloatField;
    qryGetVBMake_WpYarnTempWPYNSTOCKMETRES: TFloatField;
    qryGetVBMake_WpYarnTempWPYNMETRESTOKGS: TFloatField;
    qryGetVBMake_WpYarnTempWPYNTOSPIN: TFloatField;
    qryGetVBMake_WtYarnTempYNSTRU: TStringField;
    qryGetVBMake_WtYarnTempYNTWIST: TStringField;
    qryGetVBMake_WtYarnTempYNCOL: TStringField;
    qryGetVBMake_WtYarnTempWFTYNRQD: TFloatField;
    qryGetVBMake_WtYarnTempWFTYNSTOCK: TFloatField;
    qryGetVBMake_WtYarnTempWFTYNTOSPIN: TFloatField;
    qryStatAveSTRIPS: TSmallintField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure RunMakeBtnClick(Sender: TObject);
    procedure VBMakeFinGridDblClick(Sender: TObject);
    procedure edtStruSelectionChange(Sender: TObject);
    procedure PrintSpdBtnClick(Sender: TObject);
    procedure btnCalcStatClick(Sender: TObject);
    procedure VBMakeFinGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
//  PixelsInInchx: integer;       { Stores Pixels per inch }
//  LineHeight: Integer;          { Stores the line height }
//  AmountPrinted: integer;       { Stores amount, in pixels, printed on a page }
//  TenthsOfInchPixelsY: integer; { Pixels in 1/10 of an inch used for line spacing }
//  DateHeading:string;
//  HeaderDescr:string;
    ToDateStr:string[11];
    ToDate:TDateTime;
    procedure VBMakeGetToDate;
    procedure VBMakeDelete;
    procedure VBMakeSetup;
    {procedure VBMakeFindMin;}
    procedure VBMakeFindStock;
    procedure VBMakeFindOrders;
    procedure VBMakeFindAlloc;
    procedure VBMakeFindWeaving;
    procedure VBMakeFindWoven;
    procedure VBMakeFindFinished;
    procedure VBMakeFindSlit;
    procedure VBMakeCalcSales;
    procedure VBMakeCompute;
    procedure VBMakeMakeLive; //added DL020228
  public
    { Public declarations }
  end;

var
  VBMakeForm: TVBMakeForm;

implementation

{$R *.DFM}

uses VBMain,Dialogs,printers, Pickdate, VBUtils;

const StkMinQty=1; {make twice the stock minimum; 1 on 1/8/97}

procedure TVBMakeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{  if VBMake.State in [dsEdit,dsInsert] then
  begin
    MessageDlg('Cancel edits or post before closing',
      mtInformation, [mbOK], 0);
    Action := caNone;
    Exit;
  end;}
  qryUpdateStats.Close; //added DL040700
  qryStatAve.Close; //added DL040700
  VBParamsQuery.Close;
  qryVBMakeWarpYarn.Close;
  qryVBMakeWeftYarn.Close;
  qryVBMake_Warp.Close;
  VBMake_Fin.Close;
  VBMake.Close;
  VBMakeForm.Release;
end;

procedure TVBMakeForm.FormShow(Sender: TObject);
begin
  VBMake.Open;
  VBMake_Fin.Open;
  qryVBMake_Warp.Open;
  qryVBMakeWarpYarn.Open;
  qryVBMakeWeftYarn.Open;
  VBParamsQuery.Open;
  StatusBar.Panels.Items[1].Text:='Ready';
end;

procedure TVBMakeForm.CloseBitBtnClick(Sender: TObject);
begin
{  if VBMake.State in [dsEdit, dsInsert] then
    MessageDlg('Cancel edits or post Make before closing',
      mtInformation, [mbOK], 0)
  else}
    Close;
end;

procedure TVBMakeForm.VBMakeDelete;
begin
  StatusBar.Panels.Items[1].Text:='Getting Ready';
  VBMake.First;
  Application.ProcessMessages;
{  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('delete from vbmake');
  MyQuery.Prepare;
  MyQuery.ExecSQL;
  MyQuery.Close;}
  // VBMakeFin and VBMake_Warp not cleared as at DL020301
  // because whole process optimised again
  SPVBMakeDelete.ExecProc;
end;

procedure TVBMakeForm.VBMakeSetup;
begin
  StatusBar.Panels.Items[1].Text:='Fetching Types';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeSetup.ExecProc;
  //VBMake_Fin.Refresh;
end;

{procedure TVBMakeForm.VBMakeFindMin;
var
  ErrorString:string[4];
begin
  StatusBar.Panels.Items[1].Text:='Fetching Minima';
  VBMake.First;
  Application.ProcessMessages;
  MyQuery.SQL.Clear;
  MyQuery.SQL.Add('select vbstru,vbcol,vbwidth,stkmin');
  MyQuery.SQL.Add('from vbstockmin');
  MyQuery.SQL.Add('where stkmin<>0');
  MyQuery.Prepare;
  MyQuery.Open;
  MyQuery.First;
  while not MyQuery.EOF do
  begin
    VBMake.SetKey;
    VBMakeVBStru.Value:=MyQuery.Fields[0].AsString;
    VBMakeVBCol.Value:=MyQuery.Fields[1].AsString;
    ErrorString:=MyQuery.Fields[0].AsString+MyQuery.Fields[1].AsString;
    if not VBMake.GotoKey then
    begin
      MainForm.Database.RollBack;
      VBMake.Refresh;
      raise Exception.Create('Min:Error at '+ErrorString);
    end;
    VBMake.Edit;
    if MyQuery.Fields[2].AsInteger=89 then
      VBMakeMin89.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=127 then
      VBMakeMin127.Value:=MyQuery.Fields[3].AsInteger
    else if MyQuery.Fields[2].AsInteger=2070 then
      VBMakeMin2070.Value:=MyQuery.Fields[3].AsInteger;
    VBMake.Post;
    MyQuery.Next;
  end;
  MyQuery.Close;
end;}

procedure TVBMakeForm.VBMakeFindStock;
{var
  ErrorString:string[4];}
begin
  StatusBar.Panels.Items[1].Text:='Calculating Stock';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeFindStock.ExecProc;
  //VBMake_Fin.Refresh;
  //Discontinued lookup added DL25102000
  StatusBar.Panels.Items[1].Text:='Finding Discontinued Stock';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeDiscon.ExecProc;
  //VBMake_Fin.Refresh;
end;

procedure TVBMakeForm.VBMakeFindOrders;
{var
  ErrorString:string[4];}
begin
  StatusBar.Panels.Items[1].Text:='Calculating Orders';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeFindOrders.ExecProc;
  //VBMake_Fin.Refresh;
  StatusBar.Panels.Items[1].Text:='Calculating Orders Held';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeFindOrdersHeld.ExecProc;
  //VBMake_Fin.Refresh;
  StatusBar.Panels.Items[1].Text:='Calculating Orders Not Held';
  VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeFindOrdersNotHeld.ExecProc;
  VBMake_Fin.Refresh;
end;

procedure TVBMakeForm.VBMakeFindAlloc;
begin
  StatusBar.Panels.Items[1].Text:='Calculating Alloc';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeFindAlloc.ExecProc;
  //VBMake_Fin.Refresh;
end;

procedure TVBMakeForm.VBMakeFindWeaving;
begin
  StatusBar.Panels.Items[1].Text:='Calculating Weaving WIP';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeFindWeaving.ExecProc;
  //VBMake_Fin.Refresh;
end;

procedure TVBMakeForm.VBMakeFindWoven;
begin
  StatusBar.Panels.Items[1].Text:='Calculating Woven WIP';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeFindWoven.ExecProc;
  //VBMake_Fin.Refresh;
end;

procedure TVBMakeForm.VBMakeFindFinished;
begin
  StatusBar.Panels.Items[1].Text:='Calculating Finished WIP';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeFindFin.ExecProc;
  //VBMake_Fin.Refresh;
end;

procedure TVBMakeForm.VBMakeFindSlit;
begin
  StatusBar.Panels.Items[1].Text:='Calculating Slit WIP';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeFindSlit.ExecProc;
  //VBMake_Fin.Refresh;
end;

procedure TVBMakeForm.VBMakeCalcSales;
begin
  StatusBar.Panels.Items[1].Text:='Calculating Average Monthly Sales and StkMin per formula';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeCalcSales.ExecProc;
  //VBMake_Fin.Refresh;
end;

procedure TVBMakeForm.VBMakeCompute;
begin
  StatusBar.Panels.Items[1].Text:='Computing metre Rqts';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  SPVBMakeCompute.Params[0].AsInteger:=StkMinQty;
  SPVBMakeCompute.ExecProc;
  //VBMake_Fin.Refresh;
end;

procedure TVBMakeForm.VBMakeMakeLive;
begin
  //this method added DL020228: 20,000 replication updates to 2,000
  //this method optimised DL020301: 2,000 replication updates to only those required = ?
  StatusBar.Panels.Items[1].Text:='Making Live';
  //VBMake_Fin.First;
  Application.ProcessMessages;
  //SPVBMakeMakeLive.ExecProc; //-- removed DL020301
  //VBMake_Fin.Refresh;

  //alternatively don't delete and only insert or update the relevant rows!!!
  //updated DL020301
  MainForm.Database.Commit;

  MainForm.Database.StartTransaction;
  //1) First Update records that need updating for VBMake_Fin
  qryGetVBMake_FinTemp.Close;
  qryGetVBMake_FinTemp.Open;
  qryGetVBMake_FinTemp.First;
  while not qryGetVBMake_FinTemp.EOF do
  begin
    StatusBar.Panels.Items[1].Text:='Making VBMake_Fin Live: Updating '+
      qryGetVBMake_FinTempVBSTRU.AsString+qryGetVBMake_FinTempVBCOL.AsString+
      qryGetVBMake_FinTempVBFIN.AsString;
    Application.ProcessMessages;
    qryUpdateVBMake_Fin.Close;
    qryUpdateVBMake_Fin.ParamByName('VBStru').AsString:=qryGetVBMake_FinTempVBSTRU.AsString;
    qryUpdateVBMake_Fin.ParamByName('VBCol').AsString:=qryGetVBMake_FinTempVBCOL.AsString;
    qryUpdateVBMake_Fin.ParamByName('VBFin').AsString:=qryGetVBMake_FinTempVBFIN.AsString;
    qryUpdateVBMake_Fin.ParamByName('Min127').AsInteger:=qryGetVBMake_FinTempMIN127.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('Stk127').AsInteger:=qryGetVBMake_FinTempSTK127.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('Ord127').AsInteger:=qryGetVBMake_FinTempORD127.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('POrd127').AsFloat:=qryGetVBMake_FinTempPORD127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PStk127').AsFloat:=qryGetVBMake_FinTempPSTK127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('Min89').AsInteger:=qryGetVBMake_FinTempMIN89.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('Stk89').AsInteger:=qryGetVBMake_FinTempSTK89.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('Ord89').AsInteger:=qryGetVBMake_FinTempORD89.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('POrd89').AsFloat:=qryGetVBMake_FinTempPORD89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PStk89').AsFloat:=qryGetVBMake_FinTempPSTK89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('Min2070').AsInteger:=qryGetVBMake_FinTempMIN2070.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('Stk2070').AsInteger:=qryGetVBMake_FinTempSTK2070.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('Ord2070').AsInteger:=qryGetVBMake_FinTempORD2070.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('POrd2070').AsFloat:=qryGetVBMake_FinTempPORD2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PStk2070').AsFloat:=qryGetVBMake_FinTempPSTK2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PTotOrd').AsFloat:=qryGetVBMake_FinTempPTOTORD.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PTotStk').AsFloat:=qryGetVBMake_FinTempPTOTSTK.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PTotRqd').AsFloat:=qryGetVBMake_FinTempPTOTRQD.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('FWIP').AsFloat:=qryGetVBMake_FinTempFWIP.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('FWSlitMRqd').AsFloat:=qryGetVBMake_FinTempFWSLITMRQD.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PceWarpLength').AsFloat:=qryGetVBMake_FinTempPCEWARPLENGTH.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PceFinLength').AsFloat:=qryGetVBMake_FinTempPCEFINLENGTH.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('FWWarpMRqd').AsFloat:=qryGetVBMake_FinTempFWWARPMRQD.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('Sale89').AsFloat:=qryGetVBMake_FinTempSALE89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('Sale127').AsFloat:=qryGetVBMake_FinTempSALE127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('Sale2070').AsFloat:=qryGetVBMake_FinTempSALE2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('FirstSaleDate').AsDateTime:=qryGetVBMake_FinTempFIRSTSALEDATE.AsDateTime;
    qryUpdateVBMake_Fin.ParamByName('Alloc127').AsInteger:=qryGetVBMake_FinTempALLOC127.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('Alloc89').AsInteger:=qryGetVBMake_FinTempALLOC89.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('Alloc2070').AsInteger:=qryGetVBMake_FinTempALLOC2070.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('Remain127').AsInteger:=qryGetVBMake_FinTempREMAIN127.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('Remain89').AsInteger:=qryGetVBMake_FinTempREMAIN89.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('Remain2070').AsInteger:=qryGetVBMake_FinTempREMAIN2070.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('DivByDays').AsInteger:=qryGetVBMake_FinTempDIVBYDAYS.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('MonthsSales').AsInteger:=qryGetVBMake_FinTempMONTHSSALES.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('AveSale89').AsFloat:=qryGetVBMake_FinTempAVESALE89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('AveSale127').AsFloat:=qryGetVBMake_FinTempAVESALE127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('AveSale2070').AsFloat:=qryGetVBMake_FinTempAVESALE2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('MinCalcMultiplier89').AsFloat:=qryGetVBMake_FinTempMINCALCMULTIPLIER89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('MinCalcMultiplier127').AsFloat:=qryGetVBMake_FinTempMINCALCMULTIPLIER127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('MinCalcMultiplier2070').AsFloat:=qryGetVBMake_FinTempMINCALCMULTIPLIER2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('MakeStkMultiplier89').AsFloat:=qryGetVBMake_FinTempMAKESTKMULTIPLIER89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('MakeStkMultiplier127').AsFloat:=qryGetVBMake_FinTempMAKESTKMULTIPLIER127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('MakeStkMultiplier2070').AsFloat:=qryGetVBMake_FinTempMAKESTKMULTIPLIER2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsMin127').AsFloat:=qryGetVBMake_FinTempPCSMIN127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsAveSale127').AsFloat:=qryGetVBMake_FinTempPCSAVESALE127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsStk127').AsFloat:=qryGetVBMake_FinTempPCSSTK127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsOrd127').AsFloat:=qryGetVBMake_FinTempPCSORD127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsAlloc127').AsFloat:=qryGetVBMake_FinTempPCSALLOC127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsRemain127').AsFloat:=qryGetVBMake_FinTempPCSREMAIN127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsMin89').AsFloat:=qryGetVBMake_FinTempPCSMIN89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsAveSale89').AsFloat:=qryGetVBMake_FinTempPCSAVESALE89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsStk89').AsFloat:=qryGetVBMake_FinTempPCSSTK89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsOrd89').AsFloat:=qryGetVBMake_FinTempPCSORD89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsAlloc89').AsFloat:=qryGetVBMake_FinTempPCSALLOC89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsRemain89').AsFloat:=qryGetVBMake_FinTempPCSREMAIN89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsMin2070').AsFloat:=qryGetVBMake_FinTempPCSMIN2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsAveSale2070').AsFloat:=qryGetVBMake_FinTempPCSAVESALE2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsStk2070').AsFloat:=qryGetVBMake_FinTempPCSSTK2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsOrd2070').AsFloat:=qryGetVBMake_FinTempPCSORD2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsAlloc2070').AsFloat:=qryGetVBMake_FinTempPCSALLOC2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsRemain2070').AsFloat:=qryGetVBMake_FinTempPCSREMAIN2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsFWIP').AsFloat:=qryGetVBMake_FinTempPCSFWIP.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPOrd127').AsFloat:=qryGetVBMake_FinTempPCSPORD127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPStk127').AsFloat:=qryGetVBMake_FinTempPCSPSTK127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPOrd89').AsFloat:=qryGetVBMake_FinTempPCSPORD89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPStk89').AsFloat:=qryGetVBMake_FinTempPCSPSTK89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPOrd2070').AsFloat:=qryGetVBMake_FinTempPCSPORD2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPStk2070').AsFloat:=qryGetVBMake_FinTempPCSPSTK2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPTotOrd').AsFloat:=qryGetVBMake_FinTempPCSPTOTORD.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPTotStk').AsFloat:=qryGetVBMake_FinTempPCSPTOTSTK.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPTotRqd').AsFloat:=qryGetVBMake_FinTempPCSPTOTRQD.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsFWSlitMRqd').AsFloat:=qryGetVBMake_FinTempPCSFWSLITMRQD.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsFWWarpMRqd').AsFloat:=qryGetVBMake_FinTempPCSFWWARPMRQD.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('Stk2070OK').AsInteger:=qryGetVBMake_FinTempSTK2070OK.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('Stk2070RESLIT').AsInteger:=qryGetVBMake_FinTempSTK2070RESLIT.AsInteger;
    qryUpdateVBMake_Fin.ParamByName('PcsStk2070OK').AsFloat:=qryGetVBMake_FinTempPCSSTK2070OK.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsStk2070RESLIT').AsFloat:=qryGetVBMake_FinTempPCSSTK2070RESLIT.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPHeldOrd127').AsFloat:=qryGetVBMake_FinTempPCSPHELDORD127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPHeldOrd89').AsFloat:=qryGetVBMake_FinTempPCSPHELDORD89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPHeldOrd2070').AsFloat:=qryGetVBMake_FinTempPCSPHELDORD2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPNotHeldOrd127').AsFloat:=qryGetVBMake_FinTempPCSPNOTHELDORD127.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPNotHeldOrd89').AsFloat:=qryGetVBMake_FinTempPCSPNOTHELDORD89.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('PcsPNotHeldOrd2070').AsFloat:=qryGetVBMake_FinTempPCSPNOTHELDORD2070.AsFloat;
    qryUpdateVBMake_Fin.ParamByName('Discon127').AsString:=qryGetVBMake_FinTempDISCON127.AsString;
    qryUpdateVBMake_Fin.ParamByName('Discon89').AsString:=qryGetVBMake_FinTempDISCON89.AsString;
    qryUpdateVBMake_Fin.ParamByName('Discon2070').AsString:=qryGetVBMake_FinTempDISCON2070.AsString;
    qryUpdateVBMake_Fin.ExecSQL;
    qryGetVBMake_FinTemp.Next;
  end;
  qryGetVBMake_FinTemp.Close;
  //2) Then insert records that need inserting for VBMake_Fin
  qryInsertMissingFin.Close;
  qryInsertMissingFin.ExecSQL;
  //3) First Update records that need updating for VBMake_Warp
  qryGetVBMake_WarpTemp.Close;
  qryGetVBMake_WarpTemp.Open;
  qryGetVBMake_WarpTemp.First;
  while not qryGetVBMake_WarpTemp.EOF do
  begin
    StatusBar.Panels.Items[1].Text:='Making VBMake_Warp Live: Updating '+
      qryGetVBMake_WarpTempVBSTRU.AsString+qryGetVBMake_WarpTempVBCOL.AsString;
    Application.ProcessMessages;
    qryUpdateVBMake_Warp.Close;
    qryUpdateVBMake_Warp.ParamByName('VBStru').AsString:=qryGetVBMake_WarpTempVBSTRU.AsString;
    qryUpdateVBMake_Warp.ParamByName('VBCol').AsString:=qryGetVBMake_WarpTempVBCOL.AsString;
    qryUpdateVBMake_Warp.ParamByName('FWWarpMRqd').AsFloat:=qryGetVBMake_WarpTempFWWARPMRQD.AsFloat;
    qryUpdateVBMake_Warp.ParamByName('VWIP').AsFloat:=qryGetVBMake_WarpTempVWIP.AsFloat;
    qryUpdateVBMake_Warp.ParamByName('WWIP').AsFloat:=qryGetVBMake_WarpTempWWIP.AsFloat;
    qryUpdateVBMake_Warp.ParamByName('FWWarpMToPlan').AsFloat:=qryGetVBMake_WarpTempFWWARPMTOPLAN.AsFloat;
    qryUpdateVBMake_Warp.ParamByName('PceWarpLength').AsFloat:=qryGetVBMake_WarpTempPCEWARPLENGTH.AsFloat;
    qryUpdateVBMake_Warp.ParamByName('PcsRqdToPlan').AsFloat:=qryGetVBMake_WarpTempPCSRQDTOPLAN.AsFloat;
    qryUpdateVBMake_Warp.ParamByName('PceWft1Weight').AsFloat:=qryGetVBMake_WarpTempPCEWFT1WEIGHT.AsFloat;
    qryUpdateVBMake_Warp.ParamByName('Wft1YnRqd').AsFloat:=qryGetVBMake_WarpTempWFT1YNRQD.AsFloat;
    qryUpdateVBMake_Warp.ParamByName('WarpType').AsString:=qryGetVBMake_WarpTempWARPTYPE.AsString;
    qryUpdateVBMake_Warp.ParamByName('WarpCol').AsString:=qryGetVBMake_WarpTempWARPCOL.AsString;
    qryUpdateVBMake_Warp.ParamByName('Weft1Stru').AsString:=qryGetVBMake_WarpTempWEFT1STRU.AsString;
    qryUpdateVBMake_Warp.ParamByName('Weft1Twist').AsString:=qryGetVBMake_WarpTempWEFT1TWIST.AsString;
    qryUpdateVBMake_Warp.ParamByName('Weft1Col').AsString:=qryGetVBMake_WarpTempWEFT1COL.AsString;
    qryUpdateVBMake_Warp.ParamByName('Warp1Stru').AsString:=qryGetVBMake_WarpTempWARP1STRU.AsString;
    qryUpdateVBMake_Warp.ParamByName('Warp1Twist').AsString:=qryGetVBMake_WarpTempWARP1TWIST.AsString;
    qryUpdateVBMake_Warp.ParamByName('Warp1Col').AsString:=qryGetVBMake_WarpTempWARP1COL.AsString;
    qryUpdateVBMake_Warp.ParamByName('PcsWWIP').AsFloat:=qryGetVBMake_WarpTempPCSWWIP.AsFloat;
    qryUpdateVBMake_Warp.ParamByName('PcsVWIP').AsFloat:=qryGetVBMake_WarpTempPCSVWIP.AsFloat;
    qryUpdateVBMake_Warp.ExecSQL;
    qryGetVBMake_WarpTemp.Next;
  end;
  qryGetVBMake_WarpTemp.Close;
  //4) Then insert records that need inserting for VBMake_Warp
  qryInsertMissingWarp.Close;
  qryInsertMissingWarp.ExecSQL;

  //5) Update Records for VBMake_WpYarn
  qryGetVBMake_WpYarnTemp.Close;
  qryGetVBMake_WpYarnTemp.Open;
  qryGetVBMake_WpYarnTemp.First;
  while not qryGetVBMake_WpYarnTemp.EOF do
  begin
    StatusBar.Panels.Items[1].Text:='Making VBMake_WpYarn Live: Updating '+
      qryGetVBMake_WpYarnTempWPTYPE.AsString+qryGetVBMake_WpYarnTempWPCOL.AsString;
    Application.ProcessMessages;
    qryUpdateVBMake_WpYarn.Close;
    qryUpdateVBMake_WpYarn.ParamByName('WPTYPE').AsString:=qryGetVBMake_WpYarnTempWPTYPE.AsString;
    qryUpdateVBMake_WpYarn.ParamByName('WPCOL').AsString:=qryGetVBMake_WpYarnTempWPCOL.AsString;
    qryUpdateVBMake_WpYarn.ParamByName('YNSTRU').AsString:=qryGetVBMake_WpYarnTempYNSTRU.AsString;
    qryUpdateVBMake_WpYarn.ParamByName('YNTWIST').AsString:=qryGetVBMake_WpYarnTempYNTWIST.AsString;
    qryUpdateVBMake_WpYarn.ParamByName('YNCOL').AsString:=qryGetVBMake_WpYarnTempYNCOL.AsString;
    qryUpdateVBMake_WpYarn.ParamByName('WPYNMRQD').AsFloat:=qryGetVBMake_WpYarnTempWPYNMRQD.AsFloat;
    qryUpdateVBMake_WpYarn.ParamByName('WPYNRQD').AsFloat:=qryGetVBMake_WpYarnTempWPYNRQD.AsFloat;
    qryUpdateVBMake_WpYarn.ParamByName('WPYNSTOCKMETRES').AsFloat:=qryGetVBMake_WpYarnTempWPYNSTOCKMETRES.AsFloat;
    qryUpdateVBMake_WpYarn.ParamByName('WPYNMETRESTOKGS').AsFloat:=qryGetVBMake_WpYarnTempWPYNMETRESTOKGS.AsFloat;
    qryUpdateVBMake_WpYarn.ParamByName('WPYNTOSPIN').AsFloat:=qryGetVBMake_WpYarnTempWPYNTOSPIN.AsFloat;
    qryGetVBMake_WpYarnTemp.Next;
  end;
  qryGetVBMake_WpYarnTemp.Close;
  //6) Insert Missing Records for VBMake_WpYarn
  qryInsertMissingWpYarn.Close;
  qryInsertMissingWpYarn.ExecSQL;

  //7) Update Records for VBMake_WtYarn
  qryGetVBMake_WtYarnTemp.Close;
  qryGetVBMake_WtYarnTemp.Open;
  qryGetVBMake_WtYarnTemp.First;
  while not qryGetVBMake_WtYarnTemp.EOF do
  begin
    StatusBar.Panels.Items[1].Text:='Making VBMake_WtYarn Live: Updating '+
      qryGetVBMake_WtYarnTempYNSTRU.AsString+
      qryGetVBMake_WtYarnTempYNTWIST.AsString+
      qryGetVBMake_WtYarnTempYNCOL.AsString;
    Application.ProcessMessages;
    qryUpdateVBMake_WtYarn.Close;
    qryUpdateVBMake_WtYarn.ParamByName('YNSTRU').AsString:=qryGetVBMake_WtYarnTempYNSTRU.AsString;
    qryUpdateVBMake_WtYarn.ParamByName('YNTWIST').AsString:=qryGetVBMake_WtYarnTempYNTWIST.AsString;
    qryUpdateVBMake_WtYarn.ParamByName('YNCOL').AsString:=qryGetVBMake_WtYarnTempYNCOL.AsString;
    qryUpdateVBMake_WtYarn.ParamByName('WFTYNRQD').AsFloat:=qryGetVBMake_WtYarnTempWFTYNRQD.AsFloat;
    qryUpdateVBMake_WtYarn.ParamByName('WFTYNSTOCK').AsFloat:=qryGetVBMake_WtYarnTempWFTYNSTOCK.AsFloat;
    qryUpdateVBMake_WtYarn.ParamByName('WFTYNTOSPIN').AsFloat:=qryGetVBMake_WtYarnTempWFTYNTOSPIN.AsFloat;
    qryGetVBMake_WtYarnTemp.Next;
  end;
  qryGetVBMake_WtYarnTemp.Close;
  //8) Insert Missing Records for VBMake_WtYarn
  qryInsertMissingWtYarn.Close;
  qryInsertMissingWtYarn.ExecSQL;

  MainForm.Database.Commit;
end;

procedure TVBMakeForm.VBMakeGetToDate();
begin
  BrDateForm.Date:=date;  {start with today's date}
  if BRDateForm.ShowModal=mrOK then
  begin
    ToDate:=BRDateForm.Date;
    ToDateStr:=FormatDateTime('dd-mmm-yyyy',BRDateForm.Date); {dd mmm yyyy}
  end;
end;

procedure TVBMakeForm.RunMakeBtnClick(Sender: TObject);
begin
  {1. delete records from VBMake}
  {2. set up VBMake Stru and Col incl pcs length and weight}
  {3. find minimum values for Stru and Col}
  {4. find stock values for Stru and Col for 89,127,2070 (firsts)}
  {5. find outstanding order quantities}
  {6. find wip full width greige metres}
  {7. calculate total sales}
  {8. compute metre (was piece) requirements+compute planned pieces and weft yn rqts}
//  VBMakeGetToDate();
  Screen.Cursor := crHourglass;                 { Show hourglass cursor }
  Application.ProcessMessages;
  VBMake_Fin.Close; //xx plus two other tables, reaonly off, on
  VBMake_Fin.ReadOnly:=false; {added DL4/2/97}
  VBMake_Fin.Open;
  MainForm.Database.StartTransaction;
  MyQuery.Close;
  VBMakeDelete;
  VBMakeSetup;
  VBMakeCalcSales; {added DL4/2/97} {moved to front on 1/8/97}
  {VBMakeFindMin; {set to average sales on 1/8/97}
  VBMakeFindStock;
  VBMakeFindOrders;
  VBMakeFindAlloc;
  VBMakeFindFinished;
  VBMakeFindSlit; {added DL4/2/97 so that slit metres removed from partly slip warps}
  VBMakeFindWeaving;
  VBMakeFindWoven;
  VBMakeCompute;
  VBMakeMakeLive; //added DL020228
  SPVBParams.ExecProc;
  MainForm.Database.Commit;
  VBParamsQuery.Close;
  VBParamsQuery.Open;
  VBMake_Fin.Close;
  VBMake_Fin.ReadOnly:=true; {added DL4/2/97}
  VBMake_Fin.Open;
  Screen.Cursor := crDefault;                  { Always restore to normal }
  StatusBar.Panels.Items[1].Text:='Ready';
  Application.ProcessMessages;
end;

procedure TVBMakeForm.VBMakeFinGridDblClick(Sender: TObject);
var
  MsgStr:string[30];
begin
  MsgStr:='Row: '+VBMakeVBCol.AsString+
    '; Col: '+VBMakeFinGrid.SelectedField.DisplayLabel;
  ShowMessage(MsgStr);
end;



procedure TVBMakeForm.edtStruSelectionChange(Sender: TObject);
begin
  //modified to allow for width 3 vbstru DL020301
  if length(edtStruSelection.Text)=3 then
  begin
    edtStruSelection.Text:=uppercase(edtStruSelection.Text);
    VBMake_Fin.Filter:='vbstru ='''+edtStruSelection.Text+'''';
    VBMake_Fin.Filtered:=true;
  end
  else if length(edtStruSelection.Text)=0 then
  begin
    edtStruSelection.Text:='';
    VBMake_Fin.Filtered:=false;
  end;
end;

procedure TVBMakeForm.PrintSpdBtnClick(Sender: TObject);
begin
  Print;
end;

procedure TVBMakeForm.btnCalcStatClick(Sender: TObject);
type
  tNetElements=array[0..499] of double;
var
  NetElements:tNetElements;
  VBStru:string[3]; //was 1 DL060901
  VBCol:string[3];
  VBFin:string[2];
  MetricWidth:integer;
  DespNo:integer;
  NetLength:double;
  Mean:double;
  StdDev:double;
  MinValue:double;
  MaxValue:double;
  Posn:integer;
  lSum:double;
  StatAveSale89,StatAveSale127,StatAveSale2070:double;
  NewTotal:double;
  NewMean:double;
  NewElements:integer;
  ix:integer;
  Strips:integer; //added DL030210
begin
  {insert into vbmake_fin_stat (vbstru,vbcol,vbfin)
    select distinct vt.vbstru,vt.vbcol,vt.vbfin
    from vbtype vt}
  //change DL030210 to allow any FW to work, not only 2070mm
  if MessageDlg('Run Average Stats Calculation?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;
  StatusBar.Panels.Items[1].Text:='Fetching Data';
  Application.ProcessMessages;
  qryStatAve.Close;
  qryStatAve.Open;
  qryStatAve.First;
  VBStru:='';
  VBCol:='';
  VBFin:='';
  StatAveSale89:=0;
  StatAveSale127:=0;
  StatAveSale2070:=0;
  MetricWidth:=0;
  while not qryStatAve.EOF do
  begin
    //pack an array with all elements in the current vbstru,vbcol,vbfin,metricwidth
    //if changing calculate the statistical average excl the outliers
    if (qryStatAveVBSTRU.AsString<>VBStru) or
       (qryStatAveVBCOL.AsString<>VBCol) or
       (qryStatAveVBFIN.AsString<>VBFin) or
       (qryStatAveMETRICWIDTH.AsInteger<>MetricWidth) then
    begin
      if VBStru<>'' then //do the calc and update after the first iteration through the loop
      begin
        //MeanAndStdDev(const Data: array of Double; var Mean, StdDev: Extended);
        //Posn+1 represents ArrayElements which is the # elements in the array
        ODMeanAndStdDev(NetElements, Mean, StdDev, Posn, lSum); //Posn is already incremented, so don't need +1
        MinValue:=Mean-StdDev;
        MaxValue:=Mean+StdDev;
        NewTotal:=0;
        NewElements:=0;
        for ix:=0 to Posn do //calculate the new average
        begin
          if (NetElements[ix]>=MinValue) and (NetElements[ix]<=MaxValue) then
          begin
            NewTotal:=NewTotal+NetElements[ix];
            NewElements:=NewElements+1;
          end;
        end;
        NewMean:=NewTotal/6; //six months for average
        {if NewElements=0 then
          NewMean:=0
        else
          NewMean:=NewTotal/NewElements;}
        if MetricWidth=89 then
          StatAveSale89:=NewMean
        else if MetricWidth=127 then
          StatAveSale127:=NewMean
        //else if MetricWidth=2070 then - removed DL030210
        else if Strips=1 then //added DL030210
          StatAveSale2070:=NewMean;
        //do the update if required - don't do unnecessary updates
        if (qryStatAveVBSTRU.AsString<>VBStru) or
           (qryStatAveVBCOL.AsString<>VBCol) or
           (qryStatAveVBFIN.AsString<>VBFin) then
        begin
          MainForm.Database.StartTransaction;
          qryUpdateStats.Close;
          qryUpdateStats.ParamByName('StatAveSale89').AsFloat:=StatAveSale89;
          qryUpdateStats.ParamByName('StatAveSale127').AsFloat:=StatAveSale127;
          qryUpdateStats.ParamByName('StatAveSale2070').AsFloat:=StatAveSale2070;
          qryUpdateStats.ParamByName('StatPcsAveSale89').AsFloat:=StatAveSale89/23;
          qryUpdateStats.ParamByName('StatPcsAveSale127').AsFloat:=StatAveSale127/16;
          qryUpdateStats.ParamByName('StatPcsAveSale2070').AsFloat:=StatAveSale2070;
          qryUpdateStats.ParamByName('VBStru').AsString:=VBStru;
          qryUpdateStats.ParamByName('VBCol').AsString:=VBCol;
          qryUpdateStats.ParamByName('VBFin').AsString:=VBFin;
          qryUpdateStats.ExecSQL;
          MainForm.Database.Commit;
          StatAveSale89:=0;
          StatAveSale127:=0;
          StatAveSale2070:=0;
        end;
      end;
      VBStru:=qryStatAveVBSTRU.AsString;
      VBCol:=qryStatAveVBCOL.AsString;
      VBFin:=qryStatAveVBFIN.AsString;
      MetricWidth:=qryStatAveMETRICWIDTH.AsInteger;
      Strips:=qryStatAveSTRIPS.AsInteger; //added DL030210
      StatusBar.Panels.Items[1].Text:='Processing '+VBStru+VBCol+VBFin+inttostr(MetricWidth);
      Application.ProcessMessages;
      Posn:=0;
      lSum:=0;
    end;
    NetElements[Posn]:=qryStatAveNETLENGTH.AsFloat;
    lSum:=lSum+NetElements[Posn];
    inc(Posn);
    qryStatAve.Next;
  end;
end;

procedure TVBMakeForm.VBMakeFinGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if VBMake_Fin.FieldByName('Discon127').AsString='Y' then
  begin
    VBMakeFinGrid.Canvas.Font.Color:=clRed;
    VBMakeFinGrid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

end.
