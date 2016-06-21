FieldMoveBufferReset: ; c72f (3:472f)
	xor a
	ld hl, wBuffer1
	ld bc, $7
	call ByteFill
	ret

DoFieldMoveAction: ; c73a (3:473a)
	ld a, [wBuffer1]
	rst JumpTable
	ld [wBuffer1], a
	bit 7, a
	jr nz, .asm_c747
	and a
	ret

.asm_c747
	and $7f
	scf
	ret

FieldMoveGetPartyNick: ; c74b (3:474b)
	ld hl, wPartyMon1Nickname
	ld a, $2
	ld [wce5f], a
	ld a, [wd005]
	call GetNick
	call Function317b
	ld de, wStringBuffer2
	ld hl, wStringBuffer3
	call CopyName2
	ret

FieldMoveEngineFlagCheck: ; c766 (3:4766)
	ld b, CHECK_FLAG
	callba EngineFlagAction ; same bank
	ld a, c
	and a
	jr nz, .asm_c774
	scf
	ret

.asm_c774
	xor a
	ret

FieldMoveBadgeCheck: ; c776 (3:4776)
	call FieldMoveEngineFlagCheck
	ret nc
	ld hl, .BadgeRequiredText
	call MenuTextBoxBackup
	scf
	ret

.BadgeRequiredText:
	text_jump BadgeRequiredText_
	db "@"

FieldMovePartyCheck: ; c787 (3:4787)
	ld e, $0
	xor a
	ld [wd005], a
.asm_c78d
	ld c, e
	ld b, $0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_c7bc
	cp -1
	jr z, .asm_c7bc
	cp EGG
	jr z, .asm_c7b3
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Moves
	ld a, e
	call AddNTimes
	ld b, NUM_MOVES
.asm_c7ac
	ld a, [hli]
	cp d
	jr z, .asm_c7b6
	dec b
	jr nz, .asm_c7ac
.asm_c7b3
	inc e
	jr .asm_c78d

.asm_c7b6
	ld a, e
	ld [wd005], a
	xor a
	ret

.asm_c7bc
	scf
	ret

FieldMoveFailed: ; c7be (3:47be)
	ld hl, .CantUseHereText
	call MenuTextBoxBackup
	ret

.CantUseHereText:
	text_jump CantUseFieldMoveHereText_
	db "@"

CutFunction::
	call FieldMoveBufferReset
.asm_c7cd
	ld hl, .Jumptable
	call DoFieldMoveAction
	jr nc, .asm_c7cd
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw CheckAbleToCut
	dw CutTreeOrGrass
	dw FailToCut

CheckAbleToCut:
	ld de, ENGINE_HIVEBADGE
	call FieldMoveBadgeCheck
	jr c, .asm_c7f1
	call CheckMapForSomethingToCut
	jr c, .asm_c7f4
	ld a, $1
	ret

.asm_c7f1
	ld a, $80
	ret

.asm_c7f4
	ld a, $2
	ret

CutTreeOrGrass:
	ld hl, Script_CutFromMenu
	call QueueScript
	ld a, $81
	ret

FailToCut:
	ld hl, Text_NothingToCut
	call MenuTextBoxBackup
	ld a, $80
	ret

Text_UsedCut:
	text_jump Text_UsedCut_
	db "@"

Text_NothingToCut:
	text_jump Text_NothingToCut_
	db "@"

CheckMapForSomethingToCut: ; c813 (3:4813)
	call GetFacingTileCoord
	ld c, a
	push de
	callba CheckCutCollision
	pop de
	jr nc, .asm_c841
	call GetBlockLocation
	ld c, [hl]
	push hl
	ld hl, CutTreeBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .asm_c841
	ld a, l
	ld [wBuffer3], a
	ld a, h
	ld [wBuffer4], a
	ld a, b
	ld [wBuffer5], a
	ld a, c
	ld [wBuffer6], a
	xor a
	ret

.asm_c841
	scf
	ret

Script_CutFromMenu:
	reloadmappart
	special UpdateTimePals
Script_Cut:
	callasm FieldMoveGetPartyNick
	writetext Text_UsedCut
	reloadmappart
	callasm CutDownTreeOrGrass
	closetext
	end

CutDownTreeOrGrass:
	ld hl, wBuffer3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wBuffer5]
	ld [hl], a
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	call UpdateSprites
	call DelayFrame
	ld a, [wBuffer6]
	ld e, a
	callba OWCutAnimation
	call BufferScreen
	call GetMovementPermissions
	ret

CheckOverworldTileArrays: ; c87c (3:487c)
	push bc
	ld a, [wd082]
	ld de, $3
	call IsInArray
	pop bc
	jr nc, .asm_c89c
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $3
	ld a, c
	call IsInArray
	jr nc, .asm_c89c
	inc hl
	ld b, [hl]
	inc hl
	ld c, [hl]
	scf
	ret

.asm_c89c
	xor a
	ret

CutTreeBlockPointers:
	dbw TILESET_JOHTO_1, .johto1
	dbw TILESET_JOHTO_2, .johto2
	dbw TILESET_KANTO, .kanto
	dbw TILESET_PARK, .park
	dbw TILESET_ILEX_FOREST, .ilex
	db -1

.johto1
	db $03, $02, $01 ; grass
	db $5b, $3c, $00 ; tree
	db $5f, $3d, $00 ; tree
	db $63, $3f, $00 ; tree
	db $67, $3e, $00 ; tree
	db -1

.johto2
	db $03, $02, $01 ; grass
	db -1

