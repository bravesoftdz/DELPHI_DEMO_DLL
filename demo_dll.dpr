library demo_dll;

{ ���������� ���������� DLL }
var tk: real=0;

procedure set_tk(x: real) export; stdcall;
{ ��������� ��������� ���������� "TK" }
begin
  tk:=x;
end;

function xsin(x: real): real export; stdcall;
{ ������� ������� }
begin
  xsin:=sin(x)+tk;
end;

{ ������� �������� � ������� }
exports set_tk, xsin ;

{ ������ ������������� ���������� DLL }
begin
  tk:=0;
end.
