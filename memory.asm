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

.DEFINE ZeroPage $00
.DEFINE WramPage1 $7E

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
