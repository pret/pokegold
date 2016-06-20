PALPACKET_LENGTH EQU $10
INCLUDE "predef/sgb.asm"

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

CheckContestMon: ; 9072 (2:5072)
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
	ld [hCGBPalUpdate], a
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
	ld a, [hSGB]
	and a
	ret z
	ld hl, BlkPacket_9ee5
	jp PushSGBPals_

Function9144:
	call CheckCGB
	jr nz, .asm_9153
	ld a, [hSGB]
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
	ld a, [hSGB]
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
	ld a, [hSGB]
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
	ld a, [hCGB]
	and a
	jr nz, .asm_91bf
	ld hl, wc602
	jp PushSGBPals_

.asm_91bf
	ld a, [wc606]
	ld c, a
	ld a, [wc607]
	ld hl, wAttrMap
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
	call LoadEDTile
	ret

ApplyMonOrTrainerPals: ; 91e5 (2:51e5)
	call CheckCGB
	ret z
	ld a, e
	and a
	jr z, .asm_91f5
	ld a, [wd004]
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
	ld a, [wd007]
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
	ld [hCGBPalUpdate], a
	ret

.asm_9236
	ld e, c
	inc e
	hlcoord 11, 1, wAttrMap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wd005]
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
	ld [hCGBPalUpdate], a
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
	RGB 20, 31, 11
	RGB 31, 19, 00
	RGB 31, 10, 09
	RGB 00, 00, 00

	RGB 15, 20, 31
	RGB 30, 26, 00
	RGB 31, 12, 00
	RGB 00, 00, 00

	RGB 24, 17, 31
	RGB 30, 26, 00
	RGB 08, 11, 31
	RGB 00, 00, 00

	RGB 31, 25, 17
	RGB 31, 18, 04
	RGB 28, 12, 05
	RGB 00, 00, 00

	RGB 19, 26, 31
	RGB 31, 05, 08
	RGB 31, 09, 31
	RGB 00, 00, 00

	RGB 31, 19, 28
	RGB 31, 21, 00
	RGB 12, 22, 00
	RGB 00, 00, 00

	RGB 19, 17, 23
	RGB 30, 26, 00
	RGB 31, 12, 00
	RGB 00, 00, 00

	RGB 07, 26, 31
	RGB 26, 26, 27
	RGB 31, 11, 11
	RGB 00, 00, 00

	RGB 21, 31, 21
	RGB 30, 26, 00
	RGB 31, 12, 00
	RGB 00, 00, 00

	RGB 07, 26, 31
	RGB 31, 31, 00
	RGB 00, 21, 00
	RGB 00, 00, 00

INCLUDE "predef/cgb.asm"

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
	hlcoord 0, 0, wAttrMap
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
	ld a, [rLCDC]
	bit 7, a
	jr z, .asm_9b52
	ld a, [hBGMapMode]
	push af
	ld a, $2
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	call DelayFrame
	pop af
	ld [hBGMapMode], a
	ret

.asm_9b52
	hlcoord 0, 0, wAttrMap
	ld de, $9800
	ld b, $12
	ld a, $1
	ld [rVBK], a
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
	ld [rVBK], a
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
	hlcoord 11, 2, wAttrMap
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
	callba Function3d8f5
	ld c, l
	ld b, h
	ld a, [wd0ee]
	call Function9bcb
	pop de
	ret

Function9bba: ; 9bba (2:5bba)
	push de
	callba Function3d907
	ld c, l
	ld b, h
	ld a, [wd0ed]
	call Function9bd3
	pop de
	ret

Function9bcb: ; 9bcb (2:5bcb)
	and a
	jp nz, Function9c66
	ld hl, PalPacket_b53d
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
	ld bc, PalPacket_b53d
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
	ld [rOBPI], a
	ld c, $30
.asm_9bf6
	ld a, [hli]
	ld [rOBPD], a
	dec c
	jr nz, .asm_9bf6
	ld hl, Palettes_9c09
	ld de, wTempOBPal2
	ld bc, $10
	call CopyBytes
	ret

