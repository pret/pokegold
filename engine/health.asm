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

ComputeHPBarPixels: ; c6de (3:46de)
	ld a, b
	or c
	jr z, .asm_c722
	push hl
	xor a
	ld [hPrintNum2], a
	ld a, b
	ld [hPrintNum3], a
	ld a, c
	ld [hPrintNum4], a
	ld a, $30
	ld [hPrintNum5], a
	call Multiply
	ld a, d
	and a
	jr z, .asm_c711
	srl d
	rr e
	srl d
	rr e
	ld a, [hStringCmpString2]
	ld b, a
	ld a, [hPrintNum4]
	srl b
	rr a
	srl b
	rr a
	ld [hPrintNum4], a
	ld a, b
	ld [hPrintNum3], a
.asm_c711
	ld a, e
	ld [hPrintNum5], a
	ld b, $4
	call Divide
	ld a, [hPrintNum4]
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
