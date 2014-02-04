unit NCL_Update;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XMLIntf;

type
  TUpdate = class(TForm)
    gbVersion: TGroupBox;
    Image1: TImage;
    lblCurVer: TLabel;
    lblNewVer: TLabel;
    mmRlsText: TMemo;
    btnUpdate: TButton;
    btnCancel: TButton;
    lblCurVerNum: TLabel;
    lblNewVerNum: TLabel;
    InitTimer: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure InitForm(Sender: TObject);
  private
    Info : IXMLDocument;
  public
    { Public declarations }
  end;

var
  Update: TUpdate;

implementation
uses ShellAPI, XMLDoc, NCL_Utils, NCL_Messages, NCL_Main;

{$R *.dfm}

procedure TUpdate.FormCreate(Sender: TObject);
begin
  MainForm.Enabled := false;
  lblCurVerNum.Caption := APP_VERSION;
  InitTimer.Enabled := true;
end;

procedure TUpdate.InitForm(Sender: TObject);
var
  root : IXMLNode;
begin
  InitTimer.Free;
  //get update data
  Info := CheckForUpdate();
  if Info <> nil then begin
    Info.Active := true;
    root := Info.DocumentElement;
    try
      if StrToInt(root.ChildNodes['ReleaseID'].Text) > StrToInt(APP_RELEASEID) then
        btnUpdate.Enabled := true;
    except
    end;
    lblNewVerNum.Caption := root.ChildNodes['Version'].Text;
    mmRlsText.Text := StringReplace(root.ChildNodes['Message'].Text, #10, sLineBreak, [rfReplaceAll])
  end else begin
    lblNewVerNum.Caption := 'Not availible';
    mmRlsText.Text := 'Could not download version info'#13#10'Check your internet connection and try again later';
  end;
end;

procedure TUpdate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormDestroy(Sender);
end;
procedure TUpdate.FormDestroy(Sender: TObject);
begin
  //free variables, re-enable mainform and exit
  if Info <> nil then
    Info := nil;
  MainForm.Enabled := true;
end;

procedure TUpdate.btnUpdateClick(Sender: TObject);
begin
  try
    ShellExecute(Handle, 'OPEN', PChar(string(Info.DocumentElement.ChildNodes['URL'].Text)), nil, nil, SW_SHOWDEFAULT);
  except
    on E : Exception do ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
  end;
end;

procedure TUpdate.btnCancelClick(Sender: TObject);
begin
  Close();
end;

end.
