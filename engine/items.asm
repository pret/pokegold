ReceiveItem_:: ; d1e2 (3:51e2)
	call CheckBagOrPC
	jp nz, PutItemInPocketOrPC
	push hl
	call CheckItemPocket
	pop de
	ld a, [wd03f]
	dec a
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable
	dw ReceiveNormalItem
	dw ReceiveKeyItem
	dw ReceiveBall
	dw ReceiveTMHM

ReceiveNormalItem:
	ld h, d
	ld l, e
	jp PutItemInPocketOrPC

ReceiveKeyItem:
	ld h, d
	ld l, e
	jp PutItemInKeyItemPocket

ReceiveBall:
	ld hl, wNumBalls
	jp PutItemInPocketOrPC

ReceiveTMHM:
	ld h, d
	ld l, e
	ld a, [wd002]
	ld c, a
	call GetTMHMNumber
	jp PutItemInTMPocket

TossItem_:: ; d21a (3:521a)
	call CheckBagOrPC
	jr nz, remove_item_from_bag_or_pc
	push hl
	call CheckItemPocket
	pop de
	ld a, [wd03f]
	dec a
	ld hl, .Jumptable ; $522d
	rst JumpTable
	ret

.Jumptable
	dw RemoveNormalItem
	dw RemoveKeyItem
	dw RemoveBall
	dw RemoveTMHM

RemoveBall:
	ld hl, wNumBalls
	jp RemoveItemAndQuantity

RemoveTMHM:
	ld h, d
	ld l, e
	ld a, [wd002]
	ld c, a
	call GetTMHMNumber
	jp RemoveTMorHM

RemoveKeyItem:
	ld h, d
	ld l, e
	jp RemoveItemWithoutQuantity

RemoveNormalItem:
	ld h, d
	ld l, e
remove_item_from_bag_or_pc
	jp RemoveItemAndQuantity

CheckItem_:: ; d251 (3:5251)
	call CheckBagOrPC
	jr nz, check_item_in_bag_or_pc
	push hl
	call CheckItemPocket
	pop de
	ld a, [wd03f]
	dec a
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable
	dw CheckNormalItem
	dw CheckKeyItem
	dw CheckBall
	dw CheckTMHM

CheckBall:
	ld hl, wNumBalls
	jp CheckItemWithQuantity

CheckTMHM:
	ld h, d
	ld l, e
	ld a, [wd002]
	ld c, a
	call GetTMHMNumber
	jp CheckTMorHM

CheckKeyItem:
	ld h, d
	ld l, e
	jp CheckItemWithoutQuantity

CheckNormalItem:
	ld h, d
	ld l, e
check_item_in_bag_or_pc
	jp CheckItemWithQuantity

CheckBagOrPC: ; d288 (3:5288)
	ld a, l
	cp wNumItems % $100
	ret nz
	ld a, h
	cp wNumItems / $100
	ret

GetPocketCapacity: ; d290 (3:5290)
	ld c, MAX_ITEMS
	ld a, e
	cp wNumItems % $100
	jr nz, .asm_d29b
	ld a, d
	cp wNumItems / $100
	ret z
.asm_d29b
	ld c, MAX_PC_ITEMS
	ld a, e
	cp wPCItems % $100
	jr nz, .asm_d2a6
	ld a, d
	cp wPCItems / $100
	ret z
.asm_d2a6
	ld c, MAX_BALLS
	ret

PutItemInPocketOrPC: ; d2a9 (3:52a9)
	ld d, h
	ld e, l
	inc hl
	ld a, [wd002]
	ld c, a
	ld b, $0
.asm_d2b2
	ld a, [hli]
	cp $ff
	jr z, .asm_d2ca
	cp c
	jr nz, .asm_d2c7
	ld a, $63
	sub [hl]
	add b
	ld b, a
	ld a, [wd009]
	cp b
	jr z, .asm_d2d3
	jr c, .asm_d2d3
.asm_d2c7
	inc hl
	jr .asm_d2b2

.asm_d2ca
	call GetPocketCapacity
	ld a, [de]
	cp c
	jr c, .asm_d2d3
	and a
	ret

.asm_d2d3
	ld h, d
	ld l, e
	ld a, [wd002]
	ld c, a
	ld a, [wd009]
	ld [wd00a], a
.asm_d2df
	inc hl
	ld a, [hli]
	cp $ff
	jr z, .asm_d2fc
	cp c
	jr nz, .asm_d2df
	ld a, [wd00a]
	add [hl]
	cp $64
	jr nc, .asm_d2f3
	ld [hl], a
	jr .asm_d30a

.asm_d2f3
	ld [hl], $63
	sub $63
	ld [wd00a], a
	jr .asm_d2df

.asm_d2fc
	dec hl
	ld a, [wd002]
	ld [hli], a
	ld a, [wd00a]
	ld [hli], a
	ld [hl], $ff
	ld h, d
	ld l, e
	inc [hl]
.asm_d30a
	scf
	ret

RemoveItemAndQuantity: ; d30c (3:530c)
	ld d, h
	ld e, l
	ld a, [hli]
	ld c, a
	ld a, [wd003]
	cp c
	jr nc, .asm_d325
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [wd002]
	cp [hl]
	inc hl
	jr z, .asm_d334
	ld h, d
	ld l, e
	inc hl
.asm_d325
	ld a, [wd002]
	ld b, a
.asm_d329
	ld a, [hli]
	cp b
	jr z, .asm_d334
	cp $ff
	jr z, .asm_d354
	inc hl
	jr .asm_d329

.asm_d334
	ld a, [wd009]
	ld b, a
	ld a, [hl]
	sub b
	jr c, .asm_d354
	ld [hl], a
	ld [wd00a], a
	and a
	jr nz, .asm_d352
	dec hl
	ld b, h
	ld c, l
	inc hl
	inc hl
