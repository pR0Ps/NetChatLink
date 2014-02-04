{*****************************************************************************

  Delphi Encryption Compendium (DEC Part I)
  Version 5.2, Part I, for Delphi 7 - 2009

  Remarks:          Freeware, Copyright must be included

  Original Author:  (c) 2006 Hagen Reddmann, HaReddmann [at] T-Online [dot] de
  Modifications:    (c) 2008 Arvid Winkelsdorf, info [at] digivendo [dot] de

  Last change:      02. November 2008

  Description:      Format conversion utilities for DEC

  Remarks:          adds about 10Kb code if all TFormats are used,
                    designed to made universal code (not for speed),

  Unicode Remarks:  format conversions support ANSI input due to the given
                    RFC Specs, to preserve unicode use Delphi's UTF8Encode and
                    UTF8Decode before conversion

 * THIS SOFTWARE IS PROVIDED BY THE AUTHORS ''AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*****************************************************************************}

unit DEC_Fmt;

interface

uses Windows, SysUtils, Classes, DEC_Util;

{$I DEC_VER.INC}

type
  TDECFormat      = class;

  TFormat_Copy    = class;    // copy input to output, it's the default format, e.g. FormatClass = nil
  TFormat_HEX     = class;    // HEXadecimal in UpperCase

  TDECFormatClass = class of TDECFormat;

  TDECFormat = class(TDECObject) // for binary one to one convert = fmtCOPY
  protected
    class function DoEncode(const Value; Size: Integer): Binary; virtual; abstract;
    class function DoDecode(const Value; Size: Integer): Binary; virtual; abstract;
    class function DoIsValid(const Value; Size: Integer): Boolean; virtual; abstract;
  public
    class function Encode(const Value: Binary): Binary; overload;
    class function Encode(const Value; Size: Integer): Binary; overload;
    class function Decode(const Value: Binary): Binary; overload;
    class function Decode(const Value; Size: Integer): Binary; overload;
    class function IsValid(const Value: Binary): Boolean; overload;
    class function IsValid(const Value; Size: Integer): Boolean; overload;
  end;

  TFormat_Copy = class(TDECFormat)
  protected
    class function DoEncode(const Value; Size: Integer): Binary; override;
    class function DoDecode(const Value; Size: Integer): Binary; override;
    class function DoIsValid(const Value; Size: Integer): Boolean; override;
  end;

  TFormat_HEX = class(TDECFormat) // Hexadecimal = fmtHEX
  protected
    class function DoEncode(const Value; Size: Integer): Binary; override;
    class function DoDecode(const Value; Size: Integer): Binary; override;
    class function DoIsValid(const Value; Size: Integer): Boolean; override;
  public
    class function CharTable: PAnsiChar; virtual;
  end;

function ValidFormat(FormatClass: TDECFormatClass = nil): TDECFormatClass;
function FormatByName(const Name: String): TDECFormatClass;
function FormatByIdentity(Identity: LongWord): TDECFormatClass;

implementation

uses DEC_CRC;

resourcestring
  sStringFormatExists  = 'String format "%d" does not exist.';
  sInvalidStringFormat = 'Input is not an valid %s format.';
  sInvalidFormatString = 'Input can not be converted to %s format.';
  sFormatNotRegistered = 'String format is not registered.';

function ValidFormat(FormatClass: TDECFormatClass = nil): TDECFormatClass;
begin
  if FormatClass <> nil then Result := FormatClass
    else Result := TFormat_Copy;
end;

function FormatByName(const Name: String): TDECFormatClass;
begin
  Result := TDECFormatClass(DECClassByName(Name, TDECFormat));
end;

function FormatByIdentity(Identity: LongWord): TDECFormatClass;
begin
  Result := TDECFormatClass(DECClassByIdentity(Identity, TDECFormat));
end;

class function TDECFormat.Encode(const Value: Binary): Binary;
begin
  Result := DoEncode(Value[1], Length(Value));
end;

class function TDECFormat.Encode(const Value; Size: Integer): Binary;
begin
  Result := DoEncode(Value, Size);
