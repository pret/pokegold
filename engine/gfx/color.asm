PALPACKET_LENGTH EQU $10
INCLUDE "engine/gfx/sgb_layouts.asm"

SHINY_ATK_BIT EQU 5
SHINY_DEF_VAL EQU 10
SHINY_SPD_VAL EQU 10
SHINY_SPC_VAL EQU 10

CheckShininess:
	ld l, c
	ld h, b
	ld a, [hl]
	and $20
	jr z, .asm_9070
	ld a, [hli]
	and $f
	cp $a
	jr nz, .asm_9070
	ld a, [hl]
	and $f0
	cp $a0
	jr nz, .asm_9070
	ld a, [hl]
	and $f
	cp $a
	jr nz, .asm_9070
	scf
	ret

.asm_9070
	and a
	ret

Unused_CheckShininess: ; 9072 (2:5072)
	ld a, [hl]
	cp $a0
	jr c, .asm_908c
	ld a, [hli]
	and $f
	cp $a
	jr c, .asm_908c
	ld a, [hl]
	cp $a0
	jr c, .asm_908c
	ld a, [hl]
	and $f
	cp $a
	jr c, .asm_908c
	scf
	ret

.asm_908c
	and a
	ret

Function908e:
	push de
	push bc
	ld hl, PalPacket_a155
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	pop bc
	pop de
	ld a, c
	ld [wccac], a
	ld a, b
	ld [wccad], a
	ld a, e
	ld [wccae], a
	ld a, d
	ld [wccaf], a
	ld hl, wcca9
	call PushSGBPals_
	ld hl, BlkPacket_9ee5
	call PushSGBPals_
	ret

InitPartyMenuPalettes:
	call CheckCGB
	jr nz, .asm_90cc
	ld hl, BlkPacket_9fa5
	ld de, wccaa
	ld bc, $30
	jp CopyBytes

.asm_90cc
	ld hl, PalPacket_a0c5 + 1
	call Function9ab2
	call Function9b9c
	call Function9b1d
	ret

SGB_ApplyPartyMenuHPPals:
	ld hl, wcc9b
	ld a, [wcca9]
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	and a
	ld e, $5
	jr z, .asm_90f2
	dec a
	ld e, $a
	jr z, .asm_90f2
	ld e, $f
.asm_90f2
	push de
	ld hl, wccb3
	ld bc, $6
	ld a, [wcca9]
	call AddNTimes
	pop de
	ld [hl], e
	ret

Function9102:
	call CheckCGB
	ret z
	ld hl, .BGPal
	ld de, wTempBGPals
	ld bc, $8
	call CopyBytes
	ld hl, .OBPal
	ld de, wTempOBPals
	ld bc, $8
	call CopyBytes
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.BGPal:
	RGB 31, 31, 31
	RGB 18, 23, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

.OBPal:
	RGB 31, 31, 31
	RGB 31, 31, 12
	RGB 08, 16, 28
	RGB 00, 00, 00

Function9136:
	call CheckCGB
	ret nz
	ldh a, [hSGB]
	and a
	ret z
	ld hl, BlkPacket_9ee5
	jp PushSGBPals_

Function9144:
	call CheckCGB
	jr nz, .asm_9153
	ldh a, [hSGB]
	and a
	ret z
	ld hl, PalPacket_a095
	jp PushSGBPals_

.asm_9153
	ld de, wTempOBPals
	ld a, $3b
	call Function9ac7
	jp Function9ad2

Function915e:
	call CheckCGB
	jr nz, .asm_916d
	ldh a, [hSGB]
	and a
	ret z
	ld hl, PalPacket_a0a5
	jp PushSGBPals_

.asm_916d
	ld de, wTempOBPals
	ld a, $3c
	call Function9ac7
	jp Function9ad2

Function9178:
	call CheckCGB
	jr nz, .asm_91a9
	ldh a, [hSGB]
	and a
	ret z
	ld a, c
	push af
	ld hl, PalPacket_a155
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	pop af
	call Function9be4
	ld a, [hli]
	ld [wccac], a
	ld a, [hli]
	ld [wccad], a
	ld a, [hli]
	ld [wccae], a
	ld a, [hl]
	ld [wccaf], a
	ld hl, wcca9
	jp PushSGBPals_

.asm_91a9
	ld de, wTempOBPals
	ld a, c
	call Function9be4
	call Function9adb
	ret

