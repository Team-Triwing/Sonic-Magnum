@echo off
call compress.cmd
"AMPS\Includer.exe" ASM68K AMPS AMPS\.Data
tools\asm68k /e safe=0 /p /o ae-,op+,os+,ow+,oz+,oaq+,osq+,omq+,w-,l. sonic1.asm, s1built.md, , .lst>.log
type .log
if not exist s1built.md pause & exit
"AMPS\Dual PCM Compress.exe" AMPS\.z80 AMPS\.z80.dat s1built.md _dlls\saxcmp.exe
error\convsym .lst s1built.md -input asm68k_lst -inopt "/localSign=. /localJoin=. /ignoreMacroDefs+ /ignoreMacroExp- /addMacrosAsOpcodes+ /processLocals-" -a
tools\romfix.exe -t "UNTITLED S1 COLLAB HACK DEV" -d -z s1built.md
del AMPS\.Data
pause