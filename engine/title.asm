IntroSequence: ; 6241 (1:6241)
	callfar Copyright_GFPresents
	jr c, StartTitleScreen
	callfar GoldSilverIntro
StartTitleScreen:
	call InitTitleScreen
	call DelayFrame
.asm_6255
	call TitleScreenFrame
	jr nc, .asm_6255
	call ClearSprites
	call ClearBGPalettes
	ld hl, rLCDC
	res 2, [hl]
	call ClearTileMap
	xor a
	ld [hLCDCPointer], a
	ld b, $8
	call GetSGBLayout
	call UpdateTimePals
	ld a, [wce64]
	cp $5
	jr c, .asm_627b
	xor a
.asm_627b
	ld e, a
	ld d, $0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable
	dw MainMenu_
	dw DeleteSaveData
	dw IntroSequence
	dw IntroSequence
	dw ResetClock

InitTitleScreen: ; 6291 (1:6291)
	call ClearBGPalettes
	xor a
	ld [wTimeOfDayPal], a
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearTileMap
	call DisableLCD
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	ld [hMapAnims], a
	ld [hSCY], a
	ld [hSCX], a
	ld hl, $8000
	ld bc, $2000
	xor a
	call ByteFill
	farcall ClearAnimatedObjectBuffer

	ld hl, TitleScreenGFX1
	ld de, $9000
	ld a, BANK(TitleScreenGFX1)
	call FarDecompress

	ld hl, TitleScreenGFX2
	ld de, $8800
	ld a, BANK(TitleScreenGFX2)
	call FarDecompress

	ld hl, TitleScreenGFX4
	ld de, $8000
	ld a, BANK(TitleScreenGFX4)
	call FarDecompress

	ld hl, TitleScreenGFX3
	ld de, $8f80
	ld bc, $80
	ld a, BANK(TitleScreenGFX3)
	call FarCopyBytes

	call Function636e
	call Function63b6
	ld hl, wAnimatedObjectDynamicVTileOffsets
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
	call InitAnimatedObjectStruct
	ld hl, wAnimatedObjectStruct1
	ld de, wAnimatedObjectStruct10
	ld bc, $a
	call CopyBytes
	ld hl, wAnimatedObjectStruct1
	ld [hl], $0
	ld hl, wc700
	ld bc, $90
	xor a
	call ByteFill
	ld a, $43
	ld [hLCDCPointer], a
	ld b, $c
	call GetSGBLayout
	call Function6341
	ld de, MUSIC_TITLE
	call PlayMusic
	ret

Function6341: ; 6341 (1:6341)
	ld a, [hCGB]
	and a
	jr nz, .asm_6365
	ld a, [hSGB]
	and a
	jr nz, .asm_6358
	ld a, $d8
	ld [rBGP], a
IF DEF(GOLD)
	ld a, $ff
	ld [rOBP0], a
	ld a, $f8
ENDC
IF DEF(SILVER)
	ld a, $f0
	ld [rOBP0], a
	ld a, $f0
ENDC
	ld [rOBP1], a
	ret

.asm_6358
	ld a, $e4
	ld [rBGP], a
IF DEF(GOLD)
	ld a, $ff
	ld [rOBP0], a
	ld a, $e4
ENDC
IF DEF(SILVER)
	ld a, $f0
	ld [rOBP0], a
	ld a, $e0
ENDC
	ld [rOBP1], a
	ret

.asm_6365
	ld a, $e4
	call DmgToCgbBGPals
IF DEF(SILVER)
	ld a, $e0
ENDC
	call DmgToCgbObjPal0
	ret

Function636e: ; 636e (1:636e)
	ld a, [hCGB]
	and a
	ret z
	ld a, $1
	ld [rVBK], a
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
	ld [rVBK], a
	ret

Function63a6: ; 63a6 (1:63a6)
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

Function63b6: ; 63b6 (1:63b6)
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
	ld a, [hCGB]
	and a
	ret nz
	ld hl, $9960
	ld bc, $20
	ld a, $50
	call ByteFill
	ret

TitleScreenFrame: ; 63da (1:63da)
	call Function63fe
	ld a, [wce63]
	bit 7, a
	jr nz, .asm_63fc
	call Function640f
	ld a, $1
	ld [hOAMUpdate], a
	farcall AnimatedObjects_PlayFrame
	xor a
	ld [hOAMUpdate], a
	call Function64b1
	call DelayFrame
	and a
	ret

