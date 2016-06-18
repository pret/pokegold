GetMovementByte:
	ld hl, wMovementDataPointerBank
	call GetMovementByte_
	ret

Function4fbd:
	ld hl, $1b
	add hl, bc
	ld e, [hl]
	inc [hl]
	ld d, $0
	ld hl, wMovementPerson
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, [hl]
	ret

Function4fce:
	ld hl, $1b
	add hl, bc
	ld e, [hl]
	inc [hl]
	ld d, $0
	ld hl, wce8f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, [hl]
	ret

Function4fdf: ; 4fdf (1:4fdf)
	ld hl, GetMovementPerson
	jp Function4fe9

GetMovementPerson
	ld a, [wMovementPerson]
	ret

Function4fe9: ; 4fe9 (1:4fe9)
	call Function4ffd
.asm_4fec
	xor a
	ld [wce93], a
	call Function5006
	call Function5013
	ld a, [wce93]
	and a
	jr nz, .asm_4fec
	ret

Function4ffd: ; 4ffd (1:4ffd)
	ld a, l
	ld [wce94], a
	ld a, h
	ld [wce95], a
	ret

Function5006: ; 5006 (1:5006)
	ld hl, wce94
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Function500d: ; 500d (1:500d)
	ld a, $1
	ld [wce93], a
	ret

Function5013: ; 5013 (1:5013)
	push af
	call Function5457
	pop af
	ld hl, MovementPointers
	rst JumpTable
	ret

MovementPointers: ; 501d
	dw Function527d
	dw Function5281
	dw Function5285
	dw Function5289
	dw Function538f
	dw Function5393
	dw Function5397
	dw Function539b
	dw Function529f
	dw Function52a4
	dw Function52a9
	dw Function52ae
	dw Function52b3
	dw Function52b8
	dw Function52bd
	dw Function52c2
	dw Function52c7
	dw Function52cc
	dw Function52d1
	dw Function52d6
	dw Function5317
	dw Function531c
	dw Function5321
	dw Function5326
	dw Function532b
	dw Function5330
	dw Function5335
	dw Function533a
	dw Function533f
	dw Function5344
	dw Function5349
	dw Function534e
	dw Function52db
	dw Function52e0
	dw Function52e5
	dw Function52ea
	dw Function52ef
	dw Function52f4
	dw Function52f9
	dw Function52fe
	dw Function5303
	dw Function5308
	dw Function530d
	dw Function5312
	dw Function5353
	dw Function5358
	dw Function535d
	dw Function5362
	dw Function5367
	dw Function536c
	dw Function5371
	dw Function5376
	dw Function537b
	dw Function5380
	dw Function5385
	dw Function538a
	dw Function5232
	dw Function523b
	dw Function5244
	dw Function524d
	dw Function5256
	dw Function525f
	dw Function51c1
	dw Function51c5
	dw Function51c9
	dw Function51cd
	dw Function51d1
	dw Function51d5
	dw Function51d9
	dw Function51dd
	dw Function51e1
	dw Function5160
	dw Function517a
	dw Function519c
	dw Function5157
	dw Function51af
	dw Function50cf
	dw Function50d6
	dw Function50dd
	dw Function50e4
	dw Function51fe
	dw Function5128
	dw Function514a
	dw Function5268
	dw Function526e
	dw Function5274
	dw Function5218
	dw Function5135
	dw Function5109

Function50cf:
	dr $50cf, $50d6

Function50d6:
	dr $50d6, $50dd

Function50dd:
	dr $50dd, $50e4

Function50e4:
	dr $50e4, $5109

Function5109:
	dr $5109, $5128

Function5128:
	dr $5128, $5135

Function5135:
	dr $5135, $514a

Function514a:
	dr $514a, $5157

Function5157:
	dr $5157, $5160

Function5160:
	dr $5160, $517a

Function517a:
	dr $517a, $519c

Function519c:
	dr $519c, $51af

Function51af:
	dr $51af, $51c1

Function51c1:
	dr $51c1, $51c5

Function51c5:
	dr $51c5, $51c9

Function51c9:
	dr $51c9, $51cd

Function51cd:
	dr $51cd, $51d1

Function51d1:
	dr $51d1, $51d5

Function51d5:
	dr $51d5, $51d9

Function51d9:
	dr $51d9, $51dd

Function51dd:
	dr $51dd, $51e1

Function51e1:
	dr $51e1, $51fe

Function51fe:
	dr $51fe, $5218

Function5218:
	dr $5218, $5232

Function5232:
	dr $5232, $523b

Function523b:
	dr $523b, $5244

Function5244:
	dr $5244, $524d

Function524d:
	dr $524d, $5256

Function5256:
	dr $5256, $525f

Function525f:
	dr $525f, $5268

Function5268:
	dr $5268, $526e

Function526e:
	dr $526e, $5274

Function5274:
	dr $5274, $527d

Function527d:
	dr $527d, $5281

Function5281:
	dr $5281, $5285

Function5285:
	dr $5285, $5289

Function5289:
	dr $5289, $529f

Function529f:
	dr $529f, $52a4

Function52a4:
	dr $52a4, $52a9

Function52a9:
	dr $52a9, $52ae

Function52ae:
	dr $52ae, $52b3

Function52b3:
	dr $52b3, $52b8

Function52b8:
	dr $52b8, $52bd

Function52bd:
	dr $52bd, $52c2

Function52c2:
	dr $52c2, $52c7

Function52c7:
	dr $52c7, $52cc

Function52cc:
	dr $52cc, $52d1

Function52d1:
	dr $52d1, $52d6

Function52d6:
	dr $52d6, $52db

Function52db:
	dr $52db, $52e0

Function52e0:
	dr $52e0, $52e5

Function52e5:
	dr $52e5, $52ea

Function52ea:
	dr $52ea, $52ef

Function52ef:
	dr $52ef, $52f4

Function52f4:
	dr $52f4, $52f9

Function52f9:
	dr $52f9, $52fe

Function52fe:
	dr $52fe, $5303

Function5303:
	dr $5303, $5308

Function5308:
	dr $5308, $530d

Function530d:
	dr $530d, $5312

Function5312:
	dr $5312, $5317

Function5317:
	dr $5317, $531c

Function531c:
	dr $531c, $5321

Function5321:
	dr $5321, $5326

Function5326:
	dr $5326, $532b

Function532b:
	dr $532b, $5330

Function5330:
	dr $5330, $5335

Function5335:
	dr $5335, $533a

Function533a:
	dr $533a, $533f

Function533f:
	dr $533f, $5344

Function5344:
	dr $5344, $5349

Function5349:
	dr $5349, $534e

Function534e:
	dr $534e, $5353

Function5353:
	dr $5353, $5358

Function5358:
	dr $5358, $535d

Function535d:
	dr $535d, $5362

Function5362:
	dr $5362, $5367

Function5367:
	dr $5367, $536c

Function536c:
	dr $536c, $5371

Function5371:
	dr $5371, $5376

Function5376:
	dr $5376, $537b

Function537b:
	dr $537b, $5380

Function5380:
	dr $5380, $5385

Function5385:
	dr $5385, $538a

Function538a:
	dr $538a, $538f

Function538f:
	dr $538f, $5393

Function5393:
	dr $5393, $5397

Function5397:
	dr $5397, $539b

Function539b:
	dr $539b, $53b1