Function91b4:
	ldh a, [hCGB]
	and a
	jr nz, .asm_91bf
	ld hl, wc602
	jp PushSGBPals_

.asm_91bf
	ld a, [wc606]
	ld c, a
	ld a, [wc607]
	ld hl, wAttrmap
	ld de, $14
.asm_91cc
	and a
	jr z, .asm_91d3
	add hl, de
	dec a
	jr .asm_91cc

.asm_91d3
	ld b, $0
	add hl, bc
	lb bc, 6, 4
	ld a, [wc605]
	and $3
	call Function9af1
	call CopyTilemapAtOnce
	ret

ApplyMonOrTrainerPals: ; 91e5 (2:51e5)
	call CheckCGB
	ret z
	ld a, e
	and a
	jr z, .asm_91f5
	ld a, [wCurPartySpecies]
	call Function9be4
	jr .asm_91fb

.asm_91f5
	ld a, [wTrainerClass]
	call Function9bda
.asm_91fb
	ld de, wTempBGPals
	call Function9adb
	call Function9b1d
	call Function9b35
	call Function9b28
	ret

ApplyHPBarPals:
	ld a, [wWhichHPBar]
	and a
	jr z, .asm_921a
	cp $1
	jr z, .asm_921f
	cp $2
	jr z, .asm_9236
	ret

.asm_921a
	ld de, $c292
	jr .asm_9222

.asm_921f
	ld de, $c29a
.asm_9222
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, $6d2d
	add hl, bc
	ld bc, $4
	call CopyBytes
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.asm_9236
	ld e, c
	inc e
	hlcoord 11, 1, wAttrmap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wCurPartyMon]
.asm_9241
	and a
	jr z, .asm_9248
	add hl, bc
	dec a
	jr .asm_9241

.asm_9248
	lb bc, 2, 8
	ld a, e
	call Function9af1
	ret

LoadStatsScreenPals:
	call CheckCGB
	ret z
	ld hl, StatsScreenPals ; $54eb
	ld b, $0
	dec c
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wTempBGPals], a
	ld [wTempBGPals + $10], a
	ld a, [hl]
	ld [wTempBGPals + 1], a
	ld [wTempBGPals + $11], a
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

LoadMailPalettes:
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, .MailPals
	add hl, de
	call CheckCGB
	jr nz, .asm_92ae
	push hl
	ld hl, PalPacket_a155
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	pop hl
	inc hl
	inc hl
	ld a, [hli]
	ld [wccac], a
	ld a, [hli]
	ld [wccad], a
	ld a, [hli]
	ld [wccae], a
	ld a, [hli]
	ld [wccaf], a
	ld hl, wcca9
	call PushSGBPals_
	ld hl, BlkPacket_9ee5
	call PushSGBPals_
	ret

.asm_92ae
	ld de, wTempBGPals
	ld bc, $8
	call CopyBytes
	call Function9b28
	call Function9b1d
	call Function9b35
	ret

.MailPals:
INCLUDE "gfx/mail/mail.pal"

INCLUDE "engine/gfx/cgb_layouts.asm"

Function9a94: ; 9a94 (2:5a94)
	ld hl, Palettes_9aaa
	ld de, wTempBGPals
	ld bc, $8
	call CopyBytes
	call Function9b28
	call Function9b1d
	call Function9b35
	ret

Palettes_9aaa:
	RGB 31, 31, 31
	RGB  9, 31, 31
	RGB 10, 12, 31
	RGB  0,  3, 19

Function9ab2: ; 9ab2 (2:5ab2)
	ld de, wTempBGPals
	ld c, $4
Function9ab7: ; 9ab7 (2:5ab7)
	push bc
	ld a, [hli]
	push hl
	call Function9ac7
	call Function9ad2
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, Function9ab7
	ret

Function9ac7: ; 9ac7 (2:5ac7)
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, Palettes_a265
	add hl, bc
	ret

Function9ad2: ; 9ad2 (2:5ad2)
	ld c, $8
.asm_9ad4
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_9ad4
	ret

Function9adb: ; 9adb (2:5adb)
	ld a, $ff
	ld [de], a
	inc de
	ld a, $7f
	ld [de], a
	inc de
	ld c, $4
.asm_9ae5
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_9ae5
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ret

Function9af1: ; 9af1 (2:5af1)
	push bc
	push hl
