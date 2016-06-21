Functiond70:: ; d70 (0:0d70)
	ld b, a
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, BANK(sDecompressBuffer)
	call OpenSRAM
	ld hl, sDecompressBuffer
	ld bc, 7 * 7 * $10
	xor a
	call ByteFill

	ld hl, wcf3c
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, sDecompressBuffer
	call Decompress

	call CloseSRAM
	pop af
	rst Bankswitch
	ret

ReplacePlayerSprite::
	callba Function1413c
	ret

Functiond9e::
	callba Functionf8000
	ret

Functionda5::
	callba Functionf8032
	ret

LoadFontsExtra::
	callba Functionf800c
	ret

DecompressRequest2bpp::
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

FarCopyBytes:: ; dcd (0:0dcd)
	ld [wBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [wBuffer]
	rst Bankswitch
	call CopyBytes
	pop af
	rst Bankswitch
	ret

FarCopyBytesDouble:: ; ddd (0:0ddd)
	ld [wBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [wBuffer]
	rst Bankswitch
	ld a, h
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a
	inc b
	inc c
	jr .enter_loop

.copy
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
.enter_loop
	dec c
	jr nz, .copy
	dec b
	jr nz, .copy
	pop af
	rst Bankswitch
	ret

Request2bpp:: ; dfe (0:0dfe)
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hROMBank]
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
.check
	ld a, c
	cp $8 ; TilesPerCycle
	jr nc, .cycle
	ld [wRequested2bpp], a
	call DelayFrame
	pop af
	rst Bankswitch
	pop af
	ld [hBGMapMode], a
	ret

.cycle
	ld a, $8 ; TilesPerCycle
	ld [wRequested2bpp], a
	call DelayFrame
	ld a, c
	sub $8 ; TilesPerCycle
	ld c, a
	jr .check

Request1bpp:: ; e38 (0:0e38)
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hROMBank]
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
.check
	ld a, c
	cp $8 ; TilesPerCycle
	jr nc, .cycle
	ld [wRequested1bpp], a
	call DelayFrame
	pop af
	rst Bankswitch
	pop af
	ld [hBGMapMode], a
	ret

.cycle
	ld a, $8 ; TilesPerCycle
	ld [wRequested1bpp], a
	call DelayFrame
	ld a, c
	sub $8 ; TilesPerCycle
	ld c, a
	jr .check

Get2bpp::
	ld a, [rLCDC]
	bit 7, a
	jp nz, Request2bpp
Copy2bpp::
	push hl
	ld h, d
	ld l, e
	pop de
	ld a, b
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
	ld a, [rLCDC]
	bit 7, a
	jp nz, Request1bpp
Copy1bpp::
	push de
	ld d, h
	ld e, l
	ld a, b
	push af
	ld h, $0
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	pop af
	pop hl
	jp FarCopyBytesDouble

Functionea6::
	ld a, [rLCDC]
	add a
	jp c, Request2bpp
Functioneac::
	push de
	push hl
	ld a, b
	ld h, $0
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
