unit EditStru;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, DBTables;

type
  TVBStruForm = class(TForm)
    VBLSPQuery: TQuery;
    VBType: TTable;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    srcVBType: TDataSource;
    VBTypeVBSTRU: TStringField;
    VBTypeVBCOL: TStringField;
    VBTypeVBFIN: TStringField;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label4: TLabel;
    PriceType: TTable;
    PriceTypePRICETYPE: TStringField;
    PriceTypeDESCR: TStringField;
    srcVBLSP: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    VBWidth: TTable;
    srcPriceType: TDataSource;
    VBQlty: TTable;
    VBWidthMETRICWIDTH: TSmallintField;
    srcVBWidth: TDataSource;
    VBQltyQLTY: TStringField;
    VBQltyDESCR: TStringField;
    srcVBQlty: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VBStruForm: TVBStruForm;

implementation

{$R *.DFM}

end.
