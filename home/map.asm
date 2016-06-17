Clear_wc6e8:: ; 1f5d (0:1f5d)
	ld hl, wc6e8
	ld bc, $18
	ld a, $0
	call ByteFill
	ret

CheckTriggers:: ; 1f69 (0:1f69)
	push hl
	ld hl, wCurrentMapTriggerPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ld a, [hl]
	jr nz, .asm_1f76
	ld a, $ff
.asm_1f76
	pop hl
	ret

GetCurrentMapTrigger:: ; 1f78 (0:1f78)
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	xor a
	ld [wCurrentMapTriggerPointer], a
	ld [wCurrentMapTriggerPointer + 1], a
	call GetMapTrigger
	ret c
	ld a, e
	ld [wCurrentMapTriggerPointer], a
	ld a, d
	ld [wCurrentMapTriggerPointer + 1], a
	xor a
	ret

GetMapTrigger:: ; 1f95 (0:1f95)
	push bc
	ld a, [hROMBank]
	push af
	ld a, BANK(MapTriggers)
	rst Bankswitch
	ld hl, MapTriggers
.asm_1f9f
	push hl
	ld a, [hli]
	cp $ff
	jr z, .asm_1fb5
	cp b
	jr nz, .asm_1fae
	ld a, [hli]
	cp c
	jr nz, .asm_1fae
	jr .asm_1fb8

.asm_1fae
	pop hl
	ld de, $4
	add hl, de
	jr .asm_1f9f

.asm_1fb5
	scf
	jr .asm_1fbb

.asm_1fb8
	ld e, [hl]
	inc hl
	ld d, [hl]
.asm_1fbb
	pop hl
	pop bc
	ld a, b
	rst Bankswitch
	pop bc
	ret

OverworldTextModeSwitch:: ; 1fc1 (0:1fc1)
	call LoadMapPart
	call FarCallSwapTextboxPalettes
	ret

LoadMapPart:: ; 1fc8 (0:1fc8)
	ld a, [hROMBank]
	push af
	ld a, [wTilesetBlocksBank]
	rst Bankswitch
	call LoadMetatiles
	ld a, $60
	ld hl, wTileMap
	ld bc, $168
	call ByteFill
	ld a, $5
	rst Bankswitch
	call $538d
	pop af
	rst Bankswitch
	ret

LoadMetatiles:: ; 1fe6 (0:1fe6)
	; de <- wOverworldMapAnchor
	ld a, [wOverworldMapAnchor]
	ld e, a
	ld a, [wOverworldMapAnchor + 1]
	ld d, a
	ld hl, wMisc
	ld b, WMISC_HEIGHT / 4 ; 5

.row
	push de
	push hl
	ld c, WMISC_WIDTH / 4 ; 6

.col
	push de
	push hl
	; Load the current map block.
	; If the current map block is a border block, load the border block.
	ld a, [de]
	and a
	jr nz, .ok
	ld a, [wMapBorderBlock]

.ok
	; Load the current wMisc address into de.
	ld e, l
	ld d, h
	; Set hl to the address of the current metatile data ([TilesetBlocksAddress] + (a) tiles).
	add a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, [wTilesetBlocksAddress]
	add l
	ld l, a
	ld a, [wTilesetBlocksAddress + 1]
	adc h
	ld h, a

	; copy the 4x4 metatile
rept 3
rept 4
	ld a, [hli]
	ld [de], a
	inc de
endr
	ld a, e
	add WMISC_WIDTH - 4
	ld e, a
	jr nc, .next\@
	inc d
.next\@
endr
rept 4
	ld a, [hli]
	ld [de], a
	inc de
endr
	; Next metatile
	pop hl
	ld de, 4
	add hl, de
	pop de
	inc de
	dec c
	jp nz, .col
	; Next metarow
	pop hl
	ld de, WMISC_WIDTH * 4
	add hl, de
	pop de
	ld a, [wMapWidth]
	add 6
	add e
	ld e, a
	jr nc, .ok2
	inc d
.ok2
	dec b
	jp nz, .row
	ret

ReturnToMapFromSubmenu::
	ld a, $fa
	ld [hMapEntryMethod], a
	callba RunMapSetupScript
	xor a
	ld [hMapEntryMethod], a
	ret

Function2086::
	call Clear_wc6e8
	call Function2f10
	call Function2f1d
	call GetCurrentMapTrigger
	call Function2f16
	ld a, $5
	call RunMapCallback
	callba Function97c2a
	ld a, $3
	call RunMapCallback
	call GetMapHeaderTimeOfDayNybble
	ld [wMapTimeOfDay], a
	ret

Function20ac::
	ld a, $1
	ld [wRTCEnabled], a
	callba Function8c3e9
	callba UpdateTimeOfDayPal
	call OverworldTextModeSwitch
	call Function20c7
	call Function20e6
	ret

Function20c7:: ; 20c7 (0:20c7)
	ld a, $98
	ld [wd05c], a
	xor a
	ld [wd05b], a
	ld [hSCY], a
	ld [hSCX], a
	callba Function58c5
	ld a, $60
	ld bc, $400
	ld hl, $9800
	call ByteFill
	ret

Function20e6:: ; 20e6 (0:20e6)
	decoord 0, 0
	call Function20f7
	ld a, [hCGB]
	and a
	ret z
	decoord 0, 0, wAttrMap
	ld a, $1
	ld [rVBK], a
Function20f7:: ; 20f7 (0:20f7)
	ld hl, $9800
	ld c, $14
	ld b, $12
.asm_20fe
	push bc
.asm_20ff
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_20ff
	ld bc, $c
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_20fe
	ld a, $0
	ld [rVBK], a
	ret

Function2112::
	call LoadTilesetHeader
	call LoadTileset
	xor a
	ld [hMapAnims], a
	xor a
	ld [hTileAnimFrame], a
	callba Function1416d
	call Functiondac
	ret

Function2128::
	ld b, $9
	jp Function3583

