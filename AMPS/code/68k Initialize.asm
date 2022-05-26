; ===========================================================================
; ---------------------------------------------------------------------------
; Routine for loading the Dual PCM driver into Z80 RAM
; ---------------------------------------------------------------------------

LoadDualPCM:
		move	#$2700,sr				; disable interrupts
		doZ80Stop						; request Z80 stop
		resetZ80Off						; Z80 reset off

		lea	DualPCM,a0					; load Dual PCM address into a0
		lea	dZ80,a1						; load Z80 RAM address into a1

		waitZ80Stop						; check if Z80 has stopped
		jsr	zx0_decompress					; decompress into z80 RAM

		moveq	#2,d0					; set flush timer for 60hz systems
		btst	#6,ConsoleRegion.w		; is this a PAL Mega Drive?
		beq.s	.ntsc					; if not, branch
		moveq	#3,d0					; set flush timer for 50hz systems
.ntsc
		move.b	d0,dZ80+YM_FlushTimer+2	; save flush timer

		resetZ80						; request Z80 reset
		moveq	#$7F,d1					; wait for a little bit
		dbf	d1,*						; we can't check for reset, so we need to delay

		startZ80						; enable Z80
		resetZ80Off						; Z80 reset off
		move	#$2300,sr				; enable interrupts
		rts
