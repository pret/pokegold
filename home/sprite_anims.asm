InitAnimatedObjectStruct::
	ld [wAnimatedObjectStructIDBuffer], a
	ldh a, [hROMBank]
	push af
	ld a, BANK(InitAnimatedObjectStruct_) ; $23
	rst Bankswitch
	ld a, [wAnimatedObjectStructIDBuffer]
	call InitAnimatedObjectStruct_ ; $51f7
	pop af
	rst Bankswitch
	ret

ReinitAnimatedObjectFrame::
	ld [wAnimatedObjectStructIDBuffer], a
	ldh a, [hROMBank]
	push af
	ld a, BANK(ReinitAnimatedObjectFrame_) ; $23
	rst Bankswitch
	ld a, [wAnimatedObjectStructIDBuffer]
	call ReinitAnimatedObjectFrame_ ; $5332
	pop af
	rst Bankswitch
	ret