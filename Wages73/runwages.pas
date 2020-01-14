unit runwages;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmWeeklyWages = class(TForm)
    pgeWeeklyWages: TPageControl;
    tshPayslipEntry: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    edtEmployeeFullName: TEdit;
    dbnEmployee: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWeeklyWages: TfrmWeeklyWages;

implementation

{$R *.DFM}

end.
