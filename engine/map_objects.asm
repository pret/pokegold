INCLUDE "engine/facings.asm"
SpriteMovementData:: INCLUDE "data/map_objects.asm"

DeleteMapObject:: ; 4358 (1:4358)
	push bc
	ld hl, $1
	add hl, bc
	ld a, [hl]
	push af
	ld h, b
	ld l, c
	ld bc, $28
	xor a
	call ByteFill
	pop af
	cp $ff
	jr z, .asm_437a
	bit 7, a
	jr nz, .asm_437a
	call GetMapObject
	ld hl, $0
	add hl, bc
	ld [hl], $ff
.asm_437a
	pop bc
	ret

Function437c:
	call .CheckObjectStillVisible
	ret c
	call .HandleStepType
	call .HandleObjectAction
	ret

.CheckObjectStillVisible: ; 4387 (1:4387)
	ld hl, $5
	add hl, bc
	res 6, [hl]
	ld a, [wXCoord]
	ld e, a
	ld hl, $10
	add hl, bc
	ld a, [hl]
	add $1
	sub e
	jr c, .asm_43b3
	cp $c
	jr nc, .asm_43b3
	ld a, [wYCoord]
	ld e, a
	ld hl, $11
	add hl, bc
	ld a, [hl]
	add $1
	sub e
	jr c, .asm_43b3
	cp $b
	jr nc, .asm_43b3
	jr .asm_43dd

.asm_43b3
	ld hl, $5
	add hl, bc
	set 6, [hl]
	ld a, [wXCoord]
	ld e, a
	ld hl, $14
	add hl, bc
	ld a, [hl]
	add $1
	sub e
	jr c, .asm_43df
	cp $c
	jr nc, .asm_43df
	ld a, [wYCoord]
	ld e, a
	ld hl, $15
	add hl, bc
	ld a, [hl]
	add $1
	sub e
	jr c, .asm_43df
	cp $b
	jr nc, .asm_43df
.asm_43dd
	and a
	ret

.asm_43df
	ld hl, $4
	add hl, bc
	bit 1, [hl]
	jr nz, .asm_43ec
	call DeleteMapObject
	scf
	ret

.asm_43ec
	ld hl, $5
	add hl, bc
	set 6, [hl]
	and a
	ret

.HandleStepType: ; 43f4 (1:43f4)
	ld hl, $9
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_440a
	ld hl, $5
	add hl, bc
	bit 5, [hl]
	jr nz, .asm_4427
	cp $1
	jr z, .asm_4415
	jr .asm_4422

.asm_440a
	call ObjectMovementReset
	ld hl, $5
	add hl, bc
	bit 5, [hl]
	jr nz, .asm_4427
.asm_4415
	call MapObjectMovementPattern
	ld hl, $9
	add hl, bc
	ld a, [hl]
	and a
	ret z
	cp $1
	ret z
.asm_4422
	ld hl, StepTypesJumptable
	rst JumpTable
	ret

.asm_4427
	ret

.HandleObjectAction: ; 4428 (1:4428)
	ld hl, $4
	add hl, bc
	bit 0, [hl]
	jr nz, Function44a0
	ld hl, $5
	add hl, bc
	bit 6, [hl]
	jr nz, Function44a0
	bit 5, [hl]
	jr nz, asm_4449
	ld de, Pointers4460
	jr asm_444e

Function4441:
	ld hl, $4
	add hl, bc
	bit 0, [hl]
	jr nz, Function44a0
asm_4449
	ld de, Pointers4460 + 2
	jr asm_444e

asm_444e
INCLUDE "engine/map_object_action.asm"

CopyNextCoordsTileToStandingCoordsTile: ; 45d9 (1:45d9)
	ld hl, $10
	add hl, bc
	ld a, [hl]
	ld hl, $12
	add hl, bc
	ld [hl], a
	ld hl, $11
	add hl, bc
	ld a, [hl]
	ld hl, $13
	add hl, bc
	ld [hl], a
	ld hl, $e
	add hl, bc
	ld a, [hl]
	ld hl, $f
	add hl, bc
	ld [hl], a
	call SetGrassPriority
	ld hl, $e
	add hl, bc
	ld a, [hl]
	call UselessAndA
	ret

