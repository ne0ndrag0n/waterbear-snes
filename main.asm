;== Include memorymap, header info, and SNES initialization routines
.INCLUDE "header.inc"
.INCLUDE "InitSNES.asm"
.INCLUDE "macros.asm"
.INCLUDE "ppu.asm"

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
		LoadBlockToVRAM Tiles, $0000, $0030	; 2 tiles, 2bpp, = 32 bytes

		; Now, load up some data into our tile map
		; (If you had an full map, you could use LoadBlockToVRAM)
		; Remember that in the default map, all entries point to tile #0

		; Increment when $2119 is accessed. Increment by one word.
		PPU_SetVRAMWriteParams TRUE, PPU_IncRate_1x1

		; Set VRAM upload address to $0400.
		PPU_SetVRAMAddress $0400

		; Write $01 to VRAM data input port.
		PPU_WriteVRAM FALSE, $01

		; Go ahead and write another tile
		PPU_SetVRAMAddress $0401
		PPU_WriteVRAM FALSE, $02

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
    sta PPU_SCREEN_MODE           	; Set Video mode 0, 8x8 tiles, 4 color BG1/BG2/BG3/BG4

    lda #$04						; Set BG1's Tile Map offset to $0400 (Word address)
    sta PPU_TILEMAP_ADDR_BG1		; And the Tile Map size to 32x32

    stz PPU_CHAR_ADDR_BG12			; Set BG1's Character VRAM offset to $0000 (word address)

    lda #$01						; Enable BG1
    sta PPU_TILE_SPR_CONTROL

    lda #$FF
    sta PPU_VSCROLL_BG1
    sta PPU_VSCROLL_BG1

    lda #$0F
    sta PPU_SCREEN_DISPLAY			; Turn on screen, full Brightness

    plp
    rts
;============================================================================

.ENDS

.BANK 1
.ORG 0
.SECTION "TileData"

	.INCLUDE "tiles.inc"

.ENDS
