Function10430:
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	call Function10aba
.asm_10438
	call JoyTextDelay
	ld a, [wce63]
	bit 7, a
	jr nz, .asm_1044a
	call Function10456
	call DelayFrame
	jr .asm_10438

.asm_1044a
	ld a, [wce65]
	ld [wcfc8], a
	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	ret

Function10456: ; 10456 (4:4456)
	ld a, [wce63]
	ld hl, .Jumptable ; $4460
	call Function10c9b
	jp hl

.Jumptable
	dw Pack_InitGFX
	dw Pack_InitItemsPocket
	dw Pack_ItemsPocketMenu
	dw Pack_InitBallsPocket
	dw Pack_BallsPocketMenu
	dw Pack_InitKeyItemsPocket
	dw Pack_KeyItemsPocketMenu
	dw Pack_InitTMHMPocket
	dw Pack_TMHMPocketMenu
	dw Pack_ExitNoScript
	dw Pack_ExitRunScript

Pack_InitGFX:
	xor a
	ld [hBGMapMode], a
	call Function10d70
	ld a, [wce64]
	ld [wce63], a
	call Function10e5b
	ret

Pack_InitItemsPocket:
	xor a
	ld [wce65], a
	call Function10e51
	call Function10dd6
	call Function10cca
	call Function10c96
	ret

Pack_ItemsPocketMenu:
	ld hl, ItemsPocketMenuDataHeader
	call CopyMenuDataHeader
	ld a, [wcfca]
	ld [wMenuCursorBuffer], a
	ld a, [wcfcf]
	ld [wcfd4], a
	call ScrollingMenu
	ld a, [wcfd4]
	ld [wcfcf], a
	ld a, [wMenuCursorY]
	ld [wcfca], a
.asm_104b7
	ld b, $7
	ld c, $3
	call Function10cef
	ret c
	call Function105f5
	ret

Pack_InitKeyItemsPocket:
	ld a, $2
	ld [wce65], a
	call Function10e51
	call Function10dd6
	call Function10cca
	call Function10c96
	ret

Pack_KeyItemsPocketMenu:
	ld hl, KeyItemsPocketMenuDataHeader ; $4e9a
	call CopyMenuDataHeader
	ld a, [wcfcb]
	ld [wMenuCursorBuffer], a
	ld a, [wcfd0]
	ld [wcfd4], a
	call ScrollingMenu
	ld a, [wcfd4]
	ld [wcfd0], a
	ld a, [wMenuCursorY]
	ld [wcfcb], a
	ld b, $3
	ld c, $7
	call Function10cef
	ret c
	call Function105f5
	ret

Pack_InitTMHMPocket:
	ld a, $3
	ld [wce65], a
	call Function10e51
	call Function10dd6
	xor a
	ld [hBGMapMode], a
	call Function10cca
	call Function10c96
	ret

Pack_TMHMPocketMenu:
	farcall Pack_TMHMPocketMenu_
	ld b, $5
	ld c, $1
	call Function10cef
	ret c
	farcall CheckTossableItem_
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .asm_1053a
	ld hl, TMHMPocketSubmenuDataHeader_Give ; $456b
	ld de, TMHMPocketSubmenuJumptable_Give ; $4583
	jr .asm_10540

.asm_1053a
	ld hl, TMHMPocketSubmenuDataHeader_NoGive ; $4554
	ld de, TMHMPocketSubmenuJumptable_NoGive ; $4567
.asm_10540
	push de
	call LoadMenuDataHeader
	call VerticalMenu
	call ExitMenu
	pop hl
	ret c
	ld a, [wMenuCursorY]
	dec a
	call Function10c9b
	jp hl

TMHMPocketSubmenuDataHeader_NoGive:
	db $40
	db 07, 00
	db 11, 06
	dw .MenuData2
	db 1

.MenuData2:
	db $c0
	db 2
	db "USE@"
	db "QUIT@"

TMHMPocketSubmenuJumptable_NoGive:
	dw UseTMorHM
	dw QuitItemSubmenu

TMHMPocketSubmenuDataHeader_Give:
	db $40
	db 05, 00
	db 11, 06
	dw .MenuData2
	db 1

.MenuData2:
	db $c0
	db 3
	db "USE@"
	db "GIVE@"
	db "QUIT@"

TMHMPocketSubmenuJumptable_Give:
	dw UseTMorHM
	dw GiveItem
	dw QuitItemSubmenu

