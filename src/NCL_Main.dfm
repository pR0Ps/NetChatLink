object MainForm: TMainForm
  Left = 519
  Top = 178
  Width = 560
  Height = 431
  Caption = 'NetChatLink'
  Color = clBtnFace
  Constraints.MinHeight = 390
  Constraints.MinWidth = 560
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    544
    393)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 544
    Height = 358
    ActivePage = tsAbout
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tsHubs: TTabSheet
      Caption = '&1 Hubs'
      DesignSize = (
        536
        330)
      object lblHubHostPort: TLabel
        Left = 8
        Top = 157
        Width = 52
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = '&Host:port*'
        FocusControl = edHubHostPort
      end
      object lblHubNick: TLabel
        Left = 8
        Top = 197
        Width = 25
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Nic&k*'
        FocusControl = edHubNick
      end
      object lblHubPass: TLabel
        Left = 8
        Top = 237
        Width = 46
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = '&Password'
        FocusControl = edHubPass
      end
      object lblHubShare: TLabel
        Left = 184
        Top = 157
        Width = 28
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'S&hare'
        FocusControl = edHubShare
      end
      object lblHubSlots: TLabel
        Left = 184
        Top = 197
        Width = 23
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Sl&ots'
        FocusControl = edHubSlots
      end
      object lblHubClient: TLabel
        Left = 184
        Top = 237
        Width = 27
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = '&Client'
        FocusControl = edHubClient
      end
      object lblHubPrefix: TLabel
        Left = 184
        Top = 117
        Width = 34
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Prefi&x*'
        FocusControl = edHubPrefix
      end
      object lblHubName: TLabel
        Left = 8
        Top = 117
        Width = 33
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = '&Name*'
      end
      object gbHubBroadcast: TGroupBox
        Left = 360
        Top = 118
        Width = 169
        Height = 120
        Anchors = [akLeft, akBottom]
        Caption = '&Broadcast Options'
        TabOrder = 9
        object lblHubPostRate: TLabel
          Left = 10
          Top = 67
          Width = 78
          Height = 13
          Hint = 'The delay (in ms) between posts in mainchat'
          Alignment = taRightJustify
          Caption = 'Post rate (1/ms)'
        end
        object lblHubPMRate: TLabel
          Left = 16
          Top = 96
          Width = 71
          Height = 13
          Hint = 'The delay (in ms) between posts in private messages'
          Caption = 'PM rate (1/ms)'
        end
        object spnHubMsgRate: TSpinEdit
          Left = 90
          Top = 64
          Width = 55
          Height = 22
          Hint = 'The delay (in ms) between posts in mainchat'
          Increment = 10
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
        object cbHubBcFrom: TCheckBox
          Left = 8
          Top = 15
          Width = 129
          Height = 17
          Hint = 'Broadcast chat from this connection to others'
          Caption = 'Broadcast &FROM here'
          TabOrder = 1
        end
        object cbHubBcTo: TCheckBox
          Left = 8
          Top = 31
          Width = 129
          Height = 17
          Hint = 'Broadcast chat from other connections to here'
          Caption = 'Broadcast &TO here'
          TabOrder = 2
        end
        object spnHubPMRate: TSpinEdit
          Left = 90
          Top = 88
          Width = 55
          Height = 22
          Hint = 'The delay (in ms) between posts in private messages'
          Increment = 10
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
        end
        object cbHubJP: TCheckBox
          Left = 8
          Top = 47
          Width = 129
          Height = 17
          Hint = 'Broadcast user join/part messages from this connection'
          Caption = 'Broadcast &Join/parts'
          TabOrder = 4
        end
      end
      object gbHubMode: TGroupBox
        Left = 360
        Top = 237
        Width = 169
        Height = 57
        Hint = 'DC protocol to use'
        Anchors = [akLeft, akBottom]
        Caption = 'Hub &Mode*'
        TabOrder = 10
        DesignSize = (
          169
          57)
        object rbHubNMDC: TRadioButton
          Left = 8
          Top = 16
          Width = 113
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = 'NMDC'
          TabOrder = 0
        end
        object rbHubADC: TRadioButton
          Left = 8
          Top = 32
          Width = 113
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = 'ADC'
          TabOrder = 1
        end
      end
      object edHubHostPort: TEdit
        Left = 8
        Top = 173
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 2
      end
      object edHubNick: TEdit
        Left = 8
        Top = 213
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 3
      end
      object edHubPass: TEdit
        Left = 8
        Top = 253
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 4
      end
      object edHubShare: TEdit
        Left = 184
        Top = 173
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 6
      end
      object edHubSlots: TEdit
        Left = 184
        Top = 213
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 7
      end
      object edHubClient: TEdit
        Left = 184
        Top = 253
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 8
      end
      object btnHubAddUpdate: TButton
        Left = 8
        Top = 301
        Width = 75
        Height = 25
        Hint = 'Save the current information'
        Anchors = [akLeft, akBottom]
        Caption = 'Add/&Update'
        TabOrder = 12
        OnClick = btnHubAddUpdateClick
      end
      object lvHubs: TListView
        Left = 0
        Top = 0
        Width = 536
        Height = 110
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            AutoSize = True
            Caption = 'Name'
          end
          item
            AutoSize = True
            Caption = 'Host:port'
          end
          item
            Caption = 'Mode'
          end
          item
            AutoSize = True
            Caption = 'Prefix'
          end
          item
            AutoSize = True
            Caption = 'Nick'
          end
          item
            Caption = 'Share'
            Width = 70
          end
          item
            Caption = 'Slots'
            Width = 40
          end
          item
            AutoSize = True
            Caption = 'Client'
          end>
        ColumnClick = False
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        PopupMenu = pmConnDisconn
        SmallImages = ilOnOffIcons
        SortType = stText
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = lvHubsSelectItem
      end
      object cbHubEnabled: TCheckBox
        Left = 176
        Top = 306
        Width = 73
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = '&Enabled'
        TabOrder = 11
      end
      object edHubPrefix: TEdit
        Left = 184
        Top = 133
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 5
      end
      object btnHubDelete: TButton
        Left = 88
        Top = 301
        Width = 75
        Height = 25
        Hint = 'Remove the selected connection'
        Anchors = [akLeft, akBottom]
        Caption = '&Delete'
        Enabled = False
        TabOrder = 13
        OnClick = btnHubDeleteClick
      end
      object edHubName: TEdit
        Left = 8
        Top = 133
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
      object btnHubUserControl: TButton
        Left = 360
        Top = 301
        Width = 169
        Height = 25
        Hint = 'Open the user control panel to manage users'
        Anchors = [akLeft, akBottom]
        Caption = 'User C&ontrol Panel'
        Enabled = False
        TabOrder = 14
        OnClick = btnUserControlClick
      end
    end
    object tsIrcs: TTabSheet
      Caption = '&2 Ircs'
      ImageIndex = 1
      DesignSize = (
        536
        330)
      object lblIrcHost: TLabel
        Left = 8
        Top = 157
        Width = 52
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = '&Host:port*'
        FocusControl = edIrcHostPort
      end
      object lblIrcNick: TLabel
        Left = 8
        Top = 197
        Width = 25
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Nic&k*'
        FocusControl = edIrcNick
      end
      object lblIrcPass: TLabel
        Left = 8
        Top = 237
        Width = 46
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = '&Password'
        FocusControl = edIrcPass
      end
      object lblIrcIdent: TLabel
        Left = 184
        Top = 157
        Width = 26
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = '&Ident'
        FocusControl = edIrcIdent
      end
      object lblIrcChannels: TLabel
        Left = 184
        Top = 197
        Width = 44
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = '&Channels'
        FocusControl = edIrcChannels
      end
      object lblIrcPrefix: TLabel
        Left = 184
        Top = 117
        Width = 34
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Prefi&x*'
        FocusControl = edIrcPrefix
      end
      object lblIrcName: TLabel
        Left = 8
        Top = 117
        Width = 33
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = '&Name*'
      end
      object gbIrcBroadcast: TGroupBox
        Left = 360
        Top = 118
        Width = 169
        Height = 120
        Anchors = [akLeft, akBottom]
        Caption = '&Broadcast Options'
        TabOrder = 8
        object lblIrcPostRate: TLabel
          Left = 10
          Top = 67
          Width = 78
          Height = 13
          Hint = 'The delay (in ms) between posts in mainchat'
          Alignment = taRightJustify
          Caption = 'Post rate (1/ms)'
        end
        object lblIrcPMRate: TLabel
          Left = 16
          Top = 96
          Width = 71
          Height = 13
          Hint = 'The delay (in ms) between posts in private messages'
          Caption = 'PM rate (1/ms)'
        end
        object cbIrcBcFrom: TCheckBox
          Left = 8
          Top = 15
          Width = 129
          Height = 17
          Hint = 'Broadcast chat from this connection to others'
          Caption = 'Broadcast &FROM here'
          TabOrder = 0
        end
        object cbIrcBcTo: TCheckBox
          Left = 8
          Top = 31
          Width = 129
          Height = 17
          Hint = 'Broadcast chat from other connections to here'
          Caption = 'Broadcast &TO here'
          TabOrder = 1
        end
        object spnIrcMsgRate: TSpinEdit
          Left = 90
          Top = 64
          Width = 55
          Height = 22
          Hint = 'The delay (in ms) between posts in mainchat'
          Increment = 10
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 0
        end
        object spnIrcPMRate: TSpinEdit
          Left = 90
          Top = 88
          Width = 55
          Height = 22
          Hint = 'The delay (in ms) between posts in private messages'
          Increment = 10
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
        end
        object cbIrcJP: TCheckBox
          Left = 8
          Top = 47
          Width = 129
          Height = 17
          Hint = 'Broadcast user join/part messages from this connection'
          Caption = 'Broadcast &Join/parts'
          TabOrder = 4
        end
      end
      object lvIrcs: TListView
        Left = 0
        Top = 0
        Width = 536
        Height = 110
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            AutoSize = True
            Caption = 'Name'
          end
          item
            AutoSize = True
            Caption = 'Host:port'
          end
          item
            AutoSize = True
            Caption = 'Prefix'
          end
          item
            AutoSize = True
            Caption = 'Nick'
          end
          item
            AutoSize = True
            Caption = 'Channels'
          end>
        ColumnClick = False
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        PopupMenu = pmConnDisconn
        SmallImages = ilOnOffIcons
        SortType = stText
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = lvIrcsSelectItem
      end
      object edIrcHostPort: TEdit
        Left = 8
        Top = 173
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 2
      end
      object edIrcNick: TEdit
        Left = 8
        Top = 213
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 3
      end
      object edIrcPass: TEdit
        Left = 8
        Top = 253
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 4
      end
      object edIrcIdent: TEdit
        Left = 184
        Top = 173
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 6
      end
      object edIrcChannels: TEdit
        Left = 184
        Top = 213
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 7
      end
      object btnIrcAddUpdate: TButton
        Left = 8
        Top = 301
        Width = 75
        Height = 25
        Hint = 'Save the current information'
        Anchors = [akLeft, akBottom]
        Caption = 'Add/&Update'
        TabOrder = 10
        OnClick = btnIrcAddUpdateClick
      end
      object cbIrcEnabled: TCheckBox
        Left = 176
        Top = 306
        Width = 65
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = '&Enabled'
        TabOrder = 9
      end
      object edIrcPrefix: TEdit
        Left = 184
        Top = 133
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 5
      end
      object btnIrcDelete: TButton
        Left = 88
        Top = 301
        Width = 75
        Height = 25
        Hint = 'Remove the selected connection'
        Anchors = [akLeft, akBottom]
        Caption = '&Delete'
        Enabled = False
        TabOrder = 11
        OnClick = btnIrcDeleteClick
      end
      object edIrcName: TEdit
        Left = 8
        Top = 133
        Width = 169
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
      object btnIrcUserControl: TButton
        Left = 360
        Top = 301
        Width = 169
        Height = 25
        Hint = 'Open the user control panel to manage users'
        Anchors = [akLeft, akBottom]
        Caption = 'User C&ontrol Panel'
        Enabled = False
        TabOrder = 12
        OnClick = btnUserControlClick
      end
      object btnIrcScripting: TButton
        Left = 360
        Top = 268
        Width = 169
        Height = 25
        Hint = 
          'Opens the scripting form and allows commands to be sent on conne' +
          'ct'
        Anchors = [akLeft, akBottom]
        Caption = 'Connection Script'
        Enabled = False
        TabOrder = 13
        OnClick = btnIrcScriptingClick
      end
    end
    object tsWords: TTabSheet
      Caption = '&3 Filtered Words'
      ImageIndex = 2
      DesignSize = (
        536
        330)
      object mmFilterWords: TMemo
        Left = 0
        Top = 0
        Width = 537
        Height = 296
        Anchors = [akLeft, akTop, akBottom]
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object btnFilterWordsSAve: TButton
        Left = 8
        Top = 301
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Sa&ve'
        TabOrder = 1
        OnClick = btnFilterWordsSaveClick
      end
      object btnFilterWordsReload: TButton
        Left = 88
        Top = 301
        Width = 75
        Height = 25
        Hint = 'Revert to last save'
        Anchors = [akLeft, akBottom]
        Caption = 'Re&load'
        TabOrder = 2
        OnClick = btnFilterWordsReloadClick
      end
    end
    object tsDebug: TTabSheet
      Caption = '&4 Debug Output'
      ImageIndex = 3
      DesignSize = (
        536
        330)
      object mmDebug: TMemo
        Left = 0
        Top = 0
        Width = 536
        Height = 295
        Anchors = [akLeft, akTop, akRight, akBottom]
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
      object btnDebugSave: TButton
        Left = 8
        Top = 301
        Width = 75
        Height = 25
        Hint = 'Save debug log to file'
        Anchors = [akLeft, akBottom]
        Caption = '&Force Save'
        TabOrder = 1
        OnClick = btnDebugSaveClick
      end
    end
    object tsAbout: TTabSheet
      Caption = '&5 About'
      ImageIndex = 4
      DesignSize = (
        536
        330)
      object pnlAbout: TPanel
        Left = 68
        Top = 61
        Width = 401
        Height = 185
        Anchors = []
        TabOrder = 0
        object Bevel1: TBevel
          Left = 8
          Top = 32
          Width = 121
          Height = 121
        end
        object Bevel2: TBevel
          Left = 144
          Top = 16
          Width = 233
          Height = 153
        end
        object lblAbout1: TLabel
          Left = 152
          Top = 24
          Width = 217
          Height = 13
          Alignment = taCenter
          Caption = 'VERSION STRING HERE'
          Constraints.MinHeight = 13
          Constraints.MinWidth = 217
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblLink1: TLabel
          Left = 152
          Top = 136
          Width = 217
          Height = 13
          Cursor = crHandPoint
          Alignment = taCenter
          AutoSize = False
          Caption = 'http://myircdclinks.sourceforge.net/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = lblLinkClick
        end
        object lblAbout2: TLabel
          Left = 152
          Top = 112
          Width = 217
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Based heavily on MyIrcDcLinks by Burek'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object lblLink2: TLabel
          Left = 152
          Top = 72
          Width = 217
          Height = 13
          Cursor = crHandPoint
          Alignment = taCenter
          AutoSize = False
          Caption = 'http://netchatlink.sourceforge.net/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = lblLinkClick
        end
        object lblLicense: TLabel
          Left = 152
          Top = 48
          Width = 217
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Released under the GNU GPL 3 License'
        end
        object Image1: TImage
          Left = 24
          Top = 48
          Width = 97
          Height = 97
          Picture.Data = {
            055449636F6E0000010001006060000001002000A89400001600000028000000
            60000000C0000000010020000000000000200100000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000001000000010000000100000001000000010000000100000002
            00000002000000020000000400000007000000090000000A0000000B0000000B
            0000000C0000000C0000000D0000000D0000000D0000000D0000000D0000000D
            0000000D0000000D0000000D0000000D0000000D0000000D0000000D0000000D
            0000000C0000000C0000000B0000000B0000000A000000090000000700000004
            0000000200000002000000010000000100000001000000010000000100000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000100000002000000030000000300000004000000040000000500000005
            0000000500000006000000080000000A0000000C0000000D0000000E0000000E
            0000000F0000000F000000100000001000000011000000110000001100000011
            0000001100000011000000110000001100000011000000110000001000000010
            0000000F0000000F0000000E0000000D0000000D0000000C0000000A00000008
            0000000600000005000000050000000400000004000000030000000200000001
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000010000000100000001
            0000000300000005000000060000000700000008000000090000000A0000000B
            0000000C0000000D0000000E0000001000000012000000130000001300000014
            0000001500000015000000160000001600000016000000170000001700000017
            0000001700000017000000170000001700000017000000160000001600000015
            000000150000001400000014000000130000001200000011000000100000000E
            0000000D0000000C0000000B0000000A00000009000000080000000600000003
            0000000200000001000000010000000100000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000001000000020000000300000005
            00000006000000090000000B0000000D0000000E0000000F0000001100000012
            00000013000000150000001600000018000000190000001A0000001B0000001C
            0000001C0000001D0000001E0000001E0000001E0000001F0000001F0000001F
            0000001F0000001F0000001F0000001F0000001F0000001E0000001E0000001D
            0000001D0000001C0000001B0000001A00000019000000180000001700000015
            000000140000001300000012000000100000000F0000000D0000000B00000008
            0000000600000004000000040000000300000002000000010000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000100000001000000010000000300000006000000080000000A
            0000000C0000000E00000011000000120000001400000016000000180000001A
            0000001B0000001D0000001E0000002000000021000000220000002400000024
            0000002500000026000000270000002700000028000000280000002900000029
            0000002900000029000000290000002900000028000000280000002700000026
            0000002500000025000000240000002300000021000000200000001F0000001D
            0000001C0000001A00000019000000170000001500000013000000110000000E
            0000000C0000000A000000090000000700000005000000030000000100000001
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000001000000020000000400000005000000070000000B0000000E00000010
            000000120000001500000017000000190000001C0000001E0000002000000022
            000000240000002600000027000000290000002B0000002C0000002E0000002F
            0000003000000031000000310000003200000033000000330000003300000033
            0000003300000033000000330000003300000033000000330000003200000031
            000000300000002F0000002E0000002D0000002B0000002A0000002800000026
            0000002500000023000000210000001F0000001D0000001A0000001800000016
            00000013000000110000000F0000000C0000000A000000060000000400000003
            0000000200000001000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000001
            0000000300000006000000080000000A0000000D000000100000001400000017
            000000190000001C0000001F0000002200000024000000270000002A0000002C
            0000002E0000003000000032000000340000003600000038000000390000003A
            0000003B0000003C0000003D0000003E0000003F0000003F0000003F0000003F
            0000003F0000003F0000003F0000003F0000003F0000003E0000003E0000003D
            0000003C0000003A000000390000003800000036000000350000003300000031
            0000002F0000002D0000002A000000280000002500000023000000200000001D
            0000001A0000001800000015000000120000000F0000000C0000000900000007
            0000000500000003000000010000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000100000003
            000000060000000A0000000D0000001000000013000000170000001A0000001D
            0000002100000024000000270000002B0000002E000000310000003400000037
            000000390000003C0000003E0000004000000042000000440000004600000047
            00000048000000490000004A0000004B0000004C0000004C0000004D0000004D
            0000004D0000004D0000004D0000004D0000004C0000004C0000004B0000004A
            0000004800000047000000460000004400000043000000410000003F0000003D
            0000003A0000003800000035000000320000002F0000002C0000002900000025
            000000220000001F0000001B0000001800000014000000110000000E0000000B
            0000000800000005000000030000000100000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000010000000300000006
            0000000A0000000E0000001200000015000000190000001D0000002100000025
            000000290000002D0000003100000035000000390000003D0000004000000043
            00000046000000480000004B0000004D00000050000000520000005300000055
            000000560000005700000058000000590000005A0000005B0000005B0000005C
            0000005C0000005C0000005C0000005B0000005B0000005A0000005900000058
            00000057000000550000005400000052000000500000004E0000004C00000049
            0000004700000044000000410000003D0000003A00000036000000320000002F
            0000002B00000027000000220000001E0000001A00000017000000130000000F
            0000000C00000009000000060000000300000001000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000100000003000000060000000A
            0000000E00000012000000160000001B0000001F00000024000000290000002D
            00000032000000370000003B0000004000000045000000490000004D00000050
            0000005300000056000000590000005C0000005E000000600000006200000064
            000000650000006700000068000000690000006A0000006A0000006B0000006B
            0000006B0000006B0000006B0000006B0000006A000000690000006800000067
            000000660000006400000063000000610000005F0000005D0000005A00000057
            00000054000000510000004E0000004A00000046000000420000003D00000039
            000000340000002F0000002A00000025000000210000001C0000001800000013
            000000100000000C000000090000000500000003000000010000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000100000003000000060000000A0000000E
            00000012000000170000001B00000020000000260000002B0000003100000037
            0000003C00000042000000470000004C00000051000000560000005A0000005F
            0000006200000066000000690000006B0000006E000000700000007200000074
            000000750000007700000078000000790000007A0000007B0000007B0000007B
            0000007C0000007C0000007B0000007B0000007A000000790000007800000077
            000000760000007400000073000000710000006F0000006C0000006A00000067
            00000063000000600000005C00000058000000530000004E0000004900000044
            0000003E00000038000000330000002D00000028000000220000001D00000018
            00000013000000100000000C0000000800000005000000020000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000010000000200000005000000090000000D00000011
            000000160000001B00000021000000270000002D000000330000003A00000040
            000000470000004D00000053000000590000005F00000064000000690000006E
            0000007200000075000000780000007B0000007E000000800000008200000084
            0000008600000087000000890000008A0000008A0000008B0000008B0000008C
            0000008C0000008C0000008C0000008B0000008B0000008A0000008900000088
            000000860000008500000083000000810000007F0000007C0000007A00000077
            000000730000006F0000006B00000066000000610000005B000000560000004F
            00000049000000420000003C000000350000002F00000028000000220000001C
            00000017000000130000000F0000000B00000007000000030000000100000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000200000004000000080000000C0000001000000015
            0000001A00000020000000260000002D000000340000003C000000430000004B
            000000520000005900000060000000660000006D00000072000000780000007D
            0000008100000085000000880000008B0000008E000000900000009200000094
            0000009600000098000000990000009A0000009B0000009B0000009C0101019C
            0101019C0000009C0000009C0000009C0000009B0000009A0000009900000098
            000000970000009500000093000000910000008F0000008C0000008A00000086
            000000830000007E0000007A000000750000006F00000069000000620000005B
            000000540000004D000000450000003E000000360000002F0000002800000021
            0000001B00000016000000120000000D00000008000000040000000100000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000100000003000000060000000A0000000E0000001300000018
            0000001D000000240000002B000000330000003B000000440000004C00000054
            0000005C000000640000006C000000730000007A00000080000000860000008B
            0000009000000094000000970000009A0000009D0000009F010000A1010100A3
            010100A5010100A7010101A8010101A9010101AA010101AA010101AB010101AB
            010101AB010101AB010101AB010101AB010101AA010101A9010100A8010100A7
            010100A6010100A4000000A2000000A00000009E0000009B0000009900000095
            000000910000008D00000088000000830000007C000000760000006F00000067
            0000005F000000570000004E000000460000003E000000350000002D00000026
            0000001F00000019000000140000000F0000000A000000060000000200000001
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000100000003000000070000000C00000010000000150000001B
            00000021000000280000003000000039000000420000004B000000540000005D
            000000660000006F000000770000007F000000860000008D0000009300000098
            0000009D000000A1000000A5010000A8010101AB040201AE050401B0080501B2
            0B0801B40C0801B60F0902B7100C02B9130C02B9140D04BA140D04BB140E04BB
            140E04BB140D04BB140D04BB130C02BA110C02BA100B02B90F0901B70C0801B6
            0B0701B4080501B3050401B1020101AE010100AC010000A9000000A6000000A3
            0000009F0000009A000000950000008F00000088000000810000007A00000072
            0000006900000060000000570000004E000000450000003B000000330000002A
            000000230000001C00000017000000110000000D000000080000000400000002
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000100000003000000080000000D00000012000000170000001D
            000000240000002C000000350000003E00000048000000520000005B00000065
            0000006F00000078000000810000008900000091000000980000009E000000A4
            000000A9010100AD010100B1020101B4080501B8100A02BC191104BF231605C2
            2B1D06C6342206C83C2807CB422D08CC473009CE4B3209CF4E340BD04F350BD0
            50350AD14F350AD14D3309D04B3209CF462F08CE412B08CC3B2607CB322206C8
            2A1D06C6211605C3181004BF0D0901BC060501B8020101B5010101B2010100AE
            000000AA000000A5000000A00000009A000000930000008B000000840000007B
            00000072000000690000005F000000550000004B00000041000000380000002F
            000000260000001F00000019000000130000000E0000000A0000000600000002
            0000000100000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000100000004000000080000000E00000013000000190000001F
            000000270000002F00000038000000420000004D00000057000000620000006C
            000000760000007F000000890000009100000099000000A0010100A7020100AD
            050401B3080501B80D0901BC130D02C11F1303C52E1E06CB3E2808D04F3309D4
            5F3F0BD96C470DDD78500EE0845710E38C5D11E5936212E6976512E7986713E8
            996813E8986713E8966412E7926112E68A5C11E481560FE2774E0EE06B470CDD
            5C3D0BD94C3209D43C2707CF2A1B06CA1D1305C5130D02C10D0902BD090501B9
            050401B4010101AF010100A9000000A30000009C000000940000008C00000083
            000000790000006F000000650000005B00000050000000460000003C00000032
            00000029000000220000001B00000015000000100000000B0000000700000003
            0000000100000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000100000004000000090000000F000000140000001A00000021
            00000029000000320000003B00000046000000500000005B0000006600000071
            0000007B000000850000008F00000098010100A0010101A7040201AE0C0701B6
            160E02BD251805C5362307CB452D08D156370AD766420CDD764D0EE2865810E6
            946212EAA16A15EDAC7216F0B57918F3BE8018F5C28319F6C7861AF7C9871AF8
            C9881AF8C8871AF8C7861AF7C28219F6BD7D18F5B47718F3AB7016F0A06A14ED
            936012EA855610E6744B0EE164400CDC55360AD7452B08D1342007CC241705C5
            150D02BF0B0601B8040201B1010100AA010100A20000009A0000009200000089
            0000007F000000740000006A0000005F00000054000000490000003F00000035
            0000002C000000240000001C00000016000000100000000C0000000700000003
            0000000100000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000100000004000000090000000F000000150000001B00000023
            0000002B000000340000003D00000048000000530000005E0000006900000074
            0000007F00000089010100930301019C060401A50B0701AE160D04B7251705C0
            3B2407CA55360AD46F470DDD875610E59B6412EAA86D15EFB37417F2BB7C18F4
            C18019F6C8851AF8CE891CFAD38E1EFBD6901FFCD99420FDDB9521FDDC9621FD
            DD9721FDDC9621FDDB9520FDD99320FCD6901FFCD38D1EFBCE881CFAC8831AF8
            C07F19F6BA7A18F4B27317F2A86C15EE986212EA85530FE46C440CDD503209D4
            382307CB231605C2140C02B90B0701B0060401A80301019F010101960000008C
            00000082000000780000006D00000062000000570000004B0000004100000036
            0000002D000000250000001D00000017000000110000000C0000000700000003
            0000000100000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000001000000040000000A00000010000000150000001C00000023
            0000002B000000340000003E00000049000000540000005F0000006B00000076
            010000800101018B030301960B0601A1191004AC2C1B05B9432909C55B380CD1
            73480FDB8C5711E5A36815EDB97618F3C88119F8D3881BFAD78D1EFCDA901FFC
            DC9421FDDE9622FDE09723FEE29925FEE39A26FEE49B27FEE59C27FEE59D27FE
            E59D27FEE69E27FFE59C27FEE49B26FEE39A25FEE29824FEE09623FEDE9522FD
            DC9221FDDA8F1FFCD88D1EFBD2871BFAC88019F7B57417F3A06414EC87540FE5
            6E440CDB563409D13F2607C6291805BA170E02AE0A0601A3030301980101018E
            00000084000000790000006E00000063000000580000004C0000004100000037
            0000002E000000250000001E00000017000000120000000C0000000700000003
            0000000100000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000001000000040000000A00000010000000150000001C00000023
            0000002B000000340000003E00000048000000540000005F0000006A00000075
            030301810905018D120B039A241504A83E2508B85D390BC97C4D0FD9985E12E5
            AE6C15EDBC7618F3CA801AF7D5881CFADC9020FDE19322FEE59824FFE59926FE
            E69B28FEE79D29FEE99F2BFFEAA02CFFEAA12DFFEBA22EFFEAA22FFEEAA22FFE
            EBA32FFFEBA32FFFEBA32EFFEBA22EFFEAA02DFEE99F2CFEE99E2AFFE89C29FF
            E79B27FFE59826FEE49524FEE19222FEDB8D20FCD3861CFAC87D19F7BA7417F3
            A96915ED955A11E4794A0ED858350BC9392206B9221304AA1009039C08050190
            03010184000000790000006E00000063000000570000004C0000004100000037
            0000002D000000250000001E00000017000000120000000C0000000700000003
            0000000100000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000100000004000000090000000F000000150000001B00000022
            0000002A000000320000003C00000047000000520000005D0000006804020274
            0F0903821F130593382107A656340BB975470DCC925812DDAE6915EAC47919F4
            D2841BF9D9891EFCDE8F21FDE29223FEE59626FEE89A29FFE99D2BFFEB9F2EFF
            EBA030FEEBA231FEEDA433FFEEA634FFEEA736FFEFA737FFEEA738FEEEA738FE
            EFA939FFEFA838FFEFA838FFEFA737FFEDA536FEEDA434FEEDA333FFECA231FF
            EBA02FFFEA9E2DFFE89A2BFEE79728FEE49426FEE19023FEDE8D20FDD8871EFC
            CF811AF9C27518F3AC6714EA8E5411DC70420CCC522F09BA351E07A71B110394
            0B070185040200780000006C00000061000000550000004A0000003F00000035
            0000002C000000240000001D00000017000000110000000C0000000700000003
            0000000100000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000100000004000000090000000E000000140000001900000020
            00000028000000300000003A000000440000004F0202005A07040267130C0476
            2A180589482A09A16D400CBA915511D1AB6715E3BE7317EFCE7E1AF6DA871EFB
            E08D21FEE49124FEE79627FFE9992AFFEB9C2DFFEC9F30FFEDA234FFEEA436FF
            EFA639FFF0A83BFFF1AA3DFFF2AB3FFFF2AC40FFF3AD41FFF3AE42FFF3AE43FF
            F3AE43FFF3AE43FFF3AD42FFF2AD41FFF2AC40FFF2AA3FFFF1A93DFFF0A73BFF
            EFA538FFEEA336FFEDA033FFEC9D30FFEA9A2DFFE9972AFFE79427FFE48F23FE
            DF8B20FDD9851DFBCD7C19F6BC7016EEA66214E28A500FD0693C0CBA442709A0
            2314058A100A02790704026B0202005E00000053000000480000003D00000033
            0000002A000000230000001C00000016000000100000000B0000000700000003
            0000000100000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000100000004000000080000000D00000012000000180000001E
            000000250000002D00000036000000400303034B0B0502581C10046A39210781
            5B340B9C7E490FB89F5D13D2BB6F17E7CE7B1AF4D9821CFADF8A21FDE38E24FE
            E79328FFEA972BFFEB9A2EFFED9E32FFEEA136FFF0A439FFF1A73DFFF2AA40FF
            F3AC43FFF4AE46FFF5B048FFF5B14AFFF6B24CFFF6B34DFFF6B34EFFF6B44FFF
            F6B44FFFF6B44FFFF6B34EFFF6B34DFFF5B24CFFF5B04AFFF5AF48FFF4AD45FF
            F3AB42FFF2A83FFFF1A63CFFF0A339FFEEA035FFED9C32FFEB992EFFE9952AFF
            E69026FEE38C23FEDE8820FDD8801CFACA7719F2B56915E5985912D179450DB7
            5431099C311D0782170E046D0805025C0303004F000000440000003A00000030
            00000028000000200000001A000000140000000E000000090000000500000002
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000100000003000000070000000C00000011000000160000001C
            000000230000002A000000330404003D0D0A034A2416085C46280A776B3F0D98
            8E5310BAAC6415D5C27218E9D47C1CF5DE851FFBE38B23FDE68F27FEEA942BFF
            EC982FFFED9C33FFEE9E37FEEFA23BFEF2A63FFFF3AA44FFF5AD47FFF6AF4BFF
            F5B14EFEF6B351FEF8B654FFF8B756FFF9B857FFF9B959FFF8B85AFEF8B95AFE
            F9BA5BFFF9BA5AFFF9B95AFFF9B859FFF7B657FEF7B556FEF8B553FFF7B351FF
            F7B14EFFF6AE4AFFF3AA47FEF2A743FEF2A53FFFF1A13BFFEF9E36FFED9A32FF
            EB962EFFE99229FFE78E26FFE28922FDDB811DFACD791AF4BE6D17E8A76013D5
            8A5010B862390B96392208771D12055F0D06034D03030340000000350000002C
            000000250000001E00000018000000120000000C000000070000000300000001
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000200000005000000090000000E0000001400000019
            0000001F000000270505052F110C043C2F1C095051310B6D77440F91965712B7
            B16715D6C77418ECD67E1CF7DF8520FCE48B24FDE78F29FEEA932EFEED9932FF
            EF9D37FFF0A03CFEF1A441FEF3A746FEF4AB4AFEF6AF4FFFF8B252FFF8B456FE
            F8B659FEF9B85DFEF9BA5FFEFBBC61FFFBBE63FFFABD64FEFABE65FEFBBE66FE
            FBBE66FEFBBF66FFFBBF66FFFABD65FEFABC63FEFABB61FEFAB95FFEFAB85CFF
            FAB659FFF8B355FEF7B052FEF6AD4EFEF4AA49FEF4A745FFF2A340FFF09E3BFE
            EE9A36FEED9731FFEA922CFFE68C28FEE18823FDDC821FFBD27B1AF6C37217EC
            AE6414D5905310B46A3E0C8F4428096C221606511008043E0505003200000028
            000000210000001B00000015000000100000000A000000050000000100000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000100000003000000070000000C0000001100000016
            0000001C070707241510052F321E07425D360D62814A108C9D5B12B5B66A15D6
            C77419ECD57E1CF8DE8521FDE48A26FEE88F2BFEEB9330FEED9835FEF09E3BFF
            F2A240FFF3A546FEF5A94BFEF6AD50FEF7B155FEF9B55AFFFAB85EFFFABA61FE
            FBBC64FEFBBD67FEFBBF6AFEFDC16CFFFDC26EFFFCC26FFEFCC370FEFCC371FE
            FCC371FEFDC471FFFDC370FFFCC16FFEFCC16EFEFCC06CFEFCBE6AFEFCBE67FF
            FCBC64FFFAB861FEF9B65DFEF8B359FEF7AF54FEF7AD4FFFF6A94AFFF3A344FE
            F19F3FFEF09C39FFED9734FFE9912EFEE58C29FEE08724FEDA8120FCD07B1BF8
            C37217ECB16615D5965712B273420F874A2D0A60291A07430F0A053006060025
            0000001E00000018000000130000000E00000009000000040000000100000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000001000000050000000A0000000F00000013
            0A0000191D0E07233D250936633A0E57854E1182A15D14B1B66A15D6C77519ED
            D37C1DF9DB8422FDE18927FEE68E2CFEEA9332FEEE9838FEF09D3EFEF3A344FF
            F5A74AFFF6AB50FEF7AF56FEF8B25BFEF9B660FEFBBA64FFFCBD68FFFCBE6CFE
            FCC06FFEFCC271FEFDC374FEFEC576FFFEC678FFFDC679FEFDC679FEFDC77AFE
            FDC77AFEFEC77AFFFEC779FFFDC579FEFDC477FEFDC476FEFDC274FEFEC271FF
            FDC06EFFFCBD6BFEFBBA68FEFAB864FEF9B55FFEFAB25AFFF8AE54FFF6A94EFE
            F4A448FEF3A142FFF09C3CFFEC9536FEE89030FEE38B2AFEDD8525FED78020FD
            CE791BF9C37217EDB16614D3985711AB77460E7E51300C542A1C09360D0D0625
            0900001B00000015000000100000000C00000008000000030000000100000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000100000003000000080000000C0F0F0011
            1F150A183F260C286A41114A894F127AA15D13ABB46915D2C47219ECCF7A1CF9
            D88222FDDE8727FEE48D2DFEE89233FEED973AFEF09D40FEF3A247FEF6A84EFF
            F8AD54FFF9B05AFEFAB460FEFBB765FEFBBA6AFEFDBE6EFFFDC172FFFDC275FE
            FDC378FEFDC57AFEFDC67CFEFEC87EFFFEC97FFFFDC87FFEFDC980FEFDC980FE
            FDC980FEFECA81FFFEC981FFFDC87FFEFDC77FFEFDC67EFEFDC67CFEFEC57AFF
            FEC477FFFDC175FEFCBF71FEFCBC6DFEFBB969FEFCB764FFFBB45EFFF8AE58FE
            F7AA52FEF5A64CFFF2A145FFEE9A3EFEEA9537FEE58F31FEE0892AFEDA8325FE
            D37E20FDCB781AF8BF7017EAB06514D09A5912A57B470F72532F0E46301E0C2A
            1309091A000000120000000E0000000A00000006000000030000000100000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000200000005000000091F1F0F10
            472F0F206A3F113C8951136AA05E14A2B16716CFC07119EACC791CF8D48021FD
            DB8527FEE28C2DFFE69134FEEA973BFEEE9C42FEF2A249FEF6A850FFF9AD57FF
            FAB15EFFFCB664FFFBB869FEFCBB6EFEFEBF72FFFEC276FFFEC47AFFFEC67CFF
            FDC67FFEFDC780FEFFC982FFFFCA84FFFFCA85FFFFCB86FFFDCA85FEFDCB85FE
            FFCC86FFFFCB86FFFFCB86FFFFCB85FFFDC984FEFDC883FEFFC982FFFFC880FF
            FFC67EFFFEC57CFFFDC279FEFDC076FEFEBE72FFFDBB6DFFFCB868FFFBB462FF
            F9B05CFFF7AB55FFF4A64EFFF1A046FFEB993FFEE79338FEE38E31FFDE882AFF
            D68124FECF7B1FFDC8761AF8BC6E16EAAC6415CA9657129A7A480F665C390D3A
            3322081E0F0F00110000000B0000000700000004000000020000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000001000000031F1F1F084C331914
            6D431431844E155E9B5B1494AD6515C6BD6F19E8C8761BF8D07C21FDD88326FF
            DE8A2DFFE39034FFE8963BFFED9C43FFF1A24AFFF4A852FFF8AD59FFFAB260FF
            FCB667FFFDBA6CFFFEBD71FFFEC075FFFEC279FFFFC47DFFFFC67FFFFFC782FF
            FFC884FFFFC985FFFFCA87FFFFCB88FFFFCB89FFFFCC89FFFFCC8AFFFFCC8AFF
            FFCC8AFFFFCC8AFFFFCC89FFFFCB89FFFFCB88FFFFCA88FFFFCA86FFFFC985FF
            FFC883FFFFC781FFFFC57FFFFFC37CFFFEC179FFFEBE75FFFEBB70FFFCB86BFF
            FBB465FFF9AF5EFFF6AA57FFF2A54FFFEE9F47FFEA993FFFE59338FFE08C30FF
            DA8629FFD27F23FECB781EFDC37219F7B66A16E5A76213C3965811907C4A1156
            5835112B30240C151919000A0000000500000002000000010000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000055550003553F150C6C451721
            8250174C96591686A86315BCB66C17E2C3741AF6CB791FFDD28025FEDA872BFF
            DF8D33FFE5943AFFEA9A43FFEEA14BFFF2A753FFF5AC5AFFF8B162FFFBB568FF
            FCB96EFFFDBD73FFFEBF78FFFEC27BFFFFC47EFFFFC681FFFFC783FFFFC885FF
            FFC987FFFFCA88FFFFCB89FFFFCB8AFFFFCB8AFFFFCC8BFFFFCC8BFFFFCC8BFF
            FFCC8BFFFFCC8BFFFFCC8BFFFFCB8AFFFFCB8AFFFFCB8AFFFFCA89FFFFCA88FF
            FFC986FFFFC785FFFFC683FFFFC581FFFEC37EFFFEC17BFFFEBE77FFFDBB72FF
            FBB86CFFF9B366FFF7AF5FFFF3A958FFEFA44FFFEB9D47FFE7973FFFE19036FF
            DB892FFFD58327FFCD7C21FEC6761CFCBD6F17F5B26615E2A45E13B79254127C
            784512465F370F20452E170B0000000300000001000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000001666633056E4D21177B4F1E3A
            93581970A36116ADB26817DCBC7019F3C7771DFCCD7D23FED58429FFDB8B31FF
            E19139FFE69841FFEA9E4AFEEEA452FEF2AA5AFEF5AF62FEF9B469FFFBB86FFF
            FCBC74FFFDBF79FFFDC07CFEFDC27FFEFEC582FFFFC684FFFFC786FFFFC887FF
            FDC887FEFDC988FEFFCA8AFFFFCA8AFFFFCB8AFFFFCB8BFFFDCA8AFEFDCA8AFE
            FFCB8BFFFFCB8BFFFFCB8BFFFFCB8AFFFDC989FEFDC989FEFFCA89FFFFC989FF
            FFC888FFFEC787FFFDC584FEFDC483FEFEC481FFFEC27FFFFDC07BFFFCBD77FF
            FBBA72FFF9B76DFFF7B266FFF4AD5FFFEFA757FEECA04EFEE89B46FFE3943DFF
            DD8D34FFD7862CFFCF7F25FEC7781FFEC0721AFCB66B16F2AA6214D69A5A12A7
            8A51126D7A4B12366B431A133333330500000001000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000007F7F7F027F552A0C85541E2A8E571B5D
            9D5D1798AC6517CEB76B17EFC1721BFBC87920FECF7F27FED6862EFEDD8E37FF
            E2953FFFE79B48FEEBA251FEEFA859FEF2AD61FEF5B268FEF7B66FFEFABA74FF
            FBBD79FFFBBF7CFEFCC17FFEFDC281FEFDC483FEFEC685FFFEC786FFFDC786FE
            FDC787FEFDC888FEFDC888FEFFC989FFFFC989FFFDC989FEFDC989FEFDC989FE
            FDC989FEFFCA8AFFFFCA8AFFFDC888FEFDC888FEFDC888FEFDC888FEFEC888FF
            FEC888FFFDC686FEFDC585FEFDC484FEFCC382FEFDC281FFFCC17EFFFABE7BFE
            F9BB77FEF9B972FFF7B56CFFF3AF65FEF0AA5EFEEDA455FEE89E4CFEE49743FF
            DF903AFFD78831FED18129FEC97B22FEC1741CFEB96C17F9AD6414EBA05E12CB
            9457149588511854784D23246A3F2A0C55550003000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000FFFF0001AA7F7F069F743F18996125449D5F1A86
            A46216C0B16617E5BB6E18F8C2751EFECB7C24FFD1822BFED78933FEDE913CFF
            E49945FFE89E4EFEECA557FEF0AB5FFEF3B067FEF5B46DFEF7B873FEF9BC78FF
            FABE7BFFFABF7EFEFBC180FEFCC281FEFCC383FEFEC585FFFEC686FFFDC585FE
            FDC686FEFDC686FEFDC686FEFFC787FFFFC888FFFDC787FEFDC787FEFDC787FE
            FDC787FEFFC888FFFFC888FFFDC787FEFDC686FEFDC686FEFDC686FEFEC787FF
            FEC686FFFDC585FEFCC484FEFCC383FEFBC282FEFCC282FFFBC180FFF9BE7DFE
            F8BC7AFEF8BA75FFF6B770FFF3B26AFEF0AD63FEEDA75BFEE9A152FEE59B49FF
            E0943FFFD98B36FED2842EFECB7D26FEC3761FFEBC6E1AFDB16815F7A66114E4
            9C5B14B890571B788154243F7A5128197F552A06000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000AAAA5503AF8F6F10B17F4D2EA96F2F65A6641CAA
            A96417DDB26816F4BC701BFCC47720FFCC7E27FFD3852FFFD98D38FFDF9542FF
            E59C4BFFE9A254FFEDA85DFEF0AD64FEF2B26BFEF4B671FEF7BA76FFF8BC7AFF
            F9BE7CFFFAC07FFFFAC07FFEFBC181FEFCC383FFFDC483FFFDC484FFFDC484FF
            FCC483FEFDC484FEFEC585FFFEC585FFFEC685FFFEC685FFFDC584FEFDC584FE
            FEC685FFFEC685FFFEC685FFFEC685FFFDC484FEFDC484FEFEC585FFFDC584FF
            FDC484FFFDC484FFFCC382FEFBC282FEFBC282FFFAC181FFFAC080FFF9BF7EFF
            F8BD7BFFF7BB78FFF5B873FFF3B46EFFF0AF67FEEDAA60FEEBA557FFE69E4EFF
            E19744FFDB8F3BFFD48632FECC7F29FEC67822FFBC711CFEB46917FDAB6213F3
            A15F14D4965B199F89581F628556222C73452E0B7F0000020000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000FF000001B6916D07B78F5F20B2844F4DAD74338AAB691EC6
            AD6616EDB46918FBBC711DFEC57823FFCD802BFFD48833FFDA903DFFE09746FF
            E59E50FFEAA559FFEEAB61FFF0B068FFF3B46EFFF4B773FFF5B977FFF7BB7AFF
            F8BD7CFFF8BE7EFFF9C07FFFFAC080FFFBC180FFFBC281FFFCC281FFFCC281FF
            FDC281FFFDC382FFFDC382FFFEC382FFFEC382FFFEC482FFFEC482FFFEC482FF
            FEC482FFFEC482FFFEC482FFFEC382FFFEC382FFFDC382FFFDC382FFFDC281FF
            FCC281FFFCC281FFFBC281FFFBC181FFFAC180FFF9C080FFF8BF7FFFF7BE7DFF
            F6BC7BFFF5BA78FFF4B875FFF2B570FFF0B16AFFEEAD64FFEBA75CFFE7A053FF
            E29949FFDC923FFFD68A36FFCF822DFFC77A25FFBF731EFFB66B18FFAD6415FA
            A35F14E89B5B17C392581A8887521A4473451716333300050000000100000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000007F7F7F029C753A0DAA784133AA763870AB6F2BAEAB681EDC
            AE6617F6B56C1AFEBE731FFFC67A26FFCE822EFFD58A37FFDB9241FFE19A4AFF
            E6A154FFEAA75DFFEDAC64FFF0B06AFFF1B470FFF3B674FFF4B977FFF5BA79FF
            F6BC7BFFF7BD7CFFF8BE7CFFF9BE7DFFF9BF7DFFFABF7EFFFABF7EFFFBC07EFF
            FBC07EFFFCC07EFFFCC17EFFFDC17EFFFDC17EFFFDC17EFFFDC27EFFFDC27EFF
            FDC27EFFFDC27EFFFDC17EFFFDC17EFFFDC17EFFFCC17EFFFCC07EFFFBC07EFF
            FBC07EFFFAC07EFFFABF7EFFF9BF7EFFF9BE7EFFF8BE7DFFF7BD7CFFF6BC7BFF
            F5BB7AFFF4BA78FFF3B775FFF1B571FFEFB16CFFEDAD66FFEBA85FFFE7A256FF
            E39B4DFFDD9443FFD68C39FFCF8430FFC87C28FFC07420FFB76D1AFFAE6516FD
            A55F13F59C5C13DD935615A8824D1260663F13284E27130D5500000300000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000016633330585582C17996126499E642391A4641DCDA76418ED
            AE6618FBB66D1BFEBF7421FFC77C28FFCF8431FFD68C3AFFDC9444FFE19C4EFF
            E6A257FFEAA85FFFEBAB66FEEDAF6BFEEFB270FEF0B473FEF3B775FFF4B977FF
            F5BA78FFF6BB79FFF5BA79FEF6BB7AFEF8BC7AFFF8BC7AFFF9BD7BFFF9BD7BFF
            F9BD7BFEF9BD7BFEFBBE7BFFFBBE7BFFFCBE7BFFFCBF7BFFFBBE7BFEFBBE7BFE
            FCBF7BFFFCBF7BFFFCBF7BFFFCBF7BFFFABD7BFEFABD7BFEFABE7BFFFABE7BFF
            F9BD7BFFF9BD7BFFF7BC7AFEF7BB7AFEF7BC7AFFF6BB7AFFF5BB79FFF4BA79FF
            F3B978FFF2B876FFF1B674FFF0B471FFEDB06DFEEBAC67FEEAA961FFE7A359FF
            E39D50FFDD9646FFD68D3CFECF8433FEC97D2AFFC17522FFB86E1CFFAE6717FE
            A55F13FB9B5912EC8E530FC17B470D805F390B434E31091A552A000600000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000555500034E3A130D6C46192889531762965916AD9F5D15E2A76214F7
            AF6618FDB76E1CFEBF7623FEC87D2AFFCF8633FFD58D3DFEDB9547FEE19D50FF
            E5A359FFE8A760FEEAAB66FEECAE6BFEEEB16EFEEFB371FEF0B473FEF2B774FF
            F3B775FFF3B776FEF4B876FEF4B876FEF5B876FEF7BA76FFF7BA77FFF7B977FE
            F7BA77FEF8BA77FEF8BA77FEFABB77FFFABC77FFF9BB77FEF9BB77FEF9BB77FE
            F9BB77FEFABC77FFFABC77FFF9BB77FEF9BA77FEF8BA77FEF8BA77FEF8BB77FF
            F8BB77FFF6B977FEF6B976FEF5B976FEF4B876FEF4B976FFF4B876FFF2B775FE
            F1B675FEF1B674FFF0B472FFEEB16FFEECAF6CFEEAAC67FEE8A861FEE6A45AFF
            E29E52FFDC9648FED68E3FFECF8635FEC87E2CFEC17624FFB96F1DFFAF6717FE
            A65F13FD9B590FF48E510ED57A470BA0683B07626136062A5438000900000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000663300055B321419693E0F417F4A107E915511C29D5B12EEA56114FC
            AE6818FEB76F1DFEBF7624FEC87E2CFFD08735FFD58E3FFEDB9548FEE19D51FF
            E4A359FFE6A660FEE9AA65FEEBAD6AFEECAF6CFEEDB06EFEEEB270FEF0B471FF
            F1B572FFF1B472FEF2B572FEF3B572FEF3B672FEF5B772FFF5B772FFF5B773FE
            F5B773FEF6B773FEF6B773FEF8B973FFF8B973FFF7B873FEF7B873FEF7B873FE
            F7B873FEF8B973FFF8B973FFF7B873FEF7B873FEF6B773FEF6B773FEF6B873FF
            F6B873FFF4B772FEF4B672FEF3B672FEF2B572FEF3B672FFF2B572FFF0B472FE
            EFB371FEEFB370FFEEB26FFFECAF6DFEEBAD6AFEE9AB66FEE7A761FEE5A45BFF
            E29E53FFDC964AFED68F40FED08736FEC87F2DFEC17725FFB96F1EFFAF6818FE
            A56113FE9B5A10F98F520DE681490ABF744309816C40083B6633110F00000001
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000054380009623A0D276C3F0D5C7E480E9B8F530ED39D5A10F5A56114FE
            AE6818FEB76F1EFEC07725FFC87F2DFFD08736FFD68F40FFDC9649FFE09D52FF
            E3A259FFE6A65FFFE7A864FEE9AB67FEEAAD69FEEBAE6BFEEDB06CFFEEB16DFF
            EFB26DFFF0B26EFFF0B26EFEF1B26EFEF2B46EFFF3B46EFFF3B46EFFF4B56EFF
            F3B46EFEF4B46EFEF5B56EFFF6B56EFFF6B66EFFF6B66EFFF5B56EFEF5B56EFE
            F6B66EFFF6B66EFFF6B66EFFF6B66EFFF5B46EFEF4B46EFEF5B56EFFF4B56EFF
            F4B56EFFF3B46EFFF2B36EFEF1B26EFEF1B36EFFF1B36EFFF0B26EFFEFB26EFF
            EEB16DFFEDB06DFFECAF6CFFEBAE6AFFE9AB68FEE7A964FEE6A760FFE4A35AFF
            E09E53FFDC974AFFD68F41FED08737FEC9802EFFC17726FFB9701EFFB06818FF
            A66114FE9C5A10FC91530DF2864B0BD77B46099B7241094E5F350A1833330005
            0000000100000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000016A3F000C6E3E093575420A77804A0CB690530DE29C5A10F9A56114FE
            AF6819FFB8701EFFC07726FFC87F2EFFCF8737FFD68F40FFDB9649FFDF9C51FF
            E2A158FFE4A45DFFE6A761FFE8A964FFE9AB66FFEAAC67FFEBAD68FFECAE68FF
            EDAF69FFEEAF69FFEFB069FFEFB069FFF0B069FFF1B169FFF1B169FFF2B169FF
            F2B269FFF3B269FFF3B269FFF4B269FFF4B269FFF4B369FFF4B369FFF4B369FF
            F4B369FFF4B369FFF4B369FFF4B269FFF4B269FFF3B269FFF3B269FFF2B269FF
            F2B169FFF1B169FFF1B069FFF0B069FFEFB069FFEFAF69FFEEAF69FFEDAF69FF
            ECAE69FFEBAD68FFEAAC67FFE9AB66FFE8A964FFE6A862FFE4A55EFFE2A159FF
            DF9C52FFDB974AFFD69041FFD08837FFC9802EFFC17826FFB9701EFFB06818FF
            A76114FF9C5A10FE92530EFA874E0CE77D480BB16E3D07634E2D06272A15000C
            5500000300000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000263380E1274430B447C450A8F864B0CCD92520DED9D5A10FBA66114FF
            AF6819FFB76F1FFFC07726FFC77F2EFFCE8737FFD58E40FFDA9548FFDD9A50FF
            E09F55FFE3A25AFFE5A45EFFE6A660FFE7A862FFE8A963FFE9AA63FFEAAA63FF
            EBAB64FFECAC64FFECAC64FFEDAD64FFEEAD64FFEFAD64FFEFAD64FFF0AE64FF
            F0AE64FFF0AE65FFF1AE64FFF1AF64FFF2AF64FFF2AF64FFF2AF65FFF2AF65FF
            F2AF64FFF2AF64FFF2AF64FFF2AF64FFF1AF65FFF1AE65FFF0AE64FFF0AE64FF
            F0AE64FFEFAD64FFEFAD64FFEEAD64FFEDAC64FFECAC64FFECAC64FFEBAB64FF
            EAAA64FFE9AA64FFE8A963FFE7A862FFE5A760FFE4A55EFFE2A25BFFE09F56FF
            DD9B50FFDA9548FFD58F40FFCF8737FFC87F2EFFC17725FFB8701EFFB06818FF
            A76114FF9C5A11FE94530EFD894D0BF07D470AC1693B08794D2B043B39220016
            3333000500000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000001
            2A2A00065831091A7641095280470AA3884E0BDE93530EF69D5911FDA56114FE
            AD6819FEB66F1EFEBF7626FFC67E2EFFCD8636FFD38D3FFFD89347FFDC984DFF
            DE9C53FFE19F57FFE1A15AFEE3A25CFEE4A45DFEE5A45EFEE7A65EFFE8A75EFF
            E9A75FFFE9A85FFFE9A75FFEEAA85FFEECA95FFFECA95FFFEDAA5FFFEDAA5FFF
            EDA95FFEEDA95FFEEFAB5FFFEFAB5FFFEFAB5FFFEFAB5FFFEEAA5FFEEEAA5FFE
            EFAB5FFFEFAB5FFFEFAB5FFFEFAB5FFFEEAA5FFEEEAA5FFEEEAA5FFFEEAA5FFF
            EDAA5FFFEDAA5FFFEBA85FFEEBA85FFEEBA95FFFEAA85FFFE9A85FFFE9A75FFF
            E8A75FFFE7A65EFFE6A55EFFE4A55DFFE2A25CFEE1A15AFEE0A057FFDE9C53FF
            DB984DFFD89346FFD28C3EFECD8536FEC77E2DFFC07725FFB86F1EFFAF6818FF
            A66114FE9C5A11FE93540EFE884E0BF47B4609CE693A078F522F065045260721
            4824000700000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000002
            2E17000B502E06266F3E07627F490BB2894D0CE993540EFB9B5A10FEA46014FE
            AD6718FEB56E1EFEBD7525FEC57D2DFFCC8435FFD18A3DFED59044FED9954AFF
            DC994FFFDD9B52FEDF9D55FEE09F57FEE1A058FEE2A159FEE3A159FEE5A359FF
            E6A359FFE6A359FEE7A359FEE8A459FEE8A459FEEAA65AFFEBA65AFFEAA55AFE
            EAA55AFEEBA65AFEEBA65AFEECA75AFFEDA75AFFECA65AFEECA65AFEECA65AFE
            ECA65AFEEDA75AFFEDA75AFFECA65AFEEBA65AFEEBA65AFEEBA55AFEEBA65AFF
            EBA65AFFE9A55AFEE9A55AFEE8A459FEE8A459FEE8A459FFE7A459FFE5A259FE
            E4A259FEE4A259FFE3A259FFE1A058FEE09F57FEDE9D55FEDD9B53FEDC994FFF
            D9954AFFD59043FED18A3CFECB8334FEC57D2CFEBF7524FFB76E1DFFAE6718FE
            A56014FE9C5A10FE92540EFE884D0CF67B4509D8693C07A4593207644D2F052B
            5438000900000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000003F000004
            351A0013492C04346A3B08737E470ABE884D0BEF93530EFD9B5910FEA36013FE
            AC6617FEB46D1DFEBC7424FEC47C2BFFCB8332FFCF883AFED38D40FED79246FF
            DA964BFFDB974EFEDD9A50FEDE9B52FEDF9C53FEE09D53FEE19D54FEE39F54FF
            E49F54FFE49F54FEE49F54FEE5A054FEE6A054FEE8A254FFE8A254FFE8A154FE
            E8A154FEE8A254FEE8A254FEEAA354FFEAA354FFEAA254FEEAA254FEEAA254FE
            EAA254FEEBA354FFEBA354FFE9A254FEE9A254FEE8A154FEE8A154FEE9A254FF
            E8A254FFE7A154FEE6A154FEE6A054FEE5A054FEE5A054FFE5A054FFE39E54FE
            E29E54FEE29E54FFE19E53FFDF9C53FEDD9B52FEDC9A50FEDA974EFED9964AFF
            D79246FFD28D40FECF8739FECA8131FEC47B2AFEBE7422FFB66D1CFFAD6617FE
            A46013FE9B5910FE92530EFE884D0CF87C450AE26B3D08B65E35067756300435
            552A000C00000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000002A2A0006
            3A1D001A48290743653A07827B460AC7874C0BF291530DFE9B5910FFA35F13FF
            AB6517FEB36C1CFEBC7322FFC37A29FFC98030FFCE8636FFD28B3DFFD58F42FF
            D79246FFD99549FFDA954BFEDB974CFEDC984DFEDD984DFEDF9A4EFFE09B4EFF
            E19B4EFFE29C4EFFE29B4EFEE29B4EFEE49D4EFFE59D4EFFE69E4EFFE69E4EFF
            E59D4EFEE59D4EFEE79F4EFFE79F4EFFE89F4EFFE89F4EFFE79E4EFEE79E4EFE
            E89F4EFFE89F4EFFE89F4EFFE89F4EFFE69D4EFEE69D4EFEE69E4EFFE69E4EFF
            E69E4EFFE59E4EFFE39C4EFEE39C4EFEE39C4EFFE39C4EFFE29C4EFFE19B4EFF
            E09B4EFFDF9A4EFFDE994DFFDD994DFFDB974CFED9954BFED89549FFD69246FF
            D48E41FFD18A3CFFCC8435FEC87F2EFEC37927FFBC7221FFB56C1BFFAC6516FF
            A35F12FE9A5910FE91530DFE874C0CFA7C4509EA6E3F09C6643807876036083D
            623A000D00000001000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000048240007
            3D2607214B2C0651633808907A4509CE864D0BF490530DFE9A580FFFA25E12FF
            AA6416FFB26A1AFFBA7120FFC17726FFC77E2CFFCB8333FFCF8738FFD28B3DFF
            D48E41FFD69143FFD89245FFD99446FFDB9447FFDC9547FFDD9647FFDE9647FF
            DE9747FFDF9748FFE09848FFE19848FFE19848FFE29948FFE39948FFE39948FF
            E39A48FFE49A48FFE49A48FFE49A48FFE59A48FFE59A48FFE59A48FFE59A48FF
            E59A48FFE59A48FFE59A48FFE59A48FFE49A48FFE49A48FFE49A48FFE39948FF
            E39948FFE29948FFE29948FFE19848FFE09848FFE09848FFDF9748FFDE9748FF
            DD9647FFDC9647FFDB9547FFDA9447FFD99446FFD79245FFD59043FFD38E40FF
            D18B3CFFCE8737FFCB8231FFC77D2BFFC17725FFBB701FFFB36A19FFAB6415FF
            A25E12FF9A580FFF91530DFF874C0CFC7C460AF1714008D36A3B089565380744
            5F3F0F1000000001000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000381C0009
            462606284F2B055D6339089C784409D5854B0CF690520DFF98570FFFA15D11FF
            A96214FFB06818FFB86E1DFFBE7523FFC47B29FFC87F2EFFCC8433FFCF8738FF
            D18A3BFFD38C3DFFD58E3FFFD68F40FFD89041FFD99141FFDA9141FFDB9241FF
            DB9241FFDC9341FFDD9341FFDE9441FFDE9441FFDF9442FFDF9542FFE09542FF
            E09542FFE09542FFE19642FFE19642FFE19642FFE29642FFE29642FFE29642FF
            E29642FFE29642FFE29642FFE19642FFE19642FFE19642FFE09542FFE09542FF
            E09542FFDF9442FFDF9442FFDE9442FFDD9342FFDD9342FFDC9341FFDB9241FF
            DA9241FFD99141FFD89141FFD79041FFD68F40FFD48E3FFFD28C3DFFD08A3BFF
            CE8737FFCB8333FFC87E2DFFC47A28FFBF7422FFB96E1CFFB16817FFA96214FF
            A15D11FF99570FFF90520DFF874B0CFD7D460BF674410ADE6C3C09A068390A4C
            5D350D1300000002000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000004C33000A
            4927052D542F0767653807A678430ADA844B0CF68E510DFE97560EFF9F5B10FF
            A66113FEAD6617FEB56C1BFFBC7220FFC17725FFC57C2AFFC9802EFFCC8332FF
            CE8635FFD08837FFD18939FED28A3AFED38A3AFED48B3AFED68D3AFFD78D3AFF
            D88E3AFFD98E3BFFD98E3BFED98E3BFEDB8F3BFFDC903BFFDC903BFFDD903BFF
            DC903BFEDC903BFEDE913CFFDE913CFFDE913CFFDF913CFFDE903BFEDE903BFE
            DF913CFFDF913CFFDF913CFFDE913CFFDD903BFEDD903BFEDD913BFFDD903BFF
            DD903BFFDC903BFFDA8E3BFEDA8E3BFEDA8F3BFFDA8F3BFFD98E3BFFD88E3BFF
            D78D3BFFD68D3BFFD58C3BFFD48B3AFFD2893AFED08839FECF8737FFCD8535FF
            CB8232FFC87F2EFFC47B29FEC07624FEBC711FFFB66C1AFFAF6616FFA86112FF
            9F5C10FE96570EFE8E510DFE854C0CFE7D460BFA73400AE56D3E09A8653A0953
            4D2C0B1700000004000000010000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000452E000B
            4E2905315430066F653907AE76420ADD844B0BF78C500CFE95550EFF9C5A0FFE
            A45F12FEAB6415FEB26A19FEB96F1DFFBE7421FFC17826FEC57C29FEC97F2DFF
            CB812FFFCC8231FECD8433FECF8534FED08634FED18634FED28734FED48934FF
            D58934FFD58934FED68934FED68934FED78A34FED88B35FFD98B35FFD88B35FE
            D98B35FED98B35FEDA8B35FEDB8D35FFDB8D35FFDA8C35FEDB8C35FEDB8C35FE
            DB8C35FEDC8D35FFDB8D35FFDA8C35FEDA8C35FEDA8B35FED98B35FEDA8C35FF
            D98C35FFD88A35FED78A35FED78A35FED68935FED68A35FFD68A35FFD48835FE
            D38835FED38835FFD28835FFD08634FECE8534FECD8333FECB8231FECA812FFF
            C87E2CFFC47B29FEC17724FEBD7320FEB86F1BFEB36A17FFAD6414FFA55F11FE
            9D5A0FFE95560EFE8D510CFE844B0BFE7C450BFC744009E96C3D08AE61360859
            482D091C2A000006000000010000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000452E000B
            4E2C0434542F0675643808B475420AE0824A0BF88B4F0CFE94540DFF9A590EFE
            A25D10FEA96213FEAF6717FEB76C1AFFBC711EFFBF7421FEC27825FEC57B28FF
            C87D2AFFC87F2CFECA7F2DFECB802EFECD812EFECE822EFECF832EFED1842EFF
            D2852EFFD2842EFED2842EFED3852EFED4852EFED5862FFFD6872FFFD5862FFE
            D6862FFED6872FFED7872FFED88830FFD88830FFD7872FFED7872FFED7872FFE
            D7872FFED88830FFD88830FFD7872FFED7872FFED7872FFED6872FFED7872FFF
            D6872FFFD5862FFED4852FFED4852FFED3852FFED3852FFFD2852FFFD0842FFE
            D0832FFED0842FFFCF832FFFCD822EFECB812EFECA7F2DFEC87E2CFEC77C2AFF
            C47A27FFC17724FEBE7420FEBA701CFEB56C19FEB16715FFAA6313FFA25E10FE
            9B590EFE93550DFE8B500CFE834B0BFE7A440AFD724009EC6B3C08B25D34085D
            4120081F1F000008000000020000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000552A000C
            4B2A0436542E0679623708B874410AE280490BF88A4E0CFF92530DFF99570EFF
            9F5C0FFEA66012FEAE6514FFB46918FFB96E1BFFBD711EFFC07421FFC27724FF
            C47925FFC67B27FFC77C28FEC87D29FECA7E29FECB7F29FECD8029FFCE802AFF
            CF812AFFCF812AFFCF802AFED0812AFED2822AFFD2822AFFD3832AFFD3832AFF
            D3822AFED3832AFED5842BFFD5842BFFD5842BFFD5842BFFD4832BFED4832BFE
            D5842BFFD5842BFFD5842BFFD5842BFFD4832BFED3832BFED4842BFFD4832BFF
            D3832BFFD3832BFFD1812BFED1812BFED1822BFFD0822BFFCF812BFFCE812BFF
            CE802AFFCD802AFFCC7F2AFFCB7F2AFFC87E29FEC77C29FEC67B27FFC47926FF
            C27723FFBF7420FFBB711DFEB76D19FEB46916FFAE6514FFA86111FFA15C0FFF
            99580EFE92530DFE8B4F0CFF824A0BFF79440AFD703F09ED693B08B55A350760
            3C2507221C000009000000020000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000552A000C
            4A290437522D067B613608BA72400AE480470BF9894D0CFF90520CFF97560DFF
            9E5A0EFFA55E10FFAB6313FFB16716FFB66B19FFBA6F1CFFBD721FFFC07421FF
            C27623FFC47824FFC57925FFC77A25FFC87B26FFC97C26FFCA7C26FFCB7D26FF
            CC7D26FFCC7E26FFCD7E26FFCE7E26FFCF7F26FFCF7F26FFD07F27FFD08027FF
            D18027FFD18027FFD28027FFD28127FFD28127FFD38127FFD38127FFD38127FF
            D38127FFD38127FFD28127FFD28127FFD28127FFD28127FFD18127FFD18027FF
            D08027FFD08027FFCF8027FFCF7F27FFCE7F27FFCE7F27FFCD7E27FFCC7E27FF
            CB7E27FFCA7D27FFC97C27FFC87C27FFC77B26FFC57926FFC37825FFC17623FF
            BF7421FFBC711EFFB96E1BFFB56B17FFB16714FFAC6312FFA65F10FF9F5B0EFF
            98560DFF91520CFF894D0CFF81490BFF78440AFE703F09EE673908B658310762
            382307241900000A000000020000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000552A000C
            4A290437522D067B603508B9703F0AE47D460BF9874C0BFF8E510CFF95550DFF
            9C590EFFA35D0FFFA96112FFAF6615FFB46A18FFB86E1CFFBB711FFFBD7320FF
            BF7522FFC17623FFC37824FFC47924FFC67924FFC77A24FFC87B25FFC97B25FF
            C97C25FFCA7C25FFCB7C25FFCC7C25FFCC7D25FFCD7D25FFCD7E25FFCE7E26FF
            CE7E26FFCF7E26FFCF7E26FFD07F26FFD07F26FFD07F26FFD07F26FFD07F26FF
            D07F26FFD07F26FFD07F26FFCF7F26FFCF7F26FFCF7F26FFCF7F26FFCE7E26FF
            CE7E26FFCD7E26FFCD7E26FFCC7D26FFCC7D26FFCB7D26FFCB7C26FFCA7C26FF
            C97C26FFC87B26FFC77A26FFC67A25FFC47925FFC37825FFC17624FFBF7523FF
            BD7321FFBB701EFFB76D1BFFB36917FFAE6513FFA96111FFA35D0FFF9D590EFF
            96550DFF8F510CFF874C0BFF7F480BFF77430AFE6F3E09EE663908B658310762
            382307241900000A000000020000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000003F2A000C
            482B0435502C06785E3408B76E3F09E27C450AF8854B0BFF8C4F0CFF93540CFF
            99570DFE9F5B0FFEA76012FFAD6516FFB36A1AFFB76E1EFFBA7120FFBC7322FF
            BE7523FFC07624FFC07725FEC27825FEC37925FEC47925FEC67A25FFC77B26FF
            C87B26FFC87B26FFC87C26FEC97C26FECA7C26FFCB7D26FFCB7D26FFCC7D26FF
            CB7D26FECC7E26FECD7E26FFCD7E27FFCE7E27FFCE7E27FFCD7E27FECD7E27FE
            CE7E27FFCE7E27FFCE7E27FFCD7E27FFCC7E27FECC7E26FECD7E26FFCC7E26FF
            CC7E26FFCB7D26FFCA7D26FEC97D26FECA7C26FFC97C26FFC97C26FFC87B26FF
            C77B26FFC67A26FFC57A26FFC47926FFC27826FEC07725FEC07625FFBE7524FF
            BC7322FFB97020FFB56D1CFEB06817FEAC6413FFA76010FFA15C0EFF9A580DFF
            93540CFE8C500CFE854B0BFF7D470BFF74410AFD6C3E08ED653808B557320760
            3C1E07221C000009000000020000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000452E000B
            4B2805334F2B06745C3408B36E3D09E07A440AF8824A0BFE8A4E0BFF90520CFE
            97560DFE9D5A0EFEA46013FEAC6619FFB26C1EFFB56F22FEB87224FEBB7425FF
            BD7526FFBE7627FEBF7727FEC07827FEC17927FEC27A27FEC37A28FEC57B28FF
            C67C28FFC67C28FEC77C28FEC77D28FEC87D28FEC97D28FFCA7E28FFC97E28FE
            CA7E28FECA7E28FECB7E28FECC7E29FFCC7F29FFCB7F29FECB7F29FECB7F29FE
            CB7F29FECC7F29FFCC7F29FFCB7F29FECB7F29FECB7F28FECA7E28FECB7E28FF
            CA7E28FFC97E28FEC87D28FEC87D28FEC77D28FEC87C28FFC77C28FFC57B28FE
            C47B28FEC47A28FFC37A28FFC17928FEC07828FEBF7828FEBE7727FEBD7526FF
            BB7425FFB77224FEB46E20FEAF691AFEAA6315FEA55F10FF9F5A0EFF97560DFE
            90530CFE894E0BFE824A0BFE7C460AFE72400AFD6C3C08EB643708B25731085D
            4120081F1F000008000000020000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000452E000B
            452A05304E2C066E5B3307AD6C3D09DD77440AF77F490BFE884D0BFF8E510CFE
            94550CFE9B590FFEA26014FEAB681DFFB16E23FFB47227FEB77428FEBA7629FF
            BC772AFFBD782AFEBE792AFEBF792BFEC07A2BFEC17B2BFEC27C2BFEC47C2BFF
            C57D2CFFC57D2CFEC67D2CFEC67E2CFEC77E2CFEC87E2CFFC97F2CFFC87F2CFE
            C97F2CFEC97F2CFECA7F2CFECB7F2CFFCB802CFFCA7F2CFECA7F2CFECA7F2CFE
            CA7F2CFECB802CFFCB802CFFCA7F2CFECA7F2CFEC97F2CFEC97F2CFECA7F2CFF
            C97F2CFFC87F2CFEC77E2CFEC77E2CFEC67E2CFEC77D2CFFC67D2CFFC47D2CFE
            C37C2CFEC47C2CFFC37B2CFFC07B2CFEBF7A2BFEBE792BFEBD782BFEBC772AFF
            BA762AFFB77428FEB37025FEAF6B1FFEA96418FEA35E12FF9C590EFF95550CFE
            8E510CFE874D0BFE80490BFE79450AFE70400AFB6A3C08E9623808AD59340858
            4225091B00000006000000010000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000004C19000A
            4528052C4B2A0566593207A5693B09D976430AF67E470BFE854B0BFF8C4F0CFF
            92530DFE995810FEA26017FFAB6A22FFB1712AFFB5752DFFB8772EFFBA782EFF
            BC792FFFBD7A2FFFBE7B2FFEBF7B2FFEC07C30FEC17D30FEC37E30FFC47E30FF
            C57E30FFC57F30FFC57F30FEC67F30FEC77F30FFC88030FFC88030FFC98030FF
            C87F30FEC97F30FECA8130FFCA8130FFCA8130FFCA8130FFC98030FEC98030FE
            CA8130FFCA8130FFCA8130FFCA8130FFC98030FEC98030FEC98130FFC98030FF
            C98030FFC88030FFC77F30FEC67F30FEC77F30FFC67F30FFC57F30FFC57E30FF
            C47E30FFC37E30FFC27D30FFC17D30FFBF7C30FEBD7B30FEBD7A30FFBC792FFF
            BA782FFFB8762EFFB3732BFEAF6E25FEA9661CFFA15E14FF9A580EFF94540CFF
            8C500CFE854C0BFE7F480BFE77430AFE6E3F0AF9663A08E4613609A75A310952
            4D2C0B1700000004000000010000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000381C0009
            3A2006274526055C5731069B673A08D473410AF57C460BFF834A0BFF8A4E0CFF
            91520DFF985811FFA1611BFFAB6C27FFB27430FFB57833FFB87934FFBA7B34FF
            BC7C34FFBD7C34FFBE7D35FFC07E35FFC17F35FFC27F35FFC38035FFC38035FF
            C48035FFC58135FFC68135FFC68135FFC78135FFC78235FFC88235FFC88235FF
            C98235FFC98335FFC98336FFC98336FFC98336FFC98436FFC98436FFC98436FF
            C98435FFC98335FFC98335FFC98335FFC98335FFC98335FFC98336FFC88236FF
            C88236FFC88236FFC78236FFC78236FFC68136FFC68136FFC58135FFC48036FF
            C48036FFC38035FFC27F35FFC17F35FFBF7E35FFBE7D35FFBD7D35FFBB7C35FF
            BA7B34FFB87934FFB57631FFB0712CFFA96922FFA05F16FF98570FFF91520CFF
            8B4F0CFF844B0BFF7C460BFF74410AFD6B3D0AF6643809DD5D35089E5832064B
            50280D1300000002000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000024240007
            371F07203F2306505530078F673A08CD713F0AF47A450AFE81490BFF884D0CFF
            8F520EFF975813FFA0631FFFAB6F2DFFB27736FFB67B39FFB87C3AFFBA7D3AFF
            BC7E3AFFBD7F3AFFBF803AFFC0813AFFC1813BFFC2823BFFC3823BFFC3833BFF
            C4833BFFC5833BFFC5843BFFC6843BFFC6843BFFC7843BFFC7853BFFC8853BFF
            C8853BFFC9853BFFC9863BFFC9863BFFC9863CFFC9863CFFC9863BFFC9863BFF
            C9863BFFC9863BFFC9863BFFC9863BFFC9863BFFC9863BFFC8853BFFC8853BFF
            C8853CFFC7853CFFC7843CFFC6843CFFC6843BFFC5843BFFC5833BFFC4833BFF
            C4833BFFC3823BFFC2823BFFC1813BFFBF813BFFBE803BFFBD7F3BFFBC7E3AFF
            BA7E3AFFB87C3AFFB57A38FFB17533FFA96C28FF9F601AFF965710FF8F510CFF
            884D0CFF81490BFF7A450AFF72400AFC693B08F05F3508D25A32089356300744
            5533000F00000001000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000033000005
            281400193D220342532F0780653909C66F3F09F277440AFE7E470BFF854C0CFF
            8B510FFE945916FEA06423FFAB7132FFB27A3CFFB67E40FFB87F40FFBA8040FF
            BC8140FFBD8240FFBE8240FEBF8240FEC08340FEC18440FEC38541FFC48541FF
            C48641FFC58641FFC48541FEC58641FEC68741FFC78741FFC78741FFC88841FF
            C78741FEC88741FEC98841FFC98941FFC98941FFC98941FFC88841FEC88841FE
            C98941FFC98941FFC98941FFC98941FFC88741FEC88741FEC88841FFC88841FF
            C88841FFC78741FFC68641FEC58641FEC68741FFC58741FFC58641FFC48641FF
            C48541FFC38541FFC28541FFC18441FFBF8241FEBD8241FEBD8241FFBC8140FF
            BA8040FFB87F40FFB57E3FFEB1793AFEAA6F2EFF9E611DFF945611FF8C500DFF
            844C0BFE7E480BFE77440AFE703F0AFA653A08E95C3407C4542F0785502E083C
            4E27000D00000001000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000003F000004
            2A1C00123C23053355310671643809BC6E3E08EE74410AFD7C460AFF834A0CFF
            895010FE925918FE9F6627FFAA7437FFB37D42FFB78146FFB98246FFBB8346FF
            BC8446FFBE8546FFBE8546FEBF8546FEC08646FEC18646FEC38847FFC48847FF
            C48947FFC58947FFC58847FEC58947FEC78A47FFC78A47FFC78B47FFC88B47FF
            C78A47FEC88A47FEC98B47FFC98C47FFC98C47FFC98C47FFC88B47FEC88B47FE
            C98C47FFC98C47FFC98C47FFC98B47FFC88A47FEC88A47FEC98B47FFC88B47FF
            C88B47FFC78A47FFC68947FEC68947FEC68A47FFC68A47FFC58947FFC58947FF
            C48847FFC38847FFC28747FFC18747FFBF8547FEBE8547FEBD8546FFBC8446FF
            BB8446FFB98346FFB68045FEB27D41FEAA7234FF9D6221FF925613FF894F0DFF
            814A0BFE7C460AFE75420AFE6C3D09F8623709E1563108B44C2B067549270434
            452E000B00000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000002
            1919000A3F23072457320760633808B06A3C08E871410AFB79440AFE80490CFF
            884F11FF91591AFF9E672AFFAA763CFFB38048FFB7844CFFB9854CFFBB864CFF
            BD874CFFBE884CFFBF894CFFC0894CFFC18A4CFFC28A4CFFC38B4DFFC48B4DFF
            C58C4DFFC58C4DFFC68C4DFFC68D4DFFC78D4DFFC78D4DFFC88E4DFFC88E4DFF
            C88E4DFFC98E4DFFC98E4DFFC98E4DFFC98E4DFFC98E4DFFC98E4DFFC98E4DFF
            C98E4DFFC98E4DFFC98E4DFFC98E4DFFC98E4DFFC98E4DFFC98E4DFFC88E4DFF
            C88E4DFFC88D4DFFC78D4DFFC78D4DFFC68D4DFFC68D4DFFC58C4DFFC58C4DFF
            C48B4DFFC38B4DFFC28A4DFFC18A4DFFC0894DFFBF894CFFBE884CFFBC874CFF
            BB874CFFB9864CFFB7844CFFB38048FFA9743AFF9C6325FF8F5515FF874D0EFF
            80490BFF79450AFF72410AFE6A3D09F6613608D7522F06A1462705624224062A
            381C000900000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000001
            3300000547280A195B320951613707A0683B09DC6F3F0AF575420AFD7D470CFF
            854E11FF8F581CFF9C672DFFA97841FFB3834EFFB88751FFBA8952FFBC8952FF
            BD8A52FFBF8B52FFC08C52FFC18C52FFC28D52FFC38D52FFC48E53FFC48E53FF
            C58F53FFC68F53FFC68F53FFC78F53FFC79053FFC89053FFC89153FFC89153FF
            C99153FFC99153FFC99153FFC99153FFC99153FFC99153FFC99153FFC99153FF
            C99153FFC99153FFC99153FFC99153FFC99153FFC99153FFC99153FFC99153FF
            C89153FFC89053FFC89053FFC79053FFC79053FFC68F53FFC68F53FFC58F53FF
            C48E53FFC48E53FFC38D53FFC28D53FFC18C52FFC08C52FFBE8B52FFBD8A52FF
            BB8A52FFBA8952FFB88852FFB3834EFFA9763FFF9A6428FF8D5516FF844C0EFF
            7D470BFF76430AFF703F0AFE673A09F35F3507CC502D078C4224064D3920081F
            2424000700000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000024B2D0011583207425C34078C623708CA6A3C08EC72410AFB7A460CFE
            814C11FE8B571BFE9A672EFFA97945FFB38553FFB88A57FFBA8C57FFBC8D58FF
            BE8D58FFBF8E58FFBF8E58FEC08E58FEC18F58FEC28F58FEC49158FFC59158FF
            C59158FFC69258FFC69158FEC69158FEC89358FFC89358FFC89358FFC99458FF
            C89358FEC89358FEC99458FFCA9458FFCA9458FFCA9458FFC99358FEC99358FE
            CA9458FFCA9458FFCA9458FFCA9458FFC99358FEC89358FEC99458FFC99458FF
            C99358FFC89358FFC79258FEC69258FEC79258FFC69258FFC69258FFC59158FF
            C59158FFC49158FFC39058FFC29058FFC08E58FEBF8E58FEBF8E58FFBE8D58FF
            BC8C58FFBA8C57FFB78957FEB28553FEA87843FF98642AFF8A5417FF814B0FFF
            7A450BFE73410AFE6C3E09FD663908EF5D3508BF4F2D06763B1F043833190014
            3F00000400000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000001552A000C502D0533532E06745D3308B2673A09E0703E0AF877440CFE
            7E4A10FE87541AFE96652EFEA77A48FFB38858FFB78C5CFEBA8D5DFEBD8F5DFF
            BE905DFFBF905DFEC0905DFEC1915DFEC2915DFEC3925DFEC3925DFEC5945DFF
            C6945DFFC5935DFEC6945DFEC6945DFEC7945EFEC8965EFFC9965EFFC8955EFE
            C8955EFEC8955EFEC9955EFECA965EFFCA975EFFC9965EFEC9965EFEC9965EFE
            C9965EFECA975EFFCA975EFFC9965EFEC9955EFEC9955EFEC8955EFEC9965EFF
            C9965EFFC8955EFEC7955EFEC7945EFEC6945EFEC7955EFFC6945EFFC5935EFE
            C4935EFEC4935EFFC4935EFFC2925EFEC1915EFEC0905DFEBF905DFEBE905DFF
            BD8F5DFFBA8D5DFEB78C5DFEB28758FEA67946FE96642BFF885217FF7E490EFE
            77440BFE6F3F0AFD693B09F8633708E55A3307AE4F2D07603E2206252E17000B
            0000000200000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000003F1F0008442206254728055957300898643808D16C3C0AF473410BFD
            7B470EFE835117FE92632CFEA57949FFB2895CFFB78E61FEBA9062FEBD9262FF
            BF9362FFBF9362FEC09362FEC19462FEC29462FEC39562FEC49562FEC59662FF
            C69762FFC69662FEC69663FEC79763FEC79763FEC99863FFC99963FFC89863FE
            C99863FEC99863FEC99863FECA9963FFCA9963FFC99863FEC99863FEC99863FE
            C99863FECA9963FFCB9963FFCA9863FEC99863FEC99863FEC99863FECA9963FF
            C99963FFC89863FEC89763FEC79763FEC79763FEC79763FFC79763FFC59663FE
            C49563FEC59663FFC49663FFC29463FEC19463FEC09363FEBF9263FEBF9362FF
            BD9262FFBA9062FEB78E61FEB1895BFEA47948FE93622BFF845016FF7B470DFE
            74420BFE6C3D09FB663A08F05D3408D457320898502E064C42210B1733000005
            0000000100000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000033330005351F00184125043E542F067B623607C06A3C08ED703F0BFC
            77440DFE7F4D14FE8F5F2AFFA27748FFB1895DFFB79064FFBB9366FFBD9467FF
            BF9567FFC09667FFC19667FEC29668FEC39768FEC49768FEC59968FFC69967FF
            C69967FFC79A68FFC79968FEC79968FEC99B68FFC99B68FFC99B68FFCA9B68FF
            C99A68FEC99A68FECA9C68FFCB9C68FFCB9C68FFCB9C68FFC99B68FEC99B68FE
            CB9C68FFCB9C68FFCB9C68FFCB9C68FFCA9B68FEC99B68FECA9B68FFCA9B68FF
            CA9B68FFC99B68FFC89A68FEC79A68FEC89A68FFC79A68FFC79A68FFC69968FF
            C69968FFC59968FFC59868FFC49868FFC29768FEC19668FEC19668FFBF9567FF
            BE9567FFBB9367FFB79065FEB0895EFEA37848FF90602AFF804D14FF77450CFF
            71400AFE6A3C09F9623608E4583208BB512E067D4C2C08394824000E00000001
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000022A15000C432806265330085F5E3607AA663A09E06B3E0AF6
            72410BFD7B4912FF8A5B26FF9E7344FFAD875BFFB69066FFBB956BFFBD976CFF
            BF986CFFC1996CFFC29A6CFFC39A6CFFC49B6CFFC59B6CFFC69B6CFFC69C6CFF
            C79C6CFFC89C6CFFC89D6CFFC89D6CFFC99D6DFFC99D6DFFCA9E6DFFCA9E6DFF
            CB9E6DFFCB9E6DFFCB9E6DFFCB9E6DFFCB9F6DFFCB9F6DFFCB9F6DFFCB9F6DFF
            CB9F6DFFCB9F6DFFCB9F6DFFCB9F6DFFCB9E6DFFCB9E6DFFCB9E6DFFCB9E6DFF
            CA9E6DFFCA9E6DFFC99D6DFFC99D6DFFC89D6DFFC89D6DFFC79C6DFFC79C6DFF
            C69C6DFFC69B6DFFC59B6DFFC49B6DFFC39A6DFFC29A6CFFC1996CFFC0986CFF
            BE976CFFBB956BFFB79268FFAF895EFFA07647FF8C5C28FF7C4A13FF74420BFF
            6D3E0AFE673909F45D3408D4512F069D4628055E3F260628381C000900000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000013F00000448240015532F07465832078D603607C9683A08EB
            6F3F0AFA774610FE855622FF986D3EFFA88256FFB38F66FFBA966EFFBE9970FF
            C09A71FFC19B71FFC29C71FFC49D71FFC59D71FFC59E71FFC69E71FFC79E71FF
            C79E71FFC89F71FFC89F71FFC99F71FFC99F71FFCAA071FFCAA071FFCBA071FF
            CBA071FFCBA071FFCBA071FFCBA171FFCBA171FFCBA171FFCBA171FFCBA171FF
            CBA171FFCBA171FFCBA171FFCBA171FFCBA171FFCBA071FFCBA071FFCBA071FF
            CBA071FFCAA071FFCAA071FFC99F71FFC99F71FFC89F71FFC89F71FFC79E71FF
            C79E71FFC69E71FFC59E71FFC49D71FFC39D71FFC29C71FFC19B71FFC09A71FF
            BE9971FFBB976FFFB59169FFAC865CFF9B7143FF875824FF784711FF70400BFE
            693C0AFA623808EB5A3408BF4E2D067C3F230740321E00193333000500000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000013F2A000C4A2A05304E2D076B593107A9623909D9
            6B3D0AF572420EFD7F501CFE906434FFA17A4EFFB08C64FFB99770FFBD9A74FF
            C09C75FFC19D75FFC29D75FEC39E75FEC49E75FEC59F75FEC6A075FFC7A075FF
            C8A175FFC8A175FFC8A076FEC8A076FECAA276FFCAA276FFCAA276FFCBA276FF
            CAA176FECAA276FECBA376FFCBA376FFCCA376FFCCA376FFCBA276FECBA276FE
            CCA376FFCCA376FFCCA376FFCBA376FFCAA276FECAA276FECBA376FFCBA276FF
            CBA276FFCAA276FFC9A176FEC9A176FEC9A176FFC9A176FFC8A175FFC8A175FF
            C7A075FFC6A075FFC5A075FFC59F75FFC39E75FEC19D75FEC19D75FFC09C75FF
            BE9B75FFBA9872FFB28E69FEA57F56FE956A3CFF825420FF74440FFF6C3C0AFC
            643809F35E3509DA583107A44D2C085C3C2106262A15000C0000000300000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000482400073D23081D43260748532E07845E3507C2
            673A08EB6F400CFA784916FD875A29FF997043FFAA865FFEB69571FEBD9C77FF
            BF9E79FFC09E79FEC29F79FEC3A079FEC4A079FEC5A179FEC6A179FEC7A379FF
            C8A379FFC8A27AFEC8A27AFEC9A37AFEC9A37AFECAA47AFFCBA47AFFCAA37AFE
            CAA37AFECAA47AFECBA47AFECCA57AFFCCA57AFFCBA47AFECBA47AFECBA47AFE
            CBA47AFECCA57AFFCCA57AFFCBA47AFECAA47AFECAA47AFECAA47AFECBA47AFF
            CBA47AFFCAA37AFEC9A37AFEC9A37AFEC9A37AFEC9A37AFFC8A37AFFC7A279FE
            C6A279FEC6A279FFC6A279FFC4A079FEC3A079FEC29F79FEC09E79FEC09E79FF
            BE9D79FFB89774FEAE8B66FE9E784DFE8C6232FE7C4E1BFF70410EFE683B09F9
            603608E5583208BE522F07824B2B07403F2600143F0000040000000100000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000550000033624000E4224062A4F2D07605C3407A5
            623809D96A3D0AF2734311FC7E501EFE906537FFA37F57FEB2916FFEBB9B79FF
            BF9F7CFFC0A07DFEC2A17DFEC3A17DFEC4A27DFEC5A37DFEC6A37DFEC8A57DFF
            C8A57DFFC8A47DFEC9A47DFEC9A57EFECAA57EFECBA67EFFCBA67EFFCAA57EFE
            CBA67EFECBA67EFECBA67EFECCA77EFFCCA77EFFCBA67EFECCA67EFECCA67EFE
            CCA67EFECDA77EFFCCA77EFFCBA67EFECBA67EFECBA67EFECBA67EFECCA77EFF
            CBA67EFFCAA57EFECAA57EFEC9A57EFEC9A57EFEC9A57EFFC9A57EFFC7A47DFE
            C6A47DFEC7A47DFFC6A47DFFC4A27DFEC3A17DFEC2A17DFEC0A07DFEBFA07DFF
            BD9E7BFFB69775FEA98661FE956E43FE835827FE764815FE6C3D0CFC643909F1
            5D3408D0532E08994829085C3F2606283319000A000000010000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000001330000053C240015502C083F5630087F
            5E3509BA65390AE26C3E0DF8764815FE865B2BFF9A744AFFAC8A66FFB79876FF
            BE9F7EFFC1A280FFC1A27FFEC3A380FEC4A480FEC5A480FEC7A681FFC8A681FF
            C9A781FFC9A781FFC9A680FEC9A680FECBA881FFCBA881FFCBA881FFCCA881FF
            CBA880FECBA880FECCA981FFCCA981FFCDA981FFCDA981FFCCA880FECCA880FE
            CDA981FFCDA981FFCDA981FFCCA981FFCBA880FECBA880FECCA981FFCCA981FF
            CCA881FFCBA881FFCAA780FEC9A780FECAA781FFCAA781FFC9A781FFC8A781FF
            C8A681FFC7A681FFC6A581FFC5A581FFC3A380FEC2A27FFEC1A280FFBFA07FFF
            BB9D7CFFB39371FFA27F58FE8C6437FE7B4E1DFE6E4110FD663B0BF6603709E1
            573208B24C2A06713E2304392E22001633330005000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000013319000A442906254B2A0655
            56310891603608C9683C0AED6F4210FB7C5020FE8E6639FFA17E56FFB1926FFF
            BB9E7EFFC0A383FFC2A584FFC4A684FFC5A684FFC6A784FFC7A784FFC8A884FF
            C9A884FFC9A984FFCAA984FFCBA984FFCBA984FFCBA984FFCCAA84FFCCAA84FF
            CCAA84FFCCAA84FFCDAA84FFCDAA84FFCDAA84FFCDAA84FFCDAA84FFCDAA84FF
            CDAA84FFCDAA84FFCDAA84FFCDAA84FFCDAA84FFCCAA84FFCCAA84FFCCAA84FF
            CCAA84FFCBAA84FFCBA984FFCBA984FFCAA984FFCAA984FFC9A984FFC9A884FF
            C8A884FFC7A784FFC6A784FFC5A684FFC4A684FFC3A584FFC1A383FFBEA081FF
            B79978FFAB8B67FF99744BFF82592BFE734615FE6A3D0CF9623809E75A3207C5
            532F078D492B064C3B22081E381C000900000002000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000003F000004351A00133E240531
            502D07665B3409A5613809D66A3D0CF0734716FB815728FE946E43FFA78661FF
            B59877FFBDA182FFC1A586FFC4A787FFC5A887FFC6A887FFC7A987FFC8A987FF
            C9AA87FFCAAA87FFCAAB87FFCBAB87FFCBAB87FFCCAB87FFCCAB87FFCCAC87FF
            CCAC87FFCDAC87FFCDAC87FFCDAC87FFCDAC87FFCDAC87FFCDAC87FFCDAC87FF
            CDAC87FFCDAC87FFCDAC87FFCDAC87FFCDAC87FFCCAC87FFCCAC87FFCCAC87FF
            CCAC87FFCCAB87FFCBAB87FFCBAB87FFCBAB87FFCAAB87FFCAAA87FFC9AA87FF
            C8A987FFC7A987FFC6A887FFC5A887FFC4A787FFC2A686FFC0A485FFBB9F80FF
            B09271FFA07D57FF8C653AFF7A4F20FE6B4010FB643809EF5D3408D05430089D
            4E2C07624927052D3A27000D0000000200000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000002242400073F1F0018
            472B0740522E08795A3308B164390ADB6B3F0EF476491AFC855D30FE9A764EFF
            AB8C69FFB89B7CFFBEA385FEC2A688FEC4A889FEC5A989FEC7AA8AFFC8AB8AFF
            C9AB8AFFC9AC8AFFC9AB89FECAAB89FECBAC8AFFCCAD8AFFCCAD8AFFCCAD8AFF
            CBAC89FECCAC89FECDAD8AFFCDAD8AFFCDAD8AFFCDAD8AFFCCAC89FECCAC89FE
            CDAD8AFFCDAD8AFFCDAD8AFFCDAD8AFFCCAC89FECCAC89FECCAD8AFFCCAD8AFF
            CCAD8AFFCCAD8AFFCAAC89FECAAB89FECBAC8AFFCAAC8AFFCAAC8AFFC9AB8AFF
            C8AB8AFFC7AA8AFFC6AA8AFFC5A98AFFC2A789FEC0A587FEBDA284FFB5997AFF
            A68663FF906D44FE7E5528FE6F4516FB663B0BF25F3509DB583207AD512E066E
            4828093845220B16333300050000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000023319000A
            43250722492B064C553007835E3509BA64390BE16C400FF4794E1FFC896338FE
            9D7A54FFAC8E6DFEB89D7FFEBFA587FEC3A88BFEC4AA8CFEC5AA8CFEC7AC8DFF
            C8AD8DFFC8AC8CFEC9AC8CFECAAD8CFECAAD8CFECCAE8DFFCCAE8DFFCBAD8CFE
            CBAE8CFECCAE8CFECCAE8CFECDAF8DFFCDAF8DFFCCAE8CFECCAE8CFECCAE8CFE
            CCAE8CFECDAF8DFFCDAF8DFFCCAE8CFECCAE8CFECCAE8CFECBAE8CFECCAF8DFF
            CCAE8DFFCBAD8CFECBAD8CFECAAD8CFECAAC8CFECAAD8DFFC9AD8DFFC8AC8CFE
            C7AB8CFEC7AB8DFFC6AB8DFFC3A98CFEC1A78BFEBEA487FEB69B7EFEAA8C6BFF
            98754FFF825C30FE734719FC683D0EF460380ADD593208B6522E087F4B290744
            3A27091A1F1F0008000000020000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000055000003
            3A27000D49280626522E09535832078D5F3609C0663B0CE36F4212F57A5022FD
            8A653AFE9E7D58FEAE9071FEB99E80FEC0A68AFEC3A98DFEC5AB8EFEC7AD90FF
            C8AE90FFC8AD8FFEC9AE8FFEC9AE8FFECAAE8FFECCAF90FFCCAF90FFCBAF8FFE
            CBAF8FFECCAF8FFECCAF8FFECDB090FFCDB090FFCCAF8FFECCAF8FFECCAF8FFE
            CCAF8FFECDB090FFCDB090FFCCAF8FFECCAF8FFECCAF8FFECBAF8FFECCB090FF
            CCB090FFCBAE8FFECBAE8FFECAAE8FFEC9AE8FFECAAE90FFC9AE90FFC7AD8FFE
            C6AC8EFEC6AC8FFFC5AB8FFFC2A98DFEBFA589FEB89E81FEAB8E6FFE9A7954FF
            866137FE764C1FFC693F10F463390BE25B3509BB53300784482B064D41240723
            2E17000B00000002000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000001
            550000034824000E4D2F052B542F085B593208915F370AC1663B0CE36E4213F5
            7B5124FD8C673DFE9E7D58FEAD8F70FEB89D80FEBFA68AFEC4AB90FFC6AD92FF
            C7AE92FFC8AF92FFC8AE91FEC9AF91FECBB092FFCBB092FFCBB092FFCCB092FF
            CBB091FECBB091FECDB192FFCDB192FFCDB193FFCDB193FFCCB092FECCB092FE
            CDB193FFCDB193FFCDB192FFCDB192FFCCB091FECBB091FECCB192FFCCB192FF
            CCB092FFCBB092FFCAAF91FECAAF91FECAAF92FFC9AF92FFC8AF92FFC7AE92FF
            C6AE92FFC5AD91FFC3AB90FFC0A78CFFB89E81FEAC8F71FE9B7B57FE87633AFE
            774E22FC6A4113F462390CE15C3409BE5631078B4C2B06533A2006273322000F
            3F00000400000001000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000003F3F00044B2D00114F2D052D5430085A593208925E350AC2663B0DE3
            6F4314F57B5125FC8A653BFE9C7A55FFAC8E6EFFB89D80FFC0A78BFFC4AC90FF
            C6AE93FFC7AF94FFC8B094FFC9B094FFCAB094FFCAB194FFCBB194FFCBB194FF
            CBB194FFCCB294FFCCB294FFCDB294FFCDB294FFCDB294FFCDB294FFCDB294FF
            CDB294FFCDB294FFCDB294FFCDB294FFCDB294FFCCB294FFCCB294FFCCB194FF
            CBB194FFCBB194FFCAB194FFCAB094FFC9B094FFC8B094FFC8AF94FFC7AF94FF
            C5AE93FFC3AB91FFBFA78CFFB99F83FFAC9070FF9A7A56FE87643BFE775023FB
            6B4214F4643A0DE25C3409BE5430078A4D2C05564123052B2F1F001033000005
            0000000100000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000013F3F00045533000F4F2D052D532F085C5731088F5E3509BD
            63390CDE6C4214F2785022FB876239FE977651FEA78968FFB4987AFFBDA388FF
            C2AA90FFC6AE94FFC7B096FFC8B096FFC9B196FFC9B196FFCAB196FFCAB296FF
            CBB296FFCBB296FFCCB296FFCCB396FFCCB396FFCCB396FFCCB396FFCCB396FF
            CCB396FFCCB396FFCCB396FFCCB396FFCCB396FFCCB396FFCCB296FFCBB296FF
            CBB296FFCAB296FFCAB196FFC9B196FFC8B196FFC8B096FFC7B096FFC5AE95FF
            C2AB91FFBDA58AFFB59B7EFFA98C6CFF997854FF876139FD774E22FA6B4115F0
            62390CDC5C3409B95631098A4B2A06553B23052B381C00123300000500000001
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000003F3F00044B2D0F11512E052C512D0955542F0787
            5B3408B562390BD96B4214EF754C1FF9825C30FC906E46FE9F805EFEAF9374FF
            B9A084FFC0A88DFFC3AB92FEC5AD94FEC7B096FFC8B197FFC9B298FFCAB298FF
            C9B297FECAB297FECBB398FFCBB399FFCBB399FFCBB399FFCAB398FECAB398FE
            CBB499FFCBB499FFCBB499FFCBB499FFCAB298FECAB298FECBB399FFCBB398FF
            CAB298FFC9B298FFC8B097FEC7B096FEC7B097FFC5AF96FFC3AD94FFC0A990FF
            BAA287FFB09678FFA38564FF92714BFE825D33FC744D21F7694014EC623A0DD7
            5A350AB1552F07804C2C06504224062A2D1E00112A0000060000000100000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000013F3F00044824000E462606284C290650
            522E087E5B3409AA61380CCE693F11E671481BF47C5529FB8A663DFE997854FF
            A78968FFB09477FEB79E82FEBDA58BFEC2AB91FEC6AF96FFC8B198FFC8B198FE
            C8B299FEC9B299FEC9B299FECAB39AFFCAB39AFFC9B399FEC9B399FEC9B399FE
            C9B399FECAB49AFFCAB49AFFC9B399FEC9B399FEC9B299FEC9B299FECAB39AFF
            C9B39AFFC7B199FEC6B098FEC5AF96FEC2AC93FEBFA88FFFBAA287FFB1987CFE
            A78B6DFE9B7C5AFE8C6A43FE7C572CFB70481CF3653E12E25F360BC95A340AA6
            543008794C2906493F2307243322000F33000005000000010000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000550000034824000E462A0724
            4B290744502C076C57320A9860380EC1683F12DE704518EE774F23F7815B30FC
            8C6941FE987854FEA48666FEAF9476FEB79E82FEBEA78CFFC2AB92FFC3AD94FE
            C5AE95FEC6B097FEC7B198FEC8B29AFFC9B39AFFC8B299FEC8B29AFEC8B39AFE
            C8B39AFEC9B49BFFC9B39BFFC8B29AFEC8B299FEC8B199FEC7B198FEC7B199FF
            C6B098FFC3AD95FEC1AB92FEBEA78EFEB9A187FEB3997DFFA98D6EFF9B7D5BFE
            8F6C47FD835E35FB764F25F76D4318EE643B10DB5B350ABB54300893512F0767
            4C2C083F3F2707202713000D0000000400000001000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000155000003452E000B
            3825091B402509374F2E0A5D5B360D88643C11AD684014CA6C4315E0704719F0
            784E22FA825B32FD8D6A43FE987854FEA28463FEAB8F6FFFB19779FFB69D80FF
            BAA186FEBEA68CFEC1AB91FFC3AD94FFC5AF96FFC6B098FFC5B098FEC6B199FE
            C7B29AFFC7B29AFFC7B199FFC6B198FFC4AF96FEC3AD94FEC2AC93FFC0A990FF
            BDA58BFFB8A085FFB2987DFEAC9175FEA5886AFE9D7E5CFF90704BFE856039FD
            795228F86E451AEE663E12DE60380CC759330AA8522F09824D2A085947280532
            42210B17381C0009000000030000000100000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000002
            381C000939220B1647290B2B59351147613F186967411A8F674218B4683F13D4
            6B4113E871471CF2795025F67F582EFA876339FC8F6D46FE987752FFA0815EFF
            A78A6AFFAE9375FFB49A7EFFB89F84FFBAA388FFBCA68BFFBEA88EFFBFA990FF
            BFA990FFBFA990FFBFA88FFFBDA68DFFBCA48AFFB9A187FFB69D82FFB2987BFF
            AB9071FFA48666FF9A7B59FE92714CFE89673FFC815C35FA7A532AF6714A1EF0
            694016E460390ED059330BB1522F098B4E2A0765482907434727062743280013
            2A2A000600000002000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000002333300053F2A150C513214195D4324316846245366441D78653D139A
            673D12B66A4015CA6D4317DB6E4418E972491CF3795024FA80582FFD86633AFE
            8E6D46FE957652FE9B7D5BFEA18362FFA48767FFA78B6BFFA98E6EFFAA8F71FF
            AB9072FFAB9071FFAA8E70FFA88C6DFFA5886AFEA28465FE9E805FFE9A7A57FF
            92724DFE8A6842FE835D35FD7A5329F9744C21F26F471CE76A4217D9633D11C8
            5D360CB158320A96522E0873472A064E3C21052E3F1F0A18452E000B3F3F0004
            0000000100000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000001000000024824240763462A1265482B2364441F38613E1951
            66411C6D6A451D8B69431BA9663F13C4673E10D86B4113E66F4518EE724A1DF2
            775024F47B542AF67F5A31F8825E36FA86623AFB89653EFB8A6841FC8B6A43FC
            8C6B44FC8C6B44FC8B6A42FC8B6641FB87643EFA85613AF9805C34F87D582EF6
            785328F5734C21F26F481BED6A4217E5684115D6674216C0643F17A55A381287
            54300C694F2E094D4C2B09353F2707202F1F0010242400070000000200000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000013F3F3F045F3F1F085F3F2F105B3F241C
            684E2E316D4F2E4D6948246A653F1585613A0E9D61380DAF623A0DBD613A0DC9
            633B0FD2643C11DA683F14E16B4318E76D461BEB70481DEE714A1FF1714B20F2
            734B21F3724B21F2724B20F170491FEE6F471DEA6C4519E5674016E0653E12D9
            623B11D1613A0FC7613A0EBC61390DAD633B129A6440198261411E6653371849
            462B102F4225091B4824000E482400073F000004000000010000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000015555550348484807
            695A3C116A52391F694D262E643E193D5B370D4E57320A6052300B73512D0786
            512D0897522F07A6563109B45C350CBF5F380CC860380ECF603A0FD3603B10D6
            623B10D7613B10D6603B0FD3603A10CE5D380EC75A340DBD57330BB2532F09A5
            502E08955130098453310B7156330A5E5D39104C613F193C5C3F222C4F341A1D
            3F2F0F1024240007000000020000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000017F7F0002
            7F3F3F046D484807664C330A5544110F4A350A1844290D25422509363F230748
            41250559472704684C2B0675532F07815631098A5831089057330A9558320A98
            58320A9857320A9757330A9457310A8F54300988502E087F4B2A067346280766
            4326085742280B45442C0E34482B0E234D3716175544220F664C190A552A2A06
            5500000300000001000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000007F000002333300052A2A150C30240C153322081E
            391F06283F250530482804384E2D083E532D0743532F074653300649542F064B
            542F064B5630064A532D0649532F0746512E07424B29043D452904374125052F
            3A2006273423081D33260C142E2E170B33330005000000020000000100000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000001550000032A2A0006381C0009
            3F2A000C3624000E4B2D001150280D1359330C1454300C15512E0B16512E0B16
            582C0B17512E0B16512E0B1654300C154C330C14462A00123F1F00103624000E
            3F2A000C381C00092A2A00065500000300000001000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000001FFFFFFFFFFFFFFFFE00000000FFFFFFFF
            FFFFFFF0000000001FFFFFFFFFFFFFE00000000007FFFFFFFFFFFF8000000000
            03FFFFFFFFFFFF800000000001FFFFFFFFFFFF000000000001FFFFFFFFFFFF00
            0000000000FFFFFFFFFFFE000000000000FFFFFFFFFFFE000000000000FFFFFF
            FFFFFE000000000000FFFFFFFFFFFE000000000000FFFFFFFFFFFC0000000000
            007FFFFFFFFFFC0000000000007FFFFFFFFFF80000000000003FFFFFFFFFF000
            00000000001FFFFFFFFFE00000000000001FFFFFFFFFE00000000000000FFFFF
            FFFFC000000000000007FFFFFFFF8000000000000003FFFFFFFF000000000000
            0003FFFFFFFF0000000000000001FFFFFFFE0000000000000000FFFFFFFC0000
            000000000000FFFFFFFC00000000000000007FFFFFF800000000000000003FFF
            FFF800000000000000003FFFFFF000000000000000001FFFFFF0000000000000
            00001FFFFFF000000000000000000FFFFFE000000000000000000FFFFFE00000
            0000000000000FFFFFC000000000000000000FFFFFC0000000000000000007FF
            FFC0000000000000000007FFFFC0000000000000000007FFFF80000000000000
            000003FFFF80000000000000000003FFFF80000000000000000003FFFF800000
            00000000000003FFFF80000000000000000003FFFF80000000000000000003FF
            FF80000000000000000003FFFF80000000000000000003FFFF80000000000000
            000003FFFF80000000000000000003FFFF80000000000000000003FFFF800000
            00000000000003FFFF80000000000000000003FFFF80000000000000000003FF
            FF80000000000000000003FFFF80000000000000000003FFFFC0000000000000
            000007FFFFC0000000000000000007FFFFC0000000000000000007FFFFC00000
            0000000000000FFFFFE000000000000000000FFFFFE000000000000000000FFF
            FFF000000000000000001FFFFFF000000000000000001FFFFFF0000000000000
            00003FFFFFF800000000000000003FFFFFF800000000000000003FFFFFFC0000
            0000000000007FFFFFFE0000000000000000FFFFFFFE0000000000000000FFFF
            FFFF0000000000000001FFFFFFFF8000000000000003FFFFFFFF800000000000
            0007FFFFFFFFC000000000000007FFFFFFFFE00000000000000FFFFFFFFFF000
            00000000001FFFFFFFFFF80000000000003FFFFFFFFFFC0000000000007FFFFF
            FFFFFF000000000001FFFFFFFFFFFF800000000003FFFFFFFFFFFFC000000000
            07FFFFFFFFFFFFF0000000001FFFFFFFFFFFFFFC000000007FFFFFFFFFFFFFFF
            00000001FFFFFFFFFFFFFFFFC0000007FFFFFFFFFFFFFFFFFC00007FFFFFFFFF
            FFFFFFFFFFC00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF}
        end
      end
    end
  end
  object btnConnectAll: TButton
    Left = 8
    Top = 363
    Width = 81
    Height = 25
    Hint = 'Connect to all enabled hubs/IRCs'
    Anchors = [akLeft, akBottom]
    Caption = 'Connect &All'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object cbAutoConnect: TCheckBox
    Left = 104
    Top = 368
    Width = 97
    Height = 17
    Hint = 
      'If checked, bot will try to automatically reconnect to hubs/ircs' +
      ' if disconnected.'
    Anchors = [akLeft, akBottom]
    Caption = 'Auto &reconnect'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = cbAutoConnectClick
  end
  object cbStartupConnect: TCheckBox
    Left = 208
    Top = 368
    Width = 113
    Height = 17
    Hint = 
      'If checked, all enabled hubs/IRCs will connect when the program ' +
      'starts'
    Anchors = [akLeft, akBottom]
    Caption = 'Connect at &startup'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object btnUpdateCheck: TButton
    Left = 432
    Top = 363
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Check for Updates'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnUpdateCheckClick
  end
  object ilOnOffIcons: TImageList
    Left = 408
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F7FFCACACAFFADADADFFAEAEAEFFC7C7C7FFF5F5F5FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0F0F000A3A3A3007E7E7E00808080009E9E9E00ECECEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0F0F000A3A3A3007E7E7E00808080009E9E9E00ECECEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0F0F000A3A3A3007E7E7E00808080009E9E9E00ECECEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009F9F9FFFB3B3B3FFE3E3E3FFD5D5D5FFD5D5D5FFE2E2E2FFB3B3B3FFA0A0
      A0FF000000000000000000000000000000000000000000000000000000000000
      000066666600ADACAC00E7E3E300D7D5D500D8D4D400E5E0E000AEACAC006868
      6800000000000000000000000000000000000000000000000000000000000000
      000066666600ADACAC00E7E3E300D7D5D500D8D4D400E5E0E000AEACAC006868
      6800000000000000000000000000000000000000000000000000000000000000
      000066666600ADACAC00E7E3E300D7D5D500D8D4D400E5E0E000AEACAC006868
      6800000000000000000000000000000000000000000000000000000000008E8E
      8EFFEBEBEBFFA5A5A5FF969696FFA6A6A6FFA5A5A5FF8E8E8EFFA2A2A2FFE8E8
      E8FF898989FF0000000000000000000000000000000000000000000000006161
      6100EEEAEA008D8EAA0055599E005B60B9005B60B90055599E008D8EAA00EBE7
      E7005A5A5A000000000000000000000000000000000000000000000000006161
      6100EEEAEA008D99AA0055759E005B84B9005B84B90055759E008D99AA00EBE7
      E7005A5A5A000000000000000000000000000000000000000000000000006161
      6100EEEAEA008DAA9000559E5C005BB964005BB96400559E5C008DAA9000EBE7
      E7005A5A5A000000000000000000000000000000000000000000A0A0A0FFEBEB
      EBFF828282FFB6B6B6FFE1E1E1FFE1E1E1FFE0E0E0FFDCDCDCFFB5B5B5FF8282
      82FFE7E7E7FFA0A0A0FF0000000000000000000000000000000068686800F0EB
      EB0050538C00555BCB00787EF1007F85FA007F85FA00787EF100555BCB005053
      8C00EAE6E600686868000000000000000000000000000000000068686800F0EB
      EB00506A8C005588CB0078ACF1007FB4FA007FB4FA0078ACF1005588CB00506A
      8C00EAE6E600686868000000000000000000000000000000000068686800F0EB
      EB00508C560055CB610078F184007FFA8B007FFA8B0078F1840055CB6100508C
      5600EAE6E60068686800000000000000000000000000F5F5F5FFAFAFAFFF9999
      99FFA1A1A1FFDFDFDFFFECECECFFEBEBEBFFDDDDDDFFD7D7D7FFD8D8D8FF9C9C
      9CFF979797FFA6A6A6FFF5F5F5FF0000000000000000ECECEC00AAA8A800797B
      9E001B22B7004C55F800535CFE00535CFE00535CFE00535CFE004C55F8001B22
      B700797B9E009F9D9D00ECECEC000000000000000000ECECEC00AAA8A8007989
      9E001B5EB7004C97F800539EFE00539EFE00539EFE00539EFE004C97F8001B5E
      B70079899E009F9D9D00ECECEC000000000000000000ECECEC00AAA8A800799E
      7D001BB72B004CF85D0053FE640053FE640053FE640053FE64004CF85D001BB7
      2B00799E7D009F9D9D00ECECEC000000000000000000C3C3C3FFE7E7E7FF6C6C
      6CFFB8B8B8FFDADADAFFE8E8E8FFDFDFDFFFCFCFCFFFD0D0D0FFDEDEDEFFCFCF
      CFFF6D6D6DFFE0E0E0FFC3C3C3FF000000000000000097979700ECE6E6000C12
      7D000A15E5001F2BFF00242FFF002832FF002832FF00242FFF001F2BFF000A15
      E5000D137D00E5E0E00097979700000000000000000097979700ECE6E6000C3D
      7D000A69E5001F81FF002483FF002884FF002884FF002483FF001F81FF000A69
      E5000D3E7D00E5E0E00097979700000000000000000097979700ECE6E6000C7D
      17000AE520001FFF350024FF3A0028FF3E0028FF3E0024FF3A001FFF35000AE5
      20000D7D1800E5E0E000979797000000000000000000A8A8A8FFD8D8D8FF7373
      73FFC2C2C2FFCBCBCBFFD9D9D9FFCBCBCBFFD3D3D3FFDADADAFFE7E7E7FFE3E3
      E3FF7B7B7BFFD8D8D8FFA6A6A6FF000000000000000076767600DDD7D7000008
      9000000DF4000D19FE002631FF002631FF002631FF002631FF000D19FE00000D
      F40000089000DCD7D70073737300000000000000000076767600DDD7D700003F
      9000006BF4000D75FE002684FF002684FF002684FF002684FF000D75FE00006B
      F400003F9000DCD7D70073737300000000000000000076767600DDD7D7000090
      0E0000F418000DFE250026FF3C0026FF3C0026FF3C0026FF3C000DFE250000F4
      180000900E00DCD7D700737373000000000000000000A8A8A8FFD8D8D8FF6F6F
      6FFFCDCDCDFFDADADAFFD7D7D7FFD2D2D2FFDBDBDBFFE1E1E1FFE8E8E8FFDEDE
      DEFF7C7C7CFFD7D7D7FFA6A6A6FF000000000000000076767600DCD7D7000008
      9000000DF400454EFE004952FF004952FF004952FF004952FF00454EFE00000D
      F40000089000DDD7D70073737300000000000000000076767600DCD7D700003F
      9000006BF4004595FE004998FF004998FF004998FF004998FF004595FE00006B
      F400003F9000DDD7D70073737300000000000000000076767600DCD7D7000090
      0E0000F4180045FE580049FF5B0049FF5B0049FF5B0049FF5B0045FE580000F4
      180000900E00DDD7D700737373000000000000000000C9C9C9FFE6E6E6FF6464
      64FFC8C8C8FFECECECFFE2E2E2FFEAEAEAFFDEDEDEFFE5E5E5FFE4E4E4FFBFBF
      BFFF6C6C6CFFE7E7E7FFC9C9C9FF0000000000000000A1A1A100EBE5E5000B11
      7C000813E4008086FF007A81FF007A81FF007A81FF007A81FF008086FF000813
      E4000B117C00ECE6E600A1A1A1000000000000000000A1A1A100EBE5E5000B3C
      7C000867E40080B7FF007AB4FF007AB4FF007AB4FF007AB4FF0080B7FF000867
      E4000B3C7C00ECE6E600A1A1A1000000000000000000A1A1A100EBE5E5000B7C
      160008E41E0080FF8D007AFF87007AFF87007AFF87007AFF870080FF8D0008E4
      1E000B7C1600ECE6E600A1A1A1000000000000000000F6F6F6FFADADADFF9595
      95FF929292FFF6F6F6FFEEEEEEFFECECECFFEEEEEEFFEDEDEDFFEBEBEBFF8D8D
      8DFF959595FFB0B0B0FFF6F6F6FF0000000000000000EEEEEE00A7A5A5007779
      9C000009AD00AEB2FE00AAAEFE00AAAEFE00AAAEFE00AAAEFE00AEB2FE000009
      AD0076789C00AAA8A800EEEEEE000000000000000000EEEEEE00A7A5A5007787
      9C00004BAD00AED1FE00AACEFE00AACEFE00AACEFE00AACEFE00AED1FE00004B
      AD0076879C00AAA8A800EEEEEE000000000000000000EEEEEE00A7A5A500779C
      7B0000AD1100AEFEB600AAFEB200AAFEB200AAFEB200AAFEB200AEFEB60000AD
      1100769C7A00AAA8A800EEEEEE00000000000000000000000000A1A1A1FFF0F0
      F0FF6E6E6EFFB4B4B4FFFDFDFDFFF7F7F7FFF9F9F9FFFEFEFEFFB1B1B1FF6D6D
      6DFFF4F4F4FFA1A1A1FF000000000000000000000000000000006A6A6A00F5EF
      EF0030337C00595EC400E3E4FF00DADCFF00DADCFF00E3E4FF00595EC4003033
      7C00F8F2F2006A6A6A00000000000000000000000000000000006A6A6A00F5EF
      EF0030507C005987C400E3EFFF00DAEAFF00DAEAFF00E3EFFF005987C4003050
      7C00F8F2F2006A6A6A00000000000000000000000000000000006A6A6A00F5EF
      EF00307C380059C46400E3FFE600DAFFDE00DAFFDE00E3FFE60059C46400307C
      3800F8F2F2006A6A6A0000000000000000000000000000000000000000009393
      93FFF4F4F4FF909090FF8E8E8EFFC7C7C7FFC9C9C9FF959595FF939393FFF5F5
      F5FF929292FF0000000000000000000000000000000000000000000000006868
      6800F8F2F2006E7098005A5D9B00A6A8D000A6A8D0005A5D9B006E709800FAF4
      F400666666000000000000000000000000000000000000000000000000006868
      6800F8F2F2006E8098005A769B00A6B8D000A6B8D0005A769B006E809800FAF4
      F400666666000000000000000000000000000000000000000000000000006868
      6800F8F2F2006E9872005A9B6100A6D0AA00A6D0AA005A9B61006E987200FAF4
      F400666666000000000000000000000000000000000000000000000000000000
      0000A4A4A4FFC1C1C1FFF1F1F1FFD2D2D2FFD2D2D2FFF3F3F3FFC5C5C5FFA3A3
      A3FF000000000000000000000000000000000000000000000000000000000000
      00006E6E6E00BDBBBB00F4F1F100D3D2D200D3D2D200F6F3F300C1C0C0006D6D
      6D00000000000000000000000000000000000000000000000000000000000000
      00006E6E6E00BDBBBB00F4F1F100D3D2D200D3D2D200F6F3F300C1C0C0006D6D
      6D00000000000000000000000000000000000000000000000000000000000000
      00006E6E6E00BDBBBB00F4F1F100D3D2D200D3D2D200F6F3F300C1C0C0006D6D
      6D00000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F7FFCACACAFFB5B5B5FFB5B5B5FFC6C6C6FFF5F5F5FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0F0F000A3A3A3008B8B8B008B8B8B009C9C9C00ECECEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0F0F000A3A3A3008B8B8B008B8B8B009C9C9C00ECECEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0F0F000A3A3A3008B8B8B008B8B8B009C9C9C00ECECEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFF81FF81FF81FF81F
      F00FF00FF00FF00FE007E007E007E007C003C003C003C0038001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001C003C003C003C003E007E007E007E007F00FF00FF00FF00F
      F81FF81FF81FF81FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object TimerPoll: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = AutoConTimerActivate
    Left = 440
  end
  object pmConnDisconn: TPopupMenu
    OnPopup = pmConnDisconnPopup
    Left = 472
    object Connect1: TMenuItem
      Caption = 'Connect'
      OnClick = Connect1Click
    end
    object Disconnect1: TMenuItem
      Caption = 'Disconnect'
      OnClick = Disconnect1Click
    end
  end
  object InitTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = InitForm
    Left = 504
  end
end
