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

ObjectMovementReset: ; 4795 (1:4795)
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	push bc
	call GetCoordTile
	pop bc
	ld hl, $e
	add hl, bc
	ld [hl], a
	call CopyNextCoordsTileToStandingCoordsTile
	call EndSpriteMovement
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

MapObjectMovementPattern: ; 47b6 (1:47b6)
	call ClearObjectStructField28
	call GetSpriteMovementFunction
	ld a, [hl]
	ld hl, .Pointers
	rst JumpTable
	ret

.Pointers:
	dw Function47fa
	dw Function47fb
	dw Function4805
	dw Function4811
	dw Function481b
	dw Function482a
	dw Function4842
	dw Function4855
	dw Function485b
	dw Function4861
	dw Function4867
	dw Function486a
	dw Function486d
	dw Function4870
	dw Function4876
	dw Function4879
	dw Function487f
	dw Function4885
	dw Function48d8
	dw Function49be
	dw Function49fa
	dw Function4931
	dw Function4947
	dw Function4a95
	dw Function4966
	dw Function495d
	dw Function4a1f
	dw Function4a62

Function47fa:
	ret

Function47fb: ; 47fb (1:47fb)
	call Random
	ldh a, [hRandom]
	and $1
	jp Function4ac9

Function4805: ; 4805 (1:4805)
	call Random
	ldh a, [hRandom]
	and $1
	or $2
	jp Function4ac9

Function4811: ; 4811 (1:4811)
	call Random
	ldh a, [hRandom]
	and $3
	jp Function4ac9

Function481b: ; 481b (1:481b)
	call Random
	ldh a, [hRandom]
	and $c
	ld hl, $8
	add hl, bc
	ld [hl], a
	jp Function4af6

Function482a: ; 482a (1:482a)
	ld hl, $8
	add hl, bc
	ld a, [hl]
	and $c
	ld d, a
	call Random
	ldh a, [hRandom]
	and $c
	cp d
	jr nz, .asm_483e
	xor $c
.asm_483e
	ld [hl], a
	jp Function4aff

Function4842: ; 4842 (1:4842)
	call Function4603
	call EndSpriteMovement
	ld hl, $b
	add hl, bc
	ld [hl], $1
	ld hl, $9
	add hl, bc
	ld [hl], $5
	ret

Function4855: ; 4855 (1:4855)
	ld hl, $4fa8
	jp Function4fe9

Function485b: ; 485b (1:485b)
	ld hl, $4fbd
	jp Function4fe9

Function4861: ; 4861 (1:4861)
	ld hl, $4fce
	jp Function4fe9

Function4867: ; 4867 (1:4867)
	jp Function4fdf

Function486a: ; 486a (1:486a)
	jp Function4fdf

Function486d: ; 486d (1:486d)
	jp Function4fdf

Function4870: ; 4870 (1:4870)
	ld hl, $4fa8
	jp Function4fe9

Function4876: ; 4876 (1:4876)
	jp Function4fdf

Function4879: ; 4879 (1:4879)
	ld hl, $5485
	jp Function4fe9

Function487f: ; 487f (1:487f)
	ld hl, $4fb6
	jp Function4fe9

Function4885: ; 4885 (1:4885)
	call MovementAnonymousJumptable
	dw .asm_488c
	dw .asm_48d1

.asm_488c
	ld hl, $e
	add hl, bc
	ld a, [hl]
	call CheckPitTile
	jr z, .asm_48ce
	ld hl, $5
	add hl, bc
	bit 2, [hl]
	res 2, [hl]
	jr z, .asm_48c7
	ld hl, $20
	add hl, bc
	ld a, [hl]
	and $3
	or $0
	call InitStep
	call CheckNPCMovementPermissions
	jr c, .asm_48c4
	ld de, $1b
	call PlaySFX
	call Function54d7
	call UpdateGrassPriority
	ld hl, $9
	add hl, bc
	ld [hl], $f
	ret

.asm_48c4
	call Function4603
.asm_48c7
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ret

.asm_48ce
	call IncrementObjectMovementByteIndex
.asm_48d1
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ret

Function48d8: ; 48d8 (1:48d8)
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	ld hl, $20
	add hl, bc
	ld a, [hl]
	push bc
	call GetObjectStruct
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_4923
	ld hl, $12
	add hl, bc
	ld a, [hl]
	cp d
	jr z, .asm_4906
	jr c, .asm_4902
	ld a, $3
	jr .asm_4916

.asm_4902
	ld a, $2
	jr .asm_4916

.asm_4906
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp e
	jr z, .asm_4923
	jr c, .asm_4914
	ld a, $0
	jr .asm_4916

.asm_4914
	ld a, $1
.asm_4916
	ld d, a
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $c
	or d
	pop bc
	jp Function53b1

.asm_4923
	pop bc
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ld hl, $b
	add hl, bc
	ld [hl], $1
	ret

Function4931: ; 4931 (1:4931)
	call EndSpriteMovement
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ld hl, $b
	add hl, bc
	ld [hl], $9
	ld hl, $9
	add hl, bc
	ld [hl], $4
	ret

Function4947: ; 4947 (1:4947)
	call EndSpriteMovement
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ld hl, $b
	add hl, bc
	ld [hl], $a
	ld hl, $9
	add hl, bc
	ld [hl], $4
	ret

