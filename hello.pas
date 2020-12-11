program hello;

var
  ExecBase: Pointer absolute 4;
  DOSBase: pointer;

{ * declare used OS functions. alternatively one could copy the includes
    from the system unit, and just $INCLUDE it. but I wanted to make this
    example self contained. * }

procedure CloseLibrary(libHandle: Pointer location 'a1'); SysCall ExecBase 414;
function OpenLibrary(libname: PChar    location 'a1';
                     libver : Cardinal location 'd0'): Pointer; SysCall ExecBase 552;
function DOSOutput: LongInt; SysCall DOSBase 60;
function DOSWrite(fileh : LongInt location 'd1';
                  buffer: Pointer location 'd2';
                  length: LongInt location 'd3'): LongInt; SysCall DOSBase 48;

const
    HelloText: string[15] = 'Hello, World!'#10;

function start: longint; cdecl; public name '_start';
begin
  start:=1;
  DOSBase:=OpenLibrary('dos.library',0);
  if assigned(DOSBase) then
    begin
      DOSWrite(DOSOutput,@HelloText[1],length(HelloText));
      CloseLibrary(DOSBase);
      start:=0;
    end;
end;

begin
end.
