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
	dw .GSIntroBubble
	dw .GSIntroShellder
	dw .GSIntroMagikarp
	dw .GSIntroLapras
	dw .GSIntroLapras2
	dw .GSIntroNote
	dw .GSIntroJigglypuff
	dw .GSIntroPikachu
	dw .GSIntroPikachuTail
	dw .GSIntroFireball
	dw .GSIntroChikoritaTotodile
	dw .GSIntroCyndaquil
	dw .GSTitleTrail
	dw .UnusedPikachu
	dw .UnusedPikachuTail
	dw .UnusedNote
	dw .UnusedJigglypuff
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
	dw .GSIntroHoOhLugia

.Null:
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

.GSIntroBubble
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	jr nc, .asm_8d54a

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	dec [hl]
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add $02
	ld [hl], a
	ld d, $08
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_8d54a
	call DeinitializeSprite
	ret

.GSIntroShellder
	ld a, [wGlobalAnimYOffset]
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	add [hl]
	cp $b0
	ret c
	call DeinitializeSprite
	ret

.GSIntroMagikarp
	call .AnonymousJumptable
	jp hl

; Anonymous dw (see .AnonymousJumptable)
	dw .Function8d565
	dw .Function8d576

.Function8d565
	call .IncrementJumptableIndex

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld a, [hl]

	and $03
	swap a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a

.Function8d576
	ld de, $0201
	ldh a, [hSGB]
	and a
	jr z, .asm_8d581
	ld de, $0402

.asm_8d581
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	cp $f0
	jr nc, .asm_8d59e

	add d
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
	ld d, $08
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_8d59e
	call DeinitializeSprite
	ret

.GSIntroLapras
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b0
	jr nc, .asm_8d5bb

	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $1
	ret z

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	ret

.asm_8d5bb
	call DeinitializeSprite
	ret

.GSIntroLapras2
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d5c9
	dw .Function8d5e2
	dw .Function8d5f3

.Function8d5c9
	call .Function8d60b
	ret z

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $58
	jr c, .asm_8d5d8

	dec [hl]
	ret


.asm_8d5d8
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $b0
	ret

.Function8d5e2
	call .Function8d60b
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d5ef

	dec [hl]
	ret

.asm_8d5ef
	call .IncrementJumptableIndex
	ret

.Function8d5f3
	call .Function8d60b
	ret z
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .asm_8d602
	dec [hl]
	ret

.asm_8d602
	call DeinitializeSprite
	ld a, $1
	ld [wBattleMonLevel], a
	ret

.Function8d60b
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, 4
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and $1
	ret

.GSIntroNote
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d62b
	dw .Function8d63e

.Function8d62b
	call .IncrementJumptableIndex
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and $1
	swap a
	sla a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a
.Function8d63e
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .asm_8d667
	inc [hl]
	ld d, $04

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add $02
	ld [hl], a
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	and $2
	ret z

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

.asm_8d667
	call DeinitializeSprite
	ret

.GSIntroJigglypuff
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d673
	dw .Function8d680

.Function8d673
	ld a, [wBattleMonLevel]
	and a
	ret z
	call .IncrementJumptableIndex
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_JIGGLYPUFF_2
	call _ReinitSpriteAnimFrame
.Function8d680
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .asm_8d68c
	dec [hl]
	dec [hl]
	ret

.asm_8d68c
	call DeinitializeSprite
	ret

.GSIntroPikachu
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d69c
	dw .Function8d6b6
	dw .Function8d6c9
	dw .Function8d6f2

.Function8d69c
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr z, .asm_8d6a7
	dec [hl]
	ret

.asm_8d6a7
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_2
	call _ReinitSpriteAnimFrame
	ret

.Function8d6b6
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d6c0
	dec [hl]
	ret

.asm_8d6c0
	call .IncrementJumptableIndex
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_3
	call _ReinitSpriteAnimFrame
	ret

.Function8d6c9
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	ld d, $04
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $50
	jr z, .asm_8d6e9
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.asm_8d6e9
	ld a, 1
	ld [wBattleMonLevel], a
	call .IncrementJumptableIndex
	ret

.Function8d6f2
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .asm_8d6fe
	dec [hl]
	dec [hl]
	ret

.asm_8d6fe
	call DeinitializeSprite
	ret

.GSIntroPikachuTail
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d70c
	dw .Function8d726
	dw .Function8d73c

.Function8d70c
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr z, .asm_8d717
	dec [hl]
	ret

.asm_8d717
	call .IncrementJumptableIndex

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_TAIL_2
	call _ReinitSpriteAnimFrame
	ret

.Function8d726
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d738
	dec [hl]
	cp $20
	ret nz
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_TAIL
	call _ReinitSpriteAnimFrame
	ret

.asm_8d738
	call .IncrementJumptableIndex
	ret

.Function8d73c
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	ld d, $04
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .asm_8d761
	dec [hl]
	dec [hl]
	ld a, [wBattleMonLevel]
	and a
	ret nz
	dec [hl]
	dec [hl]
	ret

