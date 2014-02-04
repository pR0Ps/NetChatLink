////////////////////////////////////////////////////////////////////////////////
//
// Project name: NetChatLink
// Author: pR0Ps
// E-mail: pR0Ps.CM@gmail.com
// Date: 06/05/2011
// Target:	Win32, Delphi 7
// License: GNU GPL 3
//
// Description:
//
//   A small application that links chats across multiple DC hubs and IRC
//   channels. Based heavily on MyIrcDcLinks by Burek
//   (http://myircdclinks.sourceforge.net/). Includes support for the ADC
//   protocol, chat filtering, anti-flood control, op commands, and more.
//
////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------
unit NCL_Main;
//------------------------------------------------------------------------------
interface
//------------------------------------------------------------------------------
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Sockets, ImgList, ExtCtrls, ScktComp, NCL_DC, NCL_IRC,
  NCL_IRCDCBase, Menus, IniFiles, ShellAPI, Spin, CustomClasses;
//------------------------------------------------------------------------------
type
  TMainForm = class(TForm)
    PageControl1: TPageControl;
    tsHubs: TTabSheet;
    tsIrcs: TTabSheet;
    lvIrcs: TListView;
    lblIrcHost: TLabel;
    edIrcHostPort: TEdit;
    edIrcNick: TEdit;
    lblIrcNick: TLabel;
    lblIrcPass: TLabel;
    edIrcPass: TEdit;
    lblIrcIdent: TLabel;
    edIrcIdent: TEdit;
    lblIrcChannels: TLabel;
    edIrcChannels: TEdit;
    btnIrcAddUpdate: TButton;
    lblHubHostPort: TLabel;
    edHubHostPort: TEdit;
    edHubNick: TEdit;
    lblHubNick: TLabel;
    lblHubPass: TLabel;
    edHubPass: TEdit;
    lblHubShare: TLabel;
    edHubShare: TEdit;
    edHubSlots: TEdit;
    lblHubSlots: TLabel;
    lblHubClient: TLabel;
    edHubClient: TEdit;
    btnHubAddUpdate: TButton;
    lvHubs: TListView;
    ilOnOffIcons: TImageList;
    TimerPoll: TTimer;
    InitTimer: TTimer;
    btnConnectAll: TButton;
    tsWords: TTabSheet;
    cbHubEnabled: TCheckBox;
    cbIrcEnabled: TCheckBox;
    lblHubPrefix: TLabel;
    edHubPrefix: TEdit;
    lblIrcPrefix: TLabel;
    edIrcPrefix: TEdit;
    btnHubDelete: TButton;
    btnIrcDelete: TButton;
    pmConnDisconn: TPopupMenu;
    Connect1: TMenuItem;
    Disconnect1: TMenuItem;
    cbAutoConnect: TCheckBox;
    tsDebug: TTabSheet;
    mmDebug: TMemo;
    lblHubName: TLabel;
    edHubName: TEdit;
    edIrcName: TEdit;
    lblIrcName: TLabel;
    gbHubMode: TGroupBox;
    gbHubBroadcast: TGroupBox;
    gbIrcBroadcast: TGroupBox;
    tsAbout: TTabSheet;
    pnlAbout: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lblLink1: TLabel;
    lblAbout1: TLabel;
    lblAbout2: TLabel;
    lblLink2: TLabel;
    lblLicense: TLabel;
    Image1: TImage;
    lblHubPostRate: TLabel;
    spnHubMsgRate: TSpinEdit;
    rbHubNMDC: TRadioButton;
    rbHubADC: TRadioButton;
    cbHubBcFrom: TCheckBox;
    cbHubBcTo: TCheckBox;
    cbIrcBcFrom: TCheckBox;
    cbIrcBcTo: TCheckBox;
    lblIrcPostRate: TLabel;
    spnIrcMsgRate: TSpinEdit;
    lblHubPMRate: TLabel;
    spnHubPMRate: TSpinEdit;
    lblIrcPMRate: TLabel;
    spnIrcPMRate: TSpinEdit;
    btnDebugSave: TButton;
    btnHubUserControl: TButton;
    btnIrcUserControl: TButton;
    cbStartupConnect: TCheckBox;
    btnIrcScripting: TButton;
    mmFilterWords: TMemo;
    btnFilterWordsSAve: TButton;
    btnFilterWordsReload: TButton;
    btnUpdateCheck: TButton;
    cbHubJP: TCheckBox;
    cbIrcJP: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvHubsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvIrcsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure AutoConTimerActivate(Sender: TObject);
    procedure InitForm(Sender: TObject);
    procedure btnConnectAllClick(Sender: TObject);
    procedure btnHubAddUpdateClick(Sender: TObject);
    procedure btnIrcAddUpdateClick(Sender: TObject);
    procedure btnHubDeleteClick(Sender: TObject);
    procedure btnIrcDeleteClick(Sender: TObject);
    procedure pmConnDisconnPopup(Sender: TObject);
    procedure Connect1Click(Sender: TObject);
    procedure Disconnect1Click(Sender: TObject);
    procedure btnFilterWordsSaveClick(Sender: TObject);
    procedure btnFilterWordsReloadClick(Sender: TObject);
    procedure cbAutoConnectClick(Sender: TObject);
    procedure lblLinkClick(Sender: TObject);
    procedure btnUserControlClick(Sender: TObject);
    procedure btnIrcScriptingClick(Sender: TObject);
    procedure btnUpdateCheckClick(Sender: TObject);
    procedure btnDebugSaveClick(Sender: TObject);
  private
    Hubs: THubsList;
    Ircs: TIrcsList;
    FilteredWords: TStringList;
    CheckUpdates : boolean;
    procedure LoadConfig;
    procedure LoadData(dataFile: string);
    procedure LoadXMLData(dataFile: string);
    procedure SaveXMLData(dataFile: string);
    procedure ConnectAll;
    procedure UpdateDisplayHubs;
    procedure UpdateDisplayIrcs;
    procedure SaveDebug();
  public
    PID : string;
    procedure Broadcast(Origin: Pointer; Prefix, ANick: string; Msg: WideString; MsgFormat: string);
    procedure RefreshItem(Origin: Pointer);
    procedure SendToDebug(From, Msg: string);
    function GetCurrentConnection: TIrcHubBase;
    function GetLinks: string;
    function RemoveFilteredWords(msg: string): string;
    function HasLinkPrefix(anick: string): boolean;
  end;
