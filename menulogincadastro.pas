unit menuLoginCadastro;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  DBCtrls, StdCtrls;

type

  { TmenuLoginCadastroF }

  TmenuLoginCadastroF = class(TForm)
    btnGravar: TBitBtn;
    btnCancel: TBitBtn;
    cbMostrarSenha: TCheckBox;
    edtIdUsuario: TDBEdit;
    edtUsuarioUsuario: TDBEdit;
    edtUsuarioName: TDBEdit;
    edtUsuarioSenha: TDBEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    lbCadUserId: TLabel;
    lbCadUserUser: TLabel;
    lbCadUserName: TLabel;
    lbCadUserSenha: TLabel;
    version: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure cbMostrarSenhaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  menuLoginCadastroF: TmenuLoginCadastroF;

implementation

uses
  dataBaseConection;

{$R *.lfm}

{ TmenuLoginCadastroF }


// FORMSHOW & FORMCLOSE
procedure TmenuLoginCadastroF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dataBaseConectionF.qryUsers.Close;
end;

procedure TmenuLoginCadastroF.FormShow(Sender: TObject);
begin
  dataBaseConectionF.qryUsers.Open;
  dataBaseConectionF.qryUsers.Insert;
end;
// -----------------------------------------------------------------------------


// CHECKBOX MOSTRAR SENHA.
procedure TmenuLoginCadastroF.cbMostrarSenhaChange(Sender: TObject);
begin
  if cbMostrarSenha.Checked = true then
     edtUsuarioSenha.PasswordChar := #0
  else
     edtUsuarioSenha.PasswordChar := Char('*');
end;
// -----------------------------------------------------------------------------


// BOTÃO GRAVAR.
procedure TmenuLoginCadastroF.btnGravarClick(Sender: TObject);
begin
  dataBaseConectionF.qryUsers.Post;
  Close;
end;
// -----------------------------------------------------------------------------


// BOTÃO CANCELAR.
procedure TmenuLoginCadastroF.btnCancelClick(Sender: TObject);
begin
  dataBaseConectionF.qryUsers.Cancel;
  Close;
end;
// -----------------------------------------------------------------------------

end.

