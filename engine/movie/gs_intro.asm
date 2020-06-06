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
	ld bc, $c7a0 ; ?
	ld a, $90 ; ?
	ld de, $0400 ; ?

.loop
	push af
	push de
	farcall BattleAnim_Sine_e
	ld a, e
	ld [bc], a
	inc bc
	pop de
	inc e
	pop af
	dec a
	jr nz, .loop
	ret

Functione50af:
	ld bc, $c700 ; ?
	ld e, $10 ; ?

.loop1
	ldh a, [hSCY]
	ld [bc], a
	inc bc
	dec e
	jr nz, .loop1

	ld hl, $c7a0 ; ?
	ld de, $c7a1 ; ?
	ld a, [hl]
	push af
	ld a, $80 ; ?

.loop2
	push af
	ld a, [de]
	inc de
	ld [hli], a
	push hl
	ld hl, hSCY
	add [hl]
	ld [bc], a
	inc bc
	pop hl
	pop af
	dec a
	jr nz, .loop2
	pop af
	ld [hl], a
	ret

IntroScene6:
	ld hl, wIntroJumptableIndex
	inc [hl]
	call DisableLCD
	callfar ClearSpriteAnims
	call Functione54dd
	ld de, vTiles2
	ld hl, GFX_e6058
	call Decompress
	ld a, LOW(GFX_e6338)
	ld [wcb15 + 0], a
	ld a, HIGH(GFX_e6338)
	ld [wcb15 + 1], a
	ld hl, vBGMap0
	ld a, l
	ld [wcb11 + 0], a
	ld a, h
	ld [wcb11 + 1], a
	ld de, GFX_e6238
	ld a, e
	ld [wcb13 + 0], a
	ld a, d
	ld [wcb13 + 1], a
	call Functione5498
	ld de, vTiles0
	ld hl, GFX_e63a8
	call Decompress
	ld hl, $c508 ; ?
	ld a, $01
	ld [hli], a
	ld a, $00
	ld [hli], a
	xor a
	ldh [hSCY], a
	ld [wGlobalAnimYOffset], a
	ld a, $60
	ldh [hSCX], a
	ld a, $a0
	ld [wGlobalAnimXOffset], a
	xor a
	ld [wcb18], a
	call EnableLCD
	ld b, SCGB_GS_INTRO
	ld c, 1
	call GetSGBLayout
	ld a, %11100100
	call DmgToCgbBGPals
	depixel 28, 28, 4, 4
	call DmgToCgbObjPals
	call Functione51ef
	xor a
	ld [wcb19], a
	ret

IntroScene7:
	call Functione51cc
	ld hl, wcb18
	ld a, [hl]
	inc [hl]
	and $03
	ret z
	ld hl, hSCX
	ld a, [hl]
	and a
	jr z, .asm_e516e
	dec [hl]
	ld hl, wGlobalAnimXOffset
	inc [hl]
	ret

.asm_e516e
	ld a, -1
	ld [wcb17], a
	call Functione51f8
	ld hl, wIntroJumptableIndex
	inc [hl]
	ret

IntroScene8:
	ld hl, wcb17
	ld a, [hl]
	and a
	jr z, .asm_e518b
	dec [hl]
	call Functione51cc
	ld hl, wcb18
	inc [hl]
	ret

.asm_e518b:
	xor a
	ld [wcb17], a
	ld hl, wIntroJumptableIndex
	inc [hl]
	callfar Function9136
	ret

IntroScene9:
	ld hl, wcb17
	ld a, [hl]
	inc [hl]
	srl a
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, .pals
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .done
	call DmgToCgbBGPals
	ld hl, hSCY
	inc [hl]
	ld hl, wGlobalAnimYOffset
	dec [hl]
	ret

.done
	ld hl, wIntroJumptableIndex
	inc [hl]
	ret

.pals
	db %11100100, %11100100, %11100100, %11100100
	db %11100100, %10010000, %01000000, %00000000
	db -1

	ret ; unused

Functione51cc:
	ld a, [wcb19]
	and a
	ret nz
	ld hl, wcb18
	ld a, [hl]
	and $3f
	ret nz
	ld a, [hl]
	and $7f
	jr z, .asm_e51e6
	depixel 11, 6, 4, 0
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_NOTE
	call InitSpriteAnimStruct
	ret

