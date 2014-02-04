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
unit NCL_IRC;
//------------------------------------------------------------------------------
interface
//------------------------------------------------------------------------------
uses
  Classes, ScktComp, Math, SysUtils, ComCtrls, ExtCtrls, NCL_IRCDCBase;
type
//------------------------------------------------------------------------------
  TIrc = class(TIrcHubBase)
  private
    function GetJoinCommands : string;
  protected
    procedure OnConnect(Sender: TObject; Socket: TCustomWinSocket); override;
    procedure OnRead(Sender: TObject; Socket: TCustomWinSocket); override;
  public
    Ident, Channels : string;
    StartupCmds : TStringList;
    constructor Create; override;
    destructor Destroy; override;
    procedure SendMsgToPM(tonick: string; msg: WideString; multiline: boolean = true); override;
    procedure SendMsgToChat(msg: WideString; multiline: boolean = true); override;
    function GetChannelsNoKeys : string;
  end;
//------------------------------------------------------------------------------
  TIrcsList = class(TList)
  private
    function Get(Index: Integer): TIrc;
    procedure Put(Index: Integer; const Value: TIrc);
  public
    
    property Items[Index: Integer]: TIrc read Get write Put; default;
    function AddIrc(Server, Name, Nick, Pass, Prefix, Ident, Channels, MsgRate, PMRate, ShowJP, OPsControl, Enabled, BcFrom, BcTo: string) : TIrc;
    procedure DeleteIrc(Irc: TIrc);
  end;
const
  DL = #10; // delimiter
  NL = #13#10; // new line (CRLF)
//------------------------------------------------------------------------------
implementation
uses NCL_Main, NCL_LocalCommands, NCL_Utils, NCL_Messages;
//------------------------------------------------------------------------------
{ TIrcsList }
//------------------------------------------------------------------------------
function TIrcsList.Get(Index: Integer): TIrc;
begin
  Result := inherited Get(Index);
end;
//------------------------------------------------------------------------------
procedure TIrcsList.Put(Index: Integer; const Value: TIrc);
begin
  inherited Put(Index, Value);
end;
//------------------------------------------------------------------------------
function TIrcsList.AddIrc(Server, Name, Nick, Pass, Prefix, Ident, Channels, MsgRate, PMRate, ShowJP, OPsControl, Enabled, BcFrom, BcTo: string) : TIrc;
var
  irc: TIrc;
begin
  irc := TIrc.Create;
  GetHostPort(Server, irc.Host, irc.Port, 6667);
  irc.Name := Name;
  irc.Nick := Nick;
  irc.Pass := Pass;
  irc.Prefix := Prefix;
  irc.Ident := Ident;
  irc.Channels := ParseChannels(Channels); //fix channel formatting
  //fix invalid rates
  try irc.MsgRate := StrToInt(MsgRate); except irc.MsgRate := 0; end;
  if irc.MsgRate < 0 then irc.MsgRate := 0;
  try irc.PMRate := StrToInt(PMRate); except irc.PMRate := 0; end;
  if irc.PMRate < 0 then irc.PMRate := 0;

  try irc.ShowJP := StrToBool(ShowJP); except irc.ShowJP := false; end;
  try irc.OPsControl := StrToBool(OPsControl); except irc.OPsControl := false; end;
  try irc.Enabled := StrToBool(Enabled); except irc.Enabled := false; end;
  try irc.BcFrom := StrToBool(BcFrom); except irc.BcFrom := false; end;
  try irc.BcTo := StrToBool(BcTo); except irc.BcTo := false; end;
  irc.StartupCmds := TStringList.Create;
  Add(irc);
  Result := irc;
end;
//------------------------------------------------------------------------------
procedure TIrcsList.DeleteIrc(Irc: TIrc);
begin
  if IndexOf(Irc) >= 0 then
    Delete(IndexOf(Irc));
  Irc.Free;
end;
//------------------------------------------------------------------------------
{ TIrc }
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TIrc.OnConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  inherited;
  MainForm.SendToDebug(Name, 'Sending initial NICK and USER commands');
  Socket.SendText(Format('NICK %s' + NL + 'USER %s "" %s :%s' + NL, [Nick, Nick, Host, MSG_PROGRAM + ' by pR0Ps']));
