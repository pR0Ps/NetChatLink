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
unit NCL_DC;
//------------------------------------------------------------------------------
interface
//------------------------------------------------------------------------------
uses
  Classes, ScktComp, SysUtils, ComCtrls, ExtCtrls, StrUtils, NCL_IRCDCBase, StrEncode, DEC_Hash;
type
//------------------------------------------------------------------------------
  THub = class(TIrcHubBase)
  protected
    procedure OnConnect(Sender: TObject; Socket: TCustomWinSocket); override;
    procedure OnRead(Sender: TObject; Socket: TCustomWinSocket); override;
    function EncodeLock(lock: string): string;
  public
    Share, Slots, Client, Mode: string;
    constructor Create; override;
    destructor Destroy; override;
    procedure SendMsgToPM(toUser: string; msg: WideString; multiline: boolean = true); override;
    procedure SendMsgToChat(msg: WideString; multiline: boolean = false); override;

    function GetUserName(User : string) : string; override;
  private
    MySID: string; //clients assigned SID
    UserSID: TStringList; //SID -> Username map
    procedure Broadcast(aUser: string; msg: WideString; format : string);
  end;

  THubsList = class(TList)
  protected
    function Get(Index: Integer): THub;
    procedure Put(Index: Integer; const Value: THub);
  public
    property Items[Index: Integer]: THub read Get write Put; default;
    function AddHub(Server, Mode, Name, Nick, Pass, Prefix, Share, Slots, Client, MsgRate, PMRate, ShowJP, OPsControl, Enabled, BcFrom, BcTo: string) : THub;
    procedure DeleteHub(Hub: THub);
  end;

const
  NMDC_DL = '|'; // nmdc delimiter
  ADC_DL = #10; //adc deliminater
  
//------------------------------------------------------------------------------
implementation
//------------------------------------------------------------------------------
uses NCL_Main, NCL_LocalCommands, NCL_Utils, NCL_Messages;

//------------------------------------------------------------------------------
{ THubsList }
//------------------------------------------------------------------------------
function THubsList.Get(Index: Integer): THub;
begin
  Result := inherited Get(Index);
end;
//------------------------------------------------------------------------------
procedure THubsList.Put(Index: Integer; const Value: THub);
begin
  inherited Put(Index, Value);
end;
//------------------------------------------------------------------------------
function THubsList.AddHub(Server, Mode, Name, Nick, Pass, Prefix, Share, Slots, Client, MsgRate, PMRate, ShowJP, OPsControl, Enabled, BcFrom, BcTo: string) : THub;
var
  hub: THub;
begin
  hub := THub.Create;
  GetHostPort(Server, hub.Host, hub.Port, 411);
  hub.Mode := Mode;
  hub.Name := Name;
  hub.Nick := Nick;
  hub.Pass := Pass;
  hub.Prefix := Prefix;
  //default values and error catching
  if Share = '' then hub.Share := '10737418240' else hub.Share := Share;
  if Slots = '' then hub.Slots := '5' else hub.Slots := Slots;
  if Client = '' then hub.Client := APP_NAME else hub.Client := Client;
  //fix invalid rates
  try hub.MsgRate := StrToInt(MsgRate); except hub.MsgRate := 0; end;
  if hub.MsgRate < 0 then hub.MsgRate := 0;
  try hub.PMRate := StrToInt(PMRate); except hub.PMRate := 0; end;
  if hub.PMRate < 0 then hub.PMRate := 0;

  try hub.ShowJP := StrToBool(ShowJP); except hub.ShowJP := false; end;
  try hub.OPsControl := StrToBool(OPsControl); except hub.OPsControl := false; end;
  try hub.Enabled := StrToBool(Enabled); except hub.Enabled := false; end;
  try hub.BcFrom := StrToBool(BcFrom); except hub.BcFrom := false; end;
  try hub.BcTo := StrToBool(BcTo); except hub.BcTo := false; end;
  Add(hub);
  Result := hub;
