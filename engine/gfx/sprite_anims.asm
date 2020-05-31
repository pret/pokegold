DoAnimFrame:
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
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
; entries correspond to SPRITE_ANIM_SEQ_* constants
	dw .Null
	dw .PartyMon
	dw .PartyMonSwitch
	dw .PartyMonSelected
	dw .Function8d528
	dw .Function8d54e
	dw .Function8d55d
	dw .Function8d5a2
	dw .Function8d5bf
	dw .Function8d623
	dw .Function8d66b
	dw .Function8d690
	dw .Function8d702
	dw .Function8d765
	dw .Function8d7b1
	dw .Function8d7ef
	dw .Function8d82d
	dw .Function8d897
	dw .Function8d8b8
	dw .Function8d8bf
	dw .Function8d909
	dw .NamingScreenCursor
	dw .GameFreakLogo
	dw .GSIntroStar
	dw .GSIntroSparkle
	dw .SlotsGolem
	dw .SlotsChansey
	dw .SlotsChanseyEgg
	dw .MailCursor
	dw .UnusedCursor
	dw .DummyGameCursor
	dw .PokegearArrow
	dw .TradePokeBall
	dw .TradeTubeBulge
	dw .TrademonInTube
	dw .RevealNewMon
	dw .RadioTuningKnob
	dw .CutLeaves
	dw .FlyFrom
	dw .FlyLeaf
	dw .FlyTo
	dw .Function8d885

.Null
	ret

.PartyMon
	ld a, [wMenuCursorY]

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	cp [hl]
	jr z, .PartyMonSwitch

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 2

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], 0
	ret

.PartyMonSwitch
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 3

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	ld d, a
	inc [hl]
	and $f
	ret nz

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld e, [hl]

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, d
	and $10 ; bit 4
	jr z, .load_zero
	ld a, e
	and a
	jr z, .load_minus_two
	cp $1
	jr z, .load_minus_one
.load_zero
	xor a
	ld [hl], a
	ret

.load_minus_one
	ld a, -1
	ld [hl], a
	ret

.load_minus_two
	ld a, -2
	ld [hl], a
	ret

.PartyMonSelected
	ld a, [wMenuCursorY]

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	cp [hl]
	jr z, .three_offset_right

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 2
	ret

.three_offset_right
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 3
	ret

.Function8d528:
	ld hl, $0d
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	jr nc, .asm_554a

	ld hl, $07
	add hl, bc
	dec [hl]
	ld hl, $0c
	add hl, bc
	ld a, [hl]
	add $02
	ld [hl], a
	ld d, $08
	call .Sprites_Sine
	ld hl, $0006
	add hl, bc
	ld [hl], a
	ret

.asm_554a
	call DeinitializeSprite
	ret

.Function8d54e:
	ld a, [wGlobalAnimYOffset]
	ld hl, $0005
	add hl, bc
	add [hl]
	cp $b0
	ret c
	call DeinitializeSprite
	ret

.Function8d55d:
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d565
	dw .Function8d576

.Function8d565
	call .IncrementJumptableIndex

	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and $03
	swap a
	ld hl, $000c
	add hl, bc
	ld [hl], a
.Function8d576:
	ld de, $0201
	ldh a, [hSGB]
	and a
	jr z, .asm_5581
	ld de, $0402
.asm_5581:
	ld hl, $06
	add hl, bc
	ld a, [hl]
	cp $f0
	jr nc, .asm_559e

	add d
	ld [hl], a
	ld hl, $0c
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
	ld d, $08
	call .Sprites_Sine
	ld hl, $07
	add hl, bc
	ld [hl], a
	ret

.asm_559e
	call DeinitializeSprite
	ret

.Function8d5a2:
	ld hl, $04
	add hl, bc
	ld a, [hl]
	cp $b0
	jr nc, .asm_55bb

	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $1
	ret z

	ld hl, $0005
	add hl, bc
	inc [hl]
	ret

.asm_55bb:
	call DeinitializeSprite
	ret

.Function8d5bf:
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d5c9
	dw .Function8d5e2
	dw .Function8d5f3

.Function8d5c9:
	call .Call_023_560b
	ret z

	ld hl, $04
	add hl, bc
	ld a, [hl]
	cp $58
	jr c, .asm_55d8

	dec [hl]
	ret


.asm_55d8:
	call .IncrementJumptableIndex
	ld hl, $0d
	add hl, bc
	ld [hl], $b0
	ret

