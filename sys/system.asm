; ===============================
; oaktree
; Waterbear framework for SNES
; (c) 2015 oaktree Novelties
;
; FILE: system.asm
; DESCRIPTION: System macros
; ===============================
.IFNDEF SYSTEM_S
.DEFINE SYSTEM_S

.INCLUDE "sys/system.inc"
.INCLUDE "base/base.asm"

;============================================================================
; System_SetInterrupts
;
; Description: Sets the interrupts using register $4200.
; Author: Ash
;----------------------------------------------------------------------------
; In: nmiInt		--	TRUE for NMI interrupt
;	  vertical		--  TRUE for vertical counter
;	  horizontal	--	TRUE for horizontal counter
;	  joypadInt		-- 	TRUE for joypad interrupt
;----------------------------------------------------------------------------
; Modifies: A
;----------------------------------------------------------------------------
.MACRO System_SetInterrupts ARGS nmiInt, vertical, horizontal, joypadInt
	StoreByte ( ( nmiInt << 7 ) | ( vertical << 5 ) | ( horizontal << 4 ) | joypadInt ), System_INTERRUPTS_PORT
.ENDM

.ENDIF
