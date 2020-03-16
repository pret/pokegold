Functiond70:: ; d70 (0:0d70)
	ld b, a
	ldh a, [hROMBank]
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
	farcall Function1413c
	ret

Functiond9e::
	farcall Functionf8000
	ret

LoadFontsBattleExtra::
	farcall _LoadFontsBattleExtra
	ret

LoadFontsExtra::
	farcall Functionf800c
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

FarCopyBytes::
; copy bc bytes from a:hl to de

	ld [wBuffer], a
	ldh a, [hROMBank]
	push af
	ld a, [wBuffer]
	rst Bankswitch

	call CopyBytes

	pop af
	rst Bankswitch
	ret


FarCopyBytesDouble:
; Copy bc bytes from a:hl to bc*2 bytes at de,
; doubling each byte in the process.

	ld [wBuffer], a
	ldh a, [hROMBank]
	push af
	ld a, [wBuffer]
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
.check
	ld a, c
	cp 8 ; TilesPerCycle
	jr nc, .cycle

	ld [wRequested2bpp], a
	call DelayFrame

	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

.cycle
	ld a, 8 ; TilesPerCycle
	ld [wRequested2bpp], a

	call DelayFrame
	ld a, c
	sub 8 ; TilesPerCycle
	ld c, a
	jr .check

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
.check
	ld a, c
	cp 8 ; TilesPerCycle
	jr nc, .cycle

	ld [wRequested1bpp], a
	call DelayFrame

	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

.cycle
	ld a, 8 ; TilesPerCycle
	ld [wRequested1bpp], a

	call DelayFrame
	ld a, c
	sub 8 ; TilesPerCycle
	ld c, a
	jr .check

Get2bpp::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request2bpp

Copy2bpp:
; copy c 2bpp tiles from b:de to hl

	push hl
	ld h, d
	ld l, e
	pop de

; bank
	ld a, b

; bc = c * $10
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
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request1bpp

Copy1bpp::
; copy c 1bpp tiles from b:de to hl

	push de
	ld d, h
	ld e, l

; bank
	ld a, b

; bc = c * $10 / 2
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

Function_ea6::
	ldh a, [rLCDC]
	add a
	jp c, Request2bpp

Function_eac::
	push de
	push hl
	
; bank
	ld a, b

; bc = c * $10
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
