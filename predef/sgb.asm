Predef_LoadSGBLayout: ; 8c2d (2:4c2d)
	call CheckCGB
	jp nz, Predef_LoadSGBLayoutCGB
	ld a, b
	cp SCGB_RAM
	jr nz, .asm_8c3b
	ld a, [wColorLayoutPredefID]
.asm_8c3b
	cp SCGB_PARTY_MENU_HP_PALS
	jp z, SGB_ApplyPartyMenuHPPals
	ld l, a
	ld h, $0
	add hl, hl
	ld de, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, FinishSGBPredefFunction
	push de
	jp [hl]

.Jumptable
	dw Function8c90
	dw Function8c97
	dw Function8d3f
	dw Function8d46
	dw Function8d95
	dw Function8e3c
	dw Function8e43
	dw Function8e51
	dw Function8e4a
	dw Function8e9b
	dw Function8d8e
	dw Function8eb7
	dw Function8e6e
	dw Function8f04
	dw Function8d1f
	dw Function8e81
	dw Function8e14
	dw Function8e88
	dw Function8f12
	dw Function8e7a
	dw Function8e35
	dw Function8f04
	dw Function8e0d
	dw Function8dd3
	dw Function8f0b
	dw Function8f90
	dw Function8f97
	dw Function8fc3
	dw Function8fca
	dw Function8e4a
	dw Function8f53
	dw Function8dcc

Function8c90: ; 8c90 (2:4c90)
	ld hl, PalPacket_a0d5
	ld de, BlkPacket_9f05
	ret

Function8c97: ; 8c97 (2:4c97)
	ld hl, BlkPacket_9f05
	call PushSGBPals_
	ld hl, PalPacket_a155
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	ld a, [wcc99]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, BlkPacket_ad2d
	add hl, de
	ld a, [hli]
	ld [wccac], a
	ld a, [hli]
	ld [wccad], a
	ld a, [hli]
	ld [wccae], a
	ld a, [hl]
	ld [wccaf], a
	ld a, [wcc9a]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, BlkPacket_ad2d
	add hl, de
	ld a, [hli]
	ld [wccb2], a
	ld a, [hli]
	ld [wccb3], a
	ld a, [hli]
	ld [wccb4], a
	ld a, [hl]
	ld [wccb5], a
	ld hl, PalPacket_a165
	ld de, wccb9
	ld bc, $10
	call CopyBytes
	call Function9ba9
	ld a, [hli]
	ld [wccbc], a
	ld a, [hli]
	ld [wccbd], a
	ld a, [hli]
	ld [wccbe], a
	ld a, [hl]
	ld [wccbf], a
	call Function9bba
	ld a, [hli]
	ld [wccc2], a
	ld a, [hli]
	ld [wccc3], a
	ld a, [hli]
	ld [wccc4], a
	ld a, [hl]
	ld [wccc5], a
	ld hl, wcca9
	ld de, wccb9
	ld a, $1
	ld [wColorLayoutPredefID], a
	ret

Function8d1f: ; 8d1f (2:4d1f)
	ld hl, PalPacket_a045
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	ld hl, wccaa
	ld [hl], $10
	inc hl
	inc hl
	ld a, [wcc99]
	add $2f
	ld [hl], a
	ld hl, wcca9
	ld de, BlkPacket_9f35
	ret

Function8d3f: ; 8d3f (2:4d3f)
	ld hl, PalPacket_a0e5
	ld de, BlkPacket_9ee5
	ret

Function8d46: ; 8d46 (2:4d46)
	ld hl, PalPacket_a155
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	ld a, [wcca1]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, BlkPacket_ad2d
	add hl, de
	ld a, [hli]
	ld [wccac], a
	ld a, [hli]
	ld [wccad], a
	ld a, [hli]
	ld [wccae], a
	ld a, [hl]
	ld [wccaf], a
	ld a, [wd004]
	ld bc, wTempMonDVs
	call Function9bcb
	ld a, [hli]
	ld [wccb2], a
	ld a, [hli]
	ld [wccb3], a
	ld a, [hli]
	ld [wccb4], a
	ld a, [hl]
	ld [wccb5], a
	ld hl, wcca9
	ld de, BlkPacket_9f25
	ret

Function8d8e: ; 8d8e (2:4d8e)
	ld hl, PalPacket_a0c5
	ld de, wccaa
	ret

