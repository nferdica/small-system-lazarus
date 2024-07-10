unit menuCadastroCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  xCadModelo;

type

  { TmenuCadastroCategoriaF }

  TmenuCadastroCategoriaF = class(TxCadModeloF)
  cbPesquisa: TComboBox;
  edtIdCategoriaProduto: TDBEdit;
  edtDescCategoriaProduto: TDBEdit;
  edtPesquisar: TEdit;
  lbCadCadCatId: TLabel;
  lbCadCadCatDesc: TLabel;
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
  private

  public

  end;

var
  menuCadastroCategoriaF: TmenuCadastroCategoriaF;

implementation

uses
  dataBaseConection, relCadProd;

{$R *.lfm}


// FORMSHOW & FORMCLOSE
procedure TmenuCadastroCategoriaF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dataBaseConectionF.qryCategory.Close;
  CloseAction := caFree;
end;

procedure TmenuCadastroCategoriaF.FormShow(Sender: TObject);
begin
  dataBaseConectionF.qryCategory.Open;
  pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO NOVO.
procedure TmenuCadastroCategoriaF.btnNovoClick(Sender: TObject);
begin
  dataBaseConectionF.qryCategory.Insert;
  pgControl.ActivePage := tbCadastrar;
end;
// -----------------------------------------------------------------------------


// BOTÃO FECHAR.
procedure TmenuCadastroCategoriaF.btnFecharClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja fechar este formulário?', mtWarning,[mbyes,mbno],0)= mryes then
  begin
    Close;
  end;
end;
// -----------------------------------------------------------------------------


// BOTÃO GRAVAR.
procedure TmenuCadastroCategoriaF.btnGravarClick(Sender: TObject);
begin
    dataBaseConectionF.qryCategory.Post;
    pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO EXCLUIR.
procedure TmenuCadastroCategoriaF.btnExcluirClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    dataBaseConectionF.qryCategory.Delete;
    pgControl.ActivePage := tbPesquisar;
  end;
end;
// -----------------------------------------------------------------------------


// BOTÃO CANCELAR.
procedure TmenuCadastroCategoriaF.btnCancelClick(Sender: TObject);
begin
  dataBaseConectionF.qryCategory.Cancel;
  pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO PESQUISAR.
procedure TmenuCadastroCategoriaF.btnPesquisarClick(Sender: TObject);
begin
  if (edtPesquisar.Text = '') then
    begin
        dataBaseConectionF.qryCategory.Close;
        dataBaseConectionF.qryCategory.SQL.Text := 'select * from CATEGORIA_PRODUTO';
        dataBaseConectionF.qryCategory.Open;
    end
  else
    begin
      if (cbPesquisa.ItemIndex = 0) then
      begin
        dataBaseConectionF.qryCategory.Close;
        dataBaseConectionF.qryCategory.SQL.Text := 'select * from CATEGORIA_PRODUTO where Upper(ds_categoria_produto) like ' + UpperCase(QuotedStr(edtPesquisar.Text + '%'));
        dataBaseConectionF.qryCategory.Open;
      end
      else if (cbPesquisa.ItemIndex = 1) then
      begin
        dataBaseConectionF.qryCategory.Close;
        dataBaseConectionF.qryCategory.SQL.Text := 'select * from CATEGORIA_PRODUTO where categoriaprodutoid = ' + edtPesquisar.Text;
        dataBaseConectionF.qryCategory.Open;
      end;
    end;
end;
// -----------------------------------------------------------------------------


// BOTÃO EDITAR.
procedure TmenuCadastroCategoriaF.btnEditarClick(Sender: TObject);
begin
  dataBaseConectionF.qryCategory.Edit;
  pgControl.ActivePage := tbCadastrar;
end;
// -----------------------------------------------------------------------------


// BOTÃO IMPRIMIR.
procedure TmenuCadastroCategoriaF.btnImprimirClick(Sender: TObject);
begin
  relCatProdF := TrelCatProdF.Create(Self);
  relCatProdF.ShowModal;
end;
// -----------------------------------------------------------------------------

end.

