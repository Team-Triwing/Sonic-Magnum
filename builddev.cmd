@echo off
call cmpdata.cmd
"AMPS\Includer.exe" ASM68K AMPS AMPS\.Data
tools\asm68k /e safe=1 /m /c /p /o ae-,w-,l. sonic1.asm, s1built.md, , .lst>.log
type .log
if not exist s1built.md pause & exit
call finalizebuild.cmd
tools\romfix.exe -t "SONIC MAGNUM DEV BUILD - NOT FOR PUBLIC RELEASE" -s "DEV.REL1" -d -z s1built.md
del AMPS\.Data
pause