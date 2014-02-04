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
program NetChatLink;

uses
  Forms,
  StrEncode in 'StrEncode.pas',
  NCL_IRCDCBase in 'NCL_IRCDCBase.pas',
  NCL_LocalCommands in 'NCL_LocalCommands.pas',
  NCL_Messages in 'NCL_Messages.pas',
  NCL_Utils in 'NCL_Utils.pas',
  NCL_DC in 'NCL_DC.pas',
  NCL_IRC in 'NCL_IRC.pas',
  DEC_Fmt in 'DEC_Fmt.pas',
  DEC_Hash in 'DEC_Hash.pas',
  DEC_Util in 'DEC_Util.pas',
  DEC_CRC in 'DEC_CRC.pas',
  DEC_Data in 'DEC_Data.pas',
  NCL_Main in 'NCL_Main.pas' {MainForm},
  NCL_UserControl in 'NCL_UserControl.pas' {UserForm},
  CustomClasses in 'CustomClasses.pas',
  NCL_Scripting in 'NCL_Scripting.pas' {Scripting},
  NCL_Update in 'NCL_Update.pas' {Update};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'NetChatLink';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