//------------------------------------------------------------------------------
const
  FILE_HUBS = 'hubs.ini';
  FILE_IRCS = 'ircs.ini';
  FILE_WORDS = 'filterwords.ini';
  FILE_DEBUG = 'debug.txt';
  FILE_USERS = 'users.ini';
  FILE_SETTINGS = 'settings.xml';
var
  MainForm: TMainForm;
  BaseDir: string;
  CSNotification, CSRefreshItem, CSGetLinks: RTL_CRITICAL_SECTION;
//------------------------------------------------------------------------------
implementation
uses SyncObjs, NCL_Utils, NCL_Messages, NCL_UserControl, NCL_Scripting, NCL_Update, XMLDoc, XMLIntf;
//------------------------------------------------------------------------------
{$R *.dfm}
//------------------------------------------------------------------------------
procedure TMainForm.FormCreate(Sender: TObject);
begin
  InitializeCriticalSection(CSNotification);
  InitializeCriticalSection(CSRefreshItem);
  InitializeCriticalSection(CSGetLinks);

  Hubs := THubsList.Create;
  Ircs := TIrcsList.Create;
  FilteredWords := TStringList.Create;
  FilteredWords.Sorted := true;

  BaseDir := ExtractFilePath(Application.ExeName);
  LoadConfig;

  lblAbout1.Caption := MSG_PROGRAM + ' by pR0Ps';
  TimerPoll.Interval := 1000 * 10;
  TimerPoll.Enabled := cbAutoConnect.Checked;
  InitTimer.Enabled := true;
end;

procedure TMainForm.InitForm(Sender: TObject);
begin
  InitTimer.Free;

  if cbStartupConnect.Checked then
    ConnectAll;

  //check for update
  //if CheckUpdates and UpdateAvailible() then
    //TUpdate.Create(Self);
end;
//------------------------------------------------------------------------------
procedure TMainForm.FormDestroy(Sender: TObject);
begin
  SaveDebug();
  SaveXMLData(FILE_SETTINGS);
end;
//------------------------------------------------------------------------------
procedure TMainForm.LoadConfig;
var
  old : boolean;
begin
  Hubs.Clear;
  Ircs.Clear;

  //ugly, redundant code. it works and im too lazy to change it
  old := false;
  if FileExists(BaseDir + FILE_HUBS) then begin
    LoadData(FILE_HUBS);
    DeleteFile(BaseDir + FILE_HUBS);
    old := true;
  end;
  if FileExists(BaseDir + FILE_IRCS) then begin
    LoadData(FILE_IRCS);
    DeleteFile(BaseDir + FILE_IRCS);
    old := true;
  end;
  if FileExists(BaseDir + FILE_USERS) then begin
    LoadData(FILE_USERS);
    DeleteFile(BaseDir + FILE_USERS);
    old := true;
  end;
  if FileExists(BaseDir + FILE_WORDS) then begin
    FilteredWords.LoadFromFile(BaseDir + FILE_WORDS);
    DeleteFile(BaseDir + FILE_WORDS);
    old := true;
  end;

  if not old then
    LoadXMLData(FILE_SETTINGS)
  else
    CheckUpdates := true;
  if PID = '' then PID := GeneratePID; //missing PID tag
  mmFilterWords.Lines.Assign(FilteredWords);
end;
//------------------------------------------------------------------------------
procedure TMainForm.LoadData(dataFile: string);
var
  fname, temp: string;
  i, j: integer;
  ini: TIniFile;
  sections, section: TStringList;
  curCon : TIrcHubBase;
