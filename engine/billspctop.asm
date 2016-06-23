BillsPC_:
	call BillsPC_CheckHavePokemon
	ret c
	call BillsPC_LogIn
	call BillsPC_UsePC
	jp BillsPC_LogOut

BillsPC_CheckHavePokemon: ; e3e5 (3:63e5)
	ld a, [wPokemonData]
	and a
	ret nz
	ld hl, Text_GottaHavePokemon
	call MenuTextBoxBackup
	scf
	ret

Text_GottaHavePokemon:
	text_jump Text_GottaHavePokemon_
	db "@"

BillsPC_LogIn: ; e3f7 (3:63f7)
	xor a
	ld [hBGMapMode], a
	call LoadStandardMenuDataHeader
	call Functione566
	ld hl, wOptions
	ld a, [hl]
	push af
	set 4, [hl]
	ld hl, Text_BillsPCWhat
	call PrintText
	pop af
	ld [wOptions], a
	call Functionda5
	ret

Text_BillsPCWhat:
	text_jump Text_BillsPCWhat_
	db "@"

BillsPC_LogOut: ; e41a (3:641a)
	call CloseSubmenu
	ret

BillsPC_UsePC: ; e41e (3:641e)
	ld hl, BillsPC_TopMenuDataHeader
	call LoadMenuDataHeader
	ld a, $1
.asm_e426
	ld [wMenuCursorBuffer], a
	call SetPalettes
	xor a
	ld [wWhichIndexSet], a
	ld [hBGMapMode], a
	call DoNthMenu
	jr c, .asm_e446
	ld a, [wMenuCursorBuffer]
	push af
	ld a, [wMenuSelection]
	ld hl, BillsPC_TopMenuJumptable
	rst JumpTable
	pop bc
	ld a, b
	jr nc, .asm_e426
.asm_e446
	call CloseWindow
	ret

BillsPC_TopMenuDataHeader:
	db $40
	db 00, 00
	db 17, 19
	dw .MenuData2
	db 1

.MenuData2:
	db $80
	db 0
	dw BillsPC_TopMenuItems
	dw PlaceMenuStrings
	dw .strings

.strings
	db "WITHDRAW <PK><MN>@"
	db "DEPOSIT <PK><MN>@"
	db "CHANGE BOX@"
	db "MOVE <PK><MN> W/O MAIL@"
	db "SEE YA!@"

BillsPC_TopMenuJumptable:
	dw BillsPC_WithdrawMenu
	dw BillsPC_DepositMenu
	dw BillsPC_ChangeBoxMenu
	dw BillsPC_MovePKMNMenu
	dw BillsPC_SeeYa

BillsPC_TopMenuItems:
	db 5
	db 0, 1, 2, 3, 4
	db -1

BillsPC_SeeYa:
	scf
	ret

BillsPC_MovePKMNMenu:
	call LoadStandardMenuDataHeader
	callba IsAnyPokemonHoldingMail ; 11:488c
	jr nc, .asm_e4bb
	ld hl, Text_PleaseRemoveMailBeforeMovePkmnWOMail
	call PrintText
	jr .asm_e4cf

.asm_e4bb
	callba StartMovePkmnWOMail_SaveGame ; 5:4bd2
	jr c, .asm_e4cf
	callba MovePKMNWithoutMail_ ; 38:6f47
	call ReturnToMapFromSubmenu
	call Functione566
.asm_e4cf
	call CloseWindow
	and a
	ret

Text_PleaseRemoveMailBeforeMovePkmnWOMail:
	text_jump Text_PleaseRemoveMailBeforeMovePkmnWOMail_
	db "@"

BillsPC_DepositMenu:
	call LoadStandardMenuDataHeader
	callba DepositPokemon_ ; 38:6b9e
	call ReturnToMapFromSubmenu
	call Functione566
	call CloseWindow
	and a
	ret

Functione4ed:
	ld a, [wPartyCount]
	and a
	jr z, .asm_e4f9
	cp $2
	jr c, .asm_e501
	and a
	ret

.asm_e4f9
	ld hl, Text_YouDontHaveASinglePokemon
	call MenuTextBoxBackup
	scf
	ret

.asm_e501
	ld hl, Text_ItsYourLastPokemon
	call MenuTextBoxBackup
	scf
	ret

