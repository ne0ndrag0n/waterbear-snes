;== Include memorymap, header info, and SNES initialization routines
.INCLUDE "header.inc"
.INCLUDE "InitSNES.asm"
.INCLUDE "debug.inc"
.INCLUDE "system.inc"
.INCLUDE "ppu.inc"

.BANK 0 SLOT 0
.ORG 0
.SECTION "MainCode"

Start:
        InitSNES            ; Init Snes :)

				Stage_VBlank VBlank_Dynamic_Demo

				lda #%10000000
				sta $4200				; enable the vblank

main:
        jmp main

;==============================================================================
; MAX 2270 cycles.
; Push and pop anything you're going to fuck up.
VBlank:
	pha
	php
	phb

	Set_A_16Bit
	lda.w VBlank_Function_Pointer
	cmp #$0000
	beq VBlank_Exit

Handler:
	; Branch to this function pointer as a subroutine, then clear out the pointer.
	; It's up to you to "jmp VBlank_Finally" when you're all done.
	jmp (VBlank_Function_Pointer)

VBlank_Finally:
	; After a function is called, set it to null so it doesn't get called again on next VBlank.
	Set_A_16Bit
	lda.w #$0000
	sta VBlank_Function_Pointer ; Rip this shit down on the way out

VBlank_Exit:
	plb
	plp
	pla
  RTI
;==============================================================================

;==============================================================================
; load $DEAD to $0010 as a demo of vblank dynamic dispatch
VBlank_Dynamic_Demo:
	lda #$0BB0
	sta $0010
	jmp VBlank_Finally

.ENDS

; stuff we'll revisit later
.BANK 1
.ORG 0
.SECTION "Data"

; 2bpp

TileData:
    .db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    .db $00, $FF, $00, $FF, $FF, $00, $FF, $FF, $FF, $FF, $FF, $00, $00, $FF, $00, $FF

Palette:
    .db $00, $00, $1F, $42, $E0, $7F, $FF, $7F

CArcadiaCopr:	.DB "Copyright (c) Corvis Simulation Systems. All rights reserved.",0
CArcadia: .DB "Corvis Arcadia",0

.ENDS
