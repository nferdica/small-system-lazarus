unit relCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls,
  ZDataset, ZAbstractRODataset, LR_DBSet, LR_Class;

type

  { TrelClienteF }

  TrelClienteF = class(TForm)
    btnFechar: TBitBtn;
    btnRelCliente: TBitBtn;
    frDbRelCli: TfrDBDataSet;
    frReportCli: TfrReport;
    Image1: TImage;
    qryCliente: TZQuery;
    qryClienteclienteid: TZIntegerField;
    qryClientecpf_cnpj_cliente: TZRawStringField;
    qryClientenome_cliente: TZRawStringField;
    qryClientetipo_cliente: TZRawStringField;
    procedure btnFecharClick(Sender: TObject);
    procedure btnRelClienteClick(Sender: TObject);
  private

  public

  end;

var
  relClienteF: TrelClienteF;

implementation


{$R *.lfm}

{ TrelClienteF }

// BOTÃO IMPRIMIR.
procedure TrelClienteF.btnRelClienteClick(Sender: TObject);
begin
   frReportCli.LoadFromFile('relCliente.lrf');
   frReportCli.PrepareReport;
   frReportCli.ShowReport;
end;
// -----------------------------------------------------------------------------


// BOTÃO FECHAR.
procedure TrelClienteF.btnFecharClick(Sender: TObject);
begin
  Close;
end;
// -----------------------------------------------------------------------------

end.

