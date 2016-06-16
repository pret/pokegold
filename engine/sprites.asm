ClearSpriteAnims: ; 8d174
	ld hl, $c508 ; 23:5174
	ld bc, $c1 ; 23:5177
.loop
	ld [hl], $0 ; 23:517a
	inc hl ; 23:517c
	dec bc ; 23:517d
	ld a, c ; 23:517e
	or b ; 23:517f
	jr nz, .loop ; 23:5180
	ret ; 23:5182

PlaySpriteAnimationsAndDelayFrame: ; 8d182
	call PlaySpriteAnimations ; 23:5183
	call $32e ; DelayFrame ; 23:5186
	ret ; 23:5189

PlaySpriteAnimations: ; 8d189
	push hl ; 23:518a
	push de ; 23:518b
	push bc ; 23:518c
	push af ; 23:518d

	ld a, $0 ; 23:518e
	ld [$c5bd], a ; 23:5190
	call DoNextFrameForAllSprites ; 23:5193

	pop af ; 23:5196
	pop bc ; 23:5197
	pop de ; 23:5198
	pop hl ; 23:5199
	ret ; 23:519a

DoNextFrameForAllSprites: ; 8d19b
	ld hl, $c51c ; 23:519b
	ld e, $a ; 23:519e
.loop
	ld a, [hl] ; 23:51a0
	and a ; 23:51a1
	jr z, .skip_capacity_check ; 23:51a2
	ld c, l ; 23:51a4
	ld b, h ; 23:51a5
	push hl ; 23:51a6
	push de ; 23:51a7
	call DoAnimFrame ; 23:51a8
	call UpdateAnimFrame ; 23:51ab
	pop de ; 23:51ae
	pop hl ; 23:51af
	jr c, .cancel ; 23:51b0
.skip_capacity_check
	ld bc, $10 ; 23:51b2
	add hl, bc ; 23:51b5
	dec e ; 23:51b6
	jr nz, .loop ; 23:51b7
	ld a, [$c5bd] ; 23:51b9
	ld l, a ; 23:51bc
	ld h, $c3 ; 23:51bd
.loop2
	ld a, l ; 23:51bf
	cp $a0 ; 23:51c0
	jr nc, .cancel ; 23:51c2
	xor a ; 23:51c4
	ld [hli], a ; 23:51c5
	jr .loop2 ; 23:51c6

.cancel
	ret ; 23:51c8

DoNextFrameForFirst16Sprites: ; 8d1c9
	ld hl, $c51c ; 23:51c9
	ld e, $a ; 23:51cc
.loop
	ld a, [hl] ; 23:51ce
	and a ; 23:51cf
	jr z, .skip_capacity_check ; 23:51d0
	ld c, l ; 23:51d2
	ld b, h ; 23:51d3
	push hl ; 23:51d4
	push de ; 23:51d5
	call DoAnimFrame ; 23:51d6
	call UpdateAnimFrame ; 23:51d9
	pop de ; 23:51dc
	pop hl ; 23:51dd
	jr c, .cancel ; 23:51de
.skip_capacity_check
	ld bc, $10 ; 23:51e0
	add hl, bc ; 23:51e3
	dec e ; 23:51e4
	jr nz, .loop ; 23:51e5
	ld a, [$c5bd] ; 23:51e7
	ld l, a ; 23:51ea
	ld h, $c3 ; 23:51eb
.loop2
	ld a, l ; 23:51ed
	cp $40 ; 23:51ee
	jr nc, .cancel ; 23:51f0
	xor a ; 23:51f2
	ld [hli], a ; 23:51f3
	jr .loop2 ; 23:51f4

.cancel
	ret ; 23:51f6

InitSpriteAnimStruct_:: ; 8d1f7
	push de ; 23:51f7
	push af ; 23:51f8
	ld hl, $c51c ; 23:51f9
	ld e, $a ; 23:51fc
.loop
	ld a, [hl] ; 23:51fe
	and a ; 23:51ff
	jr z, .found ; 23:5200
	ld bc, $10 ; 23:5202
	add hl, bc ; 23:5205
	dec e ; 23:5206
	jr nz, .loop ; 23:5207
	pop af ; 23:5209
	pop de ; 23:520a
	scf ; 23:520b
	ret ; 23:520c

.found ; 8d20d
	ld c, l ; 23:520d
	ld b, h ; 23:520e
	ld hl, $c5bc ; 23:520f
	inc [hl] ; 23:5212
	ld a, [hl] ; 23:5213
	and a ; 23:5214
	jr nz, .initialized ; 23:5215
	inc [hl] ; 23:5217
