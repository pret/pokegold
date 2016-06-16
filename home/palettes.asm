UpdatePalsIfCGB:: ; bdf (0:0bdf)
	ld a, [hCGB]
	and a
	ret z
UpdateCGBPals:: ; be3 (0:0be3)
	ld a, [hCGBPalUpdate]
	and a
	ret z
ForceUpdateCGBPals::
	ld hl, wBGPals
	ld a, $80
	ld [rBGPI], a
	ld c, 8 / 2
.bgp
rept 2 palettes
	ld a, [hli]
	ld [rBGPD], a
endr
	dec c
	jr nz, .bgp
	ld a, $80
	ld [rOBPI], a
	ld c, 8 / 2
.obp
rept 2 palettes
	ld a, [hli]
	ld [rOBPD], a
endr
	dec c
	jr nz, .obp
	xor a
	ld [hCGBPalUpdate], a
	scf
	ret

DmgToCgbBGPals:: ; c61 (0:0c61)
	ld [rBGP], a
	push af
	ld a, [hCGB]
	and a
	jr z, .end
	push hl
	push de
	push bc
	ld hl, wBGPals
	ld de, wUnknBGPals
	ld a, [rBGP]
	ld b, a
	ld c, $8
	call CopyPals
	ld a, $1
	ld [hCGBPalUpdate], a
	pop bc
	pop de
	pop hl
.end
	pop af
	ret

DmgToCgbObjPals:: ; c83 (0:0c83)
	ld a, e
	ld [rOBP0], a
	ld a, d
	ld [rOBP1], a
	ld a, [hCGB]
	and a
	ret z
	push hl
	push de
	push bc
	ld hl, wOBPals
	ld de, wUnknOBPals
	ld a, [rOBP0]
	ld b, a
	ld c, $8
	call CopyPals
	ld a, $1
	ld [hCGBPalUpdate], a
	pop bc
	pop de
	pop hl
	ret

DmgToCgbObjPal0::
	ld [rOBP0], a
	push af
	ld a, [hCGB]
	and a
	jr z, .end
	push hl
	push de
	push bc
	ld hl, wOBPals
	ld de, wUnknOBPals
	ld a, [rOBP0]
	ld b, a
	ld c, $1
	call CopyPals
	ld a, $1
	ld [hCGBPalUpdate], a
	pop bc
	pop de
	pop hl
.end
	pop af
	ret

DmgToCgbObjPal1::
	ld [rOBP1], a
	push af
	ld a, [hCGB]
	and a
	jr z, .end
	push hl
	push de
	push bc
	ld hl, wOBPals + 1 palettes
	ld de, wUnknOBPals + 1 palettes
	ld a, [rOBP1]
	ld b, a
	ld c, $1
	call CopyPals
	ld a, $1
	ld [hCGBPalUpdate], a
	pop bc
	pop de
	pop hl
.end
	pop af
	ret

CopyPals:: ; cea (0:0cea)
	push bc
	ld c, $4
.loop
	push de
	push hl
	ld a, b
	and $3
	add a
	ld l, a
	ld h, $0
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	srl b
	srl b
	pop de
	dec c
	jr nz, .loop
	ld a, $8
	add e
	jr nc, .ok
	inc d
.ok
	ld e, a
	pop bc
	dec c
	jr nz, CopyPals
	ret

ClearVBank1::
	ld a, [hCGB]
	and a
	ret z
	ld a, $1
	ld [rVBK], a
	ld hl, $8000
	ld bc, $2000
	xor a
	call ByteFill
	ld a, $0
	ld [rVBK], a
	ret

Functiond2a::
	ld hl, wTileMap
	ld de, wccd9
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.asm_d33
	ld a, [hli]
	cp $60
	jr c, .asm_d3b
	ld a, $7
	ld [de], a
.asm_d3b
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_d33
	ret

Functiond42::
	ld a, [hCGB]
	and a
	ret z
	ld hl, wBGPals
	ld bc, $50
	xor a
	call ByteFill
	ld a, $1
	ld [hCGBPalUpdate], a
	call DelayFrame
	ret

FarCallSwapTextboxPalettes::
	homecall SwapTextboxPalettes
	ret

FarCallScrollBGMapPalettes::
	homecall ScrollBGMapPalettes
	ret