.asm_8d761
	call DeinitializeSprite
	ret

.GSIntroFireball
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d76d
	dw .Function8d786

.Function8d76d
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
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a
	ret

.Function8d786
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	ld d, a
	add $8
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C
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
	ret

; flash down/right
.GSIntroChikoritaTotodile
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d7b9
	dw .Function8d7c9

.Function8d7b9
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $30
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	ret

.Function8d7c9
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $3c
	ret nc

	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

; flash down/left
.GSIntroCyndaquil
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d7f7
	dw .Function8d807

.Function8d7f7
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $30
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $10
	ret

.Function8d807
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $3c
	ret nc
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Cosine
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.GSTitleTrail
	call .AnonymousJumptable
	jp hl

IF DEF(_GOLD)
; anonymous jumptable
	dw .Function8d835
	dw .Function8d84c

.Function8d835
	call .IncrementJumptableIndex

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld a, [hl]

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	and $3
	ld [hl], a
	inc [hl]
	swap a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a

.Function8d84c
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $a4
	jr nc, .asm_8d881

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	add $4

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	sla a
	sla a
	ld d, 2

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add $3
	ld [hl], a
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_8d881
	call DeinitializeSprite
	ret

ELIF DEF(_SILVER)
; anonymous jumptable
	dw .Function8d835
	dw .Function8d856

.Function8d835
	ld a, [wIntroSceneTimer]
	and $30
	swap a
	add $3
	ld d, a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [wIntroSceneTimer]
	and $30
	swap a
	add $07
	add [hl]
	ld [hl], a
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
.Function8d856
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $a4
	jr nc, .asm_8d863
	add $4
	ld [hl], a
	ret

.asm_8d863
	call DeinitializeSprite
	ret
ENDC

.GSIntroHoOhLugia
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
IF DEF(_GOLD)
	inc a
	ld [hl], a
	ld d, 2
ELIF DEF(_SILVER)
	dec a
	ld [hl], a
	ld d, 8
ENDC
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.UnusedPikachu
	push bc
	farcall ret_e0000
	pop bc
	ld hl, wc704
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
	db SPRITE_ANIM_FRAMESET_UNUSED_PIKACHU
	db SPRITE_ANIM_FRAMESET_UNUSED_PIKACHU_2
	db SPRITE_ANIM_FRAMESET_UNUSED_PIKACHU
	db SPRITE_ANIM_FRAMESET_UNUSED_PIKACHU_3

.UnusedPikachuTail
	farcall ret_e0000
	ret

.UnusedNote
	call .AnonymousJumptable
	jp hl

; anonymous jumptable
	dw .Function8d8c7
	dw .Function8d8d9

.Function8d8c7
	call .Function8d8e1
	ld a, [wc717]
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	cp $c0
	ret nc
	cp $a8
	ret c
.Function8d8d9
	call DeinitializeSprite
	ld hl, wSpriteAnimCount
	dec [hl]
	ret

.Function8d8e1
	ld hl, SPRITEANIMSTRUCT_0C
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
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.Data_8d8f9
	db  4,  7,  9,  10,  9,  7,  4,  0
	db -4, -7, -9, -10, -9, -7, -4,  0

.UnusedJigglypuff
	ld a, [wc717]

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	cp $30
	ret nz
	xor a
	ld [wc717], a
	ret

.NamingScreenCursor
	callfar NamingScreen_AnimateCursor
	ret

.MailCursor
	callfar ComposeMail_AnimateCursor
	ret

.GameFreakLogo:
	callfar GFPresents_UpdateLogoPal
	ret

.GSIntroStar
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d968
	dec [hl]
	dec [hl]
	ld d, a
	and $1f
	jr nz, .asm_8d943

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	dec [hl]
.asm_8d943
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

.asm_8d968
	ld a, 1
	ld [wce64], a
	call DeinitializeSprite
	ret

.GSIntroSparkle
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_8d9cc

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

.asm_8d9cc
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
	ld a, SPRITE_ANIM_FRAMESET_SLOTS_CHANSEY_2
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

.UnusedCursor
	callfar ret_e0908
	ret

.PokegearArrow
	callfar AnimatePokegearModeIndicatorArrow
	ret

.DummyGameCursor
	callfar DummyGame_InterpretJoypad_AnimateCursor
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
	ld a, SPRITE_ANIM_FRAMESET_TRADE_POKE_BALL_WOBBLE
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
	jr z, .asm_8da5d
	dec [hl]
	ret

.asm_8da5d
	call .IncrementJumptableIndex

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $40

.TradePokeBall_three
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_8da7b
	dec [hl]
	ld d, $28
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_8da7b
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
	jr z, .asm_8daca
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

.asm_8daca
	xor a

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call .IncrementJumptableIndex
	ret

.TradePokeBall_five
	call DeinitializeSprite
	ret

.TradeTubeBulge
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

.TrademonInTube
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

.CutLeaves
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
	jr z, .asm_8dbce
	sub 2
	ld [hl], a
.asm_8dbce
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
