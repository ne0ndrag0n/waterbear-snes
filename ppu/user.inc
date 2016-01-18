; ===============================
; oaktree
; Waterbear framework for SNES
; (c) 2015 oaktree Novelties
;
; FILE: user.inc
; DESCRIPTION: User settings for
; PPU macros/functions.
; ===============================

; ** DO NOT INCLUDE HEADER FILES IN USER SETTING FILES SUCH AS THIS ONE! **

.IFNDEF PPU_U
.DEFINE PPU_U

; (testing custom javadoc-style format for waterbear self-generating documentation...)
; (new blocks will begin at the next @title declaration)

; @title PPU_BG1TileMapIndex
; @desc	 This is the word-based address (in multiples of $0400) for the BG1 tilemap.
; @minVal	$01
; @maxVal	$19		(A word-based address cannot meet or exceed $8000, or index of $20).
.DEFINE		PPU_BG1TileMapIndex		$18

; @title PPU_BG2TileMapIndex
; @desc	 This is the word-based address (in multiples of $0400) for the BG2 tilemap.
; @minVal	$01
; @maxVal	$19		(A word-based address cannot meet or exceed $8000, or index of $20).
.DEFINE		PPU_BG2TileMapIndex		$19

; @title PPU_BG1CharacterSet
; @desc	 This defines the word-based address for a character set
.DEFINE		PPU_BG1CharacterSet		$00

; @title PPU_BG1CharacterSet
; @desc	 This defines the word-based address for a character set
.DEFINE		PPU_BG2CharacterSet		$01

; @title PPU_PrimaryScreenMode
; @desc  Defines the primary screenmode used by your waterbear application; used in convience macros.
.DEFINE		PPU_PrimaryScreenMode	PPU_Mode_1

; @title PPU_PrimaryTileMapSize
; @desc	 Defines the size of the scrolling planes (in 8x8 or 8x16 tiles)
.DEFINE		PPU_PrimaryTileMapSize	PPU_TileMapSize_64x32
.ENDIF
