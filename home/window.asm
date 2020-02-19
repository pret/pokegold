Function2e80:: ; 2e80 (0:2e80)
	call ClearWindowData
	ldh a, [hROMBank]
	push af
	ld a, BANK(ReanchorBGMap_NoOAMUpdate) ; and BANK(LoadFonts_NoOAMUpdate)
	rst Bankswitch
	call ReanchorBGMap_NoOAMUpdate
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	call LoadFonts_NoOAMUpdate
	pop af
	rst Bankswitch
	ret

CloseText
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	call .CloseText
	pop af
	ldh [hOAMUpdate], a
	ret

.CloseText:
	call ClearWindowData
	xor a
	ldh [hBGMapMode], a
	call OverworldTextModeSwitch
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	xor a
	ldh [hBGMapMode], a
	call SafeUpdateSprites
	ld a, $90
	ldh [hWY], a
	farcall Function1415c
	call ReplacePlayerSprite
	ld hl, wd565
	res 7, [hl]
	call ResetBGWindow
	ret

OpenText::
	call ClearWindowData
	ldh a, [hROMBank]
	push af
	ld a, BANK(ReanchorBGMap_NoOAMUpdate) ; and BANK(LoadFonts_NoOAMUpdate)
	rst Bankswitch
	call ReanchorBGMap_NoOAMUpdate
	call SpeechTextbox
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	call LoadFonts_NoOAMUpdate
	pop af
	rst Bankswitch
	ret

_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap:: ; 2ee3 (0:2ee3)
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	call CGBOnly_CopyTilemapAtOnce
	pop af
	ldh [hOAMUpdate], a
	ret

SafeUpdateSprites:: ; 2ef1 (0:2ef1)
	ldh a, [hOAMUpdate]
	push af
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [hOAMUpdate], a
	call UpdateSprites
	xor a
	ldh [hOAMUpdate], a
	call DelayFrame
	pop af
	ldh [hBGMapMode], a
	pop af
	ldh [hOAMUpdate], a
	ret

Function2f0e::
	scf
	ret

