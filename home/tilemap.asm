SetMenuAttributes:: ; 1a4e
	push hl
	push bc
	ld hl, w2DMenuCursorInitY
	ld b, $8
.asm_1a55
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_1a55
	ld a, $1
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	pop bc
	pop hl
	ret

StaticMenuJoypad:: ; 1a66 (0:1a66)
	callfar StaticMenuJoypad_
	call GetMenuJoypad
	ret

ScrollingMenuJoypad:: ; 1a70 (0:1a70)
	callfar ScrollingMenuJoypad_
	call GetMenuJoypad
	ret

GetMenuJoypad:: ; 1a7a (0:1a7a)
	push bc
	push af
	ld a, [hJoyLast]
	and D_PAD
	ld b, a
	ld a, [hJoyPressed]
	and BUTTONS
	or b
	ld b, a
	pop af
	ld a, b
	pop bc
	ret

PlaceHollowCursor::
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], "▷"
	ret

HideCursor::
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], " "
	ret

PushWindow:: ; 1a9d (0:1a9d)
	callfar PushWindow_
	ret

ExitMenu:: ; 1aa4 (0:1aa4)
	push af
	callfar ExitMenu_
	pop af
	ret

InitVerticalMenuCursor:: ; 1aad (0:1aad)
	callfar InitVerticalMenuCursor_
	ret

CloseWindow:: ; 1ab4 (0:1ab4)
	push af
	call ExitMenu
	call ApplyTilemap
	call UpdateSprites
	pop af
	ret

RestoreTileBackup::
	call MenuBoxCoord2Tile
	call GetMenuBoxDims
	inc b
	inc c
.asm_1ac8
	push bc
	push hl
.asm_1aca
	ld a, [de]
	ld [hli], a
	dec de
	dec c
	jr nz, .asm_1aca
	pop hl
	ld bc, $14
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_1ac8
	ret

PopWindow::
	ld b, wMenuDataHeaderEnd - wMenuDataHeader
	ld de, wMenuDataHeader
.asm_1adf
	ld a, [hld]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_1adf
	ret

GetMenuBoxDims:: ; 1ae6 (0:1ae6)
	ld a, [wMenuBorderTopCoord]
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	sub b
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	ld c, a
	ret

CopyMenuData2:: ; 1af9 (0:1af9)
	push hl
	push de
	push bc
	push af
	ld hl, wMenuData2Pointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wMenuData2
	ld bc, wMenuData2End - wMenuData2
	call CopyBytes
	pop af
	pop bc
	pop de
	pop hl
	ret

GetWindowStackTop::
	ld hl, wWindowStackPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

PlaceVerticalMenuItems:: ; 1b1c (0:1b1c)
	call CopyMenuData2
	ld hl, wMenuData2Pointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetMenuTextStartCoord
	call Coord2Tile
	inc de
	ld a, [de]
	inc de
	ld b, a
.asm_1b2f
	push bc
	call PlaceString
	inc de
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_1b2f
	ld a, [wMenuData2Flags]
	bit 4, a
	ret z
	call MenuBoxCoord2Tile
	ld a, [de]
	ld c, a
	inc de
	ld b, $0
	add hl, bc
	jp PlaceString

MenuBox:: ; 1b4e (0:1b4e)
	call MenuBoxCoord2Tile
	call GetMenuBoxDims
	dec b
	dec c
	jp TextBox

GetMenuTextStartCoord:: ; 1b59 (0:1b59)
	ld a, [wMenuBorderTopCoord]
	ld b, a
	inc b
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	inc c
	ld a, [wMenuData2Flags]
	bit 6, a
	jr nz, .asm_1b6b
	inc b
.asm_1b6b
	ld a, [wMenuData2Flags]
	bit 7, a
	jr z, .asm_1b73
	inc c
.asm_1b73
	ret

ClearMenuBoxInterior::
	call MenuBoxCoord2Tile
	ld bc, SCREEN_WIDTH + 1
	add hl, bc
	call GetMenuBoxDims
	dec b
	dec c
	call ClearBox
	ret

ClearWholeMenuBox::
	call MenuBoxCoord2Tile
	call GetMenuBoxDims
	inc c
	inc b
	call ClearBox
	ret

MenuBoxCoord2Tile:: ; 1b90 (0:1b90)
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderTopCoord]
	ld b, a
Coord2Tile:: ; 1b98 (0:1b98)
	xor a
	ld h, a
	ld l, b
	ld a, c
	ld b, h
	ld c, l
	add hl, hl
	add hl, hl
	add hl, bc
	add hl, hl
	add hl, hl
	ld c, a
	xor a
	ld b, a
	add hl, bc
	ld bc, wTileMap
	add hl, bc
	ret
