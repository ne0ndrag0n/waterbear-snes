; ===============================
; oaktree
; Waterbear framework for SNES
; (c) 2015 oaktree Novelties
;
; FILE: base.asm
; DESCRIPTION: Highest-level
; macros.
; ===============================

.IFNDEF BASE_S
.DEFINE BASE_S

.INCLUDE "base/base.inc"

;============================================================================
; StoreA
;
; Description: This macro outputs "stz" to the destination, if the value
;			   loaded into the "A" register is going to be zero. This saves
;			   a few cycles anytime an lda-sta pattern is used where the
;			   register value is due to be $00.
;			   ** The register value is assumed to be immediate. **
; Author: Ash
;----------------------------------------------------------------------------
; In: regValue	--	The value due to be loaded into "A". If zero, the lda
;					instruction will not be used.
;	  dest		--	The destination of this lda-sta pattern.
;----------------------------------------------------------------------------
; Modifies: A
;----------------------------------------------------------------------------
.MACRO StoreA ARGS regValue, dest, addrMode
	.IF addrMode == INDIRECT
		lda regValue
		sta dest
	.ELSE
		.IF regValue == ZERO
			stz dest
		.ELSE
			lda #regValue
			sta dest
		.ENDIF
	.ENDIF
.ENDM

;============================================================================
; StoreX
;
; Description: This macro outputs "stz" to the destination, if the value
;			   loaded into the "X" register is going to be zero.
;			   ** The register value is assumed to be immediate. **
; Author: Ash
;----------------------------------------------------------------------------
; In: regValue	--	The value due to be loaded into "X". If zero, the lda
;					instruction will not be used.
;	  dest		--	The destination of this ldx-stx pattern.
;----------------------------------------------------------------------------
; Modifies: X
;----------------------------------------------------------------------------
.MACRO StoreX ARGS regValue, dest, addrMode
	.IF addrMode == INDIRECT
		ldx regValue
		stx dest
	.ELSE
		.IF regValue == ZERO
			stz dest
		.ELSE
			ldx #regValue
			stx dest
		.ENDIF
	.ENDIF
.ENDM

.ENDIF