.kanto
	db $0b, $0a, $01 ; grass
	db $32, $6d, $00 ; tree
	db $33, $6c, $00 ; tree
	db $34, $6f, $00 ; tree
	db $35, $4c, $00 ; tree
	db $60, $6e, $00 ; tree
	db -1

.park
	db $13, $03, $01 ; grass
	db $03, $04, $01 ; grass
	db -1

.ilex
	db $0f, $17, $00
	db -1

WhirlpoolBlockPointers:
	dbw TILESET_JOHTO_1, .johto
	db -1

.johto
	db $07, $36, $00
	db -1
	
FlashFunction:
	call CheckUseFlash
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

CheckUseFlash: ; c8f1 (3:48f1)
	ld de, ENGINE_ZEPHYRBADGE
	callba FieldMoveBadgeCheck ; same bank
	jr c, .asm_c90f
	ld a, [wd56e]
	cp $ff
	jr nz, .asm_c909
	call UseFlash
	ld a, $81
	ret

.asm_c909
	call FieldMoveFailed
	ld a, $80
	ret

.asm_c90f
	ld a, $80
	ret

UseFlash: ; c912 (3:4912)
	ld hl, Script_UseFlash
	jp QueueScript

Script_UseFlash:
	reloadmappart
	special UpdateTimePals
	writetext Text_UsedFlash
	callasm BlindingFlash
	closetext
	end

Text_UsedFlash:
	text_jump Text_UsedFlash_
	start_asm
	call WaitSFX
	ld de, SFX_FLASH
	call PlaySFX
	call WaitSFX
	ld hl, .end
	ret
.end db "@"

SurfFunction:
	call FieldMoveBufferReset
.asm_c93e
	ld hl, .Jumptable
	call DoFieldMoveAction
	jr nc, .asm_c93e
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw CheckAbleToSurf
	dw StartSurfing
	dw CantSurf
	dw AlreadySurfing

CheckAbleToSurf:
	ld de, ENGINE_FOGBADGE
	call FieldMoveBadgeCheck
	jr c, .asm_c980
	CheckFlagHL ENGINE_ALWAYS_ON_BIKE
	jr nz, .asm_c986
	ld a, [wPlayerBikeSurfState]
	cp PLAYER_SURF
	jr z, .asm_c983
	cp PLAYER_SURF_PIKA
	jr z, .asm_c983
	call GetFacingTileCoord
	call GetTileCollision
	cp $1
	jr nz, .asm_c986
	call GetSurfDirection
	jr c, .asm_c986
	ld a, $1
	ret

.asm_c980
	ld a, $80
	ret

.asm_c983
	ld a, $3
	ret

.asm_c986
	ld a, $2
	ret

StartSurfing:
	call GetSurfType
	ld [wBuffer2], a
	call FieldMoveGetPartyNick
	ld hl, SurfFromMenuScript
	call QueueScript
	ld a, $81
	ret

CantSurf:
	ld hl, CantSurfText
	call MenuTextBoxBackup
	ld a, $80
	ret

AlreadySurfing:
	ld hl, AlreadySurfingText
	call MenuTextBoxBackup
	ld a, $80
	ret

SurfFromMenuScript:
	special UpdateTimePals
UsedSurfScript:
	writetext UsedSurfText
	waitbutton
	closetext
	copybytetovar wBuffer2
	writevarcode VAR_MOVEMENT
	special ReplacePlayerSprite
	special PlayMapMusic
	special Special_SurfStartStep
	applymovement 0, wMovementBuffer
	end

UsedSurfText:
	text_jump UsedSurfText_
	db "@"

CantSurfText:
	text_jump CantSurfText_
	db "@"

AlreadySurfingText:
	text_jump AlreadySurfingText_
	db "@"

GetSurfType: ; c9d7 (3:49d7)
	ld a, [wd005]
	ld e, a
	ld d, $0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	cp PIKACHU
	ld a, PLAYER_SURF_PIKA
	ret z
	ld a, PLAYER_SURF
	ret

GetSurfDirection: ; c9ea (3:49ea)
	ld a, [wPlayerDirection]
	and $c
	rrca
	rrca
	ld e, a
	ld d, $0
	ld hl, .Directions
	add hl, de
	ld a, [wTilePermissions]
	and [hl]
	jr nz, .asm_ca00
	xor a
	ret

.asm_ca00
	scf
	ret

.Directions:
	db FACE_DOWN
	db FACE_UP
	db FACE_LEFT
	db FACE_RIGHT

TrySurfOW::
	ld a, [wPlayerBikeSurfState]
	cp PLAYER_SURF_PIKA
	jr z, .quit
	cp PLAYER_SURF
	jr z, .quit
	ld a, [wcf29]
	call GetTileCollision
	cp $1
	jr nz, .quit
	call GetSurfDirection
	jr c, .quit
	ld de, ENGINE_FOGBADGE
	call FieldMoveEngineFlagCheck
	jr c, .quit
	ld d, SURF
	call FieldMovePartyCheck
	jr c, .quit
	CheckFlagHL ENGINE_ALWAYS_ON_BIKE
	jr nz, .quit
	call GetSurfType
	ld [wBuffer2], a
	call FieldMoveGetPartyNick
	ld a, BANK(AskSurfScript)
	ld hl, AskSurfScript
	call CallScript
	scf
	ret

.quit
	xor a
	ret
;ca4b
AskSurfScript:
	opentext
	writetext AskSurfText
	yesorno
	iftrue UsedSurfScript
	closetext
	end

AskSurfText:
	text_jump AskSurfText_
	db "@"

FlyFunction:
IF DEF(GOLD)
	dr $ca5a, $d1e2
ENDC
IF DEF(SILVER)
	dr $ca58, $d1e0
ENDC