.Function8d5e2:
	call .Call_023_560b
	ld hl, $0d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_55ef

	dec [hl]
	ret

.asm_55ef:
	call .IncrementJumptableIndex
	ret

.Function8d5f3:
	call .Call_023_560b
	ret z
	ld hl, $04
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .asm_5602
	dec [hl]
	ret

.asm_5602:
	call DeinitializeSprite
	ld a, $1
	ld [wBattleMonLevel], a
	ret


.Call_023_560b:
	ld hl, $0c
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, 4
	call .Sprites_Sine
	ld hl, $07
	add hl, bc
	ld [hl], a
	ld hl, $0c
	add hl, bc
	ld a, [hl]
	and $1
	ret

.Function8d623:
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d62b
	dw .Function8d63e

.Function8d62b:
	call .IncrementJumptableIndex
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and $1
	swap a
	sla a
	ld hl, $0c
	add hl, bc
	ld [hl], a
.Function8d63e:
	ld hl, $06
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .asm_5667
	inc [hl]
	ld d, $04
	ld hl, $000c
	add hl, bc
	ld a, [hl]
	add $02
	ld [hl], a
	call .Sprites_Sine
	ld hl, $07
	add hl, bc
	ld [hl], a
	ld hl, $0c
	add hl, bc
	and $2
	ret z

	ld hl, $05
	add hl, bc
	dec [hl]
	ret


.asm_5667:
	call DeinitializeSprite
	ret

.Function8d66b:
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d673
	dw .Function8d680

.Function8d673:
	ld a, [wBattleMonLevel]
	and a
	ret z
	call .IncrementJumptableIndex
	ld a, $0c
	call _ReinitSpriteAnimFrame
.Function8d680:
	ld hl, $04
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .asm_568c
	dec [hl]
	dec [hl]
	ret

.asm_568c:
	call DeinitializeSprite
	ret

.Function8d690:
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d69c
	dw .Function8d6b6
	dw .Function8d6c9
	dw .Function8d6f2

.Function8d69c:
	ld hl, $04
	add hl, bc
	ld a, [hl]
	cp $80
	jr z, .asm_56a7
	dec [hl]
	ret

.asm_56a7:
	call .IncrementJumptableIndex
	ld hl, $0d
	add hl, bc
	ld [hl], $30
	ld a, $0e
	call _ReinitSpriteAnimFrame
	ret

.Function8d6b6:
	ld hl, $0d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_56c0
	dec [hl]
	ret

.asm_56c0:
	call .IncrementJumptableIndex
	ld a, $0f
	call _ReinitSpriteAnimFrame
	ret

.Function8d6c9:
	ld hl, $0c
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	ld d, $04
	call .Sprites_Sine
	ld hl, $07
	add hl, bc
	ld [hl], a
	ld hl, $04
	add hl, bc
	ld a, [hl]
	cp $50
	jr z, .asm_56e9
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.asm_56e9:
	ld a, 1
	ld [wBattleMonLevel], a
	call .IncrementJumptableIndex
	ret

.Function8d6f2:
	ld hl, $04
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .asm_56fe
	dec [hl]
	dec [hl]
	ret

.asm_56fe:
	call DeinitializeSprite
	ret

.Function8d702:
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d70c
	dw .Function8d726
	dw .Function8d73c

.Function8d70c:
	ld hl, $04
	add hl, bc
	ld a, [hl]
	cp $80
	jr z, .asm_5717
	dec [hl]
	ret

.asm_5717:
	call .IncrementJumptableIndex
	ld hl, $0d
	add hl, bc
	ld [hl], $30
	ld a, $11
	call _ReinitSpriteAnimFrame
	ret

.Function8d726:
	ld hl, $0d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_5738
	dec [hl]
	cp $20
	ret nz
	ld a, $10
	call _ReinitSpriteAnimFrame
	ret

.asm_5738:
	call .IncrementJumptableIndex
	ret

.Function8d73c:
	ld hl, $0c
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	ld d, $04
	call .Sprites_Sine
	ld hl, $07
	add hl, bc
	ld [hl], a
	ld hl, $04
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .asm_5761
	dec [hl]
	dec [hl]
	ld a, [wBattleMonLevel]
	and a
	ret nz
	dec [hl]
	dec [hl]
	ret

.asm_5761:
	call DeinitializeSprite
	ret

.Function8d765:
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d76d
	dw .Function8d786

