DoBattleAnimFrame:
	ld hl, BATTLEANIMSTRUCT_FUNCTION
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to BATTLEANIMFUNC_* constants
	dw BattleAnimFunction_Null ; 00
	dw BattleAnimFunction_01 ; 01
	dw BattleAnimFunction_02 ; 02
	dw BattleAnimFunction_03 ; 03
	dw BattleAnimFunction_04 ; 04
	dw BattleAnimFunction_ThrowFromPlayerToEnemy ; 05
	dw BattleAnimFunction_ThrowFromPlayerToEnemyAndDisappear ; 06
	dw BattleAnimFunction_07 ; 07
	dw BattleAnimFunction_08 ; 08
	dw BattleAnimFunction_09 ; 09
	dw BattleAnimFunction_0A ; 0a
	dw BattleAnimFunction_RazorLeaf ; 0b
	dw BattleAnimFunction_0C ; 0c
	dw BattleAnimFunction_0D ; 0d
	dw BattleAnimFunction_0E ; 0e
	dw BattleAnimFunction_0F ; 0f
	dw BattleAnimFunction_10 ; 10
	dw BattleAnimFunction_11 ; 11
	dw BattleAnimFunction_PokeBall ; 12
	dw BattleAnimFunction_PokeBallBlocked ; 13
	dw BattleAnimFunction_14 ; 14
	dw BattleAnimFunction_15 ; 15
	dw BattleAnimFunction_16 ; 16
	dw BattleAnimFunction_17 ; 17
	dw BattleAnimFunction_18 ; 18
	dw BattleAnimFunction_19 ; 19
	dw BattleAnimFunction_1A ; 1a
	dw BattleAnimFunction_1B ; 1b
	dw BattleAnimFunction_1C ; 1c
	dw BattleAnimFunction_1D ; 1d
	dw BattleAnimFunction_1E ; 1e
	dw BattleAnimFunction_1F ; 1f
	dw BattleAnimFunction_LeechSeed ; 20
	dw BattleAnimFunction_21 ; 21
	dw BattleAnimFunction_22 ; 22
	dw BattleAnimFunction_23 ; 23
	dw BattleAnimFunction_24 ; 24
	dw BattleAnimFunction_25 ; 25
	dw BattleAnimFunction_26 ; 26
	dw BattleAnimFunction_27 ; 27
	dw BattleAnimFunction_28 ; 28
	dw BattleAnimFunction_SpiralDescent ; 29
	dw BattleAnimFunction_PoisonGas ; 2a
	dw BattleAnimFunction_Horn ; 2b
	dw BattleAnimFunction_2C ; 2c
	dw BattleAnimFunction_2D ; 2d
	dw BattleAnimFunction_2E ; 2e
	dw BattleAnimFunction_2F ; 2f
	dw BattleAnimFunction_30 ; 30
	dw BattleAnimFunction_31 ; 31
	dw BattleAnimFunction_32 ; 32
	dw BattleAnimFunction_33 ; 33
	dw BattleAnimFunction_34 ; 34
	dw BattleAnimFunction_35 ; 35
	dw BattleAnimFunction_36 ; 36
	dw BattleAnimFunction_37 ; 37
	dw BattleAnimFunction_38 ; 38
	dw BattleAnimFunction_39 ; 39
	dw BattleAnimFunction_3A ; 3a
	dw BattleAnimFunction_3B ; 3b
	dw BattleAnimFunction_3C ; 3c
	dw BattleAnimFunction_3D ; 3d
	dw BattleAnimFunction_3E ; 3e
	dw BattleAnimFunction_3F ; 3f
	dw BattleAnimFunction_40 ; 40
	dw BattleAnimFunction_41 ; 41
	dw BattleAnimFunction_42 ; 42
	dw BattleAnimFunction_43 ; 43
	dw BattleAnimFunction_44 ; 44
	dw BattleAnimFunction_45 ; 45
	dw BattleAnimFunction_46 ; 46
	dw BattleAnimFunction_47 ; 47
	dw BattleAnimFunction_48 ; 48
	dw BattleAnimFunction_49 ; 49
	dw BattleAnimFunction_4A ; 4a
	dw BattleAnimFunction_4B ; 4b
	dw BattleAnimFunction_4C ; 4c
	dw BattleAnimFunction_4D ; 4d
	dw BattleAnimFunction_4E ; 4e
	dw BattleAnimFunction_4F ; 4f

BattleAnimFunction_Null:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.one
	call DeinitBattleAnimation
.zero
	ret

BattleAnimFunction_ThrowFromPlayerToEnemyAndDisappear:
	call BattleAnimFunction_ThrowFromPlayerToEnemy
	ret c
	call DeinitBattleAnimation
	ret