.asm_9af3
	ld [hli], a
	dec c
	jr nz, .asm_9af3
	pop hl
	ld bc, $14
	add hl, bc
	pop bc
	dec b
	jr nz, Function9af1
	ret

Function9b01: ; 9b01 (2:5b01)
	push af
	push bc
	push de
	push hl
	ld hl, wTempBGPals
	ld c, $8
.asm_9b0a
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .asm_9b0a
	pop hl
	pop de
	pop bc
	pop af
	ret

Function9b1d: ; 9b1d (2:5b1d)
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ret

Function9b28: ; 9b28 (2:5b28)
	ld hl, wTempBGPals
	ld de, wBGPals
	ld bc, $80
	call CopyBytes
	ret

Function9b35: ; 9b35 (2:5b35)
	ldh a, [rLCDC]
	bit 7, a
	jr z, .asm_9b52
	ldh a, [hBGMapMode]
	push af
	ld a, $2
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	call DelayFrame
	pop af
	ldh [hBGMapMode], a
	ret

.asm_9b52
	hlcoord 0, 0, wAttrmap
	ld de, $9800
	ld b, $12
	ld a, $1
	ldh [rVBK], a
.asm_9b5e
	ld c, $14
.asm_9b60
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_9b60
	ld a, $c
	add e
	jr nc, .asm_9b6c
	inc d
.asm_9b6c
	ld e, a
	dec b
	jr nz, .asm_9b5e
	ld a, $0
	ldh [rVBK], a
	ret

Function9b75: ; 9b75 (2:5b75)
	ld hl, wcc9b
	ld a, [wcca9]
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	inc a
	ld e, a
	hlcoord 11, 2, wAttrmap
	ld bc, $28
	ld a, [wcca9]
.asm_9b8d
	and a
	jr z, .asm_9b94
	add hl, bc
	dec a
	jr .asm_9b8d

.asm_9b94
	lb bc, 2, 8
	ld a, e
	call Function9af1
	ret

Function9b9c: ; 9b9c (2:5b9c)
	ld hl, Palettes_bac6
	ld de, wTempOBPal0
	ld bc, $10
	call CopyBytes
	ret

Function9ba9: ; 9ba9 (2:5ba9)
	push de
	farcall GetPartyMonDVs
	ld c, l
	ld b, h
	ld a, [wTempBattleMonSpecies]
	call Function9bcb
	pop de
	ret

Function9bba: ; 9bba (2:5bba)
	push de
	farcall GetEnemyMonDVs
	ld c, l
	ld b, h
	ld a, [wTempEnemyMonSpecies]
	call Function9bd3
	pop de
	ret

Function9bcb: ; 9bcb (2:5bcb)
	and a
	jp nz, Function9c66
	ld hl, TrainerPalettes
	ret

Function9bd3: ; 9bd3 (2:5bd3)
	and a
	jp nz, Function9c66
	ld a, [wTrainerClass]
Function9bda: ; 9bda (2:5bda)
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, TrainerPalettes
	add hl, bc
	ret

Function9be4: ; 9be4 (2:5be4)
	call Function9c5b
	ret

Function9be8:
	ret

Function9be9:
	call CheckCGB
	ret z
	ld hl, Palettes_9c09
	ld a, $90
	ldh [rOBPI], a
	ld c, $30
.asm_9bf6
	ld a, [hli]
	ldh [rOBPD], a
	dec c
	jr nz, .asm_9bf6
	ld hl, Palettes_9c09
	ld de, wTempOBPal2
	ld bc, $10
	call CopyBytes
	ret

Palettes_9c09:
	RGB 31, 31, 31
	RGB 25, 25, 25
	RGB 13, 13, 13
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 31, 31,  7
	RGB 31, 16,  1
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 31, 19, 24
	RGB 30, 10,  6
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 12, 25,  1
	RGB  5, 14,  0
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB  8, 12, 31
	RGB  1,  4, 31
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 24, 18,  7
	RGB 20, 15,  3
	RGB  0,  0,  0

Function9c39:
	call CheckCGB
	ret z
	ld a, $90
	ldh [rOBPI], a
	ld a, $1c
	call Function9ac7
	call Function9c52
	ld a, $21
	call Function9ac7
	call Function9c52
	ret

Function9c52: ; 9c52 (2:5c52)
	ld c, $8
.asm_9c54
	ld a, [hli]
	ldh [rOBPD], a
	dec c
	jr nz, .asm_9c54
	ret

