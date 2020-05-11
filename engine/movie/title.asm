TitleScreen:
	call ClearBGPalettes
	xor a
	ld [wTimeOfDayPal], a
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearTilemap
	call DisableLCD
	call ClearSprites
	xor a
	ldh [hBGMapMode], a
	ldh [hMapAnims], a
	ldh [hSCY], a
	ldh [hSCX], a

	ld hl, $8000
	ld bc, $2000
	xor a
	call ByteFill
	farcall ClearSpriteAnims

	ld hl, TitleScreenGFX1
	ld de, vTiles2
	ld a, BANK(TitleScreenGFX1)
	call FarDecompress

	ld hl, TitleScreenGFX2
	ld de, vTiles1
	ld a, BANK(TitleScreenGFX2)
	call FarDecompress

	ld hl, TitleScreenGFX4
	ld de, vTiles0
	ld a, BANK(TitleScreenGFX4)
	call FarDecompress

	ld hl, TitleScreenGFX3
	ld de, vTiles1 tile $78
	ld bc, 8 tiles
	ld a, BANK(TitleScreenGFX3)
	call FarCopyBytes

	call Function636e
	call Function63b6
	ld hl, wSpriteAnimDict
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, rLCDC
	set 2, [hl]
	call EnableLCD
	xor a
	ld hl, wce63
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld de, $6058
	ld a, $2c ; HO-OH
	call InitSpriteAnimStruct
	ld hl, wSpriteAnim1
	ld de, wSpriteAnim10
	ld bc, $a
	call CopyBytes
	ld hl, wSpriteAnim1
	ld [hl], $0
	ld hl, wLYOverrides
	ld bc, $90
	xor a
	call ByteFill

; Let LCD Stat know we're messing around with SCX
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	ld b, $c
	call GetSGBLayout
	call Function6341
	ld de, MUSIC_TITLE
	call PlayMusic
	ret

Function6341:
	ldh a, [hCGB]
	and a
	jr nz, .asm_6365
	ldh a, [hSGB]
	and a
	jr nz, .asm_6358
	ld a, $d8
	ldh [rBGP], a
IF DEF(_GOLD)
	ld a, $ff
	ldh [rOBP0], a
	ld a, $f8
ELIF DEF(_SILVER)
	ld a, $f0
	ldh [rOBP0], a
	ld a, $f0
ENDC
	ldh [rOBP1], a
	ret

.asm_6358
	ld a, $e4
	ldh [rBGP], a
IF DEF(_GOLD)
	ld a, $ff
	ldh [rOBP0], a
	ld a, $e4
ELIF DEF(_SILVER)
	ld a, $f0
	ldh [rOBP0], a
	ld a, $e0
ENDC
	ldh [rOBP1], a
	ret

.asm_6365
	ld a, $e4
	call DmgToCgbBGPals
IF DEF(_SILVER)
	ld a, $e0
ENDC
	call DmgToCgbObjPal0
	ret

Function636e:
	ldh a, [hCGB]
	and a
	ret z
	ld a, $1
	ldh [rVBK], a
	ld hl, $9800
	ld bc, $240
	xor a
	call ByteFill
	ld hl, $9800
	ld bc, $714
	ld a, $1
	call Function63a6
	ld hl, $98c5
	ld bc, $10a
	ld a, $3
	call Function63a6
	ld hl, $9980
	ld bc, $a0
	ld a, $4
	call ByteFill
	ld a, $0
	ldh [rVBK], a
	ret

Function63a6:
	push bc
	push hl
.asm_63a8
	ld [hli], a
	dec c
	jr nz, .asm_63a8
	pop hl
	ld bc, $20
	add hl, bc
	pop bc
	dec b
	jr nz, Function63a6
	ret

Function63b6:
	ld hl, GSIntroTilemap ; $4616
	ld de, $9800
.asm_63bc
	ld a, BANK(GSIntroTilemap) ; $26
	call GetFarByte
	cp $ff
	jr z, .asm_63ca
	inc hl
	ld [de], a
	inc de
	jr .asm_63bc

.asm_63ca
	ldh a, [hCGB]
	and a
	ret nz
	ld hl, $9960
	ld bc, $20
	ld a, $50
	call ByteFill
	ret
