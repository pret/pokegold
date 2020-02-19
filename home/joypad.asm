JoypadInt:: ; 8df (0:08df)
	reti

ClearJoypad::
	xor a
	ldh [hJoyPressed], a
	ldh [hJoyDown], a
	ret

Joypad:: ; 8e6 (0:08e6)
	ld a, [wd8ba]
	and $d0
	ret nz
	ld a, [wGameLogicPaused]
	and a
	ret nz
	ld a, $20
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	cpl
	and $f
	swap a
	ld b, a
	ld a, $10
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	cpl
	and $f
	or b
	ld b, a
	ld a, $30
	ldh [rJOYP], a
	ldh a, [hJoypadDown]
	ld e, a
	xor b
	ld d, a
	and e
	ldh [hJoypadReleased], a
	ld a, d
	and b
	ldh [hJoypadPressed], a
	ld c, a
	ldh a, [hJoypadSum]
	or c
	ldh [hJoypadSum], a
	ld a, b
	ldh [hJoypadDown], a
	and $f
	cp $f
	jp z, Reset
	ret

GetJoypad:: ; 935 (0:0935)
	push af
	push hl
	push de
	push bc
	ld a, [wInputType]
	cp $ff
	jr z, .auto
	ldh a, [hJoypadDown]
	ld b, a
	ldh a, [hJoyDown]
	ld e, a
	xor b
	ld d, a
	and e
	ldh [hJoyReleased], a
	ld a, d
	and b
	ldh [hJoyPressed], a
	ld c, a
	ld a, b
	ldh [hJoyDown], a
.quit
	pop bc
	pop de
	pop hl
	pop af
	ret

.auto
	ldh a, [hROMBank]
	push af
	ld a, [wAutoInputBank]
	rst Bankswitch
	ld hl, wAutoInputAddress
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wAutoInputLength]
	and a
	jr z, .updateauto
	dec a
	ld [wAutoInputLength], a
	pop af
	rst Bankswitch
	jr .quit

.updateauto
	ld a, [hli]
	cp $ff
	jr z, .stopauto
	ld b, a
	ld a, [hli]
	ld [wAutoInputLength], a
	cp $ff
	jr nz, .next
	dec hl
	dec hl
	ld b, $0
	jr .finishauto

.next
	ld a, l
	ld [wAutoInputAddress], a
	ld a, h
	ld [wAutoInputAddress + 1], a
	jr .finishauto

.stopauto
	call StopAutoInput
	ld b, $0
.finishauto
	pop af
	rst Bankswitch
	ld a, b
	ldh [hJoyPressed], a
	ldh [hJoyDown], a
	jr .quit

StartAutoInput::
	ld [wAutoInputBank], a
	ld a, l
	ld [wAutoInputAddress], a
	ld a, h
	ld [wAutoInputAddress + 1], a
	xor a
	ld [wAutoInputLength], a
	xor a
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ldh [hJoyDown], a
	ld a, $ff
	ld [wInputType], a
	ret

StopAutoInput:: ; 9bb (0:09bb)
	xor a
	ld [wAutoInputBank], a
	ld [wAutoInputAddress], a
	ld [wAutoInputAddress + 1], a
	ld [wAutoInputLength], a
	ld [wInputType], a
	ret

JoyTitleScreenInput::
.loop
	call DelayFrame
	push bc
	call JoyTextDelay
	pop bc

	ldh a, [hJoyDown]
	cp D_UP | SELECT | B_BUTTON
	jr z, .keycombo

	ldh a, [hJoyLast]
	and START | A_BUTTON
	jr nz, .keycombo

	dec c
	jr nz, .loop

	and a
	ret

.keycombo
	scf
	ret

JoyWaitAorB::
	call DelayFrame
	call GetJoypad
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret nz
	call RTC
	jr JoyWaitAorB

WaitButton::
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	call WaitBGMap
	call JoyWaitAorB
	pop af
	ldh [hOAMUpdate], a
	ret

JoyTextDelay:: ; a08 (0:0a08)
	call GetJoypad
	ldh a, [hInMenu]
	and a
	ldh a, [hJoyPressed]
	jr z, .ok
	ldh a, [hJoyDown]
.ok
	ldh [hJoyLast], a
	ldh a, [hJoyPressed]
	and a
	jr z, .checkframedelay
	ld a, 15
	ld [wTextDelayFrames], a
	ret

.checkframedelay
	ld a, [wTextDelayFrames]
	and a
	jr z, .restartframedelay
	xor a
	ldh [hJoyLast], a
	ret

.restartframedelay
	ld a, 5
	ld [wTextDelayFrames], a
	ret

WaitPressAorB_BlinkCursor::
	ldh a, [hMapObjectIndexBuffer]
	push af
	ldh a, [hObjectStructIndexBuffer]
	push af
	xor a
	ldh [hMapObjectIndexBuffer], a
	ld a, $6
	ldh [hObjectStructIndexBuffer], a
.loop
	push hl
	hlcoord 18, 17
	call BlinkCursor
	pop hl
	call JoyTextDelay
	ldh a, [hJoyLast]
	and A_BUTTON | B_BUTTON
	jr z, .loop
	pop af
	ldh [hObjectStructIndexBuffer], a
	pop af
	ldh [hMapObjectIndexBuffer], a
	ret

SimpleWaitPressAorB::
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	and A_BUTTON | B_BUTTON
	jr z, .loop
	ret

ButtonSound::
	ld a, [wLinkMode]
	and a
	jr nz, .link_delay
	call JoyWaitInput
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret

.link_delay
	ld c, 65
	jp DelayFrames

JoyWaitInput:: ; a77 (0:0a77)
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	ld a, [wInputType]
	or a
	jr z, .wait_loop
	farcall DudeAutoInput_A

.wait_loop
	call JoyBlinkCursor
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	jr nz, .received_input
	call RTC
	ld a, $1
	ldh [hBGMapMode], a
	call DelayFrame
	jr .wait_loop

.received_input
	pop af
	ldh [hOAMUpdate], a
	ret

JoyBlinkCursor:: ; aa6 (0:0aa6)
	ldh a, [hVBlankCounter]
	and $10
	jr z, .cursor_off
	ld a, "▼"
	jr .load_cursor_state

.cursor_off
	ld a, "─"
.load_cursor_state
	ldcoord_a 18, 17
	ret

BlinkCursor:: ; ab6 (0:0ab6)
	push bc
	ld a, [hl]
	ld b, a
	ld a, "▼"
	cp b
	pop bc
	jr nz, .place_arrow
	ldh a, [hMapObjectIndexBuffer]
	dec a
	ldh [hMapObjectIndexBuffer], a
	ret nz
	ldh a, [hObjectStructIndexBuffer]
	dec a
	ldh [hObjectStructIndexBuffer], a
	ret nz
	ld a, "─"
	ld [hl], a
	ld a, -1
	ldh [hMapObjectIndexBuffer], a
	ld a, 6
	ldh [hObjectStructIndexBuffer], a
	ret

.place_arrow
	ldh a, [hMapObjectIndexBuffer]
	and a
	ret z
	dec a
	ldh [hMapObjectIndexBuffer], a
	ret nz
	dec a
	ldh [hMapObjectIndexBuffer], a
	ldh a, [hObjectStructIndexBuffer]
	dec a
	ldh [hObjectStructIndexBuffer], a
	ret nz
	ld a, 6
	ldh [hObjectStructIndexBuffer], a
	ld a, "▼"
	ld [hl], a
	ret
