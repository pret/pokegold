UpdateBGMapBuffer:: ; 1458 (0:1458)
	ldh a, [hBGMapUpdate]
	and a
	ret z

	ld [hSPBuffer], sp

	ld hl, wBGMapBufferPtrs
	ld sp, hl

	ld hl, wBGMapPalBuffer
	ld de, wBGMapBuffer

.next
rept 2
	pop bc
	ld a, $1
	ldh [rVBK], a
	ld a, [hli]
	ld [bc], a
	inc c
	ld a, [hli]
	ld [bc], a
	dec c
	ld a, $0
	ldh [rVBK], a
	ld a, [de]
	inc de
	ld [bc], a
	inc c
	ld a, [de]
	inc de
	ld [bc], a
endr

	ldh a, [hFFDE]
	dec a
	dec a
	ldh [hFFDE], a

	jr nz, .next

	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl

	xor a
	ldh [hBGMapUpdate], a
	scf
	ret

WaitTop::
	ldh a, [hBGMapMode]
	and a
	ret z
	ldh a, [hBGMapThird]
	and a
	jr z, .done
	call DelayFrame
	jr WaitTop

.done
	xor a
	ldh [hBGMapMode], a
	ret

UpdateBGMap:: ; 14bb (0:14bb)
	ldh a, [hBGMapMode]
	and a
	ret z

	dec a
	jr z, .Tiles
	dec a
	jr z, .Attr

	dec a

	ldh a, [hBGMapAddress]
	ld l, a
	ldh a, [hBGMapAddress + 1]
	ld h, a
	push hl

	xor a
	ldh [hBGMapAddress], a
	ld a, $9c
	ldh [hBGMapAddress + 1], a

	ldh a, [hBGMapMode]
	push af
	cp $3
	call z, .Tiles
	pop af
	cp $4
	call z, .Attr

	pop hl
	ld a, l
	ldh [hBGMapAddress], a
	ld a, h
	ldh [hBGMapAddress + 1], a
	ret

.Attr
	ld a, $1
	ldh [rVBK], a

	hlcoord 0, 0, wAttrMap
	call .update
	ld a, $0
	ldh [rVBK], a
	ret

.Tiles
	hlcoord 0, 0
.update
	ld [hSPBuffer], sp

	ldh a, [hBGMapThird]
	and a
	jr z, .top
	dec a
	jr z, .middle

THIRD_HEIGHT EQU SCREEN_HEIGHT / 3
	ld de, 2 * THIRD_HEIGHT * SCREEN_WIDTH
	add hl, de
	ld sp, hl

	ldh a, [hBGMapAddress + 1]
	ld h, a
	ldh a, [hBGMapAddress]

	ld l, a
	ld de, 2 * THIRD_HEIGHT * BG_MAP_WIDTH
	add hl, de

	xor a
	jr .start

.middle
	ld de, THIRD_HEIGHT * SCREEN_WIDTH
	add hl, de
	ld sp, hl

	ldh a, [hBGMapAddress + 1]
	ld h, a
	ldh a, [hBGMapAddress]
	ld l, a

	ld de, THIRD_HEIGHT * BG_MAP_WIDTH
	add hl, de

	ld a, $2
	jr .start

.top
	ld sp, hl

	ldh a, [hBGMapAddress + 1]
	ld h, a
	ldh a, [hBGMapAddress]
	ld l, a

	ld a, $1

.start
	ldh [hBGMapThird], a
	ld a, SCREEN_HEIGHT / 3

; Discrepancy between TileMap and BGMap
	ld bc, BG_MAP_WIDTH - (SCREEN_WIDTH - 1)
	
.row
rept SCREEN_WIDTH / 2 - 1
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr
	pop de
	ld [hl], e
	inc l
	ld [hl], d

	add hl, bc
	dec a
	jr nz, .row

	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

Serve1bppRequest:: ; 1579 (0:1579)
	ld a, [wRequested1bpp]
	and a
	ret z

	ld [hSPBuffer], sp

	ld hl, wRequested1bppSource
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl

	ld hl, wRequested1bppDest
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wRequested1bpp]
	ld b, a

	xor a
	ld [wRequested1bpp], a

.next
rept 3
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d
	inc l
endr
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d

	inc hl
	dec b
	jr nz, .next

	ld a, l
	ld [wRequested1bppDest], a
	ld a, h
	ld [wRequested1bppDest + 1], a

	ld [wRequested1bppSource], sp

	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

Serve2bppRequest:: ; 15d0 (0:15d0)
	ld a, [wRequested2bpp]
	and a
	ret z
	ld [hSPBuffer], sp
	ld hl, wRequested2bppSource
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl
	ld hl, wRequested2bppDest
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wRequested2bpp]
	ld b, a
	xor a
	ld [wRequested2bpp], a
.next
rept 7
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr
	pop de
	ld [hl], e
	inc l
	ld [hl], d

	inc hl
	dec b
	jr nz, .next

	ld a, l
	ld [wRequested2bppDest], a
	ld a, h
	ld [wRequested2bppDest + 1], a

	ld [wRequested2bppSource], sp

	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

AnimateTileset:: ; 162b (0:162b)
	ldh a, [hMapAnims]
	and a
	ret z
	ldh a, [hROMBank]
	push af
	ld a, $3f
	rst Bankswitch
	call $4003
	pop af
	rst Bankswitch
	ret
	ret
	ld hl, rLCDC
	set 1, [hl]
	ret

Function1642:: ; 1642 (0:1642)
	nop
	ldh a, [hVBlankCounter + 1]
	and a
	ret z
	dec a
	jr z, .one
	dec a
	jr z, .two
	ld a, $2
	ldh [hVBlankCounter + 1], a
	ld hl, hBGMapAddress
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, SCREEN_WIDTH
	add hl, de
	ld b, $12
	ld a, $60
.loop1
rept 12
	ld [hli], a
endr
	add hl, de
	dec b
	jr nz, .loop1
	ret

.two
	ld a, $1
	ld de, $240
	jr .go

.one
	xor a
	ld de, $320
.go
	ldh [hVBlankCounter + 1], a
	ld hl, hBGMapAddress
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld b, $e
	ld a, $60
.loop2
rept 16
	ld [hli], a
endr
	dec b
	jr nz, .loop2
	ret
