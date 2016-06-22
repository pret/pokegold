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
	call FieldMoveBufferReset
.asm_ca5d
	ld hl, .Jumptable
	call DoFieldMoveAction
	jr nc, .asm_ca5d
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable
	dw TryToFly
	dw RunFlyScript
	dw FailToFly

TryToFly:
	ld de, ENGINE_STORMBADGE
	call FieldMoveBadgeCheck
	jr c, .asm_caa4
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .asm_ca83
	jr .asm_caa7

.asm_ca83
	xor a
	ld [hMapAnims], a
	call LoadStandardMenuDataHeader
	call ClearSprites
	ld a, $24
	ld hl, $5a61
	rst FarCall
	ld a, e
	cp $ff
	jr z, .asm_caaa
	cp $1c
	jr nc, .asm_caaa
	ld [wceec], a
	call CloseWindow
	ld a, $1
	ret

.asm_caa4
	ld a, $82
	ret

.asm_caa7
	ld a, $2
	ret

.asm_caaa
	call CloseWindow
	call WaitBGMap
	ld a, $80
	ret

RunFlyScript:
	ld hl, FlyScript
	call QueueScript
	ld a, $81
	ret

FailToFly:
	call FieldMoveFailed
	ld a, $82
	ret

FlyScript:
	reloadmappart
	callasm HideSprites
	special UpdateTimePals
	callasm FlyFromAnimation
	farscall AbortBugCatchingContest
	special WarpToSpawnPoint
	callasm DelayLoadingNewSprites ; 1560c
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_TELEPORT
	callasm FlyToAnimation
	special WaitSFX
	special ReplacePlayerSprite
	callasm Function1415c
	end

WaterfallFunction: ; caed
	call TryWaterfall
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

TryWaterfall: ; caf6 (3:4af6)
	ld de, ENGINE_RISINGBADGE
	callba FieldMoveBadgeCheck ; same bank
	ld a, $80
	ret c
	call CheckMapCanWaterfall
	jr c, .asm_cb10
	ld hl, Script_WaterfallFromMenu
	call QueueScript
	ld a, $81
	ret

.asm_cb10
	call FieldMoveFailed
	ld a, $80
	ret

CheckMapCanWaterfall: ; cb16 (3:4b16)
	ld a, [wPlayerDirection]
	and $c
	cp FACE_UP
	jr nz, .asm_cb29
	ld a, [wTileUp]
	call CheckWaterfallTile
	jr nz, .asm_cb29
	xor a
	ret

.asm_cb29
	scf
	ret

Script_WaterfallFromMenu: ;cb2b
	reloadmappart
	special UpdateTimePals
Script_UsedWaterfall:
	callasm FieldMoveGetPartyNick
	writetext Text_UsedWaterfall
	waitbutton
	closetext
	playsound SFX_BUBBLEBEAM
.loop
	applymovement 0, WaterfallStep
	callasm CheckContinueWaterfall
	iffalse .loop
	end

WaterfallStep:
	turn_waterfall UP
	step_end

CheckContinueWaterfall: ;cb49
	xor a
	ld [wScriptVar], a
	ld a, [wPlayerStandingTile]
	call CheckWaterfallTile
	ret z
	ld a, $1
	ld [wScriptVar], a
	ret

Text_UsedWaterfall:
	text_jump Text_UsedWaterfall_
	db "@"

TryWaterfallOW:
	ld d, WATERFALL
	call FieldMovePartyCheck
	jr c, .asm_cb7d
	ld de, ENGINE_RISINGBADGE
	call FieldMoveEngineFlagCheck
	jr c, .asm_cb7d
	call CheckMapCanWaterfall
	jr c, .asm_cb7d
	ld a, BANK(Script_AskWaterfall)
	ld hl, Script_AskWaterfall
	call CallScript
	scf
	ret

.asm_cb7d
	ld a, BANK(Script_CantDoWaterfall)
	ld hl, Script_CantDoWaterfall
	call CallScript
	scf
	ret

Script_CantDoWaterfall:;cb87
	jumptext Text_CantDoWaterfall

Text_CantDoWaterfall:
	text_jump Text_CantDoWaterfall_
	db "@"

Script_AskWaterfall:
	opentext
	writetext Text_AskUseWaterfall
	yesorno
	iftrue Script_UsedWaterfall
	closetext
	end

Text_AskUseWaterfall:
	text_jump Text_AskUseWaterfall_
	db "@"

EscapeRopeFunction:
	call FieldMoveBufferReset
	ld a, $1
	jr asm_cbaa

DigFunction:
	call FieldMoveBufferReset
	ld a, $2
asm_cbaa
	ld [wBuffer2], a
.asm_cbad
	ld hl, .Jumptable
	call DoFieldMoveAction
	jr nc, .asm_cbad
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw TryEscapeFromDungeon
	dw EscapeFromDungeon
	dw FailToEscapeFromDungeon

TryEscapeFromDungeon:
	call GetMapPermission
	cp CAVE
	jr z, .asm_cbcf
	cp DUNGEON
	jr z, .asm_cbcf
.asm_cbcc
	ld a, $2
	ret

.asm_cbcf
	ld hl, wDigWarpNumber
	ld a, [hli]
	and a
	jr z, .asm_cbcc
	ld a, [hli]
	and a
	jr z, .asm_cbcc
	ld a, [hl]
	and a
	jr z, .asm_cbcc
	ld a, $1
	ret

EscapeFromDungeon:
	ld hl, wDigWarpNumber
	ld de, wLastWarpNumber
	ld bc, $3
	call CopyBytes
	call FieldMoveGetPartyNick
	ld a, [wBuffer2]
	cp $2
	jr nz, .asm_cc00
	ld hl, UsedDigScript
	call QueueScript
	ld a, $81
	ret

.asm_cc00
	ld hl, UsedEscapeRopeScript
	call QueueScript
	ld a, $81
	ret

FailToEscapeFromDungeon:
	ld a, [wBuffer2]
	cp $2
	jr nz, .asm_cc1c
	ld hl, Text_CantUseDigEscapeRopeHere ; $4c29
	call MenuTextBox
	call WaitPressAorB_BlinkCursor
	call CloseWindow
.asm_cc1c
	ld a, $80
	ret

Text_UsedDig: ; cc1f
	text_jump Text_UsedDig_
	db "@"

Text_UsedEscapeRope:
	text_jump Text_UsedEscapeRope_
	db "@"

Text_CantUseDigEscapeRopeHere:
	text_jump Text_CantUseDigEscapeRopeHere_
	db "@"

UsedEscapeRopeScript: ; cc2e	reloadmappart
	reloadmappart
	special UpdateTimePals
	writetext Text_UsedEscapeRope ; cc24
	jump ContinueDigEscapeRopeScript

UsedDigScript:
	reloadmappart
	special UpdateTimePals
	writetext Text_UsedDig
ContinueDigEscapeRopeScript:
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement PLAYER, DigOutMovementData
	farscall AbortBugCatchingContest
	special WarpToSpawnPoint
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_DOOR
	playsound SFX_WARP_FROM
	applymovement PLAYER, DigReturnMovementData
	end

DigOutMovementData:
	step_dig 32
	hide_person
	step_end

DigReturnMovementData:
	show_person
	return_dig 32
	step_end

	call FieldMoveBufferReset
.asm_cc67
	ld hl, .Jumptable
	call DoFieldMoveAction
	jr nc, .asm_cc67
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw TryTeleport
	dw DoTeleport
	dw FailTeleport

TryTeleport:
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .asm_cc85
	jr .asm_cc9c

.asm_cc85
	ld a, [wd9fb]
	ld d, a
	ld a, [wd9fc]
	ld e, a
	ld a, $5
	ld hl, $5465
	rst FarCall
	jr nc, .asm_cc9c
	ld a, c
	ld [wceec], a
	ld a, $1
	ret

.asm_cc9c
	ld a, $2
	ret

DoTeleport:
	call FieldMoveGetPartyNick
	ld hl, TeleportScript
	call QueueScript
	ld a, $81
	ret

FailTeleport:
	ld hl, Text_CantUseTeleportHere
	call MenuTextBoxBackup
	ld a, $80
	ret

Text_ReturnToLastMonCenter:
	text_jump Text_ReturnToLastMonCenter_
	db "@"

Text_CantUseTeleportHere:
	text_jump Text_CantUseTeleportHere_
	db "@"

TeleportScript: ; ccbe
	reloadmappart
	special UpdateTimePals
	writetext Text_ReturnToLastMonCenter
	pause 60
	reloadmappart
	closetext
	playsound SFX_WARP_TO
	applymovement PLAYER, TeleportFromMovementData
	farscall AbortBugCatchingContest
	special WarpToSpawnPoint
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_TELEPORT
	playsound SFX_WARP_FROM
	applymovement PLAYER, TeleportToMovementData
	end

TeleportFromMovementData: ; cce4
	teleport_from
	step_end

TeleportToMovementData:
	teleport_to
	step_end

StrengthFunction:
	call Functionccf1
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

Functionccf1: ; ccf1 (3:4cf1)
	ld de, ENGINE_PLAINBADGE
	call FieldMoveBadgeCheck
	jr c, asm_cd09
	jr asm_cd0c

	ld hl, Text_AlreadyUsingStrength
	call MenuTextBoxBackup
	ld a, $80
	ret

Text_AlreadyUsingStrength:
	text_jump Text_AlreadyUsingStrength_
	db "@"

asm_cd09
	ld a, $80
	ret

asm_cd0c
	ld hl, Script_StrengthFromMenu
	call QueueScript
	ld a, $81
	ret

GetStrengthUserSpeciesAndSetFlag:
	SetFlag ENGINE_STRENGTH_ACTIVE
	ld a, [wd005]
	ld e, a
	ld d, $0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wBuffer6], a
	call FieldMoveGetPartyNick
	ret

Script_StrengthFromMenu: ; cd2c
	reloadmappart
	special UpdateTimePals
Script_UsedStrength:
	callasm GetStrengthUserSpeciesAndSetFlag
	writetext Text_UsedStrength
	copybytetovar wBuffer6
	cry 0
	pause 3
	writetext Text_AllowedToMoveBoulders
	closetext
	end

Text_UsedStrength: ; cd44
	text_jump Text_UsedStrength_
	db "@"

Text_AllowedToMoveBoulders:
	text_jump Text_AllowedToMoveBoulders_
	db "@"

AskStrengthScript: ; cd4e
	callasm TryStrengthOW
	iffalse .ask
	if_equal 1, .not_able
	jump .already_active

.not_able
	jumptext Text_MonMayBeAbleToMove

.already_active
	jumptext Text_BouldersMayNowBeMoved

.ask
	opentext
	writetext Text_AskStrength
	yesorno
	iftrue Script_UsedStrength
	closetext
	end

Text_AskStrength:
	text_jump Text_AskStrength_
	db "@"

Text_BouldersMayNowBeMoved:
	text_jump Text_BouldersMayNowBeMoved_
	db "@"

Text_MonMayBeAbleToMove:
	text_jump Text_MonMayBeAbleToMove_
	db "@"

TryStrengthOW:
	ld d, STRENGTH
	call FieldMovePartyCheck
	jr c, .asm_cd95
	ld de, ENGINE_PLAINBADGE
	call FieldMoveEngineFlagCheck
	jr c, .asm_cd95
	CheckFlagHL ENGINE_STRENGTH_ACTIVE
	jr z, .asm_cd99
	ld a, $2
	jr .asm_cd9c

.asm_cd95
	ld a, $1
	jr .asm_cd9c

.asm_cd99
	xor a
	jr .asm_cd9c

.asm_cd9c
	ld [wScriptVar], a
	ret

WhirlpoolFunction:
	call FieldMoveBufferReset
.asm_cda3
	ld hl, .Jumptable
	call DoFieldMoveAction
	jr nc, .asm_cda3
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable
	dw TryWhirlpool
	dw DoWhirlpool
	dw FailWhirlpool

TryWhirlpool:
	ld de, ENGINE_GLACIERBADGE
	call FieldMoveBadgeCheck
	jr c, .asm_cdca
	call TryWhirlpoolMenu
	jr c, .asm_cdc7
	ld a, $1
	ret

.asm_cdc7
	ld a, $2
	ret

.asm_cdca
	ld a, $80
	ret

DoWhirlpool:
	ld hl, Script_WhirlpoolFromMenu
	call QueueScript
	ld a, $81
	ret

FailWhirlpool:
	call FieldMoveFailed
	ld a, $80
	ret

Text_UsedWhirlpool:
	text_jump Text_UsedWhirlpool_
	db "@"

TryWhirlpoolMenu: ; cde1 (3:4de1)
	call GetFacingTileCoord
	ld c, a
	push de
	call CheckWhirlpoolTile
	pop de
	jr c, .asm_ce0c
	call GetBlockLocation
	ld c, [hl]
	push hl
	ld hl, WhirlpoolBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .asm_ce0c
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

.asm_ce0c
	scf
	ret

Script_WhirlpoolFromMenu: ; 4e0e
	reloadmappart
	special UpdateTimePals
Script_UsedWhirlpool:
	callasm FieldMoveGetPartyNick
	writetext Text_UsedWhirlpool
	reloadmappart
	callasm DisappearWhirlpool
	closetext
	end

DisappearWhirlpool: ; 4e20
	ld hl, wBuffer3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wBuffer5]
	ld [hl], a
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	ld a, [wBuffer6]
	ld e, a
	callba PlayWhirlpoolSound
	call BufferScreen
	call GetMovementPermissions
	ret

TryWhirlpoolOW:
	ld d, WHIRLPOOL
	call FieldMovePartyCheck
	jr c, .asm_ce5f
	ld de, ENGINE_GLACIERBADGE
	call FieldMoveEngineFlagCheck
	jr c, .asm_ce5f
	call TryWhirlpoolMenu
	jr c, .asm_ce5f
	ld a, BANK(Script_AskWhirlpoolOW)
	ld hl, Script_AskWhirlpoolOW ; $4e71
	call CallScript
	scf
	ret

.asm_ce5f
	ld a, BANK(Script_MightyWhirlpool)
	ld hl, Script_MightyWhirlpool ; $4e69
	call CallScript
	scf
	ret

Script_MightyWhirlpool:
	jumptext Text_MightyWhirlpool

Text_MightyWhirlpool:
	text_jump Text_MightyWhirlpool_
	db "@"

Script_AskWhirlpoolOW: ; ce71
	opentext
	writetext Text_AskWhirlpool
	yesorno
	iftrue Script_UsedWhirlpool
	closetext
	end

Text_AskWhirlpool: ; ce7b
	text_jump Text_AskWhirlpool_
	db "@"

HeadbuttFunction:
	call TryHeadbuttFromMenu
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

TryHeadbuttFromMenu: ; ce89 (3:4e89)
	call GetFacingTileCoord
	call CheckHeadbuttTreeTile
	jr nz, .asm_ce9a
	ld hl, HeadbuttFromMenuScript ; $4eaa
	call QueueScript
	ld a, $81
	ret

.asm_ce9a
	call FieldMoveFailed
	ld a, $80
	ret

; ceaa
Text_DidAHeadbutt:
	text_jump Text_DidAHeadbutt_
	db "@"

Text_NothingFromHeadbutt:
	text_jump Text_NothingFromHeadbutt_
	db "@"

HeadbuttFromMenuScript:
	reloadmappart
	special UpdateTimePals
HeadbuttScript:
	callasm FieldMoveGetPartyNick
	writetext Text_DidAHeadbutt
	reloadmappart
	callasm ShakeHeadbuttTree
	callasm TreeMonEncounter
	iffalse .nope_nothing
	closetext
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

.nope_nothing:
	writetext Text_NothingFromHeadbutt
	waitbutton
	closetext
	end

TryHeadbuttOW: ; cecc
	ld d, HEADBUTT
	call FieldMovePartyCheck
	jr c, .asm_cedd
	ld a, BANK(AskHeadbuttScript)
	ld hl, AskHeadbuttScript ; $4edf
	call CallScript
	scf
	ret

.asm_cedd
	xor a
	ret

AskHeadbuttScript:
	opentext
	writetext Text_AskHeadbutt
	yesorno
	iftrue HeadbuttScript
	closetext
	end

Text_AskHeadbutt: ; cee9
	text_jump Text_AskHeadbutt_
	db "@"

	call TryRockSmashFromMenu
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

TryRockSmashFromMenu: ; cef7 (3:4ef7)
	call GetFacingObject
	jr c, .asm_cf0a
	ld a, d
	cp $18
	jr nz, .asm_cf0a
	ld hl, RockSmashFromMenuScript ; $4f31
	call QueueScript
	ld a, $81
	ret

.asm_cf0a
	call FieldMoveFailed
	ld a, $80
	ret

GetFacingObject: ; cf10 (3:4f10)
	callba CheckFacingObject
	jr nc, .asm_cf2f
	ld a, [hObjectStructIndexBuffer]
	call GetObjectStruct
	ld hl, $1
	add hl, bc
	ld a, [hl]
	ld [hLastTalked], a
	call GetMapObject
	ld hl, $4
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	ret

.asm_cf2f
	scf
	ret

RockSmashFromMenuScript: ; cf31
	reloadmappart
	special UpdateTimePals
RockSmashScript:
	callasm FieldMoveGetPartyNick
	writetext Text_UsedRockSmash
	closetext
	special WaitSFX
	playsound SFX_STRENGTH
	earthquake 84
	applymovement2 RockSmashMovementData
	disappear -2
	callasm RockMonEncounter
	copybytetovar wd117
	iffalse .skip_battle
	randomwildmon
	startbattle
	reloadmapafterbattle
.skip_battle
	end

RockSmashMovementData:
	rock_smash 10
	step_end

Text_UsedRockSmash:
	text_jump Text_UsedRockSmash_
	db "@"
; cf60
AskRockSmashScript:
	callasm TryRockSmashOW
	if_equal 1, .fail
	opentext
	writetext Text_AskRockSmash
	yesorno
	iftrue RockSmashScript
	closetext
	end
.fail
	jumptext Text_MayBeBreakable

Text_MayBeBreakable:
	text_jump Text_MayBeBreakable_
	db "@"

Text_AskRockSmash:
	text_jump Text_AskRockSmash_
	db "@"

TryRockSmashOW: ; cf7f
	ld d, ROCK_SMASH
	call FieldMovePartyCheck
	jr nc, .asm_cf8a
	ld a, $1
	jr .asm_cf8d

.asm_cf8a
	xor a
	jr .asm_cf8d

.asm_cf8d
	ld [wScriptVar], a
	ret

FishingRodFunction: ; cf91
	ld a, e
	push af
	call FieldMoveBufferReset
	pop af
	ld [wBuffer2], a
.asm_cf9a
	ld hl, .Jumptable ; $4fa8
	call DoFieldMoveAction
	jr nc, .asm_cf9a
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable
	dw Fish_CheckMap ; 3:4fb2
	dw Fish_NoBite ; 3:5005
	dw Fish_GotSomething ; 3:4ff7
	dw Fish_Failed ; 3:4ff4
	dw Fish_NoFish ; 3:5013

Fish_CheckMap:
	ld a, [wPlayerBikeSurfState]
	cp PLAYER_SURF
	jr z, .asm_cfc7
	cp PLAYER_SURF_PIKA
	jr z, .asm_cfc7
	call GetFacingTileCoord
	call GetTileCollision
	cp $1
	jr z, .asm_cfca
.asm_cfc7
	ld a, $3
	ret

.asm_cfca
	call GetFishingGroup
	and a
	jr nz, .asm_cfd3
	ld a, $4
	ret

.asm_cfd3
	ld d, a
	ld a, [wBuffer2]
	ld e, a
	ld a, $24
	ld hl, $697a
	rst FarCall
	ld a, d
	and a
	jr z, .asm_cff1
	ld [wd117], a
	ld a, e
	ld [wd040], a
	ld a, $4
	ld [wBattleType], a
	ld a, $2
	ret

.asm_cff1
	ld a, $1
	ret

Fish_Failed:
	ld a, $80
	ret

Fish_GotSomething:
	ld a, $1
	ld [wBuffer6], a
	ld hl, Script_GotABite
	call QueueScript
	ld a, $81
	ret

Fish_NoBite:
	ld a, $2
	ld [wBuffer6], a
	ld hl, Script_NotEvenANibble
	call QueueScript
	ld a, $81
	ret

Fish_NoFish:
	ld a, $0
	ld [wBuffer6], a
	ld hl, Script_NotEvenANibble2
	call QueueScript
	ld a, $81
	ret

Script_NotEvenANibble: ; d021
	scall Script_FishCastRod
	writetext Text_NotEvenANibble
	jump Script_NotEvenANibble_Continue

Script_NotEvenANibble2:
	scall Script_FishCastRod
	writetext Text_NotEvenANibble
Script_NotEvenANibble_Continue:
	callasm PutTheRodAway
	closetext
	end

Script_GotABite:
	scall Script_FishCastRod
	callasm Fish_CheckFacingUp
	iffalse .not_facing_up
	applymovement 0, Movement_Fishing_BiteFacingUp
	jump .continue

.not_facing_up
	applymovement 0, Movement_Fishing_BiteNotFacingUp
.continue
	pause 40
	applymovement 0, Movement_Fishing_RestoreRod
	writetext Text_OhABite
	callasm PutTheRodAway
	closetext
	randomwildmon
	startbattle
	reloadmapafterbattle
	end


Movement_Fishing_BiteNotFacingUp:
	fish_got_bite
	fish_got_bite
	fish_got_bite
	fish_got_bite
	show_emote
	step_end

