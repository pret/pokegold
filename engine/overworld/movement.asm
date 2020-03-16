GetMovementByte:
	ld hl, wMovementDataBank
	call _GetMovementByte
	ret

Function4fbd:
	ld hl, $1b
	add hl, bc
	ld e, [hl]
	inc [hl]
	ld d, $0
	ld hl, wMovementObject
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
	ld a, [wMovementObject]
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
	jp hl

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

Function50cf: ; 50cf (1:50cf)
	ld hl, $9
	add hl, bc
	ld [hl], $c
	ret

Function50d6: ; 50d6 (1:50d6)
	ld hl, $9
	add hl, bc
	ld [hl], $d
	ret

Function50dd: ; 50dd (1:50dd)
	ld hl, $9
	add hl, bc
	ld [hl], $e
	ret

Function50e4: ; 50e4 (1:50e4)
	call GetSpriteDirection
	rlca
	rlca
	ld hl, $c
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld [hl], $4
	call Function5006
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld [hl], $3
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ret

Function5109: ; 5109 (1:5109)
	call GetSpriteDirection
	rlca
	rlca
	ld hl, $c
	add hl, bc
	ld [hl], a
	call Function5006
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ld hl, $9
	add hl, bc
	ld [hl], $12
	ret

Function5128: ; 5128 (1:5128)
	ld hl, $b
	add hl, bc
	ld [hl], $6
	ld hl, $9
	add hl, bc
	ld [hl], $10
	ret

Function5135: ; 5135 (1:5135)
	call Function5006
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld [hl], $1
	ld hl, $9
	add hl, bc
	ld [hl], $11
	ret

Function514a: ; 514a (1:514a)
	ld hl, $b
	add hl, bc
	ld [hl], $6
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function5157: ; 5157 (1:5157)
	ld hl, $1b
	add hl, bc
	ld [hl], $0
	jp Function500d

Function5160: ; 5160 (1:5160)
	call RestoreDefaultMovement
	ld hl, $3
	add hl, bc
	ld [hl], a
	ld hl, $1b
	add hl, bc
	ld [hl], $0
	ld hl, wVramState
	res 7, [hl]
	ld hl, $9
	add hl, bc
	ld [hl], $1
	ret

Function517a: ; 517a (1:517a)
	call RestoreDefaultMovement
	ld hl, $3
	add hl, bc
	ld [hl], a
	ld hl, $1b
	add hl, bc
	ld [hl], $0
	call Function5006
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld [hl], $3
	ld hl, wVramState
	res 7, [hl]
	ret

Function519c: ; 519c (1:519c)
	call DeleteMapObject
	ld hl, wObjectFollow_Leader
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	jr nz, .asm_51a9
	ld [hl], $ff
.asm_51a9
	ld hl, wVramState
	res 7, [hl]
	ret

Function51af: ; 51af (1:51af)
	ld hl, $b
	add hl, bc
	ld [hl], $1
	ld hl, $9
	add hl, bc
	ld [hl], $4
	ld hl, wVramState
	res 7, [hl]
	ret

Function51c1: ; 51c1 (1:51c1)
	ld a, $1
	jr asm_51e6

Function51c5: ; 51c5 (1:51c5)
	ld a, $2
	jr asm_51e6

Function51c9: ; 51c9 (1:51c9)
	ld a, $3
	jr asm_51e6

Function51cd: ; 51cd (1:51cd)
	ld a, $4
	jr asm_51e6

Function51d1: ; 51d1 (1:51d1)
	ld a, $5
	jr asm_51e6

Function51d5: ; 51d5 (1:51d5)
	ld a, $6
	jr asm_51e6

Function51d9: ; 51d9 (1:51d9)
	ld a, $7
	jr asm_51e6

Function51dd: ; 51dd (1:51dd)
	ld a, $8
	jr asm_51e6

Function51e1: ; 51e1 (1:51e1)
	call Function5006
	jr asm_51e6

asm_51e6
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld [hl], $3
	ld hl, $b
	add hl, bc
	ld [hl], $1
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ret

