VBlank::
	push af ; 150
	push bc ; 151
	push de ; 152
	push hl ; 153
	ld a, [hMenuReturn] ; 154
	and $7 ; 156
	ld e, a ; 158
	ld d, $0 ; 159
	ld hl, .blanks ; 15b
	add hl, de ; 15e
	add hl, de ; 15f
	ld a, [hli] ; 160
	ld h, [hl] ; 161
	ld l, a ; 162
	ld de, .return ; 163
	push de ; 166
	jp [hl] ; 167
.return
	call Function1efa ; 168
	pop hl ; 16b
	pop de ; 16c
	pop bc ; 16d
	pop af ; 16e
	reti ; 16f
; 170

.blanks
	dw Function180
	dw Function1f4
	dw Function2b0
	dw Function2c4
	dw Function255
	dw Function278
	dw Function180
	dw Function180

Function180::
	ld hl, hVBlankCounter ; 180
	inc [hl] ; 183
	ld a, [rDIV] ; 184
	ld b, a ; 186
	ld a, [hRandomAdd] ; 187
	adc b ; 189
	ld [hRandomAdd], a ; 18a
	ld a, [rDIV] ; 18c
	ld b, a ; 18e
	ld a, [hRandomSub] ; 18f
	sbc b ; 191
	ld [hRandomSub], a ; 192
	ld a, [hROMBank] ; 194
	ld [$d155], a ; 196
	ld a, [hSCX] ; 199
	ld [rSCX], a ; 19b
	ld a, [hSCY] ; 19d
	ld [rSCY], a ; 19f
	ld a, [hWY] ; 1a1
	ld [rWY], a ; 1a3
	ld a, [hWX] ; 1a5
	ld [rWX], a ; 1a7
	call Function1458 ; 1a9
	jr c, Function1c2 ; 1ac
	call Functionbdf ; 1ae
	jr c, Function1c2 ; 1b1
	call Function14bb ; 1b3
	call Function15d0 ; 1b6
	call Function1579 ; 1b9
	call Function162b ; 1bc
	call Function1642 ; 1bf
Function1c2::
	ld a, [hBGMapUpdate] ; 1c2
	and a ; 1c4
	jr nz, Function1ca ; 1c5
	call hPushOAM ; 1c7
Function1ca::
	xor a ; 1ca
	ld [$ceea], a ; 1cb
	ld a, [$cee8] ; 1ce
	and a ; 1d1
	jr z, Function1d8 ; 1d2
	dec a ; 1d4
	ld [$cee8], a ; 1d5
Function1d8::
	ld a, [$cee9] ; 1d8
	and a ; 1db
	jr z, Function1e2 ; 1dc
	dec a ; 1de
	ld [$cee9], a ; 1df
Function1e2::
	call Function8e6 ; 1e2
	ld a, $3a ; 1e5
	rst Bankswitch ; 1e7
	call $405c ; 1e8
	ld a, [$d155] ; 1eb
	rst Bankswitch ; 1ee
	ld a, [$ff9a] ; 1ef
	ld [$ffe5], a ; 1f1
	ret ; 1f3
; 1f4

Function1f4::
	ld a, [hROMBank] ; 1f4
	ld [$d155], a ; 1f6
	ld a, [hSCX] ; 1f9
	ld [rSCX], a ; 1fb
	ld a, [hSCY] ; 1fd
	ld [rSCY], a ; 1ff
	call Function23e ; 201
	jr c, Function20f ; 204
	call Function14bb ; 206
	call Function15d0 ; 209
	call hPushOAM ; 20c
Function20f::
	ld a, [$ffc8] ; 20f
	or a ; 211
	jr z, Function219 ; 212
	ld c, a ; 214
	ld a, [$c700] ; 215
	ld [$ff00+c], a ; 218
Function219::
	xor a ; 219
	ld [$ceea], a ; 21a
	ld a, [rIF] ; 21d
	ld b, a ; 21f
	xor a ; 220
	ld [rIF], a ; 221
	ld a, $2 ; 223
	ld [rIE], a ; 225
	ld a, b ; 227
	and $8 ; 228
	or $2 ; 22a
	ld [rIF], a ; 22c
	ei ; 22e
	ld a, $3a ; 22f
	rst Bankswitch ; 231
	call $405c ; 232
	ld a, [$d155] ; 235
	rst Bankswitch ; 238
	ld a, $1f ; 239
	ld [rIE], a ; 23b
	ret ; 23d
