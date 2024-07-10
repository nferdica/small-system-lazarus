unit menuLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls,
  DBCtrls, StdCtrls;

type

  { TmenuLoginF }

  TmenuLoginF = class(TForm)
    btnCadastrar: TBitBtn;
    btnFechar: TBitBtn;
    btnEntrar: TBitBtn;
    cbMostrarSenha: TCheckBox;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    version: TLabel;
    lbLoginUsuario: TLabel;
    lbLoginSenha: TLabel;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure cbMostrarSenhaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);

  private
    function ValidaUsuario(user: String; pass: String): Boolean;

  public

  end;

var
  menuLoginF: TmenuLoginF;

implementation

uses
  dataBaseConection, menuPrincipal, menuLoginCadastro;

{$R *.lfm}

{ TmenuLoginF }


// FORMSHOW & FORMCLOSE
procedure TmenuLoginF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   dataBaseConectionF.qryUsers.Close;
end;

procedure TmenuLoginF.FormShow(Sender: TObject);
begin
  dataBaseConectionF.qryUsers.Open;
end;
// -----------------------------------------------------------------------------


// BOTÃO FECHAR
procedure TmenuLoginF.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;
// -----------------------------------------------------------------------------


// BOTÃO CADASTRAR.
procedure TmenuLoginF.btnCadastrarClick(Sender: TObject);
begin
  menuLoginCadastroF := TmenuLoginCadastroF.Create(Self);
  menuLoginCadastroF.ShowModal;
end;
// -----------------------------------------------------------------------------


// CHECKBOX MOSTRAR SENHA.
procedure TmenuLoginF.cbMostrarSenhaChange(Sender: TObject);
begin
  if cbMostrarSenha.Checked = true then
     edtSenha.PasswordChar := #0
  else
     edtSenha.PasswordChar := Char('*');
end;
// -----------------------------------------------------------------------------


// VALIDANDO USUÁRIO & SENHA.
function TmenuLoginF.ValidaUsuario(user: String; pass: String): Boolean;
begin

   if (user = '') then
   begin
      ShowMessage('Digite seu nome de USUÁRIO!');
      edtUsuario.SetFocus;
      Result := False;
      Exit;
   end;

   if (pass = 'Digite sua SENHA!') then
   begin
      ShowMessage('');
      edtSenha.SetFocus;
      Result := False;
      Exit;
   end;

   dataBaseConectionF.qryGeneric.Close;
   dataBaseConectionF.qryGeneric.SQL.Clear;
   dataBaseConectionF.qryGeneric.SQL.Add('SELECT COUNT(*) AS NUMBER '+'FROM USUARIOS '+ 'WHERE USUARIO = ' +  QuotedStr(user) + ' ' + 'AND SENHA = ' + QuotedStr(pass));
   dataBaseConectionF.qryGeneric.Open;

   if dataBaseConectionF.qryGeneric.FieldByName('NUMBER').AsInteger = 0 then
   Begin
      ShowMessage('Campo de USUÁRIO ou SENHA estão incorretos!');
      edtUsuario.SetFocus;
      Result := False
   end
   else
      Result := True;
end;
// -----------------------------------------------------------------------------


// BOTÃO ENTRAR.
procedure TmenuLoginF.btnEntrarClick(Sender: TObject);
begin
   if ValidaUsuario(edtUsuario.Text,edtSenha.Text) = true then
   begin
     menuPrincipalF:= TmenuPrincipalF.create(Self);
     menuPrincipalF.ShowModal;
   end;
end;
// -----------------------------------------------------------------------------

end.

