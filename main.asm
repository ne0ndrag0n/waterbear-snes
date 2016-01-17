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
		;PPU_LoadBlockToVRAM Demo16Data, $0000, 3, 4

		; Steamrolls over the tilemap
		PPU_LoadBlockToVRAM FontData4BPP, $0000, 96, 4

		jsr SetupVideo

		; Putting this after SetupVideo to test...

		PPU_FillTileMap $0800, $01, 2, FALSE, TRUE

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

    PPU_SetScreenMode PPU_Mode_2, FALSE, FALSE, FALSE, FALSE, FALSE

    PPU_SetTileMapAddr $02, PPU_TileMapSize_32x32, PPU_TILEMAP_ADDR_BG1

    PPU_SetCharAddr PPU_BG1, $00

    PPU_SetSpriteAndTileLayers FALSE, TRUE, FALSE, FALSE, FALSE

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
