unit menuOrcamentoProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls, Buttons;

type

  { TmenuOrcamentoProdutosF }

  TmenuOrcamentoProdutosF = class(TForm)
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
  menuOrcamentoProdutosF: TmenuOrcamentoProdutosF;

implementation

uses
  dataBaseConection, DB, menuOrcamento;

{$R *.lfm}

// FORMSHOW & FORMCLOSE
procedure TmenuOrcamentoProdutosF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dataBaseConectionF.qryProduto.Close;
  CloseAction:= caFree;
end;

procedure TmenuOrcamentoProdutosF.FormShow(Sender: TObject);
begin
  dataBaseConectionF.qryProduto.Open;
end;
// -----------------------------------------------------------------------------


// BOTÃO PESQUISAR.
procedure TmenuOrcamentoProdutosF.btnPesquisarClick(Sender: TObject);
begin
  if (edtPesquisar.Text = '') then
    begin
        dataBaseConectionF.qryProduto.Close;
        dataBaseConectionF.qryProduto.SQL.Text := 'select * from PRODUTO';
        dataBaseConectionF.qryProduto.Open;
    end
      else if (cbPesquisa.ItemIndex = 0) then
      begin
        dataBaseConectionF.qryProduto.Close;
        dataBaseConectionF.qryProduto.SQL.Text := 'select * from PRODUTO where produtoid = ' + edtPesquisar.Text;
        dataBaseConectionF.qryProduto.Open;
      end;
    end;
// -----------------------------------------------------------------------------


// BOTÃO SELECIONAR.
procedure TmenuOrcamentoProdutosF.btnConfirmClick(Sender: TObject);
begin
  if dataBaseConectionF.qryProduto.IsEmpty then
    Abort;
    dataBaseConectionF.qryOrcItemprodutoid.AsString :=  dataBaseConectionF.qryProdutoprodutoid.AsString;
    //dataBaseConectionF.qryOrcItemprodutodesc.AsString := dataBaseConectionF.qryProdutods_produto.AsString;
    dataBaseConectionF.qryOrcItemvl_unitario.AsString := dataBaseConectionF.qryProdutovl_venda_produto.AsString;
    Close;
end;
// -----------------------------------------------------------------------------

end.