Function4603:
	ld hl, $12
	add hl, bc
	ld a, [hl]
	ld hl, $10
	add hl, bc
	ld [hl], a
	ld hl, $13
	add hl, bc
	ld a, [hl]
	ld hl, $11
	add hl, bc
	ld [hl], a
	ret

UpdateGrassPriority:
	ld hl, $5
	add hl, bc
	bit 3, [hl]
	jr z, .asm_4628
	ld hl, $e
	add hl, bc
	ld a, [hl]
	call SetGrassPriority
.asm_4628
	ld hl, $e
	add hl, bc
	ld a, [hl]
	call UselessAndA
	ret c
	ld hl, $f
	add hl, bc
	ld a, [hl]
	call UselessAndA
	ret

SetGrassPriority: ; 463a (1:463a)
	call CheckSuperTallGrassTile
	jr z, .asm_4644
	call CheckGrassTile
	jr c, .asm_464b
.asm_4644
	ld hl, $5
	add hl, bc
	set 3, [hl]
	ret

.asm_464b
	ld hl, $5
	add hl, bc
	res 3, [hl]
	ret

UselessAndA: ; 4652 (1:4652)
	and a
	ret

EndSpriteMovement:
	xor a
	ld hl, $c
	add hl, bc
	ld [hl], a
	ld hl, $1b
	add hl, bc
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ret

InitStep:
	ld hl, $7
	add hl, bc
	ld [hl], a
	ld hl, $4
	add hl, bc
	bit 2, [hl]
	jr nz, GetNextTile
	add a
	add a
	and $c
	ld hl, $8
	add hl, bc
	ld [hl], a
GetNextTile:
	call GetStepVector
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld a, d
	call GetStepVectorSign
	ld hl, $12
	add hl, bc
	add [hl]
	ld hl, $10
	add hl, bc
	ld [hl], a
	ld d, a
	ld a, e
	call GetStepVectorSign
	ld hl, $13
	add hl, bc
	add [hl]
	ld hl, $11
	add hl, bc
	ld [hl], a
	ld e, a
	push bc
	call GetCoordTile
	pop bc
	ld hl, $e
	add hl, bc
	ld [hl], a
	ret

AddStepVector: ; 46b0 (1:46b0)
	call GetStepVector
	ld hl, $17
	add hl, bc
	ld a, [hl]
	add d
	ld [hl], a
	ld hl, $18
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
	ret

GetStepVector: ; 46c2 (1:46c2)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $f
	add a
	add a
	ld l, a
	ld h, $0
	ld de, StepVectors
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ret

StepVectors: ; 46d9
; x,  y, duration, speed
	; slow
	db  0,  1, 16, 1
	db  0, -1, 16, 1
	db -1,  0, 16, 1
	db  1,  0, 16, 1
	; normal
	db  0,  2,  8, 2
	db  0, -2,  8, 2
	db -2,  0,  8, 2
	db  2,  0,  8, 2
	; fast
	db  0,  4,  4, 4
	db  0, -4,  4, 4
	db -4,  0,  4, 4
	db  4,  0,  4, 4

GetStepVectorSign: ; 4709 (1:4709)
	add a
	ret z
	ld a, $1
	ret nc
	ld a, $ff
	ret

UpdatePlayerStep:
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $3
	ld [wPlayerStepDirection], a
	call AddStepVector
	ld a, [wPlayerStepVectorX]
	add d
	ld [wPlayerStepVectorX], a
	ld a, [wPlayerStepVectorY]
	add e
	ld [wPlayerStepVectorY], a
	ld hl, wPlayerStepFlags
	set 5, [hl]
	ret

Function4732:
	push bc
	ld e, a
	ld d, $0
	ld hl, $1
	add hl, bc
	ld a, [hl]
	call GetMapObject
	add hl, de
	ld a, [hl]
	pop bc
	ret

INCLUDE "engine/movement_pattern.asm"
INCLUDE "engine/step_types.asm"
INCLUDE "engine/movement.asm"

