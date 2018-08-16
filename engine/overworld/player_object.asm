BlankScreen:
	call DisableSpriteUpdates
	xor a
	ld [hBGMapMode], a
	call ClearBGPalettes
	call ClearSprites
	ld hl, wTileMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	ld hl, wAttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, $7
	call ByteFill
	call Function3456
	call SetPalettes
	ret

SpawnPlayer: ; 861a (2:461a)
	ld a, $ff
	ld [wObjectFollow_Leader], a
	ld [wObjectFollow_Follower], a
	ld a, $0
	ld hl, .PlayerObjectTemplate
	call CopyPlayerObjectTemplate
	ld b, $0
	call PlayerSpawn_ConvertCoords
	ld a, $0
	ld [hObjectStructIndexBuffer], a
	ld de, wObjectStructs
	ld a, $0
	ld [hMapObjectIndexBuffer], a
	ld bc, wMapObjects
	call CopyMapObjectToObjectStruct
	ld a, $0
	ld [wCenteredObject], a
	ret

.PlayerObjectTemplate
; A dummy map object used to initialize the player object.
; Shorter than the actual amount copied by two bytes.
; Said bytes seem to be unused.
	object_event -4, -4, SPRITE_CHRIS, SPRITEMOVEDATA_PLAYER, 15, 15, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, 0, -1

CopyDECoordsToMapObject: ; 8653 (2:4653)
	push de
	ld a, b
	call GetMapObject
	pop de
	ld hl, $3
	add hl, bc
	ld [hl], d
	ld hl, $2
	add hl, bc
	ld [hl], e
	ret

PlayerSpawn_ConvertCoords: ; 8664 (2:4664)
	push bc
	ld a, [wXCoord]
	add $4
	ld d, a
	ld a, [wYCoord]
	add $4
	ld e, a
	pop bc
	call CopyDECoordsToMapObject
	ret

WritePersonXY:
	ld a, b
	call CheckObjectVisibility
	ret c
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	ld a, [hConnectionStripLength]
	ld b, a
	call CopyDECoordsToMapObject
	and a
	ret

RefreshPlayerCoords:
	ld a, [wXCoord]
	add $4
	ld d, a
	ld hl, wPlayerStandingMapX
	sub [hl]
	ld [hl], d
	ld hl, wPlayerObjectXCoord
	ld [hl], d
	ld hl, wPlayerLastMapX
	ld [hl], d
	ld d, a
	ld a, [wYCoord]
	add $4
	ld e, a
	ld hl, wPlayerStandingMapY
	sub [hl]
	ld [hl], e
	ld hl, wPlayerObjectYCoord
	ld [hl], e
	ld hl, wPlayerLastMapY
	ld [hl], e
	ld e, a
	ld a, [wObjectFollow_Leader]
	cp $0
	ret nz
	ret

SpawnPlayer2:
	ld a, $1
	ld hl, .PlayerObjectTemplate
	call CopyPlayerObjectTemplate
	ld b, $1
	call PlayerSpawn_ConvertCoords
	ret

.PlayerObjectTemplate:
	object_event -4, -4, SPRITE_CHRIS, SPRITEMOVEDATA_12, 15, 15, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, 0, -1

CopyObjectStruct_:: ; 86d7 (2:46d7)
	call CheckObjectMask
	and a
	ret nz
	ld hl, wPlayerStructEnd
	ld a, $1
	ld de, $28
.asm_86e4
	ld [hObjectStructIndexBuffer], a
	ld a, [hl]
	and a
	jr z, .asm_86f4
	add hl, de
	ld a, [hConnectedMapWidth]
	inc a
	cp $d
	jr nz, .asm_86e4
	scf
	ret

.asm_86f4
	ld d, h
	ld e, l
	call CopyMapObjectToObjectStruct
	ld a, [wVramState]
	bit 7, a
	ret z
	ld hl, $5
	add hl, de
	set 5, [hl]
	ret

CopyMapObjectToObjectStruct: ; 8706 (2:4706)
	call CopyMapObjectToTempObject
	call CopyTempObjectToObjectStruct
	ret

