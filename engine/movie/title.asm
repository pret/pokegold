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

	ld hl, vTiles0
	ld bc, $200 tiles
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

	call FillTitleScreenPals
	call Function63b6
	ld hl, wSpriteAnimDict
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, rLCDC
	set rLCDC_SPRITE_SIZE, [hl]
	call EnableLCD
	xor a
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1
	depixel 12, 11
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_HO_OH
	call InitSpriteAnimStruct
	ld hl, wSpriteAnim1
	ld de, wSpriteAnim10
	ld bc, NUM_SPRITE_ANIM_STRUCTS
	call CopyBytes
	ld hl, wSpriteAnim1
	ld [hl], $0
	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	xor a
	call ByteFill

; Let LCD Stat know we're messing around with SCX
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	ld b, SCGB_GS_TITLE_SCREEN
	call GetSGBLayout
	call LoadTitleScreenPals
	ld de, MUSIC_TITLE
	call PlayMusic
	ret

LoadTitleScreenPals:
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ldh a, [hSGB]
	and a
	jr nz, .sgb
	ld a, %11011000
	ldh [rBGP], a
IF DEF(_GOLD)
	ld a, %11111111
	ldh [rOBP0], a
	ld a, %11111000
	ldh [rOBP1], a
ELIF DEF(_SILVER)
	ld a, %11110000
	ldh [rOBP0], a
	ld a, %11110000
	ldh [rOBP1], a
ENDC
	ret

.sgb
	ld a, %11100100
	ldh [rBGP], a
IF DEF(_GOLD)
	ld a, %11111111
	ldh [rOBP0], a
	ld a, %11100100
	ldh [rOBP1], a
ELIF DEF(_SILVER)
	ld a, %11110000
	ldh [rOBP0], a
	ld a, %11100000
	ldh [rOBP1], a
ENDC
	ret

.cgb
	ld a, %11100100
	call DmgToCgbBGPals
IF DEF(_SILVER)
	ld a, %11100000
ENDC
	call DmgToCgbObjPal0
	ret

FillTitleScreenPals:
	ldh a, [hCGB]
	and a
	ret z
	ld a, 1
	ldh [rVBK], a
	hlbgcoord 0, 0
	ld bc, 18 * BG_MAP_WIDTH
	xor a
	call ByteFill
	ld hl, vBGMap2
	lb bc, 7, SCREEN_WIDTH
	ld a, 1
	call DrawTitleGraphic
	hlbgcoord 5, 6, vBGMap2
	lb bc, 1, 10
	ld a, 3
	call DrawTitleGraphic
	hlbgcoord 0, 12, vBGMap2
	ld bc, 5 * BG_MAP_WIDTH
	ld a, 4
	call ByteFill
	ld a, 0
	ldh [rVBK], a
	ret

DrawTitleGraphic:
.bgrows
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, BG_MAP_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .bgrows
	ret

Function63b6:
	ld hl, GSIntroTilemap
	debgcoord 0, 0
.asm_63bc
	ld a, BANK(GSIntroTilemap)
	call GetFarByte
	cp -1
	jr z, .asm_63ca
	inc hl
	ld [de], a
	inc de
	jr .asm_63bc

.asm_63ca
	ldh a, [hCGB]
	and a
	ret nz
	hlbgcoord 0, 11
	ld bc, BG_MAP_WIDTH
	ld a, "@"
	call ByteFill
	ret