begin
  fname := BaseDir + dataFile;
  if not FileExists(fname) then Exit;

  ini := TIniFile.Create(fname);
  sections := TStringList.Create;
  section := TStringList.Create;
  try
    ini.ReadSections(sections);
    for i := 0 to sections.Count-1 do begin
      section.Clear;
      ini.ReadSectionValues(sections[i], section);
      with section do
        if dataFile = FILE_HUBS then begin
          Hubs.AddHub(Values['HostPort'], Values['Mode'], sections[i], Values['Nick'], Values['Pass'], Values['Prefix'], Values['Share'], Values['Slots'], Values['Client'], Values['MsgRate'], Values['PMRate'], Values['ShowJP'], Values['OPSCon'], Values['Enabled'], Values['BroadcastFrom'], Values['BroadcastTo']);
          UpdateDisplayHubs;
        end else if dataFile = FILE_IRCS then begin
          Ircs.AddIrc(Values['HostPort'], sections[i], Values['Nick'], Values['Pass'], Values['Prefix'], Values['Ident'], Values['Channels'], Values['MsgRate'], Values['PMRate'], Values['ShowJP'], Values['OPSCon'], Values['Enabled'], Values['BroadcastFrom'], Values['BroadcastTo']);
          UpdateDisplayIrcs;
        end else if dataFile = FILE_USERS then begin
          //find current connection
          curCon := nil;
          for j := 0 to Hubs.Count - 1 do
            if Hubs.Items[j].Name = sections[i] then
              curCon := THub(Hubs.Items[j]);
          if curCon = nil then
            for j := 0 to Ircs.Count - 1 do
              if Ircs.Items[j].Name = sections[i] then
                curCon := TIrc(Ircs.Items[j]);
          if curCon <> nil then
            for j := 0 to Count - 1 do begin
              temp := Copy(Strings[j], Length(Strings[j])-2, 3);
              curCon.UserPermsList.AddUser(Copy(Strings[j], 2, Length(Strings[j])-5), temp[1], temp[2], temp[3]);
            end;
        end;
    end;
  finally
    section.Free;
    sections.Free;
    ini.Free;
  end;
end;
//------------------------------------------------------------------------------
procedure LoadUserPerms (node : IXMLNode; con : TIrcHubBase);
begin
  //load user perms
  while node <> nil do begin
    if Length(node.Text) = 3 then
      con.UserPermsList.AddUser(node.GetAttribute('n'), Char(node.Text[1]), Char(node.Text[2]), Char(node.Text[3]));
    node := node.NextSibling;
  end;
end;
//------------------------------------------------------------------------------
procedure LoadStartupScript (node :IXMLNode; con : TIrc);
begin
  //load custom startup script
  if node <> nil then begin
    node := node.ChildNodes.First;
    while node <> nil do begin
      con.StartupCmds.Add(node.Text);
      node := node.NextSibling;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.LoadXMLData(dataFile : string);
var
  fname, temp : string;
  curCon : TIrcHubBase;
  root, node : IXMLNode;
  doc : IXMLDocument;
begin
  fname := BaseDir + dataFile;
  if not FileExists(fName) then Exit;

  try
    doc := LoadXMLDocument (fname);
    root := doc.DocumentElement;
    //get program options
    temp := root.ChildNodes['CheckUpdates'].Text;
    if temp <> '' then CheckUpdates := StrToBool(temp) else CheckUpdates := true; //missing autoconnect tag
    temp := root.ChildNodes['AutoConnect'].Text;
    if temp <> '' then cbAutoConnect.Checked := StrToBool(temp) else cbAutoConnect.Checked := false; //missing autoconnect tag
    temp := root.ChildNodes['Startup'].Text;
    if temp <> '' then cbStartupConnect.Checked := StrToBool(temp) else cbStartupConnect.Checked := false; //missing startup tag
    PID := root.ChildNodes['PID'].Text; //if this is '', it gets set after the load method completes
    FilteredWords.CommaText := root.ChildNodes['Words'].Text;
    //load hubs
    node := root.ChildNodes['Hubs'].ChildNodes.First;
    while node <> nil do begin
      curCon := Hubs.AddHub(node.ChildNodes['Server'].Text, node.ChildNodes['Mode'].Text, node.ChildNodes['Name'].Text, node.ChildNodes['Nick'].Text, node.ChildNodes['Pass'].Text, node.ChildNodes['Prefix'].Text, node.ChildNodes['Share'].Text, node.ChildNodes['Slots'].Text, node.ChildNodes['Client'].Text, node.ChildNodes['MsgRate'].Text, node.ChildNodes['PMRate'].Text, node.ChildNodes['ShowJP'].Text, node.ChildNodes['OPsCon'].Text, node.ChildNodes['Enabled'].Text, node.ChildNodes['From'].Text, node.ChildNodes['To'].Text);
      LoadUserPerms(node.ChildNodes['Users'].ChildNodes.First, curCon);
      node := node.NextSibling;
    end;
    //load IRCS
    node := root.ChildNodes['Ircs'].ChildNodes.First;
    while node <> nil do begin
      curCon := Ircs.AddIrc(node.ChildNodes['Server'].Text, node.ChildNodes['Name'].Text, node.ChildNodes['Nick'].Text, node.ChildNodes['Pass'].Text, node.ChildNodes['Prefix'].Text, node.ChildNodes['Ident'].Text, node.ChildNodes['Chans'].Text, node.ChildNodes['MsgRate'].Text, node.ChildNodes['PMRate'].Text, node.ChildNodes['ShowJP'].Text, node.ChildNodes['OPsCon'].Text, node.ChildNodes['Enabled'].Text, node.ChildNodes['From'].Text, node.ChildNodes['To'].Text);
      LoadUserPerms(node.ChildNodes['Users'].ChildNodes.First, curCon);
      LoadStartupScript(node.ChildNodes['Startup'], TIrc(curCon));
      node := node.NextSibling;
    end;
  finally
     doc.Active := false;
  end;

  UpdateDisplayHubs;
  UpdateDisplayIrcs;
