unit PrinUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, RegularExpressions;

type
  TRegTimes = Record
    Nome: String;
    Vitorias,
    Derrotas,
    Empates,
    GolFeitos,
    GolSofridos: Word;
  End;

  EInvalidLine = class(Exception);

  TPrinForm = class(TForm)
    BtnOpen: TButton;
    OpenDialog: TOpenDialog;
    LvPlacar: TListView;
    EdBusca: TEdit;
    BtnMostraVazado: TButton;
    BtnBuscar: TButton;
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnMostraVazadoClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure SeparaLinha(Linha: String);
    procedure Mostra;
    procedure AnalisaJogo;
    procedure ShowError(ind: LongWord; msg: String);
    procedure Ordena;
    procedure VerifyMaxSof(GolSof: Word; Ind: Word);
    function AchaTime(NomeBusca:String): Byte;
    function Pontos(ind: Byte): Word;
    function Partidas(ind: Byte): Word;
    function Saldo(ind: Byte): Integer;
  end;

var
  PrinForm: TPrinForm;
  CurrentFile: TextFile;
  VetTimes: Array of TRegTimes;
  NomeA, NomeB: String;
  GolA, GolB, PosA, PosB: Byte;
  MaxGolSof: Word = 0;
  ListTimesVaz: Array of Word;
  ListResults: Array of Word;
  SearchTerm: String;

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

procedure TPrinForm.BtnBuscarClick(Sender: TObject);
var
  I: Integer;
begin
  if(Length(VetTimes) = 0) then
    ShowMessage('Nenhum time para buscar')
  else
    if(Length(Trim(EdBusca.Text)) = 0) then
      ShowMessage('Nada para buscar')
    else
      if((Length(ListResults) > 0) AND (SearchTerm = Trim(EdBusca.Text))) then
        begin
          LvPlacar.ItemIndex := ListResults[0];
          ListResults := Copy(ListResults, 1, Length(ListResults));
        end
    else
      begin
        SearchTerm := Trim(EdBusca.Text);
        for I := 0 to Length(VetTimes) - 1 do
          with VetTimes[i] do
            if(Pos(SearchTerm, Nome) > 0) then
              begin
                SetLength(ListResults, Length(ListResults) + 1);
                ListResults[Length(ListResults) - 1] := I;
              end;
        LvPlacar.ItemIndex := ListResults[0];
        ListResults := Copy(ListResults, 1, Length(ListResults));
      end;

end;

procedure TPrinForm.BtnMostraVazadoClick(Sender: TObject);
var
  ShowString: String;
  i: Word;
begin
  if((Length(VetTimes) = 0) OR (Length(ListTimesVaz) = 0)) then
    ShowMessage('Não há times para analizar')
  else
    begin
      ShowString := 'Times com a defeza mais fraca do campeonato:' + #13;

      for i := 0 to Length(ListTimesVaz) - 1 do
        with VetTimes[ListTimesVaz[i]] do
          ShowString := ShowString + Nome + ': ' + IntToStr(GolSofridos)
            + ' gols' + #13;

      ShowMessage(ShowString);
    end;
end;

procedure TPrinForm.BtnOpenClick(Sender: TObject);
var Line: String;
var iLine: LongWord;
begin
  if(OpenDialog.Execute) then
    if(FileExists(OpenDialog.FileName)) then
      begin

        AssignFile(CurrentFile, OpenDialog.FileName);

        Reset(CurrentFile);

        iLine := 0;

        try

          while(NOT eof(CurrentFile)) do
            begin
              inc(iLine);
              Readln(CurrentFile, Line);

              Line := Trim(Line);

              if(Line <> '') then
                begin
                  SeparaLinha(Line);
                  PosA := AchaTime(NomeA);
                  PosB := AchaTime(NomeB);
                  AnalisaJogo;
                end;

            end;

          Ordena;
          Mostra;

        except
          on e:EConvertError do
            ShowError(iLine, ' Não se pode converter uma letra em um número');
          on e:EInvalidLine do
            ShowError(iLine, e.Message);
          on e:EInOutError do
            ShowMessage('Erro de entrada e saída, não é possível ler o arquivo');
          on e:Exception do
            ShowMessage('Erro desconhecido. Contate o suporte');
        end;

        CloseFile(CurrentFile);

      end
  else
    ShowMessage('Arquivo ' + OpenDialog.FileName + ' não encontrado');
