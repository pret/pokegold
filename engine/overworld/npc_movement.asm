CheckNPCMovementPermissions: ; 6fa0 (1:6fa0)
	ld hl, $6
	add hl, bc
	bit 5, [hl]
	jr z, .asm_6fb8
	ld hl, $4
	add hl, bc
	bit 4, [hl]
	push hl
	push bc
	call Function700b
	pop bc
	pop hl
	ret c
	jr .asm_6fc8

.asm_6fb8
	ld hl, $4
	add hl, bc
	bit 4, [hl]
	jr nz, .asm_6fc8
	push hl
	push bc
	call Function6fe6
	pop bc
	pop hl
	ret c
.asm_6fc8
	bit 6, [hl]
	jr nz, .asm_6fd4
	push hl
	push bc
	call WillPersonBumpIntoSomeoneElse
	pop bc
	pop hl
	ret c
.asm_6fd4
	bit 5, [hl]
	jr nz, .asm_6fe4
	push hl
	call HasPersonReachedMovementLimit
	pop hl
	ret c
	push hl
	call IsPersonMovingOffEdgeOfScreen
	pop hl
	ret c
.asm_6fe4
	and a
	ret

Function6fe6: ; 6fe6 (1:6fe6)
	call Function703e
	ret c
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	ld hl, $6
	add hl, bc
	bit 7, [hl]
	jp nz, Function7080
	ld hl, $e
	add hl, bc
	ld a, [hl]
	ld d, a
	call GetTileCollision
	and a
	jr z, Function701d
	scf
	ret

Function700b: ; 700b (1:700b)
	call Function703e
	ret c
	ld hl, $e
	add hl, bc
	ld a, [hl]
	call GetTileCollision
	cp $1
	jr z, Function701d
	scf
	ret

Function701d
	ld hl, $e
	add hl, bc
	ld a, [hl]
	call Function705e
	ret nc
	push af
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $3
	ld e, a
	ld d, $0
	ld hl, .data_703a
	add hl, de
	pop af
	and [hl]
	ret z
	scf
	ret

.data_703a
	db 1 << DOWN, 1 << UP, 1 << RIGHT, 1 << LEFT

Function703e: ; 703e (1:703e)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	call Function705e
	ret nc
	push af
	ld hl, $7
	add hl, bc
	and $3
	ld e, a
	ld d, $0
	ld hl, .data_705a
	add hl, de
	pop af
	and [hl]
	ret z
	scf
	ret

.data_705a
	db 1 << UP, 1 << DOWN, 1 << LEFT, 1 << RIGHT

Function705e: ; 705e (1:705e)
	ld d, a
	and $f0
	cp $b0
	jr z, .asm_706b
	cp $c0
	jr z, .asm_706b
	xor a
	ret

.asm_706b
	ld a, d
	and $7
	ld e, a
	ld d, $0
	ld hl, .data_7078
	add hl, de
	ld a, [hl]
	scf
	ret

.data_7078
	db  8, 4, 1, 2
	db 10, 6, 9, 5

Function7080: ; 7080 (1:7080)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $3
	jr z, .asm_7091
	dec a
	jr z, .asm_7096
	dec a
	jr z, .asm_709a
	jr .asm_709e

.asm_7091
	inc e
	push de
	inc d
	jr .asm_70a1

.asm_7096
	push de
	inc d
	jr .asm_70a1

.asm_709a
	push de
	inc e
	jr .asm_70a1

.asm_709e
	inc d
	push de
	inc e
.asm_70a1
	call GetCoordTile
	call GetTileCollision
	pop de
	and a
	jr nz, .asm_70b6
	call GetCoordTile
	call GetTileCollision
	and a
	jr nz, .asm_70b6
	xor a
	ret

.asm_70b6
	scf
	ret

CheckFacingObject:
	call GetFacingTileCoord
	call CheckCounterTile
	jr nz, .asm_70d0
	ld a, [wPlayerStandingMapX]
	sub d
	cpl
	inc a
	add d
	ld d, a
	ld a, [wPlayerStandingMapY]
	sub e
	cpl
	inc a
	add e
	ld e, a
.asm_70d0
	ld bc, wObjectStructs
	ld a, $0
	ldh [hMapObjectIndexBuffer], a
	call Function7120
	ret nc
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_70e6
	xor a
	ret

.asm_70e6
	scf
	ret

WillPersonBumpIntoSomeoneElse: ; 70e8 (1:70e8)
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	jr Function7120

