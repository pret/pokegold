LoadTilemapToTempTilemap::
; Load wTilemap into wTempTileMap
	hlcoord 0, 0
	decoord 0, 0, wTempTileMap
	ld bc, wTilemapEnd - wTilemap
	jp CopyBytes

SafeLoadTempTilemapToTilemap::
	xor a
	ldh [hBGMapMode], a
	call LoadTempTilemapToTilemap
	ld a, 1
	ldh [hBGMapMode], a
	ret

LoadTempTilemapToTilemap::
; Load wTempTilemap into wTilemap
	hlcoord 0, 0, wTempTileMap
	decoord 0, 0
	ld bc, wTilemapEnd - wTilemap
	jp CopyBytes