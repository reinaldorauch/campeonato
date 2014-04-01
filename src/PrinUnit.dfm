object PrinForm: TPrinForm
  Left = 0
  Top = 0
  Caption = 'Campeonato'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MmFile: TMemo
    Left = 8
    Top = 8
    Width = 431
    Height = 155
    TabOrder = 0
  end
  object BtnOpen: TButton
    Left = 8
    Top = 169
    Width = 75
    Height = 25
    Caption = 'Abrir'
    TabOrder = 1
    OnClick = BtnOpenClick
  end
  object OpenDialog: TOpenDialog
    Left = 328
    Top = 176
  end
end