end;

class function TDECFormat.Decode(const Value: Binary): Binary;
begin
  Result := DoDecode(Value[1], Length(Value));
end;

class function TDECFormat.Decode(const Value; Size: Integer): Binary;
begin
  Result := DoDecode(Value, Size);
end;

class function TDECFormat.IsValid(const Value: Binary): Boolean;
begin
  Result := DoIsValid(Value[1], Length(Value));
end;

class function TDECFormat.IsValid(const Value; Size: Integer): Boolean;
begin
  Result := DoIsValid(Value, Size);
end;

// TFormat_Copy
class function TFormat_Copy.DoEncode(const Value; Size: Integer): Binary;
begin
  SetLength(Result, Size);
  Move(Value, Result[1], Size);
end;

class function TFormat_Copy.DoDecode(const Value; Size: Integer): Binary;
begin
  SetLength(Result, Size);
  Move(Value, Result[1], Size);
end;

class function TFormat_Copy.DoIsValid(const Value; Size: Integer): Boolean;
begin
  Result := Size >= 0;
end;

function TableFind(Value: AnsiChar; Table: PAnsiChar; Len: Integer): Integer; assembler;
asm // Utility for TStringFormat_XXXXX
      PUSH  EDI
      MOV   EDI,EDX
      REPNE SCASB
      MOV   EAX,0
      JNE   @@1
      MOV   EAX,EDI
      SUB   EAX,EDX
@@1:  DEC   EAX
      POP   EDI
end;

class function TFormat_HEX.DoEncode(const Value; Size: Integer): Binary;
var
  S: PByte;
  D,T: PAnsiChar;
begin
  Result := '';
  if Size <= 0 then Exit;
  SetLength(Result, Size * 2);
  T := CharTable;
  D := PAnsiChar(Result);
  S := PByte(@Value);
  while Size > 0 do
  begin
    D[0] := T[S^ shr  4];
    D[1] := T[S^ and $F];
    Inc(D, 2);
    Inc(S);
    Dec(Size);
  end;
end;

class function TFormat_HEX.DoDecode(const Value; Size: Integer): Binary;
var
  S: PAnsiChar;
  D: PByte;
  T: PAnsiChar;
  I,P: Integer;
  HasIdent: Boolean;
begin
  Result := '';
  if Size <= 0 then Exit;
  SetLength(Result, Size div 2 +1);
  T := CharTable;
  D := PByte(Result);
  S := PAnsiChar(@Value);
  I := 0;
  HasIdent := False;
  while Size > 0 do
  begin
    P := TableFind(S^, T, 18);
    if P < 0 then P := TableFind(UpCase(S^), T, 16);
    if P < 0 then
      raise EDECException.CreateFmt(sInvalidStringFormat, [DECClassname(Self)]);
    Inc(S);
    if P >= 0 then
      if P > 16 then
      begin
        if not HasIdent then
        begin
          HasIdent := True;
          I := 0;
          D := PByte(Result);
        end;
      end else
      begin
        if Odd(I) then
        begin
          D^ := D^ or P;
          Inc(D);
        end else D^ := P shl 4;
        Inc(I);
      end;
    Dec(Size);
  end;
  SetLength(Result, PAnsiChar(D) - PAnsiChar(Result));
end;

class function TFormat_HEX.DoIsValid(const Value; Size: Integer): Boolean;
var
  S,T: PAnsiChar;
  L: Integer;
begin
  Result := True;
  T := CharTable;
  L := StrLen(T);
  S := PAnsiChar(@Value);
  while Result and (Size > 0) do
    if TableFind(S^, T, L) >= 0 then
    begin
      Dec(Size);
      Inc(S);
    end else Result := False;
end;

class function TFormat_HEX.CharTable: PAnsiChar; assembler;
asm
      MOV  EAX,OFFSET @@1
      RET
@@1:  DB   '0123456789ABCDEF'     // Table must be >= 18 Chars
      DB   'X$ abcdefhHx()[]{},;:-_/\*+"''',9,10,13,0
end;
end.
