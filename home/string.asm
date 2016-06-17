InitString::
	push hl
	jr InitString_

InitName::
	push hl
	ld c, $a
InitString_::
	push bc
.asm_2fbd
	ld a, [hli]
	cp $50
	jr z, .asm_2fc9
	cp $7f
	jr nz, .asm_2fd4
	dec c
	jr nz, .asm_2fbd
.asm_2fc9
	pop bc
	ld l, e
	ld h, d
	pop de
	ld b, $0
	inc c
	call CopyBytes
	ret

.asm_2fd4
	pop bc
	pop hl
	ret
