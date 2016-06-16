JoypadInt:: ; 8df (0:08df)
	reti
	xor a
	ld [hJoyPressed], a
	ld [hJoyDown], a
	ret
Joypad:: ; 8e6 (0:08e6)
	ld a, [wd8ba]
	and $d0
	ret nz
	ld a, [wc1cc]
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
Function935:: ; 935 (0:0935)
	push af
	push hl
	push de
	push bc
	ld a, [wc1c6]
	cp $ff
	jr z, .asm_958
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
.asm_953
	pop bc
	pop de
	pop hl
	pop af
	ret
.asm_958
	ld a, [hROMBank]
	push af
	ld a, [wc1c9]
	rst Bankswitch
	ld hl, wc1c7
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc1ca]
	and a
	jr z, .asm_973
	dec a
	ld [wc1ca], a
	pop af
	rst Bankswitch
	jr .asm_953
.asm_973
	ld a, [hli]
	cp $ff
	jr z, .asm_991
	ld b, a
	ld a, [hli]
	ld [wc1ca], a
	cp $ff
	jr nz, .asm_987
	dec hl
	dec hl
	ld b, $0
	jr .asm_996
.asm_987
	ld a, l
	ld [wc1c7], a
	ld a, h
	ld [wc1c8], a
	jr .asm_996
.asm_991
	call Function9bb
	ld b, $0
.asm_996
	pop af
	rst Bankswitch
	ld a, b
	ld [hJoyPressed], a
	ld [hJoyDown], a
	jr .asm_953
	ld [wc1c9], a
	ld a, l
	ld [wc1c7], a
	ld a, h
	ld [wc1c8], a
	xor a
	ld [wc1ca], a
	xor a
	ld [hJoyPressed], a
	ld [hJoyReleased], a
	ld [hJoyDown], a
	ld a, $ff
	ld [wc1c6], a
	ret
Function9bb:: ; 9bb (0:09bb)
	xor a
	ld [wc1c9], a
	ld [wc1c7], a
	ld [wc1c8], a
	ld [wc1ca], a
	ld [wc1c6], a
	ret
.asm_9cc
	call DelayFrame
	push bc
	call Functiona08
	pop bc
	ld a, [hJoyDown]
	cp $46
	jr z, .asm_9e5
	ld a, [hJoyLast]
	and $9
	jr nz, .asm_9e5
	dec c
	jr nz, .asm_9cc
	and a
	ret
.asm_9e5
	scf
	ret
.asm_9e7
	call DelayFrame
	call Function935
	ld a, [hJoyPressed]
	and $3
	ret nz
	call Function343
	jr .asm_9e7
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call Function344c
	call .asm_9e7
	pop af
	ld [hOAMUpdate], a
	ret
Functiona08:: ; a08 (0:0a08)
	call Function935
	ld a, [hInMenu]
	and a
	ld a, [hJoyPressed]
	jr z, .asm_a14
	ld a, [hJoyDown]
.asm_a14
	ld [hJoyLast], a
	ld a, [hJoyPressed]
	and a
	jr z, .asm_a21
	ld a, $f
	ld [wTextDelayFrames], a
	ret
.asm_a21
	ld a, [wTextDelayFrames]
	and a
	jr z, .asm_a2b
	xor a
	ld [hJoyLast], a
	ret
.asm_a2b
	ld a, $5
	ld [wTextDelayFrames], a
	ret
	ld a, [hMapObjectIndexBuffer]
	push af
	ld a, [hObjectStructIndexBuffer]
	push af
	xor a
	ld [hMapObjectIndexBuffer], a
	ld a, $6
	ld [hObjectStructIndexBuffer], a
.asm_a3e
	push hl
	hlcoord 18, 17
	call Functionab6
	pop hl
	call Functiona08
	ld a, [hJoyLast]
	and $3
	jr z, .asm_a3e
	pop af
	ld [hObjectStructIndexBuffer], a
	pop af
	ld [hMapObjectIndexBuffer], a
	ret
.asm_a56
	call Functiona08
	ld a, [hJoyLast]
	and $3
	jr z, .asm_a56
	ret
	ld a, [wLinkMode]
	and a
	jr nz, .asm_a72
	call Functiona77
	push de
	ld de, $8
	call Function3e24
	pop de
	ret
.asm_a72
	ld c, $41
	jp DelayFrames
Functiona77:: ; a77 (0:0a77)
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	ld a, [wc1c6]
	or a
	jr z, .asm_a8a
	ld a, $70
	ld hl, $4de9
	rst FarCall
.asm_a8a
	call Functionaa6
	call Functiona08
	ld a, [hJoyPressed]
	and $3
	jr nz, .asm_aa2
	call Function343
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	jr .asm_a8a
.asm_aa2
	pop af
	ld [hOAMUpdate], a
	ret

Functionaa6:: ; aa6 (0:0aa6)
	ld a, [hVBlankCounter]
	and $10
	jr z, .cursor_off
	ld a, "▼"
	jr .load_cursor_state

.cursor_off
	ld a, "─"
.load_cursor_state
	Coorda 18, 17
	ret

Functionab6:: ; ab6 (0:0ab6)
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
