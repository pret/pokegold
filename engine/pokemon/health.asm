HealParty: ; c69d (3:469d)
	xor a
	ld [wCurPartyMon], a
	ld hl, wPartySpecies
.asm_c6a4
	ld a, [hli]
	cp $ff
	jr z, .asm_c6bb
	cp $fd
	jr z, .asm_c6b2
	push hl
	call Functionc6bc
	pop hl
.asm_c6b2
	ld a, [wCurPartyMon]
	inc a
	ld [wCurPartyMon], a
	jr .asm_c6a4

.asm_c6bb
	ret

Functionc6bc: ; c6bc (3:46bc)
	ld a, $0
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld hl, $20
	add hl, de
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, $24
	add hl, de
	ld b, h
	ld c, l
	dec bc
	dec bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hl]
	ld [bc], a
	farcall Functionf900
	ret

ComputeHPBarPixels:
; e = bc * (6 * 8) / de
	ld a, b
	or c
	jr z, .asm_c722
	push hl
	xor a
	ldh [hMultiplicand + 0], a
	ld a, b
	ldh [hMultiplicand + 1], a
	ld a, c
	ldh [hMultiplicand + 2], a
	ld a, 6 * 8
	ldh [hMultiplier], a
	call Multiply
	; We need de to be under 256 because hDivisor is only 1 byte.
	ld a, d
	and a
	jr z, .asm_c711
	; divide de and hProduct by 4
	srl d
	rr e
	srl d
	rr e
	ldh a, [hProduct + 2]
	ld b, a
	ldh a, [hProduct + 3]
	srl b
	rr a
	srl b
	rr a
	ldh [hDividend + 3], a
	ld a, b
	ldh [hDividend + 2], a
.asm_c711
	ld a, e
	ldh [hDivisor], a
	ld b, $4
	call Divide
	ldh a, [hQuotient + 3]
	ld e, a
	pop hl
	and a
	ret nz
	ld e, $1
	ret

.asm_c722
	ld e, $0
	ret

AnimateHPBar: ; c725 (3:4725)
	call WaitBGMap
	call AnimateHPBar_
	call WaitBGMap
	ret
