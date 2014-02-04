{*****************************************************************************

  Delphi Encryption Compendium (DEC Part I)
  Version 5.2, Part I, for Delphi 7 - 2009

  Remarks:          Freeware, Copyright must be included

  Original Author:  (c) 2006 Hagen Reddmann, HaReddmann [at] T-Online [dot] de
  Modifications:    (c) 2008 Arvid Winkelsdorf, info [at] digivendo [dot] de

  Last change:      02. November 2008

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

unit DEC_Hash;

{$WARNINGS OFF}
{$RANGECHECKS OFF}

interface

uses SysUtils, Classes, DEC_Util, DEC_Fmt;

{$I DEC_VER.INC}
                                          
type
{all Hash Classes}
  THash_Tiger           = class;  {$DEFINE THash_Tiger_asm}

  TDECHashClass = class of TDECHash;

  TDECHash = class(TDECObject)
  protected
    FCount: array[0..7] of LongWord;
    FBuffer: PByteArray;
    FBufferSize: Integer;
    FBufferIndex: Integer;
    FPaddingByte: Byte;
    procedure DoTransform(Buffer: PLongArray); virtual; abstract;
    procedure DoInit; virtual; abstract;
    procedure DoDone; virtual; abstract;
  public
    destructor Destroy; override;

    procedure Init;
    procedure Calc(const Data; DataSize: Integer); virtual;
    procedure Done;

    function Digest: PByteArray; virtual; abstract;
    function DigestStr(Format: TDECFormatClass = nil): Binary; virtual;

    class function DigestSize: Integer; virtual; abstract;
    class function BlockSize: Integer; virtual; abstract;

    class function CalcBuffer(const Buffer; BufferSize: Integer; Format: TDECFormatClass = nil): Binary;
    class function CalcStream(const Stream: TStream; Size: Int64; Format: TDECFormatClass = nil; const Progress: IDECProgress = nil): Binary;
    class function CalcBinary(const Data: Binary; Format: TDECFormatClass = nil): Binary;
    class function CalcFile(const FileName: String; Format: TDECFormatClass = nil; const Progress: IDECProgress = nil): Binary;

    class function MGF1(const Data: Binary; MaskSize: Integer; Format: TDECFormatClass = nil): Binary; overload;
    class function MGF1(const Data; DataSize, MaskSize: Integer; Format: TDECFormatClass = nil): Binary; overload;
    class function KDF2(const Data,Seed: Binary; MaskSize: Integer; Format: TDECFormatClass = nil): Binary; overload;
    class function KDF2(const Data; DataSize: Integer; const Seed; SeedSize, MaskSize: Integer; Format: TDECFormatClass = nil): Binary; overload;
   // DEC's own KDF+MGF
    class function MGFx(const Data; DataSize, MaskSize: Integer; Format: TDECFormatClass = nil; Index: LongWord = 1): Binary; overload;
    class function MGFx(const Data: Binary; MaskSize: Integer; Format: TDECFormatClass = nil; Index: LongWord = 1): Binary; overload;
    class function KDFx(const Data,Seed: Binary; MaskSize: Integer; Format: TDECFormatClass = nil; Index: LongWord = 1): Binary; overload;
    class function KDFx(const Data; DataSize: Integer; const Seed; SeedSize, MaskSize: Integer; Format: TDECFormatClass = nil; Index: LongWord = 1): Binary; overload;
  published
    property PaddingByte: Byte read FPaddingByte write FPaddingByte;
  end;

  THashBaseMD4 = class(TDECHash)
  private
    FDigest: array[0..9] of LongWord;
  protected
    procedure DoInit; override;
    procedure DoDone; override;
  public
    class function DigestSize: Integer; override;
    class function BlockSize: Integer; override;
    function Digest: PByteArray; override;
  end;

  THash_Tiger = class(THashBaseMD4)
  private
    FRounds: Integer;
    procedure SetRounds(Value: Integer);
  protected
    procedure DoTransform(Buffer: PLongArray); override;
    procedure DoInit; override;
  public
    class function DigestSize: Integer; override;
  published
    property Rounds: Integer read FRounds write SetRounds;
  end;

function  ValidHash(HashClass: TDECHashClass = nil): TDECHashClass;
function  HashByName(const Name: String): TDECHashClass;
function  HashByIdentity(Identity: LongWord): TDECHashClass;
procedure SetDefaultHashClass(HashClass: TDECHashClass);

var
  StreamBufferSize: Integer = 8192;

implementation

uses DEC_Data;

{$I *.inc}

{                                        assembler                             pascal
THash_Tiger         :       24.6 cycles/byte      60.98 Mb/sec       60.7 cycles/byte      24.69 Mb/sec  147%
}

resourcestring
  sHashingOverflowError = 'Hash function have to many bits processed';
  sHashNotInitialized   = 'Hash must be initialized';
  sHashNoDefault        = 'No default hash are registered';

var
  FDefaultHashClass: TDECHashClass = nil;


function ValidHash(HashClass: TDECHashClass): TDECHashClass;
begin
  if HashClass <> nil then Result := HashClass
    else Result := FDefaultHashClass;
  if Result = nil then raise EDECException.Create(sHashNoDefault);
end;

function HashByName(const Name: String): TDECHashClass;
begin
  Result := TDECHashClass(DECClassByName(Name, TDECHash));
end;

function HashByIdentity(Identity: LongWord): TDECHashClass;
begin
  Result := TDECHashClass(DECClassByIdentity(Identity, TDECHash));
end;

procedure SetDefaultHashClass(HashClass: TDECHashClass);
begin
  if HashClass <> nil then HashClass.Register;
  FDefaultHashClass := HashClass;
end;

// .TDECHash
destructor TDECHash.Destroy;
begin
  ProtectBuffer(Digest^, DigestSize);
  ProtectBuffer(FBuffer^, FBufferSize);
  ReallocMem(FBuffer, 0);
  inherited Destroy;
end;

procedure TDECHash.Init;
begin
  FBufferIndex := 0;
  FBufferSize := BlockSize;
  ReallocMem(FBuffer, FBufferSize);
  FillChar(FBuffer^, FBufferSize, 0);
  FillChar(FCount, SizeOf(FCount), 0);
  DoInit;
end;

procedure TDECHash.Done;
begin
  DoDone;
  ProtectBuffer(FBuffer^, FBufferSize);
  FBufferSize := 0;
  ReallocMem(FBuffer, 0);
end;

procedure HashingOverflowError;
begin
  raise EDECException.Create(sHashingOverflowError);
end;

procedure HashNotInitialized;
begin
  raise EDECException.Create(sHashNotInitialized);
end;

procedure Increment8(var Value; Add: LongWord);
// Value := Value + 8 * Add
// Value: array[0..7] of LongWord
asm
    MOV  ECX,EDX
    LEA  EDX,[EDX * 8]
    SHR  ECX,25
    ADD  [EAX].DWord[ 0],EDX
    ADC  [EAX].DWord[ 4],ECX
    ADC  [EAX].DWord[ 8],0
    ADC  [EAX].DWord[12],0
    ADC  [EAX].DWord[16],0
    ADC  [EAX].DWord[20],0
    ADC  [EAX].DWord[24],0
    ADC  [EAX].DWord[28],0
    JC   HashingOverflowError
end;

procedure TDECHash.Calc(const Data; DataSize: Integer);
var
  Remain: Integer;
  Source: PByte;
begin
  if DataSize <= 0 then Exit;
  if FBuffer = nil then HashNotInitialized;
  Increment8(FCount, DataSize);
  Source := @TByteArray(Data)[0];
  if FBufferIndex > 0 then
  begin
    Remain := FBufferSize - FBufferIndex;
    if DataSize < Remain then
    begin
      Move(Source^, FBuffer[FBufferIndex], DataSize);
      Inc(FBufferIndex, DataSize);
      Exit;
    end;
    Move(Source^, FBuffer[FBufferIndex], Remain);
    DoTransform(Pointer(FBuffer));
    Dec(DataSize, Remain);
    Inc(Source, Remain);
  end;
  while DataSize >= FBufferSize do
  begin
    DoTransform(Pointer(Source));
    Inc(Source, FBufferSize);
    Dec(DataSize, FBufferSize);
  end;
  Move(Source^, FBuffer^, DataSize);
  FBufferIndex := DataSize;
end;

function TDECHash.DigestStr(Format: TDECFormatClass): Binary;
begin
  Result := ValidFormat(Format).Encode(Digest[0], DigestSize);
end;

class function TDECHash.CalcStream(const Stream: TStream; Size: Int64; Format: TDECFormatClass; const Progress: IDECProgress): Binary;
var
  Buffer: Binary;
  Bytes: Integer;
  Min,Max,Pos: Int64;
begin
  Min := 0;
  Max := 0;
  with Create do
  try
    Init;
    if StreamBufferSize <= 0 then StreamBufferSize := 8192;
    if Size < 0 then
    begin
      Stream.Position := 0;
      Size := Stream.Size;
      Pos := 0;
    end else Pos := Stream.Position;
    Bytes := StreamBufferSize mod FBufferSize;
    if Bytes = 0 then Bytes := StreamBufferSize
      else Bytes := StreamBufferSize + FBufferSize - Bytes;
    if Bytes > Size then SetLength(Buffer, Size)
      else SetLength(Buffer, Bytes);
    Min := Pos;
    Max := Pos + Size;
    while Size > 0 do
    begin
      if Assigned(Progress) then Progress.Process(Min, Max, Pos);
      Bytes := Length(Buffer);
      if Bytes > Size then Bytes := Size;
      Stream.ReadBuffer(Buffer[1], Bytes);
      Calc(Buffer[1], Bytes);
      Dec(Size, Bytes);
      Inc(Pos, Bytes);
    end;
    Done;
    Result := DigestStr(Format);
  finally
    Free;
    ProtectBinary(Buffer);
    if Assigned(Progress) then Progress.Process(Min, Max, Max);
  end;
end;

class function TDECHash.CalcBinary(const Data: Binary; Format: TDECFormatClass): Binary;
begin
  Result := CalcBuffer(Data[1], Length(Data), Format);
end;

class function TDECHash.CalcFile(const FileName: String; Format: TDECFormatClass; const Progress: IDECProgress): Binary;
var
  S: TFileStream;
begin
  S := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    Result := CalcStream(S, S.Size, Format, Progress);
  finally
    S.Free;
  end;
end;

class function TDECHash.CalcBuffer(const Buffer; BufferSize: Integer; Format: TDECFormatClass): Binary;
begin
  with Create do
  try
    Init;
    Calc(Buffer, BufferSize);
    Done;
    Result := DigestStr(Format);
  finally
    Free;
  end;
end;

class function TDECHash.MGF1(const Data; DataSize, MaskSize: Integer; Format: TDECFormatClass = nil): Binary;
// indexed Mask generation function, IEEE P1363 Working Group
// equal to KDF2 except without Seed
begin
  Result := KDF2(Data, DataSize, EmptyStr[1], 0, MaskSize, Format);
end;

class function TDECHash.MGF1(const Data: Binary; MaskSize: Integer; Format: TDECFormatClass = nil): Binary;
begin
  Result := KDF2(Data, Length(Data), EmptyStr[1], 0, MaskSize, Format);
end;

class function TDECHash.KDF2(const Data; DataSize: Integer; const Seed; SeedSize, MaskSize: Integer; Format: TDECFormatClass = nil): Binary;
// Key Generation Function 2, IEEE P1363 Working Group
var
  I,Rounds,DigestBytes: Integer;
  Dest: PByteArray;
  Count: LongWord;
begin
  DigestBytes := DigestSize;
  Assert(MaskSize >= 0);
  Assert(DataSize >= 0);
  Assert(SeedSize >= 0);
  Assert(DigestBytes >= 0);
  with Create do
  try
    Rounds := (MaskSize + DigestBytes -1) div DigestBytes;
    SetLength(Result, Rounds * DigestBytes);
    Dest := @Result[1];
    for I := 0 to Rounds -1 do
    begin
      Count := SwapLong(I);
      Init;
      Calc(Data, DataSize);
      Calc(Count, SizeOf(Count));
      Calc(Seed, SeedSize);
      Done;
      Move(Digest[0], Dest[I * DigestBytes], DigestBytes);
    end;
  finally
    Free;
  end;
  SetLength(Result, MaskSize);
  Result := ValidFormat(Format).Encode(Result[1], MaskSize);
end;

class function TDECHash.KDF2(const Data, Seed: Binary; MaskSize: Integer; Format: TDECFormatClass = nil): Binary;
begin
  Result := KDF2(Data[1], Length(Data), Seed[1], Length(Seed), MaskSize, Format);
end;

class function TDECHash.KDFx(const Data; DataSize: Integer; const Seed; SeedSize, MaskSize: Integer; Format: TDECFormatClass = nil; Index: LongWord = 1): Binary;
// DEC's own KDF, even stronger
var
  I,J: Integer;
  Count: LongWord;
  R: Byte;
begin
  Assert(MaskSize >= 0);
  Assert(DataSize >= 0);
  Assert(SeedSize >= 0);
  Assert(DigestSize >= 0);

  SetLength(Result, MaskSize);
  Index := SwapLong(Index);
  with Create do
  try
    for I := 0 to MaskSize -1 do
    begin
      Init;

      Count := SwapLong(I);
      Calc(Count, SizeOf(Count));
      Calc(Result[1], I);

      Calc(Index, SizeOf(Index));

      Count := SwapLong(SeedSize);
      Calc(Count, SizeOf(Count));
      Calc(Seed, SeedSize);

      Count := SwapLong(DataSize);
      Calc(Count, SizeOf(Count));
      Calc(Data, DataSize);

      Done;

      R := 0;
      for J := 0 to DigestSize -1 do
        R := R xor Digest[J];

      Result[I +1] := AnsiChar(R);
    end;
  finally
    Free;
  end;
  Result := ValidFormat(Format).Encode(Result[1], MaskSize);
end;

class function TDECHash.KDFx(const Data, Seed: Binary; MaskSize: Integer; Format: TDECFormatClass = nil; Index: LongWord = 1): Binary;
begin
  Result := KDFx(Data[1], Length(Data), Seed[1], Length(Seed), MaskSize, Format, Index);
end;

class function TDECHash.MGFx(const Data; DataSize, MaskSize: Integer; Format: TDECFormatClass = nil; Index: LongWord = 1): Binary;
begin
  Result := KDFx(Data, DataSize, EmptyStr[1], 0, MaskSize, Format, Index);
end;

class function TDECHash.MGFx(const Data: Binary; MaskSize: Integer; Format: TDECFormatClass = nil; Index: LongWord = 1): Binary;
begin
  Result := KDFx(Data[1], Length(Data), EmptyStr[1], 0, MaskSize, Format, Index);
end;


// .THashBaseMD4
class function THashBaseMD4.DigestSize: Integer;
begin
  Result := 16;
end;

class function THashBaseMD4.BlockSize: Integer;
begin
  Result := 64;
end;

function THashBaseMD4.Digest: PByteArray;
begin
  Result := @FDigest;
end;

procedure THashBaseMD4.DoInit;
begin
  FDigest[0] := $67452301;
  FDigest[1] := $EFCDAB89;
  FDigest[2] := $98BADCFE;
  FDigest[3] := $10325476;
  FDigest[4] := $C3D2E1F0;
  FDigest[5] := $76543210;
  FDigest[6] := $FEDCBA98;
  FDigest[7] := $89ABCDEF;
  FDigest[8] := $01234567;
  FDigest[9] := $3C2D1E0F;
end;

procedure THashBaseMD4.DoDone;
begin
  if FCount[2] or FCount[3] <> 0 then HashingOverflowError;
  if FPaddingByte = 0 then FPaddingByte := $80;
  FBuffer[FBufferIndex] := FPaddingByte;
  Inc(FBufferIndex);
  if FBufferIndex > FBufferSize - 8 then
  begin
    FillChar(FBuffer[FBufferIndex], FBufferSize - FBufferIndex, 0);
    DoTransform(Pointer(FBuffer));
    FBufferIndex := 0;
  end;
  FillChar(FBuffer[FBufferIndex], FBufferSize - FBufferIndex, 0);
  Move(FCount, FBuffer[FBufferSize - 8], 8);
  DoTransform(Pointer(FBuffer));
end;

// .THash_Tiger
class function THash_Tiger.DigestSize: Integer;
begin
  Result := 24;
end;

procedure THash_Tiger.SetRounds(Value: Integer);
begin
  if (Value < 3) or (Value > 32) then Value := 3;
  FRounds := Value;
end;

{$IFNDEF THash_Tiger_asm}
procedure THash_Tiger.DoTransform(Buffer: PLongArray);
type
  PTiger_Data = ^TTiger_Data;
  TTiger_Data = array[0..3, 0..255] of Int64;

  PInt64Array = ^TInt64Array;
  TInt64Array = array[0..7] of Int64;

var
  A,B,C,T: Int64;
  x0,x1,x2,x3,x4,x5,x6,x7: Int64;
  I: Integer;
begin
  A  := PInt64Array(@FDigest)[0];
  B  := PInt64Array(@FDigest)[1];
  C  := PInt64Array(@FDigest)[2];
  x0 := PInt64Array(Buffer)[0];
  x1 := PInt64Array(Buffer)[1];
  x2 := PInt64Array(Buffer)[2];
  x3 := PInt64Array(Buffer)[3];
  x4 := PInt64Array(Buffer)[4];
  x5 := PInt64Array(Buffer)[5];
  x6 := PInt64Array(Buffer)[6];
  x7 := PInt64Array(Buffer)[7];

  for I := 1 to FRounds do {a Loop is faster for PC's with small Cache}
  begin
    if I > 1 then {key schedule}
    begin
      Dec(x0, x7 xor $A5A5A5A5A5A5A5A5);
      x1 := x1 xor x0;
      Inc(x2, x1);
      Dec(x3, x2 xor (not x1 shl 19));
      x4 := x4 xor x3;
      Inc(x5, x4);
      Dec(x6, x5 xor (not x4 shr 23));
      x7 := x7 xor x6;
      Inc(x0, x7);
      Dec(x1, x0 xor (not x7 shl 19));
      x2 := x2 xor x1;
      Inc(x3, x2);
      Dec(x4, x3 xor (not x2 shr 23));
      x5 := x5 xor x4;
      Inc(x6, x5);
      Dec(x7, x6 xor $0123456789ABCDEF);
    end;

    C := C xor x0;
    Dec(A, TTiger_Data(Tiger_Data)[0, LongWord(C)        and $FF] xor
           TTiger_Data(Tiger_Data)[1, LongWord(C) shr 16 and $FF] xor
           TTiger_Data(Tiger_Data)[2,          C  shr 32 and $FF] xor
           TTiger_Data(Tiger_Data)[3, LongWord(C shr 32) shr 16 and $FF]);
    Inc(B, TTiger_Data(Tiger_Data)[3, LongWord(C) shr  8 and $FF] xor
           TTiger_Data(Tiger_Data)[2, LongWord(C) shr 24] xor
           TTiger_Data(Tiger_Data)[1, LongWord(C shr 32) shr 8 and $FF] xor
           TTiger_Data(Tiger_Data)[0, LongWord(C shr 32) shr 24]);
    if I = 1 then B := B shl 2 + B else
      if I = 2 then B := B shl 3 - B
        else B := B shl 3 + B;

    A := A xor x1;
    Dec(B, TTiger_Data(Tiger_Data)[0, LongWord(A)        and $FF] xor
           TTiger_Data(Tiger_Data)[1, LongWord(A) shr 16 and $FF] xor
           TTiger_Data(Tiger_Data)[2,          A  shr 32 and $FF] xor
           TTiger_Data(Tiger_Data)[3, LongWord(A shr 32) shr 16 and $FF]);
    Inc(C, TTiger_Data(Tiger_Data)[3, LongWord(A) shr  8 and $FF] xor
           TTiger_Data(Tiger_Data)[2, LongWord(A) shr 24] xor
           TTiger_Data(Tiger_Data)[1, LongWord(A shr 32) shr 8 and $FF] xor
           TTiger_Data(Tiger_Data)[0, LongWord(A shr 32) shr 24]);
    if I = 1 then C := C shl 2 + C else
      if I = 2 then C := C shl 3 - C
        else C := C shl 3 + C;

    B := B xor x2;
    Dec(C, TTiger_Data(Tiger_Data)[0, LongWord(B)        and $FF] xor
           TTiger_Data(Tiger_Data)[1, LongWord(B) shr 16 and $FF] xor
           TTiger_Data(Tiger_Data)[2,          B  shr 32 and $FF] xor
           TTiger_Data(Tiger_Data)[3, LongWord(B shr 32) shr 16 and $FF]);
    Inc(A, TTiger_Data(Tiger_Data)[3, LongWord(B) shr  8 and $FF] xor
           TTiger_Data(Tiger_Data)[2, LongWord(B) shr 24] xor
           TTiger_Data(Tiger_Data)[1, LongWord(B shr 32) shr 8 and $FF] xor
           TTiger_Data(Tiger_Data)[0, LongWord(B shr 32) shr 24]);
    if I = 1 then A := A shl 2 + A else
      if I = 2 then A := A shl 3 - A
        else A := A shl 3 + A;

    C := C xor x3;
    Dec(A, TTiger_Data(Tiger_Data)[0, LongWord(C)        and $FF] xor
           TTiger_Data(Tiger_Data)[1, LongWord(C) shr 16 and $FF] xor
           TTiger_Data(Tiger_Data)[2,          C  shr 32 and $FF] xor
           TTiger_Data(Tiger_Data)[3, LongWord(C shr 32) shr 16 and $FF]);
    Inc(B, TTiger_Data(Tiger_Data)[3, LongWord(C) shr  8 and $FF] xor
           TTiger_Data(Tiger_Data)[2, LongWord(C) shr 24] xor
           TTiger_Data(Tiger_Data)[1, LongWord(C shr 32) shr 8 and $FF] xor
           TTiger_Data(Tiger_Data)[0, LongWord(C shr 32) shr 24]);
    if I = 1 then B := B shl 2 + B else
      if I = 2 then B := B shl 3 - B
        else B := B shl 3 + B;

    A := A xor x4;
    Dec(B, TTiger_Data(Tiger_Data)[0, LongWord(A)        and $FF] xor
           TTiger_Data(Tiger_Data)[1, LongWord(A) shr 16 and $FF] xor
           TTiger_Data(Tiger_Data)[2,          A  shr 32 and $FF] xor
           TTiger_Data(Tiger_Data)[3, LongWord(A shr 32) shr 16 and $FF]);
    Inc(C, TTiger_Data(Tiger_Data)[3, LongWord(A) shr  8 and $FF] xor
           TTiger_Data(Tiger_Data)[2, LongWord(A) shr 24] xor
           TTiger_Data(Tiger_Data)[1, LongWord(A shr 32) shr 8 and $FF] xor
           TTiger_Data(Tiger_Data)[0, LongWord(A shr 32) shr 24]);
    if I = 1 then C := C shl 2 + C else
      if I = 2 then C := C shl 3 - C
        else C := C shl 3 + C;

    B := B xor x5;
    Dec(C, TTiger_Data(Tiger_Data)[0, LongWord(B)        and $FF] xor
           TTiger_Data(Tiger_Data)[1, LongWord(B) shr 16 and $FF] xor
           TTiger_Data(Tiger_Data)[2,          B  shr 32 and $FF] xor
           TTiger_Data(Tiger_Data)[3, LongWord(B shr 32) shr 16 and $FF]);
    Inc(A, TTiger_Data(Tiger_Data)[3, LongWord(B) shr  8 and $FF] xor
           TTiger_Data(Tiger_Data)[2, LongWord(B) shr 24] xor
           TTiger_Data(Tiger_Data)[1, LongWord(B shr 32) shr 8 and $FF] xor
           TTiger_Data(Tiger_Data)[0, LongWord(B shr 32) shr 24]);
    if I = 1 then A := A shl 2 + A else
      if I = 2 then A := A shl 3 - A
        else A := A shl 3 + A;

    C := C xor x6;
    Dec(A, TTiger_Data(Tiger_Data)[0, LongWord(C)        and $FF] xor
           TTiger_Data(Tiger_Data)[1, LongWord(C) shr 16 and $FF] xor
           TTiger_Data(Tiger_Data)[2,          C  shr 32 and $FF] xor
           TTiger_Data(Tiger_Data)[3, LongWord(C shr 32) shr 16 and $FF]);
    Inc(B, TTiger_Data(Tiger_Data)[3, LongWord(C) shr  8 and $FF] xor
           TTiger_Data(Tiger_Data)[2, LongWord(C) shr 24] xor
           TTiger_Data(Tiger_Data)[1, LongWord(C shr 32) shr 8 and $FF] xor
           TTiger_Data(Tiger_Data)[0, LongWord(C shr 32) shr 24]);
    if I = 1 then B := B shl 2 + B else
      if I = 2 then B := B shl 3 - B
        else B := B shl 3 + B;

    A := A xor x7;
    Dec(B, TTiger_Data(Tiger_Data)[0, LongWord(A)        and $FF] xor
           TTiger_Data(Tiger_Data)[1, LongWord(A) shr 16 and $FF] xor
           TTiger_Data(Tiger_Data)[2,          A  shr 32 and $FF] xor
           TTiger_Data(Tiger_Data)[3, LongWord(A shr 32) shr 16 and $FF]);
    Inc(C, TTiger_Data(Tiger_Data)[3, LongWord(A) shr  8 and $FF] xor
           TTiger_Data(Tiger_Data)[2, LongWord(A) shr 24] xor
           TTiger_Data(Tiger_Data)[1, LongWord(A shr 32) shr 8 and $FF] xor
           TTiger_Data(Tiger_Data)[0, LongWord(A shr 32) shr 24]);
    if I = 1 then C := C shl 2 + C else
      if I = 2 then C := C shl 3 - C
        else C := C shl 3 + C;

    T := A; A := C; C := B; B := T;
  end;

  PInt64Array(@FDigest)[0] := A xor PInt64Array(@FDigest)[0];
  PInt64Array(@FDigest)[1] := B  -  PInt64Array(@FDigest)[1];
  PInt64Array(@FDigest)[2] := C  +  PInt64Array(@FDigest)[2];
end;
{$ENDIF}

procedure THash_Tiger.DoInit;
begin
  SetRounds(FRounds);
  if FPaddingByte = 0 then FPaddingByte := $01;
  FDigest[0] := $89ABCDEF;
  FDigest[1] := $01234567;
  FDigest[2] := $76543210;
  FDigest[3] := $FEDCBA98;
  FDigest[4] := $C3B2E187;
  FDigest[5] := $F096A5B4;
end;
end.