.initialized
	pop af ; 23:5218
	ld e, a ; 23:5219
	ld d, $0 ; 23:521a
	ld hl, SpriteAnimSeqData ; 23:521c
	add hl, de ; 23:521f
	add hl, de ; 23:5220
	add hl, de ; 23:5221
	ld e, l ; 23:5222
	ld d, h ; 23:5223
	ld hl, $0 ; 23:5224
	add hl, bc ; 23:5227
	ld a, [$c5bc] ; 23:5228
	ld [hli], a ; 23:522b
	ld a, [de] ; 23:522c
	ld [hli], a ; 23:522d
	inc de ; 23:522e
	ld a, [de] ; 23:522f
	ld [hli], a ; 23:5230
	inc de ; 23:5231
	ld a, [de] ; 23:5232
	call GetSpriteAnimVTile ; 23:5233
	ld [hli], a ; 23:5236
	pop de ; 23:5237
	ld hl, $4 ; 23:5238
	add hl, bc ; 23:523b
	ld a, e ; 23:523c
	ld [hli], a ; 23:523d
	ld a, d ; 23:523e
	ld [hli], a ; 23:523f
	xor a ; 23:5240
	ld [hli], a ; 23:5241
	ld [hli], a ; 23:5242
	xor a ; 23:5243
	ld [hli], a ; 23:5244
	ld [hli], a ; 23:5245
	dec a ; 23:5246
	ld [hli], a ; 23:5247
	xor a ; 23:5248
	ld [hli], a ; 23:5249
	ld [hli], a ; 23:524a
	ld [hli], a ; 23:524b
	ld [hli], a ; 23:524c
	ld [hl], a ; 23:524d
	ld a, c ; 23:524e
	ld [$c5c0], a ; 23:524f
	ld a, b ; 23:5252
	ld [$c5c1], a ; 23:5253
	ret ; 23:5256

DeinitializeSprite: ; 8d257
	ld hl, $0 ; 23:5257
	add hl, bc ; 23:525a
	ld [hl], $0 ; 23:525b
	ret ; 23:525d

UpdateAnimFrame: ; 8d25e
	call InitSpriteAnimBuffer ; 23:525e
	call GetSpriteAnimFrame ; 23:5261
	cp $fd ; 23:5264
	jr z, .done ; 23:5266
	cp $fc ; 23:5268
	jr z, .delete ; 23:526a
	call GetFrameOAMPointer ; 23:526c
	ld a, [$c5c2] ; 23:526f
	add [hl] ; 23:5272
	ld [$c5c2], a ; 23:5273
	inc hl ; 23:5276
	ld a, [hli] ; 23:5277
	ld h, [hl] ; 23:5278
	ld l, a ; 23:5279
	push bc ; 23:527a
	ld a, [$c5bd] ; 23:527b
	ld e, a ; 23:527e
	ld d, $c3 ; 23:527f
	ld a, [hli] ; 23:5281
	ld c, a ; 23:5282
.loop
	ld a, [$c5c4] ; 23:5283
	ld b, a ; 23:5286
	ld a, [$c5c6] ; 23:5287
	add b ; 23:528a
	ld b, a ; 23:528b
	ld a, [$c5c7] ; 23:528c
	add b ; 23:528f
	ld b, a ; 23:5290
	call AddOrSubtractX ; 23:5291
	add b ; 23:5294
	ld [de], a ; 23:5295
	inc hl ; 23:5296
	inc de ; 23:5297
	ld a, [$c5c3] ; 23:5298
	ld b, a ; 23:529b
	ld a, [$c5c5] ; 23:529c
	add b ; 23:529f
	ld b, a ; 23:52a0
	ld a, [$c5c8] ; 23:52a1
	add b ; 23:52a4
	ld b, a ; 23:52a5
	call AddOrSubtractY ; 23:52a6
	add b ; 23:52a9
	ld [de], a ; 23:52aa
	inc hl ; 23:52ab
	inc de ; 23:52ac
	ld a, [$c5c2] ; 23:52ad
	add [hl] ; 23:52b0
	ld [de], a ; 23:52b1
	inc hl ; 23:52b2
	inc de ; 23:52b3
	call GetSpriteOAMAttr ; 23:52b4
	ld [de], a ; 23:52b7
	inc hl ; 23:52b8
	inc de ; 23:52b9
	ld a, e ; 23:52ba
	ld [$c5bd], a ; 23:52bb
	cp $a0 ; 23:52be
	jr nc, reached_the_end ; 23:52c0
	dec c ; 23:52c2
	jr nz, .loop ; 23:52c3
	pop bc ; 23:52c5
	jr .done ; 23:52c6

