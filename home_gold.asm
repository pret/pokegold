; rst vectors
INCLUDE "constants.asm"

SECTION "rst0",ROM0[0]
	di
	jp Start

SECTION "rst8",ROM0[FarCall]
	jp FarCall_hl

SECTION "rst10",ROM0[Bankswitch]
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ret

SECTION "rst18",ROM0[$18]
	rst $38

SECTION "rst20",ROM0[$20]
	rst $38

SECTION "rst28",ROM0[JumpTable]
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	jp [hl]

; SECTION "rst30",ROM0[$30]
; rst30 is midst rst28

SECTION "rst38",ROM0[$38]
	rst $38

	
SECTION "interrupts", HOME[$40]
	dr $40, $100, 0

SECTION "start", HOME[$100]
Start::
	nop
	jp Start_

SECTION "bank0", HOME[$150]
INCLUDE "home/vblank.asm"
INCLUDE "home/delay.asm"

Function343::
	dr $343, $5c6, 0

Start_::
	dr $5c6, $8e6, 0

Function8e6::
	dr $8e6, $bdf, 0

Functionbdf::
	dr $bdf, $1458, 0

Function1458::
	dr $1458, $14bb, 0

Function14bb::
	dr $14bb, $1579, 0

Function1579::
	dr $1579, $15d0, 0

Function15d0::
	dr $15d0, $162b, 0

Function162b::
	dr $162b, $1642, 0

Function1642::
	dr $1642, $1ebf, 0

Function1ebf::
	dr $1ebf, $1efa, 0

Function1efa::
	dr $1efa, $2e27, 0

FarCall_hl::
	dr $2e27, $3fee, 0
