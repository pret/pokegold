CheckCGB:
	ldh a, [hCGB]
	and a
	ret

Predef_LoadSGBLayoutCGB:
	ld a, b
	cp SCGB_RAM
	jr nz, .asm_931d
	ld a, [wColorLayoutPredefID]
.asm_931d
	cp SCGB_PARTY_MENU_HP_PALS
	jp z, Function9b75
	call Function9b01
	ld l, a
	ld h, $0
	add hl, hl
	ld de, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return
	push de
	jp hl

.return
	ret

.Jumptable
	dw Function9376
	dw Function9399
	dw Function944a
	dw Function945e
	dw Function94f1
	dw Function9605
	dw Function968d
	dw Function96b7
	dw Function973e
	dw Function9757
	dw Function9760
	dw Function976d
	dw Function97af
	dw Function97d4
	dw Function98be
	dw Function98f1
	dw Function9905
	dw Function9728
	dw Function999f
	dw Function99d9
	dw Function991e
	dw Function9802
	dw Function95d5
	dw Function9561
	dw Function97e1
	dw Function9a03
	dw Function9a2e
	dw Function9a5a
	dw Function9a7b
	dw Function9a94
	dw Function9a47
	dw Function9502

Function9376: ; 9376 (2:5376)
	ld hl, PalPacket_a0d5 + 1
	ld de, wTempBGPals
	ld c, $4
	call Function9ab7
	ld hl, PalPacket_a0d5 + 1
	ld de, wTempBGPal4
	ld c, $4
	call Function9ab7
	ld hl, PalPacket_a0d5 + 1
	ld de, wTempOBPals
	ld c, $2
	call Function9ab7
	jr asm_93e1

