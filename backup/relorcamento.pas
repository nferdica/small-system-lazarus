unit relOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls,
  LR_DBSet, LR_Class, ZDataset;

type

  { TrelOrcamentof }

  TrelOrcamentof = class(TForm)
    btnFechar: TBitBtn;
    btnRelOrcamento: TBitBtn;
    frDbRelOrcamento: TfrDBDataSet;
    frReportOrcamento: TfrReport;
    Image1: TImage;
    qryOrcamento: TZQuery;
    procedure btnFecharClick(Sender: TObject);
    procedure btnRelOrcamentoClick(Sender: TObject);
  private

  public

  end;

var
  relOrcamentof: TrelOrcamentof;

implementation

{$R *.lfm}

{ TrelOrcamentof }


// BOTÃO IMPRIMIR.
procedure TrelOrcamentof.btnRelOrcamentoClick(Sender: TObject);
begin
   frReportOrcamento.LoadFromFile('relOrcamento.lrf');
   frReportOrcamento.PrepareReport;
   frReportOrcamento.ShowReport;
end;
// -----------------------------------------------------------------------------


// BOTÃO FECHAR.
procedure TrelOrcamentof.btnFecharClick(Sender: TObject);
begin
  Close;
end;
// -----------------------------------------------------------------------------

end.