Function51fe: ; 51fe (1:51fe)
	ld a, $1
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld [hl], $b
	ld hl, $b
	add hl, bc
	ld [hl], $3
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ret

Function5218: ; 5218 (1:5218)
	ld a, $18
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld [hl], $3
	ld hl, $b
	add hl, bc
	ld [hl], $b
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ret

Function5232: ; 5232 (1:5232)
	ld hl, $4
	add hl, bc
	res 3, [hl]
	jp Function500d

Function523b: ; 523b (1:523b)
	ld hl, $4
	add hl, bc
	set 3, [hl]
	jp Function500d

Function5244: ; 5244 (1:5244)
	ld hl, $4
	add hl, bc
	res 2, [hl]
	jp Function500d

Function524d: ; 524d (1:524d)
	ld hl, $4
	add hl, bc
	set 2, [hl]
	jp Function500d

Function5256: ; 5256 (1:5256)
	ld hl, $4
	add hl, bc
	res 0, [hl]
	jp Function500d

Function525f: ; 525f (1:525f)
	ld hl, $4
	add hl, bc
	set 0, [hl]
	jp Function500d

Function5268: ; 5268 (1:5268)
	call Function5518
	jp Function500d

Function526e: ; 526e (1:526e)
	call Function54e6
	jp Function500d

Function5274: ; 5274 (1:5274)
	call Function5006
	call Function5504
	jp Function500d

Function527d: ; 527d (1:527d)
	ld a, $0
	jr asm_528d

Function5281: ; 5281 (1:5281)
	ld a, $4
	jr asm_528d

Function5285: ; 5285 (1:5285)
	ld a, $8
	jr asm_528d

Function5289: ; 5289 (1:5289)
	ld a, $c
	jr asm_528d

asm_528d
	ld hl, $8
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld [hl], $1
	ld hl, $7
	add hl, bc
	ld [hl], $ff
	ret

Function529f: ; 529f (1:529f)
	ld a, $0
	jp Function53b1

Function52a4: ; 52a4 (1:52a4)
	ld a, $1
	jp Function53b1

Function52a9: ; 52a9 (1:52a9)
	ld a, $2
	jp Function53b1

Function52ae: ; 52ae (1:52ae)
	ld a, $3
	jp Function53b1

Function52b3: ; 52b3 (1:52b3)
	ld a, $4
	jp Function53b1

Function52b8: ; 52b8 (1:52b8)
	ld a, $5
	jp Function53b1

Function52bd: ; 52bd (1:52bd)
	ld a, $6
	jp Function53b1

Function52c2: ; 52c2 (1:52c2)
	ld a, $7
	jp Function53b1

Function52c7: ; 52c7 (1:52c7)
	ld a, $8
	jp Function53b1

Function52cc: ; 52cc (1:52cc)
	ld a, $9
	jp Function53b1

Function52d1: ; 52d1 (1:52d1)
	ld a, $a
	jp Function53b1

Function52d6: ; 52d6 (1:52d6)
	ld a, $b
	jp Function53b1

Function52db: ; 52db (1:52db)
	ld a, $0
	jp Function53e5

Function52e0: ; 52e0 (1:52e0)
	ld a, $1
	jp Function53e5

Function52e5: ; 52e5 (1:52e5)
	ld a, $2
	jp Function53e5

Function52ea: ; 52ea (1:52ea)
	ld a, $3
	jp Function53e5

Function52ef: ; 52ef (1:52ef)
	ld a, $4
	jp Function53e5

Function52f4: ; 52f4 (1:52f4)
	ld a, $5
	jp Function53e5

Function52f9: ; 52f9 (1:52f9)
	ld a, $6
	jp Function53e5

Function52fe: ; 52fe (1:52fe)
	ld a, $7
	jp Function53e5

Function5303: ; 5303 (1:5303)
	ld a, $8
	jp Function53e5

Function5308: ; 5308 (1:5308)
	ld a, $9
	jp Function53e5

Function530d: ; 530d (1:530d)
	ld a, $a
	jp Function53e5

Function5312: ; 5312 (1:5312)
	ld a, $b
	jp Function53e5