Function212d::
	call Function30ff
	call ResetBGWindow
	call GetMovementPermissions
	callba Function5730
	callba Function15612
	ld hl, wd182
	bit 6, [hl]
	jr nz, .asm_2151
	ld hl, wVramState
	set 0, [hl]
	call Function2ef1
.asm_2151
	xor a
	ld [wd182], a
	ret

Function2156::
	ld a, [wce86]
	cp $ff
	ret z
	and a
	jr z, .asm_216d
	cp $1
	jr z, .asm_217c
	cp $2
	jr z, .asm_2187
	cp $3
	jr z, .asm_2192
	and a
	ret

.asm_216d
	ld a, [wPlayerStandingMapY]
	sub $4
	ld b, a
	ld a, [wd087]
	add a
	cp b
	jr z, .asm_21a1
	and a
	ret

.asm_217c
	ld a, [wPlayerStandingMapY]
	sub $4
	cp $ff
	jr z, .asm_21a1
	and a
	ret

.asm_2187
	ld a, [wPlayerStandingMapX]
	sub $4
	cp $ff
	jr z, .asm_21a1
	and a
	ret

.asm_2192
	ld a, [wPlayerStandingMapX]
	sub $4
	ld b, a
	ld a, [wMapWidth]
	add a
	cp b
	jr z, .asm_21a1
	and a
	ret

.asm_21a1
	scf
	ret

Function21a3::
	ld a, [wce86]
	and a
	jp z, Function2263
	cp $1
	jp z, Function2232
	cp $2
	jp z, Function21ba
	cp $3
	jp z, Function21f6
	ret

Function21ba:: ; 21ba (0:21ba)
	ld a, [wd0aa]
	ld [wMapGroup], a
	ld a, [wd0ab]
	ld [wMapNumber], a
	ld a, [wd0b3]
	ld [wda03], a
	ld a, [wd0b2]
	ld hl, wda02
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, wd0b4
	ld a, [hli]
	ld h, [hl]
	ld l, a
	srl c
	jr z, .asm_21eb
	ld a, [wd0b1]
	add $6
	ld e, a
	ld d, $0
.asm_21e7
	add hl, de
	dec c
	jr nz, .asm_21e7
.asm_21eb
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
	jp Function2291

Function21f6:: ; 21f6 (0:21f6)
	ld a, [wd0b6]
	ld [wMapGroup], a
	ld a, [wd0b7]
	ld [wMapNumber], a
	ld a, [wd0bf]
	ld [wda03], a
	ld a, [wd0be]
	ld hl, wda02
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, wd0c0
	ld a, [hli]
	ld h, [hl]
	ld l, a
	srl c
	jr z, .asm_2227
	ld a, [wd0bd]
	add $6
	ld e, a
	ld d, $0
.asm_2223
	add hl, de
	dec c
	jr nz, .asm_2223
.asm_2227
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
	jp Function2291

Function2232:: ; 2232 (0:2232)
	ld a, [wd092]
	ld [wMapGroup], a
	ld a, [wd093]
	ld [wMapNumber], a
	ld a, [wd09a]
	ld [wda02], a
	ld a, [wd09b]
	ld hl, wda03
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, wd09c
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $0
	srl c
	add hl, bc
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
	jp Function2291

Function2263:: ; 2263 (0:2263)
	ld a, [wd09e]
	ld [wMapGroup], a
	ld a, [wd09f]
	ld [wMapNumber], a
	ld a, [wd0a6]
	ld [wda02], a
	ld a, [wd0a7]
	ld hl, wda03
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, wd0a8
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $0
	srl c
	add hl, bc
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
Function2291:: ; 2291 (0:2291)
	scf
	ret

Function2293::
	call Function22ad
	ret nc
	push bc
	callba Function14a2d
	pop bc
	ret nc
	call Function2302
	scf
	ret

Function22a5::
	call Function22ad
	ret nc
	call Function2302
	ret

Function22ad:: ; 22ad (0:22ad)
	callba Function14a18
	ret nc
	ld a, [hROMBank]
	push af
	call SwitchToMapScriptHeaderBank
	call Function22c1
	pop de
	ld a, d
	rst Bankswitch
	ret

Function22c1:: ; 22c1 (0:22c1)
	ld a, [wPlayerStandingMapY]
	sub $4
	ld e, a
	ld a, [wPlayerStandingMapX]
	sub $4
	ld d, a
	ld a, [wd945]
	and a
	ret z
	ld c, a
	ld hl, wd946
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_22d9
	push hl
	ld a, [hli]
	cp e
	jr nz, .asm_22e4
	ld a, [hli]
	cp d
	jr nz, .asm_22e4
	jr .asm_22f1

.asm_22e4
	pop hl
	ld a, $5
	add l
	ld l, a
	jr nc, .asm_22ec
	inc h
.asm_22ec
	dec c
	jr nz, .asm_22d9
	xor a
	ret

.asm_22f1
	pop hl
	call Function22fe
	ret nc
	ld a, [wd945]
	inc a
	sub c
	ld c, a
	scf
	ret

Function22fe:: ; 22fe (0:22fe)
	inc hl
	inc hl
	scf
	ret

Function2302:: ; 2302 (0:2302)
	ld a, [hROMBank]
	push af
	call SwitchToMapScriptHeaderBank
	call Function230f
	pop af
	rst Bankswitch
	scf
	ret

Function230f:: ; 230f (0:230f)
	push bc
	ld hl, wd946
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	dec a
	ld bc, $5
	call Function31a3
	ld bc, $2
	add hl, bc
	ld a, [hli]
	cp $ff
	jr nz, .asm_232b
	ld hl, wd9f5
	ld a, [hli]
.asm_232b
	pop bc
	ld [wd043], a
	ld a, [hli]
	ld [wd044], a
	ld a, [hli]
	ld [wd045], a
	ld a, c
	ld [wd046], a
	ld a, [wMapGroup]
	ld [wd047], a
	ld a, [wMapNumber]
	ld [wd048], a
	scf
	ret

