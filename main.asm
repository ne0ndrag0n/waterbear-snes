;== Include memorymap, header info, and SNES initialization routines
.INCLUDE "header.inc"
.INCLUDE "InitSNES.asm"
.INCLUDE "ppu/ppu.asm"
.INCLUDE "sys/system.asm"

.BANK 0 SLOT 0
.ORG 0
.SECTION "MainCode"

.DEFINE		BG1TileMapIndex		$14
.DEFINE		BG1TIleMapAddr		( BG1TileMapIndex << 10 )

Start:
        InitSNES            ; Init Snes :)

		PPU_LoadPalette Demo16Palette, 0, 16

		PPU_LoadBlockToVRAM FontData4BPP, $0000, 96, 4
		PPU_LoadBlockToVRAM Demo16Data, $0600, 2, 4

		jsr SetupVideo

		; Putting this after SetupVideo to test...
		PPU_FillTileMap BG1TIleMapAddr, $00, 96, TRUE, TRUE
		PPU_FillTileMap BG1TIleMapAddr + 96, $00, 96, TRUE, TRUE
		PPU_FillTileMap BG1TIleMapAddr + ( 96 * 2 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap BG1TIleMapAddr + ( 96 * 3 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap BG1TIleMapAddr + ( 96 * 4 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap BG1TIleMapAddr + ( 96 * 5 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap BG1TIleMapAddr + ( 96 * 6 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap BG1TIleMapAddr + ( 96 * 7 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap BG1TIleMapAddr + ( 96 * 8 ), $00, 96, TRUE, TRUE
		PPU_FillTileMap BG1TIleMapAddr + ( 96 * 9 ), $00, 32, TRUE, TRUE

main:

        jmp main

;============================================================================
VBlank:
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

    PPU_SetScreenMode PPU_Mode_1, FALSE, FALSE, FALSE, FALSE, FALSE

    PPU_SetTileMapAddr BG1TileMapIndex, PPU_TileMapSize_32x32, PPU_TILEMAP_ADDR_BG1

    PPU_SetCharAddr PPU_BG1, $00

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

	.INCLUDE "tiles.inc"
	.INCLUDE "font.inc"

.ENDS