Function495d: ; 495d (1:495d)
	call MovementAnonymousJumptable
	dw Function496f
	dw Function4975
	dw Function4991

Function4966: ; 4966 (1:4966)
	call MovementAnonymousJumptable
	dw Function496f
	dw Function4975
	dw Function499d

Function496f:
	call EndSpriteMovement
	call IncrementObjectMovementByteIndex
Function4975:
	ld hl, $b
	add hl, bc
	ld [hl], $1
	ld hl, $20
	add hl, bc
	ld a, [hl]
	ld a, $10
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld [hl], $3
	call IncrementObjectMovementByteIndex
	ret

Function4991:
	ld de, .data
	call Function49a9
	jr Function495d

.data
	db OW_RIGHT, OW_LEFT, OW_DOWN, OW_UP

Function499d:
	ld de, .data
	call Function49a9
	jr Function4966

.data
	db OW_LEFT, OW_RIGHT, OW_UP, OW_DOWN

Function49a9: ; 49a9 (1:49a9)
	ld hl, $8
	add hl, bc
	ld a, [hl]
	and $c
	rrca
	rrca
	push hl
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hl], a
	call DecrementObjectMovementByteIndex
	ret

Function49be: ; 49be (1:49be)
	call Function4a81
	ld hl, $b
	add hl, bc
	ld [hl], $7
	ld hl, $a
	add hl, de
	ld a, [hl]
	inc a
	add a
	add $0
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $7
	add hl, de
	ld a, [hl]
	and $3
	ld d, $e
	cp $0
	jr z, .asm_49e8
	cp $1
	jr z, .asm_49e8
	ld d, $c
.asm_49e8
	ld hl, $1a
	add hl, bc
	ld [hl], d
	ld hl, $19
	add hl, bc
	ld [hl], $0
	ld hl, $9
	add hl, bc
	ld [hl], $13
	ret

Function49fa: ; 49fa (1:49fa)
	call EndSpriteMovement
	call Function4a81
	ld hl, $b
	add hl, bc
	ld [hl], $8
	ld hl, $a
	add hl, bc
	ld [hl], $0
	ld hl, $1a
	add hl, bc
	ld [hl], $f0
	ld hl, $19
	add hl, bc
	ld [hl], $0
	ld hl, $9
	add hl, bc
	ld [hl], $13
	ret

Function4a1f: ; 4a1f (1:4a1f)
	call EndSpriteMovement
	call Function4a81
	ld hl, $b
	add hl, bc
	ld [hl], $e
	ld hl, $a
	add hl, de
	ld a, [hl]
	inc a
	add a
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $7
	add hl, de
	ld a, [hl]
	and $3
	ld e, a
	ld d, $0
	ld hl, .data
	add hl, de
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld hl, $19
	add hl, bc
	ld [hl], d
	ld hl, $1a
	add hl, bc
	ld [hl], e
	ld hl, $9
	add hl, bc
	ld [hl], $13
	ret

.data
	;   x,  y
	db  0, -4
	db  0,  8
	db  6,  2
	db -6,  2

Function4a62: ; 4a62 (1:4a62)
	call EndSpriteMovement
	call Function4a81
	ld hl, $b
	add hl, bc
	ld [hl], $f
	ld hl, $a
	add hl, de
	ld a, [hl]
	add $ff
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld [hl], $13
	ret

Function4a81: ; 4a81 (1:4a81)
	ld hl, $20
	add hl, bc
	ld a, [hl]
	push bc
	call GetObjectStruct
	ld d, b
	ld e, c
	pop bc
	ld hl, $1d
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Function4a95: ; 4a95 (1:4a95)
	call EndSpriteMovement
	ld hl, $b
	add hl, bc
	ld [hl], $0
	ld hl, $20
	add hl, bc
	ld a, [hl]
	call Function4ab7
	ld hl, $a
	add hl, bc
	ld [hl], e
	ld hl, $1e
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld [hl], $15
	ret

Function4ab7: ; 4ab7 (1:4ab7)
	ld d, a
	and $3f
	ld e, a
	ld a, d
	rlca
	rlca
	and $3
	ld d, a
	inc d
	ld a, $1
.asm_4ac4
	dec d
	ret z
	add a
	jr .asm_4ac4

Function4ac9: ; 4ac9 (1:4ac9)
	call InitStep
	call CheckNPCMovementPermissions
	jr c, .asm_4af0
	call UpdateGrassPriority
	ld hl, $b
	add hl, bc
	ld [hl], $2
	ld hl, wCenteredObject
	ldh a, [hConnectionStripLength]
	cp [hl]
	jr z, .asm_4ae9
	ld hl, $9
	add hl, bc
	ld [hl], $7
	ret

.asm_4ae9
	ld hl, $9
	add hl, bc
	ld [hl], $6
	ret

.asm_4af0
	call EndSpriteMovement
	call Function4603
Function4af6: ; 4af6 (1:4af6)
	call Random
	ldh a, [hRandom]
	and $7f
	jr asm_4b06

Function4aff: ; 4aff (1:4aff)
	call Random
	ldh a, [hRandomAdd]
	and $1f
asm_4b06
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ld hl, $b
	add hl, bc
	ld [hl], $1
	ld hl, $9
	add hl, bc
	ld [hl], $3
	ret
