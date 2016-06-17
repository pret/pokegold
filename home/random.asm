Random:: ; 30a2 (0:30a2)
	push bc
	ld a, [rDIV]
	ld b, a
	ld a, [hRandom]
	adc b
	ld [hRandom], a
	ld a, [rDIV]
	ld b, a
	ld a, [hRandomSub]
	sbc b
	ld [hRandomSub], a
	pop bc
	ret

BattleRandom::
	ld a, [hROMBank]
	push af
	ld a, BANK(BattleRandom_)
	rst Bankswitch
	call BattleRandom_
	ld [wPredefHLBuffer + 1], a
	pop af
	rst Bankswitch
	ld a, [wPredefHLBuffer + 1]
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
	ld a, [hRandom]
	ld c, a
	add b
	jr c, .asm_30d1
	ld a, c
	pop bc
	call SimpleDivide
	pop bc
	ret
