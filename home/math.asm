SkipNames::
	ld bc, $b
	and a
	ret z
.asm_319e
	add hl, bc
	dec a
	jr nz, .asm_319e
	ret

AddNTimes:: ; 31a3 (0:31a3)
	and a
	ret z
.asm_31a5
	add hl, bc
	dec a
	jr nz, .asm_31a5
	ret

SimpleMultiply::
	and a
	ret z
	push bc
	ld b, a
	xor a
.asm_31af
	add c
	dec b
	jr nz, .asm_31af
	pop bc
	ret

SimpleDivide:: ; 31b5 (0:31b5)
	ld b, $0
.asm_31b7
	inc b
	sub c
	jr nc, .asm_31b7
	dec b
	add c
	ret

Multiply::
	push hl
	push bc

	callab Multiply_ ; 1:67bd

	pop bc
	pop hl
	ret

Divide::
	push hl
	push de
	push bc

	homecall Divide_ ; 1:681d

	pop bc
	pop de
	pop hl
	ret

SubtractSigned::
	sub b
	ret nc
	cpl
	add $1
	scf
	ret
