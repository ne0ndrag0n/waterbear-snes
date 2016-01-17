;== Include memorymap, header info, and SNES initialization routines
.INCLUDE "header.inc"
.INCLUDE "InitSNES.asm"
.INCLUDE "ppu/ppu.asm"
.INCLUDE "sys/system.asm"

.BANK 0 SLOT 0
.ORG 0
.SECTION "MainCode"

; DMA uses byte address I think...
.DEFINE		BG1TileMapIndex		$18
.DEFINE		BG1TileMapAddr		( BG1TileMapIndex << 10 )
.DEFINE		BG2TileMapIndex		$19
.DEFINE		BG2TileMapAddr		( BG2TileMapIndex << 10 )
.DEFINE		BG1CharacterSet		$00
.DEFINE		BG1CharacterAddr	( BG1CharacterSet << 12 ) / 2
.DEFINE		BG2CharacterSet		$01
.DEFINE		BG2CharacterAddr	( BG2CharacterSet << 12 ) / 2


Start:
        InitSNES            ; Init Snes :)

		PPU_LoadPalette Demo16Palette, 0, 16

		PPU_LoadBlockToVRAM FontData4BPP, BG1CharacterAddr, 96, 4
		PPU_LoadBlockToVRAM Demo16Data, BG2CharacterAddr, 2, 4

		jsr SetupVideo

		; Putting this after SetupVideo to test...

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

    PPU_SetCharAddr PPU_BG1BG2, $00, $01

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
