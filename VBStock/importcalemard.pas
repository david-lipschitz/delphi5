unit importcalemard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, DBTables, Db;

type
  TfrmImportCalemard = class(TForm)
    btnImport: TButton;
    StatusBar1: TStatusBar;
    btnClose: TButton;
    qryInsertStrips: TQuery;
    sprCalemardStrips: TStoredProc;
    OpenDialog1: TOpenDialog;
    qryCheck: TQuery;
    qryCheckFILEREF: TStringField;
    procedure btnImportClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  string9=string[9];
  string11=string[11];
  string21=string[21];
  string25=string[25];
  string35=string[35];
  //array of byte
  Stat_defauts_bandesType = array[1..30] of packed record
    metrage_brut:integer;// long in C++ v3.1
    metrage_net:integer;//long in C
    nb_defaut_court:array[1..10] of short; //int in C
    nb_defaut_long:array[1..10] of short;
  end;
  Stat_defauts_rouleauType = packed record
    metrage_brut:integer;
    metrage_net:integer;
    nb_defaut_court_etroit:array[1..10] of short;
    nb_defaut_court_large:array[1..10] of short;
    nb_defaut_long_etroit:array[1..10] of short;
    nb_defaut_long_large:array[1..10] of short;
  end;
  Stat_bilanType = packed record
    nombre_type_defauts : short;
    type1:array[1..10] of array[1..41] of char;
  end;
  Rouleau_produitType = packed record
    nombre_bandes : short;
    largeur_bande : array [1..30] of double;
    longueur_rouleau : double;
    largeur_rouleau : double;
    code_barre_rouleau : array [1..11] of char;
    qualite_produit : array [1..11] of char;
    type_produit : array [1..11] of char;
    code_interne_rouleau : array [1..11] of char;
    nom_operateur : array [1..21] of char;
    date : array [1..9] of char;
    position_centre : double;
    ecart_limite_ponctuel : double;
    texte1 : array [1..25] of char;
    texte2 : array [1..35] of char;
    texte3 : array [1..35] of char;
    texte4 : array [1..35] of char;
  end;

  AltogetherType=packed record
    Stat_defauts_bandes:Stat_defauts_bandesType;
    Stat_defauts_rouleau:Stat_defauts_rouleauType;
    Stat_bilan:Stat_bilanType;
    Rouleau_produit:Rouleau_produitType;
    Nombre_Etiquettes:short;
  end;

var
  frmImportCalemard: TfrmImportCalemard;
  Altogether : AltogetherType;
  AltogetherFile : file of AltogetherType;

implementation

uses Vbmain;

{$R *.DFM}

procedure TfrmImportCalemard.btnImportClick(Sender: TObject);
var
  ix,StripNo,DotPosn:integer;
  TempStr:string;
  FileRef:string;

  function ConvertString(astr:array of char):string;
  var
    iz:integer;
  begin
    iz:=0;
    Result:='';
    while (astr[iz]<>'#0') and (iz<=sizeof(astr)) do
    begin
      Result:=Result+astr[iz];
      iz:=iz+1;
    end;
  end;