CopyMapObjectToTempObject: ; 870d (2:470d)
	ld a, [hConnectedMapWidth]
	ld hl, $0
	add hl, bc
	ld [hl], a
	ld a, [hMapObjectIndexBuffer]
	ld [wce99], a
	ld hl, $1
	add hl, bc
	ld a, [hl]
	ld [wce9a], a
	call GetSpriteVTile
	ld [wce9b], a
	ld a, [hl]
	call GetSpritePalette
	ld [wce9c], a
	ld hl, $8
	add hl, bc
	ld a, [hl]
	and $f0
	jr z, .asm_873e
	swap a
	and $7
	ld [wce9c], a
.asm_873e
	ld hl, $4
	add hl, bc
	ld a, [hl]
	ld [wce9d], a
	ld hl, $9
	add hl, bc
	ld a, [hl]
	ld [wce9e], a
	ld hl, $3
	add hl, bc
	ld a, [hl]
	ld [wce9f], a
	ld hl, $2
	add hl, bc
	ld a, [hl]
	ld [wcea0], a
	ld hl, $5
	add hl, bc
	ld a, [hl]
	ld [wcea1], a
	ret

InitializeVariableSprites:
	ld bc, wMap2Object
	ld a, $2
.asm_876c
	ld [hConnectionStripLength], a
	ld hl, $1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_87ab
	ld hl, $0
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_87ab
	ld a, [wXCoord]
	ld d, a
	ld a, [wYCoord]
	ld e, a
	ld hl, $3
	add hl, bc
	ld a, [hl]
	add $1
	sub d
	jr c, .asm_87ab
	cp $c
	jr nc, .asm_87ab
	ld hl, $2
	add hl, bc
	ld a, [hl]
	add $1
	sub e
	jr c, .asm_87ab
	cp $b
	jr nc, .asm_87ab
	push bc
	call CopyObjectStruct_
	pop bc
	jp c, Function87b9
.asm_87ab
	ld hl, $10
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp $10
	jr nz, .asm_876c
	ret

Function87b9: ; 87b9 (2:47b9)
	ret

CheckObjectEnteringVisibleRange:
	nop
	ld a, [wPlayerStepDirection]
	cp $ff
	ret z
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
	dw Function87d5
	dw Function87ce
	dw Function8822
	dw Function8829

Function87ce:
	ld a, [wYCoord]
	sub $1
	jr asm_87da

Function87d5:
	ld a, [wYCoord]
	add $9
asm_87da
	ld d, a
	ld a, [wXCoord]
	ld e, a
	ld bc, wMap2Object
	ld a, $2
.asm_87e4
	ld [hConnectionStripLength], a
	ld hl, $1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8814
	ld hl, $2
	add hl, bc
	ld a, d
	cp [hl]
	jr nz, .asm_8814
	ld hl, $0
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_8814
	ld hl, $3
	add hl, bc
	ld a, [hl]
	add $1
	sub e
	jr c, .asm_8814
	cp $c
	jr nc, .asm_8814
	push de
	push bc
	call CopyObjectStruct_
	pop bc
	pop de
.asm_8814
	ld hl, $10
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp $10
	jr nz, .asm_87e4
	ret

Function8822:
	ld a, [wXCoord]
	sub $1
	jr asm_882e

Function8829:
	ld a, [wXCoord]
	add $a
asm_882e
	ld e, a
	ld a, [wYCoord]
	ld d, a
	ld bc, wMap2Object
	ld a, $2
.asm_8838
	ld [hConnectionStripLength], a
	ld hl, $1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8868
	ld hl, $3
	add hl, bc
	ld a, e
	cp [hl]
	jr nz, .asm_8868
	ld hl, $0
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_8868
	ld hl, $2
	add hl, bc
	ld a, [hl]
	add $1
	sub d
	jr c, .asm_8868
	cp $b
	jr nc, .asm_8868
	push de
	push bc
	call CopyObjectStruct_
	pop bc
	pop de
.asm_8868
	ld hl, $10
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hConnectionStripLength]
	inc a
	cp $10
	jr nz, .asm_8838
	ret

CopyTempObjectToObjectStruct: ; 8876 (2:4876)
	ld a, [wce99]
	ld hl, $1
	add hl, de
	ld [hl], a
	ld a, [wce9d]
	call CopySpriteMovementData
	ld a, [wce9c]
	ld hl, $6
	add hl, de
	or [hl]
	ld [hl], a
	ld a, [wcea0]
	call InitTempObjectYCoord
	ld a, [wce9f]
	call InitTempObjectXCoord
	ld a, [wce9a]
	ld hl, $0
	add hl, de
	ld [hl], a
	ld a, [wce9b]
	ld hl, $2
	add hl, de
	ld [hl], a
	ld hl, $9
	add hl, de
	ld [hl], $0
	ld hl, $d
	add hl, de
	ld [hl], $ff
	ld a, [wcea1]
	call InitTempObjectRadius
	ld a, [wce9e]
	ld hl, $20
	add hl, de
	ld [hl], a
	and a
	ret

InitTempObjectYCoord: ; 88c5 (2:48c5)
	ld hl, $15
	add hl, de
	ld [hl], a
	ld hl, $11
	add hl, de
	ld [hl], a
	ld hl, wYCoord
	sub [hl]
	and $f
	swap a
	ld hl, wce82
	sub [hl]
	ld hl, $18
	add hl, de
	ld [hl], a
	ret

InitTempObjectXCoord: ; 88e1 (2:48e1)
	ld hl, $14
	add hl, de
	ld [hl], a
	ld hl, $10
	add hl, de
	ld [hl], a
	ld hl, wXCoord
	sub [hl]
	and $f
	swap a
	ld hl, wce81
	sub [hl]
	ld hl, $17
	add hl, de
	ld [hl], a
	ret

InitTempObjectRadius: ; 88fd (2:48fd)
	ld h, a
	inc a
	and $f
	ld l, a
	ld a, h
	add $10
	and $f0
	or l
	ld hl, $16
	add hl, de
	ld [hl], a
	ret

TrainerWalkToPlayer:
	ld a, [hLastTalked]
	call InitMovementBuffer
	ld a, movement_step_sleep
	call AppendToMovementBuffer
	ld a, [wcf2a]
	dec a
	jr z, .asm_892b
	ld a, [hLastTalked]
	ld b, a
	ld c, PLAYER
	ld d, $1
	call GetTrainerPathToPlayer
	call DecrementMovementBufferCount
.asm_892b
	ld a, movement_step_end
	call AppendToMovementBuffer
	ret

GetTrainerPathToPlayer: ; 8931 (2:4931)
	push de
	push bc
	ld a, c
	call GetMapObject
	ld hl, $0
	add hl, bc
	ld a, [hl]
	call GetObjectStruct
	ld d, b
	ld e, c
	pop bc
	ld a, b
	call GetMapObject
	ld hl, $0
	add hl, bc
	ld a, [hl]
	call GetObjectStruct
	ld hl, $10
	add hl, bc
	ld a, [hl]
	ld hl, $11
	add hl, bc
	ld c, [hl]
	ld b, a
	ld hl, $10
	add hl, de
	ld a, [hl]
	ld hl, $11
	add hl, de
	ld e, [hl]
	ld d, a
	pop af
	call ComputePathToWalkToPlayer
	ret

SurfStartStep: ; 8969 (2:4969)
	call InitMovementBuffer
	call GetInitialSurfStep
	call AppendToMovementBuffer
	ld a, movement_step_end
	call AppendToMovementBuffer
	ret

GetInitialSurfStep: ; 8978 (2:4978)
	ld a, [wPlayerDirection]
	srl a
	srl a
	and $3
	ld e, a
	ld d, $0
	ld hl, .Data ; $498a
	add hl, de
	ld a, [hl]
	ret

.Data
	slow_step DOWN
	slow_step UP
	slow_step LEFT
	slow_step RIGHT

FollowNotExact:
	push bc
	ld a, c
	call CheckObjectVisibility
	ld d, b
	ld e, c
	pop bc
	ret c
	ld a, b
	call CheckObjectVisibility
	ret c
	ld hl, $10
	add hl, bc
	ld a, [hl]
	ld hl, $11
	add hl, bc
	ld c, [hl]
	ld b, a
	ld hl, $10
	add hl, de
	ld a, [hl]
	cp b
	jr z, .asm_89b7
	jr c, .asm_89b4
	inc b
	jr .asm_89c5