.delete
	call DeinitializeSprite ; 23:52c8
.done
	and a ; 23:52cb
	ret ; 23:52cc

reached_the_end
	pop bc ; 23:52cd
	scf ; 23:52ce
	ret ; 23:52cf

AddOrSubtractX: ; 8d2d0
	push hl ; 23:52d0
	ld a, [hl] ; 23:52d1
	ld hl, $c5c0 ; 23:52d2
	bit 6, [hl] ; 23:52d5
	jr z, .ok ; 23:52d7
	add a, $8 ; 23:52d9
	xor $ff ; 23:52db
	inc a ; 23:52dd
.ok
	pop hl ; 23:52de
	ret ; 23:52df

AddOrSubtractY: ; 8d2e0
	push hl ; 23:52e0
	ld a, [hl] ; 23:52e1
	ld hl, $c5c0 ; 23:52e2
	bit 5, [hl] ; 23:52e5
	jr z, .ok ; 23:52e7
	add a, $8 ; 23:52e9
	xor $ff ; 23:52eb
	inc a ; 23:52ed
.ok
	pop hl ; 23:52ee
	ret ; 23:52ef

GetSpriteOAMAttr: ; 8d2f0
	ld a, [$c5c0] ; 23:52f0
	ld b, a ; 23:52f3
	ld a, [hl] ; 23:52f4
	xor b ; 23:52f5
	and $e0 ; 23:52f6
	ld b, a ; 23:52f8
	ld a, [hl] ; 23:52f9
	and $1f ; 23:52fa
	or b ; 23:52fc
	ret ; 23:52fd

InitSpriteAnimBuffer: ; 8d2fe
	xor a ; 23:52fe
	ld [$c5c0], a ; 23:52ff
	ld hl, $3 ; 23:5302
	add hl, bc ; 23:5305
	ld a, [hli] ; 23:5306
	ld [$c5c2], a ; 23:5307
	ld a, [hli] ; 23:530a
	ld [$c5c3], a ; 23:530b
	ld a, [hli] ; 23:530e
	ld [$c5c4], a ; 23:530f
	ld a, [hli] ; 23:5312
	ld [$c5c5], a ; 23:5313
	ld a, [hli] ; 23:5316
	ld [$c5c6], a ; 23:5317
	ret ; 23:531a

GetSpriteAnimVTile: ; 8d31b
	push hl ; 23:531b
	push bc ; 23:531c
	ld hl, $c508 ; 23:531d
	ld b, a ; 23:5320
	ld c, $a ; 23:5321
.loop
	ld a, [hli] ; 23:5323
	cp b ; 23:5324
	jr z, .ok ; 23:5325
	inc hl ; 23:5327
	dec c ; 23:5328
	jr nz, .loop ; 23:5329
	xor a ; 23:532b
	jr .done ; 23:532c

.ok
	ld a, [hl] ; 23:532e
.done
	pop bc ; 23:532f
	pop hl ; 23:5330
	ret ; 23:5331

Function8d332: ; 8d332
	ld hl, $1 ; 23:5332
	add hl, bc ; 23:5335
	ld [hl], a ; 23:5336
	ld hl, $8 ; 23:5337
	add hl, bc ; 23:533a
	ld [hl], $0 ; 23:533b
	ld hl, $a ; 23:533d
	add hl, bc ; 23:5340
	ld [hl], $ff ; 23:5341
	ret ; 23:5343

GetSpriteAnimFrame: ; 8d344
.loop
	ld hl, $8 ; 23:5344
	add hl, bc ; 23:5347
	ld a, [hl] ; 23:5348
	and a ; 23:5349
	jr z, .next_frame ; 23:534a
	dec [hl] ; 23:534c
	call .GetPointer ; 23:534d
	ld a, [hli] ; 23:5350
	push af ; 23:5351
	jr .okay ; 23:5352