Function9c5b: ; 9c5b (2:5c5b)
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PokemonPalettes
	add hl, bc
	ret

Function9c66: ; 9c66 (2:5c66)
	push bc
	call Function9c5b
	pop bc
	push hl
	call CheckShininess
	pop hl
	ret nc
	inc hl
	inc hl
	inc hl
	inc hl
	ret

PushSGBPals_: ; 9c76 (2:5c76)
	ld a, [wd8ba]
	push af
	set 7, a
	ld [wd8ba], a
	call Function9c87
	pop af
	ld [wd8ba], a
	ret

Function9c87: ; 9c87 (2:5c87)
	ld a, [hl]
	and $7
	ret z
	ld b, a
.asm_9c8c
	push bc
	xor a
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	ld b, $10
.asm_9c96
	ld e, $8
	ld a, [hli]
	ld d, a
.asm_9c9a
	bit 0, d
	ld a, $10
	jr nz, .asm_9ca2
	ld a, $20
.asm_9ca2
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	rr d
	dec e
	jr nz, .asm_9c9a
	dec b
	jr nz, .asm_9c96
	ld a, $20
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	call Function9ed9
	pop bc
	dec b
	jr nz, .asm_9c8c
	ret

InitSGBBorder: ; 9cc0 (2:5cc0)
	call CheckCGB
	ret nz
	di
	ld a, [wd8ba]
	push af
	set 7, a
	ld [wd8ba], a
	xor a
	ldh [rJOYP], a
	ldh [hSGB], a
	call Function9da9
	jr nc, .asm_9cf7
	ld a, $1
	ldh [hSGB], a
	call Function9d4a
	call Function9e13
	call Function9ed9
	call Function9d9e
	call Function9d8b
	call Function9ed9
	call Function9d9e
	ld hl, PalPacket_a1d5
	call Function9c87
.asm_9cf7
	pop af
	ld [wd8ba], a
	ei
	ret

InitCGBPals:: ; 9cfd (2:5cfd)
	call CheckCGB
	ret z
	ld a, $1
	ldh [rVBK], a
	ld hl, $8000
	ld bc, $2000
	xor a
	call ByteFill
	ld a, $0
	ldh [rVBK], a
	ld a, $80
	ldh [rBGPI], a
	ld c, $20
.asm_9d19
	ld a, $ff
	ldh [rBGPD], a
	ld a, $7f
	ldh [rBGPD], a
	dec c
	jr nz, .asm_9d19
	ld a, $80
	ldh [rOBPI], a
	ld c, $20
.asm_9d2a
	ld a, $ff
	ldh [rOBPD], a
	ld a, $7f
	ldh [rOBPD], a
	dec c
	jr nz, .asm_9d2a
	ld hl, wTempBGPals
	call Function9d3e
	ld hl, wBGPals
Function9d3e: ; 9d3e (2:5d3e)
	ld c, $40
.asm_9d40
	ld a, $ff
	ld [hli], a
	ld a, $7f
	ld [hli], a
	dec c
	jr nz, .asm_9d40
	ret

Function9d4a: ; 9d4a (2:5d4a)
	ld hl, .Pointers
	ld c, $9
.asm_9d4f
	push bc
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	call Function9c87
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .asm_9d4f
	ret

.Pointers:
	dw PalPacket_a1c5
	dw PalPacket_a1e5
	dw PalPacket_a1f5
	dw PalPacket_a205
	dw PalPacket_a215
	dw PalPacket_a225
	dw PalPacket_a235
	dw PalPacket_a245
	dw PalPacket_a255

Function9d70:
	di
	xor a
	ldh [rJOYP], a
	ld hl, PalPacket_a1c5
	call Function9c87
	call Function9d8b
	call Function9ed9
	call Function9d9e
	ld hl, PalPacket_a1d5
	call Function9c87
	ei
	ret

Function9d8b: ; 9d8b (2:5d8b)
	call Function9d97
	push de
	call Function9e83
	pop hl
	call Function9e37
	ret

Function9d97: ; 9d97 (2:5d97)
	ld hl, SGBBorder
	ld de, SGBBorderMap
	ret

Function9d9e: ; 9d9e (2:5d9e)
	ld hl, $8000
	ld bc, $2000
	xor a
	call ByteFill
	ret

