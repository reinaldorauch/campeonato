program campeonato;

uses
  Vcl.Forms,
  PrinUnit in '..\src\PrinUnit.pas' {PrinForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrinForm, PrinForm);
  Application.Run;
end.