end;

procedure TPrinForm.Mostra;
var i: Byte;
begin
  LvPlacar.Items.Clear;

  for I := 0 to Length(VetTimes) - 1 do
    with LvPlacar.Items.Add, VetTimes[i] do
      begin

        VerifyMaxSof(GolSofridos, I);

        Caption := intToStr(i + 1);

        SubItems.Add(Nome);
        SubItems.Add(intToStr(Pontos(i)));
        SubItems.Add(intToStr(Vitorias));
        SubItems.Add(intToStr(Empates));
        SubItems.Add(intToStr(Derrotas));
        SubItems.Add(intToStr(Partidas(i)));
        SubItems.Add(intToStr(GolFeitos));
        SubItems.Add(intToStr(GolSofridos));
        SubItems.Add(intToStr(Saldo(i)));

      end;
end;

procedure TPrinForm.Ordena;
var i, j: word;
var aux: TRegTimes;
begin

  for i := 1 to Length(VetTimes)-1 do
    begin

      j := i;

      while (j > 0)
        AND ((Pontos(j) > Pontos(j-1))
          OR ((Pontos(j) = Pontos(j-1))
            AND (Saldo(j) > Saldo(j-1)))
          OR ((Pontos(j) = Pontos(j-1))
            AND (Saldo(j) = Saldo(j-1))
            AND (VetTimes[j].Vitorias > VetTimes[j-1].Vitorias))) do
        begin
          Aux := VetTimes[j];
          VetTimes[j] := VetTimes[j-1];
          VetTimes[j-1] := Aux;

          dec(j);
        end;

    end;

end;

function TPrinForm.Partidas(ind: Byte): Word;
begin
  with VetTimes[ind] do
    result := Vitorias + Empates + Derrotas;
end;

function TPrinForm.Pontos(ind: Byte): Word;
begin
  with VetTimes[ind] do
    result := (Vitorias * 3) + Empates;
end;

function TPrinForm.Saldo(ind: Byte): Integer;
begin
  with VetTimes[ind] do
    result := GolFeitos - GolSofridos;
end;

procedure TPrinForm.SeparaLinha(Linha: String);
var
  PosVirg: Byte;
  linePattern: TRegEx;
  Match: TMatch;
begin

  LinePattern := TRegEx.Create('^(.+),([0-9]),(.+),([0-9])$');

  Match := LinePattern.Match(Linha);

  if(Match.Success) then
    begin
      with Match.Groups do
        begin
          NomeA := Item[1].Value;
          GolA  := StrToInt(Item[2].Value);
          NomeB := Item[3].Value;
          GolB  := StrToInt(Item[4].Value);
        end;
    end
  else
    if(TRegEx.IsMatch(Linha, '^.+,.,.+,.$')) then
      raise EInvalidLine.Create('Há uma letra no placar')
    else
      raise EInvalidLine.Create('Formatação inválida da linha');

end;

procedure TPrinForm.ShowError(ind: LongWord; msg: String);
begin
  ShowMessage('Erro na linha #' + intToStr(ind) + ': ' + msg);
end;

procedure TPrinForm.VerifyMaxSof(GolSof: Word; Ind: Word);
begin
  if(GolSof > MaxGolSof) then
    begin
      MaxGolSof := GolSof;
      SetLength(ListTimesVaz, 1);
      ListTimesVaz[0] := Ind;
    end
  else if(GolSof = MaxGolSof) then
    begin
      SetLength(ListTimesVaz, Length(ListTimesVaz) + 1);
      ListTimesVaz[Length(ListTimesVaz) - 1] := Ind;
    end;
end;

end.
