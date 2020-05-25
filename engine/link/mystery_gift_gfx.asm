LoadMysteryGiftBackgroundGFX:
	ld hl, MysteryGiftBackgroundGFX
	ld de, vTiles2 tile $20
	ld a, BANK(MysteryGiftBackgroundGFX)
	ld bc, wBGMapBufferEnd - wBGMapBuffer
	call FarCopyBytesDouble
	ld hl, vTiles2 tile $20
	ld bc, wBGMapBufferEnd - wBGMapBuffer
.loop:
	ld [hl], $ff
	inc hl
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

LoadMysteryGiftGFX2:
	ld hl, MysteryGiftGFX2
	ld de, vTiles2 tile $2f
	ld a, BANK(MysteryGiftGFX2)
	ld bc, 14 tiles
	jp FarCopyBytes

MysteryGiftBackgroundGFX:
INCBIN "gfx/mystery_gift/question_mark.1bpp"
INCBIN "gfx/mystery_gift/border.1bpp"

MysteryGiftGFX2:
INCBIN "gfx/mystery_gift/mystery_gift_2.2bpp"
