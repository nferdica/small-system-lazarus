unit menuOrcamentoAdicionarProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, Buttons,
  StdCtrls;

type

  { TmenuOrcamentoAdicionarProdutoF }

  TmenuOrcamentoAdicionarProdutoF = class(TForm)
    btnInsert: TBitBtn;
    btnCancel: TBitBtn;
    edtValorTotal: TDBEdit;
    edtQuantidade: TDBEdit;
    edtProdutoId: TDBEdit;
    edtProdutoDesc: TDBEdit;
    edtValVenda: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    spdAdicionarItem: TSpeedButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure spdAdicionarItemClick(Sender: TObject);
  private

  public

  end;

var
  menuOrcamentoAdicionarProdutoF: TmenuOrcamentoAdicionarProdutoF;

implementation

uses
  dataBaseConection, menuOrcamentoProduto;

{$R *.lfm}

// FORMSHOW & FORMCLOSE
procedure TmenuOrcamentoAdicionarProdutoF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TmenuOrcamentoAdicionarProdutoF.FormShow(Sender: TObject);
begin
  dataBaseConectionF.qryOrcItem.Open;
end;
// -----------------------------------------------------------------------------


// BOTÃO ADICIONAR PRODUTO
procedure TmenuOrcamentoAdicionarProdutoF.spdAdicionarItemClick(Sender: TObject);
begin
   menuOrcamentoProdutosF := TmenuOrcamentoProdutosF.Create(Self);
   menuOrcamentoProdutosF.ShowModal;
end;
// -----------------------------------------------------------------------------


// BOTÃO CANCELAR.
procedure TmenuOrcamentoAdicionarProdutoF.btnCancelClick(Sender: TObject);
begin
   Close;
end;
// -----------------------------------------------------------------------------


// CALCULAR VALOR TOTAL PRODUTO
procedure TmenuOrcamentoAdicionarProdutoF.edtQuantidadeExit(Sender: TObject);
      var  xQtde, xVlrUnit, xVlrTotal : double;
begin
  xQtde     := dataBaseConectionF.qryOrcItemqt_produto.AsFloat;
  xVlrUnit  := dataBaseConectionF.qryOrcItemvl_unitario.AsFloat;


  if  xQtde > 0  then
  begin
    xVlrTotal := xQtde * xVlrUnit;
    dataBaseConectionF.qryOrcItemvl_total.AsFloat := xVlrTotal;
  end;
end;
// -----------------------------------------------------------------------------


// BOTÃO INSERIR PRODUTO.
procedure TmenuOrcamentoAdicionarProdutoF.btnInsertClick(Sender: TObject);
begin
   Close;
end;
// -----------------------------------------------------------------------------



end.

