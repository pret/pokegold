DoItemEffect::
	farcall DoItemEffect_
	ret

CheckTossableItem::
	push hl
	push de
	push bc
	farcall CheckTossableItem_
	pop bc
	pop de
	pop hl
	ret

TossItem::
	push hl
	push de
	push bc
	ldh a, [hROMBank]
	push af
	ld a, BANK(TossItem_)
	rst Bankswitch
	call TossItem_
	pop bc
	ld a, b
	rst Bankswitch
	pop bc
	pop de
	pop hl
	ret

ReceiveItem::
	push bc
	ldh a, [hROMBank]
	push af
	ld a, BANK(ReceiveItem_)
	rst Bankswitch
	push hl
	push de
	call ReceiveItem_
	pop de
	pop hl
	pop bc
	ld a, b
	rst Bankswitch
	pop bc
	ret

CheckItem::
	push hl
	push de
	push bc
	ldh a, [hROMBank]
	push af
	ld a, BANK(CheckItem_)
	rst Bankswitch
	call CheckItem_
	pop bc
	ld a, b
	rst Bankswitch
	pop bc
	pop de
	pop hl
	ret
