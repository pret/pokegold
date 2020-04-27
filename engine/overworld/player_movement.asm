DoPlayerMovement:: ; 10000 (4:4000)
	call Function10017
	ld a, movement_step_sleep
	ld [wMovementAnimation], a
	xor a
	ld [wWalkingIntoEdgeWarp], a
	call Function1002d
	ld c, a
	ld a, [wMovementAnimation]
	ld [wPlayerNextMovement], a
	ret

Function10017: ; 10017 (4:4017)
	ldh a, [hJoyDown]
	ld [wCurInput], a
	CheckFlagHL ENGINE_DOWNHILL
	ret z
	ld c, a
	and $f0
	ret nz
	ld a, c
	or $80
	ld [wCurInput], a
	ret

Function1002d: ; 1002d (4:402d)
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
	jr z, .asm_10044
	cp PLAYER_SURF
	jr z, .asm_10060
	cp PLAYER_SURF_PIKA
	jr z, .asm_10060
	cp PLAYER_BIKE
	jr z, .asm_10044
	cp PLAYER_SKATE
	jr z, .asm_10074
.asm_10044
	call Function102cb
	call Function102ec
	call Function100b7
	ret c
	call Function10147
	ret c
	call Function1016b
	ret c
	call Function101f3
	ret c
	call Function10226
	ret c
	jr .asm_1009d

.asm_10060
	call Function102cb
	call Function102ec
	call Function100b7
	ret c
	call Function10147
	ret c
	call Function101c0
	ret c
	jr .asm_1009d

.asm_10074
	call Function102cb
	call Function102ec
	call Function100b7
	ret c
	call Function10147
	ret c
	call Function1016b
	ret c
	call Function101f3
	ret c
	call Function10226
	ret c
	ld a, [wWalkingDirection]
	cp $ff
	jr z, .asm_10098
	call Function103ee
.asm_10098
	call Function102b3
	xor a
	ret

.asm_1009d
	ld a, [wWalkingDirection]
	cp $ff
	jr z, .asm_100b2
	ld a, [wWalkingIntoEdgeWarp]
	and a
	jr nz, .asm_100ad
	call Function103ee
.asm_100ad
	call Function102bf
	xor a
	ret

.asm_100b2
	call Function102b3
	xor a
	ret

Function100b7: ; 100b7 (4:40b7)
	ld a, [wPlayerStandingTile]
	ld c, a
	call CheckWhirlpoolTile
	jr c, .asm_100c4
	ld a, $3
	scf
	ret

.asm_100c4
	and $f0
	cp $30
	jr z, .asm_100d8
	cp $40
	jr z, .asm_100ec
	cp $50
	jr z, .asm_10108
	cp $70
	jr z, .asm_10124
	jr .asm_1013c

.asm_100d8
	ld a, c
	and $3
	ld c, a
	ld b, $0
	ld hl, .water_table
	add hl, bc
	ld a, [hl]
	ld [wWalkingDirection], a
	jr .asm_1013e

.water_table
	db RIGHT
	db LEFT
	db UP
	db DOWN

.asm_100ec
	ld a, c
	and $7
	ld c, a
	ld b, $0
	ld hl, .land1_table
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_1013c
	ld [wWalkingDirection], a
	jr .asm_1013e

.land1_table
	db STANDING
	db RIGHT
	db LEFT
	db UP
	db DOWN
	db STANDING
	db STANDING
	db STANDING

.asm_10108
	ld a, c
	and $7
	ld c, a
	ld b, $0
	ld hl, .land2_table
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_1013c
	ld [wWalkingDirection], a
	jr .asm_1013e

.land2_table
	db RIGHT
	db LEFT
	db UP
	db DOWN
	db STANDING
	db STANDING
	db STANDING
	db STANDING

.asm_10124
	ld a, c
	cp $71
	jr z, .asm_10135
	cp $79
	jr z, .asm_10135
	cp $7a
	jr z, .asm_10135
	cp $7b
	jr nz, .asm_1013c
.asm_10135
	ld a, $0
	ld [wWalkingDirection], a
	jr .asm_1013e

.asm_1013c
	xor a
	ret

.asm_1013e
	ld a, $1
	call Function1025f
	ld a, $5
	scf
	ret

Function10147: ; 10147 (4:4147)
	ld a, [wPlayerTurningDirection]
	cp $0
	jr nz, .asm_10169
	ld a, [wWalkingDirection]
	cp $ff
	jr z, .asm_10169
	ld e, a
	ld a, [wPlayerDirection]
	rrca
	rrca
	and $3
	cp e
	jr z, .asm_10169
	ld a, $5
	call Function1025f
	ld a, $2
	scf
	ret

.asm_10169
	xor a
	ret

Function1016b: ; 1016b (4:416b)
	ld a, [wPlayerState]
	cp $4
	jr z, Function101c0
	cp $8
	jr z, Function101c0
	call Function1039e
	jr c, .asm_101be
	call Function10341
	and a
	jr z, .asm_101be
	cp $2
	jr z, .asm_101be
	ld a, [wPlayerStandingTile]
	call CheckIceTile
	jr nc, .asm_101b5
	call Function103ca
	jr nz, .asm_101ae
	ld hl, wBikeFlags
	bit 2, [hl]
	jr z, .asm_101a7
	ld a, [wWalkingDirection]
	cp $0
	jr z, .asm_101a7
	ld a, $1
	call Function1025f
	scf
	ret

