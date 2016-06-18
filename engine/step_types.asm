StepTypesJumptable: ; 4b1e
	dw ObjectMovementReset
	dw MapObjectMovementPattern
	dw Function4e02
	dw Function4db4
	dw Function4df8
	dw Function4de3
	dw Function4e2d
	dw Function4e1e
	dw Function4b5d
	dw Function4b96
	dw Function4e5a
	dw Function4dd6
	dw Function4bef
	dw Function4c60
	dw Function4ceb
	dw Function4ea4
	dw Function4d55
	dw Function4d86
	dw Function4d9f
	dw Function4edb
	dw Function4f0a
	dw Function4f0a
	dw Function4f4e
	dw Function4f51
	dw Function4dc7

Function4b50: ; 4b50 (1:4b50)
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4b5d: ; 4b5d (1:4b5d)
	call Object28AnonymousJumptable
	dw Function4b64
	dw Function4b80

Function4b64:
	call AddStepVector
	call Function4f7d
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	call GetNextTile
	ld hl, $5
	add hl, bc
	res 3, [hl]
	call IncrementObjectStructField28
	ret

Function4b80:
	call AddStepVector
	call Function4f7d
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4b96: ; 4b96 (1:4b96)
	call Object28AnonymousJumptable
	dw Function4ba1
	dw Function4ba9
	dw Function4bc9
	dw Function4bd4
	
Function4ba1:
	ld hl, wPlayerStepFlags
	set 7, [hl]
	call IncrementObjectStructField28
Function4ba9:
	call Function4f7d
	call UpdatePlayerStep
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, $5
	add hl, bc
	res 3, [hl]
	ld hl, wPlayerStepFlags
	set 6, [hl]
	set 4, [hl]
	call IncrementObjectStructField28
	ret

Function4bc9:
	call GetNextTile
	ld hl, wPlayerStepFlags
	set 7, [hl]
	call IncrementObjectStructField28
Function4bd4:
	call Function4f7d
	call UpdatePlayerStep
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	ld hl, wPlayerStepFlags
	set 6, [hl]
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4bef: ; 4bef (1:4bef)
	call Object28AnonymousJumptable
	dw Function4bfa
	dw Function4c09
	dw Function4c19
	dw Function4c34

Function4bfa:
	ld hl, $c
	add hl, bc
	ld [hl], $0
	ld hl, $a
	add hl, bc
	ld [hl], $10
	call IncrementObjectStructField28
Function4c09:
	ld hl, $b
	add hl, bc
	ld [hl], $4
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
	ret

Function4c19:
	ld hl, $c
	add hl, bc
	ld [hl], $0
	ld hl, $1f
	add hl, bc
	ld [hl], $10
	ld hl, $a
	add hl, bc
	ld [hl], $10
	ld hl, $5
	add hl, bc
	res 3, [hl]
	call IncrementObjectStructField28
Function4c34:
	ld hl, $b
	add hl, bc
	ld [hl], $4
	ld hl, $1f
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld d, $60
	call Sine
	ld a, h
	sub $60
	ld hl, $1a
	add hl, bc
	ld [hl], a
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	ld hl, $c
	add hl, bc
	ld [hl], $0
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4c60: ; 4c60 (1:4c60)
	call Object28AnonymousJumptable
	dw Function4c71
	dw Function4c81
	dw Function4c8a
	dw Function4ca0
	dw Function4cc2
	dw Function4ccc
	dw Function4cd8

Function4c71:
	ld hl, $b
	add hl, bc
	ld [hl], $0
	ld hl, $a
	add hl, bc
	ld [hl], $10
	call IncrementObjectStructField28
	ret

Function4c81:
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
Function4c8a:
	ld hl, $c
	add hl, bc
	ld [hl], $0
	ld hl, $1f
	add hl, bc
	ld [hl], $0
	ld hl, $a
	add hl, bc
	ld [hl], $10
	call IncrementObjectStructField28
	ret

