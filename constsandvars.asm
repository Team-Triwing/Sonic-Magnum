ChecksumAddr	equ $FFFFFFEC		; the checksum address we're checking (4 bytes)
ChecksumValue	equ $FFFFFFF0		; the accumulated value of checksum check (2 bytes)
ChecksumStart	equ $FFFFFFF4		; set if start button was pressed during checksum check

; based on ralakimus' constants

; -------------------------------------------------------------------------
; VDP
; -------------------------------------------------------------------------

VDP_DATA	EQU	$C00000			; VDP data port
VDP_CTRL	EQU	$C00004			; VDP control port
VDP_HV		EQU	$C00008			; VDP H/V counter
VDP_DEBUG	EQU	$C0001C			; VDP debug

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

r_DMA_Queue		equ	$FFFFC800
r_DMA_Slot		equ	r_DMA_Queue+$FC