.asm_e51e6:
	depixel 10, 6, 4, 0
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_INVISIBLE_NOTE
	call InitSpriteAnimStruct
	ret

Functione51ef:
	depixel 14, 6
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_JIGGLYPUFF
	call InitSpriteAnimStruct
	ret

Functione51f8:
	depixel 14, 24
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_PIKACHU
	call InitSpriteAnimStruct
	depixel 14, 24
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_PIKACHU_TAIL
	call InitSpriteAnimStruct
	ret

IntroScene10:
	ld hl, wIntroJumptableIndex
	inc [hl]
	call DisableLCD
	callfar ClearSpriteAnims
	call Functione54dd
	call Functione5361
	ld de, vTiles2
	ld hl, GFX_e6908
	call Decompress
	ld de, vTiles1
	ld hl, GFX_e6e48
	call Decompress
	ld de, vTiles0
	ld hl, GFX_e71c8
	ld bc, vTiles1 - vTiles0
	call Decompress
	ld c, CHIKORITA
	ld de, vTiles0 tile $10
	farcall Function1587f
	ld c, CYNDAQUIL
	ld de, vTiles0 tile $29
	farcall Function1587f
	ld c, TOTODILE
	ld de, vTiles0 tile $42
	farcall Function1587f
	ld hl, $c508 ; ?
	ld a, $01
	ld [hli], a
	ld a, $00
	ld [hli], a
	call EnableLCD
	ld a, LOW(vTiles0)
	call Functione5422
	ld a, HIGH(vTiles0)
	ldh [hSCY], a
	xor a
	ldh [hSCX], a
	ld [wGlobalAnimYOffset], a
	ld [wGlobalAnimXOffset], a
	xor a
	ld [wcb18], a
	ld b, SCGB_GS_INTRO
	ld c, $02
	call GetSGBLayout
	ld a, %00111111
	call DmgToCgbBGPals
	lb de, %11111111, %11111111
	call DmgToCgbObjPals
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_GS_OPENING_2
	call PlayMusic
	ret

IntroScene11:
	ld hl, wcb18
	ld a, [hl]
	inc [hl]
	and $01
	ret z
	call Functione5376
	ld hl, hSCY
	ld a, [hl]
	and a
	jr z, .asm_e52b3
	inc [hl]
	ret

.asm_e52b3
	ld hl, wIntroJumptableIndex
	inc [hl]
	xor a
	ld [wcb17], a
; fall through
IntroScene12:
	ld hl, wcb17
	ld a, [hl]
	inc [hl]
	srl a
	srl a
	and $03
	ld e, a
	ld d, 0
	ld hl, .pals
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_e52da
	call DmgToCgbBGPals
	ld e, a
	ld d, a
	call DmgToCgbObjPals
	ret

.asm_e52da
	ld hl, wIntroJumptableIndex
	inc [hl]
	ld a, $80 ; ?
	ld [wcb17], a
	ret

.pals
	db %01101010, %10100101, %11100100, %00000000

IntroScene13:
	ld hl, wcb17
	ld a, [hl]
	and a
	jr z, .asm_e52f1
	dec [hl]
	ret

.asm_e52f1
	ld hl, wIntroJumptableIndex
	inc [hl]
	ld a, $01
	call Functione5422
	ld a, $04
	ld [wcb17], a
	ret

IntroScene14:
	ld hl, wcb17
	ld a, [hl]
	and a
	jr z, .asm_e5309
	dec [hl]
	ret

.asm_e5309
	ld hl, wIntroJumptableIndex
	inc [hl]
	ld a, $02
	call Functione5422
	ld a, $40
	ld [wcb17], a
	xor a
	ld [wcb18], a
	ld de, SFX_GS_INTRO_CHARIZARD_FIREBALL
	call PlaySFX
; fall through
IntroScene15:
	call Functione5473
	ld hl, wcb17
	ld a, [hl]
	and a
	jr z, .asm_e532d
	dec [hl]
	ret

.asm_e532d:
	ld hl, wIntroJumptableIndex
	inc [hl]
	xor a
	ld [wcb17], a
	ret

IntroScene16:
	call Functione5473
	ld hl, wcb17
	ld a, [hl]
	inc [hl]
	swap a
	and $07
	ld e, a
	ld d, 0
	ld hl, .pals
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .asm_e5357
	call DmgToCgbBGPals
	ld e, a
	ld d, a
	call DmgToCgbObjPals
	ret

