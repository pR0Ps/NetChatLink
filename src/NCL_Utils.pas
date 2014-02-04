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
unit NCL_Utils;
//------------------------------------------------------------------------------
interface
uses XMLIntf;
//------------------------------------------------------------------------------
function YesNo(b: byte): string;
function StrToBool(s: string): boolean;
function GeneratePID : string;
procedure MyReplace(var s : WideString; const What: WideString; WithWhat :WideString);
function ADCEscape(s: WideString): WideString;
function ADCUnEscape(s: WideString): WideString;
function NMDCEscape(s: WideString) : WideString;
function NMDCUnEscape(s: WideString) : WideString;
function EscapeReplace (s : WideString; e : WideChar; find : WideString; replace : array of WideString) : WideString;
procedure GetHostPort(const HostPort: string; var Host: string; var Port: integer; DefaultPort: integer);
function CheckForUpdate() : IXMLDocument;
function UpdateAvailible() : boolean;
function RadioBttnToText(nmdc, adc: boolean): string;
function ParseChannels (channels : string): string;
function YesNoUnset (y, n, d : boolean) : char;
function YNUToText (c : char) : string;

//------------------------------------------------------------------------------
implementation
uses NCL_Messages, SysUtils, Math, WinProcs, DEC_Hash, StrEncode, XMLDoc, Wininet;
//------------------------------------------------------------------------------

function YesNo(b: byte): string;
begin
  if b = 0 then
    Result := 'No'
  else
    Result := 'Yes';
end;
//------------------------------------------------------------------------------
function StrToBool(s: string): boolean;
begin
  s := LowerCase(s);
  Result := (s = 'on') or (s = '1') or (s = 'yes');
end;
//------------------------------------------------------------------------------
function GeneratePID : string;
begin
  //randomness to hash (date+time+ticks since windows started)
  //could add more to make it more random
  Result := AnsiToBase32(THash_Tiger.CalcBinary(DateToStr(Now) + TimeToStr(Now) + IntToStr(GetTickCount)));
end;
//------------------------------------------------------------------------------
procedure MyReplace(var s :WideString; const What: WideString; WithWhat :WideString);
var
  i :integer;
begin
  if What <> #0 then
    s := StringReplace(s, What, WithWhat, [rfReplaceAll])
  else begin
    i := 1;
    while i < Length(s) do
    begin
      if s[i] = #0 then
        s := Copy(s, 1, i-1) + WithWhat + Copy(s, i+1, Length(s));
      Inc(i, Length(WithWhat));
    end;
  end;
end;
//------------------------------------------------------------------------------
function EscapeReplace(s : WideString; e : WideChar; find : WideString; replace : array of WideString) : WideString;
//escape characters can be one character only
//escape characters are replaced with the corrisponding element of the replace array
var
  i : integer;
  found : boolean;
  numEscapes: integer;
begin
  Result := '';
  //must be same length (escape symbol <-> escaped char map)
  numEscapes := Length(find);
  if numEscapes <> Length (replace) then raise Exception.Create('Invalid parameters passed to EscapeReplace function');;

  while Length(s) > 1 do begin
    if s[1] = e then begin //found escape character
      found := false;
      //find matching escape symbol in next char and replace it with the escaped char
      for i := 1 to numEscapes do begin
        if s[2] = find[i] then begin
          Result := Result + replace[i-1];
          found := true;
          Break;
        end;
      end;
      if not found then
        Result := Result + s[1] + s[2];
      Delete(s, 1, 2);
    end else begin
      //skip to the char before the next escape char
      i := AnsiPos (e, s);
      if i = 0 then begin //no more escaped chars left
        Result := Result + s;
        Exit;
      end else if i = 2 then begin
        //charater after next is escape, better performing than general case
        Result := Result + s[1];
        Delete(s, 1, 1);
      end else begin
        Result := Result + Copy(s, 1, i-1);
        Delete(s, 1, i-1);
      end;
    end;
  end;
  if Length(s) > 0 then
    Result := Result + s;