Function70f4:
	ldh a, [hMapObjectIndexBuffer]
	call GetObjectStruct
	call Function7100
	call Function7120
	ret

Function7100: ; 7100 (1:7100)
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	call GetSpriteDirection
	and a
	jr z, .asm_711a
	cp $4
	jr z, .asm_711c
	cp $8
	jr z, .asm_711e
	inc d
	ret

.asm_711a
	inc e
	ret

.asm_711c
	dec e
	ret

.asm_711e
	dec d
	ret

Function7120: ; 7120 (1:7120)
	ld bc, wPlayerStruct
	xor a
.asm_7124
	ldh [hObjectStructIndexBuffer], a
	call DoesObjectHaveASprite
	jr z, .asm_7172
	ld hl, $4
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_7172
	ld hl, $6
	add hl, bc
	bit 7, [hl]
	jr z, .asm_7142
	call Function7250
	jr nc, .asm_715a
	jr .asm_7152

.asm_7142
	ld hl, $10
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .asm_715a
	ld hl, $11
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .asm_715a
.asm_7152
	ldh a, [hMapObjectIndexBuffer]
	ld l, a
	ldh a, [hConnectedMapWidth]
	cp l
	jr nz, .asm_7181
.asm_715a
	ld hl, $12
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .asm_7172
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .asm_7172
	ldh a, [hConnectionStripLength]
	ld l, a
	ldh a, [hObjectStructIndexBuffer]
	cp l
	jr nz, .asm_7181
.asm_7172
	ld hl, $28
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hConnectedMapWidth]
	inc a
	cp $d
	jr nz, .asm_7124
	and a
	ret

.asm_7181
	scf
	ret

HasPersonReachedMovementLimit: ; 7183 (1:7183)
	ld hl, $16
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_71c8
	and $f
	jr z, .asm_71a6
	ld e, a
	ld d, a
	ld hl, $14
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	ld a, [hl]
	add e
	ld e, a
	ld hl, $10
	add hl, bc
	ld a, [hl]
	cp d
	jr z, .asm_71ca
	cp e
	jr z, .asm_71ca
.asm_71a6
	ld hl, $16
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	jr z, .asm_71c8
	ld e, a
	ld d, a
	ld hl, $15
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	ld a, [hl]
	add e
	ld e, a
	ld hl, $11
	add hl, bc
	ld a, [hl]
	cp d
	jr z, .asm_71ca
	cp e
	jr z, .asm_71ca
.asm_71c8
	xor a
	ret

.asm_71ca
	scf
	ret

IsPersonMovingOffEdgeOfScreen: ; 71cc (1:71cc)
	ld hl, $10
	add hl, bc
	ld a, [wXCoord]
	cp [hl]
	jr z, .asm_71dd
	jr nc, .asm_71f0
	add $9
	cp [hl]
	jr c, .asm_71f0
.asm_71dd
	ld hl, $11
	add hl, bc
	ld a, [wYCoord]
	cp [hl]
	jr z, .asm_71ee
	jr nc, .asm_71f0
	add $8
	cp [hl]
	jr c, .asm_71f0
.asm_71ee
	and a
	ret

.asm_71f0
	scf
	ret

Function71f2
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wPlayerStandingMapY]
	ld e, a
	ld bc, wObjectStructs
	xor a
.asm_71fe
	ldh [hConnectedMapWidth], a
	call DoesObjectHaveASprite
	jr z, .asm_723f
	ld hl, $3
	add hl, bc
	ld a, [hl]
	cp $15
	jr nz, .asm_7215
	call Function7250
	jr c, .asm_724e
	jr .asm_723f

.asm_7215
	ld hl, $11
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .asm_722d
	ld hl, $10
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .asm_722d
	ldh a, [hObjectStructIndexBuffer]
	cp $0
	jr z, .asm_723f
	jr .asm_724e

.asm_722d
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .asm_723f
	ld hl, $12
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .asm_723f
	jr .asm_724e

.asm_723f
	ld hl, $28
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hConnectedMapWidth]
	inc a
	cp $d
	jr nz, .asm_71fe
	xor a
	ret

.asm_724e
	scf
	ret

Function7250: ; 7250 (1:7250)
	ld hl, $10
	add hl, bc
	ld a, d
	sub [hl]
	jr c, .asm_726a
	cp $2
	jr nc, .asm_726a
	ld hl, $11
	add hl, bc
	ld a, e
	sub [hl]
	jr c, .asm_726a
	cp $2
	jr nc, .asm_726a
	scf
	ret

.asm_726a
	and a
	ret
