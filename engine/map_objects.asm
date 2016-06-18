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

Function4442:
	call .CheckObjectStillVisible
	ret c
	call .HandleStepType
	call .HandleObjectAction
	ret

.CheckObjectStillVisible: ; 4387 (1:4387)
	ld hl, $5
	add hl, bc
	res 6, [hl]
	ld a, [wda03]
	ld e, a
	ld hl, $10
	add hl, bc
	ld a, [hl]
	add $1
	sub e
	jr c, .asm_43b3
	cp $c
	jr nc, .asm_43b3
	ld a, [wda02]
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
	ld a, [wda03]
	ld e, a
	ld hl, $14
	add hl, bc
	ld a, [hl]
	add $1
	sub e
	jr c, .asm_43df
	cp $c
	jr nc, .asm_43df
	ld a, [wda02]
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
	call Function47b6
	ld hl, $9
	add hl, bc
	ld a, [hl]
	and a
	ret z
	cp $1
	ret z
.asm_4422
	ld hl, $4b1e
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

RestoreDefaultMovement:
	ld hl, $1
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_4756
	push bc
	call GetMapObject
	ld hl, $4
	add hl, bc
	ld a, [hl]
	pop bc
	ret

.asm_4756
	ld a, $6
	ret

ClearObjectMovementByteIndex:
	ld hl, $1b
	add hl, bc
	ld [hl], $0
	ret

IncrementObjectMovementByteIndex:
	ld hl, $1b
	add hl, bc
	inc [hl]
	ret

DecrementObjectMovementByteIndex:
	ld hl, $1b
	add hl, bc
	dec [hl]
	ret

MovementAnonymousJumptable:
	ld hl, $1b
	add hl, bc
	ld a, [hl]
	pop hl
	rst JumpTable
	ret

ClearObjectStructField28:
	ld hl, $1c
	add hl, bc
	ld [hl], $0
	ret

IncrementObjectStructField28:
	ld hl, $1c
	add hl, bc
	inc [hl]
	ret

Object28AnonymousJumptable:
	ld hl, $1c
	add hl, bc
	ld a, [hl]
	pop hl
	rst JumpTable
	ret

GetValueObjectStructField28:
	ld hl, $1c
	add hl, bc
	ld a, [hl]
	ret

SetValueObjectStructField28:
	ld hl, $1c
	add hl, bc
	ld [hl], a
	ret

ObjectMovementReset:
	dr $4795, $47b6
Function47b6:
	dr $47b6, $557f
Function557f::
	dr $557f, $5730
Function5730::
	dr $5730, $5795
StopFollow::
	dr $5795, $5896
UpdateSprites_::
	dr $5896, $58c5