end;
//------------------------------------------------------------------------------
procedure TrimTrailingCRLF(var s: string);
begin
  while (Length(s) > 0) and (s[Length(s)] in [#10, #13]) do
    Delete(s, Length(s), 1);
end;
//------------------------------------------------------------------------------
procedure GetParams(line: string; var nick, ident, host, cmd, params: string);
var
  i : integer;
begin
  nick := ''; ident := ''; host := ''; cmd := ''; params := '';
  TrimTrailingCRLF(line);
  if line = '' then Exit; // error

  //nick+ident+host exist in line
  if line[1] = ':' then begin
    i := AnsiPos(' ', line);
    if i <= 0 then Exit; // error
    host := Copy(line, 2, i-2); //store mask in host for convinience
    Delete(line, 1, i);
    line := TrimLeft(line); // because of RFC, there can be 1 or more spaces

    //parse mask into components
    //remove name and ident in vars, host is left
    i := AnsiPos('!', host);
    nick := Copy(host, 1, i-1);
    Delete(host, 1, i);
    i := AnsiPos('@', host);
    ident := Copy(host, 1, i-1);
    Delete(host, 1, i);
  end;

  i := AnsiPos(' ', line);
  if i <= 0 then Exit; // error
  cmd := UpperCase(Copy(line, 1, i-1));
  Delete(line, 1, i);
  line := TrimLeft(line); // because of RFC, there can be 1 or more spaces

  params := line;
end;
//------------------------------------------------------------------------------
procedure GetOppedDeopped(line: string; var Opped, Deopped: TStringList);
var
  i: integer;
  modes: string;
  sign: boolean;
begin
  // #dddd +o-o+o-o pivo pivo pivo pivo
  Opped := TStringList.Create;
  Deopped := TStringList.Create;

  i := AnsiPos(' ', line);
  if i <= 0 then Exit; // error
  Delete(line, 1, i);

  i := AnsiPos(' ', line); // modes
  if i <= 0 then Exit;// not a nick mode
  modes := Copy(line, 1, i-1);

  Delete(line, 1, i); // line contains list of nicks
  StringReplace(line, ' ', ',', [rfReplaceAll]);

  with TStringList.Create do
  try
    CommaText := line;
    sign := true;
    i := 0;
    while Length(modes) > 0 do
    begin
      case modes[1] of
        '+': sign := true;
        '-': sign := false;
        'o', 'a', 'h', 'q':
          begin
            if i >= Count then // not enough nicks for these modes
              continue;
            if sign then
              Opped.Add(Strings[i])
            else
              Deopped.Add(Strings[i]);
            Inc(i);
          end;
        'l', 'b', 'v', 'k': Inc(i);
      end; // case
      System.Delete(modes, 1, 1);
    end;
  finally
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TIrc.OnRead(Sender: TObject; Socket: TCustomWinSocket);
const
  OP_PREFIXES = ['~', '&', '@'];

  // Color Codes
  CC_B = #$02; // bold
  CC_C = #$03; // color
  CC_R = #$16; // reverse
  CC_U = #$1F; // underline
var
  i, crpos: integer;
  line, aNick, aIdent, aHost, cmd, params :string; //line parameters
  temp : string;
  ops, deops: TStringList;
begin
  while Socket.ReceiveLength > 0 do
    Buf := Buf + Socket.ReceiveText;

  while AnsiPos(DL, Buf) > 0 do begin // only consider complete IRC messages
    crpos := AnsiPos(DL, Buf);
    line := Copy(Buf, 1, crpos);
    Delete(Buf, 1, crpos); // remove this line from buffer
    GetParams(line, aNick, aIdent, aHost, cmd, params);

    //MainForm.SendToDebug('Line', Copy(line, 1, Length(line)-1));

    if (aNick = aIdent) and ((aNick = 'NickServ') or (aNick = 'ChanServ')) then
        MainForm.SendToDebug(Name, aNick + ': ' + params); //send Serv messages to debug
    
    if cmd = 'PING' then begin
      Socket.SendText(StringReplace(line, 'PING', 'PONG', []));
      continue;
    end

    //connection made, MODE was sent, not signed in, after MOTD
    else if ((ConnStep = 2) and ((cmd = 'MODE') or (cmd = '376') or (cmd = '422'))) then begin

      MainForm.SendToDebug(Name, 'Signing in to IRC server');

      //startup/sign in script
      MainForm.SendToDebug(Name, 'Sending custom commands (if any)');
      for i := 0 to StartupCmds.Count - 1 do begin
        Socket.SendText(EscapeReplace(StartupCmds[i], '%', 'npsdi', [Nick, Pass, Host+':'+IntToStr(Port), MSG_DESCRIPTION, Ident]) + NL);
      end;
      //end startup/sign in script

      Sleep(10);
      MainForm.SendToDebug(Name, 'Joining: ' + GetChannelsNoKeys());
      Socket.SendText(GetJoinCommands());
      ConnStep := 3; // logged in
      MainForm.RefreshItem(Self);
    end

    //Bad characters in nick
    else if cmd = '432' then begin
      MainForm.SendToDebug(Name, 'Nick contains invalid charcters (only alphanumeric and _[]{}\|`^ allowed)');
      Socket.SendText('QUIT' + NL);
    end

    //nick taken
    else if cmd = '433' then begin
      MainForm.SendToDebug(Name, 'Current nick taken, choose another or kick the impersonater.');
      Socket.SendText('QUIT' + NL);
      continue;
    end

    //bad password (not applicable with NickServ)
    else if cmd = '464' then begin
      MainForm.SendToDebug(Name, 'Authentication error: Bad password');
      ConnStep := 2; //not logged in
      MainForm.RefreshItem(Self);
    end

    //bad channel key
    else if cmd = '475' then begin
      Delete(params, 1, Length(Nick) + 1);
      MainForm.SendToDebug(Name, 'Error joining ' + Copy(params, 1, AnsiPos(' ', params) - 1) + ': incorrect/missing channel key');
    end

    //Banhammered
    else if (cmd = '465') or (cmd = '474') then begin
      Delete(params, 1, Length(Nick) + 1);
      MainForm.SendToDebug(Name, 'You have been banned from ' + Copy(params, 1, AnsiPos(' ', params)-1));
    end

    //get chat topic
    else if cmd = '332' then begin

    end
    
    //Get nicks list
    else if (cmd = '353') then begin
      i := AnsiPos(':', params);
      if i <= 0 then continue; // error
      params := StringReplace(Copy(params, i+1, MaxInt), ' ', ',', [rfReplaceAll]); // list of comma-separated nicks
      with TStringList.Create do begin
        try
          CommaText := params;
          for i := 0 to Count-1 do
            if (Trim(Strings[i]) <> '') and (Length(Strings[i]) > 0) and (Strings[i][1] in OP_PREFIXES) then
              TempPermsList.SetController(Copy(Strings[i], 2, MaxInt), 'Y');
        finally
          Free;
        end;
      end;
    end

    //User left channel
    else if (cmd = 'QUIT') or (cmd = 'PART') then begin
      if ShowJP then
        MainForm.Broadcast(Self, Prefix, '', UTF8Decode(aNick + ' has left ' + Name), '***%s%s');
      TempPermsList.SetController(aNick, 'U');
      if aNick = Nick then
        if cmd = 'QUIT' then MainForm.SendToDebug(Name, 'Disconnecting from server')
        else if cmd = 'PART' then MainForm.SendToDebug(Name, 'Leaving channel ' + Copy(params, 1, AnsiPos(' ', params) - 1));
      continue;
    end

    //User was kicked from channel
    else if cmd = 'KICK' then begin
      temp := Copy(params, 1, AnsiPos(' ', params) - 1);
      Delete (params, 1, Length(temp)+1);
      if Copy(params, 1, AnsiPos(' ', params) - 1) = Nick then
        MainForm.SendToDebug(Name, 'You are being kicked from channel ' + temp + ' by ' + aNick);
    end

    //User joined channel
    else if (cmd = 'JOIN') then begin
      if anick = Nick then begin //Bot joined, advise OPs of commands.
        MainForm.SendToDebug(Name, 'Joined channel: ' + params);
        //Tcp.Socket.SendText(Format('PRIVMSG %s :%s' + NL, [params, MSG_ADVERT]));
      end;
      continue;
    end

    //mainchat or private message
    else if (cmd = 'PRIVMSG') or (cmd = 'NOTICE') then begin
      //<sender>!<hostname>@<IP> PRIVMSG <Nick> :<message>
      //<sender>!<hostname>@<IP> PRIVMSG #<channel> :<message>
      if Copy(params, 1, 1) = '#' then begin
        //channel messages
        params := Copy(params, AnsiPos(':', params)+1, MaxInt);
        if Copy(params, 1, 1) = Chr(1) then begin // /me text
          params := Copy(params, 2, MaxInt);
          if AnsiPos('ACTION', params) = 1 then
            params := StringReplace(params, 'ACTION ', '', []);
          if Copy(params, Length(params), 1) = Chr(1) then
            Delete(params, Length(params), 1);
          MainForm.SendToDebug(Name, 'Recieved message: ' + Copy(params, 1, 70));
          if BcFrom and not Muted then
            MainForm.Broadcast(Self, Prefix, aNick, params, '* %s %s');
        end else begin
          //Regular message
          MainForm.SendToDebug(Name, 'Recieved message: ' + Copy(params, 1, 70));
          if BcFrom and not Muted then
            MainForm.Broadcast(Self, Prefix, aNick, params, '<%s> %s');
        end;
        continue;
      end else begin
        //private messages
        if not ((aNick = aIdent) and ((aNick = 'NickServ') or (aNick = 'ChanServ'))) then begin
          MainForm.SendToDebug(Name, params);
          if cmd <> 'NOTICE' then begin //don't reply to notices
            params := Copy(params, AnsiPos(':', params)+1, MaxInt);
            MainForm.SendToDebug(Name, 'Recieved PM: ' + UTF8Decode(Copy(params, 1, 70)));
            LocalCommands(Self, aNick, params);
          end;
        end;
      end;
    end

    //User sets the mode
    else if (cmd = 'MODE') then
    begin
      GetOppedDeopped(params, ops, deops);
      for i := 0 to ops.Count-1 do
        TempPermsList.SetController(ops[i], 'Y');//given op
      for i := 0 to deops.Count-1 do
        TempPermsList.SetController(deops[i], 'U'); //op taken away
      ops.Free;
      deops.Free;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TIrc.SendMsgToPM(toNick : string; msg: WideString; multiline: boolean = true);
var
  fmt: string;
begin
  fmt := Format('PRIVMSG %s :%%s' + NL, [toNick]);
  SendMsgFmt(NL, UTF8Encode(msg), fmt, true, multiline);
end;
//------------------------------------------------------------------------------
procedure TIrc.SendMsgToChat(msg: WideString; multiline: boolean = true);
var
  fmt: string;
begin
  fmt := Format('PRIVMSG %s :%%s' + NL, [GetChannelsNoKeys()]);
  SendMsgFmt(NL, UTF8Encode(msg), fmt, false, multiline);
end;
//------------------------------------------------------------------------------
function TIrc.GetJoinCommands () : string;
//Join multiple channels with channel keys
//Sending single join command not implemented correctly
//by some severs with channel keys for some reason
var
  i : integer;
  chans : string;
begin
  chans := Channels;
  Result := '';
  while Length(chans) > 0 do begin
    i := AnsiPos(',', chans);
    if i = 0 then i := Length(chans) + 1; //end of the string
    Result := Result + 'JOIN ' + Copy(chans, 1, i-1) + NL;
    Delete (chans, 1, i);
  end;
end;

//------------------------------------------------------------------------------
//Strips the channel keys out of the list of channels.
function TIrc.GetChannelsNoKeys(): string;
var
  i, j: integer;
begin
  Result := Channels;
  while true do begin
    //find start of channel key, break on none present
    i := AnsiPos(' ', Result);
    if i = 0 then Break;
    //find length of channel key and delete it
    j := 0;
    while (i + j < Length(Result) + 1) and (Result[i + j] <> ',') do j := j + 1;
    Delete(Result, i, j);
  end;
end;
//------------------------------------------------------------------------------
constructor TIrc.Create;
begin
  inherited;
  Tcp.OnConnect := OnConnect;
  Tcp.OnError := OnError;
end;
//------------------------------------------------------------------------------
destructor TIrc.Destroy;
begin
  StartupCmds.Free;
  inherited;
end;
end.
