LoadTileMapToTempTileMap::
; Load wTileMap into wTempTileMap
	hlcoord 0, 0
	decoord 0, 0, wTempTileMap
	ld bc, wTileMapEnd - wTileMap
	call CopyBytes

Call_LoadTempTileMapToTileMap::
	xor a
	ldh [hBGMapMode], a
	call LoadTempTileMapToTileMap
	ld a, 1
	ldh [hBGMapMode], a
	ret

LoadTempTileMapToTileMap::
	hlcoord 0, 0, wTempTileMap
	decoord 0, 0
	ld bc, wTileMapEnd - wTileMap
	call CopyBytes