end;
//------------------------------------------------------------------------------
procedure SaveUserPerms (root : IXMLNode; con : TIrcHubBase);
var
  i: integer;
  node : IXMLNode;
begin
  //save user perms
  if root <> nil then begin
    with con do begin
      for i := 0 to UserPermsList.Count - 1 do begin
        node := root.AddChild('u');
        node.SetAttribute('n', UserPermsList.Items[i].Name);
        node.Text := UserPermsList.Items[i].PM + UserPermsList.Items[i].MC + UserPermsList.Items[i].Control;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure SaveStartupScript (root : IXMLNode; con : TIrc);
var
  node : IXMLNode;
  i : integer;
begin
  //save startup commands
  if root <> nil then begin
    for i := 0 to con.StartupCmds.Count -1 do begin
      node := root.AddChild('l');
      node.Text := con.StartupCmds[i];
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.SaveXMLData (dataFile : string);
var
  fname: string;
  i : integer;
  root, node, temp : IXMLNode;
  doc : IXMLDocument;
begin
  fname := BaseDir + dataFile;
  if FileExists(fName) then DeleteFile(fname);

  try
    doc := NewXMLDocument;
    doc.Encoding := 'utf-8';
    root := doc.AddChild('NetChatLink');
    //write program options
    node := root.AddChild('CheckUpdates'); node.Text := IntToStr(Ord(CheckUpdates));
    node := root.AddChild('AutoConnect'); node.Text := IntToStr(Ord(cbAutoConnect.Checked));
    node := root.AddChild('Startup'); node.Text := IntToStr(Ord(cbStartupConnect.Checked));
    node := root.AddChild('PID'); node.Text := PID;
    node := root.AddChild('Words'); node.Text := FilteredWords.CommaText;
    //write hubs
    node := root.AddChild('Hubs');
    for i := 0 to Hubs.Count-1 do begin
      with Hubs.Items[i] do begin
        node := node.AddChild('Item');
        temp := node.AddChild('Name'); temp.Text := Name;
        temp := node.AddChild('Server'); temp.Text := Format('%s:%d', [Host, Port]);
        temp := node.AddChild('Mode'); temp.Text := Mode;
        temp := node.AddChild('Nick'); temp.Text := Nick;
        temp := node.AddChild('Pass'); temp.Text := Pass;
        temp := node.AddChild('Prefix'); temp.Text := Prefix;
        temp := node.AddChild('Share'); temp.Text := Share;
        temp := node.AddChild('Slots'); temp.Text := Slots;
        temp := node.AddChild('Client'); temp.Text := Client;
        temp := node.AddChild('MsgRate'); temp.Text := IntToStr(MsgRate);
        temp := node.AddChild('PMRate'); temp.Text := IntToStr(PMRate);
        temp := node.AddChild('ShowJP'); temp.Text := IntToStr(Ord(ShowJP));
        temp := node.AddChild('OPsCon'); temp.Text := IntToStr(Ord(OPsControl));
        temp := node.AddChild('Enabled'); temp.Text := IntToStr(Ord(Enabled));
        temp := node.AddChild('From'); temp.Text := IntToStr(Ord(BcFrom));
        temp := node.AddChild('To'); temp.Text := IntToStr(Ord(BcTo));
      end;
      SaveUserPerms (node.AddChild('Users'), Hubs.Items[i]);
      node := node.ParentNode;
    end;
    //write ircs
    node := root.AddChild('Ircs');
    for i := 0 to Ircs.Count-1 do begin
      with Ircs.Items[i] do begin
        node := node.AddChild('Item');
        temp := node.AddChild('Name'); temp.Text := Name;
        temp := node.AddChild('Server'); temp.Text := Format('%s:%d', [Host, Port]);
        temp := node.AddChild('Nick'); temp.Text := Nick;
        temp := node.AddChild('Pass'); temp.Text := Pass;
        temp := node.AddChild('Prefix'); temp.Text := Prefix;
        temp := node.AddChild('Ident'); temp.Text := Ident;
        temp := node.AddChild('Chans'); temp.Text := Channels;
        temp := node.AddChild('MsgRate'); temp.Text := IntToStr(MsgRate);
        temp := node.AddChild('PMRate'); temp.Text := IntToStr(PMRate);
        temp := node.AddChild('ShowJP'); temp.Text := IntToStr(Ord(ShowJP));
        temp := node.AddChild('OPsCon'); temp.Text := IntToStr(Ord(OPsControl));
        temp := node.AddChild('Enabled'); temp.Text := IntToStr(Ord(Enabled));
        temp := node.AddChild('From'); temp.Text := IntToStr(Ord(BcFrom));
        temp := node.AddChild('To'); temp.Text := IntToStr(Ord(BcTo));
      end;
      SaveUserPerms (node.AddChild('Users'), Ircs.Items[i]);
      SaveStartupScript(node.AddChild('Startup'), Ircs.Items[i]);
      node := node.ParentNode;
    end;
    //final formatting and saving
    doc.SetDocumentElement(root);
    doc.XML.Text := XMLDoc.FormatXMLData(doc.XML.Text);
    doc.Active := true;
    doc.SaveToFile(fname);
  finally
    doc := nil;
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.lvHubsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  hub: THub;
begin
  if Selected and (Item <> nil) and (Item.Data <> nil) then begin
    hub := Item.Data;
    edHubName.Text:= hub.Name;
    edHubHostPort.Text := hub.Host + ':' + IntToStr(hub.Port);
    rbHubNMDC.Checked := hub.Mode = 'NMDC';
    rbHubADC.Checked := hub.Mode = 'ADC';
    edHubNick.Text := hub.Nick;
    edHubPass.Text := hub.Pass;
    edHubPrefix.Text := hub.Prefix;
    edHubShare.Text := hub.Share;
    edHubSlots.Text := hub.Slots;
    edHubClient.Text := hub.Client;
    spnHubMsgRate.Value := hub.MsgRate;
    spnHubPMRate.Value := hub.PMRate;
    cbHubJP.Checked := hub.ShowJP;
    cbHubBcFrom.Checked := hub.BcFrom;
    cbHubBcTo.Checked := hub.BcTo;
    cbHubEnabled.Checked := hub.Enabled;

    //enable GUI elements
    btnHubDelete.Enabled := true;
    btnHubUserControl.Enabled := true;

  end else begin
    edHubName.Clear;
    edHubHostPort.Clear;
    rbHubNMDC.Checked := false;
    rbHubADC.Checked := false;
    edHubNick.Clear;
    edHubPass.Clear;
    edHubPrefix.Clear;
    edHubShare.Clear;
    edHubSlots.Clear;
    edHubClient.Clear;
    spnHubMsgRate.Value := 0;
    spnHubPMRate.Value := 0;
    cbHubJP.Checked := false;
    cbHubBcFrom.Checked := false;
    cbHubBcTo.Checked := false;
    cbHubEnabled.Checked := false;

    //disable GUI elements
    btnHubDelete.Enabled := false;
    btnHubUserControl.Enabled := false;

  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.lvIrcsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  irc: TIrc;
