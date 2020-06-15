PrintMoveDescription:
	push hl
	ld hl, MoveDescriptions
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, BANK(MoveDescriptions)
	call GetFarHalfword
	ld d, h
	ld e, l
	pop hl
	ld a, BANK(MoveDescriptions)
	jp FarString
