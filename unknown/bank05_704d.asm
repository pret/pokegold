Function1704d:
	ld hl, UnknownGFX17079
	ld de, vTiles2 tile $20
	ld a, BANK(UnknownGFX17079)
	ld bc, $78
	call FarCopyBytesDouble
	ld hl, vTiles2 tile $20
	ld bc, $78
.loop:
	ld [hl], $ff
	inc hl
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Function1706b:
	ld hl, UnknownGFX170f1
	ld de, vTiles2 tile $2f
	ld a, BANK(UnknownGFX170f1)
	ld bc, $e0
	jp FarCopyBytes

UnknownGFX17079:
INCBIN "gfx/unknown/gfx_17079.2bpp"

UnknownGFX170f1:
INCBIN "gfx/unknown/gfx_170f1.2bpp"
