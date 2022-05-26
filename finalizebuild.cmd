"AMPS\Dual PCM Compress.exe" AMPS\.z80 AMPS\.z80.dat SonicMagnum.gen tools\salvador.exe
error\convsym .lst SonicMagnum.gen -input asm68k_lst -inopt "/localSign=. /localJoin=. /ignoreMacroDefs+ /ignoreMacroExp- /addMacrosAsOpcodes+ /processLocals+" -a