; 23e

Function23e::
	ld a, [$ffe8] ; 23e
	and a ; 240
	jp nz, Functionbe3 ; 241
	ld a, [$cf43] ; 244
	ld [$ff47], a ; 247
	ld a, [$cf44] ; 249
	ld [$ff48], a ; 24c
	ld a, [$cf45] ; 24e
	ld [$ff49], a ; 251
	and a ; 253
	ret ; 254
; 255

Function255::
	ld a, [hROMBank] ; 255
	ld [$d155], a ; 257
	call Function14bb ; 25a
	call Function15d0 ; 25d
	call hPushOAM ; 260
	call Function8e6 ; 263
	xor a ; 266
	ld [$ceea], a ; 267
	call Function1ebf ; 26a
	ld a, $3a ; 26d
	rst Bankswitch ; 26f
	call $405c ; 270
	ld a, [$d155] ; 273
	rst Bankswitch ; 276
	ret ; 277
; 278

Function278::
	ld a, [hROMBank] ; 278
	ld [$d155], a ; 27a
	ld a, [hSCX] ; 27d
	ld [rSCX], a ; 27f
	call Functionbdf ; 281
	jr c, Function28c ; 284
	call Function14bb ; 286
	call Function15d0 ; 289
Function28c::
	xor a ; 28c
	ld [$ceea], a ; 28d
	call Function8e6 ; 290
	xor a ; 293
	ld [rIF], a ; 294
	ld a, $2 ; 296
	ld [rIE], a ; 298
	ld [rIF], a ; 29a
	ei ; 29c
	ld a, $3a ; 29d
	rst Bankswitch ; 29f
	call $405c ; 2a0
	ld a, [$d155] ; 2a3
	rst Bankswitch ; 2a6
	di ; 2a7
	xor a ; 2a8
	ld [rIF], a ; 2a9
	ld a, $1f ; 2ab
	ld [rIE], a ; 2ad
	ret ; 2af
; 2b0

Function2b0::
	ld a, [hROMBank] ; 2b0
	ld [$d155], a ; 2b2
	ld a, $3a ; 2b5
	rst Bankswitch ; 2b7
	call $405c ; 2b8
	ld a, [$d155] ; 2bb
	rst Bankswitch ; 2be
	xor a ; 2bf
	ld [$ceea], a ; 2c0
	ret ; 2c3
; 2c4

Function2c4::
	ld a, [hVBlankCounter] ; 2c4
	inc a ; 2c6
	ld [hVBlankCounter], a ; 2c7
	ld a, [rDIV] ; 2c9
	ld b, a ; 2cb
	ld a, [hRandomAdd] ; 2cc
	adc b ; 2ce
	ld [hRandomAdd], a ; 2cf
	ld a, [rDIV] ; 2d1
	ld b, a ; 2d3
	ld a, [hRandomSub] ; 2d4
	sbc b ; 2d6
	ld [hRandomSub], a ; 2d7
	call Function8e6 ; 2d9
	ld a, [hROMBank] ; 2dc
	ld [$d155], a ; 2de
	ld a, [hSCX] ; 2e1
	ld [rSCX], a ; 2e3
	ld a, [hSCY] ; 2e5
	ld [rSCY], a ; 2e7
	ld a, [hWY] ; 2e9
	ld [rWY], a ; 2eb
	ld a, [hWX] ; 2ed
	ld [rWX], a ; 2ef
	call Function14bb ; 2f1
	call Function1458 ; 2f4
	call Function15d0 ; 2f7
	call Function1579 ; 2fa
	call Function162b ; 2fd
	call hPushOAM ; 300
	xor a ; 303
	ld [$ceea], a ; 304
	ld a, [$cee9] ; 307
	and a ; 30a
	jr z, Function311 ; 30b
	dec a ; 30d
	ld [$cee9], a ; 30e
Function311::
	xor a ; 311
	ld [rIF], a ; 312
	ld a, $2 ; 314
	ld [rIE], a ; 316
	ld [rIF], a ; 318
	ei ; 31a
	ld a, $3a ; 31b
	rst Bankswitch ; 31d
	call $405c ; 31e
	ld a, [$d155] ; 321
	rst Bankswitch ; 324
	di ; 325
	xor a ; 326
	ld [rIF], a ; 327
	ld a, $1f ; 329
	ld [rIE], a ; 32b
	ret ; 32d
; 32e