Palettes_9c09:
	dr $9c09, $9c39
Function9c39:
	dr $9c39, $9c5b
Function9c5b:
	dr $9c5b, $9c66
Function9c66:
	dr $9c66, $9c76
PushSGBPals_:
	dr $9c76, $9cc0
InitSGBBorder:
	dr $9cc0, $9cfd
InitCGBPals:: ; 9cfd
	dr $9cfd, $9ee5
BlkPacket_9ee5:
	dr $9ee5, $9ef5

BlkPacket_9ef5:
	dr $9ef5, $9f05

BlkPacket_9f05:
	dr $9f05, $9f25

BlkPacket_9f25:
	dr $9f25, $9f35

BlkPacket_9f35:
	dr $9f35, $9f45

BlkPacket_9f45:
	dr $9f45, $9f55

BlkPacket_9f55:
	dr $9f55, $9f65

BlkPacket_9f65:
	dr $9f65, $9f75

BlkPacket_9f75:
	dr $9f75, $9f85

BlkPacket_9f85:
	dr $9f85, $9fa5
BlkPacket_9fa5:
	dr $9fa5, $9fd5

BlkPacket_9fd5:
	dr $9fd5, $9fe5

BlkPacket_9fe5:
	dr $9fe5, $9ff5

BlkPacket_9ff5:
	dr $9ff5, $a005
PalPacket_a005:
	dr $a005, $a015

PalPacket_a015:
	db $51
Palettes_a016:
	dr $a016, $a025

PalPacket_a025:
	dr $a025, $a035

PalPacket_a035:
	db $51
Palettes_a036:
	dr $a036, $a045

PalPacket_a045:
	dr $a045, $a055
PalPacket_a055:
	dr $a055, $a075
PalPacket_a075:
	dr $a075, $a085
PalPacket_a085:
	dr $a085, $a095
PalPacket_a095:
	dr $a095, $a0a5

PalPacket_a0a5:
	db $51
Palettes_a0a6:
	dr $a0a6, $a0b5

PalPacket_a0b5:
	db $51
Palettes_a0b6:
	dr $a0b6, $a0c5

PalPacket_a0c5:
	db $51
Palettes_a0c6:
	dr $a0c6, $a0d5

PalPacket_a0d5:
	db $51
Palettes_a0d6:
	dr $a0d6, $a0e5

PalPacket_a0e5:
	dr $a0e5, $a105

PalPacket_a105:
	dr $a105, $a115

PalPacket_a115:
	db $51
Palettes_a116:
	dr $a116, $a125

PalPacket_a125:
	db $51
Palettes_a126:
	dr $a126, $a135

PalPacket_a135:
	db $51
Palettes_a136:
	dr $a136, $a145

PalPacket_a145:
	dr $a145, $a155
PalPacket_a155:
	dr $a155, $a165

PalPacket_a165:
	dr $a165, $a265
Palettes_a265:
	dr $a265, $a4dd

SGBBorderMap:
	dr $a4dd, $a90d
SGBBorderPalettes:
	dr $a90d, $a98d
SGBBorder:
	dr $a98d, $ad2d

Palettes_ad2d:
	dr $ad2d, $ad39
Palettes_ad39:
	dr $ad39, $ad3d

BlkPacket_ad3d:
    dr $ad3d, $b53d

PalPacket_b53d
    dr $b53d, $b649

Functionb649:
    dr $b649, $b796
Palettes_b796:
    dr $b796, $ba86

Palettes_ba86:
    dr $ba86, $bac6
Palettes_bac6:
    dr $bac6, $bb36
Palettes_bb36:
    dr $bb36, $bb5e
Palettes_bb5e:
    dr $bb5e, $bb6e
Palettes_bb6e:
    dr $bb6e, $bb9e
Palettes_bb9e:
    dr $bb9e, $bbbe
Palettes_bbbe:
    dr $bbbe, $bc3a