Function8d95: ; 8d95 (2:4d95)
	ld hl, PalPacket_a155
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	ld hl, wccac
	ld [hl], $9f
	inc hl
	ld [hl], $2a
	inc hl
	ld [hl], $5a
	inc hl
	ld [hl], $19
	ld a, [wd004]
	call Function9be4
	ld a, [hli]
	ld [wccb2], a
	ld a, [hli]
	ld [wccb3], a
	ld a, [hli]
	ld [wccb4], a
	ld a, [hl]
	ld [wccb5], a
	ld hl, wcca9
	ld de, BlkPacket_9f45
	ret

Function8dcc: ; 8dcc (2:4dcc)
	call Function8d95
	ld de, BlkPacket_9f65
	ret

Function8dd3: ; 8dd3 (2:4dd3)
	ld hl, PalPacket_a155
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	ld hl, wccac
	ld [hl], $9f
	inc hl
	ld [hl], $2a
	inc hl
	ld [hl], $5a
	inc hl
	ld [hl], $19
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call Function9bcb
	ld a, [hli]
	ld [wccb2], a
	ld a, [hli]
	ld [wccb3], a
	ld a, [hli]
	ld [wccb4], a
	ld a, [hl]
	ld [wccb5], a
	ld hl, wcca9
	ld de, BlkPacket_9f55
	ret

Function8e0d: ; 8e0d (2:4e0d)
	call Function8d95
	ld de, BlkPacket_9f75
	ret

Function8e14: ; 8e14 (2:4e14)
	ld hl, PalPacket_a155
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	ld hl, wccac
	ld [hl], $9f
	inc hl
	ld [hl], $2a
	inc hl
	ld [hl], $5a
	inc hl
	ld [hl], $19
	ld hl, wcca9
	ld de, BlkPacket_9ee5
	ret

Function8e35: ; 8e35 (2:4e35)
	ld hl, PalPacket_a0a5
	ld de, BlkPacket_9ee5
	ret

Function8e3c: ; 8e3c (2:4e3c)
	ld hl, PalPacket_a105
	ld de, BlkPacket_9f85
	ret

Function8e43: ; 8e43 (2:4e43)
	ld hl, PalPacket_a115
	ld de, BlkPacket_9fe5
	ret

Function8e4a: ; 8e4a (2:4e4a)
	ld hl, PalPacket_a125
	ld de, BlkPacket_9ee5
	ret

Function8e51: ; 8e51 (2:4e51)
	ld b, $0
	ld hl, .Table
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.Table
	dw BlkPacket_9ee5, PalPacket_a055
	dw BlkPacket_9ef5, PalPacket_a075
	dw BlkPacket_9ee5, PalPacket_a085

Function8e6e: ; 8e6e (2:4e6e)
	ld hl, PalPacket_a005
	ld de, BlkPacket_9fd5
	ld a, $8
	ld [wColorLayoutPredefID], a
	ret

Function8e7a: ; 8e7a (2:4e7a)
	ld hl, PalPacket_a015
	ld de, BlkPacket_9ff5
	ret

Function8e81: ; 8e81 (2:4e81)
	ld hl, PalPacket_a0b5
	ld de, BlkPacket_9ee5
	ret

Function8e88: ; 8e88 (2:4e88)
	ld hl, BlkPacket_9ee5
	ld de, wc602
	ld bc, $10
	call CopyBytes
	ld hl, PalPacket_a025
	ld de, BlkPacket_9ee5
	ret

Function8e9b: ; 8e9b (2:4e9b)
	ld hl, PalPacket_a045
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	call Function8ff6
	ld hl, wccaa
	ld [hld], a
	ld de, BlkPacket_9ee5
	ld a, $9
	ld [wColorLayoutPredefID], a
	ret

Function8eb7: ; 8eb7 (2:4eb7)
	push bc
	ld hl, PalPacket_a155
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	pop bc
	ld a, c
	and a
	jr z, .asm_8ed9
	ld hl, wccac
	ld [hl], $e7
	inc hl
	ld [hl], $1c
	inc hl
	ld [hl], $62
	inc hl
	ld [hl], $c
	jr .asm_8efd

.asm_8ed9
	ld hl, wPartyMon1DVs
	ld bc, $30
	ld a, [wd005]
	call AddNTimes
	ld c, l
	ld b, h
	ld a, [wcc99]
	call Function9bcb
	ld a, [hli]
	ld [wccac], a
	ld a, [hli]
	ld [wccad], a
	ld a, [hli]
	ld [wccae], a
	ld a, [hl]
	ld [wccaf], a
.asm_8efd
	ld hl, wcca9
	ld de, BlkPacket_9ee5
	ret

