StagePartyDataForMysteryGift:
; You will be sending this data to your mystery gift partner.
; Structure is the same as a trainer with species and moves
; defined.
	ld a, BANK(sPokemonData)
	call OpenSRAM
	ld de, wMysteryGiftStaging
	ld bc, sPokemonData + wPartyMons - wPokemonData
	ld hl, sPokemonData + wPartySpecies - wPokemonData
.loop
	ld a, [hli]
	cp -1
	jr z, .party_end
	cp EGG
	jr z, .next
	push hl
	; copy level
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [de], a
	inc de
	; copy species
	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	ld [de], a
	inc de
	; copy moves
	ld hl, MON_MOVES
	add hl, bc
	push bc
	ld bc, NUM_MOVES
	call CopyBytes
	pop bc
	pop hl
.next
	push hl
	ld hl, PARTYMON_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	jr .loop
.party_end
	ld a, -1
	ld [de], a
	ld a, wMysteryGiftTrainerEnd - wMysteryGiftTrainer
	ld [wUnusedMysteryGiftStagedDataLength], a
	jp CloseSRAM

InitMysteryGiftLayout:
	call ClearBGPalettes
	call DisableLCD
	ld hl, MysteryGiftGFX
	ld de, vTiles2 tile $00
	ld a, BANK(MysteryGiftGFX)
	ld bc, $20 tiles
	call FarCopyBytes
	farcall LoadMysteryGiftBackgroundGFX
	farcall LoadMysteryGiftGFX2
	ld hl, vTiles2 tile $3d
	ld a, $ff
	ld bc, 1 tiles
	call ByteFill
	hlcoord 0, 0
	ld a, $3d
	ld bc, SCREEN_AREA
	call ByteFill
	hlcoord 3, 7
	lb bc, 9, 15
	call ClearBox
	hlcoord 0, 0
	ld a, $1e
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 0, 1
	ld a, $33
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 3, 1
	ld a, 0
	call .Load15GFX
	hlcoord 3, 2
	ld a, $f
	call .Load15GFX
	hlcoord 8, 0
	ld a, $20
	call .Load4GFX
	hlcoord 9, 3
	ld a, $24
	call .Load3GFX
	hlcoord 9, 4
	ld [hl], $27
	hlcoord 1, 2
	ld a, $2e
	call .Load15Column
	hlcoord 18, 5
	ld a, $2a
	call .Load11Column
	hlcoord 2, 5
	ld a, $28
	call .Load16Row
	hlcoord 2, 16
	ld a, $2c
	call .Load16Row
	hlcoord 2, 5
	ld a, $35
	call .Load4GFX
	hlcoord 18, 5
	ld [hl], $29
	hlcoord 18, 16
	ld [hl], $2b
	hlcoord 1, 16
	ld [hl], $2d
	hlcoord 2, 6
	ld a, $39
	call .Load16Row
	hlcoord 2, 15
	ld a, $3b
	call .Load16Row
	hlcoord 2, 6
	ld a, $3c
	call .Load9Column
	hlcoord 17, 6
	ld a, $3a
	call .Load9Column
	hlcoord 2, 6
	ld [hl], $2f
	hlcoord 17, 6
	ld [hl], $30
	hlcoord 2, 15
	ld [hl], $32
	hlcoord 17, 15
	ld [hl], $31
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_MYSTERY_GIFT
	call GetSGBLayout
	jp SetDefaultBGPAndOBP

.Load3GFX:
	ld b, 3
	jr .gfx_loop

.Load4GFX:
	ld b, 4
	jr .gfx_loop

.Load15GFX:
	ld b, 15

.gfx_loop
	ld [hli], a
	inc a
	dec b
	jr nz, .gfx_loop
	ret

.Load9Column:
	ld b, 9
	jr .col_loop

.Load11Column:
	ld b, 11
	jr .col_loop

.Load15Column:
	ld b, 15

.col_loop
	ld [hl], a
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .col_loop
	ret

.Load16Row:
	ld b, 16
.row_loop
	ld [hli], a
	dec b
	jr nz, .row_loop
	ret

MysteryGiftGFX:
INCBIN "gfx/mystery_gift/mystery_gift.2bpp"
