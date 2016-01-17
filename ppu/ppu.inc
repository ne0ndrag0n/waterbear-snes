; ===============================
; oaktree
; Waterbear framework for SNES
; (c) 2015 oaktree Novelties
;
; FILE: ppu.inc
; DESCRIPTION: PPU includes
; ===============================
.IFNDEF PPU_H
.DEFINE PPU_H

; PPU Screen Display Register
; Accepts 1 byte
.define		PPU_SCREEN_DISPLAY		$2100

; PPU Screen configuration
; Accepts 1 byte
.define		PPU_SCREEN_MODE			$2105

; PPU BG Tilemap configurations
; Accepts 2 byte each
.define		PPU_TILEMAP_ADDR_BG1	$2107
.define		PPU_TILEMAP_ADDR_BG2	$2108
.define		PPU_TILEMAP_ADDR_BG3	$2109
.define		PPU_TILEMAP_ADDR_BG4	$210A

; PPU BG Tlemap Character Locations
; Accepts 1 byte each
.define		PPU_CHAR_ADDR_BG12		$210B
.define		PPU_CHAR_ADDR_BG34		$210C

; PPU Vertical/Horizontal Scroll Control
; Accepts 2 bytes each
.define		PPU_HSCROLL_BG1			$210D
.define		PPU_VSCROLL_BG1			$210E
.define		PPU_HSCROLL_BG2			$210F
.define		PPU_VSCROLL_BG2			$2110
.define		PPU_HSCROLL_BG3			$2111
.define		PPU_VSCROLL_BG3			$2112
.define		PPU_HSCROLL_BG4			$2113
.define		PPU_VSCROLL_BG4			$2114

; PPU Controller Port
; Accepts 1 byte
.define		PPU_PORT_SETTINGS		$2115

; PPU VRAM Address Setting. *PPU_VRAM_ADDRESS
; holds 2 bytes representing the location of
; the next write
; Accepts 2 bytes
.define		PPU_VRAM_ADDRESS		$2116
.define		PPU_VRAM_ADDRESS_HIGH	$2117

; PPU VRAM Write Port
; Accepts 2 bytes
.define		PPU_VRAM_DATA			$2118
.define		PPU_VRAM_DATA_HIGH		$2119

; PPU Tile & Sprite Visibility Control
; Accepts 1 byte
.define		PPU_TILE_SPR_CONTROL	$212C

; ============= Constants/Enumerations =============

.define		PPU_BG1					$01
.define		PPU_BG2					$02
.define		PPU_BG3					$03
.define		PPU_BG4					$04

.define		PPU_BG1BG2				$00
.define		PPU_BG3BG4				$01

.define		PPU_IncRate_1x1			$00
.define		PPU_IncRate_32x32		$01
.define		PPU_IncRate_64x64		$02
.define		PPU_IncRate_128x128		$03

.define		PPU_Mode_0				$00
.define		PPU_Mode_1				$01
.define		PPU_Mode_2				$02
.define		PPU_Mode_3				$03
.define		PPU_Mode_4				$04
.define		PPU_Mode_5				$05
.define		PPU_Mode_6				$06
.define		PPU_Mode_7				$07

.define		PPU_TileMapSize_32x32	$00
.define		PPU_TileMapSize_64x32	$01
.define		PPU_TileMapSize_32x64	$02
.define		PPU_TileMapSize_64x64	$03

.define		PPU_IncOnLow			$00
.define		PPU_IncOnHigh			$01

.ENDIF