Function9da9: ; 9da9 (2:5da9)
	ld hl, PalPacket_a195
	call Function9c87
	call Function9ed9
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .asm_9e05
	ld a, $20
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	call Function9ed9
	call Function9ed9
	ld a, $30
	ldh [rJOYP], a
	call Function9ed9
	call Function9ed9
	ld a, $10
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	call Function9ed9
	call Function9ed9
	ld a, $30
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	call Function9ed9
	call Function9ed9
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .asm_9e05
	call Function9e0a
	and a
	ret

.asm_9e05
	call Function9e0a
	scf
	ret

Function9e0a: ; 9e0a (2:5e0a)
	ld hl, PalPacket_a185
	call Function9c87
	jp Function9ed9

Function9e13: ; 9e13 (2:5e13)
	call DisableLCD
	ld a, $e4
	ldh [rBGP], a
	ld hl, Palettes_a265
	ld de, $8800
	ld bc, $1000
	call Function9eb1
	call Function9ec3
	ld a, $e3
	ldh [rLCDC], a
	ld hl, PalPacket_a175
	call Function9c87
	xor a
	ldh [rBGP], a
	ret

Function9e37: ; 9e37 (2:5e37)
	call DisableLCD
	ld a, $e4
	ldh [rBGP], a
	ld de, $8800
	ld bc, $140
	call Function9eb1
	ld b, $12
.asm_9e49
	push bc
	ld bc, $c
	call Function9eb1
	ld bc, $28
	call Function9eba
	ld bc, $c
	call Function9eb1
	pop bc
	dec b
	jr nz, .asm_9e49
	ld bc, $140
	call Function9eb1
	ld bc, $100
	call Function9eba
	ld bc, $80
	call Function9eb1
	call Function9ec3
	ld a, $e3
	ldh [rLCDC], a
	ld hl, PalPacket_a1b5
	call Function9c87
	xor a
	ldh [rBGP], a
	ret

Function9e83: ; 9e83 (2:5e83)
	call DisableLCD
	ld a, $e4
	ldh [rBGP], a
	ld de, $8800
	ld b, $80
.asm_9e8f
	push bc
	ld bc, $10
	call Function9eb1
	ld bc, $10
	call Function9eba
	pop bc
	dec b
	jr nz, .asm_9e8f
	call Function9ec3
	ld a, $e3
	ldh [rLCDC], a
	ld hl, PalPacket_a1a5
	call Function9c87
	xor a
	ldh [rBGP], a
	ret

Function9eb1: ; 9eb1 (2:5eb1)
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, Function9eb1
	ret

Function9eba: ; 9eba (2:5eba)
	xor a
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, Function9eba
	ret

Function9ec3: ; 9ec3 (2:5ec3)
	ld hl, $9800
	ld de, $c
	ld a, $80
	ld c, $d
.asm_9ecd
	ld b, $14
.asm_9ecf
	ld [hli], a
	inc a
	dec b
	jr nz, .asm_9ecf
	add hl, de
	dec c
	jr nz, .asm_9ecd
	ret

Function9ed9: ; 9ed9 (2:5ed9)
	ld de, 7000
.asm_9edc
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .asm_9edc
	ret