Function9399: ; 9399 (2:5399)
	ld de, wTempBGPal0
	call Function9ba9
	push hl
	call Function9adb
	call Function9bba
	push hl
	call Function9adb
	ld a, [wcc9a]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, Palettes_ad2d
	add hl, bc
	call Function9adb
	ld a, [wPlayerHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, Palettes_ad2d
	add hl, bc
	call Function9adb
	ld hl, Palettes_ad39
	call Function9adb
	ld de, wTempOBPals
	pop hl
	call Function9adb
	pop hl
	call Function9adb
	ld a, $1
	ld [wColorLayoutPredefID], a
	call Function9b28
asm_93e1
	ld hl, TilesetBGPalette + 7 * 8
	ld de, wTempBGPal7
	ld bc, $8
	call CopyBytes
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, $2
	call ByteFill
	hlcoord 0, 4, wAttrmap
	lb bc, $8, $a
	ld a, $0
	call Function9af1
	hlcoord 10, 0, wAttrmap
	lb bc, $7, $a
	ld a, $1
	call Function9af1
	hlcoord 0, 0, wAttrmap
	lb bc, $4, $a
	ld a, $2
	call Function9af1
	hlcoord 10, 7, wAttrmap
	lb bc, $5, $a
	ld a, $3
	call Function9af1
	hlcoord 10, 11, wAttrmap
	lb bc, $1, $9
	ld a, $4
	call Function9af1
	hlcoord 0, 12, wAttrmap
	ld bc, $78
	ld a, $7
	call ByteFill
	ld hl, Palettes_9c09
	ld de, wTempOBPal2
	ld bc, $30
	call CopyBytes
	call Function9b35
	ret

Function944a: ; 944a (2:544a)
	ld hl, Palettes_bb6e
	ld de, wTempBGPal0
	ld bc, $30
	call CopyBytes
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function945e: ; 945e (2:545e)
	ld de, wTempBGPal0
	ld a, [wcca1]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, Palettes_ad2d
	add hl, bc
	call Function9adb
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call Function9bcb
	call Function9adb
	ld hl, Palettes_ad39
	call Function9adb
	ld hl, Palettes_94d3
	ld de, wTempBGPal3
	ld bc, $18
	call CopyBytes
	call Function9b1d
	hlcoord 0, 0, wAttrmap
	lb bc, $8, $14
	ld a, $1
	call Function9af1
	hlcoord 10, 16, wAttrmap
	ld bc, $a
	ld a, $2
	call ByteFill
	hlcoord 13, 5, wAttrmap
	lb bc, $2, $2
	ld a, $3
	call Function9af1
	hlcoord 15, 5, wAttrmap
	lb bc, $2, $2
	ld a, $4
	call Function9af1
	hlcoord 17, 5, wAttrmap
	lb bc, $2, $2
	ld a, $5
	call Function9af1
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Palettes_94d3:
	RGB 31, 31, 31
	RGB 31, 19, 31
	RGB 31, 15, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 31, 14
	RGB 17, 31, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 17, 31, 31
	RGB 17, 31, 31
	RGB 00, 00, 00

StatsScreenPals:
	RGB 31, 19, 31

	RGB 21, 31, 14

	RGB 17, 31, 31

Function94f1: ; 94f1 (2:54f1)
	call Function9513
	hlcoord 1, 1, wAttrmap
	lb bc, 7, 7
	ld a, $1
	call Function9af1
	jp Function9537

Function9502: ; 9502 (2:5502)
	call Function9513
	hlcoord 1, 1, wAttrmap
	lb bc, 5, 5
	ld a, $1
	call Function9af1
	jp Function9537

Function9513: ; 9513 (2:5513)
	ld de, wTempBGPal0
	ld a, $1d
	call Function9ac7
	call Function9ad2
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .asm_952d
	ld hl, Palettes_9559
	call Function9ad2
	jr .asm_9533

.asm_952d
	call Function9be4
	call Function9adb
.asm_9533
	call Function9b1d
	ret

Function9537: ; 9537 (2:5537)
	call Function9b9c
	ld hl, Palettes_9551
	ld de, wTempOBPal7
	ld bc, $8
	call CopyBytes
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Palettes_9551:
	RGB  0,  0,  0
	RGB 11, 23,  0
	RGB  7, 17,  0
	RGB  0,  0,  0

Palettes_9559:
	RGB 11, 23,  0
	RGB  7, 17,  0
	RGB  6, 16,  3
	RGB  5, 12,  1

Function9561: ; 9561 (2:5561)
	ld de, wTempBGPal0
	ld a, $1d
	call Function9ac7
	call Function9ad2
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .asm_957b
	ld hl, Palettes_95cd
	call Function9ad2
	jr .asm_9584

.asm_957b
	ld bc, wTempMonDVs
	call Function9bcb
	call Function9adb
.asm_9584
	call Function9b1d
	hlcoord 1, 4, wAttrmap
	lb bc, 7, 7
	ld a, $1
	call Function9af1
	call Function9b9c
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function95a0:
	ld hl, Palettes_95cd
	call Function9ad2
	jr asm_95b1

Function95a8:
	ld bc, wTempMonDVs
	call Function9bcb
	call Function9adb
asm_95b1
	call Function9b1d
	hlcoord 1, 1, wAttrmap
	lb bc, 7, 7
	ld a, $1
	call Function9af1
	call Function9b9c
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Palettes_95cd:
	RGB 31, 15,  0
	RGB 23, 12,  0
	RGB 15,  7,  0
	RGB  0,  0,  0

Function95d5: ; 95d5 (2:55d5)
	ld de, wTempBGPals
	ld a, $1d
	call Function9ac7
	call Function9ad2
	ld a, [wCurPartySpecies]
	call Function9be4
	call Function9adb
	call Function9b1d
	hlcoord 7, 5, wAttrmap
	lb bc, 7, 7
	ld a, $1
	call Function9af1
	call Function9b9c
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function9605: ; 9605 (2:5605)
	ld hl, Palettes_bbbe
	ld de, wTempBGPals
	ld bc, $80
	call CopyBytes
	call Function9b1d
	hlcoord 0, 2, wAttrmap
	lb bc, $a, $3
	ld a, $2
	call Function9af1
	hlcoord 17, 2, wAttrmap
	lb bc, $a, $3
	ld a, $2
	call Function9af1
	hlcoord 0, 4, wAttrmap
	lb bc, $6, $3
	ld a, $3
	call Function9af1
	hlcoord 17, 4, wAttrmap
	lb bc, $6, $3
	ld a, $3
	call Function9af1
	hlcoord 0, 6, wAttrmap
	lb bc, $2, $3
	ld a, $4
	call Function9af1
	hlcoord 17, 6, wAttrmap
	lb bc, $2, $3
	ld a, $4
	call Function9af1
	hlcoord 4, 2, wAttrmap
	lb bc, $2, $c
	ld a, $1
	call Function9af1
	hlcoord 3, 2, wAttrmap
	lb bc, $a, $1
	ld a, $1
	call Function9af1
	hlcoord 16, 2, wAttrmap
	lb bc, $a, $1
	ld a, $1
	call Function9af1
	hlcoord 0, 12, wAttrmap
	ld bc, $78
	ld a, $7
	call ByteFill
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function968d: ; 968d (2:568d)
	ld hl, PalPacket_a115 + 1
	call Function9ab2
	call Function9b1d
	ld de, wTempOBPals
	ld a, $3c
	call Function9ac7
	call Function9ad2
	hlcoord 0, 6, wAttrmap
	lb bc, $c, $14
	ld a, $1
	call Function9af1
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function96b7: ; 96b7 (2:56b7)
	ld b, $0
	ld hl, .Jumptable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw Function96c8
	dw Function96f9
	dw Function9713

Function96c8:
	ld hl, Palettes_96e1
	ld de, wTempBGPal0
	call Function9ad2
	ld hl, Palettes_96e9
	ld de, wTempOBPal0
	ld bc, $10
	call CopyBytes
	call Function9b1d
	ret

Palettes_96e1:
	RGB 19, 31, 19
	RGB 18, 23, 31
	RGB 11, 21, 28
	RGB  4, 16, 24

Palettes_96e9:
	RGB 29, 29, 29
	RGB 20, 19, 20
	RGB 19,  6,  4
	RGB  3,  4,  6

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31,  0,  0
	RGB  3,  4,  6

Function96f9:
	ld de, wTempBGPal0
	ld a, $38
	call Function9ac7
	call Function9ad2
	ld de, wTempOBPals
	ld a, $39
	call Function9ac7
.asm_970b
	call Function9ad2
	call Function9b1d
	ret

Function9713:
	ld hl, PalPacket_a0a5 + 1
	call Function9ab2
	ld de, wTempOBPals
	ld a, $3a
	call Function9ac7
	call Function9ad2
	call Function9b1d
	ret

Function9728: ; 9728 (2:5728)
	ld hl, Palettes_bb9e
	ld de, wTempBGPals
	ld bc, $28
	call CopyBytes
	call Function9b28
	call Function9b1d
	call Function9b35
	ret

Function973e: ; 973e (2:573e)
	ld hl, Palettes_ba86
	ld de, wTempBGPals
	ld bc, $80
	call CopyBytes
	ld hl, PalPacket_a125 + 1
	call Function9ab2
	call Function9b1d
	call Function9b35
	ret

Function9757: ; 9757 (2:5757)
	call Functionb649
	ld a, $9
	ld [wColorLayoutPredefID], a
	ret

Function9760: ; 9760 (2:5760)
	ld hl, PalPacket_a0c5 + 1
	call Function9ab2
	call Function9b9c
	call Function9b35
	ret

Function976d: ; 976d (2:576d)
	ld de, wTempBGPal0
	ld a, c
	and a
	jr z, .asm_977e
	ld a, $1a
	call Function9ac7
	call Function9ad2
	jr .asm_97a1

.asm_977e
	ld hl, wPartyMon1DVs
	ld bc, $30
	ld a, [wCurPartyMon]
	call AddNTimes
	ld c, l
	ld b, h
	ld a, [wPlayerHPPal]
	call Function9bcb
	call Function9adb
	ld hl, Palettes_9c09
	ld de, wTempOBPal2
	ld bc, $30
	call CopyBytes
.asm_97a1
	call Function9b1d
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function97af: ; 97af (2:57af)
	ld hl, Palettes_bb36
	ld de, wTempBGPal0
	ld bc, $28
	call CopyBytes
	ld hl, Palettes_bb5e
	ld de, wTempOBPals
	ld bc, $10
	call CopyBytes
	ld a, $8
	ld [wColorLayoutPredefID], a
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function97d4: ; 97d4 (2:57d4)
	ld hl, PalPacket_a125 + 1
	call Function9ab2
	call Function9b1d
	call Function9b35
	ret

Function97e1: ; 97e1 (2:57e1)
	ld hl, PalPacket_a035 + 1
	call Function9ab2
	ld de, wTempOBPals
	ld a, $4c
	call Function9ac7
	call Function9ad2
	ld hl, wTempOBPal0
	ld a, $1f
	ld [hli], a
	ld a, $0
	ld [hl], a
	call Function9b1d
	call Function9b35
	ret

Function9802: ; 9802 (2:5802)
	ld de, wTempBGPal0
	xor a
	call Function9bda
	call Function9adb
	ld a, $1
	call Function9bda
	call Function9adb
	ld a, $3
	call Function9bda
	call Function9adb
	ld a, $2
	call Function9bda
	call Function9adb
	ld a, $4
	call Function9bda
	call Function9adb
	ld a, $7
	call Function9bda
	call Function9adb
	ld a, $6
	call Function9bda
	call Function9adb
	ld a, $5
	call Function9bda
	call Function9adb
	ld a, $24
	call Function9ac7
	call Function9ad2
	hlcoord 0, 0, wAttrmap
	ld bc, $168
	ld a, $1
	call ByteFill
	hlcoord 14, 1, wAttrmap
	lb bc, $7, $5
	xor a
	call Function9af1
	hlcoord 18, 1, wAttrmap
	ld [hl], $1
	hlcoord 2, 11, wAttrmap
	lb bc, $2, $4
	ld a, $1
	call Function9af1
	hlcoord 6, 11, wAttrmap
	lb bc, $2, $4
	ld a, $2
	call Function9af1
	hlcoord 10, 11, wAttrmap
	lb bc, $2, $4
	ld a, $3
	call Function9af1
	hlcoord 14, 11, wAttrmap
	lb bc, $2, $4
	ld a, $4
	call Function9af1
	hlcoord 2, 14, wAttrmap
	lb bc, $2, $4
	ld a, $5
	call Function9af1
	hlcoord 6, 14, wAttrmap
	lb bc, $2, $4
	ld a, $6
	call Function9af1
	hlcoord 10, 14, wAttrmap
	lb bc, $2, $4
	ld a, $7
	call Function9af1
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function98be: ; 98be (2:58be)
	ld de, wTempBGPals
	ld a, $10
	call Function9ac7
	call Function9ad2
	ld a, [wPlayerHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, Palettes_ad2d
	add hl, bc
	call Function9adb
	call Function9b1d
	hlcoord 11, 1, wAttrmap
	lb bc, $2, $9
	ld a, $1
	call Function9af1
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function98f1: ; 98f1 (2:58f1)
	ld hl, PalPacket_a0b5 + 1
	call Function9ab2
	call Function9b1d
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function9905: ; 9905 (2:5905)
	ld de, wTempBGPals
	ld a, $1d
	call Function9ac7
	call Function9ad2
	call Function9b1d
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function991e: ; 991e (2:591e)
	ld de, wTempBGPals
	ld hl, Palettes_996f
	ld bc, $40
	call CopyBytes
	call Function9b1d
	hlcoord 0, 0, wAttrmap
	lb bc, $1, $a
	ld a, $1
	call Function9af1
	hlcoord 10, 0, wAttrmap
	lb bc, $1, $a
	ld a, $2
	call Function9af1
	hlcoord 7, 2, wAttrmap
	lb bc, $9, $1
	ld a, $3
	call Function9af1
	hlcoord 0, 7, wAttrmap
	lb bc, $3, $5
	ld a, $4
	call Function9af1
	hlcoord 0, 3, wAttrmap
	lb bc, $3, $5
	ld a, $5
	call Function9af1
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Palettes_996f:
	RGB 31, 31, 31
	RGB 15, 15, 31
	RGB  0,  0, 31
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 15, 15, 31
	RGB  0,  0, 31
	RGB  0,  0,  0

	RGB 31, 11, 31
	RGB 15, 15, 31
	RGB  0,  0, 31
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB 15, 15, 31
	RGB  0,  0, 31
	RGB 31,  0,  0

	RGB 31, 31, 31
	RGB 15, 15, 31
	RGB 31,  0,  0
	RGB  0,  0,  0

	RGB 31, 31, 31
	RGB  7, 19,  7
	RGB  7, 19,  7
	RGB  0,  0,  0

Function999f: ; 999f (2:599f)
	call Function9757
	call SwapTextboxPalettes
	ld de, $14
	hlcoord 0, 0, wAttrmap
	ld a, [wMenuBorderTopCoord]
.asm_99ae
	and a
	jr z, .asm_99b5
	dec a
	add hl, de
	jr .asm_99ae

.asm_99b5
	ld a, [wMenuBorderLeftCoord]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [wMenuBorderTopCoord]
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	inc a
	sub b
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	inc a
	ld c, a
	ld a, $0
	call Function9af1
	call Function9b35
	ret

Function99d9: ; 99d9 (2:59d9)
	ld hl, PalPacket_a015 + 1
	call Function9ab2
	call Function9b1d
	hlcoord 0, 4, wAttrmap
	lb bc, $a, $14
	ld a, $2
	call Function9af1
	hlcoord 0, 6, wAttrmap
	lb bc, $6, $14
	ld a, $1
	call Function9af1
	call Function9b35
	call Function9b28
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function9a03: ; 9a03 (2:5a03)
	ld de, wTempBGPal0
	ld a, $4e
	call Function9ac7
	call Function9ad2
	ld de, wTempOBPal0
	ld a, $4d
	call Function9ac7
	call Function9ad2
	ld de, wTempOBPal1
	ld a, $4d
	call Function9ac7
	call Function9ad2
	call Function9b1d
	call Function9b35
	call Function9b28
	ret

Function9a2e: ; 9a2e (2:5a2e)
	ld de, wTempBGPal0
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call Function9bcb
	call Function9adb
	call Function9b1d
	call Function9b35
	call Function9b28
	ret

Function9a47: ; 9a47 (2:5a47)
	ld de, wTempBGPal0
	ld a, [wCurPartySpecies]
	call Function9be4
	call Function9adb
	call Function9b1d
	call Function9b35
	ret

Function9a5a: ; 9a5a (2:5a5a)
	ld hl, PalPacket_a135 + 1
	call Function9ab2
	ld hl, Palettes_bac6
	ld de, wTempOBPal0
	ld bc, $8
	call CopyBytes
	ld de, wTempOBPal7
	ld a, $1c
	call Function9ac7
	call Function9ad2
	call Function9b1d
	ret

Function9a7b: ; 9a7b (2:5a7b)
	ld de, wTempBGPal0
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call Function9bd3
	call Function9adb
	call Function9b1d
	call Function9b35
	call Function9b28
	ret
