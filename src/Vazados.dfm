object FormVazados: TFormVazados
  Left = 0
  Top = 0
  Caption = 'Times mais vazados'
  ClientHeight = 175
  ClientWidth = 574
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  DesignSize = (
    574
    175)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 214
    Height = 13
    Caption = 'Lista dos times mais vazados do campeonato'
  end
  object LvVazados: TListView
    Left = 8
    Top = 27
    Width = 558
    Height = 140
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        AutoSize = True
        Caption = 'Nome'
      end
      item
        Alignment = taRightJustify
        AutoSize = True
        Caption = 'Pontos'
      end
      item
        Alignment = taRightJustify
        AutoSize = True
        Caption = 'Vit'
      end
      item
        Alignment = taRightJustify
        AutoSize = True
        Caption = 'Em'
      end
      item
        Alignment = taRightJustify
        AutoSize = True
        Caption = 'Der'
      end
      item
        Alignment = taRightJustify
        AutoSize = True
        Caption = 'Part'
      end
      item
        Alignment = taRightJustify
        AutoSize = True
        Caption = 'GPos'
      end
      item
        Alignment = taRightJustify
        AutoSize = True
        Caption = 'GNeg'
      end
      item
        Alignment = taRightJustify
        AutoSize = True
        Caption = 'Saldo'
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
end
