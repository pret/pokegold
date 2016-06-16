
Function360::
	ld a, [$d568] ; 360
	ld b, a ; 363
	ld hl, $40c ; 364
	ld a, l ; 367
	sub b ; 368
	ld l, a ; 369
	jr nc, Function36d ; 36a
	dec h ; 36c
	ld a, [hli] ; 36d
	ldh [$ff47], a ; 36e
	ld a, [hli] ; 370
	ldh [$ff48], a ; 371
	ld a, [hli] ; 373
	ldh [$ff49], a ; 374
	ret ; 376
; 377

Function377::
	ldh a, [$ffe8] ; 377
	and a ; 379
	jr z, Function383 ; 37a
	ld hl, $3eb ; 37c
	ld b, $4 ; 37f
	jr Function39b ; 381
; 383

Function383::
	ld hl, $403 ; 383
	ld b, $4 ; 386
	jr Function39b ; 388
; 38a

Function38a::
	ldh a, [$ffe8] ; 38a
	and a ; 38c
	jr z, Function396 ; 38d
	ld hl, $3fa ; 38f
	ld b, $3 ; 392
	jr Function39b ; 394
; 396

Function396::
	ld hl, $412 ; 396
	ld b, $3 ; 399
	push de ; 39b
	ld a, [hli] ; 39c
	call Functionc61 ; 39d
	ld a, [hli] ; 3a0
	ld e, a ; 3a1
	ld a, [hli] ; 3a2
	ld d, a ; 3a3
	call Functionc83 ; 3a4
	ld c, $8 ; 3a7
	call DelayFrames ; 3a9
	pop de ; 3ac
	dec b ; 3ad
	jr nz, Function39b ; 3ae
	ret ; 3b0
; 3b1

Function3b1::
	ldh a, [$ffe8] ; 3b1
	and a ; 3b3
	jr z, Function3bd ; 3b4
	ld hl, $3f6 ; 3b6
	ld b, $4 ; 3b9
	jr Function3d5 ; 3bb
; 3bd

Function3bd::
	ld hl, $40e ; 3bd
	ld b, $4 ; 3c0
	jr Function3d5 ; 3c2
; 3c4

Function3c4::
	ldh a, [$ffe8] ; 3c4
	and a ; 3c6
	jr z, Function3d0 ; 3c7
	ld hl, $3ff ; 3c9
	ld b, $3 ; 3cc
	jr Function3d5 ; 3ce
; 3d0

Function3d0::
	ld hl, $417 ; 3d0
	ld b, $3 ; 3d3
	push de ; 3d5
	ld a, [hld] ; 3d6
	ld d, a ; 3d7
	ld a, [hld] ; 3d8
	ld e, a ; 3d9
	call Functionc83 ; 3da
	ld a, [hld] ; 3dd
	call Functionc61 ; 3de
	ld c, $8 ; 3e1
	call DelayFrames ; 3e3
	pop de ; 3e6
	dec b ; 3e7
	jr nz, Function3d5 ; 3e8
	ret ; 3ea
; 3eb

Function3eb::
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
; 41b
