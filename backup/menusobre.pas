unit menuSobre;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons;

type

  { TmenuSobreF }

  TmenuSobreF = class(TForm)
    btnFechar: TBitBtn;
    imgLogo: TImage;
    memSobre: TMemo;
    procedure btnFecharClick(Sender: TObject);

  private

  public

  end;

var
  menuSobreF: TmenuSobreF;

implementation

{$R *.lfm}

{ TmenuSobreF }


// BOTÃO FECHAR.
procedure TmenuSobreF.btnFecharClick(Sender: TObject);
begin
  Close;
end;
// -----------------------------------------------------------------------------

end.