.asm_d348
	ld a, [hli]
	ld [bc], a
	inc bc
	cp $ff
	jr nz, .asm_d348
	ld h, d
	ld l, e
	dec [hl]
.asm_d352
	scf
	ret

.asm_d354
	and a
	ret

CheckItemWithQuantity: ; d356 (3:5356)
	ld a, [wd002]
	ld c, a
.asm_d35a
	inc hl
	ld a, [hli]
	cp $ff
	jr z, .asm_d365
	cp c
	jr nz, .asm_d35a
	scf
	ret

.asm_d365
	and a
	ret

PutItemInKeyItemPocket: ; d367 (3:5367)
	ld hl, wItemsEnd
	ld a, [hli]
	cp $19
	jr nc, .asm_d37f
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wd002]
	ld [hli], a
	ld [hl], $ff
	ld hl, wNumKeyItems
	inc [hl]
	scf
	ret

.asm_d37f
	and a
	ret

RemoveItemWithoutQuantity: ; d381 (3:5381)
	ld a, [wd003]
	ld e, a
	ld d, $0
	ld hl, wItemsEnd
	ld a, [hl]
	cp e
	jr nc, .asm_d394
	call FindAndTossKeyItem
	ret nc
	jr .asm_d397

.asm_d394
	dec [hl]
	inc hl
	add hl, de
.asm_d397
	ld d, h
	ld e, l
	inc hl
.asm_d39a
	ld a, [hli]
	ld [de], a
	inc de
	cp $ff
	jr nz, .asm_d39a
	scf
	ret

FindAndTossKeyItem: ; d3a3 (3:53a3)
	ld hl, wItemsEnd
	ld a, [wd002]
	ld c, a
.asm_d3aa
	inc hl
	ld a, [hl]
	cp c
	jr z, .asm_d3b5
	cp $ff
	jr nz, .asm_d3aa
	xor a
	ret

.asm_d3b5
	ld a, [wNumKeyItems]
	dec a
	ld [wNumKeyItems], a
	scf
	ret

CheckItemWithoutQuantity: ; d3be (3:53be)
	ld a, [wd002]
	ld c, a
	ld hl, wKeyItems
.asm_d3c5
	ld a, [hli]
	cp c
	jr z, .asm_d3cf
	cp $ff
	jr nz, .asm_d3c5
	and a
	ret

.asm_d3cf
	scf
	ret

PutItemInTMPocket: ; d3d1 (3:53d1)
	dec c
	ld b, $0
	ld hl, wTMsHMs
	add hl, bc
	ld a, [wd009]
	add [hl]
	cp $64
	jr nc, .asm_d3e3
	ld [hl], a
	scf
	ret

.asm_d3e3
	and a
	ret

RemoveTMorHM: ; d3e5 (3:53e5)
	dec c
	ld b, $0
	ld hl, wTMsHMs
	add hl, bc
	ld a, [wd009]
	ld b, a
	ld a, [hl]
	sub b
	jr c, .asm_d406
	ld [hl], a
	ld [wd00a], a
	jr nz, .asm_d404
	ld a, [wcfd2]
	and a
	jr z, .asm_d404
	dec a
	ld [wcfd2], a
.asm_d404
	scf
	ret

.asm_d406
	and a
	ret

CheckTMorHM: ; d408 (3:5408)
	dec c
	ld b, $0
	ld hl, wTMsHMs
	add hl, bc
	ld a, [hl]
	and a
	ret z
	scf
	ret

GetTMHMNumber:: ; d414 (3:5414)
	ld a, c
	cp ITEM_C3
	jr c, .asm_d41f
	cp ITEM_DC
	jr c, .asm_d41e
	dec a
.asm_d41e
	dec a
.asm_d41f
	sub $bf
	inc a
	ld c, a
	ret

GetNumberedTM:
	ld a, c
	cp ITEM_C3 - (TM01 - 1)
	jr c, .asm_d42f
	cp ITEM_DC - (TM01 - 1) - 1
	jr c, .asm_d42e
	inc a
.asm_d42e
	inc a
.asm_d42f
	add TM01
	dec a
	ld c, a
	ret

CheckTossableItem_:: ; d434 (3:5434)
	ld a, $4
	call GetItemAttr
	bit 7, a
	jr nz, ItemAttr_ReturnCarry
	and a
	ret

CheckSelectableItem:
	ld a, $4
	call GetItemAttr
	bit 6, a
	jr nz, ItemAttr_ReturnCarry
	and a
	ret

CheckItemPocket: ; d44a (3:544a)
	ld a, $5
	call GetItemAttr
	and $f
	ld [wd03f], a
	ret

CheckItemContext:
	ld a, $6
	call GetItemAttr
	and $f
	ld [wd03f], a
	ret

CheckItemMenu:
	ld a, $6
	call GetItemAttr
	swap a
	and $f
	ld [wd03f], a
	ret

GetItemAttr: ; d46d (3:546d)
	push hl
	push bc
	ld hl, ItemAttributes
	ld c, a
	ld b, $0
	add hl, bc
	xor a
	ld [wd03f], a
	ld a, [wd002]
	dec a
	ld c, a
	ld a, $7
	call AddNTimes
	ld a, BANK(ItemAttributes)
	call GetFarByte
	pop bc
	pop hl
	ret

ItemAttr_ReturnCarry
	ld a, $1
	ld [wd03f], a
	scf
	ret

GetItemPrice:
	push hl
	push bc
	ld a, $0
	call GetItemAttr
	ld e, a
	ld a, $1
	call GetItemAttr
	ld d, a
	pop bc
	pop hl
	ret
