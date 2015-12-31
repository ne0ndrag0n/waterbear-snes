;== Include memorymap, header info, and SNES initialization routines
.INCLUDE "header.inc"
.INCLUDE "InitSNES.asm"
.INCLUDE "macros.asm"

;========================
; Start
;========================

.BANK 0 SLOT 0
.ORG 0
.SECTION "MainCode"

Start:
        InitSNES            ; Init Snes :)

		; Load Palette for our tiles
		LoadPalette BG_Palette, 0, 4

		; Load Tile data to VRAM
		LoadBlockToVRAM Tiles, $0000, $0020	; 2 tiles, 2bpp, = 32 bytes

		; Now, load up some data into our tile map
		; (If you had an full map, you could use LoadBlockToVRAM)
		; Remember that in the default map, all entries point to tile #0
		lda #$80
		sta $2115
		ldx #$0401
		stx $2116
		lda #$01
		sta $2118


		; Setup Video modes and other stuff, then turn on the screen
		jsr SetupVideo

forever:
        jmp forever

;============================================================================
; SetupVideo -- Sets up the video mode and tile-related registers
;----------------------------------------------------------------------------
; In: None
;----------------------------------------------------------------------------
; Out: None
;----------------------------------------------------------------------------
SetupVideo:
    php

    lda #$00
    sta $2105           ; Set Video mode 0, 8x8 tiles, 4 color BG1/BG2/BG3/BG4

    lda #$04            ; Set BG1's Tile Map offset to $0400 (Word address)
    sta $2107           ; And the Tile Map size to 32x32

    stz $210B           ; Set BG1's Character VRAM offset to $0000 (word address)

    lda #$01            ; Enable BG1
    sta $212C

    lda #$FF
    sta $210E
    sta $210E

    lda #$0F
    sta $2100           ; Turn on screen, full Brightness

    plp
    rts
;============================================================================

.ENDS

.BANK 1
.ORG 0
.SECTION "TileData"

	.INCLUDE "tiles.inc"

.ENDS
