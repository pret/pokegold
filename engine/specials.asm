Special:: ; c22b
	ld hl, SpecialsPointers ; $4239
	add hl, de
	add hl, de
	add hl, de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret

SpecialsPointers:
special_pointer: MACRO
IF DEF(GOLD)
	dbw \1, \2
ENDC
IF DEF(SILVER)
	dbw \1, \3
ENDC
ENDM

	dbw $25, $7a59
	dbw $0a, $5b22
	dbw $0a, $5b4b
	dbw $0a, $5bcc
	dbw $0a, $5c71
	dbw $0a, $5c8d
	dbw $0a, $5d01
	dbw $0a, $5cf9
	dbw $0a, $5ad9
	dbw $0a, $5b2b
	dbw $0a, $5b34
	dbw $0a, $5a47
	dbw $0a, $5ac7
	dbw $0a, $5ccf
	dbw $0a, $5ce4
	dbw $0a, $5cba
	dbw $0a, $5d4e
	dba Special_CheckMysteryGift
	dba Special_GetMysteryGiftItem
	dbw $0a, $64e7
	dba BugContestJudging
	dbw $31, $7bbf
	dbw $04, $7dce
	dbw $04, $7ded
	dbw $04, $799d
	dbw $3e, $7c3c
	dbw $3e, $7dd6
	dba HealParty
	dbw $05, $5871
	dba Special_PlayerPC
	dbw $05, $6935
	dbw $05, $6989
	dbw $05, $6b8c
	dbw $0b, $4352
	dbw $05, $646d
	dbw $23, $4e7c
	dbw $03, $43f7
	dbw $24, $48dc
	dba Special_TownMap
	dba Special_UnownPrinter
	dba MapRadio
	dba Special_UnownPuzzle
	dba Special_SlotMachine
	dba Special_CardFlip
	dba Special_DummyNonfunctionalGameCornerGame
	dba Special_ClearBGPalettesBufferScreen
	dbw $23, $43ab
	dbw $23, $43c4
	dbw $23, $43a0
	dbw $23, $43b9
	dbw $02, Functiond42
	dba ClearBGPalettes ; dbw $00, $3449
	dba UpdateTimePals ; dbw $00, $0359
	dba ClearTileMap ; dbw $00, $0ecf
	dba UpdateSprites ; dbw $00, $196f
	dba Functiond97 ; dbw $00, $0d97
	dbw $03, $438a
	dbw $03, $43ac
	dbw $03, WaitSFX ; $3e56
	dba PlayMapMusic ; dbw $00, $3ebd
	dba RestartMapMusic ; dbw $00, $3f25
	dbw $04, $66fd
	dbw $02, $4969
	dbw $03, $43b4
	dbw $03, $43c2
	dbw $03, $43d0
	dbw $03, $43de
	dba Special_CheckUnusedTwoDayTimer
	dbw $05, $77a5
	dbw $05, $77c4
	dbw $04, $7d64
	dba Functionc556
	dbw $09, $71be
	dbw $09, $7216
	dba Function73e1 ; special_pointer $01, $73e1, $73a7
	dba Function7452 ; special_pointer $01, $7452, $7418
	dba Function74cb ; special_pointer $01, $74cb, $7491
	dba Functionc588
	dbw $09, $4a4d
	dbw $09, $4a76
	dbw $09, $4a10
	dbw $31, $7a5a
	dba Functionc5a3
	dba Functionc591
	dbw $31, $7bad
	dba Functionc5bb
	dba SpecialNameRater
	dba Special_DisplayLinkRecord
	dba GetFirstPokemonHappiness ; special_pointer $01, $726c, $7232
	dba CheckFirstMonIsEgg ; special_pointer $01, $728b, $7251
	dbw $0a, $69f7
	dbw $0a, $6a6b
	dbw $0a, $6ab3
	dbw $05, $4226
	dbw $3e, $794b
	dba Functionc5d6
	dba Function74e7 ; special_pointer $01, $74e7, $74ad
	dba Function74ec ; special_pointer $01, $74ec, $74b2
	dba Function74f1 ; special_pointer $01, $74f1, $74b7
	dba Functionc60b
	dbw $09, $67ca
	dba Functionc611
	dba Functionc652
	dbw $05, $6ff7
	dbw $0a, $67d7
	dba Functionc628
	dba Functionc638
	dba Functionc645
	dbw $24, $4a1b
	dbw $24, $4a54
	dbw $24, $4a8d
	dba SpecialNone ; $03, $4389

SpecialNone: ; c389
	ret

Special_GameCornerPrizeMonCheckDex: ; c38a
	ld a, [wScriptVar]
	dec a
	call CheckCaughtMon
	ret nz
	ld a, [wScriptVar]
	dec a
	call SetSeenAndCaughtMon
	call FadeToMenu
	ld a, [wScriptVar]
	ld [wd151], a
	ld a, $3e
	ld hl, $7981
	rst FarCall
	call ExitAllMenus
	ret

SpecialSeenMon: ; c3ac
	ld a, [wScriptVar]
	dec a
	call SetSeenMon
	ret

Special_FindGreaterThanThatLevel: ; c3b4
	ld a, [wScriptVar]
	ld b, a
	callba Functione6a9
	jr z, asm_c3f2
	jr asm_c3ec