Function4ca0:
	ld hl, $b
	add hl, bc
	ld [hl], $4
	ld hl, $1f
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld d, $60
	call Sine
	ld a, h
	sub $60
	ld hl, $1a
	add hl, bc
	ld [hl], a
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
Function4cc2:
	ld hl, $a
	add hl, bc
	ld [hl], $10
	call IncrementObjectStructField28
	ret

Function4ccc:
	ld hl, $b
	add hl, bc
	ld [hl], $4
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
Function4cd8:
	ld hl, $c
	add hl, bc
	ld [hl], $0
	ld hl, $1a
	add hl, bc
	ld [hl], $0
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4ceb: ; 4ceb (1:4ceb)
	call Object28AnonymousJumptable
	dw Function4cf6
	dw Function4d05
	dw Function4d26
	dw Function4d42

Function4cf6:
	ld hl, $b
	add hl, bc
	ld [hl], $0
	ld hl, $a
	add hl, bc
	ld [hl], $10
	call IncrementObjectStructField28
Function4d05:
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	ld hl, $b
	add hl, bc
	ld [hl], $2
	ld hl, $c
	add hl, bc
	ld [hl], $0
	ld hl, $1f
	add hl, bc
	ld [hl], $0
	ld hl, $a
	add hl, bc
	ld [hl], $10
	call IncrementObjectStructField28
Function4d26:
	ld hl, $1f
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld d, $60
	call Sine
	ld a, h
	sub $60
	ld hl, $1a
	add hl, bc
	ld [hl], a
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
Function4d42:
	ld hl, $c
	add hl, bc
	ld [hl], $0
	ld hl, $1a
	add hl, bc
	ld [hl], $0
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4d55: ; 4d55 (1:4d55)
	call Object28AnonymousJumptable
	dw Function4d5c
	dw Function4d6b

Function4d5c:
	ld hl, $a
	add hl, bc
	ld [hl], $8
	ld hl, $1a
	add hl, bc
	ld [hl], $0
	call IncrementObjectStructField28
Function4d6b:
	ld hl, $1a
	add hl, bc
	ld a, [hl]
	xor $1
	ld [hl], a
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	ld hl, $1a
	add hl, bc
	ld [hl], $0
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4d86: ; 4d86 (1:4d86)
	call Function4d8c
	jp Function4b50

Function4d8c: ; 4d8c (1:4d8c)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	and $1
	ld a, $1
	jr z, .asm_4d99
	ld a, $0
.asm_4d99
	ld hl, $b
	add hl, bc
	ld [hl], a
	ret

Function4d9f: ; 4d9f (1:4d9f)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	and $1
	ld a, $4
	jr z, .asm_4dac
	ld a, $5
.asm_4dac
	ld hl, $b
	add hl, bc
	ld [hl], a
	jp Function4b50

Function4db4: ; 4db4 (1:4db4)
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4dc7: ; 4dc7 (1:4dc7)
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	jp DeleteMapObject

Function4dd6: ; 4dd6 (1:4dd6)
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4de3: ; 4de3 (1:4de3)
	call Object28AnonymousJumptable
	dw Function4dea
	dw Function4df8

Function4dea:
	call RestoreDefaultMovement
	call GetInitialFacing
	ld hl, $8
	add hl, bc
	ld [hl], a
	call IncrementObjectStructField28
Function4df8: ; 4df8 (1:4df8)
	call Function4f5a
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ret

Function4e02: ; 4e02 (1:4e02)
	call Function4f5a
	call AddStepVector
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4e1e: ; 4e1e (1:4e1e)
	call AddStepVector
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	jp Function4af6

Function4e2d: ; 4e2d (1:4e2d)
	call Object28AnonymousJumptable
	dw Function4e34
	dw Function4e3c

Function4e34:
	ld hl, wPlayerStepFlags
	set 7, [hl]
	call IncrementObjectStructField28
Function4e3c:
	call UpdatePlayerStep
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	ld hl, wPlayerStepFlags
	set 6, [hl]
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4e5a: ; 4e5a (1:4e5a)
	call Object28AnonymousJumptable
	dw Function4e65
	dw Function4e7b
	dw Function4e84
	dw Function4e97

