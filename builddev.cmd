@echo off
call cmpdata.cmd
"AMPS\Includer.exe" ASM68K AMPS AMPS\.Data
tools\asm68k /e safe=1 /m /c /p /o ae-,w-,l. sonic1.asm, s1built.md, , .lst>.log
type .log
if not exist s1built.md pause & exit
"AMPS\Dual PCM Compress.exe" AMPS\.z80 AMPS\.z80.dat s1built.md _dlls\saxcmp.exe
error\convsym .lst s1built.md -input asm68k_lst -inopt "/localSign=. /localJoin=. /ignoreMacroDefs+ /ignoreMacroExp- /addMacrosAsOpcodes+ /processLocals+" -a
tools\romfix.exe -t "SONIC MAGNUM DEV BUILD - NOT FOR PUBLIC RELEASE" -s "DEV.REL1" -d -z s1built.md
del AMPS\.Data
pause