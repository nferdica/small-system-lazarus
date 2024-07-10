unit menuCadastroProdutosCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  Buttons, StdCtrls;

type

  { TmenuCadastroProdutosCategoriaF }

  TmenuCadastroProdutosCategoriaF = class(TForm)
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
  menuCadastroProdutosCategoriaF: TmenuCadastroProdutosCategoriaF;

implementation

uses
  dataBaseConection, DB;

{$R *.lfm}

// FORMSHOW & FORMCLOSE
procedure TmenuCadastroProdutosCategoriaF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dataBaseConectionF.qryCategory.Close;
  CloseAction:= caFree;
end;

procedure TmenuCadastroProdutosCategoriaF.FormShow(Sender: TObject);
begin
  dataBaseConectionF.qryCategory.Open;
end;
// -----------------------------------------------------------------------------


// BOTÃO PESQUISAR.
procedure TmenuCadastroProdutosCategoriaF.btnPesquisarClick(Sender: TObject);
begin
  if (edtPesquisar.Text = '') then
    begin
        dataBaseConectionF.qryCategory.Close;
        dataBaseConectionF.qryCategory.SQL.Text := 'select * from CATEGORIA_PRODUTO';
        dataBaseConectionF.qryCategory.Open;
    end
      else if (cbPesquisa.ItemIndex = 0) then
      begin
        dataBaseConectionF.qryCategory.Close;
        dataBaseConectionF.qryCategory.SQL.Text := 'select * from CATEGORIA_PRODUTO where categoriaprodutoid = ' + edtPesquisar.Text;
        dataBaseConectionF.qryCategory.Open;
      end;
    end;
// -----------------------------------------------------------------------------


// BOTÃO SELECIONAR.
procedure TmenuCadastroProdutosCategoriaF.btnConfirmClick(Sender: TObject);
begin
  If dataBaseConectionF.qryCategory.State in [dsInsert,dsEdit] Then
    begin
    dataBaseConectionF.qryProdutocategoriaprodutoid.AsString := dataBaseConectionF.qryCategorycategoriaprodutoid.AsString;
    Close;
    end;
end;
// -----------------------------------------------------------------------------

end.

