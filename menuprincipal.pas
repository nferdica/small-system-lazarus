unit menuPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  ExtCtrls, Buttons, StdCtrls;

type

  { TmenuPrincipalF }

  TmenuPrincipalF = class(TForm)
    cbSpdRel: TComboBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    lbAtalRel: TLabel;
    lbAtalUser: TLabel;
    lbAtalOrc: TLabel;
    lbAtalSair: TLabel;
    menuRelatorioUsuarios: TMenuItem;
    menuPrincipalControl: TMainMenu;
    menuCadastro: TMenuItem;
    menuCadastroCliente: TMenuItem;
    menuCadastroProdutos: TMenuItem;
    menuCadastroCategoriaProdutos: TMenuItem;
    menuCadastroUsuarios: TMenuItem;
    menuRelatorioCategoriaProduto: TMenuItem;
    menuRelatorioOrcamento: TMenuItem;
    menuRelatorioProduto: TMenuItem;
    menuRelatorioCliente: TMenuItem;
    menuVendasOrcamento: TMenuItem;
    menuSair: TMenuItem;
    menuSobre: TMenuItem;
    menuRelatorios: TMenuItem;
    menuVendas: TMenuItem;
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    spdSair: TSpeedButton;
    spdOrc: TSpeedButton;
    spdCadUser: TSpeedButton;
    spdRel: TSpeedButton;
    procedure menuCadastroCategoriaProdutosClick(Sender: TObject);
    procedure menuCadastroClienteClick(Sender: TObject);
    procedure menuCadastroProdutosClick(Sender: TObject);
    procedure menuCadastroUsuariosClick(Sender: TObject);
    procedure menuRelatorioCategoriaProdutoClick(Sender: TObject);
    procedure menuRelatorioClienteClick(Sender: TObject);
    procedure menuRelatorioOrcamentoClick(Sender: TObject);
    procedure menuRelatorioProdutoClick(Sender: TObject);
    procedure menuRelatorioUsuariosClick(Sender: TObject);
    procedure menuSairClick(Sender: TObject);
    procedure menuSobreClick(Sender: TObject);
    procedure menuVendasOrcamentoClick(Sender: TObject);
    procedure spdCadUserClick(Sender: TObject);
    procedure spdOrcClick(Sender: TObject);
    procedure spdRelClick(Sender: TObject);
    procedure spdSairClick(Sender: TObject);
  private

  public

  end;

var
  menuPrincipalF: TmenuPrincipalF;

implementation

uses
  menuCadastroCliente, menuCadastroProdutos, menuCadastroCategoria, menuCadastroUsuario, menuSobre, relCliente, relProdutos, relUsuarios, relCadProd, relOrcamento, menuOrcamento;

{$R *.lfm}

{ TmenuPrincipalF }


// MENU VENDAS.
procedure TmenuPrincipalF.menuVendasOrcamentoClick(Sender: TObject);
begin
    menuOrcamentoF := TmenuOrcamentoF.Create(Self);
    menuOrcamentoF.ShowModal;
end;
// -----------------------------------------------------------------------------


// MENU SAIR.
procedure TmenuPrincipalF.menuSairClick(Sender: TObject);
begin
    If  MessageDlg('Você tem certeza que deseja sair do sistema?', mtWarning,[mbyes,mbno],0)= mryes then
    begin
        Application.Terminate;
    end;
end;
// -----------------------------------------------------------------------------


// MENU SOBRE.
procedure TmenuPrincipalF.menuSobreClick(Sender: TObject);
begin
    menuSobreF := TmenuSobreF.Create(Self);
    menuSobreF.ShowModal;
end;
// -----------------------------------------------------------------------------


// MENU RELATÓRIOS.

// REL.CLIENTES
procedure TmenuPrincipalF.menuRelatorioClienteClick(Sender: TObject);
begin
    relClienteF := TrelClienteF.Create(Self);
    relClienteF.ShowModal;
end;

// REL.PRODUTOS
procedure TmenuPrincipalF.menuRelatorioProdutoClick(Sender: TObject);
begin
    relProdutosF := TrelProdutosF.Create(Self);
    relProdutosF.ShowModal;
