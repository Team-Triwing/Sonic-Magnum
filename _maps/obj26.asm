; ---------------------------------------------------------------------------
; Sprite mappings - monitors
; ---------------------------------------------------------------------------
Map_Monitor:	dc.w .static0-Map_Monitor, .static1-Map_Monitor
		dc.w .static2-Map_Monitor, .eggman-Map_Monitor
		dc.w .sonic-Map_Monitor, .shoes-Map_Monitor
		dc.w .shield-Map_Monitor, .invincible-Map_Monitor
		dc.w .rings-Map_Monitor, .s-Map_Monitor
		dc.w .goggles-Map_Monitor, .broken-Map_Monitor
.static0:	dc.b 1			; static monitor
		dc.b $EF, $F, 0, 0, $F0
.static1:	dc.b 2			; static monitor
		dc.b $F5, 5, 0,	$10, $F8
		dc.b $EF, $F, 0, 0, $F0
.static2:	dc.b 2			; static monitor
		dc.b $F5, 5, 0,	$14, $F8
		dc.b $EF, $F, 0, 0, $F0
.eggman:	dc.b 2			; Eggman monitor
		dc.b $F5, 5, 0,	$18, $F8
		dc.b $EF, $F, 0, 0, $F0
.sonic:		dc.b 2			; Sonic	monitor
		dc.b $F5, 5, 0,	$1C, $F8
		dc.b $EF, $F, 0, 0, $F0
.shoes:		dc.b 2			; speed	shoes monitor
		dc.b $F5, 5, 0,	$24, $F8
		dc.b $EF, $F, 0, 0, $F0
.shield:	dc.b 2			; shield monitor
		dc.b $F5, 5, 0,	$28, $F8
		dc.b $EF, $F, 0, 0, $F0
.invincible:	dc.b 2			; invincibility	monitor
		dc.b $F5, 5, 0,	$2C, $F8
		dc.b $EF, $F, 0, 0, $F0
.rings:		dc.b 2			; 10 rings monitor
		dc.b $F5, 5, 0,	$20, $F8
		dc.b $EF, $F, 0, 0, $F0
.s:		dc.b 2			; 'S' monitor
		dc.b $F5, 5, 0,	$3C, $F8
		dc.b $EF, $F, 0, 0, $F0
.goggles:	dc.b 2			; goggles monitor
		dc.b $F5, 5, 0,	$38, $F8
		dc.b $EF, $F, 0, 0, $F0
.broken:	dc.b 1			; broken monitor
		dc.b $FF, $D, 0, $30, $F0

		even
		