BattleAnimFunction_ThrowFromPlayerToEnemy:
	; If x coord at $88 or beyond, abort.
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	ret nc
	; Move right 2 pixels
	add $2
	ld [hl], a
	; Move down 1 pixel
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	; Decrease ??? and hold onto its previous value (argument of the sine function)
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	; Get ???, which is the amplitude of the sine function
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	; Store the result in the Y offset
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	; Carry flag denotes success
	scf
	ret

BattleAnimFunction_04:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr c, .asm_cd002
	call DeinitBattleAnimation
	ret

.asm_cd002
	add $2
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ld d, $10
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	sra a
	sra a
	sra a
	sra a
	ld [hl], a
	ret

BattleAnimFunction_03:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 7, [hl]
	ld a, $0
	jr z, .asm_cd048
	ld a, $20
.asm_cd048
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_01:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.one
	call DeinitBattleAnimation
	ret

.zero
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	ret nc
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	call Functionce64f
	ret

BattleAnimFunction_02:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .asm_cd0a7
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	call Functionce64f
	ret

.asm_cd0a7
	call DeinitBattleAnimation
	ret

BattleAnimFunction_PokeBall:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six
	dw .seven
	dw .eight
	dw .nine
	dw .ten
	dw .eleven
.zero ; init
	call GetBallAnimPal
	call BattleAnim_IncAnonJumptableIndex
	ret

.one
	call BattleAnimFunction_ThrowFromPlayerToEnemy
	ret c
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	ld a, BATTLEANIMFRAMESET_0B
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ret

.three
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_09
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $0
	inc hl
	ld [hl], $10
.four
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and $1f
	ret nz
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	sub $4
	ld [hl], a
	ret nz
	ld a, BATTLEANIMFRAMESET_0C
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ret

.six
	ld a, BATTLEANIMFRAMESET_0D
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	dec [hl]
.two
.five
.nine
	ret

.seven
	call GetBallAnimPal
	ld a, BATTLEANIMFRAMESET_0A
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $20
.eight
.ten
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and $1f
	jr z, .eleven
	and $f
	ret nz
	call BattleAnim_IncAnonJumptableIndex
	ret

.eleven
	call DeinitBattleAnimation
	ret

BattleAnimFunction_PokeBallBlocked:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
.zero
	call GetBallAnimPal
	call BattleAnim_IncAnonJumptableIndex
	ret

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $70
	jr nc, .next
	call BattleAnimFunction_ThrowFromPlayerToEnemy
	ret

.next
	call BattleAnim_IncAnonJumptableIndex
.two
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .done
	add $4
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	dec [hl]
	ret

.done
	call DeinitBattleAnimation
	ret

GetBallAnimPal:
	ld hl, BallColors
	ld a, [wCurItem]
	ld e, a
.IsInArray:
	ld a, [hli]
	cp -1
	jr z, .load
	cp e
	jr z, .load
	inc hl
	jr .IsInArray

.load
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PALETTE
	add hl, bc
	ld [hl], a
	ret

INCLUDE "data/battle_anims/ball_colors.asm"

BattleAnimFunction_10:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	ret

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	ret nc
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	call Functionce64f
	ret

.two
	call DeinitBattleAnimation
	ret

.three
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_0F
	call ReinitBattleAnimFrameset
.four
	ret

BattleAnimFunction_07:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $30
	inc hl
	ld [hl], $48
.one
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $20
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	sub [hl]
	jr z, .done
	jr c, .done
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ret

.done
	call DeinitBattleAnimation
	ret

BattleAnimFunction_08:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
.zero
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .next
	call .SetCoords
	ret

.next
	call BattleAnim_IncAnonJumptableIndex
.one
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $0
.two
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .loop_back
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $18
	call BattleAnim_Cosine
	sub $18
	sra a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $18
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.loop_back
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	jr z, .finish
	sub $10
	ld d, a
	ld a, [hl]
	and $f
	or d
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	dec [hl]
	ret

.finish
	call BattleAnim_IncAnonJumptableIndex
.three
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b0
	jr c, .retain
	call DeinitBattleAnimation
	ret

.retain
	call .SetCoords
	ret

.SetCoords:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld e, a
	srl e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
.loop
	dec [hl]
	dec e
	jr nz, .loop
	ret

BattleAnimFunction_09:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done_one
	dec [hl]
	ret

.done_one
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ret

.two
	call DeinitBattleAnimation
	ret

BattleAnimFunction_0A:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six
	dw .seven
	dw .eight
	dw .nine
.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	cp $7
	jr z, .seven
	ld a, BATTLEANIMFRAMESET_11
	call ReinitBattleAnimFrameset
	ret

.seven
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr nc, .set_up_eight
	add $2
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

.set_up_eight
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_10
	call ReinitBattleAnimFrameset
.eight
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $10
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ret

.nine
	call DeinitBattleAnimation
	ret

.one
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	dec [hl]
	ret

