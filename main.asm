;== Include memorymap, header info, and SNES initialization routines
.INCLUDE "header.inc"
.INCLUDE "InitSNES.asm"
.INCLUDE "ppu/ppu.asm"

;========================
; Start
;========================

.BANK 0 SLOT 0
.ORG 0
.SECTION "MainCode"

Start:
        InitSNES            ; Init Snes :)

forever:
        jmp forever

.ENDS

.BANK 1
.ORG 0
.SECTION "TileData"

	.INCLUDE "tiles.inc"

.ENDS