BlkPacket_9ee5:	db $21, $01, $03, $00, $00, $00, $13, $11, $00, $00, $00, $00, $00, $00, $00, $00
BlkPacket_9ef5:	db $21, $01, $07, $05, $00, $0a, $13, $0d, $00, $00, $00, $00, $00, $00, $00, $00
BlkPacket_9f05:	db $22, $05, $07, $0a, $00, $0c, $13, $11, $03, $05, $01, $00, $0a, $03, $03, $00
BlkPacket_9f15:	db $0a, $08, $13, $0a, $03, $0a, $00, $04, $08, $0b, $03, $0f, $0b, $00, $13, $07
BlkPacket_9f25:	db $21, $01, $07, $05, $00, $00, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00
BlkPacket_9f35:	db $21, $01, $06, $05, $0b, $01, $13, $02, $00, $00, $00, $00, $00, $00, $00, $00
BlkPacket_9f45:	db $21, $01, $07, $05, $00, $01, $07, $07, $00, $00, $00, $00, $00, $00, $00, $00
BlkPacket_9f55:	db $21, $01, $07, $05, $01, $04, $07, $0a, $00, $00, $00, $00, $00, $00, $00, $00
BlkPacket_9f65:	db $21, $01, $07, $05, $01, $01, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00
BlkPacket_9f75:	db $21, $01, $07, $05, $07, $05, $0d, $0b, $00, $00, $00, $00, $00, $00, $00, $00
BlkPacket_9f85:	db $22, $05, $03, $05, $00, $00, $13, $0b, $03, $0a, $00, $04, $13, $09, $02, $0f
BlkPacket_9f95:	db $00, $06, $13, $07, $03, $00, $04, $04, $0f, $09, $03, $00, $00, $0c, $13, $11
BlkPacket_9fa5:	db $23, $07, $07, $10, $00, $00, $02, $0c, $02, $00, $0c, $01, $12, $02, $02, $00
BlkPacket_9fb5:	db $0c, $03, $12, $04, $02, $00, $0c, $05, $12, $06, $02, $00, $0c, $07, $12, $08
BlkPacket_9fc5:	db $02, $00, $0c, $09, $12, $0a, $02, $00, $0c, $0b, $12, $0c, $00, $00, $00, $00
BlkPacket_9fd5:	db $21, $02, $07, $30, $00, $00, $13, $06, $02, $04, $05, $06, $0e, $06, $00, $00
BlkPacket_9fe5:	db $21, $01, $07, $10, $00, $00, $13, $05, $00, $00, $00, $00, $00, $00, $00, $00
BlkPacket_9ff5:	db $21, $02, $07, $0a, $00, $04, $13, $0d, $03, $05, $00, $06, $13, $0b, $00, $00

PalPacket_a005:
	db $51
	RGB  8,  2,  0
	RGB  9,  2,  0
	RGB 10,  2,  0
	RGB 11,  2,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a015:
	db $51
	RGB 11,  1,  0
	RGB  4,  1,  0
	RGB  0,  1,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a025:
	db $51
	RGB  1,  2,  0
	RGB  2,  2,  0
	RGB  3,  2,  0
	RGB  4,  2,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a035:
	db $51
	RGB 12,  2,  0
	RGB 12,  2,  0
	RGB 12,  2,  0
	RGB 12,  2,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a045:
	db $51
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a055:
	db $51
	RGB 22,  1,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a065:
	db $51
	RGB 23,  1,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a075:
	db $51
	RGB 24,  1,  0
	RGB 25,  1,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a085:
	db $51
	RGB 26,  1,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a095:
	db $51
	RGB 27,  1,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a0a5:
	db $51
	RGB 28,  1,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a0b5:
	db $51
	RGB 25,  1,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a0c5:
	db $51
	RGB 14,  1,  0
	RGB 15,  1,  0
	RGB 16,  1,  0
	RGB 17,  1,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a0d5:
	db $51
	RGB 26,  0,  0
	RGB 26,  0,  0
	RGB 26,  0,  0
	RGB 26,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a0e5:
	db $51
	RGB 18,  1,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a0f5:
	db $51
	RGB 28,  1,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a105:
	db $51
	RGB 29,  1,  0
	RGB 30,  1,  0
	RGB 31,  1,  0
	RGB  0,  2,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a115:
	db $51
	RGB 19,  1,  0
	RGB 20,  1,  0
	RGB 27,  0,  0
	RGB 31,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a125:
	db $51
	RGB 27,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a135:
	db $51
	RGB 28,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a145:
	db $51
	RGB 21,  1,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	db $00, $00, $00, $00, $00, $00, $00

PalPacket_a155: db $01, $ff, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_a165: db $09, $ff, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_a175: db $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_a185: db $89, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_a195: db $89, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_a1a5: db $99, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_a1b5: db $a1, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

PalPacket_a1c5: db $b9, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_a1d5: db $b9, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_a1e5: db $79, $5d, $08, $00, $0b, $8c, $d0, $f4, $60, $00, $00, $00, $00, $00, $00, $00
PalPacket_a1f5: db $79, $52, $08, $00, $0b, $a9, $e7, $9f, $01, $c0, $7e, $e8, $e8, $e8, $e8, $e0
PalPacket_a205: db $79, $47, $08, $00, $0b, $c4, $d0, $16, $a5, $cb, $c9, $05, $d0, $10, $a2, $28
PalPacket_a215: db $79, $3c, $08, $00, $0b, $f0, $12, $a5, $c9, $c9, $c8, $d0, $1c, $a5, $ca, $c9
PalPacket_a225: db $79, $31, $08, $00, $0b, $0c, $a5, $ca, $c9, $7e, $d0, $06, $a5, $cb, $c9, $7e
PalPacket_a235: db $79, $26, $08, $00, $0b, $39, $cd, $48, $0c, $d0, $34, $a5, $c9, $c9, $80, $d0
PalPacket_a245: db $79, $1b, $08, $00, $0b, $ea, $ea, $ea, $ea, $ea, $a9, $01, $cd, $4f, $0c, $d0
PalPacket_a255: db $79, $10, $08, $00, $0b, $4c, $20, $08, $ea, $ea, $ea, $ea, $ea, $60, $ea, $ea

