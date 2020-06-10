GoldSilverIntro:
	call .Init
.loop
	call .JoypadLoop
	jr nc, .loop
	ret

.Init:
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
	jumptable .IntroScenes, wIntroJumptableIndex

.IntroScenes:
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
; Set up water cutscene (Shellders/Magikarp/Lapras)
	call ClearBGPalettes
	call ClearTilemap
	ld hl, wIntroJumptableIndex
	inc [hl] ; only run once
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
	call Intro_ResetLYOverrides
	ld de, vTiles2 tile $00
	ld hl, GSIntroWaterGFX1
	call Decompress
	ld a, LOW(GSIntroWaterMeta)
	ld [wIntroTilesPointer + 0], a
	ld a, HIGH(GSIntroWaterMeta)
	ld [wIntroTilesPointer + 1], a
	hlbgcoord 0, 0, vBGMap2
	ld a, l
	ld [wIntroBGMapPointer + 0], a
	ld a, h
	ld [wIntroBGMapPointer + 1], a
	ld de, GSIntroWaterTilemap + 15 tiles
	ld a, e
	ld [wIntroTilemapPointer + 0], a
	ld a, d
	ld [wIntroTilemapPointer + 1], a
	call Functione5498
	ld de, vTiles0 tile $00
	ld hl, GSIntroWaterGFX2
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
	xor a
	ld [wIntroSceneFrameCounter2], a
	ld a, $80
	ld [wIntroSceneFrameCounter1], a
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
	call InitShellders
	ld de, MUSIC_GS_OPENING
	call PlayMusic
	ret

IntroScene2:
; shellders underwater
	call Functione50af
	ld hl, wIntroSceneFrameCounter1
	ld a, [hl]
	and a
	jr z, .asm_e4df5
	dec [hl]
	call InitBubble
	ret

.asm_e4df5:
	ld [hl], $10
	ld hl, wIntroJumptableIndex
	inc [hl]

IntroScene3:
; rise towards the surface
	call Functione4e90
	call Functione4e67
	ret nc
.next
	call Intro_ResetLYOverrides
	ld hl, hSCY
	inc [hl]
	ld hl, wIntroJumptableIndex
	inc [hl]

IntroScene4:
; at surface, Lapras surfs to left of screen
	ld a, [wcb19]
	and a
	jr nz, .next
	ld hl, wIntroSceneFrameCounter2
	inc [hl]
	ld a, [hl]
	and $0f
	jr nz, .asm_e4e21
	ld hl, hSCX
	dec [hl]
	dec [hl]

.asm_e4e21
	call Functione4fde
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	xor a
	ld [wIntroSceneFrameCounter1], a

IntroScene5:
; fade out
	ld hl, wIntroSceneFrameCounter1
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
	jr z, .next
	call DmgToCgbBGPals
	call Functione4fde
	ld hl, hSCX
	dec [hl]
	dec [hl]
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	ret

.pals
	db %11100100, %11100100, %10010000, %01000000, %00000000
	db -1

IntroScene17:
; delay a bit before leading into the title screen
	ld c, 64
.loop
	call DelayFrame
	dec c
	jr nz, .loop
	ld hl, wIntroJumptableIndex
	set 7, [hl]
	ret

Functione4e67:
	ld hl, wIntroSceneFrameCounter2
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
	ld a, [wIntroSceneFrameCounter1]
	and a
	jr z, .asm_e4e8e

.asm_e4e8c
	and a
	ret

.asm_e4e8e
	scf
	ret

Functione4e90:
	jumptable .dw, wIntroSceneFrameCounter1

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
	call InitLapras
	depixel 28, 28, 4, 4
	call DmgToCgbObjPals
; fall through
Functione4eca:
	call Functione4fde
	ret

Functione4ece:
	call InitMagikarps
	call Functione4fde
	ret

Functione4ed5:
	ld hl, wIntroSceneFrameCounter2
	ld a, [hl]
	and %00011111
	jr z, .asm_e4ee1
	call InitMagikarps
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

InitBubble:
	ld hl, wIntroSceneFrameCounter1
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

InitMagikarps:
	depixel 8, 7, 0, 7
	ldh a, [hSGB]
	and a
	jr z, .ok
	depixel 4, 3, 0, 7

.ok
	ld hl, wIntroSceneFrameCounter2
	ld a, [hl]
	and e
	ret nz
	ld a, [hl]
	and d
	jr nz, .asm_e4f41
	depixel 29, 28
	call .InitAnim
	depixel 26, 0
	call .InitAnim
	depixel 0, 24
	call .InitAnim
	ret