UseTMorHM:
	farcall AskTeachTMHM
	ret c
	farcall ChooseMonToLearnTMHM
	jr c, .asm_105a9
	ld hl, wOptions
	ld a, [hl]
	push af
	res 4, [hl]
	farcall TeachTMHM
	pop af
	ld [wOptions], a
.asm_105a9
	xor a
	ld [hBGMapMode], a
	call Function10d70
	call Function10cca
	call Function10e5b
	ret

Pack_InitBallsPocket:
	ld a, $1
	ld [wce65], a
	call Function10e51
	call Function10dd6
	call Function10cca
	call Function10c96
	ret

Pack_BallsPocketMenu:
	ld hl, BallsPocketMenuDataHeader ; $4eca
	call CopyMenuDataHeader
	ld a, [wcfcc]
	ld [wMenuCursorBuffer], a
	ld a, [wcfd1]
	ld [wcfd4], a
	call ScrollingMenu
	ld a, [wcfd4]
	ld [wcfd1], a
	ld a, [wMenuCursorY]
	ld [wcfcc], a
	ld b, $1
	ld c, $5
	call Function10cef
	ret c
	call Function105f5
	ret

Function105f5: ; 105f5 (4:45f5)
	farcall CheckTossableItem_
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .asm_10629
	farcall CheckSelectableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .asm_1061b
	farcall CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .asm_10637
	jr .asm_10657

.asm_1061b
	farcall CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .asm_1063f
	jr .asm_1065f

.asm_10629
	farcall CheckSelectableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .asm_10647
	jr .asm_1064f

.asm_10637
	ld hl, ItemSubmenuDataHeader_UseGiveTossSelQuit ; $4679
	ld de, ItemSubmenuJumptable_UseGiveTossSelQuit ; $469a
	jr .asm_10665

.asm_1063f
	ld hl, ItemSubmenuDataHeader_UseGiveTossQuit ; $46a4
	ld de, ItemSubmenuJumptable_UseGiveTossQuit ; $46c1
	jr .asm_10665

.asm_10647
	ld hl, ItemSubmenuDataHeader_UseQuit ; $46c9
	ld de, ItemSubmenuJumptable_UseQuit ; $46dc
	jr .asm_10665

.asm_1064f
	ld hl, ItemSubmenuDataHeader_UseSelQuit ; $46e0
	ld de, ItemSubmenuJumptable_UseSelQuit ; $46f7
	jr .asm_10665

.asm_10657
	ld hl, ItemSubmenuDataHeader_GiveTossSelQuit ; $46fd
	ld de, ItemSubmenuJumptable_GiveTossSelQuit ; $471a
	jr .asm_10665

.asm_1065f
	ld hl, ItemSubmenuDataHeader_GiveTossQuit ; $4722
	ld de, ItemSubmenuJumptable_GiveTossQuit ; $473b
.asm_10665
	push de
	call LoadMenuDataHeader
	call VerticalMenu
	call ExitMenu
	pop hl
	ret c
	ld a, [wMenuCursorY]
	dec a
	call Function10c9b
	jp hl

ItemSubmenuDataHeader_UseGiveTossSelQuit:
	db $40 ; flags
	db 02, 00 ; start coords
	db 12, 06 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $c0 ; flags
	db 5 ; items
	db "USE@"
	db "GIVE@"
	db "TOSS@"
	db "SEL@"
	db "QUIT@"

ItemSubmenuJumptable_UseGiveTossSelQuit:
	dw UseItem
	dw GiveItem
	dw TossMenu
	dw RegisterItem
	dw QuitItemSubmenu

ItemSubmenuDataHeader_UseGiveTossQuit:
	db $40 ; flags
	db 03, 00 ; start coords
	db 11, 06 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $c0 ; flags
	db 4 ; items
	db "USE@"
	db "GIVE@"
	db "TOSS@"
	db "QUIT@"

ItemSubmenuJumptable_UseGiveTossQuit:
	dw UseItem
	dw GiveItem
	dw TossMenu
	dw QuitItemSubmenu

ItemSubmenuDataHeader_UseQuit:
	db %01000000 ; flags
	db 07, 00 ; start coords
	db 11, 06 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $c0 ; flags
	db 2 ; items
	db "USE@"
	db "QUIT@"

ItemSubmenuJumptable_UseQuit:
	dw UseItem
	dw QuitItemSubmenu

ItemSubmenuDataHeader_UseSelQuit:
	db %01000000 ; flags
	db 05, 00 ; start coords
	db 11, 06 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $c0 ; flags
	db 3 ; items
	db "USE@"
	db "SEL@"
	db "QUIT@"

