;==============================================================================
; WaterBear SNES Development Kit
;
; FILE: debug.inc
; DESCRIPTION: P-register flag constants
; (c) 2016-2017 Neon Dragon Enterprises (ne0ndrag0n)
;==============================================================================
.IFNDEF DEBUG
.DEFINE DEBUG

.DEFINE     Debug_Status_Register     $0000
.DEFINE     Debug_Status_Breakpoint   $B0

.MACRO Debugger
  lda #Debug_Status_Breakpoint
  sta Debug_Status_Register
.ENDM

.ENDIF
