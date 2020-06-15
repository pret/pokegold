PrintItemDescription:
; Print the description for item [wCurSpecies] at de.

	ld a, [wCurSpecies]
	cp TM01
	jr c, .not_a_tm

	ld [wCurItem], a
	push de
	call GetTMHMItemMove
	pop hl
	ld a, [wTempTMHM]
	ld [wCurSpecies], a
	call PrintMoveDescription
	ret

.not_a_tm
	push de
	ld hl, ItemDescriptions
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, BANK(ItemDescriptions)
	call GetFarHalfword
	ld d, h
	ld e, l
	pop hl
	ld a, BANK(ItemDescriptions)
	jp FarString
