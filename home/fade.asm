Function360:: ; 360 (0:0360)
; XXX
; TimeOfDayFade
	ld a, [wTimeOfDayPal]
	ld b, a
	ld hl, IncGradGBPalTable_11
	ld a, l
	sub b
	ld l, a
	jr nc, .okay
	dec h
.okay
	ld a, [hli]
	ld [rBGP], a
	ld a, [hli]
	ld [rOBP0], a
	ld a, [hli]
	ld [rOBP1], a
	ret

RotateFourPalettesRight::
	ld a, [hCGB]
	and a
	jr z, .dmg
	ld hl, IncGradGBPalTable_00
	ld b, 4
	jr RotatePalettesRight

.dmg
	ld hl, IncGradGBPalTable_08
	ld b, 4
	jr RotatePalettesRight

RotateThreePalettesRight::
	ld a, [hCGB]
	and a
	jr z, .dmg
	ld hl, IncGradGBPalTable_05
	ld b, 3
	jr RotatePalettesRight

.dmg
	ld hl, IncGradGBPalTable_13
	ld b, 3
RotatePalettesRight::
.loop
	push de
	ld a, [hli]
	call Functionc61
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call Functionc83
	ld c, 8
	call DelayFrames
	pop de
	dec b
	jr nz, .loop
	ret

RotateFourPalettesLeft::
	ld a, [hCGB]
	and a
	jr z, .dmg
	ld hl, IncGradGBPalTable_04 - 1
	ld b, 4
	jr RotatePalettesLeft

.dmg
	ld hl, IncGradGBPalTable_12 - 1
	ld b, 4
	jr RotatePalettesLeft

RotateThreePalettesLeft::
	ld a, [hCGB]
	and a
	jr z, .dmg
	ld hl, IncGradGBPalTable_07 - 1
	ld b, 3
	jr RotatePalettesLeft
.dmg
	ld hl, IncGradGBPalTable_15 - 1
	ld b, 3
RotatePalettesLeft::
.loop
	push de
	ld a, [hld]
	ld d, a
	ld a, [hld]
	ld e, a
	call Functionc83
	ld a, [hld]
	call Functionc61
	ld c, 8
	call DelayFrames
	pop de
	dec b
	jr nz, .loop
	ret

IncGradGBPalTable_00:: db %11111111, %11111111, %11111111
IncGradGBPalTable_01:: db %11111110, %11111110, %11111110
IncGradGBPalTable_02:: db %11111001, %11111001, %11111001
IncGradGBPalTable_03:: db %11100100, %11100100, %11100100

IncGradGBPalTable_04:: db %11100100, %11100100, %11100100
IncGradGBPalTable_05:: db %10010000, %10010000, %10010000
IncGradGBPalTable_06:: db %01000000, %01000000, %01000000

IncGradGBPalTable_07:: db %00000000, %00000000, %00000000
;                           bgp       obp1       obp2
IncGradGBPalTable_08:: db %11111111, %11111111, %11111111
IncGradGBPalTable_09:: db %11111110, %11111110, %11111000
IncGradGBPalTable_10:: db %11111001, %11100100, %11100100
IncGradGBPalTable_11:: db %11100100, %11010000, %11100000

IncGradGBPalTable_12:: db %11100100, %11010000, %11100000
IncGradGBPalTable_13:: db %10010000, %10000000, %10010000
IncGradGBPalTable_14:: db %01000000, %01000000, %01000000

IncGradGBPalTable_15:: db %00000000, %00000000, %00000000
