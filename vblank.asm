;==============================================================================
; WaterBear SNES Development Kit
;
; FILE: vblank.asm
; DESCRIPTION: Handlers for vblank routines
; (c) 2016-2017 Neon Dragon Enterprises (ne0ndrag0n)
;==============================================================================
.IFNDEF VBLANK_HANDLERS
.DEFINE VBLANK_HANDLERS

.INCLUDE "system.asm"
.INCLUDE "ppu.asm"

.DEFINE   Register_CounterEnable    $4200

; VBlank-relevant function handlers for zero page
.RAMSECTION "WRAM" SLOT 1
	VBlankStatus DB
	VBlankFunctionPointer DW
  VBlankDemoDestination1 DW
.ENDS

;==============================================================================
; Stage a function to be called once on VBlank.
; Modifies: A, S
;==============================================================================
.MACRO Stage_VBlank ARGS function
  Set_A_16Bit
  lda #function.w
  sta VBlankFunctionPointer.w
.ENDM

;==============================================================================
; Stage a function to be called once on VBlank, and wait for it to complete.
; Modifies: A, Status Regs
;==============================================================================
.MACRO Stage_VBlank_Sync ARGS function
  Stage_VBlank function
  wai
.ENDM

.BANK 0
.ORG 0
.SECTION "VblankHandlers" SEMIFREE

;==============================================================================
; Load a specific palette during VBlank
;==============================================================================
LoadDemoPalette:
	Set_A_8Bit
	Set_XY_16Bit
	LoadPalette DemoPalette, 0, 4

	; just a little confirmation we're done
	Set_A_16Bit
	lda #$C7FA.w
	sta VBlankDemoDestination1.w
	rts

.ENDS


.ENDIF
