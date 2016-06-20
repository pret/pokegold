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

Function8b07:
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

ApplyMonOrTrainerPals:
	dr $91e5, $9311

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
	dr $9af1, $9b1d
Function9b1d:
	dr $9b1d, $9b28
Function9b28:
	dr $9b28, $9b9c
Function9b9c:
	dr $9b9c, $9be4
Function9be4:
	dr $9be4, $9c76
PushSGBPals_:
	dr $9c76, $9cc0
InitSGBBorder:
	dr $9cc0, $9cfd
InitCGBPals:: ; 9cfd
	dr $9cfd, $9ee5
BlkPacket_9ee5:
	dr $9ee5, $9fa5
BlkPacket_9fa5:
	dr $9fa5, $a095
PalPacket_a095:
	dr $a095, $a0a5
PalPacket_a0a5:
	dr $a0a5, $a0c5
PalPacket_a0c5:
	dr $a0c5, $a155
PalPacket_a155:
	dr $a155, $bc3a
