ResetGameTime:: ; 1ee6 (0:1ee6)
	xor a
	ld [GameTimeCap], a
	ld [GameTimeHours], a
	ld [GameTimeHours + 1], a
	ld [GameTimeMinutes], a
	ld [GameTimeSeconds], a
	ld [GameTimeFrames], a
	ret

GameTimer:: ; 1efa (0:1efa)
	nop
	ld a, [wGameLogicPaused]
	and a
	ret nz

	ld hl, GameTimerPause
	bit 0, [hl]
	ret z

	ld hl, GameTimeCap
	bit 0, [hl]
	ret nz

	ld hl, GameTimeFrames
	ld a, [hl]
	inc a
	cp 60
	jr nc, .second
	ld [hl], a
	ret

.second
	xor a
	ld [hl], a
	ld hl, GameTimeSeconds
	ld a, [hl]
	inc a
	cp 60
	jr nc, .minute
	ld [hl], a
	ret

.minute
	xor a
	ld [hl], a
	ld hl, GameTimeMinutes
	ld a, [hl]
	inc a
	cp 60
	jr nc, .hour
	ld [hl], a
	ret

.hour
	xor a
	ld [hl], a
	ld a, [GameTimeHours]
	ld h, a
	ld a, [GameTimeHours + 1]
	ld l, a
	inc hl
	ld a, h
	cp 1000 / $100
	jr c, .ok
	ld a, l
	cp 1000 % $100
	jr c, .ok
	ld hl, GameTimeCap
	set 0, [hl]
	ld a, 59
	ld [GameTimeMinutes], a
	ld [GameTimeSeconds], a
	ret

.ok
	ld a, h
	ld [GameTimeHours], a
	ld a, l
	ld [GameTimeHours + 1], a
	ret