ItemSubmenuJumptable_UseSelQuit:
	dw UseItem
	dw RegisterItem
	dw QuitItemSubmenu

ItemSubmenuDataHeader_GiveTossSelQuit:
	db $40 ; flags
	db 03, 00 ; start coords
	db 11, 06 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $c0 ; flags
	db 4 ; items
	db "GIVE@"
	db "TOSS@"
	db "SEL@"
	db "QUIT@"

ItemSubmenuJumptable_GiveTossSelQuit:
	dw GiveItem
	dw TossMenu
	dw RegisterItem
	dw QuitItemSubmenu

ItemSubmenuDataHeader_GiveTossQuit:
	db $40 ; flags
	db 05, 00 ; start coords
	db 11, 06 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $c0 ; flags
	db 3 ; items
	db "GIVE@"
	db "TOSS@"
	db "QUIT@"

ItemSubmenuJumptable_GiveTossQuit:
	dw GiveItem
	dw TossMenu
	dw QuitItemSubmenu

UseItem:
	farcall CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable
	dw .NotTheTime
	dw .NotTheTime
	dw .NotTheTime
	dw .NotTheTime
	dw .Current
	dw .Party
	dw .Field

.NotTheTime
	ld hl, Text_ThisIsntTheTime
	call Function10cb9
	ret

.Current
	call DoItemEffect
	ret

.Party
	ld a, [wPartyCount]
	and a
	jr z, .no_pokemon
	call DoItemEffect
	xor a
	ld [hBGMapMode], a
	call Function10d70
	call Function10cca
	call Function10e5b
	ret

.no_pokemon
	ld hl, Text_YouDontHaveAPokemon
	call Function10cb9
	ret

.Field
	call DoItemEffect
	ld a, [wFieldMoveSucceeded]
	and a
	jr z, .NotTheTime
	ld a, $a
	ld [wce63], a
	ret

TossMenu:
	ld hl, Text_ThrowAwayHowMany
	call Function10cb9
	farcall SelectQuantityToToss ; 9:4f20
	push af
	call ExitMenu
	pop af
	jr c, .asm_107cc
	call Function10e38
	ld hl, Text_ConfirmThrowAway
	call MenuTextBox
	call YesNoBox
	push af
	call ExitMenu
	pop af
	jr c, .asm_107cc
	ld hl, wTMsHMsEnd
	ld a, [wd003]
	call TossItem
	call Function10e38
	ld hl, Text_ThrewAway
	call Function10cb9
.asm_107cc
	ret

Function107cd:
	ld a, [wce65]
	and a
	jr z, .asm_107e2
	dec a
	jr z, .asm_107da
	dec a
	jr z, .asm_107ea
	ret

.asm_107da
	xor a
	ld [wcfcc], a
	ld [wcfd1], a
	ret

.asm_107e2
	xor a
	ld [wcfca], a
	ld [wcfcf], a
	ret

.asm_107ea
	xor a
	ld [wcfcb], a
	ld [wcfd0], a
	ret

RegisterItem:
	farcall CheckSelectableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .asm_10826
	ld a, [wce65]
	rrca
	rrca
	and $c0
	ld b, a
	ld a, [wd003]
	inc a
	and $3f
	or b
	ld [wWhichRegisteredItem], a
	ld a, [wd002]
	ld [wRegisteredItem], a
	call Function10e38
	ld de, SFX_FULL_HEAL
	call WaitPlaySFX
	ld hl, Text_RegisteredTheItem
	call Function10cb9
	ret

.asm_10826
	ld hl, Text_CantRegisterThatItem
	call Function10cb9
	ret

GiveItem:
	ld a, [wPartyCount]
	and a
	jp z, Function108b6
	ld a, [wOptions]
	push af
	res 4, a
	ld [wOptions], a
	ld a, $8
	ld [wPartyMenuActionText], a
	call ClearBGPalettes
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX
.asm_10857
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	farcall PartyMenuSelect
	jr c, .asm_108a5
	ld a, [wCurPartySpecies]
	cp EGG
	jr nz, .asm_10883
	ld hl, Text_AnEggCantHoldAnItem
	call PrintText
	jr .asm_10857

.asm_10883
	ld a, [wce63]
	push af
	ld a, [wce64]
	push af
	call GetCurNick
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, $b
	call CopyBytes
	call Function12fa0
	pop af
	ld [wce64], a
	pop af
	ld [wce63], a
