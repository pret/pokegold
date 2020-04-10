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
	ld [wDisableTextAcceleration], a
	call Function5bf7
	ld b, $8
	call GetSGBLayout
	ld hl, wGameTimerPause
	res 0, [hl]
	call Function5ae4
	ld [wWhichIndexSet], a
	call Function5b27
	ld hl, .MenuDataHeader
	call LoadMenuHeader
	call Function5b0a
	call CloseWindow
	jr c, .asm_5a94
	call ClearTilemap
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
	ld a, [wSaveFileExists]
	and a
	jr nz, .asm_5af0
	ld a, $0
	ret

.asm_5af0
	ldh a, [hCGB]
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
	ld a, [wSaveFileExists]
	and a
	ret z
	xor a
	ldh [hBGMapMode], a
	call Function5b45
	ld hl, wOptions
	ld a, [hl]
	push af
	set 4, [hl]
	call Function5b5b
	pop af
	ld [wOptions], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

Function5b45: ; 5b45 (1:5b45)
	call CheckRTCStatus
	and $80
	jr nz, .asm_5b57
	hlcoord 0, 12
	ld b, $4
	ld c, $d
	call Textbox
	ret

.asm_5b57
	call SpeechTextbox
	ret

Function5b5b: ; 5b5b (1:5b5b)
	ld a, [wSaveFileExists]
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
	ldh a, [hHours]
	ld c, a
	farcall PrintHour
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
	text_far _ClockTimeUnknownText
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
	ldh [hMapAnims], a
	call ClearTilemap
	call LoadFontsExtra
	call LoadStandardFont
	call ClearWindowData
	ret

MainMenu_MysteryGift:
	call UpdateTime
	farcall Function11934
	farcall Function29dff
	ret

MainMenu_Options:
	farcall OptionsMenu
	ret

MainMenu_NewGame:
	xor a
	ld [wDebugFlags], a
	call Function5c3a
	call Function5bf7
	call OakSpeech
	call InitializeWorld
	ld a, $0
	ld [wceec], a
	ld a, $f1
	ldh [hMapEntryMethod], a
	jp FinishContinueFunction

Function5c3a: ; 5c3a (1:5c3a)
	xor a
	ldh [hBGMapMode], a
	call Function5c41
	ret

Function5c41: ; 5c41 (1:5c41)
	ld hl, wVirtualOAM
	ld bc, wOptions - wVirtualOAM
	xor a
	call ByteFill

	ld hl, wGameData
	ld bc, wGameDataEnd - wGameData
	xor a
	call ByteFill

	ldh a, [rLY]
	ldh [hSecondsBackup], a
	call DelayFrame
	ldh a, [hRandomSub]
	ld [wPlayerID], a

	ldh a, [rLY]
	ldh [hSecondsBackup], a
	call DelayFrame
	ldh a, [hRandomAdd]
	ld [wPlayerID + 1], a

	ld hl, wPartyCount
	call Function5d15

	xor a
	ld [wCurBox], a
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
	ld [wRoamMon1Species], a
	ld [wRoamMon2Species], a
	ld [wRoamMon3Species], a
	ld a, $ff
	ld [wRoamMon1MapGroup], a
	ld [wRoamMon2MapGroup], a
	ld [wRoamMon3MapGroup], a
	ld [wRoamMon1MapNumber], a
	ld [wRoamMon2MapNumber], a
	ld [wRoamMon3MapNumber], a

	ld a, BANK(sMysteryGiftItem)
	call OpenSRAM
	ld hl, sMysteryGiftItem
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

	farcall InitDecorations

	farcall DeletePartyMonMail

	call ResetGameTime
	ret

Function5d15: ; 5d15 (1:5d15)
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	ret

Function5d1a: ; 5d1a (1:5d1a)
	ld hl, wBoxNames
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
	ld hl, wBestMagikarpLengthFeet
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
	ld de, wRivalName
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
	farcall SpawnPlayer
	farcall InitializeStartDay_
	ret

LoadOrRegenerateLuckyIDNumber: ; 5da7 (1:5da7)
	ld a, 0
	call OpenSRAM
	ld a, [wCurDay]
	inc a
	ld b, a
	ld a, [sLuckyNumberDay]
	cp b
	ld a, [sLuckyIDNumber + 1]
	ld c, a
	ld a, [sLuckyIDNumber]
	jr z, .asm_5dc9
	ld a, b
	ld [sLuckyNumberDay], a
	call Random
	ld c, a
	call Random
.asm_5dc9
	ld [wLuckyIDNumber], a
	ld [sLuckyIDNumber], a
	ld a, c
	ld [wLuckyIDNumber + 1], a
	ld [sLuckyIDNumber + 1], a
	jp CloseSRAM