begin
  if Selected and (Item <> nil) and (Item.Data <> nil) then begin
    irc := Item.Data;
    edIrcName.Text := irc.Name;
    edIrcHostPort.Text := irc.Host + ':' + IntToStr(irc.Port);
    edIrcNick.Text := irc.Nick;
    edIrcPass.Text := irc.Pass;
    edIrcPrefix.Text := irc.Prefix;
    edIrcIdent.Text := irc.Ident;
    edIrcChannels.Text := irc.Channels;
    spnIrcMsgRate.Value := irc.MsgRate;
    spnIrcPMRate.Value := irc.PMRate;
    cbIrcJP.Checked := irc.ShowJP;
    cbIrcBcFrom.Checked := irc.BcFrom;
    cbIrcBcTo.Checked := irc.BcTo;
    cbIrcEnabled.Checked := irc.Enabled;

    //enable GUI elements
    btnIrcDelete.Enabled := true;
    btnIrcUserControl.Enabled := true;
    btnIrcScripting.Enabled := true;

  end else begin
    edIrcName.Clear;
    edIrcHostPort.Clear;
    edIrcNick.Clear;
    edIrcPass.Clear;
    edIrcPrefix.Clear;
    edIrcIdent.Clear;
    edIrcChannels.Clear;
    spnIrcMsgRate.Value := 0;
    spnIrcPMRate.Value := 0;
    cbIrcJP.Checked := false;
    cbIrcBcFrom.Checked := false;
    cbIrcBcTo.Checked := false;
    cbIrcEnabled.Checked := false;

    //disable GUI elements
    btnIrcDelete.Enabled := false;
    btnIrcUserControl.Enabled := false;
    btnIrcScripting.Enabled := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.btnHubAddUpdateClick(Sender: TObject);
var
  name, mode : string;
  temp : TListItem;
  op : boolean;
begin
  op := false; //false by default
  name := edHubName.Text;
  mode := RadioBttnToText(rbHubNMDC.Checked, rbHubADC.Checked);
  //stupidity checking
  if (name = '') or (edHubHostPort.Text = '') or (edHubPrefix.Text = '') or (edHubNick.Text = '') or (mode = '') then begin
    ShowMessage('You must fill in all required fields (marked with a "*")');
    Exit;
  end;
  //add/update
  temp := lvHubs.FindCaption(0, name, false, true, false);
  if temp <> nil then begin
    //updating existing hub (delete previous and add)
    op := THub(temp.Data).OPsControl;
    Hubs.DeleteHub(temp.Data);
  end;
  //add new hub
  Hubs.AddHub(edHubHostPort.Text, mode, name, edHubNick.Text, edHubPass.Text, edHubPrefix.Text,
    edHubShare.Text, edHubSlots.Text, edHubClient.Text, IntToStr(spnHubMsgRate.Value),
    IntToStr(spnHubPMRate.Value), IntToStr(Ord(cbHubJP.Checked)), IntToStr(Ord(op)),
    IntToStr(Ord(cbHubEnabled.Checked)), IntToStr(Ord(cbHubBcFrom.Checked)), IntToStr(Ord(cbHubBcTo.Checked)));
  //update display
  UpdateDisplayHubs;
  //select added/updated hub
  temp := lvHubs.FindCaption(0, name, false, true, false);
  if temp <> nil then
    temp.Selected := true;
