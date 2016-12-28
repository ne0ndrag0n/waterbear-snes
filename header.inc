.IFNDEF HEADER
.DEFINE HEADER

;==LoRom==
.MEMORYMAP
  DEFAULTSLOT 0
  SLOT 0 $8000 $8000                ; LoROM Cartridge ROM. This is the actual cartridge data.
  ; Additional, custom slots for placement of WLA-DX variables
  SLOT 1 $0010 $1FF6           ; RAM past first 16 bytes (those are used for arguments)
  SLOT 2 $0000 $8000           ; SRAM, banks $FE and $FF ONLY
.ENDME

.ROMBANKSIZE $8000              ; Every ROM bank is 32 KBytes in size
.ROMBANKS 8                     ; 2 Mbits - Tell WLA we want to use 8 ROM Banks

.SNESHEADER
  ID "SNES"                     ; 1-4 letter string, just leave it as "SNES"

  NAME "My Waterbear Project "  ; Program Title - can't be over 21 bytes,
  ;    "123456789012345678901"  ; use spaces for unused bytes of the name.

  SLOWROM
  LOROM

  CARTRIDGETYPE $02             ; $00 = ROM only, see WLA documentation for others
  ROMSIZE $08                   ; $08 = 2 Mbits,  see WLA doc for more..
  SRAMSIZE $01                  ; No SRAM         see WLA doc for more..
  COUNTRY $01                   ; $01 = U.S.  $00 = Japan, that's all I know
  LICENSEECODE $00              ; Just use $00
  VERSION $00                   ; $00 = 1.00, $01 = 1.01, etc.
.ENDSNES

.SNESNATIVEVECTOR               ; Define Native Mode interrupt vector table
  COP EmptyHandler
  BRK EmptyHandler
  ABORT EmptyHandler
  NMI VBlank
  IRQ EmptyHandler
.ENDNATIVEVECTOR

.SNESEMUVECTOR                  ; Define Emulation Mode interrupt vector table
  COP EmptyHandler
  ABORT EmptyHandler
  NMI EmptyHandler
  RESET Start
  IRQBRK EmptyHandler
.ENDEMUVECTOR

.BANK 0             ; Defines the ROM bank and the slot it is inserted in memory.
.ORG 0              ; .ORG 0 is really $8000, because the slot starts at $8000
.SECTION "EmptyVectors" SEMIFREE

EmptyHandler:
        rti
.ENDS

.EMPTYFILL $00

.DEFINE TRUE $01.b
.DEFINE FALSE $00.b
;---------------------------------- END -------------------------------------

.ENDIF