.asm_108a5
	pop af
	ld [wOptions], a
	xor a
	ld [hBGMapMode], a
	call Function10d70
	call Function10cca
	call Function10e5b
	ret

Function108b6: ; 108b6 (4:48b6)
	ld hl, Text_YouDontHaveAPokemon ; $4f13
	call Function10cb9
	ret

Text_AnEggCantHoldAnItem:
	text_far Text_AnEGGCantHoldAnItem
	db "@"

QuitItemSubmenu:
	ret

BattlePack:
	ld hl, wOptions
	set 4, [hl]
	call Function10aba
.asm_108cb
	call JoyTextDelay
	ld a, [wce63]
	bit 7, a
	jr nz, .asm_108dd
	call Function108e9
	call DelayFrame
	jr .asm_108cb

.asm_108dd
	ld a, [wce65]
	ld [wcfc8], a
	ld hl, wOptions
	res 4, [hl]
	ret

Function108e9: ; 108e9 (4:48e9)
	ld a, [wce63]
	ld hl, .Jumptable
	call Function10c9b
	jp hl

.Jumptable
	dw BattlePack_InitGFX
	dw BattlePack_InitItemsPocket
	dw BattlePack_ItemsPocketMenu
	dw BattlePack_InitBallsPocket
	dw BattlePack_BallsPocketMenu
	dw BattlePack_InitKeyItemsPocket
	dw BattlePack_KeyItemsPocketMenu
	dw BattlePack_InitTMHMPocket
	dw BattlePack_TMHMPocketMenu
	dw Pack_ExitNoScript
	dw Pack_ExitRunScript

BattlePack_InitGFX:
	xor a
	ld [hBGMapMode], a
	call Function10d70
	ld a, [wce64]
	ld [wce63], a
	call Function10e5b
	ret

BattlePack_InitItemsPocket:
	xor a
	ld [wce65], a
	call Function10e51
	call Function10dd6
	call Function10cca
	call Function10c96
	ret

BattlePack_ItemsPocketMenu:
	ld hl, $4e6a
	call CopyMenuDataHeader
	ld a, [wcfca]
	ld [wMenuCursorBuffer], a
	ld a, [wcfcf]
	ld [wcfd4], a
	call ScrollingMenu
	ld a, [wcfd4]
	ld [wcfcf], a
	ld a, [wMenuCursorY]
	ld [wcfca], a
	ld b, $7
	ld c, $3
	call Function10cef
	ret c
	call Function10a03
	ret

BattlePack_InitKeyItemsPocket:
	ld a, $2
	ld [wce65], a
	call Function10e51
	call Function10dd6
	call Function10cca
	call Function10c96
	ret

BattlePack_KeyItemsPocketMenu:
	ld hl, $4e9a
	call CopyMenuDataHeader
	ld a, [wcfcb]
	ld [wMenuCursorBuffer], a
	ld a, [wcfd0]
	ld [wcfd4], a
	call ScrollingMenu
	ld a, [wcfd4]
	ld [wcfd0], a
	ld a, [wMenuCursorY]
	ld [wcfcb], a
	ld b, $3
	ld c, $7
	call Function10cef
	ret c
	call Function10a03
	ret

BattlePack_InitTMHMPocket:
	ld a, $3
	ld [wce65], a
	call Function10e51
	call Function10dd6
	xor a
	ld [hBGMapMode], a
	call Function10cca
	ld hl, Text_PackEmptyString
	call Function10cb9
	call Function10c96
	ret

BattlePack_TMHMPocketMenu:
	farcall Pack_TMHMPocketMenu_ ; b:457a
	ld b, $5
	ld c, $1
	call Function10cef
	ret c
	xor a
	call Function10a0c
	ret

BattlePack_InitBallsPocket:
	ld a, $1
	ld [wce65], a
	call Function10e51
	call Function10dd6
	call Function10cca
	call Function10c96
	ret

BattlePack_BallsPocketMenu:
	ld hl, $4eca
	call CopyMenuDataHeader
	ld a, [wcfcc]
	ld [wMenuCursorBuffer], a
	ld a, [wcfd1]
	ld [wcfd4], a
	call ScrollingMenu
	ld a, [wcfd4]
	ld [wcfd1], a
	ld a, [wMenuCursorY]
	ld [wcfcc], a
	ld b, $1
	ld c, $5
	call Function10cef
	ret c
	call Function10a03
	ret

Function10a03: ; 10a03 (4:4a03)
	farcall CheckItemContext
	ld a, [wItemAttributeParamBuffer]