Function8f04: ; 8f04 (2:4f04)
	ld hl, PalPacket_a125
	ld de, BlkPacket_9ee5
	ret

Function8f0b: ; 8f0b (2:4f0b)
	ld hl, PalPacket_a035
	ld de, BlkPacket_9ee5
	ret

Function8f12: ; 8f12 (2:4f12)
	ld hl, PalPacket_a045
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	ld hl, BlkPacket_9ee5
	ld de, wccb9
	ld bc, $10
	call CopyBytes
	call Function8ff6
	ld hl, wccaa
	ld [hl], a
	ld hl, wccac
	ld [hl], $2e
	ld hl, wccbc
	ld a, $5
	ld [hli], a
	ld a, [wMenuBorderLeftCoord]
	ld [hli], a
	ld a, [wMenuBorderTopCoord]
	ld [hli], a
	ld a, [wMenuBorderRightCoord]
	ld [hli], a
	ld a, [wMenuBorderBottomCoord]
	ld [hl], a
	ld hl, wcca9
	ld de, wccb9
	ret

Function8f53: ; 8f53 (2:4f53)
	ld hl, PalPacket_a155
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	ld a, [wd004]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, BlkPacket_ad3d
	add hl, de
	ld a, [wce65]
	and $3
	sla a
	sla a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld [wccac], a
	ld a, [hli]
	ld [wccad], a
	ld a, [hli]
	ld [wccae], a
	ld a, [hl]
	ld [wccaf], a
	ld hl, wcca9
	ld de, BlkPacket_9ee5
	ret

Function8f90: ; 8f90 (2:4f90)
	ld hl, PalPacket_a145
	ld de, BlkPacket_9ee5
	ret

Function8f97: ; 8f97 (2:4f97)
	ld hl, PalPacket_a155
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call Function9bcb
	ld a, [hli]
	ld [wccac], a
	ld a, [hli]
	ld [wccad], a
	ld a, [hli]
	ld [wccae], a
	ld a, [hl]
	ld [wccaf], a
	ld hl, wcca9
	ld de, BlkPacket_9ee5
	ret

Function8fc3: ; 8fc3 (2:4fc3)
	ld hl, PalPacket_a135
	ld de, BlkPacket_9ee5
	ret

Function8fca: ; 8fca (2:4fca)
	ld hl, PalPacket_a155
	ld de, wcca9
	ld bc, $10
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call Function9bd3
	ld a, [hli]
	ld [wccac], a
	ld a, [hli]
	ld [wccad], a
	ld a, [hli]
	ld [wccae], a
	ld a, [hl]
	ld [wccaf], a
	ld hl, wcca9
	ld de, BlkPacket_9ee5
	ret

Function8ff6: ; 8ff6 (2:4ff6)
	ld a, [wTimeOfDayPal]
	cp $2
	jr c, .asm_9000
	ld a, $19
	ret

.asm_9000
	ld a, [wPermission]
	cp $2
	jr z, .asm_9023
	cp $4
	jr z, .asm_9026
	cp $7
	jr z, .asm_9026
	cp $5
	jr z, .asm_9029
	cp $6
	jr z, .asm_902c
	ld a, [wMapGroup]
	ld e, a
	ld d, $0
	ld hl, .SGBRoofPalInds
	add hl, de
	ld a, [hl]
	ret

.asm_9023
	ld a, $0
	ret

.asm_9026
	ld a, $18
	ret

.asm_9029
	ld a, $6
	ret

.asm_902c
	ld a, $3
	ret

.SGBRoofPalInds:
	db $00 ; Unused
	db $12 ; Olivine
	db $14 ; Mahogany
	db $18 ; Various Dungeons
	db $11 ; Ecruteak
	db $15 ; Blackthorn
	db $09 ; Cinnabar
	db $04 ; Cerulean
	db $0f ; Azalea
	db $16 ; Lake Of Rage
	db $0e ; Violet
	db $10 ; Goldenrod
	db $06 ; Vermilion
	db $01 ; Palette
	db $03 ; Pewter
	db $06 ; Fast Ship
	db $0b ; Indigo Plateau
	db $08 ; Fuchsia
	db $05 ; Lavender
	db $17 ; Silver Cave Outside
	db $08 ; Pokemon Center 2F
	db $07 ; Celadon
	db $13 ; Cianwood
	db $02 ; Viridian
	db $0c ; New Bark
	db $0a ; Saffron
	db $0d ; Cherrygrove

FinishSGBPredefFunction: ; 904a (2:504a)
	push de
	call PushSGBPals_
	pop hl
	jp PushSGBPals_
