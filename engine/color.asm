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
	ld de, wUnknBGPals
	ld bc, $8
	call CopyBytes
	ld hl, .OBPal
	ld de, wUnknOBPals
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
	ld de, wUnknOBPals
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
	ld de, wUnknOBPals
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
	ld de, wUnknOBPals
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
	ld de, wUnknBGPals
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
	ld [wUnknBGPals], a
	ld [wUnknBGPals + $10], a
	ld a, [hl]
	ld [wUnknBGPals + 1], a
	ld [wUnknBGPals + $11], a
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
	ld de, wUnknBGPals
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

Function9a94:
	dr $9a94, $9ab2
Function9ab2:
	dr $9ab2, $9ac7
Function9ac7:
	dr $9ac7, $9ad2
Function9ad2:
	dr $9ad2, $9adb
Function9adb:
	dr $9adb, $9af1
Function9af1:
	dr $9af1, $9b01
Function9b01:
	dr $9b01, $9b1d
Function9b1d:
	dr $9b1d, $9b28
Function9b28:
	dr $9b28, $9b35
Function9b35:
	dr $9b35, $9b75
Function9b75:
	dr $9b75, $9b9c
Function9b9c:
	dr $9b9c, $9ba9
Function9ba9:
	dr $9ba9, $9bba
Function9bba:
	dr $9bba, $9bcb
Function9bcb:
	dr $9bcb, $9bd3
Function9bd3:
	dr $9bd3, $9bda
Function9bda:
	dr $9bda, $9be4
Function9be4:
	dr $9be4, $9c76
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
	dr $a015, $a025

PalPacket_a025:
	dr $a025, $a035

PalPacket_a035:
	dr $a035, $a045

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
	dr $a0a5, $a0b5

PalPacket_a0b5:
	dr $a0b5, $a0c5
PalPacket_a0c5:
	dr $a0c5, $a0d5

PalPacket_a0d5:
	dr $a0d5, $a0e5

PalPacket_a0e5:
	dr $a0e5, $a105

PalPacket_a105:
	dr $a105, $a115

PalPacket_a115:
	dr $a115, $a125

PalPacket_a125:
	dr $a125, $a135

PalPacket_a135:
	dr $a135, $a145

PalPacket_a145:
	dr $a145, $a155
PalPacket_a155:
	dr $a155, $a165

PalPacket_a165:
	dr $a165, $ad2d

BlkPacket_ad2d:
	dr $ad2d, $ad3d

BlkPacket_ad3d:
    dr $ad3d, $bc3a
