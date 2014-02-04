unit CustomClasses;

interface
uses Classes;

type
  TUser = class
  public
    Name : WideString;
    PM, MC, Control: char; //Y=yes, N=no, U=unset (OP can override)
  end;

  TUserList = class(TList)
  protected
    function Get(Index: Integer): TUser;
    procedure Put(Index: Integer; const Value: TUser);
  public
    procedure FreeItems;
    destructor Destroy; override;
    
    property Items[Index: Integer]: TUser read Get write Put; default;
    procedure AddUser(Name : WideString; PM, MC, control : char);
    procedure DeleteUser(User: TUser);
    procedure DeleteUserByName(name : WideString);
    function FindUser(Name : WideString): TUser;
    procedure Clean;

    procedure SetBlockPM(Name : WideString; PM : char);
    procedure SetBlockMC(Name : WideString; MC : char);
    procedure SetController(Name : WideString; Control : char);

    procedure SetBlockAllPM (c : char);
    procedure SetBlockAllMC (c : char);

    function IsBlockedPM (Name : WideString) : char;
    function IsBlockedMC (Name : WideString) : char;
    function IsController (Name : WideString) : char;

    function GetControllers : TStringList;
    function GetBlockedPMs : TStringList;
    function GetBlockedMCs : TStringList;
  end;

implementation
uses SysUtils;
//------------------------------------------------------------------------------
//{TUserList}
//------------------------------------------------------------------------------
function TUserList.Get(Index: Integer): TUser;
begin
  Result := inherited Get(Index);
end;
//------------------------------------------------------------------------------
procedure TUserList.Put(Index: Integer; const Value: TUser);
begin
  inherited Put(Index, Value);
end;
//------------------------------------------------------------------------------
procedure TUserList.SetBlockPM(Name : WideString; PM : char);
var
  user : TUser;
begin
  user := FindUser(Name);
  if user <> nil then
     user.PM := PM
  else
    AddUser(Name, PM, 'U', 'U');
end;
//------------------------------------------------------------------------------
procedure TUserList.SetblockMC(Name : WideString; MC : char);
var
  user : TUser;
begin
  user := FindUser(Name);
  if user <> nil then
     user.MC := MC
  else
    AddUser(Name, 'U', MC, 'U');
end;

//------------------------------------------------------------------------------
procedure TUserList.SetController(Name : WideString; Control : char);
var
  user : TUser;
begin
  user := FindUser(Name);
  if user <> nil then
     user.Control := Control
  else
    AddUser(Name, 'U', 'U', Control);
end;

//------------------------------------------------------------------------------
procedure TUserList.Clean;
//cleans useless values out of the list
var
  i, c : integer;
  temp : TUser;
begin
  c := Count - 1; i := 0;
  while i <= c do begin
    temp := Items[i];
    if (temp <> nil) and (temp.PM = 'U') and (temp.MC = 'U') and (temp.Control = 'U') then begin
      DeleteUser(temp);
      c := c - 1;
    end else
      i := i + 1;
  end;
end;

//------CHANGE ALL--------------------------------------------------------------
procedure TUserList.SetBlockAllPM (c : char);
var i : integer;
begin
  for i := 0 to Count - 1 do
    Items[i].PM := c;
end;
procedure TUserList.SetBlockAllMC (c : char);
var i :integer;
begin
  for i := 0 to Count - 1 do
    Items[i].MC := c;
end;

//------------------------------------------------------------------------------
function TUserList.IsBlockedPM(Name : WideString) : char;
var
  user: TUser;
begin
  user := FindUser(Name);
  if user <> nil then
    Result := user.PM
  else
    Result := 'U';
end;
//------------------------------------------------------------------------------
function TUserList.IsBlockedMC(Name: WideString): char;
var
  user: TUser;
begin
  user := FindUser(Name);
  if user <> nil then
    Result := user.MC
  else
    Result := 'U';
end;
//------------------------------------------------------------------------------
function TUserList.IsController(Name : WideString) : char;
var
  user: TUser;
begin
  user := FindUser(Name);
  if user <> nil then
    Result := user.Control
  else
    Result := 'U';
end;

//------------------------------------------------------------------------------
function TUserList.GetBlockedPMs : TSTringList;
var
  temp : TUser;
  i : integer;
begin
   Result := TStringList.Create;
   for i := 0 to Count - 1 do begin
    temp := Get(i);
    if temp.PM = 'Y' then Result.Add(temp.Name);
   end;
end;
//------------------------------------------------------------------------------
function TUserList.GetBlockedMCs : TSTringList;
var
  temp : TUser;
  i : integer;
begin
   Result := TStringList.Create;
   for i := 0 to Count - 1 do begin
    temp := Get(i);
    if temp.MC = 'Y' then Result.Add(temp.Name);
   end;
end;
//------------------------------------------------------------------------------
function TUserList.GetControllers : TSTringList;
var
  temp : TUser;
  i : integer;
begin
   Result := TStringList.Create;
   for i := 0 to Count - 1 do begin
    temp := Get(i);
    if temp.Control = 'Y' then Result.Add(temp.Name);
   end;
end;

//------------------------------------------------------------------------------
function TUserList.FindUser(Name : WideString): TUser;
var
  i : integer;
  temp : TUser;
begin
  Result := nil;
  for i := 0 to Count - 1 do begin
    temp := Get(i);
    if UpperCase(temp.Name) = UpperCase(Name) then begin
      Result := temp;
      Exit;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TUserList.AddUser(Name: WideString; PM, MC, Control : char);
var
  user: TUser;
begin
  //don't allow duplicates, remove the previous entry if it exists
  user := FindUser(Name);
  if user <> nil then
     DeleteUser(user);
  user := TUser.Create;
  user.Name := Name;
  user.PM := PM;
  user.MC := MC;
  user.Control := Control;
  Add(user);
end;
//------------------------------------------------------------------------------
procedure TUserList.DeleteUser(User: TUser);
begin
  if IndexOf(User) >= 0 then
    Delete(IndexOf(User));
  User.Free;
end;

procedure TUserList.DeleteUserByName(name : WideString);
var user : TUser;
begin
  user := FindUser(name);
  if user <> nil then
    DeleteUser(user);
end;

procedure TUserList.FreeItems;
var i : integer;
begin
  for i:= 0 to Count-1 do
    Items[i].Free;
  Clear;
end;

destructor TUserList.Destroy;
begin
  FreeItems;
  inherited;
end;
end.