Function2349::
	call Function2362
	call Function239b
	ld a, [wd043]
	ld [wd9ff], a
	ld a, [wd044]
	ld [wMapGroup], a
	ld a, [wd045]
	ld [wMapNumber], a
	ret

Function2362:: ; 2362 (0:2362)
	call GetMapPermission
	call CheckOutdoorMap
	ret nz
	ld a, [wd044]
	ld b, a
	ld a, [wd045]
	ld c, a
	call GetAnyMapPermission
	call CheckIndoorMap
	ret nz
	ld a, [wd047]
	cp $f
	jr nz, .asm_2388
	ld a, [wd048]
	cp $a
	ret z
	cp $c
	ret z
.asm_2388
	ld a, [wd046]
	ld [wd9f2], a
	ld a, [wd047]
	ld [wd9f3], a
	ld a, [wd048]
	ld [wd9f4], a
	ret

Function239b:: ; 239b (0:239b)
	call GetMapPermission
	call CheckOutdoorMap
	ret nz
	ld a, [wd044]
	ld b, a
	ld a, [wd045]
	ld c, a
	call GetAnyMapPermission
	call CheckIndoorMap
	ret nz
	ld a, [wd044]
	ld b, a
	ld a, [wd045]
	ld c, a
	call GetAnyMapTileset
	ld a, c
	cp $6
	ret nz
	ld a, [wd047]
	ld [wd9fb], a
	ld a, [wd048]
	ld [wd9fc], a
	ret

CheckOutdoorMap:: ; 23cd (0:23cd)
	cp ROUTE
	ret z
	cp TOWN
	ret

CheckIndoorMap:: ; 23d3 (0:23d3)
	cp INDOOR
	ret z
	cp CAVE
	ret z
	cp DUNGEON
	ret z
	cp GATE
	ret

CheckDungeonMap::
	cp INDOOR
	ret z
	cp GATE
	ret z
	cp PERM_5
	ret

LoadMapAttributes::
	call CopyMapHeaders
	call SwitchToMapScriptHeaderBank
	call ReadMapScripts
	xor a
	call ReadMapEventHeader
	ret

LoadMapAttributes_SkipPeople::
	call CopyMapHeaders
	call SwitchToMapScriptHeaderBank
	call ReadMapScripts
	ld a, $1
	call ReadMapEventHeader
	ret

CopyMapHeaders:: ; 2405 (0:2405)
	call PartiallyCopyMapHeader
	call SwitchToMapBank
	call GetSecondaryMapHeaderPointer
	call CopySecondMapHeader
	call GetMapConnections
	ret

ReadMapEventHeader:: ; 2415 (0:2415)
	push af
	ld hl, wd08f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	call ReadWarps
	call ReadCoordEvents
	call ReadSignposts
	pop af
	and a
	ret nz
	call ReadObjectEvents
	ret

ReadMapScripts:: ; 242e (0:242e)
	ld hl, wd08d
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ReadMapTriggers
	call ReadMapCallbacks
	ret

CopySecondMapHeader:: ; 243b (0:243b)
	ld de, wMapBorderBlock
	ld c, $c
.asm_2440
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2440
	ret

GetMapConnections:: ; 2447 (0:2447)
	ld a, $ff
	ld [wd092], a
	ld [wd09e], a
	ld [wd0aa], a
	ld [wd0b6], a
	ld a, [wd091]
	ld b, a
	bit 3, b
	jr z, .asm_2463
	ld de, wd092
	call GetMapConnection
.asm_2463
	bit 2, b
	jr z, .asm_246d
	ld de, wd09e
	call GetMapConnection
.asm_246d
	bit 1, b
	jr z, .asm_2477
	ld de, wd0aa
	call GetMapConnection
.asm_2477
	bit 0, b
	jr z, .asm_2481
	ld de, wd0b6
	call GetMapConnection
.asm_2481
	ret

GetMapConnection:: ; 2482 (0:2482)
	ld c, $c
.asm_2484
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2484
	ret

ReadMapTriggers:: ; 248b (0:248b)
	ld a, [hli]
	ld c, a
	ld [wd951], a
	ld a, l
	ld [wd952], a
	ld a, h
	ld [wd953], a
	ld a, c
	and a
	ret z
	ld bc, $4
	call Function31a3
	ret

ReadMapCallbacks:: ; 24a2 (0:24a2)
	ld a, [hli]
	ld c, a
	ld [wd954], a
	ld a, l
	ld [wd955], a
	ld a, h
	ld [wd956], a
	ld a, c
	and a
	ret z
	ld bc, $3
	call Function31a3
	ret

ReadWarps:: ; 24b9 (0:24b9)
	ld a, [hli]
	ld c, a
	ld [wd945], a
	ld a, l
	ld [wd946], a
	ld a, h
	ld [wd947], a
	ld a, c
	and a
	ret z
	ld bc, $5
	call Function31a3
	ret

ReadCoordEvents:: ; 24d0 (0:24d0)
	ld a, [hli]
	ld c, a
	ld [wd948], a
	ld a, l
	ld [wd949], a
	ld a, h
	ld [wd94a], a
	ld a, c
	and a
	ret z
	ld bc, $8
	call Function31a3
	ret

ReadSignposts:: ; 24e7 (0:24e7)
	ld a, [hli]
	ld c, a
	ld [wd94b], a
	ld a, l
	ld [wd94c], a
	ld a, h
	ld [wd94d], a
	ld a, c
	and a
	ret z
	ld bc, $5
	call Function31a3
	ret

ReadObjectEvents:: ; 24fe (0:24fe)
	push hl
	call ClearObjectStructs
	pop de
	ld hl, wMap2Object
	ld a, [de]
	inc de
	ld [wd94e], a
	ld a, e
	ld [wd94f], a
	ld a, d
	ld [wd950], a
	ld a, [wd94e]
	call CopyMapObjectHeaders
	ld a, [wd94e]
	ld c, a
	ld a, $10
	sub c
	jr z, .asm_2533
	ld bc, $1
	add hl, bc
	ld bc, $10
