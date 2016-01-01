; ===============================
; oaktree
; Waterbear framework for SNES
; (c) 2015 oaktree Novelties
;
; FILE: ppu.asm
; DESCRIPTION: PPU Macros and
; subroutines.
; ===============================
.INCLUDE "base.inc"
.INCLUDE "ppu.inc"

;============================================================================
; PPU_SetVRAMWriteParams
;
; Description: Sets the write parameters for the PPU (Register $2115).
;			   This is waterbear's first function written!
; Author: Ash
;----------------------------------------------------------------------------
; In: incOnHigh -- TRUE to increment on write of high VRAM word $2119.
;				-- FALSE to increment on write of low VRAM word $2118.
;     incRate	-- Increment rate (selectable via PPU_IncRate_xxx consts).
;----------------------------------------------------------------------------
; Modifies: A
;----------------------------------------------------------------------------
.MACRO PPU_SetVRAMWriteParams ARGS incOnHigh, incRate
	; top bit determines increment on high or low VRAM word.
	; bottom two bits determine the increment rate
	lda #( ( incOnHigh << 7 ) | incRate )
	sta PPU_PORT_SETTINGS
.ENDM

;============================================================================
; PPU_SetVRAMAddress
;
; Description: Sets the VRAM destination address of the next read/write
;			   from/to PPU_VRAM_DATA ($2118).
; Author: Ash
;----------------------------------------------------------------------------
; In: address	--	The 16-bit address to point the next VRAM operation to.
;----------------------------------------------------------------------------
; Modifies: X
;----------------------------------------------------------------------------
.MACRO PPU_SetVRAMAddress ARGS address
	ldx #address
	stx PPU_VRAM_ADDRESS
.ENDM

;============================================================================
; PPU_WriteVRAM
;
; Description: Writes to VRAM using PPU_VRAM_DATA. This function does NOT
;			   use DMA; for this, use the appropriate DMA function instead.
; Author: Ash
;----------------------------------------------------------------------------
; In: word		--	If TRUE, writes a word (16-bit) to PPU_VRAM_DATA.
;					If FALSE, writes a byte.
;	  data		--	The data to be written
;----------------------------------------------------------------------------
; Modifies: A or X depending on the value of "word".
;----------------------------------------------------------------------------
.MACRO PPU_WriteVRAM ARGS word, data
	.IF word == TRUE
		ldx #data
		stx PPU_VRAM_DATA
	.ELSE
		lda #data
		sta PPU_VRAM_DATA
	.ENDIF
.ENDM
