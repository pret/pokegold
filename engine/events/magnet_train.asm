MagnetTrain:
	ld a, [wScriptVar]
	and a
	jr nz, .ToGoldenrod
	ld a, 1 ; forwards
	lb bc, 8 * TILE_WIDTH, 12 * TILE_WIDTH
	lb de, (11 * TILE_WIDTH) - (11 * TILE_WIDTH + 4), -12 * TILE_WIDTH
	jr .continue

.ToGoldenrod:
	ld a, -1 ; backwards
	lb bc, -8 * TILE_WIDTH, -12 * TILE_WIDTH
	lb de, (11 * TILE_WIDTH) + (11 * TILE_WIDTH + 4), 12 * TILE_WIDTH

.continue
	ld [wMagnetTrainDirection], a
	ld a, c
	ld [wMagnetTrainInitPosition], a
	ld a, b
	ld [wMagnetTrainHoldPosition], a
	ld a, e
	ld [wMagnetTrainFinalPosition], a
	ld a, d
	ld [wMagnetTrainPlayerSpriteInitX], a

	ldh a, [hSCX]
	push af
	ldh a, [hSCY]
	push af
	call MagnetTrain_LoadGFX_PlayMusic
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], VBLANK_CUTSCENE
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	callfar PlaySpriteAnimations
	call MagnetTrain_Jumptable
	call MagnetTrain_UpdateLYOverrides
	call PushLYOverrides
	call DelayFrame
	jr .loop

.done
	pop af
	ldh [hVBlank], a
	call ClearBGPalettes
	xor a
	ldh [hLCDCPointer], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	ldh [hSCX], a
	ld [wRequested2bppSource], a
	ld [wRequested2bppSource + 1], a
	ld [wRequested2bppDest], a
	ld [wRequested2bppDest + 1], a
	ld [wRequested2bppSize], a
	call ClearTilemap

	pop af
	ldh [hSCY], a
	pop af
	ldh [hSCX], a
	xor a
	ldh [hBGMapMode], a
	ret

MagnetTrain_UpdateLYOverrides:
	ld hl, wLYOverridesBackup
	ld c, 6 * TILE_WIDTH - 1
	ld a, [wMagnetTrainOffset]
	add a
	ldh [hSCX], a
	call .loadloop
	ld c, 6 * TILE_WIDTH
	ld a, [wMagnetTrainPosition]
	call .loadloop
	ld c, 6 * TILE_WIDTH + 1
	ld a, [wMagnetTrainOffset]
	add a
	call .loadloop

	ld a, [wMagnetTrainDirection]
	ld d, a
	ld hl, wMagnetTrainOffset
	ld a, [hl]
	add d
	add d
	ld [hl], a
	ret

.loadloop
	ld [hli], a
	dec c
	jr nz, .loadloop
	ret

MagnetTrain_LoadGFX_PlayMusic:
	call ClearBGPalettes
	call ClearSprites
	call DisableLCD
	callfar ClearSpriteAnims
	call SetMagnetTrainPals
	call DrawMagnetTrain
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	call EnableLCD
	xor a
	ldh [hBGMapMode], a
	ldh [hSCX], a
	ldh [hSCY], a

	ld de, ChrisSpriteGFX
	ld hl, vTiles0
	lb bc, BANK(ChrisSpriteGFX), 4
	call Request2bpp

	ld de, ChrisSpriteGFX + 12 tiles
	ld hl, vTiles0 tile $04
	lb bc, BANK(ChrisSpriteGFX), 4
	call Request2bpp

	call MagnetTrain_InitLYOverrides

	ld a, [wTimeOfDayPal]
	push af
	ld a, [wEnvironment]
	push af

	ld a, [wTimeOfDay]
	maskbits NUM_DAYTIMES
	ld [wTimeOfDayPal], a
	ld a, TOWN
	ld [wEnvironment], a
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	call UpdateTimePals

	ldh a, [rBGP]
	ld [wBGP], a
	ldh a, [rOBP0]
	ld [wOBP0], a
	ldh a, [rOBP1]
	ld [wOBP1], a

	pop af
	ld [wEnvironment], a
	pop af
	ld [wTimeOfDayPal], a

	ld hl, wJumptableIndex
	xor a
	ld [hli], a ; wJumptableIndex
	ld a, [wMagnetTrainInitPosition]
	ld [hli], a ; wMagnetTrainOffset
	ld [hli], a ; wMagnetTrainPosition
	ld [hli], a ; wMagnetTrainWaitCounter

	ld de, MUSIC_MAGNET_TRAIN
	call PlayMusic2
	ret

DrawMagnetTrain:
	hlbgcoord 0, 0
	xor a