Function4e65:
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ld hl, $c
	add hl, bc
	ld a, [hl]
	ld [hl], $2
	ld hl, $a
	add hl, bc
	ld [hl], $2
	call IncrementObjectStructField28
Function4e7b:
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
Function4e84:
	ld hl, $1d
	add hl, bc
	ld a, [hl]
	ld hl, $8
	add hl, bc
	ld [hl], a
	ld hl, $a
	add hl, bc
	ld [hl], $2
	call IncrementObjectStructField28
Function4e97:
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4ea4: ; 4ea4 (1:4ea4)
	call AddStepVector
	ld hl, $a
	add hl, bc
	dec [hl]
	ret nz
	push bc
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	ld hl, $1
	add hl, bc
	ld a, [hl]
	ld b, a
	callba CopyDECoordsToMapObject
	pop bc
	ld hl, $5
	add hl, bc
	res 2, [hl]
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function4edb: ; 4edb (1:4edb)
	ld hl, $1d
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_4f07
	ld hl, $17
	add hl, de
	ld a, [hl]
	ld hl, $17
	add hl, bc
	ld [hl], a
	ld hl, $18
	add hl, de
	ld a, [hl]
	ld hl, $18
	add hl, bc
	ld [hl], a
	ld hl, $a
	add hl, bc
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret nz
.asm_4f07
	jp DeleteMapObject

Function4f0a: ; 4f0a (1:4f0a)
	call Object28AnonymousJumptable
	dw Function4f11
	dw Function4f1a

Function4f11:
	xor a
	ld hl, $1d
	add hl, bc
	ld [hl], a
	call IncrementObjectStructField28
Function4f1a:
	ld hl, $1d
	add hl, bc
	ld d, [hl]
	ld a, [wPlayerStepVectorY]
	sub d
	ld [wPlayerStepVectorY], a
	ld hl, $a
	add hl, bc
	dec [hl]
	jr z, .asm_4f3f
	ld a, [hl]
	call Function4f43
	ld hl, $1d
	add hl, bc
	ld [hl], a
	ld d, a
	ld a, [wPlayerStepVectorY]
	add d
	ld [wPlayerStepVectorY], a
	ret

.asm_4f3f
	call DeleteMapObject
	ret

Function4f43: ; 4f43 (1:4f43)
	ld hl, $1e
	add hl, bc
	and $1
	ld a, [hl]
	ret z
	cpl
	inc a
	ret

Function4f4e: ; 4f4e (1:4f4e)
	call Object28AnonymousJumptable
Function4f51: ; 4f51 (1:4f51)
	call Object28AnonymousJumptable
	dw Function4f5a
	dw Function4f5a
	dw Function4f5a

Function4f5a: ; 4f5a (1:4f5a)
	ret

Function4f5b:
	ld hl, $1d
	add hl, bc
	inc [hl]
	ld a, [hl]
	srl a
	srl a
	and $7
	ld l, a
	ld h, $0
	ld de, .data
	add hl, de
	ld a, [hl]
	ld hl, $1a
	add hl, bc
	ld [hl], a
	ret

.data
	db 0, -1, -2, -3, -4, -3, -2, -1

Function4f7d: ; 4f7d (1:4f7d)
	call GetStepVector
	ld a, h
	ld hl, $1f
	add hl, bc
	ld e, [hl]
	add e
	ld [hl], a
	nop
	srl e
	ld d, $0
	ld hl, .data
	add hl, de
	ld a, [hl]
	ld hl, $1a
	add hl, bc
	ld [hl], a
	ret

.data
	db  -4,  -6,  -8, -10, -11, -12, -12, -12
	db -11, -10,  -9,  -8,  -6,  -4,   0,   0

Function4fa8:
	ld a, [wce87]
	ld hl, wce88
	ld [hl], a
	ld a, $3e
	ld [wce87], a
	ld a, [hl]
	ret
