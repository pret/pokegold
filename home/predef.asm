Predef:: ; 2e49 (0:2e49)
	ld [wPredefID], a
	ld a, [hROMBank]
	push af
	ld a, BANK(GetPredefPointer)
	rst Bankswitch
	call GetPredefPointer
	rst Bankswitch
	ld hl, .return
	push hl
	ld a, [wPredefPointerBuffer]
	ld h, a
	ld a, [wPredefPointerBuffer + 1]
	ld l, a
	push hl
	ld a, [wPredefHLBuffer]
	ld h, a
	ld a, [wPredefHLBuffer + 1]
	ld l, a
	ret

.return
	ld a, h
	ld [wPredefHLBuffer], a
	ld a, l
	ld [wPredefHLBuffer + 1], a
	pop hl
	ld a, h
	rst Bankswitch
	ld a, [wPredefHLBuffer]
	ld h, a
	ld a, [wPredefHLBuffer + 1]
	ld l, a
	ret