MainMenu_Continue:
	farcall TryLoadSaveFile
	jr c, .asm_5e41
	call LoadStandardMenuHeader
	call DisplaySaveInfoOnContinue
	ld a, $1
	ldh [hBGMapMode], a
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
	call ClearTilemap
	ld c, 20
	call DelayFrames
	farcall JumpRoamMons
	farcall MysteryGift_CopyReceivedDecosToPC
	farcall ClockContinue
	ld a, [wd1db]
	cp $1
	jr z, .asm_5e42
	ld a, $f2
	ldh [hMapEntryMethod], a
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
	ldh [hMapEntryMethod], a
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
	farcall OverworldLoop
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
	ldh [hBGMapMode], a
	ld hl, .MenuDataHeader_Dex
	CheckFlag ENGINE_POKEDEX
	jr nz, .asm_5ee7
	ld hl, .MenuDataHeader_NoDex
.asm_5ee7
	call _OffsetMenuHeader
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
	farcall InitClock ; What time is it?

	call RotateFourPalettesLeft
	call ClearTilemap

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
	call ClearTilemap

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
	call ClearTilemap

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
	call ClearTilemap

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
	text_far _OakText1
	db "@"

OakText2:
	text_far _OakText2
	text_asm
	ld a, MARILL
	call PlayMonCry
	call WaitSFX
	ld hl, OakText3 ; $606c
	ret

OakText3:
	text_far _OakText3
	db "@"

OakText4:
	text_far _OakText4
	db "@"

OakText5:
	text_far _OakText5
	db "@"

OakText6:
	text_far _OakText6
	db "@"

OakText7:
	text_far _OakText7
	db "@"

NamePlayer: ; 6085 (1:6085)
	call MovePlayerPicRight
	ld hl, .PlayerNamingChoices ; $60d9
	call SelectPresetName
	ld a, [wMenuCursorY]
	dec a
	jr z, .NewName
	ld de, wPlayerName
	call StorePlayerName
	farcall ApplyMonOrTrainerPals
	call MovePlayerPicLeft
	ret

.NewName
	ld b, $1
	ld de, wPlayerName
	farcall NamingScreen
	call RotateThreePalettesRight
	call ClearTilemap
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
	ld hl, wPlayerName
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
IF DEF(_GOLD)
	db "GOLD@"
	db "HIRO@"
	db "TAYLOR@"
	db "KARL@"
ENDC
IF DEF(_SILVER)
	db "SILVER@"
	db "KAMON@"
	db "OSCAR@"
	db "MAX@"
ENDC
	db 2, "NAME@"

SelectPresetName: ; 6108 (1:6108)
	call LoadMenuHeader
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
	ldh a, [hROMBank]
	push af

	ld a, 0 << 7 | 32 ; fade out
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeID + 1], a

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

	call Intro_PlaceChrisSprite
	call LoadFontsExtra

	ld c, 50
	call DelayFrames

	call RotateThreePalettesRight
	call ClearTilemap
	ret

MovePlayerPicRight: ; 617e (1:617e)
	hlcoord 6, 4
	ld de, $1
	jr MovePlayerPic

MovePlayerPicLeft: ; 6186 (1:6186)
	hlcoord 13, 4
	ld de, -1
MovePlayerPic:
	ld c, $8
.asm_618e
	push bc
	push hl
	push de
	xor a
	ldh [hBGMapMode], a
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ldh [hBGMapThird], a
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
	ldh [hWX], a
	call DelayFrame
	ld a, $e4
	call DmgToCgbBGPals
.asm_61d1
	call DelayFrame
	ldh a, [hWX]
	sub $8
	cp $ff
	ret z
	ldh [hWX], a
	jr .asm_61d1

Intro_PrepTrainerPic: ; 61df, 61e0 (1:61df, 1:61e0)
	ld de, $9000
	ld a, $14
	ld hl, $58a0
	rst FarCall
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ret

ShrinkFrame: ; 61f7 (1:61f7)
	ld de, $9000
	ld c, $31
	predef DecompressGet2bpp
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ret

Intro_PlaceChrisSprite: ; 6210 (1:6210)
	ld de, ChrisSpriteGFX
	lb bc, BANK(ChrisSpriteGFX), 12
	ld hl, $8000
	call Request2bpp
	ld hl, wVirtualOAM
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

IntroSequence: ; 6241 (1:6241)
	callfar Copyright_GFPresents
	jr c, StartTitleScreen
	callfar GoldSilverIntro
StartTitleScreen:
	call InitTitleScreen
	call DelayFrame
