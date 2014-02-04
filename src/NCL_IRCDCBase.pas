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
unit NCL_IRCDCBase;
//------------------------------------------------------------------------------
interface
//------------------------------------------------------------------------------
uses
  Classes, CustomClasses, ScktComp, SysUtils, ComCtrls, ExtCtrls;
//------------------------------------------------------------------------------
type
  TIrcHubBase = class
  private
    function ControllingOPs : TStringList;
  protected
    MCQueue: TStringList;
    PMQueue: TStringList;
    TimerMCQueue: TTimer;
    TimerPMQueue: TTimer;
    procedure OnConnect(Sender: TObject; Socket: TCustomWinSocket); virtual;
    procedure OnDisconnect(Sender: TObject; Socket: TCustomWinSocket); virtual;
    procedure OnError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer); virtual;
    procedure OnRead(Sender: TObject; Socket: TCustomWinSocket); virtual; abstract;
    procedure TimerMCQueueTimer(Sender: TObject); virtual;
    procedure TimerPMQueueTimer(Sender: TObject); virtual;
  public
    Name: string;
    Host: string;
    Port: integer;
    Nick, Pass: string;
    Prefix, PrefixFormat: string;
    MsgRate, PMRate : integer;
    Enabled: boolean;
    BcFrom, BcTo: boolean;
    Tcp: TClientSocket;
    ConnStep: integer;
    Buf: string;
    Muted: boolean;
    UserPermsList: TUserList;
    TempPermsList : TUserList;
    ShowJP: boolean;
    OPsControl : boolean;
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Connect; virtual;
    procedure SendMsgFmt(nl, msg, fmt: string; pm, multiline: boolean); virtual;
    procedure SendMsgToPM(toUser: string; msg: WideString; multiline: boolean = true); virtual; abstract;
    procedure SendMsgToChat(msg: WideString; multiline: boolean = false); virtual; abstract;
    function GetMyInfo: string;

    function GetUserName (User : string) : string; virtual;
    function MakeUserList (Users : TStringList) : string;

    function IsController (aUser : string) : boolean;
    function IsBlockedPM (aUser : string) : boolean;
    function IsBlockedMC (aUser : string) : boolean;

    function GetControllerList (): string;
    function GetBlockedPMList () : string;
    function GetBlockedMCList () : string;
  end;
//------------------------------------------------------------------------------
implementation
uses NCL_Main, NCL_Utils;
//------------------------------------------------------------------------------
{ TIrcHubBase }
//------------------------------------------------------------------------------
procedure TIrcHubBase.Connect;
begin
  MainForm.SendToDebug(Name, 'Connecting...');
  ConnStep := 2;
  MainForm.RefreshItem(Self);
  TimerMCQueue.Interval := MsgRate;
  TimerPMQueue.Interval := MsgRate;
  Tcp.Socket.Close;
  Tcp.Host := Host;
  Tcp.Port := Port;
  Tcp.Active := true;
end;
//------------------------------------------------------------------------------
constructor TIrcHubBase.Create;
begin
  Tcp := TClientSocket.Create(nil);
  Tcp.OnConnect := OnConnect;
  Tcp.OnDisconnect := OnDisconnect;
  Tcp.OnError := OnError;
  Tcp.OnRead := OnRead;
  Muted := false;
  //userpermissions list
  UserPermsList := TUserList.Create;
  TempPermsList := TUserList.Create;
  MCQueue := TStringList.Create;
  PMQueue := TStringList.Create;
  TimerMCQueue := TTimer.Create(nil);
  TimerMCQueue.OnTimer := TimerMCQueueTimer;
  TimerPMQueue := TTimer.Create(nil);
  TimerPMQueue.OnTimer := TimerPMQueueTimer;
  ConnStep := 1
end;
//------------------------------------------------------------------------------
destructor TIrcHubBase.Destroy;
begin
  TimerMCQueue.Free;
  MCQueue.Free;
  TimerPMQueue.Free;
  PMQueue.Free;
  UserPermsList.Free;
  TempPermsList.Free;
  Tcp.Free;
  inherited;
end;
//------------------------------------------------------------------------------
procedure TIrcHubBase.OnConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  MainForm.SendToDebug(Name, 'Connected!');
  ConnStep := 2;
  MainForm.RefreshItem(Self);
end;
//------------------------------------------------------------------------------
procedure TIrcHubBase.OnDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  MainForm.SendToDebug(Name, 'Disconnected');
  ConnStep := 1;
  MainForm.RefreshItem(Self);
end;
//------------------------------------------------------------------------------
procedure TIrcHubBase.OnError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  MainForm.SendToDebug(Name, 'Error occured. ErrorCode: ' + IntToStr(ErrorCode));
  ErrorCode := 0;
  Socket.Close;
end;
//------------------------------------------------------------------------------
procedure TIrcHubBase.SendMsgFmt(nl, msg, fmt: string; pm, multiline: boolean);
var
  i: integer;
