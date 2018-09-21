GetSpritePalette:: ; 169c
	push hl
	push de
	push bc
	ld c, a
	callba GetSpritePalette_
	ld a, c
	pop bc
	pop de
	pop hl
	ret

GetSpriteVTile::
	push hl
	push bc
	ld hl, wUsedSprites + 2
	ld c, $b
	ld b, a
	ld a, [hMapObjectIndexBuffer]
	cp $0
	jr z, .asm_16c8
	ld a, b
.asm_16ba
	cp [hl]
	jr z, .asm_16cd
	inc hl
	inc hl
	dec c
	jr nz, .asm_16ba
	ld a, [wUsedSprites + 1]
	scf
	jr .asm_16d0

.asm_16c8
	ld a, [wUsedSprites + 1]
	jr .asm_16d0

.asm_16cd
	inc hl
	xor a
	ld a, [hl]
.asm_16d0
	pop bc
	pop hl
	ret

DoesSpriteHaveFacings::
	push de
	push hl
	ld b, a
	ld a, [hROMBank]
	push af
	ld a, BANK(DoesSpriteHaveFacings_)
	rst Bankswitch
	ld a, b
	call DoesSpriteHaveFacings_
	ld c, a
	pop de
	ld a, d
	rst Bankswitch
	pop hl
	pop de
	ret

GetPlayerStandingTile::
	ld a, [wPlayerStandingTile]
	call GetTileCollision
	ld b, a
	ret

CheckOnWater::
	ld a, [wPlayerStandingTile]
	call GetTileCollision
	sub $1
	ret z
	and a
	ret

GetTileCollision:: ; 16fa (0:16fa)
	push de
	push hl
	ld hl, TileCollisionTable
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hROMBank]
	push af
	ld a, BANK(TileCollisionTable)
	rst Bankswitch
	ld e, [hl]
	pop af
	rst Bankswitch
	ld a, e
	and $f
	pop hl
	pop de
	ret

CheckGrassTile::
	ld d, a
	and $f0
	cp $10
	jr z, .asm_171f
	cp $20
	jr z, .asm_1725
	scf
	ret

.asm_171f
	ld a, d
	and $7
	ret z
	scf
	ret

.asm_1725
	ld a, d
	and $7
	ret z
	scf
	ret

CheckSuperTallGrassTile::
	cp $14
	ret z
	cp $1c
	ret

CheckCutTreeTile::
	cp $12
	ret z
	cp $1a
	ret

CheckHeadbuttTreeTile::
	cp $15
	ret z
	cp $1d
	ret

CheckCounterTile::
	cp $90
	ret z
	cp $98
	ret

CheckPitTile::
	cp $60
	ret z
	cp $68
	ret

CheckIceTile::
	cp $23
	ret z
	cp $2b
	ret z
	scf
	ret

CheckWhirlpoolTile::
	nop
	cp $24
	ret z
	cp $2c
	ret z
	scf
	ret

CheckWaterfallTile::
	cp $33
	ret z
	cp $3b
	ret

CheckStandingOnEntrance::
	ld a, [wPlayerStandingTile]
	cp $71
	ret z
	cp $79
	ret z
	cp $7a
	ret z
	cp $7b
	ret

GetMapObject:: ; 176f (0:176f)
	ld hl, wMapObjects
	ld bc, $10
	call AddNTimes
	ld b, h
	ld c, l
	ret

CheckObjectVisibility:: ; 177b (0:177b)
	ld [hConnectionStripLength], a
	call GetMapObject
	ld hl, 0
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_1790
	ld [hObjectStructIndexBuffer], a
	call GetObjectStruct
	and a
	ret

.asm_1790
	scf
	ret

CheckObjectTime::
	ld hl, $6
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_17be
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_17b9
	ld hl, .TimeOfDayValues_17bb
	ld a, [wTimeOfDay]
	add l
	ld l, a
	jr nc, .asm_17af
	inc h
.asm_17af
	ld a, [hl]
	ld hl, $7
	add hl, bc
	and [hl]
	jr nz, .asm_17b9
	scf
	ret

.asm_17b9
	and a
	ret

.TimeOfDayValues_17bb:
	db MORN
	db DAY
	db NITE

.asm_17be
	ld hl, $6
	add hl, bc
	ld d, [hl]
	ld hl, $7
	add hl, bc
	ld e, [hl]
	ld hl, hHours
	ld a, d
	cp e
	jr z, .asm_17e6
	jr c, .asm_17dc
	ld a, [hl]
	cp d
	jr nc, .asm_17e6
	cp e
	jr c, .asm_17e6
	jr z, .asm_17e6
	jr .asm_17e8

.asm_17dc
	ld a, e
	cp [hl]
	jr c, .asm_17e8
	ld a, [hl]
	cp d
	jr nc, .asm_17e6
	jr .asm_17e8

.asm_17e6
	and a
	ret

.asm_17e8
	scf
	ret

Function17ea::
	ld [hMapObjectIndexBuffer], a
	call GetMapObject
	call CopyObjectStruct_
	ret

CopyObjectStruct::
	ld [hMapObjectIndexBuffer], a
	call UnmaskObject
	ld a, [hConnectionStripLength]
	call GetMapObject
	callba CopyObjectStruct_
	ret