.four
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	inc [hl]
.two
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	dec [hl]
	ret

.five
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	inc [hl]
.three
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	inc [hl]
.six
	ret

BattleAnimFunction_RazorLeaf:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six
	dw .seven
	dw .eight
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $40
.one
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .sine_cosine
	call BattleAnim_IncAnonJumptableIndex
	xor a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hli], a
	ld [hl], a
	ld a, BATTLEANIMFRAMESET_17
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 6, [hl]
	ret z
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], $5
	ret

.sine_cosine
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call Functioncd49c
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	ret

.two
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $20
	jr nz, .sine_cosine_2
	call DeinitBattleAnimation
	ret

.sine_cosine_2
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 6, [hl]
	jr nz, .decrease
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	jr .finish

.decrease
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	dec [hl]
.finish
	ld de, $80
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	ret

.three
	ld a, BATTLEANIMFRAMESET_16
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_OAMFLAGS
	add hl, bc
	res 5, [hl]
.four
.five
.six
.seven
	call BattleAnim_IncAnonJumptableIndex
	ret

.eight
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $c0
	ret nc
	ld a, $8
	call Functionce64f
	ret

Functioncd49c:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	bit 7, a
	jr nz, .negative
	cp $20
	jr nc, .plus_256
	cp $18
	jr nc, .plus_384
	ld de, $200
	ret

.plus_384
	ld de, $180
	ret

.plus_256
	ld de, $100
	ret

.negative
	and $3f
	cp $20
	jr nc, .minus_256
	cp $18
	jr nc, .minus_384
	ld de, -$200
	ret

.minus_384
	ld de, -$180
	ret

.minus_256
	ld de, -$100
	ret

BattleAnimFunction_4E:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $40
	rlca
	rlca
	add $19
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $40
.one
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .sine_cosine
	call DeinitBattleAnimation
	ret

.sine_cosine
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call Functioncd49c
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	ret

BattleAnimFunction_0C:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $c
.one
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	call Functionce64f
	ret

.next
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $0
	ld a, BATTLEANIMFRAMESET_22
	call ReinitBattleAnimFrameset
.two
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $98
	jr nc, .okay
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	ld de, $60
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
.okay
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $20
	ret c
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	ld e, a
	ld d, $ff
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

BattleAnimFunction_0D:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld a, LOW(rSCY)
	ldh [hLCDCPointer], a
	ld a, $58
	ldh [hLYOverrideStart], a
	ld a, $5e
	ldh [hLYOverrideEnd], a
	ret

.one
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp e
	jr nc, .asm_cd5e0
	call BattleAnim_IncAnonJumptableIndex
	xor a
	ldh [hLYOverrideStart], a
	ret

.asm_cd5e0
	dec a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	add [hl]
	sub $10
	ret c
	ldh [hLYOverrideStart], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	inc a
	and $7
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	inc [hl]
.two
	ret

.three
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $70
	jr c, asm_cd61f
	xor a
	ldh [hLCDCPointer], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
.four
	call DeinitBattleAnimation
	ret

asm_cd61f:
	inc a
	inc a
	ld [hl], a
	sub $10
	ret c
	ldh [hLYOverrideStart], a
	ret

BattleAnimFunction_0E:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd62f
	dw Functioncd63c

Functioncd62f:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, BATTLEANIMFRAMESET_24
	add [hl] ; BATTLEANIMFRAMESET_25 BATTLEANIMFRAMESET_26
	call ReinitBattleAnimFrameset

Functioncd63c:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b8
	jr c, .asm_cd649
	call DeinitBattleAnimation
	ret

.asm_cd649
	ld a, $2
	call Functionce64f
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld d, $8
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_0F:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd66a
	dw Functioncd66d
	dw Functioncd6a8
	dw Functioncd6bb

Functioncd66a:
	call BattleAnim_IncAnonJumptableIndex
Functioncd66d:
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cd68c
	ld a, $2
	call Functionce64f
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld d, $8
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_cd68c
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_28
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], $30
	ld hl, BATTLEANIMSTRUCT_OAMFLAGS
	add hl, bc
	ld a, [hl]
	and $1
	ld [hl], a
Functioncd6a8:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $18
	jr nc, .asm_cd6b3
	inc [hl]
	ret

.asm_cd6b3
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_29
	call ReinitBattleAnimFrameset
Functioncd6bb:
	ret

BattleAnimFunction_11:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $38
	jr c, .asm_cd6c9
	call DeinitBattleAnimation
	ret

.asm_cd6c9
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld l, [hl]
	ld h, a
	ld de, $80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	xor $10
	ld [hl], a
	ret

BattleAnimFunction_14:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd6f0
	dw Functioncd717

Functioncd6f0:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	sla a
	sla a
	sla a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld [hl], $1