Function5429: ; 5429 (1:5429)
	call InitStep
	ld hl, $1f
	add hl, bc
	ld [hl], $0
	ld hl, $5
	add hl, bc
	res 3, [hl]
	ld hl, $b
	add hl, bc
	ld [hl], $2
	call Function54c8
	ld hl, wCenteredObject
	ld a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .asm_5450
	ld hl, $9
	add hl, bc
	ld [hl], $8
	ret

.asm_5450
	ld hl, $9
	add hl, bc
	ld [hl], $9
	ret
Function5457: ; 5457 (1:5457)
	ld e, a
	ld a, [wObjectFollow_Follower]
	cp $ff
	ret z
	ld a, [wObjectFollow_Leader]
	ld d, a
	ld a, [hMapObjectIndexBuffer]
	cp d
	ret nz
	ld a, e
	cp $3e
	ret z
	cp $47
	ret z
	cp $4b
	ret z
	cp $50
	ret z
	cp $8
	ret c
	push af
	ld hl, wFollowerMovementQueueLength
	inc [hl]
	ld e, [hl]
	ld d, $0
	ld hl, wFollowMovementQueue
	add hl, de
	pop af
	ld [hl], a
	ret

GetFollowerNextMovementByte:
	ld hl, wFollowerMovementQueueLength
	ld a, [hl]
	and a
	jr z, .asm_54a2
	cp $ff
	jr z, .asm_54a2
	dec [hl]
	ld e, a
	ld d, $0
	ld hl, wFollowMovementQueue
	add hl, de
	inc e
	ld a, $ff
.asm_549b
	ld d, [hl]
	ld [hld], a
	ld a, d
	dec e
	jr nz, .asm_549b
	ret

.asm_54a2
	call Function54a9
	ret c
	ld a, $3e
	ret

Function54a9: ; 54a9 (1:54a9)
	ld a, [wObjectFollow_Leader]
	cp $ff
	jr z, .asm_54bf
	push bc
	call GetObjectStruct
	ld hl, $0
	add hl, bc
	ld a, [hl]
	pop bc
	and a
	jr z, .asm_54bf
	and a
	ret

.asm_54bf
	ld a, $ff
	ld [wObjectFollow_Follower], a
	ld a, $47
	scf
	ret

Function54c8: ; 54c8 (1:54c8)
	push bc
	ld de, .data
	call Function5558
	call Function554b
	pop bc
	ret

.data db $fc, PAL_OW_SILVER, SPRITEMOVEDATA_SHADOW

Function54d7: ; 54d7 (1:54d7)
	push bc
	ld de, .data
	call Function5558
	call Function554b
	pop bc
	ret

.data db $fe, PAL_OW_SILVER, SPRITEMOVEDATA_BOULDERDUST

Function54e6: ; 54e6 (1:54e6)
	push bc
	ld de, .data
	call Function5558
	call Function554b
	pop bc
	ret

.data db $f8, PAL_OW_SILVER, SPRITEMOVEDATA_EMOTE

Function54f5: ; 54f5 (1:54f5)
	push bc
	ld de, .data
	call Function5558
	call Function554b
	pop bc
	ret

.data db $fe, PAL_OW_TREE, SPRITEMOVEDATA_GRASS

Function5504: ; 5504 (1:5504)
	push bc
	push af
	ld de, .data
	call Function5558
	pop af
	ld [wce9e], a
	call Function554b
	pop bc
	ret

.data db $00, PAL_OW_SILVER, SPRITEMOVEDATA_SCREENSHAKE

Function5518: ; 5518 (1:5518)
	push bc
	ld a, [hMapObjectIndexBuffer]
	ld c, a
	call Function5521
	pop bc
	ret

Function5521: ; 5521 (1:5521)
	ld de, wPlayerStruct
	ld a, $d
.asm_5526
	push af
	ld hl, $4
	add hl, de
	bit 7, [hl]
	jr z, .asm_5540
	ld hl, $0
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_5540
	push bc
	xor a
	ld bc, $28
	call ByteFill
	pop bc
.asm_5540
	ld hl, $28
	add hl, de
	ld d, h
	ld e, l
	pop af
	dec a
	jr nz, .asm_5526
	ret