end;
//------------------------------------------------------------------------------
procedure THubsList.DeleteHub(Hub: THub);
begin
  if IndexOf(Hub) >= 0 then begin
    Hub.Tcp.Close;
    Delete(IndexOf(Hub));
  end;
  Hub.Free;
end;

//------------------------------------------------------------------------------
{ THub }
//------------------------------------------------------------------------------
procedure THub.OnConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  inherited;
  if Mode = 'ADC' then begin
    MainForm.SendToDebug(Name, 'Using ADC mode');
    Socket.SendText('HSUP ADBAS0 ADBASE ADTIGR' + ADC_DL);
  end else if Mode = 'NMDC' then
    MainForm.SendToDebug(Name, 'Using NMDC mode')
  else begin
    MainForm.SendToDebug(Name, 'Invalid mode specified (must be NMDC or ADC)');
    Tcp.Close;
  end;
end;
//------------------------------------------------------------------------------
function GetDelim(mode: string): string;
begin
  Result := '';
  if mode = 'NMDC' then
    Result := NMDC_DL
  else if mode = 'ADC' then
    Result := ADC_DL;
end;
//------------------------------------------------------------------------------
procedure TrimTrailingDL(var s, mode: string);
begin
  while (Length(s) > 0) and (s[Length(s)] = GetDelim(mode)) do
    Delete(s, Length(s), 1);
end;
//------------------------------------------------------------------------------
procedure ParseNMDCParams(line: string; var cmd, params: string);
var
  i: integer;
begin
  cmd := ''; params := '';
  if line = '' then Exit; // error
  if line[1] = '$' then begin
    i := AnsiPos(' ', line);
    if i <= 0 then i := Length(line)+1;
    if i <= 0 then Exit; // error
    cmd := UpperCase(Copy(line, 2, i-2));
    Delete(line, 1, i);
  end;
  params := line;
end;
//------------------------------------------------------------------------------
procedure ParseADCParams(line : string; var cmd: string; var ParamList : TStringList);
var
  i :integer;
  params : string;
begin
  //extra ParamList keys: DATA, SID1, SID2, (won't interefere with protocol keys)
  ParamList := TStringList.Create;
  params := line;

  //get the cmd and params
  if AnsiPos(UpperCase(line[1]), 'BCDEFHIU') = 0 then Exit; //badly formed adc command
  if params[5] <> ' ' then Exit; //all adc commands are 4 letters
  cmd := UpperCase(Copy(params, 2, 3));
  Delete(params, 1, 5); //remove the type and cmd, leaving just the params

  //Num of SIDs per msg type: B/F=1, E/D=2, rest are 0 or na
  if (AnsiPos(line[1], 'BFED') <> 0) or (cmd = 'SID') or (cmd = 'QUI') then begin
    //Add first SID to keys and delete it
    ParamList.Values['SID1'] := Copy (params, 1, 4);
    Delete (params, 1, 5);
  end;
  if AnsiPos(line[1], 'ED') <> 0 then begin
    //Add second SID to keys and delete it
    ParamList.Values['SID2'] := Copy (params, 1, 4);
    Delete (params, 1, 5);
  end;

  //special formatting/params passthough
  if (cmd = 'MSG') or (cmd = 'GPA') then begin
    i := AnsiPos (' ', params);
    if i = 0 then i := Length(params) + 1; //to the end of the command
    if cmd = 'GPS' then
      ParamList.Values['DATA'] := Copy(params, 1, i-1) //don't unescape the random pass data
    else
      ParamList.Values['DATA'] := ADCUnEscape(Copy(params, 1, i-1));
    Delete (params, 1, i); //remove the message from the params
  end else if cmd = 'STA' then begin
     ParamList.Values['DATA'] := params;
     Exit;
  end;

  //add regular parameters to the TStringList
  while Length(params) > 0 do begin
    //remove preceeding spaces
    while (params[1] = ' ') and (Length(params) > 0) do Delete(params, 1, 1);
    i := AnsiPos(' ', params);
    if i = 0 then i := Length(params) + 1; //last param
    ParamList.Values[Copy(params, 1, 2)] := Copy(params, 3, i - 3);
    Delete(params, 1, i);
  end;
