MainMenu_:
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_MAIN_MENU
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
.asm_5a60
	xor a
	ld [wc1d6], a
	call Function5bf7
	ld b, $8
	call GetSGBLayout
	ld hl, wGameTimerPause
	res 0, [hl]
	call Function5ae4
	ld [wWhichIndexSet], a
	call Function5b27
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	call Function5b0a
	call CloseWindow
	jr c, .asm_5a94
	call ClearTileMap
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	jr .asm_5a60

.asm_5a94
	jp StartTitleScreen

.MenuDataHeader:
	db $40
	db 00, 00
	db 07, 14
	dw .MenuData2
	db 1

.MenuData2:
	db $80
	db 0
	dw MainMenuItems
	dw PlaceMenuStrings
	dw .Strings

.Strings:
	db "CONTINUE@"
	db "NEW GAME@"
	db "OPTION@"
	db "MYSTERY GIFT@"

.Jumptable:
	dw MainMenu_Continue ; 5dd9
	dw MainMenu_NewGame ; 5c1e
	dw MainMenu_Options ; 5c17
	dw MainMenu_MysteryGift ; 5c07

CONTINUE       EQU 0
NEW_GAME       EQU 1
OPTION         EQU 2
MYSTERY_GIFT   EQU 3

MainMenuItems:
	db 2
	db NEW_GAME
	db OPTION
	db -1

	db 3
	db CONTINUE
	db NEW_GAME
	db OPTION
	db -1

	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db -1

Function5ae4: ; 5ae4 (1:5ae4)
	nop
	nop
	nop
	ld a, [wd19a]
	and a
	jr nz, .asm_5af0
	ld a, $0
	ret

.asm_5af0
	ld a, [hCGB]
	cp $1
	ld a, $1
	ret nz
	ld a, $0
	call OpenSRAM
	ld a, [$abe5]
	cp $ff
	call CloseSRAM
	ld a, $1
	ret z
	ld a, $2
	ret

Function5b0a: ; 5b0a (1:5b0a)
	call SetUpMenu
.asm_5b0d
	call Function5b27
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp $2
	jr z, .asm_5b25
	cp $1
	jr z, .asm_5b20
	jr .asm_5b0d

.asm_5b20
	call PlayClickSFX
	and a
	ret

.asm_5b25
	scf
	ret

Function5b27: ; 5b27 (1:5b27)
	ld a, [wd19a]
	and a
	ret z
	xor a
	ld [hBGMapMode], a
	call Function5b45
	ld hl, wOptions
	ld a, [hl]
	push af
	set 4, [hl]
	call Function5b5b
	pop af
	ld [wOptions], a
	ld a, $1
	ld [hBGMapMode], a
	ret

Function5b45: ; 5b45 (1:5b45)
	call CheckRTCStatus
	and $80
	jr nz, .asm_5b57
	hlcoord 0, 12
	ld b, $4
	ld c, $d
	call TextBox
	ret

.asm_5b57
	call SpeechTextBox
	ret

Function5b5b: ; 5b5b (1:5b5b)
	ld a, [wd19a]
	and a
	ret z
	call CheckRTCStatus
	and $80
	jp nz, Function5b9c
	call UpdateTime
	hlcoord 1, 13
	ld bc, IncGradGBPalTable_11 + 1
	call ClearBox
	call GetWeekday
	ld b, a
	decoord 1, 14
	call Function5bb8
	decoord 4, 16
	ld a, [hHours]
	ld c, a
	callba PrintHour
	ld [hl], $9c
	inc hl
	ld de, hMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

.min
	db "min.@"

Function5b9c: ; 5b9c (1:5b9c)
	hlcoord 1, 14
	ld de, .TimeNotSet
	call PlaceString
	ret

.TimeNotSet
	db "TIME NOT SET@"

.UnusedText
	text_jump ClockTimeUnknownText_
	db "@"

Function5bb8: ; 5bb8 (1:5bb8)
	push de
	ld hl, .Days
	ld a, b
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	call PlaceString
	ret

.Days:
	db "SUN@"
	db "MON@"
	db "TUES@"
	db "WEDNES@"
	db "THURS@"
	db "FRI@"
	db "SATUR@"
.Day:
	db "DAY@"

Function5bf7: ; 5bf7 (1:5bf7)
	xor a
	ld [hMapAnims], a
	call ClearTileMap
	call LoadFontsExtra
	call Functiond9e
	call ClearWindowData
	ret

MainMenu_MysteryGift:
	call UpdateTime
	callba Function11934
	callba Function29dff
	ret

MainMenu_Options:
	callba OptionsMenu
	ret

