ClearSprites::
; Erase OAM data
	ld hl, wShadowOAM
	ld b, wShadowOAMEnd - wShadowOAM
	xor a
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

HideSprites::
; Set all OAM y-positions to 160 to hide them offscreen
	ld hl, wShadowOAMSprite00YCoord
	ld de, SPRITEOAMSTRUCT_LENGTH
	ld b, NUM_SPRITE_OAM_STRUCTS
	ld a, SCREEN_WIDTH_PX
.loop
	ld [hl], a ; y
	add hl, de
	dec b
	jr nz, .loop
	ret