.asm_2529
	ld [hl], $0
	inc hl
	ld [hl], $ff
	dec hl
	add hl, bc
	dec a
	jr nz, .asm_2529
.asm_2533
	ld h, d
	ld l, e
	ret

CopyMapObjectHeaders:: ; 2536 (0:2536)
	and a
	ret z
	ld c, a
.asm_2539
	push bc
	push hl
	ld a, $ff
	ld [hli], a
	ld b, $d
.asm_2540
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_2540
	pop hl
	ld bc, $10
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_2539
	ret

ClearObjectStructs:: ; 2550 (0:2550)
	ld hl, wObject1Struct
	ld bc, $1e0
	xor a
	call ByteFill
	ld hl, wObject1Struct
	ld de, $28
	ld c, $c
	xor a
.asm_2563
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_2563
	ret

RestoreFacingAfterWarp::
	call GetMapScriptHeaderBank
	rst Bankswitch
	ld hl, wd08f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld a, [wd9ff]
	dec a
	ld c, a
	ld b, $0
	ld a, $5
	call Function31a3
	ld a, [hli]
	ld [wda02], a
	ld a, [hli]
	ld [wda03], a
	ld a, [hli]
	cp $ff
	jr nz, .asm_2592
	call BackUpWarp
.asm_2592
	call GetCoordOfUpperLeftCorner
	ret

BackUpWarp:: ; 2596 (0:2596)
	ld a, [wd046]
	ld [wd9f5], a
	ld a, [wd047]
	ld [wd9f6], a
	ld a, [wd048]
	ld [wd9f7], a
	ret

GetCoordOfUpperLeftCorner:: ; 25a9 (0:25a9)
	ld hl, wc700
	ld a, [wda03]
	bit 0, a
	jr nz, .asm_25b9
	srl a
	add $1
	jr .asm_25bd

.asm_25b9
	add $1
	srl a
.asm_25bd
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wMapWidth]
	add $6
	ld c, a
	ld b, $0
	ld a, [wda02]
	bit 0, a
	jr nz, .asm_25d6
	srl a
	add $1
	jr .asm_25da

.asm_25d6
	add $1
	srl a
.asm_25da
	call Function31a3
	ld a, l
	ld [wOverworldMapAnchor], a
	ld a, h
	ld [wOverworldMapAnchor + 1], a
	ld a, [wda02]
	and $1
	ld [wd07f], a
	ld a, [wda03]
	and $1
	ld [wd080], a
	ret

LoadBlockData::
	ld hl, wOverworldMap
	ld bc, wOverworldMapEnd - wOverworldMap
	ld a, $0
	call ByteFill
	call ChangeMap
	call FillMapConnections
	ld a, $1
	call RunMapCallback
	ret

ChangeMap:: ; 260d (0:260d)
	ld a, [hROMBank]
	push af
	ld hl, wc700
	ld a, [wMapWidth]
	ld [hObjectStructIndexBuffer], a
	add $6
	ld [hConnectionStripLength], a
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	add hl, bc
	ld c, $3
	add hl, bc
	ld a, [wd089]
	rst Bankswitch
	ld a, [wd08a]
	ld e, a
	ld a, [wd08b]
	ld d, a
	ld a, [wd087]
	ld b, a
.asm_2635
	push hl
	ld a, [hObjectStructIndexBuffer]
	ld c, a
.asm_2639
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_2639
	pop hl
	ld a, [hMapObjectIndexBuffer]
	add l
	ld l, a
	jr nc, .asm_2647
	inc h
.asm_2647
	dec b
	jr nz, .asm_2635
	pop af
	rst Bankswitch
	ret

FillMapConnections:: ; 264d (0:264d)
	ld a, [wd092]
	cp $ff
	jr z, .asm_2679
	ld b, a
	ld a, [wd093]
	ld c, a
	call GetAnyMapBlockdataBank
	ld a, [wd094]
	ld l, a
	ld a, [wd095]
	ld h, a
	ld a, [wd096]
	ld e, a
	ld a, [wd097]
	ld d, a
	ld a, [wd098]
	ld [hConnectionStripLength], a
	ld a, [wd099]
	ld [hObjectStructIndexBuffer], a
	call FillNorthConnectionStrip
.asm_2679
	ld a, [wd09e]
	cp $ff
	jr z, .asm_26a5
	ld b, a
	ld a, [wd09f]
	ld c, a
	call GetAnyMapBlockdataBank
	ld a, [wd0a0]
	ld l, a
	ld a, [wd0a1]
	ld h, a
	ld a, [wd0a2]
	ld e, a
	ld a, [wd0a3]
	ld d, a
	ld a, [wd0a4]
	ld [hConnectionStripLength], a
	ld a, [wd0a5]
	ld [hObjectStructIndexBuffer], a
	call FillSouthConnectionStrip
.asm_26a5
	ld a, [wd0aa]
	cp $ff
	jr z, .asm_26d0
	ld b, a
	ld a, [wd0ab]
	ld c, a
	call GetAnyMapBlockdataBank
	ld a, [wd0ac]
	ld l, a
	ld a, [wd0ad]
	ld h, a
	ld a, [wd0ae]
	ld e, a
	ld a, [wd0af]
	ld d, a
	ld a, [wd0b0]
	ld b, a
	ld a, [wd0b1]
	ld [hConnectionStripLength], a
	call FillWestConnectionStrip
.asm_26d0
	ld a, [wd0b6]
	cp $ff
	jr z, .asm_26fb
	ld b, a
	ld a, [wd0b7]
	ld c, a
	call GetAnyMapBlockdataBank
	ld a, [wd0b8]
	ld l, a
	ld a, [wd0b9]
	ld h, a
	ld a, [wd0ba]
	ld e, a
	ld a, [wd0bb]
	ld d, a
	ld a, [wd0bc]
	ld b, a
	ld a, [wd0bd]
	ld [hConnectionStripLength], a
	call FillEastConnectionStrip
