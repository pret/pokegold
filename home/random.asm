Random:: ; 30a2 (0:30a2)
	push bc
	ldh a, [rDIV]
	ld b, a
	ldh a, [hRandom]
	adc b
	ldh [hRandom], a
	ldh a, [rDIV]
	ld b, a
	ldh a, [hRandomSub]
	sbc b
	ldh [hRandomSub], a
	pop bc
	ret

BattleRandom::
	ldh a, [hROMBank]
	push af
	ld a, BANK(BattleRandom_)
	rst Bankswitch
	call BattleRandom_
	ld [wPredefTemp + 1], a
	pop af
	rst Bankswitch
	ld a, [wPredefTemp + 1]
	ret

RandomRange::
	push bc
	ld c, a
	xor a
	sub c
.asm_30cb
	sub c
	jr nc, .asm_30cb
	add c
	ld b, a
	push bc
.asm_30d1
	call Random
	ldh a, [hRandom]
	ld c, a
	add b
	jr c, .asm_30d1
	ld a, c
	pop bc
	call SimpleDivide
	pop bc
	ret