.asm_e5357:
	ld hl, wIntroJumptableIndex
	inc [hl]
	ret

.pals
	db %11100100, %10010000, %01000000, %00000000
	db -1

Functione5361:
	hlcoord 0, 0
	ld bc, wTilemapEnd - wTilemap
	xor a
	call ByteFill
	ld hl, vBGMap0
	ld bc, vBGMap1 - vBGMap0
	xor a
	call ByteFill
	ret

Functione5376:
	ldh a, [hSCY]
	ld c, a
	ld hl, .unknown_e538b

.asm_e537c:
	ld a, [hli]
	cp -1
	ret z
	cp c
	jr z, .asm_e5387
	inc hl
	inc hl
	jr .asm_e537c

.asm_e5387:
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.unknown_e538b
	dr ($e538b - BANK39_OFFSET), ($e5422 - BANK39_OFFSET)

Functione5422:
	push af
	hlcoord 0, 6
	ld c, $a0
	xor a
.loop1
	ld [hli], a
	dec c
	jr nz, .loop1

	pop af
	ld e, a
	ld d, 0
	ld hl, .unknown_e5464
rept 5
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, e

.loop2_outer
	push bc
	push hl
.loop2_inner
	ld [hli], a
	inc a
	dec c
	jr nz, .loop2_inner
	pop hl
	ld bc, $0014
	add hl, bc
	pop bc
	dec b
	jr nz, .loop2_outer

	ld a, $1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ldh [hBGMapMode], a
	ret

.unknown_e5464
	db $00, $08, $08, $22, $c4
	db $40, $09, $08, $21, $c4
	db $88, $09, $08, $20, $c4

Functione5473:
	ld hl, wcb18
	ld a, [hl]
	inc [hl]
	and $03
	ret nz
	depixel 12, 10, 4, 4
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_FIREBALL
	call InitSpriteAnimStruct
	ld hl, hSCX
	dec [hl]
	ld hl, wGlobalAnimXOffset
	inc [hl]
	ret

Functione548c:
	ld bc, $0800
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

Functione5498:
	ld b, $10
.loop_outer
	push hl
	ld c, $10
.loop_inner
	call Functione54ae
	dec c
	jr nz, .loop_inner
	pop hl
	push bc
	ld bc, $0040
	add hl, bc
	pop bc
	dec b
	jr nz, .loop_outer
	ret

Functione54ae:
	push bc
	push de
	push hl
	push hl
	push hl
	ld a, [de]
	ld l, a
	ld h, $00
	ld a, [wcb15 + 0]
	ld e, a
	ld a, [wcb15 + 1]
	ld d, a
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	pop hl
	ld bc, $0020
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	pop hl
	inc hl
	inc hl
	pop de
	inc de
	pop bc
	ret

Functione54dd:
	ld hl, $c700 ; ?
	xor a
	ld c, $a0
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

GFX_e54e8:
	dr ($e54e8 - BANK39_OFFSET), ($e5ab8 - BANK39_OFFSET)
GFX_e5ab8:
	dr ($e5ab8 - BANK39_OFFSET), ($e5bc8 - BANK39_OFFSET)
GFX_e5bc8:
	dr ($e5bc8 - BANK39_OFFSET), ($e5cd8 - BANK39_OFFSET)
GFX_e5cd8:
	dr ($e5cd8 - BANK39_OFFSET), ($e6058 - BANK39_OFFSET)
GFX_e6058:
	dr ($e6058 - BANK39_OFFSET), ($e6238 - BANK39_OFFSET)
GFX_e6238:
	dr ($e6238 - BANK39_OFFSET), ($e6338 - BANK39_OFFSET)
GFX_e6338:
	dr ($e6338 - BANK39_OFFSET), ($e63a8 - BANK39_OFFSET)
GFX_e63a8:
	dr ($e63a8 - BANK39_OFFSET), ($e6908 - BANK39_OFFSET)
GFX_e6908:
	dr ($e6908 - BANK39_OFFSET), ($e6e48 - BANK39_OFFSET)
GFX_e6e48:
	dr ($e6e48 - BANK39_OFFSET), ($e71c8 - BANK39_OFFSET)
GFX_e71c8:
	dr ($e71c8 - BANK39_OFFSET), ($e7678 - BANK39_OFFSET)
