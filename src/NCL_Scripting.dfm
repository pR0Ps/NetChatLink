object Scripting: TScripting
  Left = 569
  Top = 252
  Width = 390
  Height = 191
  Caption = 'IRC Scripting'
  Color = clBtnFace
  Constraints.MinHeight = 165
  Constraints.MinWidth = 296
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    374
    153)
  PixelsPerInch = 96
  TextHeight = 13
  object mmScript: TMemo
    Left = 8
    Top = 8
    Width = 358
    Height = 96
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object btnDone: TButton
    Left = 8
    Top = 116
    Width = 75
    Height = 25
    Hint = 'Save your script and exit'
    Anchors = [akLeft, akBottom]
    Caption = '&Done'
    TabOrder = 1
    OnClick = btnDoneClick
  end
  object btnCancel: TButton
    Left = 168
    Top = 116
    Width = 75
    Height = 25
    Hint = 'Discard changes and exit'
    Anchors = [akLeft, akBottom]
    Caption = '&Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object btnReload: TButton
    Left = 88
    Top = 116
    Width = 75
    Height = 25
    Hint = 'Reload from last edit'
    Anchors = [akLeft, akBottom]
    Caption = '&Reload'
    TabOrder = 3
    OnClick = btnReloadClick
  end
  object btnHelp: TButton
    Left = 341
    Top = 116
    Width = 25
    Height = 25
    Hint = 'Get help on using connection properties'
    Anchors = [akRight, akBottom]
    Caption = '&?'
    TabOrder = 4
    OnClick = btnHelpClick
  end
end
