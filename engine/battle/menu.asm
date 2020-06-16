LoadBattleMenu:
	ld hl, BattleMenuHeader
	call LoadMenuHeader
	jr Function24e78

SafariBattleMenu:
; untranslated
	ld hl, MenuHeader_0x24eae
	call LoadMenuHeader
	jr Function24e78

ContestBattleMenu:
	ld hl, MenuHeader_0x24ee9
	call LoadMenuHeader
; fallthrough
Function24e78:
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call _2DMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call ExitMenu
	ret

BattleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24e93
	db 1 ; default option

MenuData_0x24e93:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 6 ; spacing
	dba Strings24e9c
	dbw BANK(MenuData_0x24e93), 0

Strings24e9c:
	db "FIGHT@"
	db "<PK><MN>@"
	db "PACK@"
	db "RUN@"

MenuHeader_0x24eae:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24eb6
	db 1 ; default option

MenuData_0x24eb6:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 11 ; spacing
	dba Strings24ebf
	dba Function24edc

Strings24ebf:
	db "サファりボール×　　@" ; "SAFARI BALL×  @"
	db "エサをなげる@" ; "THROW BAIT"
	db "いしをなげる@" ; "THROW ROCK"
	db "にげる@" ; "RUN"

Function24edc:
	hlcoord 17, 13
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

MenuHeader_0x24ee9:
	db MENU_BACKUP_TILES ; flags
	menu_coords 2, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24ef1
	db 1 ; default option

MenuData_0x24ef1:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 12 ; spacing
	dba Strings24efa
	dba Strings24f13

Strings24efa:
	db "FIGHT@"
	db "<PK><MN>@"
	db "PARKBALL×  @"
	db "RUN@"

Strings24f13:
	hlcoord 13, 16
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
