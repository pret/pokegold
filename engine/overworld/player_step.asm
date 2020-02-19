HandlePlayerStep_::
	ld a, [wPlayerStepFlags]
	and a
	ret z
	bit 7, a
	jr nz, .asm_d4b6
	bit 6, a
	jr nz, .asm_d4c0
	bit 5, a
	jr nz, .asm_d4c5
	ret

.asm_d4b6
	ld a, $4
	ld [wHandlePlayerStep], a
	call Functiond53c
	jr .asm_d4c5

.asm_d4c0
	call Functiond517
	jr .asm_d4c5

.asm_d4c5
	call Functiond4f2
	ld a, [wPlayerStepVectorX]
	ld d, a
	ld a, [wPlayerStepVectorY]
	ld e, a
	ld a, [wce81]
	sub d
	ld [wce81], a
	ld a, [wce82]
	sub e
	ld [wce82], a
	ret

ScrollScreen::
	ld a, [wPlayerStepVectorX]
	ld d, a
	ld a, [wPlayerStepVectorY]
	ld e, a
	ldh a, [hSCX]
	add d
	ldh [hSCX], a
	ldh a, [hSCY]
	add e
	ldh [hSCY], a
	ret

Functiond4f2: ; d4f2 (3:54f2)
	ld hl, wHandlePlayerStep
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ld a, [hl]
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable
	dw GetMovementPermissions
	dw BufferScreen
	dw Functiond515
	dw Functiond516
	dw Functiond515
	dw Functiond515
	dw Functiond515
	dw Functiond515
	dw Functiond515
	dw Functiond515
	dw Functiond515

Functiond515:
	ret

Functiond516:
	ret

Functiond517: ; d517 (3:5517)
	ld a, [wPlayerStepDirection]
	and a
	jr nz, .asm_d522
	ld hl, wYCoord
	inc [hl]
	ret

.asm_d522
	cp $1
	jr nz, .asm_d52b
	ld hl, wYCoord
	dec [hl]
	ret

.asm_d52b
	cp $2
	jr nz, .asm_d534
	ld hl, wXCoord
	dec [hl]
	ret

.asm_d534
	cp $3
	ret nz
	ld hl, wXCoord
	inc [hl]
	ret

Functiond53c: ; d53c (3:553c)
	ld a, [wPlayerStepDirection]
	and a
	jr z, .asm_d54f
	cp $1
	jr z, .asm_d559
	cp $2
	jr z, .asm_d563
	cp $3
	jr z, .asm_d56d
	ret

.asm_d54f
	call Functiond577
	call LoadMapPart
	call ScrollMapUp
	ret

.asm_d559
	call Functiond5a8
	call LoadMapPart
	call ScrollMapDown
	ret

.asm_d563
	call Functiond5db
	call LoadMapPart
	call ScrollMapRight
	ret

.asm_d56d
	call Functiond604
	call LoadMapPart
	call ScrollMapLeft
	ret

Functiond577: ; d577 (3:5577)
	ld a, [wd05b]
	add $40
	ld [wd05b], a
	jr nc, .asm_d58c
	ld a, [wd05c]
	inc a
	and $3
	or $98
	ld [wd05c], a
.asm_d58c
	ld hl, wd07f
	inc [hl]
	ld a, [hl]
	cp $2
	jr nz, .asm_d59a
	ld [hl], $0
	call Functiond59b
.asm_d59a
	ret

Functiond59b: ; d59b (3:559b)
	ld hl, wOverworldMapAnchor
	ld a, [wMapWidth]
	add $6
	add [hl]
	ld [hli], a
	ret nc
	inc [hl]
	ret

Functiond5a8: ; d5a8 (3:55a8)
	ld a, [wd05b]
	sub $40
	ld [wd05b], a
	jr nc, .asm_d5bd
	ld a, [wd05c]
	dec a
	and $3
	or $98
	ld [wd05c], a
.asm_d5bd
	ld hl, wd07f
	dec [hl]
	ld a, [hl]
	cp $ff
	jr nz, .asm_d5cb
	ld [hl], $1
	call Functiond5cc
.asm_d5cb
	ret

Functiond5cc: ; d5cc (3:55cc)
	ld hl, wOverworldMapAnchor
	ld a, [wMapWidth]
	add $6
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

Functiond5db: ; d5db (3:55db)
	ld a, [wd05b]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	sub $2
	and $1f
	or d
	ld [wd05b], a
	ld hl, wd080
	dec [hl]
	ld a, [hl]
	cp $ff
	jr nz, .asm_d5f9
	ld [hl], $1
	call Functiond5fa
.asm_d5f9
	ret

Functiond5fa: ; d5fa (3:55fa)
	ld hl, wOverworldMapAnchor
	ld a, [hl]
	sub $1
	ld [hli], a
	ret nc
	dec [hl]
	ret

Functiond604: ; d604 (3:5604)
	ld a, [wd05b]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	add $2
	and $1f
	or d
	ld [wd05b], a
	ld hl, wd080
	inc [hl]
	ld a, [hl]
	cp $2
	jr nz, .asm_d622
	ld [hl], $0
	call Functiond623
.asm_d622
	ret

Functiond623: ; d623 (3:5623)
	ld hl, wOverworldMapAnchor
	ld a, [hl]
	add $1
	ld [hli], a
	ret nc
	inc [hl]
	ret
