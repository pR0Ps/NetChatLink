object UserForm: TUserForm
  Left = 335
  Top = 381
  Width = 550
  Height = 425
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'User Control'
  Color = clBtnFace
  Constraints.MinHeight = 425
  Constraints.MinWidth = 550
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    534
    387)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 532
    Height = 386
    ActivePage = tsStatic
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tsStatic: TTabSheet
      Caption = '&Static'
      DesignSize = (
        524
        358)
      object lblUsername: TLabel
        Left = 360
        Top = 8
        Width = 48
        Height = 13
        Anchors = [akTop, akRight]
        Caption = '&Username'
      end
      object lvStaticUsers: TListView
        Left = 0
        Top = 4
        Width = 357
        Height = 350
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            AutoSize = True
            Caption = 'Username'
            MinWidth = 100
          end
          item
            Alignment = taCenter
            Caption = 'Blocked PM'
            MinWidth = 70
            Width = 70
          end
          item
            Alignment = taCenter
            Caption = 'Blocked Mainchat'
            MinWidth = 100
            Width = 100
          end
          item
            Alignment = taCenter
            Caption = 'Controller'
            MinWidth = 60
            Width = 60
          end>
        ColumnClick = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        SortType = stText
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = lvStaticUsersSelectItem
      end
      object ebUsername: TEdit
        Left = 360
        Top = 24
        Width = 161
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 1
      end
      object gbIgnorePM: TGroupBox
        Left = 360
        Top = 48
        Width = 161
        Height = 73
        Anchors = [akTop, akRight]
        Caption = 'Ignore &PM'
        TabOrder = 2
        object rbPMYes: TRadioButton
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Yes'
          TabOrder = 0
        end
        object rbPMNo: TRadioButton
          Left = 8
          Top = 32
          Width = 97
          Height = 17
          Caption = 'No'
          TabOrder = 1
        end
        object rbPMUnset: TRadioButton
          Left = 8
          Top = 48
          Width = 97
          Height = 17
          Caption = 'Unset'
          Checked = True
          TabOrder = 2
          TabStop = True
        end
      end
      object gbControl: TGroupBox
        Left = 360
        Top = 192
        Width = 161
        Height = 73
        Anchors = [akTop, akRight]
        Caption = '&Controller Mode'
        TabOrder = 4
        object rbControlYes: TRadioButton
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Yes'
          TabOrder = 0
        end
        object rbControlNo: TRadioButton
          Left = 8
          Top = 32
          Width = 97
          Height = 17
          Caption = 'No'
          TabOrder = 1
        end
        object rbControlUnset: TRadioButton
          Left = 8
          Top = 48
          Width = 97
          Height = 17
          Caption = 'Unset'
          Checked = True
          TabOrder = 2
          TabStop = True
        end
      end
      object btnAddUpdate: TButton
        Left = 360
        Top = 272
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Add/Update'
        TabOrder = 5
        OnClick = btnAddUpdateClick
      end
      object btnDelete: TButton
        Left = 448
        Top = 272
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'De&lete'
        Enabled = False
        TabOrder = 6
        OnClick = btnDeleteClick
      end
      object btnStaticDone: TButton
        Left = 360
        Top = 328
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Done'
        TabOrder = 7
        OnClick = btnDoneClick
      end
      object btnStaticRefresh: TButton
        Left = 448
        Top = 328
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Refresh'
        TabOrder = 8
        OnClick = btnStaticRefreshClick
      end
      object gbIgnoreMC: TGroupBox
        Left = 360
        Top = 120
        Width = 161
        Height = 73
        Anchors = [akTop, akRight]
        Caption = 'Ignore &Mainchat'
        TabOrder = 3
        object rbMCYes: TRadioButton
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Yes'
          TabOrder = 0
        end
        object rbMCNo: TRadioButton
          Left = 8
          Top = 32
          Width = 97
          Height = 17
          Caption = 'No'
          TabOrder = 1
        end
        object rbMCUnset: TRadioButton
          Left = 8
          Top = 48
          Width = 97
          Height = 17
          Caption = 'Unset'
          Checked = True
          TabOrder = 2
          TabStop = True
        end
      end
    end
    object tsDynamic: TTabSheet
      Caption = '&Dynamic'
      ImageIndex = 1
      DesignSize = (
        524
        358)
      object lvDynUsers: TListView
        Left = 0
        Top = 4
        Width = 357
        Height = 350
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            AutoSize = True
            Caption = 'Username'
          end
          item
            Alignment = taCenter
            Caption = 'Blocked'
          end
          item
            Alignment = taCenter
            Caption = 'OP'
          end>
        ColumnClick = False
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        SortType = stText
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = lvDynUsersSelectItem
      end
      object btnOverride: TButton
        Left = 360
        Top = 8
        Width = 161
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Override (add to static)'
        Enabled = False
        TabOrder = 1
        OnClick = btnOverrideClick
      end
      object cbOpsControl: TCheckBox
        Left = 368
        Top = 48
        Width = 153
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'OPs have &control'
        TabOrder = 2
        OnClick = cbOpsControlClick
      end
      object btnDynDone: TButton
        Left = 360
        Top = 328
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Done'
        TabOrder = 3
        OnClick = btnDoneClick
      end
      object btnDynRefresh: TButton
        Left = 448
        Top = 328
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Refresh'
        TabOrder = 4
        OnClick = btnDynRefreshClick
      end
    end
  end
end
