_LoadMapPart::
	ld hl, wSurroundingTiles
	ld a, [wMetatileStandingY]
	and a
	jr z, .top_row
	ld bc, SURROUNDING_WIDTH * 2
	add hl, bc

.top_row
	ld a, [wMetatileStandingX]
	and a
	jr z, .left_column
	inc hl
	inc hl

.left_column
	decoord 0, 0
	ld b, SCREEN_HEIGHT
.loop
	ld c, SCREEN_WIDTH
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	ld a, l
	add METATILE_WIDTH
	ld l, a
	jr nc, .carry
	inc h

.carry
	dec b
	jr nz, .loop
	ret

Function153ba: ; unreferenced
	decoord 2, 2
	ld bc, (SURROUNDING_WIDTH + 1) * 2
	add hl, bc
	ld c, SCREEN_HEIGHT - 4 * 1
.loop:
	ld b, SCREEN_WIDTH - SCREEN_META_WIDTH
.loop2:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop2
	ld a, l
	add SCREEN_META_WIDTH + METATILE_WIDTH
	ld l, a
	jr nc, .carry1
	inc h

.carry1:
	ld a, e
	add SCREEN_META_WIDTH
	ld e, a
	jr nc, .carry2
	inc d

.carry2:
	dec c
	jr nz, .loop
	ret

Function153dd: ; unreferenced
	decoord 4, 4
	ld bc, (SURROUNDING_WIDTH + 1) * 4
	add hl, bc
	ld c, SCREEN_HEIGHT - 4 * 2
.loop:
	ld b, SCREEN_WIDTH - SCREEN_META_WIDTH - METATILE_WIDTH
.loop2:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop2
	ld a, l
	add SCREEN_META_WIDTH + METATILE_WIDTH * 2
	ld l, a
	jr nc, .carry1
	inc h

.carry1:
	ld a, e
	add SCREEN_META_WIDTH + METATILE_WIDTH
	ld e, a
	jr nc, .carry2
	inc d

.carry2:
	dec c
	jr nz, .loop
	ret

Ureferenced_Function15400:
	decoord 6, 6
	ld bc, (SURROUNDING_WIDTH + 1) * 6
	add hl, bc
	ld c, SCREEN_HEIGHT - 4 * 3
.loop:
	ld b, SCREEN_WIDTH - SCREEN_META_WIDTH - METATILE_WIDTH * 2
.loop2:
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop2
	ld a, l
	add SCREEN_META_WIDTH + METATILE_WIDTH * 3
	ld l, a
	jr nc, .carry1
	inc h

.carry1:
	ld a, e
	add SCREEN_META_WIDTH + METATILE_WIDTH * 2
	ld e, a
	jr nc, .carry2
	inc d

.carry2:
	dec c
	jr nz, .loop
	ret

Function15423: ; unreferenced
	decoord 8, 8
	ld bc, (SURROUNDING_WIDTH + 1) * 8
	add hl, bc
.loop
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld bc, SCREEN_WIDTH + 2
	add hl, bc
	ld a, e
	add SCREEN_META_WIDTH + METATILE_WIDTH * 3 + 1
	ld e, a
	jr nc, .carry
	inc d

.carry:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret
