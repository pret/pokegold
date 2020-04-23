ReanchorBGMap_NoOAMUpdate:: ; 6551 (1:6551)
	call DelayFrame
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	call Function656b
	pop af
	ldh [hBGMapMode], a
	pop af
	ldh [hOAMUpdate], a
	ret

Function656b: ; 656b (1:656b)
	xor a
	ldh [hLCDCPointer], a
	ldh [hBGMapMode], a
	ld hl, wEnteredMapFromContinue
	set 7, [hl]
	res 2, [hl]
	ld a, $90
	ldh [hWY], a
	call OverworldTextModeSwitch
	ld a, $9c
	call .LoadBGMapAddrIntoHRAM
	call _OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
	xor a
	ldh [hBGMapMode], a
	ldh [hWY], a
	ld a, $98
	call .LoadBGMapAddrIntoHRAM
	call .WaitTransfer
	xor a
	ld [wBGMapAnchor], a
	ld a, $98
	ld [wBGMapAnchor + 1], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	call ApplyBGMapAnchorToObjects
	ret

.LoadBGMapAddrIntoHRAM: ; 65a5 (1:65a5)
	ldh [hBGMapAddress + 1], a
	xor a
	ldh [hBGMapAddress], a
	ret

.WaitTransfer: ; 65ab (1:65ab)
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	ld a, $3
	ldh [hFF9E], a
.asm_65bc
	call DelayFrame
	ldh a, [hFF9E]
	and a
	jr nz, .asm_65bc
	pop af
	ldh [hOAMUpdate], a
	pop af
	ldh [hBGMapMode], a
	ret

LoadFonts_NoOAMUpdate:: ; 65cb (1:65cb)
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	call .LoadGFX
	pop af
	ldh [hOAMUpdate], a
	ret

.LoadGFX: ; 65d9 (1:65d9)
	call LoadFontsExtra
	ld a, $90
	ldh [hWY], a
	call SafeUpdateSprites
	call LoadStandardFont
	ret
