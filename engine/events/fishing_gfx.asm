LoadFishingGFX:
	ld de, FishingGFX
	ld hl, vTiles0 tile $02
	lb bc, BANK(FishingGFX), 2
	call Get2bpp

	ld de, FishingGFX tile $02
	ld hl, vTiles0 tile $06
	lb bc, BANK(FishingGFX), 2
	call Get2bpp

	ld de, FishingGFX tile $04
	ld hl, vTiles0 tile $0a
	lb bc, BANK(FishingGFX), 2
	call Get2bpp

	ld de, FishingGFX tile $06
	ld hl, vTiles0 tile $fc
	lb bc, BANK(FishingGFX), 2
	call Get2bpp
	ret

FishingGFX:
INCBIN "gfx/overworld/chris_fish.2bpp"
