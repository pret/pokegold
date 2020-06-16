ReanchorBGMap_NoOAMUpdate::
	call DelayFrame
	ldh a, [hOAMUpdate]
	push af

	ld a, $1
	ldh [hOAMUpdate], a
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	call .ReanchorBGMap

	pop af
	ldh [hBGMapMode], a
	pop af
	ldh [hOAMUpdate], a
	ret

.ReanchorBGMap:
	xor a
	ldh [hLCDCPointer], a
	ldh [hBGMapMode], a
	ld hl, wEnteredMapFromContinue
	set 7, [hl]
	res 2, [hl]
	ld a, $90
	ldh [hWY], a
	call OverworldTextModeSwitch
	ld a, HIGH(vBGMap1)
	call .LoadBGMapAddrIntoHRAM
	call _OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
	xor a
	ldh [hBGMapMode], a
	ldh [hWY], a
	ld a, HIGH(vBGMap0)
	call .LoadBGMapAddrIntoHRAM
	call .WaitTransfer
	xor a ; LOW(vBGMap0)
	ld [wBGMapAnchor], a
	ld a, HIGH(vBGMap0)
	ld [wBGMapAnchor + 1], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	call ApplyBGMapAnchorToObjects
	ret

.LoadBGMapAddrIntoHRAM:
	ldh [hBGMapAddress + 1], a
	xor a
	ldh [hBGMapAddress], a
	ret

.WaitTransfer:
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	ld a, 3
	ldh [hBlackOutBGMapThird], a
.asm_65bc
	call DelayFrame
	ldh a, [hBlackOutBGMapThird]
	and a
	jr nz, .asm_65bc
	pop af
	ldh [hOAMUpdate], a
	pop af
	ldh [hBGMapMode], a
	ret

LoadFonts_NoOAMUpdate::
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a

	call .LoadGFX

	pop af
	ldh [hOAMUpdate], a
	ret

.LoadGFX:
	call LoadFontsExtra
	ld a, $90
	ldh [hWY], a
	call SafeUpdateSprites
	call LoadStandardFont
	ret