Functioncd717:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_cd723
	call DeinitBattleAnimation
	ret

.asm_cd723
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	xor $1
	ld [hl], a
	ret z
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_15:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd764
	dw Functioncd75c
	dw Functioncd764
	dw Functioncd765

Functioncd75c:
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_35
	call ReinitBattleAnimFrameset
Functioncd764:
	ret

Functioncd765:
	call DeinitBattleAnimation
	ret

BattleAnimFunction_16:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd77a
	dw Functioncd7a5
	dw Functioncd7d4
	dw Functioncd7d4
	dw Functioncd7d4
	dw Functioncd7d4
	dw Functioncd7d8

Functioncd77a:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_cd797
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $10
	jr .asm_cd79d

.asm_cd797
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $30
.asm_cd79d
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
Functioncd7a5:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	bit 7, a
	jr nz, .load_no_inc
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	inc a ; BATTLEANIMFRAMESET_3B
	      ; BATTLEANIMFRAMESET_A1
	jr .reinit

.load_no_inc
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl] ; BATTLEANIMFRAMESET_3A
	           ; BATTLEANIMFRAMESET_A0
.reinit
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $1f
	ret nz
Functioncd7d4:
	call BattleAnim_IncAnonJumptableIndex
	ret

Functioncd7d8:
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $1
	ret

BattleAnimFunction_17:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd7f0
	dw Functioncd811
	dw Functioncd83a
	dw Functioncd83a
	dw Functioncd83a
	dw Functioncd83a
	dw Functioncd83e

Functioncd7f0:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_cd803
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $10
	jr .asm_cd809

.asm_cd803
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $30
.asm_cd809
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a

Functioncd811:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	bit 7, a
	jr nz, .asm_cd82b
	ld a, BATTLEANIMFRAMESET_3D
	jr .asm_cd82d

.asm_cd82b
	ld a, BATTLEANIMFRAMESET_3C
.asm_cd82d
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $1f
	ret nz

Functioncd83a:
	call BattleAnim_IncAnonJumptableIndex
	ret

Functioncd83e:
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $1
	ret

BattleAnimFunction_18:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd84c
	dw Functioncd858

Functioncd84c:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $28
	inc hl
	ld [hl], $0
Functioncd858:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cd895
	ld d, a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld e, [hl]
	ld hl, -$80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], d
	ret

.asm_cd895
	call DeinitBattleAnimation
	ret

BattleAnimFunction_19:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd8a6
	dw Functioncd8af
	dw Functioncd8b3
	dw Functioncd8af
	dw Functioncd8c0

Functioncd8a6:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld [hl], $0
Functioncd8af:
	call Functioncd8df
	ret

Functioncd8b3:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr c, asm_cd988
	call BattleAnim_IncAnonJumptableIndex
	ret

Functioncd8c0:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b8
	jr c, asm_cd988
	call DeinitBattleAnimation
	ret

asm_cd988:
	call Functioncd8df
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

Functioncd8df:
	call Functioncd939
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	sub $8
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cd91c
	cp $c2
	jr c, .asm_cd927
.asm_cd91c
	dec a
	ld [hl], a
	and $7
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	inc [hl]
	ret

.asm_cd927
	xor a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hli], a
	ld [hl], a
	ret

Functioncd939:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, Unknown_cd946
	add hl, de
	ld d, [hl]
	ret

Unknown_cd946:
	db 8, 6, 5, 4, 5, 6, 8, 12, 16

BattleAnimFunction_1C:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .asm_cd95c
	call DeinitBattleAnimation
	ret

.asm_cd95c
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld e, a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	sub e
	ld [hl], a
	srl e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
.asm_cd971
	inc [hl]
	dec e
	jr nz, .asm_cd971
	ret

BattleAnimFunction_1F:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd991
	dw Functioncd97f
	dw Functioncd991

Functioncd97f:
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	inc a ; BATTLEANIMFRAMESET_53
	      ; BATTLEANIMFRAMESET_55
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $8
Functioncd991:
	ret

BattleAnimFunction_LeechSeed:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
.zero:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $40
	ret

.one:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .sprout
	call Functioncd9d2
	ret

.sprout
	ld [hl], $40
	ld a, BATTLEANIMFRAMESET_57
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ret

.two:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .flutter
	dec [hl]
	ret

.flutter
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_58
	call ReinitBattleAnimFrameset
.three:
	ret

Functioncd9d2:
	dec [hl]
	ld d, $20
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_02
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld h, [hl]
	ld a, h
	and $f
	swap a
	ld l, a
	ld a, h
	and $f0
	swap a
	ld h, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_3F:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncda24
	dw Functioncda2e
	dw Functioncda3e

Functioncda24:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $40
	ret

Functioncda2e:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .asm_cda3b
	call Functioncd9d2
	ret

.asm_cda3b
	call BattleAnim_IncAnonJumptableIndex
