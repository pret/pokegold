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
	add_special Function97a59
	add_special Function29b22
	add_special Function29b4b
	add_special Function29bcc
	add_special Function29c71
	add_special Function29c8d
	add_special Function29d01
	add_special Function29cf9
	add_special Function29ad9
	add_special Function29b2b
	add_special Function29b34
	add_special Function29a47
	add_special Function29ac7
	add_special Function29ccf
	add_special Function29ce4
	add_special Function29cba
	add_special Function29d4e
	add_special Special_CheckMysteryGift
	add_special Special_GetMysteryGiftItem
	add_special Function2a4e7
	add_special BugContestJudging
	add_special Functionc7bbf
	add_special Function13dce
	add_special Function13ded
	add_special Function1399d
	add_special Functionfbc3c
	add_special Functionfbdd6
	add_special HealParty
	add_special Function15871
	add_special Special_PlayerPC
	add_special Function16935
	add_special Function16989
	add_special Function16b8c
	add_special Function2c352
	add_special Function1646d
	add_special Function8ce7c
	add_special Special_NameRival
	add_special Function908dc
	add_special Special_TownMap
	add_special Special_UnownPrinter
	add_special MapRadio
	add_special Special_UnownPuzzle
	add_special Special_SlotMachine
	add_special Special_CardFlip
	add_special Special_DummyNonfunctionalGameCornerGame
	add_special Special_ClearBGPalettesBufferScreen
	add_special Function8c3ab
	add_special Function8c3c4
	add_special FadeInPalettes
	add_special Function8c3b9
	add_special Functiond42, $02
	add_special ClearBGPalettes
	add_special UpdateTimePals
	add_special ClearTileMap
	add_special UpdateSprites
	add_special Functiond97
	add_special Special_GameCornerPrizeMonCheckDex
	add_special SpecialSeenMon
	add_special WaitSFX, $03
	add_special PlayMapMusic
	add_special RestartMapMusic
	add_special Function126fd
	add_special Special_SurfStartStep
	add_special Special_FindGreaterThanThatLevel
	add_special Special_FindAtLeastThatHappy
	add_special Special_FindThatSpecies
	add_special Special_FindThatSpeciesYourTrainerID
	add_special Special_CheckUnusedTwoDayTimer
	add_special Function177a5
	add_special Function177c4
	add_special Function13d64
	add_special Functionc556
	add_special Function271be
	add_special Function27216
	add_special Function73e1
	add_special Function7452
	add_special Function74cb
	add_special Functionc588
	add_special Function24a4d
	add_special Function24a76
	add_special Function24a10
	add_special Functionc7a5a
	add_special Functionc5a3
	add_special Functionc591
	add_special Functionc7bad
	add_special Functionc5bb
	add_special SpecialNameRater
	add_special Special_DisplayLinkRecord
	add_special GetFirstPokemonHappiness
	add_special CheckFirstMonIsEgg
	add_special Function2a9f7
	add_special Function2aa6b
	add_special Function2aab3
	add_special Function14226
	add_special Functionfb94b
	add_special Functionc5d6
	add_special Function74e7
	add_special Function74ec
	add_special Function74f1
	add_special Functionc60b
	add_special Function267ca
	add_special Functionc611
	add_special Functionc652
	add_special Function16ff7
	add_special Function2a7d7
	add_special Functionc628
	add_special Functionc638
	add_special Functionc645
	add_special Function90a1b
	add_special Function90a54
	add_special Function90a8d
	add_special SpecialNone

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
	callba ConvertMon_1to2
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
	ld a, [wFieldMoveSucceeded]
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
	SetFlag ENGINE_SPECIAL_WILDDATA
	ret

Functionc56c:
	CheckFlagHL ENGINE_SPECIAL_WILDDATA
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
	ClearFlag ENGINE_LUCKY_NUMBER_SHOW
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
	ld a, [wXCoord]
	ld b, a
	ld a, [wYCoord]
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

Functionc660:
	nop
FlagPredef:
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
