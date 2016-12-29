;==============================================================================
; WaterBear SNES Development Kit
;
; FILE: system.asm
; DESCRIPTION: System-level shit
; (c) 2016-2017 Neon Dragon Enterprises (ne0ndrag0n)
;==============================================================================
.IFNDEF SYSTEM
.DEFINE SYSTEM

.INCLUDE "memory.asm"

.MACRO Set_A_16Bit
  rep #%00100000
.ENDM

.MACRO Set_A_8Bit
  sep #%00100000
.ENDM

.MACRO Set_XY_16Bit
  rep #%00010000
.ENDM

.MACRO Set_XY_8Bit
  sep #%00010000
.ENDM

.MACRO Debugger
  wdm ; use this to trigger the debugger in bsnes
  nop ; wdm eats the next byte - should read wdm #$ea
.ENDM


.ENDIF
