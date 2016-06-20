Sine_e:: ; 8ac9 (2:4ac9)
	ld a, e
	and $3f
	cp $20
	jr nc, .negative
	call .GetSine
	ld a, h
	ret
.negative
	and $1f
	call .GetSine
	ld a, h
	xor $ff
	inc a
	ret

.GetSine: ; 8adf (2:4adf)
	ld e, a
	ld a, d
	ld d, $0
	ld hl, .SineWave
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
.loop
	srl a
	jr nc, .no_add
	add hl, de
.no_add
	sla e
	rl d
	and a
	jr nz, .loop
	ret

.SineWave:
	sine_wave $100