Function10a0c: ; 10a0c (4:4a0c)
	and a
	jr z, .asm_10a17
	ld hl, BattlePackUseQuitMenuDataHeader
	ld de, BattlePackUseQuitJumptable
	jr .asm_10a1d

.asm_10a17
	ld hl, BattlePackQuitMenuDataHeader
	ld de, BattlePackQuitJumptable
.asm_10a1d
	push de
	call LoadMenuDataHeader
	call VerticalMenu
	call ExitMenu
	pop hl
	ret c
	ld a, [wMenuCursorY]
	dec a
	call Function10c9b
	jp hl

BattlePackUseQuitMenuDataHeader:
	db $40 ; flags
	db 07, 00 ; start coords
	db 11, 06 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $c0 ; flags
	db 2 ; items
	db "USE@"
	db "QUIT@"

BattlePackUseQuitJumptable:
	dw BattlePack_UseItem
	dw BattlePack_QuitSubmenu

BattlePackQuitMenuDataHeader:
	db $40 ; flags
	db 09, 00 ; start coords
	db 11, 06 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $c0 ; flags
	db 1 ; items
	db "QUIT@"

BattlePackQuitJumptable:
	dw BattlePack_QuitSubmenu

BattlePack_UseItem:
	farcall CheckItemContext
	ld a, [wItemAttributeParamBuffer]
	ld hl, $4a67
	rst JumpTable
	ret

	dw Function10a75
	dw Function10a75
	dw Function10a75
	dw Function10a75
	dw Function10a7c
	dw Function10a86
	dw Function10aa1

Function10a75:
	ld hl, Text_ThisIsntTheTime
	call Function10cb9
	ret

Function10a7c:
	call DoItemEffect
	ld a, [wFieldMoveSucceeded]
	and a
	jr nz, asm_10a9c
	ret

Function10a86:
	call DoItemEffect
	ld a, [wFieldMoveSucceeded]
	and a
	jr nz, asm_10aae
	xor a
	ld [hBGMapMode], a
	call Function10d70
	call Function10cca
	call Function10e5b
	ret

asm_10a9c
	call ClearBGPalettes
	jr asm_10aae

Function10aa1
	call DoItemEffect
	ld a, [wFieldMoveSucceeded]
	and a
	jr z, Function10a75
	cp $2
	jr z, asm_10ab4
asm_10aae
	ld a, $a
	ld [wce63], a
	ret

asm_10ab4
	xor a
	ld [wFieldMoveSucceeded], a
	ret

BattlePack_QuitSubmenu:
	ret

Function10aba: ; 10aba (4:4aba)
	xor a
	ld [wce63], a
	ld a, [wcfc8]
	and $3
	ld [wce65], a
	inc a
	add a
	dec a
	ld [wce64], a
	xor a
	ld [wce66], a
	xor a
	ld [wcfd3], a
	ret

Function10ad5: ; 10ad5 (4:4ad5)
	xor a
	ld [hBGMapMode], a
	ld [wce63], a
	ld [wce64], a
	ld [wce65], a
	ld [wce66], a
	ld [wcfd3], a
	call Function10d70
	call Function10e5b
	ret

.asm_10aee
	call Function10af7
	call Function10b9f
	jr c, .asm_10aee
	ret

Function10af7: ; 10af7 (4:4af7)
	ld a, [wce63]
	ld hl, .Jumptable
	call Function10c9b
	jp hl

.Jumptable
	dw DepositOrSell_ItemPocket
	dw DepositOrSell_BallsPocket
	dw DepositOrSell_KeyItemsPocket
	dw DepositOrSell_TMHMPocket

DepositOrSell_ItemPocket:
	xor a
	call Function10b92
	ld hl, PC_Mart_ItemsPocketMenuDataHeader ; $4e82
	call CopyMenuDataHeader
	ld a, [wcfca]
	ld [wMenuCursorBuffer], a
	ld a, [wcfcf]
	ld [wcfd4], a
	call ScrollingMenu
	ld a, [wcfd4]
	ld [wcfcf], a
	ld a, [wMenuCursorY]
	ld [wcfca], a
	ret

DepositOrSell_KeyItemsPocket:
	ld a, $2
	call Function10b92
	ld hl, PC_Mart_KeyItemsPocketMenuDataHeader ; $4eb2
	call CopyMenuDataHeader
	ld a, [wcfcb]
	ld [wMenuCursorBuffer], a
	ld a, [wcfd0]
	ld [wcfd4], a
	call ScrollingMenu
	ld a, [wcfd4]
	ld [wcfd0], a
	ld a, [wMenuCursorY]
	ld [wcfcb], a
	ret