Functioncda3e:
	ret

BattleAnimFunction_1A:
	call BattleAnimFunction_03
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	add $f
	ld [hl], a
	ret

BattleAnimFunction_1B:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncda58
	dw Functioncda59
	dw Functioncda6d
	dw Functioncda95
	dw Functioncdaaa

Functioncda58:
	ret

Functioncda59:
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cda69
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $0
	ret

.asm_cda69
	add $4
	ld [hl], a
	ret

Functioncda6d:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $98
	ret nc
	inc [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_OAMFLAGS
	add hl, bc
	set 0, [hl]
	ld hl, BATTLEANIMSTRUCT_02
	add hl, bc
	ld [hl], $90
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], $2
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

Functioncda95:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $2c
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], $80
Functioncdaaa:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $98
	ret nc
	inc [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $8
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_1D:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdae4
	dw Functioncdaf8
	dw Functioncdb14
	dw Functioncdb30
	dw Functioncdbb9
	dw Functioncdb5f
	dw Functioncdb06
	dw Functioncdb63
	dw Functioncdb6c
	dw Functioncdb7e
	dw Functioncdbb9
	dw Functioncdb8d
	dw Functioncdb9c
	dw Functioncdbb9

Functioncdae4:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $28
	inc hl
	ld [hl], $10
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	ret

Functioncdaf8:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .asm_cdb02
	inc [hl]
.asm_cdb02
	call Functioncdbba
	ret

Functioncdb06:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $4b
	jr nc, .asm_cdb10
	inc [hl]
.asm_cdb10
	call Functioncdbba
	ret

Functioncdb14:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr nc, .asm_cdb2b
	and $f
	jr nz, asm_cdb3f
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $10
	call BattleAnim_IncAnonJumptableIndex
	ret

.asm_cdb2b
	call BattleAnim_IncAnonJumptableIndex
	inc [hl]
	ret

Functioncdb30:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdb3a
	dec [hl]
	ret

.asm_cdb3a
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	dec [hl]
asm_cdb3f:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld e, [hl]
	ld hl, -$80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	ret

Functioncdb5f:
	call DeinitBattleAnimation
	ret

Functioncdb63:
	ld a, BATTLEANIMFRAMESET_4E
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ret

Functioncdb6c:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $2
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

Functioncdb7e:
	ld a, BATTLEANIMFRAMESET_50
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $4
	call BattleAnim_IncAnonJumptableIndex
	ret

Functioncdb8d:
	ld a, BATTLEANIMFRAMESET_4F
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $40
	ret

Functioncdb9c:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $20
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cdbb6
	dec [hl]
	ret

.asm_cdbb6
	call BattleAnim_IncAnonJumptableIndex
Functioncdbb9:
	ret

Functioncdbba:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $20
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	sub $8
	ld [hl], a
	ret nz
	xor a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hli], a
	ld [hl], a
	call BattleAnim_IncAnonJumptableIndex
	ret

BattleAnimFunction_1E:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdbfb
	cp $d8
	jr nc, .asm_cdbfb
	call DeinitBattleAnimation
	ret

.asm_cdbfb
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	sub d
	ld [hl], a
	ret

BattleAnimFunction_21:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdc0f
	dw Functioncdc32

Functioncdc0f:
	ldh a, [hBattleTurn]
	and a
	jr z, .asm_cdc1e
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	xor $ff
	add $3
	ld [hl], a
.asm_cdc1e
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $8
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, BATTLEANIMFRAMESET_59
	add [hl] ; BATTLEANIMFRAMESET_5A BATTLEANIMFRAMESET_5B
	call ReinitBattleAnimFrameset
	ret

Functioncdc32:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdc3f
	dec [hl]
	call Functioncdc43
	ret

.asm_cdc3f
	call DeinitBattleAnimation
	ret

Functioncdc43:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $10
	call BattleAnim_Sine
	ld d, a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdc65
	dec a
	ret z
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ret

.asm_cdc65
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, d
	xor $ff
	inc a
	ld [hl], a
	ret

BattleAnimFunction_22:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdc76
	dw Functioncdc94

Functioncdc76:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $3f
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $80
	rlca
	ld [hl], a
	add BATTLEANIMFRAMESET_5D ; BATTLEANIMFRAMESET_5E
	call ReinitBattleAnimFrameset
	ret

Functioncdc94:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	swap a
	ld d, a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	inc [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	ret nc
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and $3
	jr nz, .asm_cdccc
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
.asm_cdccc
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_23:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdcdc
	dw Functioncdd01

Functioncdcdc:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $80
	rlca
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	add [hl] ; BATTLEANIMFRAMESET_61 BATTLEANIMFRAMESET_62
	         ; BATTLEANIMFRAMESET_9C BATTLEANIMFRAMESET_9D
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
Functioncdd01:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $10
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $3f
	jr z, .asm_cdd35
	and $1f
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc a ; BATTLEANIMFRAMESET_62
	      ; BATTLEANIMFRAMESET_9D
	jr .asm_cdd3a

.asm_cdd35
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl] ; BATTLEANIMFRAMESET_61
	           ; BATTLEANIMFRAMESET_9C
