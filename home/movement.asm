InitMovementBuffer::
	ld [wMovementBufferObject], a
	xor a
	ld [wMovementBufferCount], a
	ld a, $0
	ld [wUnusedMovementBufferBank], a
	ld a, wMovementBuffer % $100
	ld [wUnusedMovementBufferPointer], a
	ld a, wMovementBuffer / $100
	ld [wUnusedMovementBufferPointer + 1], a
	ret

DecrementMovementBufferCount::
	ld a, [wMovementBufferCount]
	and a
	ret z
	dec a
	ld [wMovementBufferCount], a
	ret

AppendToMovementBuffer:: ; 19dc (0:19dc)
	push hl
	push de
	ld hl, wMovementBufferCount
	ld e, [hl]
	inc [hl]
	ld d, $0
	ld hl, wMovementBuffer
	add hl, de
	ld [hl], a
	pop de
	pop hl
	ret

AppendToMovementBufferNTimes:: ; 19ed (0:19ed)
	push af
	ld a, c
	and a
	jr nz, .asm_19f4
	pop af
	ret

.asm_19f4
	pop af
.asm_19f5
	call AppendToMovementBuffer
	dec c
	jr nz, .asm_19f5
	ret

ComputePathToWalkToPlayer::
	push af
	ld a, b
	sub d
	ld h, $2
	jr nc, .asm_1a07
	dec a
	cpl
	ld h, $3
.asm_1a07
	ld d, a
	ld a, c
	sub e
	ld l, $1
	jr nc, .asm_1a12
	dec a
	cpl
	ld l, $0
.asm_1a12
	ld e, a
	cp d
	jr nc, .asm_1a1c
	ld a, h
	ld h, l
	ld l, a
	ld a, d
	ld d, e
	ld e, a
.asm_1a1c
	pop af
	ld b, a
	ld a, h
	call WalkToPlayer_GetMovementByte
	ld c, d
	call AppendToMovementBufferNTimes
	ld a, l
	call WalkToPlayer_GetMovementByte
	ld c, e
	call AppendToMovementBufferNTimes
	ret

WalkToPlayer_GetMovementByte:: ; 1a2f (0:1a2f)
	push de
	push hl
	ld l, b
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, a
	ld d, $0
	add hl, de
	ld de, .MovementData
	add hl, de
	ld a, [hl]
	pop hl
	pop de
	ret

.MovementData:
	slow_step DOWN
	slow_step UP
	slow_step LEFT
	slow_step RIGHT
	step DOWN
	step UP
	step LEFT
	step RIGHT
	big_step DOWN
	big_step UP
	big_step LEFT
	big_step RIGHT
