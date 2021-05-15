ConsoleRegion	equ $FFFFFFF8

ChecksumAddr	equ $FFFFFFEC		; the checksum address we're checking (4 bytes)
ChecksumValue	equ $FFFFFFF0		; the accumulated value of checksum check (2 bytes)
ChecksumStart	equ $FFFFFFF4		; set if start button was pressed during checksum check

r_DMA_Queue		equ	$FFFFC800
r_DMA_Slot		equ	r_DMA_Queue+$FC

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