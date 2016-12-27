;==============================================================================
; WaterBear SNES Development Kit
;
; FILE: memory.asm
; DESCRIPTION: Specifies memory map
; (c) 2016-2017 Neon Dragon Enterprises (ne0ndrag0n)
;==============================================================================
.IFNDEF MEMORY
.DEFINE MEMORY

.INCLUDE "header.inc"

.RAMSECTION "ZeroPage" SLOT 11
	BSNESDebugTarget DB
.ENDS

.DEFINE WramPage1 $7E
.RAMSECTION "WRAM" BANK 0 SLOT 12
	VBlankFunctionPointer DW
	VBlankDemoDestination1 DW
.ENDS

.RAMSECTION "PPU2" SLOT 7
	CounterEnable DW
.ENDS

;==============================================================================
; Stage a function to be called once on VBlank.
; Modifies: A, Status Regs
; A - 8-bit
;==============================================================================
.MACRO ChangeRAMBank ARGS Byte
  lda #Byte
  pha
  plb
.ENDM

.ENDIF
