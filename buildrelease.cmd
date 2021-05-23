@echo off
call cmpdata.cmd
"AMPS\Includer.exe" ASM68K AMPS AMPS\.Data
tools\asm68k /e safe=0 /p /o ae-,op+,os+,ow+,oz+,oaq+,osq+,omq+,w-,l. sonic1.asm, SonicMagnum.gen, , .lst>.log
type .log
if not exist SonicMagnum.gen pause & exit
call finalizebuild.cmd
tools\romfix.exe -t "SONIC MAGNUM" -s "80005201" -d -z SonicMagnum.gen
del AMPS\.Data
pause