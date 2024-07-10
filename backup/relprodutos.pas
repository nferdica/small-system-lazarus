unit relProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls,
  LR_DBSet, LR_Class, ZDataset;

type

  { TrelProdutosF }

  TrelProdutosF = class(TForm)
    btnFechar: TBitBtn;
    btnRelProdutos: TBitBtn;
    frDbRelProd: TfrDBDataSet;
    frReportProd: TfrReport;
    Image1: TImage;
    qryProduto: TZQuery;
    procedure btnFecharClick(Sender: TObject);
    procedure btnRelProdutosClick(Sender: TObject);
  private

  public

  end;

var
  relProdutosF: TrelProdutosF;

implementation

{$R *.lfm}

{ TrelProdutosF }


// BOTÃO IMPRIMIR.
procedure TrelProdutosF.btnRelProdutosClick(Sender: TObject);
begin
   frReportProd.LoadFromFile('relProdutos.lrf');
   frReportProd.PrepareReport;
   frReportProd.ShowReport;
end;
// -----------------------------------------------------------------------------


// BOTÃO FECHAR
procedure TrelProdutosF.btnFecharClick(Sender: TObject);
begin
  Close;
end;
// -----------------------------------------------------------------------------

end.

