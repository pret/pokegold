_LoadOverworldAttrmapPals::
; Load wAttrmap palette numbers based on the tileset palettes of current map.
; This function is only used for the initial loading of the map; incremental
; loads while moving happen through ScrollBGMapPalettes.
	hlcoord 0, 0
	decoord 0, 0, wAttrmap
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
	bit B_OAM_BANK1, a
	jr z, .next
	jr .by_map_group

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
	bit B_OAM_BANK1, a
	jr z, .next

.by_map_group
	ld a, [wMapGroup]
	dec a
	ld hl, MapGroupPalettes
	add l
	ld l, a
	jr nc, .no_carry
	inc h
.no_carry
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
	bit B_OAM_BANK1, a
	jr z, .next
	jr .by_map_group

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
	bit B_OAM_BANK1, a
	jr z, .next

.by_map_group
	ld a, [wMapGroup]
	dec a
	ld hl, MapGroupPalettes
	add l
	ld l, a
	jr nc, .no_carry
	inc h
.no_carry
	ld a, [hl]

.next
	pop hl
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret
