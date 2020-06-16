HandleNewMap::
	call ClearUnusedMapBuffer
	call ResetMapBufferEventFlags
	call ResetFlashIfOutOfCave
	call GetCurrentMapSceneID
	call ResetBikeFlags
	ld a, MAPCALLBACK_NEWMAP
	call RunMapCallback
HandleContinueMap::
	farcall ClearCmdQueue
	ld a, MAPCALLBACK_CMDQUEUE
	call RunMapCallback
	call GetMapTimeOfDay
	ld [wMapTimeOfDay], a
	ret

LoadMapTimeOfDay::
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	farcall ReplaceTimeOfDayPals
	farcall UpdateTimeOfDayPal
	call OverworldTextModeSwitch
	call .ClearBGMap
	call .PushAttrmap
	ret

.ClearBGMap:
	ld a, HIGH(vBGMap0)
	ld [wBGMapAnchor + 1], a
	xor a ; LOW(vBGMap0)
	ld [wBGMapAnchor], a
	ldh [hSCY], a
	ldh [hSCX], a
	farcall ApplyBGMapAnchorToObjects

	ld a, "■"
	ld bc, vBGMap1 - vBGMap0
	hlbgcoord 0, 0
	call ByteFill
	ret

.PushAttrmap:
	decoord 0, 0
	call .copy
	ldh a, [hCGB]
	and a
	ret z

	decoord 0, 0, wAttrmap
	ld a, $1
	ldh [rVBK], a
.copy
	hlbgcoord 0, 0
	ld c, SCREEN_WIDTH
	ld b, SCREEN_HEIGHT
.row
	push bc
.column
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .column
	ld bc, BG_MAP_WIDTH - SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ld a, $0
	ldh [rVBK], a
	ret

LoadMapGraphics::
	call LoadMapTileset
	call LoadTilesetGFX
	xor a
	ldh [hMapAnims], a
	xor a
	ldh [hTileAnimFrame], a
	farcall RefreshSprites
	call LoadFontsExtra
	ret

LoadMapPalettes::
	ld b, $9
	jp GetSGBLayout

RefreshMapSprites::
	call ClearSprites
	call ResetBGWindow
	call GetMovementPermissions
	farcall RefreshPlayerSprite
	farcall CheckUpdatePlayerSprite
	ld hl, wPlayerSpriteSetupFlags
	bit PLAYERSPRITESETUP_SKIP_RELOAD_GFX_F, [hl]
	jr nz, .skip
	ld hl, wVramState
	set 0, [hl]
	call SafeUpdateSprites
.skip
	xor a
	ld [wPlayerSpriteSetupFlags], a
	ret

CheckMovingOffEdgeOfMap::
	ld a, [wPlayerStepDirection]
	cp STANDING
	ret z
	and a ; DOWN
	jr z, .down
	cp UP
	jr z, .up
	cp LEFT
	jr z, .left
	cp RIGHT
	jr z, .right
	and a
	ret

.down
	ld a, [wPlayerStandingMapY]
	sub 4
	ld b, a
	ld a, [wMapHeight]
	add a
	cp b
	jr z, .ok
	and a
	ret

.up
	ld a, [wPlayerStandingMapY]
	sub 4
	cp -1
	jr z, .ok
	and a
	ret

.left
	ld a, [wPlayerStandingMapX]
	sub 4
	cp -1
	jr z, .ok
	and a
	ret

.right
	ld a, [wPlayerStandingMapX]
	sub 4
	ld b, a
	ld a, [wMapWidth]
	add a
	cp b
	jr z, .ok
	and a
	ret

.ok
	scf
	ret

EnterMapConnection::
; Return carry if a connection has been entered.
	ld a, [wPlayerStepDirection]
	and a ; DOWN
	jp z, .south
	cp UP
	jp z, .north
	cp LEFT
	jp z, .west
	cp RIGHT
	jp z, .east
	ret

.west
	ld a, [wWestConnectedMapGroup]
	ld [wMapGroup], a
	ld a, [wWestConnectedMapNumber]
	ld [wMapNumber], a
	ld a, [wWestConnectionStripXOffset]
	ld [wXCoord], a
	ld a, [wWestConnectionStripYOffset]
	ld hl, wYCoord
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, wWestConnectionWindow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	srl c
	jr z, .skip_to_load
	ld a, [wWestConnectedMapWidth]
	add 6
	ld e, a
	ld d, 0

.loop
	add hl, de
	dec c
	jr nz, .loop

.skip_to_load
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
	jp .done

.east
	ld a, [wEastConnectedMapGroup]
	ld [wMapGroup], a
	ld a, [wEastConnectedMapNumber]
	ld [wMapNumber], a
	ld a, [wEastConnectionStripXOffset]
	ld [wXCoord], a
	ld a, [wEastConnectionStripYOffset]
	ld hl, wYCoord
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, wEastConnectionWindow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	srl c
	jr z, .skip_to_load2
	ld a, [wEastConnectedMapWidth]
	add 6
	ld e, a
	ld d, 0

.loop2
	add hl, de
	dec c
	jr nz, .loop2

.skip_to_load2
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
	jp .done

.north
	ld a, [wNorthConnectedMapGroup]
	ld [wMapGroup], a
	ld a, [wNorthConnectedMapNumber]
	ld [wMapNumber], a
	ld a, [wNorthConnectionStripYOffset]
	ld [wYCoord], a
	ld a, [wNorthConnectionStripXOffset]
	ld hl, wXCoord
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, wNorthConnectionWindow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 0
	srl c
	add hl, bc
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
	jp .done

