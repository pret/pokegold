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

; Special routines can be used with the "special" map script command.
; They often use wScriptVar for arguments and return values.

add_special: MACRO
; Some ROM0 specials have a nonzero bank.
\1Special::
IF _NARG == 1
        dba \1
ELSE
        dbw \2, \1
ENDC
ENDM

SpecialsPointers:
	add_special WarpToSpawnPoint

; Communications
	add_special SetBitsForLinkTradeRequest
	add_special WaitForLinkedFriend
	add_special CheckLinkTimeout
	add_special TryQuickSave
	add_special CheckBothSelectedSameRoom
	add_special FailedLinkToPast
	add_special CloseLink
	add_special WaitForOtherPlayerToExit
	add_special SetBitsForBattleRequest
	add_special SetBitsForTimeCapsuleRequest
	add_special CheckTimeCapsuleCompatibility
	add_special EnterTimeCapsule
	add_special TradeCenter
	add_special Colosseum
	add_special TimeCapsule
	add_special CableClubCheckWhichChris
	add_special CheckMysteryGift
	add_special GetMysteryGiftItem
	add_special UnlockMysteryGift

; Map events
	add_special BugContestJudging
	add_special CheckPartyFullAfterContest
	add_special ContestDropOffMons
	add_special ContestReturnMons
	add_special GiveParkBalls
	add_special CheckMagikarpLength
	add_special MagikarpHouseSign
	add_special HealParty
	add_special PokemonCenterPC
	add_special PlayersHousePC
	add_special DayCareMan
	add_special DayCareLady
	add_special DayCareManOutside
	add_special MoveDeletion
	add_special BankOfMom
	add_special MagnetTrain
	add_special NameRival
	add_special SetDayOfWeek
	add_special OverworldTownMap
	add_special UnownPrinter
	add_special MapRadio
	add_special UnownPuzzle
	add_special SlotMachine
	add_special CardFlip
	add_special DummyNonfunctionalGameCornerGame
	add_special ClearBGPalettesBufferScreen
	add_special FadeOutPalettes
	add_special FadeBlackQuickly
	add_special FadeInPalettes
	add_special FadeInQuickly
	add_special ReloadSpritesNoPalettes, $02
	add_special ClearBGPalettes
	add_special UpdateTimePals
	add_special ClearTileMap
	add_special UpdateSprites
	add_special ReplacePlayerSprite
	add_special GameCornerPrizeMonCheckDex
	add_special UnusedSetSeenMon
	add_special WaitSFX, $03
	add_special PlayMapMusic
	add_special RestartMapMusic
	add_special HealMachineAnim
	add_special SurfStartStep
	add_special FindGreaterThanThatLevel
	add_special FindAtLeastThatHappy
	add_special FindThatSpecies
	add_special FindThatSpeciesYourTrainerID
	add_special UnusedCheckUnusedTwoDayTimer
	add_special DayCareMon1
	add_special DayCareMon2
	add_special SelectRandomBugContestContestants
	add_special ActivateFishingSwarm
	add_special ToggleMaptileDecorations
	add_special ToggleDecorationsVisibility
	add_special GiveShuckle
	add_special ReturnShuckle
	add_special BillsGrandfather
	add_special CheckPokerus
	add_special DisplayCoinCaseBalance
	add_special DisplayMoneyAndCoinBalance
	add_special PlaceMoneyTopRight
	add_special CheckForLuckyNumberWinners
	add_special CheckLuckyNumberShowFlag
	add_special ResetLuckyNumberShowFlag
	add_special PrintTodaysLuckyNumber
	add_special SelectApricornForKurt
	add_special SpecialNameRater
	add_special DisplayLinkRecord
	add_special GetFirstPokemonHappiness
	add_special CheckFirstMonIsEgg
	add_special RandomUnseenWildMon
	add_special RandomPhoneWildMon
	add_special RandomPhoneMon
	add_special LoadUsedSpritesGFX
	add_special PlaySlowCry
	add_special SnorlaxAwake
	add_special YoungerHaircutBrother
	add_special OlderHaircutBrother
	add_special DaisysGrooming
	add_special PlayCurMonCry
	add_special ProfOaksPCBoot
	add_special GameboyCheck
	add_special TrainerHouse
	add_special PhotoStudio
	add_special InitRoamMons
	add_special FadeOutMusic
	add_special Functionc638
	add_special Functionc645
	add_special Function90a1b
	add_special Function90a54
	add_special Function90a8d
	add_special SpecialNone

SpecialNone: ; c389
	ret

