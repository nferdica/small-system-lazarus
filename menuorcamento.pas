unit menuOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  DBCtrls, DBGrids, Buttons, ZDataset, xCadModelo, DB;

type

  { TmenuOrcamentoF }

  TmenuOrcamentoF = class(TxCadModeloF)
    btnImprimir1: TBitBtn;
    btnRemoverItem: TBitBtn;
    btnAdicionarItem: TBitBtn;
    cbPesquisa: TComboBox;
    edtIdOrcamento: TDBEdit;
    edtClienteOrcamento: TDBEdit;
    edtDateOrcamento: TDBEdit;
    edtDateValOrcamento: TDBEdit;
    edtValTot: TDBEdit;
    DBGrid2: TDBGrid;
    edtPesquisar: TEdit;
    lbOrcTotVal: TLabel;
    lbOrcDateVal: TLabel;
    lbOrcDateOrcamento: TLabel;
    lbOrcCliente: TLabel;
    lbOrcId: TLabel;
    spdCliente: TSpeedButton;
    tPanelCadastroTop: TPanel;
    qryGenerica: TZQuery;
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnRemoverItemClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AbreOrcItens(orcamentoid : Integer);
    procedure spdClienteClick(Sender: TObject);
  private


  public
    procedure SunItens;


  end;

var
  menuOrcamentoF: TmenuOrcamentoF;

implementation

uses
  menuOrcamentoCliente, menuOrcamentoAdicionarProduto, DateUtils, dataBaseConection, relOrcamento;

{$R *.lfm}


// FORMSHOW & FORMCLOSE
procedure TmenuOrcamentoF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dataBaseConectionF.qryOrcamento.Close;
  CloseAction := caFree;
end;

procedure TmenuOrcamentoF.FormShow(Sender: TObject);
begin
  dataBaseConectionF.qryOrcamento.Open;
  pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO NOVO.
procedure TmenuOrcamentoF.btnNovoClick(Sender: TObject);

var newdate: TDateTime;

begin
  dataBaseConectionF.qryOrcamento.Open;
  dataBaseConectionF.qryOrcamento.Insert;
  AbreOrcItens(dataBaseConectionF.qryOrcamentoorcamentoid.AsInteger);
  pgControl.ActivePage := tbCadastrar;
  dataBaseConectionF.qryOrcamentodt_orcamento.AsDateTime := Date;
  newdate := IncDay(Date, 10);
  dataBaseConectionF.qryOrcamentodt_validade_orcamento.AsDateTime := newdate
end;
// -----------------------------------------------------------------------------


// BOTÃO FECHAR.
procedure TmenuOrcamentoF.btnFecharClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja fechar este formulário?', mtInformation,[mbyes,mbno],0)= mryes then
  begin
    Close;
  end;
end;
// -----------------------------------------------------------------------------


// BOTÃO GRAVAR.
procedure TmenuOrcamentoF.btnGravarClick(Sender: TObject);
begin
    if not (dataBaseConectionF.qryOrcamento.State in [dsInsert]) Then
    if edtValTot.Text = '' then
    begin
      ShowMessage('Não ha Itens nesse Orçamento, Impossível guarda-lo na memória');
      dataBaseConectionF.qryOrcamento.Delete;
      pgControl.ActivePage := tbPesquisar;
      Exit;
    end;
   if edtClienteOrcamento.Text = '' then
    begin
      ShowMessage('Por Favor, Informe o ID do Cliente');
      Exit
    end;
      dataBaseConectionF.qryOrcamento.Post;
      pgControl.ActivePage := tbPesquisar;

end;
// -----------------------------------------------------------------------------


// BOTÃO EXCLUIR
procedure TmenuOrcamentoF.btnExcluirClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja excluir esse orçamento?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    if not dataBaseConectionF.qryOrcItem.IsEmpty then
    begin
      qryGenerica.Close;
      qryGenerica.SQL.Text:= 'DELETE FROM ORCAMENTO_ITEM WHERE ORCAMENTOID = ' + dataBaseConectionF.qryOrcamentoorcamentoid.AsString;
      qryGenerica.ExecSQL;
    end;

    qryGenerica.Close;
    qryGenerica.SQL.Text:= 'DELETE FROM ORCAMENTO WHERE ORCAMENTOID = ' + dataBaseConectionF.qryOrcamentoorcamentoid.AsString;
    qryGenerica.ExecSQL;

    btnPesquisar.Click;
    pgControl.ActivePage := tbPesquisar;
  end;
end;
// -----------------------------------------------------------------------------


// BOTÃO CANCELAR.
procedure TmenuOrcamentoF.btnCancelClick(Sender: TObject);
begin
  dataBaseConectionF.qryOrcamento.Cancel;
  pgControl.ActivePage := tbPesquisar;
end;
// -----------------------------------------------------------------------------


// BOTÃO PESQUISAR.
procedure TmenuOrcamentoF.btnPesquisarClick(Sender: TObject);
begin
  if (edtPesquisar.Text = '') then
    begin
        dataBaseConectionF.qryOrcamento.Close;
        dataBaseConectionF.qryOrcamento.SQL.Text := 'select * from ORCAMENTO';
        dataBaseConectionF.qryOrcamento.Open;
    end
      else if (cbPesquisa.ItemIndex = 0) then
      begin
        dataBaseConectionF.qryOrcamento.Close;
        dataBaseConectionF.qryOrcamento.SQL.Text := 'select * from ORCAMENTO where orcamentoid = ' + edtPesquisar.Text;
        dataBaseConectionF.qryOrcamento.Open;
      end;
    end;
// -----------------------------------------------------------------------------


