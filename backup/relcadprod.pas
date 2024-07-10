unit relCadProd;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls,
  LR_DBSet, LR_Class, ZDataset;

type

  { TrelCatProdF }

  TrelCatProdF = class(TForm)
    btnFechar: TBitBtn;
    btnRelUsuarios: TBitBtn;
    frDbCatProd: TfrDBDataSet;
    frReportCatProd: TfrReport;
    Image1: TImage;
    qryCategory: TZQuery;
    procedure btnFecharClick(Sender: TObject);
    procedure btnRelUsuariosClick(Sender: TObject);
  private

  public

  end;

var
  relCatProdF: TrelCatProdF;

implementation

{$R *.lfm}

{ TrelCatProdF }

// BOTÃO IMPRIMIR.
procedure TrelCatProdF.btnRelUsuariosClick(Sender: TObject);
begin
   frReportCatProd.LoadFromFile('relCategoria.lrf');
   frReportCatProd.PrepareReport;
   frReportCatProd.ShowReport;
end;
// -----------------------------------------------------------------------------


// BOTÃO FECHAR.
procedure TrelCatProdF.btnFecharClick(Sender: TObject);
begin
   Close;
end;
// -----------------------------------------------------------------------------

end.