.asm_89b4
	dec b
	jr .asm_89c5

.asm_89b7
	ld hl, $11
	add hl, de
	ld a, [hl]
	cp c
	jr z, .asm_89c5
	jr c, .asm_89c4
	inc c
	jr .asm_89c5

.asm_89c4
	dec c
.asm_89c5
	ld hl, $10
	add hl, de
	ld [hl], b
	ld a, b
	ld hl, wXCoord
	sub [hl]
	and $f
	swap a
	ld hl, wce81
	sub [hl]
	ld hl, $17
	add hl, de
	ld [hl], a
	ld hl, $11
	add hl, de
	ld [hl], c
	ld a, c
	ld hl, wYCoord
	sub [hl]
	and $f
	swap a
	ld hl, wce82
	sub [hl]
	ld hl, $18
	add hl, de
	ld [hl], a
	ld a, [hObjectStructIndexBuffer]
	ld hl, $20
	add hl, de
	ld [hl], a
	ld hl, $3
	add hl, de
	ld [hl], $1a
	ld hl, $9
	add hl, de
	ld [hl], $0
	ret

GetRelativeFacing:
	ld a, d
	call GetMapObject
	ld hl, $0
	add hl, bc
	ld a, [hl]
	cp $d
	jr nc, .asm_8a27
	ld d, a
	ld a, e
	call GetMapObject
	ld hl, $0
	add hl, bc
	ld a, [hl]
	cp $d
	jr nc, .asm_8a27
	ld e, a
	call GetFacing_e_relativeto_d
	ret

.asm_8a27
	scf
	ret

GetFacing_e_relativeto_d: ; 8a29 (2:4a29)
	ld a, d
	call GetObjectStruct
	ld hl, $10
	add hl, bc
	ld a, [hl]
	ld hl, $11
	add hl, bc
	ld c, [hl]
	ld b, a
	push bc
	ld a, e
	call GetObjectStruct
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	pop bc
	ld a, b
	sub d
	jr z, .asm_8a5c
	jr nc, .asm_8a50
	cpl
	inc a
.asm_8a50
	ld h, a
	ld a, c
	sub e
	jr z, .asm_8a6a
	jr nc, .asm_8a59
	cpl
	inc a
.asm_8a59
	sub h
	jr c, .asm_8a6a
.asm_8a5c
	ld a, c
	cp e
	jr z, .asm_8a78
	jr c, .asm_8a66
	ld d, $0
	and a
	ret

.asm_8a66
	ld d, $1
	and a
	ret

.asm_8a6a
	ld a, b
	cp d
	jr z, .asm_8a78
	jr c, .asm_8a74
	ld d, $3
	and a
	ret

.asm_8a74
	ld d, $2
	and a
	ret

.asm_8a78
	scf
	ret

QueueFollowerFirstStep: ; 8a7a (2:4a7a)
	call Function8a8d
	jr c, .asm_8a87
	ld [wFollowMovementQueue], a
	xor a
	ld [wFollowerMovementQueueLength], a
	ret

.asm_8a87
	ld a, $ff
	ld [wFollowerMovementQueueLength], a
	ret

Function8a8d: ; 8a8d (2:4a8d)
	ld a, [wObjectFollow_Leader]
	call GetObjectStruct
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	ld a, [wObjectFollow_Follower]
	call GetObjectStruct
	ld hl, $10
	add hl, bc
	ld a, d
	cp [hl]
	jr z, .asm_8ab5
	jr c, .asm_8ab1
	and a
	ld a, $f
	ret

.asm_8ab1
	and a
	ld a, $e
	ret

.asm_8ab5
	ld hl, $11
	add hl, bc
	ld a, e
	cp [hl]
	jr z, .asm_8ac7
	jr c, .asm_8ac3
	and a
	ld a, $c
	ret

.asm_8ac3
	and a
	ld a, $d
	ret

.asm_8ac7
	scf
	ret