Text_YouDontHaveASinglePokemon:
	text_jump Text_YouDontHaveASinglePokemon_
	db "@"

Text_ItsYourLastPokemon:
	text_jump Text_ItsYourLastPokemon_
	db "@"

CheckCurPartyMonFainted: ; e513 (3:6513)
	ld hl, wPartyMon1HP
	ld de, $30
	ld b, $0
.asm_e51b
	ld a, [wd005]
	cp b
	jr z, .asm_e526
	ld a, [hli]
	or [hl]
	jr nz, .asm_e532
	dec hl
.asm_e526
	inc b
	ld a, [wPartyCount]
	cp b
	jr z, .asm_e530
	add hl, de
	jr .asm_e51b

.asm_e530
	scf
	ret

.asm_e532
	and a
	ret

BillsPC_WithdrawMenu:
	call LoadStandardMenuDataHeader
	callba WithdrawPokemon_ ; 38:6d71
	call ReturnToMapFromSubmenu
	call Functione566
	call CloseWindow
	and a
	ret

Functione548:
	ld a, [wPartyCount]
	cp $6
	jr nc, .asm_e551
	and a
	ret

.asm_e551
	ld hl, Text_CantTakeAnyMorePokemon
	call MenuTextBoxBackup
	scf
	ret

Text_CantTakeAnyMorePokemon:
	text_jump Text_CantTakeAnyMorePokemon_
	db "@"

BillsPC_ChangeBoxMenu:
	callba ChangeBox_ ; 38:7d25
	and a
	ret

Functione566: ; e566 (3:6566)
	call DisableSpriteUpdates
	xor a
	ld [hBGMapMode], a
	call ClearBGPalettes
	call ClearSprites
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	hlcoord 0, 0
	lb bc, 10, 18
	call TextBox
	hlcoord 0, 12
	ld bc, IncGradGBPalTable_13
	call TextBox
	call Function3456
	call SetPalettes
	ret

CopyBoxmonToTempMon
	ld a, [wd005]
	ld hl, sBoxMon1Species
	ld bc, $20
	call AddNTimes
	ld de, wTempMonSpecies
	ld bc, $20
	ld a, BANK(sBoxMon1Species)
	call OpenSRAM
	call CopyBytes
	call CloseSRAM
	ret

Function65b4:
	ld a, [wd8bc]
	cp b
	jr z, .asm_e5cc
	ld a, b
	ld hl, Bank3BoxAddrs
	ld bc, $3
	call AddNTimes
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	jr .asm_e5d1

.asm_e5cc
	ld a, BANK(sBoxCount)
	ld hl, sBoxCount
.asm_e5d1
	call OpenSRAM
	ld a, [hl]
	ld bc, sBoxMon1 - sBox
	add hl, bc
	ld b, a
	ld c, $0
	ld de, wMisc
	ld a, b
	and a
	jr z, .asm_e645
.asm_e5e3
	push hl
	push bc
	ld a, c
	ld bc, $0
	add hl, bc
	ld bc, $20
	call AddNTimes
	ld a, [hl]
	ld [de], a
	inc de
	ld [wCurSpecies], a
	call GetBaseData
	pop bc
	pop hl
	push hl
	push bc
	ld a, c
	ld bc, sBoxMonNicknames - sBoxMons
	add hl, bc
	call SkipNames
	call CopyBytes
	pop bc
	pop hl
	push hl
	push bc
	ld a, c
	ld bc, $1f
	add hl, bc
	ld bc, $20
	call AddNTimes
	ld a, [hl]
	ld [de], a
	inc de
	pop bc
	pop hl
	push hl
	push bc
	ld a, c
	ld bc, $15
	add hl, bc
	ld bc, $20
	call AddNTimes
	ld a, [hli]
	and $f0
	ld b, a
	ld a, [hl]
	and $f0
	swap a
	or b
	ld b, a
	ld a, [wd12d]
	cp b
	ld a, $1
	jr c, .asm_e63d
	xor a
.asm_e63d
	ld [de], a
	inc de
	pop bc
	pop hl
	inc c
	dec b
	jr nz, .asm_e5e3
.asm_e645
	call CloseSRAM
	ret

Bank3BoxAddrs:
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
