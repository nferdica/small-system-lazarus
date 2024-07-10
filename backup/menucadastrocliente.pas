unit menuCadastroCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, ZDataset, LR_Class, xCadModelo;

type

  { TmenuCadastroClienteF }

  TmenuCadastroClienteF = class(TxCadModeloF)
    cbPesquisa: TComboBox;
    cbTipoCliente: TDBComboBox;
    edtIdCliente: TDBEdit;
    edtCpfCnpj: TDBEdit;
    edtNomeCompleto: TDBEdit;
    edtPesquisar: TEdit;
    lbCadCadCliId: TLabel;
    lbCadCadCliTipo: TLabel;
    lbCadCadCliCpfCnpj: TLabel;
    lbCadCadCliNome: TLabel;
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
  menuCadastroClienteF: TmenuCadastroClienteF;

implementation

uses
  dataBaseConection, relCliente;

{$R *.lfm}

{ TmenuCadastroClienteF }


// FORMSHOW & FORMCLOSE
procedure TmenuCadastroClienteF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
  dataBaseConectionF.qryCliente.Close;
end;

procedure TmenuCadastroClienteF.FormShow(Sender: TObject);
begin
  dataBaseConectionF.qryCliente.Open;
  pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO NOVO.
procedure TmenuCadastroClienteF.btnNovoClick(Sender: TObject);
begin
  dataBaseConectionF.qryCliente.Insert;
  pgControl.ActivePage := tbCadastrar;
end;
// -----------------------------------------------------------------------------


// BOTÃO FECHAR.
procedure TmenuCadastroClienteF.btnFecharClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja fechar este formulário?', mtInformation,[mbyes,mbno],0)= mryes then
  begin
    Close;
  end;
end;
// -----------------------------------------------------------------------------


// BOTÃO GRAVAR.
procedure TmenuCadastroClienteF.btnGravarClick(Sender: TObject);
begin
    dataBaseConectionF.qryCliente.Post;
    pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO EXCLUIR.
procedure TmenuCadastroClienteF.btnExcluirClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtInformation,[mbyes,mbno],0)= mryes then
  begin
    dataBaseConectionF.qryCliente.Delete;
    pgControl.ActivePage := tbPesquisar;
  end;
end;
// -----------------------------------------------------------------------------


// BOTÃO CANCELAR.
procedure TmenuCadastroClienteF.btnCancelClick(Sender: TObject);
begin
  dataBaseConectionF.qryCliente.Cancel;
  pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO PESQUISAR.
procedure TmenuCadastroClienteF.btnPesquisarClick(Sender: TObject);
begin
  if (edtPesquisar.Text = '') then
    begin
        dataBaseConectionF.qryCliente.Close;
        dataBaseConectionF.qryCliente.SQL.Text := 'select * from CLIENTE';
        dataBaseConectionF.qryCliente.Open;
    end
  else
    begin
      if (cbPesquisa.ItemIndex = 0) then
      begin
        dataBaseConectionF.qryCliente.Close;
        dataBaseConectionF.qryCliente.SQL.Text := 'select * from CLIENTE where Upper(nome_cliente) like ' + UpperCase(QuotedStr(edtPesquisar.Text + '%'));
        dataBaseConectionF.qryCliente.Open;
      end
      else if (cbPesquisa.ItemIndex = 1) then
      begin
        dataBaseConectionF.qryCliente.Close;
        dataBaseConectionF.qryCliente.SQL.Text := 'select * from CLIENTE where clienteid = ' + edtPesquisar.Text;
        dataBaseConectionF.qryCliente.Open;
      end;
    end;
end;
// -----------------------------------------------------------------------------


// BOTÃO EDITAR.
procedure TmenuCadastroClienteF.btnEditarClick(Sender: TObject);
begin
  dataBaseConectionF.qryCliente.Edit;
  pgControl.ActivePage := tbCadastrar;
end;
// -----------------------------------------------------------------------------


// BOTÃO IMPRIMIR.
procedure TmenuCadastroClienteF.btnImprimirClick(Sender: TObject);
begin
  relClienteF := TrelClienteF.Create(Self);
  relClienteF.ShowModal;
end;
// -----------------------------------------------------------------------------

end.