end;
//------------------------------------------------------------------------------
procedure TMainForm.btnIrcAddUpdateClick(Sender: TObject);
var
  name : string;
  temp : TListItem;
  op : boolean;
begin
  op := false; //false by default
  name := edIrcName.Text;
  //stupidity checking
  if (name = '') or (edIrcHostPort.Text = '') or (edIrcPrefix.Text = '') or (edIrcNick.Text = '') then begin
    ShowMessage('You must fill in all required fields (marked with a "*")');
    Exit;
  end;
  //add/update
  temp := lvIrcs.FindCaption(0, name, false, true, false);
  if temp <> nil then begin
    //updating existing irc (delete previous and add)
    op := TIrc(temp.Data).OPsControl;
    Ircs.DeleteIrc(temp.Data);
  end;
  //add new irc
  Ircs.AddIrc(edIrcHostPort.Text, name, edIrcNick.Text, edIrcPass.Text, edIrcPrefix.Text,
    edIrcIdent.Text, edIrcChannels.Text, IntToStr(spnIrcMsgRate.Value),
    IntToStr(spnIrcPMRate.Value), IntToStr(Ord(cbIrcJP.Checked)), IntToStr(Ord(op)),
    IntToStr(Ord(cbIrcEnabled.Checked)), IntToStr(Ord(cbIrcBcFrom.Checked)), IntToStr(Ord(cbIrcBcTo.Checked)));
  //update display
  UpdateDisplayIrcs;
  //select added/updated irc
  temp := lvIrcs.FindCaption(0, name, false, true, false);
  if temp <> nil then
    temp.Selected := true;
end;
//------------------------------------------------------------------------------
procedure TMainForm.AutoConTimerActivate(Sender: TObject);
begin
  ConnectAll;
end;
//------------------------------------------------------------------------------
procedure TMainForm.ConnectAll;
var
  i: integer;
begin
  for i := 0 to Hubs.Count-1 do
    if (Hubs[i].ConnStep = 1) and (Hubs[i].Enabled) then
      Hubs[i].Connect;
  for i := 0 to Ircs.Count-1 do
    if (Ircs[i].ConnStep = 1) and (Ircs[i].Enabled) then
      Ircs[i].Connect;
end;
//------------------------------------------------------------------------------
procedure TMainForm.btnConnectAllClick(Sender: TObject);
begin
  ConnectAll;
end;
//------------------------------------------------------------------------------
procedure TMainForm.Broadcast(Origin: Pointer; Prefix, ANick: string; Msg: WideString; MsgFormat: string);
var
  i: integer;
