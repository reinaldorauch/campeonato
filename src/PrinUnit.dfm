object PrinForm: TPrinForm
  Left = 0
  Top = 0
  Caption = 'Campeonato'
  ClientHeight = 202
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BtnOpen: TButton
    Left = 8
    Top = 169
    Width = 75
    Height = 25
    Caption = 'Abrir'
    TabOrder = 0
    OnClick = BtnOpenClick
  end
  object LvPlacar: TListView
    Left = 8
    Top = 8
    Width = 537
    Height = 155
    Columns = <
      item
        Caption = '#'
        Width = 35
      end
      item
        Caption = 'Nome'
        Width = 200
      end
      item
        Alignment = taRightJustify
        Caption = 'Pontos'
      end
      item
        Alignment = taRightJustify
        Caption = 'Vit'
        Width = 30
      end
      item
        Alignment = taRightJustify
        Caption = 'Em'
        Width = 30
      end
      item
        Alignment = taRightJustify
        Caption = 'Der'
        Width = 30
      end
      item
        Alignment = taRightJustify
        Caption = 'Part'
        Width = 35
      end
      item
        Caption = 'GPos'
        Width = 40
      end
      item
        Alignment = taRightJustify
        Caption = 'GNeg'
        Width = 40
      end
      item
        AutoSize = True
        Caption = 'Saldo'
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object OpenDialog: TOpenDialog
    Left = 328
    Top = 176
  end
end
