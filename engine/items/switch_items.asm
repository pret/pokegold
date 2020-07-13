SwitchItemsInBag:
	ld a, [wSwitchItem]
	and a
	jr z, .init
	ld b, a
	ld a, [wScrollingMenuCursorPosition]
	inc a
	cp b
	jr z, .trivial
	ld a, [wScrollingMenuCursorPosition]
	call ItemSwitch_GetNthItem
	ld a, [hl]
	cp -1
	ret z
	ld a, [wSwitchItem]
	dec a
	ld [wSwitchItem], a
	call Function248cf
	jp c, Function248f9
	ld a, [wScrollingMenuCursorPosition]
	ld c, a
	ld a, [wSwitchItem]
	cp c
	jr c, .asm_248a2
	jr .asm_24872

.init
	ld a, [wScrollingMenuCursorPosition]
	inc a
	ld [wSwitchItem], a
	ret

.trivial
	xor a
	ld [wSwitchItem], a
	ret

.asm_24872
	ld a, [wSwitchItem]
	call Function24968
	ld a, [wScrollingMenuCursorPosition]
	ld d, a
	ld a, [wSwitchItem]
	ld e, a
	call Function24994
	push bc
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	dec hl
	push hl
	call ItemSwitch_ConvertItemFormatToDW
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	pop bc
	call Function249d3
	ld a, [wScrollingMenuCursorPosition]
	call Function24975
	xor a
	ld [wSwitchItem], a
	ret

.asm_248a2
	ld a, [wSwitchItem]
	call Function24968
	ld a, [wScrollingMenuCursorPosition]
	ld d, a
	ld a, [wSwitchItem]
	ld e, a
	call Function24994
	push bc
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	ld d, h
	ld e, l
	call ItemSwitch_ConvertItemFormatToDW
	add hl, bc
	pop bc
	call CopyBytes
	ld a, [wScrollingMenuCursorPosition]
	call Function24975
	xor a
	ld [wSwitchItem], a
	ret

Function248cf:
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	ld d, h
	ld e, l
	ld a, [wScrollingMenuCursorPosition]
	call ItemSwitch_GetNthItem
	ld a, [de]
	cp [hl]
	jr nz, .asm_248f5
	ld a, [wScrollingMenuCursorPosition]
	call Function249bf
	cp MAX_ITEM_STACK
	jr z, .asm_248f5
	ld a, [wSwitchItem]
	call Function249bf
	cp MAX_ITEM_STACK
	jr nz, .asm_248f7
.asm_248f5
	and a
	ret

.asm_248f7
	scf
	ret

Function248f9:
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	inc hl
	push hl
	ld a, [wScrollingMenuCursorPosition]
	call ItemSwitch_GetNthItem
	inc hl
	ld a, [hl]
	pop hl
	add [hl]
	cp MAX_ITEM_STACK + 1
	jr c, .asm_24929
	sub MAX_ITEM_STACK
	push af
	ld a, [wScrollingMenuCursorPosition]
	call ItemSwitch_GetNthItem
	inc hl
	ld [hl], MAX_ITEM_STACK
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	inc hl
	pop af
	ld [hl], a
	xor a
	ld [wSwitchItem], a
	ret

.asm_24929
	push af
	ld a, [wScrollingMenuCursorPosition]
	call ItemSwitch_GetNthItem
	inc hl
	pop af
	ld [hl], a
	ld hl, wMenuData_ItemsPointerAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wSwitchItem]
	cp [hl]
	jr nz, .asm_2494d
	dec [hl]
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	ld [hl], $ff
	xor a
	ld [wSwitchItem], a
	ret

.asm_2494d
	dec [hl]
	call ItemSwitch_ConvertItemFormatToDW
	push bc
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	pop bc
	push hl
	add hl, bc
	pop de
.asm_2495c
	ld a, [hli]
	ld [de], a
	inc de
	cp $ff
	jr nz, .asm_2495c
	xor a
	ld [wSwitchItem], a
	ret

Function24968:
	call ItemSwitch_GetNthItem
	ld de, wceed
	call ItemSwitch_ConvertItemFormatToDW
	call CopyBytes
	ret

Function24975:
	call ItemSwitch_GetNthItem
	ld d, h
	ld e, l
	ld hl, wceed
	call ItemSwitch_ConvertItemFormatToDW
	call CopyBytes
	ret

ItemSwitch_GetNthItem:
	push af
	call ItemSwitch_ConvertItemFormatToDW
	ld hl, wMenuData_ItemsPointerAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	pop af
	call AddNTimes
	ret

Function24994:
	push hl
	call ItemSwitch_ConvertItemFormatToDW
	ld a, d
	sub e
	jr nc, .dont_negate
	dec a
	cpl
.dont_negate
	ld hl, 0
	call AddNTimes
	ld b, h
	ld c, l
	pop hl
	ret

ItemSwitch_ConvertItemFormatToDW:
	push hl
	ld a, [wMenuData_ScrollingMenuItemFormat]
	ld c, a
	ld b, 0
	ld hl, .format_dws
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop hl
	ret

.format_dws
	dw 0
	dw 1
	dw 2

Function249bf:
	push af
	call ItemSwitch_ConvertItemFormatToDW
	ld a, c
	cp 2
	jr nz, .not_2
	pop af
	call ItemSwitch_GetNthItem
	inc hl
	ld a, [hl]
	ret

.not_2
	pop af
	ld a, $1
	ret

Function249d3:
.loop
	ld a, [hld]
	ld [de], a
	dec de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret
