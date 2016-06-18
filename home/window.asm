Function2e80:: ; 2e80 (0:2e80)
	call ClearWindowData
	ld a, [hROMBank]
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
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call .CloseText
	pop af
	ld [hOAMUpdate], a
	ret

.CloseText:
	call ClearWindowData
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	xor a
	ld [hBGMapMode], a
	call SafeUpdateSprites
	ld a, $90
	ld [hWY], a
	callba Function1415c
	call Functiond97
	ld hl, wd565
	res 7, [hl]
	call ResetBGWindow
	ret

OpenText::
	call ClearWindowData
	ld a, [hROMBank]
	push af
	ld a, BANK(ReanchorBGMap_NoOAMUpdate) ; and BANK(LoadFonts_NoOAMUpdate)
	rst Bankswitch
	call ReanchorBGMap_NoOAMUpdate
	call SpeechTextBox
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	call LoadFonts_NoOAMUpdate
	pop af
	rst Bankswitch
	ret

_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap:: ; 2ee3 (0:2ee3)
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call CGBOnly_LoadEDTile
	pop af
	ld [hOAMUpdate], a
	ret

SafeUpdateSprites:: ; 2ef1 (0:2ef1)
	ld a, [hOAMUpdate]
	push af
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [hOAMUpdate], a
	call UpdateSprites
	xor a
	ld [hOAMUpdate], a
	call DelayFrame
	pop af
	ld [hBGMapMode], a
	pop af
	ld [hOAMUpdate], a
	ret

Function2f0e::
	scf
	ret

