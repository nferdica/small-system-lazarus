program prjSCO;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, menuPrincipal, dataBaseConection, zcomponent,
  xCadModelo, menuCadastroCliente, menuCadastroProdutos, menuCadastroCategoria,
  menuCadastroUsuario, menuSobre, relCliente, relProdutos, relUsuarios,
  relCadProd, menuLogin, menuLoginCadastro, menuOrcamento, menuOrcamentoCliente,
  menuCadastroProdutosCategoria, menuOrcamentoProduto,
menuOrcamentoAdicionarProduto, relOrcamento
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TdataBaseConectionF, dataBaseConectionF);
  Application.CreateForm(TmenuLoginF, menuLoginF);
  Application.CreateForm(TmenuPrincipalF, menuPrincipalF);
  Application.CreateForm(TxCadModeloF, xCadModeloF);
  Application.CreateForm(TrelOrcamentof, relOrcamentof);
  Application.Run;
end.