.asm_101a7
	ld a, $2
	call Function1025f
	scf
	ret

.asm_101ae
	ld a, $1
	call Function1025f
	scf
	ret

.asm_101b5
	ld a, $4
	call Function1025f
	scf
	ret

	xor a
	ret

.asm_101be
	xor a
	ret

Function101c0: ; 101c0 (4:41c0)
	call Function103b4
	ld [wWalkingIntoLand], a
	jr c, .asm_101f1
	call Function10341
	ld [wWalkingIntoNPC], a
	and a
	jr z, .asm_101f1
	cp $2
	jr z, .asm_101f1
	ld a, [wWalkingIntoLand]
	and a
	jr nz, .asm_101e2
	ld a, $1
	call Function1025f
	scf
	ret

.asm_101e2
	call Function103f9
	call PlayMapMusic
	ld a, $1
	call Function1025f
	ld a, $6
	scf
	ret

.asm_101f1
	xor a
	ret

Function101f3: ; 101f3 (4:41f3)
	ld a, [wPlayerStandingTile]
	ld e, a
	and $f0
	cp $a0
	jr nz, .asm_1021c
	ld a, e
	and $7
	ld e, a
	ld d, $0
	ld hl, .data_1021e
	add hl, de
	ld a, [wFacingDirection]
	and [hl]
	jr z, .asm_1021c
	ld de, $16
	call PlaySFX
	ld a, $3
	call Function1025f
	ld a, $7
	scf
	ret

.asm_1021c
	xor a
	ret

.data_1021e
	db FACE_RIGHT
	db FACE_LEFT
	db FACE_UP
	db FACE_DOWN
	db FACE_RIGHT | FACE_DOWN
	db FACE_DOWN | FACE_LEFT
	db FACE_UP | FACE_RIGHT
	db FACE_UP | FACE_LEFT

Function10226: ; 10226 (4:4226)
	ld a, [wWalkingDirection]
	ld e, a
	ld d, $0
	ld hl, .edge_warps
	add hl, de
	ld a, [wPlayerStandingTile]
	cp [hl]
	jr nz, .asm_10259
	ld a, $1
	ld [wWalkingIntoEdgeWarp], a
	ld a, [wWalkingDirection]
	cp $ff
	jr z, .asm_10259
	ld e, a
	ld a, [wPlayerDirection]
	rrca
	rrca
	and $3
	cp e
	jr nz, .asm_10259
	call WarpCheck
	jr nc, .asm_10259
	call Function102b3
	scf
	ld a, $1
	ret

.asm_10259
	xor a
	ret

.edge_warps
	db $70, $78, $76, $7e

Function1025f: ; 1025f (4:425f)
	ld e, a
	ld d, $0
	ld hl, .Steps
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wWalkingDirection]
	ld e, a
	cp $ff
	jp z, Function102b3
	add hl, de
	ld a, [hl]
	ld [wMovementAnimation], a
	ld hl, $42af
	add hl, de
	ld a, [hl]
	ld [wPlayerTurningDirection], a
	ld a, $4
	ret

.Steps:
	dw .SlowStep
	dw .NormalStep
	dw .FastStep
	dw .JumpStep
	dw .SlideStep
	dw .TurningStep
	dw .BackJumpStep
	dw .FinishFacing

.SlowStep:
	slow_step DOWN
	slow_step UP
	slow_step LEFT
	slow_step RIGHT
.NormalStep:
	step DOWN
	step UP
	step LEFT
	step RIGHT
.FastStep:
	big_step DOWN
	big_step UP
	big_step LEFT
	big_step RIGHT
.JumpStep:
	jump_step DOWN
	jump_step UP
	jump_step LEFT
	jump_step RIGHT
.SlideStep:
	fast_slide_step DOWN
	fast_slide_step UP
	fast_slide_step LEFT
	fast_slide_step RIGHT
.BackJumpStep:
	jump_step UP
	jump_step DOWN
	jump_step RIGHT
	jump_step LEFT
.TurningStep:
	turn_step DOWN
	turn_step UP
	turn_step LEFT
	turn_step RIGHT
.FinishFacing:
	db $80 + DOWN
	db $80 + UP
	db $80 + LEFT
	db $80 + RIGHT

Function102b3: ; 102b3 (4:42b3)
	ld a, $0
	ld [wPlayerTurningDirection], a
	ld a, $3e
	ld [wMovementAnimation], a
	xor a
	ret

Function102bf: ; 102bf (4:42bf)
	ld a, $0
	ld [wPlayerTurningDirection], a
	ld a, $50
	ld [wMovementAnimation], a
	xor a
	ret

Function102cb: ; 102cb (4:42cb)
	call CheckStandingOnIce
	ret nc
	ld a, [wPlayerTurningDirection]