ApplyDeletionToMapObject:: ; 1804 (0:1804)
	ld [hConnectionStripLength], a
	call GetMapObject
	ld hl, 0
	add hl, bc
	ld a, [hl]
	cp $ff
	ret z
	ld [hl], $ff
	push af
	call DeleteOject_CheckStopFollow
	pop af
	call GetObjectStruct
	callba DeleteMapObject
	ret

DeleteOject_CheckStopFollow:: ; 1822 (0:1822)
	ld hl, wObjectFollow_Leader
	cp [hl]
	jr z, .asm_182d
	ld hl, wObjectFollow_Follower
	cp [hl]
	ret nz
.asm_182d
	callba StopFollow
	ld a, $ff
	ld [wObjectFollow_Leader], a
	ld [wObjectFollow_Follower], a
	ret

DeleteObjectStruct::
	call ApplyDeletionToMapObject
	call MaskObject
	ret

CopyPlayerObjectTemplate::
	push hl
	call GetMapObject
	ld d, b
	ld e, c
	ld a, $ff
	ld [de], a
	inc de
	pop hl
	ld bc, $f
	call CopyBytes
	ret

Function1855::
	call GetMapObject
	ld hl, 0
	add hl, bc
	ld a, [hl]
	push af
	ld [hl], $ff
	inc hl
	ld bc, $f
	xor a
	call ByteFill
	pop af
	cp $ff
	ret z
	cp $d
	ret nc
	ld b, a
	ld a, [wObjectFollow_Leader]
	cp b
	jr nz, .asm_187b
	ld a, $ff
	ld [wObjectFollow_Leader], a
.asm_187b
	ld a, b
	call GetObjectStruct
	callba DeleteMapObject
	ret

LoadMovementDataPointer::
	ld [wMovementPerson], a
	ld a, [hROMBank]
	ld [wMovementDataPointerBank], a
	ld a, l
	ld [wMovementDataPointerAddr], a
	ld a, h
	ld [wMovementDataPointerAddr + 1], a
	ld a, [wMovementPerson]
	call CheckObjectVisibility
	ret c
	ld hl, $3
	add hl, bc
	ld [hl], $14
	ld hl, $9
	add hl, bc
	ld [hl], $0
	ld hl, wVramState
	set 7, [hl]
	and a
	ret

FindFirstEmptyObjectStruct::
	push bc
	push de
	ld hl, wObjectStructs
	ld de, $28
	ld c, $d
.asm_18ba
	ld a, [hl]
	and a
	jr z, .asm_18c5
	add hl, de
	dec c
	jr nz, .asm_18ba
	xor a
	jr .asm_18c9

.asm_18c5
	ld a, $d
	sub c
	scf
.asm_18c9
	pop de
	pop bc
	ret

GetSpriteMovementFunction::
	ld hl, $3
	add hl, bc
	ld a, [hl]
	cp $25
	jr c, .asm_18d6
	xor a
.asm_18d6
	ld hl, SpriteMovementData
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, [hl]
	ret

GetInitialFacing::
	push bc
	push de
	ld e, a
	ld d, $0
	ld hl, SpriteMovementData + 1
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, BANK(SpriteMovementData)
	call GetFarByte
	add a
	add a
	and $c
	pop de
	pop bc
	ret

CopySpriteMovementData::
	ld l, a
	ld a, [hROMBank]
	push af
	ld a, BANK(SpriteMovementData)
	rst Bankswitch
	ld a, l
	push bc
	call .CopyData
	pop bc
	pop af
	rst Bankswitch
	ret

.CopyData:
	ld hl, $3
	add hl, de
	ld [hl], a
	push de
	ld e, a
	ld d, $0
	ld hl, $4275
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld b, h
	ld c, l
	pop de
	ld a, [bc]
	inc bc
	rlca
	rlca
	and $c
	ld hl, $8
	add hl, de
	ld [hl], a
	ld a, [bc]
	inc bc
	ld hl, $b
	add hl, de
	ld [hl], a
	ld a, [bc]
	inc bc
	ld hl, $4
	add hl, de
	ld [hl], a
	ld a, [bc]
	inc bc
	ld hl, $5
	add hl, de
	ld [hl], a
	ld a, [bc]
	inc bc
	ld hl, $6
	add hl, de
	ld [hl], a
	ret

GetMovementByte_::
	ld a, [hROMBank]
	push af
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld d, [hl]
	ld hl, $1b
	add hl, bc
	add [hl]
	ld e, a
	ld a, d
	adc $0
	ld d, a
	inc [hl]
	ld a, [de]
	ld h, a
	pop af
	rst Bankswitch
	ld a, h
	ret

SetVramState_Bit0::
	ld hl, wVramState
	set 0, [hl]
	ret

ResetVramState_Bit0::
	ld hl, wVramState
	res 0, [hl]
	ret

UpdateSprites:: ; 196f (0:196f)
	ld a, [wVramState]
	bit 0, a
	ret z
	callba Function557f
	callba UpdateSprites_
	ret

GetObjectStruct:: ; 1982 (0:1982)
	ld bc, $28
	ld hl, wObjectStructs
	call AddNTimes
	ld b, h
	ld c, l
	ret

DoesObjectHaveASprite::
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	ret

SetSpriteDirection::
	push af
	ld hl, $8
	add hl, bc
	ld a, [hl]
	and $f3
	ld e, a
	pop af
	and $c
	or e
	ld [hl], a
	ret

GetSpriteDirection::
	ld hl, $8
	add hl, bc
	ld a, [hl]
	and $c
	ret