.asm_e4f41
	depixel 28, 30
	call .InitAnim
	depixel 31, 24
	call .InitAnim
	depixel 2, 28
	call .InitAnim
	ret

.InitAnim:
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_MAGIKARP
	call InitSpriteAnimStruct
	ret

InitShellders:
	depixel 18, 7
	call .InitAnim
	depixel 14, 10
	call .InitAnim
	depixel 16, 15

.InitAnim:
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_SHELLDER
	call InitSpriteAnimStruct
	ret

InitLapras:
	ld a, [wIntroSceneFrameCounter2]
	and %00011111
	ret nz
	depixel 16, 24
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_LAPRAS_2
	call InitSpriteAnimStruct
	ret

UnusedInitLapras:
	depixel 2, 0
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_LAPRAS
	call InitSpriteAnimStruct
	ret

Functione4f87:
	push hl
	push de
	ld a, [wIntroTilemapPointer + 0]
	ld e, a
	ld a, [wIntroTilemapPointer + 1]
	ld d, a
	ld hl, -$10
	add hl, de
	ld a, l
	ld e, l
	ld [wIntroTilemapPointer + 0], a
	ld a, h
	ld d, h
	ld [wIntroTilemapPointer + 1], a
	hlcoord 0, 0
	ld c, $10

.loop
	call Functione54ae
	dec c
	jr nz, .loop
	ld a, [wIntroBGMapPointer + 0]
	ld e, a
	ld a, [wIntroBGMapPointer + 1]
	ld d, a
	ld hl, hCurSpriteYCoord
	add hl, de
	ld a, l
	ld [wIntroBGMapPointer + 0], a
	ld [wRequested2bppDest + 0], a
	ld a, h
	and $fb
	or $08
	ld [wIntroBGMapPointer + 1], a
	ld [wRequested2bppDest + 1], a
	ld a, LOW(wTilemap)
	ld [wRequested2bppSource + 0], a
	ld a, HIGH(wTilemap)
	ld [wRequested2bppSource + 1], a
	ld a, 4
	ld [wRequested2bppSize], a
	ld hl, wIntroSceneFrameCounter1
	dec [hl]
	pop de
	pop hl
	ret

Functione4fde:
	ld hl, wIntroSceneFrameCounter2
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
	ld de, .data_e5015
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

.data_e5015
rept 8
	db $70, $71, $72, $73
endr
rept 8
	db $74, $75, $76, $77
endr
rept 8
	db $78, $79, $7a, $7b
endr
rept 8
	db $7c, $7d, $7e, $7f
endr

Functione5095:
	ld bc, wLYOverrides2
	ld a, wLYOverrides2End - wLYOverrides2
	ld de, vBGMap1 - vBGMap0

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
	ld bc, wLYOverrides
	ld e, $10

.loop1
	ldh a, [hSCY]
	ld [bc], a
	inc bc
	dec e
	jr nz, .loop1

	ld hl, wLYOverrides2
	ld de, wLYOverrides2 + 1
	ld a, [hl]
	push af
	ld a, $80

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
; Set up grass cutscene (Pikachu/Jigglypuff)
	ld hl, wIntroJumptableIndex
	inc [hl]
	call DisableLCD
	callfar ClearSpriteAnims
	call Intro_ResetLYOverrides
	ld de, vTiles2
	ld hl, GSIntroGrassGFX1
	call Decompress
	ld a, LOW(GSIntroGrassMeta)
	ld [wIntroTilesPointer + 0], a
	ld a, HIGH(GSIntroGrassMeta)
	ld [wIntroTilesPointer + 1], a
	ld hl, vBGMap0
	ld a, l
	ld [wIntroBGMapPointer + 0], a
	ld a, h
	ld [wIntroBGMapPointer + 1], a
	ld de, GSIntroGrassTilemap
	ld a, e
	ld [wIntroTilemapPointer + 0], a
	ld a, d
	ld [wIntroTilemapPointer + 1], a
	call Functione5498
	ld de, vTiles0
	ld hl, GSIntroGrassGFX2
	call Decompress
	ld hl, wSpriteAnimDict
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
	ld [wIntroSceneFrameCounter2], a
	call EnableLCD
	ld b, SCGB_GS_INTRO
	ld c, 1
	call GetSGBLayout
	ld a, %11100100
	call DmgToCgbBGPals
	depixel 28, 28, 4, 4
	call DmgToCgbObjPals
	call InitJigglypuffAnim
	xor a
	ld [wcb19], a
	ret