.asm_6255
	call TitleScreenFrame
	jr nc, .asm_6255
	call ClearSprites
	call ClearBGPalettes
	ld hl, rLCDC
	res 2, [hl]
	call ClearTilemap
	xor a
	ldh [hLCDCPointer], a
	ld b, $8
	call GetSGBLayout
	call UpdateTimePals
	ld a, [wce64]
	cp $5
	jr c, .asm_627b
	xor a
.asm_627b
	ld e, a
	ld d, $0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable
	dw MainMenu_
	dw DeleteSaveData
	dw IntroSequence
	dw IntroSequence
	dw ResetClock

InitTitleScreen: ; 6291 (1:6291)
	call ClearBGPalettes
	xor a
	ld [wTimeOfDayPal], a
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearTilemap
	call DisableLCD
	call ClearSprites
	xor a
	ldh [hBGMapMode], a
	ldh [hMapAnims], a
	ldh [hSCY], a
	ldh [hSCX], a
	ld hl, $8000
	ld bc, $2000
	xor a
	call ByteFill
	farcall ClearAnimatedObjectBuffer

	ld hl, TitleScreenGFX1
	ld de, $9000
	ld a, BANK(TitleScreenGFX1)
	call FarDecompress

	ld hl, TitleScreenGFX2
	ld de, $8800
	ld a, BANK(TitleScreenGFX2)
	call FarDecompress

	ld hl, TitleScreenGFX4
	ld de, $8000
	ld a, BANK(TitleScreenGFX4)
	call FarDecompress

	ld hl, TitleScreenGFX3
	ld de, $8f80
	ld bc, $80
	ld a, BANK(TitleScreenGFX3)
	call FarCopyBytes

	call Function636e
	call Function63b6
	ld hl, wAnimatedObjectDynamicVTileOffsets
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, rLCDC
	set 2, [hl]
	call EnableLCD
	xor a
	ld hl, wce63
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld de, $6058
	ld a, $2c ; HO-OH
	call InitSpriteAnimStruct
	ld hl, wAnimatedObjectStruct1
	ld de, wAnimatedObjectStruct10
	ld bc, $a
	call CopyBytes
	ld hl, wAnimatedObjectStruct1
	ld [hl], $0
	ld hl, wc700
	ld bc, $90
	xor a
	call ByteFill
	ld a, $43
	ldh [hLCDCPointer], a
	ld b, $c
	call GetSGBLayout
	call Function6341
	ld de, MUSIC_TITLE
	call PlayMusic
	ret

Function6341: ; 6341 (1:6341)
	ldh a, [hCGB]
	and a
	jr nz, .asm_6365
	ldh a, [hSGB]
	and a
	jr nz, .asm_6358
	ld a, $d8
	ldh [rBGP], a
IF DEF(_GOLD)
	ld a, $ff
	ldh [rOBP0], a
	ld a, $f8
ENDC
IF DEF(_SILVER)
	ld a, $f0
	ldh [rOBP0], a
	ld a, $f0
ENDC
	ldh [rOBP1], a
	ret

.asm_6358
	ld a, $e4
	ldh [rBGP], a
IF DEF(_GOLD)
	ld a, $ff
	ldh [rOBP0], a
	ld a, $e4
ENDC
IF DEF(_SILVER)
	ld a, $f0
	ldh [rOBP0], a
	ld a, $e0
ENDC
	ldh [rOBP1], a
	ret

.asm_6365
	ld a, $e4
	call DmgToCgbBGPals
IF DEF(_SILVER)
	ld a, $e0
ENDC
	call DmgToCgbObjPal0
	ret

Function636e: ; 636e (1:636e)
	ldh a, [hCGB]
	and a
	ret z
	ld a, $1
	ldh [rVBK], a
	ld hl, $9800
	ld bc, $240
	xor a
	call ByteFill
	ld hl, $9800
	ld bc, $714
	ld a, $1
	call Function63a6
	ld hl, $98c5
	ld bc, $10a
	ld a, $3
	call Function63a6
	ld hl, $9980
	ld bc, $a0
	ld a, $4
	call ByteFill
	ld a, $0
	ldh [rVBK], a
	ret

Function63a6: ; 63a6 (1:63a6)
	push bc
	push hl
.asm_63a8
	ld [hli], a
	dec c
	jr nz, .asm_63a8
	pop hl
	ld bc, $20
	add hl, bc
	pop bc
	dec b
	jr nz, Function63a6
	ret

Function63b6: ; 63b6 (1:63b6)
	ld hl, GSIntroTilemap ; $4616
	ld de, $9800
.asm_63bc
	ld a, BANK(GSIntroTilemap) ; $26
	call GetFarByte
	cp $ff
	jr z, .asm_63ca
	inc hl
	ld [de], a
	inc de
	jr .asm_63bc