MainMenu_NewGame:
	xor a
	ld [wMonStatusFlags], a
	call Function5c3a
	call Function5bf7
	call OakSpeech
	call InitializeWorld
	ld a, $0
	ld [wceec], a
	ld a, $f1
	ld [hMapEntryMethod], a
	jp FinishContinueFunction

Function5c3a: ; 5c3a (1:5c3a)
	xor a
	ld [hBGMapMode], a
	call Function5c41
	ret

Function5c41: ; 5c41 (1:5c41)
	ld hl, wOAMBuffer
	ld bc, wOptions - wOAMBuffer
	xor a
	call ByteFill

	ld hl, wGameData
	ld bc, wGameDataEnd - wGameData
	xor a
	call ByteFill

	ld a, [rLY]
	ld [hSecondsBackup], a
	call DelayFrame
	ld a, [hRandomSub]
	ld [wPlayerID], a

	ld a, [rLY]
	ld [hSecondsBackup], a
	call DelayFrame
	ld a, [hRandomAdd]
	ld [wPlayerID + 1], a

	ld hl, wPartyCount
	call Function5d15

	xor a
	ld [wd8bc], a
	ld [wSavedAtLeastOnce], a

	call Function5d1a

	ld a, BANK(sBoxCount)
	call OpenSRAM
	ld hl, sBoxCount
	call Function5d15
	call CloseSRAM

	ld hl, wNumItems
	call Function5d15
	ld hl, wNumKeyItems
	call Function5d15
	ld hl, wNumBalls
	call Function5d15
	ld hl, wPCItems
	call Function5d15

	xor a
	ld [wdd1a], a
	ld [wdd21], a
	ld [wdd28], a
	ld a, $ff
	ld [wdd1c], a
	ld [wdd23], a
	ld [wdd2a], a
	ld [wdd1d], a
	ld [wdd24], a
	ld [wdd2b], a

	ld a, BANK(s0_abe2)
	call OpenSRAM
	ld hl, s0_abe2
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	call CloseSRAM

	call LoadOrRegenerateLuckyIDNumber
	call InitializeMagikarpHouse

	xor a
	ld [wMonType], a

	ld [wJohtoBadges], a
	ld [wKantoBadges], a

	ld [wCoins], a
	ld [wCoins + 1], a

START_MONEY EQU 3000

IF START_MONEY / $10000
	ld a, START_MONEY / $10000
ENDC
	ld [wMoney], a
	ld a, START_MONEY / $100 % $100
	ld [wMoney + 1], a
	ld a, START_MONEY % $100
	ld [wMoney + 2], a

	xor a
	ld [wd961], a

	ld hl, wMomItemTriggerBalance
	ld [hl], 2300 / $10000
	inc hl
	ld [hl], 2300 / $100 % $100
	inc hl
	ld [hl], 2300 % $100

	call Function5d5d

	callba InitDecorations

	callba DeletePartyMonMail

	call ResetGameTime
	ret

Function5d15: ; 5d15 (1:5d15)
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	ret

Function5d1a: ; 5d1a (1:5d1a)
	ld hl, wd8bf
	ld c, $0
.asm_5d1f
	push hl
	ld de, .Box
	call CopyName2
	dec hl
	ld a, c
	inc a
	cp 10
	jr c, .asm_5d32
	sub 10
	ld [hl], "1"
	inc hl
.asm_5d32
	add "0"
	ld [hli], a
	ld [hl], "@"
	pop hl
	ld de, 9
	add hl, de
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .asm_5d1f
	ret

.Box db "BOX@"

InitializeMagikarpHouse: ; 5d47 (1:5d47)
	ld hl, wdd33
	ld a, 3
	ld [hli], a
	ld a, 6
	ld [hli], a
	ld de, .Ralph
	call CopyName2
	ret

.Ralph db "RALPH@"

Function5d5d: ; 5d5d (1:5d5d)
	ld hl, .Rival
	ld de, wRivalsName
	call .CopyName
	ld hl, .Mom
	ld de, wMomsName
	call .CopyName
	ld hl, .Red
	ld de, wRedsName
	call .CopyName
	ld hl, .Green
	ld de, wGreensName
.CopyName:
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

.Rival:  db "???@"
.Red:    db "RED@"
.Green:  db "GREEN@"
.Mom:    db "MOM@"

InitializeWorld: ; 5d97 (1:5d97)
	call ShrinkPlayer
	callba SpawnPlayer
	callba InitializeStartDay_
	ret