.south
	ld a, [wSouthConnectedMapGroup]
	ld [wMapGroup], a
	ld a, [wSouthConnectedMapNumber]
	ld [wMapNumber], a
	ld a, [wSouthConnectionStripYOffset]
	ld [wYCoord], a
	ld a, [wSouthConnectionStripXOffset]
	ld hl, wXCoord
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, wSouthConnectionWindow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 0
	srl c
	add hl, bc
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
.done
	scf
	ret

CheckWarpTile::
	call GetDestinationWarpNumber
	ret nc

	push bc
	farcall CheckDirectionalWarp
	pop bc
	ret nc

	call CopyWarpData
	scf
	ret

WarpCheck::
	call GetDestinationWarpNumber
	ret nc
	call CopyWarpData
	ret

GetDestinationWarpNumber::
	farcall CheckWarpCollision
	ret nc

	ldh a, [hROMBank]
	push af

	call SwitchToMapScriptsBank
	call .GetDestinationWarpNumber

	pop de
	ld a, d
	rst Bankswitch
	ret

.GetDestinationWarpNumber:
	ld a, [wPlayerStandingMapY]
	sub 4
	ld e, a
	ld a, [wPlayerStandingMapX]
	sub 4
	ld d, a
	ld a, [wCurMapWarpCount]
	and a
	ret z

	ld c, a
	ld hl, wCurMapWarpsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	push hl
	ld a, [hli]
	cp e
	jr nz, .next
	ld a, [hli]
	cp d
	jr nz, .next
	jr .found_warp

.next
	pop hl
	ld a, WARP_EVENT_SIZE
	add l
	ld l, a
	jr nc, .okay
	inc h

.okay
	dec c
	jr nz, .loop
	xor a
	ret

.found_warp
	pop hl
	call .IncreaseHLTwice
	ret nc ; never encountered

	ld a, [wCurMapWarpCount]
	inc a
	sub c
	ld c, a
	scf
	ret

.IncreaseHLTwice:
	inc hl
	inc hl
	scf
	ret

CopyWarpData::
	ldh a, [hROMBank]
	push af

	call SwitchToMapScriptsBank
	call .CopyWarpData

	pop af
	rst Bankswitch
	scf
	ret

.CopyWarpData:
	push bc
	ld hl, wCurMapWarpsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	dec a
	ld bc, WARP_EVENT_SIZE
	call AddNTimes
	ld bc, 2 ; warp number
	add hl, bc
	ld a, [hli]
	cp -1
	jr nz, .skip
	ld hl, wBackupWarpNumber
	ld a, [hli]

.skip
	pop bc
	ld [wNextWarp], a
	ld a, [hli]
	ld [wNextMapGroup], a
	ld a, [hli]
	ld [wNextMapNumber], a

	ld a, c
	ld [wPrevWarp], a
	ld a, [wMapGroup]
	ld [wPrevMapGroup], a
	ld a, [wMapNumber]
	ld [wPrevMapNumber], a
	scf
	ret

EnterMapWarp::
	call .SaveDigWarp
	call .SetSpawn
	ld a, [wNextWarp]
	ld [wWarpNumber], a
	ld a, [wNextMapGroup]
	ld [wMapGroup], a
	ld a, [wNextMapNumber]
	ld [wMapNumber], a
	ret

.SaveDigWarp::
	call GetMapEnvironment
	call CheckOutdoorMap
	ret nz
	ld a, [wNextMapGroup]
	ld b, a
	ld a, [wNextMapNumber]
	ld c, a
	call GetAnyMapEnvironment
	call CheckIndoorMap
	ret nz

; MOUNT_MOON_SQUARE and TIN_TOWER_ROOF are outdoor maps within indoor maps.
; Dig and Escape Rope should not take you to them.
	ld a, [wPrevMapGroup]
	cp GROUP_MOUNT_MOON_SQUARE ; aka GROUP_TIN_TOWER_ROOF
	jr nz, .not_mt_moon_or_tin_tower
	ld a, [wPrevMapNumber]
	cp MAP_MOUNT_MOON_SQUARE
	ret z
	cp MAP_TIN_TOWER_ROOF
	ret z
.not_mt_moon_or_tin_tower

	ld a, [wPrevWarp]
	ld [wDigWarpNumber], a
	ld a, [wPrevMapGroup]
	ld [wDigMapGroup], a
	ld a, [wPrevMapNumber]
	ld [wDigMapNumber], a
	ret

.SetSpawn:
	call GetMapEnvironment
	call CheckOutdoorMap
	ret nz
	ld a, [wNextMapGroup]
	ld b, a
	ld a, [wNextMapNumber]
	ld c, a
	call GetAnyMapEnvironment
	call CheckIndoorMap
	ret nz
	ld a, [wNextMapGroup]
	ld b, a
	ld a, [wNextMapNumber]
	ld c, a

; Respawn in Pokémon Centers.
	call GetAnyMapTileset
	ld a, c
	cp TILESET_POKECENTER
	ret nz

.pokecenter
	ld a, [wPrevMapGroup]
	ld [wLastSpawnMapGroup], a
	ld a, [wPrevMapNumber]
	ld [wLastSpawnMapNumber], a
	ret