// BOTÃO EDITAR.
procedure TmenuOrcamentoF.btnEditarClick(Sender: TObject);
begin
  dataBaseConectionF.qryOrcItem.Open;
  dataBaseConectionF.qryOrcItem.Edit;
  dataBaseConectionF.qryOrcamento.Edit;
  AbreOrcItens(dataBaseConectionF.qryOrcamentoorcamentoid.AsInteger);
  pgControl.ActivePage := tbCadastrar;
end;
// -----------------------------------------------------------------------------


// BOTÃO IMPRIMIR.
procedure TmenuOrcamentoF.btnImprimirClick(Sender: TObject);
begin
   relOrcamentoF := TrelOrcamentoF.Create(Self);
   relOrcamentoF.ShowModal;
end;
// -----------------------------------------------------------------------------


// DOIS CLIQUES NO ITEM DO GRID PARA VISUALIZAR/EDITAR INFORMAÇÕES
procedure TmenuOrcamentoF.DBGrid1DblClick(Sender: TObject);
begin
    pgControl.ActivePage := tbCadastrar;
    AbreOrcItens(dataBaseConectionF.qryOrcamentoorcamentoid.AsInteger);
end;
// -----------------------------------------------------------------------------


// ITENS DO ORÇAMENTO.
procedure TmenuOrcamentoF.AbreOrcItens(orcamentoid : Integer);
begin
   if orcamentoid <> 0 then
  begin
      dataBaseConectionF.qryOrcItem.Close;
      dataBaseConectionF.qryOrcItem.SQL.Clear;
      dataBaseConectionF.qryOrcItem.SQL.Add(
                      'SELECT '+
                      'OI.ORCAMENTOITEMID, '+
                      'OI.ORCAMENTOID, '+
                      'OI.PRODUTOID, '+
                      'P.DS_PRODUTO, '+
                      'OI.QT_PRODUTO, '+
                      'OI.VL_UNITARIO, '+
                      'OI.VL_TOTAL '+
                      'FROM ORCAMENTO_ITEM OI ' +
                      'LEFT JOIN PRODUTO P ON OI.PRODUTOID = P.PRODUTOID ' +
                      'WHERE ORCAMENTOID = '+ inttostr(orcamentoid) + ' ' +
                      'ORDER BY ORCAMENTOID');
       dataBaseConectionF.qryOrcItem.Open;
  end;
end;
// -----------------------------------------------------------------------------


// BOTÃO SELECIONAR CLIENTE.
procedure TmenuOrcamentoF.spdClienteClick(Sender: TObject);
begin
   menuOrcamentoClienteF := TmenuOrcamentoClienteF.Create(Self);
   menuOrcamentoClienteF.ShowModal;
end;
// -----------------------------------------------------------------------------


// BOTÃO ADICIONAR ITEM,
procedure TmenuOrcamentoF.btnAdicionarItemClick(Sender: TObject);
begin
   if not (dataBaseConectionF.qryOrcItem.Active) Then
     dataBaseConectionF.qryOrcItem.Open;

   if not (dataBaseConectionF.qryOrcItem.State in [dsInsert]) Then
     dataBaseConectionF.qryOrcItem.Insert;

   dataBaseConectionF.qryOrcItemorcamentoitemid.AsInteger := StrToInt(dataBaseConectionF.getSequence('orcamento_item_seq'));
   dataBaseConectionF.qryOrcItemorcamentoid.AsInteger := dataBaseConectionF.qryOrcamentoorcamentoid.AsInteger;

   menuOrcamentoAdicionarProdutoF := TmenuOrcamentoAdicionarProdutoF.Create(Self);
   menuOrcamentoAdicionarProdutoF.ShowModal;
end;
// -----------------------------------------------------------------------------


// BOTÃO REMOVER ITEM.
procedure TmenuOrcamentoF.btnRemoverItemClick(Sender: TObject);
begin
   If  MessageDlg('Você tem certeza que deseja excluir esse orçamento?', mtConfirmation,[mbyes,mbno],0)= mryes then
   begin
     if not dataBaseConectionF.qryOrcItem.IsEmpty then
     begin
       qryGenerica.Close;
       qryGenerica.SQL.Text:= 'DELETE FROM ORCAMENTO_ITEM WHERE ORCAMENTOITEMID = ' + dataBaseConectionF.qryOrcItemorcamentoitemid.AsString;
       qryGenerica.ExecSQL;

       AbreOrcItens(dataBaseConectionF.qryOrcamentoorcamentoid.AsInteger);
       menuOrcamentoF.SunItens;
     end;
   end;
end;
// -----------------------------------------------------------------------------


// FUNÇAÕ SOMA ITENS
procedure TmenuOrcamentoF.SunItens;
begin

  if not (dataBaseConectionF.qryOrcamento.State in [dsEdit, dsInsert]) then
     dataBaseConectionF.qryOrcamento.Edit;

  if not (dataBaseConectionF.qryOrcItem.State in [dsEdit, dsInsert]) then
     dataBaseConectionF.qryOrcItem.Edit;

  // VAI PRO PRIMEIRO.
  dataBaseConectionF.qryOrcItem.First;
  dataBaseConectionF.qryOrcamentovl_total_orcamento.AsFloat := 0;
  while not dataBaseConectionF.qryOrcItem.Eof do
  begin
    dataBaseConectionF.qryOrcamentovl_total_orcamento.AsFloat := dataBaseConectionF.qryOrcamentovl_total_orcamento.AsFloat + dataBaseConectionF.qryOrcItemvl_total.AsFloat;
    dataBaseConectionF.qryOrcItem.next;
  end;
end;

end.