IF DEF(_GOLD)
Palettes_a265: INCLUDE "gfx/pals/gold_a265.pal"
ENDC
IF DEF(_SILVER)
Palettes_a265: INCLUDE "gfx/pals/silver_a265.pal"
ENDC

IF DEF(_GOLD)
SGBBorderMap: INCBIN "gfx/sgb_border/gold.map"
SGBBorderPalettes: INCLUDE "gfx/sgb_border/gold.pal"
SGBBorder: INCBIN "gfx/sgb_border/gold.2bpp"
ENDC

IF DEF(_SILVER)
SGBBorderMap: INCBIN "gfx/sgb_border/silver.map"
SGBBorderPalettes: INCLUDE "gfx/sgb_border/silver.pal"
SGBBorder: INCBIN "gfx/sgb_border/silver.2bpp"
ENDC

Palettes_ad2d:
	RGB 30, 26, 15
	RGB 00, 23, 00

	RGB 30, 26, 15
	RGB 31, 21, 00

	RGB 30, 26, 15
	RGB 31, 00, 00

Palettes_ad39:
	RGB 30, 26, 15
	RGB 04, 17, 31

INCLUDE "data/pokemon/palettes.asm"
INCLUDE "data/trainers/palettes.asm"

Functionb649: ; b649 (2:7649)
	ld a, [wPermission]
	and $7
	ld e, a
	ld d, $0
	ld hl, Pointers_b6ce
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wTimeOfDayPal]
	and $3
	add a
	add a
	add a
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld hl, wTempBGPals
	ld b, $8
.asm_b66c
	ld a, [de]
	push de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $775e
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld c, $8
.asm_b67e
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_b67e
	pop de
	inc de
	dec b
	jr nz, .asm_b66c
	ld a, [wTimeOfDayPal]
	and $3
	ld bc, $40
	ld hl, MapObjectPals
	call AddNTimes
	ld de, wTempOBPal0
	ld bc, $40
	call CopyBytes
	ld a, [wPermission]
	cp $1
	jr z, .asm_b6aa
	cp $2
	ret nz
.asm_b6aa
	ld a, [wMapGroup]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, RoofPals
	add hl, de
	ld a, [wTimeOfDayPal]
	and $3
	cp $2
	jr c, .asm_b6c4
	inc hl
	inc hl
	inc hl
	inc hl
.asm_b6c4
	ld de, wTempBGPal6 + 2
	ld bc, $4
	call CopyBytes
	ret

Pointers_b6ce:
	dw .OutdoorColors ; unused
	dw .OutdoorColors ; TOWN
	dw .OutdoorColors ; ROUTE
	dw .IndoorColors ; INDOOR
	dw .DungeonColors ; CAVE
	dw .Perm5Colors ; ENVIRONMENT_5
	dw .IndoorColors ; GATE
	dw .DungeonColors ; DUNGEON

; Valid indices: $00 - $29
.OutdoorColors:
	db $00, $01, $02, $28, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $28, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $29, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.IndoorColors:
	db $20, $21, $22, $23, $24, $25, $26, $07 ; morn
	db $20, $21, $22, $23, $24, $25, $26, $07 ; day
	db $10, $11, $12, $13, $14, $15, $16, $07 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $07 ; dark

.DungeonColors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.Perm5Colors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

TilesetBGPalette: ; b75e
INCLUDE "gfx/tilesets/bg.pal"

MapObjectPals:: ; b8ae
INCLUDE "gfx/tilesets/ob.pal"

RoofPals: ; b9ae
INCLUDE "gfx/tilesets/roof.pal"

Palettes_ba86:
	RGB 27, 31, 27
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 07, 06
	RGB 20, 02, 03
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 10, 31, 09
	RGB 04, 14, 01
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 08, 12, 31
	RGB 01, 04, 31
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 31, 07
	RGB 31, 16, 01
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 22, 16, 08
	RGB 13, 07, 01
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 15, 31, 31
	RGB 05, 17, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 11, 11, 19
	RGB 07, 07, 12
	RGB 00, 00, 00