Movement_Fishing_BiteFacingUp:
	fish_got_bite
	fish_got_bite
	fish_got_bite
	fish_got_bite
	step_sleep 1
	show_emote
	step_end

Movement_Fishing_RestoreRod:
	hide_emote
	fish_cast_rod
	step_end

Fish_CheckFacingUp: ; d06d
	ld a, [wPlayerDirection]
	and $c
	cp OW_UP
	ld a, $1
	jr z, .asm_d079
	xor a
.asm_d079
	ld [wScriptVar], a
	ret

Script_FishCastRod: ; d07d
	reloadmappart
	loadvar hBGMapMode, 0
	special UpdateTimePals
	loademote EMOTE_ROD
	callasm LoadFishingGFX
	loademote EMOTE_SHOCK
	applymovement PLAYER, Movement_CastRod
	pause 40
	end

Movement_CastRod:
	fish_cast_rod
	step_end

PutTheRodAway: ; d096
	hlcoord 1, 14
	lb bc, $3, $12
	call ClearBox
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [wPlayerAction], a
	call UpdateSprites
	call ReplacePlayerSprite
	ret

Text_OhABite:
	text_jump Text_OhABite_
	db "@"

Text_NotEvenANibble:
	text_jump Text_NotEvenANibble_
	db "@"

Text_NothingHereToFish:
	text_jump Text_NothingHereToFish_
	db "@"


	call Functiond0c9
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

Functiond0c9: ; d0c9 (3:50c9)
	call CheckBikePermission
	jr c, .cant_bike
	ld a, [wPlayerBikeSurfState]
	cp PLAYER_NORMAL
	jr z, .get_on_bike
	cp PLAYER_BIKE
	jr z, .get_off_bike
	jr .cant_bike

.get_on_bike
	ld hl, Script_GetOnBike
	ld de, Script_GetOnBike_Register
	call ChooseScriptBasedOnWhetherBikeIsRegistered
	call QueueScript
	xor a
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume
	ld de, MUSIC_BICYCLE
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	ld a, $1
	ret

.get_off_bike
	ld hl, wBikeFlags
	bit 1, [hl]
	jr nz, .asm_d118
	ld hl, Script_GetOffBike
	ld de, Script_GetOffBike_Register
	call ChooseScriptBasedOnWhetherBikeIsRegistered
	ld a, $3
	jr .queue_off

.asm_d118
	ld hl, Script_CantGetOffBike
	jr .queue_off

.cant_bike
	ld a, $0
	ret

.queue_off
	call QueueScript
	ld a, $1
	ret

ChooseScriptBasedOnWhetherBikeIsRegistered: ; d126 (3:5126)
	ld a, [wUsingItemWithSelect]
	and a
	ret z
	ld h, d
	ld l, e
	ret

CheckBikePermission: ; d12e (3:512e)
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .asm_d140
	cp CAVE
	jr z, .asm_d140
	cp GATE
	jr z, .asm_d140
	jr .asm_d149

.asm_d140
	call GetPlayerStandingTile
	and $f
	jr nz, .asm_d149
	xor a
	ret

.asm_d149
	scf
	ret

Script_GetOnBike: ; d14b
	reloadmappart
	special UpdateTimePals
	writecode VAR_MOVEMENT, PLAYER_BIKE
	writetext Text_GotOnTheBike
	waitbutton
	closetext
	special ReplacePlayerSprite
	end

Script_GetOnBike_Register:
	writecode VAR_MOVEMENT, PLAYER_BIKE
	closetext
	special ReplacePlayerSprite
	end

	nop
	ret

Script_GetOffBike:
	reloadmappart
	special UpdateTimePals
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	writetext Text_GotOffTheBike
	waitbutton
FinishGettingOffBike:
	closetext
	special ReplacePlayerSprite
	special PlayMapMusic
	end

Script_GetOffBike_Register:
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	jump FinishGettingOffBike

Script_CantGetOffBike: ; d17e
	writetext Text_CantGetOffBike
	waitbutton
	closetext
	end

Text_CantGetOffBike:
	text_jump Text_CantGetOffBike_
	db "@"

Text_GotOnTheBike:
	text_jump Text_GotOnTheBike_
	db "@"

Text_GotOffTheBike:
	text_jump Text_GotOffTheBike_
	db "@"

TryCutOW: ; d193
IF DEF(GOLD)
	dr $d193, $d1e2
ENDC
IF DEF(SILVER)
	dr $d191, $d1e0
ENDC
