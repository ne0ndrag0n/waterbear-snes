;==============================================================================
; WaterBear SNES Development Kit
;
; FILE: ppu.inc
; DESCRIPTION: PPU-specific routines and constants
; (c) 2016-2017 Neon Dragon Enterprises (ne0ndrag0n)
;==============================================================================
.IFNDEF PPU
.DEFINE PPU

.DEFINE     DisplayOptions      $2100
.DEFINE     PaletteSelection    $2121
.DEFINE     PaletteData         $2122

;==============================================================================
; Load display options
; Modifies: A
; Mode: 8-bit A
;==============================================================================
.MACRO lda_DisplayOptions ARGS disabled, brightness
  lda #( ( disabled << 7 ) | brightness )
.ENDM

.ENDIF
