unit NCL_UserControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  NCL_IRCDCBase, Dialogs, Grids, ValEdit, ComCtrls, StdCtrls, CustomClasses,
  ExtCtrls;

type
  TUserForm = class(TForm)
    PageControl1: TPageControl;
    tsStatic: TTabSheet;
    lvStaticUsers: TListView;
    ebUsername: TEdit;
    gbIgnorePM: TGroupBox;
    gbControl: TGroupBox;
    rbControlYes: TRadioButton;
    rbControlNo: TRadioButton;
    rbControlUnset: TRadioButton;
    btnAddUpdate: TButton;
    btnDelete: TButton;
    btnStaticDone: TButton;
    btnStaticRefresh: TButton;
    lblUsername: TLabel;
    tsDynamic: TTabSheet;
    lvDynUsers: TListView;
    btnOverride: TButton;
    cbOpsControl: TCheckBox;
    btnDynDone: TButton;
    btnDynRefresh: TButton;
    gbIgnoreMC: TGroupBox;
    rbMCYes: TRadioButton;
    rbMCNo: TRadioButton;
    rbMCUnset: TRadioButton;
    rbPMYes: TRadioButton;
    rbPMNo: TRadioButton;
    rbPMUnset: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvStaticUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure UpdateDisplayStatic;
    procedure UpdateDisplayDynamic;
    procedure btnAddUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDoneClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnStaticRefreshClick(Sender: TObject);
    procedure btnDynRefreshClick(Sender: TObject);
    procedure cbOpsControlClick(Sender: TObject);
    procedure btnOverrideClick(Sender: TObject);
    procedure lvDynUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
  private
    CurCon : TIrcHubBase;
    Static : TUserList;
    Dyn : TUserList;
  end;

var
  UserForm: TUserForm;
  CSUseUserData: RTL_CRITICAL_SECTION;

implementation
uses NCL_Main, NCL_Utils;

{$R *.dfm}

//------------------------------------------------------------------------------
// {TUserForm}
//------------------------------------------------------------------------------
procedure TUserForm.FormCreate(Sender: TObject);
begin
  MainForm.Enabled := false;

  //get pointer to UserPermsList from MainForm
  CurCon := MainForm.GetCurrentConnection();
  Static := CurCon.UserPermsList;
  Dyn := CurCon.TempPermsList;
  Self.Caption := 'User Control Panel for ' + CurCon.Name;

  //need this when accessing the users data to prevent concurency errors
  InitializeCriticalSection(CSUseUserData);

  Static.Clean;
  Dyn.Clean;

  UpdateDisplayStatic;
  UpdateDisplayDynamic;
end;
//------------------------------------------------------------------------------
procedure TUserForm.FormDestroy(Sender: TObject);
begin
  if Static <> nil then
    Static.Clean;
  if Dyn <> nil then
    Dyn.Clean;
  MainForm.Enabled := true;
end;

procedure TUserForm.lvStaticUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  user : TUser;
begin
  if Selected and (Item <> nil) and (Item.Data <> nil) then begin
    user := Item.Data;
    //get data
    ebUsername.Text := user.Name;
    rbPMYes.Checked := user.PM = 'Y';
    rbPMNo.Checked := user.PM = 'N';
    rbPMUnset.Checked := user.PM = 'U';
    rbMCYes.Checked := user.MC = 'Y';
    rbMCNo.Checked := user.MC = 'N';
    rbMCUnset.Checked := user.MC = 'U';
    rbControlYes.Checked := user.Control = 'Y';
    rbControlNo.Checked := user.Control = 'N';
    rbControlUnset.Checked := user.Control = 'U';

    //enable gui elements
    btnDelete.Enabled := true;
  end else begin
    //blank data
    ebUsername.Clear;
    rbPMYes.Checked := false;
    rbPMNo.Checked := false;
    rbPMUnset.Checked := false;
    rbMCYes.Checked := false;
    rbMCNo.Checked := false;
    rbMCUnset.Checked := false;
    rbControlYes.Checked := false;
    rbControlNo.Checked := false;
    rbControlUnset.Checked := true;

    //disable gui elements
    btnDelete.Enabled := false;
  end;
end;

procedure TUserForm.UpdateDisplayStatic;
var
  i: integer;
  p: Pointer;
begin
  EnterCriticalSection(CSUseUserData);
  try
    lvStaticUsers.Items.BeginUpdate;
    p := nil;
    if lvStaticUsers.Selected <> nil then
      p := lvStaticUsers.Selected.Data;
    try
      lvStaticUsers.Clear;
      for i := 0 to Static.Count-1 do
        with lvStaticUsers.Items.Add do
        begin
          Data := Static[i];
          Caption := Static[i].Name;
          SubItems.Add(YNUToText(Static[i].PM));
          SubItems.Add(YNUToText(Static[i].MC));
          SubItems.Add(YNUToText(Static[i].Control));
        end;
    finally
      if p <> nil then
        for i := 0 to lvStaticUsers.Items.Count-1 do
          if lvStaticUsers.Items[i].Data = p then
            lvStaticUsers.Selected := lvStaticUsers.Items[i];
      lvStaticUsers.Items.EndUpdate;
    end;
  finally
    LeaveCriticalSection(CSUseUserData);
  end;
