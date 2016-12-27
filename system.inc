;==============================================================================
; WaterBear SNES Development Kit
;
; FILE: system.inc
; DESCRIPTION: System-level shit
; (c) 2016-2017 Neon Dragon Enterprises (ne0ndrag0n)
;==============================================================================
.IFNDEF SYSTEM
.DEFINE SYSTEM

.DEFINE   VBlank_Function_Pointer   $0001

.MACRO Set_RAM_Bank ARGS Byte
  lda #Byte
  pha
  plb
.ENDM

.MACRO Set_A_16Bit
  rep #%00100000
.ENDM

.MACRO Set_A_8Bit
  sep #%00100000
.ENDM

;==============================================================================
; Stage a function to be called once on VBlank.
; Modifies: A, Status Regs
;==============================================================================
.MACRO Stage_VBlank ARGS function
  Set_A_16Bit
  lda.w #function
  sta VBlank_Function_Pointer
.ENDM

.ENDIF
