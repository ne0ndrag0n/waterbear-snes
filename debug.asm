;==============================================================================
; WaterBear SNES Development Kit
;
; FILE: debug.asm
; DESCRIPTION: P-register flag constants
; (c) 2016-2017 Neon Dragon Enterprises (ne0ndrag0n)
;==============================================================================
.IFNDEF DEBUG
.DEFINE DEBUG

.INCLUDE "memory.asm"

.DEFINE     Debug_Status_Breakpoint   $B0

.MACRO Debugger
  lda #Debug_Status_Breakpoint
  sta BSNESDebugTarget
.ENDM

.ENDIF
