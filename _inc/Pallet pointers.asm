; ---------------------------------------------------------------------------
; Pallet pointers
; ---------------------------------------------------------------------------
	dc.l Pal_SegaBG		; pallet address, 0
	dc.w $FB00		; RAM address
	dc.w $1F		; (pallet length / 2) - 1
	dc.l Pal_Title	; 1
	dc.w $FB00
	dc.w $1F
	dc.l Pal_LevelSel ; 2
	dc.w $FB00
	dc.w $1F
	dc.l Pal_Sonic ; 3
	dc.w $FB00
	dc.w 7
	dc.l Pal_GHZ ; 4
	dc.w $FB20
	dc.w $17
	dc.l Pal_LZ ; 5
	dc.w $FB20
	dc.w $17
	dc.l Pal_MZ ; 6
	dc.w $FB20
	dc.w $17
	dc.l Pal_SLZ ; 7
	dc.w $FB20
	dc.w $17
	dc.l Pal_SYZ ; 8
	dc.w $FB20
	dc.w $17
	dc.l Pal_SBZ1 ; 9
	dc.w $FB20
	dc.w $17
	dc.l Pal_Special ; $A/10
	dc.w $FB00
	dc.w $1F
	dc.l Pal_LZWater ; $B/11
	dc.w $FB00
	dc.w $1F
	dc.l Pal_SBZ3 ; $C/12
	dc.w $FB20
	dc.w $17
	dc.l Pal_SBZ3Water ; $D/13
	dc.w $FB00
	dc.w $1F
	dc.l Pal_SBZ2 ; $E/14
	dc.w $FB20
	dc.w $17
	dc.l Pal_LZSonWater ; $F/15
	dc.w $FB00
	dc.w 7
	dc.l Pal_SBZ3SonWat ; $10/16
	dc.w $FB00
	dc.w 7
	dc.l Pal_SpeResult ; $11/17
	dc.w $FB00
	dc.w $1F
	dc.l Pal_SpeContinue ; $12/18
	dc.w $FB00
	dc.w $F
	dc.l Pal_Ending ; $13/19
	dc.w $FB00
	dc.w $1F
	dc.l Pal_SplashScreen ; $14/20
	dc.w $FB00
	dc.w $1F
	