.asm_63fc
	scf
	ret

Function63fe: ; 63fe (1:63fe)
IF DEF(GOLD)
	ld a, [hVBlankCounter]
	and $7
	ret nz
ENDC
	ld hl, wc75f
	ld a, [hl]
	dec a
	ld bc, $28
	call ByteFill
	ret

Function640f: ; 640f (1:640f)
	ld e, a
	ld d, $0
	ld hl, .Jumptable ; $641b
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable
	dw Function6426
	dw Function6434
	dw Function648b

Function6421:
	ld hl, wce63
	inc [hl]
	ret

Function6426:
	ld hl, wce63
	inc [hl]
	ld hl, wce65
IF DEF(GOLD)
	ld de, $13c0
ENDC
IF DEF(SILVER)
	ld de, $1140
ENDC
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Function6434:
	ld hl, wce65
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jr z, .asm_646b
	dec de
	ld [hl], d
	dec hl
	ld [hl], e
	call GetJoypad
	ld hl, hJoyDown
	ld a, [hl]
	and D_UP + B_BUTTON + SELECT
	cp  D_UP + B_BUTTON + SELECT
	jr z, .asm_6460
	ld a, [hl]
	and D_DOWN + B_BUTTON + SELECT
	cp  D_DOWN + B_BUTTON + SELECT
	jr z, .asm_6480
	ld a, [hl]
	and START | A_BUTTON
	jr nz, .asm_645c
	ret

.asm_645c
	ld a, $0
	jr .asm_6462

.asm_6460
	ld a, $1
.asm_6462
	ld [wce64], a
	ld hl, wce63
	set 7, [hl]
	ret

.asm_646b
	ld hl, wce63
	inc [hl]
	xor a
	ld [wMusicFadeID], a
	ld [wMusicFadeID + 1], a
	ld hl, wMusicFade
	ld [hl], $8
	ld hl, wce65
	inc [hl]
	ret

.asm_6480
	ld a, $4
	ld [wce64], a
	ld hl, wce63
	set 7, [hl]
	ret

Function648b:
	ld hl, wce65
	inc [hl]
	ld a, [wMusicFade]
	and a
	ret nz
	ld a, $2
	ld [wce64], a
	ld hl, wce63
	set 7, [hl]
	ret

DeleteSaveData:
	farcall DeleteSaveData_
	jp Init

ResetClock:
	farcall ResetClock_
	jp Init

Function64b1: ; 64b1 (1:64b1)
	ld a, [wce65]
	and $3
	ret nz
IF DEF(GOLD)
	ld bc, wAnimatedObjectStruct10Index
	ld hl, $a
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, .Data_64e0
	add hl, de
	ld a, [wce65]
	and $4
	srl a
	srl a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	and a
	ret z
	ld e, a
	ld d, [hl]
ENDC

IF DEF(SILVER)
	ld de, $7c58
ENDC
	ld a, $f
	call InitAnimatedObjectStruct
	ret

IF DEF(GOLD)
.Data_64e0:
	db $5c, $50, $00, $00
	db $5c, $68, $5c, $58
	db $5c, $68, $5c, $78
	db $5c, $88, $5c, $78
	db $00, $00, $5c, $78
	db $00, $00, $5c, $58
ENDC

Copyright:
	call ClearTileMap
	call LoadFontsExtra
	ld de, CopyrightGFX
	ld hl, vTiles2 tile $60
	lb bc, BANK(CopyrightGFX), 30
	call Request2bpp
	hlcoord 2, 7
	ld de, CopyrightString
	jp PlaceString

CopyrightString:
	db   $60, $61, $62, $63, $7a, $7b, $7c, $7d
	db   $65, $66, $67, $68, $69, $6a
	next $60, $61, $62, $63, $7a, $7b, $7c, $7d
	db   $6b, $6c, $6d, $6e, $6f, $70, $71, $72
	next $60, $61, $62, $63, $7a, $7b, $7c, $7d
	db   $73, $74, $75, $76, $77, $78, $79, $71, $72
	db   "@"

GameInit:: ; 6545 (1:6545)
	call ClearWindowData
	ld a, $5
	ld hl, $4f60
	rst FarCall
	jp IntroSequence