begin
  {used whilst testing
  assignFile(AltogetherFile, 'c:\utils\recodef\648-13.sta');  //may need to get current directory name
  reset(AltogetherFile);
  read(AltogetherFile, Altogether);
  ShowMessage(inttostr(Altogether.Stat_defauts_bandes[1].Metrage_Brut));
  ShowMessage(inttostr(Altogether.Stat_defauts_rouleau.metrage_brut));
  ShowMessage(inttostr(Altogether.Stat_bilan.nombre_type_defauts));
  ShowMessage(inttostr(Altogether.Rouleau_produit.Nombre_Bandes));
  ShowMessage(inttostr(Altogether.Nombre_Etiquettes));}

  if OpenDialog1.Execute then
  begin
    //for each file selected
    for ix:=0 to OpenDialog1.Files.Count-1 do
    begin
      StatusBar1.Panels[0].Text:='Processing '+OpenDialog1.Files.Strings[ix];
      Application.ProcessMessages;

      assignfile(AltogetherFile,OpenDialog1.Files.Strings[ix]);
      reset(AltogetherFile);
      read(AltogetherFile, Altogether);

      try
        DotPosn:=pos('.',OpenDialog1.Files.Strings[ix]);
        if DotPosn>0 then
        begin
          FileRef:=copy(OpenDialog1.Files.Strings[ix],DotPosn-7,7);
          if copy(FileRef,1,1)='\' then
            delete(FileRef,1,1);
          qryInsertStrips.ParamByName('FileRef').AsString:=FileRef;
        end
        else
          qryInsertStrips.ParamByName('FileRef').Clear;
      except
        continue
      end;

      //make sure 'file' does not exist
      if FileRef='' then
        continue;

      try
        MainForm.Database.StartTransaction;
        for StripNo:=1 to Altogether.Rouleau_produit.Nombre_Bandes do
        begin
          qryCheck.Close;
          qryCheck.ParamByName('FileRef').AsString:=FileRef;
          qryCheck.ParamByName('StripNo').AsInteger:=StripNo;
          qryCheck.Open;
          if not qryCheckFILEREF.IsNull then
            continue;

          qryInsertStrips.Close;
          sprCalemardStrips.ExecProc;
          qryInsertStrips.ParamByName('Ref').AsInteger:=sprCalemardStrips.Params[0].AsInteger;

          DotPosn:=pos('.',OpenDialog1.Files.Strings[ix]);
          if DotPosn>0 then
          begin
            TempStr:=copy(OpenDialog1.Files.Strings[ix],DotPosn-7,7);
            if copy(TempStr,1,1)='\' then
              delete(TempStr,1,1);
            qryInsertStrips.ParamByName('FileRef').AsString:=TempStr;
          end
          else
            qryInsertStrips.ParamByName('FileRef').Clear;
          qryInsertStrips.ParamByName('StripNo').AsInteger:=StripNo;
          TempStr:='20'+ConvertString(Altogether.Rouleau_produit.Date);
          qryInsertStrips.ParamByName('DateManu').AsDateTime:=
            encodedate(strtoint(copy(TempStr,1,4)),strtoint(copy(TempStr,6,2)),strtoint(copy(TempStr,9,2)));
          qryInsertStrips.ParamByName('VBWidth').AsInteger:=
            trunc(Altogether.Rouleau_produit.Largeur_Bande[StripNo]);

          TempStr:=ConvertString(Altogether.Rouleau_produit.Texte1);
          qryInsertStrips.ParamByName('StruColLot').AsString:=TempStr;
          qryInsertStrips.ParamByName('VBStru').AsString:=copy(TempStr,1,3); //was 1,3 DL060901
          qryInsertStrips.ParamByName('VBCol').AsString:=copy(FileRef,1,3);
          TempStr:=ConvertString(Altogether.Rouleau_produit.Texte2);
          qryInsertStrips.ParamByName('WarpGreigeFin').AsString:=TempStr;
          TempStr:=ConvertString(Altogether.Rouleau_produit.Texte3);
          qryInsertStrips.ParamByName('WarpLotNo').AsString:=TempStr;
          TempStr:=ConvertString(Altogether.Rouleau_produit.Texte4);
          qryInsertStrips.ParamByName('WeftLotNo').AsString:=TempStr;
          qryInsertStrips.ParamByName('ShortFault1Warp').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Court[1];
          qryInsertStrips.ParamByName('ShortFault2Weft').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Court[2];
          qryInsertStrips.ParamByName('ShortFault3Yarn').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Court[3];
          qryInsertStrips.ParamByName('ShortFault4YnSlub').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Court[4];
          qryInsertStrips.ParamByName('ShortFault5TwoPics').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Court[5];
          qryInsertStrips.ParamByName('ShortFault6Fin').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Court[6];
          qryInsertStrips.ParamByName('ShortFault7Colour1').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Court[7];
          qryInsertStrips.ParamByName('ShortFault8MissPic').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Court[8];
          qryInsertStrips.ParamByName('ShortFault9MissEnd').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Court[9];
          qryInsertStrips.ParamByName('ShortFault10Colour2').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Court[10];
          qryInsertStrips.ParamByName('LongFault1Warp').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Long[1];
          qryInsertStrips.ParamByName('LongFault2Weft').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Long[2];
          qryInsertStrips.ParamByName('LongFault3Yarn').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Long[3];
          qryInsertStrips.ParamByName('LongFault4YnSlub').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Long[4];
          qryInsertStrips.ParamByName('LongFault5TwoPics').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Long[5];
          qryInsertStrips.ParamByName('LongFault6Fin').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Long[6];
          qryInsertStrips.ParamByName('LongFault7Colour1').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Long[7];
          qryInsertStrips.ParamByName('LongFault8MissPic').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Long[8];
          qryInsertStrips.ParamByName('LongFault9MissEnd').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Long[9];
          qryInsertStrips.ParamByName('LongFault10Colour2').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].NB_Defaut_Long[10];
          qryInsertStrips.ParamByName('StripGrossLength').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].Metrage_Brut;
          qryInsertStrips.ParamByName('StripNetLength').AsInteger:=
            Altogether.Stat_defauts_bandes[StripNo].Metrage_Net;
          qryInsertStrips.ExecSQL;
        end; //for each strip

        MainForm.Database.Commit;
      except
        MainForm.Database.Rollback;
      end;
      CloseFile(AltogetherFile);
    end;
  end;
  StatusBar1.Panels[0].Text:='Importing Complete';
  Application.ProcessMessages;
end;

procedure TfrmImportCalemard.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportCalemard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryInsertStrips.Close;
  qryCheck.Close;
  Release;
end;

end.