GameCornerPrizeMonCheckDex: ; c38a
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
	callba NewPokedexEntry
	call ExitAllMenus
	ret

UnusedSetSeenMon: ; c3ac
	ld a, [wScriptVar]
	dec a
	call SetSeenMon
	ret

FindGreaterThanThatLevel: ; c3b4
	ld a, [wScriptVar]
	ld b, a
	callba PartySearch_MaximumLevel ; same bank
	jr z, asm_c3f2
	jr asm_c3ec

FindAtLeastThatHappy: ; c3c2
	ld a, [wScriptVar]
	ld b, a
	callba PartySearch_MinimumHappiness ; same bank
	jr z, asm_c3f2
	jr asm_c3ec

FindThatSpecies: ; c3d0
	ld a, [wScriptVar]
	ld b, a
	callba PartySearch_SameSpecies ; same bank
	jr z, asm_c3f2
	jr asm_c3ec

FindThatSpeciesYourTrainerID: ; c3de
	ld a, [wScriptVar]
	ld b, a
	callba PartySearch_SameSpeciesAndYourID ; same bank
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

NameRival: ; c3f7
	ld b, $2
	ld de, wRivalName
	callba NamingScreen_
	ld hl, wRivalName
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

OverworldTownMap: ; c41a (3:441a)
	call FadeToMenu
	callba Function9188a
	call ExitAllMenus
	ret

UnownPrinter: ; c427 (3:4427)
	call FadeToMenu
	callba Function16e3a
	call ExitAllMenus
	ret

DisplayLinkRecord: ; c434 (3:4434)
	call FadeToMenu
	callba Function3f55d
	call ExitAllMenus
	ret

PlayersHousePC: ; c441 (3:4441)
	xor a
	ld [wScriptVar], a
	callba Function159b0
	ld a, c
	ld [wScriptVar], a
	ret

CheckMysteryGift: ; c450 (3:4450)
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

GetMysteryGiftItem: ; c463 (3:4463)
	ld a, $0
	call OpenSRAM
	ld a, [$abe2]
	ld [wd002], a
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
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

UnownPuzzle: ; c4ba (3:44ba)
	call FadeToMenu
	callba Functione199d
	ld a, [wFieldMoveSucceeded]
	ld [wScriptVar], a
	call ExitAllMenus
	ret

SlotMachine: ; c4cd (3:44cd)
	call Functionc508
	ret c
	ld a, BANK(Function92c36)
	ld hl, Function92c36
	call Functionc4f4
	ret

CardFlip: ; c4da (3:44da)
	call Functionc508
	ret c
	ld a, BANK(Functione0909)
	ld hl, Functione0909
	call Functionc4f4
	ret

DummyNonfunctionalGameCornerGame: ; c4e7 (3:44e7)
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

ClearBGPalettesBufferScreen: ; c535 (3:4535)
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

UnusedCheckUnusedTwoDayTimer: ; c549 (3:4549)
	callba Function118f8
	ld a, [wUnusedTwoDayTimer]
	ld [wScriptVar], a
	ret

ActivateFishingSwarm: ; c556 (3:4556)
	ld a, [wScriptVar]
	ld [wFishingSwarmFlag], a
	jr .asm_c566

.asm_c55e
	ld a, d
	ld [wDunsparceMapGroup], a
	ld a, e
	ld [wDunsparceMapNumber], a
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
	ld [wFishingSwarmFlag], a
	ld [wDunsparceMapGroup], a
	ld [wDunsparceMapNumber], a
	ret

CheckPokerus: ; c588 (3:4588)
	callba Functionc7a40
	jp Functionc53c

ResetLuckyNumberShowFlag: ; c591 (3:4591)
	callba Function11917
	ClearFlag ENGINE_LUCKY_NUMBER_SHOW
	callba LoadOrRegenerateLuckyIDNumber
	ret

CheckLuckyNumberShowFlag: ; c5a3 (3:45a3)
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

SelectApricornForKurt: ; c5bb (3:45bb)
	callba Function24b8d
	ld a, c
	ld [wScriptVar], a
	and a
	ret z
	ld [wd002], a
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call TossItem
	ret

SnorlaxAwake: ; c5d6 (3:45d6)
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

PlayCurMonCry: ; c60b (3:460b)
	ld a, [wCurPartySpecies]
	jp PlayCry

GameboyCheck: ; c611 (3:4611)
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

FadeOutMusic: ; c628 (3:4628)
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

TrainerHouse: ; c652 (3:4652)
	ld a, $0
	call OpenSRAM
	ld a, [$abfd]
	ld [wScriptVar], a
	jp CloseSRAM
