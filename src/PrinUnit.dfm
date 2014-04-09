object PrinForm: TPrinForm
  Left = 0
  Top = 0
  Caption = 'Campeonato'
  ClientHeight = 202
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    600
    202)
  PixelsPerInch = 96
  TextHeight = 13
  object BtnOpen: TButton
    Left = 8
    Top = 169
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Abrir'
    TabOrder = 0
    OnClick = BtnOpenClick
  end
  object LvPlacar: TListView
    Left = 8
    Top = 8
    Width = 584
    Height = 155
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        AutoSize = True
        Caption = '#'
      end
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
    TabOrder = 1
    ViewStyle = vsReport
  end
  object EdBusca: TEdit
    Left = 89
    Top = 171
    Width = 341
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
  end
  object BtnMostraVazado: TButton
    Left = 517
    Top = 169
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Pior Defeza'
    TabOrder = 3
    OnClick = BtnMostraVazadoClick
  end
  object BtnBuscar: TButton
    Left = 436
    Top = 169
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Buscar'
    TabOrder = 4
    OnClick = BtnBuscarClick
  end
  object OpenDialog: TOpenDialog
    Left = 328
    Top = 176
  end
end