end;
//------------------------------------------------------------------------------
function ADCEscape(s: WideString): WideString;
begin
  Result := s;
  MyReplace(Result, '\', '\\');//must be first
  MyReplace(Result, ' ', '\s');
  MyReplace(Result, #10, '\n');
end;
function ADCUnEscape (s : WideString): WideString;
begin
  Result := EscapeReplace (s, '\', '\sn', ['\',' ',#10]);
end;
//------------------------------------------------------------------------------
function NMDCEscape(s: WideString) : WideString;
begin
  Result := s;
  MyReplace(Result, #0, '&#0;');
  MyReplace(Result, #5, '&#5;');
  MyReplace(Result, #36, '&#36;');
  MyReplace(Result, #96, '&#96;');
  MyReplace(Result, #124, '&#124;');
  MyReplace(Result, #126, '&#126;');
end;
//------------------------------------------------------------------------------
function NMDCUnEscape(s: WideString) : WideString;
begin
  Result := s;
  MyReplace(Result, '&#0;', #0);
  MyReplace(Result, '&#5;', #5);
  MyReplace(Result, '&#36;', #36);
  MyReplace(Result, '&#96;', #96);
  MyReplace(Result, '&#124;', #124);
  MyReplace(Result, '&#126;', #126);
end;
//------------------------------------------------------------------------------
procedure GetHostPort(const HostPort: string; var Host: string; var Port: integer; DefaultPort: integer);
var
  t: integer;
begin
  t := AnsiPos(':', HostPort);
  if t <= 0 then begin
    Host := HostPort;
    Port := DefaultPort;
  end else begin
    Host := Copy(HostPort, 1, t-1);
    Port := StrToIntDef(Copy(HostPort, t+1, MaxInt), DefaultPort);
  end;
end;
//------------------------------------------------------------------------------
function CheckForUpdate() : IXMLDocument;
const
  fileURL = 'http://netchatlink.sourceforge.net/update.php';
var
  hSession, hURL: HInternet;
	Buffer: array[1..1024] of Byte;
	BufferLen: DWORD;
  temp, temp2 : string;
begin
  Result := nil;
  hSession := InternetOpen(PChar(APP_NAME), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0) ;
	try
		hURL := InternetOpenURL(hSession, PChar(fileURL), nil, 0, INTERNET_FLAG_RELOAD, 0) ;
		try
			temp := '';
			repeat
				InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
        SetString(temp2, PAnsiChar(@Buffer), BufferLen);
        temp := temp + temp2;
			until BufferLen = 0;
      Result := NewXMLDocument;
      try
        Result.XML.Text := temp;
        Result.Active := true;
        if Result.DocumentElement.NodeName <> 'NCLUpdate' then
          Result := nil;
      except
        Result := nil;
      end;
		finally
			InternetCloseHandle(hURL)
		end
	finally
		InternetCloseHandle(hSession)
	end
end;
function UpdateAvailible() : boolean;
var
  doc : IXMLDocument;
begin
  Result := false;
  doc := CheckForUpdate();
  try
    if (doc <> nil) and (StrToInt(doc.DocumentElement.ChildNodes['ReleaseID'].Text) > StrToInt(APP_RELEASEID)) then begin
      Result := true;
    end;
  finally
    if doc <> nil then
      doc := nil;
  end;
end;
//------------------------------------------------------------------------------
function RadioBttnToText(nmdc, adc: boolean): string;
begin
  Result := '';
  if nmdc then
    Result := 'NMDC'
  else if adc then
    Result := 'ADC';
end;
//------------------------------------------------------------------------------
function ParseChannels(channels : string): string;
//cleans up channel list into the proper format
//format is #<channame>{<space><chankey>}<comma>#<channame>{<space><chankey>}<comma>#<channame>...
var
  i, j : integer;
begin
  Result := '';
  while Length(channels) > 0 do begin
    //remove garbage before channel name
    while channels[1] <> '#' do begin
      Delete(channels, 1, 1);
      if Length(channels) = 0 then Break;
    end;
    if Length(channels) = 0 then Break;
    //find end of channel name
    i := AnsiPos (' ', channels);
    j := AnsiPos (',', channels);
    if i = 0 then i := Length(channels) + 1;
    if j = 0 then j := Length(channels) + 1;
    //add channel to result
    Result := Result + Copy(channels, 1, Min(i, j) - 1);
    Delete(channels, 1, Min(i, j));
    if i < j then begin
      //has channel key
      //find end of channel key
      i := AnsiPos (' ', channels);
      j := AnsiPos (',', channels);
      if i = 0 then i := Length(channels) + 1;
      if j = 0 then j := Length(channels) + 1;
      //add channel key to result
      Result := Result + ' ' + Copy(channels, 1, Min(i, j) - 1);
      Delete(channels, 1, Min(i, j));
    end;
    Result := Result + ',';
  end;
  //remove trailing comma
  i := Length(Result);
  if (i > 0) and (Result[i] = ',') then
    Delete(Result, i, 1);
end;
//------------------------------------------------------------------------------
function YesNoUnset (y, n, d : boolean) : char;
begin
  if y then
    Result := 'Y'
  else if n then
    Result := 'N'
  else
    Result := 'U';
end;
//------------------------------------------------------------------------------
function YNUToText (c : char) : string;
begin
  if c = 'Y' then
    Result := 'Yes'
  else if c = 'N' then
    Result := 'No'
  else if c = 'U' then
    Result := 'Unset'
  else
    Result := 'Unknown';
end;

end.