Function554b: ; 554b (1:554b)
	call FindFirstEmptyObjectStruct
	ret nc
	ld d, h
	ld e, l
	callba CopyTempObjectToObjectStruct
	ret

Function5558: ; 5558 (1:5558)
	ld hl, wce99
	ld [hl], $ff
	inc hl
	ld [hl], $ff
	inc hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld a, [hMapObjectIndexBuffer]
	ld [hli], a
	push hl
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	pop hl
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], $ff
	ret

Function557f:: ; 557f (1:557f)
	ld a, [wVramState]
	bit 0, a
	ret z
	ld bc, wPlayerStruct
	xor a
.asm_5589
	ld [hConnectionStripLength], a
	call DoesObjectHaveASprite
	jr z, .asm_5593
	call Function55ef
.asm_5593
	ld hl, $28
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp $d
	jr nz, .asm_5589
	ret

Function55a1
	call Function55d8
	ld a, $0
	call Function55bc
	ld a, [wd180]
	bit 7, a
	jr z, .asm_55b8
	ld a, [hLastTalked]
	and a
	jr z, .asm_55b8
	call Function55bc
.asm_55b8
	call UpdateSprites_
	ret

Function55bc: ; 55bc (1:55bc)
	cp $10
	ret nc
	call GetMapObject
	ld hl, $0
	add hl, bc
	ld a, [hl]
	cp $ff
	ret z
	cp $d
	ret nc
	call GetObjectStruct
	call DoesObjectHaveASprite
	ret z
	call Function5606
	ret

Function55d8: ; 55d8 (1:55d8)
	xor a
	ld bc, wPlayerStruct
.asm_55dc
	ld [hMapObjectIndexBuffer], a
	call Function5613
	ld hl, $28
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hConnectionStripLength]
	inc a
	cp $d
	jr nz, .asm_55dc
	ret

Function55ef: ; 55ef (1:55ef)
	push bc
	call Function5660
	pop bc
	jr c, Function5613
	call Function5636
	jr c, Function5613
	call Function561b
	callba Function4441 ; same bank
	xor a
	ret

Function5606: ; 5606 (1:5606)
	call Function5636
	jr c, Function5613
	callba Function4441 ; same bank
	xor a
	ret

Function5613: ; 5613 (1:5613)
	ld hl, $d
	add hl, bc
	ld [hl], $ff
	scf
	ret

Function561b: ; 561b (1:561b)
	push bc
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	call GetCoordTile
	pop bc
	ld hl, $e
	add hl, bc
	ld [hl], a
	callba UpdateGrassPriority ; same bank
	ret

Function5636: ; 5636 (1:5636)
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	inc d
	inc e
	ld a, [wXCoord]
	cp d
	jr z, .asm_564f
	jr nc, .asm_565e
	add $b
	cp d
	jr c, .asm_565e
.asm_564f
	ld a, [wYCoord]
	cp e
	jr z, .asm_565c
	jr nc, .asm_565e
	add $a
	cp e
	jr c, .asm_565e
.asm_565c
	xor a
	ret

.asm_565e
	scf
	ret

Function5660: ; 5660 (1:5660)
	ld a, [wce81]
	ld d, a
	ld hl, $19
	add hl, bc
	ld a, [hl]
	ld hl, $17
	add hl, bc
	add [hl]
	add d
	cp $f0
	jr nc, .asm_5678
	cp $a0
	jp nc, Function56fb
.asm_5678
	and $7
	ld d, $2
	cp $4
	jr c, .asm_5682
	ld d, $3
.asm_5682
	ld a, [hl]
	srl a
	srl a
	srl a
	cp $14
	jr c, .asm_568f
	sub $20
.asm_568f
	ld [hUsedSpriteIndex], a
	ld a, [wce82]
	ld e, a
	ld hl, $1a
	add hl, bc
	ld a, [hl]
	ld hl, $18
	add hl, bc
	add [hl]
	add e
	cp $f0
	jr nc, .asm_56a8
	cp $90
	jr nc, Function56fb
.asm_56a8
	and $7
	ld e, $2
	cp $4
	jr c, .asm_56b2
	ld e, $3
