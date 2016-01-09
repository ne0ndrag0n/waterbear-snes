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
		PPU_LoadBlockToVRAM Demo16Data, $0000, 3, 4

		PPU_SetVRAMWriteParams TRUE, PPU_IncRate_1x1

		jsr SetupVideo

		; Putting this after SetupVideo to test...

		PPU_SetDisplay FALSE, $0

		PPU_SetVRAMAddress $0400
		PPU_WriteVRAM FALSE, $01, DIRECT

		PPU_SetDisplay TRUE, $F
		PPU_SetDisplay FALSE, $0

		PPU_SetVRAMAddress $0401
		PPU_WriteVRAM FALSE, $01, DIRECT

		PPU_SetDisplay TRUE, $F
		PPU_SetDisplay FALSE, $0

		PPU_SetVRAMAddress $0402
		PPU_WriteVRAM FALSE, $02, DIRECT

		PPU_SetDisplay TRUE, $F

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

    PPU_SetTileMapAddr $01, PPU_TileMapSize_32x32, PPU_TILEMAP_ADDR_BG1

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

.ENDS
