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
unit StrEncode;

interface

function IntToBin(value, digits: integer): string;
function BinToInt(value: string): integer;
function HexToBin(const s: string): string;
function HexToBase32(const s: string) : string;
function Base32ToBin(const s : string) : string;
function Base32ToAnsi(const s: string) : AnsiString;
function AnsiToBin(const s : AnsiString) : string;
function AnsiToBase32(const s: AnsiString) : string;
function BinToAnsi(s : string) : AnsiString;
function BinToBase32(s : string) : AnsiString;
const Base32Chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';

implementation
uses SysUtils, Math;

//------------------------------------------------------------------------------
function IntToBin(value, digits: integer): string;
begin
  result := StringOfChar('0',digits) ;
  while value > 0 do begin
    if (value and 1) = 1 then
      result [digits] := '1';
    dec(digits) ;
    value := value shr 1;
  end;
end;
//------------------------------------------------------------------------------

function BinToInt(value: string): integer;
var i: integer;
begin
  Result:=0;
  //remove leading zeroes
  while Copy(value,1,1) = '0' do
    value := Copy(value, 2, Length(Value)-1);
  //do the conversion
  for i := Length(value) downto 1 do
    if Copy(value, i, 1) = '1' then
      Result := Result + (1 shl (Length(value) - i));
end;
//------------------------------------------------------------------------------

function HexToBin(const s: string): string;
//converts a hex string to its binary representation
var i, j: integer;
const HexChars = '0123456789ABCDEF';
begin
  Result := '';
  for i := 1 to Length(s) do begin
    j := AnsiPos(UpperCase(s[i]), HexChars);
    if j = 0 then begin Result := ''; Exit; end; //bad character
    Result := Result + IntToBin(j-1, 4);
  end
end;
//------------------------------------------------------------------------------

function Base32ToBin(const s : string) : string;
//converts a Base32 string to it's binary representaion
var
  i, j : integer;
begin
  Result := '';
  //convert the input string to binary data
  for i := 1 to Length(s) do begin
    //find character in reference array
    j := AnsiPos(UpperCase(s[i]), Base32Chars);
    if j = 0 then begin Result := ''; Exit; end; //error, invalid character in string (result is '')
    Result := Result + IntToBin(j-1, 5);
  end;
end;
//------------------------------------------------------------------------------

function AnsiToBin(const s : AnsiString) : string;
//converts a UTF8String to its binary representation
var
  i : integer;
begin
  //convert the input string to binary data
  for i := 1 to Length(s) do
    Result := Result + IntToBin(Ord(s[i]), 8);
end;
//------------------------------------------------------------------------------

function BinToAnsi(s : string) : AnsiString;
var
  i, outLen : integer;
begin
  //chop off extra bits
  outLen := Floor(Length(s) / 8);
  //conversion
  Result := StringOfChar(' ', outLen);
  for i := 1 to outLen do
    Result[i] := Chr(BinToInt(Copy(s, ((i-1)*8)+1, 8)));
end;
//------------------------------------------------------------------------------

function BinToBase32(s : string) : AnsiString;
var
  i, outLen, temp : integer;
begin
  outLen := Ceil(Length(s) / 5);
  //add trailing 0s for padding
  s := s + StringOfChar('0',(outLen * 5) - Length(s));
  //translate the bit buffer into a string of Base32 encoded characters
  Result := StringOfChar(' ', outLen);
  for i := 1 to outLen do begin
    temp := BinToInt(Copy(s, ((i-1)*5)+1, 5));
    if temp > 31 then
      Result[i] := '='
    else
      Result[i] := Base32Chars[temp + 1];
  end;
end;
//------------------------------------------------------------------------------

function Base32ToAnsi(const s : string) : AnsiString;
//takes a string of Base32 encoded characters and outputs the binary representation in ANSI
begin
  Result := BinToAnsi(Base32ToBin(s));
end;
//------------------------------------------------------------------------------

function AnsiToBase32(const s : AnsiString) : string;
//takes a array of bytes (represented as an unencoded string) and converts it to a Base32 encoding
begin
  Result := BinToBase32(AnsiToBin(s));
end;
//------------------------------------------------------------------------------

function HexToBase32(const s: string) : string;
begin
  Result := BinToBase32(HexToBin(s));
end;
end.
