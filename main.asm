;== Include memorymap, header info, and SNES initialization routines
.INCLUDE "header.inc"
.INCLUDE "InitSNES.asm"
.INCLUDE "ppu/ppu.asm"
.INCLUDE "sys/system.asm"

.BANK 0 SLOT 0
.ORG 0
.SECTION "MainCode"

Start:
        InitSNES            ; Init Snes :)

		PPU_LoadPalette Demo16Palette, 0, 16

		PPU_LoadBlockToVRAM FontData4BPP, PPU_BG1CharacterAddr, 96, 4
		PPU_LoadBlockToVRAM Demo16Data, PPU_BG2CharacterAddr, 2, 4

		jsr SetupVideo

		; Putting this after SetupVideo to test...
		PPU_FillTileMap PPU_BG1TileMapAddr, $00, 96, TRUE, TRUE
		PPU_FillTileMap PPU_BG1TileMapAddr + 96, $00, 96, TRUE, TRUE
		PPU_FillTileMap PPU_BG1TileMapAddr + ( 96 * 2 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap PPU_BG1TileMapAddr + ( 96 * 3 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap PPU_BG1TileMapAddr + ( 96 * 4 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap PPU_BG1TileMapAddr + ( 96 * 5 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap PPU_BG1TileMapAddr + ( 96 * 6 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap PPU_BG1TileMapAddr + ( 96 * 7 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap PPU_BG1TileMapAddr + ( 96 * 8 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap PPU_BG1TileMapAddr + ( 96 * 9 ), $00, 32, TRUE, TRUE
main:

        jmp main

;============================================================================
VBlank:
	phb
	php

	System_SetAccumulatorSize 	System_REGISTER_BYTE
	System_SetIndexSize       	System_REGISTER_WORD

    plp
    plb
    RTI
;============================================================================

;============================================================================
; SetupVideo -- Sets up the video mode and tile-related registers
;----------------------------------------------------------------------------
; In: None
;----------------------------------------------------------------------------
; Out: None
;----------------------------------------------------------------------------
SetupVideo:

    PPU_SetScreenMode PPU_PrimaryScreenMode, FALSE, FALSE, FALSE, FALSE, FALSE

    PPU_SetTileMapAddr PPU_BG1TileMapIndex, PPU_PrimaryTileMapSize, PPU_TILEMAP_ADDR_BG1

    PPU_SetCharAddr PPU_BG1BG2, PPU_BG1CharacterSet, PPU_BG2CharacterSet

    PPU_SetSpriteAndTileLayers FALSE, TRUE, FALSE, FALSE, FALSE

	; write waterbear PPU_Scroll* functions
    lda #$FF
    sta $210E
    sta $210E

    rts

.ENDS

.BANK 1
.ORG 0
.SECTION "TileData"

	.INCLUDE "res/tilesets/testfaces.inc"
	.INCLUDE "res/tilesets/charset.inc"

.ENDS