Special_FindAtLeastThatHappy: ; c3c2
	ld a, [wScriptVar]
	ld b, a
	callba Functione6b0
	jr z, asm_c3f2
	jr asm_c3ec

Special_FindThatSpecies: ; c3d0
	ld a, [wScriptVar]
	ld b, a
	callba Functione6b7
	jr z, asm_c3f2
	jr asm_c3ec

Special_FindThatSpeciesYourTrainerID: ; c3de
	ld a, [wScriptVar]
	ld b, a
	callba Functione6bd
	jr z, asm_c3f2
	jr asm_c3ec

asm_c3ec
	ld a, $1
	ld [wScriptVar], a
	ret

asm_c3f2
	xor a
	ld [wScriptVar], a
	ret

Special_NameRival: ; c3f7
	ld b, $2
	ld de, wRivalsName
	callba NamingScreen_
	ld hl, wRivalsName
	ld de, .DefaultName
	call InitName
	ret

.DefaultName:
IF DEF(GOLD)
	db "SILVER@"

SpecialNameRater: ; c413
	dr $c413, $c41a

Special_TownMap: ; c41a
	dr $c41a, $c427

Special_UnownPrinter: ; c427
	dr $c427, $c434

Special_DisplayLinkRecord: ; c434
	dr $c434, $c441

Special_PlayerPC: ; c441
	dr $c441, $c450

Special_CheckMysteryGift: ; c450
	dr $c450, $c463

Special_GetMysteryGiftItem: ; c463
	dr $c463, $c4a4

BugContestJudging: ; c4a4
	dr $c4a4, $c4af

MapRadio: ; c4af
	dr $c4af, $c4ba

Special_UnownPuzzle: ; c4ba
	dr $c4ba, $c4cd

Special_SlotMachine: ; c4cd
	dr $c4cd, $c4da

Special_CardFlip: ; c4da
	dr $c4da, $c4e7

Special_DummyNonfunctionalGameCornerGame: ; c4e7
	dr $c4e7, $c535

Special_ClearBGPalettesBufferScreen: ; c535
	dr $c535, $c549

Special_CheckUnusedTwoDayTimer: ; c549
	dr $c549, $c556

Functionc556: ; c556
	dr $c556, $c588

Functionc588: ; c588
	dr $c588, $c591

Functionc591: ; c591
	dr $c591, $c5a3

Functionc5a3: ; c5a3
	dr $c5a3, $c5ac

CountUnown: ; c5ac
	dr $c5ac, $c5bb

Functionc5bb: ; c5bb
	dr $c5bb, $c5d6

Functionc5d6: ; c5d6
	dr $c5d6, $c60b

Functionc60b: ; c60b
	dr $c60b, $c611

Functionc611: ; c611
	dr $c611, $c628

Functionc628: ; c628
	dr $c628, $c638

Functionc638: ; c638
	dr $c638, $c645

Functionc645: ; c645
	dr $c645, $c652

Functionc652: ; c652
	dr $c652, $c661

FlagPredef: ; c661
	dr $c661, $c69d

HealParty: ; c69d
	dr $c69d, $c6de
ENDC

IF DEF(SILVER)
	db "GOLD@"

SpecialNameRater: ; c411
	dr $c411, $c418

Special_TownMap: ; c418
	dr $c418, $c425

Special_UnownPrinter: ; c425
	dr $c425, $c432

Special_DisplayLinkRecord: ; c432
	dr $c432, $c43f

Special_PlayerPC: ; c43f
	dr $c43f, $c44e

Special_CheckMysteryGift: ; c44e
	dr $c44e, $c461

Special_GetMysteryGiftItem: ; c461
	dr $c461, $c4a2

BugContestJudging: ; c4a2
	dr $c4a2, $c4ad

MapRadio: ; c4ad
	dr $c4ad, $c4b8

Special_UnownPuzzle: ; c4b8
	dr $c4b8, $c4cb

Special_SlotMachine: ; c4cb
	dr $c4cb, $c4d8

Special_CardFlip: ; c4d8
	dr $c4d8, $c4e5

Special_DummyNonfunctionalGameCornerGame: ; c4e5
	dr $c4e5, $c533

Special_ClearBGPalettesBufferScreen: ; c533
	dr $c533, $c547

Special_CheckUnusedTwoDayTimer: ; c547
	dr $c547, $c554

Functionc556: ; c554
	dr $c554, $c586

Functionc588: ; c586
	dr $c586, $c58f

Functionc591: ; c58f
	dr $c58f, $c5a1

Functionc5a3: ; c5a1
	dr $c5a1, $c5aa

CountUnown: ; c5aa
	dr $c5aa, $c5b9

Functionc5bb: ; c5b9
	dr $c5b9, $c5d4

Functionc5d6: ; c5d4
	dr $c5d4, $c609

Functionc60b: ; c609
	dr $c609, $c60f

Functionc611: ; c60f
	dr $c60f, $c626

Functionc628: ; c626
	dr $c626, $c636

Functionc638: ; c636
	dr $c636, $c643

Functionc645: ; c643
	dr $c643, $c650

Functionc652: ; c650
	dr $c650, $c65f

FlagPredef: ; c65f
	dr $c65f, $c69b

HealParty: ; c69b
	dr $c69b, $c6dc
ENDC
