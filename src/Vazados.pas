unit Vazados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormVazados = class(TForm)
    LvVazados: TListView;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVazados: TFormVazados;

implementation

{$R *.dfm}

uses PrinUnit;

procedure TFormVazados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
