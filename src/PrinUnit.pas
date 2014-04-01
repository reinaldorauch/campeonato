unit PrinUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TRegTimes = Record
    Nome: String;
    Vitorias,
    Derrotas,
    Empates,
    GolFeitos,
    GolSofridos: Word;
  End;

  TPrinForm = class(TForm)
    MmFile: TMemo;
    BtnOpen: TButton;
    OpenDialog: TOpenDialog;
    procedure BtnOpenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SeparaLinha(Linha: String);
    function AchaTime(NomeBusca:String): Byte;
    procedure Mostra;
    procedure AnalisaJogo;
  end;

var
  PrinForm: TPrinForm;
  CurrentFile: TextFile;
  VetTimes: Array of TRegTimes;
  NomeA, NomeB: String;
  GolA, GolB, PosA, PosB: Byte;

implementation

{$R *.dfm}

function TPrinForm.AchaTime(NomeBusca: String): Byte;
var i: Byte;
begin

  i := 0;

  while  (i <= (Length(VetTimes) - 1)) AND (VetTimes[i].Nome <> NomeBusca)do
    inc(i);

  if(i = Length(VetTimes)) then
    begin
      SetLength(VetTimes, Length(VetTimes) + 1);

      with VetTimes[i] do
        begin
          Nome        := NomeBusca;
          Vitorias    := 0;
          Derrotas    := 0;
          Empates     := 0;
          GolFeitos   := 0;
          GolSofridos := 0;
        end;

    end;

  Result := i;

end;

procedure TPrinForm.AnalisaJogo;
begin
  inc(VetTimes[PosA].GolFeitos, GolA);
  inc(VetTimes[PosA].GolSofridos, GolB);
  inc(VetTimes[PosB].GolFeitos, GolB);
  inc(VetTimes[PosB].GolSofridos, GolA);

  if(GolA > GolB) then
    begin
      inc(VetTimes[PosA].Vitorias);
      inc(VetTimes[PosB].Derrotas);
    end
  else
    if(GolB > GolA) then
      begin
        inc(VetTimes[PosB].Vitorias);
        inc(VetTimes[PosA].Derrotas);
      end
    else
      begin
        inc(VetTimes[PosA].Empates);
        inc(VetTimes[PosB].Empates);
      end;
end;

procedure TPrinForm.BtnOpenClick(Sender: TObject);
var Line: string;
begin
  if(OpenDialog.Execute) then
    if(FileExists(OpenDialog.FileName)) then
      begin

        AssignFile(CurrentFile, OpenDialog.FileName);

        Reset(CurrentFile);

        while(NOT eof(CurrentFile)) do
          begin
            Readln(CurrentFile, Line);
            MmFile.Lines.Add(Line);
            SeparaLinha(Line);
            PosA := AchaTime(NomeA);
            PosB := AchaTime(NomeB);
            AnalisaJogo;
            //
          end;

        Mostra;
        // Ordenar
        // Mostrar

        CloseFile(CurrentFile);

      end
  else
    ShowMessage('Arquivo ' + OpenDialog.FileName + ' não encontrado');
end;

procedure TPrinForm.Mostra;
var i: Byte;
begin
  MmFile.Lines.Add('');

  for I := 0 to Length(VetTimes) - 1 do
    with VetTimes[i] do
      begin
        MmFile.Lines.Add(Nome + ', v: ' + inttostr(Vitorias) + ', d: '
          + inttostr(Derrotas) + ', e: ' + inttostr(Empates) + ', gf: '
          + inttostr(GolFeitos) + ', gs: ' + inttostr(GolSofridos) + ', s: '
          + inttostr(GolFeitos - GolSofridos));
      end;
end;

procedure TPrinForm.SeparaLinha(Linha: String);
var PosVirg: Byte;
begin
  PosVirg := Pos(',', Linha);
  NomeA   := copy(Linha, 1, PosVirg-1);
  GolA    := StrToInt(Linha[PosVirg+1]); // May Throw an Exception

  Linha   := copy(Linha, PosVirg + 3, (Length(Linha) - PosVirg + 3));

  PosVirg := Pos(',', Linha);
  NomeB   := copy(Linha, 1, PosVirg - 1);
  GolB    := StrToInt(Linha[PosVirg + 1]); // May Throw an Exception
end;

end.
