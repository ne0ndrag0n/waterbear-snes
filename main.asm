;== Include memorymap, header info, and SNES initialization routines
.INCLUDE "header.inc"
.INCLUDE "InitSNES.asm"
.INCLUDE "ppu/ppu.asm"
.INCLUDE "sys/system.asm"

.EQU	PalNum		$0000

.BANK 0 SLOT 0
.ORG 0
.SECTION "MainCode"

Start:
        InitSNES            ; Init Snes :)

		PPU_LoadPalette BG_Palette, 0, 14
		PPU_LoadBlockToVRAMBytes Tiles, $0000, $0020

		PPU_SetVRAMWriteParams TRUE, FALSE
		PPU_SetVRAMAddress $0400
		PPU_WriteVRAM FALSE, $01, DIRECT

		PPU_SetVRAMAddress $0401
		PPU_WriteVRAM FALSE, $01, DIRECT

		jsr SetupVideo

		System_SetInterrupts TRUE, FALSE, FALSE, FALSE

main:
		System_Stall 6
		lda PalNum
		clc
		adc #$04
		and #$0C
		sta PalNum

        jmp main

;============================================================================
VBlank:

	; Setup VRAM
    PPU_SetVRAMWriteParams FALSE, FALSE

    ; Set VRAM address
    PPU_SetVRAMAddress $0400

    ; Write to VRAM
    PPU_WriteVRAM TRUE, PalNum, INDIRECT

    stz $4210       ; Clear NMI flag

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

    PPU_SetScreenMode PPU_Mode_0, FALSE, FALSE, FALSE, FALSE, FALSE

    PPU_SetTileMapAddr $01, PPU_TileMapSize_32x32, PPU_TILEMAP_ADDR_BG1

    PPU_SetCharAddr PPU_BG1, $00

    PPU_SetSpriteAndTileLayers FALSE, TRUE, FALSE, FALSE, FALSE

    PPU_SetDisplay TRUE, $F

    rts

.ENDS

.BANK 1
.ORG 0
.SECTION "TileData"

	.INCLUDE "tiles.inc"

.ENDS