.asm_63ca
	ldh a, [hCGB]
	and a
	ret nz
	ld hl, $9960
	ld bc, $20
	ld a, $50
	call ByteFill
	ret

TitleScreenFrame: ; 63da (1:63da)
	call Function63fe
	ld a, [wce63]
	bit 7, a
	jr nz, .asm_63fc
	call Function640f
	ld a, $1
	ldh [hOAMUpdate], a
	farcall AnimatedObjects_PlayFrame
	xor a
	ldh [hOAMUpdate], a
	call Function64b1
	call DelayFrame
	and a
	ret

.asm_63fc
	scf
	ret

Function63fe: ; 63fe (1:63fe)
IF DEF(_GOLD)
	ldh a, [hVBlankCounter]
	and $7
	ret nz
ENDC
	ld hl, wc75f
	ld a, [hl]
	dec a
	ld bc, $28
	call ByteFill
	ret

Function640f: ; 640f (1:640f)
	ld e, a
	ld d, $0
	ld hl, .Jumptable ; $641b
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable
	dw Function6426
	dw Function6434
	dw Function648b

Function6421:
	ld hl, wce63
	inc [hl]
	ret

Function6426:
	ld hl, wce63
	inc [hl]
	ld hl, wce65
IF DEF(_GOLD)
	ld de, $13c0
ENDC
IF DEF(_SILVER)
	ld de, $1140
ENDC
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Function6434:
	ld hl, wce65
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jr z, .asm_646b
	dec de
	ld [hl], d
	dec hl
	ld [hl], e
	call GetJoypad
	ld hl, hJoyDown
	ld a, [hl]
	and D_UP + B_BUTTON + SELECT
	cp  D_UP + B_BUTTON + SELECT
	jr z, .asm_6460
	ld a, [hl]
	and D_DOWN + B_BUTTON + SELECT
	cp  D_DOWN + B_BUTTON + SELECT
	jr z, .asm_6480
	ld a, [hl]
	and START | A_BUTTON
	jr nz, .asm_645c
	ret

.asm_645c
	ld a, $0
	jr .asm_6462

.asm_6460
	ld a, $1
.asm_6462
	ld [wce64], a
	ld hl, wce63
	set 7, [hl]
	ret

.asm_646b
	ld hl, wce63
	inc [hl]
	xor a
	ld [wMusicFadeID], a
	ld [wMusicFadeID + 1], a
	ld hl, wMusicFade
	ld [hl], $8
	ld hl, wce65
	inc [hl]
	ret

.asm_6480
	ld a, $4
	ld [wce64], a
	ld hl, wce63
	set 7, [hl]
	ret

Function648b:
	ld hl, wce65
	inc [hl]
	ld a, [wMusicFade]
	and a
	ret nz
	ld a, $2
	ld [wce64], a
	ld hl, wce63
	set 7, [hl]
	ret

DeleteSaveData:
	farcall DeleteSaveData_
	jp Init

ResetClock:
	farcall ResetClock_
	jp Init

Function64b1: ; 64b1 (1:64b1)
	ld a, [wce65]
	and $3
	ret nz
IF DEF(_GOLD)
	ld bc, wAnimatedObjectStruct10Index
	ld hl, $a
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, .Data_64e0
	add hl, de
	ld a, [wce65]
	and $4
	srl a
	srl a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	and a
	ret z
	ld e, a
	ld d, [hl]
ENDC

IF DEF(_SILVER)
	ld de, $7c58
ENDC
	ld a, $f
	call InitSpriteAnimStruct
	ret

IF DEF(_GOLD)
.Data_64e0:
	db $5c, $50, $00, $00
	db $5c, $68, $5c, $58
	db $5c, $68, $5c, $78
	db $5c, $88, $5c, $78
	db $00, $00, $5c, $78
	db $00, $00, $5c, $58
ENDC

Copyright:
	call ClearTilemap
	call LoadFontsExtra
	ld de, CopyrightGFX
	ld hl, vTiles2 tile $60
	lb bc, BANK(CopyrightGFX), 30
	call Request2bpp
	hlcoord 2, 7
	ld de, CopyrightString
	jp PlaceString

CopyrightString:
	db   $60, $61, $62, $63, $7a, $7b, $7c, $7d
	db   $65, $66, $67, $68, $69, $6a
	next $60, $61, $62, $63, $7a, $7b, $7c, $7d
	db   $6b, $6c, $6d, $6e, $6f, $70, $71, $72
	next $60, $61, $62, $63, $7a, $7b, $7c, $7d
	db   $73, $74, $75, $76, $77, $78, $79, $71, $72
	db   "@"

GameInit:: ; 6545 (1:6545)
	call ClearWindowData
	ld a, $5
	ld hl, $4f60
	rst FarCall
	jp IntroSequence
