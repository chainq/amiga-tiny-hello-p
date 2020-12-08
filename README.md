# Tiny "Hello, World!" in Free Pascal for Amiga
# ---------------------------------------------

This is a silly size coding experiment, to figure out what's the smallest
executable size which is possible with the Amiga/m68k version of Free Pascal.

I got bored by some assembly fans pointing out that Free Pascal generates
"huge" executables, and I wanted to prove that if you know what you're doing,
and stick to the AmigaOS API (much like you'd do in assembly), you can actually
produce really tiny executables with Free Pascal, which can compete with most
C compilers for the same platform.

The result I've got is actually 348 bytes for a "Hello, world!" when compiled
for a 68000, and 332 bytes when compiled for a 68020.

## So, what kind of magic this is doing?

Well, just what's needed. It provides an alternate version of the startup code
used by Free Pascal, which bypasses the entire System unit initialization, and
jumps directly into a custom user `main` function. Then - as none of the original
unit infrastructure is being referred to - the linker just optimizes all of it away,
and none of it lands in the executable.

## Files

* `si_prc.pp` - the custom Startup code
* `hello.pas` - a "Hello, World!" in Pascal, using direct AmigaOS function calls
* `hello`     - the example Amiga binary output (68000 version)
* `build.sh`  - cross-build script

## Requirements

Needs (means: it was only tested with)  Free Pascal current SVN trunk. Not tested
with the release version. You also need `vasm` and `vlink` for this to work.

## Disclaimer

I actually don't encourage this kind of programming. Free Pascal provides a
convenient infrastructure for high level programming needs, starting from stack
management, fast heap routines preventing system level fragmentation, advanced
file handling, threading, and much much more. None of that is available when you
write programs this way. If you try to create more complex apps, you'll also likely
to encounter various issues, which are difficult to understand and resolve, unless
you're intimately familiar with both AmigaOS and Free Pascal internals.

But it hopefully makes a point. A similar technique can be used on most operating
systems, actually.
