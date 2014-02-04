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
unit NCL_LocalCommands;
//------------------------------------------------------------------------------
interface
//------------------------------------------------------------------------------
uses NCL_IRCDCBase;
//------------------------------------------------------------------------------
procedure LocalCommands(sender: TIrcHubBase; aUser: string; line: WideString; complain : boolean = true);
//------------------------------------------------------------------------------
implementation
uses NCL_Main, NCL_Messages, SysUtils, NCL_Utils;

//------------------------------------------------------------------------------
procedure ParseCommands (line :string; var cmd, params, subparams :string);
var
  i: integer;
begin
  cmd := '';
  if line[1] <> '.' then Exit; //not a command
  subparams := line;
  i := AnsiPos (' ', subparams);
  if i = 0 then i := Length(subparams) + 1; //entire string is command
  cmd := UpperCase(Copy(subparams, 2, i-2)); //dont include the period
  Delete (subparams,1, i);
  //getting the params
  i := AnsiPos (' ',subparams);
  if i = 0 then i := Length(subparams) + 1;
  params := Copy(subparams, 1, i-1);
  Delete (subparams,1, i);
  subparams := UpperCase(subparams);
end;
//------------------------------------------------------------------------------
procedure LocalCommands (sender: TIrcHubBase; aUser: string; line : WideString; complain : boolean = true);
var
  cmd, params, subparams : string;
begin
  if sender.IsBlockedPM(sender.GetUserName(aUser)) then Exit; //we don't want your kind here

  ParseCommands (line, cmd, params, subparams);


  if (cmd <> 'ABOUT') and (not sender.IsController(aUser)) then
    if complain then begin
      sender.SendMsgToPM(aUser, MSG_NOCONTROL);
      Exit;
    end;

  if cmd = 'HELP' then
    sender.SendMsgToPM(aUser, MSG_HELP)

  else if cmd = 'MUTE' then begin
    params := UpperCase(params);
    if params = 'TRUE' then begin
      sender.Muted := true;
      sender.SendMsgToPM(aUser, 'You have successfully muted all traffic. No messages will be transmitted to or from your hub/irc.');
    end else if params = 'FALSE' then begin
      sender.Muted := false;
      sender.SendMsgToPM(aUser, 'You have successfully unmuted all traffic. Messages will again be transmitted to and from your hub/irc.');
    end else
      sender.SendMsgToPM(aUser, 'You need to specify if muting is true or false');
  end


  else if cmd = 'MYINFO' then
    sender.SendMsgToPM(aUser, sender.GetMyInfo())

  //BLOCK commands
  else if cmd = 'BLOCK' then begin
    if subparams = 'PM' then
      sender.UserPermsList.SetBlockPM(params, 'Y')
    else if subparams = 'MC' then
      sender.UserPermsList.SetBlockMC(params, 'Y')
    else if subparams = 'BOTH' then begin
      sender.UserPermsList.SetBlockPM(params, 'Y');
      sender.UserPermsList.SetBlockMC(params, 'Y');
    end else begin
      sender.SendMsgToPM(aUser, 'You need to provide a scope to block '+params+' in (PM/MC/BOTH).');
      Exit;
    end;
    sender.SendMsgToPM(aUser, 'User '+params+' was added to the '+subparams+' block list.');
  end

  else if cmd = 'UNBLOCK' then begin
    if subparams = 'PM' then
      sender.UserPermsList.SetBlockPM(params, 'N')
    else if subparams = 'MC' then
      sender.UserPermsList.SetBlockMC(params, 'N')
    else if subparams = 'BOTH' then begin
      sender.UserPermsList.SetBlockPM(params, 'N');
      sender.UserPermsList.SetBlockMC(params, 'N');
    end else begin
      sender.SendMsgToPM(aUser, 'You need to provide a scope to unblock '+params+' in (PM/MC/BOTH).');
      Exit;
    end;
    sender.SendMsgToPM(aUser, 'User '+params+' was removed from the '+subparams+' block list.');
  end

  else if cmd = 'BLOCKLIST' then begin
    params := UpperCase(params);
    if params = 'PM' then
      sender.SendMsgToPM(aUser, sender.GetBlockedPMList())
    else if params = 'MC' then
      sender.SendMsgToPM(aUser, sender.GetBlockedMCList())
    else
      sender.SendMsgToPM(aUser, 'You need to provide a scope of blocked users to view (PM/MC).');
  end

  else if cmd = 'UNBLOCKALL' then begin
    params := UpperCase(params);
    if params = 'PM' then
      sender.UserPermsList.SetBlockAllPM('N')
    else if params = 'MC' then
      sender.UserPermsList.SetBlockAllMC('N')
    else begin
      sender.SendMsgToPM(aUser, 'You need to provide a scope of blocks to remove (PM/MC).');
      Exit;
    end;
    sender.SendMsgToPM(aUser, 'All blocks in the '+params+' scope were removed.');
  end

  //CONTROLLER STUFF
  else if cmd = 'CONTROLLERS' then
    sender.SendMsgToPM(aUser, sender.GetControllerList())

  else if cmd = 'SETCONTROLLER' then begin
    if (subparams = 'Y') or (subparams = 'N') or (subparams = 'U') then
      sender.UserPermsList.SetController(params, subparams[1])
    else begin
      sender.SendMsgToPM(aUser, 'You need to provide a setting for '+params+' (U=Unset, Y=Yes, N=No)');
      Exit;
    end;
    sender.SendMsgToPM(aUser, 'User '+params+' now has a controller setting of '+YNUToText(subparams[1]));
  end

  //OPS AS CONTROLLERS
  else if cmd = 'OPSCONTROL' then begin
    params := UpperCase(params);
    if params = 'TRUE' then begin
      sender.OPsControl := true;
      sender.SendMsgToPM(aUser, 'OPs can now control this bot');
    end else if params = 'FALSE' then begin
      sender.OPsControl := false;
      sender.SendMsgToPM(aUser, 'OPs cannot control this bot unless otherwise specified');
    end else
      sender.SendMsgToPM(aUser, 'You need to specify if OPs as controllers is true or false');
  end

  else if cmd = 'LINKS' then // show all connected hubs/ircs
    sender.SendMsgToPM(aUser, MainForm.GetLinks)

  else if cmd = 'ABOUT' then
    sender.SendMsgToPM(aUser, MSG_ABOUT)

  else if complain then
    sender.SendMsgToPM(aUser, MSG_NOCMD)
end;
end.
