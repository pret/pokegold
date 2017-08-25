FarCall_hl:: ; 2e27 (0:2e27)
	ld [wBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [wBuffer]
	rst Bankswitch
	call ._hl_
	ld a, b
	ld [wFarCallBCBuffer], a
	ld a, c
	ld [wFarCallBCBuffer + 1], a
	pop bc
	ld a, b
	rst Bankswitch
	ld a, [wFarCallBCBuffer]
	ld b, a
	ld a, [wFarCallBCBuffer + 1]
	ld c, a
	ret

._hl_
	jp hl
