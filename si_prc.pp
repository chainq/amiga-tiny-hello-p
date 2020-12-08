unit si_prc;

interface

implementation

var
  realExecBase: Pointer absolute $4;
  ExecBase: pointer; public name '_ExecBase';

function MyMain: longint; external name '_main';

function _start: longint; cdecl; public name '_start';
begin
  ExecBase:=realExecBase;
  _start:=MyMain;
end;

procedure _haltproc(_exitcode:longint); cdecl; public name '_haltproc';
begin
  { dummy call }
end;

end.
