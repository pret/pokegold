PlayStereoCry:: ; 39f0 (0:39f0)
	push af
	ld a, $1
	ld [wStereoPanningMask], a
	pop af
	jr _PlayMonCry

PlayMonCry:: ; 39f9 (0:39f9)
	push af
	xor a
	ld [wStereoPanningMask], a
	ld [wCryTracks], a
	pop af

_PlayMonCry::
	push hl
	push de
	push bc
	call GetCryIndex
	jr c, .asm_3a12
	ld e, c
	ld d, b
	call PlayCry
	call WaitSFX
.asm_3a12
	pop bc
	pop de
	pop hl
	ret

LoadCryHeader::
	call GetCryIndex
	ret c
	ldh a, [hROMBank]
	push af
	ld a, $3c
	rst Bankswitch
	ld hl, $6747
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hli]
	ld [wCryPitch], a
	ld a, [hli]
	ld [wCryPitch + 1], a
	ld a, [hli]
	ld [wCryLength], a
	ld a, [hl]
	ld [wCryLength + 1], a
	pop af
	rst Bankswitch
	and a
	ret

GetCryIndex:: ; 3a41 (0:3a41)
	and a
	jr z, .asm_3a4e
	cp NUM_POKEMON + 1
	jr nc, .asm_3a4e
	dec a
	ld c, a
	ld b, $0
	and a
	ret

.asm_3a4e
	scf
	ret
