	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call _hl_
	ret

Pointers4460:
	dw Function44a0, Function44a0
	dw Function44b2, Function44a7
	dw Function44be, Function44a7
	dw Function44e1, Function44a7
	dw Function4502, Function44a7
	dw Function4512, Function44a0
	dw Function4547, Function4547
	dw Function4554, Function44a0
	dw Function455b, Function455b
	dw Function4562, Function4562
	dw Function4569, Function457d
	dw Function4584, Function44a7
	dw Function4597, Function4597
	dw Function459e, Function459e
	dw Function45b3, Function44a0
	dw Function45c6, Function44a0

Function44a0:
	ld hl, $d
	add hl, bc
	ld [hl], $ff
	ret

Function44a7: ; 44a7 (1:44a7)
	call GetSpriteDirection
	or $0
	ld hl, $d
	add hl, bc
	ld [hl], a
	ret

Function44b2:
	ld hl, $d
	add hl, bc
	ld a, [hl]
	and $1
	jr nz, Function44be
	jp Function44a7

Function44be:
	ld hl, $4
	add hl, bc
	bit 3, [hl]
	jp nz, Function44a7
	ld hl, $c
	add hl, bc
	ld a, [hl]
	inc a
	and $f
	ld [hl], a
	rrca
	rrca
	and $3
	ld d, a
	call GetSpriteDirection
	or $0
	or d
	ld hl, $d
	add hl, bc
	ld [hl], a
	ret

Function44e1:
	ld hl, $4
	add hl, bc
	bit 3, [hl]
	jp nz, Function44a7
	ld hl, $c
	add hl, bc
	inc [hl]
	ld a, [hl]
	rrca
	rrca
	rrca
	and $3
	ld d, a
	call GetSpriteDirection
	or $0
	or d
	ld hl, $d
	add hl, bc
	ld [hl], a
	ret

Function4502:
	call Function4518
	ld hl, $8
	add hl, bc
	ld a, [hl]
	or $0
	ld hl, $d
	add hl, bc
	ld [hl], a
	ret

Function4512:
	call Function4518
	jp Function44a0

Function4518: ; 4518 (1:4518)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and $f0
	ld e, a
	ld a, [hl]
	inc a
	and $f
	ld d, a
	cp $4
	jr c, .asm_4531
	ld d, $0
	ld a, e
	add $10
	and $30
	ld e, a
.asm_4531
	ld a, d
	or e
	ld [hl], a
	swap e
	ld d, $0
	ld hl, .directions
	add hl, de
	ld a, [hl]
	ld hl, $8
	add hl, bc
	ld [hl], a
	ret

.directions
	db OW_DOWN, OW_RIGHT, OW_UP, OW_LEFT

Function4547:
	call GetSpriteDirection
	rrca
	rrca
	add $10
	ld hl, $d
	add hl, bc
	ld [hl], a
	ret

Function4554:
	ld hl, $d
	add hl, bc
	ld [hl], $15
	ret

Function455b:
	ld hl, $d
	add hl, bc
	ld [hl], $14
	ret

Function4562:
	ld hl, $d
	add hl, bc
	ld [hl], $17
	ret

Function4569:
	ld hl, $c
	add hl, bc
	ld a, [hl]
	inc a
	and $f
	ld [hl], a
	and $8
	jr z, Function457d
	ld hl, $d
	add hl, bc
	ld [hl], $4
	ret

Function457d:
	ld hl, $d
	add hl, bc
	ld [hl], $0
	ret

Function4584:
	ld hl, $c
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	and $c
	rrca
	rrca
	add $18
	ld hl, $d
	add hl, bc
	ld [hl], a
	ret

Function4597:
	ld hl, $d
	add hl, bc
	ld [hl], $16
	ret

Function459e:
	ld a, [wd558]
	ld d, $17
	cp $33
	jr z, .asm_45ad
	cp $47
	jr z, .asm_45ad
	ld d, $16
.asm_45ad
	ld hl, $d
	add hl, bc
	ld [hl], d
	ret

Function45b3:
	ld hl, $c
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld hl, $d
	add hl, bc
	and $2
	ld a, $1c
	jr z, .asm_45c4
	inc a
.asm_45c4
	ld [hl], a
	ret

Function45c6:
	ld hl, $c
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld hl, $d
	add hl, bc
	and $4
	ld a, $1e
	jr z, .asm_45d7
	inc a
.asm_45d7
	ld [hl], a
	ret
