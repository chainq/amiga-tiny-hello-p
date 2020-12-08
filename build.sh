#!/bin/sh

set -e

FPC=$HOME/DevPriv/fpc-bin/m68k-amiga-020
FPCBIN=$FPC/lib/fpc/3.3.1/ppcross68k

FPCARGS="-Tamiga -O4 -Cp68000 -Avasm -XV -al "
FPCARGS+="-FD$HOME/DevPriv/m68k-amiga-binutils "
FPCARGS+="-Fu./ -Fu$FPC/lib/fpc/3.3.1/units/m68k-amiga/* "

rm -rf *.ppu *.o *.s

$FPCBIN $FPCARGS si_prc.pp
$FPCBIN $FPCARGS hello.pas