LoadOrRegenerateLuckyIDNumber: ; 5da7 (1:5da7)
	ld a, $0
	call OpenSRAM
	ld a, [wCurDay]
	inc a
	ld b, a
	ld a, [s0_ac68]
	cp b
	ld a, [s0_ac6a]
	ld c, a
	ld a, [s0_ac69]
	jr z, .asm_5dc9
	ld a, b
	ld [s0_ac68], a
	call Random
	ld c, a
	call Random
.asm_5dc9
	ld [wd9e9], a
	ld [s0_ac69], a
	ld a, c
	ld [wd9ea], a
	ld [s0_ac6a], a
	jp CloseSRAM

MainMenu_Continue:
	callba TryLoadSaveFile
	jr c, .asm_5e41
	call LoadStandardMenuDataHeader
	call DisplaySaveInfoOnContinue
	ld a, $1
	ld [hBGMapMode], a
	ld c, 20
	call DelayFrames
	call ConfirmContinue
	jr nc, .asm_5dfa
	call CloseWindow
	jr .asm_5e41

.asm_5dfa
	call Continue_CheckRTC_RestartClock
	jr nc, .asm_5e04
	call CloseWindow
	jr .asm_5e41

.asm_5e04
	ld a, $8
	ld [wMusicFade], a
	ld a, MUSIC_NONE % $100
	ld [wMusicFadeID], a
	ld a, MUSIC_NONE / $100
	ld [wMusicFadeID + 1], a
	call ClearBGPalettes
	call CloseWindow
	call ClearTileMap
	ld c, 20
	call DelayFrames
	callba JumpRoamMons
	callba MysteryGift_CopyReceivedDecosToPC
	callba ClockContinue
	ld a, [wd1db]
	cp $1
	jr z, .asm_5e42
	ld a, $f2
	ld [hMapEntryMethod], a
	jp FinishContinueFunction

.asm_5e41
	ret

.asm_5e42
	ld a, $e
	ld [wceec], a
	call PostCreditsSpawn
	jp FinishContinueFunction

SpawnAfterRed: ; 5e4d (1:5e4d)
	ld a, $1a
	ld [wceec], a
PostCreditsSpawn: ; 5e52 (1:5e52)
	xor a
	ld [wd1db], a
	ld a, $f1
	ld [hMapEntryMethod], a
	ret

ConfirmContinue: ; 5e5b (1:5e5b)
	call DelayFrame
	call GetJoypad
	ld hl, hJoyPressed
	bit 0, [hl]
	jr nz, .asm_5e6e
	bit 1, [hl]
	jr z, ConfirmContinue
	scf
	ret

.asm_5e6e
	ret

Continue_CheckRTC_RestartClock: ; 5e6f (1:5e6f)
	call CheckRTCStatus
	and $80
	jr z, .asm_5e82
	ld a, $8
	ld hl, $4021
	rst FarCall
	ld a, c
	and a
	jr z, .asm_5e82
	scf
	ret

.asm_5e82
	xor a
	ret

FinishContinueFunction: ; 5e84 (1:5e84)
	xor a
	ld [wDontPlayMapMusicOnReload], a
	ld hl, wGameTimerPause
	set 0, [hl]
	callba OverworldLoop
	ld a, [wd1db]
	cp $2
	jr z, .asm_5e9d
	jp Reset

.asm_5e9d
	call SpawnAfterRed
	jr FinishContinueFunction

DisplaySaveInfoOnContinue: ; 5ea2 (1:5ea2)
	call CheckRTCStatus
	and $80
	jr z, .asm_5eb0
	lb de, 4, 8
	call DisplayContinueDataWithRTCError
	ret

.asm_5eb0
	lb de, 4, 8
	call DisplayNormalContinueData
	ret

DisplayNormalContinueData: ; 5eb7 (1:5eb7)
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDex
	call Continue_PrintGameTime
	call LoadFontsExtra
	call UpdateSprites
	ret

DisplayContinueDataWithRTCError: ; 5ec7 (1:5ec7)
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDex
	call Continue_UnknownGameTime
	call LoadFontsExtra
	call UpdateSprites
	ret

Continue_LoadMenuHeader: ; 5ed7 (1:5ed7)
	xor a
	ld [hBGMapMode], a
	ld hl, .MenuDataHeader_Dex
	CheckFlag ENGINE_POKEDEX
	jr nz, .asm_5ee7
	ld hl, .MenuDataHeader_NoDex
.asm_5ee7
	call OffsetMenuDataHeader_
	call MenuBox
	call PlaceVerticalMenuItems
	ret

.MenuDataHeader_Dex:
	db $40
	db 00, 00
	db 09, 15
	dw .MenuData2_Dex
	db 1

.MenuData2_Dex
	db $00
	db 4
	db "PLAYER <PLAYER>@"
	db "BADGES@"
	db "#DEX@"
	db "TIME@"