.asm_26fb
	ret

FillNorthConnectionStrip:: ; 26fc (0:26fc)
FillSouthConnectionStrip:: ; 26fc (0:26fc)
	ld c, $3
.asm_26fe
	push de
	push hl
	ld a, [hMapObjectIndexBuffer]
	ld b, a
.asm_2703
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_2703
	pop hl
	ld a, [hObjectStructIndexBuffer]
	ld e, a
	ld d, $0
	add hl, de
	pop de
	ld a, [wMapWidth]
	add $6
	add e
	ld e, a
	jr nc, .asm_271b
	inc d
.asm_271b
	dec c
	jr nz, .asm_26fe
	ret

FillWestConnectionStrip:: ; 271f (0:271f)
FillEastConnectionStrip:: ; 271f (0:271f)
	ld a, [wMapWidth]
	add $6
	ld [hConnectedMapWidth], a
	push de
	push hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop hl
	ld a, [hMapObjectIndexBuffer]
	ld e, a
	ld d, $0
	add hl, de
	pop de
	ld a, [hConnectedMapWidth]
	add e
	ld e, a
	jr nc, .asm_2740
	inc d
.asm_2740
	dec b
	jr nz, FillWestConnectionStrip
	ret

LoadMapStatus::
	ld [wd159], a
	ret

CallScript::
	ld [wd160], a
	ld a, l
	ld [wd161], a
	ld a, h
	ld [wd162], a
	ld a, $ff
	ld [wd15f], a
	scf
	ret

CallMapScript::
	ld a, [wd15f]
	and a
	ret nz
	call GetMapScriptHeaderBank
	jr CallScript

RunMapCallback:: ; 2764 (0:2764)
	ld b, a
	ld a, [hROMBank]
	push af
	call SwitchToMapScriptHeaderBank
	call FindCallback
	jr nc, .asm_2779
	call GetMapScriptHeaderBank
	ld b, a
	ld d, h
	ld e, l
	call ExecuteCallbackScript
.asm_2779
	pop af
	rst Bankswitch
	ret

FindCallback:: ; 277c (0:277c)
	ld a, [wd954]
	ld c, a
	and a
	ret z
	ld hl, wd955
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld de, $3
.asm_278d
	ld a, [hl]
	cp b
	jr z, .asm_2797
	add hl, de
	dec c
	jr nz, .asm_278d
	xor a
	ret

.asm_2797
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	scf
	ret

ExecuteCallbackScript:: ; 279d (0:279d)
	callba CallCallback
	ld a, [wd15e]
	push af
	ld hl, wd15b
	ld a, [hl]
	push af
	set 1, [hl]
	callba EnableScriptMode
	callba ScriptEvents
	pop af
	ld [wd15b], a
	pop af
	ld [wd15e], a
	ret

MapTextbox::
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch
	call SetUpTextBox
	ld a, $1
	ld [hOAMUpdate], a
	call PrintTextBoxText
	xor a
	ld [hOAMUpdate], a
	pop af
	rst Bankswitch
	ret

