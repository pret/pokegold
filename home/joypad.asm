JoypadInt:: ; 8df (0:08df)
	reti

ClearJoypad::
	xor a
	ld [hJoyPressed], a
	ld [hJoyDown], a
	ret

Joypad:: ; 8e6 (0:08e6)
	ld a, [wd8ba]
	and $d0
	ret nz
	ld a, [wGameLogicPaused]
	and a
	ret nz
	ld a, $20
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	cpl
	and $f
	swap a
	ld b, a
	ld a, $10
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	cpl
	and $f
	or b
	ld b, a
	ld a, $30
	ld [rJOYP], a
	ld a, [hJoypadDown]
	ld e, a
	xor b
	ld d, a
	and e
	ld [hJoypadReleased], a
	ld a, d
	and b
	ld [hJoypadPressed], a
	ld c, a
	ld a, [hJoypadSum]
	or c
	ld [hJoypadSum], a
	ld a, b
	ld [hJoypadDown], a
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
	ld a, [hJoypadDown]
	ld b, a
	ld a, [hJoyDown]
	ld e, a
	xor b
	ld d, a
	and e
	ld [hJoyReleased], a
	ld a, d
	and b
	ld [hJoyPressed], a
	ld c, a
	ld a, b
	ld [hJoyDown], a
.quit
	pop bc
	pop de
	pop hl
	pop af
	ret

.auto
	ld a, [hROMBank]
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
	ld [hJoyPressed], a
	ld [hJoyDown], a
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
	ld [hJoyPressed], a
	ld [hJoyReleased], a
	ld [hJoyDown], a
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

	ld a, [hJoyDown]
	cp D_UP | SELECT | B_BUTTON
	jr z, .keycombo

	ld a, [hJoyLast]
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
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret nz
	call RTC
	jr JoyWaitAorB

WaitButton::
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call WaitBGMap
	call JoyWaitAorB
	pop af
	ld [hOAMUpdate], a
	ret

JoyTextDelay:: ; a08 (0:0a08)
	call GetJoypad
	ld a, [hInMenu]
	and a
	ld a, [hJoyPressed]
	jr z, .ok
	ld a, [hJoyDown]
.ok
	ld [hJoyLast], a
	ld a, [hJoyPressed]
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
	ld [hJoyLast], a
	ret

.restartframedelay
	ld a, 5
	ld [wTextDelayFrames], a
	ret

WaitPressAorB_BlinkCursor::
	ld a, [hMapObjectIndexBuffer]
	push af
	ld a, [hObjectStructIndexBuffer]
	push af
	xor a
	ld [hMapObjectIndexBuffer], a
	ld a, $6
	ld [hObjectStructIndexBuffer], a
.loop
	push hl
	hlcoord 18, 17
	call BlinkCursor
	pop hl
	call JoyTextDelay
	ld a, [hJoyLast]
	and A_BUTTON | B_BUTTON
	jr z, .loop
	pop af
	ld [hObjectStructIndexBuffer], a
	pop af
	ld [hMapObjectIndexBuffer], a
	ret

SimpleWaitPressAorB::
.loop
	call JoyTextDelay
	ld a, [hJoyLast]
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
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	ld a, [wInputType]
	or a
	jr z, .wait_loop
	farcall DudeAutoInput_A

.wait_loop
	call JoyBlinkCursor
	call JoyTextDelay
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	jr nz, .received_input
	call RTC
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	jr .wait_loop

.received_input
	pop af
	ld [hOAMUpdate], a
	ret

JoyBlinkCursor:: ; aa6 (0:0aa6)
	ld a, [hVBlankCounter]
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
	ld a, [hMapObjectIndexBuffer]
	dec a
	ld [hMapObjectIndexBuffer], a
	ret nz
	ld a, [hObjectStructIndexBuffer]
	dec a
	ld [hObjectStructIndexBuffer], a
	ret nz
	ld a, "─"
	ld [hl], a
	ld a, -1
	ld [hMapObjectIndexBuffer], a
	ld a, 6
	ld [hObjectStructIndexBuffer], a
	ret

.place_arrow
	ld a, [hMapObjectIndexBuffer]
	and a
	ret z
	dec a
	ld [hMapObjectIndexBuffer], a
	ret nz
	dec a
	ld [hMapObjectIndexBuffer], a
	ld a, [hObjectStructIndexBuffer]
	dec a
	ld [hObjectStructIndexBuffer], a
	ret nz
	ld a, 6
	ld [hObjectStructIndexBuffer], a
	ld a, "▼"
	ld [hl], a
	ret