.MenuDataHeader_NoDex:
	db $40
	db 00, 00
	db 09, 15
	dw .MenuData2_NoDex
	db 1

.MenuData2_NoDex
	db $00
	db 4
	db "PLAYER <PLAYER>@"
	db "BADGES@"
	db " @"
	db "TIME@"

Continue_DisplayBadgesDex: ; 5f36 (1:5f36)
	call MenuBoxCoord2Tile
	push hl
	decoord 13, 4, 0
	add hl, de
	call Continue_DisplayBadgeCount
	pop hl
	push hl
	decoord 12, 6, 0
	add hl, de
	call Continue_DisplayPokedexNumCaught
	pop hl
	ret

Continue_PrintGameTime: ; 5f4c (1:5f4c)
	decoord 9, 8, 0
	add hl, de
	call Continue_DisplayGameTime
	ret

Continue_UnknownGameTime: ; 5f54 (1:5f54)
	decoord 9, 8, 0
	add hl, de
	ld de, .three_question_marks
	call PlaceString
	ret

.three_question_marks
	db " ???@"

Continue_DisplayBadgeCount: ; 5f64 (1:5f64)
	push hl
	ld hl, wJohtoBadges
	ld b, $2
	call CountSetBits
	pop hl
	ld de, wd151
	lb bc, 1, 2
	jp PrintNum

Continue_DisplayPokedexNumCaught: ; 5f77 (1:5f77)
	CheckFlag ENGINE_POKEDEX
	ret z
	push hl
	ld hl, wPokedexCaught
IF NUM_POKEMON % 8
	ld b, NUM_POKEMON / 8 + 1
ELSE
	ld b, NUM_POKEMON / 8
ENDC
	call CountSetBits
	pop hl
	ld de, wd151
	lb bc, 1, 3
	jp PrintNum

Continue_DisplayGameTime: ; 5f90 (1:5f90)
	ld de, wGameTimeHours
	lb bc, 2, 3
	call PrintNum
	ld [hl], $6d
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

OakSpeech: ; 5fa5 (1:5fa5)
	callba InitClock ; What time is it?

	call RotateFourPalettesLeft
	call ClearTileMap

	ld de, MUSIC_ROUTE_30
	call PlayMusic

	call RotateFourPalettesRight
	call RotateThreePalettesRight

	xor a
	ld [wCurPartySpecies], a
	ld a, POKEMON_PROF
	ld [wTrainerClass], a
	call Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout

	call Intro_FadeInFrontpic

	ld hl, OakText1
	call PrintText

	call RotateThreePalettesRight
	call ClearTileMap

	ld a, MARILL
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData
	hlcoord 6, 4
	hlcoord 6, 4 ; TriHard
	call PrepMonFrontpic

	xor a
	ld [wTempMonDVs], a
	ld [wTempMonDVs + 1], a
	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout

	call Intro_WipeInFrontpic

	ld hl, OakText2
	call PrintText

	ld hl, OakText4
	call PrintText

	call RotateThreePalettesRight
	call ClearTileMap

	xor a
	ld [wCurPartySpecies], a
	ld a, POKEMON_PROF
	ld [wTrainerClass], a
	call Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout

	call Intro_FadeInFrontpic

	ld hl, OakText5
	call PrintText

	call RotateThreePalettesRight
	call ClearTileMap

	xor a
	ld [wCurPartySpecies], a
	ld a, CAL
	ld [wTrainerClass], a
	call Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout

	call Intro_FadeInFrontpic

	ld hl, OakText6
	call PrintText

	call NamePlayer

	ld hl, OakText7
	call PrintText
	ret

OakText1:
	text_jump OakText1_
	db "@"

OakText2:
	text_jump OakText2_
	start_asm
	ld a, MARILL
	call PlayCry
	call WaitSFX
	ld hl, OakText3 ; $606c
	ret

OakText3:
	text_jump OakText3_
	db "@"

OakText4:
	text_jump OakText4_
	db "@"

OakText5:
	text_jump OakText5_
	db "@"

OakText6:
	text_jump OakText6_
	db "@"

OakText7:
	text_jump OakText7_
	db "@"

NamePlayer: ; 6085 (1:6085)
	call MovePlayerPicRight
	ld hl, .PlayerNamingChoices ; $60d9
	call SelectPresetName
	ld a, [wMenuCursorY]
	dec a
	jr z, .NewName
	ld de, wPlayersName
	call StorePlayerName
	callba ApplyMonOrTrainerPals
	call MovePlayerPicLeft
	ret