Call_a_de::
	ld [wBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [wBuffer]
	rst Bankswitch
	call .de
	pop af
	rst Bankswitch
	ret

.de
	push de
	ret

GetMovementData::
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch
	ld a, c
	call LoadMovementDataPointer
	pop hl
	ld a, h
	rst Bankswitch
	ret

GetScriptByte::
	push hl
	push bc
	ld a, [hROMBank]
	push af
	ld a, [wd160]
	rst Bankswitch
	ld hl, wd161
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, [bc]
	inc bc
	ld [hl], b
	dec hl
	ld [hl], c
	ld b, a
	pop af
	rst Bankswitch
	ld a, b
	pop bc
	pop hl
	ret

ObjectEvent::
	jumptextfaceplayer ObjectEventText

ObjectEventText::
	text_jump ObjectEventText_
	db "@"

BGEvent::
	jumptext BGEventText

BGEventText::
	text_jump BGEventText_
	db "@"

CoordinatesEvent::
	jumptext CoordinatesEventText

CoordinatesEventText::
	text_jump CoordinatesEventText_
	db "@"

CheckObjectMask::
	ld a, [hMapObjectIndexBuffer]
.asm_282c
	ld e, a
	ld d, $0
	ld hl, MapObjectsEnd
	add hl, de
	ld a, [hl]
.asm_2834
	ret

MaskObject:: ; 2835 (0:2835)
	ld a, [hConnectionStripLength]
	ld e, a
	ld d, $0
	ld hl, wd545
.asm_283c
	add hl, de
	ld [hl], $ff
	ret

UnmaskObject:: ; 2841 (0:2841)
	ld a, [hMapObjectIndexBuffer]
	ld e, a
	ld d, $0
	ld hl, MapObjectsEnd
	add hl, de
	ld [hl], $0
	ret

ScrollMapDown::
	hlcoord 0, 0
	ld de, wBGMapBuffer
	call BackupBGMapRow
	ld c, $28
	call FarCallScrollBGMapPalettes
	ld a, [wd05b]
	ld e, a
	ld a, [wd05c]
	ld d, a
	call UpdateBGMapRow
	ld a, $1
	ld [hBGMapUpdate], a
	ret

ScrollMapUp::
	hlcoord 0, 16
	ld de, wBGMapBuffer
	call BackupBGMapRow
	ld c, $28
	call FarCallScrollBGMapPalettes
	ld a, [wd05b]
	ld l, a
	ld a, [wd05c]
	ld h, a
	ld bc, $200
	add hl, bc
	ld a, h
	and $3
	or $98
	ld e, l
	ld d, a
	call UpdateBGMapRow
	ld a, $1
	ld [hBGMapUpdate], a
	ret

ScrollMapRight::
	ld hl, wTileMap
	ld de, wBGMapBuffer
	call BackupBGMapColumn
	ld c, $24
	call FarCallScrollBGMapPalettes
	ld a, [wd05b]
	ld e, a
	ld a, [wd05c]
	ld d, a
	call UpdateBGMapColumn
	ld a, $1
	ld [hBGMapUpdate], a
	ret

ScrollMapLeft::
	hlcoord 18, 0
	ld de, wBGMapBuffer
	call BackupBGMapColumn
	ld c, $24
	call FarCallScrollBGMapPalettes
	ld a, [wd05b]
	ld e, a
	and $e0
	ld b, a
	ld a, e
	add $12
	and $1f
	or b
	ld e, a
	ld a, [wd05c]
	ld d, a
	call UpdateBGMapColumn
	ld a, $1
	ld [hBGMapUpdate], a
	ret

BackupBGMapRow:: ; 28da (0:28da)
	ld c, $28
.asm_28dc
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_28dc
	ret

BackupBGMapColumn:: ; 28e3 (0:28e3)
	ld c, $12
.asm_28e5
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, $13
	add l
	ld l, a
	jr nc, .asm_28f2
	inc h
.asm_28f2
	dec c
	jr nz, .asm_28e5
	ret

UpdateBGMapRow:: ; 28f6 (0:28f6)
	ld hl, wBGMapBufferPtrs
	push de
	call .iteration
	pop de
	ld a, $20
	add e
	ld e, a
.iteration
	ld c, $a
.asm_2904
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	inc a
	inc a
	and $1f
	ld b, a
	ld a, e
	and $e0
	or b
	ld e, a
	dec c
	jr nz, .asm_2904
	ld a, $14
	ld [hFFDE], a
	ret

UpdateBGMapColumn:: ; 291b (0:291b)
	ld hl, wBGMapBufferPtrs
	ld c, $12
.asm_2920
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $20
	add e
	ld e, a
	jr nc, .asm_2931
	inc d
	ld a, d
	and $3
	or $98
	ld d, a
.asm_2931
	dec c
	jr nz, .asm_2920
	ld a, $12
	ld [hFFDE], a
	ret

Function2939::
	ld hl, wBGMapBuffer
	ld bc, $78
	xor a
	call ByteFill
	ret

LoadTileset:: ; 2944 (0:2944)
	ld hl, wd0c3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $9000
	ld a, [wd0c2]
	call FarDecompress
	ld a, [wd082]
	cp $1
	jr z, .asm_2960
	cp $2
	jr z, .asm_2960
	jr .asm_2966

.asm_2960
	callba LoadMapGroupRoof
.asm_2966
	xor a
	ld [hTileAnimFrame], a
	ret

BufferScreen::
	ld hl, wOverworldMapAnchor
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wda04
	ld c, $5
	ld b, $6
.asm_2977
	push bc
	push hl
.asm_2979
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_2979
	pop hl
	ld a, [wMapWidth]
	add $6
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_2977
	ret

SaveScreen::
	ld hl, wOverworldMapAnchor
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wda04
	ld a, [wMapWidth]
	add $6
	ld [hConnectionStripLength], a
	ld a, [wce86]
	and a
	jr z, .asm_29bc
	cp $1
	jr z, .asm_29b1
	cp $2
	jr z, .asm_29c5
	cp $3
	jr z, .asm_29cb
	ret

.asm_29b1
	ld de, wda0a
	ld a, [hConnectionStripLength]
	ld c, a
	ld b, $0
	add hl, bc
	jr .asm_29bf

.asm_29bc
	ld de, wda04
.asm_29bf
	ld b, $6
	ld c, $4
	jr SaveScreen_LoadNeighbor

.asm_29c5
	ld de, wda05
	inc hl
	jr .asm_29ce

.asm_29cb
	ld de, wda04
.asm_29ce
	ld b, $5
	ld c, $5
	jr SaveScreen_LoadNeighbor

LoadNeighboringBlockData::
	ld hl, wOverworldMapAnchor
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapWidth]
	add $6
	ld [hMapObjectIndexBuffer], a
	ld de, wda04
	ld b, $6
	ld c, $5
SaveScreen_LoadNeighbor::
	push bc
	push hl
	push de
.asm_29eb
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_29eb
	pop de
	ld a, e
	add $6
	ld e, a
	jr nc, .asm_29f9
	inc d
.asm_29f9
	pop hl
	ld a, [hConnectionStripLength]
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	dec c
	jr nz, SaveScreen_LoadNeighbor
	ret

GetMovementPermissions:: ; 2a05 (0:2a05)
	xor a
	ld [TilePermissions], a
	call .LeftRight
	call .UpDown
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wPlayerStandingMapY]
	ld e, a
	call GetCoordTile
	ld [wPlayerStandingTile], a
	call .CheckHiNybble
	ret nz
	ld a, [wPlayerStandingTile]
	and $7
	ld hl, .MovementPermissionsData
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld hl, TilePermissions
	or [hl]
	ld [hl], a
	ret

.MovementPermissionsData:
	db 1 << DOWN
	db 1 << UP
	db 1 << LEFT
	db 1 << RIGHT
	db (1 << DOWN) | (1 << RIGHT)
	db (1 << UP) | (1 << RIGHT)
	db (1 << DOWN) | (1 << LEFT)
	db (1 << UP) | (1 << LEFT)

.UpDown:
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wPlayerStandingMapY]
	ld e, a
	push de
	inc e
	call GetCoordTile
	ld [wTileDown], a
	call .Down
	pop de
	dec e
	call GetCoordTile
	ld [wTileUp], a
	call .Up
	ret

.LeftRight:
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wPlayerStandingMapY]
	ld e, a
	push de
	dec d
	call GetCoordTile
	ld [wTileLeft], a
	call .Left
	pop de
	inc d
	call GetCoordTile
	ld [wTileRight], a
	call .Right
	ret

.Down:
	call .CheckHiNybble
	ret nz
	ld a, [wTileDown]
	and $7
	cp $2
	jr z, .asm_2a90
	cp $6
	jr z, .asm_2a90
	cp $7
	ret nz
