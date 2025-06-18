DEF TILES_PER_CYCLE EQU 8

FarDecompressBufferedPic:: ; unreferenced
	ld b, a
	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, BANK(sDecompressBuffer)
	call OpenSRAM
	ld hl, sDecompressBuffer
	ld bc, 7 * 7 tiles
	xor a
	call ByteFill

	ld hl, wFarDecompressPicPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, sDecompressBuffer
	call Decompress

	call CloseSRAM
	pop af
	rst Bankswitch
	ret

UpdatePlayerSprite::
	farcall _UpdatePlayerSprite
	ret

LoadStandardFont::
	farcall _LoadStandardFont
	ret

LoadFontsBattleExtra::
	farcall _LoadFontsBattleExtra
	ret

LoadFontsExtra::
	farcall _LoadFontsExtra
	ret

DecompressRequest2bpp::
; Load compressed 2bpp at b:hl to occupy c tiles of de.
	push de
	ld a, BANK(sScratch)
	call OpenSRAM
	push bc

	ld de, sScratch
	ld a, b
	call FarDecompress

	pop bc
	pop hl

	ld de, sScratch
	call Request2bpp
	call CloseSRAM
	ret

FarCopyBytes::
; copy bc bytes from a:hl to de

	ld [wTempBank], a
	ldh a, [hROMBank]
	push af
	ld a, [wTempBank]
	rst Bankswitch

	call CopyBytes

	pop af
	rst Bankswitch
	ret

FarCopyBytesDouble::
; Copy bc bytes from a:hl to bc*2 bytes at de,
; doubling each byte in the process.

	ld [wTempBank], a
	ldh a, [hROMBank]
	push af
	ld a, [wTempBank]
	rst Bankswitch

; switcheroo, de <> hl
	ld a, h
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a

	inc b
	inc c
	jr .dec

.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
.dec
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	pop af
	rst Bankswitch
	ret

Request2bpp::
; Load 2bpp at b:de to occupy c tiles of hl.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, e
	ld [wRequested2bppSource], a
	ld a, d
	ld [wRequested2bppSource + 1], a
	ld a, l
	ld [wRequested2bppDest], a
	ld a, h
	ld [wRequested2bppDest + 1], a
.loop
	ld a, c
	cp TILES_PER_CYCLE
	jr nc, .cycle

	ld [wRequested2bppSize], a
	call DelayFrame

	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

.cycle
	ld a, TILES_PER_CYCLE
	ld [wRequested2bppSize], a

	call DelayFrame
	ld a, c
	sub TILES_PER_CYCLE
	ld c, a
	jr .loop

Request1bpp::
; Load 1bpp at b:de to occupy c tiles of hl.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, e
	ld [wRequested1bppSource], a
	ld a, d
	ld [wRequested1bppSource + 1], a
	ld a, l
	ld [wRequested1bppDest], a
	ld a, h
	ld [wRequested1bppDest + 1], a
.loop
	ld a, c
	cp TILES_PER_CYCLE
	jr nc, .cycle

	ld [wRequested1bppSize], a
	call DelayFrame

	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

.cycle
	ld a, TILES_PER_CYCLE
	ld [wRequested1bppSize], a

	call DelayFrame
	ld a, c
	sub TILES_PER_CYCLE
	ld c, a
	jr .loop

Get2bpp::
; copy c 2bpp tiles from b:de to hl
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request2bpp

	push hl
	ld h, d
	ld l, e
	pop de

; bank
	ld a, b

; bc = c * LEN_2BPP_TILE
	push af
	swap c
	ld a, $f
	and c
	ld b, a
	ld a, $f0
	and c
	ld c, a
	pop af

	jp FarCopyBytes

Get1bpp::
; copy c 1bpp tiles from b:de to hl
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request1bpp

	push de
	ld d, h
	ld e, l

; bank
	ld a, b

; bc = c * LEN_1BPP_TILE
	push af
	ld h, 0
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	pop af

	pop hl
	jp FarCopyBytesDouble

DuplicateGet2bpp:: ; unreferenced
	ldh a, [rLCDC]
	add a
	jp c, Request2bpp

	push de
	push hl

; bank
	ld a, b

; bc = c * LEN_2BPP_TILE
	ld h, 0
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l

	pop de
	pop hl
	jp FarCopyBytes