.asm_56b2
	ld a, [hl]
	srl a
	srl a
	srl a
	cp $12
	jr c, .asm_56bf
	sub $20
.asm_56bf
	ld [hUsedSpriteTile], a
	ld hl, $6
	add hl, bc
	bit 7, [hl]
	jr z, .asm_56d1
	ld a, d
	add $2
	ld d, a
	ld a, e
	add $2
	ld e, a
.asm_56d1
	ld a, d
	ld [hFFC1], a
.asm_56d4
	ld a, [hFFC1]
	ld d, a
	ld a, [hUsedSpriteTile]
	add e
	dec a
	cp $12
	jr nc, .asm_56f6
	ld b, a
.asm_56e0
	ld a, [hUsedSpriteIndex]
	add d
	dec a
	cp $14
	jr nc, .asm_56f3
	ld c, a
	push bc
	call Coord2Tile
	pop bc
	ld a, [hl]
	cp $60
	jr nc, Function56fb
.asm_56f3
	dec d
	jr nz, .asm_56e0
.asm_56f6
	dec e
	jr nz, .asm_56d4
	and a
	ret

Function56fb: ; 56fb (1:56fb)
	scf
	ret

HandleNPCStep::
	call Function5704
	call Function5714
	ret

Function5704: ; 5704 (1:5704)
	xor a
	ld [wPlayerStepVectorX], a
	ld [wPlayerStepVectorY], a
	ld [wPlayerStepFlags], a
	ld a, $ff
	ld [wPlayerStepDirection], a
	ret

Function5714: ; 5714 (1:5714)
	ld bc, wPlayerSprite
	xor a
.asm_5718
	ld [hMapObjectIndexBuffer], a
	call DoesObjectHaveASprite
	jr z, .asm_5722
	call Function437c
.asm_5722
	ld hl, $28
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hConnectionStripLength]
	inc a
	cp $d
	jr nz, .asm_5718
	ret

Function5730:: ; 5730 (1:5730)
	ld a, $3e
	ld [wce87], a
	ld [wce88], a
	xor a
	ld [wcf39], a
	ld [wPlayerObjectStepFrame], a
	call Function574f
	callba Function14a44
	call c, Function5770
	call Function5761
	ret

Function574f: ; 574f (1:574f)
	ld hl, wd182
	bit 7, [hl]
	jr nz, .asm_575b
	bit 6, [hl]
	jr nz, .asm_575b
	ret

.asm_575b
	ld a, $0
	ld [wPlayerAction], a
	ret

Function5761: ; 5761 (1:5761)
	ld hl, wd182
	bit 5, [hl]
	ret z
	ld a, [wd182]
	and $3
	add a
	add a
	jr asm_5772

Function5770: ; 5770 (1:5770)
	ld a, $0
asm_5772
	ld bc, wObjectStructs
	call SetSpriteDirection
	ret

StartFollow::
	push bc
	ld a, b
	call Function578b
	pop bc
	ret c
	ld a, c
	call Function57a2
	callba QueueFollowerFirstStep
	ret

Function578b: ; 578b (1:578b)
	call CheckObjectVisibility
	ret c
	ld a, [hObjectStructIndexBuffer]
	ld [wObjectFollow_Leader], a
	ret

StopFollow:: ; 5795 (1:5795)
	call Function579c
	call Function57bd
	ret

Function579c: ; 579c (1:579c)
	ld a, $ff
	ld [wObjectFollow_Leader], a
	ret

Function57a2: ; 57a2 (1:57a2)
	push af
	call Function57bd
	pop af
	call CheckObjectVisibility
	ret c
	ld hl, $3
	add hl, bc
	ld [hl], $13
	ld hl, $9
	add hl, bc
	ld [hl], $0
	ld a, [hConnectedMapWidth]
	ld [wObjectFollow_Follower], a
	ret

Function57bd: ; 57bd (1:57bd)
	ld a, [wObjectFollow_Follower]
	cp $ff
	ret z
	call GetObjectStruct
	callba Function5859 ; same bank
	ld a, $ff
	ld [wObjectFollow_Follower], a
	ret

