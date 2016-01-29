INCLUDE "includes.asm"

SECTION "NULL", ROM0[0]
NULL::

INCLUDE "rst.asm"
INCLUDE "interrupts.asm"

SECTION "Header", ROM0[$100]

Start::
	nop
	jp _Start

SECTION "Home", ROM0[$150]
Reset::
	push af ; 150
	push bc ; 151
	push de ; 152
	push hl ; 153
	ldh a, [hMenuReturn] ; 154
	and $7 ; 156
	ld e, a ; 158
	ld d, $0 ; 159
	ld hl, $170 ; 15b
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

Function170::
	add b ; 170
	ld bc, $1f4 ; 171
	or b ; 174
	ld [bc], a ; 175
	call nz, Function5502 ; 176
	ld [bc], a ; 179
	ld a, b ; 17a
	ld [bc], a ; 17b
	add b ; 17c
	ld bc, $180 ; 17d
	ld hl, $ff9d ; 180
	inc [hl] ; 183
	ldh a, [rDIV] ; 184
	ld b, a ; 186
	ldh a, [hRandomAdd] ; 187
	adc b ; 189
	ldh [hRandomAdd], a ; 18a
	ldh a, [rDIV] ; 18c
	ld b, a ; 18e
	ldh a, [$ffe4] ; 18f
	sbc b ; 191
	ldh [$ffe4], a ; 192
	ldh a, [hROMBank] ; 194
	ld [$d155], a ; 196
	ldh a, [$ffd1] ; 199
	ldh [$ff43], a ; 19b
	ldh a, [$ffd2] ; 19d
	ldh [$ff42], a ; 19f
	ldh a, [$ffd4] ; 1a1
	ldh [$ff4a], a ; 1a3
	ldh a, [$ffd3] ; 1a5
	ldh [$ff4b], a ; 1a7
	call Function1458 ; 1a9
	jr c, Function1c2 ; 1ac
	call Functionbdf ; 1ae
	jr c, Function1c2 ; 1b1
	call Function14bb ; 1b3
	call Function15d0 ; 1b6
	call Function1579 ; 1b9
	call Function162b ; 1bc
	call Function1642 ; 1bf
	ldh a, [$ffda] ; 1c2
	and a ; 1c4
	jr nz, Function1ca ; 1c5
	call Functionff80 ; 1c7
	xor a ; 1ca
	ld [$ceea], a ; 1cb
	ld a, [$cee8] ; 1ce
	and a ; 1d1
	jr z, Function1d8 ; 1d2
	dec a ; 1d4
	ld [$cee8], a ; 1d5
	ld a, [$cee9] ; 1d8
	and a ; 1db
	jr z, Function1e2 ; 1dc
	dec a ; 1de
	ld [$cee9], a ; 1df
	call Function8e6 ; 1e2
	ld a, $3a ; 1e5
	rst Bankswitch ; 1e7
	call Function405c ; 1e8
	ld a, [$d155] ; 1eb
	rst Bankswitch ; 1ee
	ldh a, [$ff9a] ; 1ef
	ldh [$ffe5], a ; 1f1
	ret ; 1f3
; 1f4

Function1f4::
	ldh a, [hROMBank] ; 1f4
	ld [$d155], a ; 1f6
	ldh a, [$ffd1] ; 1f9
	ldh [$ff43], a ; 1fb
	ldh a, [$ffd2] ; 1fd
	ldh [$ff42], a ; 1ff
	call Function23e ; 201
	jr c, Function20f ; 204
	call Function14bb ; 206
	call Function15d0 ; 209
	call Functionff80 ; 20c
	ldh a, [$ffc8] ; 20f
	or a ; 211
	jr z, Function219 ; 212
	ld c, a ; 214
	ld a, [$c700] ; 215
	ld [$ff00+c], a ; 218
	xor a ; 219
	ld [$ceea], a ; 21a
	ldh a, [$ff0f] ; 21d
	ld b, a ; 21f
	xor a ; 220
	ldh [$ff0f], a ; 221
	ld a, $2 ; 223
	ldh [$ffff], a ; 225
	ld a, b ; 227
	and $8 ; 228
	or $2 ; 22a
	ldh [$ff0f], a ; 22c
	ei ; 22e
	ld a, $3a ; 22f
	rst Bankswitch ; 231
	call Function405c ; 232
	ld a, [$d155] ; 235
	rst Bankswitch ; 238
	ld a, $1f ; 239
	ldh [$ffff], a ; 23b
	ret ; 23d
; 23e

Function23e::
	ldh a, [$ffe8] ; 23e
	and a ; 240
	jp nz, Functionbe3 ; 241
	ld a, [$cf43] ; 244
	ldh [$ff47], a ; 247
	ld a, [$cf44] ; 249
	ldh [$ff48], a ; 24c
	ld a, [$cf45] ; 24e
	ldh [$ff49], a ; 251
	and a ; 253
	ret ; 254
; 255

Function255::
	ldh a, [hROMBank] ; 255
	ld [$d155], a ; 257
	call Function14bb ; 25a
	call Function15d0 ; 25d
	call Functionff80 ; 260
	call Function8e6 ; 263
	xor a ; 266
	ld [$ceea], a ; 267
	call Function1ebf ; 26a
	ld a, $3a ; 26d
	rst Bankswitch ; 26f
	call Function405c ; 270
	ld a, [$d155] ; 273
	rst Bankswitch ; 276
	ret ; 277
; 278

Function278::
	ldh a, [hROMBank] ; 278
	ld [$d155], a ; 27a
	ldh a, [$ffd1] ; 27d
	ldh [$ff43], a ; 27f
	call Functionbdf ; 281
	jr c, Function28c ; 284
	call Function14bb ; 286
	call Function15d0 ; 289
	xor a ; 28c
	ld [$ceea], a ; 28d
	call Function8e6 ; 290
	xor a ; 293
	ldh [$ff0f], a ; 294
	ld a, $2 ; 296
	ldh [$ffff], a ; 298
	ldh [$ff0f], a ; 29a
	ei ; 29c
	ld a, $3a ; 29d
	rst Bankswitch ; 29f
	call Function405c ; 2a0
	ld a, [$d155] ; 2a3
	rst Bankswitch ; 2a6
	di ; 2a7
	xor a ; 2a8
	ldh [$ff0f], a ; 2a9
	ld a, $1f ; 2ab
	ldh [$ffff], a ; 2ad
	ret ; 2af
; 2b0

Function2b0::
	ldh a, [hROMBank] ; 2b0
	ld [$d155], a ; 2b2
	ld a, $3a ; 2b5
	rst Bankswitch ; 2b7
	call Function405c ; 2b8
	ld a, [$d155] ; 2bb
	rst Bankswitch ; 2be
	xor a ; 2bf
	ld [$ceea], a ; 2c0
	ret ; 2c3
; 2c4

Function2c4::
	ldh a, [$ff9d] ; 2c4
	inc a ; 2c6
	ldh [$ff9d], a ; 2c7
	ldh a, [rDIV] ; 2c9
	ld b, a ; 2cb
	ldh a, [hRandomAdd] ; 2cc
	adc b ; 2ce
	ldh [hRandomAdd], a ; 2cf
	ldh a, [rDIV] ; 2d1
	ld b, a ; 2d3
	ldh a, [$ffe4] ; 2d4
	sbc b ; 2d6
	ldh [$ffe4], a ; 2d7
	call Function8e6 ; 2d9
	ldh a, [hROMBank] ; 2dc
	ld [$d155], a ; 2de
	ldh a, [$ffd1] ; 2e1
	ldh [$ff43], a ; 2e3
	ldh a, [$ffd2] ; 2e5
	ldh [$ff42], a ; 2e7
	ldh a, [$ffd4] ; 2e9
	ldh [$ff4a], a ; 2eb
	ldh a, [$ffd3] ; 2ed
	ldh [$ff4b], a ; 2ef
	call Function14bb ; 2f1
	call Function1458 ; 2f4
	call Function15d0 ; 2f7
	call Function1579 ; 2fa
	call Function162b ; 2fd
	call Functionff80 ; 300
	xor a ; 303
	ld [$ceea], a ; 304
	ld a, [$cee9] ; 307
	and a ; 30a
	jr z, Function311 ; 30b
	dec a ; 30d
	ld [$cee9], a ; 30e
	xor a ; 311
	ldh [$ff0f], a ; 312
	ld a, $2 ; 314
	ldh [$ffff], a ; 316
	ldh [$ff0f], a ; 318
	ei ; 31a
	ld a, $3a ; 31b
	rst Bankswitch ; 31d
	call Function405c ; 31e
	ld a, [$d155] ; 321
	rst Bankswitch ; 324
	di ; 325
	xor a ; 326
	ldh [$ff0f], a ; 327
	ld a, $1f ; 329
	ldh [$ffff], a ; 32b
	ret ; 32d
; 32e

Function32e::
	ld a, $1 ; 32e
	ld [$ceea], a ; 330
	halt ; 333
	nop ; 334
	ld a, [$ceea] ; 335
	and a ; 338
	jr nz, Function333 ; 339
	ret ; 33b
; 33c

Function33c::
	call Function32e ; 33c
	dec c ; 33f
	jr nz, Function33c ; 340
	ret ; 342
; 343

Function343::
	ld a, [$c1cd] ; 343
	cp $0 ; 346
	ret z ; 348
	call Function467 ; 349
	ld a, [$cfe5] ; 34c
	bit 0, a ; 34f
	ret z ; 351
	ld hl, $4366 ; 352
	ld a, $23 ; 355
	rst FarCall ; 357
	ret ; 358
; 359

Function359::
	ld hl, $4397 ; 359
	ld a, $23 ; 35c
	rst FarCall ; 35e
	ret ; 35f
; 360

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
	call Function33c ; 3a9
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
	call Function33c ; 3e3
	pop de ; 3e6
	dec b ; 3e7
	jr nz, Function3d5 ; 3e8
	ret ; 3ea
; 3eb

Function3eb::
	rst $38 ; 3eb
	rst $38 ; 3ec
	rst $38 ; 3ed
	cp $fe ; 3ee
	cp $f9 ; 3f0
	ld sp, hl ; 3f2
	ld sp, hl ; 3f3
	- ; 3f4
	- ; 3f5
	- ; 3f6
	- ; 3f7
	- ; 3f8
	- ; 3f9
	sub b ; 3fa
	sub b ; 3fb
	sub b ; 3fc
	ld b, b ; 3fd
	ld b, b ; 3fe
	ld b, b ; 3ff
	nop ; 400
	nop ; 401
	nop ; 402
	rst $38 ; 403
	rst $38 ; 404
	rst $38 ; 405
	cp $fe ; 406
	ld hl, [sp+$f9] ; 408
	- ; 40a
	- ; 40b
	- ; 40c
	ret nc ; 40d
	ldh [$ffe4], a ; 40e
	ret nc ; 410
	ldh [$ff90], a ; 411
	add b ; 413
	sub b ; 414
	ld b, b ; 415
	ld b, b ; 416
	ld b, b ; 417
	nop ; 418
	nop ; 419
	nop ; 41a
	push af ; 41b
	ldh a, [$ffc8] ; 41c
	and a ; 41e
	jr z, Function430 ; 41f
	push hl ; 421
	ldh a, [$ff44] ; 422
	ld l, a ; 424
	ld h, $c7 ; 425
	ld h, [hl] ; 427
	ldh a, [$ffc8] ; 428
	ld l, a ; 42a
	ld a, h ; 42b
	ld h, $ff ; 42c
	ld [hl], a ; 42e
	pop hl ; 42f
	pop af ; 430
	reti ; 431
; 432

Function432::
	ldh a, [$ff40] ; 432
	bit 7, a ; 434
	ret z ; 436
	xor a ; 437
	ldh [$ff0f], a ; 438
	ldh a, [$ffff] ; 43a
	ld b, a ; 43c
	res 0, a ; 43d
	ldh [$ffff], a ; 43f
	ldh a, [$ff44] ; 441
	cp $91 ; 443
	jr nz, Function441 ; 445
	ldh a, [$ff40] ; 447
	and $7f ; 449
	ldh [$ff40], a ; 44b
	xor a ; 44d
	ldh [$ff0f], a ; 44e
	ld a, b ; 450
	ldh [$ffff], a ; 451
	ret ; 453
; 454

Function454::
	ldh a, [$ff40] ; 454
	set 7, a ; 456
	ldh [$ff40], a ; 458
	ret ; 45a
; 45b

Function45b::
	reti ; 45b
	ld a, $0 ; 45c
	ld [MBC3LatchClock], a ; 45e
	ld a, $1 ; 461
	ld [MBC3LatchClock], a ; 463
	ret ; 466
; 467

Function467::
	call Function477 ; 467
	call Function4a8 ; 46a
	call Function4de ; 46d
	ld a, $5 ; 470
	ld hl, $4032 ; 472
	rst FarCall ; 475
	ret ; 476
; 477

Function477::
	ld a, $a ; 477
	ld [MBC3SRamEnable], a ; 479
	call Function45c ; 47c
	ld hl, $4000 ; 47f
	ld de, $a000 ; 482
	ld [hl], $8 ; 485
	ld a, [de] ; 487
	and $3f ; 488
	ldh [$ff93], a ; 48a
	ld [hl], $9 ; 48c
	ld a, [de] ; 48e
	and $3f ; 48f
	ldh [$ff92], a ; 491
	ld [hl], $a ; 493
	ld a, [de] ; 495
	and $1f ; 496
	ldh [$ff91], a ; 498
	ld [hl], $b ; 49a
	ld a, [de] ; 49c
	ldh [$ff90], a ; 49d
	ld [hl], $c ; 49f
	ld a, [de] ; 4a1
	ldh [$ff8f], a ; 4a2
	call CloseSRAM ; 4a4
	ret ; 4a7
; 4a8

Function4a8::
	ldh a, [$ff8f] ; 4a8
	bit 0, a ; 4aa
	jr z, Function4c4 ; 4ac
	res 0, a ; 4ae
	ldh [$ff8f], a ; 4b0
	ldh a, [$ff90] ; 4b2
	sub a, $8c ; 4b4
	jr nc, Function4b4 ; 4b6
	sub a, $8c ; 4b8
	jr nc, Function4b8 ; 4ba
	add a, $8c ; 4bc
	ldh [$ff90], a ; 4be
	ld a, $40 ; 4c0
	jr Function4d4 ; 4c2
; 4c4

Function4c4::
	ldh a, [$ff90] ; 4c4
	cp $8c ; 4c6
	jr c, Function4db ; 4c8
	sub a, $8c ; 4ca
	jr nc, Function4ca ; 4cc
	add a, $8c ; 4ce
	ldh [$ff90], a ; 4d0
	ld a, $20 ; 4d2
	push af ; 4d4
	call Function552 ; 4d5
	pop af ; 4d8
	scf ; 4d9
	ret ; 4da
; 4db

Function4db::
	ccf ; 4db
	xor a ; 4dc
	ret ; 4dd
; 4de

Function4de::
	ldh a, [$ff93] ; 4de
	ld c, a ; 4e0
	ld a, [$d1df] ; 4e1
	add c ; 4e4
	sub a, $3c ; 4e5
	jr nc, Function4eb ; 4e7
	add a, $3c ; 4e9
	ldh [$ff9a], a ; 4eb
	ccf ; 4ed
	ldh a, [$ff92] ; 4ee
	ld c, a ; 4f0
	ld a, [$d1de] ; 4f1
	adc c ; 4f4
	sub a, $3c ; 4f5
	jr nc, Function4fb ; 4f7
	add a, $3c ; 4f9
	ldh [$ff98], a ; 4fb
	ccf ; 4fd
	ldh a, [$ff91] ; 4fe
	ld c, a ; 500
	ld a, [$d1dd] ; 501
	adc c ; 504
	sub a, $18 ; 505
	jr nc, Function50b ; 507
	add a, $18 ; 509
	ldh [$ff96], a ; 50b
	ccf ; 50d
	ldh a, [$ff90] ; 50e
	ld c, a ; 510
	ld a, [$d1dc] ; 511
	adc c ; 514
	ld [$d1f2], a ; 515
	ret ; 518
; 519

Function519::
	xor a ; 519
	ld [$cf7e], a ; 51a
	ld a, $0 ; 51d
	ld [$cf81], a ; 51f
	jr Function538 ; 522
; 524

Function524::
	call Function467 ; 524
	ldh a, [$ff96] ; 527
	ld [$cf7f], a ; 529
	ldh a, [$ff98] ; 52c
	ld [$cf80], a ; 52e
	ldh a, [$ff9a] ; 531
	ld [$cf81], a ; 533
	jr Function538 ; 536
; 538

Function538::
	ld a, $5 ; 538
	ld hl, $40ff ; 53a
	rst FarCall ; 53d
	ret ; 53e
; 53f

Function53f::
	call Function546 ; 53f
	call Function552 ; 542
	ret ; 545
; 546

Function546::
	xor a ; 546
	ldh [$ff93], a ; 547
	ldh [$ff92], a ; 549
	ldh [$ff91], a ; 54b
	ldh [$ff90], a ; 54d
	ldh [$ff8f], a ; 54f
	ret ; 551
; 552

Function552::
	ld a, $a ; 552
	ld [MBC3SRamEnable], a ; 554
	call Function45c ; 557
	ld hl, $4000 ; 55a
	ld de, $a000 ; 55d
	ld [hl], $c ; 560
	ld a, [de] ; 562
	bit 6, a ; 563
	ld [de], a ; 565
	ld [hl], $8 ; 566
	ldh a, [$ff93] ; 568
	ld [de], a ; 56a
	ld [hl], $9 ; 56b
	ldh a, [$ff92] ; 56d
	ld [de], a ; 56f
	ld [hl], $a ; 570
	ldh a, [$ff91] ; 572
	ld [de], a ; 574
	ld [hl], $b ; 575
	ldh a, [$ff90] ; 577
	ld [de], a ; 579
	ld [hl], $c ; 57a
	ldh a, [$ff8f] ; 57c
	res 6, a ; 57e
	ld [de], a ; 580
	call CloseSRAM ; 581
	ret ; 584
; 585

Function585::
	xor a ; 585
	push af ; 586
	ld a, $0 ; 587
	call OpenSRAM ; 589
	pop af ; 58c
	ld [$ac60], a ; 58d
	call CloseSRAM ; 590
	ret ; 593
; 594

Function594::
	ld hl, $ac60 ; 594
	push af ; 597
	ld a, $0 ; 598
	call OpenSRAM ; 59a
	pop af ; 59d
	or [hl] ; 59e
	ld [hl], a ; 59f
	call CloseSRAM ; 5a0
	ret ; 5a3
; 5a4

Function5a4::
	ld a, $0 ; 5a4
	call OpenSRAM ; 5a6
	ld a, [$ac60] ; 5a9
	call CloseSRAM ; 5ac
	ret ; 5af
; 5b0

Function5b0::
	call Function3d4f ; 5b0
	xor a ; 5b3
	ldh [$ffe0], a ; 5b4
	call Function3564 ; 5b6
	ei ; 5b9
	ld hl, $d8ba ; 5ba
	set 7, [hl] ; 5bd
	ld c, $20 ; 5bf
	call Function33c ; 5c1
	jr Function5d1 ; 5c4
; 5c6

Function5c6::
	cp $11 ; 5c6
	jr z, Function5cd ; 5c8
	xor a ; 5ca
	jr Function5cf ; 5cb
; 5cd

Function5cd::
	ld a, $1 ; 5cd
	ldh [$ffe8], a ; 5cf
	di ; 5d1
	xor a ; 5d2
	ldh [$ff0f], a ; 5d3
	ldh [$ffff], a ; 5d5
	ldh [$ff56], a ; 5d7
	ldh [$ff43], a ; 5d9
	ldh [$ff42], a ; 5db
	ldh [$ff01], a ; 5dd
	ldh [$ff02], a ; 5df
	ldh [$ff4b], a ; 5e1
	ldh [$ff4a], a ; 5e3
	ldh [$ff47], a ; 5e5
	ldh [$ff48], a ; 5e7
	ldh [$ff49], a ; 5e9
	ldh [$ff06], a ; 5eb
	ldh [$ff07], a ; 5ed
	ld [$ceeb], a ; 5ef
	ld a, $4 ; 5f2
	ldh [$ff07], a ; 5f4
	ldh a, [$ff44] ; 5f6
	cp $91 ; 5f8
	jr nz, Function5f6 ; 5fa
	xor a ; 5fc
	ldh [$ff40], a ; 5fd
	ld hl, $c000 ; 5ff
	ld bc, $2000 ; 602
	ld [hl], $0 ; 605
	inc hl ; 607
	dec bc ; 608
	ld a, b ; 609
	or c ; 60a
	jr nz, Function605 ; 60b
	ld sp, $dfff ; 60d
	call Function68e ; 610
	ldh a, [$ffe8] ; 613
	push af ; 615
	xor a ; 616
	ld hl, $ff80 ; 617
	ld bc, $7f ; 61a
	call Function314c ; 61d
	pop af ; 620
	ldh [$ffe8], a ; 621
	call Function30ff ; 623
	ld a, $1 ; 626
	rst Bankswitch ; 628
	call Function4032 ; 629
	xor a ; 62c
	ldh [$ffe0], a ; 62d
	ldh [$ffd1], a ; 62f
	ldh [$ffd2], a ; 631
	ldh [$ff00], a ; 633
	ld a, $8 ; 635
	ldh [$ff41], a ; 637
	ld a, $90 ; 639
	ldh [$ffd4], a ; 63b
	ldh [$ff4a], a ; 63d
	ld a, $7 ; 63f
	ldh [$ffd3], a ; 641
	ldh [$ff4b], a ; 643
	ld a, $ff ; 645
	ldh [$ffcd], a ; 647
	ld h, $98 ; 649
	call Function699 ; 64b
	ld h, $9c ; 64e
	call Function699 ; 650
	ld hl, $5cfd ; 653
	ld a, $2 ; 656
	rst FarCall ; 658
	ld a, $9c ; 659
	ldh [$ffd9], a ; 65b
	xor a ; 65d
	ldh [$ffd8], a ; 65e
	ld a, $5 ; 660
	ld hl, $4089 ; 662
	rst FarCall ; 665
	ld a, $a ; 666
	ld [MBC3SRamEnable], a ; 668
	ld a, $0 ; 66b
	ld [MBC3LatchClock], a ; 66d
	ld [MBC3SRamEnable], a ; 670
	ld a, $e3 ; 673
	ldh [$ff40], a ; 675
	ld a, $1f ; 677
	ldh [$ffff], a ; 679
	ei ; 67b
	call Function32e ; 67c
	ld a, $30 ; 67f
	call Function2e49 ; 681
	call Function3d4f ; 684
	xor a ; 687
	ld [$c1c0], a ; 688
	jp Function6545 ; 68b
; 68e

Function68e::
	ld hl, $8000 ; 68e
	ld bc, $2000 ; 691
	xor a ; 694
	call Function314c ; 695
	ret ; 698
; 699

Function699::
	ld a, $7f ; 699
	jr Function69e ; 69b
; 69d

Function69d::
	ld a, l ; 69d
	ld de, $400 ; 69e
	ld l, e ; 6a1
	ld [hli], a ; 6a2
	dec e ; 6a3
	jr nz, Function6a2 ; 6a4
	dec d ; 6a6
	jr nz, Function6a2 ; 6a7
	ret ; 6a9
; 6aa

Function6aa::
	push af ; 6aa
	push bc ; 6ab
	push de ; 6ac
	push hl ; 6ad
	ld a, [$c1d3] ; 6ae
	bit 0, a ; 6b1
	jr nz, Function6d2 ; 6b3
	ldh a, [$ffcd] ; 6b5
	inc a ; 6b7
	jr z, Function6d7 ; 6b8
	ldh a, [$ff01] ; 6ba
	ldh [$ffd0], a ; 6bc
	ldh a, [$ffcf] ; 6be
	ldh [$ff01], a ; 6c0
	ldh a, [$ffcd] ; 6c2
	cp $2 ; 6c4
	jr z, Function703 ; 6c6
	ld a, $0 ; 6c8
	ldh [$ff02], a ; 6ca
	ld a, $80 ; 6cc
	ldh [$ff02], a ; 6ce
	jr Function703 ; 6d0
; 6d2

Function6d2::
	call Function1eb3 ; 6d2
	jr Function70b ; 6d5
; 6d7

Function6d7::
	ldh a, [$ff01] ; 6d7
	cp $1 ; 6d9
	jr z, Function6e1 ; 6db
	cp $2 ; 6dd
	jr nz, Function703 ; 6df
	ldh [$ffd0], a ; 6e1
	ldh [$ffcd], a ; 6e3
	cp $2 ; 6e5
	jr z, Function700 ; 6e7
	xor a ; 6e9
	ldh [$ff01], a ; 6ea
	ld a, $3 ; 6ec
	ldh [rDIV], a ; 6ee
	ldh a, [rDIV] ; 6f0
	bit 7, a ; 6f2
	jr nz, Function6f0 ; 6f4
	ld a, $0 ; 6f6
	ldh [$ff02], a ; 6f8
	ld a, $80 ; 6fa
	ldh [$ff02], a ; 6fc
	jr Function703 ; 6fe
; 700

Function700::
	xor a ; 700
	ldh [$ff01], a ; 701
	ld a, $1 ; 703
	ldh [$ffcc], a ; 705
	ld a, $fe ; 707
	ldh [$ffcf], a ; 709
	pop hl ; 70b
	pop de ; 70c
	pop bc ; 70d
	pop af ; 70e
	reti ; 70f
; 710

Function710::
	ld a, $1 ; 710
	ldh [$ffce], a ; 712
	ld a, [hl] ; 714
	ldh [$ffcf], a ; 715
	call Function73b ; 717
	push bc ; 71a
	ld b, a ; 71b
	inc hl ; 71c
	ld a, $30 ; 71d
	dec a ; 71f
	jr nz, Function71f ; 720
	ldh a, [$ffce] ; 722
	and a ; 724
	ld a, b ; 725
	pop bc ; 726
	jr z, Function733 ; 727
	dec hl ; 729
	cp $fd ; 72a
	jr nz, Function714 ; 72c
	xor a ; 72e
	ldh [$ffce], a ; 72f
	jr Function714 ; 731
; 733

Function733::
	ld [de], a ; 733
	inc de ; 734
	dec bc ; 735
	ld a, b ; 736
	or c ; 737
	jr nz, Function714 ; 738
	ret ; 73a
; 73b

Function73b::
	xor a ; 73b
	ldh [$ffcc], a ; 73c
	ldh a, [$ffcd] ; 73e
	cp $2 ; 740
	jr nz, Function74c ; 742
	ld a, $1 ; 744
	ldh [$ff02], a ; 746
	ld a, $81 ; 748
	ldh [$ff02], a ; 74a
	ldh a, [$ffcc] ; 74c
	and a ; 74e
	jr nz, Function796 ; 74f
	ldh a, [$ffcd] ; 751
	cp $1 ; 753
	jr nz, Function771 ; 755
	call Function7dc ; 757
	jr z, Function771 ; 75a
	call Function7d6 ; 75c
	push hl ; 75f
	ld hl, $ce5c ; 760
	inc [hl] ; 763
	jr nz, Function768 ; 764
	dec hl ; 766
	inc [hl] ; 767
	pop hl ; 768
	call Function7dc ; 769
	jr nz, Function74c ; 76c
	jp Function7e4 ; 76e
; 771

Function771::
	ldh a, [$ffff] ; 771
	and $f ; 773
	cp $8 ; 775
	jr nz, Function74c ; 777
	ld a, [$ce5d] ; 779
	dec a ; 77c
	ld [$ce5d], a ; 77d
	jr nz, Function74c ; 780
	ld a, [$ce5e] ; 782
	dec a ; 785
	ld [$ce5e], a ; 786
	jr nz, Function74c ; 789
	ldh a, [$ffcd] ; 78b
	cp $1 ; 78d
	jr z, Function796 ; 78f
	ld a, $ff ; 791
	dec a ; 793
	jr nz, Function793 ; 794
	xor a ; 796
	ldh [$ffcc], a ; 797
	ldh a, [$ffff] ; 799
	and $f ; 79b
	sub a, $8 ; 79d
	jr nz, Function7a9 ; 79f
	ld [$ce5d], a ; 7a1
	ld a, $50 ; 7a4
	ld [$ce5e], a ; 7a6
	ldh a, [$ffd0] ; 7a9
	cp $fe ; 7ab
	ret nz ; 7ad
	call Function7dc ; 7ae
	jr z, Function7c4 ; 7b1
	push hl ; 7b3
	ld hl, $ce5c ; 7b4
	ld a, [hl] ; 7b7
	dec a ; 7b8
	ld [hld], a ; 7b9
	inc a ; 7ba
	jr nz, Function7be ; 7bb
	dec [hl] ; 7bd
	pop hl ; 7be
	call Function7dc ; 7bf
	jr z, Function7e4 ; 7c2
	ldh a, [$ffff] ; 7c4
	and $f ; 7c6
	cp $8 ; 7c8
	ld a, $fe ; 7ca
	ret z ; 7cc
	ld a, [hl] ; 7cd
	ldh [$ffcf], a ; 7ce
	call Function32e ; 7d0
	jp Function73b ; 7d3
; 7d6

Function7d6::
	ld a, $f ; 7d6
	dec a ; 7d8
	jr nz, Function7d8 ; 7d9
	ret ; 7db
; 7dc

Function7dc::
	push hl ; 7dc
	ld hl, $ce5b ; 7dd
	ld a, [hli] ; 7e0
	or [hl] ; 7e1
	pop hl ; 7e2
	ret ; 7e3
; 7e4

Function7e4::
	dec a ; 7e4
	ld [$ce5b], a ; 7e5
	ld [$ce5c], a ; 7e8
	ret ; 7eb
; 7ec

Function7ec::
	ld hl, $ce56 ; 7ec
	ld de, $ce51 ; 7ef
	ld c, $2 ; 7f2
	ld a, $1 ; 7f4
	ldh [$ffce], a ; 7f6
	call Function32e ; 7f8
	ld a, [hl] ; 7fb
	ldh [$ffcf], a ; 7fc
	call Function73b ; 7fe
	ld b, a ; 801
	inc hl ; 802
	ldh a, [$ffce] ; 803
	and a ; 805
	ld a, $0 ; 806
	ldh [$ffce], a ; 808
	jr nz, Function7f8 ; 80a
	ld a, b ; 80c
	ld [de], a ; 80d
	inc de ; 80e
	dec c ; 80f
	jr nz, Function7f8 ; 810
	ret ; 812
; 813

Function813::
	call Function3158 ; 813
	ld hl, $4000 ; 816
	ld a, $1 ; 819
	rst FarCall ; 81b
	call Function82e ; 81c
	jp Function3164 ; 81f
; 822

Function822::
	call Function3158 ; 822
	ld hl, $4000 ; 825
	ld a, $1 ; 828
	rst FarCall ; 82a
	jp Function82e ; 82b
; 82e

Function82e::
	ld a, $ff ; 82e
	ld [$ce52], a ; 830
	call Function872 ; 833
	call Function32e ; 836
	call Function7dc ; 839
	jr z, Function84f ; 83c
	push hl ; 83e
	ld hl, $ce5c ; 83f
	dec [hl] ; 842
	jr nz, Function84e ; 843
	dec hl ; 845
	dec [hl] ; 846
	jr nz, Function84e ; 847
	pop hl ; 849
	xor a ; 84a
	jp Function7e4 ; 84b
; 84e

Function84e::
	pop hl ; 84e
	ld a, [$ce52] ; 84f
	inc a ; 852
	jr z, Function833 ; 853
	ld b, $a ; 855
	call Function32e ; 857
	call Function872 ; 85a
	dec b ; 85d
	jr nz, Function857 ; 85e
	ld b, $a ; 860
	call Function32e ; 862
	call Function8b9 ; 865
	dec b ; 868
	jr nz, Function862 ; 869
	ld a, [$ce52] ; 86b
	ld [$ce51], a ; 86e
	ret ; 871
; 872

Function872::
	push bc ; 872
	ld b, $60 ; 873
	ld a, [$d042] ; 875
	cp $1 ; 878
	jr z, Function888 ; 87a
	ld b, $60 ; 87c
	jr c, Function888 ; 87e
	cp $2 ; 880
	ld b, $70 ; 882
	jr z, Function888 ; 884
	ld b, $80 ; 886
	call Function8a4 ; 888
	ld a, [$ce56] ; 88b
	add b ; 88e
	ldh [$ffcf], a ; 88f
	ldh a, [$ffcd] ; 891
	cp $2 ; 893
	jr nz, Function89f ; 895
	ld a, $1 ; 897
	ldh [$ff02], a ; 899
	ld a, $81 ; 89b
	ldh [$ff02], a ; 89d
	call Function8a4 ; 89f
	pop bc ; 8a2
	ret ; 8a3
; 8a4

Function8a4::
	ldh a, [$ffd0] ; 8a4
	ld [$ce51], a ; 8a6
	and $f0 ; 8a9
	cp b ; 8ab
	ret nz ; 8ac
	xor a ; 8ad
	ldh [$ffd0], a ; 8ae
	ld a, [$ce51] ; 8b0
	and $f ; 8b3
	ld [$ce52], a ; 8b5
	ret ; 8b8
; 8b9

Function8b9::
	xor a ; 8b9
	ldh [$ffcf], a ; 8ba
	ldh a, [$ffcd] ; 8bc
	cp $2 ; 8be
	ret nz ; 8c0
	ld a, $1 ; 8c1
	ldh [$ff02], a ; 8c3
	ld a, $81 ; 8c5
	ldh [$ff02], a ; 8c7
	ret ; 8c9
; 8ca

Function8ca::
	ld a, [$d042] ; 8ca
	and a ; 8cd
	ret nz ; 8ce
	ld a, $2 ; 8cf
	ldh [$ff01], a ; 8d1
	xor a ; 8d3
	ldh [$ffd0], a ; 8d4
	ld a, $0 ; 8d6
	ldh [$ff02], a ; 8d8
	ld a, $80 ; 8da
	ldh [$ff02], a ; 8dc
	ret ; 8de
; 8df

Function8df::
	reti ; 8df
	xor a ; 8e0
	ldh [$ffa9], a ; 8e1
	ldh [$ffaa], a ; 8e3
	ret ; 8e5
; 8e6

Function8e6::
	ld a, [$d8ba] ; 8e6
	and $d0 ; 8e9
	ret nz ; 8eb
	ld a, [$c1cc] ; 8ec
	and a ; 8ef
	ret nz ; 8f0
	ld a, $20 ; 8f1
	ldh [$ff00], a ; 8f3
	ldh a, [$ff00] ; 8f5
	ldh a, [$ff00] ; 8f7
	cpl ; 8f9
	and $f ; 8fa
	swap a ; 8fc
	ld b, a ; 8fe
	ld a, $10 ; 8ff
	ldh [$ff00], a ; 901
	ldh a, [$ff00] ; 903
	ldh a, [$ff00] ; 905
	ldh a, [$ff00] ; 907
	ldh a, [$ff00] ; 909
	ldh a, [$ff00] ; 90b
	ldh a, [$ff00] ; 90d
	cpl ; 90f
	and $f ; 910
	or b ; 912
	ld b, a ; 913
	ld a, $30 ; 914
	ldh [$ff00], a ; 916
	ldh a, [$ffa6] ; 918
	ld e, a ; 91a
	xor b ; 91b
	ld d, a ; 91c
	and e ; 91d
	ldh [$ffa4], a ; 91e
	ld a, d ; 920
	and b ; 921
	ldh [$ffa5], a ; 922
	ld c, a ; 924
	ldh a, [$ffa7] ; 925
	or c ; 927
	ldh [$ffa7], a ; 928
	ld a, b ; 92a
	ldh [$ffa6], a ; 92b
	and $f ; 92d
	cp $f ; 92f
	jp z, Function5b0 ; 931
	ret ; 934
; 935

Function935::
	push af ; 935
	push hl ; 936
	push de ; 937
	push bc ; 938
	ld a, [$c1c6] ; 939
	cp $ff ; 93c
	jr z, Function958 ; 93e
	ldh a, [$ffa6] ; 940
	ld b, a ; 942
	ldh a, [$ffaa] ; 943
	ld e, a ; 945
	xor b ; 946
	ld d, a ; 947
	and e ; 948
	ldh [$ffa8], a ; 949
	ld a, d ; 94b
	and b ; 94c
	ldh [$ffa9], a ; 94d
	ld c, a ; 94f
	ld a, b ; 950
	ldh [$ffaa], a ; 951
	pop bc ; 953
	pop de ; 954
	pop hl ; 955
	pop af ; 956
	ret ; 957
; 958

Function958::
	ldh a, [hROMBank] ; 958
	push af ; 95a
	ld a, [$c1c9] ; 95b
	rst Bankswitch ; 95e
	ld hl, $c1c7 ; 95f
	ld a, [hli] ; 962
	ld h, [hl] ; 963
	ld l, a ; 964
	ld a, [$c1ca] ; 965
	and a ; 968
	jr z, Function973 ; 969
	dec a ; 96b
	ld [$c1ca], a ; 96c
	pop af ; 96f
	rst Bankswitch ; 970
	jr Function953 ; 971
; 973

Function973::
	ld a, [hli] ; 973
	cp $ff ; 974
	jr z, Function991 ; 976
	ld b, a ; 978
	ld a, [hli] ; 979
	ld [$c1ca], a ; 97a
	cp $ff ; 97d
	jr nz, Function987 ; 97f
	dec hl ; 981
	dec hl ; 982
	ld b, $0 ; 983
	jr Function996 ; 985
; 987

Function987::
	ld a, l ; 987
	ld [$c1c7], a ; 988
	ld a, h ; 98b
	ld [$c1c8], a ; 98c
	jr Function996 ; 98f
; 991

Function991::
	call Function9bb ; 991
	ld b, $0 ; 994
	pop af ; 996
	rst Bankswitch ; 997
	ld a, b ; 998
	ldh [$ffa9], a ; 999
	ldh [$ffaa], a ; 99b
	jr Function953 ; 99d
; 99f

Function99f::
	ld [$c1c9], a ; 99f
	ld a, l ; 9a2
	ld [$c1c7], a ; 9a3
	ld a, h ; 9a6
	ld [$c1c8], a ; 9a7
	xor a ; 9aa
	ld [$c1ca], a ; 9ab
	xor a ; 9ae
	ldh [$ffa9], a ; 9af
	ldh [$ffa8], a ; 9b1
	ldh [$ffaa], a ; 9b3
	ld a, $ff ; 9b5
	ld [$c1c6], a ; 9b7
	ret ; 9ba
; 9bb

Function9bb::
	xor a ; 9bb
	ld [$c1c9], a ; 9bc
	ld [$c1c7], a ; 9bf
	ld [$c1c8], a ; 9c2
	ld [$c1ca], a ; 9c5
	ld [$c1c6], a ; 9c8
	ret ; 9cb
; 9cc

Function9cc::
	call Function32e ; 9cc
	push bc ; 9cf
	call Functiona08 ; 9d0
	pop bc ; 9d3
	ldh a, [$ffaa] ; 9d4
	cp $46 ; 9d6
	jr z, Function9e5 ; 9d8
	ldh a, [$ffab] ; 9da
	and $9 ; 9dc
	jr nz, Function9e5 ; 9de
	dec c ; 9e0
	jr nz, Function9cc ; 9e1
	and a ; 9e3
	ret ; 9e4
; 9e5

Function9e5::
	scf ; 9e5
	ret ; 9e6
; 9e7

Function9e7::
	call Function32e ; 9e7
	call Function935 ; 9ea
	ldh a, [$ffa9] ; 9ed
	and $3 ; 9ef
	ret nz ; 9f1
	call Function343 ; 9f2
	jr Function9e7 ; 9f5
; 9f7

Function9f7::
	ldh a, [$ffda] ; 9f7
	push af ; 9f9
	ld a, $1 ; 9fa
	ldh [$ffda], a ; 9fc
	call WaitBGMap ; 9fe
	call Function9e7 ; a01
	pop af ; a04
	ldh [$ffda], a ; a05
	ret ; a07
; a08

Functiona08::
	call Function935 ; a08
	ldh a, [$ffac] ; a0b
	and a ; a0d
	ldh a, [$ffa9] ; a0e
	jr z, Functiona14 ; a10
	ldh a, [$ffaa] ; a12
	ldh [$ffab], a ; a14
	ldh a, [$ffa9] ; a16
	and a ; a18
	jr z, Functiona21 ; a19
	ld a, $f ; a1b
	ld [$cee9], a ; a1d
	ret ; a20
; a21

Functiona21::
	ld a, [$cee9] ; a21
	and a ; a24
	jr z, Functiona2b ; a25
	xor a ; a27
	ldh [$ffab], a ; a28
	ret ; a2a
; a2b

Functiona2b::
	ld a, $5 ; a2b
	ld [$cee9], a ; a2d
	ret ; a30
; a31

Functiona31::
	ldh a, [$ffb1] ; a31
	push af ; a33
	ldh a, [$ffb2] ; a34
	push af ; a36
	xor a ; a37
	ldh [$ffb1], a ; a38
	ld a, $6 ; a3a
	ldh [$ffb2], a ; a3c
	push hl ; a3e
	ld hl, $c506 ; a3f
	call Functionab6 ; a42
	pop hl ; a45
	call Functiona08 ; a46
	ldh a, [$ffab] ; a49
	and $3 ; a4b
	jr z, Functiona3e ; a4d
	pop af ; a4f
	ldh [$ffb2], a ; a50
	pop af ; a52
	ldh [$ffb1], a ; a53
	ret ; a55
; a56

Functiona56::
	call Functiona08 ; a56
	ldh a, [$ffab] ; a59
	and $3 ; a5b
	jr z, Functiona56 ; a5d
	ret ; a5f
; a60

Functiona60::
	ld a, [$d042] ; a60
	and a ; a63
	jr nz, Functiona72 ; a64
	call Functiona77 ; a66
	push de ; a69
	ld de, $8 ; a6a
	call Function3e24 ; a6d
	pop de ; a70
	ret ; a71
; a72

Functiona72::
	ld c, $41 ; a72
	jp Function33c ; a74
; a77

Functiona77::
	ldh a, [$ffda] ; a77
	push af ; a79
	ld a, $1 ; a7a
	ldh [$ffda], a ; a7c
	ld a, [$c1c6] ; a7e
	or a ; a81
	jr z, Functiona8a ; a82
	ld a, $70 ; a84
	ld hl, $4de9 ; a86
	rst FarCall ; a89
	call Functionaa6 ; a8a
	call Functiona08 ; a8d
	ldh a, [$ffa9] ; a90
	and $3 ; a92
	jr nz, Functionaa2 ; a94
	call Function343 ; a96
	ld a, $1 ; a99
	ldh [$ffd6], a ; a9b
	call Function32e ; a9d
	jr Functiona8a ; aa0
; aa2

Functionaa2::
	pop af ; aa2
	ldh [$ffda], a ; aa3
	ret ; aa5
; aa6

Functionaa6::
	ldh a, [$ff9d] ; aa6
	and $10 ; aa8
	jr z, Functionab0 ; aaa
	ld a, $ee ; aac
	jr Functionab2 ; aae
; ab0

Functionab0::
	ld a, $7a ; ab0
	ld [$c506], a ; ab2
	ret ; ab5
; ab6

Functionab6::
	push bc ; ab6
	ld a, [hl] ; ab7
	ld b, a ; ab8
	ld a, $ee ; ab9
	cp b ; abb
	pop bc ; abc
	jr nz, Functionad7 ; abd
	ldh a, [$ffb1] ; abf
	dec a ; ac1
	ldh [$ffb1], a ; ac2
	ret nz ; ac4
	ldh a, [$ffb2] ; ac5
	dec a ; ac7
	ldh [$ffb2], a ; ac8
	ret nz ; aca
	ld a, $7a ; acb
	ld [hl], a ; acd
	ld a, $ff ; ace
	ldh [$ffb1], a ; ad0
	ld a, $6 ; ad2
	ldh [$ffb2], a ; ad4
	ret ; ad6
; ad7

Functionad7::
	ldh a, [$ffb1] ; ad7
	and a ; ad9
	ret z ; ada
	dec a ; adb
	ldh [$ffb1], a ; adc
	ret nz ; ade
	dec a ; adf
	ldh [$ffb1], a ; ae0
	ldh a, [$ffb2] ; ae2
	dec a ; ae4
	ldh [$ffb2], a ; ae5
	ret nz ; ae7
	ld a, $6 ; ae8
	ldh [$ffb2], a ; aea
	ld a, $ee ; aec
	ld [hl], a ; aee
	ret ; aef
; af0

Functionaf0::
	ld [$c1c4], a ; af0
	ldh a, [hROMBank] ; af3
	push af ; af5
	ld a, [$c1c4] ; af6
	rst Bankswitch ; af9
	call Functionb00 ; afa
	pop af ; afd
	rst Bankswitch ; afe
	ret ; aff
; b00

Functionb00::
	ld a, e ; b00
	ld [$c1c2], a ; b01
	ld a, d ; b04
	ld [$c1c3], a ; b05
	ld a, [hl] ; b08
	cp $ff ; b09
	ret z ; b0b
	and $e0 ; b0c
	cp $e0 ; b0e
	jr nz, Functionb22 ; b10
	ld a, [hl] ; b12
	add a ; b13
	add a ; b14
	add a ; b15
	and $e0 ; b16
	push af ; b18
	ld a, [hli] ; b19
	and $3 ; b1a
	ld b, a ; b1c
	ld a, [hli] ; b1d
	ld c, a ; b1e
	inc bc ; b1f
	jr Functionb2a ; b20
; b22

Functionb22::
	push af ; b22
	ld a, [hli] ; b23
	and $1f ; b24
	ld c, a ; b26
	ld b, $0 ; b27
	inc c ; b29
	inc b ; b2a
	inc c ; b2b
	pop af ; b2c
	bit 7, a ; b2d
	jr nz, Functionb7b ; b2f
	cp $20 ; b31
	jr z, Functionb49 ; b33
	cp $40 ; b35
	jr z, Functionb55 ; b37
	cp $60 ; b39
	jr z, Functionb6f ; b3b
	dec c ; b3d
	jr nz, Functionb44 ; b3e
	dec b ; b40
	jp z, Functionb08 ; b41
	ld a, [hli] ; b44
	ld [de], a ; b45
	inc de ; b46
	jr Functionb3d ; b47
; b49

Functionb49::
	ld a, [hli] ; b49
	dec c ; b4a
	jr nz, Functionb51 ; b4b
	dec b ; b4d
	jp z, Functionb08 ; b4e
	ld [de], a ; b51
	inc de ; b52
	jr Functionb4a ; b53
; b55

Functionb55::
	dec c ; b55
	jr nz, Functionb5c ; b56
	dec b ; b58
	jp z, Functionb6b ; b59
	ld a, [hli] ; b5c
	ld [de], a ; b5d
	inc de ; b5e
	dec c ; b5f
	jr nz, Functionb66 ; b60
	dec b ; b62
	jp z, Functionb6c ; b63
	ld a, [hld] ; b66
	ld [de], a ; b67
	inc de ; b68
	jr Functionb55 ; b69
; b6b

Functionb6b::
	inc hl ; b6b
	inc hl ; b6c
	jr Functionb08 ; b6d
; b6f

Functionb6f::
	xor a ; b6f
	dec c ; b70
	jr nz, Functionb77 ; b71
	dec b ; b73
	jp z, Functionb08 ; b74
	ld [de], a ; b77
	inc de ; b78
	jr Functionb70 ; b79
; b7b

Functionb7b::
	push hl ; b7b
	push af ; b7c
	ld a, [hli] ; b7d
	bit 7, a ; b7e
	jr z, Functionb8d ; b80
	and $7f ; b82
	cpl ; b84
	add e ; b85
	ld l, a ; b86
	ld a, $ff ; b87
	adc d ; b89
	ld h, a ; b8a
	jr Functionb99 ; b8b
; b8d

Functionb8d::
	ld l, [hl] ; b8d
	ld h, a ; b8e
	ld a, [$c1c2] ; b8f
	add l ; b92
	ld l, a ; b93
	ld a, [$c1c3] ; b94
	adc h ; b97
	ld h, a ; b98
	pop af ; b99
	cp $80 ; b9a
	jr z, Functionba6 ; b9c
	cp $a0 ; b9e
	jr z, Functionbb1 ; ba0
	cp $c0 ; ba2
	jr z, Functionbc9 ; ba4
	dec c ; ba6
	jr nz, Functionbac ; ba7
	dec b ; ba9
	jr z, Functionbd5 ; baa
	ld a, [hli] ; bac
	ld [de], a ; bad
	inc de ; bae
	jr Functionba6 ; baf
; bb1

Functionbb1::
	dec c ; bb1
	jr nz, Functionbb8 ; bb2
	dec b ; bb4
	jp z, Functionbd5 ; bb5
	ld a, [hli] ; bb8
	push bc ; bb9
	ld bc, $8 ; bba
	rra ; bbd
	rl b ; bbe
	dec c ; bc0
	jr nz, Functionbbd ; bc1
	ld a, b ; bc3
	pop bc ; bc4
	ld [de], a ; bc5
	inc de ; bc6
	jr Functionbb1 ; bc7
; bc9

Functionbc9::
	dec c ; bc9
	jr nz, Functionbd0 ; bca
	dec b ; bcc
	jp z, Functionbd5 ; bcd
	ld a, [hld] ; bd0
	ld [de], a ; bd1
	inc de ; bd2
	jr Functionbc9 ; bd3
; bd5

Functionbd5::
	pop hl ; bd5
	bit 7, [hl] ; bd6
	jr nz, Functionbdb ; bd8
	inc hl ; bda
	inc hl ; bdb
	jp Functionb08 ; bdc
; bdf

Functionbdf::
	ldh a, [$ffe8] ; bdf
	and a ; be1
	ret z ; be2
	ldh a, [$ffe7] ; be3
	and a ; be5
	ret z ; be6
	ld hl, $c280 ; be7
	ld a, $80 ; bea
	ldh [$ff68], a ; bec
	ld c, $4 ; bee
	ld a, [hli] ; bf0
	ldh [$ff69], a ; bf1
	ld a, [hli] ; bf3
	ldh [$ff69], a ; bf4
	ld a, [hli] ; bf6
	ldh [$ff69], a ; bf7
	ld a, [hli] ; bf9
	ldh [$ff69], a ; bfa
	ld a, [hli] ; bfc
	ldh [$ff69], a ; bfd
	ld a, [hli] ; bff
	ldh [$ff69], a ; c00
	ld a, [hli] ; c02
	ldh [$ff69], a ; c03
	ld a, [hli] ; c05
	ldh [$ff69], a ; c06
	ld a, [hli] ; c08
	ldh [$ff69], a ; c09
	ld a, [hli] ; c0b
	ldh [$ff69], a ; c0c
	ld a, [hli] ; c0e
	ldh [$ff69], a ; c0f
	ld a, [hli] ; c11
	ldh [$ff69], a ; c12
	ld a, [hli] ; c14
	ldh [$ff69], a ; c15
	ld a, [hli] ; c17
	ldh [$ff69], a ; c18
	ld a, [hli] ; c1a
	ldh [$ff69], a ; c1b
	ld a, [hli] ; c1d
	ldh [$ff69], a ; c1e
	dec c ; c20
	jr nz, Functionbf0 ; c21
	ld a, $80 ; c23
	ldh [$ff6a], a ; c25
	ld c, $4 ; c27
	ld a, [hli] ; c29
	ldh [$ff6b], a ; c2a
	ld a, [hli] ; c2c
	ldh [$ff6b], a ; c2d
	ld a, [hli] ; c2f
	ldh [$ff6b], a ; c30
	ld a, [hli] ; c32
	ldh [$ff6b], a ; c33
	ld a, [hli] ; c35
	ldh [$ff6b], a ; c36
	ld a, [hli] ; c38
	ldh [$ff6b], a ; c39
	ld a, [hli] ; c3b
	ldh [$ff6b], a ; c3c
	ld a, [hli] ; c3e
	ldh [$ff6b], a ; c3f
	ld a, [hli] ; c41
	ldh [$ff6b], a ; c42
	ld a, [hli] ; c44
	ldh [$ff6b], a ; c45
	ld a, [hli] ; c47
	ldh [$ff6b], a ; c48
	ld a, [hli] ; c4a
	ldh [$ff6b], a ; c4b
	ld a, [hli] ; c4d
	ldh [$ff6b], a ; c4e
	ld a, [hli] ; c50
	ldh [$ff6b], a ; c51
	ld a, [hli] ; c53
	ldh [$ff6b], a ; c54
	ld a, [hli] ; c56
	ldh [$ff6b], a ; c57
	dec c ; c59
	jr nz, Functionc29 ; c5a
	xor a ; c5c
	ldh [$ffe7], a ; c5d
	scf ; c5f
	ret ; c60
; c61

Functionc61::
	ldh [$ff47], a ; c61
	push af ; c63
	ldh a, [$ffe8] ; c64
	and a ; c66
	jr z, Functionc81 ; c67
	push hl ; c69
	push de ; c6a
	push bc ; c6b
	ld hl, $c280 ; c6c
	ld de, $c200 ; c6f
	ldh a, [$ff47] ; c72
	ld b, a ; c74
	ld c, $8 ; c75
	call Functioncea ; c77
	ld a, $1 ; c7a
	ldh [$ffe7], a ; c7c
	pop bc ; c7e
	pop de ; c7f
	pop hl ; c80
	pop af ; c81
	ret ; c82
; c83

Functionc83::
	ld a, e ; c83
	ldh [$ff48], a ; c84
	ld a, d ; c86
	ldh [$ff49], a ; c87
	ldh a, [$ffe8] ; c89
	and a ; c8b
	ret z ; c8c
	push hl ; c8d
	push de ; c8e
	push bc ; c8f
	ld hl, $c2c0 ; c90
	ld de, $c240 ; c93
	ldh a, [$ff48] ; c96
	ld b, a ; c98
	ld c, $8 ; c99
	call Functioncea ; c9b
	ld a, $1 ; c9e
	ldh [$ffe7], a ; ca0
	pop bc ; ca2
	pop de ; ca3
	pop hl ; ca4
	ret ; ca5
; ca6

Functionca6::
	ldh [$ff48], a ; ca6
	push af ; ca8
	ldh a, [$ffe8] ; ca9
	and a ; cab
	jr z, Functioncc6 ; cac
	push hl ; cae
	push de ; caf
	push bc ; cb0
	ld hl, $c2c0 ; cb1
	ld de, $c240 ; cb4
	ldh a, [$ff48] ; cb7
	ld b, a ; cb9
	ld c, $1 ; cba
	call Functioncea ; cbc
	ld a, $1 ; cbf
	ldh [$ffe7], a ; cc1
	pop bc ; cc3
	pop de ; cc4
	pop hl ; cc5
	pop af ; cc6
	ret ; cc7
; cc8

Functioncc8::
	ldh [$ff49], a ; cc8
	push af ; cca
	ldh a, [$ffe8] ; ccb
	and a ; ccd
	jr z, Functionce8 ; cce
	push hl ; cd0
	push de ; cd1
	push bc ; cd2
	ld hl, $c2c8 ; cd3
	ld de, $c248 ; cd6
	ldh a, [$ff49] ; cd9
	ld b, a ; cdb
	ld c, $1 ; cdc
	call Functioncea ; cde
	ld a, $1 ; ce1
	ldh [$ffe7], a ; ce3
	pop bc ; ce5
	pop de ; ce6
	pop hl ; ce7
	pop af ; ce8
	ret ; ce9
; cea

Functioncea::
	push bc ; cea
	ld c, $4 ; ceb
	push de ; ced
	push hl ; cee
	ld a, b ; cef
	and $3 ; cf0
	add a ; cf2
	ld l, a ; cf3
	ld h, $0 ; cf4
	add hl, de ; cf6
	ld e, [hl] ; cf7
	inc hl ; cf8
	ld d, [hl] ; cf9
	pop hl ; cfa
	ld [hl], e ; cfb
	inc hl ; cfc
	ld [hl], d ; cfd
	inc hl ; cfe
	srl b ; cff
	srl b ; d01
	pop de ; d03
	dec c ; d04
	jr nz, Functionced ; d05
	ld a, $8 ; d07
	add e ; d09
	jr nc, Functiond0d ; d0a
	inc d ; d0c
	ld e, a ; d0d
	pop bc ; d0e
	dec c ; d0f
	jr nz, Functioncea ; d10
	ret ; d12
; d13

Functiond13::
	ldh a, [$ffe8] ; d13
	and a ; d15
	ret z ; d16
	ld a, $1 ; d17
	ldh [$ff4f], a ; d19
	ld hl, $8000 ; d1b
	ld bc, $2000 ; d1e
	xor a ; d21
	call Function314c ; d22
	ld a, $0 ; d25
	ldh [$ff4f], a ; d27
	ret ; d29
; d2a

Functiond2a::
	ld hl, $c3a0 ; d2a
	ld de, $ccd9 ; d2d
	ld bc, $168 ; d30
	ld a, [hli] ; d33
	cp $60 ; d34
	jr c, Functiond3b ; d36
	ld a, $7 ; d38
	ld [de], a ; d3a
	inc de ; d3b
	dec bc ; d3c
	ld a, b ; d3d
	or c ; d3e
	jr nz, Functiond33 ; d3f
	ret ; d41
; d42

Functiond42::
	ldh a, [$ffe8] ; d42
	and a ; d44
	ret z ; d45
	ld hl, $c280 ; d46
	ld bc, $50 ; d49
	xor a ; d4c
	call Function314c ; d4d
	ld a, $1 ; d50
	ldh [$ffe7], a ; d52
	call Function32e ; d54
	ret ; d57
; d58

Functiond58::
	ldh a, [hROMBank] ; d58
	push af ; d5a
	ld a, $2 ; d5b
	rst Bankswitch ; d5d
	call Function4000 ; d5e
	pop af ; d61
	rst Bankswitch ; d62
	ret ; d63
; d64

Functiond64::
	ldh a, [hROMBank] ; d64
	push af ; d66
	ld a, $2 ; d67
	rst Bankswitch ; d69
	call Function404f ; d6a
	pop af ; d6d
	rst Bankswitch ; d6e
	ret ; d6f
; d70

Functiond70::
	ld b, a ; d70
	ldh a, [hROMBank] ; d71
	push af ; d73
	ld a, b ; d74
	rst Bankswitch ; d75
	ld a, $0 ; d76
	call OpenSRAM ; d78
	ld hl, $a188 ; d7b
	ld bc, $310 ; d7e
	xor a ; d81
	call Function314c ; d82
	ld hl, $cf3c ; d85
	ld a, [hli] ; d88
	ld h, [hl] ; d89
	ld l, a ; d8a
	ld de, $a188 ; d8b
	call Functionb00 ; d8e
	call CloseSRAM ; d91
	pop af ; d94
	rst Bankswitch ; d95
	ret ; d96
; d97

Functiond97::
	ld a, $5 ; d97
	ld hl, $413c ; d99
	rst FarCall ; d9c
	ret ; d9d
; d9e

Functiond9e::
	ld a, $3e ; d9e
	ld hl, $4000 ; da0
	rst FarCall ; da3
	ret ; da4
; da5

Functionda5::
	ld a, $3e ; da5
	ld hl, $4032 ; da7
	rst FarCall ; daa
	ret ; dab
; dac

Functiondac::
	ld a, $3e ; dac
	ld hl, $400c ; dae
	rst FarCall ; db1
	ret ; db2
; db3

Functiondb3::
	push de ; db3
	ld a, $0 ; db4
	call OpenSRAM ; db6
	push bc ; db9
	ld de, $a000 ; dba
	ld a, b ; dbd
	call Functionaf0 ; dbe
	pop bc ; dc1
	pop hl ; dc2
	ld de, $a000 ; dc3
	call Functiondfe ; dc6
	call CloseSRAM ; dc9
	ret ; dcc
; dcd

Functiondcd::
	ld [$d156], a ; dcd
	ldh a, [hROMBank] ; dd0
	push af ; dd2
	ld a, [$d156] ; dd3
	rst Bankswitch ; dd6
	call Function311a ; dd7
	pop af ; dda
	rst Bankswitch ; ddb
	ret ; ddc
; ddd

Functionddd::
	ld [$d156], a ; ddd
	ldh a, [hROMBank] ; de0
	push af ; de2
	ld a, [$d156] ; de3
	rst Bankswitch ; de6
	ld a, h ; de7
	ld h, d ; de8
	ld d, a ; de9
	ld a, l ; dea
	ld l, e ; deb
	ld e, a ; dec
	inc b ; ded
	inc c ; dee
	jr Functiondf5 ; def
; df1

Functiondf1::
	ld a, [de] ; df1
	inc de ; df2
	ld [hli], a ; df3
	ld [hli], a ; df4
	dec c ; df5
	jr nz, Functiondf1 ; df6
	dec b ; df8
	jr nz, Functiondf1 ; df9
	pop af ; dfb
	rst Bankswitch ; dfc
	ret ; dfd
; dfe

Functiondfe::
	ldh a, [$ffd6] ; dfe
	push af ; e00
	xor a ; e01
	ldh [$ffd6], a ; e02
	ldh a, [hROMBank] ; e04
	push af ; e06
	ld a, b ; e07
	rst Bankswitch ; e08
	ld a, e ; e09
	ld [$ce68], a ; e0a
	ld a, d ; e0d
	ld [$ce69], a ; e0e
	ld a, l ; e11
	ld [$ce6a], a ; e12
	ld a, h ; e15
	ld [$ce6b], a ; e16
	ld a, c ; e19
	cp $8 ; e1a
	jr nc, Functione2a ; e1c
	ld [$ce67], a ; e1e
	call Function32e ; e21
	pop af ; e24
	rst Bankswitch ; e25
	pop af ; e26
	ldh [$ffd6], a ; e27
	ret ; e29
; e2a

Functione2a::
	ld a, $8 ; e2a
	ld [$ce67], a ; e2c
	call Function32e ; e2f
	ld a, c ; e32
	sub a, $8 ; e33
	ld c, a ; e35
	jr Functione19 ; e36
; e38

Functione38::
	ldh a, [$ffd6] ; e38
	push af ; e3a
	xor a ; e3b
	ldh [$ffd6], a ; e3c
	ldh a, [hROMBank] ; e3e
	push af ; e40
	ld a, b ; e41
	rst Bankswitch ; e42
	ld a, e ; e43
	ld [$ce6d], a ; e44
	ld a, d ; e47
	ld [$ce6e], a ; e48
	ld a, l ; e4b
	ld [$ce6f], a ; e4c
	ld a, h ; e4f
	ld [$ce70], a ; e50
	ld a, c ; e53
	cp $8 ; e54
	jr nc, Functione64 ; e56
	ld [$ce6c], a ; e58
	call Function32e ; e5b
	pop af ; e5e
	rst Bankswitch ; e5f
	pop af ; e60
	ldh [$ffd6], a ; e61
	ret ; e63
; e64

Functione64::
	ld a, $8 ; e64
	ld [$ce6c], a ; e66
	call Function32e ; e69
	ld a, c ; e6c
	sub a, $8 ; e6d
	ld c, a ; e6f
	jr Functione53 ; e70
; e72

Functione72::
	ldh a, [$ff40] ; e72
	bit 7, a ; e74
	jp nz, Functiondfe ; e76
	push hl ; e79
	ld h, d ; e7a
	ld l, e ; e7b
	pop de ; e7c
	ld a, b ; e7d
	push af ; e7e
	swap c ; e7f
	ld a, $f ; e81
	and c ; e83
	ld b, a ; e84
	ld a, $f0 ; e85
	and c ; e87
	ld c, a ; e88
	pop af ; e89
	jp Functiondcd ; e8a
; e8d

Functione8d::
	ldh a, [$ff40] ; e8d
	bit 7, a ; e8f
	jp nz, Functione38 ; e91
	push de ; e94
	ld d, h ; e95
	ld e, l ; e96
	ld a, b ; e97
	push af ; e98
	ld h, $0 ; e99
	ld l, c ; e9b
	add hl, hl ; e9c
	add hl, hl ; e9d
	add hl, hl ; e9e
	ld b, h ; e9f
	ld c, l ; ea0
	pop af ; ea1
	pop hl ; ea2
	jp Functionddd ; ea3
; ea6

Functionea6::
	ldh a, [$ff40] ; ea6
	add a ; ea8
	jp c, Functiondfe ; ea9
	push de ; eac
	push hl ; ead
	ld a, b ; eae
	ld h, $0 ; eaf
	ld l, c ; eb1
	add hl, hl ; eb2
	add hl, hl ; eb3
	add hl, hl ; eb4
	add hl, hl ; eb5
	ld b, h ; eb6
	ld c, l ; eb7
	pop de ; eb8
	pop hl ; eb9
	jp Functiondcd ; eba
; ebd

Functionebd::
	ld a, $7f ; ebd
	ld de, $14 ; ebf
	push hl ; ec2
	push bc ; ec3
	ld [hli], a ; ec4
	dec c ; ec5
	jr nz, Functionec4 ; ec6
	pop bc ; ec8
	pop hl ; ec9
	add hl, de ; eca
	dec b ; ecb
	jr nz, Functionec2 ; ecc
	ret ; ece
; ecf

Functionecf::
	ld hl, $c3a0 ; ecf
	ld a, $7f ; ed2
	ld bc, $168 ; ed4
	call Function314c ; ed7
	ldh a, [$ff40] ; eda
	bit 7, a ; edc
	ret z ; ede
	jp WaitBGMap ; edf
; ee2

Functionee2::
	ld a, $7 ; ee2
	ld hl, $ccd9 ; ee4
	ld bc, $168 ; ee7
	call Function314c ; eea
	jr Functionecf ; eed
; eef

Functioneef::
	push bc ; eef
	push hl ; ef0
	call Functionef8 ; ef1
	pop hl ; ef4
	pop bc ; ef5
	jr Functionf2b ; ef6
; ef8

Functionef8::
	push hl ; ef8
	ld a, $79 ; ef9
	ld [hli], a ; efb
	inc a ; efc
	call Functionf25 ; efd
	inc a ; f00
	ld [hl], a ; f01
	pop hl ; f02
	ld de, $14 ; f03
	add hl, de ; f06
	push hl ; f07
	ld a, $7c ; f08
	ld [hli], a ; f0a
	ld a, $7f ; f0b
	call Functionf25 ; f0d
	ld [hl], $7c ; f10
	pop hl ; f12
	ld de, $14 ; f13
	add hl, de ; f16
	dec b ; f17
	jr nz, Functionf07 ; f18
	ld a, $7d ; f1a
	ld [hli], a ; f1c
	ld a, $7a ; f1d
	call Functionf25 ; f1f
	ld [hl], $7e ; f22
	ret ; f24
; f25

Functionf25::
	ld d, c ; f25
	ld [hli], a ; f26
	dec d ; f27
	jr nz, Functionf26 ; f28
	ret ; f2a
; f2b

Functionf2b::
	ld de, $939 ; f2b
	add hl, de ; f2e
	inc b ; f2f
	inc b ; f30
	inc c ; f31
	inc c ; f32
	ld a, $7 ; f33
	push bc ; f35
	push hl ; f36
	ld [hli], a ; f37
	dec c ; f38
	jr nz, Functionf37 ; f39
	pop hl ; f3b
	ld de, $14 ; f3c
	add hl, de ; f3f
	pop bc ; f40
	dec b ; f41
	jr nz, Functionf35 ; f42
	ret ; f44
; f45

Functionf45::
	ld hl, $c490 ; f45
	ld b, $4 ; f48
	ld c, $12 ; f4a
	jp Functioneef ; f4c
; f4f

Functionf4f::
	nop ; f4f
	ld [$9fe3], sp ; f50
	sbc e ; f53
	ret c ; f54
	- ; f55
	add a ; f56
	rst $20 ; f57
	ld d, a ; f58
	ld hl, $f5d ; f59
	ret ; f5c
; f5d

Functionf5d::
	ld d, b ; f5d
	call Functionf68 ; f5e
	ld bc, $c4b9 ; f61
	call Function1272 ; f64
	ret ; f67
; f68

Functionf68::
	push hl ; f68
	call Functionf45 ; f69
	call Function196f ; f6c
	call Function3472 ; f6f
	pop hl ; f72
	ret ; f73
; f74

Functionf74::
	push hl ; f74
	ld a, [de] ; f75
	cp $50 ; f76
	jr nz, Functionf83 ; f78
	ld b, h ; f7a
	ld c, l ; f7b
	pop hl ; f7c
	ret ; f7d
; f7e

Functionf7e::
	pop de ; f7e
	inc de ; f7f
	jp Functionf75 ; f80
; f83

Functionf83::
	cp $4f ; f83
	jp z, Function117f ; f85
	cp $4e ; f88
	jp z, Function116d ; f8a
	and a ; f8d
	jp z, Function120c ; f8e
	cp $4c ; f91
	jp z, Function11c8 ; f93
	cp $4b ; f96
	jp z, Function11b0 ; f98
	cp $51 ; f9b
	jp z, Function1187 ; f9d
	cp $49 ; fa0
	jp z, Function1066 ; fa2
	cp $52 ; fa5
	jp z, Function106d ; fa7
	cp $53 ; faa
	jp z, Function1074 ; fac
	cp $35 ; faf
	jp z, Function10c8 ; fb1
	cp $36 ; fb4
	jp z, Function10cf ; fb6
	cp $37 ; fb9
	jp z, Function10d6 ; fbb
	cp $38 ; fbe
	jp z, Function107b ; fc0
	cp $39 ; fc3
	jp z, Function1082 ; fc5
	cp $54 ; fc8
	jp z, Function10a5 ; fca
	cp $5b ; fcd
	jp z, Function1097 ; fcf
	cp $5e ; fd2
	jp z, Function109e ; fd4
	cp $5c ; fd7
	jp z, Function1090 ; fd9
	cp $5d ; fdc
	jp z, Function1089 ; fde
	cp $23 ; fe1
	jp z, Function10ac ; fe3
	cp $22 ; fe6
	jp z, Function1176 ; fe8
	cp $55 ; feb
	jp z, Function11d6 ; fed
	cp $56 ; ff0
	jp z, Function10b3 ; ff2
	cp $57 ; ff5
	jp z, Function1205 ; ff7
	cp $58 ; ffa
	jp z, Function11eb ; ffc
	cp $4a ; fff
	jp z, Function10ba ; 1001
	cp $24 ; 1004
	jp z, Function10c1 ; 1006
	cp $25 ; 1009
	jp z, Functionf7f ; 100b
	cp $1f ; 100e
	jr nz, Function1014 ; 1010
	ld a, $7f ; 1012
	cp $5f ; 1014
	jp z, Function11e7 ; 1016
	cp $59 ; 1019
	jp z, Function10dd ; 101b
	cp $5a ; 101e
	jp z, Function10e3 ; 1020
	cp $3f ; 1023
	jp z, Function10fb ; 1025
	cp $e4 ; 1028
	jr z, Function1030 ; 102a
	cp $e5 ; 102c
	jr nz, Function1037 ; 102e
	ld b, a ; 1030
	call Function124a ; 1031
	jp Functionf7f ; 1034
; 1037

Function1037::
	cp $60 ; 1037
	jr nc, Function105f ; 1039
	cp $40 ; 103b
	jr nc, Function1050 ; 103d
	cp $20 ; 103f
	jr nc, Function1047 ; 1041
	add a, $80 ; 1043
	jr Function1049 ; 1045
; 1047

Function1047::
	add a, $90 ; 1047
	ld b, $e5 ; 1049
	call Function124a ; 104b
	jr Function105f ; 104e
; 1050

Function1050::
	cp $44 ; 1050
	jr nc, Function1058 ; 1052
	add a, $59 ; 1054
	jr Function105a ; 1056
; 1058

Function1058::
	add a, $86 ; 1058
	ld b, $e4 ; 105a
	call Function124a ; 105c
	ld [hli], a ; 105f
	call Function31e2 ; 1060
	jp Functionf7f ; 1063
; 1066

Function1066::
	push de ; 1066
	ld de, $d1ae ; 1067
	jp Function1132 ; 106a
; 106d

Function106d::
	push de ; 106d
	ld de, $d1a3 ; 106e
	jp Function1132 ; 1071
; 1074

Function1074::
	push de ; 1074
	ld de, $d1b9 ; 1075
	jp Function1132 ; 1078
; 107b

Function107b::
	push de ; 107b
	ld de, $d1c4 ; 107c
	jp Function1132 ; 107f
; 1082

Function1082::
	push de ; 1082
	ld de, $d1cf ; 1083
	jp Function1132 ; 1086
; 1089

Function1089::
	push de ; 1089
	ld de, $113e ; 108a
	jp Function1132 ; 108d
; 1090

Function1090::
	push de ; 1090
	ld de, $113b ; 1091
	jp Function1132 ; 1094
; 1097

Function1097::
	push de ; 1097
	ld de, $1146 ; 1098
	jp Function1132 ; 109b
; 109e

Function109e::
	push de ; 109e
	ld de, $1149 ; 109f
	jp Function1132 ; 10a2
; 10a5

Function10a5::
	push de ; 10a5
	ld de, $1150 ; 10a6
	jp Function1132 ; 10a9
; 10ac

Function10ac::
	push de ; 10ac
	ld de, $1155 ; 10ad
	jp Function1132 ; 10b0
; 10b3

Function10b3::
	push de ; 10b3
	ld de, $115a ; 10b4
	jp Function1132 ; 10b7
; 10ba

Function10ba::
	push de ; 10ba
	ld de, $1164 ; 10bb
	jp Function1132 ; 10be
; 10c1

Function10c1::
	push de ; 10c1
	ld de, $1167 ; 10c2
	jp Function1132 ; 10c5
; 10c8

Function10c8::
	push de ; 10c8
	ld de, $116c ; 10c9
	jp Function1132 ; 10cc
; 10cf

Function10cf::
	push de ; 10cf
	ld de, $116c ; 10d0
	jp Function1132 ; 10d3
; 10d6

Function10d6::
	push de ; 10d6
	ld de, $116c ; 10d7
	jp Function1132 ; 10da
; 10dd

Function10dd::
	ldh a, [$ffe6] ; 10dd
	xor $1 ; 10df
	jr Function10e5 ; 10e1
; 10e3

Function10e3::
	ldh a, [$ffe6] ; 10e3
	push de ; 10e5
	and a ; 10e6
	jr nz, Function10ee ; 10e7
	ld de, $cb01 ; 10e9
	jr Function1132 ; 10ec
; 10ee

Function10ee::
	ld de, $115d ; 10ee
	call Functionf74 ; 10f1
	ld h, b ; 10f4
	ld l, c ; 10f5
	ld de, $caf6 ; 10f6
	jr Function1132 ; 10f9
; 10fb

Function10fb::
	push de ; 10fb
	ld a, [$d042] ; 10fc
	and a ; 10ff
	jr nz, Function112d ; 1100
	ld a, [$d11d] ; 1102
	cp $9 ; 1105
	jr z, Function1128 ; 1107
	cp $2a ; 1109
	jr z, Function1128 ; 110b
	ld de, $cb34 ; 110d
	call Functionf74 ; 1110
	ld h, b ; 1113
	ld l, c ; 1114
	ld de, $116a ; 1115
	call Functionf74 ; 1118
	push bc ; 111b
	ld hl, $58f2 ; 111c
	ld a, $e ; 111f
	rst FarCall ; 1121
	pop hl ; 1122
	ld de, $cf6b ; 1123
	jr Function1132 ; 1126
; 1128

Function1128::
	ld de, $d1b9 ; 1128
	jr Function1132 ; 112b
; 112d

Function112d::
	ld de, $cb34 ; 112d
	jr Function1132 ; 1130
; 1132

Function1132::
	call Functionf74 ; 1132
	ld h, b ; 1135
	ld l, c ; 1136
	pop de ; 1137
	jp Functionf7f ; 1138
; 113b

Function113b::
	sub e ; 113b
	adc h ; 113c
	ld d, b ; 113d
	sub e ; 113e
	sub c ; 113f
	add b ; 1140
	adc b ; 1141
	adc l ; 1142
	add h ; 1143
	sub c ; 1144
	ld d, b ; 1145
	adc a ; 1146
	add d ; 1147
	ld d, b ; 1148
	sub c ; 1149
	adc [hl] ; 114a
	add d ; 114b
	adc d ; 114c
	add h ; 114d
	sub e ; 114e
	ld d, b ; 114f
	adc a ; 1150
	adc [hl] ; 1151
	adc d ; 1152
	ld [$ba50], a ; 1153
	or e ; 1156
	add hl, hl ; 1157
	or a ; 1158
	ld d, b ; 1159
	ld [hl], l ; 115a
	ld [hl], l ; 115b
	ld d, b ; 115c
	add h ; 115d
	xor l ; 115e
	and h ; 115f
	xor h ; 1160
	cp b ; 1161
	ld a, a ; 1162
	ld d, b ; 1163
	pop hl ; 1164
	ld [$ff00+c], a ; 1165
	ld d, b ; 1166
	ld [hl], b ; 1167
	ld [hl], c ; 1168
	ld d, b ; 1169
	ld a, a ; 116a
	ld d, b ; 116b
	ld d, b ; 116c
	pop hl ; 116d
	ld bc, $28 ; 116e
	add hl, bc ; 1171
	push hl ; 1172
	jp Functionf7f ; 1173
; 1176

Function1176::
	pop hl ; 1176
	ld bc, $14 ; 1177
	add hl, bc ; 117a
	push hl ; 117b
	jp Functionf7f ; 117c
; 117f

Function117f::
	pop hl ; 117f
	ld hl, $c4e1 ; 1180
	push hl ; 1183
	jp Functionf7f ; 1184
; 1187

Function1187::
	push de ; 1187
	ld a, [$d042] ; 1188
	cp $3 ; 118b
	jr z, Function1192 ; 118d
	call Function1255 ; 118f
	call Function123a ; 1192
	call Functiona60 ; 1195
	ld hl, $c4b9 ; 1198
	ld bc, $312 ; 119b
	call Functionebd ; 119e
	call Function125b ; 11a1
	ld c, $14 ; 11a4
	call Function33c ; 11a6
	ld hl, $c4b9 ; 11a9
	pop de ; 11ac
	jp Functionf7f ; 11ad
; 11b0

Function11b0::
	ld a, [$d042] ; 11b0
	or a ; 11b3
	jr nz, Function11b9 ; 11b4
	call Function1255 ; 11b6
	call Function123a ; 11b9
	push de ; 11bc
	call Functiona60 ; 11bd
	pop de ; 11c0
	ld a, [$d042] ; 11c1
	or a ; 11c4
	call z, Function125b ; 11c5
	push de ; 11c8
	call Function121d ; 11c9
	call Function121d ; 11cc
	ld hl, $c4e1 ; 11cf
	pop de ; 11d2
	jp Functionf7f ; 11d3
; 11d6

Function11d6::
	push de ; 11d6
	ld de, $11e5 ; 11d7
	ld b, h ; 11da
	ld c, l ; 11db
	call Functionf74 ; 11dc
	ld h, b ; 11df
	ld l, c ; 11e0
	pop de ; 11e1
	jp Functionf7f ; 11e2
; 11e5

Function11e5::
	ld c, e ; 11e5
	ld d, b ; 11e6
	ld [hl], $e8 ; 11e7
	pop hl ; 11e9
	ret ; 11ea
; 11eb

Function11eb::
	ld a, [$d042] ; 11eb
	cp $3 ; 11ee
	jr z, Function11f5 ; 11f0
	call Function1255 ; 11f2
	call Function123a ; 11f5
	call Functiona60 ; 11f8
	ld a, [$d042] ; 11fb
	cp $3 ; 11fe
	jr z, Function1205 ; 1200
	call Function125b ; 1202
	pop hl ; 1205
	ld de, $120b ; 1206
	dec de ; 1209
	ret ; 120a
; 120b

Function120b::
	ld d, b ; 120b
	ld b, h ; 120c
	ld c, l ; 120d
	pop hl ; 120e
	ld de, $1214 ; 120f
	dec de ; 1212
	ret ; 1213
; 1214

Function1214::
	add hl, bc ; 1214
	or d ; 1215
	rst $38 ; 1216
	ld [de], a ; 1217
	nop ; 1218
	add e ; 1219
	and l ; 121a
	- ; 121b
	ld d, a ; 121c
	ld hl, $c4b8 ; 121d
	ld de, $c4a4 ; 1220
	ld bc, $3c ; 1223
	call Function311a ; 1226
	ld hl, $c4e1 ; 1229
	ld a, $7f ; 122c
	ld bc, $12 ; 122e
	call Function314c ; 1231
	ld c, $5 ; 1234
	call Function33c ; 1236
	ret ; 1239
; 123a

Function123a::
	push bc ; 123a
	ldh a, [$ffda] ; 123b
	push af ; 123d
	ld a, $1 ; 123e
	ldh [$ffda], a ; 1240
	call WaitBGMap ; 1242
	pop af ; 1245
	ldh [$ffda], a ; 1246
	pop bc ; 1248
	ret ; 1249
; 124a

Function124a::
	push af ; 124a
	push hl ; 124b
	ld a, b ; 124c
	ld bc, $ffec ; 124d
	add hl, bc ; 1250
	ld [hl], a ; 1251
	pop hl ; 1252
	pop af ; 1253
	ret ; 1254
; 1255

Function1255::
	ld a, $ee ; 1255
	ld [$c506], a ; 1257
	ret ; 125a
; 125b

Function125b::
	ld a, $7a ; 125b
	ld [$c506], a ; 125d
	ret ; 1260
; 1261

Function1261::
	ld b, a ; 1261
	ldh a, [hROMBank] ; 1262
	push af ; 1264
	ld a, b ; 1265
	rst Bankswitch ; 1266
	call Functionf74 ; 1267
	pop af ; 126a
	rst Bankswitch ; 126b
	ret ; 126c
; 126d

Function126d::
	ld hl, $1271 ; 126d
	ret ; 1270
; 1271

Function1271::
	ld d, b ; 1271
	ld a, [$d19c] ; 1272
	push af ; 1275
	set 1, a ; 1276
	ld [$d19c], a ; 1278
	call Function1283 ; 127b
	pop af ; 127e
	ld [$d19c], a ; 127f
	ret ; 1282
; 1283

Function1283::
	ld a, [hli] ; 1283
	cp $50 ; 1284
	ret z ; 1286
	call Function128c ; 1287
	jr Function1283 ; 128a
; 128c

Function128c::
	push hl ; 128c
	push bc ; 128d
	ld c, a ; 128e
	ld b, $0 ; 128f
	ld hl, $129d ; 1291
	add hl, bc ; 1294
	add hl, bc ; 1295
	ld e, [hl] ; 1296
	inc hl ; 1297
	ld d, [hl] ; 1298
	pop bc ; 1299
	pop hl ; 129a
	push de ; 129b
	ret ; 129c
; 129d

Function129d::
	rl d ; 129d
	sub a, $12 ; 129f
	- ; 12a1
	ld [de], a ; 12a2
	dec c ; 12a3
	inc de ; 12a4
	jr Function12ba ; 12a5
; 12a7

Function12a7::
	jr z, Function12bc ; 12a7
	inc l ; 12a9
	inc de ; 12aa
	ld b, d ; 12ab
	inc de ; 12ac
	ld d, c ; 12ad
	inc de ; 12ae
	ld d, d ; 12af
	inc de ; 12b0
	ld l, l ; 12b1
	inc de ; 12b2
	add b ; 12b3
	inc de ; 12b4
	jp Functione213 ; 12b5
; 12b8

Function12b8::
	inc de ; 12b8
	add b ; 12b9
	inc de ; 12ba
	add b ; 12bb
	inc de ; 12bc
	add b ; 12bd
	inc de ; 12be
	add b ; 12bf
	inc de ; 12c0
	add b ; 12c1
	inc de ; 12c2
	add b ; 12c3
	inc de ; 12c4
	ld [$213], a ; 12c5
	inc d ; 12c8
	ld [$ff00+c], a ; 12c9
	ld [de], a ; 12ca
	ld d, h ; 12cb
	ld e, l ; 12cc
	ld h, b ; 12cd
	ld l, c ; 12ce
	call Functionf74 ; 12cf
	ld h, d ; 12d2
	ld l, e ; 12d3
	inc hl ; 12d4
	ret ; 12d5
; 12d6

Function12d6::
	ld a, [hli] ; 12d6
	ld e, a ; 12d7
	ld a, [hli] ; 12d8
	ld d, a ; 12d9
	push hl ; 12da
	ld h, b ; 12db
	ld l, c ; 12dc
	call Functionf74 ; 12dd
	pop hl ; 12e0
	ret ; 12e1
; 12e2

Function12e2::
	ldh a, [hROMBank] ; 12e2
	push af ; 12e4
	ld a, [hli] ; 12e5
	ld e, a ; 12e6
	ld a, [hli] ; 12e7
	ld d, a ; 12e8
	ld a, [hli] ; 12e9
	ldh [hROMBank], a ; 12ea
	ld MBC3RomBank, a ; 12ec
	push hl ; 12ef
	ld h, d ; 12f0
	ld l, e ; 12f1
	call Function1283 ; 12f2
	pop hl ; 12f5
	pop af ; 12f6
	ldh [hROMBank], a ; 12f7
	ld MBC3RomBank, a ; 12f9
	ret ; 12fc
; 12fd

Function12fd::
	ld a, [hli] ; 12fd
	ld e, a ; 12fe
	ld a, [hli] ; 12ff
	ld d, a ; 1300
	ld a, [hli] ; 1301
	push hl ; 1302
	ld h, b ; 1303
	ld l, c ; 1304
	ld c, a ; 1305
	call Function3ade ; 1306
	ld b, h ; 1309
	ld c, l ; 130a
	pop hl ; 130b
	ret ; 130c
; 130d

Function130d::
	ld a, [hli] ; 130d
	ld [$cfd6], a ; 130e
	ld c, a ; 1311
	ld a, [hli] ; 1312
	ld [$cfd7], a ; 1313
	ld b, a ; 1316
	ret ; 1317
; 1318

Function1318::
	ld a, [hli] ; 1318
	ld e, a ; 1319
	ld a, [hli] ; 131a
	ld d, a ; 131b
	ld a, [hli] ; 131c
	ld b, a ; 131d
	ld a, [hli] ; 131e
	ld c, a ; 131f
	push hl ; 1320
	ld h, d ; 1321
	ld l, e ; 1322
	call Functioneef ; 1323
	pop hl ; 1326
	ret ; 1327
; 1328

Function1328::
	ld bc, $c4e1 ; 1328
	ret ; 132b
; 132c

Function132c::
	ld a, [$d042] ; 132c
	cp $3 ; 132f
	jp z, Function13e2 ; 1331
	push hl ; 1334
	call Function1255 ; 1335
	push bc ; 1338
	call Functiona60 ; 1339
	pop bc ; 133c
	call Function125b ; 133d
	pop hl ; 1340
	ret ; 1341
; 1342

Function1342::
	push hl ; 1342
	call Function125b ; 1343
	call Function121d ; 1346
	call Function121d ; 1349
	pop hl ; 134c
	ld bc, $c4e1 ; 134d
	ret ; 1350
; 1351

Function1351::
	jp [hl] ; 1351
	ld a, [hli] ; 1352
	ld e, a ; 1353
	ld a, [hli] ; 1354
	ld d, a ; 1355
	ld a, [hli] ; 1356
	push hl ; 1357
	ld h, b ; 1358
	ld l, c ; 1359
	ld b, a ; 135a
	and $f ; 135b
	ld c, a ; 135d
	ld a, b ; 135e
	and $f0 ; 135f
	swap a ; 1361
	set 6, a ; 1363
	ld b, a ; 1365
	call Function323d ; 1366
	ld b, h ; 1369
	ld c, l ; 136a
	pop hl ; 136b
	ret ; 136c
; 136d

Function136d::
	push hl ; 136d
	push bc ; 136e
	call Function935 ; 136f
	ldh a, [$ffaa] ; 1372
	and $3 ; 1374
	jr nz, Function137d ; 1376
	ld c, $1e ; 1378
	call Function33c ; 137a
	pop bc ; 137d
	pop hl ; 137e
	ret ; 137f
; 1380

Function1380::
	push bc ; 1380
	dec hl ; 1381
	ld a, [hli] ; 1382
	ld b, a ; 1383
	push hl ; 1384
	ld hl, $13ad ; 1385
	ld a, [hli] ; 1388
	cp $ff ; 1389
	jr z, Function139f ; 138b
	cp b ; 138d
	jr z, Function1394 ; 138e
	inc hl ; 1390
	inc hl ; 1391
	jr Function1388 ; 1392
; 1394

Function1394::
	push de ; 1394
	ld e, [hl] ; 1395
	inc hl ; 1396
	ld d, [hl] ; 1397
	call Function3e24 ; 1398
	call Function3e56 ; 139b
	pop de ; 139e
	pop hl ; 139f
	pop bc ; 13a0
	ret ; 13a1
; 13a2

Function13a2::
	push de ; 13a2
	ld e, [hl] ; 13a3
	inc hl ; 13a4
	ld d, [hl] ; 13a5
	call Function39f9 ; 13a6
	pop de ; 13a9
	pop hl ; 13aa
	pop bc ; 13ab
	ret ; 13ac
; 13ad

Function13ad::
	dec bc ; 13ad
	nop ; 13ae
	nop ; 13af
	ld [de], a ; 13b0
	dec l ; 13b1
	nop ; 13b2
	ld c, $9 ; 13b3
	nop ; 13b5
	rrca ; 13b6
	ld bc, $1000 ; 13b7
	ld [bc], a ; 13ba
	nop ; 13bb
	ld de, $a ; 13bc
	inc de ; 13bf
	inc l ; 13c0
	nop ; 13c1
	rst $38 ; 13c2
	ld a, [hli] ; 13c3
	ld d, a ; 13c4
	push hl ; 13c5
	ld h, b ; 13c6
	ld l, c ; 13c7
	push de ; 13c8
	ld a, $75 ; 13c9
	ld [hli], a ; 13cb
	call Function935 ; 13cc
	ldh a, [$ffaa] ; 13cf
	and $3 ; 13d1
	jr nz, Function13da ; 13d3
	ld c, $a ; 13d5
	call Function33c ; 13d7
	pop de ; 13da
	dec d ; 13db
	jr nz, Function13c8 ; 13dc
	ld b, h ; 13de
	ld c, l ; 13df
	pop hl ; 13e0
	ret ; 13e1
; 13e2

Function13e2::
	push hl ; 13e2
	push bc ; 13e3
	call Functiona60 ; 13e4
	pop bc ; 13e7
	pop hl ; 13e8
	ret ; 13e9
; 13ea

Function13ea::
	ld a, [hli] ; 13ea
	push hl ; 13eb
	ld e, a ; 13ec
	ld d, $0 ; 13ed
	ld hl, $4000 ; 13ef
	add hl, de ; 13f2
	add hl, de ; 13f3
	ld a, $9 ; 13f4
	call Function313c ; 13f6
	ld d, h ; 13f9
	ld e, l ; 13fa
	ld h, b ; 13fb
	ld l, c ; 13fc
	call Functionf74 ; 13fd
	pop hl ; 1400
	ret ; 1401
; 1402

Function1402::
	call Function35b9 ; 1402
	push hl ; 1405
	push bc ; 1406
	ld c, a ; 1407
	ld b, $0 ; 1408
	ld hl, $1422 ; 140a
	add hl, bc ; 140d
	add hl, bc ; 140e
	ld a, [hli] ; 140f
	ld h, [hl] ; 1410
	ld l, a ; 1411
	ld d, h ; 1412
	ld e, l ; 1413
	pop hl ; 1414
	call Functionf74 ; 1415
	ld h, b ; 1418
	ld l, c ; 1419
	ld de, $1454 ; 141a
	call Functionf74 ; 141d
	pop hl ; 1420
	ret ; 1421
; 1422

Function1422::
	jr nc, Function1438 ; 1422
	inc [hl] ; 1424
	inc d ; 1425
	jr c, Function143c ; 1426
	dec a ; 1428
	inc d ; 1429
	ld b, h ; 142a
	inc d ; 142b
	ld c, d ; 142c
	inc d ; 142d
	ld c, [hl] ; 142e
	inc d ; 142f
	sub d ; 1430
	sub h ; 1431
	adc l ; 1432
	ld d, b ; 1433
	adc h ; 1434
	adc [hl] ; 1435
	adc l ; 1436
	ld d, b ; 1437
	sub e ; 1438
	sub h ; 1439
	add h ; 143a
	sub d ; 143b
	ld d, b ; 143c
	sub [hl] ; 143d
	add h ; 143e
	add e ; 143f
	adc l ; 1440
	add h ; 1441
	sub d ; 1442
	ld d, b ; 1443
	sub e ; 1444
	add a ; 1445
	sub h ; 1446
	sub c ; 1447
	sub d ; 1448
	ld d, b ; 1449
	add l ; 144a
	sub c ; 144b
	adc b ; 144c
	ld d, b ; 144d
	sub d ; 144e
	add b ; 144f
	sub e ; 1450
	sub h ; 1451
	sub c ; 1452
	ld d, b ; 1453
	add e ; 1454
	add b ; 1455
	sbc b ; 1456
	ld d, b ; 1457
	ldh a, [$ffdd] ; 1458
	and a ; 145a
	ret z ; 145b
	ld [$ffdb], sp ; 145c
	ld hl, $cc70 ; 145f
	ld sp, hl ; 1462
	ld hl, $cc48 ; 1463
	ld de, $cc20 ; 1466
	pop bc ; 1469
	ld a, $1 ; 146a
	ldh [$ff4f], a ; 146c
	ld a, [hli] ; 146e
	ld [bc], a ; 146f
	inc c ; 1470
	ld a, [hli] ; 1471
	ld [bc], a ; 1472
	dec c ; 1473
	ld a, $0 ; 1474
	ldh [$ff4f], a ; 1476
	ld a, [de] ; 1478
	inc de ; 1479
	ld [bc], a ; 147a
	inc c ; 147b
	ld a, [de] ; 147c
	inc de ; 147d
	ld [bc], a ; 147e
	pop bc ; 147f
	ld a, $1 ; 1480
	ldh [$ff4f], a ; 1482
	ld a, [hli] ; 1484
	ld [bc], a ; 1485
	inc c ; 1486
	ld a, [hli] ; 1487
	ld [bc], a ; 1488
	dec c ; 1489
	ld a, $0 ; 148a
	ldh [$ff4f], a ; 148c
	ld a, [de] ; 148e
	inc de ; 148f
	ld [bc], a ; 1490
	inc c ; 1491
	ld a, [de] ; 1492
	inc de ; 1493
	ld [bc], a ; 1494
	ldh a, [$ffde] ; 1495
	dec a ; 1497
	dec a ; 1498
	ldh [$ffde], a ; 1499
	jr nz, Function1469 ; 149b
	ldh a, [$ffdb] ; 149d
	ld l, a ; 149f
	ldh a, [$ffdc] ; 14a0
	ld h, a ; 14a2
	ld sp, hl ; 14a3
	xor a ; 14a4
	ldh [$ffdd], a ; 14a5
	scf ; 14a7
	ret ; 14a8
; 14a9

Function14a9::
	ldh a, [$ffd6] ; 14a9
	and a ; 14ab
	ret z ; 14ac
	ldh a, [$ffd7] ; 14ad
	and a ; 14af
	jr z, Function14b7 ; 14b0
	call Function32e ; 14b2
	jr Function14a9 ; 14b5
; 14b7

Function14b7::
	xor a ; 14b7
	ldh [$ffd6], a ; 14b8
	ret ; 14ba
; 14bb

Function14bb::
	ldh a, [$ffd6] ; 14bb
	and a ; 14bd
	ret z ; 14be
	dec a ; 14bf
	jr z, Function14f9 ; 14c0
	dec a ; 14c2
	jr z, Function14ea ; 14c3
	dec a ; 14c5
	ldh a, [$ffd8] ; 14c6
	ld l, a ; 14c8
	ldh a, [$ffd9] ; 14c9
	ld h, a ; 14cb
	push hl ; 14cc
	xor a ; 14cd
	ldh [$ffd8], a ; 14ce
	ld a, $9c ; 14d0
	ldh [$ffd9], a ; 14d2
	ldh a, [$ffd6] ; 14d4
	push af ; 14d6
	cp $3 ; 14d7
	call z, Function14f9 ; 14d9
	pop af ; 14dc
	cp $4 ; 14dd
	call z, Function14ea ; 14df
	pop hl ; 14e2
	ld a, l ; 14e3
	ldh [$ffd8], a ; 14e4
	ld a, h ; 14e6
	ldh [$ffd9], a ; 14e7
	ret ; 14e9
; 14ea

Function14ea::
	ld a, $1 ; 14ea
	ldh [$ff4f], a ; 14ec
	ld hl, $ccd9 ; 14ee
	call Function14fc ; 14f1
	ld a, $0 ; 14f4
	ldh [$ff4f], a ; 14f6
	ret ; 14f8
; 14f9

Function14f9::
	ld hl, $c3a0 ; 14f9
	ld [$ffdb], sp ; 14fc
	ldh a, [$ffd7] ; 14ff
	and a ; 1501
	jr z, Function152c ; 1502
	dec a ; 1504
	jr z, Function1519 ; 1505
	ld de, $f0 ; 1507
	add hl, de ; 150a
	ld sp, hl ; 150b
	ldh a, [$ffd9] ; 150c
	ld h, a ; 150e
	ldh a, [$ffd8] ; 150f
	ld l, a ; 1511
	ld de, $180 ; 1512
	add hl, de ; 1515
	xor a ; 1516
	jr Function1535 ; 1517
; 1519

Function1519::
	ld de, $78 ; 1519
	add hl, de ; 151c
	ld sp, hl ; 151d
	ldh a, [$ffd9] ; 151e
	ld h, a ; 1520
	ldh a, [$ffd8] ; 1521
	ld l, a ; 1523
	ld de, $c0 ; 1524
	add hl, de ; 1527
	ld a, $2 ; 1528
	jr Function1535 ; 152a
; 152c

Function152c::
	ld sp, hl ; 152c
	ldh a, [$ffd9] ; 152d
	ld h, a ; 152f
	ldh a, [$ffd8] ; 1530
	ld l, a ; 1532
	ld a, $1 ; 1533
	ldh [$ffd7], a ; 1535
	ld a, $6 ; 1537
	ld bc, $d ; 1539
	pop de ; 153c
	ld [hl], e ; 153d
	inc l ; 153e
	ld [hl], d ; 153f
	inc l ; 1540
	pop de ; 1541
	ld [hl], e ; 1542
	inc l ; 1543
	ld [hl], d ; 1544
	inc l ; 1545
	pop de ; 1546
	ld [hl], e ; 1547
	inc l ; 1548
	ld [hl], d ; 1549
	inc l ; 154a
	pop de ; 154b
	ld [hl], e ; 154c
	inc l ; 154d
	ld [hl], d ; 154e
	inc l ; 154f
	pop de ; 1550
	ld [hl], e ; 1551
	inc l ; 1552
	ld [hl], d ; 1553
	inc l ; 1554
	pop de ; 1555
	ld [hl], e ; 1556
	inc l ; 1557
	ld [hl], d ; 1558
	inc l ; 1559
	pop de ; 155a
	ld [hl], e ; 155b
	inc l ; 155c
	ld [hl], d ; 155d
	inc l ; 155e
	pop de ; 155f
	ld [hl], e ; 1560
	inc l ; 1561
	ld [hl], d ; 1562
	inc l ; 1563
	pop de ; 1564
	ld [hl], e ; 1565
	inc l ; 1566
	ld [hl], d ; 1567
	inc l ; 1568
	pop de ; 1569
	ld [hl], e ; 156a
	inc l ; 156b
	ld [hl], d ; 156c
	add hl, bc ; 156d
	dec a ; 156e
	jr nz, Function153c ; 156f
	ldh a, [$ffdb] ; 1571
	ld l, a ; 1573
	ldh a, [$ffdc] ; 1574
	ld h, a ; 1576
	ld sp, hl ; 1577
	ret ; 1578
; 1579

Function1579::
	ld a, [$ce6c] ; 1579
	and a ; 157c
	ret z ; 157d
	ld [$ffdb], sp ; 157e
	ld hl, $ce6d ; 1581
	ld a, [hli] ; 1584
	ld h, [hl] ; 1585
	ld l, a ; 1586
	ld sp, hl ; 1587
	ld hl, $ce6f ; 1588
	ld a, [hli] ; 158b
	ld h, [hl] ; 158c
	ld l, a ; 158d
	ld a, [$ce6c] ; 158e
	ld b, a ; 1591
	xor a ; 1592
	ld [$ce6c], a ; 1593
	pop de ; 1596
	ld [hl], e ; 1597
	inc l ; 1598
	ld [hl], e ; 1599
	inc l ; 159a
	ld [hl], d ; 159b
	inc l ; 159c
	ld [hl], d ; 159d
	inc l ; 159e
	pop de ; 159f
	ld [hl], e ; 15a0
	inc l ; 15a1
	ld [hl], e ; 15a2
	inc l ; 15a3
	ld [hl], d ; 15a4
	inc l ; 15a5
	ld [hl], d ; 15a6
	inc l ; 15a7
	pop de ; 15a8
	ld [hl], e ; 15a9
	inc l ; 15aa
	ld [hl], e ; 15ab
	inc l ; 15ac
	ld [hl], d ; 15ad
	inc l ; 15ae
	ld [hl], d ; 15af
	inc l ; 15b0
	pop de ; 15b1
	ld [hl], e ; 15b2
	inc l ; 15b3
	ld [hl], e ; 15b4
	inc l ; 15b5
	ld [hl], d ; 15b6
	inc l ; 15b7
	ld [hl], d ; 15b8
	inc hl ; 15b9
	dec b ; 15ba
	jr nz, Function1596 ; 15bb
	ld a, l ; 15bd
	ld [$ce6f], a ; 15be
	ld a, h ; 15c1
	ld [$ce70], a ; 15c2
	ld [$ce6d], sp ; 15c5
	ldh a, [$ffdb] ; 15c8
	ld l, a ; 15ca
	ldh a, [$ffdc] ; 15cb
	ld h, a ; 15cd
	ld sp, hl ; 15ce
	ret ; 15cf
; 15d0

Function15d0::
	ld a, [$ce67] ; 15d0
	and a ; 15d3
	ret z ; 15d4
	ld [$ffdb], sp ; 15d5
	ld hl, $ce68 ; 15d8
	ld a, [hli] ; 15db
	ld h, [hl] ; 15dc
	ld l, a ; 15dd
	ld sp, hl ; 15de
	ld hl, $ce6a ; 15df
	ld a, [hli] ; 15e2
	ld h, [hl] ; 15e3
	ld l, a ; 15e4
	ld a, [$ce67] ; 15e5
	ld b, a ; 15e8
	xor a ; 15e9
	ld [$ce67], a ; 15ea
	pop de ; 15ed
	ld [hl], e ; 15ee
	inc l ; 15ef
	ld [hl], d ; 15f0
	inc l ; 15f1
	pop de ; 15f2
	ld [hl], e ; 15f3
	inc l ; 15f4
	ld [hl], d ; 15f5
	inc l ; 15f6
	pop de ; 15f7
	ld [hl], e ; 15f8
	inc l ; 15f9
	ld [hl], d ; 15fa
	inc l ; 15fb
	pop de ; 15fc
	ld [hl], e ; 15fd
	inc l ; 15fe
	ld [hl], d ; 15ff
	inc l ; 1600
	pop de ; 1601
	ld [hl], e ; 1602
	inc l ; 1603
	ld [hl], d ; 1604
	inc l ; 1605
	pop de ; 1606
	ld [hl], e ; 1607
	inc l ; 1608
	ld [hl], d ; 1609
	inc l ; 160a
	pop de ; 160b
	ld [hl], e ; 160c
	inc l ; 160d
	ld [hl], d ; 160e
	inc l ; 160f
	pop de ; 1610
	ld [hl], e ; 1611
	inc l ; 1612
	ld [hl], d ; 1613
	inc hl ; 1614
	dec b ; 1615
	jr nz, Function15ed ; 1616
	ld a, l ; 1618
	ld [$ce6a], a ; 1619
	ld a, h ; 161c
	ld [$ce6b], a ; 161d
	ld [$ce68], sp ; 1620
	ldh a, [$ffdb] ; 1623
	ld l, a ; 1625
	ldh a, [$ffdc] ; 1626
	ld h, a ; 1628
	ld sp, hl ; 1629
	ret ; 162a
; 162b

Function162b::
	ldh a, [$ffe0] ; 162b
	and a ; 162d
	ret z ; 162e
	ldh a, [hROMBank] ; 162f
	push af ; 1631
	ld a, $3f ; 1632
	rst Bankswitch ; 1634
	call Function4003 ; 1635
	pop af ; 1638
	rst Bankswitch ; 1639
	ret ; 163a
; 163b

Function163b::
	ret ; 163b
	ld hl, $ff40 ; 163c
	set 1, [hl] ; 163f
	ret ; 1641
; 1642

Function1642::
	nop ; 1642
	ldh a, [$ff9e] ; 1643
	and a ; 1645
	ret z ; 1646
	dec a ; 1647
	jr z, Function1677 ; 1648
	dec a ; 164a
	jr z, Function1670 ; 164b
	ld a, $2 ; 164d
	ldh [$ff9e], a ; 164f
	ld hl, $ffd8 ; 1651
	ld a, [hli] ; 1654
	ld h, [hl] ; 1655
	ld l, a ; 1656
	ld de, $14 ; 1657
	add hl, de ; 165a
	ld b, $12 ; 165b
	ld a, $60 ; 165d
	ld [hli], a ; 165f
	ld [hli], a ; 1660
	ld [hli], a ; 1661
	ld [hli], a ; 1662
	ld [hli], a ; 1663
	ld [hli], a ; 1664
	ld [hli], a ; 1665
	ld [hli], a ; 1666
	ld [hli], a ; 1667
	ld [hli], a ; 1668
	ld [hli], a ; 1669
	ld [hli], a ; 166a
	add hl, de ; 166b
	dec b ; 166c
	jr nz, Function165f ; 166d
	ret ; 166f
; 1670

Function1670::
	ld a, $1 ; 1670
	ld de, $240 ; 1672
	jr Function167b ; 1675
; 1677

Function1677::
	xor a ; 1677
	ld de, $320 ; 1678
	ldh [$ff9e], a ; 167b
	ld hl, $ffd8 ; 167d
	ld a, [hli] ; 1680
	ld h, [hl] ; 1681
	ld l, a ; 1682
	add hl, de ; 1683
	ld b, $e ; 1684
	ld a, $60 ; 1686
	ld [hli], a ; 1688
	ld [hli], a ; 1689
	ld [hli], a ; 168a
	ld [hli], a ; 168b
	ld [hli], a ; 168c
	ld [hli], a ; 168d
	ld [hli], a ; 168e
	ld [hli], a ; 168f
	ld [hli], a ; 1690
	ld [hli], a ; 1691
	ld [hli], a ; 1692
	ld [hli], a ; 1693
	ld [hli], a ; 1694
	ld [hli], a ; 1695
	ld [hli], a ; 1696
	ld [hli], a ; 1697
	dec b ; 1698
	jr nz, Function1688 ; 1699
	ret ; 169b
; 169c

Function169c::
	push hl ; 169c
	push de ; 169d
	push bc ; 169e
	ld c, a ; 169f
	ld a, $5 ; 16a0
	ld hl, $4334 ; 16a2
	rst FarCall ; 16a5
	ld a, c ; 16a6
	pop bc ; 16a7
	pop de ; 16a8
	pop hl ; 16a9
	ret ; 16aa
; 16ab

Function16ab::
	push hl ; 16ab
	push bc ; 16ac
	ld hl, $d05f ; 16ad
	ld c, $b ; 16b0
	ld b, a ; 16b2
	ldh a, [$ffb1] ; 16b3
	cp $0 ; 16b5
	jr z, Function16c8 ; 16b7
	ld a, b ; 16b9
	cp [hl] ; 16ba
	jr z, Function16cd ; 16bb
	inc hl ; 16bd
	inc hl ; 16be
	dec c ; 16bf
	jr nz, Function16ba ; 16c0
	ld a, [$d05e] ; 16c2
	scf ; 16c5
	jr Function16d0 ; 16c6
; 16c8

Function16c8::
	ld a, [$d05e] ; 16c8
	jr Function16d0 ; 16cb
; 16cd

Function16cd::
	inc hl ; 16cd
	xor a ; 16ce
	ld a, [hl] ; 16cf
	pop bc ; 16d0
	pop hl ; 16d1
	ret ; 16d2
; 16d3

Function16d3::
	push de ; 16d3
	push hl ; 16d4
	ld b, a ; 16d5
	ldh a, [hROMBank] ; 16d6
	push af ; 16d8
	ld a, $5 ; 16d9
	rst Bankswitch ; 16db
	ld a, b ; 16dc
	call Function4317 ; 16dd
	ld c, a ; 16e0
	pop de ; 16e1
	ld a, d ; 16e2
	rst Bankswitch ; 16e3
	pop hl ; 16e4
	pop de ; 16e5
	ret ; 16e6
; 16e7

Function16e7::
	ld a, [$d20b] ; 16e7
	call Function16fa ; 16ea
	ld b, a ; 16ed
	ret ; 16ee
; 16ef

Function16ef::
	ld a, [$d20b] ; 16ef
	call Function16fa ; 16f2
	sub a, $1 ; 16f5
	ret z ; 16f7
	and a ; 16f8
	ret ; 16f9
; 16fa

Function16fa::
	push de ; 16fa
	push hl ; 16fb
	ld hl, $74be ; 16fc
	ld e, a ; 16ff
	ld d, $0 ; 1700
	add hl, de ; 1702
	ldh a, [hROMBank] ; 1703
	push af ; 1705
	ld a, $3e ; 1706
	rst Bankswitch ; 1708
	ld e, [hl] ; 1709
	pop af ; 170a
	rst Bankswitch ; 170b
	ld a, e ; 170c
	and $f ; 170d
	pop hl ; 170f
	pop de ; 1710
	ret ; 1711
; 1712

Function1712::
	ld d, a ; 1712
	and $f0 ; 1713
	cp $10 ; 1715
	jr z, Function171f ; 1717
	cp $20 ; 1719
	jr z, Function1725 ; 171b
	scf ; 171d
	ret ; 171e
; 171f

Function171f::
	ld a, d ; 171f
	and $7 ; 1720
	ret z ; 1722
	scf ; 1723
	ret ; 1724
; 1725

Function1725::
	ld a, d ; 1725
	and $7 ; 1726
	ret z ; 1728
	scf ; 1729
	ret ; 172a
; 172b

Function172b::
	cp $14 ; 172b
	ret z ; 172d
	cp $1c ; 172e
	ret ; 1730
; 1731

Function1731::
	cp $12 ; 1731
	ret z ; 1733
	cp $1a ; 1734
	ret ; 1736
; 1737

Function1737::
	cp $15 ; 1737
	ret z ; 1739
	cp $1d ; 173a
	ret ; 173c
; 173d

Function173d::
	cp $90 ; 173d
	ret z ; 173f
	cp $98 ; 1740
	ret ; 1742
; 1743

Function1743::
	cp $60 ; 1743
	ret z ; 1745
	cp $68 ; 1746
	ret ; 1748
; 1749

Function1749::
	cp $23 ; 1749
	ret z ; 174b
	cp $2b ; 174c
	ret z ; 174e
	scf ; 174f
	ret ; 1750
; 1751

Function1751::
	nop ; 1751
	cp $24 ; 1752
	ret z ; 1754
	cp $2c ; 1755
	ret z ; 1757
	scf ; 1758
	ret ; 1759
; 175a

Function175a::
	cp $33 ; 175a
	ret z ; 175c
	cp $3b ; 175d
	ret ; 175f
; 1760

Function1760::
	ld a, [$d20b] ; 1760
	cp $71 ; 1763
	ret z ; 1765
	cp $79 ; 1766
	ret z ; 1768
	cp $7a ; 1769
	ret z ; 176b
	cp $7b ; 176c
	ret ; 176e
; 176f

Function176f::
	ld hl, $d445 ; 176f
	ld bc, $10 ; 1772
	call Function31a3 ; 1775
	ld b, h ; 1778
	ld c, l ; 1779
	ret ; 177a
; 177b

Function177b::
	ldh [$ffb1], a ; 177b
	call Function176f ; 177d
	ld hl, $0 ; 1780
	add hl, bc ; 1783
	ld a, [hl] ; 1784
	cp $ff ; 1785
	jr z, Function1790 ; 1787
	ldh [$ffb2], a ; 1789
	call Function1982 ; 178b
	and a ; 178e
	ret ; 178f
; 1790

Function1790::
	scf ; 1790
	ret ; 1791
; 1792

Function1792::
	ld hl, $6 ; 1792
	add hl, bc ; 1795
	ld a, [hl] ; 1796
	cp $ff ; 1797
	jr nz, Function17be ; 1799
	ld hl, $7 ; 179b
	add hl, bc ; 179e
	ld a, [hl] ; 179f
	cp $ff ; 17a0
	jr z, Function17b9 ; 17a2
	ld hl, $17bb ; 17a4
	ld a, [$d157] ; 17a7
	add l ; 17aa
	ld l, a ; 17ab
	jr nc, Function17af ; 17ac
	inc h ; 17ae
	ld a, [hl] ; 17af
	ld hl, $7 ; 17b0
	add hl, bc ; 17b3
	and [hl] ; 17b4
	jr nz, Function17b9 ; 17b5
	scf ; 17b7
	ret ; 17b8
; 17b9

Function17b9::
	and a ; 17b9
	ret ; 17ba
; 17bb

Function17bb::
	ld bc, $402 ; 17bb
	ld hl, $6 ; 17be
	add hl, bc ; 17c1
	ld d, [hl] ; 17c2
	ld hl, $7 ; 17c3
	add hl, bc ; 17c6
	ld e, [hl] ; 17c7
	ld hl, $ff96 ; 17c8
	ld a, d ; 17cb
	cp e ; 17cc
	jr z, Function17e6 ; 17cd
	jr c, Function17dc ; 17cf
	ld a, [hl] ; 17d1
	cp d ; 17d2
	jr nc, Function17e6 ; 17d3
	cp e ; 17d5
	jr c, Function17e6 ; 17d6
	jr z, Function17e6 ; 17d8
	jr Function17e8 ; 17da
; 17dc

Function17dc::
	ld a, e ; 17dc
	cp [hl] ; 17dd
	jr c, Function17e8 ; 17de
	ld a, [hl] ; 17e0
	cp d ; 17e1
	jr nc, Function17e6 ; 17e2
	jr Function17e8 ; 17e4
; 17e6

Function17e6::
	and a ; 17e6
	ret ; 17e7
; 17e8

Function17e8::
	scf ; 17e8
	ret ; 17e9
; 17ea

Function17ea::
	ldh [$ffb1], a ; 17ea
	call Function176f ; 17ec
	call Function46d7 ; 17ef
	ret ; 17f2
; 17f3

Function17f3::
	ldh [$ffb1], a ; 17f3
	call Function2841 ; 17f5
	ldh a, [$ffb1] ; 17f8
	call Function176f ; 17fa
	ld a, $2 ; 17fd
	ld hl, $46d7 ; 17ff
	rst FarCall ; 1802
	ret ; 1803
; 1804

Function1804::
	ldh [$ffb1], a ; 1804
	call Function176f ; 1806
	ld hl, $0 ; 1809
	add hl, bc ; 180c
	ld a, [hl] ; 180d
	cp $ff ; 180e
	ret z ; 1810
	ld [hl], $ff ; 1811
	push af ; 1813
	call Function1822 ; 1814
	pop af ; 1817
	call Function1982 ; 1818
	ld a, $1 ; 181b
	ld hl, $4358 ; 181d
	rst FarCall ; 1820
	ret ; 1821
; 1822

Function1822::
	ld hl, $d1f4 ; 1822
	cp [hl] ; 1825
	jr z, Function182d ; 1826
	ld hl, $d1f5 ; 1828
	cp [hl] ; 182b
	ret nz ; 182c
	ld a, $1 ; 182d
	ld hl, $5795 ; 182f
	rst FarCall ; 1832
	ld a, $ff ; 1833
	ld [$d1f4], a ; 1835
	ld [$d1f5], a ; 1838
	ret ; 183b
; 183c

Function183c::
	call Function1804 ; 183c
	call Function2835 ; 183f
	ret ; 1842
; 1843

Function1843::
	push hl ; 1843
	call Function176f ; 1844
	ld d, b ; 1847
	ld e, c ; 1848
	ld a, $ff ; 1849
	ld [de], a ; 184b
	inc de ; 184c
	pop hl ; 184d
	ld bc, $f ; 184e
	call Function311a ; 1851
	ret ; 1854
; 1855

Function1855::
	call Function176f ; 1855
	ld hl, $0 ; 1858
	add hl, bc ; 185b
	ld a, [hl] ; 185c
	push af ; 185d
	ld [hl], $ff ; 185e
	inc hl ; 1860
	ld bc, $f ; 1861
	xor a ; 1864
	call Function314c ; 1865
	pop af ; 1868
	cp $ff ; 1869
	ret z ; 186b
	cp $d ; 186c
	ret nc ; 186e
	ld b, a ; 186f
	ld a, [$d1f4] ; 1870
	cp b ; 1873
	jr nz, Function187b ; 1874
	ld a, $ff ; 1876
	ld [$d1f4], a ; 1878
	ld a, b ; 187b
	call Function1982 ; 187c
	ld a, $1 ; 187f
	ld hl, $4358 ; 1881
	rst FarCall ; 1884
	ret ; 1885
; 1886

Function1886::
	ld [$ce8b], a ; 1886
	ldh a, [hROMBank] ; 1889
	ld [$ce8c], a ; 188b
	ld a, l ; 188e
	ld [$ce8d], a ; 188f
	ld a, h ; 1892
	ld [$ce8e], a ; 1893
	ld a, [$ce8b] ; 1896
	call Function177b ; 1899
	ret c ; 189c
	ld hl, $3 ; 189d
	add hl, bc ; 18a0
	ld [hl], $14 ; 18a1
	ld hl, $9 ; 18a3
	add hl, bc ; 18a6
	ld [hl], $0 ; 18a7
	ld hl, $cfe5 ; 18a9
	set 7, [hl] ; 18ac
	and a ; 18ae
	ret ; 18af
; 18b0

Function18b0::
	push bc ; 18b0
	push de ; 18b1
	ld hl, $d1fd ; 18b2
	ld de, $28 ; 18b5
	ld c, $d ; 18b8
	ld a, [hl] ; 18ba
	and a ; 18bb
	jr z, Function18c5 ; 18bc
	add hl, de ; 18be
	dec c ; 18bf
	jr nz, Function18ba ; 18c0
	xor a ; 18c2
	jr Function18c9 ; 18c3
; 18c5

Function18c5::
	ld a, $d ; 18c5
	sub c ; 18c7
	scf ; 18c8
	pop de ; 18c9
	pop bc ; 18ca
	ret ; 18cb
; 18cc

Function18cc::
	ld hl, $3 ; 18cc
	add hl, bc ; 18cf
	ld a, [hl] ; 18d0
	cp $25 ; 18d1
	jr c, Function18d6 ; 18d3
	xor a ; 18d5
	ld hl, $4274 ; 18d6
	ld e, a ; 18d9
	ld d, $0 ; 18da
	add hl, de ; 18dc
	add hl, de ; 18dd
	add hl, de ; 18de
	add hl, de ; 18df
	add hl, de ; 18e0
	add hl, de ; 18e1
	ld a, [hl] ; 18e2
	ret ; 18e3
; 18e4

Function18e4::
	push bc ; 18e4
	push de ; 18e5
	ld e, a ; 18e6
	ld d, $0 ; 18e7
	ld hl, $4275 ; 18e9
	add hl, de ; 18ec
	add hl, de ; 18ed
	add hl, de ; 18ee
	add hl, de ; 18ef
	add hl, de ; 18f0
	add hl, de ; 18f1
	ld a, $1 ; 18f2
	call Function3128 ; 18f4
	add a ; 18f7
	add a ; 18f8
	and $c ; 18f9
	pop de ; 18fb
	pop bc ; 18fc
	ret ; 18fd
; 18fe

Function18fe::
	ld l, a ; 18fe
	ldh a, [hROMBank] ; 18ff
	push af ; 1901
	ld a, $1 ; 1902
	rst Bankswitch ; 1904
	ld a, l ; 1905
	push bc ; 1906
	call Function190e ; 1907
	pop bc ; 190a
	pop af ; 190b
	rst Bankswitch ; 190c
	ret ; 190d
; 190e

Function190e::
	ld hl, $3 ; 190e
	add hl, de ; 1911
	ld [hl], a ; 1912
	push de ; 1913
	ld e, a ; 1914
	ld d, $0 ; 1915
	ld hl, $4275 ; 1917
	add hl, de ; 191a
	add hl, de ; 191b
	add hl, de ; 191c
	add hl, de ; 191d
	add hl, de ; 191e
	add hl, de ; 191f
	ld b, h ; 1920
	ld c, l ; 1921
	pop de ; 1922
	ld a, [bc] ; 1923
	inc bc ; 1924
	rlca ; 1925
	rlca ; 1926
	and $c ; 1927
	ld hl, $8 ; 1929
	add hl, de ; 192c
	ld [hl], a ; 192d
	ld a, [bc] ; 192e
	inc bc ; 192f
	ld hl, $b ; 1930
	add hl, de ; 1933
	ld [hl], a ; 1934
	ld a, [bc] ; 1935
	inc bc ; 1936
	ld hl, $4 ; 1937
	add hl, de ; 193a
	ld [hl], a ; 193b
	ld a, [bc] ; 193c
	inc bc ; 193d
	ld hl, $5 ; 193e
	add hl, de ; 1941
	ld [hl], a ; 1942
	ld a, [bc] ; 1943
	inc bc ; 1944
	ld hl, $6 ; 1945
	add hl, de ; 1948
	ld [hl], a ; 1949
	ret ; 194a
; 194b

Function194b::
	ldh a, [hROMBank] ; 194b
	push af ; 194d
	ld a, [hli] ; 194e
	rst Bankswitch ; 194f
	ld a, [hli] ; 1950
	ld d, [hl] ; 1951
	ld hl, $1b ; 1952
	add hl, bc ; 1955
	add [hl] ; 1956
	ld e, a ; 1957
	ld a, d ; 1958
	adc a, $0 ; 1959
	ld d, a ; 195b
	inc [hl] ; 195c
	ld a, [de] ; 195d
	ld h, a ; 195e
	pop af ; 195f
	rst Bankswitch ; 1960
	ld a, h ; 1961
	ret ; 1962
; 1963

Function1963::
	ld hl, $cfe5 ; 1963
	set 0, [hl] ; 1966
	ret ; 1968
; 1969

Function1969::
	ld hl, $cfe5 ; 1969
	res 0, [hl] ; 196c
	ret ; 196e
; 196f

Function196f::
	ld a, [$cfe5] ; 196f
	bit 0, a ; 1972
	ret z ; 1974
	ld a, $1 ; 1975
	ld hl, $557f ; 1977
	rst FarCall ; 197a
	ld a, $1 ; 197b
	ld hl, $5896 ; 197d
	rst FarCall ; 1980
	ret ; 1981
; 1982

Function1982::
	ld bc, $28 ; 1982
	ld hl, $d1fd ; 1985
	call Function31a3 ; 1988
	ld b, h ; 198b
	ld c, l ; 198c
	ret ; 198d
; 198e

Function198e::
	ld hl, $0 ; 198e
	add hl, bc ; 1991
	ld a, [hl] ; 1992
	and a ; 1993
	ret ; 1994
; 1995

Function1995::
	push af ; 1995
	ld hl, $8 ; 1996
	add hl, bc ; 1999
	ld a, [hl] ; 199a
	and $f3 ; 199b
	ld e, a ; 199d
	pop af ; 199e
	and $c ; 199f
	or e ; 19a1
	ld [hl], a ; 19a2
	ret ; 19a3
; 19a4

Function19a4::
	ld hl, $8 ; 19a4
	add hl, bc ; 19a7
	ld a, [hl] ; 19a8
	and $c ; 19a9
	ret ; 19ab
; 19ac

Function19ac::
	add a, $10 ; 19ac
	ld e, a ; 19ae
	ldh a, [hROMBank] ; 19af
	push af ; 19b1
	ld a, $2 ; 19b2
	rst Bankswitch ; 19b4
	call Function4ac9 ; 19b5
	pop af ; 19b8
	rst Bankswitch ; 19b9
	ret ; 19ba
; 19bb

Function19bb::
	ld [$ceee], a ; 19bb
	xor a ; 19be
	ld [$ceed], a ; 19bf
	ld a, $0 ; 19c2
	ld [$ceef], a ; 19c4
	ld a, $f2 ; 19c7
	ld [$cef0], a ; 19c9
	ld a, $ce ; 19cc
	ld [$cef1], a ; 19ce
	ret ; 19d1
; 19d2

Function19d2::
	ld a, [$ceed] ; 19d2
	and a ; 19d5
	ret z ; 19d6
	dec a ; 19d7
	ld [$ceed], a ; 19d8
	ret ; 19db
; 19dc

Function19dc::
	push hl ; 19dc
	push de ; 19dd
	ld hl, $ceed ; 19de
	ld e, [hl] ; 19e1
	inc [hl] ; 19e2
	ld d, $0 ; 19e3
	ld hl, $cef2 ; 19e5
	add hl, de ; 19e8
	ld [hl], a ; 19e9
	pop de ; 19ea
	pop hl ; 19eb
	ret ; 19ec
; 19ed

Function19ed::
	push af ; 19ed
	ld a, c ; 19ee
	and a ; 19ef
	jr nz, Function19f4 ; 19f0
	pop af ; 19f2
	ret ; 19f3
; 19f4

Function19f4::
	pop af ; 19f4
	call Function19dc ; 19f5
	dec c ; 19f8
	jr nz, Function19f5 ; 19f9
	ret ; 19fb
; 19fc

Function19fc::
	push af ; 19fc
	ld a, b ; 19fd
	sub d ; 19fe
	ld h, $2 ; 19ff
	jr nc, Function1a07 ; 1a01
	dec a ; 1a03
	cpl ; 1a04
	ld h, $3 ; 1a05
	ld d, a ; 1a07
	ld a, c ; 1a08
	sub e ; 1a09
	ld l, $1 ; 1a0a
	jr nc, Function1a12 ; 1a0c
	dec a ; 1a0e
	cpl ; 1a0f
	ld l, $0 ; 1a10
	ld e, a ; 1a12
	cp d ; 1a13
	jr nc, Function1a1c ; 1a14
	ld a, h ; 1a16
	ld h, l ; 1a17
	ld l, a ; 1a18
	ld a, d ; 1a19
	ld d, e ; 1a1a
	ld e, a ; 1a1b
	pop af ; 1a1c
	ld b, a ; 1a1d
	ld a, h ; 1a1e
	call Function1a2f ; 1a1f
	ld c, d ; 1a22
	call Function19ed ; 1a23
	ld a, l ; 1a26
	call Function1a2f ; 1a27
	ld c, e ; 1a2a
	call Function19ed ; 1a2b
	ret ; 1a2e
; 1a2f

Function1a2f::
	push de ; 1a2f
	push hl ; 1a30
	ld l, b ; 1a31
	ld h, $0 ; 1a32
	add hl, hl ; 1a34
	add hl, hl ; 1a35
	ld e, a ; 1a36
	ld d, $0 ; 1a37
	add hl, deadd hl, de ; 1a39 ; 1a39
	ld de, $1a42 ; 1a3a
	add hl, de ; 1a3d
	ld a, [hl] ; 1a3e
	pop hl ; 1a3f
	pop de ; 1a40
	ret ; 1a41
; 1a42

Function1a42::
	ld [$a09], sp ; 1a42
	dec bc ; 1a45
	inc c ; 1a46
	dec c ; 1a47
	ld c, $f ; 1a48
	<corrupted stop> ; 1a4a
	ld [de], a ; 1a4c
	inc de ; 1a4d
	push hl ; 1a4e
	push bc ; 1a4f
	ld hl, $ced8 ; 1a50
	ld b, $8 ; 1a53
	ld a, [de] ; 1a55
	inc de ; 1a56
	ld [hli], a ; 1a57
	dec b ; 1a58
	jr nz, Function1a55 ; 1a59
	ld a, $1 ; 1a5b
	ld [hli], a ; 1a5d
	ld [hli], a ; 1a5e
	xor a ; 1a5f
	ld [hli], a ; 1a60
	ld [hli], a ; 1a61
	ld [hli], a ; 1a62
	pop bc ; 1a63
	pop hl ; 1a64
	ret ; 1a65
; 1a66

Function1a66::
	ld hl, $4136 ; 1a66
	ld a, $9 ; 1a69
	rst FarCall ; 1a6b
	call Function1a7a ; 1a6c
	ret ; 1a6f
; 1a70

Function1a70::
	ld hl, $4139 ; 1a70
	ld a, $9 ; 1a73
	rst FarCall ; 1a75
	call Function1a7a ; 1a76
	ret ; 1a79
; 1a7a

Function1a7a::
	push bc ; 1a7a
	push af ; 1a7b
	ldh a, [$ffab] ; 1a7c
	and $f0 ; 1a7e
	ld b, a ; 1a80
	ldh a, [$ffa9] ; 1a81
	and $f ; 1a83
	or b ; 1a85
	ld b, a ; 1a86
	pop af ; 1a87
	ld a, b ; 1a88
	pop bc ; 1a89
	ret ; 1a8a
; 1a8b

Function1a8b::
	ld hl, $cee3 ; 1a8b
	ld a, [hli] ; 1a8e
	ld h, [hl] ; 1a8f
	ld l, a ; 1a90
	ld [hl], $ec ; 1a91
	ret ; 1a93
; 1a94

Function1a94::
	ld hl, $cee3 ; 1a94
	ld a, [hli] ; 1a97
	ld h, [hl] ; 1a98
	ld l, a ; 1a99
	ld [hl], $7f ; 1a9a
	ret ; 1a9c
; 1a9d

Function1a9d::
	ld hl, $42a0 ; 1a9d
	ld a, $9 ; 1aa0
	rst FarCall ; 1aa2
	ret ; 1aa3
; 1aa4

Function1aa4::
	push af ; 1aa4
	ld hl, $4307 ; 1aa5
	ld a, $9 ; 1aa8
	rst FarCall ; 1aaa
	pop af ; 1aab
	ret ; 1aac
; 1aad

Function1aad::
	ld hl, $4395 ; 1aad
	ld a, $9 ; 1ab0
	rst FarCall ; 1ab2
	ret ; 1ab3
; 1ab4

Function1ab4::
	push af ; 1ab4
	call Function1aa4 ; 1ab5
	call Function3472 ; 1ab8
	call Function196f ; 1abb
	pop af ; 1abe
	ret ; 1abf
; 1ac0

Function1ac0::
	call Function1b90 ; 1ac0
	call Function1ae6 ; 1ac3
	inc b ; 1ac6
	inc c ; 1ac7
	push bc ; 1ac8
	push hl ; 1ac9
	ld a, [de] ; 1aca
	ld [hli], a ; 1acb
	dec de ; 1acc
	dec c ; 1acd
	jr nz, Function1aca ; 1ace
	pop hl ; 1ad0
	ld bc, $14 ; 1ad1
	add hl, bc ; 1ad4
	pop bc ; 1ad5
	dec b ; 1ad6
	jr nz, Function1ac8 ; 1ad7
	ret ; 1ad9
; 1ada

Function1ada::
	ld b, $10 ; 1ada
	ld de, $ceb8 ; 1adc
	ld a, [hld] ; 1adf
	ld [de], a ; 1ae0
	inc de ; 1ae1
	dec b ; 1ae2
	jr nz, Function1adf ; 1ae3
	ret ; 1ae5
; 1ae6

Function1ae6::
	ld a, [$ceb9] ; 1ae6
	ld b, a ; 1ae9
	ld a, [$cebb] ; 1aea
	sub b ; 1aed
	ld b, a ; 1aee
	ld a, [$ceba] ; 1aef
	ld c, a ; 1af2
	ld a, [$cebc] ; 1af3
	sub c ; 1af6
	ld c, a ; 1af7
	ret ; 1af8
; 1af9

Function1af9::
	push hl ; 1af9
	push de ; 1afa
	push bc ; 1afb
	push af ; 1afc
	ld hl, $cebd ; 1afd
	ld a, [hli] ; 1b00
	ld h, [hl] ; 1b01
	ld l, a ; 1b02
	ld de, $cec8 ; 1b03
	ld bc, $10 ; 1b06
	call Function311a ; 1b09
	pop af ; 1b0c
	pop bc ; 1b0d
	pop de ; 1b0e
	pop hl ; 1b0f
	ret ; 1b10
; 1b11

Function1b11::
	ld hl, $cea8 ; 1b11
	ld a, [hli] ; 1b14
	ld h, [hl] ; 1b15
	ld l, a ; 1b16
	inc hl ; 1b17
	ld a, [hli] ; 1b18
	ld h, [hl] ; 1b19
	ld l, a ; 1b1a
	ret ; 1b1b
; 1b1c

Function1b1c::
	call Function1af9 ; 1b1c
	ld hl, $cebd ; 1b1f
	ld e, [hl] ; 1b22
	inc hl ; 1b23
	ld d, [hl] ; 1b24
	call Function1b59 ; 1b25
	call Function1b98 ; 1b28
	inc de ; 1b2b
	ld a, [de] ; 1b2c
	inc de ; 1b2d
	ld b, a ; 1b2e
	push bc ; 1b2f
	call Functionf74 ; 1b30
	inc de ; 1b33
	ld bc, $28 ; 1b34
	add hl, bc ; 1b37
	pop bc ; 1b38
	dec b ; 1b39
	jr nz, Function1b2f ; 1b3a
	ld a, [$cec8] ; 1b3c
	bit 4, a ; 1b3f
	ret z ; 1b41
	call Function1b90 ; 1b42
	ld a, [de] ; 1b45
	ld c, a ; 1b46
	inc de ; 1b47
	ld b, $0 ; 1b48
	add hl, bc ; 1b4a
	jp Functionf74 ; 1b4b
; 1b4e

Function1b4e::
	call Function1b90 ; 1b4e
	call Function1ae6 ; 1b51
	dec b ; 1b54
	dec c ; 1b55
	jp Functioneef ; 1b56
; 1b59

Function1b59::
	ld a, [$ceb9] ; 1b59
	ld b, a ; 1b5c
	inc b ; 1b5d
	ld a, [$ceba] ; 1b5e
	ld c, a ; 1b61
	inc c ; 1b62
	ld a, [$cec8] ; 1b63
	bit 6, a ; 1b66
	jr nz, Function1b6b ; 1b68
	inc b ; 1b6a
	ld a, [$cec8] ; 1b6b
	bit 7, a ; 1b6e
	jr z, Function1b73 ; 1b70
	inc c ; 1b72
	ret ; 1b73
; 1b74

Function1b74::
	call Function1b90 ; 1b74
	ld bc, $15 ; 1b77
	add hl, bc ; 1b7a
	call Function1ae6 ; 1b7b
	dec b ; 1b7e
	dec c ; 1b7f
	call Functionebd ; 1b80
	ret ; 1b83
; 1b84

Function1b84::
	call Function1b90 ; 1b84
	call Function1ae6 ; 1b87
	inc c ; 1b8a
	inc b ; 1b8b
	call Functionebd ; 1b8c
	ret ; 1b8f
; 1b90

Function1b90::
	ld a, [$ceba] ; 1b90
	ld c, a ; 1b93
	ld a, [$ceb9] ; 1b94
	ld b, a ; 1b97
	xor a ; 1b98
	ld h, a ; 1b99
	ld l, b ; 1b9a
	ld a, c ; 1b9b
	ld b, h ; 1b9c
	ld c, l ; 1b9d
	add hl, hl ; 1b9e
	add hl, hl ; 1b9f
	add hl, bc ; 1ba0
	add hl, hl ; 1ba1
	add hl, hl ; 1ba2
	ld c, a ; 1ba3
	xor a ; 1ba4
	ld b, a ; 1ba5
	add hl, bc ; 1ba6
	ld bc, $c3a0 ; 1ba7
	add hl, bc ; 1baa
	ret ; 1bab
; 1bac

Function1bac::
	call Function1bb3 ; 1bac
	call Function1a9d ; 1baf
	ret ; 1bb2
; 1bb3

Function1bb3::
	ld de, $ceb8 ; 1bb3
	ld bc, $10 ; 1bb6
	call Function311a ; 1bb9
	ret ; 1bbc
; 1bbd

Function1bbd::
	ld [$cebf], a ; 1bbd
	ret ; 1bc0
; 1bc1

Function1bc1::
	push hl ; 1bc1
	call Function1bca ; 1bc2
	pop hl ; 1bc5
	jp Functionf5e ; 1bc6
; 1bc9

Function1bc9::
	ret ; 1bc9
; 1bca

Function1bca::
	ld hl, $1bd1 ; 1bca
	call Function1bac ; 1bcd
	ret ; 1bd0
; 1bd1

Function1bd1::
	ld b, b ; 1bd1
	inc c ; 1bd2
	nop ; 1bd3
	ld de, $13 ; 1bd4
	add b ; 1bd7
	nop ; 1bd8
	call Function1bc1 ; 1bd9
	call Function1ab4 ; 1bdc
	ret ; 1bdf
; 1be0

Function1be0::
	ld hl, $1be7 ; 1be0
	call Function1bac ; 1be3
	ret ; 1be6
; 1be7

Function1be7::
	ld b, b ; 1be7
	nop ; 1be8
	nop ; 1be9
	ld de, $13 ; 1bea
	nop ; 1bed
	ld bc, $a4cd ; 1bee
	ld a, [de] ; 1bf1
	ret ; 1bf2
; 1bf3

Function1bf3::
	xor a ; 1bf3
	ldh [$ffd6], a ; 1bf4
	call Function1b4e ; 1bf6
	call Function196f ; 1bf9
	call Function1b1c ; 1bfc
	call Function3472 ; 1bff
	call Function1af9 ; 1c02
	ld a, [$cec8] ; 1c05
	bit 7, a ; 1c08
	jr z, Function1c19 ; 1c0a
	call Function1aad ; 1c0c
	call Function1a66 ; 1c0f
	call Function1e5f ; 1c12
	bit 1, a ; 1c15
	jr z, Function1c1b ; 1c17
	scf ; 1c19
	ret ; 1c1a
; 1c1b

Function1c1b::
	and a ; 1c1b
	ret ; 1c1c
; 1c1d

Function1c1d::
	call Function1bac ; 1c1d
	call Function1bf3 ; 1c20
	call Function1ab4 ; 1c23
	ld a, [$cee0] ; 1c26
	ret ; 1c29
; 1c2a

Function1c2a::
	push hl ; 1c2a
	push bc ; 1c2b
	push af ; 1c2c
	ld hl, $cebd ; 1c2d
	ld a, [hli] ; 1c30
	ld h, [hl] ; 1c31
	ld l, a ; 1c32
	inc hl ; 1c33
	inc hl ; 1c34
	pop af ; 1c35
	call Function3654 ; 1c36
	ld d, h ; 1c39
	ld e, l ; 1c3a
	call Function317b ; 1c3b
	pop bc ; 1c3e
	pop hl ; 1c3f
	ret ; 1c40
; 1c41

Function1c41::
	ld bc, $e07 ; 1c41
	jr Function1c4b ; 1c44
; 1c46

Function1c46::
	call Function1bac ; 1c46
	jr Function1c68 ; 1c49
; 1c4b

Function1c4b::
	push bc ; 1c4b
	ld hl, $1c87 ; 1c4c
	call Function1bb3 ; 1c4f
	pop bc ; 1c52
	ld a, b ; 1c53
	ld [$ceba], a ; 1c54
	add a, $5 ; 1c57
	ld [$cebc], a ; 1c59
	ld a, c ; 1c5c
	ld [$ceb9], a ; 1c5d
	add a, $4 ; 1c60
	ld [$cebb], a ; 1c62
	call Function1a9d ; 1c65
	call Function1bf3 ; 1c68
	push af ; 1c6b
	ld c, $f ; 1c6c
	call Function33c ; 1c6e
	call Function1ab4 ; 1c71
	pop af ; 1c74
	jr c, Function1c80 ; 1c75
	ld a, [$cee0] ; 1c77
	cp $2 ; 1c7a
	jr z, Function1c80 ; 1c7c
	and a ; 1c7e
	ret ; 1c7f
; 1c80

Function1c80::
	ld a, $2 ; 1c80
	ld [$cee0], a ; 1c82
	scf ; 1c85
	ret ; 1c86
; 1c87

Function1c87::
	ld b, b ; 1c87
	dec b ; 1c88
	ld a, [bc] ; 1c89
	add hl, bc ; 1c8a
	rrca ; 1c8b
	adc a ; 1c8c
	inc e ; 1c8d
	ld bc, $2c0 ; 1c8e
	sbc b ; 1c91
	add h ; 1c92
	sub d ; 1c93
	ld d, b ; 1c94
	adc l ; 1c95
	adc [hl] ; 1c96
	ld d, b ; 1c97
	call Function1c9f ; 1c98
	call Function1a9d ; 1c9b
	ret ; 1c9e
; 1c9f

Function1c9f::
	push de ; 1c9f
	call Function1bb3 ; 1ca0
	pop de ; 1ca3
	ld a, [$ceba] ; 1ca4
	ld h, a ; 1ca7
	ld a, [$cebc] ; 1ca8
	sub h ; 1cab
	ld h, a ; 1cac
	ld a, d ; 1cad
	ld [$ceba], a ; 1cae
	add h ; 1cb1
	ld [$cebc], a ; 1cb2
	ld a, [$ceb9] ; 1cb5
	ld l, a ; 1cb8
	ld a, [$cebb] ; 1cb9
	sub l ; 1cbc
	ld l, a ; 1cbd
	ld a, e ; 1cbe
	ld [$ceb9], a ; 1cbf
	add l ; 1cc2
	ld [$cebb], a ; 1cc3
	ret ; 1cc6
; 1cc7

Function1cc7::
	call Function1ce9 ; 1cc7
	call Function1cf6 ; 1cca
	call Function1d69 ; 1ccd
	call Function1d8d ; 1cd0
	call Function1a7a ; 1cd3
	call Function1e5f ; 1cd6
	ret ; 1cd9
; 1cda

Function1cda::
	call Function1ce9 ; 1cda
	call Function1cf6 ; 1cdd
	call Function1d69 ; 1ce0
	ld hl, $cedc ; 1ce3
	set 7, [hl] ; 1ce6
	ret ; 1ce8
; 1ce9

Function1ce9::
	call Function1af9 ; 1ce9
	call Function1d27 ; 1cec
	call Function1d10 ; 1cef
	call Function1b4e ; 1cf2
	ret ; 1cf5
; 1cf6

Function1cf6::
	xor a ; 1cf6
	ldh [$ffd6], a ; 1cf7
	call Function1d27 ; 1cf9
	call Function1d44 ; 1cfc
	call Function2ef1 ; 1cff
	ldh a, [$ffda] ; 1d02
	push af ; 1d04
	ld a, $1 ; 1d05
	ldh [$ffda], a ; 1d07
	call Function3472 ; 1d09
	pop af ; 1d0c
	ldh [$ffda], a ; 1d0d
	ret ; 1d0f
; 1d10

Function1d10::
	ld a, [$ceba] ; 1d10
	ld c, a ; 1d13
	ld a, [$cebc] ; 1d14
	sub c ; 1d17
	ld c, a ; 1d18
	ld a, [$cec9] ; 1d19
	add a ; 1d1c
	inc a ; 1d1d
	ld b, a ; 1d1e
	ld a, [$ceb9] ; 1d1f
	add b ; 1d22
	ld [$cebb], a ; 1d23
	ret ; 1d26
; 1d27

Function1d27::
	ld hl, $ceca ; 1d27
	ld a, [hli] ; 1d2a
	ld h, [hl] ; 1d2b
	ld l, a ; 1d2c
	ld a, [$cead] ; 1d2d
	and a ; 1d30
	jr z, Function1d3d ; 1d31
	ld b, a ; 1d33
	ld c, $ff ; 1d34
	ld a, [hli] ; 1d36
	cp c ; 1d37
	jr nz, Function1d36 ; 1d38
	dec b ; 1d3a
	jr nz, Function1d36 ; 1d3b
	ld d, h ; 1d3d
	ld e, l ; 1d3e
	ld a, [hl] ; 1d3f
	ld [$cec9], a ; 1d40
	ret ; 1d43
; 1d44

Function1d44::
	call Function1b90 ; 1d44
	ld bc, $2a ; 1d47
	add hl, bc ; 1d4a
	inc de ; 1d4b
	ld a, [de] ; 1d4c
	cp $ff ; 1d4d
	ret z ; 1d4f
	ld [$ceab], a ; 1d50
	push de ; 1d53
	push hl ; 1d54
	ld d, h ; 1d55
	ld e, l ; 1d56
	ld hl, $cecc ; 1d57
	call Function1d65 ; 1d5a
	pop hl ; 1d5d
	ld de, $28 ; 1d5e
	add hl, de ; 1d61
	pop de ; 1d62
	jr Function1d4b ; 1d63
; 1d65

Function1d65::
	ld a, [hli] ; 1d65
	ld h, [hl] ; 1d66
	ld l, a ; 1d67
	jp [hl] ; 1d68
	call Function1aad ; 1d69
	ld hl, $cedf ; 1d6c
	ld a, [$cec8] ; 1d6f
	bit 3, a ; 1d72
	jr z, Function1d78 ; 1d74
	set 3, [hl] ; 1d76
	ld a, [$cec8] ; 1d78
	bit 2, a ; 1d7b
	jr z, Function1d83 ; 1d7d
	set 5, [hl] ; 1d7f
	set 4, [hl] ; 1d81
	ret ; 1d83
; 1d84

Function1d84::
	call Function1a70 ; 1d84
	ld hl, $cedf ; 1d87
	and [hl] ; 1d8a
	jr Function1d94 ; 1d8b
; 1d8d

Function1d8d::
	xor a ; 1d8d
	ld [$ceaa], a ; 1d8e
	call Function1a66 ; 1d91
	bit 0, a ; 1d94
	jr nz, Function1dbc ; 1d96
	bit 1, a ; 1d98
	jr nz, Function1dd7 ; 1d9a
	bit 3, a ; 1d9c
	jr nz, Function1dd7 ; 1d9e
	bit 4, a ; 1da0
	jr nz, Function1dae ; 1da2
	bit 5, a ; 1da4
	jr nz, Function1db5 ; 1da6
	xor a ; 1da8
	ld [$ceaa], a ; 1da9
	jr Function1dc1 ; 1dac
; 1dae

Function1dae::
	ld a, $10 ; 1dae
	ld [$ceaa], a ; 1db0
	jr Function1dc1 ; 1db3
; 1db5

Function1db5::
	ld a, $20 ; 1db5
	ld [$ceaa], a ; 1db7
	jr Function1dc1 ; 1dba
; 1dbc

Function1dbc::
	ld a, $1 ; 1dbc
	ld [$ceaa], a ; 1dbe
	call Function1d27 ; 1dc1
	ld a, [$cee0] ; 1dc4
	ld l, a ; 1dc7
	ld h, $0 ; 1dc8
	add hl, de ; 1dca
	ld a, [hl] ; 1dcb
	ld [$ceab], a ; 1dcc
	ld a, [$cee0] ; 1dcf
	ld [$cebf], a ; 1dd2
	and a ; 1dd5
	ret ; 1dd6
; 1dd7

Function1dd7::
	ld a, $2 ; 1dd7
	ld [$ceaa], a ; 1dd9
	ld a, $ff ; 1ddc
	ld [$ceab], a ; 1dde
	scf ; 1de1
	ret ; 1de2
; 1de3

Function1de3::
	push de ; 1de3
	ld hl, $cece ; 1de4
	ld a, [hli] ; 1de7
	ld h, [hl] ; 1de8
	ld l, a ; 1de9
	ld a, [$ceab] ; 1dea
	call Function3654 ; 1ded
	ld d, h ; 1df0
	ld e, l ; 1df1
	pop hl ; 1df2
	call Functionf74 ; 1df3
	ret ; 1df6
; 1df7

Function1df7::
	push de ; 1df7
	ld a, [$ceab] ; 1df8
	call Function1e1b ; 1dfb
	inc hl ; 1dfe
	inc hl ; 1dff
	ld a, [hli] ; 1e00
	ld d, [hl] ; 1e01
	ld e, a ; 1e02
	pop hl ; 1e03
	call Functionf74 ; 1e04
	ret ; 1e07
; 1e08

Function1e08::
	call Function1e1b ; 1e08
	inc hl ; 1e0b
	inc hl ; 1e0c
	ld a, [hli] ; 1e0d
	ld d, [hl] ; 1e0e
	ld e, a ; 1e0f
	ret ; 1e10
; 1e11

Function1e11::
	ld a, [$ceab] ; 1e11
	call Function1e1b ; 1e14
	ld a, [hli] ; 1e17
	ld h, [hl] ; 1e18
	ld l, a ; 1e19
	jp [hl] ; 1e1a
	ld e, a ; 1e1b
	ld d, $0 ; 1e1c
	ld hl, $cece ; 1e1e
	ld a, [hli] ; 1e21
	ld h, [hl] ; 1e22
	ld l, a ; 1e23
	add hl, de ; 1e24
	add hl, de ; 1e25
	add hl, de ; 1e26
	add hl, de ; 1e27
	ret ; 1e28
; 1e29

Function1e29::
	ld hl, $cea8 ; 1e29
	call Function1e57 ; 1e2c
	ld hl, $ceb8 ; 1e2f
	call Function1e57 ; 1e32
	ld hl, $cec8 ; 1e35
	call Function1e57 ; 1e38
	ld hl, $ced8 ; 1e3b
	call Function1e57 ; 1e3e
	xor a ; 1e41
	call OpenSRAM ; 1e42
	xor a ; 1e45
	ld hl, $bfff ; 1e46
	ld [hld], a ; 1e49
	ld [hld], a ; 1e4a
	ld a, l ; 1e4b
	ld [$cea8], a ; 1e4c
	ld a, h ; 1e4f
	ld [$cea9], a ; 1e50
	call CloseSRAM ; 1e53
	ret ; 1e56
; 1e57

Function1e57::
	ld bc, $10 ; 1e57
	xor a ; 1e5a
	call Function314c ; 1e5b
	ret ; 1e5e
; 1e5f

Function1e5f::
	push af ; 1e5f
	and $3 ; 1e60
	jr z, Function1e6e ; 1e62
	ld hl, $ceb8 ; 1e64
	bit 3, a ; 1e67
	jr nz, Function1e6e ; 1e69
	call Function1e70 ; 1e6b
	pop af ; 1e6e
	ret ; 1e6f
; 1e70

Function1e70::
	push de ; 1e70
	ld de, $8 ; 1e71
	call Function3e24 ; 1e74
	pop de ; 1e77
	ret ; 1e78
; 1e79

Function1e79::
	call Function1bc1 ; 1e79
	call Function9f7 ; 1e7c
	call Function1aa4 ; 1e7f
	ret ; 1e82
; 1e83

Function1e83::
	ld [$d156], a ; 1e83
	ldh a, [hROMBank] ; 1e86
	push af ; 1e88
	ld a, [$d156] ; 1e89
	rst Bankswitch ; 1e8c
	call Functionf74 ; 1e8d
	pop af ; 1e90
	rst Bankswitch ; 1e91
	ret ; 1e92
; 1e93

Function1e93::
	call Function1af9 ; 1e93
	ldh a, [hROMBank] ; 1e96
	ld [$cecb], a ; 1e98
	push af ; 1e9b
	ld a, $9 ; 1e9c
	rst Bankswitch ; 1e9e
	call Function400e ; 1e9f
	pop bc ; 1ea2
	ld a, b ; 1ea3
	rst Bankswitch ; 1ea4
	ld a, [$cebf] ; 1ea5
	ret ; 1ea8
; 1ea9

Function1ea9::
	xor a ; 1ea9
	ldh [$ffd6], a ; 1eaa
	ld a, $90 ; 1eac
	ldh [$ff4a], a ; 1eae
	ldh [$ffd4], a ; 1eb0
	ret ; 1eb2
; 1eb3

Function1eb3::
	ldh a, [hROMBank] ; 1eb3
	push af ; 1eb5
	ld a, $21 ; 1eb6
	rst Bankswitch ; 1eb8
	call Function42db ; 1eb9
	pop af ; 1ebc
	rst Bankswitch ; 1ebd
	ret ; 1ebe
; 1ebf

Function1ebf::
	ld a, [$c1d3] ; 1ebf
	bit 0, a ; 1ec2
	ret z ; 1ec4
	ld a, [$c1d4] ; 1ec5
	and a ; 1ec8
	ret nz ; 1ec9
	ld hl, $c98a ; 1eca
	inc [hl] ; 1ecd
	ld a, [hl] ; 1ece
	cp $6 ; 1ecf
	ret c ; 1ed1
	xor a ; 1ed2
	ld [hl], a ; 1ed3
	ld a, $c ; 1ed4
	ld [$c1d4], a ; 1ed6
	ld a, $88 ; 1ed9
	ldh [$ff01], a ; 1edb
	ld a, $1 ; 1edd
	ldh [$ff02], a ; 1edf
	ld a, $81 ; 1ee1
	ldh [$ff02], a ; 1ee3
	ret ; 1ee5
; 1ee6

Function1ee6::
	xor a ; 1ee6
	ld [$d1ea], a ; 1ee7
	ld [$d1eb], a ; 1eea
	ld [$d1ec], a ; 1eed
	ld [$d1ed], a ; 1ef0
	ld [$d1ee], a ; 1ef3
	ld [$d1ef], a ; 1ef6
	ret ; 1ef9
; 1efa

Function1efa::
	nop ; 1efa
	ld a, [$c1cc] ; 1efb
	and a ; 1efe
	ret nz ; 1eff
	ld hl, $d8b8 ; 1f00
	bit 0, [hl] ; 1f03
	ret z ; 1f05
	ld hl, $d1ea ; 1f06
	bit 0, [hl] ; 1f09
	ret nz ; 1f0b
	ld hl, $d1ef ; 1f0c
	ld a, [hl] ; 1f0f
	inc a ; 1f10
	cp $3c ; 1f11
	jr nc, Function1f17 ; 1f13
	ld [hl], a ; 1f15
	ret ; 1f16
; 1f17

Function1f17::
	xor a ; 1f17
	ld [hl], a ; 1f18
	ld hl, $d1ee ; 1f19
	ld a, [hl] ; 1f1c
	inc a ; 1f1d
	cp $3c ; 1f1e
	jr nc, Function1f24 ; 1f20
	ld [hl], a ; 1f22
	ret ; 1f23
; 1f24

Function1f24::
	xor a ; 1f24
	ld [hl], a ; 1f25
	ld hl, $d1ed ; 1f26
	ld a, [hl] ; 1f29
	inc a ; 1f2a
	cp $3c ; 1f2b
	jr nc, Function1f31 ; 1f2d
	ld [hl], a ; 1f2f
	ret ; 1f30
; 1f31

Function1f31::
	xor a ; 1f31
	ld [hl], a ; 1f32
	ld a, [$d1eb] ; 1f33
	ld h, a ; 1f36
	ld a, [$d1ec] ; 1f37
	ld l, a ; 1f3a
	inc hl ; 1f3b
	ld a, h ; 1f3c
	cp $3 ; 1f3d
	jr c, Function1f54 ; 1f3f
	ld a, l ; 1f41
	cp $e8 ; 1f42
	jr c, Function1f54 ; 1f44
	ld hl, $d1ea ; 1f46
	set 0, [hl] ; 1f49
	ld a, $3b ; 1f4b
	ld [$d1ed], a ; 1f4d
	ld [$d1ee], a ; 1f50
	ret ; 1f53
; 1f54

Function1f54::
	ld a, h ; 1f54
	ld [$d1eb], a ; 1f55
	ld a, l ; 1f58
	ld [$d1ec], a ; 1f59
	ret ; 1f5c
; 1f5d

Function1f5d::
	ld hl, $c6e8 ; 1f5d
	ld bc, $18 ; 1f60
	ld a, $0 ; 1f63
	call Function314c ; 1f65
	ret ; 1f68
; 1f69

Function1f69::
	push hl ; 1f69
	ld hl, $d941 ; 1f6a
	ld a, [hli] ; 1f6d
	ld h, [hl] ; 1f6e
	ld l, a ; 1f6f
	or h ; 1f70
	ld a, [hl] ; 1f71
	jr nz, Function1f76 ; 1f72
	ld a, $ff ; 1f74
	pop hl ; 1f76
	ret ; 1f77
; 1f78

Function1f78::
	ld a, [$da00] ; 1f78
	ld b, a ; 1f7b
	ld a, [$da01] ; 1f7c
	ld c, a ; 1f7f
	xor a ; 1f80
	ld [$d941], a ; 1f81
	ld [$d942], a ; 1f84
	call Function1f95 ; 1f87
	ret c ; 1f8a
	ld a, e ; 1f8b
	ld [$d941], a ; 1f8c
	ld a, d ; 1f8f
	ld [$d942], a ; 1f90
	xor a ; 1f93
	ret ; 1f94
; 1f95

Function1f95::
	push bc ; 1f95
	ldh a, [hROMBank] ; 1f96
	push af ; 1f98
	ld a, $25 ; 1f99
	rst Bankswitch ; 1f9b
	ld hl, $4000 ; 1f9c
	push hl ; 1f9f
	ld a, [hli] ; 1fa0
	cp $ff ; 1fa1
	jr z, Function1fb5 ; 1fa3
	cp b ; 1fa5
	jr nz, Function1fae ; 1fa6
	ld a, [hli] ; 1fa8
	cp c ; 1fa9
	jr nz, Function1fae ; 1faa
	jr Function1fb8 ; 1fac
; 1fae

Function1fae::
	pop hl ; 1fae
	ld de, $4 ; 1faf
	add hl, de ; 1fb2
	jr Function1f9f ; 1fb3
; 1fb5

Function1fb5::
	scf ; 1fb5
	jr Function1fbb ; 1fb6
; 1fb8

Function1fb8::
	ld e, [hl] ; 1fb8
	inc hl ; 1fb9
	ld d, [hl] ; 1fba
	pop hl ; 1fbb
	pop bc ; 1fbc
	ld a, b ; 1fbd
	rst Bankswitch ; 1fbe
	pop bc ; 1fbf
	ret ; 1fc0
; 1fc1

Function1fc1::
	call Function1fc8 ; 1fc1
	call Functiond58 ; 1fc4
	ret ; 1fc7
; 1fc8

Function1fc8::
	ldh a, [hROMBank] ; 1fc8
	push af ; 1fca
	ld a, [$d0c5] ; 1fcb
	rst Bankswitch ; 1fce
	call Function1fe6 ; 1fcf
	ld a, $60 ; 1fd2
	ld hl, $c3a0 ; 1fd4
	ld bc, $168 ; 1fd7
	call Function314c ; 1fda
	ld a, $5 ; 1fdd
	rst Bankswitch ; 1fdf
	call Function538d ; 1fe0
	pop af ; 1fe3
	rst Bankswitch ; 1fe4
	ret ; 1fe5
; 1fe6

Function1fe6::
	ld a, [$d07d] ; 1fe6
	ld e, a ; 1fe9
	ld a, [$d07e] ; 1fea
	ld d, a ; 1fed
	ld hl, $c508 ; 1fee
	ld b, $5 ; 1ff1
	push de ; 1ff3
	push hl ; 1ff4
	ld c, $6 ; 1ff5
	push de ; 1ff7
	push hl ; 1ff8
	ld a, [de] ; 1ff9
	and a ; 1ffa
	jr nz, Function2000 ; 1ffb
	ld a, [$d086] ; 1ffd
	ld e, l ; 2000
	ld d, h ; 2001
	add a ; 2002
	ld l, a ; 2003
	ld h, $0 ; 2004
	add hl, hl ; 2006
	add hl, hl ; 2007
	add hl, hl ; 2008
	ld a, [$d0c6] ; 2009
	add l ; 200c
	ld l, a ; 200d
	ld a, [$d0c7] ; 200e
	adc h ; 2011
	ld h, a ; 2012
	ld a, [hli] ; 2013
	ld [de], a ; 2014
	inc de ; 2015
	ld a, [hli] ; 2016
	ld [de], a ; 2017
	inc de ; 2018
	ld a, [hli] ; 2019
	ld [de], a ; 201a
	inc de ; 201b
	ld a, [hli] ; 201c
	ld [de], a ; 201d
	inc de ; 201e
	ld a, e ; 201f
	add a, $14 ; 2020
	ld e, a ; 2022
	jr nc, Function2026 ; 2023
	inc d ; 2025
	ld a, [hli] ; 2026
	ld [de], a ; 2027
	inc de ; 2028
	ld a, [hli] ; 2029
	ld [de], a ; 202a
	inc de ; 202b
	ld a, [hli] ; 202c
	ld [de], a ; 202d
	inc de ; 202e
	ld a, [hli] ; 202f
	ld [de], a ; 2030
	inc de ; 2031
	ld a, e ; 2032
	add a, $14 ; 2033
	ld e, a ; 2035
	jr nc, Function2039 ; 2036
	inc d ; 2038
	ld a, [hli] ; 2039
	ld [de], a ; 203a
	inc de ; 203b
	ld a, [hli] ; 203c
	ld [de], a ; 203d
	inc de ; 203e
	ld a, [hli] ; 203f
	ld [de], a ; 2040
	inc de ; 2041
	ld a, [hli] ; 2042
	ld [de], a ; 2043
	inc de ; 2044
	ld a, e ; 2045
	add a, $14 ; 2046
	ld e, a ; 2048
	jr nc, Function204c ; 2049
	inc d ; 204b
	ld a, [hli] ; 204c
	ld [de], a ; 204d
	inc de ; 204e
	ld a, [hli] ; 204f
	ld [de], a ; 2050
	inc de ; 2051
	ld a, [hli] ; 2052
	ld [de], a ; 2053
	inc de ; 2054
	ld a, [hli] ; 2055
	ld [de], a ; 2056
	inc de ; 2057
	pop hl ; 2058
	ld de, $4 ; 2059
	add hl, de ; 205c
	pop de ; 205d
	inc de ; 205e
	dec c ; 205f
	jp nz, Function1ff7 ; 2060
	pop hl ; 2063
	ld de, $60 ; 2064
	add hl, de ; 2067
	pop de ; 2068
	ld a, [$d088] ; 2069
	add a, $6 ; 206c
	add e ; 206e
	ld e, a ; 206f
	jr nc, Function2073 ; 2070
	inc d ; 2072
	dec b ; 2073
	jp nz, Function1ff3 ; 2074
	ret ; 2077
; 2078

Function2078::
	ld a, $fa ; 2078
	ldh [$ffa1], a ; 207a
	ld a, $5 ; 207c
	ld hl, $5484 ; 207e
	rst FarCall ; 2081
	xor a ; 2082
	ldh [$ffa1], a ; 2083
	ret ; 2085
; 2086

Function2086::
	call Function1f5d ; 2086
	call Function2f10 ; 2089
	call Function2f1d ; 208c
	call Function1f78 ; 208f
	call Function2f16 ; 2092
	ld a, $5 ; 2095
	call Function2764 ; 2097
	ld a, $25 ; 209a
	ld hl, $7c2a ; 209c
	rst FarCall ; 209f
	ld a, $3 ; 20a0
	call Function2764 ; 20a2
	call Function2dd2 ; 20a5
	ld [$c1cf], a ; 20a8
	ret ; 20ab
; 20ac

Function20ac::
	ld a, $1 ; 20ac
	ld [$c1cd], a ; 20ae
	ld a, $23 ; 20b1
	ld hl, $43e9 ; 20b3
	rst FarCall ; 20b6
	ld a, $23 ; 20b7
	ld hl, $4356 ; 20b9
	rst FarCall ; 20bc
	call Function1fc1 ; 20bd
	call Function20c7 ; 20c0
	call Function20e6 ; 20c3
	ret ; 20c6
; 20c7

Function20c7::
	ld a, $98 ; 20c7
	ld [$d05c], a ; 20c9
	xor a ; 20cc
	ld [$d05b], a ; 20cd
	ldh [$ffd2], a ; 20d0
	ldh [$ffd1], a ; 20d2
	ld a, $1 ; 20d4
	ld hl, $58c5 ; 20d6
	rst FarCall ; 20d9
	ld a, $60 ; 20da
	ld bc, $400 ; 20dc
	ld hl, $9800 ; 20df
	call Function314c ; 20e2
	ret ; 20e5
; 20e6

Function20e6::
	ld de, $c3a0 ; 20e6
	call Function20f7 ; 20e9
	ldh a, [$ffe8] ; 20ec
	and a ; 20ee
	ret z ; 20ef
	ld de, $ccd9 ; 20f0
	ld a, $1 ; 20f3
	ldh [$ff4f], a ; 20f5
	ld hl, $9800 ; 20f7
	ld c, $14 ; 20fa
	ld b, $12 ; 20fc
	push bc ; 20fe
	ld a, [de] ; 20ff
	inc de ; 2100
	ld [hli], a ; 2101
	dec c ; 2102
	jr nz, Function20ff ; 2103
	ld bc, $c ; 2105
	add hl, bc ; 2108
	pop bc ; 2109
	dec b ; 210a
	jr nz, Function20fe ; 210b
	ld a, $0 ; 210d
	ldh [$ff4f], a ; 210f
	ret ; 2111
; 2112

Function2112::
	call Function2dfa ; 2112
	call Function2944 ; 2115
	xor a ; 2118
	ldh [$ffe0], a ; 2119
	xor a ; 211b
	ldh [$ffe1], a ; 211c
	ld a, $5 ; 211e
	ld hl, $416d ; 2120
	rst FarCall ; 2123
	call Functiondac ; 2124
	ret ; 2127
; 2128

Function2128::
	ld b, $9 ; 2128
	jp Function3583 ; 212a
; 212d

Function212d::
	call Function30ff ; 212d
	call Function1ea9 ; 2130
	call Function2a05 ; 2133
	ld a, $1 ; 2136
	ld hl, $5730 ; 2138
	rst FarCall ; 213b
	ld a, $5 ; 213c
	ld hl, $5612 ; 213e
	rst FarCall ; 2141
	ld hl, $d182 ; 2142
	bit 6, [hl] ; 2145
	jr nz, Function2151 ; 2147
	ld hl, $cfe5 ; 2149
	set 0, [hl] ; 214c
	call Function2ef1 ; 214e
	xor a ; 2151
	ld [$d182], a ; 2152
	ret ; 2155
; 2156

Function2156::
	ld a, [$ce86] ; 2156
	cp $ff ; 2159
	ret z ; 215b
	and a ; 215c
	jr z, Function216d ; 215d
	cp $1 ; 215f
	jr z, Function217c ; 2161
	cp $2 ; 2163
	jr z, Function2187 ; 2165
	cp $3 ; 2167
	jr z, Function2192 ; 2169
	and a ; 216b
	ret ; 216c
; 216d

Function216d::
	ld a, [$d20e] ; 216d
	sub a, $4 ; 2170
	ld b, a ; 2172
	ld a, [$d087] ; 2173
	add a ; 2176
	cp b ; 2177
	jr z, Function21a1 ; 2178
	and a ; 217a
	ret ; 217b
; 217c

Function217c::
	ld a, [$d20e] ; 217c
	sub a, $4 ; 217f
	cp $ff ; 2181
	jr z, Function21a1 ; 2183
	and a ; 2185
	ret ; 2186
; 2187

Function2187::
	ld a, [$d20d] ; 2187
	sub a, $4 ; 218a
	cp $ff ; 218c
	jr z, Function21a1 ; 218e
	and a ; 2190
	ret ; 2191
; 2192

Function2192::
	ld a, [$d20d] ; 2192
	sub a, $4 ; 2195
	ld b, a ; 2197
	ld a, [$d088] ; 2198
	add a ; 219b
	cp b ; 219c
	jr z, Function21a1 ; 219d
	and a ; 219f
	ret ; 21a0
; 21a1

Function21a1::
	scf ; 21a1
	ret ; 21a2
; 21a3

Function21a3::
	ld a, [$ce86] ; 21a3
	and a ; 21a6
	jp z, Function2263 ; 21a7
	cp $1 ; 21aa
	jp z, Function2232 ; 21ac
	cp $2 ; 21af
	jp z, Function21ba ; 21b1
	cp $3 ; 21b4
	jp z, Function21f6 ; 21b6
	ret ; 21b9
; 21ba

Function21ba::
	ld a, [$d0aa] ; 21ba
	ld [$da00], a ; 21bd
	ld a, [$d0ab] ; 21c0
	ld [$da01], a ; 21c3
	ld a, [$d0b3] ; 21c6
	ld [$da03], a ; 21c9
	ld a, [$d0b2] ; 21cc
	ld hl, $da02 ; 21cf
	add [hl] ; 21d2
	ld [hl], a ; 21d3
	ld c, a ; 21d4
	ld hl, $d0b4 ; 21d5
	ld a, [hli] ; 21d8
	ld h, [hl] ; 21d9
	ld l, a ; 21da
	srl c ; 21db
	jr z, Function21eb ; 21dd
	ld a, [$d0b1] ; 21df
	add a, $6 ; 21e2
	ld e, a ; 21e4
	ld d, $0 ; 21e5
	add hl, de ; 21e7
	dec c ; 21e8
	jr nz, Function21e7 ; 21e9
	ld a, l ; 21eb
	ld [$d07d], a ; 21ec
	ld a, h ; 21ef
	ld [$d07e], a ; 21f0
	jp Function2291 ; 21f3
; 21f6

Function21f6::
	ld a, [$d0b6] ; 21f6
	ld [$da00], a ; 21f9
	ld a, [$d0b7] ; 21fc
	ld [$da01], a ; 21ff
	ld a, [$d0bf] ; 2202
	ld [$da03], a ; 2205
	ld a, [$d0be] ; 2208
	ld hl, $da02 ; 220b
	add [hl] ; 220e
	ld [hl], a ; 220f
	ld c, a ; 2210
	ld hl, $d0c0 ; 2211
	ld a, [hli] ; 2214
	ld h, [hl] ; 2215
	ld l, a ; 2216
	srl c ; 2217
	jr z, Function2227 ; 2219
	ld a, [$d0bd] ; 221b
	add a, $6 ; 221e
	ld e, a ; 2220
	ld d, $0 ; 2221
	add hl, de ; 2223
	dec c ; 2224
	jr nz, Function2223 ; 2225
	ld a, l ; 2227
	ld [$d07d], a ; 2228
	ld a, h ; 222b
	ld [$d07e], a ; 222c
	jp Function2291 ; 222f
; 2232

Function2232::
	ld a, [$d092] ; 2232
	ld [$da00], a ; 2235
	ld a, [$d093] ; 2238
	ld [$da01], a ; 223b
	ld a, [$d09a] ; 223e
	ld [$da02], a ; 2241
	ld a, [$d09b] ; 2244
	ld hl, $da03 ; 2247
	add [hl] ; 224a
	ld [hl], a ; 224b
	ld c, a ; 224c
	ld hl, $d09c ; 224d
	ld a, [hli] ; 2250
	ld h, [hl] ; 2251
	ld l, a ; 2252
	ld b, $0 ; 2253
	srl c ; 2255
	add hl, bc ; 2257
	ld a, l ; 2258
	ld [$d07d], a ; 2259
	ld a, h ; 225c
	ld [$d07e], a ; 225d
	jp Function2291 ; 2260
; 2263

Function2263::
	ld a, [$d09e] ; 2263
	ld [$da00], a ; 2266
	ld a, [$d09f] ; 2269
	ld [$da01], a ; 226c
	ld a, [$d0a6] ; 226f
	ld [$da02], a ; 2272
	ld a, [$d0a7] ; 2275
	ld hl, $da03 ; 2278
	add [hl] ; 227b
	ld [hl], a ; 227c
	ld c, a ; 227d
	ld hl, $d0a8 ; 227e
	ld a, [hli] ; 2281
	ld h, [hl] ; 2282
	ld l, a ; 2283
	ld b, $0 ; 2284
	srl c ; 2286
	add hl, bc ; 2288
	ld a, l ; 2289
	ld [$d07d], a ; 228a
	ld a, h ; 228d
	ld [$d07e], a ; 228e
	scf ; 2291
	ret ; 2292
; 2293

Function2293::
	call Function22ad ; 2293
	ret nc ; 2296
	push bc ; 2297
	ld a, $5 ; 2298
	ld hl, $4a2d ; 229a
	rst FarCall ; 229d
	pop bc ; 229e
	ret nc ; 229f
	call Function2302 ; 22a0
	scf ; 22a3
	ret ; 22a4
; 22a5

Function22a5::
	call Function22ad ; 22a5
	ret nc ; 22a8
	call Function2302 ; 22a9
	ret ; 22ac
; 22ad

Function22ad::
	ld a, $5 ; 22ad
	ld hl, $4a18 ; 22af
	rst FarCall ; 22b2
	ret nc ; 22b3
	ldh a, [hROMBank] ; 22b4
	push af ; 22b6
	call Function2d2b ; 22b7
	call Function22c1 ; 22ba
	pop de ; 22bd
	ld a, d ; 22be
	rst Bankswitch ; 22bf
	ret ; 22c0
; 22c1

Function22c1::
	ld a, [$d20e] ; 22c1
	sub a, $4 ; 22c4
	ld e, a ; 22c6
	ld a, [$d20d] ; 22c7
	sub a, $4 ; 22ca
	ld d, a ; 22cc
	ld a, [$d945] ; 22cd
	and a ; 22d0
	ret z ; 22d1
	ld c, a ; 22d2
	ld hl, $d946 ; 22d3
	ld a, [hli] ; 22d6
	ld h, [hl] ; 22d7
	ld l, a ; 22d8
	push hl ; 22d9
	ld a, [hli] ; 22da
	cp e ; 22db
	jr nz, Function22e4 ; 22dc
	ld a, [hli] ; 22de
	cp d ; 22df
	jr nz, Function22e4 ; 22e0
	jr Function22f1 ; 22e2
; 22e4

Function22e4::
	pop hl ; 22e4
	ld a, $5 ; 22e5
	add l ; 22e7
	ld l, a ; 22e8
	jr nc, Function22ec ; 22e9
	inc h ; 22eb
	dec c ; 22ec
	jr nz, Function22d9 ; 22ed
	xor a ; 22ef
	ret ; 22f0
; 22f1

Function22f1::
	pop hl ; 22f1
	call Function22fe ; 22f2
	ret nc ; 22f5
	ld a, [$d945] ; 22f6
	inc a ; 22f9
	sub c ; 22fa
	ld c, a ; 22fb
	scf ; 22fc
	ret ; 22fd
; 22fe

Function22fe::
	inc hl ; 22fe
	inc hl ; 22ff
	scf ; 2300
	ret ; 2301
; 2302

Function2302::
	ldh a, [hROMBank] ; 2302
	push af ; 2304
	call Function2d2b ; 2305
	call Function230f ; 2308
	pop af ; 230b
	rst Bankswitch ; 230c
	scf ; 230d
	ret ; 230e
; 230f

Function230f::
	push bc ; 230f
	ld hl, $d946 ; 2310
	ld a, [hli] ; 2313
	ld h, [hl] ; 2314
	ld l, a ; 2315
	ld a, c ; 2316
	dec a ; 2317
	ld bc, $5 ; 2318
	call Function31a3 ; 231b
	ld bc, $2 ; 231e
	add hl, bc ; 2321
	ld a, [hli] ; 2322
	cp $ff ; 2323
	jr nz, Function232b ; 2325
	ld hl, $d9f5 ; 2327
	ld a, [hli] ; 232a
	pop bc ; 232b
	ld [$d043], a ; 232c
	ld a, [hli] ; 232f
	ld [$d044], a ; 2330
	ld a, [hli] ; 2333
	ld [$d045], a ; 2334
	ld a, c ; 2337
	ld [$d046], a ; 2338
	ld a, [$da00] ; 233b
	ld [$d047], a ; 233e
	ld a, [$da01] ; 2341
	ld [$d048], a ; 2344
	scf ; 2347
	ret ; 2348
; 2349

Function2349::
	call Function2362 ; 2349
	call Function239b ; 234c
	ld a, [$d043] ; 234f
	ld [$d9ff], a ; 2352
	ld a, [$d044] ; 2355
	ld [$da00], a ; 2358
	ld a, [$d045] ; 235b
	ld [$da01], a ; 235e
	ret ; 2361
; 2362

Function2362::
	call Function2d63 ; 2362
	call Function23cd ; 2365
	ret nz ; 2368
	ld a, [$d044] ; 2369
	ld b, a ; 236c
	ld a, [$d045] ; 236d
	ld c, a ; 2370
	call Function2d72 ; 2371
	call Function23d3 ; 2374
	ret nz ; 2377
	ld a, [$d047] ; 2378
	cp $f ; 237b
	jr nz, Function2388 ; 237d
	ld a, [$d048] ; 237f
	cp $a ; 2382
	ret z ; 2384
	cp $c ; 2385
	ret z ; 2387
	ld a, [$d046] ; 2388
	ld [$d9f2], a ; 238b
	ld a, [$d047] ; 238e
	ld [$d9f3], a ; 2391
	ld a, [$d048] ; 2394
	ld [$d9f4], a ; 2397
	ret ; 239a
; 239b

Function239b::
	call Function2d63 ; 239b
	call Function23cd ; 239e
	ret nz ; 23a1
	ld a, [$d044] ; 23a2
	ld b, a ; 23a5
	ld a, [$d045] ; 23a6
	ld c, a ; 23a9
	call Function2d72 ; 23aa
	call Function23d3 ; 23ad
	ret nz ; 23b0
	ld a, [$d044] ; 23b1
	ld b, a ; 23b4
	ld a, [$d045] ; 23b5
	ld c, a ; 23b8
	call Function2d80 ; 23b9
	ld a, c ; 23bc
	cp $6 ; 23bd
	ret nz ; 23bf
	ld a, [$d047] ; 23c0
	ld [$d9fb], a ; 23c3
	ld a, [$d048] ; 23c6
	ld [$d9fc], a ; 23c9
	ret ; 23cc
; 23cd

Function23cd::
	cp $2 ; 23cd
	ret z ; 23cf
	cp $1 ; 23d0
	ret ; 23d2
; 23d3

Function23d3::
	cp $3 ; 23d3
	ret z ; 23d5
	cp $4 ; 23d6
	ret z ; 23d8
	cp $7 ; 23d9
	ret z ; 23db
	cp $6 ; 23dc
	ret ; 23de
; 23df

Function23df::
	cp $3 ; 23df
	ret z ; 23e1
	cp $6 ; 23e2
	ret z ; 23e4
	cp $5 ; 23e5
	ret ; 23e7
; 23e8

Function23e8::
	call Function2405 ; 23e8
	call Function2d2b ; 23eb
	call Function242e ; 23ee
	xor a ; 23f1
	call Function2415 ; 23f2
	ret ; 23f5
; 23f6

Function23f6::
	call Function2405 ; 23f6
	call Function2d2b ; 23f9
	call Function242e ; 23fc
	ld a, $1 ; 23ff
	call Function2415 ; 2401
	ret ; 2404
; 2405

Function2405::
	call Function2d16 ; 2405
	call Function2cf5 ; 2408
	call Function2d56 ; 240b
	call Function243b ; 240e
	call Function2447 ; 2411
	ret ; 2414
; 2415

Function2415::
	push af ; 2415
	ld hl, $d08f ; 2416
	ld a, [hli] ; 2419
	ld h, [hl] ; 241a
	ld l, a ; 241b
	inc hl ; 241c
	inc hl ; 241d
	call Function24b9 ; 241e
	call Function24d0 ; 2421
	call Function24e7 ; 2424
	pop af ; 2427
	and a ; 2428
	ret nz ; 2429
	call Function24fe ; 242a
	ret ; 242d
; 242e

Function242e::
	ld hl, $d08d ; 242e
	ld a, [hli] ; 2431
	ld h, [hl] ; 2432
	ld l, a ; 2433
	call Function248b ; 2434
	call Function24a2 ; 2437
	ret ; 243a
; 243b

Function243b::
	ld de, $d086 ; 243b
	ld c, $c ; 243e
	ld a, [hli] ; 2440
	ld [de], a ; 2441
	inc de ; 2442
	dec c ; 2443
	jr nz, Function2440 ; 2444
	ret ; 2446
; 2447

Function2447::
	ld a, $ff ; 2447
	ld [$d092], a ; 2449
	ld [$d09e], a ; 244c
	ld [$d0aa], a ; 244f
	ld [$d0b6], a ; 2452
	ld a, [$d091] ; 2455
	ld b, a ; 2458
	bit 3, b ; 2459
	jr z, Function2463 ; 245b
	ld de, $d092 ; 245d
	call Function2482 ; 2460
	bit 2, b ; 2463
	jr z, Function246d ; 2465
	ld de, $d09e ; 2467
	call Function2482 ; 246a
	bit 1, b ; 246d
	jr z, Function2477 ; 246f
	ld de, $d0aa ; 2471
	call Function2482 ; 2474
	bit 0, b ; 2477
	jr z, Function2481 ; 2479
	ld de, $d0b6 ; 247b
	call Function2482 ; 247e
	ret ; 2481
; 2482

Function2482::
	ld c, $c ; 2482
	ld a, [hli] ; 2484
	ld [de], a ; 2485
	inc de ; 2486
	dec c ; 2487
	jr nz, Function2484 ; 2488
	ret ; 248a
; 248b

Function248b::
	ld a, [hli] ; 248b
	ld c, a ; 248c
	ld [$d951], a ; 248d
	ld a, l ; 2490
	ld [$d952], a ; 2491
	ld a, h ; 2494
	ld [$d953], a ; 2495
	ld a, c ; 2498
	and a ; 2499
	ret z ; 249a
	ld bc, $4 ; 249b
	call Function31a3 ; 249e
	ret ; 24a1
; 24a2

Function24a2::
	ld a, [hli] ; 24a2
	ld c, a ; 24a3
	ld [$d954], a ; 24a4
	ld a, l ; 24a7
	ld [$d955], a ; 24a8
	ld a, h ; 24ab
	ld [$d956], a ; 24ac
	ld a, c ; 24af
	and a ; 24b0
	ret z ; 24b1
	ld bc, $3 ; 24b2
	call Function31a3 ; 24b5
	ret ; 24b8
; 24b9

Function24b9::
	ld a, [hli] ; 24b9
	ld c, a ; 24ba
	ld [$d945], a ; 24bb
	ld a, l ; 24be
	ld [$d946], a ; 24bf
	ld a, h ; 24c2
	ld [$d947], a ; 24c3
	ld a, c ; 24c6
	and a ; 24c7
	ret z ; 24c8
	ld bc, $5 ; 24c9
	call Function31a3 ; 24cc
	ret ; 24cf
; 24d0

Function24d0::
	ld a, [hli] ; 24d0
	ld c, a ; 24d1
	ld [$d948], a ; 24d2
	ld a, l ; 24d5
	ld [$d949], a ; 24d6
	ld a, h ; 24d9
	ld [$d94a], a ; 24da
	ld a, c ; 24dd
	and a ; 24de
	ret z ; 24df
	ld bc, $8 ; 24e0
	call Function31a3 ; 24e3
	ret ; 24e6
; 24e7

Function24e7::
	ld a, [hli] ; 24e7
	ld c, a ; 24e8
	ld [$d94b], a ; 24e9
	ld a, l ; 24ec
	ld [$d94c], a ; 24ed
	ld a, h ; 24f0
	ld [$d94d], a ; 24f1
	ld a, c ; 24f4
	and a ; 24f5
	ret z ; 24f6
	ld bc, $5 ; 24f7
	call Function31a3 ; 24fa
	ret ; 24fd
; 24fe

Function24fe::
	push hl ; 24fe
	call Function2550 ; 24ff
	pop de ; 2502
	ld hl, $d465 ; 2503
	ld a, [de] ; 2506
	inc de ; 2507
	ld [$d94e], a ; 2508
	ld a, e ; 250b
	ld [$d94f], a ; 250c
	ld a, d ; 250f
	ld [$d950], a ; 2510
	ld a, [$d94e] ; 2513
	call Function2536 ; 2516
	ld a, [$d94e] ; 2519
	ld c, a ; 251c
	ld a, $10 ; 251d
	sub c ; 251f
	jr z, Function2533 ; 2520
	ld bc, $1 ; 2522
	add hl, bc ; 2525
	ld bc, $10 ; 2526
	ld [hl], $0 ; 2529
	inc hl ; 252b
	ld [hl], $ff ; 252c
	dec hl ; 252e
	add hl, bc ; 252f
	dec a ; 2530
	jr nz, Function2529 ; 2531
	ld h, d ; 2533
	ld l, e ; 2534
	ret ; 2535
; 2536

Function2536::
	and a ; 2536
	ret z ; 2537
	ld c, a ; 2538
	push bc ; 2539
	push hl ; 253a
	ld a, $ff ; 253b
	ld [hli], a ; 253d
	ld b, $d ; 253e
	ld a, [de] ; 2540
	inc de ; 2541
	ld [hli], a ; 2542
	dec b ; 2543
	jr nz, Function2540 ; 2544
	pop hl ; 2546
	ld bc, $10 ; 2547
	add hl, bc ; 254a
	pop bc ; 254b
	dec c ; 254c
	jr nz, Function2539 ; 254d
	ret ; 254f
; 2550

Function2550::
	ld hl, $d225 ; 2550
	ld bc, $1e0 ; 2553
	xor a ; 2556
	call Function314c ; 2557
	ld hl, $d225 ; 255a
	ld de, $28 ; 255d
	ld c, $c ; 2560
	xor a ; 2562
	ld [hl], a ; 2563
	add hl, de ; 2564
	dec c ; 2565
	jr nz, Function2563 ; 2566
	ret ; 2568
; 2569

Function2569::
	call Function2d30 ; 2569
	rst Bankswitch ; 256c
	ld hl, $d08f ; 256d
	ld a, [hli] ; 2570
	ld h, [hl] ; 2571
	ld l, a ; 2572
	inc hl ; 2573
	inc hl ; 2574
	inc hl ; 2575
	ld a, [$d9ff] ; 2576
	dec a ; 2579
	ld c, a ; 257a
	ld b, $0 ; 257b
	ld a, $5 ; 257d
	call Function31a3 ; 257f
	ld a, [hli] ; 2582
	ld [$da02], a ; 2583
	ld a, [hli] ; 2586
	ld [$da03], a ; 2587
	ld a, [hli] ; 258a
	cp $ff ; 258b
	jr nz, Function2592 ; 258d
	call Function2596 ; 258f
	call Function25a9 ; 2592
	ret ; 2595
; 2596

Function2596::
	ld a, [$d046] ; 2596
	ld [$d9f5], a ; 2599
	ld a, [$d047] ; 259c
	ld [$d9f6], a ; 259f
	ld a, [$d048] ; 25a2
	ld [$d9f7], a ; 25a5
	ret ; 25a8
; 25a9

Function25a9::
	ld hl, $c700 ; 25a9
	ld a, [$da03] ; 25ac
	bit 0, a ; 25af
	jr nz, Function25b9 ; 25b1
	srl a ; 25b3
	add a, $1 ; 25b5
	jr Function25bd ; 25b7
; 25b9

Function25b9::
	add a, $1 ; 25b9
	srl a ; 25bb
	ld c, a ; 25bd
	ld b, $0 ; 25be
	add hl, bc ; 25c0
	ld a, [$d088] ; 25c1
	add a, $6 ; 25c4
	ld c, a ; 25c6
	ld b, $0 ; 25c7
	ld a, [$da02] ; 25c9
	bit 0, a ; 25cc
	jr nz, Function25d6 ; 25ce
	srl a ; 25d0
	add a, $1 ; 25d2
	jr Function25da ; 25d4
; 25d6

Function25d6::
	add a, $1 ; 25d6
	srl a ; 25d8
	call Function31a3 ; 25da
	ld a, l ; 25dd
	ld [$d07d], a ; 25de
	ld a, h ; 25e1
	ld [$d07e], a ; 25e2
	ld a, [$da02] ; 25e5
	and $1 ; 25e8
	ld [$d07f], a ; 25ea
	ld a, [$da03] ; 25ed
	and $1 ; 25f0
	ld [$d080], a ; 25f2
	ret ; 25f5
; 25f6

Function25f6::
	ld hl, $c700 ; 25f6
	ld bc, $514 ; 25f9
	ld a, $0 ; 25fc
	call Function314c ; 25fe
	call Function260d ; 2601
	call Function264d ; 2604
	ld a, $1 ; 2607
	call Function2764 ; 2609
	ret ; 260c
; 260d

Function260d::
	ldh a, [hROMBank] ; 260d
	push af ; 260f
	ld hl, $c700 ; 2610
	ld a, [$d088] ; 2613
	ldh [$ffb2], a ; 2616
	add a, $6 ; 2618
	ldh [$ffb1], a ; 261a
	ld c, a ; 261c
	ld b, $0 ; 261d
	add hl, bc ; 261f
	add hl, bc ; 2620
	add hl, bc ; 2621
	ld c, $3 ; 2622
	add hl, bc ; 2624
	ld a, [$d089] ; 2625
	rst Bankswitch ; 2628
	ld a, [$d08a] ; 2629
	ld e, a ; 262c
	ld a, [$d08b] ; 262d
	ld d, a ; 2630
	ld a, [$d087] ; 2631
	ld b, a ; 2634
	push hl ; 2635
	ldh a, [$ffb2] ; 2636
	ld c, a ; 2638
	ld a, [de] ; 2639
	inc de ; 263a
	ld [hli], a ; 263b
	dec c ; 263c
	jr nz, Function2639 ; 263d
	pop hl ; 263f
	ldh a, [$ffb1] ; 2640
	add l ; 2642
	ld l, a ; 2643
	jr nc, Function2647 ; 2644
	inc h ; 2646
	dec b ; 2647
	jr nz, Function2635 ; 2648
	pop af ; 264a
	rst Bankswitch ; 264b
	ret ; 264c
; 264d

Function264d::
	ld a, [$d092] ; 264d
	cp $ff ; 2650
	jr z, Function2679 ; 2652
	ld b, a ; 2654
	ld a, [$d093] ; 2655
	ld c, a ; 2658
	call Function2d34 ; 2659
	ld a, [$d094] ; 265c
	ld l, a ; 265f
	ld a, [$d095] ; 2660
	ld h, a ; 2663
	ld a, [$d096] ; 2664
	ld e, a ; 2667
	ld a, [$d097] ; 2668
	ld d, a ; 266b
	ld a, [$d098] ; 266c
	ldh [$ffb1], a ; 266f
	ld a, [$d099] ; 2671
	ldh [$ffb2], a ; 2674
	call Function26fc ; 2676
	ld a, [$d09e] ; 2679
	cp $ff ; 267c
	jr z, Function26a5 ; 267e
	ld b, a ; 2680
	ld a, [$d09f] ; 2681
	ld c, a ; 2684
	call Function2d34 ; 2685
	ld a, [$d0a0] ; 2688
	ld l, a ; 268b
	ld a, [$d0a1] ; 268c
	ld h, a ; 268f
	ld a, [$d0a2] ; 2690
	ld e, a ; 2693
	ld a, [$d0a3] ; 2694
	ld d, a ; 2697
	ld a, [$d0a4] ; 2698
	ldh [$ffb1], a ; 269b
	ld a, [$d0a5] ; 269d
	ldh [$ffb2], a ; 26a0
	call Function26fc ; 26a2
	ld a, [$d0aa] ; 26a5
	cp $ff ; 26a8
	jr z, Function26d0 ; 26aa
	ld b, a ; 26ac
	ld a, [$d0ab] ; 26ad
	ld c, a ; 26b0
	call Function2d34 ; 26b1
	ld a, [$d0ac] ; 26b4
	ld l, a ; 26b7
	ld a, [$d0ad] ; 26b8
	ld h, a ; 26bb
	ld a, [$d0ae] ; 26bc
	ld e, a ; 26bf
	ld a, [$d0af] ; 26c0
	ld d, a ; 26c3
	ld a, [$d0b0] ; 26c4
	ld b, a ; 26c7
	ld a, [$d0b1] ; 26c8
	ldh [$ffb1], a ; 26cb
	call Function271f ; 26cd
	ld a, [$d0b6] ; 26d0
	cp $ff ; 26d3
	jr z, Function26fb ; 26d5
	ld b, a ; 26d7
	ld a, [$d0b7] ; 26d8
	ld c, a ; 26db
	call Function2d34 ; 26dc
	ld a, [$d0b8] ; 26df
	ld l, a ; 26e2
	ld a, [$d0b9] ; 26e3
	ld h, a ; 26e6
	ld a, [$d0ba] ; 26e7
	ld e, a ; 26ea
	ld a, [$d0bb] ; 26eb
	ld d, a ; 26ee
	ld a, [$d0bc] ; 26ef
	ld b, a ; 26f2
	ld a, [$d0bd] ; 26f3
	ldh [$ffb1], a ; 26f6
	call Function271f ; 26f8
	ret ; 26fb
; 26fc

Function26fc::
	ld c, $3 ; 26fc
	push de ; 26fe
	push hl ; 26ff
	ldh a, [$ffb1] ; 2700
	ld b, a ; 2702
	ld a, [hli] ; 2703
	ld [de], a ; 2704
	inc de ; 2705
	dec b ; 2706
	jr nz, Function2703 ; 2707
	pop hl ; 2709
	ldh a, [$ffb2] ; 270a
	ld e, a ; 270c
	ld d, $0 ; 270d
	add hl, de ; 270f
	pop de ; 2710
	ld a, [$d088] ; 2711
	add a, $6 ; 2714
	add e ; 2716
	ld e, a ; 2717
	jr nc, Function271b ; 2718
	inc d ; 271a
	dec c ; 271b
	jr nz, Function26fe ; 271c
	ret ; 271e
; 271f

Function271f::
	ld a, [$d088] ; 271f
	add a, $6 ; 2722
	ldh [$ffb2], a ; 2724
	push de ; 2726
	push hl ; 2727
	ld a, [hli] ; 2728
	ld [de], a ; 2729
	inc de ; 272a
	ld a, [hli] ; 272b
	ld [de], a ; 272c
	inc de ; 272d
	ld a, [hli] ; 272e
	ld [de], a ; 272f
	inc de ; 2730
	pop hl ; 2731
	ldh a, [$ffb1] ; 2732
	ld e, a ; 2734
	ld d, $0 ; 2735
	add hl, de ; 2737
	pop de ; 2738
	ldh a, [$ffb2] ; 2739
	add e ; 273b
	ld e, a ; 273c
	jr nc, Function2740 ; 273d
	inc d ; 273f
	dec b ; 2740
	jr nz, Function271f ; 2741
	ret ; 2743
; 2744

Function2744::
	ld [$d159], a ; 2744
	ret ; 2747
; 2748

Function2748::
	ld [$d160], a ; 2748
	ld a, l ; 274b
	ld [$d161], a ; 274c
	ld a, h ; 274f
	ld [$d162], a ; 2750
	ld a, $ff ; 2753
	ld [$d15f], a ; 2755
	scf ; 2758
	ret ; 2759
; 275a

Function275a::
	ld a, [$d15f] ; 275a
	and a ; 275d
	ret nz ; 275e
	call Function2d30 ; 275f
	jr Function2748 ; 2762
; 2764

Function2764::
	ld b, a ; 2764
	ldh a, [hROMBank] ; 2765
	push af ; 2767
	call Function2d2b ; 2768
	call Function277c ; 276b
	jr nc, Function2779 ; 276e
	call Function2d30 ; 2770
	ld b, a ; 2773
	ld d, h ; 2774
	ld e, l ; 2775
	call Function279d ; 2776
	pop af ; 2779
	rst Bankswitch ; 277a
	ret ; 277b
; 277c

Function277c::
	ld a, [$d954] ; 277c
	ld c, a ; 277f
	and a ; 2780
	ret z ; 2781
	ld hl, $d955 ; 2782
	ld a, [hli] ; 2785
	ld h, [hl] ; 2786
	ld l, a ; 2787
	or h ; 2788
	ret z ; 2789
	ld de, $3 ; 278a
	ld a, [hl] ; 278d
	cp b ; 278e
	jr z, Function2797 ; 278f
	add hl, de ; 2791
	dec c ; 2792
	jr nz, Function278d ; 2793
	xor a ; 2795
	ret ; 2796
; 2797

Function2797::
	inc hl ; 2797
	ld a, [hli] ; 2798
	ld h, [hl] ; 2799
	ld l, a ; 279a
	scf ; 279b
	ret ; 279c
; 279d

Function279d::
	ld a, $25 ; 279d
	ld hl, $7365 ; 279f
	rst FarCall ; 27a2
	ld a, [$d15e] ; 27a3
	push af ; 27a6
	ld hl, $d15b ; 27a7
	ld a, [hl] ; 27aa
	push af ; 27ab
	set 1, [hl] ; 27ac
	ld a, $25 ; 27ae
	ld hl, $6b89 ; 27b0
	rst FarCall ; 27b3
	ld a, $25 ; 27b4
	ld hl, $6b91 ; 27b6
	rst FarCall ; 27b9
	pop af ; 27ba
	ld [$d15b], a ; 27bb
	pop af ; 27be
	ld [$d15e], a ; 27bf
	ret ; 27c2
; 27c3

Function27c3::
	ldh a, [hROMBank] ; 27c3
	push af ; 27c5
	ld a, b ; 27c6
	rst Bankswitch ; 27c7
	call Functionf68 ; 27c8
	ld a, $1 ; 27cb
	ldh [$ffda], a ; 27cd
	call Functionf61 ; 27cf
	xor a ; 27d2
	ldh [$ffda], a ; 27d3
	pop af ; 27d5
	rst Bankswitch ; 27d6
	ret ; 27d7
; 27d8

Function27d8::
	ld [$d156], a ; 27d8
	ldh a, [hROMBank] ; 27db
	push af ; 27dd
	ld a, [$d156] ; 27de
	rst Bankswitch ; 27e1
	call Function27e8 ; 27e2
	pop af ; 27e5
	rst Bankswitch ; 27e6
	ret ; 27e7
; 27e8

Function27e8::
	push de ; 27e8
	ret ; 27e9
; 27ea

Function27ea::
	ldh a, [hROMBank] ; 27ea
	push af ; 27ec
	ld a, b ; 27ed
	rst Bankswitch ; 27ee
	ld a, c ; 27ef
	call Function1886 ; 27f0
	pop hl ; 27f3
	ld a, h ; 27f4
	rst Bankswitch ; 27f5
	ret ; 27f6
; 27f7

Function27f7::
	push hl ; 27f7
	push bc ; 27f8
	ldh a, [hROMBank] ; 27f9
	push af ; 27fb
	ld a, [$d160] ; 27fc
	rst Bankswitch ; 27ff
	ld hl, $d161 ; 2800
	ld c, [hl] ; 2803
	inc hl ; 2804
	ld b, [hl] ; 2805
	ld a, [bc] ; 2806
	inc bc ; 2807
	ld [hl], b ; 2808
	dec hl ; 2809
	ld [hl], c ; 280a
	ld b, a ; 280b
	pop af ; 280c
	rst Bankswitch ; 280d
	ld a, b ; 280e
	pop bc ; 280f
	pop hl ; 2810
	ret ; 2811
; 2812

Function2812::
	ld d, c ; 2812
	dec d ; 2813
	jr z, Function282c ; 2814
	add h ; 2816
	ld e, e ; 2817
	ld h, l ; 2818
	ld d, b ; 2819
	ld d, d ; 281a
	dec e ; 281b
	jr z, Function2834 ; 281c
	sub e ; 281e
	ld e, e ; 281f
	ld h, l ; 2820
	ld d, b ; 2821
	ld d, d ; 2822
	dec h ; 2823
	jr z, Function283c ; 2824
	sbc l ; 2826
	ld e, e ; 2827
	ld h, l ; 2828
	ld d, b ; 2829
	ldh a, [$ffb1] ; 282a
	ld e, a ; 282c
	ld d, $0 ; 282d
	ld hl, $d545 ; 282f
	add hl, de ; 2832
	ld a, [hl] ; 2833
	ret ; 2834
; 2835

Function2835::
	ldh a, [$ffb1] ; 2835
	ld e, a ; 2837
	ld d, $0 ; 2838
	ld hl, $d545 ; 283a
	add hl, de ; 283d
	ld [hl], $ff ; 283e
	ret ; 2840
; 2841

Function2841::
	ldh a, [$ffb1] ; 2841
	ld e, a ; 2843
	ld d, $0 ; 2844
	ld hl, $d545 ; 2846
	add hl, de ; 2849
	ld [hl], $0 ; 284a
	ret ; 284c
; 284d

Function284d::
	ld hl, $c3a0 ; 284d
	ld de, $cc20 ; 2850
	call Function28da ; 2853
	ld c, $28 ; 2856
	call Functiond64 ; 2858
	ld a, [$d05b] ; 285b
	ld e, a ; 285e
	ld a, [$d05c] ; 285f
	ld d, a ; 2862
	call Function28f6 ; 2863
	ld a, $1 ; 2866
	ldh [$ffdd], a ; 2868
	ret ; 286a
; 286b

Function286b::
	ld hl, $c4e0 ; 286b
	ld de, $cc20 ; 286e
	call Function28da ; 2871
	ld c, $28 ; 2874
	call Functiond64 ; 2876
	ld a, [$d05b] ; 2879
	ld l, a ; 287c
	ld a, [$d05c] ; 287d
	ld h, a ; 2880
	ld bc, $200 ; 2881
	add hl, bc ; 2884
	ld a, h ; 2885
	and $3 ; 2886
	or $98 ; 2888
	ld e, l ; 288a
	ld d, a ; 288b
	call Function28f6 ; 288c
	ld a, $1 ; 288f
	ldh [$ffdd], a ; 2891
	ret ; 2893
; 2894

Function2894::
	ld hl, $c3a0 ; 2894
	ld de, $cc20 ; 2897
	call Function28e3 ; 289a
	ld c, $24 ; 289d
	call Functiond64 ; 289f
	ld a, [$d05b] ; 28a2
	ld e, a ; 28a5
	ld a, [$d05c] ; 28a6
	ld d, a ; 28a9
	call Function291b ; 28aa
	ld a, $1 ; 28ad
	ldh [$ffdd], a ; 28af
	ret ; 28b1
; 28b2

Function28b2::
	ld hl, $c3b2 ; 28b2
	ld de, $cc20 ; 28b5
	call Function28e3 ; 28b8
	ld c, $24 ; 28bb
	call Functiond64 ; 28bd
	ld a, [$d05b] ; 28c0
	ld e, a ; 28c3
	and $e0 ; 28c4
	ld b, a ; 28c6
	ld a, e ; 28c7
	add a, $12 ; 28c8
	and $1f ; 28ca
	or b ; 28cc
	ld e, a ; 28cd
	ld a, [$d05c] ; 28ce
	ld d, a ; 28d1
	call Function291b ; 28d2
	ld a, $1 ; 28d5
	ldh [$ffdd], a ; 28d7
	ret ; 28d9
; 28da

Function28da::
	ld c, $28 ; 28da
	ld a, [hli] ; 28dc
	ld [de], a ; 28dd
	inc de ; 28de
	dec c ; 28df
	jr nz, Function28dc ; 28e0
	ret ; 28e2
; 28e3

Function28e3::
	ld c, $12 ; 28e3
	ld a, [hli] ; 28e5
	ld [de], a ; 28e6
	inc de ; 28e7
	ld a, [hl] ; 28e8
	ld [de], a ; 28e9
	inc de ; 28ea
	ld a, $13 ; 28eb
	add l ; 28ed
	ld l, a ; 28ee
	jr nc, Function28f2 ; 28ef
	inc h ; 28f1
	dec c ; 28f2
	jr nz, Function28e5 ; 28f3
	ret ; 28f5
; 28f6

Function28f6::
	ld hl, $cc70 ; 28f6
	push de ; 28f9
	call Function2902 ; 28fa
	pop de ; 28fd
	ld a, $20 ; 28fe
	add e ; 2900
	ld e, a ; 2901
	ld c, $a ; 2902
	ld a, e ; 2904
	ld [hli], a ; 2905
	ld a, d ; 2906
	ld [hli], a ; 2907
	ld a, e ; 2908
	inc a ; 2909
	inc a ; 290a
	and $1f ; 290b
	ld b, a ; 290d
	ld a, e ; 290e
	and $e0 ; 290f
	or b ; 2911
	ld e, a ; 2912
	dec c ; 2913
	jr nz, Function2904 ; 2914
	ld a, $14 ; 2916
	ldh [$ffde], a ; 2918
	ret ; 291a
; 291b

Function291b::
	ld hl, $cc70 ; 291b
	ld c, $12 ; 291e
	ld a, e ; 2920
	ld [hli], a ; 2921
	ld a, d ; 2922
	ld [hli], a ; 2923
	ld a, $20 ; 2924
	add e ; 2926
	ld e, a ; 2927
	jr nc, Function2931 ; 2928
	inc d ; 292a
	ld a, d ; 292b
	and $3 ; 292c
	or $98 ; 292e
	ld d, a ; 2930
	dec c ; 2931
	jr nz, Function2920 ; 2932
	ld a, $12 ; 2934
	ldh [$ffde], a ; 2936
	ret ; 2938
; 2939

Function2939::
	ld hl, $cc20 ; 2939
	ld bc, $78 ; 293c
	xor a ; 293f
	call Function314c ; 2940
	ret ; 2943
; 2944

Function2944::
	ld hl, $d0c3 ; 2944
	ld a, [hli] ; 2947
	ld h, [hl] ; 2948
	ld l, a ; 2949
	ld de, $9000 ; 294a
	ld a, [$d0c2] ; 294d
	call Functionaf0 ; 2950
	ld a, [$d082] ; 2953
	cp $1 ; 2956
	jr z, Function2960 ; 2958
	cp $2 ; 295a
	jr z, Function2960 ; 295c
	jr Function2966 ; 295e
; 2960

Function2960::
	ld a, $7 ; 2960
	ld hl, $4000 ; 2962
	rst FarCall ; 2965
	xor a ; 2966
	ldh [$ffe1], a ; 2967
	ret ; 2969
; 296a

Function296a::
	ld hl, $d07d ; 296a
	ld a, [hli] ; 296d
	ld h, [hl] ; 296e
	ld l, a ; 296f
	ld de, $da04 ; 2970
	ld c, $5 ; 2973
	ld b, $6 ; 2975
	push bc ; 2977
	push hl ; 2978
	ld a, [hli] ; 2979
	ld [de], a ; 297a
	inc de ; 297b
	dec b ; 297c
	jr nz, Function2979 ; 297d
	pop hl ; 297f
	ld a, [$d088] ; 2980
	add a, $6 ; 2983
	ld c, a ; 2985
	ld b, $0 ; 2986
	add hl, bc ; 2988
	pop bc ; 2989
	dec c ; 298a
	jr nz, Function2977 ; 298b
	ret ; 298d
; 298e

Function298e::
	ld hl, $d07d ; 298e
	ld a, [hli] ; 2991
	ld h, [hl] ; 2992
	ld l, a ; 2993
	ld de, $da04 ; 2994
	ld a, [$d088] ; 2997
	add a, $6 ; 299a
	ldh [$ffb1], a ; 299c
	ld a, [$ce86] ; 299e
	and a ; 29a1
	jr z, Function29bc ; 29a2
	cp $1 ; 29a4
	jr z, Function29b1 ; 29a6
	cp $2 ; 29a8
	jr z, Function29c5 ; 29aa
	cp $3 ; 29ac
	jr z, Function29cb ; 29ae
	ret ; 29b0
; 29b1

Function29b1::
	ld de, $da0a ; 29b1
	ldh a, [$ffb1] ; 29b4
	ld c, a ; 29b6
	ld b, $0 ; 29b7
	add hl, bc ; 29b9
	jr Function29bf ; 29ba
; 29bc

Function29bc::
	ld de, $da04 ; 29bc
	ld b, $6 ; 29bf
	ld c, $4 ; 29c1
	jr Function29e8 ; 29c3
; 29c5

Function29c5::
	ld de, $da05 ; 29c5
	inc hl ; 29c8
	jr Function29ce ; 29c9
; 29cb

Function29cb::
	ld de, $da04 ; 29cb
	ld b, $5 ; 29ce
	ld c, $5 ; 29d0
	jr Function29e8 ; 29d2
; 29d4

Function29d4::
	ld hl, $d07d ; 29d4
	ld a, [hli] ; 29d7
	ld h, [hl] ; 29d8
	ld l, a ; 29d9
	ld a, [$d088] ; 29da
	add a, $6 ; 29dd
	ldh [$ffb1], a ; 29df
	ld de, $da04 ; 29e1
	ld b, $6 ; 29e4
	ld c, $5 ; 29e6
	push bc ; 29e8
	push hl ; 29e9
	push de ; 29ea
	ld a, [de] ; 29eb
	inc de ; 29ec
	ld [hli], a ; 29ed
	dec b ; 29ee
	jr nz, Function29eb ; 29ef
	pop de ; 29f1
	ld a, e ; 29f2
	add a, $6 ; 29f3
	ld e, a ; 29f5
	jr nc, Function29f9 ; 29f6
	inc d ; 29f8
	pop hl ; 29f9
	ldh a, [$ffb1] ; 29fa
	ld c, a ; 29fc
	ld b, $0 ; 29fd
	add hl, bc ; 29ff
	pop bc ; 2a00
	dec c ; 2a01
	jr nz, Function29e8 ; 2a02
	ret ; 2a04
; 2a05

Function2a05::
	xor a ; 2a05
	ld [$cea7], a ; 2a06
	call Function2a5d ; 2a09
	call Function2a3e ; 2a0c
	ld a, [$d20d] ; 2a0f
	ld d, a ; 2a12
	ld a, [$d20e] ; 2a13
	ld e, a ; 2a16
	call Function2b21 ; 2a17
	ld [$d20b], a ; 2a1a
	call Function2ae4 ; 2a1d
	ret nz ; 2a20
	ld a, [$d20b] ; 2a21
	and $7 ; 2a24
	ld hl, $2a36 ; 2a26
	add l ; 2a29
	ld l, a ; 2a2a
	ld a, $0 ; 2a2b
	adc h ; 2a2d
	ld h, a ; 2a2e
	ld a, [hl] ; 2a2f
	ld hl, $cea7 ; 2a30
	or [hl] ; 2a33
	ld [hl], a ; 2a34
	ret ; 2a35
; 2a36

Function2a36::
	ld bc, $402 ; 2a36
	ld [$a09], sp ; 2a39
	dec b ; 2a3c
	ld b, $fa ; 2a3d
	dec c ; 2a3f
	jp nc, Functionfa57 ; 2a40
	ld c, $d2 ; 2a43
	ld e, a ; 2a45
	push de ; 2a46
	inc e ; 2a47
	call Function2b21 ; 2a48
	ld [$cea3], a ; 2a4b
	call Function2a7c ; 2a4e
	pop de ; 2a51
	dec e ; 2a52
	call Function2b21 ; 2a53
	ld [$cea4], a ; 2a56
	call Function2a96 ; 2a59
	ret ; 2a5c
; 2a5d

Function2a5d::
	ld a, [$d20d] ; 2a5d
	ld d, a ; 2a60
	ld a, [$d20e] ; 2a61
	ld e, a ; 2a64
	push de ; 2a65
	dec d ; 2a66
	call Function2b21 ; 2a67
	ld [$cea5], a ; 2a6a
	call Function2aca ; 2a6d
	pop de ; 2a70
	inc d ; 2a71
	call Function2b21 ; 2a72
	ld [$cea6], a ; 2a75
	call Function2ab0 ; 2a78
	ret ; 2a7b
; 2a7c

Function2a7c::
	call Function2ae4 ; 2a7c
	ret nz ; 2a7f
	ld a, [$cea3] ; 2a80
	and $7 ; 2a83
	cp $2 ; 2a85
	jr z, Function2a90 ; 2a87
	cp $6 ; 2a89
	jr z, Function2a90 ; 2a8b
	cp $7 ; 2a8d
	ret nz ; 2a8f
	ld hl, $cea7 ; 2a90
	set 3, [hl] ; 2a93
	ret ; 2a95
; 2a96

Function2a96::
	call Function2ae4 ; 2a96
	ret nz ; 2a99
	ld a, [$cea4] ; 2a9a
	and $7 ; 2a9d
	cp $3 ; 2a9f
	jr z, Function2aaa ; 2aa1
	cp $4 ; 2aa3
	jr z, Function2aaa ; 2aa5
	cp $5 ; 2aa7
	ret nz ; 2aa9
	ld hl, $cea7 ; 2aaa
	set 3, [hl] ; 2aad
	ret ; 2aaf
; 2ab0

Function2ab0::
	call Function2ae4 ; 2ab0
	ret nz ; 2ab3
	ld a, [$cea6] ; 2ab4
	and $7 ; 2ab7
	cp $1 ; 2ab9
	jr z, Function2ac4 ; 2abb
	cp $5 ; 2abd
	jr z, Function2ac4 ; 2abf
	cp $7 ; 2ac1
	ret nz ; 2ac3
	ld hl, $cea7 ; 2ac4
	set 3, [hl] ; 2ac7
	ret ; 2ac9
; 2aca

Function2aca::
	call Function2ae4 ; 2aca
	ret nz ; 2acd
	ld a, [$cea5] ; 2ace
	and $7 ; 2ad1
	cp $0 ; 2ad3
	jr z, Function2ade ; 2ad5
	cp $4 ; 2ad7
	jr z, Function2ade ; 2ad9
	cp $6 ; 2adb
	ret nz ; 2add
	ld hl, $cea7 ; 2ade
	set 3, [hl] ; 2ae1
	ret ; 2ae3
; 2ae4

Function2ae4::
	and $f0 ; 2ae4
	cp $b0 ; 2ae6
	ret z ; 2ae8
	cp $c0 ; 2ae9
	ret ; 2aeb
; 2aec

Function2aec::
	ld a, [$d205] ; 2aec
	and $c ; 2aef
	srl a ; 2af1
	srl a ; 2af3
	ld l, a ; 2af5
	ld h, $0 ; 2af6
	add hl, hl ; 2af8
	add hl, hl ; 2af9
	ld de, $2b11 ; 2afa
	add hl, de ; 2afd
	ld d, [hl] ; 2afe
	inc hl ; 2aff
	ld e, [hl] ; 2b00
	inc hl ; 2b01
	ld a, [hli] ; 2b02
	ld h, [hl] ; 2b03
	ld l, a ; 2b04
	ld a, [$d20d] ; 2b05
	add d ; 2b08
	ld d, a ; 2b09
	ld a, [$d20e] ; 2b0a
	add e ; 2b0d
	ld e, a ; 2b0e
	ld a, [hl] ; 2b0f
	ret ; 2b10
; 2b11

Function2b11::
	nop ; 2b11
	ld bc, $cea3 ; 2b12
	nop ; 2b15
	rst $38 ; 2b16
	and h ; 2b17
	adc a, $ff ; 2b18
	nop ; 2b1a
	and l ; 2b1b
	adc a, $1 ; 2b1c
	nop ; 2b1e
	and [hl] ; 2b1f
	adc a, $cd ; 2b20
	ld c, e ; 2b22
	dec hl ; 2b23
	ld a, [hl] ; 2b24
	and a ; 2b25
	jr z, Function2b48 ; 2b26
	ld l, a ; 2b28
	ld h, $0 ; 2b29
	add hl, hl ; 2b2b
	add hl, hl ; 2b2c
	ld a, [$d0c9] ; 2b2d
	ld c, a ; 2b30
	ld a, [$d0ca] ; 2b31
	ld b, a ; 2b34
	add hl, bc ; 2b35
	rr d ; 2b36
	jr nc, Function2b3b ; 2b38
	inc hl ; 2b3a
	rr e ; 2b3b
	jr nc, Function2b41 ; 2b3d
	inc hl ; 2b3f
	inc hl ; 2b40
	ld a, [$d0c8] ; 2b41
	call Function3128 ; 2b44
	ret ; 2b47
; 2b48

Function2b48::
	ld a, $ff ; 2b48
	ret ; 2b4a
; 2b4b

Function2b4b::
	ld a, [$d088] ; 2b4b
	add a, $6 ; 2b4e
	ld c, a ; 2b50
	ld b, $0 ; 2b51
	ld hl, $c701 ; 2b53
	add hl, bc ; 2b56
	ld a, e ; 2b57
	srl a ; 2b58
	jr z, Function2b69 ; 2b5a
	and a ; 2b5c
	srl a ; 2b5d
	jr nc, Function2b62 ; 2b5f
	add hl, bc ; 2b61
	sla c ; 2b62
	rl b ; 2b64
	and a ; 2b66
	jr nz, Function2b5d ; 2b67
	ld c, d ; 2b69
	srl c ; 2b6a
	ld b, $0 ; 2b6c
	add hl, bc ; 2b6e
	ret ; 2b6f
; 2b70

Function2b70::
	call Function2aec ; 2b70
	ld b, a ; 2b73
	ld a, d ; 2b74
	sub a, $4 ; 2b75
	ld d, a ; 2b77
	ld a, e ; 2b78
	sub a, $4 ; 2b79
	ld e, a ; 2b7b
	ld a, [$d94b] ; 2b7c
	and a ; 2b7f
	ret z ; 2b80
	ld c, a ; 2b81
	ldh a, [hROMBank] ; 2b82
	push af ; 2b84
	call Function2d2b ; 2b85
	call Function2b8f ; 2b88
	pop hl ; 2b8b
	ld a, h ; 2b8c
	rst Bankswitch ; 2b8d
	ret ; 2b8e
; 2b8f

Function2b8f::
	ld hl, $d94c ; 2b8f
	ld a, [hli] ; 2b92
	ld h, [hl] ; 2b93
	ld l, a ; 2b94
	push hl ; 2b95
	ld a, [hli] ; 2b96
	cp e ; 2b97
	jr nz, Function2ba0 ; 2b98
	ld a, [hli] ; 2b9a
	cp d ; 2b9b
	jr nz, Function2ba0 ; 2b9c
	jr Function2bad ; 2b9e
; 2ba0

Function2ba0::
	pop hl ; 2ba0
	ld a, $5 ; 2ba1
	add l ; 2ba3
	ld l, a ; 2ba4
	jr nc, Function2ba8 ; 2ba5
	inc h ; 2ba7
	dec c ; 2ba8
	jr nz, Function2b95 ; 2ba9
	xor a ; 2bab
	ret ; 2bac
; 2bad

Function2bad::
	pop hl ; 2bad
	ld de, $cf29 ; 2bae
	ld bc, $5 ; 2bb1
	call Function311a ; 2bb4
	scf ; 2bb7
	ret ; 2bb8
; 2bb9

Function2bb9::
	ld a, [$d948] ; 2bb9
	and a ; 2bbc
	ret z ; 2bbd
	ld c, a ; 2bbe
	ldh a, [hROMBank] ; 2bbf
	push af ; 2bc1
	call Function2d2b ; 2bc2
	call Function2bcc ; 2bc5
	pop hl ; 2bc8
	ld a, h ; 2bc9
	rst Bankswitch ; 2bca
	ret ; 2bcb
; 2bcc

Function2bcc::
	ld hl, $d949 ; 2bcc
	ld a, [hli] ; 2bcf
	ld h, [hl] ; 2bd0
	ld l, a ; 2bd1
	call Function1f69 ; 2bd2
	ld b, a ; 2bd5
	ld a, [$d20d] ; 2bd6
	sub a, $4 ; 2bd9
	ld d, a ; 2bdb
	ld a, [$d20e] ; 2bdc
	sub a, $4 ; 2bdf
	ld e, a ; 2be1
	push hl ; 2be2
	ld a, [hli] ; 2be3
	cp b ; 2be4
	jr z, Function2beb ; 2be5
	cp $ff ; 2be7
	jr nz, Function2bf5 ; 2be9
	ld a, [hli] ; 2beb
	cp e ; 2bec
	jr nz, Function2bf5 ; 2bed
	ld a, [hli] ; 2bef
	cp d ; 2bf0
	jr nz, Function2bf5 ; 2bf1
	jr Function2c02 ; 2bf3
; 2bf5

Function2bf5::
	pop hl ; 2bf5
	ld a, $8 ; 2bf6
	add l ; 2bf8
	ld l, a ; 2bf9
	jr nc, Function2bfd ; 2bfa
	inc h ; 2bfc
	dec c ; 2bfd
	jr nz, Function2be2 ; 2bfe
	xor a ; 2c00
	ret ; 2c01
; 2c02

Function2c02::
	pop hl ; 2c02
	ld de, $cf29 ; 2c03
	ld bc, $8 ; 2c06
	call Function311a ; 2c09
	scf ; 2c0c
	ret ; 2c0d
; 2c0e

Function2c0e::
	xor a ; 2c0e
	ldh [$ffd6], a ; 2c0f
	call Function1be0 ; 2c11
	ld a, $23 ; 2c14
	ld hl, $43ab ; 2c16
	rst FarCall ; 2c19
	call Function30ff ; 2c1a
	call Function2f93 ; 2c1d
	ret ; 2c20
; 2c21

Function2c21::
	call Function3449 ; 2c21
	call Function2c87 ; 2c24
	call Function196f ; 2c27
	call Function1bef ; 2c2a
	call Functiond2a ; 2c2d
	jr Function2c41 ; 2c30
; 2c32

Function2c32::
	call Function3449 ; 2c32
	call Function1bef ; 2c35
	call Function2c87 ; 2c38
	call Function196f ; 2c3b
	call Functiond2a ; 2c3e
	ld b, $9 ; 2c41
	call Function3583 ; 2c43
	call Function3456 ; 2c46
	ld a, $23 ; 2c49
	ld hl, $43a0 ; 2c4b
	rst FarCall ; 2c4e
	call Function2fa4 ; 2c4f
	ret ; 2c52
; 2c53

Function2c53::
	push af ; 2c53
	ld a, $1 ; 2c54
	ld [$c1cd], a ; 2c56
	call Function3449 ; 2c59
	call Function30ff ; 2c5c
	call Function2c87 ; 2c5f
	ld hl, $c490 ; 2c62
	ld bc, $412 ; 2c65
	call Functioneef ; 2c68
	ld hl, $cfe5 ; 2c6b
	set 0, [hl] ; 2c6e
	call Function196f ; 2c70
	call Function3456 ; 2c73
	ld b, $9 ; 2c76
	call Function3583 ; 2c78
	call Function359 ; 2c7b
	call Function32e ; 2c7e
	ld a, $1 ; 2c81
	ldh [$ffe0], a ; 2c83
	pop af ; 2c85
	ret ; 2c86
; 2c87

Function2c87::
	call Function432 ; 2c87
	call Function30ff ; 2c8a
	ld a, $5 ; 2c8d
	ld hl, $414b ; 2c8f
	rst FarCall ; 2c92
	call Functiond9e ; 2c93
	call Functiondac ; 2c96
	ldh a, [hROMBank] ; 2c99
	push af ; 2c9b
	ld a, [$da00] ; 2c9c
	ld b, a ; 2c9f
	ld a, [$da01] ; 2ca0
	ld c, a ; 2ca3
	call Function2cfd ; 2ca4
	ld a, $23 ; 2ca7
	ld hl, $4356 ; 2ca9
	rst FarCall ; 2cac
	call Function1fc1 ; 2cad
	call Function2944 ; 2cb0
	ld a, $8 ; 2cb3
	call Function3e92 ; 2cb5
	pop af ; 2cb8
	rst Bankswitch ; 2cb9
	call Function454 ; 2cba
	ret ; 2cbd
; 2cbe

Function2cbe::
	ld a, [$da00] ; 2cbe
	ld b, a ; 2cc1
	ld a, [$da01] ; 2cc2
	ld c, a ; 2cc5
	push bc ; 2cc6
	dec b ; 2cc7
	ld c, b ; 2cc8
	ld b, $0 ; 2cc9
	ld hl, $40ed ; 2ccb
	add hl, bc ; 2cce
	add hl, bc ; 2ccf
	ld a, [hli] ; 2cd0
	ld h, [hl] ; 2cd1
	ld l, a ; 2cd2
	pop bc ; 2cd3
	dec c ; 2cd4
	ld b, $0 ; 2cd5
	ld a, $9 ; 2cd7
	call Function31a3 ; 2cd9
	ret ; 2cdc
; 2cdd

Function2cdd::
	ld a, [$da00] ; 2cdd
	ld b, a ; 2ce0
	ld a, [$da01] ; 2ce1
	ld c, a ; 2ce4
	ldh a, [hROMBank] ; 2ce5
	push af ; 2ce7
	ld a, $25 ; 2ce8
	rst Bankswitch ; 2cea
	call Function2cc6 ; 2ceb
	add hl, de ; 2cee
	ld c, [hl] ; 2cef
	inc hl ; 2cf0
	ld b, [hl] ; 2cf1
	pop af ; 2cf2
	rst Bankswitch ; 2cf3
	ret ; 2cf4
; 2cf5

Function2cf5::
	ld a, [$da00] ; 2cf5
	ld b, a ; 2cf8
	ld a, [$da01] ; 2cf9
	ld c, a ; 2cfc
	call Function2d0a ; 2cfd
	rst Bankswitch ; 2d00
	ret ; 2d01
; 2d02

Function2d02::
	ld a, [$da00] ; 2d02
	ld b, a ; 2d05
	ld a, [$da01] ; 2d06
	ld c, a ; 2d09
	push hl ; 2d0a
	push de ; 2d0b
	ld de, $0 ; 2d0c
	call Function2ce5 ; 2d0f
	ld a, c ; 2d12
	pop de ; 2d13
	pop hl ; 2d14
	ret ; 2d15
; 2d16

Function2d16::
	ldh a, [hROMBank] ; 2d16
	push af ; 2d18
	ld a, $25 ; 2d19
	rst Bankswitch ; 2d1b
	call Function2cbe ; 2d1c
	ld de, $d081 ; 2d1f
	ld bc, $5 ; 2d22
	call Function311a ; 2d25
	pop af ; 2d28
	rst Bankswitch ; 2d29
	ret ; 2d2a
; 2d2b

Function2d2b::
	ld a, [$d08c] ; 2d2b
	rst Bankswitch ; 2d2e
	ret ; 2d2f
; 2d30

Function2d30::
	ld a, [$d08c] ; 2d30
	ret ; 2d33
; 2d34

Function2d34::
	push hl ; 2d34
	push de ; 2d35
	push bc ; 2d36
	push bc ; 2d37
	ld de, $3 ; 2d38
	call Function2ce5 ; 2d3b
	ld l, c ; 2d3e
	ld h, b ; 2d3f
	pop bc ; 2d40
	push hl ; 2d41
	ld de, $0 ; 2d42
	call Function2ce5 ; 2d45
	pop hl ; 2d48
	ld de, $3 ; 2d49
	add hl, de ; 2d4c
	ld a, c ; 2d4d
	call Function3128 ; 2d4e
	rst Bankswitch ; 2d51
	pop bc ; 2d52
	pop de ; 2d53
	pop hl ; 2d54
	ret ; 2d55
; 2d56

Function2d56::
	push bc ; 2d56
	push de ; 2d57
	ld de, $3 ; 2d58
	call Function2cdd ; 2d5b
	ld l, c ; 2d5e
	ld h, b ; 2d5f
	pop de ; 2d60
	pop bc ; 2d61
	ret ; 2d62
; 2d63

Function2d63::
	push hl ; 2d63
	push de ; 2d64
	push bc ; 2d65
	ld de, $2 ; 2d66
	call Function2cdd ; 2d69
	ld a, c ; 2d6c
	pop bc ; 2d6d
	pop de ; 2d6e
	pop hl ; 2d6f
	ret ; 2d70
; 2d71

Function2d71::
	ret ; 2d71
	push hl ; 2d72
	push de ; 2d73
	push bc ; 2d74
	ld de, $2 ; 2d75
	call Function2ce5 ; 2d78
	ld a, c ; 2d7b
	pop bc ; 2d7c
	pop de ; 2d7d
	pop hl ; 2d7e
	ret ; 2d7f
; 2d80

Function2d80::
	ld de, $1 ; 2d80
	call Function2ce5 ; 2d83
	ld a, c ; 2d86
	ret ; 2d87
; 2d88

Function2d88::
	push hl ; 2d88
	push de ; 2d89
	push bc ; 2d8a
	ld de, $5 ; 2d8b
	call Function2ce5 ; 2d8e
	ld a, c ; 2d91
	pop bc ; 2d92
	pop de ; 2d93
	pop hl ; 2d94
	ret ; 2d95
; 2d96

Function2d96::
	push hl ; 2d96
	push bc ; 2d97
	ld de, $6 ; 2d98
	call Function2cdd ; 2d9b
	ld a, c ; 2d9e
	cp $64 ; 2d9f
	jr z, Function2dc1 ; 2da1
	bit 7, c ; 2da3
	jr nz, Function2dad ; 2da5
	ld e, c ; 2da7
	ld d, $0 ; 2da8
	pop bc ; 2daa
	pop hl ; 2dab
	ret ; 2dac
; 2dad

Function2dad::
	ld a, [$d572] ; 2dad
	bit 0, a ; 2db0
	jr z, Function2db9 ; 2db2
	ld de, $56 ; 2db4
	jr Function2daa ; 2db7
; 2db9

Function2db9::
	ld a, c ; 2db9
	and $7f ; 2dba
	ld e, a ; 2dbc
	ld d, $0 ; 2dbd
	jr Function2daa ; 2dbf
; 2dc1

Function2dc1::
	ld a, [$d572] ; 2dc1
	bit 7, a ; 2dc4
	jr z, Function2dcd ; 2dc6
	ld de, $48 ; 2dc8
	jr Function2daa ; 2dcb
; 2dcd

Function2dcd::
	ld de, $26 ; 2dcd
	jr Function2daa ; 2dd0
; 2dd2

Function2dd2::
	call Function2de0 ; 2dd2
	and $f ; 2dd5
	ret ; 2dd7
; 2dd8

Function2dd8::
	call Function2de0 ; 2dd8
	and $f0 ; 2ddb
	swap a ; 2ddd
	ret ; 2ddf
; 2de0

Function2de0::
	push hl ; 2de0
	push bc ; 2de1
	ld de, $7 ; 2de2
	call Function2cdd ; 2de5
	ld a, c ; 2de8
	pop bc ; 2de9
	pop hl ; 2dea
	ret ; 2deb
; 2dec

Function2dec::
	push de ; 2dec
	push hl ; 2ded
	push bc ; 2dee
	ld de, $8 ; 2def
	call Function2cdd ; 2df2
	ld a, c ; 2df5
	pop bc ; 2df6
	pop hl ; 2df7
	pop de ; 2df8
	ret ; 2df9
; 2dfa

Function2dfa::
	push hl ; 2dfa
	push bc ; 2dfb
	ld hl, $56be ; 2dfc
	ld bc, $f ; 2dff
	ld a, [$d082] ; 2e02
	call Function31a3 ; 2e05
	ld de, $d0c2 ; 2e08
	ld bc, $f ; 2e0b
	ld a, $5 ; 2e0e
	call Functiondcd ; 2e10
	pop bc ; 2e13
	pop hl ; 2e14
	ret ; 2e15
; 2e16

Function2e16::
	nop ; 2e16
	nop ; 2e17
	nop ; 2e18
	nop ; 2e19
	nop ; 2e1a
	nop ; 2e1b
	nop ; 2e1c
	nop ; 2e1d
	nop ; 2e1e
	nop ; 2e1f
	nop ; 2e20
	nop ; 2e21
	nop ; 2e22
	nop ; 2e23
	nop ; 2e24
	nop ; 2e25
	ret ; 2e26
; 2e27

Function2e27::
	ld [$d156], a ; 2e27
	ldh a, [hROMBank] ; 2e2a
	push af ; 2e2c
	ld a, [$d156] ; 2e2d
	rst Bankswitch ; 2e30
	call Function2e48 ; 2e31
	ld a, b ; 2e34
	ld [$cfe0], a ; 2e35
	ld a, c ; 2e38
	ld [$cfe1], a ; 2e39
	pop bc ; 2e3c
	ld a, b ; 2e3d
	rst Bankswitch ; 2e3e
	ld a, [$cfe0] ; 2e3f
	ld b, a ; 2e42
	ld a, [$cfe1] ; 2e43
	ld c, a ; 2e46
	ret ; 2e47
; 2e48

Function2e48::
	jp [hl] ; 2e48
	ld [$cfdb], a ; 2e49
	ldh a, [hROMBank] ; 2e4c
	push af ; 2e4e
	ld a, $2 ; 2e4f
	rst Bankswitch ; 2e51
	call Function4b3b ; 2e52
	rst Bankswitch ; 2e55
	ld hl, $2e6c ; 2e56
	push hl ; 2e59
	ld a, [$cfde] ; 2e5a
	ld h, a ; 2e5d
	ld a, [$cfdf] ; 2e5e
	ld l, a ; 2e61
	push hl ; 2e62
	ld a, [$cfdc] ; 2e63
	ld h, a ; 2e66
	ld a, [$cfdd] ; 2e67
	ld l, a ; 2e6a
	ret ; 2e6b
; 2e6c

Function2e6c::
	ld a, h ; 2e6c
	ld [$cfdc], a ; 2e6d
	ld a, l ; 2e70
	ld [$cfdd], a ; 2e71
	pop hl ; 2e74
	ld a, h ; 2e75
	rst Bankswitch ; 2e76
	ld a, [$cfdc] ; 2e77
	ld h, a ; 2e7a
	ld a, [$cfdd] ; 2e7b
	ld l, a ; 2e7e
	ret ; 2e7f
; 2e80

Function2e80::
	call Function1e29 ; 2e80
	ldh a, [hROMBank] ; 2e83
	push af ; 2e85
	ld a, $1 ; 2e86
	rst Bankswitch ; 2e88
	call Function6551 ; 2e89
	call Function2ee3 ; 2e8c
	call Function65cb ; 2e8f
	pop af ; 2e92
	rst Bankswitch ; 2e93
	ret ; 2e94
; 2e95

Function2e95::
	ldh a, [$ffda] ; 2e95
	push af ; 2e97
	ld a, $1 ; 2e98
	ldh [$ffda], a ; 2e9a
	call Function2ea3 ; 2e9c
	pop af ; 2e9f
	ldh [$ffda], a ; 2ea0
	ret ; 2ea2
; 2ea3

Function2ea3::
	call Function1e29 ; 2ea3
	xor a ; 2ea6
	ldh [$ffd6], a ; 2ea7
	call Function1fc1 ; 2ea9
	call Function2ee3 ; 2eac
	xor a ; 2eaf
	ldh [$ffd6], a ; 2eb0
	call Function2ef1 ; 2eb2
	ld a, $90 ; 2eb5
	ldh [$ffd4], a ; 2eb7
	ld a, $5 ; 2eb9
	ld hl, $415c ; 2ebb
	rst FarCall ; 2ebe
	call Functiond97 ; 2ebf
	ld hl, $d565 ; 2ec2
	res 7, [hl] ; 2ec5
	call Function1ea9 ; 2ec7
	ret ; 2eca
; 2ecb

Function2ecb::
	call Function1e29 ; 2ecb
	ldh a, [hROMBank] ; 2ece
	push af ; 2ed0
	ld a, $1 ; 2ed1
	rst Bankswitch ; 2ed3
	call Function6551 ; 2ed4
	call Functionf45 ; 2ed7
	call Function2ee3 ; 2eda
	call Function65cb ; 2edd
	pop af ; 2ee0
	rst Bankswitch ; 2ee1
	ret ; 2ee2
; 2ee3

Function2ee3::
	ldh a, [$ffda] ; 2ee3
	push af ; 2ee5
	ld a, $1 ; 2ee6
	ldh [$ffda], a ; 2ee8
	call Function348e ; 2eea
	pop af ; 2eed
	ldh [$ffda], a ; 2eee
	ret ; 2ef0
; 2ef1

Function2ef1::
	ldh a, [$ffda] ; 2ef1
	push af ; 2ef3
	ldh a, [$ffd6] ; 2ef4
	push af ; 2ef6
	xor a ; 2ef7
	ldh [$ffd6], a ; 2ef8
	ld a, $1 ; 2efa
	ldh [$ffda], a ; 2efc
	call Function196f ; 2efe
	xor a ; 2f01
	ldh [$ffda], a ; 2f02
	call Function32e ; 2f04
	pop af ; 2f07
	ldh [$ffd6], a ; 2f08
	pop af ; 2f0a
	ldh [$ffda], a ; 2f0b
	ret ; 2f0d
; 2f0e

Function2f0e::
	scf ; 2f0e
	ret ; 2f0f
; 2f10

Function2f10::
	xor a ; 2f10
	ld hl, $d7b7 ; 2f11
	ld [hli], a ; 2f14
	ret ; 2f15
; 2f16

Function2f16::
	xor a ; 2f16
	ld hl, $d93f ; 2f17
	ld [hli], a ; 2f1a
	ld [hl], a ; 2f1b
	ret ; 2f1c
; 2f1d

Function2f1d::
	ld a, [$d083] ; 2f1d
	cp $2 ; 2f20
	jr z, Function2f29 ; 2f22
	cp $1 ; 2f24
	jr z, Function2f29 ; 2f26
	ret ; 2f28
; 2f29

Function2f29::
	ld hl, $d571 ; 2f29
	res 2, [hl] ; 2f2c
	ret ; 2f2e
; 2f2f

Function2f2f::
	ld hl, $d7b7 ; 2f2f
	call Function2f36 ; 2f32
	ret ; 2f35
; 2f36

Function2f36::
	ld a, e ; 2f36
	and $7 ; 2f37
	srl d ; 2f39
	rr e ; 2f3b
	srl d ; 2f3d
	rr e ; 2f3f
	srl d ; 2f41
	rr e ; 2f43
	add hl, de ; 2f45
	ld c, $1 ; 2f46
	rrca ; 2f48
	jr nc, Function2f4d ; 2f49
	rlc c ; 2f4b
	rrca ; 2f4d
	jr nc, Function2f54 ; 2f4e
	rlc c ; 2f50
	rlc c ; 2f52
	rrca ; 2f54
	jr nc, Function2f59 ; 2f55
	swap c ; 2f57
	ld a, b ; 2f59
	cp $1 ; 2f5a
	jr c, Function2f68 ; 2f5c
	jr z, Function2f64 ; 2f5e
	ld a, [hl] ; 2f60
	and c ; 2f61
	ld c, a ; 2f62
	ret ; 2f63
; 2f64

Function2f64::
	ld a, [hl] ; 2f64
	or c ; 2f65
	ld [hl], a ; 2f66
	ret ; 2f67
; 2f68

Function2f68::
	ld a, c ; 2f68
	cpl ; 2f69
	and [hl] ; 2f6a
	ld [hl], a ; 2f6b
	ret ; 2f6c
; 2f6d

Function2f6d::
	ld de, $b ; 2f6d
	ld b, $2 ; 2f70
	ld a, $3 ; 2f72
	ld hl, $401b ; 2f74
	rst FarCall ; 2f77
	ld a, c ; 2f78
	and a ; 2f79
	ret ; 2f7a
; 2f7b

Function2f7b::
	ld a, [$c1cb] ; 2f7b
	bit 1, a ; 2f7e
	ret z ; 2f80
	ldh a, [$ffaa] ; 2f81
	bit 1, a ; 2f83
	ret ; 2f85
; 2f86

Function2f86::
	xor a ; 2f86
	ret ; 2f87
; 2f88

Function2f88::
	xor a ; 2f88
	dec a ; 2f89
	ret ; 2f8a
; 2f8b

Function2f8b::
	push hl ; 2f8b
	ld hl, $c1cb ; 2f8c
	bit 1, [hl] ; 2f8f
	pop hl ; 2f91
	ret ; 2f92
; 2f93

Function2f93::
	xor a ; 2f93
	ldh [$ffe0], a ; 2f94
	ld a, [$cfe5] ; 2f96
	res 0, a ; 2f99
	ld [$cfe5], a ; 2f9b
	ld a, $0 ; 2f9e
	ld [$c1cd], a ; 2fa0
	ret ; 2fa3
; 2fa4

Function2fa4::
	ld a, $1 ; 2fa4
	ld [$c1cd], a ; 2fa6
	ld a, [$cfe5] ; 2fa9
	set 0, a ; 2fac
	ld [$cfe5], a ; 2fae
	ld a, $1 ; 2fb1
	ldh [$ffe0], a ; 2fb3
	ret ; 2fb5
; 2fb6

Function2fb6::
	push hl ; 2fb6
	jr Function2fbc ; 2fb7
; 2fb9

Function2fb9::
	push hl ; 2fb9
	ld c, $a ; 2fba
	push bc ; 2fbc
	ld a, [hli] ; 2fbd
	cp $50 ; 2fbe
	jr z, Function2fc9 ; 2fc0
	cp $7f ; 2fc2
	jr nz, Function2fd4 ; 2fc4
	dec c ; 2fc6
	jr nz, Function2fbd ; 2fc7
	pop bc ; 2fc9
	ld l, e ; 2fca
	ld h, d ; 2fcb
	pop de ; 2fcc
	ld b, $0 ; 2fcd
	inc c ; 2fcf
	call Function311a ; 2fd0
	ret ; 2fd3
; 2fd4

Function2fd4::
	pop bc ; 2fd4
	pop hl ; 2fd5
	ret ; 2fd6
; 2fd7

Function2fd7::
	ld a, [$da00] ; 2fd7
	ld b, a ; 2fda
	ld a, [$da01] ; 2fdb
	ld c, a ; 2fde
	call Function2d88 ; 2fdf
	cp $5e ; 2fe2
	jr z, Function2ff9 ; 2fe4
	cp $0 ; 2fe6
	jr nz, Function2ff5 ; 2fe8
	ld a, [$d9f6] ; 2fea
	ld b, a ; 2fed
	ld a, [$d9f7] ; 2fee
	ld c, a ; 2ff1
	call Function2d88 ; 2ff2
	cp $2e ; 2ff5
	jr nc, Function2ffb ; 2ff7
	xor a ; 2ff9
	ret ; 2ffa
; 2ffb

Function2ffb::
	ld a, $1 ; 2ffb
	ret ; 2ffd
; 2ffe

Function2ffe::
	push hl ; 2ffe
	xor a ; 2fff
	ld hl, $d17c ; 3000
	ld [hli], a ; 3003
	ld [hli], a ; 3004
	ld [hli], a ; 3005
	ld [hl], a ; 3006
	ld a, [$d17a] ; 3007
	ld l, a ; 300a
	ld a, [$d17b] ; 300b
	ld h, a ; 300e
	or l ; 300f
	jr z, Function3053 ; 3010
	ldh a, [hROMBank] ; 3012
	push af ; 3014
	call Function2d2b ; 3015
	ld a, [$d20d] ; 3018
	add a, $4 ; 301b
	ld d, a ; 301d
	ld a, [$d20e] ; 301e
	ld a, $4 ; 3021
	ld e, a ; 3023
	push bc ; 3024
	ld c, $0 ; 3025
	ld a, [hl] ; 3027
	cp $ff ; 3028
	jr z, Function3050 ; 302a
	push hl ; 302c
	ld a, d ; 302d
	cp [hl] ; 302e
	jr nz, Function3046 ; 302f
	inc hl ; 3031
	ld a, e ; 3032
	cp [hl] ; 3033
	jr nz, Function3046 ; 3034
	ld hl, $d17c ; 3036
	ld b, $1 ; 3039
	push de ; 303b
	push bc ; 303c
	ld d, $0 ; 303d
	ld a, $3 ; 303f
	call Function2e49 ; 3041
	pop bc ; 3044
	pop de ; 3045
	pop hl ; 3046
	inc hl ; 3047
	inc hl ; 3048
	inc hl ; 3049
	inc c ; 304a
	ld a, c ; 304b
	cp $20 ; 304c
	jr c, Function3027 ; 304e
	pop bc ; 3050
	pop af ; 3051
	rst Bankswitch ; 3052
	pop hl ; 3053
	ret ; 3054
; 3055

Function3055::
	ld a, $3 ; 3055
	ld hl, $67a6 ; 3057
	rst FarCall ; 305a
	ret ; 305b
; 305c

Function305c::
	push hl ; 305c
	push de ; 305d
	push bc ; 305e
	ld a, $3 ; 305f
	ld hl, $5434 ; 3061
	rst FarCall ; 3064
	pop bc ; 3065
	pop de ; 3066
	pop hl ; 3067
	ret ; 3068
; 3069

Function3069::
	push hl ; 3069
	push de ; 306a
	push bc ; 306b
	ldh a, [hROMBank] ; 306c
	push af ; 306e
	ld a, $3 ; 306f
	rst Bankswitch ; 3071
	call Function521a ; 3072
	pop bc ; 3075
	ld a, b ; 3076
	rst Bankswitch ; 3077
	pop bc ; 3078
	pop de ; 3079
	pop hl ; 307a
	ret ; 307b
; 307c

Function307c::
	push bc ; 307c
	ldh a, [hROMBank] ; 307d
	push af ; 307f
	ld a, $3 ; 3080
	rst Bankswitch ; 3082
	push hl ; 3083
	push de ; 3084
	call Function51e2 ; 3085
	pop de ; 3088
	pop hl ; 3089
	pop bc ; 308a
	ld a, b ; 308b
	rst Bankswitch ; 308c
	pop bc ; 308d
	ret ; 308e
; 308f

Function308f::
	push hl ; 308f
	push de ; 3090
	push bc ; 3091
	ldh a, [hROMBank] ; 3092
	push af ; 3094
	ld a, $3 ; 3095
	rst Bankswitch ; 3097
	call Function5251 ; 3098
	pop bc ; 309b
	ld a, b ; 309c
	rst Bankswitch ; 309d
	pop bc ; 309e
	pop de ; 309f
	pop hl ; 30a0
	ret ; 30a1
; 30a2

Function30a2::
	push bc ; 30a2
	ldh a, [rDIV] ; 30a3
	ld b, a ; 30a5
	ldh a, [hRandomAdd] ; 30a6
	adc b ; 30a8
	ldh [hRandomAdd], a ; 30a9
	ldh a, [rDIV] ; 30ab
	ld b, a ; 30ad
	ldh a, [$ffe4] ; 30ae
	sbc b ; 30b0
	ldh [$ffe4], a ; 30b1
	pop bc ; 30b3
	ret ; 30b4
; 30b5

Function30b5::
	ldh a, [hROMBank] ; 30b5
	push af ; 30b7
	ld a, $f ; 30b8
	rst Bankswitch ; 30ba
	call Function6c11 ; 30bb
	ld [$cfdd], a ; 30be
	pop af ; 30c1
	rst Bankswitch ; 30c2
	ld a, [$cfdd] ; 30c3
	ret ; 30c6
; 30c7

RandomRange::
	push bc ; 30c7
	ld c, a ; 30c8
	xor a ; 30c9
	sub c ; 30ca
	sub c ; 30cb
	jr nc, Function30cb ; 30cc
	add c ; 30ce
	ld b, a ; 30cf
	push bc ; 30d0
	call Function30a2 ; 30d1
	ldh a, [hRandomAdd] ; 30d4
	ld c, a ; 30d6
	add b ; 30d7
	jr c, Function30d1 ; 30d8
	ld a, c ; 30da
	pop bc ; 30db
	call Function31b5 ; 30dc
	pop bc ; 30df
	ret ; 30e0
; 30e1

INCLUDE "home/sram.asm"

Function30fc::
	jp [hl] ; 30fc
	push de ; 30fd
	ret ; 30fe
; 30ff

Function30ff::
	ld hl, $c300 ; 30ff
	ld b, $a0 ; 3102
	xor a ; 3104
	ld [hli], a ; 3105
	dec b ; 3106
	jr nz, Function3105 ; 3107
	ret ; 3109
; 310a

Function310a::
	ld hl, $c300 ; 310a
	ld de, $4 ; 310d
	ld b, $28 ; 3110
	ld a, $a0 ; 3112
	ld [hl], a ; 3114
	add hl, de ; 3115
	dec b ; 3116
	jr nz, Function3114 ; 3117
	ret ; 3119
; 311a

Function311a::
	inc b ; 311a
	inc c ; 311b
	jr Function3121 ; 311c
; 311e

Function311e::
	ld a, [hli] ; 311e
	ld [de], a ; 311f
	inc de ; 3120
	dec c ; 3121
	jr nz, Function311e ; 3122
	dec b ; 3124
	jr nz, Function311e ; 3125
	ret ; 3127
; 3128

Function3128::
	ld [$d156], a ; 3128
	ldh a, [hROMBank] ; 312b
	push af ; 312d
	ld a, [$d156] ; 312e
	rst Bankswitch ; 3131
	ld a, [hl] ; 3132
	ld [$d156], a ; 3133
	pop af ; 3136
	rst Bankswitch ; 3137
	ld a, [$d156] ; 3138
	ret ; 313b
; 313c

Function313c::
	ld [$d156], a ; 313c
	ldh a, [hROMBank] ; 313f
	push af ; 3141
	ld a, [$d156] ; 3142
	rst Bankswitch ; 3145
	ld a, [hli] ; 3146
	ld h, [hl] ; 3147
	ld l, a ; 3148
	pop af ; 3149
	rst Bankswitch ; 314a
	ret ; 314b
; 314c

Function314c::
	inc b ; 314c
	inc c ; 314d
	jr Function3151 ; 314e
; 3150

Function3150::
	ld [hli], a ; 3150
	dec c ; 3151
	jr nz, Function3150 ; 3152
	dec b ; 3154
	jr nz, Function3150 ; 3155
	ret ; 3157
; 3158

Function3158::
	ld hl, $c3a0 ; 3158
	ld de, $c508 ; 315b
	ld bc, $168 ; 315e
	jp Function311a ; 3161
; 3164

Function3164::
	xor a ; 3164
	ldh [$ffd6], a ; 3165
	call Function316f ; 3167
	ld a, $1 ; 316a
	ldh [$ffd6], a ; 316c
	ret ; 316e
; 316f

Function316f::
	ld hl, $c508 ; 316f
	ld de, $c3a0 ; 3172
	ld bc, $168 ; 3175
	jp Function311a ; 3178
; 317b

Function317b::
	ld hl, $cf7e ; 317b
	ld a, [de] ; 317e
	inc de ; 317f
	ld [hli], a ; 3180
	cp $50 ; 3181
	jr nz, Function317e ; 3183
	ret ; 3185
; 3186

Function3186::
	ld b, $0 ; 3186
	ld c, a ; 3188
	ld a, [hl] ; 3189
	cp $ff ; 318a
	jr z, Function3195 ; 318c
	cp c ; 318e
	jr z, Function3197 ; 318f
	inc b ; 3191
	add hl, de ; 3192
	jr Function3189 ; 3193
; 3195

Function3195::
	and a ; 3195
	ret ; 3196
; 3197

Function3197::
	scf ; 3197
	ret ; 3198
; 3199

Function3199::
	ld bc, $b ; 3199
	and a ; 319c
	ret z ; 319d
	add hl, bc ; 319e
	dec a ; 319f
	jr nz, Function319e ; 31a0
	ret ; 31a2
; 31a3

Function31a3::
	and a ; 31a3
	ret z ; 31a4
	add hl, bc ; 31a5
	dec a ; 31a6
	jr nz, Function31a5 ; 31a7
	ret ; 31a9
; 31aa

Function31aa::
	and a ; 31aa
	ret z ; 31ab
	push bc ; 31ac
	ld b, a ; 31ad
	xor a ; 31ae
	add c ; 31af
	dec b ; 31b0
	jr nz, Function31af ; 31b1
	pop bc ; 31b3
	ret ; 31b4
; 31b5

Function31b5::
	ld b, $0 ; 31b5
	inc b ; 31b7
	sub c ; 31b8
	jr nc, Function31b7 ; 31b9
	dec b ; 31bb
	add c ; 31bc
	ret ; 31bd
; 31be

Function31be::
	push hl ; 31be
	push bc ; 31bf
	ld hl, $67bd ; 31c0
	ld a, $1 ; 31c3
	rst FarCall ; 31c5
	pop bc ; 31c6
	pop hl ; 31c7
	ret ; 31c8
; 31c9

Function31c9::
	push hl ; 31c9
	push de ; 31ca
	push bc ; 31cb
	ldh a, [hROMBank] ; 31cc
	push af ; 31ce
	ld a, $1 ; 31cf
	rst Bankswitch ; 31d1
	call Function681d ; 31d2
	pop af ; 31d5
	rst Bankswitch ; 31d6
	pop bc ; 31d7
	pop de ; 31d8
	pop hl ; 31d9
	ret ; 31da
; 31db

Function31db::
	sub b ; 31db
	ret nc ; 31dc
	cpl ; 31dd
	add a, $1 ; 31de
	scf ; 31e0
	ret ; 31e1
; 31e2

Function31e2::
	ld a, [$d199] ; 31e2
	bit 4, a ; 31e5
	ret nz ; 31e7
	ld a, [$d19c] ; 31e8
	bit 1, a ; 31eb
	ret z ; 31ed
	push hl ; 31ee
	push de ; 31ef
	push bc ; 31f0
	ld hl, $ffda ; 31f1
	ld a, [hl] ; 31f4
	push af ; 31f5
	ld [hl], a ; 31f6
	ld a, [$d19c] ; 31f7
	bit 0, a ; 31fa
	jr z, Function3205 ; 31fc
	ld a, [$d199] ; 31fe
	and $7 ; 3201
	jr Function3207 ; 3203
; 3205

Function3205::
	ld a, $1 ; 3205
	ld [$cee9], a ; 3207
	call Function935 ; 320a
	ld a, [$c1d6] ; 320d
	and a ; 3210
	jr nz, Function3224 ; 3211
	ldh a, [$ffaa] ; 3213
	bit 0, a ; 3215
	jr z, Function321b ; 3217
	jr Function321f ; 3219
; 321b

Function321b::
	bit 1, a ; 321b
	jr z, Function3224 ; 321d
	call Function32e ; 321f
	jr Function322a ; 3222
; 3224

Function3224::
	ld a, [$cee9] ; 3224
	and a ; 3227
	jr nz, Function320a ; 3228
	pop af ; 322a
	ldh [$ffda], a ; 322b
	pop bc ; 322d
	pop de ; 322e
	pop hl ; 322f
	ret ; 3230
; 3231

Function3231::
	ld a, [hli] ; 3231
	ld [de], a ; 3232
	inc de ; 3233
	ld a, h ; 3234
	cp b ; 3235
	jr nz, Function3231 ; 3236
	ld a, l ; 3238
	cp c ; 3239
	jr nz, Function3231 ; 323a
	ret ; 323c
; 323d

Function323d::
	push bc ; 323d
	bit 5, b ; 323e
	jr z, Function324f ; 3240
	bit 7, b ; 3242
	jr nz, Function324a ; 3244
	bit 6, b ; 3246
	jr z, Function324f ; 3248
	ld a, $f0 ; 324a
	ld [hli], a ; 324c
	res 5, b ; 324d
	xor a ; 324f
	ldh [$ffb5], a ; 3250
	ldh [$ffb6], a ; 3252
	ldh [$ffb7], a ; 3254
	ld a, b ; 3256
	and $f ; 3257
	cp $1 ; 3259
	jr z, Function3277 ; 325b
	cp $2 ; 325d
	jr z, Function326e ; 325f
	ld a, [de] ; 3261
	ldh [$ffb6], a ; 3262
	inc de ; 3264
	ld a, [de] ; 3265
	ldh [$ffb7], a ; 3266
	inc de ; 3268
	ld a, [de] ; 3269
	ldh [$ffb8], a ; 326a
	jr Function327a ; 326c
; 326e

Function326e::
	ld a, [de] ; 326e
	ldh [$ffb7], a ; 326f
	inc de ; 3271
	ld a, [de] ; 3272
	ldh [$ffb8], a ; 3273
	jr Function327a ; 3275
; 3277

Function3277::
	ld a, [de] ; 3277
	ldh [$ffb8], a ; 3278
	push de ; 327a
	ld d, b ; 327b
	ld a, c ; 327c
	swap a ; 327d
	and $f ; 327f
	ld e, a ; 3281
	ld a, c ; 3282
	and $f ; 3283
	ld b, a ; 3285
	ld c, $0 ; 3286
	cp $2 ; 3288
	jr z, Function32f2 ; 328a
	cp $3 ; 328c
	jr z, Function32e2 ; 328e
	cp $4 ; 3290
	jr z, Function32d1 ; 3292
	cp $5 ; 3294
	jr z, Function32c0 ; 3296
	cp $6 ; 3298
	jr z, Function32ae ; 329a
	ld a, $f ; 329c
	ldh [$ffb9], a ; 329e
	ld a, $42 ; 32a0
	ldh [$ffba], a ; 32a2
	ld a, $40 ; 32a4
	ldh [$ffbb], a ; 32a6
	call Function3341 ; 32a8
	call Function33c0 ; 32ab
	ld a, $1 ; 32ae
	ldh [$ffb9], a ; 32b0
	ld a, $86 ; 32b2
	ldh [$ffba], a ; 32b4
	ld a, $a0 ; 32b6
	ldh [$ffbb], a ; 32b8
	call Function3341 ; 32ba
	call Function33c0 ; 32bd
	xor a ; 32c0
	ldh [$ffb9], a ; 32c1
	ld a, $27 ; 32c3
	ldh [$ffba], a ; 32c5
	ld a, $10 ; 32c7
	ldh [$ffbb], a ; 32c9
	call Function3341 ; 32cb
	call Function33c0 ; 32ce
	xor a ; 32d1
	ldh [$ffb9], a ; 32d2
	ld a, $3 ; 32d4
	ldh [$ffba], a ; 32d6
	ld a, $e8 ; 32d8
	ldh [$ffbb], a ; 32da
	call Function3341 ; 32dc
	call Function33c0 ; 32df
	xor a ; 32e2
	ldh [$ffb9], a ; 32e3
	xor a ; 32e5
	ldh [$ffba], a ; 32e6
	ld a, $64 ; 32e8
	ldh [$ffbb], a ; 32ea
	call Function3341 ; 32ec
	call Function33c0 ; 32ef
	dec e ; 32f2
	jr nz, Function32f9 ; 32f3
	ld a, $f6 ; 32f5
	ldh [$ffb5], a ; 32f7
	ld c, $0 ; 32f9
	ldh a, [$ffb8] ; 32fb
	cp $a ; 32fd
	jr c, Function3306 ; 32ff
	sub a, $a ; 3301
	inc c ; 3303
	jr Function32fd ; 3304
; 3306

Function3306::
	ld b, a ; 3306
	ldh a, [$ffb5] ; 3307
	or c ; 3309
	jr nz, Function3311 ; 330a
	call Function33ba ; 330c
	jr Function3323 ; 330f
; 3311

Function3311::
	call Function3330 ; 3311
	push af ; 3314
	ld a, $f6 ; 3315
	add c ; 3317
	ld [hl], a ; 3318
	pop af ; 3319
	ldh [$ffb5], a ; 331a
	inc e ; 331c
	dec e ; 331d
	jr nz, Function3323 ; 331e
	inc hl ; 3320
	ld [hl], $e8 ; 3321
	call Function33c0 ; 3323
	call Function3330 ; 3326
	ld a, $f6 ; 3329
	add b ; 332b
	ld [hli], a ; 332c
	pop de ; 332d
	pop bc ; 332e
	ret ; 332f
; 3330

Function3330::
	push af ; 3330
	ldh a, [$ffb5] ; 3331
	and a ; 3333
	jr nz, Function333f ; 3334
	bit 5, d ; 3336
	jr z, Function333f ; 3338
	ld a, $f0 ; 333a
	ld [hli], a ; 333c
	res 5, d ; 333d
	pop af ; 333f
	ret ; 3340
; 3341

Function3341::
	dec e ; 3341
	jr nz, Function3348 ; 3342
	ld a, $f6 ; 3344
	ldh [$ffb5], a ; 3346
	ld c, $0 ; 3348
	ldh a, [$ffb9] ; 334a
	ld b, a ; 334c
	ldh a, [$ffb6] ; 334d
	ldh [$ffbc], a ; 334f
	cp b ; 3351
	jr c, Function339a ; 3352
	sub b ; 3354
	ldh [$ffb6], a ; 3355
	ldh a, [$ffba] ; 3357
	ld b, a ; 3359
	ldh a, [$ffb7] ; 335a
	ldh [$ffbd], a ; 335c
	cp b ; 335e
	jr nc, Function336c ; 335f
	ldh a, [$ffb6] ; 3361
	or $0 ; 3363
	jr z, Function3396 ; 3365
	dec a ; 3367
	ldh [$ffb6], a ; 3368
	ldh a, [$ffb7] ; 336a
	sub b ; 336c
	ldh [$ffb7], a ; 336d
	ldh a, [$ffbb] ; 336f
	ld b, a ; 3371
	ldh a, [$ffb8] ; 3372
	ldh [$ffbe], a ; 3374
	cp b ; 3376
	jr nc, Function338c ; 3377
	ldh a, [$ffb7] ; 3379
	and a ; 337b
	jr nz, Function3387 ; 337c
	ldh a, [$ffb6] ; 337e
	and a ; 3380
	jr z, Function3392 ; 3381
	dec a ; 3383
	ldh [$ffb6], a ; 3384
	xor a ; 3386
	dec a ; 3387
	ldh [$ffb7], a ; 3388
	ldh a, [$ffb8] ; 338a
	sub b ; 338c
	ldh [$ffb8], a ; 338d
	inc c ; 338f
	jr Function334a ; 3390
; 3392

Function3392::
	ldh a, [$ffbd] ; 3392
	ldh [$ffb7], a ; 3394
	ldh a, [$ffbc] ; 3396
	ldh [$ffb6], a ; 3398
	ldh a, [$ffb5] ; 339a
	or c ; 339c
	jr z, Function33ba ; 339d
	ldh a, [$ffb5] ; 339f
	and a ; 33a1
	jr nz, Function33ad ; 33a2
	bit 5, d ; 33a4
	jr z, Function33ad ; 33a6
	ld a, $f0 ; 33a8
	ld [hli], a ; 33aa
	res 5, d ; 33ab
	ld a, $f6 ; 33ad
	add c ; 33af
	ld [hl], a ; 33b0
	ldh [$ffb5], a ; 33b1
	inc e ; 33b3
	dec e ; 33b4
	ret nz ; 33b5
	inc hl ; 33b6
	ld [hl], $e8 ; 33b7
	ret ; 33b9
; 33ba

Function33ba::
	bit 7, d ; 33ba
	ret z ; 33bc
	ld [hl], $f6 ; 33bd
	ret ; 33bf
; 33c0

Function33c0::
	bit 7, d ; 33c0
	jr nz, Function33cc ; 33c2
	bit 6, d ; 33c4
	jr z, Function33cc ; 33c6
	ldh a, [$ffb5] ; 33c8
	and a ; 33ca
	ret z ; 33cb
	inc hl ; 33cc
	ret ; 33cd
; 33ce

Function33ce::
	push bc ; 33ce
	call Function33d7 ; 33cf
	pop bc ; 33d2
	dec c ; 33d3
	jr nz, Function33ce ; 33d4
	ret ; 33d6
; 33d7

Function33d7::
	ld a, [de] ; 33d7
	swap a ; 33d8
	and $f ; 33da
	call Function33e9 ; 33dc
	ld [hli], a ; 33df
	ld a, [de] ; 33e0
	and $f ; 33e1
	call Function33e9 ; 33e3
	ld [hli], a ; 33e6
	inc de ; 33e7
	ret ; 33e8
; 33e9

Function33e9::
	ld bc, $33f4 ; 33e9
	add c ; 33ec
	ld c, a ; 33ed
	ld a, $0 ; 33ee
	adc b ; 33f0
	ld b, a ; 33f1
	ld a, [bc] ; 33f2
	ret ; 33f3
; 33f4

Function33f4::
	or $f7 ; 33f4
	ld hl, [sp+$f9] ; 33f6
	ld a, [$fcfb] ; 33f8
	- ; 33fb
	cp $ff ; 33fc
	add b ; 33fe
	add c ; 33ff
	add d ; 3400
	add e ; 3401
	add h ; 3402
	add l ; 3403
	ld [$d156], a ; 3404
	ldh a, [hROMBank] ; 3407
	push af ; 3409
	ld a, [$d156] ; 340a
	rst Bankswitch ; 340d
	call Functionf5e ; 340e
	pop af ; 3411
	rst Bankswitch ; 3412
	ret ; 3413
; 3414

Function3414::
	ldh a, [hROMBank] ; 3414
	push af ; 3416
	ld a, [hli] ; 3417
	rst Bankswitch ; 3418
	ld a, [hli] ; 3419
	ld h, [hl] ; 341a
	ld l, a ; 341b
	call Function30fc ; 341c
	pop hl ; 341f
	ld a, h ; 3420
	rst Bankswitch ; 3421
	ret ; 3422
; 3423

Function3423::
	ldh a, [hROMBank] ; 3423
	ld [$cfd8], a ; 3425
	ld a, l ; 3428
	ld [$cfd9], a ; 3429
	ld a, h ; 342c
	ld [$cfda], a ; 342d
	ret ; 3430
; 3431

Function3431::
	ld a, [de] ; 3431
	cp [hl] ; 3432
	ret nz ; 3433
	inc de ; 3434
	inc hl ; 3435
	dec c ; 3436
	jr nz, Function3431 ; 3437
	ret ; 3439
; 343a

Function343a::
	ld a, [de] ; 343a
	cp [hl] ; 343b
	jr nz, Function3447 ; 343c
	inc de ; 343e
	inc hl ; 343f
	dec bc ; 3440
	ld a, b ; 3441
	or c ; 3442
	jr nz, Function343a ; 3443
	scf ; 3445
	ret ; 3446
; 3447

Function3447::
	and a ; 3447
	ret ; 3448
; 3449

Function3449::
	call Function3564 ; 3449
WaitBGMap::
	ld a, $1 ; 344c
	ldh [$ffd6], a ; 344e
	ld c, $4 ; 3450
	call Function33c ; 3452
	ret ; 3455
; 3456

Function3456::
	ldh a, [$ffe8] ; 3456
	and a ; 3458
	jr z, Function3464 ; 3459
	ld a, $2 ; 345b
	ldh [$ffd6], a ; 345d
	ld c, $4 ; 345f
	call Function33c ; 3461
	ld a, $1 ; 3464
	ldh [$ffd6], a ; 3466
	ld c, $4 ; 3468
	call Function33c ; 346a
	ret ; 346d
; 346e

Function346e::
	ldh a, [$ffe8] ; 346e
	and a ; 3470
	ret ; 3471
; 3472

Function3472::
	ldh a, [$ffe8] ; 3472
	and a ; 3474
	jr z, Function3484 ; 3475
	ld a, [$c1cd] ; 3477
	cp $0 ; 347a
	jr z, Function3484 ; 347c
	ld a, $1 ; 347e
	ldh [$ffd6], a ; 3480
	jr Function3493 ; 3482
; 3484

Function3484::
	ld a, $1 ; 3484
	ldh [$ffd6], a ; 3486
	ld c, $4 ; 3488
	call Function33c ; 348a
	ret ; 348d
; 348e

Function348e::
	ldh a, [$ffe8] ; 348e
	and a ; 3490
	jr z, Function344c ; 3491
	ldh a, [$ffd6] ; 3493
	push af ; 3495
	xor a ; 3496
	ldh [$ffd6], a ; 3497
	ldh a, [$ffe0] ; 3499
	push af ; 349b
	xor a ; 349c
	ldh [$ffe0], a ; 349d
	ldh a, [$ff44] ; 349f
	cp $7f ; 34a1
	jr c, Function349f ; 34a3
	di ; 34a5
	ld a, $1 ; 34a6
	ldh [$ff4f], a ; 34a8
	ld hl, $ccd9 ; 34aa
	call Function34c8 ; 34ad
	ld a, $0 ; 34b0
	ldh [$ff4f], a ; 34b2
	ld hl, $c3a0 ; 34b4
	call Function34c8 ; 34b7
	ldh a, [$ff44] ; 34ba
	cp $7f ; 34bc
	jr c, Function34ba ; 34be
	ei ; 34c0
	pop af ; 34c1
	ldh [$ffe0], a ; 34c2
	pop af ; 34c4
	ldh [$ffd6], a ; 34c5
	ret ; 34c7
; 34c8

Function34c8::
	ld [$ffdb], sp ; 34c8
	ld sp, hl ; 34cb
	ldh a, [$ffd9] ; 34cc
	ld h, a ; 34ce
	ld l, $0 ; 34cf
	ld a, $12 ; 34d1
	ldh [$ffd5], a ; 34d3
	ld b, $2 ; 34d5
	ld c, $41 ; 34d7
	pop de ; 34d9
	ld a, [$ff00+c] ; 34da
	and b ; 34db
	jr nz, Function34da ; 34dc
	ld [hl], e ; 34de
	inc l ; 34df
	ld [hl], d ; 34e0
	inc l ; 34e1
	pop de ; 34e2
	ld a, [$ff00+c] ; 34e3
	and b ; 34e4
	jr nz, Function34e3 ; 34e5
	ld [hl], e ; 34e7
	inc l ; 34e8
	ld [hl], d ; 34e9
	inc l ; 34ea
	pop de ; 34eb
	ld a, [$ff00+c] ; 34ec
	and b ; 34ed
	jr nz, Function34ec ; 34ee
	ld [hl], e ; 34f0
	inc l ; 34f1
	ld [hl], d ; 34f2
	inc l ; 34f3
	pop de ; 34f4
	ld a, [$ff00+c] ; 34f5
	and b ; 34f6
	jr nz, Function34f5 ; 34f7
	ld [hl], e ; 34f9
	inc l ; 34fa
	ld [hl], d ; 34fb
	inc l ; 34fc
	pop de ; 34fd
	ld a, [$ff00+c] ; 34fe
	and b ; 34ff
	jr nz, Function34fe ; 3500
	ld [hl], e ; 3502
	inc l ; 3503
	ld [hl], d ; 3504
	inc l ; 3505
	pop de ; 3506
	ld a, [$ff00+c] ; 3507
	and b ; 3508
	jr nz, Function3507 ; 3509
	ld [hl], e ; 350b
	inc l ; 350c
	ld [hl], d ; 350d
	inc l ; 350e
	pop de ; 350f
	ld a, [$ff00+c] ; 3510
	and b ; 3511
	jr nz, Function3510 ; 3512
	ld [hl], e ; 3514
	inc l ; 3515
	ld [hl], d ; 3516
	inc l ; 3517
	pop de ; 3518
	ld a, [$ff00+c] ; 3519
	and b ; 351a
	jr nz, Function3519 ; 351b
	ld [hl], e ; 351d
	inc l ; 351e
	ld [hl], d ; 351f
	inc l ; 3520
	pop de ; 3521
	ld a, [$ff00+c] ; 3522
	and b ; 3523
	jr nz, Function3522 ; 3524
	ld [hl], e ; 3526
	inc l ; 3527
	ld [hl], d ; 3528
	inc l ; 3529
	pop de ; 352a
	ld a, [$ff00+c] ; 352b
	and b ; 352c
	jr nz, Function352b ; 352d
	ld [hl], e ; 352f
	inc l ; 3530
	ld [hl], d ; 3531
	inc l ; 3532
	ld de, $c ; 3533
	add hl, de ; 3536
	ldh a, [$ffd5] ; 3537
	dec a ; 3539
	ldh [$ffd5], a ; 353a
	jr nz, Function34d9 ; 353c
	ldh a, [$ffdb] ; 353e
	ld l, a ; 3540
	ldh a, [$ffdc] ; 3541
	ld h, a ; 3543
	ld sp, hl ; 3544
	ret ; 3545
; 3546

Function3546::
	ldh a, [$ffe8] ; 3546
	and a ; 3548
	jr nz, Function3556 ; 3549
	ld a, $e4 ; 354b
	ldh [$ff47], a ; 354d
	ld a, $d0 ; 354f
	ldh [$ff48], a ; 3551
	ldh [$ff49], a ; 3553
	ret ; 3555
; 3556

Function3556::
	push de ; 3556
	ld a, $e4 ; 3557
	call Functionc61 ; 3559
	ld de, $e4e4 ; 355c
	call Functionc83 ; 355f
	pop de ; 3562
	ret ; 3563
; 3564

Function3564::
	ldh a, [$ffe8] ; 3564
	and a ; 3566
	jr nz, Function3571 ; 3567
	xor a ; 3569
	ldh [$ff47], a ; 356a
	ldh [$ff48], a ; 356c
	ldh [$ff49], a ; 356e
	ret ; 3570
; 3571

Function3571::
	ld hl, $c280 ; 3571
	ld bc, $80 ; 3574
	ld a, $ff ; 3577
	call Function314c ; 3579
	ld a, $1 ; 357c
	ldh [$ffe7], a ; 357e
	ret ; 3580
; 3581

Function3581::
	ld b, $ff ; 3581
	ldh a, [$ffe8] ; 3583
	and a ; 3585
	jr nz, Function358c ; 3586
	ldh a, [$ffe9] ; 3588
	and a ; 358a
	ret z ; 358b
	ld a, $31 ; 358c
	jp Function2e49 ; 358e
; 3591

Function3591::
	call Function3596 ; 3591
	ld [hl], d ; 3594
	ret ; 3595
; 3596

Function3596::
	ld d, $0 ; 3596
	ld a, e ; 3598
	cp $18 ; 3599
	ret nc ; 359b
	inc d ; 359c
	cp $a ; 359d
	ret nc ; 359f
	inc d ; 35a0
	ret ; 35a1
; 35a2

Function35a2::
	ld c, $0 ; 35a2
	ld a, [hli] ; 35a4
	ld e, a ; 35a5
	ld d, $8 ; 35a6
	srl e ; 35a8
	ld a, $0 ; 35aa
	adc c ; 35ac
	ld c, a ; 35ad
	dec d ; 35ae
	jr nz, Function35a8 ; 35af
	dec b ; 35b1
	jr nz, Function35a4 ; 35b2
	ld a, c ; 35b4
	ld [$d151], a ; 35b5
	ret ; 35b8
; 35b9

Function35b9::
	ld a, [$d1f2] ; 35b9
	sub a, $7 ; 35bc
	jr nc, Function35bc ; 35be
	add a, $7 ; 35c0
	ret ; 35c2
; 35c3

Function35c3::
	push af ; 35c3
	ld c, a ; 35c4
	ld hl, $dbe4 ; 35c5
	ld b, $1 ; 35c8
	call Function35e4 ; 35ca
	pop af ; 35cd
	ld c, a ; 35ce
	ld hl, $dc04 ; 35cf
	ld b, $1 ; 35d2
	jr Function35e4 ; 35d4
; 35d6

Function35d6::
	ld c, a ; 35d6
	ld hl, $dbe4 ; 35d7
	ld b, $2 ; 35da
	jr Function35e4 ; 35dc
; 35de

Function35de::
	ld c, a ; 35de
	ld hl, $dc04 ; 35df
	ld b, $2 ; 35e2
	ld d, $0 ; 35e4
	ld a, $3 ; 35e6
	call Function2e49 ; 35e8
	ld a, c ; 35eb
	and a ; 35ec
	ret ; 35ed
; 35ee

Function35ee::
	ld l, h ; 35ee
	ld [hl], h ; 35ef
	ld c, e ; 35f0
	ld l, h ; 35f1
	ld [hl], h ; 35f2
	ld d, l ; 35f3
	nop ; 35f4
	nop ; 35f5
	nop ; 35f6
	ld l, h ; 35f7
	nop ; 35f8
	ld b, b ; 35f9
	nop ; 35fa
	ld c, d ; 35fb
	- ; 35fc
	nop ; 35fd
	ld a, l ; 35fe
	sbc a, $6c ; 35ff
	ld d, l ; 3601
	ld c, c ; 3602
	inc b ; 3603
	nop ; 3604
	ld b, b ; 3605
	ldh a, [hROMBank] ; 3606
	push af ; 3608
	push hl ; 3609
	push bc ; 360a
	push de ; 360b
	ld a, [$ce61] ; 360c
	cp $1 ; 360f
	jr nz, Function3624 ; 3611
	ld a, [$ce60] ; 3613
	ld [$d151], a ; 3616
	call Function367e ; 3619
	ld hl, $b ; 361c
	add hl, de ; 361f
	ld e, l ; 3620
	ld d, h ; 3621
	jr Function3646 ; 3622
; 3624

Function3624::
	ld a, [$ce61] ; 3624
	dec a ; 3627
	ld e, a ; 3628
	ld d, $0 ; 3629
	ld hl, $35ee ; 362b
	add hl, de ; 362e
	add hl, de ; 362f
	add hl, de ; 3630
	ld a, [hli] ; 3631
	rst Bankswitch ; 3632
	ld a, [hli] ; 3633
	ld h, [hl] ; 3634
	ld l, a ; 3635
	ld a, [$ce60] ; 3636
	dec a ; 3639
	call Function3654 ; 363a
	ld de, $cf6b ; 363d
	ld bc, $d ; 3640
	call Function311a ; 3643
	ld a, e ; 3646
	ld [$cffe], a ; 3647
	ld a, d ; 364a
	ld [$cfff], a ; 364b
	pop de ; 364e
	pop bc ; 364f
	pop hl ; 3650
	pop af ; 3651
	rst Bankswitch ; 3652
	ret ; 3653
; 3654

Function3654::
	and a ; 3654
	ret z ; 3655
	push bc ; 3656
	ld b, a ; 3657
	ld c, $50 ; 3658
	ld a, [hli] ; 365a
	cp c ; 365b
	jr nz, Function365a ; 365c
	dec b ; 365e
	jr nz, Function365a ; 365f
	pop bc ; 3661
	ret ; 3662
; 3663

Function3663::
	push hl ; 3663
	call Function367e ; 3664
	ld hl, $cf6b ; 3667
	ld a, [hl] ; 366a
	cp $50 ; 366b
	jr z, Function367c ; 366d
	cp $ef ; 366f
	jr z, Function367a ; 3671
	cp $f5 ; 3673
	jr z, Function367a ; 3675
	inc hl ; 3677
	jr Function366a ; 3678
; 367a

Function367a::
	ld [hl], $50 ; 367a
	pop hl ; 367c
	ret ; 367d
; 367e

Function367e::
	ldh a, [hROMBank] ; 367e
	push af ; 3680
	push hl ; 3681
	ld a, $6c ; 3682
	rst Bankswitch ; 3684
	ld a, [$d151] ; 3685
	dec a ; 3688
	ld hl, $4b74 ; 3689
	ld e, a ; 368c
	ld d, $0 ; 368d
	add hl, de ; 368f
	add hl, de ; 3690
	add hl, de ; 3691
	add hl, de ; 3692
	add hl, de ; 3693
	add hl, de ; 3694
	add hl, de ; 3695
	add hl, de ; 3696
	add hl, de ; 3697
	add hl, de ; 3698
	ld de, $cf6b ; 3699
	push de ; 369c
	ld bc, $a ; 369d
	call Function311a ; 36a0
	ld hl, $cf75 ; 36a3
	ld [hl], $50 ; 36a6
	pop de ; 36a8
	pop hl ; 36a9
	pop af ; 36aa
	rst Bankswitch ; 36ab
	ret ; 36ac
; 36ad

Function36ad::
	push hl ; 36ad
	push bc ; 36ae
	ld a, [$d151] ; 36af
	cp $bf ; 36b2
	jr nc, Function36c3 ; 36b4
	ld [$ce60], a ; 36b6
	ld a, $4 ; 36b9
	ld [$ce61], a ; 36bb
	call Function3606 ; 36be
	jr Function36c6 ; 36c1
; 36c3

Function36c3::
	call Function36cc ; 36c3
	ld de, $cf6b ; 36c6
	pop bc ; 36c9
	pop hl ; 36ca
	ret ; 36cb
; 36cc

Function36cc::
	push hl ; 36cc
	push de ; 36cd
	push bc ; 36ce
	ld a, [$d151] ; 36cf
	push af ; 36d2
	cp $f3 ; 36d3
	push af ; 36d5
	jr c, Function36e0 ; 36d6
	ld hl, $3721 ; 36d8
	ld bc, $2 ; 36db
	jr Function36e6 ; 36de
; 36e0

Function36e0::
	ld hl, $371e ; 36e0
	ld bc, $2 ; 36e3
	ld de, $cf6b ; 36e6
	call Function311a ; 36e9
	push de ; 36ec
	ld a, [$d151] ; 36ed
	ld c, a ; 36f0
	ld hl, $5414 ; 36f1
	ld a, $3 ; 36f4
	rst FarCall ; 36f6
	pop de ; 36f7
	pop af ; 36f8
	ld a, c ; 36f9
	jr c, Function36fe ; 36fa
	sub a, $32 ; 36fc
	ld b, $f6 ; 36fe
	sub a, $a ; 3700
	jr c, Function3707 ; 3702
	inc b ; 3704
	jr Function3700 ; 3705
; 3707

Function3707::
	add a, $a ; 3707
	push af ; 3709
	ld a, b ; 370a
	ld [de], a ; 370b
	inc de ; 370c
	pop af ; 370d
	ld b, $f6 ; 370e
	add b ; 3710
	ld [de], a ; 3711
	inc de ; 3712
	ld a, $50 ; 3713
	ld [de], a ; 3715
	pop af ; 3716
	ld [$d151], a ; 3717
	pop bc ; 371a
	pop de ; 371b
	pop hl ; 371c
	ret ; 371d
; 371e

Function371e::
	sub e ; 371e
	adc h ; 371f
	ld d, b ; 3720
	add a ; 3721
	adc h ; 3722
	ld d, b ; 3723
	cp $f3 ; 3724
	jr c, Function372a ; 3726
	scf ; 3728
	ret ; 3729
; 372a

Function372a::
	and a ; 372a
	ret ; 372b
; 372c

Function372c::
	ld hl, $3735 ; 372c
	ld de, $1 ; 372f
	jp Function3186 ; 3732
; 3735

Function3735::
	rrca ; 3735
	inc de ; 3736
	add hl, sp ; 3737
	ld b, [hl] ; 3738
	sub h ; 3739
	ld a, a ; 373a
	ld a, [$e5ff] ; 373b
	ld a, $2 ; 373e
	ld [$ce61], a ; 3740
	ld a, [$d151] ; 3743
	ld [$ce60], a ; 3746
	call Function3606 ; 3749
	ld de, $cf6b ; 374c
	pop hl ; 374f
	ret ; 3750
; 3751

Function3751::
	call Function1af9 ; 3751
	ldh a, [hROMBank] ; 3754
	push af ; 3756
	ld a, $9 ; 3757
	rst Bankswitch ; 3759
	call Function44d7 ; 375a
	call Function3769 ; 375d
	call Function44f3 ; 3760
	pop af ; 3763
	rst Bankswitch ; 3764
	ld a, [$ceaa] ; 3765
	ret ; 3768
; 3769

Function3769::
	ld hl, $cfe5 ; 3769
	bit 0, [hl] ; 376c
	jp nz, Function359 ; 376e
	jp Function3546 ; 3771
; 3774

Function3774::
	ld a, [$ceb9] ; 3774
	dec a ; 3777
	ld b, a ; 3778
	ld a, [$cebb] ; 3779
	sub b ; 377c
	ld d, a ; 377d
	ld a, [$ceba] ; 377e
	dec a ; 3781
	ld c, a ; 3782
	ld a, [$cebc] ; 3783
	sub c ; 3786
	ld e, a ; 3787
	push de ; 3788
	call Function1b98 ; 3789
	pop bc ; 378c
	jp Functioneef ; 378d
; 3790

Function3790::
	call Function32e ; 3790
	ldh a, [$ffac] ; 3793
	push af ; 3795
	ld a, $1 ; 3796
	ldh [$ffac], a ; 3798
	call Functiona08 ; 379a
	pop af ; 379d
	ldh [$ffac], a ; 379e
	ldh a, [$ffab] ; 37a0
	and $f0 ; 37a2
	ld c, a ; 37a4
	ldh a, [$ffa9] ; 37a5
	and $f ; 37a7
	or c ; 37a9
	ld c, a ; 37aa
	ret ; 37ab
; 37ac

Function37ac::
	ldh a, [hROMBank] ; 37ac
	push af ; 37ae
	call Function2d2b ; 37af
	call Function37b9 ; 37b2
	pop bc ; 37b5
	ld a, b ; 37b6
	rst Bankswitch ; 37b7
	ret ; 37b8
; 37b9

Function37b9::
	ld hl, $1 ; 37b9
	add hl, de ; 37bc
	ld a, [hl] ; 37bd
	cp $ff ; 37be
	jr z, Function37dc ; 37c0
	ld l, a ; 37c2
	push hl ; 37c3
	call Function37de ; 37c4
	pop hl ; 37c7
	jr nc, Function37dc ; 37c8
	ld d, a ; 37ca
	ld e, l ; 37cb
	call Function3823 ; 37cc
	jr nc, Function37dc ; 37cf
	call Function275a ; 37d1
	ld a, $25 ; 37d4
	ld hl, $6b89 ; 37d6
	rst FarCall ; 37d9
	scf ; 37da
	ret ; 37db
; 37dc

Function37dc::
	and a ; 37dc
	ret ; 37dd
; 37de

Function37de::
	push de ; 37de
	ld hl, $10 ; 37df
	add hl, de ; 37e2
	ld a, [hl] ; 37e3
	ld hl, $11 ; 37e4
	add hl, de ; 37e7
	ld e, [hl] ; 37e8
	sub a, $4 ; 37e9
	ld d, a ; 37eb
	ld a, e ; 37ec
	sub a, $4 ; 37ed
	ld e, a ; 37ef
	call Function37f5 ; 37f0
	pop de ; 37f3
	ret ; 37f4
; 37f5

Function37f5::
	ld hl, $d946 ; 37f5
	ld a, [hli] ; 37f8
	ld h, [hl] ; 37f9
	ld l, a ; 37fa
	ld a, [$d945] ; 37fb
	and a ; 37fe
	jr z, Function3818 ; 37ff
	push af ; 3801
	ld a, [hl] ; 3802
	cp e ; 3803
	jr nz, Function380d ; 3804
	inc hl ; 3806
	ld a, [hld] ; 3807
	cp d ; 3808
	jr nz, Function380d ; 3809
	jr Function381a ; 380b
; 380d

Function380d::
	ld a, $5 ; 380d
	add l ; 380f
	ld l, a ; 3810
	jr nc, Function3814 ; 3811
	inc h ; 3813
	pop af ; 3814
	dec a ; 3815
	jr nz, Function3801 ; 3816
	and a ; 3818
	ret ; 3819
; 381a

Function381a::
	pop af ; 381a
	ld d, a ; 381b
	ld a, [$d945] ; 381c
	sub d ; 381f
	inc a ; 3820
	scf ; 3821
	ret ; 3822
; 3823

Function3823::
	ld hl, $1 ; 3823
	add hl, bc ; 3826
	ld a, [hli] ; 3827
	ld h, [hl] ; 3828
	ld l, a ; 3829
	ld a, [hli] ; 382a
	cp $ff ; 382b
	jr z, Function3840 ; 382d
	cp d ; 382f
	jr nz, Function383b ; 3830
	ld a, [hli] ; 3832
	cp e ; 3833
	jr nz, Function383c ; 3834
	ld a, [hli] ; 3836
	ld h, [hl] ; 3837
	ld l, a ; 3838
	jr Function3842 ; 3839
; 383b

Function383b::
	inc hl ; 383b
	inc hl ; 383c
	inc hl ; 383d
	jr Function382a ; 383e
; 3840

Function3840::
	and a ; 3840
	ret ; 3841
; 3842

Function3842::
	scf ; 3842
	ret ; 3843
; 3844

Function3844::
	ldh a, [hROMBank] ; 3844
	push af ; 3846
	call Function2d2b ; 3847
	call Function3851 ; 384a
	pop bc ; 384d
	ld a, b ; 384e
	rst Bankswitch ; 384f
	ret ; 3850
; 3851

Function3851::
	ld a, $2 ; 3851
	ld de, $d465 ; 3853
	push af ; 3856
	push de ; 3857
	ld hl, $1 ; 3858
	add hl, de ; 385b
	ld a, [hl] ; 385c
	and a ; 385d
	jr z, Function389b ; 385e
	ld hl, $8 ; 3860
	add hl, de ; 3863
	ld a, [hl] ; 3864
	and $f ; 3865
	cp $2 ; 3867
	jr nz, Function389b ; 3869
	ld hl, $0 ; 386b
	add hl, de ; 386e
	ld a, [hl] ; 386f
	cp $ff ; 3870
	jr z, Function389b ; 3872
	call Function1982 ; 3874
	call Function38e9 ; 3877
	jr nc, Function389b ; 387a
	ld hl, $9 ; 387c
	add hl, de ; 387f
	ld a, [hl] ; 3880
	cp b ; 3881
	jr c, Function389b ; 3882
	push bc ; 3884
	push de ; 3885
	ld hl, $a ; 3886
	add hl, de ; 3889
	ld a, [hli] ; 388a
	ld h, [hl] ; 388b
	ld l, a ; 388c
	ld e, [hl] ; 388d
	inc hl ; 388e
	ld d, [hl] ; 388f
	ld b, $2 ; 3890
	call Function2f2f ; 3892
	ld a, c ; 3895
	pop de ; 3896
	pop bc ; 3897
	and a ; 3898
	jr z, Function38aa ; 3899
	pop de ; 389b
	ld hl, $10 ; 389c
	add hl, de ; 389f
	ld d, h ; 38a0
	ld e, l ; 38a1
	pop af ; 38a2
	inc a ; 38a3
	cp $10 ; 38a4
	jr nz, Function3856 ; 38a6
	xor a ; 38a8
	ret ; 38a9
; 38aa

Function38aa::
	pop de ; 38aa
	pop af ; 38ab
	ldh [$ffe2], a ; 38ac
	ld a, b ; 38ae
	ld [$cf2a], a ; 38af
	ld a, c ; 38b2
	ld [$cf2b], a ; 38b3
	jr Function38c2 ; 38b6
; 38b8

Function38b8::
	ld a, $1 ; 38b8
	ld [$cf2a], a ; 38ba
	ld a, $ff ; 38bd
	ld [$cf2b], a ; 38bf
	call Function2d30 ; 38c2
	ld [$cf29], a ; 38c5
	ldh a, [$ffe2] ; 38c8
	call Function176f ; 38ca
	ld hl, $a ; 38cd
	add hl, bc ; 38d0
	ld a, [$cf29] ; 38d1
	call Function313c ; 38d4
	ld de, $cf2c ; 38d7
	ld bc, $d ; 38da
	ld a, [$cf29] ; 38dd
	call Functiondcd ; 38e0
	xor a ; 38e3
	ld [$cf38], a ; 38e4
	scf ; 38e7
	ret ; 38e8
; 38e9

Function38e9::
	push de ; 38e9
	call Function38f1 ; 38ea
	ld b, d ; 38ed
	ld c, e ; 38ee
	pop de ; 38ef
	ret ; 38f0
; 38f1

Function38f1::
	ld hl, $10 ; 38f1
	add hl, bc ; 38f4
	ld d, [hl] ; 38f5
	ld hl, $11 ; 38f6
	add hl, bc ; 38f9
	ld e, [hl] ; 38fa
	ld a, [$d20d] ; 38fb
	cp d ; 38fe
	jr z, Function3909 ; 38ff
	ld a, [$d20e] ; 3901
	cp e ; 3904
	jr z, Function391d ; 3905
	and a ; 3907
	ret ; 3908
; 3909

Function3909::
	ld a, [$d20e] ; 3909
	sub e ; 390c
	jr z, Function3937 ; 390d
	jr nc, Function3918 ; 390f
	cpl ; 3911
	inc a ; 3912
	ld d, a ; 3913
	ld e, $4 ; 3914
	jr Function392f ; 3916
; 3918

Function3918::
	ld d, a ; 3918
	ld e, $0 ; 3919
	jr Function392f ; 391b
; 391d

Function391d::
	ld a, [$d20d] ; 391d
	sub d ; 3920
	jr z, Function3937 ; 3921
	jr nc, Function392c ; 3923
	cpl ; 3925
	inc a ; 3926
	ld d, a ; 3927
	ld e, $8 ; 3928
	jr Function392f ; 392a
; 392c

Function392c::
	ld d, a ; 392c
	ld e, $c ; 392d
	call Function19a4 ; 392f
	cp e ; 3932
	jr nz, Function3937 ; 3933
	scf ; 3935
	ret ; 3936
; 3937

Function3937::
	and a ; 3937
	ret ; 3938
; 3939

Function3939::
	push bc ; 3939
	ld hl, $1 ; 393a
	add hl, bc ; 393d
	ld a, [hl] ; 393e
	call Function176f ; 393f
	ld hl, $a ; 3942
	add hl, bc ; 3945
	ld a, [hli] ; 3946
	ld h, [hl] ; 3947
	ld l, a ; 3948
	call Function2d30 ; 3949
	call Function313c ; 394c
	ld d, h ; 394f
	ld e, l ; 3950
	push de ; 3951
	ld b, $2 ; 3952
	call Function2f2f ; 3954
	pop de ; 3957
	ld a, c ; 3958
	and a ; 3959
	pop bc ; 395a
	ret ; 395b
; 395c

Function395c::
	ld a, [$d119] ; 395c
	cp $1 ; 395f
	jr Function3968 ; 3961
; 3963

Function3963::
	ld hl, $cf32 ; 3963
	jr Function3974 ; 3966
; 3968

Function3968::
	ld a, [$cfe9] ; 3968
	ld hl, $cf32 ; 396b
	and a ; 396e
	jr z, Function3974 ; 396f
	ld hl, $cf34 ; 3971
	ld a, [hli] ; 3974
	ld h, [hl] ; 3975
	ld l, a ; 3976
	call Function2d30 ; 3977
	call Function3404 ; 397a
	call WaitBGMap ; 397d
	call Functiona31 ; 3980
	ret ; 3983
; 3984

Function3984::
	push hl ; 3984
	push de ; 3985
	push bc ; 3986
	ld a, $60 ; 3987
	ld [hli], a ; 3989
	ld a, $61 ; 398a
	ld [hli], a ; 398c
	push hl ; 398d
	ld a, $62 ; 398e
	ld [hli], a ; 3990
	dec d ; 3991
	jr nz, Function3990 ; 3992
	ld a, $6b ; 3994
	add b ; 3996
	ld [hl], a ; 3997
	pop hl ; 3998
	ld a, e ; 3999
	and a ; 399a
	jr nz, Function39a3 ; 399b
	ld a, c ; 399d
	and a ; 399e
	jr z, Function39b6 ; 399f
	ld e, $1 ; 39a1
	ld a, e ; 39a3
	sub a, $8 ; 39a4
	jr c, Function39b2 ; 39a6
	ld e, a ; 39a8
	ld a, $6a ; 39a9
	ld [hli], a ; 39ab
	ld a, e ; 39ac
	and a ; 39ad
	jr z, Function39b6 ; 39ae
	jr Function39a3 ; 39b0
; 39b2

Function39b2::
	ld a, $62 ; 39b2
	add e ; 39b4
	ld [hl], a ; 39b5
	pop bc ; 39b6
	pop de ; 39b7
	pop hl ; 39b8
	ret ; 39b9
; 39ba

Function39ba::
	ld a, $1 ; 39ba
	ld [$cf3b], a ; 39bc
	ld a, [$d004] ; 39bf
	and a ; 39c2
	jr z, Function39e7 ; 39c3
	cp $fd ; 39c5
	jr z, Function39cd ; 39c7
	cp $fc ; 39c9
	jr nc, Function39e7 ; 39cb
	push hl ; 39cd
	ld de, $9000 ; 39ce
	ld a, $3c ; 39d1
	call Function2e49 ; 39d3
	pop hl ; 39d6
	xor a ; 39d7
	ldh [$ffaf], a ; 39d8
	ld bc, $707 ; 39da
	ld a, $13 ; 39dd
	call Function2e49 ; 39df
	xor a ; 39e2
	ld [$cf3b], a ; 39e3
	ret ; 39e6
; 39e7

Function39e7::
	xor a ; 39e7
	ld [$cf3b], a ; 39e8
	inc a ; 39eb
	ld [$d004], a ; 39ec
	ret ; 39ef
; 39f0

Function39f0::
	push af ; 39f0
	ld a, $1 ; 39f1
	ld [$c1bc], a ; 39f3
	pop af ; 39f6
	jr Function3a02 ; 39f7
; 39f9

Function39f9::
	push af ; 39f9
	xor a ; 39fa
	ld [$c1bc], a ; 39fb
	ld [$c1bd], a ; 39fe
	pop af ; 3a01
	push hl ; 3a02
	push de ; 3a03
	push bc ; 3a04
	call Function3a41 ; 3a05
	jr c, Function3a12 ; 3a08
	ld e, c ; 3a0a
	ld d, b ; 3a0b
	call Function3de4 ; 3a0c
	call Function3e56 ; 3a0f
	pop bc ; 3a12
	pop de ; 3a13
	pop hl ; 3a14
	ret ; 3a15
; 3a16

Function3a16::
	call Function3a41 ; 3a16
	ret c ; 3a19
	ldh a, [hROMBank] ; 3a1a
	push af ; 3a1c
	ld a, $3c ; 3a1d
	rst Bankswitch ; 3a1f
	ld hl, $6747 ; 3a20
	add hl, bc ; 3a23
	add hl, bc ; 3a24
	add hl, bc ; 3a25
	add hl, bc ; 3a26
	add hl, bc ; 3a27
	add hl, bc ; 3a28
	ld e, [hl] ; 3a29
	inc hl ; 3a2a
	ld d, [hl] ; 3a2b
	inc hl ; 3a2c
	ld a, [hli] ; 3a2d
	ld [$c1b0], a ; 3a2e
	ld a, [hli] ; 3a31
	ld [$c1b1], a ; 3a32
	ld a, [hli] ; 3a35
	ld [$c1b2], a ; 3a36
	ld a, [hl] ; 3a39
	ld [$c1b3], a ; 3a3a
	pop af ; 3a3d
	rst Bankswitch ; 3a3e
	and a ; 3a3f
	ret ; 3a40
; 3a41

Function3a41::
	and a ; 3a41
	jr z, Function3a4e ; 3a42
	cp $fc ; 3a44
	jr nc, Function3a4e ; 3a46
	dec a ; 3a48
	ld c, a ; 3a49
	ld b, $0 ; 3a4a
	and a ; 3a4c
	ret ; 3a4d
; 3a4e

Function3a4e::
	scf ; 3a4e
	ret ; 3a4f
; 3a50

Function3a50::
	ld a, [$d02a] ; 3a50
	ld [hl], $6e ; 3a53
	inc hl ; 3a55
	ld c, $2 ; 3a56
	cp $64 ; 3a58
	jr c, Function3a65 ; 3a5a
	dec hl ; 3a5c
	inc c ; 3a5d
	jr Function3a65 ; 3a5e
; 3a60

Function3a60::
	ld [hl], $6e ; 3a60
	inc hl ; 3a62
	ld c, $3 ; 3a63
	ld [$d151], a ; 3a65
	ld de, $d151 ; 3a68
	ld b, $41 ; 3a6b
	jp Function323d ; 3a6d
; 3a70

Function3a70::
	ld hl, $d149 ; 3a70
	ld c, a ; 3a73
	ld b, $0 ; 3a74
	add hl, bc ; 3a76
	ld a, [hl] ; 3a77
	ret ; 3a78
; 3a79

Function3a79::
	push bc ; 3a79
	push de ; 3a7a
	push hl ; 3a7b
	ldh a, [hROMBank] ; 3a7c
	push af ; 3a7e
	ld a, $14 ; 3a7f
	rst Bankswitch ; 3a81
	ld a, [$ce60] ; 3a82
	cp $fd ; 3a85
	jr z, Function3a9e ; 3a87
	dec a ; 3a89
	ld bc, $20 ; 3a8a
	ld hl, $5b0b ; 3a8d
	call Function31a3 ; 3a90
	ld de, $d120 ; 3a93
	ld bc, $20 ; 3a96
	call Function311a ; 3a99
	jr Function3ab3 ; 3a9c
; 3a9e

Function3a9e::
	ld de, $7a83 ; 3a9e
	ld b, $55 ; 3aa1
	ld hl, $d131 ; 3aa3
	ld [hl], b ; 3aa6
	ld hl, $d132 ; 3aa7
	ld [hl], e ; 3aaa
	inc hl ; 3aab
	ld [hl], d ; 3aac
	inc hl ; 3aad
	ld [hl], e ; 3aae
	inc hl ; 3aaf
	ld [hl], d ; 3ab0
	jr Function3ab3 ; 3ab1
; 3ab3

Function3ab3::
	ld a, [$ce60] ; 3ab3
	ld [$d120], a ; 3ab6
	pop af ; 3ab9
	rst Bankswitch ; 3aba
	pop hl ; 3abb
	pop de ; 3abc
	pop bc ; 3abd
	ret ; 3abe
; 3abf

Function3abf::
	ld a, [$d005] ; 3abf
	ld hl, $db8c ; 3ac2
	push hl ; 3ac5
	push bc ; 3ac6
	call Function3199 ; 3ac7
	ld de, $cf6b ; 3aca
	push de ; 3acd
	ld bc, $b ; 3ace
	call Function311a ; 3ad1
	pop de ; 3ad4
	ld hl, $677e ; 3ad5
	ld a, $1 ; 3ad8
	rst FarCall ; 3ada
	pop bc ; 3adb
	pop hl ; 3adc
	ret ; 3add
; 3ade

Function3ade::
	ld b, c ; 3ade
	res 7, c ; 3adf
	res 6, c ; 3ae1
	res 5, c ; 3ae3
	bit 5, b ; 3ae5
	jr z, Function3af0 ; 3ae7
	bit 7, b ; 3ae9
	jr nz, Function3af0 ; 3aeb
	ld [hl], $f0 ; 3aed
	inc hl ; 3aef
	ld a, [de] ; 3af0
	swap a ; 3af1
	call Function3b15 ; 3af3
	ld a, [de] ; 3af6
	call Function3b15 ; 3af7
	inc de ; 3afa
	dec c ; 3afb
	jr nz, Function3af0 ; 3afc
	bit 7, b ; 3afe
	jr z, Function3b14 ; 3b00
	bit 6, b ; 3b02
	jr nz, Function3b07 ; 3b04
	dec hl ; 3b06
	bit 5, b ; 3b07
	jr z, Function3b0e ; 3b09
	ld [hl], $f0 ; 3b0b
	inc hl ; 3b0d
	ld [hl], $f6 ; 3b0e
	call Function31e2 ; 3b10
	inc hl ; 3b13
	ret ; 3b14
; 3b15

Function3b15::
	and $f ; 3b15
	and a ; 3b17
	jr z, Function3b2f ; 3b18
	bit 7, b ; 3b1a
	jr z, Function3b29 ; 3b1c
	bit 5, b ; 3b1e
	jr z, Function3b27 ; 3b20
	ld [hl], $f0 ; 3b22
	inc hl ; 3b24
	res 5, b ; 3b25
	res 7, b ; 3b27
	add a, $f6 ; 3b29
	ld [hli], a ; 3b2b
	jp Function31e2 ; 3b2c
; 3b2f

Function3b2f::
	bit 7, b ; 3b2f
	jr z, Function3b29 ; 3b31
	bit 6, b ; 3b33
	ret nz ; 3b35
	ld a, $7f ; 3b36
	ld [hli], a ; 3b38
	ret ; 3b39
; 3b3a

Function3b3a::
	push bc ; 3b3a
	ld hl, $da2a ; 3b3b
	ld c, a ; 3b3e
	ld b, $0 ; 3b3f
	add hl, bc ; 3b41
	ld a, [$d005] ; 3b42
	call Function3b4a ; 3b45
	pop bc ; 3b48
	ret ; 3b49
; 3b4a

Function3b4a::
	ld bc, $30 ; 3b4a
	jp Function31a3 ; 3b4d
; 3b50

Function3b50::
	push hl ; 3b50
	ld a, b ; 3b51
	dec a ; 3b52
	ld b, $0 ; 3b53
	add hl, bc ; 3b55
	ld hl, $5b0b ; 3b56
	ld bc, $20 ; 3b59
	call Function31a3 ; 3b5c
	pop bc ; 3b5f
	ld a, $14 ; 3b60
	call Function313c ; 3b62
	ld b, l ; 3b65
	ld c, h ; 3b66
	pop hl ; 3b67
	ret ; 3b68
; 3b69

Function3b69::
	push af ; 3b69
	ldh a, [$ffe6] ; 3b6a
	and a ; 3b6c
	jr nz, Function3b72 ; 3b6d
	pop af ; 3b6f
	jr Function3b81 ; 3b70
; 3b72

Function3b72::
	pop af ; 3b72
	jr Function3b91 ; 3b73
; 3b75

Function3b75::
	push af ; 3b75
	ldh a, [$ffe6] ; 3b76
	and a ; 3b78
	jr z, Function3b7e ; 3b79
	pop af ; 3b7b
	jr Function3b81 ; 3b7c
; 3b7e

Function3b7e::
	pop af ; 3b7e
	jr Function3b91 ; 3b7f
; 3b81

Function3b81::
	push bc ; 3b81
	ld c, a ; 3b82
	ld b, $0 ; 3b83
	ld hl, $da2a ; 3b85
	add hl, bc ; 3b88
	ld a, [$cfc6] ; 3b89
	call Function3b4a ; 3b8c
	pop bc ; 3b8f
	ret ; 3b90
; 3b91

Function3b91::
	push bc ; 3b91
	ld c, a ; 3b92
	ld b, $0 ; 3b93
	ld hl, $dd5d ; 3b95
	add hl, bc ; 3b98
	ld a, [$cb41] ; 3b99
	call Function3b4a ; 3b9c
	pop bc ; 3b9f
	ret ; 3ba0
; 3ba1

Function3ba1::
	xor a ; 3ba1
	ld [$d141], a ; 3ba2
	ld [$d142], a ; 3ba5
	ret ; 3ba8
; 3ba9

Function3ba9::
	xor a ; 3ba9
	ldh [$ffe6], a ; 3baa
	ret ; 3bac
; 3bad

Function3bad::
	ld a, $1 ; 3bad
	ldh [$ffe6], a ; 3baf
	ret ; 3bb1
; 3bb2

Function3bb2::
	ldh a, [$ffe6] ; 3bb2
	and a ; 3bb4
	jr z, Function3bd4 ; 3bb5
	jr Function3bc0 ; 3bb7
; 3bb9

Function3bb9::
	ldh a, [$ffe6] ; 3bb9
	and a ; 3bbb
	jr z, Function3bc0 ; 3bbc
	jr Function3bd4 ; 3bbe
; 3bc0

Function3bc0::
	ld a, [$cfc6] ; 3bc0
	ld hl, $da49 ; 3bc3
	call Function3b4a ; 3bc6
	ld d, h ; 3bc9
	ld e, l ; 3bca
	ld hl, $cb19 ; 3bcb
	ld bc, $5 ; 3bce
	jp Function311a ; 3bd1
; 3bd4

Function3bd4::
	ld a, [$d116] ; 3bd4
	dec a ; 3bd7
	ret z ; 3bd8
	ld a, [$cb41] ; 3bd9
	ld hl, $dd7c ; 3bdc
	call Function3b4a ; 3bdf
	ld d, h ; 3be2
	ld e, l ; 3be3
	ld hl, $d0fc ; 3be4
	ld bc, $5 ; 3be7
	jp Function311a ; 3bea
; 3bed

Function3bed::
	call Function3bf8 ; 3bed
	ld c, $3 ; 3bf0
	call Function33c ; 3bf2
	jp WaitBGMap ; 3bf5
; 3bf8

Function3bf8::
	ld a, $f ; 3bf8
	ld hl, $5da9 ; 3bfa
	rst FarCall ; 3bfd
	ld a, $f ; 3bfe
	ld hl, $5e97 ; 3c00
	rst FarCall ; 3c03
	ret ; 3c04
; 3c05

GetBattleVar:: ; 3c05
	push hl ; 3c05
	call GetBattleVarAddr ; 3c06
	pop hl ; 3c09
	ret ; 3c0a
; 3c0b

GetBattleVarAddr:: ; 3c0b
; Get variable from pair a, depending on whose turn it is.
; There are 21 variable pairs.

	push bc

	ld hl, .battlevarpairs
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr

	ld a, [hli]
	ld h, [hl]
	ld l, a

; Enemy turn uses the second byte instead.
; This lets battle variable calls be side-neutral.
	ld a, [hBattleTurn]
	and a
	jr z, .getvar
	inc hl
	
.getvar
; var id
	ld a, [hl]
	ld c, a
	ld b, 0

	ld hl, .vars
rept 2
	add hl, bc
endr

	ld a, [hli]
	ld h, [hl]
	ld l, a
	
	ld a, [hl]
	
	pop bc
	ret

.battlevarpairs
	dw .substatus1, .substatus2, .substatus3, .substatus4, .substatus5
	dw .substatus1opp, .substatus2opp, .substatus3opp, .substatus4opp, .substatus5opp
	dw .status, .statusopp, .animation, .effect, .power, .type
	dw .curmove, .lastcounter, .lastcounteropp, .lastmove, .lastmoveopp

;                       player                     enemy
.substatus1     db PLAYER_SUBSTATUS_1,    ENEMY_SUBSTATUS_1
.substatus1opp  db ENEMY_SUBSTATUS_1,     PLAYER_SUBSTATUS_1
.substatus2     db PLAYER_SUBSTATUS_2,    ENEMY_SUBSTATUS_2
.substatus2opp  db ENEMY_SUBSTATUS_2,     PLAYER_SUBSTATUS_2
.substatus3     db PLAYER_SUBSTATUS_3,    ENEMY_SUBSTATUS_3
.substatus3opp  db ENEMY_SUBSTATUS_3,     PLAYER_SUBSTATUS_3
.substatus4     db PLAYER_SUBSTATUS_4,    ENEMY_SUBSTATUS_4
.substatus4opp  db ENEMY_SUBSTATUS_4,     PLAYER_SUBSTATUS_4
.substatus5     db PLAYER_SUBSTATUS_5,    ENEMY_SUBSTATUS_5
.substatus5opp  db ENEMY_SUBSTATUS_5,     PLAYER_SUBSTATUS_5
.status         db PLAYER_STATUS,         ENEMY_STATUS
.statusopp      db ENEMY_STATUS,          PLAYER_STATUS
.animation      db PLAYER_MOVE_ANIMATION, ENEMY_MOVE_ANIMATION
.effect         db PLAYER_MOVE_EFFECT,    ENEMY_MOVE_EFFECT
.power          db PLAYER_MOVE_POWER,     ENEMY_MOVE_POWER
.type           db PLAYER_MOVE_TYPE,      ENEMY_MOVE_TYPE
.curmove        db PLAYER_CUR_MOVE,       ENEMY_CUR_MOVE
.lastcounter    db PLAYER_COUNTER_MOVE,   ENEMY_COUNTER_MOVE
.lastcounteropp db ENEMY_COUNTER_MOVE,    PLAYER_COUNTER_MOVE
.lastmove       db PLAYER_LAST_MOVE,      ENEMY_LAST_MOVE
.lastmoveopp    db ENEMY_LAST_MOVE,       PLAYER_LAST_MOVE

.vars
	dw PlayerSubStatus1,             EnemySubStatus1
	dw PlayerSubStatus2,             EnemySubStatus2
	dw PlayerSubStatus3,             EnemySubStatus3
	dw PlayerSubStatus4,             EnemySubStatus4
	dw PlayerSubStatus5,             EnemySubStatus5
	dw BattleMonStatus,              EnemyMonStatus
	dw wPlayerMoveStructAnimation,   wEnemyMoveStructAnimation
	dw wPlayerMoveStructEffect,      wEnemyMoveStructEffect
	dw wPlayerMoveStructPower,       wEnemyMoveStructPower
	dw wPlayerMoveStructType,        wEnemyMoveStructType
	dw CurPlayerMove,                CurEnemyMove
	dw LastEnemyCounterMove,         LastPlayerCounterMove
	dw LastPlayerMove,               LastEnemyMove
; 3cb4
	db $23 ; XXX

FarCopyRadioText:: ; 3cb5
	inc hl
	ld a, [$ff9d]
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [$ff9d], a
	ld [MBC3RomBank], a
	ld a, e
	ld l, a
	ld a, d
	ld h, a
	ld de, wRadioText
	ld bc, 2 * SCREEN_WIDTH
	call CopyBytes
	pop af
	ld [$ff9d], a
	ld [MBC3RomBank], a
	ret
; 3cd6

Function3cd6::
	ldh a, [hROMBank] ; 3cd6
	push af ; 3cd8
	ld a, $40 ; 3cd9
	rst Bankswitch ; 3cdb
	call Functionf5e ; 3cdc
	pop af ; 3cdf
	rst Bankswitch ; 3ce0
	ret ; 3ce1
; 3ce2

Function3ce2::
	ld a, $32 ; 3ce2
	rst Bankswitch ; 3ce4
	ld a, [hli] ; 3ce5
	ld [$ca10], a ; 3ce6
	ld a, [hl] ; 3ce9
	ld [$ca11], a ; 3cea
	ld a, $33 ; 3ced
	rst Bankswitch ; 3cef
	ret ; 3cf0
; 3cf1

Function3cf1::
	push hl ; 3cf1
	push de ; 3cf2
	ld hl, $ca10 ; 3cf3
	ld e, [hl] ; 3cf6
	inc hl ; 3cf7
	ld d, [hl] ; 3cf8
	ld a, $32 ; 3cf9
	rst Bankswitch ; 3cfb
	ld a, [de] ; 3cfc
	ld [$ca17], a ; 3cfd
	inc de ; 3d00
	ld a, $33 ; 3d01
	rst Bankswitch ; 3d03
	ld [hl], d ; 3d04
	dec hl ; 3d05
	ld [hl], e ; 3d06
	pop de ; 3d07
	pop hl ; 3d08
	ld a, [$ca17] ; 3d09
	ret ; 3d0c
; 3d0d

Function3d0d::
	ldh a, [$ffc8] ; 3d0d
	and a ; 3d0f
	ret z ; 3d10
	ld a, $0 ; 3d11
	ld [$ce68], a ; 3d13
	ld a, $c8 ; 3d16
	ld [$ce69], a ; 3d18
	ld a, $0 ; 3d1b
	ld [$ce6a], a ; 3d1d
	ld a, $c7 ; 3d20
	ld [$ce6b], a ; 3d22
	ld a, $9 ; 3d25
	ld [$ce67], a ; 3d27
	ret ; 3d2a
; 3d2b

Function3d2b::
	ld [$c5c0], a ; 3d2b
	ldh a, [hROMBank] ; 3d2e
	push af ; 3d30
	ld a, $23 ; 3d31
	rst Bankswitch ; 3d33
	ld a, [$c5c0] ; 3d34
	call Function51f7 ; 3d37
	pop af ; 3d3a
	rst Bankswitch ; 3d3b
	ret ; 3d3c
; 3d3d

Function3d3d::
	ld [$c5c0], a ; 3d3d
	ldh a, [hROMBank] ; 3d40
	push af ; 3d42
	ld a, $23 ; 3d43
	rst Bankswitch ; 3d45
	ld a, [$c5c0] ; 3d46
	call Function5332 ; 3d49
	pop af ; 3d4c
	rst Bankswitch ; 3d4d
	ret ; 3d4e
; 3d4f

Function3d4f::
	push hl ; 3d4f
	push de ; 3d50
	push bc ; 3d51
	push af ; 3d52
	ldh a, [hROMBank] ; 3d53
	push af ; 3d55
	ld a, $3a ; 3d56
	ldh [hROMBank], a ; 3d58
	ld MBC3RomBank, a ; 3d5a
	call Function4000 ; 3d5d
	pop af ; 3d60
	ldh [hROMBank], a ; 3d61
	ld MBC3RomBank, a ; 3d63
	pop af ; 3d66
	pop bc ; 3d67
	pop de ; 3d68
	pop hl ; 3d69
	ret ; 3d6a
; 3d6b

Function3d6b::
	push hl ; 3d6b
	push de ; 3d6c
	push bc ; 3d6d
	push af ; 3d6e
	ldh a, [hROMBank] ; 3d6f
	push af ; 3d71
	ld a, $3a ; 3d72
	ldh [hROMBank], a ; 3d74
	ld MBC3RomBank, a ; 3d76
	call Function405c ; 3d79
	pop af ; 3d7c
	ldh [hROMBank], a ; 3d7d
	ld MBC3RomBank, a ; 3d7f
	pop af ; 3d82
	pop bc ; 3d83
	pop de ; 3d84
	pop hl ; 3d85
	ret ; 3d86
; 3d87

Function3d87::
	ldh [hROMBank], a ; 3d87
	ld MBC3RomBank, a ; 3d89
	ld a, [de] ; 3d8c
	ld [$c198], a ; 3d8d
	ld a, $3a ; 3d90
	ldh [hROMBank], a ; 3d92
	ld MBC3RomBank, a ; 3d94
	ret ; 3d97
; 3d98

Function3d98::
	push hl ; 3d98
	push de ; 3d99
	push bc ; 3d9a
	push af ; 3d9b
	ldh a, [hROMBank] ; 3d9c
	push af ; 3d9e
	ld a, $3a ; 3d9f
	ldh [hROMBank], a ; 3da1
	ld MBC3RomBank, a ; 3da3
	ld a, e ; 3da6
	and a ; 3da7
	jr z, Function3daf ; 3da8
	call Function4b30 ; 3daa
	jr Function3db2 ; 3dad
; 3daf

Function3daf::
	call Function4000 ; 3daf
	pop af ; 3db2
	ldh [hROMBank], a ; 3db3
	ld MBC3RomBank, a ; 3db5
	pop af ; 3db8
	pop bc ; 3db9
	pop de ; 3dba
	pop hl ; 3dbb
	ret ; 3dbc
; 3dbd

Function3dbd::
	push hl ; 3dbd
	push de ; 3dbe
	push bc ; 3dbf
	push af ; 3dc0
	ldh a, [hROMBank] ; 3dc1
	push af ; 3dc3
	ld a, $3a ; 3dc4
	ldh [hROMBank], a ; 3dc6
	ld MBC3RomBank, a ; 3dc8
	push de ; 3dcb
	ld de, $0 ; 3dcc
	call Function4b30 ; 3dcf
	call Function32e ; 3dd2
	pop de ; 3dd5
	call Function4b30 ; 3dd6
	pop af ; 3dd9
	ldh [hROMBank], a ; 3dda
	ld MBC3RomBank, a ; 3ddc
	pop af ; 3ddf
	pop bc ; 3de0
	pop de ; 3de1
	pop hl ; 3de2
	ret ; 3de3
; 3de4

Function3de4::
	push hl ; 3de4
	push de ; 3de5
	push bc ; 3de6
	push af ; 3de7
	ldh a, [hROMBank] ; 3de8
	push af ; 3dea
	ld a, $3c ; 3deb
	ldh [hROMBank], a ; 3ded
	ld MBC3RomBank, a ; 3def
	ld hl, $6747 ; 3df2
	add hl, de ; 3df5
	add hl, de ; 3df6
	add hl, de ; 3df7
	add hl, de ; 3df8
	add hl, de ; 3df9
	add hl, de ; 3dfa
	ld e, [hl] ; 3dfb
	inc hl ; 3dfc
	ld d, [hl] ; 3dfd
	inc hl ; 3dfe
	ld a, [hli] ; 3dff
	ld [$c1b0], a ; 3e00
	ld a, [hli] ; 3e03
	ld [$c1b1], a ; 3e04
	ld a, [hli] ; 3e07
	ld [$c1b2], a ; 3e08
	ld a, [hl] ; 3e0b
	ld [$c1b3], a ; 3e0c
	ld a, $3a ; 3e0f
	ldh [hROMBank], a ; 3e11
	ld MBC3RomBank, a ; 3e13
	call Function4b79 ; 3e16
	pop af ; 3e19
	ldh [hROMBank], a ; 3e1a
	ld MBC3RomBank, a ; 3e1c
	pop af ; 3e1f
	pop bc ; 3e20
	pop de ; 3e21
	pop hl ; 3e22
	ret ; 3e23
; 3e24

Function3e24::
	push hl ; 3e24
	push de ; 3e25
	push bc ; 3e26
	push af ; 3e27
	call Function3fbc ; 3e28
	jr nc, Function3e33 ; 3e2b
	ld a, [$c1bf] ; 3e2d
	cp e ; 3e30
	jr c, Function3e4a ; 3e31
	ldh a, [hROMBank] ; 3e33
	push af ; 3e35
	ld a, $3a ; 3e36
	ldh [hROMBank], a ; 3e38
	ld MBC3RomBank, a ; 3e3a
	ld a, e ; 3e3d
	ld [$c1bf], a ; 3e3e
	call Function4c04 ; 3e41
	pop af ; 3e44
	ldh [hROMBank], a ; 3e45
	ld MBC3RomBank, a ; 3e47
	pop af ; 3e4a
	pop bc ; 3e4b
	pop de ; 3e4c
	pop hl ; 3e4d
	ret ; 3e4e
; 3e4f

Function3e4f::
	call Function3e56 ; 3e4f
	call Function3e24 ; 3e52
	ret ; 3e55
; 3e56

Function3e56::
	push hl ; 3e56
	ld hl, $c0cc ; 3e57
	bit 0, [hl] ; 3e5a
	jr nz, Function3e57 ; 3e5c
	ld hl, $c0fe ; 3e5e
	bit 0, [hl] ; 3e61
	jr nz, Function3e57 ; 3e63
	ld hl, $c130 ; 3e65
	bit 0, [hl] ; 3e68
	jr nz, Function3e57 ; 3e6a
	ld hl, $c162 ; 3e6c
	bit 0, [hl] ; 3e6f
	jr nz, Function3e57 ; 3e71
	pop hl ; 3e73
	ret ; 3e74
; 3e75

Function3e75::
	ld a, $77 ; 3e75
	ld [$c19a], a ; 3e77
	ret ; 3e7a
; 3e7b

Function3e7b::
	ld a, $33 ; 3e7b
	ld [$c19a], a ; 3e7d
	ret ; 3e80
; 3e81

Function3e81::
	xor a ; 3e81
	ld [$c19a], a ; 3e82
	ret ; 3e85
; 3e86

Function3e86::
	ld a, $4 ; 3e86
	ld [$c1a7], a ; 3e88
	ret ; 3e8b
; 3e8c

Function3e8c::
	ld a, $84 ; 3e8c
	ld [$c1a7], a ; 3e8e
	ret ; 3e91
; 3e92

Function3e92::
	and a ; 3e92
	ret z ; 3e93
	dec a ; 3e94
	call Function3d6b ; 3e95
	jr Function3e92 ; 3e98
; 3e9a

Function3e9a::
	push hl ; 3e9a
	push de ; 3e9b
	push bc ; 3e9c
	push af ; 3e9d
	call Function3f75 ; 3e9e
	ld a, [$c1c0] ; 3ea1
	cp e ; 3ea4
	jr z, Function3eb8 ; 3ea5
	ld a, $8 ; 3ea7
	ld [$c1a7], a ; 3ea9
	ld a, e ; 3eac
	ld [$c1a9], a ; 3ead
	ld a, d ; 3eb0
	ld [$c1aa], a ; 3eb1
	ld a, e ; 3eb4
	ld [$c1c0], a ; 3eb5
	pop af ; 3eb8
	pop bc ; 3eb9
	pop de ; 3eba
	pop hl ; 3ebb
	ret ; 3ebc
; 3ebd

Function3ebd::
	push hl ; 3ebd
	push de ; 3ebe
	push bc ; 3ebf
	push af ; 3ec0
	call Function3f75 ; 3ec1
	ld a, [$c1c0] ; 3ec4
	cp e ; 3ec7
	jr z, Function3edc ; 3ec8
	push de ; 3eca
	ld de, $0 ; 3ecb
	call Function3d98 ; 3ece
	call Function32e ; 3ed1
	pop de ; 3ed4
	ld a, e ; 3ed5
	ld [$c1c0], a ; 3ed6
	call Function3d98 ; 3ed9
	pop af ; 3edc
	pop bc ; 3edd
	pop de ; 3ede
	pop hl ; 3edf
	ret ; 3ee0
; 3ee1

Function3ee1::
	push hl ; 3ee1
	push de ; 3ee2
	push bc ; 3ee3
	push af ; 3ee4
	xor a ; 3ee5
	ld [$c1c1], a ; 3ee6
	ld de, $13 ; 3ee9
	ld a, [$d682] ; 3eec
	cp $1 ; 3eef
	jr z, Function3ef6 ; 3ef1
	call Function3f75 ; 3ef3
	push de ; 3ef6
	ld de, $0 ; 3ef7
	call Function3d98 ; 3efa
	call Function32e ; 3efd
	pop de ; 3f00
	ld a, e ; 3f01
	ld [$c1c0], a ; 3f02
	call Function3d98 ; 3f05
	pop af ; 3f08
	pop bc ; 3f09
	pop de ; 3f0a
	pop hl ; 3f0b
	ret ; 3f0c
; 3f0d

Function3f0d::
	ld a, [$c1c1] ; 3f0d
	and a ; 3f10
	jr z, Function3f25 ; 3f11
	xor a ; 3f13
	ld [$c1c0], a ; 3f14
	ld de, $0 ; 3f17
	call Function3d98 ; 3f1a
	call Function32e ; 3f1d
	xor a ; 3f20
	ld [$c1c1], a ; 3f21
	ret ; 3f24
; 3f25

Function3f25::
	push hl ; 3f25
	push de ; 3f26
	push bc ; 3f27
	push af ; 3f28
	ld de, $0 ; 3f29
	call Function3d98 ; 3f2c
	call Function32e ; 3f2f
	ld a, [$c1c0] ; 3f32
	ld e, a ; 3f35
	ld d, $0 ; 3f36
	call Function3d98 ; 3f38
	pop af ; 3f3b
	pop bc ; 3f3c
	pop de ; 3f3d
	pop hl ; 3f3e
	ret ; 3f3f
; 3f40

Function3f40::
	ld a, [$d682] ; 3f40
	cp $4 ; 3f43
	jr z, Function3f59 ; 3f45
	cp $8 ; 3f47
	jr z, Function3f59 ; 3f49
	ld a, [$d572] ; 3f4b
	bit 2, a ; 3f4e
	jr nz, Function3f5e ; 3f50
	and a ; 3f52
	ret ; 3f53
; 3f54

Function3f54::
	ld de, $13 ; 3f54
	scf ; 3f57
	ret ; 3f58
; 3f59

Function3f59::
	ld de, $21 ; 3f59
	scf ; 3f5c
	ret ; 3f5d
; 3f5e

Function3f5e::
	ld a, [$da00] ; 3f5e
	cp $a ; 3f61
	jr nz, Function3f52 ; 3f63
	ld a, [$da01] ; 3f65
	cp $f ; 3f68
	jr z, Function3f70 ; 3f6a
	cp $11 ; 3f6c
	jr nz, Function3f52 ; 3f6e
	ld de, $58 ; 3f70
	scf ; 3f73
	ret ; 3f74
; 3f75

Function3f75::
	call Function3f40 ; 3f75
	ret c ; 3f78
	call Function2d96 ; 3f79
	ret ; 3f7c
; 3f7d

Function3f7d::
	ld a, $20 ; 3f7d
	ld [$c398], a ; 3f7f
	ld [$c39c], a ; 3f82
	ld a, $50 ; 3f85
	ld [$c399], a ; 3f87
	ld a, $58 ; 3f8a
	ld [$c39d], a ; 3f8c
	xor a ; 3f8f
	ld [$c39b], a ; 3f90
	ld [$c39f], a ; 3f93
	ld a, [$c196] ; 3f96
	cp $64 ; 3f99
	jr nc, Function3fb3 ; 3f9b
	add a, $1 ; 3f9d
	daa ; 3f9f
	ld b, a ; 3fa0
	swap a ; 3fa1
	and $f ; 3fa3
	add a, $f6 ; 3fa5
	ld [$c39a], a ; 3fa7
	ld a, b ; 3faa
	and $f ; 3fab
	add a, $f6 ; 3fad
	ld [$c39e], a ; 3faf
	ret ; 3fb2
; 3fb3

Function3fb3::
	ld a, $ff ; 3fb3
	ld [$c39a], a ; 3fb5
	ld [$c39e], a ; 3fb8
	ret ; 3fbb
; 3fbc

Function3fbc::
	ld a, [$c0cc] ; 3fbc
	bit 0, a ; 3fbf
	jr nz, Function3fda ; 3fc1
	ld a, [$c0fe] ; 3fc3
	bit 0, a ; 3fc6
	jr nz, Function3fda ; 3fc8
	ld a, [$c130] ; 3fca
	bit 0, a ; 3fcd
	jr nz, Function3fda ; 3fcf
	ld a, [$c162] ; 3fd1
	bit 0, a ; 3fd4
	jr nz, Function3fda ; 3fd6
	and a ; 3fd8
	ret ; 3fd9
; 3fda

Function3fda::
	scf ; 3fda
	ret ; 3fdb
; 3fdc

Function3fdc::
	xor a ; 3fdc
	ld [$c0cc], a ; 3fdd
	ld [$c19c], a ; 3fe0
	ldh [$ff10], a ; 3fe3
	ldh [$ff11], a ; 3fe5
	ldh [$ff12], a ; 3fe7
	ldh [$ff13], a ; 3fe9
	ldh [$ff14], a ; 3feb
	ret ; 3fed