Function5317: ; 5317 (1:5317)
	ld a, $0
	jp Function5407

Function531c: ; 531c (1:531c)
	ld a, $1
	jp Function5407

Function5321: ; 5321 (1:5321)
	ld a, $2
	jp Function5407

Function5326: ; 5326 (1:5326)
	ld a, $3
	jp Function5407

Function532b: ; 532b (1:532b)
	ld a, $4
	jp Function5407

Function5330: ; 5330 (1:5330)
	ld a, $5
	jp Function5407

Function5335: ; 5335 (1:5335)
	ld a, $6
	jp Function5407

Function533a: ; 533a (1:533a)
	ld a, $7
	jp Function5407

Function533f: ; 533f (1:533f)
	ld a, $8
	jp Function5407

Function5344: ; 5344 (1:5344)
	ld a, $9
	jp Function5407

Function5349: ; 5349 (1:5349)
	ld a, $a
	jp Function5407

Function534e: ; 534e (1:534e)
	ld a, $b
	jp Function5407

Function5353: ; 5353 (1:5353)
	ld a, $0
	jp Function5429

Function5358: ; 5358 (1:5358)
	ld a, $1
	jp Function5429

Function535d: ; 535d (1:535d)
	ld a, $2
	jp Function5429

Function5362: ; 5362 (1:5362)
	ld a, $3
	jp Function5429

Function5367: ; 5367 (1:5367)
	ld a, $4
	jp Function5429

Function536c: ; 536c (1:536c)
	ld a, $5
	jp Function5429

Function5371: ; 5371 (1:5371)
	ld a, $6
	jp Function5429

Function5376: ; 5376 (1:5376)
	ld a, $7
	jp Function5429

Function537b: ; 537b (1:537b)
	ld a, $8
	jp Function5429

Function5380: ; 5380 (1:5380)
	ld a, $9
	jp Function5429

Function5385: ; 5385 (1:5385)
	ld a, $a
	jp Function5429

Function538a: ; 538a (1:538a)
	ld a, $b
	jp Function5429

Function538f: ; 538f (1:538f)
	ld a, $0
	jr asm_539f

Function5393: ; 5393 (1:5393)
	ld a, $4
	jr asm_539f

Function5397: ; 5397 (1:5397)
	ld a, $8
	jr asm_539f

Function539b: ; 539b (1:539b)
	ld a, $c
	jr asm_539f

asm_539f
	ld hl, $1d
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld [hl], $2
	ld hl, $9
	add hl, bc
	ld [hl], $a
	ret

Function53b1: ; 53b1 (1:53b1)
	call InitStep
	call UpdateGrassPriority
	ld hl, $b
	add hl, bc
	ld [hl], $2
	ld hl, $e
	add hl, bc
	ld a, [hl]
	call CheckSuperTallGrassTile
	jr z, .asm_53cc
	call CheckGrassTile
	jr c, .asm_53cf
.asm_53cc
	call Function54f5
.asm_53cf
	ld hl, wCenteredObject
	ldh a, [hConnectionStripLength]
	cp [hl]
	jr z, .asm_53de
	ld hl, $9
	add hl, bc
	ld [hl], $2
	ret

.asm_53de
	ld hl, $9
	add hl, bc
	ld [hl], $6
	ret

Function53e5: ; 53e5 (1:53e5)
	call InitStep
	call UpdateGrassPriority
	ld hl, $b
	add hl, bc
	ld [hl], $4
	ld hl, wCenteredObject
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .asm_5400
	ld hl, $9
	add hl, bc
	ld [hl], $2
	ret

.asm_5400
	ld hl, $9
	add hl, bc
	ld [hl], $6
	ret

Function5407: ; 5407 (1:5407)
	call InitStep
	call UpdateGrassPriority
	ld hl, $b
	add hl, bc
	ld [hl], $1
	ld hl, wCenteredObject
	ldh a, [hConnectionStripLength]
	cp [hl]
	jr z, .asm_5422
	ld hl, $9
	add hl, bc
	ld [hl], $2
	ret

.asm_5422
	ld hl, $9
	add hl, bc
	ld [hl], $6
	ret