Function57d2:
	ld a, c
	call CheckObjectVisibility
	ret c
	push bc
	call Function57f0
	pop bc
	ld hl, $5
	add hl, bc
	res 5, [hl]
	xor a
	ret

Function57e4:
	call CheckObjectVisibility
	ret c
	ld hl, $5
	add hl, bc
	set 5, [hl]
	xor a
	ret

Function57f0: ; 57f0 (1:57f0)
	ld bc, wPlayerStruct
	xor a
.asm_57f4
	push af
	call DoesObjectHaveASprite
	jr z, .asm_5800
	ld hl, $5
	add hl, bc
	set 5, [hl]
.asm_5800
	ld hl, $28
	add hl, bc
	ld b, h
	ld c, l
	pop af
	inc a
	cp $d
	jr nz, .asm_57f4
	ret

Function580d:
	ld a, [wObjectFollow_Leader]
	cp $ff
	ret z
	push bc
	call GetObjectStruct
	ld hl, $1
	add hl, bc
	ld a, [hl]
	pop bc
	cp c
	ret nz
	ld a, [wObjectFollow_Follower]
	cp $ff
	ret z
	call GetObjectStruct
	ld hl, $5
	add hl, bc
	res 5, [hl]
	ret

Function582f:
	push bc
	ld bc, wPlayerSprite
	xor a
.asm_5834
	push af
	call DoesObjectHaveASprite
	jr z, .asm_5840
	ld hl, $5
	add hl, bc
	res 5, [hl]
.asm_5840
	ld hl, $28
	add hl, bc
	ld b, h
	ld c, l
	pop af
	inc a
	cp $d
	jr nz, .asm_5834
	pop bc
	ret

Function584e:
	call CheckObjectVisibility
	ret c
	ld hl, $5
	add hl, bc
	res 5, [hl]
	ret

Function5859:
	ld hl, $1
	add hl, bc
	ld a, [hl]
	cp $ff
	jp z, Function5879
	push bc
	call GetMapObject
	ld hl, $4
	add hl, bc
	ld a, [hl]
	pop bc
	ld hl, $3
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld [hl], $0
	ret

Function5879: ; 5879 (1:5879)
	call GetSpriteDirection
	rrca
	rrca
	ld e, a
	ld d, $0
	ld hl, .data
	add hl, de
	ld a, [hl]
	ld hl, $3
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld [hl], $0
	ret

.data db 6,7,8,9

UpdateSprites_:: ; 5896 (1:5896)
	ld a, [wVramState]
	bit 0, a
	ret z
	xor a
	ld [hUsedSpriteIndex], a
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call Function58fe
	call Function58b0
	pop af
	ld [hOAMUpdate], a
	ret

Function58b0: ; 58b0 (1:58b0)
	ld b, $a0
	ld a, [hUsedSpriteIndex]
	cp b
	ret nc
	ld l, a
	ld h, wOAMBuffer / $100
	ld de, $4
	ld a, b
	ld c, $a0
.asm_58bf
	ld [hl], c
	add hl, de
	cp l
	jr nz, .asm_58bf
	ret

ApplyBGMapAnchorToObjects:: ; 58c5 (1:58c5)
	push hl
	push de
	push bc
	ld a, [wce81]
	ld d, a
	ld a, [wce82]
	ld e, a
	ld bc, wPlayerStruct
	ld a, $d
.asm_58d5
	push af
	call DoesObjectHaveASprite
	jr z, .asm_58e9
	ld hl, $17
	add hl, bc
	ld a, [hl]
	add d
	ld [hl], a
	ld hl, $18
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
.asm_58e9
	ld hl, $28
	add hl, bc
	ld b, h
	ld c, l
	pop af
	dec a
	jr nz, .asm_58d5
	xor a
	ld [wce81], a
	ld [wce82], a
	pop bc
	pop de
	pop hl
	ret

Function58fe: ; 58fe (1:58fe)
	call Function5911
	ld c, $30
	call Function5960
	ld c, $20
	call Function5960
	ld c, $10
	call Function5960
	ret

