unit NCL_Scripting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NCL_IRC;

type
  TScripting = class(TForm)
    mmScript: TMemo;
    btnDone: TButton;
    btnCancel: TButton;
    btnReload: TButton;
    btnHelp: TButton;
    procedure btnDoneClick(Sender: TObject);
    procedure btnReloadClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    CurCon : TIrc;
  public
    { Public declarations }
  end;

var
  Scripting: TScripting;

implementation

uses NCL_Main;

{$R *.dfm}

procedure TScripting.btnDoneClick(Sender: TObject);
begin
  //save and exit
  CurCon.StartupCmds.Clear;
  CurCon.StartupCmds.AddStrings(mmScript.Lines);
  Close;
end;

procedure TScripting.btnReloadClick(Sender: TObject);
begin
  //reload data from connection
  mmScript.Lines := CurCon.StartupCmds
end;

procedure TScripting.btnCancelClick(Sender: TObject);
begin
   //exit without saving
   Close;
end;

procedure TScripting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormDestroy(Sender);
end;

procedure TScripting.FormCreate(Sender: TObject);
begin
  MainForm.Enabled := false;

  //get pointer to current connection from MainForm
  CurCon := TIrc(MainForm.GetCurrentConnection());
  Self.Caption := 'Script Editor for ' + CurCon.Name;
  mmScript.Lines := CurCon.StartupCmds
end;

procedure TScripting.FormDestroy(Sender: TObject);
begin
  MainForm.Enabled := true;
end;

procedure TScripting.btnHelpClick(Sender: TObject);
begin
  MessageBox(Handle,
    'Use this dialogue to enter commands you want the application to send to the IRC server immediately after it connects. One command per line.'#13#10 +
    '- %n'#9'Nick'#13#10 +
    '- %p'#9'Password'#13#10 +
    '- %s'#9'Server'#13#10 +
    '- %d'#9'Description' + 
    '- %i'#9'Ident'#13#10 +
    #13#10'Example: PRIVMSG NickServ :IDENTIFY %n %p'
    , 'Instructions', +mb_OK +mb_ICONINFORMATION);
end;

end.
