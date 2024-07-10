unit dataBaseConection;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset, ZAbstractRODataset, menuOrcamento;

type

  { TdataBaseConectionF }

  TdataBaseConectionF = class(TDataModule)
    dsUser: TDataSource;
    dsCategory: TDataSource;
    dsOrcamento: TDataSource;
    dsOrcItem: TDataSource;
    dsGeneric: TDataSource;
    dsProduto: TDataSource;
    dsCliente: TDataSource;
    qryCategorycategoriaprodutoid: TZIntegerField;
    qryCategoryds_categoria_produto: TZRawStringField;
    qryClienteclienteid: TZIntegerField;
    qryClientecpf_cnpj_cliente: TZRawStringField;
    qryClientenome_cliente: TZRawStringField;
    qryClientetipo_cliente: TZRawStringField;
    qryOrcamentoclienteid: TZIntegerField;
    qryOrcamentodt_orcamento: TZDateTimeField;
    qryOrcamentodt_validade_orcamento: TZDateTimeField;
    qryOrcamentoorcamentoid: TZIntegerField;
    qryOrcamentovl_total_orcamento: TZBCDField;
    qryOrcItemds_produto: TZRawStringField;
    qryOrcItemorcamentoid: TZIntegerField;
    qryOrcItemorcamentoitemid: TZIntegerField;
    qryOrcItemprodutoid: TZIntegerField;
    qryOrcItemqt_produto: TZBCDField;
    qryOrcItemvl_total: TZBCDField;
    qryOrcItemvl_unitario: TZBCDField;
    qryProdutocategoriaprodutoid: TZIntegerField;
    qryProdutods_produto: TZRawStringField;
    qryProdutodt_cadastro_produto: TZDateTimeField;
    qryProdutoobs_produto: TZRawStringField;
    qryProdutoprodutoid: TZIntegerField;
    qryProdutostatus_produto: TZRawStringField;
    qryProdutovl_venda_produto: TZBCDField;
    qryUsersid: TZIntegerField;
    qryUsersnome_completo: TZRawStringField;
    qryUserssenha: TZRawStringField;
    qryUsersusuario: TZRawStringField;
    ZConnection1: TZConnection;
    qryCliente: TZQuery;
    qryProduto: TZQuery;
    qryGeneric: TZQuery;
    qryCategory: TZQuery;
    qryOrcItem: TZQuery;
    qryOrcamento: TZQuery;
    qryUsers: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryCategoryNewRecord(DataSet: TDataSet);
    procedure qryClienteNewRecord(DataSet: TDataSet);
    procedure qryOrcamentoNewRecord(DataSet: TDataSet);
    procedure qryOrcItemAfterPost(DataSet: TDataSet);
    procedure qryProdutoNewRecord(DataSet: TDataSet);
    procedure qryUsersNewRecord(DataSet: TDataSet);

  private

  public
    function getSequence(const pNomeSequence: String): String;
    procedure SunItens;

  end;

var
  dataBaseConectionF: TdataBaseConectionF;

implementation

{$R *.lfm}

{ TdataBaseConectionF }


// CONEXÃO COM BANCO DE DADOS.
procedure TdataBaseConectionF.DataModuleCreate(Sender: TObject);
begin
     ZConnection1.HostName := 'localhost';
     ZConnection1.DataBase := 'postgres';
     ZConnection1.User     := 'postgres';
     ZConnection1.Password := '1234';
     ZConnection1.Port     := 5432;
     ZConnection1.Protocol := 'postgresql';
     ZConnection1.Connected := True;
end;
// -----------------------------------------------------------------------------


// FUNÇAÕ SOMA ITENS
procedure TdataBaseConectionF.SunItens;
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

procedure TdataBaseConectionF.qryOrcItemAfterPost(DataSet: TDataSet);
begin
  dataBaseConectionF.SunItens;
end;
// -----------------------------------------------------------------------------


// FUNÇAÕ NEXTVAL
function TdataBaseConectionF.getSequence(const pNomeSequence: String): String;
begin
     Result := '';
 try
     qryGeneric.close;
     qryGeneric.SQL.Clear;
     qryGeneric.SQL.Add('SELECT NEXTVAL(' + QuotedStr(pNomeSequence) + ') AS CODIGO');
     qryGeneric.Open;
     Result := qryGeneric.FieldByName('CODIGO').AsString;
 finally
   qryGeneric.Close;
 end;

end;
// -----------------------------------------------------------------------------


// FUNÇAÕ NEXTVAL CADASTRO DE ORÇAMENTOS.
procedure TdataBaseConectionF.qryOrcamentoNewRecord(DataSet: TDataSet);
begin
  qryOrcamentoorcamentoid.AsInteger:= StrToInt(getSequence('orcamento_orcamentoid_seq'));
end;
// -----------------------------------------------------------------------------


// FUNÇÃO NEXTVAL CADASTRO DE USUÁRIOS.
procedure TdataBaseConectionF.qryUsersNewRecord(DataSet: TDataSet);
begin
  qryUsersid.AsInteger:= StrToInt(getSequence('usuario_oid'));
end;
// -----------------------------------------------------------------------------


// FUNÇAÕ NEXTVAL CADASTRO DE CATEGORIA DE PRODUTOS.
procedure TdataBaseConectionF.qryCategoryNewRecord(DataSet: TDataSet);
begin
  qryCategorycategoriaprodutoid.AsInteger:= StrToInt(getSequence('categoria_produto_categoriaprodutoid_seq'));
end;
// -----------------------------------------------------------------------------


// FUNÇAÕ NEXTVAL CADASTRO DE CLIENTES.
procedure TdataBaseConectionF.qryClienteNewRecord(DataSet: TDataSet);
begin
  qryClienteclienteid.AsInteger:= StrToInt(getSequence('cliente_clienteid'));
end;
// -----------------------------------------------------------------------------


// FUNÇAÕ NEXTVAL CADASTRO DE PRODUTOS.
procedure TdataBaseConectionF.qryProdutoNewRecord(DataSet: TDataSet);
begin
  qryProdutoprodutoid.AsInteger := StrToInt(getSequence('produto_produtoid'));
end;
// -----------------------------------------------------------------------------

end.

