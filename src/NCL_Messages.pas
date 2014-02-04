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
unit NCL_Messages;
//------------------------------------------------------------------------------
interface
uses Classes, SysUtils;
//------------------------------------------------------------------------------
const
  APP_RELEASEID = '8';
  APP_NAME = 'NetChatLink';
  APP_VERSION = 'Alpha 8';

  
  MSG_PROGRAM = APP_NAME + ' ' + APP_VERSION;
  MSG_DESCRIPTION = MSG_PROGRAM + ' by pR0Ps';
  MSG_ABOUT = MSG_DESCRIPTION + '. Licensed under GNU GPL 3.'#13#10'Visit the project homepage at http://netchatlink.sourceforge.net';
  MSG_NOCMD = 'I only respond to preset commands (check them by typing ".help")';
  MSG_NOCONTROL = 'Permissions error: You are not allowed to control me';
  MSG_HELP =
      'The following commands are available to OPs:'#13#10 +
      '.help - shows this screen'#13#10 +
      '.mute <true/false> - enable/disable broadcasting messages to/from your hub/irc'#13#10 +
      '.myinfo - shows the settings associated with your hub/irc'#13#10 +
      '.block <nick> <scope> - block nick (scope can be PM/MC/BOTH)'#13#10 +
      '.blocklist <scope> - Show the blocked nick list (scope can be PM/MC)'#13#10 +
      '.unblock <nick> <scope> - unblock nick (scope can be PM/MC/BOTH)'#13#10 +
      '.unblockall <scope> - remove all blocks (scope can be PM/MC)'#13#10 +
      '.controllers - show all users that can control this bot via commands'#13#10 +
      '.setcontroller <nick> <val> - set who can control this bot via commands (val is Y/N/U)'#13#10 +
      '.opscontrol <true/false> - allow OPs to control the bot'#13#10 +
      '.links - show all currently linked hubs/ircs'#13#10 +
      '.about - shows the info about the author';

//------------------------------------------------------------------------------
implementation
//------------------------------------------------------------------------------
end.