Palettes_bac6:
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 10, 14, 20
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 31, 31, 07
	RGB 31, 16, 01
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 12, 25, 01
	RGB 05, 14, 00
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 08, 12, 31
	RGB 01, 04, 31
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 24, 18, 07
	RGB 20, 15, 03
	RGB 07, 07, 07

Palettes_bb36:
IF DEF(_GOLD)
	RGB 31, 31, 31
	RGB 18, 23, 31
	RGB 15, 20, 31
	RGB  0,  0,  0

	RGB 31, 21,  0
	RGB 12, 14, 12
	RGB 15, 20, 31
	RGB  0,  0, 17

	RGB 31, 31, 31
	RGB 31,  0,  0
	RGB 15, 20, 31
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 29, 25,  0
	RGB 15, 20, 31
	RGB 17, 10,  1

	RGB 31, 31, 31
	RGB 23, 26, 31
	RGB 18, 23, 31
	RGB  0,  0,  0
ENDC

IF DEF(_SILVER)
	RGB 31, 31, 31
	RGB  0, 12, 15
	RGB  4,  8, 21
	RGB  0,  0,  0

	RGB 31, 21,  0
	RGB 15, 17, 15
	RGB  4,  8, 21
	RGB  0,  0, 17

	RGB 31, 31, 31
	RGB 31,  0,  0
	RGB  4,  8, 21
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 24, 23, 25
	RGB  4,  8, 21
	RGB  8,  8,  9

	RGB 31, 31, 31
	RGB  5, 10, 11
	RGB  0, 12, 15
	RGB  0,  0,  0
ENDC

Palettes_bb5e:
	RGB 31, 31, 31
	RGB 07, 06, 03
	RGB 07, 06, 03
	RGB 07, 06, 03

	RGB 31, 31, 31
	RGB 31, 31, 00
	RGB 26, 22, 00
	RGB 00, 00, 00

Palettes_bb6e:
	RGB 28, 31, 20
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 00, 00, 31
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 15, 07, 00
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 31, 15, 00
	RGB 15, 07, 00
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 00, 00, 31
	RGB 31, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 15, 07, 00
	RGB 31, 00, 00

Palettes_bb9e:
	RGB 31, 31, 31
	RGB 30, 22, 24
	RGB 18, 18, 18
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 10, 11, 31
	RGB 18, 18, 18
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 12, 31, 11
	RGB 18, 18, 18
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 26, 05
	RGB 18, 18, 18
	RGB 00, 00, 00

Palettes_bbbe:
IF DEF(_GOLD)
	RGB 31, 31, 31
	RGB 24, 25, 28
	RGB 24, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 10, 06
	RGB 24, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 15, 31, 00
	RGB 24, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 15, 31
	RGB 24, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 15, 21, 31
	RGB 24, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 11
	RGB 31, 31, 06
	RGB 24, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 19, 29
	RGB 25, 22, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 10, 06
	RGB 31, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 12, 25, 01
	RGB 05, 14, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 12, 25, 01
	RGB 30, 10, 06
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 06
	RGB 20, 15, 03
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 06
	RGB 15, 21, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 06
	RGB 20, 15, 03
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 24, 21
	RGB 31, 13, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
ENDC

IF DEF(_SILVER)
	RGB 31, 31, 31
	RGB 25, 26, 14
	RGB 20, 17, 31
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 30, 10,  6
	RGB 20, 17, 31
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 15, 31,  0
	RGB 20, 17, 31
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 31, 15, 31
	RGB 20, 17, 31
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 15, 21, 31
	RGB 20, 17, 31
	RGB  0,  0,  0

	RGB 31, 31, 11
	RGB 31, 31,  6
	RGB 20, 17, 31
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 16, 19, 29
	RGB 25, 22,  0
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 30, 10,  6
	RGB 31,  0,  0
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 12, 25,  1
	RGB  5, 14,  0
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 12, 25,  1
	RGB 30, 10,  6
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 31, 31,  6
	RGB 20, 15,  3
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 31, 31,  6
	RGB 15, 21, 31
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 31, 31,  6
	RGB 20, 15,  3
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 31, 24, 21
	RGB 31, 13, 31
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB  0,  0,  0
ENDC
