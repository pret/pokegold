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
	callba Functionfb981
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
	callba Functione6a9 ; same bank
	jr z, asm_c3f2
	jr asm_c3ec

Special_FindAtLeastThatHappy: ; c3c2
	ld a, [wScriptVar]
	ld b, a
	callba Functione6b0 ; same bank
	jr z, asm_c3f2
	jr asm_c3ec

Special_FindThatSpecies: ; c3d0
	ld a, [wScriptVar]
	ld b, a
	callba Functione6b7 ; same bank
	jr z, asm_c3f2
	jr asm_c3ec

Special_FindThatSpeciesYourTrainerID: ; c3de
	ld a, [wScriptVar]
	ld b, a
	callba Functione6bd ; same bank
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
ENDC

IF DEF(SILVER)
	db "GOLD@"
ENDC

SpecialNameRater: ; c413 (3:4413)
	callba Functionfb7f7
	ret

Special_TownMap: ; c41a (3:441a)
	call FadeToMenu
	callba Function9188a
	call ExitAllMenus
	ret

Special_UnownPrinter: ; c427 (3:4427)
	call FadeToMenu
	callba Function16e3a
	call ExitAllMenus
	ret

Special_DisplayLinkRecord: ; c434 (3:4434)
	call FadeToMenu
	callba Function3f55d
	call ExitAllMenus
	ret

Special_PlayerPC: ; c441 (3:4441)
	xor a
	ld [wScriptVar], a
	callba Function159b0
	ld a, c
	ld [wScriptVar], a
	ret

Special_CheckMysteryGift: ; c450 (3:4450)
	ld a, $0
	call OpenSRAM
	ld a, [$abe2]
	and a
	jr z, .asm_c45c
	inc a
.asm_c45c
	ld [wScriptVar], a
	call CloseSRAM
	ret

Special_GetMysteryGiftItem: ; c463 (3:4463)
	ld a, $0
	call OpenSRAM
	ld a, [$abe2]
	ld [wd002], a
	ld a, $1
	ld [wd009], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .asm_c497
	xor a
	ld [$abe2], a
	call CloseSRAM
	ld a, [wd002]
	ld [wd151], a
	call GetItemName
	ld hl, ReceivedMysteryGiftText ; $449f
	call PrintText
	ld a, $1
	ld [wScriptVar], a
	ret

.asm_c497
	call CloseSRAM
	xor a
	ld [wScriptVar], a
	ret

ReceivedMysteryGiftText:
	text_jump ReceivedMysteryGiftText_
	db "@"

BugContestJudging: ; c4a4 (3:44a4)
	callba Function13a5f
	ld a, b
	ld [wScriptVar], a
	ret

MapRadio: ; c4af (3:44af)
	ld a, [wScriptVar]
	ld e, a
	callba Function919c1
	ret

Special_UnownPuzzle: ; c4ba (3:44ba)
	call FadeToMenu
	callba Functione199d
	ld a, [wcfe4]
	ld [wScriptVar], a
	call ExitAllMenus
	ret

Special_SlotMachine: ; c4cd (3:44cd)
	call Functionc508
	ret c
	ld a, BANK(Function92c36)
	ld hl, Function92c36
	call Functionc4f4
	ret

Special_CardFlip: ; c4da (3:44da)
	call Functionc508
	ret c
	ld a, BANK(Functione0909)
	ld hl, Functione0909
	call Functionc4f4
	ret

Special_DummyNonfunctionalGameCornerGame: ; c4e7 (3:44e7)
	call Functionc508
	ret c
	ld a, BANK(Functione2668)
	ld hl, Functione2668
	call Functionc4f4
	ret

Functionc4f4: ; c4f4 (3:44f4)
	call Function3425
	call FadeToMenu
	ld hl, wcfd8
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	call ExitAllMenus
	ret

Functionc508: ; c508 (3:4508)
	ld hl, wCoins
	ld a, [hli]
	or [hl]
	jr z, .asm_c51e
	ld a, COIN_CASE
	ld [wd002], a
	ld hl, wNumItems
	call CheckItem
	jr nc, .asm_c523
	and a
	ret

.asm_c51e
	ld hl, .NoCoinsText
	jr .asm_c526

.asm_c523
	ld hl, .NoCoinCaseText
.asm_c526
	call PrintText
	scf
	ret

.NoCoinsText:
	text_jump NoCoinsText_
	db "@"

.NoCoinCaseText:
	text_jump NoCoinCaseText_
	db "@"

Special_ClearBGPalettesBufferScreen: ; c535 (3:4535)
	call ClearBGPalettes
	call BufferScreen
	ret

Functionc53c: ; c53c (3:453c)
	jr c, .asm_c543
	xor a
	ld [wScriptVar], a
	ret

.asm_c543
	ld a, $1
	ld [wScriptVar], a
	ret

Special_CheckUnusedTwoDayTimer: ; c549 (3:4549)
	callba Function118f8
	ld a, [wd984]
	ld [wScriptVar], a
	ret

Functionc556: ; c556 (3:4556)
	ld a, [wScriptVar]
	ld [wdd19], a
	jr .asm_c566

.asm_c55e
	ld a, d
	ld [wdd17], a
	ld a, e
	ld [wdd18], a
