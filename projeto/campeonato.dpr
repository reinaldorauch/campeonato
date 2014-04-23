program campeonato;

uses
  Vcl.Forms,
  PrinUnit in '..\src\PrinUnit.pas' {PrinForm},
  Vazados in '..\src\Vazados.pas' {FormVazados};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrinForm, PrinForm);
  Application.Run;
end.