Function5911: ; 5911 (1:5911)
	xor a
	ld hl, wce94
	ld bc, $d
	call ByteFill
	ld d, $0
	ld bc, wObjectStructs
	ld hl, wce94
.asm_5923
	push hl
	call DoesObjectHaveASprite
	jr z, .asm_5946
	ld hl, $d
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_5946
	ld e, $10
	ld hl, $5
	add hl, bc
	bit 0, [hl]
	jr nz, .asm_594f
	ld e, $20
	bit 1, [hl]
	jr z, .asm_594f
	ld e, $30
	jr .asm_594f

.asm_5946
	ld hl, $28
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	jr .asm_5959

.asm_594f
	ld hl, $28
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ld a, d
	or e
	ld [hli], a
.asm_5959
	inc d
	ld a, d
	cp $d
	jr nz, .asm_5923
	ret

Function5960: ; 5960 (1:5960)
	ld hl, wce94
.asm_5963
	ld a, [hli]
	ld d, a
	and $f0
	ret z
	cp c
	jr nz, .asm_5963
	push bc
	push hl
	ld a, d
	and $f
	call Function5a27
	call Function597a
	pop hl
	pop bc
	jr .asm_5963

Function597a: ; 597a (1:597a)
	xor a
	ld hl, $5
	add hl, bc
	ld e, [hl]
	bit 7, e
	jr z, .asm_5986
	or $80
.asm_5986
	bit 4, e
	jr z, .asm_598c
	or $10
.asm_598c
	ld hl, $6
	add hl, bc
	ld d, a
	ld a, [hl]
	and $7
	or d
	ld d, a
	xor a
	bit 3, e
	jr z, .asm_599d
	or $80
.asm_599d
	ld [hFFC4], a
	ld hl, $2
	add hl, bc
	ld a, [hl]
	ld [hFFC3], a
	ld hl, $17
	add hl, bc
	ld a, [hl]
	ld hl, $19
	add hl, bc
	add [hl]
	add $8
	ld e, a
	ld a, [wce81]
	add e
	ld [hFFC1], a
	ld hl, $18
	add hl, bc
	ld a, [hl]
	ld hl, $1a
	add hl, bc
	add [hl]
	add $c
	ld e, a
	ld a, [wce82]
	add e
	ld [hFFC2], a
	ld hl, $d
	add hl, bc
	ld a, [hl]
	cp $ff
	jp z, .asm_5a23
	cp $20
	jp nc, .asm_5a23
	ld l, a
	ld h, $0
	add hl, hl
	ld bc, PushOAMEnd
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hUsedSpriteIndex]
	ld c, a
	ld b, $c3
	ld a, [hli]
	ld [hUsedSpriteTile], a
	add c
	cp $a0
	jr nc, .asm_5a25
.asm_59f3
	ld a, [hFFC2]
	add [hl]
	inc hl
	ld [bc], a
	inc c
	ld a, [hFFC1]
	add [hl]
	inc hl
	ld [bc], a
	inc c
	ld e, [hl]
	inc hl
	ld a, [hFFC3]
	bit 2, e
	jr z, .asm_5a08
	xor a
.asm_5a08
	add [hl]
	inc hl
	ld [bc], a
	inc c
	ld a, e
	bit 1, a
	jr z, .asm_5a14
	ld a, [hFFC4]
	or e
.asm_5a14
	and $f0
	or d
	ld [bc], a
	inc c
	ld a, [hUsedSpriteTile]
	dec a
	ld [hUsedSpriteTile], a
	jr nz, .asm_59f3
	ld a, c
	ld [hUsedSpriteIndex], a
.asm_5a23
	xor a
	ret

.asm_5a25
	scf
	ret

Function5a27: ; 5a27 (1:5a27)
	ld c, a
	ld b, $0
	ld hl, ObjectStructPointers
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

ObjectStructPointers:
	dw wPlayerStruct
	dw wObject1Struct
	dw wObject2Struct
	dw wObject3Struct
	dw wObject4Struct
	dw wObject5Struct
	dw wObject6Struct
	dw wObject7Struct
	dw wObject8Struct
	dw wObject9Struct
	dw wObject10Struct
	dw wObject11Struct
	dw wObject12Struct
