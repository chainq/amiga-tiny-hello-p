unit si_prc;

interface

implementation

var
  { dummy, so the linker will be happy }
  ExecBase: pointer; public name '_ExecBase';

procedure _haltproc(_exitcode:longint); cdecl; public name '_haltproc';
begin
  { dummy call }
end;

end.
