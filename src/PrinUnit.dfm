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
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
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
    Action = AcAction
    Anchors = [akLeft, akBottom]
    TabOrder = 0
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
    OnSelectItem = LvPlacarSelectItem
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
    Action = AcPiorDefeza
    Anchors = [akRight, akBottom]
    TabOrder = 3
  end
  object BtnBuscar: TButton
    Left = 436
    Top = 169
    Width = 75
    Height = 25
    Action = AcBuscarTime
    Anchors = [akRight, akBottom]
    TabOrder = 4
  end
  object OpenDialog: TOpenDialog
    Left = 328
    Top = 176
  end
  object ActionList: TActionList
    Left = 536
    Top = 48
    object AcAction: TAction
      Caption = 'Abrir'
      Hint = 'Abrir Arquivo'
      OnExecute = AcActionExecute
    end
    object AcBuscarTime: TAction
      Caption = 'Buscar'
      Hint = 'Buscar Times'
      OnExecute = AcBuscarTimeExecute
    end
    object AcPiorDefeza: TAction
      Caption = 'Pior Defeza'
      Hint = 'Procurar Pior Defeza'
      OnExecute = AcPiorDefezaExecute
    end
  end
end