.asm_c566
	ld hl, wDailyFlags
	set 2, [hl]
	ret

Functionc56c:
	ld hl, wDailyFlags
	bit 2, [hl]
	jr z, .asm_c578
	xor a
	ld [wScriptVar], a
	ret

.asm_c578
	ld a, $1
	ld [wScriptVar], a
	xor a
	ld [wdd19], a
	ld [wdd17], a
	ld [wdd18], a
	ret

Functionc588: ; c588 (3:4588)
	callba Functionc7a40
	jp Functionc53c

Functionc591: ; c591 (3:4591)
	callba Function11917
	ld hl, wLuckyNumberShowFlag
	res 0, [hl]
	callba LoadOrRegenerateLuckyIDNumber
	ret

Functionc5a3: ; c5a3 (3:45a3)
	callba Function1192e
	jp Functionc53c

CountUnown: ; c5ac (3:45ac)
	ld hl, wUnownDex
	ld b, $0
.asm_c5b1
	ld a, [hli]
	and a
	ret z
	inc b
	ld a, b
	cp $1a
	jr c, .asm_c5b1
	ret

Functionc5bb: ; c5bb (3:45bb)
	callba Function24b8d
	ld a, c
	ld [wScriptVar], a
	and a
	ret z
	ld [wd002], a
	ld a, $1
	ld [wd009], a
	ld hl, wNumItems
	call TossItem
	ret

Functionc5d6: ; c5d6 (3:45d6)
	ld a, [wChannelsEnd]
	cp $40
	jr nz, .asm_c5fb
	ld a, [wda03]
	ld b, a
	ld a, [wda02]
	ld c, a
	ld hl, .ProximityCoords
.asm_c5e8
	ld a, [hli]
	cp $ff
	jr z, .asm_c5fb
	cp b
	jr nz, .asm_c5f8
	ld a, [hli]
	cp c
	jr nz, .asm_c5e8
	ld a, $1
	jr .asm_c5fc

.asm_c5f8
	inc hl
	jr .asm_c5e8

.asm_c5fb
	xor a
.asm_c5fc
	ld [wScriptVar], a
	ret

.ProximityCoords:
	;   x,  y
	db 33,  8 ; left
	db 34, 10 ; below
	db 35, 10 ; below
	db 36,  8 ; right
	db 36,  9 ; right
	db -1

Functionc60b: ; c60b (3:460b)
	ld a, [wCurPartySpecies]
	jp PlayCry

Functionc611: ; c611 (3:4611)
	ld a, [hCGB]
	and a
	jr nz, .asm_c622
	ld a, [hSGB]
	and a
	jr nz, .asm_c61e
	xor a
	jr .asm_c624

.asm_c61e
	ld a, $1
	jr .asm_c624

.asm_c622
	ld a, $2
.asm_c624
	ld [wScriptVar], a
	ret

Functionc628: ; c628 (3:4628)
	ld a, $0
	ld [wMusicFadeID], a
	ld a, $0
	ld [wMusicFadeIDHi], a
	ld a, $2
	ld [wMusicFade], a
	ret

Functionc638: ; c638 (3:4638)
	call FadeToMenu
	callba Functione0002
	call ExitAllMenus
	ret

Functionc645: ; c645 (3:4645)
	call FadeToMenu
	callba Function84684
	call ExitAllMenus
	ret

Functionc652: ; c652 (3:4652)
	ld a, $0
	call OpenSRAM
	ld a, [$abfd]
	ld [wScriptVar], a
	jp CloseSRAM

FlagPredef:
	nop
	push hl
	push bc
	push bc
	srl c
	srl c
	srl c
	ld b, $0
	add hl, bc
	pop bc
	ld a, c
	and $7
	ld c, a
	ld a, $1
	jr z, .asm_c67a
.asm_c676
	add a
	dec c
	jr nz, .asm_c676
.asm_c67a
	ld c, a
	dec b
	jr z, .asm_c687
	dec b
	jr z, .asm_c68c
	ld a, c
	cpl
	and [hl]
	ld [hl], a
	jr .asm_c699

.asm_c687
	ld a, [hl]
	or c
	ld [hl], a
	jr .asm_c699

.asm_c68c
	ld a, d
	cp $0
	jr nz, .asm_c695
	ld a, [hl]
	and c
	jr .asm_c699

.asm_c695
	call GetFarByte
	and c
.asm_c699
	pop bc
	pop hl
	ld c, a
	ret

HealParty: ; c69d (3:469d)
	xor a
	ld [wd005], a
	ld hl, wPartySpecies
.asm_c6a4
	ld a, [hli]
	cp $ff
	jr z, .asm_c6bb
	cp $fd
	jr z, .asm_c6b2
	push hl
	call Functionc6bc
	pop hl
.asm_c6b2
	ld a, [wd005]
	inc a
	ld [wd005], a
	jr .asm_c6a4

.asm_c6bb
	ret

Functionc6bc: ; c6bc (3:46bc)
	ld a, $0
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld hl, $20
	add hl, de
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, $24
	add hl, de
	ld b, h
	ld c, l
	dec bc
	dec bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hl]
	ld [bc], a
	callba Functionf900
	ret
