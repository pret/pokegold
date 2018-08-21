HP_BAR_MAX_PIXELS EQU $30

AnimateHPBar_: ; d62d (3:562d)
	call Functiond665
	jr c, .asm_d64b
	call Functiond676
.asm_d635
	push bc
	push hl
	call Functiond6e8
	pop hl
	pop bc
	push af
	push bc
	push hl
	call Functiond736
	call Functiond7cf
	pop hl
	pop bc
	pop af
	jr nc, .asm_d635
	ret

.asm_d64b
	call Functiond676
.asm_d64e
	push bc
	push hl
	call Functiond6fb
	pop hl
	pop bc
	ret c
	push af
	push bc
	push hl
	call Functiond74f
	call Functiond7cf
	pop hl
	pop bc
	pop af
	jr nc, .asm_d64e
	ret

Functiond665: ; d665 (3:5665)
	ld a, [wCurHPAnimMaxHP + 1]
	and a
	jr nz, .asm_d674
	ld a, [wCurHPAnimMaxHP]
	cp HP_BAR_MAX_PIXELS
	jr nc, .asm_d674
	and a
	ret

.asm_d674
	scf
	ret

Functiond676: ; d676 (3:5676)
	push hl
	ld hl, wCurHPAnimMaxHP
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	call ComputeHPBarPixels
	ld a, e
	ld [wCurHPBarPixels], a
	ld a, [wCurHPAnimNewHP]
	ld c, a
	ld a, [wCurHPAnimNewHP + 1]
	ld b, a
	ld a, [wCurHPAnimMaxHP]
	ld e, a
	ld a, [wCurHPAnimMaxHP + 1]
	ld d, a
	call ComputeHPBarPixels
	ld a, e
	ld [wNewHPBarPixels], a
	push hl
	ld hl, wCurHPAnimOldHP
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	jr c, .asm_d6c7
	ld a, [wCurHPAnimOldHP]
	ld [wCurHPAnimLowHP], a
	ld a, [wCurHPAnimNewHP]
	ld [wCurHPAnimHighHP], a
	ld bc, $1
	jr .asm_d6df

.asm_d6c7
	ld a, [wCurHPAnimOldHP]
	ld [wCurHPAnimHighHP], a
	ld a, [wCurHPAnimNewHP]
	ld [wCurHPAnimLowHP], a
	ld a, e
	xor $ff
	inc a
	ld e, a
	ld a, d
	xor $ff
	ld d, a
	ld bc, rIE
.asm_d6df
	ld a, d
	ld [wCurHPAnimDeltaHP], a
	ld a, e
	ld [wCurHPAnimDeltaHP + 1], a
	ret

Functiond6e8: ; d6e8 (3:56e8)
	ld hl, wCurHPBarPixels
	ld a, [wNewHPBarPixels]
	cp [hl]
	jr nz, .asm_d6f3
	scf
	ret

.asm_d6f3
	ld a, c
	add [hl]
	ld [hl], a
	call Functiond83f
	and a
	ret

Functiond6fb: ; d6fb (3:56fb)
	ld hl, wCurHPAnimOldHP
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	cp [hl]
	jr nz, .asm_d70d
	inc hl
	ld a, d
	cp [hl]
	jr nz, .asm_d70d
	scf
	ret

.asm_d70d
	ld l, e
	ld h, d
	add hl, bc
	ld a, l
	ld [wCurHPAnimOldHP], a
	ld a, h
	ld [wCurHPAnimOldHP + 1], a
	push hl
	push de
	push bc
	ld hl, wCurHPAnimMaxHP
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	; BUG: This routine is meant to make the HP bar move at
	; the same rate regardless of how many HP the Pokemon has.
	; In actuality, this causes Pokemon with more than 48 HP
	; to gain or lose HP at the rate of 1 HP per BGMap update
	; rather than 1 pixel on the HUD.
	; To fix, move the "ld a, e" above the "pop de".
	call ComputeHPBarPixels ; returns to e
	pop bc
	pop de ; overloads e
	pop hl
	ld a, e ; expects result from ComputeHPBarPixels
	ld hl, wCurHPBarPixels
	cp [hl]
	jr z, Functiond6fb
	ld [hl], a
	and a
	ret

Functiond736: ; d736 (3:5736)
	call Functiond78a
	ld d, $6
	ld a, [wWhichHPBar]
	and $1
	ld b, a
	ld a, [wCurHPBarPixels]
	ld e, a
	ld c, a
	push de
	call Functiond777
	pop de
	call Functiond7ba
	ret