.loop
	call GetMagnetTrainBGTiles
	ld b, BG_MAP_WIDTH / 2
	call .FillAlt
	inc a
	cp SCREEN_HEIGHT
	jr c, .loop

	hlbgcoord 0, 6
	ld de, MagnetTrainTilemap
	ld c, SCREEN_WIDTH
	call .FillLine
	hlbgcoord 0, 7
	ld de, MagnetTrainTilemap + SCREEN_WIDTH
	ld c, SCREEN_WIDTH
	call .FillLine
	hlbgcoord 0, 8
	ld de, MagnetTrainTilemap + (SCREEN_WIDTH * 2)
	ld c, SCREEN_WIDTH
	call .FillLine
	hlbgcoord 0, 9
	ld de, MagnetTrainTilemap + (SCREEN_WIDTH * 3)
	ld c, SCREEN_WIDTH
	call .FillLine
	ret

.FillLine:
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .FillLine
	ret

.FillAlt:
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec b
	jr nz, .FillAlt
	ret

GetMagnetTrainBGTiles:
	push hl
	ld e, a
	ld d, 0
	ld hl, MagnetTrainBGTiles
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	ret

MagnetTrainBGTiles:
; 2x18 tilemap, repeated in vertical strips for the background.
INCBIN "gfx/overworld/magnet_train_bg.tilemap"

MagnetTrain_InitLYOverrides:
	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	ld a, [wMagnetTrainInitPosition]
	call ByteFill
	ld hl, wLYOverridesBackup
	ld bc, wLYOverridesBackupEnd - wLYOverridesBackup
	ld a, [wMagnetTrainInitPosition]
	call ByteFill
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	ret

SetMagnetTrainPals:
	ld a, 1
	ldh [rVBK], a

	; bushes
	hlbgcoord 0, 0
	ld bc, 4 * BG_MAP_WIDTH
	ld a, PAL_BG_GREEN
	call ByteFill

	; train
	hlbgcoord 0, 4
	ld bc, 10 * BG_MAP_WIDTH
	xor a ; PAL_BG_GRAY
	call ByteFill

	; more bushes
	hlbgcoord 0, 14
	ld bc, 4 * BG_MAP_WIDTH
	ld a, PAL_BG_GREEN
	call ByteFill

	; train window
	hlbgcoord 7, 8
	ld bc, 6
	ld a, PAL_BG_YELLOW
	call ByteFill

	ld a, 0
	ldh [rVBK], a
	ret

MagnetTrain_Jumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
	dw .InitPlayerSpriteAnim
	dw .WaitScene
	dw .MoveTrain1
	dw .WaitScene
	dw .MoveTrain2
	dw .WaitScene
	dw .TrainArrived

.Next:
	ld hl, wJumptableIndex
	inc [hl]
	ret

.InitPlayerSpriteAnim:
	ld d, (8 + 2) * TILE_WIDTH + 5
	ld a, [wMagnetTrainPlayerSpriteInitX]
	ld e, a
	ld a, SPRITE_ANIM_OBJ_MAGNET_TRAIN_RED
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], 0
	call .Next
	ld a, 128
	ld [wMagnetTrainWaitCounter], a
	ret

.MoveTrain1:
	ld hl, wMagnetTrainHoldPosition
	ld a, [wMagnetTrainPosition]
	cp [hl]
	jr z, .PrepareToHoldTrain
	ld e, a
	ld a, [wMagnetTrainDirection]
	xor $ff
	inc a
	add e
	ld [wMagnetTrainPosition], a
	ld hl, wGlobalAnimXOffset
	ld a, [wMagnetTrainDirection]
	add [hl]
	ld [hl], a
	ret

.PrepareToHoldTrain:
	call .Next
	ld a, 128
	ld [wMagnetTrainWaitCounter], a
	ret

.WaitScene:
	ld hl, wMagnetTrainWaitCounter
	ld a, [hl]
	and a
	jr z, .DoneWaiting
	dec [hl]
	ret

.DoneWaiting:
	call .Next
	ret

.MoveTrain2:
	ld hl, wMagnetTrainFinalPosition
	ld a, [wMagnetTrainPosition]
	cp [hl]
	jr z, .PrepareToFinishAnim
	ld e, a
	ld a, [wMagnetTrainDirection]
	xor $ff
	inc a
	ld d, a
	ld a, e
	add d
	add d
	ld [wMagnetTrainPosition], a
	ld hl, wGlobalAnimXOffset
	ld a, [wMagnetTrainDirection]
	ld d, a
	ld a, [hl]
	add d
	add d
	ld [hl], a
	ret

	ret

.PrepareToFinishAnim:
	call .Next
	ret

.TrainArrived:
	ld a, $80
	ld [wJumptableIndex], a
	ld de, SFX_TRAIN_ARRIVED
	call PlaySFX
	ret


MagnetTrainTilemap:
; 20x4 tilemap
INCBIN "gfx/overworld/magnet_train_fg.tilemap"