.NewName
	ld b, $1
	ld de, wPlayersName
	callba NamingScreen
	call RotateThreePalettesRight
	call ClearTileMap
	call LoadFontsExtra
	call WaitBGMap
	xor a
	ld [wCurPartySpecies], a
	ld a, CAL
	ld [wTrainerClass], a
	call Intro_PrepTrainerPic
	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call RotateThreePalettesLeft
	ld hl, wPlayersName
	ld de, .GoldSilver
	call InitName
	ret

.PlayerNamingChoices:
	db $40
	db 00, 00
	db 11, 10
	dw .MenuData2
	db 1

.MenuData2:
	db $91
	db 5
	db "NEW NAME@"
.GoldSilver:
IF DEF(GOLD)
	db "GOLD@"
	db "HIRO@"
	db "TAYLOR@"
	db "KARL@"
ENDC
IF DEF(SILVER)
	db "SILVER@"
	db "KAMON@"
	db "OSCAR@"
	db "MAX@"
ENDC
	db 2, "NAME@"

SelectPresetName: ; 6108 (1:6108)
	call LoadMenuDataHeader
	call VerticalMenu
	ld a, [wMenuCursorY]
	dec a
	call CopyNameFromMenu
	call CloseWindow
	ret

StorePlayerName: ; 6119 (1:6119)
	ld hl, wStringBuffer2
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

ShrinkPlayer: ; 6123 (1:6123)
	ld a, [hROMBank]
	push af

	ld a, 0 << 7 | 32 ; fade out
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeIDHi], a

	ld de, SFX_ESCAPE_ROPE
	call PlaySFX
	pop af
	rst Bankswitch

	ld c, 8
	call DelayFrames

	ld hl, Shrink1Pic
	ld b, BANK(Shrink1Pic)
	call ShrinkFrame

	ld c, 8
	call DelayFrames

	ld hl, Shrink2Pic
	ld b, BANK(Shrink2Pic)
	call ShrinkFrame

	ld c, 8
	call DelayFrames

	hlcoord 6, 5
	ld b, 7
	ld c, 7
	call ClearBox

	ld c, 3
	call DelayFrames

	call Intro_PlacePlayerSprite
	call LoadFontsExtra

	ld c, 50
	call DelayFrames

	call RotateThreePalettesRight
	call ClearTileMap
	ret

MovePlayerPicRight: ; 617e (1:617e)
	hlcoord 6, 4
	ld de, $1
	jr MovePlayerPic

MovePlayerPicLeft: ; 6186 (1:6186)
	hlcoord 13, 4
	ld de, -1
MovePlayerPic
	ld c, $8
.asm_618e
	push bc
	push hl
	push de
	xor a
	ld [hBGMapMode], a
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ld [hBGMapThird], a
	call WaitBGMap
	call DelayFrame
	pop de
	pop hl
	add hl, de
	pop bc
	dec c
	jr nz, .asm_618e
	ret

Intro_FadeInFrontpic: ; 61ad (1:61ad)
	ld hl, IntroFadePalettes
	ld b, $6
.asm_61b2
	ld a, [hli]
	call DmgToCgbBGPals
	ld c, $a
	call DelayFrames
	dec b
	jr nz, .asm_61b2
	ret

IntroFadePalettes:
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100

Intro_WipeInFrontpic: ; 61c5 (1:61c5)
	ld a, $77
	ld [hWX], a
	call DelayFrame
	ld a, $e4
	call DmgToCgbBGPals
.asm_61d1
	call DelayFrame
	ld a, [hWX]
	sub $8
	cp $ff
	ret z
	ld [hWX], a
	jr .asm_61d1

Intro_PrepTrainerPic: ; 61df, 61e0 (1:61df, 1:61e0)
	ld de, $9000
	ld a, $14
	ld hl, $58a0
	rst FarCall
	xor a
	ld [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ret

ShrinkFrame: ; 61f7 (1:61f7)
	ld de, $9000
	ld c, $31
	predef DecompressPredef
	xor a
	ld [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ret

Intro_PlacePlayerSprite: ; 6210 (1:6210)
	ld de, PlayerIcon
	lb bc, BANK(PlayerIcon), 12
	ld hl, $8000
	call Request2bpp
	ld hl, wOAMBuffer
	ld de, .OAMData
	ld a, [de]
	inc de
	ld c, a
.asm_6225
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	xor a
	ld [hli], a
	dec c
	jr nz, .asm_6225
	ret

.OAMData
	db 4
	db  9 * 8 + 4,  9 * 8, 0
	db  9 * 8 + 4, 10 * 8, 1
	db 10 * 8 + 4,  9 * 8, 2
	db 10 * 8 + 4, 10 * 8, 3
