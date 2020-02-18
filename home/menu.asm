LoadMenuDataHeader:: ; 1bac (0:1bac)
	call CopyMenuDataHeader
	call PushWindow
	ret

CopyMenuDataHeader:: ; 1bb3 (0:1bb3)
	ld de, wMenuDataHeader
	ld bc, wMenuDataHeaderEnd - wMenuDataHeader
	call CopyBytes
	ret

StoreTo_wMenuCursorBuffer
	ld [wMenuCursorBuffer], a
	ret

MenuTextBox:: ; 1bc1 (0:1bc1)
	push hl
	call LoadMenuTextBox
	pop hl
	jp PrintText

; XXX
ret_1bc9
	ret

LoadMenuTextBox:: ; 1bca (0:1bca)
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	ret
.MenuDataHeader:
	db $40 ; tile backup
	db 12, 0 ; start coords
	db 17, 19 ; end coords
	dw $8000
	db 0 ; default option

MenuTextBoxBackup::
	call MenuTextBox
	call CloseWindow
	ret

LoadStandardMenuDataHeader::
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	ret

.MenuDataHeader: ; 1d75
	db $40 ; tile backup
	db 0, 0 ; start coords
	db 17, 19 ; end coords
	dw 0
	db 1 ; default option

Call_ExitMenu::
	call ExitMenu
	ret

VerticalMenu:: ; 1bf3 (0:1bf3)
	xor a
	ld [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call PlaceVerticalMenuItems
	call ApplyTilemap
	call CopyMenuData2
	ld a, [wMenuData2Flags]
	bit 7, a
	jr z, .asm_1c19
	call InitVerticalMenuCursor
	call StaticMenuJoypad
	call MenuClickSound
	bit 1, a
	jr z, .asm_1c1b
.asm_1c19
	scf
	ret
.asm_1c1b
	and a
	ret

GetMenu2::
	call LoadMenuDataHeader
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	ret

CopyNameFromMenu::
	push hl
	push bc
	push af
	ld hl, wMenuData2Pointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	pop af
	call GetNthString
	ld d, h
	ld e, l
	call CopyName1
	pop bc
	pop hl
	ret

YesNoBox::
	lb bc, SCREEN_WIDTH - 6, 7
PlaceYesNoBox::
	jr _YesNoBox

PlaceGenericTwoOptionBox::
	call LoadMenuDataHeader
	jr InterpretTwoOptionMenu

_YesNoBox::
	push bc
	ld hl, YesNoMenuDataHeader
	call CopyMenuDataHeader
	pop bc
	ld a, b
	ld [wMenuBorderLeftCoord], a
	add $5
	ld [wMenuBorderRightCoord], a
	ld a, c
	ld [wMenuBorderTopCoord], a
	add $4
	ld [wMenuBorderBottomCoord], a
	call PushWindow
InterpretTwoOptionMenu::
	call VerticalMenu
	push af
	ld c, $f
	call DelayFrames
	call CloseWindow
	pop af
	jr c, .asm_1c80
	ld a, [wMenuCursorY]
	cp $2
	jr z, .asm_1c80
	and a
	ret
.asm_1c80
	ld a, $2
	ld [wMenuCursorY], a
	scf
	ret
YesNoMenuDataHeader:: ; 1c87 (0:1c87)
	db $40 ; tile backup
	db 5, 10 ; start coords
	db 9, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2: ; 1e25
	db $c0 ; flags
	db 2
	db "YES@"
	db "NO@"

OffsetMenuDataHeader::
	call OffsetMenuDataHeader_
	call PushWindow
	ret

OffsetMenuDataHeader_:: ; 1c9f (0:1c9f)
	push de
	call CopyMenuDataHeader
	pop de
	ld a, [wMenuBorderLeftCoord]
	ld h, a
	ld a, [wMenuBorderRightCoord]
	sub h
	ld h, a
	ld a, d
	ld [wMenuBorderLeftCoord], a
	add h
	ld [wMenuBorderRightCoord], a
	ld a, [wMenuBorderTopCoord]
	ld l, a
	ld a, [wMenuBorderBottomCoord]
	sub l
	ld l, a
	ld a, e
	ld [wMenuBorderTopCoord], a
	add l
	ld [wMenuBorderBottomCoord], a
	ret

DoNthMenu::
	call DrawVariableLengthMenuBox
	call MenuWriteText
	call InitMenuCursorAndButtonPermissions
	call GetStaticMenuJoypad
	call GetMenuJoypad
	call MenuClickSound
	ret

SetUpMenu::
	call DrawVariableLengthMenuBox
	call MenuWriteText
	call InitMenuCursorAndButtonPermissions
	ld hl, wcedc
	set 7, [hl]
	ret

DrawVariableLengthMenuBox:: ; 1ce9 (0:1ce9)
	call CopyMenuData2
	call GetMenuIndexSet
	call AutomaticGetMenuBottomCoord
	call MenuBox
	ret

MenuWriteText:: ; 1cf6 (0:1cf6)
	xor a
	ld [hBGMapMode], a
	call GetMenuIndexSet
	call RunMenuItemPrintingFunction
	call SafeUpdateSprites
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call ApplyTilemap
	pop af
	ld [hOAMUpdate], a
	ret

AutomaticGetMenuBottomCoord:: ; 1d10 (0:1d10)
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	ld c, a
	ld a, [wMenuData2Items]
	add a
	inc a
	ld b, a
	ld a, [wMenuBorderTopCoord]
	add b
	ld [wMenuBorderBottomCoord], a
	ret

GetMenuIndexSet:: ; 1d27 (0:1d27)
	ld hl, wMenuData2IndicesPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wWhichIndexSet]
	and a
	jr z, .asm_1d3d
	ld b, a
	ld c, $ff