.asm_cdd3a
	call ReinitBattleAnimFrameset
	ret

BattleAnimFunction_24:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdd47
	dw Functioncdd65
	dw Functioncdd66

Functioncdd47:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add BATTLEANIMFRAMESET_63 ; BATTLEANIMFRAMESET_64 BATTLEANIMFRAMESET_65
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, Unknown_cdd6a
	add hl, de
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
Functioncdd65:
	ret

Functioncdd66:
	call DeinitBattleAnimation
	ret

Unknown_cdd6a:
	db $ec, $f8, $00

BattleAnimFunction_25:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $4
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld e, [hl]
	lb hl, -1, $a0
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], e
	ret

BattleAnimFunction_26:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	dec [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_27:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncddb7
	dw Functioncddcd

Functioncddb7:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_cddc8
	ld hl, BATTLEANIMSTRUCT_OAMFLAGS
	add hl, bc
	set 6, [hl]
.asm_cddc8
	add BATTLEANIMFRAMESET_6A ; BATTLEANIMFRAMESET_6B BATTLEANIMFRAMESET_6C
	call ReinitBattleAnimFrameset
Functioncddcd:
	ret

BattleAnimFunction_28:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncddd5
	dw Functioncde04

Functioncddd5:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld a, e
	and $70
	swap a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, e
	and $80
	jr nz, .asm_cddf7
	ld a, e
	and $f
	ld [hl], a
	ret

.asm_cddf7
	ld a, e
	and $f
	xor $ff
	inc a
	ld [hl], a
	ld a, BATTLEANIMFRAMESET_6E
	call ReinitBattleAnimFrameset
	ret

Functioncde04:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cde0e
	dec [hl]
	ret

.asm_cde0e
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ret

BattleAnimFunction_SpiralDescent:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $7
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $28
	jr nc, .delete
	inc [hl]
	ret

.delete
	call DeinitBattleAnimation
	ret

BattleAnimFunction_2D:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $28
	jr nc, .asm_cde9a
	inc [hl]
	ret

.asm_cde9a
	call DeinitBattleAnimation
	ret

BattleAnimFunction_PoisonGas:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdea5
	dw BattleAnimFunction_SpiralDescent

Functioncdea5:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .next
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

.next
	call BattleAnim_IncAnonJumptableIndex
	ret

BattleAnimFunction_34:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $7
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $e8
	jr z, .asm_cdf0c
	dec [hl]
	ret

.asm_cdf0c
	call DeinitBattleAnimation
	ret

BattleAnimFunction_3C:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $3
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .asm_cdf4c
	dec [hl]
	dec [hl]
	ret

.asm_cdf4c
	call DeinitBattleAnimation
	ret

BattleAnimFunction_35:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdf59
	dw Functioncdf68
	dw Functioncdfa4

Functioncdf59:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $34
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $10
Functioncdf68:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $6c
	jr c, .asm_cdf72
	ret

.asm_cdf72
	ld a, $2
	call Functionce64f
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	bit 7, a
	jr nz, .asm_cdf8b
	xor $ff
	inc a
.asm_cdf8b
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	sub $4
	ld [hl], a
	and $1f
	cp $20
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	srl [hl]
	ret

Functioncdfa4:
	call DeinitBattleAnimation
	ret

BattleAnimFunction_Horn:
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw Functioncdfe3
.zero:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ret

.one:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $58
	ret nc
	ld a, $2
	call Functionce64f
	ret

.two:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, Functioncdfe3
	call DeinitBattleAnimation
	ret

Functioncdfe3:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	ld d, $8
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	sra a
	xor $ff
	inc a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	add $8
	ld [hl], a
	ret

BattleAnimFunction_2C:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce013
	dw Functionce03d
	dw Functionce022

Functionce013:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	swap a
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	ret

Functionce022:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	bit 7, a
	jr z, .asm_ce035
	ld [hl], a
.asm_ce035
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	sub $4
	ld [hl], a
Functionce03d:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr c, .asm_ce04a
	call DeinitBattleAnimation
	ret

.asm_ce04a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	call Functionce64f
	ret

BattleAnimFunction_2E:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce05a
	dw Functionce06f

Functionce05a:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $28
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	sub $28
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
Functionce06f:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	and [hl]
	jr nz, .asm_ce08e
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
.asm_ce08e
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $20
	inc hl
	srl [hl]
	ret

BattleAnimFunction_2F:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $1
	jr nz, .asm_ce0ce
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
.asm_ce0ce
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $3
	jr nz, .asm_ce0dc
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
.asm_ce0dc
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	cp $5a
	jr nc, .asm_ce0ef
	ld a, [hl]
	and a
	jr z, .asm_ce0f1
	dec [hl]
	ret

.asm_ce0ef
	inc [hl]
	ret

.asm_ce0f1
	call DeinitBattleAnimation
	ret

BattleAnimFunction_42:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	cp $40
	jr nc, .asm_ce124
	inc [hl]
	ret

.asm_ce124
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	call DeinitBattleAnimation
	ret

BattleAnimFunction_30:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce133
	dw Functionce140

Functionce133:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], a
Functionce140:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $30
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add $8
	ld d, $30
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_31:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce172
	dw Functionce199