.asm_2a90
	ld hl, TilePermissions
	set 3, [hl]
	ret

.Up:
	call .CheckHiNybble
	ret nz
	ld a, [wTileUp]
	and $7
	cp $3
	jr z, .asm_2aaa
	cp $4
	jr z, .asm_2aaa
	cp $5
	ret nz
.asm_2aaa
	ld hl, TilePermissions
	set 3, [hl]
	ret

.Right:
	call .CheckHiNybble
	ret nz
	ld a, [wTileRight]
	and $7
	cp $1
	jr z, .asm_2ac4
	cp $5
	jr z, .asm_2ac4
	cp $7
	ret nz
.asm_2ac4
	ld hl, TilePermissions
	set 3, [hl]
	ret

.Left:
	call .CheckHiNybble
	ret nz
	ld a, [wTileLeft]
	and $7
	cp $0
	jr z, .asm_2ade
	cp $4
	jr z, .asm_2ade
	cp $6
	ret nz
.asm_2ade
	ld hl, TilePermissions
	set 3, [hl]
	ret

.CheckHiNybble:
	and $f0
	cp $b0
	ret z
	cp $c0
	ret

GetFacingTileCoord:: ; 2aec (0:2aec)
	ld a, [wPlayerDirection]
	and $c
	srl a
	srl a
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, .Directions
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPlayerStandingMapX]
	add d
	ld d, a
	ld a, [wPlayerStandingMapY]
	add e
	ld e, a
	ld a, [hl]
	ret

.Directions:
	db  0,  1
	dw wTileDown
	db  0, -1
	dw wTileUp
	db -1,  0
	dw wTileLeft
	db  1,  0
	dw wTileRight

GetCoordTile:: ; 2b21 (0:2b21)
	call GetBlockLocation
	ld a, [hl]
	and a
	jr z, .asm_2b48
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld a, [wd0c9]
	ld c, a
	ld a, [wd0ca]
	ld b, a
	add hl, bc
	rr d
	jr nc, .asm_2b3b
	inc hl
.asm_2b3b
	rr e
	jr nc, .asm_2b41
	inc hl
	inc hl
.asm_2b41
	ld a, [wd0c8]
	call Function3128
	ret

.asm_2b48
	ld a, $ff
	ret

GetBlockLocation::
	ld a, [wMapWidth]
	add $6
	ld c, a
	ld b, $0
	ld hl, wc701
	add hl, bc
	ld a, e
	srl a
	jr z, .asm_2b69
	and a
.asm_2b5d
	srl a
	jr nc, .asm_2b62
	add hl, bc
.asm_2b62
	sla c
	rl b
	and a
	jr nz, .asm_2b5d
.asm_2b69
	ld c, d
	srl c
	ld b, $0
	add hl, bc
	ret

CheckFacingSign::
	call GetFacingTileCoord
	ld b, a
	ld a, d
	sub $4
	ld d, a
	ld a, e
	sub $4
	ld e, a
	ld a, [wd94b]
	and a
	ret z
	ld c, a
	ld a, [hROMBank]
	push af
	call SwitchToMapScriptHeaderBank
	call CheckIfFacingTileCoordIsSign
	pop hl
	ld a, h
	rst Bankswitch
	ret

CheckIfFacingTileCoordIsSign:: ; 2b8f (0:2b8f)
	ld hl, wd94c
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_2b95
	push hl
	ld a, [hli]
	cp e
	jr nz, .asm_2ba0
	ld a, [hli]
	cp d
	jr nz, .asm_2ba0
	jr .asm_2bad

.asm_2ba0
	pop hl
	ld a, $5
	add l
	ld l, a
	jr nc, .asm_2ba8
	inc h
.asm_2ba8
	dec c
	jr nz, .asm_2b95
	xor a
	ret

.asm_2bad
	pop hl
	ld de, wcf29
	ld bc, $5
	call CopyBytes
	scf
	ret

CheckCurrentMapXYTriggers::
	ld a, [wd948]
	and a
	ret z
	ld c, a
	ld a, [hROMBank]
	push af
	call SwitchToMapScriptHeaderBank
	call .TriggerCheck
	pop hl
	ld a, h
	rst Bankswitch
	ret

.TriggerCheck:
	ld hl, wd949
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CheckTriggers
	ld b, a
	ld a, [wPlayerStandingMapX]
	sub $4
	ld d, a
	ld a, [wPlayerStandingMapY]
	sub $4
	ld e, a
.asm_2be2
	push hl
	ld a, [hli]
	cp b
	jr z, .asm_2beb
	cp $ff
	jr nz, .asm_2bf5
.asm_2beb
	ld a, [hli]
	cp e
	jr nz, .asm_2bf5
	ld a, [hli]
	cp d
	jr nz, .asm_2bf5
	jr .asm_2c02

.asm_2bf5
	pop hl
	ld a, $8
	add l
	ld l, a
	jr nc, .asm_2bfd
	inc h
.asm_2bfd
	dec c
	jr nz, .asm_2be2
	xor a
	ret

.asm_2c02
	pop hl
	ld de, wcf29
	ld bc, $8
	call CopyBytes
	scf
	ret

FadeToMenu::
	xor a
	ld [hBGMapMode], a
	call LoadStandardMenuDataHeader
	callba Function8c3ab
	call Function30ff
	call Function2f93
	ret

CloseSubmenu::
	call Function3449
	call ReloadTilesetAndPalettes
	call UpdateSprites
	call Call_ExitMenu
	call Functiond2a
	jr FinishExitMenu

ExitAllMenus::
	call Function3449
	call Call_ExitMenu
	call ReloadTilesetAndPalettes
	call UpdateSprites
	call Functiond2a
FinishExitMenu::
	ld b, $9
	call Function3583
	call Function3456
	callba FadeInPalettes
	call Function2fa4
	ret

ReturnToMapWithSpeechTextbox::
	push af
	ld a, $1
	ld [wRTCEnabled], a
	call Function3449
	call Function30ff
	call ReloadTilesetAndPalettes
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	ld hl, wVramState
	set 0, [hl]
	call UpdateSprites
	call Function3456
	ld b, $9
	call Function3583
	call UpdateTimePals
	call DelayFrame
	ld a, $1
	ld [hMapAnims], a
	pop af
	ret

ReloadTilesetAndPalettes:: ; 2c87 (0:2c87)
	call DisableLCD
	call Function30ff
	callba RefreshSprites
	call Functiond9e
	call Functiondac
	ld a, [hROMBank]
	push af
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call SwitchToAnyMapBank
	callba UpdateTimeOfDayPal
	call OverworldTextModeSwitch
	call LoadTileset
	ld a, $8
	call Function3e92
	pop af
	rst Bankswitch
	call EnableLCD
	ret

GetMapHeaderPointer:: ; 2cbe (0:2cbe)
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
GetAnyMapHeaderPointer:: ; 2cc6 (0:2cc6)
	push bc
	dec b
	ld c, b
	ld b, $0
	ld hl, MapGroupPointers ; 25:40ed
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc
	dec c
	ld b, $0
	ld a, $9
	call Function31a3
	ret

GetMapHeaderMember:: ; 2cdd (0:2cdd)
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
GetAnyMapHeaderMember:: ; 2ce5 (0:2ce5)
	ld a, [hROMBank]
	push af
	ld a, BANK(MapGroupPointers)
	rst Bankswitch
	call GetAnyMapHeaderPointer
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop af
	rst Bankswitch
	ret

SwitchToMapBank:: ; 2cf5 (0:2cf5)
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
SwitchToAnyMapBank:: ; 2cfd (0:2cfd)
	call GetAnyMapBank
	rst Bankswitch
	ret

GetMapBank::
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
GetAnyMapBank:: ; 2d0a (0:2d0a)
	push hl
	push de
	ld de, 0
	call GetAnyMapHeaderMember
	ld a, c
	pop de
	pop hl
	ret

PartiallyCopyMapHeader:: ; 2d16 (0:2d16)
	ld a, [hROMBank]
	push af
	ld a, BANK(MapGroupPointers)
	rst Bankswitch
	call GetMapHeaderPointer
	ld de, wd081
	ld bc, $5
	call CopyBytes
	pop af
	rst Bankswitch
	ret

SwitchToMapScriptHeaderBank:: ; 2d2b (0:2d2b)
	ld a, [wd08c]
	rst Bankswitch
	ret

GetMapScriptHeaderBank:: ; 2d30 (0:2d30)
	ld a, [wd08c]
	ret

GetAnyMapBlockdataBank:: ; 2d34 (0:2d34)
	push hl
	push de
	push bc
	push bc
	ld de, $3
	call GetAnyMapHeaderMember
	ld l, c
	ld h, b
	pop bc
	push hl
	ld de, MBC3SRamEnable
	call GetAnyMapHeaderMember
	pop hl
	ld de, $3
	add hl, de
	ld a, c
	call Function3128
	rst Bankswitch
	pop bc
	pop de
	pop hl
	ret

GetSecondaryMapHeaderPointer:: ; 2d56 (0:2d56)
	push bc
	push de
	ld de, $3
	call GetMapHeaderMember
	ld l, c
	ld h, b
	pop de
	pop bc
	ret

GetMapPermission:: ; 2d63 (0:2d63)
	push hl
	push de
	push bc
	ld de, $2
	call GetMapHeaderMember
	ld a, c
	pop bc
	pop de
	pop hl
	ret

Function2d71:: ; XXX
	ret

GetAnyMapPermission:: ; 2d72 (0:2d72)
	push hl
	push de
	push bc
	ld de, $2
	call GetAnyMapHeaderMember
	ld a, c
	pop bc
	pop de
	pop hl
	ret

GetAnyMapTileset:: ; 2d80 (0:2d80)
	ld de, $1
	call GetAnyMapHeaderMember
	ld a, c
	ret

GetWorldMapLocation::
	push hl
	push de
	push bc
	ld de, $5
	call GetAnyMapHeaderMember
	ld a, c
	pop bc
	pop de
	pop hl
	ret

GetMapHeaderMusic::
	push hl
	push bc
	ld de, $6
	call GetMapHeaderMember
	ld a, c
	cp $64
	jr z, .asm_2dc1
	bit 7, c
	jr nz, .asm_2dad
	ld e, c
	ld d, $0
.asm_2daa
	pop bc
	pop hl
	ret

.asm_2dad
	ld a, [wd572]
	bit 0, a
	jr z, .asm_2db9
	ld de, $56
	jr .asm_2daa

.asm_2db9
	ld a, c
	and $7f
	ld e, a
	ld d, $0
	jr .asm_2daa

.asm_2dc1
	ld a, [wd572]
	bit 7, a
	jr z, .asm_2dcd
	ld de, $48
	jr .asm_2daa

.asm_2dcd
	ld de, $26
	jr .asm_2daa

GetMapHeaderTimeOfDayNybble:: ; 2dd2 (0:2dd2)
	call GetPhoneServiceTimeOfDayByte
	and $f
	ret

GetMapHeaderPhoneServiceNybble::
	call GetPhoneServiceTimeOfDayByte
	and $f0
	swap a
	ret

GetPhoneServiceTimeOfDayByte:: ; 2de0 (0:2de0)
	push hl
	push bc
	ld de, $7
	call GetMapHeaderMember
	ld a, c
	pop bc
	pop hl
	ret

GetFishingGroup::
	push de
	push hl
	push bc
	ld de, $8
	call GetMapHeaderMember
	ld a, c
	pop bc
	pop hl
	pop de
	ret

LoadTilesetHeader:: ; 2dfa (0:2dfa)
	push hl
	push bc
	ld hl, $56be
	ld bc, $f
	ld a, [wd082]
	call Function31a3
	ld de, wd0c2
	ld bc, $f
	ld a, $5
	call FarCopyBytes
	pop bc
	pop hl
	ret
