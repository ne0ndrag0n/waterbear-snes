;== Include memorymap, header info, and SNES initialization routines
.INCLUDE "header.inc"
.INCLUDE "InitSNES.asm"
.INCLUDE "ppu/ppu.asm"

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
		PPU_WriteVRAM FALSE, $01

forever:
        jmp forever

.ENDS

.BANK 1
.ORG 0
.SECTION "TileData"

	.INCLUDE "tiles.inc"

.ENDS
