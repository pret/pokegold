LearnMove:
	call BackUpTilesToBuffer
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Nickname
	call GetNick
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, $b
	call CopyBytes
.loop
	ld hl, wPartyMon1Moves
	ld bc, $30
	ld a, [wCurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld b, $4
.asm_660f
	ld a, [hl]
	and a
	jr z, .asm_6643
	inc hl
	dec b
	jr nz, .asm_660f
	push de
	call .AlreadyHaveFourMoves
	pop de
	jp c, .ConfirmStopLearning
	push hl
	push de
	ld [wd151], a
	ld b, a
	ld a, [wBattleMode]
	and a
	jr z, .asm_6638
	ld a, [wcbd3]
	cp b
	jr nz, .asm_6638
	xor a
	ld [wcbd3], a
	ld [wcb53], a
.asm_6638
	call GetMoveName
	ld hl, Text_1_2_and_Poof
	call PrintText
	pop de
	pop hl
.asm_6643
	ld a, [wd14d]
	ld [hl], a
	ld bc, $15
	add hl, bc
	push hl
	push de
	dec a
	ld hl, Moves + MOVE_PP ; $5b03
	ld bc, $7
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop de
	pop hl
	ld [hl], a
	ld a, [wBattleMode]
	and a
	jp z, .LearnedMove
	ld a, [wCurPartyMon]
	ld b, a
	ld a, [wCurBattleMon]
	cp b
	jp nz, .LearnedMove
	ld a, [wPlayerSubStatus5]
	bit 3, a
	jp nz, .LearnedMove
	ld h, d
	ld l, e
	ld de, wBattleMonMoves
	ld bc, $4
	call CopyBytes
	ld bc, $11
	add hl, bc
	ld de, wBattleMonPP
	ld bc, $4
	call CopyBytes
	jp .LearnedMove

.ConfirmStopLearning: ; 6694 (1:6694)
	ld hl, Text_StopLearning
	call PrintText
	call YesNoBox
	jp c, .loop
	ld hl, Text_DidNotLearn
	call PrintText
	ld b, $0
	ret

.LearnedMove: ; 66a9 (1:66a9)
	ld hl, Text_LearnedMove
	call PrintText
	ld b, $1
	ret

.AlreadyHaveFourMoves: ; 66b2 (1:66b2)
	push hl
	ld hl, Text_TryingToLearn
	call PrintText
	call YesNoBox
	pop hl
	ret c
	ld bc, -4
	add hl, bc
	push hl
	ld de, wd149
	ld bc, $4
	call CopyBytes
	pop hl
.asm_66cd
	push hl
	ld hl, Text_ForgetWhich
	call PrintText
	hlcoord 5, 2
	ld b, $8
	ld c, $d
	call TextBox
	hlcoord 7, 4
	ld a, $28
	ld [wBuffer1], a
	predef ListMoves
	ld a, $4
	ld [wMenuData2End], a
	ld a, $6
	ld [wced9], a
	ld a, [wcfe3]
	inc a
	ld [wceda], a
	ld a, $1
	ld [wcedb], a
	ld [wMenuCursorY], a
	ld [wcee1], a
	ld a, $3
	ld [wMenuJoypadFilter], a
	ld a, $20
	ld [wcedc], a
	xor a
	ld [wcedd], a
	ld a, $20
	ld [wcede], a
	call StaticMenuJoypad
	push af
	call ReloadTilesFromBuffer
	pop af
	pop hl
	bit 1, a
	jr nz, .asm_6748
	push hl
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	push af
	push bc
	call IsHMMove
	pop bc
	pop de
	ld a, d
	jr c, .asm_673f
	pop hl
	add hl, bc
	and a
	ret

.asm_673f
	ld hl, Text_CantForgetHM
	call PrintText
	pop hl
	jr .asm_66cd

.asm_6748
	scf
	ret

Text_LearnedMove:
	text_far Text_LearnedMove_
	db "@"

Text_ForgetWhich:
	text_far Text_ForgetWhich_
	db "@"

Text_StopLearning:
	text_far Text_StopLearning_
	db "@"

Text_DidNotLearn:
	text_far Text_DidNotLearn_
	db "@"

Text_TryingToLearn:
	text_far Text_TryingToLearn_
	db "@"

Text_1_2_and_Poof:
	text_far Text_1_2_and_Poof_
	text_asm
	push de
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	pop de
	ld hl, .PoofForgot
	ret

.PoofForgot:
	text_far Text_PoofForgot_
	db "@"

Text_CantForgetHM:
	text_far Text_CantForgetHM_
	db "@"