begin
  if TIrcHubBase(Origin).ConnStep < 3 then
    Exit; //no messages before you're logged in
  if Trim(Msg) = '' then
    Exit;

  Msg := StringReplace(Msg, #$02, '', [rfReplaceAll]);
  Msg := StringReplace(Msg, #$03, '', [rfReplaceAll]);
  Msg := StringReplace(Msg, #$16, '', [rfReplaceAll]);
  Msg := StringReplace(Msg, #$1F, '', [rfReplaceAll]);
  Msg := RemoveFilteredWords(Msg);

  EnterCriticalSection(CSNotification);
  try
    for i := 0 to Hubs.Count-1 do
      if Hubs[i] <> Origin then
        if Hubs[i].BcTo and not Hubs[i].Muted and (Hubs[i].ConnStep = 3) then //hub can recieve chat
          if not Hubs[i].IsBlockedMC(Prefix + Hubs[i].GetUserName(aNick)) then //user not ignored
            Hubs[i].SendMsgToChat(Format(MsgFormat, [Prefix + ANick, Msg]));
    for i := 0 to Ircs.Count-1 do
      if Ircs[i] <> Origin then
        if Ircs[i].BcTo and not Ircs[i].Muted and (Ircs[i].ConnStep = 3) then //irc can recieve chat
          if not Ircs[i].IsBlockedMC(Prefix + Ircs[i].GetUserName(aNick)) then //user not ignored
            Ircs[i].SendMsgToChat(Format(MsgFormat, [Prefix + ANick, Msg]));
  finally
    LeaveCriticalSection(CSNotification);
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.RefreshItem(Origin: Pointer);
var
  i: integer;
begin
  EnterCriticalSection(CSRefreshItem);
  try
    //upadate the icon if inactive
    if (TIrcHubBase(Origin).ConnStep = 1) and (TIrcHubBase(Origin).Enabled = false) then
      TIrcHubBase(Origin).ConnStep := 0;
    for i := 0 to lvHubs.Items.Count-1 do
      if lvHubs.Items[i].Data = Origin then
      begin
        lvHubs.Items[i].ImageIndex := THub(Origin).Connstep;
        Exit;
      end;

    for i := 0 to lvIrcs.Items.Count-1 do
      if lvIrcs.Items[i].Data = Origin then
      begin
        lvIrcs.Items[i].ImageIndex := TIrc(Origin).Connstep;
        Exit;
      end;
  finally
    LeaveCriticalSection(CSRefreshItem);
  end;
end;
//------------------------------------------------------------------------------
function TMainForm.GetLinks: string;
var
  i: integer;
const fmt = 'Name: %s,  Type: %s,  Prefix: %s,  Address: %s' + #13#10;
begin
  Result := 'Current connections:' + #13#10;
  EnterCriticalSection(CSGetLinks);
  try
    for i := 0 to Hubs.Count-1 do
      if Hubs[i].ConnStep = 3 then
        Result := Result + Format(fmt, [Hubs[i].Name, Hubs[i].Mode + ' Hub', Hubs[i].Prefix, StringReplace(Hubs[i].Host, '.', ',', [rfReplaceAll]) + ':' + IntToStr(Hubs[i].Port)]);

    for i := 0 to Ircs.Count-1 do
      if Ircs[i].ConnStep = 3 then
        Result := Result + Format(fmt, [Hubs[i].Name, 'IRC', Hubs[i].Prefix, Hubs[i].Host + ':' + IntToStr(Hubs[i].Port)]);
  finally
    LeaveCriticalSection(CSGetLinks);
  end;
end;
//------------------------------------------------------------------------------
function TMainForm.GetCurrentConnection: TIrcHubBase;
begin
  Result := nil;
  if PageControl1.ActivePage.Name = 'tsHubs' then begin
    if lvHubs.Selected <> nil then
      Result := THub(lvHubs.Selected.Data);
  end else if PageControl1.ActivePage.Name = 'tsIrcs' then begin
    if lvIrcs.Selected <> nil then
      Result := TIrc(lvIrcs.Selected.Data);
  end;
end;
//------------------------------------------------------------------------------
function TMainForm.RemoveFilteredWords(msg: string): string;
var
  i : integer;
begin
  Result := msg;
  msg := LowerCase(msg);
  for i := 0 to FilteredWords.Count-1 do
    if AnsiPos(LowerCase(FilteredWords[i]), msg) > 0 then //only replace if word was found (faster)
      Result := StringReplace(Result, FilteredWords[i], StringOfChar('*', Length(FilteredWords[i])), [rfIgnoreCase, rfReplaceAll]);
end;
//------------------------------------------------------------------------------
procedure TMainForm.btnHubDeleteClick(Sender: TObject);
var
  i : integer;
begin
  if lvHubs.Selected = nil then
    Exit;
  //set index to select after deletion
  i := lvHubs.Selected.Index;
  if i = lvHubs.Items.Count - 1 then
    i := i - 1;

  Hubs.DeleteHub(lvHubs.Selected.Data);
  UpdateDisplayHubs;
  //if not nothing left to select after deletion
  if lvHubs.Items.Count <> 0 then
    lvHubs.Items[i].Selected := true;
end;
//------------------------------------------------------------------------------
procedure TMainForm.btnIrcDeleteClick(Sender: TObject);
var
  i: integer;
begin
  if lvIrcs.Selected = nil then
    Exit;
  //set index to select after deletion
  i := lvIrcs.Selected.Index;
  if i = lvIrcs.Items.Count - 1 then
    i := i - 1;

  Ircs.DeleteIrc(lvIrcs.Selected.Data);
  UpdateDisplayIrcs;
  //if not nothing left to select after deletion
  if lvIrcs.Items.Count <> 0 then
    lvIrcs.Items[i].Selected := true;
end;
//------------------------------------------------------------------------------
procedure TMainForm.UpdateDisplayHubs;
var
  i: integer;
  p: Pointer;
begin
  lvHubs.Items.BeginUpdate;
  p := nil;
  if lvHubs.Selected <> nil then
    p := lvHubs.Selected.Data;
  try
    lvHubs.Clear;
    for i := 0 to Hubs.Count-1 do
      with lvHubs.Items.Add do
      begin
        Data := Hubs[i];
        Caption := Hubs[i].Name;
        SubItems.Add(Format('%s:%d', [Hubs[i].Host, Hubs[i].Port]));
        SubItems.Add(Hubs[i].Mode);
        SubItems.Add(Hubs[i].Prefix);
        SubItems.Add(Hubs[i].Nick);
        SubItems.Add(Hubs[i].Share);
        SubItems.Add(Hubs[i].Slots);
        SubItems.Add(Hubs[i].Client);
        //inactive hubs
        if (Hubs[i].Connstep = 1) and (Hubs[i].Enabled = false) then
           Hubs[i].Connstep := 0;
        ImageIndex := Hubs[i].Connstep;
      end;
  finally
    if p <> nil then
      for i := 0 to lvHubs.Items.Count-1 do
        if lvHubs.Items[i].Data = p then
          lvHubs.Selected := lvHubs.Items[i];
    lvHubs.Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.UpdateDisplayIrcs;
var
  i: integer;
  p: Pointer;
begin
  lvIrcs.Items.BeginUpdate;
  p := nil;
  if lvIrcs.Selected <> nil then
    p := lvIrcs.Selected.Data;
  try
    lvIrcs.Clear;
    for i := 0 to Ircs.Count-1 do
      with lvIrcs.Items.Add do
      begin
        Data := Ircs[i];
        Caption := Ircs[i].Name;
        SubItems.Add(Format('%s:%d', [Ircs[i].Host, Ircs[i].Port]));
        SubItems.Add(Ircs[i].Prefix);
        SubItems.Add(Ircs[i].Nick);
        SubItems.Add(Ircs[i].Channels);
        //inactive IRCs
        if (Ircs[i].Connstep = 1) and (Ircs[i].Enabled = false) then
           Ircs[i].Connstep := 0;
        ImageIndex := Ircs[i].Connstep; 
      end;
  finally
    if p <> nil then
      for i := 0 to lvIrcs.Items.Count-1 do
        if lvIrcs.Items[i].Data = p then
          lvIrcs.Selected := lvIrcs.Items[i];
    lvIrcs.Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.pmConnDisconnPopup(Sender: TObject);
var
  lv: TListView;
begin
  if not (pmConnDisconn.PopupComponent is TListView) then
    Exit;

  lv := TListView(pmConnDisconn.PopupComponent);
  Connect1.Enabled := lv.Selected <> nil;
  Disconnect1.Enabled := Connect1.Enabled;
end;
//------------------------------------------------------------------------------
procedure TMainForm.Connect1Click(Sender: TObject);
var
  lv: TListView;
begin
  if not (pmConnDisconn.PopupComponent is TListView) then
    Exit;

  lv := TListView(pmConnDisconn.PopupComponent);
  if (lv.Selected = nil) or (lv.Selected.Data = nil) then
    Exit;

  if lv = lvHubs then
    THub(lv.Selected.Data).Connect
  else if lv = lvIrcs then
    TIrc(lv.Selected.Data).Connect
end;
//------------------------------------------------------------------------------
procedure TMainForm.Disconnect1Click(Sender: TObject);
var
  lv: TListView;
begin
  if not (pmConnDisconn.PopupComponent is TListView) then
    Exit;

  lv := TListView(pmConnDisconn.PopupComponent);
  if (lv.Selected = nil) or (lv.Selected.Data = nil) then
    Exit;

  if lv = lvHubs then
    THub(lv.Selected.Data).Tcp.Close
  else if lv = lvIrcs then
    TIrc(lv.Selected.Data).Tcp.Close;
end;
//------------------------------------------------------------------------------
function TMainForm.HasLinkPrefix(anick: string): boolean;
var
  i: integer;
begin
  Result := true;
  for i := 0 to Hubs.Count-1 do
    if AnsiPos(Hubs[i].Prefix, anick) = 1 then
      Exit;
  for i := 0 to Ircs.Count-1 do
    if AnsiPos(Ircs[i].Prefix, anick) = 1 then
      Exit;
  Result := false;
end;
//------------------------------------------------------------------------------
procedure TMainForm.btnFilterWordsSaveClick(Sender: TObject);
begin
  FilteredWords.Clear;
  FilteredWords.AddStrings (mmFilterWords.Lines);
end;
//------------------------------------------------------------------------------
procedure TMainForm.btnFilterWordsReloadClick(Sender: TObject);
begin
  mmFilterWords.Lines.Assign(FilteredWords);
end;
//------------------------------------------------------------------------------
procedure TMainForm.cbAutoConnectClick(Sender: TObject);
begin
  TimerPoll.Enabled := cbAutoConnect.Checked;
end;
//------------------------------------------------------------------------------
procedure TMainForm.SendToDebug(From, Msg: string);
begin
  if mmDebug.Lines.Count > 100 then
    SaveDebug();
  mmDebug.Lines.Append(From + ': ' + Msg);
end;
//------------------------------------------------------------------------------
procedure TMainForm.SaveDebug();
var
  temp :TStringList;
begin
  temp := TStringList.Create();
  if FileExists(BaseDir + FILE_DEBUG) then
    temp.LoadFromFile(BaseDir + FILE_DEBUG);
  temp.AddStrings(mmDebug.Lines);
  temp.SaveToFile(BaseDir + FILE_DEBUG);
  mmDebug.Lines.Clear();
end;
//------------------------------------------------------------------------------
procedure TMainForm.lblLinkClick(Sender: TObject);
begin
  try
    ShellExecute(Handle, 'OPEN', PChar((Sender as TLabel).Caption), nil, nil, SW_SHOWDEFAULT);
  except on E : Exception do
    ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
  end;
end;

procedure TMainForm.btnDebugSaveClick(Sender: TObject);
begin
  SaveDebug();
  ShowMessage('Saved debug log to ' + FILE_DEBUG);
end;

//------------------------------------------------------------------------------
procedure TMainForm.btnUserControlClick(Sender: TObject);
begin
  TUserForm.Create(Self);
end;

procedure TMainForm.btnIrcScriptingClick(Sender: TObject);
begin
  TScripting.Create(Self);
end;

procedure TMainForm.btnUpdateCheckClick(Sender: TObject);
begin
  TUpdate.Create(Self);
end;

end.
