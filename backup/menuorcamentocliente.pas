unit menuOrcamentoCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  Buttons, StdCtrls;

type

  { TmenuOrcamentoClienteF }

  TmenuOrcamentoClienteF = class(TForm)
    btnConfirm: TBitBtn;
    btnPesquisar: TBitBtn;
    cbPesquisa: TComboBox;
    DBGrid1: TDBGrid;
    edtPesquisar: TEdit;
    imgSaberTiForms: TImage;
    tPanelCadastroBotton: TPanel;
    tPanelPesquisarTop: TPanel;
    procedure btnConfirmClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  menuOrcamentoClienteF: TmenuOrcamentoClienteF;

implementation

uses
  dataBaseConection, DB;

{$R *.lfm}

{ TmenuOrcamentoClienteF }


// FORMSHOW & FORMCLOSE
procedure TmenuOrcamentoClienteF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dataBaseConectionF.qryCliente.Close;
  CloseAction := caFree;
end;

procedure TmenuOrcamentoClienteF.FormShow(Sender: TObject);
begin
  dataBaseConectionF.qryCliente.Open;
end;
// -----------------------------------------------------------------------------


// BOTÃO PESQUISAR.
procedure TmenuOrcamentoClienteF.btnPesquisarClick(Sender: TObject);
begin
  if (edtPesquisar.Text = '') then
    begin
        dataBaseConectionF.qryCliente.Close;
        dataBaseConectionF.qryCliente.SQL.Text := 'select * from CLIENTE';
        dataBaseConectionF.qryCliente.Open;
    end
      else if (cbPesquisa.ItemIndex = 0) then
      begin
        dataBaseConectionF.qryCliente.Close;
        dataBaseConectionF.qryCliente.SQL.Text := 'select * from CLIENTE where clienteid = ' + edtPesquisar.Text;
        dataBaseConectionF.qryCliente.Open;
      end;
    end;
// -----------------------------------------------------------------------------


// BOTÃO SELECIONAR.
procedure TmenuOrcamentoClienteF.btnConfirmClick(Sender: TObject);
begin
  If dataBaseConectionF.qryOrcamento.State in [dsInsert,dsEdit] Then
    begin
    dataBaseConectionF.qryOrcamentoclienteid.AsString := dataBaseConectionF.qryClienteclienteid.AsString;
    Close;
    end;
end;
// -----------------------------------------------------------------------------

end.

