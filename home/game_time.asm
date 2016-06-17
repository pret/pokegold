ResetGameTime:: ; 1ee6 (0:1ee6)
	xor a
	ld [wGameTimeCap], a
	ld [wGameTimeHours], a
	ld [wGameTimeHours + 1], a
	ld [wGameTimeMinutes], a
	ld [wGameTimeSeconds], a
	ld [wGameTimeFrames], a
	ret

GameTimer:: ; 1efa (0:1efa)
	nop
	ld a, [wGameLogicPaused]
	and a
	ret nz

	ld hl, wGameTimerPause
	bit 0, [hl]
	ret z

	ld hl, wGameTimeCap
	bit 0, [hl]
	ret nz

	ld hl, wGameTimeFrames
	ld a, [hl]
	inc a
	cp 60
	jr nc, .second
	ld [hl], a
	ret

.second
	xor a
	ld [hl], a
	ld hl, wGameTimeSeconds
	ld a, [hl]
	inc a
	cp 60
	jr nc, .minute
	ld [hl], a
	ret

.minute
	xor a
	ld [hl], a
	ld hl, wGameTimeMinutes
	ld a, [hl]
	inc a
	cp 60
	jr nc, .hour
	ld [hl], a
	ret

.hour
	xor a
	ld [hl], a
	ld a, [wGameTimeHours]
	ld h, a
	ld a, [wGameTimeHours + 1]
	ld l, a
	inc hl
	ld a, h
	cp 1000 / $100
	jr c, .ok
	ld a, l
	cp 1000 % $100
	jr c, .ok
	ld hl, wGameTimeCap
	set 0, [hl]
	ld a, 59
	ld [wGameTimeMinutes], a
	ld [wGameTimeSeconds], a
	ret

.ok
	ld a, h
	ld [wGameTimeHours], a
	ld a, l
	ld [wGameTimeHours + 1], a
	ret