end;

procedure TUserForm.btnAddUpdateClick(Sender: TObject);
var
  user: TUser;
  temp : TListItem;
  name : string;
  pm, mc, c : char;
begin
  EnterCriticalSection(CSUseUserData);
  try
    pm := YesNoUnset(rbPMYes.Checked, rbPMNO.Checked, rbPMUnset.Checked);
    mc := YesNoUnset(rbMCYes.Checked, rbMCNO.Checked, rbMCUnset.Checked);
    c := YesNoUnset(rbControlYes.Checked, rbControlNO.Checked, rbControlUnset.Checked);
    name := ebUsername.Text;
    if name = '' then Exit;
    if (lvStaticUsers.Selected <> nil) and (lvStaticUsers.Selected.Data <> nil) then begin
      //something selected, update it
      user := lvStaticUsers.Selected.Data;
      if user.Name = name then begin
        //just updating user data, not name
        user.PM := pm;
        user.MC := mc;
        user.Control := c;
      end else begin
        //name not the same, making a new user
        Static.DeleteUserByName(name); //remove old entry with this name (if there is one)
        Static.AddUser(name, pm, mc, c);
      end;
    end else begin
      //nothing selected, Add a new item
      Static.AddUser(name, pm, mc, c);
    end;
  finally
    LeaveCriticalSection(CSUseUserData);
  end;
  UpdateDisplayStatic;
  //select item you just created/modified
  temp := lvStaticUsers.FindCaption(0, name, false, true, false);
  if temp <> nil then
    temp.Selected := true;
end;

procedure TUserForm.btnDeleteClick(Sender: TObject);
var
  i : integer;
begin
  if lvStaticUsers.Selected = nil then
    Exit;
  //set index to select after deletion
  i := lvStaticUsers.Selected.Index;
  if i = lvStaticUsers.Items.Count - 1 then
    i := i - 1;

  //remove the user
  EnterCriticalSection(CSUseUserData);
  try
    Static.DeleteUser(lvStaticUsers.Selected.Data);
  finally
    LeaveCriticalSection(CSUseUserData);
  end;

  UpdateDisplayStatic;
  //if not nothing left to select after deletion
  if lvStaticUsers.Items.Count <> 0 then
    lvStaticUsers.Items[i].Selected := true;
end;

procedure TUserForm.UpdateDisplayDynamic;
var
  i: integer;
  p: Pointer;
begin
  EnterCriticalSection(CSUseUserData);
  try
    //update OPcontrol checkbox
    cbOpsControl.Checked := CurCon.OPsControl;
    //update list
    lvDynUsers.Items.BeginUpdate;
    p := nil;
    if lvDynUsers.Selected <> nil then
      p := lvDynUsers.Selected.Data;
    try
      lvDynUsers.Clear;
      for i := 0 to Dyn.Count-1 do
        with lvDynUsers.Items.Add do
        begin
          Data := Dyn[i];
          Caption := Dyn[i].Name;
          SubItems.Add(YesNo(Ord(Dyn[i].PM = 'Y')));
          SubItems.Add(YesNo(Ord(Dyn[i].Control = 'Y')));
        end;
    finally
      if p <> nil then
        for i := 0 to lvDynUsers.Items.Count-1 do
          if lvDynUsers.Items[i].Data = p then
            lvDynUsers.Selected := lvDynUsers.Items[i];
      lvDynUsers.Items.EndUpdate;
    end;
  finally
    LeaveCriticalSection(CSUseUserData);
  end;
end;

procedure TUserForm.lvDynUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  if Selected and (Item <> nil) and (Item.Data <> nil) then begin
    //enable gui elements
    btnOverride.Enabled := true;

  end else begin
    //disable gui elements
    btnOverride.Enabled := false;
  end;
end;

procedure TUserForm.btnDoneClick(Sender: TObject);
begin
  Close;
end;

procedure TUserForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormDestroy(Sender);
end;

procedure TUserForm.btnStaticRefreshClick(Sender: TObject);
begin
  UpdateDisplayStatic;
end;

procedure TUserForm.btnDynRefreshClick(Sender: TObject);
begin
  UpdateDisplayDynamic
end;

procedure TUserForm.cbOpsControlClick(Sender: TObject);
begin
  CurCon.OPsControl := cbOpsControl.Checked;
end;

procedure TUserForm.btnOverrideClick(Sender: TObject);
var
  user: TUser;
  temp : TListItem;
begin
  if lvDynUsers.Selected <> nil then begin
    user := lvDynUsers.Selected.Data;
    Static.AddUser(user.Name, user.PM, user.MC, user.Control);
    UpdateDisplayStatic;
    temp := lvStaticUsers.FindCaption(0, user.name, false, true, false);
    if temp <> nil then
      temp.Selected := true;
    PageControl1.TabIndex := 0;
  end;
end;

end.