DepositOrSell_TMHMPocket:
	ld a, $3
	call Function10b92
	call Function10cca
	farcall Pack_TMHMPocketMenu_ ; b:457a
	ld a, [wd002]
	ld [wd002], a
	ret

DepositOrSell_BallsPocket:
	ld a, $1
	call Function10b92
	ld hl, PC_Mart_BallsPocketMenuDataHeader ; $4ee2
	call CopyMenuDataHeader
	ld a, [wcfcc]
	ld [wMenuCursorBuffer], a
	ld a, [wcfd1]
	ld [wcfd4], a
	call ScrollingMenu
	ld a, [wcfd4]
	ld [wcfd1], a
	ld a, [wMenuCursorY]
	ld [wcfcc], a
	ret

Function10b92: ; 10b92 (4:4b92)
	ld [wce65], a
	call Function10e51
	call Function10dd6
	call Function10cca
	ret

Function10b9f: ; 10b9f (4:4b9f)
	ld hl, wMenuJoypad
	ld a, [hl]
	and $1
	jr nz, .asm_10bb8
	ld a, [hl]
	and $2
	jr nz, .asm_10bbf
	ld a, [hl]
	and $20
	jr nz, .asm_10bc5
	ld a, [hl]
	and $10
	jr nz, .asm_10bd8
	scf
	ret

.asm_10bb8
	ld a, $1
	ld [wce66], a
	and a
	ret

.asm_10bbf
	xor a
	ld [wce66], a
	and a
	ret

.asm_10bc5
	ld a, [wce63]
	dec a
	and $3
	ld [wce63], a
	push de
	ld de, $62
	call PlaySFX
	pop de
	scf
	ret

.asm_10bd8
	ld a, [wce63]
	inc a
	and $3
	ld [wce63], a
	push de
	ld de, $62
	call PlaySFX
	pop de
	scf
	ret

TutorialPack:
	call Function10ad5
	ld a, [wInputType]
	or a
	jr z, .asm_10bfa
	farcall DudeAutoInput_RightA ; 70:4dee
.asm_10bfa
	call Function10c07
	call Function10b9f
	jr c, .asm_10bfa
	xor a
	ld [wce66], a
	ret

Function10c07: ; 10c07 (4:4c07)
	ld a, [wce63]
	ld hl, $4c11
	call Function10c9b
	jp hl

.Jumptable
	dw TutorialItems
	dw TutorialBalls
	dw TutorialKeyItems
	dw TutorialTMHM

TutorialItems:
	xor a
	ld hl, TutorialItemsMenuDataHeader
	jr asm_10c8a

TutorialItemsMenuDataHeader:
	db $40 ; flags
	db 01, 07 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $ae ; flags
	db 5, 8 ; rows, columns
	db 2 ; horizontal spacing
	dbw 0, wDudeNumItems
	dba PlaceMenuItemName
	dba PlaceMenuItemQuantity
	dba UpdateItemDescription

TutorialKeyItems:
	ld a, $2
	ld hl, TutorialKeyItemsMenuDataHeader
	jr asm_10c8a

TutorialKeyItemsMenuDataHeader:
	db $40 ; flags
	db 01, 07 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $ae ; flags
	db 5, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wDudeNumKeyItems
	dba PlaceMenuItemName
	dba PlaceMenuItemQuantity
	dba UpdateItemDescription

TutorialTMHM:
	ld a, $3
	call Function10b92
	call Function10cca
	farcall Pack_TMHMPocketMenu_
	ld a, [wd002]
	ld [wd002], a
	ret

TutorialBalls:
	ld a, $1
	ld hl, TutorialBallsMenuDataHeader
	jr asm_10c8a

TutorialBallsMenuDataHeader:
	db $40 ; flags
	db 01, 07 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $ae ; flags
	db 5, 8 ; rows, columns
	db 2 ; horizontal spacing
	dbw 0, wDudeNumBalls
	dba PlaceMenuItemName
	dba PlaceMenuItemQuantity
	dba UpdateItemDescription

asm_10c8a
	push hl
	call Function10b92
	pop hl
	call CopyMenuDataHeader
	call ScrollingMenu
	ret

Function10c96: ; 10c96 (4:4c96)
	ld hl, wce63
	inc [hl]
	ret

