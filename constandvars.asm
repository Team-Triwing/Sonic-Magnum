ConsoleRegion	equ $FFFFFFF8

ChecksumAddr	equ $FFFFFFEC		; the checksum address we're checking (4 bytes)
ChecksumValue	equ $FFFFFFF0		; the accumulated value of checksum check (2 bytes)
ChecksumStart	equ $FFFFFFF4		; set if start button was pressed during checksum check

Reload_level	equ $FFFFFFF9
Level_Music		equ	$FFFFFF90

r_DMA_Queue		equ	$FFFFC800
r_DMA_Slot		equ	r_DMA_Queue+$FC

V_Int_jump		equ $FFFFFFC0
V_int_addr		equ $FFFFFFC2
H_int_jump		equ $FFFFFFC6
H_int_addr		equ $FFFFFFC8

invulnerable_time	=	$30
invincibility_time	=	$31
speedshoes_time		=	$32

; ---------------------------------------------------------------------------
; Art tile stuff (taken from sonic 2 github disasm)
flip_x              =      (1<<11)
flip_y              =      (1<<12)
palette_bit_0       =      5
palette_bit_1       =      6
palette_line_0      =      (0<<13)
palette_line_1      =      (1<<13)
palette_line_2      =      (2<<13)
palette_line_3      =      (3<<13)
high_priority_bit   =      7
high_priority       =      (1<<15)
palette_mask        =      $6000
tile_mask           =      $07FF
nontile_mask        =      $F800
drawing_mask        =      $7FFF

; Variables from S1 Github (really hacky i know)
v_screenposx:	equ $FFFFF700	; screen position x (2 bytes)
v_screenposy:	equ $FFFFF704	; screen position y (2 bytes)
v_bgscreenposx:	equ $FFFFF708	; background screen position x (2 bytes)
v_bgscreenposy:	equ $FFFFF70C	; background screen position y (2 bytes)
v_bg2screenposx:	equ $FFFFF710	; 2 bytes
v_bg2screenposy:	equ $FFFFF714	; 2 bytes
v_bg3screenposx:	equ $FFFFF718	; 2 bytes
v_bg3screenposy:	equ $FFFFF71C	; 2 bytes

v_limitleft1:	equ $FFFFF720	; left level boundary (2 bytes)
v_limitright1:	equ $FFFFF722	; right level boundary (2 bytes)
v_limittop1:	equ $FFFFF724	; top level boundary (2 bytes)
v_limitbtm1:	equ $FFFFF726	; bottom level boundary (2 bytes)
v_limitleft2:	equ $FFFFF728	; left level boundary (2 bytes)
v_limitright2:	equ $FFFFF72A	; right level boundary (2 bytes)
v_limittop2:	equ $FFFFF72C	; top level boundary (2 bytes)
v_limitbtm2:	equ $FFFFF72E	; bottom level boundary (2 bytes)

v_limitleft3:	equ $FFFFF732	; left level boundary, at the end of an act (2 bytes)

v_scrshiftx:	equ $FFFFF73A	; x-screen shift (new - last) * $100
v_scrshifty:	equ $FFFFF73C	; y-screen shift (new - last) * $100

v_lookshift:	equ $FFFFF73E	; screen shift when Sonic looks up/down (2 bytes)
f_nobgscroll:	equ $FFFFF744	; flag set to cancel background scrolling

