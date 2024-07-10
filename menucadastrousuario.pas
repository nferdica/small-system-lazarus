unit menuCadastroUsuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  xCadModelo;

type

  { TmenuCadastroUsuarioF }

  TmenuCadastroUsuarioF = class(TxCadModeloF)
    cbMostrarSenha: TCheckBox;
    cbPesquisa: TComboBox;
    edtUserId: TDBEdit;
    edtUserSenha: TDBEdit;
    edtUserUser: TDBEdit;
    edtUserName: TDBEdit;
    edtPesquisar: TEdit;
    lbUserId: TLabel;
    lbUserUser: TLabel;
    lbUserName: TLabel;
    lbUserSenha: TLabel;
  procedure btnCancelClick(Sender: TObject);
  procedure btnEditarClick(Sender: TObject);
  procedure btnExcluirClick(Sender: TObject);
  procedure btnFecharClick(Sender: TObject);
  procedure btnGravarClick(Sender: TObject);
  procedure btnImprimirClick(Sender: TObject);
  procedure btnNovoClick(Sender: TObject);
  procedure btnPesquisarClick(Sender: TObject);
  procedure cbMostrarSenhaChange(Sender: TObject);
  procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  menuCadastroUsuarioF: TmenuCadastroUsuarioF;

implementation

uses
  dataBaseConection, relUsuarios;

{$R *.lfm}


// FORMSHOW & FORMCLOSE
procedure TmenuCadastroUsuarioF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dataBaseConectionF.qryUsers.Close;
  CloseAction:= caFree;
end;

procedure TmenuCadastroUsuarioF.FormShow(Sender: TObject);
begin
  dataBaseConectionF.qryUsers.Open;
  pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO NOVO
procedure TmenuCadastroUsuarioF.btnNovoClick(Sender: TObject);
begin
  dataBaseConectionF.qryUsers.Insert;
  pgControl.ActivePage := tbCadastrar;
end;
// -----------------------------------------------------------------------------


// BOTÃO FECHAR.
procedure TmenuCadastroUsuarioF.btnFecharClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja fechar este formulário?', mtInformation,[mbyes,mbno],0)= mryes then
  begin
    Close;
  end;
end;
// -----------------------------------------------------------------------------


// BOTÃO GRAVAR.
procedure TmenuCadastroUsuarioF.btnGravarClick(Sender: TObject);
begin
    dataBaseConectionF.qryUsers.Post;
    pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO EXCLUIR.
procedure TmenuCadastroUsuarioF.btnExcluirClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    dataBaseConectionF.qryUsers.Delete;
    pgControl.ActivePage := tbPesquisar;
  end;
end;
// -----------------------------------------------------------------------------


// BOTÃO CANCELAR.
procedure TmenuCadastroUsuarioF.btnCancelClick(Sender: TObject);
begin
  dataBaseConectionF.qryUsers.Cancel;
  pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO PESQUISAR.
procedure TmenuCadastroUsuarioF.btnPesquisarClick(Sender: TObject);
begin
  if (edtPesquisar.Text = '') then
    begin
        dataBaseConectionF.qryUsers.Close;
        dataBaseConectionF.qryUsers.SQL.Text := 'select * from USUARIOS';
        dataBaseConectionF.qryUsers.Open;
    end
  else
    begin
      if (cbPesquisa.ItemIndex = 0) then
      begin
        dataBaseConectionF.qryUsers.Close;
        dataBaseConectionF.qryUsers.SQL.Text := 'select * from USUARIOS where Upper(nome_completo) like ' + UpperCase(QuotedStr(edtPesquisar.Text + '%'));
        dataBaseConectionF.qryUsers.Open;
      end
      else if (cbPesquisa.ItemIndex = 1) then
      begin
        dataBaseConectionF.qryUsers.Close;
        dataBaseConectionF.qryUsers.SQL.Text := 'select * from USUARIOS where id = ' + edtPesquisar.Text;
        dataBaseConectionF.qryUsers.Open;
      end;
    end;
end;
// -----------------------------------------------------------------------------


// BOTÃO EDITAR.
procedure TmenuCadastroUsuarioF.btnEditarClick(Sender: TObject);
begin
  dataBaseConectionF.qryUsers.Edit;
  pgControl.ActivePage := tbCadastrar;
end;
// -----------------------------------------------------------------------------


// CHECKBOX MOSTRAR SENHA.
procedure TmenuCadastroUsuarioF.cbMostrarSenhaChange(Sender: TObject);
begin
  if cbMostrarSenha.Checked = true then
     edtUserSenha.PasswordChar := #0
  else
     edtUserSenha.PasswordChar := Char('*');
end;
// -----------------------------------------------------------------------------


// BOTÃO IMPRIMIR.
procedure TmenuCadastroUsuarioF.btnImprimirClick(Sender: TObject);
begin
  relUsuariosF := TrelUsuariosF.Create(Self);
  relUsuariosF.ShowModal;
end;
// -----------------------------------------------------------------------------

end.

