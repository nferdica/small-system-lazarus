unit xCadModelo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Buttons, DBGrids;

type

  { TxCadModeloF }

  TxCadModeloF = class(TForm)
    btnImprimir: TBitBtn;
    btnEditar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnCancel: TBitBtn;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    btnGravar: TBitBtn;
    btnNovo: TBitBtn;
    DBGrid1: TDBGrid;
    Image1: TImage;
    imgSaberTiForms: TImage;
    pgControl: TPageControl;
    tPanelPesquisarTop: TPanel;
    tPanelCadastroBotton: TPanel;
    tPanelPesquisarBotton: TPanel;
    tbPesquisar: TTabSheet;
    tbCadastrar: TTabSheet;
  private

  public

  end;

var
  xCadModeloF: TxCadModeloF;

implementation

{$R *.lfm}

end.