.asm_102d2
	cp $0
	ret z
	and $3
	ld e, a
	ld d, $0
	ld hl, .forced_dpad
	add hl, de
	ld a, [wCurInput]
	and $f
	or [hl]
	ld [wCurInput], a
	ret

.forced_dpad
	db D_DOWN, D_UP, D_LEFT, D_RIGHT

Function102ec: ; 102ec (4:42ec)
	ld hl, .table
	ld de, .table2 - .table1
	ld a, [wCurInput]
	bit 7, a
	jr nz, .asm_10307
	bit 6, a
	jr nz, .asm_10308
.asm_102fc
	bit 5, a
	jr nz, .asm_10309
	bit 4, a
	jr nz, .asm_1030a
	jr .asm_1030b

.asm_10307
	add hl, de
.asm_10308
	add hl, de
.asm_10309
	add hl, de
.asm_1030a
	add hl, de
.asm_1030b
	ld a, [hli]
	ld [wWalkingDirection], a
	ld a, [hli]
	ld [wFacingDirection], a
	ld a, [hli]
	ld [wWalkingX], a
	ld a, [hli]
	ld [wWalkingY], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ld [wWinTextPointer], a
	ret

.table
; struct:
;	walk direction
;	facing
;	x movement
;	y movement
;	tile collision pointer
.table1
	db STANDING, FACE_CURRENT, 0, 0
	dw wPlayerStandingTile
.table2
	db RIGHT, FACE_RIGHT,  1,  0
	dw wTileRight
	db LEFT,  FACE_LEFT,  -1,  0
	dw wTileLeft
	db UP,    FACE_UP,     0, -1
	dw wTileUp
	db DOWN,  FACE_DOWN,   0,  1
	dw wTileDown

Function10341: ; 10341 (4:4341)
	ld a, 0
	ldh [hMapObjectIndexBuffer], a
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wWalkingX]
	add d
	ld d, a
	ld a, [wPlayerStandingMapY]
	ld e, a
	ld a, [wWalkingY]
	add e
	ld e, a
	ld bc, wPlayerSprite
	farcall Function7120
	jr nc, .asm_10369
	call Function1036f
	jr c, .asm_1036c
	xor a
	ret

.asm_10369
	ld a, $1
	ret

.asm_1036c
	ld a, $2
	ret

Function1036f: ; 1036f (4:436f)
	ld hl, wBikeFlags
	bit 0, [hl]
	jr z, .asm_1039c
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_1039c
	ld hl, $6
	add hl, bc
	bit 6, [hl]
	jr z, .asm_1039c
	ld hl, $5
	add hl, bc
	set 2, [hl]
	ld a, [wWalkingDirection]
	ld d, a
	ld hl, $20
	add hl, bc
	ld a, [hl]
	and $fc
	or d
	ld [hl], a
	scf
	ret

.asm_1039c
	xor a
	ret

Function1039e: ; 1039e (4:439e)
	ld a, [wTilePermissions]
	ld d, a
	ld a, [wFacingDirection]
	and d
	jr nz, .asm_103b2
	ld a, [wWinTextPointer]
	call Function103d3
	jr c, .asm_103b2
	xor a
	ret

.asm_103b2
	scf
	ret

Function103b4: ; 103b4 (4:43b4)
	ld a, [wTilePermissions]
	ld d, a
	ld a, [wFacingDirection]
	and d
	jr nz, .asm_103c8
	ld a, [wWinTextPointer]
	call Function103da
	jr c, .asm_103c8
	and a
	ret

.asm_103c8
	scf
	ret

Function103ca: ; 103ca (4:43ca)
	ld a, [wPlayerState]
	cp $1
	ret z
	cp $2
	ret

Function103d3: ; 103d3 (4:43d3)
	call GetTileCollision
	and a
	ret z
	scf
	ret

Function103da: ; 103da (4:43da)
	call GetTileCollision
	cp $1
	jr z, .asm_103e6
	and a
	jr z, .asm_103e8
	jr .asm_103ec

.asm_103e6
	xor a
	ret

.asm_103e8
	ld a, $1
	and a
	ret

.asm_103ec
	scf
	ret

Function103ee: ; 103ee (4:43ee)
	call CheckSFX
	ret c
	ld de, $24
	call PlaySFX
	ret

Function103f9: ; 103f9 (4:43f9)
	push bc
	ld a, $0
	ld [wPlayerState], a
	call ReplaceChrisSprite
	pop bc
	ret

CheckStandingOnIce::
	ld a, [wPlayerTurningDirection]
	cp $0
	jr z, .asm_10420
	cp $f0
	jr z, .asm_10420
	ld a, [wPlayerStandingTile]
	call CheckIceTile
	jr nc, .asm_1041e
	ld a, [wPlayerState]
	cp $2
	jr nz, .asm_10420
.asm_1041e
	scf
	ret

.asm_10420
	and a
	ret

StopPlayerForEvent::
	ld hl, wPlayerNextMovement
	ld a, $3e
	cp [hl]
	ret z
	ld [hl], a
	ld a, $0
	ld [wPlayerTurningDirection], a
	ret
