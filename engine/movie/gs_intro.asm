IF DEF(_GOLD)
BANK39_OFFSET EQU 0
ELIF DEF(_SILVER)
BANK39_OFFSET EQU $1b8
ENDC

GoldSilverIntro:
	call .InitRAMAddrs
.loop
	call .JoypadLoop
	jr nc, .loop
	ret

.InitRAMAddrs:
	farcall ClearSpriteAnims
	xor a
	ld [wIntroJumptableIndex], a
	ldh [hBGMapMode], a
	ret

.JoypadLoop:
	call JoyTextDelay
	ldh a, [hJoyLast]
	and BUTTONS
	jr nz, .finish
	ld a, [wIntroJumptableIndex]
	bit 7, a
	jr nz, .finish
	farcall PlaySpriteAnimations
	call IntroSceneJumper
	call DelayFrame
	and a
	ret

.finish
	callfar ClearSpriteAnims
	call ClearSprites
	call DelayFrame
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ldh [hLCDCPointer], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	ld a, %11100100
	call DmgToCgbBGPals
	depixel 28, 28, 4, 4
	call DmgToCgbObjPals
	scf
	ret

IntroSceneJumper:
	ld a, [wIntroJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, IntroScenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

IntroScenes:
	dw IntroScene1
	dw IntroScene2
	dw IntroScene3
	dw IntroScene4
	dw IntroScene5
	dw IntroScene6
	dw IntroScene7
	dw IntroScene8
	dw IntroScene9
	dw IntroScene10
	dw IntroScene11
	dw IntroScene12
	dw IntroScene13
	dw IntroScene14
	dw IntroScene15
	dw IntroScene16
	dw IntroScene17

IntroScene1:
	call ClearBGPalettes
	call ClearTilemap
	ld hl, wIntroJumptableIndex
	inc [hl]
	call DisableLCD
	xor a
	ldh [hBGMapMode], a
	callfar ClearSpriteAnims
	ld a, 1
	ldh [rVBK], a
	hlbgcoord 0, 0, vBGMap2
	lb bc, 4, 0
	xor a
	call ByteFill
	ld a, 0
	ldh [rVBK], a
	call Functione54dd
	ld de, vTiles2 tile $00
	ld hl, GFX_e54e8
	call Decompress
	ld a, LOW(GFX_e5bc8)
	ld [wcb15 + 0], a
	ld a, HIGH(GFX_e5bc8)
	ld [wcb15 + 1], a
	hlbgcoord 0, 0, vBGMap2
	ld a, l
	ld [wcb11 + 0], a
	ld a, h
	ld [wcb11 + 1], a
	ld de, GFX_e5ab8
	ld a, e
	ld [wcb13 + 0], a
	ld a, d
	ld [wcb13 + 1], a
	call Functione5498
	ld de, vTiles0 tile $00
	ld hl, GFX_e5cd8
	call Decompress
	ld hl, wSpriteAnimDict
	ld a, 0
	ld [hli], a
	ld a, 0
	ld [hli], a
	xor a
	ldh [hSCY], a
	ld [wGlobalAnimYOffset], a
	ld [wGlobalAnimXOffset], a
	ld a, $58
	ldh [hSCX], a
	xor a ; LOW(vTiles0 tile $00)
	ld [wcb17 + 1], a
	ld a, HIGH(vTiles0 tile $00)
	ld [wcb17 + 0], a
	ld a, $42
	ldh [hLCDCPointer], a
	call Functione5095
	xor a
	ld [wcb19], a
	call EnableLCD
	call DelayFrame
	ld b, SCGB_GS_INTRO
	ld c, 0
	call GetSGBLayout
	ld a, %11100100
	call DmgToCgbBGPals
	depixel 28, 28
	call DmgToCgbObjPals
	call Functione4f5a
	ld de, MUSIC_GS_OPENING
	call PlayMusic
	ret

IntroScene2:
	call Functione50af
	ld hl, wcb17
	ld a, [hl]
	and a
	jr z, .asm_e4df5
	dec [hl]
	call Functione4ef0
	ret

.asm_e4df5:
	ld [hl], $10
	ld hl, wIntroJumptableIndex
	inc [hl]

IntroScene3:
	call Functione4e90
	call Functione4e67
	ret nc
	call Functione54dd
	ld hl, hSCY
	inc [hl]
	ld hl, wIntroJumptableIndex
	inc [hl]

IntroScene4:
	ld a, [wcb19]
	and a
	jr nz, .asm_e4e25
	ld hl, wcb18
	inc [hl]
	ld a, [hl]
	and $0f
	jr nz, .asm_e4e21
	ld hl, hSCX
	dec [hl]
	dec [hl]

.asm_e4e21:
	call Functione4fde
	ret

.asm_e4e25:
	ld hl, wIntroJumptableIndex
	inc [hl]
	xor a
	ld [wcb17], a

IntroScene5:
	ld hl, wcb17
	ld a, [hl]
	inc [hl]
	swap a
	and $0f
	ld e, a
	ld d, 0
	ld hl, .pals
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .asm_e4e4e
	call DmgToCgbBGPals
	call Functione4fde
	ld hl, hSCX
	dec [hl]
	dec [hl]
	ret

.asm_e4e4e
	ld hl, wIntroJumptableIndex
	inc [hl]
	ret

.pals
	db %11100100, %11100100, %10010000, %01000000, %00000000
	db -1

IntroScene17:
	ld c, 64
.loop
	call DelayFrame
	dec c
	jr nz, .loop
	ld hl, wIntroJumptableIndex
	set 7, [hl]
	ret

Functione4e67:
	ld hl, wcb18
	inc [hl]
	ld a, [hl]
	and $03
	jr nz, .asm_e4e74
	ld hl, hSCX
	dec [hl]

.asm_e4e74
	and $01
	jr nz, .asm_e4e8c
	ld hl, wGlobalAnimYOffset
	inc [hl]
	ld hl, hSCY
	ld a, [hl]
	dec [hl]
	and $0f
	call z, Functione4f87
	ld a, [wcb17]
	and a
	jr z, .asm_e4e8e

.asm_e4e8c
	and a
	ret

.asm_e4e8e
	scf
	ret

Functione4e90:
	ld a, [wcb17]
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.dw
	dw Functione4eca
	dw Functione4eca
	dw Functione4eca
	dw Functione4ec1
	dw Functione4eca
	dw Functione4eca
	dw Functione4ece
	dw Functione4ece
	dw Functione4ece
	dw Functione4ed5
	dw Functione4ee8
	dw Functione4eec
	dw Functione4eec
	dw Functione4eec
	dw Functione4eec
	dw Functione4eec
	dw Functione4eec

Functione4ec1:
	call Functione4f6f
	depixel 28, 28, 4, 4
	call DmgToCgbObjPals
; fall through
Functione4eca:
	call Functione4fde
	ret

Functione4ece:
	call Functione4f19
	call Functione4fde
	ret

Functione4ed5:
	ld hl, wcb18
	ld a, [hl]
	and $1f
	jr z, .asm_e4ee1
	call Functione4f19
	ret

.asm_e4ee1
	callfar Function9102
	ret

Functione4ee8:
	xor a
	ldh [hLCDCPointer], a
	ret

Functione4eec:
	call Functione50af
	ret

Functione4ef0:
	ld hl, wcb17
	ld a, [hl]
	and $0f
	ret nz
	ld a, [hl]
	and $70
	swap a
	ld e, a
	ld d, 0
	ld hl, .pixels
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_BUBBLE
	call InitSpriteAnimStruct
	ret

.pixels
	db  6 * 8, 14 * 8 + 4
	db 14 * 8, 18 * 8 + 4
	db 10 * 8, 16 * 8 + 4
	db 12 * 8, 15 * 8
	db  4 * 8, 13 * 8
	db  8 * 8, 17 * 8

Functione4f19:
	depixel 8, 7, 0, 7
	ldh a, [hSGB]
	and a
	jr z, .asm_e4f24
	depixel 4, 3, 0, 7

.asm_e4f24
	ld hl, wcb18
	ld a, [hl]
	and e
	ret nz
	ld a, [hl]
	and d
	jr nz, .asm_e4f41
	depixel 29, 28
	call Functione4f54
	depixel 26, 0
	call Functione4f54
	depixel 0, 24
	call Functione4f54
	ret

.asm_e4f41
	depixel 28, 30
	call Functione4f54
	depixel 31, 24
	call Functione4f54
	depixel 2, 28
	call Functione4f54
	ret

Functione4f54:
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_MAGIKARP
	call InitSpriteAnimStruct
	ret

Functione4f5a:
	depixel 18, 7
	call Functione4f69
	depixel 14, 10
	call Functione4f69
	depixel 16, 15

Functione4f69:
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_SHELLDER
	call InitSpriteAnimStruct
	ret

Functione4f6f:
	ld a, [wcb18]
	and $1f
	ret nz
	depixel 16, 24
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_LAPRAS_2
	call InitSpriteAnimStruct
	ret

; unused?
Functione4f7e:
	depixel 2, 0
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_LAPRAS
	call InitSpriteAnimStruct
	ret

Functione4f87:
	push hl
	push de
	ld a, [wcb13 + 0]
	ld e, a
	ld a, [wcb13 + 1]
	ld d, a
	ld hl, -$10
	add hl, de
	ld a, l
	ld e, l
	ld [wcb13 + 0], a
	ld a, h
	ld d, h
	ld [wcb13 + 1], a
	hlcoord 0, 0
	ld c, $10

.loop
	call Functione54ae
	dec c
	jr nz, .loop
	ld a, [wcb11 + 0]
	ld e, a
	ld a, [wcb11 + 1]
	ld d, a
	ld hl, hCurSpriteYCoord
	add hl, de
	ld a, l
	ld [wcb11 + 0], a
	ld [wRequested2bppDest + 0], a
	ld a, h
	and $fb
	or $08
	ld [wcb11 + 1], a
	ld [wRequested2bppDest + 1], a
	ld a, LOW(wTilemap)
	ld [wRequested2bppSource + 0], a
	ld a, HIGH(wTilemap)
	ld [wRequested2bppSource + 1], a
	ld a, 4
	ld [wRequested2bppSize], a
	ld hl, wcb17
	dec [hl]
	pop de
	pop hl
	ret

Functione4fde:
	ld hl, wcb18
	ld a, [hl]
	and $03
	cp $03
	ret z
	ld a, [wRequested2bppSize]
	and a
	ret nz
	ld a, [hl]
	and $30
	swap a
	ld l, a
	ld h, 0
rept 5
	add hl, hl
endr
	ld de, GFX_e5015
	add hl, de
	ld a, l
	ld [wRequested2bppSource + 0], a
	ld a, h
	ld [wRequested2bppSource + 1], a
	ld a, LOW(vBGMap0 tile $1e)
	ld [wRequested2bppDest + 0], a
	ld a, HIGH(vBGMap0 tile $1e)
	ld [wRequested2bppDest + 1], a
	ld a, 2
	ld [wRequested2bppSize], a
	ret

GFX_e5015:
	dr ($e5015 - BANK39_OFFSET), ($e5095 - BANK39_OFFSET)
Functione5095:
	dr ($e5095 - BANK39_OFFSET), ($e50af - BANK39_OFFSET)
Functione50af:
	dr ($e50af - BANK39_OFFSET), ($e50d8 - BANK39_OFFSET)
IntroScene6:
	dr ($e50d8 - BANK39_OFFSET), ($e5156 - BANK39_OFFSET)
IntroScene7:
	dr ($e5156 - BANK39_OFFSET), ($e517b - BANK39_OFFSET)
IntroScene8:
	dr ($e517b - BANK39_OFFSET), ($e519a - BANK39_OFFSET)
IntroScene9:
	dr ($e519a - BANK39_OFFSET), ($e5209 - BANK39_OFFSET)
IntroScene10:
	dr ($e5209 - BANK39_OFFSET), ($e529f - BANK39_OFFSET)
IntroScene11:
	dr ($e529f - BANK39_OFFSET), ($e52bb - BANK39_OFFSET)
IntroScene12:
	dr ($e52bb - BANK39_OFFSET), ($e52e8 - BANK39_OFFSET)
IntroScene13:
	dr ($e52e8 - BANK39_OFFSET), ($e5300 - BANK39_OFFSET)
IntroScene14:
	dr ($e5300 - BANK39_OFFSET), ($e5321 - BANK39_OFFSET)
IntroScene15:
	dr ($e5321 - BANK39_OFFSET), ($e5336 - BANK39_OFFSET)
IntroScene16:
	dr ($e5336 - BANK39_OFFSET), ($e5498 - BANK39_OFFSET)
Functione5498:
	dr ($e5498 - BANK39_OFFSET), ($e54ae - BANK39_OFFSET)
Functione54ae:
	dr ($e54ae - BANK39_OFFSET), ($e54dd - BANK39_OFFSET)
Functione54dd:
	dr ($e54dd - BANK39_OFFSET), ($e54e8 - BANK39_OFFSET)
GFX_e54e8:
	dr ($e54e8 - BANK39_OFFSET), ($e5ab8 - BANK39_OFFSET)
GFX_e5ab8:
	dr ($e5ab8 - BANK39_OFFSET), ($e5bc8 - BANK39_OFFSET)
GFX_e5bc8:
	dr ($e5bc8 - BANK39_OFFSET), ($e5cd8 - BANK39_OFFSET)
GFX_e5cd8:
	dr ($e5cd8 - BANK39_OFFSET), ($e7678 - BANK39_OFFSET)
