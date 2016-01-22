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
	StoreA ( ( nmiInt << 7 ) | ( vertical << 5 ) | ( horizontal << 4 ) | joypadInt ), System_INTERRUPTS_PORT, DIRECT
.ENDM

;============================================================================
; System_Stall
;
; Description: Outputs a number of WAI instructions required for the
;			   specified amount of cycles. Minimum 3
; Author: Ash
;----------------------------------------------------------------------------
; In: cycles		--	Number of cycles in multiples of 3. 1 is 3, 2 is 6,
;						etc.
;----------------------------------------------------------------------------
.MACRO System_Stall ARGS cycles
	.REPT cycles * 3
		WAI
	.ENDR
.ENDM

;============================================================================
; System_SetAccumulatorSize
;
; Description: Sets the accumulator size to 8 (byte) or 16 (word) bits.
; Author: Ash
;----------------------------------------------------------------------------
; In: size			--	System_REGISTER_BYTE or System_REGISTER_WORD
;----------------------------------------------------------------------------
.MACRO System_SetAccumulatorSize ARGS size
	.IF size == System_REGISTER_BYTE
		sep #System_ACCUMULATOR_SIZE
	.ENDIF

	.IF size == System_REGISTER_WORD
		rep #System_ACCUMULATOR_SIZE
	.ENDIF
.ENDM

;============================================================================
; System_SetIndexSize
;
; Description: Sets the index register size to 8 (byte) or 16 (word) bits.
; Author: Ash
;----------------------------------------------------------------------------
; In: size			--	System_REGISTER_BYTE or System_REGISTER_WORD
;----------------------------------------------------------------------------
.MACRO System_SetIndexSize ARGS size
	.IF size == System_REGISTER_BYTE
		sep #System_INDEX_SIZE
	.ENDIF

	.IF size == System_REGISTER_WORD
		rep #System_INDEX_SIZE
	.ENDIF
.ENDM

.ENDIF
