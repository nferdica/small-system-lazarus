unit relUsuarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  LR_DBSet, LR_Class, ZDataset;

type

  { TrelUsuariosF }

  TrelUsuariosF = class(TForm)
    btnFechar: TBitBtn;
    btnRelUsuarios: TBitBtn;
    frDbRelUser: TfrDBDataSet;
    frReportUser: TfrReport;
    Image1: TImage;
    qryUsers: TZQuery;
    procedure btnFecharClick(Sender: TObject);
    procedure btnRelUsuariosClick(Sender: TObject);
  private

  public

  end;

var
  relUsuariosF: TrelUsuariosF;

implementation

{$R *.lfm}

{ TrelUsuariosF }


// BOTÃO IMPRIMIR.
procedure TrelUsuariosF.btnRelUsuariosClick(Sender: TObject);
begin
   frReportUser.LoadFromFile('relUsuarios.lrf');
   frReportUser.PrepareReport;
   frReportUser.ShowReport;
end;
// -----------------------------------------------------------------------------


// BOTÃO FECHAR.
procedure TrelUsuariosF.btnFecharClick(Sender: TObject);
begin
  Close;
end;
// -----------------------------------------------------------------------------

end.

