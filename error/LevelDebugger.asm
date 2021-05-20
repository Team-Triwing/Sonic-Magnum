SampleLevelDebugger:
    Console.WriteLine "Camera (BG): %<.w $FFFFF708>-%<.w $FFFFF70C>"
    Console.WriteLine "Camera (FG): %<.w $FFFFF700>-%<.w $FFFFF704>"
    Console.WriteLine "Zone/Act ID: %<.w $FFFFFE10>"
    Console.WriteLine "Dynamic screen routine: %<.b $FFFFF742>"
    Console.WriteLine "Frame: %<.w $FFFFFE04>"
    Console.BreakLine

    Console.WriteLine "%<pal1>Object slots:%<pal0>"
    Console.Write "%<setw,39>"       ; format slots table nicely ...
    lea       $FFFFD000,a0
    moveq   #$2000/$40-1, d0
    .DisplayObjSlot:
       Console.Write "%<.b (a0)> "
       lea       $40(a0), a0
       dbf       d0, .DisplayObjSlot
    Console.BreakLine
    Console.BreakLine

    Console.Write "%<setw,40>"
    cmpi.b  #1,($FFFFFE10).w
    bne.w   .skipwaterstuffs
    Console.WriteLine "Water height: %<.w $FFFFF646>"
    Console.WriteLine "Average/target water height: %<.w $FFFFF648>/%<.w $FFFFF64A>"
    Console.WriteLine "Water movement direction: %<.b $FFFFF64C>"
    Console.WriteLine "DynamicLZWater routine: %<.b $FFFFF64D>"
    Console.WriteLine "Fullscreen water flag: %<.b $FFFFF64E>"
.skipwaterstuffs
    Console.WriteLine "FG redraw flags: %<.b $FFFFF754 bin>"
    Console.WriteLine "BG1 redraw flags: %<.b $FFFFF756 bin>"
    Console.WriteLine "BG2 redraw flags: %<.b $FFFFF758 bin>"
.return
    rts