begin
  if multiline and (AnsiPos(nl, msg) <> 0) then begin //newlines enabled and more than one line
    //messages appear broken up by line
    while Length(msg) > 0 do begin
      i := AnsiPos (nl, msg);
      if i = 0 then i := Length(msg) + 1; //end of string
      //send text, use queue only if needed
      if MsgRate <= 0 then Tcp.Socket.SendText(Format(fmt, [Copy(msg, 1, i-1)]))
      else
        if pm then PMQueue.Add(Format(fmt, [Copy(msg, 1, i-1)]))
        else MCQueue.Add(Format(fmt, [Copy(msg, 1, i-1)]));
      Delete(msg, 1, i - 1 + Length(nl));
    end;
  end else
    //send untouched text, use queue only if needed
    if MsgRate <= 0 then Tcp.Socket.SendText(Format(fmt, [msg]))
    else
      if pm then PMQueue.Add(Format(fmt, [msg]))
      else MCQueue.Add(Format(fmt, [msg]));
end;
//------------------------------------------------------------------------------
procedure TIrcHubBase.TimerMCQueueTimer(Sender: TObject);
begin
  if MCQueue.Count <= 0 then
    Exit;
  Tcp.Socket.SendText(MCQueue[0]);
  MCQueue.Delete(0);
end;
procedure TIrcHubBase.TimerPMQueueTimer(Sender: TObject);
begin
  if PMQueue.Count <= 0 then Exit;
  Tcp.Socket.SendText(PMQueue[0]);
  PMQueue.Delete(0);
end;
//------------------------------------------------------------------------------
function TIrcHubBase.GetMyInfo(): string;
begin
  Result := Format('BroadcastFromHere: %s, BroadcastToHere: %s, Muted: %s, OPs Control: %s', [YesNo(Ord(BcFrom)), YesNo(Ord(BcTo)), YesNo(Ord(Muted)), YesNo(Ord(OPsControl))]);
end;

//------------------------------------------------------------------------------
function TIrcHubBase.ControllingOPs : TStringList;
var
  i : integer;
  temp : string;
begin
  Result := TStringList.Create;
  for i := 0 to TempPermsList.Count - 1 do begin
    temp := TempPermsList.Items[i].Name;
    if IsController(temp) then
      Result.Add(temp);
  end;
end;
//------------------------------------------------------------------------------
function TIrcHubBase.MakeUserList (Users: TStringList) : string;
var i : integer;
begin
  Result := '';
  for i := 0 to Users.Count - 1 do
    Result := Result + GetUserName(Users.Strings[i]) + ', ';
end;

//------------------------------------------------------------------------------
//allows for overriding by ADC hubs where the users are identified by SID
function TIrcHubBase.GetUserName (User : string) : string;
begin
  Result := User;
end;

//---CHECKING TEMPPERMS AND USERPERMS----------------------------------------------
function TIrcHubBase.IsController (aUser : string) : boolean;
var
  temp : char;
  name : string;
begin
  name := GetUserName(aUser);
  temp := UserPermsList.IsController(name);
  //is a controller OR (is unset and OPs control and is OP)
  Result := (temp = 'Y') or ((temp = 'U') and OPsControl and (TempPermsList.IsController(name) = 'Y'));
end;

function TIrcHubBase.IsBlockedPM (aUser : string) : boolean;
var
  name : string;
  temp : char;
begin
  name := GetUserName(aUser);
  temp := UserPermsList.IsBlockedPM(name);
  Result := (temp = 'Y') or ((temp = 'U') and (TempPermsList.IsBlockedPM(name) = 'Y'));
end;

function TIrcHubBase.IsBlockedMC (aUser : string) : boolean;
var
  name : string;
  temp : char;
begin
  name := GetUserName(aUser);
  temp := UserPermsList.IsBlockedMC(name);
  Result := (temp = 'Y') or ((temp = 'U') and (TempPermsList.IsBlockedMC(name) = 'Y'));
end;

//------GET LISTS OF USERS------------------------------------------------------
function TIrcHubBase.GetBlockedPMList() : string;
begin
  Result := 'Blocking PMs for ' + Name + ' from: ' + UserPermsList.GetBlockedPMs.CommaText + #13#10;
  Result := Result + 'Blocked bots: ' + TempPermsList.GetBlockedPMs.CommaText;
end;
function TIrcHubBase.GetBlockedMCList() : string;
begin
  Result := 'Ignoring non-local mainchat messages for ' + Name + ' from: ' + UserPermsList.GetBlockedPMs.CommaText;
end;
function TIrcHubBase.GetControllerList() : string;
begin
  Result := 'Controllers for ' + Name + ' are: ' + UserPermsList.GetControllers.CommaText;
  if OPsControl then
    Result := Result + #13#10'OPs as controllers is enabled. OPs: ' + MakeUserList(ControllingOPs)
  else
    Result := Result + #13#10'OPs as controllers is disabled.';
end;
end.