.asm_1d36
	ld a, [hli]
	cp c
	jr nz, .asm_1d36
	dec b
	jr nz, .asm_1d36
.asm_1d3d
	ld d, h
	ld e, l
	ld a, [hl]
	ld [wMenuData2Items], a
	ret

RunMenuItemPrintingFunction:: ; 1d44 (0:1d44)
	call MenuBoxCoord2Tile
	ld bc, 2 * SCREEN_WIDTH + 2
	add hl, bc
.asm_1d4b
	inc de
	ld a, [de]
	cp $ff
	ret z
	ld [wMenuSelection], a
	push de
	push hl
	ld d, h
	ld e, l
	ld hl, wMenuData2DisplayFunctionPointer
	call ._hl_
	pop hl
	ld de, $28
	add hl, de
	pop de
	jr .asm_1d4b

._hl_ ; 1d65 (0:1d65)
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

InitMenuCursorAndButtonPermissions:: ; 1d69 (0:1d69)
	call InitVerticalMenuCursor
	ld hl, wMenuJoypadFilter
	ld a, [wMenuData2Flags]
	bit 3, a
	jr z, .asm_1d78
	set 3, [hl]
.asm_1d78
	ld a, [wMenuData2Flags]
	bit 2, a
	jr z, .asm_1d83
	set 5, [hl]
	set 4, [hl]
.asm_1d83
	ret

GetScrollingMenuJoypad::
	call ScrollingMenuJoypad
	ld hl, wMenuJoypadFilter
	and [hl]
	jr ContinueGettingMenuJoypad

GetStaticMenuJoypad:: ; 1d8d (0:1d8d)
	xor a
	ld [wMenuJoypad], a
	call StaticMenuJoypad
ContinueGettingMenuJoypad::
	bit 0, a
	jr nz, .asm_1dbc
	bit 1, a
	jr nz, .asm_1dd7
	bit 3, a
	jr nz, .asm_1dd7
	bit 4, a
	jr nz, .asm_1dae
	bit 5, a
	jr nz, .asm_1db5
	xor a
	ld [wMenuJoypad], a
	jr .asm_1dc1
.asm_1dae
	ld a, $10
	ld [wMenuJoypad], a
	jr .asm_1dc1
.asm_1db5
	ld a, $20
	ld [wMenuJoypad], a
	jr .asm_1dc1
.asm_1dbc
	ld a, $1
	ld [wMenuJoypad], a
.asm_1dc1
	call GetMenuIndexSet
	ld a, [wMenuCursorY]
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hl]
	ld [wMenuSelection], a
	ld a, [wMenuCursorY]
	ld [wMenuCursorBuffer], a
	and a
	ret
.asm_1dd7
	ld a, $2
	ld [wMenuJoypad], a
	ld a, $ff
	ld [wMenuSelection], a
	scf
	ret

PlaceMenuStrings::
	push de
	ld hl, wMenuData2PointerTableAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMenuSelection]
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ret

PlaceNthMenuStrings::
	push de
	ld a, [wMenuSelection]
	call GetMenuDataPointerTableEntry
	inc hl
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	call PlaceString
	ret

Function1e08::
	call GetMenuDataPointerTableEntry
	inc hl
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

MenuJumptable::
	ld a, [wMenuSelection]
	call GetMenuDataPointerTableEntry
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

GetMenuDataPointerTableEntry:: ; 1e1b (0:1e1b)
	ld e, a
	ld d, $0
	ld hl, wMenuData2PointerTableAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ret

ClearWindowData::
	ld hl, wWindowData
	call .bytefill
	ld hl, wMenuDataHeader
	call .bytefill
	ld hl, wMenuData2
	call .bytefill
	ld hl, wMenuData3
	call .bytefill
	xor a
	call OpenSRAM
	xor a
	ld hl, sWindowStackTop
	ld [hld], a
	ld [hld], a
	ld a, l
	ld [wWindowStackPointer], a
	ld a, h
	ld [wWindowStackPointer + 1], a
	call CloseSRAM
	ret

.bytefill
	ld bc, $10
	xor a
	call ByteFill
	ret

MenuClickSound:: ; 1e5f (0:1e5f)
	push af
	and $3
	jr z, .asm_1e6e
	ld hl, wMenuDataHeader
	bit 3, a
	jr nz, .asm_1e6e
	call PlayClickSFX
.asm_1e6e
	pop af
	ret
PlayClickSFX:: ; 1e70 (0:1e70)
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret

MenuTextBoxWaitButton::
	call MenuTextBox
	call WaitButton
	call ExitMenu
	ret

Place2DMenuItemName::
	ld [wBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [wBuffer]
	rst Bankswitch
	call PlaceString
	pop af
	rst Bankswitch
	ret

_2DMenu::
	call CopyMenuData2
	ld a, [hROMBank]
	ld [wMenuDataBank], a
	push af
	ld a, BANK(_2DMenu_)
	rst Bankswitch
	call _2DMenu_
	pop bc
	ld a, b
	rst Bankswitch
	ld a, [wMenuCursorBuffer]
	ret

ResetBGWindow::
	xor a
	ld [hBGMapMode], a
	ld a, $90
	ld [rWY], a
	ld [hWY], a
	ret
