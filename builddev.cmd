@echo off
call cmpdata.cmd
"AMPS\Includer.exe" ASM68K AMPS AMPS\.Data
tools\asm68k /e safe=1 /m /c /p /o ae-,w-,l. sonic1.asm, SonicMagnum.gen, , .lst>.log
type .log
if not exist SonicMagnum.gen pause & exit
call finalizebuild.cmd
tools\romfix.exe -t "SONIC MAGNUM DEV BUILD - NOT FOR PUBLIC RELEASE" -s "DEV.REL1" -d -z SonicMagnum.gen
del AMPS\.Data
pause