Function10c9b: ; 10c9b (4:4c9b)
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Pack_ExitNoScript:
	ld hl, wce63
	set 7, [hl]
	xor a
	ld [wce66], a
	ret

Pack_ExitRunScript:
	ld hl, wce63
	set 7, [hl]
	ld a, $1
	ld [wce66], a
	ret

Function10cb9: ; 10cb9 (4:4cb9)
	ld a, [wOptions]
	push af
	set 4, a
	ld [wOptions], a
	call PrintText
	pop af
	ld [wOptions], a
	ret

Function10cca: ; 10cca (4:4cca)
	call WaitBGMap
Function10ccd: ; 10ccd (4:4ccd)
	ld a, [wce65]
	and $3
	ld e, a
	ld d, $0
	ld hl, PackGFXPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, $9500
	lb bc, BANK(PackGFX), 15
	call Request2bpp
	ret

PackGFXPointers:
	dw PackGFX + $f0 * 1
	dw PackGFX + $f0 * 3
	dw PackGFX + $f0 * 0
	dw PackGFX + $f0 * 2

Function10cef: ; 10cef (4:4cef)
	ld hl, wMenuJoypad
	ld a, [wcfd3]
	and a
	jr nz, .asm_10d4c
	ld a, [hl]
	and $1
	jr nz, .asm_10d13
	ld a, [hl]
	and $2
	jr nz, .asm_10d15
	ld a, [hl]
	and $20
	jr nz, .asm_10d1c
	ld a, [hl]
	and $10
	jr nz, .asm_10d2d
	ld a, [hl]
	and $4
	jr nz, .asm_10d3e
	scf
	ret

.asm_10d13
	and a
	ret

.asm_10d15
	ld a, $9
	ld [wce63], a
	scf
	ret

.asm_10d1c
	ld a, b
	ld [wce63], a
	ld [wce64], a
	push de
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	pop de
	scf
	ret

.asm_10d2d
	ld a, c
	ld [wce63], a
	ld [wce64], a
	push de
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	pop de
	scf
	ret

.asm_10d3e
	farcall SwitchItemsInBag ; 9:4834
	ld hl, Text_MoveItemWhere
	call Function10cb9
	scf
	ret

.asm_10d4c
	ld a, [hl]
	and $5
	jr nz, .asm_10d58
	ld a, [hl]
	and $2
	jr nz, .asm_10d6a
	scf
	ret

.asm_10d58
	farcall SwitchItemsInBag ; 9:4834
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
.asm_10d6a
	xor a
	ld [wcfd3], a
	scf
	ret

Function10d70: ; 10d70 (4:4d70)
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	ld hl, PackMenuGFX
	ld de, $9000
	ld bc, $600
	ld a, BANK(PackMenuGFX)
	call FarCopyBytes ; same bank
	hlcoord 0, 1
	ld bc, 11 * SCREEN_WIDTH
	ld a, $24
	call ByteFill
	hlcoord 5, 1
	lb bc, 11, 15
	call ClearBox
	hlcoord 0, 0
	ld a, $28
	ld c, $14
.asm_10da5
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_10da5
	call Function10dd6
	call Function10dc0
	hlcoord 0, 12
	ld bc, IncGradGBPalTable_13
	call Textbox
	call EnableLCD
	call Function10ccd
	ret

Function10dc0: ; 10dc0 (4:4dc0)
	hlcoord 0, 3
	ld a, $50
	ld de, $f
	ld b, $3
.asm_10dca
	ld c, $5
.asm_10dcc
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_10dcc
	add hl, de
	dec b
	jr nz, .asm_10dca
	ret

Function10dd6: ; 10dd6 (4:4dd6)
	ld a, [wce65]
	ld d, a
	swap a
	sub d
	ld d, $0
	ld e, a
	ld hl, .tilemap
	add hl, de
	ld d, h
	ld e, l
	hlcoord 0, 7
	ld c, $3
.asm_10deb
	ld b, $5
.asm_10ded
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_10ded
	ld a, c
	ld c, $f
	add hl, bc
	ld c, a
	dec c
	jr nz, .asm_10deb
	ret

.tilemap
	db $00, $04, $04, $04, $01 ; top border
	db $06, $07, $08, $09, $0a ; Items
	db $02, $05, $05, $05, $03 ; bottom border
	db $00, $04, $04, $04, $01 ; top border
	db $15, $16, $17, $18, $19 ; Balls
	db $02, $05, $05, $05, $03 ; bottom border
	db $00, $04, $04, $04, $01 ; top border
	db $0b, $0c, $0d, $0e, $0f ; Key Items
	db $02, $05, $05, $05, $03 ; bottom border
	db $00, $04, $04, $04, $01 ; top border
	db $10, $11, $12, $13, $14 ; TM/HM
	db $02, $05, $05, $05, $03 ; bottom border