v_fg_xblock:	equ	$FFFFF74A	; foreground x-block parity (for redraw)
v_fg_yblock:	equ	$FFFFF74B	; foreground y-block parity (for redraw)
v_bg1_xblock:	equ	$FFFFF74C	; background x-block parity (for redraw)
v_bg1_yblock:	equ	$FFFFF74D	; background y-block parity (for redraw)
v_bg2_xblock:	equ	$FFFFF74E	; secondary background x-block parity (for redraw)
v_bg2_yblock:	equ	$FFFFF74F	; secondary background y-block parity (unused)
v_bg3_xblock:	equ	$FFFFF750	; teritary background x-block parity (for redraw)
v_bg3_yblock:	equ	$FFFFF751	; teritary background y-block parity (unused)
f_bgscrollvert:	equ $FFFFF75C	; flag for vertical background scrolling
v_fg_scroll_flags:	equ $FFFFF754	; screen redraw flags for foreground
v_bg1_scroll_flags:	equ $FFFFF756	; screen redraw flags for background 1
v_bg2_scroll_flags:	equ $FFFFF758	; screen redraw flags for background 2
v_bg3_scroll_flags:	equ $FFFFF75A	; screen redraw flags for background 3
v_screenposx_dup:	equ $FFFFFF10	; screen position x (duplicate) (2 bytes)
v_screenposy_dup:	equ $FFFFFF14	; screen position y (duplicate) (2 bytes)
v_bgscreenposx_dup:	equ $FFFFFF18	; background screen position x (duplicate) (2 bytes)
v_bgscreenposy_dup:	equ $FFFFFF1C	; background screen position y (duplicate) (2 bytes)
v_bg2screenposx_dup:	equ $FFFFFF20	; 2 bytes
v_bg2screenposy_dup:	equ $FFFFFF24	; 2 bytes
v_bg3screenposx_dup:	equ $FFFFFF28	; 2 bytes
v_bg3screenposy_dup:	equ $FFFFFF2C	; 2 bytes
v_fg_scroll_flags_dup:	equ $FFFFFF30
v_bg1_scroll_flags_dup:	equ $FFFFFF32
v_bg2_scroll_flags_dup:	equ $FFFFFF34
v_bg3_scroll_flags_dup:	equ $FFFFFF36
v_scrposy_dup:	equ $FFFFF616	; screen position y (duplicate) (2 bytes)
v_bgscrposy_dup:	equ $FFFFF618	; background screen position y (duplicate) (2 bytes)
v_scrposx_dup:	equ $FFFFF61A	; screen position x (duplicate) (2 bytes)
v_bgscreenposx_dup_unused:	equ $FFFFF61C	; background screen position x (duplicate) (2 bytes)
v_bg3screenposy_dup_unused:	equ $FFFFF61E	; (2 bytes)
v_bg3screenposx_dup_unused:	equ $FFFFF620	; (2 bytes)
v_hscrolltablebuffer:	equ $FFFFCC00 ; scrolling table data (actually $380 bytes, but $400 is reserved for it)

; Ralakimus constants, needed for DMA functions

; -------------------------------------------------------------------------
; I/O
; -------------------------------------------------------------------------

HW_VERSION	EQU	$A10001			; Hardware version
IO_A_DATA	EQU	$A10003			; I/O port A data port
IO_B_DATA	EQU	$A10005			; I/O port B data port
IO_C_DATA	EQU	$A10007			; I/O port C data port
IO_A_CTRL	EQU	$A10009			; I/O port A control port
IO_B_CTRL	EQU	$A1000B			; I/O port B control port
IO_C_CTRL	EQU	$A1000D			; I/O port C control port
CART_MODE	EQU	$A11000			; Cart mode (D-RAM/ROM)
SRAM_ENABLE	EQU	$A130F1			; SRAM enable port
TMSS_SEGA	EQU	$A14000			; TMSS "SEGA" register
TMSS_MODE	EQU	$A14100			; TMSS bus mode

; -------------------------------------------------------------------------
; VDP
; -------------------------------------------------------------------------

VDP_DATA	EQU	$C00000			; VDP data port
VDP_CTRL	EQU	$C00004			; VDP control port
VDP_HV		EQU	$C00008			; VDP H/V counter
VDP_DEBUG	EQU	$C0001C			; VDP debug

; -------------------------------------------------------------------------
; Controller I/O
; -------------------------------------------------------------------------

	rsreset
JbU		rs.b	1			; Bit up
JbD		rs.b	1			; Bit down
JbL		rs.b	1			; Bit left
JbR		rs.b	1			; Bit right
JbB		rs.b	1			; Bit B
JbC		rs.b	1			; Bit C
JbA		rs.b	1			; Bit A
JbS		rs.b	1			; Bit start
JbZ		rs.b	1			; Bit Z
JbY		rs.b	1			; Bit Y
JbX		rs.b	1			; Bit X
JbM		rs.b	1			; Bit mode

J_U		EQU	(1<<JbU)		; Up
J_D		EQU	(1<<JbD)		; Down
J_L		EQU	(1<<JbL)		; Left
J_R		EQU	(1<<JbR)		; Right
J_B		EQU	(1<<JbB)		; B
J_C		EQU	(1<<JbC)		; C
J_A		EQU	(1<<JbA)		; A
J_S		EQU	(1<<JbS)		; Start
J_Z		EQU	(1<<JbZ)		; Z
J_Y		EQU	(1<<JbY)		; Y
J_X		EQU	(1<<JbX)		; X
J_M		EQU	(1<<JbM)		; Mode

IObTH		EQU	6			; TH pin bit
IObTR		EQU	5			; TR pin bit
IObTL		EQU	4			; TL pin bit
IO_TH		EQU	1<<IObTH		; TH pin
IO_TR		EQU	1<<IObTR		; TR pin
IO_TL		EQU	1<<IObTL		; TL pin