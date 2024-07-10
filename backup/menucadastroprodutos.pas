unit menuCadastroProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, DBDateTimePicker, xCadModelo;

type

  { TmenuCadastroProdutosF }

  TmenuCadastroProdutosF = class(TxCadModeloF)
  cbPesquisa: TComboBox;
  cbStatusProduto: TDBComboBox;
  edtCategoriaProduto: TDBEdit;
  edtDate: TDBEdit;
  edtIdProduto: TDBEdit;
  edtValorProduto: TDBEdit;
  edtDescProduto: TDBEdit;
  edtObsProduto: TDBEdit;
  edtPesquisar: TEdit;
  lbCadCadProId: TLabel;
  lbCadCadProCategory: TLabel;
  lbCadCadProDesc: TLabel;
  lbCadCadProObs: TLabel;
  lbCadCadProValueVenda: TLabel;
  lbCadCadProDate: TLabel;
  lbCadCadProStatus: TLabel;
  spdCategory: TSpeedButton;
  procedure btnCancelClick(Sender: TObject);
  procedure btnEditarClick(Sender: TObject);
  procedure btnExcluirClick(Sender: TObject);
  procedure btnFecharClick(Sender: TObject);
  procedure btnGravarClick(Sender: TObject);
  procedure btnImprimirClick(Sender: TObject);
  procedure btnNovoClick(Sender: TObject);
  procedure btnPesquisarClick(Sender: TObject);
  procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  procedure FormShow(Sender: TObject);
  procedure spdCategoryClick(Sender: TObject);

  private

  public

  end;

var
  menuCadastroProdutosF: TmenuCadastroProdutosF;

implementation

uses
  dataBaseConection, relProdutos, menuCadastroProdutosCategoria;

{$R *.lfm}


// FORMSHOW & FORMCLOSE
procedure TmenuCadastroProdutosF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dataBaseConectionF.qryProduto.Close;
  CloseAction:= caFree;
end;

procedure TmenuCadastroProdutosF.FormShow(Sender: TObject);
begin
  dataBaseConectionF.qryProduto.Open;
  pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO NOVO.
procedure TmenuCadastroProdutosF.btnNovoClick(Sender: TObject);

begin
  dataBaseConectionF.qryProduto.Insert;
  pgControl.ActivePage := tbCadastrar;
  dataBaseConectionF.qryProdutodt_cadastro_produto.AsDateTime := Date;
end;
// -----------------------------------------------------------------------------


// BOTÃO FECHAR.
procedure TmenuCadastroProdutosF.btnFecharClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja fechar este formulário?', mtWarning,[mbyes,mbno],0)= mryes then
  begin
    Close;
  end;
end;
// -----------------------------------------------------------------------------


// BOTÃO GRAVAR.
procedure TmenuCadastroProdutosF.btnGravarClick(Sender: TObject);
begin
    dataBaseConectionF.qryProduto.Post;
    pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO EXCLUIR.
procedure TmenuCadastroProdutosF.btnExcluirClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    dataBaseConectionF.qryProduto.Delete;
    pgControl.ActivePage := tbPesquisar;
  end;
end;
// -----------------------------------------------------------------------------


// BOTÃO CANCELAR.
procedure TmenuCadastroProdutosF.btnCancelClick(Sender: TObject);
begin
  dataBaseConectionF.qryProduto.Cancel;
  pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO PESQUISAR.
procedure TmenuCadastroProdutosF.btnPesquisarClick(Sender: TObject);
begin
  if (edtPesquisar.Text = '') then
    begin
        dataBaseConectionF.qryProduto.Close;
        dataBaseConectionF.qryProduto.SQL.Text := 'select * from PRODUTO';
        dataBaseConectionF.qryProduto.Open;
    end
  else
    begin
      if (cbPesquisa.ItemIndex = 0) then
      begin
        dataBaseConectionF.qryProduto.Close;
        dataBaseConectionF.qryProduto.SQL.Text := 'select * from PRODUTO where Upper(ds_produto) like ' + UpperCase(QuotedStr(edtPesquisar.Text + '%'));
        dataBaseConectionF.qryProduto.Open;
      end
      else if (cbPesquisa.ItemIndex = 1) then
      begin
        dataBaseConectionF.qryProduto.Close;
        dataBaseConectionF.qryProduto.SQL.Text := 'select * from PRODUTO where produtoid = ' + edtPesquisar.Text;
        dataBaseConectionF.qryProduto.Open;
      end;
    end;
end;
// -----------------------------------------------------------------------------


// BOTÃO EDITAR.
procedure TmenuCadastroProdutosF.btnEditarClick(Sender: TObject);
begin
  dataBaseConectionF.qryProduto.Edit;
  pgControl.ActivePage := tbCadastrar;
end;
// -----------------------------------------------------------------------------


// BOTÃO IMPRIMIR.
procedure TmenuCadastroProdutosF.btnImprimirClick(Sender: TObject);
begin
  relProdutosF := TrelProdutosF.Create(Self);
  relProdutosF.ShowModal;
end;
// -----------------------------------------------------------------------------


// BOTÃO SELECIONAR CATEGORIA PRODUTO.
procedure TmenuCadastroProdutosF.spdCategoryClick(Sender: TObject);
begin
  menuCadastroProdutosCategoriaF := TmenuCadastroProdutosCategoriaF.Create(Self);
  menuCadastroProdutosCategoriaF.ShowModal;
end;
// -----------------------------------------------------------------------------

end.

