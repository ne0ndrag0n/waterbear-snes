;==============================================================================
; WaterBear SNES Development Kit
;
; FILE: memory.inc
; DESCRIPTION: Specifies memory map
; (c) 2016-2017 Neon Dragon Enterprises (ne0ndrag0n)
;==============================================================================
.IFNDEF MEMORY
.DEFINE MEMORY

.INCLUDE "header.inc"

.RAMSECTION "ZeroPage" SLOT 0
	BSNESDebugTarget DB
.ENDS

.RAMSECTION "NonZeroPage" SLOT 11
	VBlankFunctionPointer DW
	VBlankDemoDestination1 DW
.ENDS

; ======
; Need to switch banks to use these
; ======
.DEFINE SRAM_Bank	$FE
.RAMSECTION "SRAM" SLOT 12
	SRAMTest DW
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