Functiond74f: ; d74f (3:574f)
	call Functiond78a
	ld a, [wCurHPAnimOldHP]
	ld c, a
	ld a, [wCurHPAnimOldHP + 1]
	ld b, a
	ld a, [wCurHPAnimMaxHP]
	ld e, a
	ld a, [wCurHPAnimMaxHP + 1]
	ld d, a
	call ComputeHPBarPixels
	ld c, e
	ld d, $6
	ld a, [wWhichHPBar]
	and $1
	ld b, a
	push de
	call Functiond777
	pop de
	call Functiond7ba
	ret

Functiond777: ; d777 (3:5777)
	ld a, [wWhichHPBar]
	cp $2
	jr nz, .asm_d786
	ld a, $28
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
.asm_d786
	call DrawBattleHPBar
	ret

Functiond78a: ; d78a (3:578a)
	ld a, [wWhichHPBar]
	and a
	ret z
	cp $1
	jr z, .asm_d798
	ld de, $16
	jr .asm_d79b

.asm_d798
	ld de, $15
.asm_d79b
	push hl
	add hl, de
	ld a, $7f
	ld [hli], a
	ld [hli], a
	ld [hld], a
	dec hl
	ld a, [wCurHPAnimOldHP]
	ld [wStringBuffer2 + 1], a
	ld a, [wCurHPAnimOldHP + 1]
	ld [wStringBuffer2], a
	ld de, wStringBuffer2
	lb bc, 2, 3
	call PrintNum
	pop hl
	ret

Functiond7ba: ; d7ba (3:57ba)
	ld a, [hCGB]
	and a
	ret z
	ld hl, wCurHPAnimPal
	call SetHPPal
	ld a, [wCurHPAnimPal]
	ld c, a
	ld a, $2
	ld hl, $520b
	rst FarCall
	ret

Functiond7cf: ; d7cf (3:57cf)
	ld a, [hCGB]
	and a
	jr nz, .asm_d7db
	call DelayFrame
	call DelayFrame
	ret

.asm_d7db
	ld a, [wWhichHPBar]
	and a
	jr z, .asm_d82f
	cp $1
	jr z, .asm_d833
	ld a, [wCurPartyMon]
	cp $3
	jr nc, .asm_d7f0
	ld c, $0
	jr .asm_d7f2

.asm_d7f0
	ld c, $1
.asm_d7f2
	push af
	cp $2
	jr z, .asm_d805
	cp $5
	jr z, .asm_d805
	ld a, $2
	ld [hBGMapMode], a
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
.asm_d805
	ld a, $1
	ld [hBGMapMode], a
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
	pop af
	cp $2
	jr z, .asm_d819
	cp $5
	jr z, .asm_d819
	ret

.asm_d819
	inc c
	ld a, $2
	ld [hBGMapMode], a
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
	ld a, $1
	ld [hBGMapMode], a
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
	ret

.asm_d82f
	ld c, $0
	jr .asm_d835

.asm_d833
	ld c, $1
.asm_d835
	call DelayFrame
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
	ret

Functiond83f: ; d83f (3:583f)
	ld a, [wCurHPAnimMaxHP]
	ld c, a
	ld b, $0
	ld hl, $0
	ld a, [wCurHPBarPixels]
	cp HP_BAR_MAX_PIXELS
	jr nc, .asm_d88b
	and a
	jr z, .asm_d886
	call AddNTimes
	ld b, $0
.asm_d857
	ld a, l
	sub HP_BAR_MAX_PIXELS % $100
	ld l, a
	ld a, h
	sbc HP_BAR_MAX_PIXELS / $100
	ld h, a
	jr c, .asm_d864
	inc b
	jr .asm_d857

.asm_d864
	push bc
	ld bc, $80
	add hl, bc
	pop bc
	ld a, l
	sub HP_BAR_MAX_PIXELS % $100
	ld l, a
	ld a, h
	sbc HP_BAR_MAX_PIXELS / $100
	ld h, a
	jr c, .asm_d875
	inc b
.asm_d875
	ld a, [wCurHPAnimLowHP]
	cp b
	jr nc, .asm_d882
	ld a, [wCurHPAnimHighHP]
	cp b
	jr c, .asm_d882
	ld a, b
.asm_d882
	ld [wCurHPAnimOldHP], a
	ret

.asm_d886
	xor a
	ld [wCurHPAnimOldHP], a
	ret

.asm_d88b
	ld a, [wCurHPAnimMaxHP]
	ld [wCurHPAnimOldHP], a
	ret