Functionce172:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld [hl], $f
Functionce199:
	ret

BattleAnimFunction_32:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce1a5
	dw Functionce1b9
	dw Functionce1bd
	dw Functionce1ce

Functionce1a5:
	call BattleAnim_IncAnonJumptableIndex
	ldh a, [hBattleTurn]
	and a
	jr nz, .asm_ce1b1
	ld a, $f0
	jr .asm_ce1b3

.asm_ce1b1
	ld a, $cc
.asm_ce1b3
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	ret

Functionce1b9:
	call Functionce1e4
	ret

Functionce1bd:
	call Functionce1e4
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	ret nc
	ld a, $4
	call Functionce64f
	ret

Functionce1ce:
	call Functionce1e4
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr nc, .asm_ce1e0
	ld a, $4
	call Functionce64f
	ret

.asm_ce1e0
	call DeinitBattleAnimation
	ret

Functionce1e4:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and $7
	inc [hl]
	srl a
	ld e, a
	ld d, $0
	ldh a, [hSGB]
	and a
	jr nz, .asm_ce1fb
	ld hl, Unknown_ce209
	jr .asm_ce1fe

.asm_ce1fb
	ld hl, Unknown_ce20d
.asm_ce1fe
	add hl, de
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	and [hl]
	ld [wOBP0], a
	ret

Unknown_ce209:
	db $ff, $aa, $55, $aa
Unknown_ce20d:
	db $ff, $ff, $00, $00

BattleAnimFunction_33:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	dec [hl]
	dec [hl]
	ret

BattleAnimFunction_36:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce24b
	dw Functionce275
	dw Functionce291

Functionce24b:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $e0
	jr nz, .asm_ce25e
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $2
	ret

.asm_ce25e
	ld d, a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld e, [hl]
	ld hl, -$80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	ret

Functionce275:
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce27f
	dec [hl]
	ret

.asm_ce27f
	ld [hl], $4
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Functionce291:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .asm_ce2a0
	ld a, $4
	call Functionce64f
	ret

.asm_ce2a0
	call DeinitBattleAnimation
	ret

BattleAnimFunction_37:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce2ab
	dw Functionce2ba

Functionce2ab:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	add BATTLEANIMFRAMESET_81 ; BATTLEANIMFRAMESET_82 BATTLEANIMFRAMESET_83
	call ReinitBattleAnimFrameset
Functionce2ba:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_ce2c8
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	inc [hl]
	ret

.asm_ce2c8
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_38:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce2d7
	dw Functionce2e1
	dw Functionce2f3

Functionce2d7:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $c
	ret

Functionce2e1:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce2eb
	dec [hl]
	ret

.asm_ce2eb
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_20
	call ReinitBattleAnimFrameset
Functionce2f3:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_39:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	push af
	ld d, $2
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop af
	ld d, $8
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_3A:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .asm_ce324
	call DeinitBattleAnimation
	ret

.asm_ce324
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $8
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	and $7
	ret nz
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_3B:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce34b
	dw Functionce357

Functionce34b:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Functionce357:
	call DeinitBattleAnimation
	ret

BattleAnimFunction_3D:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	sra a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	ret

BattleAnimFunction_3E:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce388
	dw Functionce3aa
	dw Functionce3d5

Functionce388:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $28
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	add [hl] ; BATTLEANIMFRAMESET_8F BATTLEANIMFRAMESET_90 BATTLEANIMFRAMESET_91
	         ; BATTLEANIMFRAMESET_93 BATTLEANIMFRAMESET_94 BATTLEANIMFRAMESET_95
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	or $8
	ld [hl], a
Functionce3aa:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce3d0
	dec [hl]
	add $8
	ld d, a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_ce3d0
	ld [hl], $10
	call BattleAnim_IncAnonJumptableIndex
Functionce3d5:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	call DeinitBattleAnimation
	ret

BattleAnimFunction_40:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce3e8
	dw Functionce3f5