.Function8d76d:
	call .IncrementJumptableIndex
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and $4
	sla a
	ld e, a
	ld a, [hl]
	and $3
	swap a
	add e
	ld hl, $0c
	add hl, bc
	ld [hl], a
	ret

.Function8d786:
	ld hl, $04
	add hl, bc
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ld hl, $0d
	add hl, bc
	ld a, [hl]
	ld d, a
	add $8
	ld [hl], a
	ld hl, $0c
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .Sprites_Sine
	ld hl, $07
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine
	ld hl, $06
	add hl, bc
	ld [hl], a
	ret

.Function8d7b1:
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d7b9
	dw .Function8d7c9

.Function8d7b9:
	call .IncrementJumptableIndex
	ld hl, $0c
	add hl, bc
	ld [hl], $30
	ld hl, $0d
	add hl, bc
	ld [hl], $30
	ret

.Function8d7c9:
	ld hl, $0c
	add hl, bc
	ld a, [hl]
	cp $3c
	ret nc

	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Sine
	ld hl, $07
	add hl, bc
	ld [hl], a
	ld hl, $0d
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Cosine
	ld hl, $06
	add hl, bc
	ld [hl], a
	ret

.Function8d7ef:
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d7f7
	dw .Function8d807

.Function8d7f7:
	call .IncrementJumptableIndex
	ld hl, $0c
	add hl, bc
	ld [hl], $30
	ld hl, $0d
	add hl, bc
	ld [hl], $10
	ret

.Function8d807:
	ld hl, $0c
	add hl, bc
	ld a, [hl]
	cp $3c
	ret nc
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Sine
	ld hl, $07
	add hl, bc
	ld [hl], a
	ld hl, $0d
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Cosine
	ld hl, $06
	add hl, bc
	ld [hl], a
	ret

.Function8d82d:
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d835
	dw .Function8d84c

.Function8d835:
	call .IncrementJumptableIndex
	ld hl, 0
	add hl, bc
	ld a, [hl]
	ld hl, $0d
	add hl, bc
	and $3
	ld [hl], a
	inc [hl]
	swap a
	ld hl, $0c
	add hl, bc
	ld [hl], a
.Function8d84c:
	ld hl, $04
	add hl, bc
	ld a, [hl]
	cp $a4
	jr nc, .asm_5881

	ld hl, $0d
	add hl, bc
	add $4
	ld hl, $04
	add hl, bc
	ld [hl], a
	ld hl, $05
	add hl, bc
	inc [hl]
	ld hl, $0d
	add hl, bc
	ld a, [hl]
	sla a
	sla a
	ld d, 2
	ld hl, $0c
	add hl, bc
	ld a, [hl]
	add $3
	ld [hl], a
	call .Sprites_Sine
	ld hl, $07
	add hl, bc
	ld [hl], a
	ret

.asm_5881:
	call DeinitializeSprite
	ret

.Function8d885:
	ld hl, $0c
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	ld d, 2
	call .Sprites_Sine
	ld hl, $07
	add hl, bc
	ld [hl], a
	ret

.Function8d897:
	push bc
	ld a, $38
	ld hl, $4000
	rst $08
	pop bc
	ld hl, wHallOfFamePokemonListMon1DVs
	ld a, [hl]
	and $3
	ret z
	ld [hl], 0
	ld e, a
	ld d, 0
	ld hl, .Data_8d8b4
	add hl, de
	ld a, [hl]
	call _ReinitSpriteAnimFrame
	ret

.Data_8d8b4
	db $17
	db $18
	db $17
	db $19

.Function8d8b8:
	ld a, $38
	ld hl, $4000
	rst $08
	ret

.Function8d8bf:
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d8c7
	dw .Function8d8d9

.Function8d8c7:
	call .Call_023_58e1
	ld a, [$c717]
	ld hl, $04
	add hl, bc
	add [hl]
	ld [hl], a
	cp $c0
	ret nc
	cp $a8
	ret c
.Function8d8d9:
	call DeinitializeSprite
	ld hl, wSpriteAnimCount
	dec [hl]
	ret

.Call_023_58e1:
	ld hl, $0c
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $1f
	srl a
	ld e, a
	ld d, 0
	ld hl, .Data_8d8f9
	add hl, de
	ld a, [hl]
	ld hl, $07
	add hl, bc
	ld [hl], a
	ret

