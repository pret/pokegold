CopyBytes:: ; 311a (0:311a)
	inc b
	inc c
	jr .asm_3121
.asm_311e
	ld a, [hli]
	ld [de], a
	inc de
.asm_3121
	dec c
	jr nz, .asm_311e
	dec b
	jr nz, .asm_311e
	ret

GetFarByte:: ; 3128 (0:3128)
	ld [wBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [wBuffer]
	rst Bankswitch
	ld a, [hl]
	ld [wBuffer], a
	pop af
	rst Bankswitch
	ld a, [wBuffer]
	ret

GetFarHalfword:: ; 313c (0:313c)
	ld [wBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [wBuffer]
	rst Bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst Bankswitch
	ret

ByteFill:: ; 314c (0:314c)
	inc b
	inc c
	jr .asm_3151
.asm_3150
	ld [hli], a
.asm_3151
	dec c
	jr nz, .asm_3150
	dec b
	jr nz, .asm_3150
	ret