Functionce3e8:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, BATTLEANIMFRAMESET_24
	add [hl] ; BATTLEANIMFRAMESET_25 BATTLEANIMFRAMESET_26
	call ReinitBattleAnimFrameset
Functionce3f5:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $38
	jr nc, .asm_ce41d
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	ret

.asm_ce41d
	call DeinitBattleAnimation
	ret

BattleAnimFunction_41:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld d, a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc [hl]
	call BattleAnim_Sine
	bit 7, a
	jr nz, .asm_ce439
	xor $ff
	inc a
.asm_ce439
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	and $1f
	ret nz
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	srl [hl]
	ret

BattleAnimFunction_43:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $10
	jr nc, .asm_ce473
	inc [hl]
	inc [hl]
	ld d, a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_ce473
	call DeinitBattleAnimation
	ret

BattleAnimFunction_44:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld d, [hl]
	ld a, e
	and $c0
	rlca
	rlca
	add [hl]
	ld [hl], a
	ld a, e
	and $3f
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_45:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce4a9
	dw Functionce4b3
	dw Functionce4bc

Functionce4a9:
	ld d, $18
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	jr asm_ce4d4

Functionce4b3:
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $18
Functionce4bc:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .asm_ce4d0
	ld d, a
	add $8
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	jr asm_ce4d4

.asm_ce4d0
	call DeinitBattleAnimation
	ret

asm_ce4d4:
	call Functionce636
	ret

BattleAnimFunction_46:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce4f8
	dw Functionce4df

Functionce4df:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_ce4f5
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	dec [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	inc [hl]
	ret

.asm_ce4f5
	call DeinitBattleAnimation
Functionce4f8:
	ret

BattleAnimFunction_47:
	ld d, $50
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	add [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_48:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .disappear
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.disappear
	call DeinitBattleAnimation
	ret

BattleAnimFunction_49:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce53e
	dw Functionce54f
	dw Functionce567
	dw Functionce55d

Functionce53e:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr nz, asm_ce561
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $ec
Functionce54f:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $4
	jr z, Functionce55d
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret

Functionce55d:
	call DeinitBattleAnimation
	ret

asm_ce561:
	call BattleAnim_IncAnonJumptableIndex
	call BattleAnim_IncAnonJumptableIndex
Functionce567:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $d8
	ret z
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

BattleAnimFunction_4A:
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce57f
	dw Functionce58d
	dw Functionce5a1
	dw Functionce5b7

Functionce57f:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	call BattleAnim_IncAnonJumptableIndex
	ret

Functionce58d:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	add $4
	cp $70
	jr c, .asm_ce599
	xor a
.asm_ce599
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	inc [hl]
	inc [hl]
	ret

Functionce5a1:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	add $4
	cp $70
	jr c, .asm_ce5ad
	xor a
.asm_ce5ad
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	add $8
	ld [hl], a
	ret

Functionce5b7:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	add $4
	cp $70
	jr c, .asm_ce5c3
	xor a
.asm_ce5c3
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	add $4
	ld [hl], a
	ret

BattleAnimFunction_4B:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld l, a
	and $f0
	ld h, a
	swap a
	or h
	ld h, a
	ld a, l
	and $f
	swap a
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], e
	ret

BattleAnimFunction_4C:
	ld d, $18
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	call Functionce636
	ret

BattleAnimFunction_4F:
	ld d, $18
	ld hl, BATTLEANIMSTRUCT_VAR2
	add hl, bc
	ld a, [hl]
	inc [hl]
	srl a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	add [hl]
	call Functionce636
	ret

BattleAnimFunction_4D:
	ld hl, BATTLEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .asm_ce632
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	xor $ff
	inc a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_ce632
	call DeinitBattleAnimation
	ret

Functionce636:
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

Functionce64f:
	and $f
	ld e, a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	srl e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
.asm_ce65e
	dec [hl]
	dec e
	jr nz, .asm_ce65e
	ret

BattleAnim_AnonJumptable:
	pop de
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

BattleAnim_IncAnonJumptableIndex:
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

BattleAnim_Cosine:
; a = d * cos(a * pi/32)
	add %010000 ; cos(x) = sin(x + pi/2)
	; fallthrough
BattleAnim_Sine:
; a = d * sin(a * pi/32)
	calc_sine_wave BattleAnimSineWave

BattleAnim_Sine_e:
	ld a, e
	call BattleAnim_Sine
	ld e, a
	ret

BattleAnim_Cosine_e:
	ld a, e
	call BattleAnim_Cosine
	ld e, a
	ret

BattleAnim_AbsSinePrecise:
	ld a, e
	call BattleAnim_Sine
	ld e, l
	ld d, h
	ret

BattleAnim_AbsCosinePrecise:
	ld a, e
	call BattleAnim_Cosine
	ld e, l
	ld d, h
	ret

BattleAnimSineWave:
	sine_table 32
