unit Demo_Loader_DLLpas;

interface

uses
  Windows, Controls, StdCtrls, Classes, forms, dialogs, sysutils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var Form1: TForm1;
  Hdll : HWND; { ���������� ����������� DLL (��� ������������ ���������)}

  set_tk: procedure (x: real); stdcall;
  xsin: function (x: real): real; stdcall;


implementation


{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
{ �������� DLL }
begin
  @set_tk:= nil; @xsin:=nil;
  Hdll:= LoadLibrary(PChar('demo_dll.dll'));
  if Hdll > HINSTANCE_ERROR then begin
     { �������� ��������� �� ����������� ���������}
      @set_tk:=GetProcAddress(Hdll, 'set_tk');
      @xsin:=GetProcAddress(Hdll, 'xsin');
    end else ShowMessage('������ ��� �������� DLL !');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
{ ��� �������� ����� - ����������� DLL }
begin
  if Hdll > HINSTANCE_ERROR then begin FreeLibrary(Hdll); Hdll:=0; end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  set_tk(1);
  showmessage(floattostr(xsin(5)));
end;

end.