.next_frame
	ld hl, $a ; 23:5354
	add hl, bc ; 23:5357
	inc [hl] ; 23:5358
	call .GetPointer ; 23:5359
	ld a, [hli] ; 23:535c
	cp $fe ; 23:535d
	jr z, .restart ; 23:535f
	cp $ff ; 23:5361
	jr z, .repeat_last ; 23:5363
	push af ; 23:5365
	ld a, [hl] ; 23:5366
	push hl ; 23:5367
	and $3f ; 23:5368
	ld hl, $9 ; 23:536a
	add hl, bc ; 23:536d
	add [hl] ; 23:536e
	ld hl, $8 ; 23:536f
	add hl, bc ; 23:5372
	ld [hl], a ; 23:5373
	pop hl ; 23:5374
.okay
	ld a, [hl] ; 23:5375
	and $c0 ; 23:5376
	srl a ; 23:5378
	ld [$c5c0], a ; 23:537a
	pop af ; 23:537d
	ret ; 23:537e

.repeat_last ; 8d37f
	xor a ; 23:537f
	ld hl, $8 ; 23:5380
	add hl, bc ; 23:5383
	ld [hl], a ; 23:5384
	ld hl, $a ; 23:5385
	add hl, bc ; 23:5388
	dec [hl] ; 23:5389
	dec [hl] ; 23:538a
	jr .loop ; 23:538b

.restart
	xor a ; 23:538d
	ld hl, $8 ; 23:538e
	add hl, bc ; 23:5391
	ld [hl], a ; 23:5392
	dec a ; 23:5393
	ld hl, $a ; 23:5394
	add hl, bc ; 23:5397
	ld [hl], a ; 23:5398
	jr .loop ; 23:5399

.GetPointer
	ld hl, $1 ; 23:539b
	add hl, bc ; 23:539e
	ld e, [hl] ; 23:539f
	ld d, $0 ; 23:53a0
	ld hl, SpriteAnimFrameData ; 23:53a2
	add hl, de ; 23:53a5
	add hl, de ; 23:53a6
	ld e, [hl] ; 23:53a7
	inc hl ; 23:53a8
	ld d, [hl] ; 23:53a9
	ld hl, $a ; 23:53aa
	add hl, bc ; 23:53ad
	ld l, [hl] ; 23:53ae
	ld h, $0 ; 23:53af
	add hl, hl ; 23:53b1
	add hl, de ; 23:53b2
	ret ; 23:53b3

GetFrameOAMPointer: ; 8d3b4
	ld e, a ; 23:53b4
	ld d, $0 ; 23:53b5
	ld hl, SpriteAnimOAMData ; 23:53b7
	add hl, de ; 23:53ba
	add hl, de ; 23:53bb
	add hl, de ; 23:53bc
	ret ; 23:53bd

BrokenGetStdGraphics: ; 8d3be
	push hl ; 23:53be
	ld l, a ; 23:53bf
	ld h, $0 ; 23:53c0
	add hl, hl ; 23:53c2
	add hl, hl ; 23:53c3
	ld de, $6666 ; 23:53c4
	add hl, de ; 23:53c7
	ld c, [hl] ; 23:53c8
	inc hl ; 23:53c9
	ld b, [hl] ; 23:53ca
	inc hl ; 23:53cb
	ld e, [hl] ; 23:53cc
	inc hl ; 23:53cd
	ld d, [hl] ; 23:53ce
	pop hl ; 23:53cf
	push bc ; 23:53d0
	call $dfe ; Request2bpp ; 23:53d1
	pop bc ; 23:53d4
	ret ; 23:53d5

SpriteAnimSeqData: ; 8d3d6
	db $01, $01, $00
	db $04, $04, $00
	db $05, $05, $00
	db $06, $06, $00
	db $07, $07, $00
	db $08, $08, $00
	db $09, $09, $01
	db $0a, $09, $01
	db $0b, $0a, $01
	db $0d, $0b, $01
	db $10, $0c, $01
	db $12, $0d, $02
	db $13, $0e, $02
	db $14, $0f, $02
	db $15, $0e, $02
	db $16, $10, $00
	db $0d, $11, $01
	db $10, $12, $01
	db $09, $13, $01
	db $0b, $14, $01
	db $1a, $15, $05
	db $1c, $16, $06
	db $1d, $17, $06
	db $1e, $18, $06
	db $1f, $19, $07
	db $20, $1a, $07
	db $22, $1b, $07
	db $1a, $1c, $05
	db $23, $00, $00
	db $24, $1d, $08
	db $24, $1e, $08
	db $24, $1f, $08
	db $25, $20, $00
	db $27, $00, $00
	db $28, $21, $00
	db $29, $22, $00
	db $2a, $22, $00
	db $2b, $23, $00
	db $2c, $24, $00
	db $2d, $00, $00
	db $2f, $25, $00
	db $30, $00, $00
	db $2f, $27, $00
	db $31, $00, $00
	db $36, $29, $00
	db $37, $00, $00
	db $32, $23, $00

