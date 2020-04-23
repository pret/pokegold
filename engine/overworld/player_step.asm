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
	call UpdateOverworldMap
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

UpdateOverworldMap:
	ld a, [wPlayerStepDirection]
	and a
	jr z, .step_down
	cp UP
	jr z, .step_up
	cp LEFT
	jr z, .step_left
	cp RIGHT
	jr z, .step_right
	ret

.step_down
	call .ScrollOverworldMapDown
	call LoadMapPart
	call ScrollMapDown
	ret

.step_up
	call .ScrollOverworldMapUp
	call LoadMapPart
	call ScrollMapUp
	ret

.step_left
	call .ScrollOverworldMapLeft
	call LoadMapPart
	call ScrollMapLeft
	ret

.step_right
	call .ScrollOverworldMapRight
	call LoadMapPart
	call ScrollMapRight
	ret

.ScrollOverworldMapDown:
	ld a, [wBGMapAnchor]
	add 2 * BG_MAP_WIDTH
	ld [wBGMapAnchor], a
	jr nc, .not_overflowed
	ld a, [wBGMapAnchor + 1]
	inc a
	and %11
	or HIGH(vBGMap0)
	ld [wBGMapAnchor + 1], a
.not_overflowed
	ld hl, wMetatileStandingY
	inc [hl]
	ld a, [hl]
	cp 2 ; was 1
	jr nz, .done_down
	ld [hl], 0
	call .ScrollMapDataDown
.done_down
	ret

.ScrollMapDataDown:
	ld hl, wOverworldMapAnchor
	ld a, [wMapWidth]
	add 3 * 2 ; surrounding tiles
	add [hl]
	ld [hli], a
	ret nc
	inc [hl]
	ret

.ScrollOverworldMapUp:
	ld a, [wBGMapAnchor]
	sub 2 * BG_MAP_WIDTH
	ld [wBGMapAnchor], a
	jr nc, .not_underflowed
	ld a, [wBGMapAnchor + 1]
	dec a
	and %11
	or HIGH(vBGMap0)
	ld [wBGMapAnchor + 1], a
.not_underflowed
	ld hl, wMetatileStandingY
	dec [hl]
	ld a, [hl]
	cp -1 ; was 0
	jr nz, .done_up
	ld [hl], $1
	call .ScrollMapDataUp
.done_up
	ret

.ScrollMapDataUp:
	ld hl, wOverworldMapAnchor
	ld a, [wMapWidth]
	add 3 * 2 ; surrounding tiles
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

.ScrollOverworldMapLeft:
	ld a, [wBGMapAnchor]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	sub $2
	and $1f
	or d
	ld [wBGMapAnchor], a
	ld hl, wMetatileStandingX
	dec [hl]
	ld a, [hl]
	cp -1
	jr nz, .done_left
	ld [hl], 1
	call .ScrollMapDataLeft
.done_left
	ret

.ScrollMapDataLeft:
	ld hl, wOverworldMapAnchor
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret

.ScrollOverworldMapRight:
	ld a, [wBGMapAnchor]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	add $2
	and $1f
	or d
	ld [wBGMapAnchor], a
	ld hl, wMetatileStandingX
	inc [hl]
	ld a, [hl]
	cp 2
	jr nz, .done_right
	ld [hl], 0
	call .ScrollMapDataRight
.done_right
	ret

.ScrollMapDataRight:
	ld hl, wOverworldMapAnchor
	ld a, [hl]
	add 1
	ld [hli], a
	ret nc
	inc [hl]
	ret