end;
//------------------------------------------------------------------------------
function HashADCPassword(const key : string; const pass : string): string;
var
  binBuf : AnsiString;
begin
  //convert to binary, then add binary (issues with adding encoded strings)
  binBuf := BinToAnsi(AnsiToBin(pass) + Base32ToBin(key));
  Result := AnsiToBase32(THash_Tiger.CalcBinary(binBuf));
end;
//------------------------------------------------------------------------------
procedure THub.OnRead(Sender: TObject; Socket: TCustomWinSocket);
var
  i, crpos: integer;
  line, cmd, aUser, params, msg_format, temp :string;
  ParamList : TStringList;
begin
  while Socket.ReceiveLength > 0 do
    Buf := Buf + Socket.ReceiveText;

  while AnsiPos(GetDelim(Mode), Buf) > 0 do begin // only complete commands

    crpos := AnsiPos(GetDelim(Mode), Buf);
    line := Copy(Buf, 1, crpos);
    Delete(Buf, 1, crpos); // remove this line from buffer
    TrimTrailingDL(line, Mode); // remove delimiter

    //MainForm.SendToDebug(Name, line);

    //**************************************************************************
    //NMDC MODE
    //**************************************************************************
    if Mode = 'NMDC' then begin
      //parse commands
      ParseNMDCParams(line, cmd, params);

      if cmd = 'LOCK' then begin
        MainForm.SendToDebug(Name, 'Recieved $Lock command, replying with $Supports, $Key, and $ValidateNick');
        params := Copy(params, 1, AnsiPos(' ', params) - 1);
        Socket.SendText(Format('$Supports NoHello NoGetINFO' + NMDC_DL + '$Key %s' + NMDC_DL + '$ValidateNick %s' + NMDC_DL, [EncodeLock(params), Nick]));
      end
      else if cmd = 'GETPASS' then begin
        ConnStep := 2;
        MainForm.RefreshItem(Self);
        MainForm.SendToDebug(Name, 'Recieved $GetPass command, replying with $MyPass');
        Socket.SendText(Format('$MyPass %s' + NMDC_DL, [Pass]));
      end
      else if cmd = 'BADPASS' then begin
        MainForm.SendToDebug(Name, 'Bad password response from the hub');
        Tcp.Close;
      end
      else if cmd = 'HELLO' then begin
        ConnStep := 3;
        MainForm.RefreshItem(Self);
        MainForm.SendToDebug(Name, 'Recieved $Hello command from the hub, sending $Version and $MyINFO');
        Socket.SendText(Format('$Version 1,0091' + NMDC_DL + '$MyINFO $ALL %s %s<%s V:%s,M:A,H:0/1/0,S:%s>$ $100'#1'$$%s$' + NMDC_DL, [Nick, MSG_DESCRIPTION, Client, APP_VERSION, Slots, Share]));
      end
      else if (cmd = 'LOGEDIN') and (params = Nick) then begin
        MainForm.SendToDebug(Name, 'Logged in sucessfully!');
        ConnStep := 3;
        MainForm.RefreshItem(Self);
      end
      else if cmd = 'OPLIST' then begin
        MainForm.SendToDebug(Name, 'Recieved $OpList. Adding OPs to local OPList');
        //load ops
        with TStringList.Create do
          try
            Text := Trim(StringReplace(params, '$$', #13#10, [rfReplaceAll]));
            for i := 0 to Count-1 do
              TempPermsList.SetController(Strings[i], 'Y');
          finally
            Free;
          end;
        ConnStep := 3;
        MainForm.RefreshItem(Self);
      end
      else if cmd = 'QUIT' then begin
        //user quit
        if TempPermsList.IsController(params) = 'Y' then
          TempPermsList.SetController(params, 'U');
        if ShowJP then begin
          params := params + ' has left ' + Name;
          Broadcast('', NMDCUnEscape(params), '***%s%s');
        end;
      end
      {else if (cmd = 'MYINFO') and (Copy(params, 1, 4) = '$ALL') then begin
        if ShowJP then begin
          params := Copy(params, 6, Length(params)-6);
          params := Copy(params, 1, AnsiPos(' ', params)-1) + ' has joined ' + Name;
          Broadcast('', NMDCUnEscape(params), '***%s%s');
        end
      end}
      else if cmd = 'TO:' then begin
        // $To: user1 From: user2 $<user2> message
        i := AnsiPos('From: ', params);
        if i <= 0 then continue; //malformed PM format
        Delete(params, 1, i+5); //delete until after the 'From:'
        i := AnsiPos(' ', params);
        if i <= 0 then continue; //no space found, malformed pm format
        aUser := Copy(params, 1, i-1);
        Delete(params, 1, i);
        i := AnsiPos('> ', params); // get the command
        if i <= 0 then continue; // error
        Delete(params, 1, i+1); //delete the > and space
        MainForm.SendToDebug(Name, 'Recieved PM from a user: ' + params);
        LocalCommands (Self, aUser, params);
      end else if cmd = '' then begin
        //chat message
        MainForm.SendToDebug(Name, 'Recieved message: ' + params);

        if AnsiPos('<', params) = 1 then begin
          // remove <> around the nick
          Delete(params, 1, 1);
          if (AnsiPos(Nick, params) = 1) or MainForm.HasLinkPrefix(params) then // own message
            continue;
          i := AnsiPos('>', params);
          if i <= 0 then continue; // error
          aUser := Copy(params, 1, i-1);
          params := Copy(params, i+2, MaxInt);
          msg_format := '<%s> %s';

          if AnsiPos('/me ', params) = 1 then begin
            Delete(params, 1, 4);
            msg_format := '* %s %s';
          end;

          //command parsing from mainchat (fail silently)
          //LocalCommands(Self, aUser, params, false);
        end
        else if AnsiPos('** ', params) = 1 then begin // +me
          Delete(params, 1, 3);
          i := AnsiPos(' ', params);
          if i <= 0 then continue; // error
          aUser := Copy(params, 1, i-1);
          params := Copy(params, i+1, MaxInt);
          msg_format := '* %s %s';
        end
        else if AnsiPos('* ', params) = 1 then begin// action
          Delete(params, 1, 2);
          if (AnsiPos(Nick, params) = 1) or MainForm.HasLinkPrefix(params) then // own message
            continue;
          i := AnsiPos(' ', params);
          if i <= 0 then continue; // error
          aUser := Copy(params, 1, i-1);
          params := Copy(params, i+1, MaxInt);
          msg_format := '* %s %s';
        end;
        Broadcast(aUser, NMDCUnEscape(params), msg_format);
      end;
    end
    //**************************************************************************
    //ADC MODE
    //**************************************************************************
    else if Mode = 'ADC' then begin
      //parse params
      ParseADCParams (line, cmd, paramList);

      //MainForm.SendToDebug(Name, line);

      if cmd = 'SID' then begin
        //note assigned SID and send INF
        MySID := paramList.Values['SID1'];
        Socket.SendText(Format('BINF %s ID%s PD%s I40.0.0.0 NI%s HR0 HN1 HO0 SS%s AP%s VE%s SL%s DE%s' + ADC_DL, [MySID, AnsiToBase32(THash_Tiger.CalcBinary(Base32ToAnsi(MainForm.PID))), MainForm.PID, Nick, Share, ADCEscape(Client), ADCEscape(APP_VERSION), Slots, ADCEscape(MSG_DESCRIPTION)]));
        MainForm.SendToDebug(Name, 'SID "' + MySID + '" recieved, client information sent');

      end else if cmd = 'INF' then begin
        //INF is sent to you in the NORMAL state (fully connected)
        if ConnStep < 3 then begin
          ConnStep := 3;
          MainForm.RefreshItem(Self);
        end;
        //get SID (first param, and asociate it with the name (NI)
        //add OPs the the op list (if enabled)
        aUser := paramList.Values['SID1'];
        temp := paramList.Values['CT'];
        if aUser <> '' then begin //no SID with nick (hub bot)
          if paramList.Values['NI'] <> '' then //store SID/nick pair only if nick was specified
            UserSID.Values[aUser] :=  paramList.Values['NI'];
          try
            if (temp <> '') then begin
              i:= StrToInt(temp);
              if i >= 4 then //user is op or higher
                TempPermsList.SetController(UTF8Decode(paramList.Values['NI']), 'Y'); //add to oplist
              if i mod 2 = 1 then //is a bot, ignore it
                TempPermsList.SetBlockPM(UTF8Decode(paramList.Values['NI']), 'Y');
            end;
          except
            on Exception : EConvertError do MainForm.SendToDebug(Name, Exception.Message);
          end;
        end;

      end else if cmd = 'MSG' then begin
        //find out who sent the message and if it was a PM or a ME
        if paramList.Values['PM'] <> '' then begin //private message
          if paramList.Values['PM'] <> MySID then //not sending to itself
            LocalCommands(Self, paramList.Values['PM'], UTF8Decode(paramList.Values['DATA']));
        end else begin
          //public message
          MainForm.SendToDebug(Name, 'Recieved mainchat msg: ' + UTF8Decode(paramList.Values['DATA']));
          if paramList.Values['SID1'] = MySID then continue; //make sure it isn't from the bot
          //correct formatting of ME messages
          if paramList.Values['ME'] = '1' then
            Broadcast(UserSID.Values[paramList.Values['SID1']], UTF8Decode(paramList.Values['DATA']), '* %s %s')
          else
            Broadcast(UserSID.Values[paramList.Values['SID1']], UTF8Decode(paramList.Values['DATA']), '<%s> %s');
        end;

      end else if cmd = 'GPA' then begin
        //asked for verification, not completely connected yet
        if ConnStep > 2 then begin
          ConnStep := 2;
          MainForm.RefreshItem(Self);
        end;

        if Pass = '' then begin
          MainForm.SendToDebug(Name, 'Password requested, yet none supplied.');
          Tcp.Close;
        end else begin
          //take data, use it to hash the password, send back an HPAS <password>
          MainForm.SendToDebug(Name, 'Password requested, hashing and sending password');
          temp := HashADCPassword(paramList.Values['DATA'], Pass);
          Socket.SendText('HPAS ' + temp + ADC_DL);
        end;

      end else if cmd = 'STA' then begin
        //output debug information that STA gives
        params := paramList.Values['DATA']; //parser passes raw command through
        //get error code and remove it
        msg_format := Copy(params, 1, 3);
        Delete(params, 1, 4);
        //severity
        if msg_format[1] = '0' then begin
          temp := 'Success:';
          //most hubsofts send a success on connect
          ConnStep := 3;
          MainForm.RefreshItem(Self);
        end
        else if msg_format[1] = '1' then temp := 'Error:'
        else if msg_format[1] = '2' then temp := 'Fatal error:'
        else continue; //bad status format
        //add number + type
        temp := temp + ' (#' + msg_format + ', type: ';
        //error type
        if msg_format[2] = '0' then temp := temp + 'generic'
        else if msg_format[2] = '1' then temp := temp + 'hub'
        else if msg_format[2] = '2' then begin
          temp := temp + 'login/access';
          ConnStep := 2;
          MainForm.RefreshItem(Self);
        end
        else if msg_format[2] = '3' then temp := temp + 'disconnection'
        else if msg_format[2] = '4' then temp := temp + 'protocol'
        else if msg_format[2] = '5' then temp := temp + 'client-client'
        else temp := temp + 'Unknown';
        //add desciption
        temp := temp + ', msg: ' + ADCUnEscape(params) + ')';
        MainForm.SendToDebug(Name, temp);
      end else if cmd = 'QUI' then begin
        //user quit, remove them from OP/blocklist and userSID list
        temp := UserSID.Values[paramList.Values['SID1']];
        if ShowJP then
          Broadcast('', temp + ' has left ' + Name, '***%s%s');
        if TempPermsList.IsController(temp) = 'Y' then
          TempPermsList.SetController(temp, 'U')
        else if TempPermsList.IsBlockedPM(temp) = 'Y' then
          TempPermsList.SetBlockPM(temp, 'U');
        i := UserSID.IndexOfName(paramList.Values['SID1']);
        if i > -1 then
          UserSID.Delete(i);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure THub.Broadcast(aUser : string; msg: WideString; format : string);
begin
  //Send this method ONLY UNESCAPED WideString strings
  if BcFrom and not Muted then
      MainForm.Broadcast(Self, Prefix, aUser, msg, format);
end;

//------------------------------------------------------------------------------
function THub.GetUserName(User : string) : string;
begin
  if Mode = 'NMDC' then Result := User
  else if Mode = 'ADC' then begin
    Result := UserSID.Values[User];
    if Result = '' then Result := User;
  end else Result := '';
end;

function ns(b: byte): byte;
begin
  result := (b shl 4) or (b shr 4);
end;
//------Thanks to TF_Dark_Deeds for the working EncodeLock function-------------
function THub.EncodeLock(lock :string): string;
var
  tmp : string;
  i : integer;
  b : byte;
begin
  tmp := chr(ns(ord(lock[1]) xor ord(lock[length(lock)-1]) xor ord(lock[length(lock)]) xor 5));

  for i := 2 to length(lock) do begin
    b := ord(lock[i]) xor ord(lock[i-1]);
    tmp := tmp + chr((b shl 4) or (b shr 4));
  end;

  for i := 1 to length(tmp) do begin
  case ord(tmp[i]) of
    0    : result := concat(result,'/%DCN000%/');
    5    : result := concat(result,'/%DCN005%/');
    36   : result := concat(result,'/%DCN036%/');
    96   : result := concat(result,'/%DCN096%/');
    124  : result := concat(result,'/%DCN124%/');
    126  : result := concat(result,'/%DCN126%/');
    else   result := concat(result,tmp[i]);
  end;
 end;
end;
//------------------------------------------------------------------------------
procedure THub.SendMsgToPM(toUser : string; msg: WideString; multiline: boolean = true);
var
  fmt: string;
  nl : string;
begin
  if Mode = 'NMDC' then begin
    msg := NMDCEscape(msg);
    fmt := Format('$To: %s From: %s $<%s> %%s' + NMDC_DL, [toUser, Nick, Nick]);
    nl := #13#10;
  end else if Mode = 'ADC' then begin
    fmt := Format ('DMSG %s %s %%s PM%s' + ADC_DL, [MySID, toUser, MySID]);
    msg := UTF8Encode(ADCEscape(msg));
    nl := '\n';
  end;
  SendMsgFmt(nl, msg, fmt, true, multiline);
end;
//------------------------------------------------------------------------------
procedure THub.SendMsgToChat(msg: WideString; multiline: boolean = false);
var
  fmt: string;
  nl : string;
begin
  if Mode = 'NMDC' then begin
    msg := NMDCEscape(msg);
    fmt := Format('<%s> %%s' + NMDC_DL, [Nick]);
    nl := #13#10;
  end else if Mode = 'ADC' then begin
    fmt := Format('BMSG %s %%s' + ADC_DL, [MySID]);
    msg := UTF8Encode(ADCEscape(msg));
    nl := '\n';
  end;
  SendMsgFmt(nl, msg, fmt, false, multiline);
end;
//------------------------------------------------------------------------------
constructor THub.Create;
begin
  inherited;
  UserSID := TStringList.Create;
  Tcp.OnRead := Self.OnRead;
end;

//clean up variables
destructor THub.Destroy;
begin
  inherited;
  UserSID.Free;
end;
//------------------------------------------------------------------------------
end.