INCLUDE "engine/sprite_anims.asm"
INCLUDE "data/sprite_engine.asm"

Sprites_Cosine:
	add a, $10 ; 23:668a
Sprites_Sine:
	and $3f ; 23:668c
	cp $20 ; 23:668e
	jr nc, .negative ; 23:6690
	call .ApplySineWave ; 23:6692
	ld a, h ; 23:6695
	ret ; 23:6696

.negative
	and $1f ; 23:6697
	call .ApplySineWave ; 23:6699
	ld a, h ; 23:669c
	xor $ff ; 23:669d
	inc a ; 23:669f
	ret ; 23:66a0

.ApplySineWave:
	ld e, a ; 23:66a1
	ld a, d ; 23:66a2
	ld d, $0 ; 23:66a3
	ld hl, .sinewave ; 23:66a5
	add hl, de ; 23:66a8
	add hl, de ; 23:66a9
	ld e, [hl] ; 23:66aa
	inc hl ; 23:66ab
	ld d, [hl] ; 23:66ac
	ld hl, $0 ; 23:66ad
.multiply
	srl a ; 23:66b0
	jr nc, .even ; 23:66b2
	add hl, de ; 23:66b4
.even
	sla e ; 23:66b5
	rl d ; 23:66b7
	and a ; 23:66b9
	jr nz, .multiply ; 23:66ba
	ret ; 23:66bc

.sinewave ; 8e75d
	sine_wave $100

AnimateEndOfExpBar:
	ldh a, [$ffe9] ; 23:66fd
	ld de, EndOfExpBarGFX ; 23:66ff
	and a ; 23:6702
	jr z, .got_gfx ; 23:6703
	ld de, SGBEndOfExpBarGFX ; 23:6705
.got_gfx
	ld hl, VTiles0 tile $00 ; 23:6708
	lb bc, BANK(EndOfExpBarGFX), 1 ; 23:670b
	call $dfe ; Request2bpp ; 23:670e
	ld c, $8 ; 23:6711
	ld d, $0 ; 23:6713
.loop
	push bc ; 23:6715
	call .AnimateFrame ; 23:6716
	call $32e ; DelayFrame ; 23:6719
	pop bc ; 23:671c
	inc d ; 23:671d
	inc d ; 23:671e
	dec c ; 23:671f
	jr nz, .loop ; 23:6720
	call $30ff ; ClearSprites ; 23:6722
	ret ; 23:6725

.AnimateFrame
	ld hl, $c300 ; 23:6726
	ld c, $8 ; 23:6729
.anim_loop
	ld a, c ; 23:672b
	and a ; 23:672c
	ret z ; 23:672d
	dec c ; 23:672e
	ld a, c ; 23:672f
	sla a ; 23:6730
	sla a ; 23:6732
	sla a ; 23:6734
	push af ; 23:6736
	push de ; 23:6737
	push hl ; 23:6738
	call Sprites_Sine ; 23:6739
	pop hl ; 23:673c
	pop de ; 23:673d
	add a, $68 ; 23:673e
	ld [hli], a ; 23:6740
	pop af ; 23:6741
	push de ; 23:6742
	push hl ; 23:6743
	call Sprites_Cosine ; 23:6744
	pop hl ; 23:6747
	pop de ; 23:6748
	add a, $54 ; 23:6749
	ld [hli], a ; 23:674b
	ld a, $0 ; 23:674c
	ld [hli], a ; 23:674e
	ld a, $6 ; 23:674f
	ld [hli], a ; 23:6751
	jr .anim_loop ; 23:6752

EndOfExpBarGFX:
	dr $8e754, $8e764

SGBEndOfExpBarGFX:
	dr $8e764, $8e774

ClearSpriteAnims2
	push hl ; 23:6774
	push de ; 23:6775
	push bc ; 23:6776
	push af ; 23:6777
	ld hl, $c508 ; 23:6778
	ld bc, $c1 ; 23:677b
.loop
	ld [hl], $0 ; 23:677e
	inc hl ; 23:6780
	dec bc ; 23:6781
	ld a, c ; 23:6782
	or b ; 23:6783
	jr nz, .loop ; 23:6784
	pop af ; 23:6786
	pop bc ; 23:6787
	pop de ; 23:6788
	pop hl ; 23:6789
	ret ; 23:678a
; 8e78a