IntroScene7:
; scroll left to Jigglypuff
	call InitNoteAnim
	ld hl, wIntroSceneFrameCounter2
	ld a, [hl]
	inc [hl]
	and $03
	ret z
	ld hl, hSCX
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ld hl, wGlobalAnimXOffset
	inc [hl]
	ret

.next
	ld a, -1
	ld [wIntroSceneFrameCounter1], a
	call InitPikachuAnim
	ld hl, wIntroJumptableIndex
	inc [hl]
	ret

IntroScene8:
; stop scrolling, Pikachu attacks
	ld hl, wIntroSceneFrameCounter1
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	call InitNoteAnim
	ld hl, wIntroSceneFrameCounter2
	inc [hl]
	ret

.next
	xor a
	ld [wIntroSceneFrameCounter1], a
	ld hl, wIntroJumptableIndex
	inc [hl]
	callfar Function9136
	ret

IntroScene9:
; scroll down and fade out
	ld hl, wIntroSceneFrameCounter1
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

InitNoteAnim:
	ld a, [wcb19]
	and a
	ret nz
	ld hl, wIntroSceneFrameCounter2
	ld a, [hl]
	and %00111111
	ret nz
	ld a, [hl]
	and %01111111
	jr z, .invisible
	depixel 11, 6, 4, 0
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_NOTE
	call InitSpriteAnimStruct
	ret

.invisible
	depixel 10, 6, 4, 0
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_INVISIBLE_NOTE
	call InitSpriteAnimStruct
	ret

InitJigglypuffAnim:
	depixel 14, 6
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_JIGGLYPUFF
	call InitSpriteAnimStruct
	ret

InitPikachuAnim:
	depixel 14, 24
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_PIKACHU
	call InitSpriteAnimStruct
	depixel 14, 24
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_PIKACHU_TAIL
	call InitSpriteAnimStruct
	ret

IntroScene10:
; Set up fireball cutscene (Charizard, Johto starters)
	ld hl, wIntroJumptableIndex
	inc [hl]
	call DisableLCD
	callfar ClearSpriteAnims
	call Intro_ResetLYOverrides
	call Functione5361
	ld de, vTiles2
	ld hl, GSIntroCharizardGFX1
	call Decompress
	ld de, vTiles1
	ld hl, GSIntroCharizardGFX2
	call Decompress
	ld de, vTiles0
	ld hl, GSIntroCharizardGFX3
	ld bc, vTiles1 - vTiles0
	call Decompress
	ld c, CHIKORITA
	ld de, vTiles0 tile $10
	farcall GSIntroGetMonFrontpic
	ld c, CYNDAQUIL
	ld de, vTiles0 tile $29
	farcall GSIntroGetMonFrontpic
	ld c, TOTODILE
	ld de, vTiles0 tile $42
	farcall GSIntroGetMonFrontpic
	ld hl, wSpriteAnimDict
	ld a, $01
	ld [hli], a
	ld a, $00
	ld [hli], a
	call EnableLCD
	ld a, 0
	call Functione5422
	ld a, $80
	ldh [hSCY], a
	xor a
	ldh [hSCX], a
	ld [wGlobalAnimYOffset], a
	ld [wGlobalAnimXOffset], a
	xor a
	ld [wIntroSceneFrameCounter2], a
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
; scroll up to Charizard silhoutte, flash Johto starters
	ld hl, wIntroSceneFrameCounter2
	ld a, [hl]
	inc [hl]
	and $01
	ret z
	call CheckSCYEvents
	ld hl, hSCY
	ld a, [hl]
	and a
	jr z, .done_scrolling
	inc [hl]
	ret

.done_scrolling
	ld hl, wIntroJumptableIndex
	inc [hl]
	xor a
	ld [wIntroSceneFrameCounter1], a
IntroScene12:
; load Charizard palettes
	ld hl, wIntroSceneFrameCounter1
	ld a, [hl]
	inc [hl]
	srl a
	srl a
	and %11
	ld e, a
	ld d, 0
	ld hl, .pals
	add hl, de
	ld a, [hl]
	and a
	jr z, .next
	call DmgToCgbBGPals
	ld e, a
	ld d, a
	call DmgToCgbObjPals
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	ld a, $80
	ld [wIntroSceneFrameCounter1], a
	ret

.pals
	db %01101010, %10100101, %11100100, %00000000

IntroScene13:
; Charizard mouth closed
	ld hl, wIntroSceneFrameCounter1
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	ld a, $01
	call Functione5422
	ld a, $04
	ld [wIntroSceneFrameCounter1], a
	ret