.Data_8d8f9: ; 8d8f9
	db $04
	db $07
	db $09
	db $0a
	db $09
	db $07
	db $04
	db $00
	db $fc
	db $f9
	db $f7
	db $f6
	db $f7
	db $f9
	db $fc
	db $00

.Function8d909:
	ld a, [$c717]
	ld hl, $04
	add hl, bc
	add [hl]
	ld [hl], a
	cp $30
	ret nz
	xor a
	ld [$c717], a
	ret

.NamingScreenCursor:
	callfar NamingScreen_AnimateCursor
	ret

.MailCursor:
	callfar ComposeMail_AnimateCursor
	ret

.GameFreakLogo:
	callfar GFPresents_UpdateLogoPal
	ret

.GSIntroStar:
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_5968
	dec [hl]
	dec [hl]
	ld d, a
	and $1f
	jr nz, .asm_5943

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	dec [hl]
.asm_5943
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.asm_5968
	ld a, 1
	ld [wce64], a
	call DeinitializeSprite
	ret

.GSIntroSparkle:
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_59cc

	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld d, [hl]

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]

	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, -$10
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a
	ret

.asm_59cc
	call DeinitializeSprite
	ret

.SlotsGolem:
	callfar Slots_AnimateGolem
	ret

.SlotsChansey:
	callfar Slots_AnimateChansey
	ld hl, wce64
	ld a, [hl]
	cp 2
	ret nz
	ld [hl], 3
	ld a, $21
	call _ReinitSpriteAnimFrame
	ret

.SlotsChanseyEgg:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld e, a
	and 1
	jr z, .move_vertical

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp 15 * 8
	jr c, .move_right
	call DeinitializeSprite
	ld a, 4
	ld [wce64], a
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
	ret

.move_right
	inc [hl]
.move_vertical
	ld a, e
	ld d, $20
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.UnusedCursor:
	ld hl, $4908
	ld a, $38
	rst $08
	ret

.PokegearArrow:
	callfar AnimatePokegearModeIndicatorArrow
	ret

.DummyGameCursor:
	ld hl, $69ae
	ld a, $38
	rst $08
	ret

.TradePokeBall
	call .AnonymousJumptable
	jp hl

; Anonymous dw (see .AnonymousJumptable)
	dw .TradePokeBall_zero
	dw .TradePokeBall_one
	dw .TradePokeBall_two
	dw .TradePokeBall_three
	dw .TradePokeBall_four
	dw .TradePokeBall_five

.TradePokeBall_zero
	ld a, $26
	call _ReinitSpriteAnimFrame

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $2

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $20
	ret

.TradePokeBall_two
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_5a5d
	dec [hl]
	ret

.asm_5a5d
	call .IncrementJumptableIndex

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $40

.TradePokeBall_three
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_5a7b
	dec [hl]
	ld d, $28
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_5a7b
	ld de, SFX_GOT_SAFARI_BALLS
	call PlaySFX
	jr .TradePokeBall_five

.TradePokeBall_one
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $4

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $30

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $24
	ret

.TradePokeBall_four
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_5aca
	ld d, a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	call Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $20

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	sub $c
	ld [hl], a
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	ret

.asm_5aca
	xor a

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call .IncrementJumptableIndex
	ret

.TradePokeBall_five
	call DeinitializeSprite
	ret

.TradeTubeBulge:
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $b0
	jr nc, .delete
	and $3
	ret nz
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret

.delete
	call DeinitializeSprite
	ret

.TrademonInTube:
	callfar TradeAnim_AnimateTrademonInTube
	ret

.RevealNewMon:
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .finish_EggShell
	ld d, a
	add $8
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a

	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.finish_EggShell
	call DeinitializeSprite
	ret

.RadioTuningKnob:
	callfar AnimateTuningKnob
	ret

.CutLeaves:
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $80
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.FlyFrom:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	and a
	ret z

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	ret c

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	dec [hl]

	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $40
	jr nc, .skip
	add $8
	ld [hl], a
.skip
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.FlyLeaf:
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp -9 * 8
	jr nc, .delete_leaf
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]

	ld d, $40
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.delete_leaf
	call DeinitializeSprite
	ret

.FlyTo:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp 10 * 8 + 4
	ret z

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	jr z, .asm_5bce
	sub 2
	ld [hl], a
.asm_5bce
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.AnonymousJumptable:
	ld hl, sp+$0
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.IncrementJumptableIndex:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

.Sprites_Sine:
	call Sprites_Sine
	ret

.Sprites_Cosine:
	call Sprites_Cosine
	ret