end;

// REL.USUÁRIOS.
procedure TmenuPrincipalF.menuRelatorioUsuariosClick(Sender: TObject);
begin
    relUsuariosF := TrelUsuariosF.Create(Self);
    relUsuariosF.ShowModal;
end;

// REL.CATEGORIA PRODUTOS
procedure TmenuPrincipalF.menuRelatorioCategoriaProdutoClick(Sender: TObject);
begin
    relCatProdF := TrelCatProdF.Create(Self);
    relCatProdF.ShowModal;
end;

// REL.ORCAMENTO
procedure TmenuPrincipalF.menuRelatorioOrcamentoClick(Sender: TObject);
begin
    relOrcamentoF := TrelOrcamentof.Create(Self);
    relOrcamentoF.ShowModal;
end;
// -----------------------------------------------------------------------------


// MENU CADASTROS.

// CAD.CLIENTES.
procedure TmenuPrincipalF.menuCadastroClienteClick(Sender: TObject);
begin
    menuCadastroClienteF := TmenuCadastroClienteF.Create(Self);
    menuCadastroClienteF.ShowModal;
end;

// CAD.CATEGORIA PRODUTOS.
procedure TmenuPrincipalF.menuCadastroCategoriaProdutosClick(Sender: TObject);
begin
    menuCadastroCategoriaF := TmenuCadastroCategoriaF.Create(Self);
    menuCadastroCategoriaF.ShowModal;
end;

// CAD.PRODUTOS.
procedure TmenuPrincipalF.menuCadastroProdutosClick(Sender: TObject);
begin
    menuCadastroProdutosF := TmenuCadastroProdutosF.Create(Self);
    menuCadastroProdutosF.ShowModal;
end;

// CAD.USUÁRIOS.
procedure TmenuPrincipalF.menuCadastroUsuariosClick(Sender: TObject);
begin
    menuCadastroUsuarioF := TmenuCadastroUsuarioF.Create(Self);
    menuCadastroUsuarioF.ShowModal;
end;
// -----------------------------------------------------------------------------

// ATALHO BOTÃO CADASTRAR USUÁRIO.
procedure TmenuPrincipalF.spdCadUserClick(Sender: TObject);
begin
    menuCadastroUsuarioF := TmenuCadastroUsuarioF.Create(Self);
    menuCadastroUsuarioF.ShowModal;
end;
// -----------------------------------------------------------------------------


// ATALHO BOTÃO ORÇAMENTO.
procedure TmenuPrincipalF.spdOrcClick(Sender: TObject);
begin
    menuOrcamentoF := TmenuOrcamentoF.Create(Self);
    menuOrcamentoF.ShowModal;
end;
// -----------------------------------------------------------------------------


// ATALHO BOTÃO SAIR.
procedure TmenuPrincipalF.spdSairClick(Sender: TObject);
begin
   If  MessageDlg('Você tem certeza que deseja sair do sistema?', mtWarning,[mbyes,mbno],0)= mryes then
    begin
        Application.Terminate;
    end
end;
// -----------------------------------------------------------------------------


// ATALHO BOTÃO RELÁTORIOS.
procedure TmenuPrincipalF.spdRelClick(Sender: TObject);
begin
   if cbSpdRel.ItemIndex = 0 then
    begin
       relClienteF := TrelClienteF.Create(Self);
       relClienteF.ShowModal;
    end;
   if cbSpdRel.ItemIndex = 1 then
    begin
       relProdutosF := TrelProdutosF.Create(Self);
       relProdutosF.ShowModal;
    end;
   if cbSpdRel.ItemIndex = 2 then
    begin
       relOrcamentof := TrelOrcamentof.Create(Self);
       relOrcamentof.ShowModal;
    end;
   if cbSpdRel.ItemIndex = 3 then
    begin
       relCatProdF := TrelCatProdF.Create(Self);
       relCatProdF.ShowModal;
    end;
   if cbSpdRel.ItemIndex = 4 then
    begin
       relUsuariosF := TrelUsuariosF.Create(Self);
       relUsuariosF.ShowModal;
    end;
end;
// -----------------------------------------------------------------------------

end.