IntroScene14:
; Charizard mouth open
	ld hl, wIntroSceneFrameCounter1
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	ld a, $02
	call Functione5422
	ld a, $40
	ld [wIntroSceneFrameCounter1], a
	xor a
	ld [wIntroSceneFrameCounter2], a
	ld de, SFX_GS_INTRO_CHARIZARD_FIREBALL
	call PlaySFX
IntroScene15:
; Charizard mouth wide open / fireball starts
	call Functione5473
	ld hl, wIntroSceneFrameCounter1
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	xor a
	ld [wIntroSceneFrameCounter1], a
	ret

IntroScene16:
; continue fireball / fade out palettes
	call Functione5473
	ld hl, wIntroSceneFrameCounter1
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

CheckSCYEvents:
	ldh a, [hSCY]
	ld c, a
	ld hl, .scy_jumptable

.asm_e537c
	ld a, [hli]
	cp -1
	ret z
	cp c
	jr z, .value_found
	inc hl
	inc hl
	jr .asm_e537c

.value_found
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.scy_jumptable
	dbw $86, Functione53f7
	dbw $87, ChikoritaAppears
	dbw $88, Functione53e0
	dbw $98, Functione53eb
	dbw $99, Functione5400
	dbw $af, CyndaquilAppears
	dbw $b0, Functione53e0
	dbw $c0, Functione53eb
	dbw $c1, Functione5409
	dbw $d7, TotodileAppears
	dbw $d8, Functione53e0
	dbw $e8, Functione53eb
	dbw $e9, Functione5412
	db -1

ChikoritaAppears:
	ld de, SFX_GS_INTRO_POKEMON_APPEARS
	call PlaySFX
	depixel 22, 1
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_CHIKORITA
	call InitSpriteAnimStruct
	ret

CyndaquilAppears:
	ld de, SFX_GS_INTRO_POKEMON_APPEARS
	call PlaySFX
	depixel 22, 20
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_CYNDAQUIL
	call InitSpriteAnimStruct
	ret

TotodileAppears:
	ld de, SFX_GS_INTRO_POKEMON_APPEARS
	call PlaySFX
	depixel 22, 1
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_TOTODILE
	call InitSpriteAnimStruct
	ret

Functione53e0:
	depixel 28, 28, 4, 4
	call DmgToCgbObjPals
	xor a
	call DmgToCgbBGPals
	ret

Functione53eb:
	depixel 31, 31, 7, 7
	call DmgToCgbObjPals
	ld a, %00111111
	call DmgToCgbBGPals
	ret

Functione53f7:
	ld c, CHIKORITA
	farcall Function9178
	ret

Functione5400:
	ld c, CYNDAQUIL
	farcall Function9178
	ret

Functione5409:
	ld c, TOTODILE
	farcall Function9178
	ret

Functione5412:
	ldh a, [hCGB]
	and a
	ld c, CYNDAQUIL
	jr nz, .got_mon
	ld c, CHARIZARD
.got_mon
	farcall Function9178
	ret

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
	ld hl, .data_e5464
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
	ld bc, SCREEN_WIDTH
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

.data_e5464
; tile id, width, height, tilemap addr?
	db $00, 8, 8
	dwcoord 10, 6
	db $40, 9, 8
	dwcoord 9, 6
	db $88, 9, 8
	dwcoord 8, 6

Functione5473:
	ld hl, wIntroSceneFrameCounter2
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
	ld a, [wIntroTilesPointer + 0]
	ld e, a
	ld a, [wIntroTilesPointer + 1]
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

Intro_ResetLYOverrides:
	ld hl, wLYOverrides
	xor a
	ld c, wLYOverrides2 - wLYOverrides
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

GSIntroWaterGFX1:
INCBIN "gfx/intro/water1.2bpp.lz"

GSIntroWaterTilemap:
INCBIN "gfx/intro/water.tilemap"

GSIntroWaterMeta:
INCBIN "gfx/intro/water.bin"

GSIntroWaterGFX2:
INCBIN "gfx/intro/water2.2bpp.lz"

GSIntroGrassGFX1:
INCBIN "gfx/intro/grass1.2bpp.lz"

GSIntroGrassTilemap:
INCBIN "gfx/intro/grass.tilemap"

GSIntroGrassMeta:
INCBIN "gfx/intro/grass.bin"

GSIntroGrassGFX2:
INCBIN "gfx/intro/grass2.2bpp.lz"

GSIntroCharizardGFX1:
INCBIN "gfx/intro/charizard1.2bpp.lz"

GSIntroCharizardGFX2:
INCBIN "gfx/intro/charizard2.2bpp.lz"

GSIntroCharizardGFX3:
INCBIN "gfx/intro/charizard3.2bpp.lz"