Function10e38: ; 10e38 (4:4e38)
	ld a, [wd002]
	ld [wd151], a
	call GetItemName
	call Function317b
	ret

Pack_ClearTilemap:
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	ret

Function10e51: ; 10e51 (4:4e51)
	hlcoord 5, 2
	lb bc, 10, 15
	call ClearBox
	ret

Function10e5b: ; 10e5b (4:4e5b)
	call WaitBGMap
	ld b, $14
	call GetSGBLayout
	call SetPalettes
	call DelayFrame
	ret

ItemsPocketMenuDataHeader:
	db $40
	db 01, 07
	db 11, 19
	dw .MenuData2
	db 1

.MenuData2:
	db $ae
	db 5, 8
	db 2
	dbw 0, wNumItems
	dba PlaceMenuItemName ; 9:49dc
	dba PlaceMenuItemQuantity ; 9:49eb
	dba UpdateItemDescription ; 9:43eb

PC_Mart_ItemsPocketMenuDataHeader:
	db $40
	db 01, 07
	db 11, 19
	dw .MenuData2
	db 1

.MenuData2:
	db $2e
	db 5, 8
	db 2
	dbw 0, wNumItems
	dba PlaceMenuItemName ; 9:49dc
	dba PlaceMenuItemQuantity ; 9:49eb
	dba UpdateItemDescription ; 9:43eb

KeyItemsPocketMenuDataHeader:
	db $40
	db 01, 07
	db 11, 19
	dw .MenuData2
	db 1

.MenuData2:
	db $ae
	db 5, 8
	db 1
	dbw 0, wNumKeyItems
	dba PlaceMenuItemName ; 9:49dc
	dba PlaceMenuItemQuantity ; 9:49eb
	dba UpdateItemDescription ; 9:43eb

PC_Mart_KeyItemsPocketMenuDataHeader:
	db $40
	db 01, 07
	db 11, 19
	dw .MenuData2
	db 1

.MenuData2:
	db $2e
	db 5, 8
	db 1
	dbw 0, wNumKeyItems
	dba PlaceMenuItemName ; 9:49dc
	dba PlaceMenuItemQuantity ; 9:49eb
	dba UpdateItemDescription ; 9:43eb

BallsPocketMenuDataHeader:
	db $40
	db 01, 07
	db 11, 19
	dw .MenuData2
	db 1

.MenuData2:
	db $ae
	db 5, 8
	db 2
	dbw 0, wNumBalls
	dba PlaceMenuItemName ; 9:49dc
	dba PlaceMenuItemQuantity ; 9:49eb
	dba UpdateItemDescription ; 9:43eb

PC_Mart_BallsPocketMenuDataHeader:
	db $40
	db 01, 07
	db 11, 19
	dw .MenuData2
	db 1

.MenuData2:
	db $2e
	db 5, 8
	db 2
	dbw 0, wNumBalls
	dba PlaceMenuItemName ; 9:49dc
	dba PlaceMenuItemQuantity ; 9:49eb
	dba UpdateItemDescription ; 9:43eb

Text_PackNoItems:
	text_far Text_PackNoItems_
	db "@"

Text_ThrowAwayHowMany:
	text_far Text_ThrowAwayHowMany_
	db "@"

Text_ConfirmThrowAway:
	text_far Text_ConfirmThrowAway_
	db "@"

Text_ThrewAway:
	text_far Text_ThrewAway_
	db "@"

Text_ThisIsntTheTime:
	text_far Text_ThisIsntTheTime_
	db "@"

Text_YouDontHaveAPokemon:
	text_far Text_YouDontHaveAMon
	db "@"

Text_RegisteredTheItem:
	text_far Text_RegisteredTheItem_
	db "@"

Text_CantRegisterThatItem:
	text_far Text_CantRegisterThatItem_
	db "@"

Text_MoveItemWhere:
	text_far Text_MoveItemWhere_
	db "@"

Text_PackEmptyString:
	text_far Text_PackEmptyString_
	db "@"

Text_CantUseItInABattle:
	text_far Text_YouCantUseItInABattle
	db "@"

PackMenuGFX: INCBIN "gfx/misc/pack_menu.2bpp"
PackGFX: INCBIN "gfx/misc/pack.2bpp"
