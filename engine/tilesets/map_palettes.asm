_SwapTextboxPalettes::
	ld hl, wTilemap
	ld de, wAttrmap
	ld b, SCREEN_HEIGHT
.loop
	ld c, SCREEN_WIDTH
.innerloop
	ld a, [hli]
	push hl
	srl a
	jr c, .UpperNybble
	ld hl, wTilesetPalettes
	add [hl]
	ld l, a
	ld a, [wTilesetPalettes + 1]
	adc 0
	ld h, a
	ld a, [hl]
	and $f
	bit 3, a
	jr z, .next
	jr .asm_8038

.UpperNybble:
	ld hl, wTilesetPalettes
	add [hl]
	ld l, a
	ld a, [wTilesetPalettes + 1]
	adc 0
	ld h, a
	ld a, [hl]
	swap a
	and $f
	bit 3, a
	jr z, .next

.asm_8038
	ld a, [wMapGroup]
	dec a
	ld hl, Unknown85d7
	add l
	ld l, a
	jr nc, .asm_8044
	inc h
.asm_8044
	ld a, [hl]

.next
	pop hl
	ld [de], a
	inc de
	dec c
	jr nz, .innerloop
	dec b
	jr nz, .loop
	ret

_ScrollBGMapPalettes::
	ld hl, wBGMapBuffer
	ld de, wBGMapPalBuffer
.loop
	ld a, [hli]
	push hl
	srl a
	jr c, .UpperNybble

; .LowerNybble
	ld hl, wTilesetPalettes
	add [hl]
	ld l, a
	ld a, [wTilesetPalettes + 1]
	adc 0
	ld h, a
	ld a, [hl]
	and $f
	bit 3, a
	jr z, .next
	jr .asm_8083

.UpperNybble:
	ld hl, wTilesetPalettes
	add [hl]
	ld l, a
	ld a, [wTilesetPalettes + 1]
	adc 0
	ld h, a
	ld a, [hl]
	swap a
	and $f
	bit 3, a
	jr z, .next

.asm_8083
	ld a, [wMapGroup]
	dec a
	ld hl, Unknown85d7
	add l
	ld l, a
	jr nc, .asm_808f
	inc h
.asm_808f
	ld a, [hl]

.next
	pop hl
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret
