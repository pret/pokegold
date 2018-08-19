INCLUDE "includes.asm"

SECTION "bank1", ROMX, BANK[$1]
PlaceWaitingText:: ; 4000 (1:4000)
	hlcoord 3, 10
	ld b, $1
	ld c, $b
	ld a, [wBattleMode]
	and a
	jr z, .asm_4012
	call TextBox
	jr .asm_4017

.asm_4012
	predef Predef_LinkTextbox
.asm_4017
	hlcoord 4, 11
	ld de, .Waiting
	call PlaceString
	ld c, 50
	jp DelayFrames

.Waiting:
	db "Waiting...!@"

Predef1:
	ret

LoadPushOAM:: ; 4032 (1:4032)
	ld c, hPushOAM - $ff00
	ld b, PushOAMEnd - PushOAM
	ld hl, PushOAM
.asm_4039
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_4039
	ret

PushOAM:
	ld a, wOAMBuffer / $100
	ld [rDMA], a
	ld a, $28
.asm_4046
	dec a
	jr nz, .asm_4046
	ret

PushOAMEnd

INCLUDE "engine/overworld/map_objects.asm"
INCLUDE "engine/main_menu.asm"
INCLUDE "engine/title.asm"

ReanchorBGMap_NoOAMUpdate:: ; 6551 (1:6551)
	call DelayFrame
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	call Function656b
	pop af
	ld [hBGMapMode], a
	pop af
	ld [hOAMUpdate], a
	ret

Function656b: ; 656b (1:656b)
	xor a
	ld [hLCDCPointer], a
	ld [hBGMapMode], a
	ld hl, wd565
	set 7, [hl]
	res 2, [hl]
	ld a, $90
	ld [hWY], a
	call OverworldTextModeSwitch
	ld a, $9c
	call .LoadBGMapAddrIntoHRAM
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	xor a
	ld [hBGMapMode], a
	ld [hWY], a
	ld a, $98
	call .LoadBGMapAddrIntoHRAM
	call .WaitTransfer
	xor a
	ld [wd05b], a
	ld a, $98
	ld [wd05c], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	call ApplyBGMapAnchorToObjects
	ret

.LoadBGMapAddrIntoHRAM: ; 65a5 (1:65a5)
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ret

.WaitTransfer: ; 65ab (1:65ab)
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	ld a, $3
	ld [hFF9E], a
.asm_65bc
	call DelayFrame
	ld a, [hFF9E]
	and a
	jr nz, .asm_65bc
	pop af
	ld [hOAMUpdate], a
	pop af
	ld [hBGMapMode], a
	ret

LoadFonts_NoOAMUpdate:: ; 65cb (1:65cb)
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call .LoadGFX
	pop af
	ld [hOAMUpdate], a
	ret

.LoadGFX: ; 65d9 (1:65d9)
	call LoadFontsExtra
	ld a, $90
	ld [hWY], a
	call SafeUpdateSprites
	call Functiond9e
	ret

INCLUDE "engine/learn.asm"

CheckNickErrors:: ; 677e (1:677e)
	push bc
	push de
	ld b, MON_NAME_LENGTH
.checkchar
	ld a, [de]
	cp "@"
	jr z, .done
	ld hl, .textcommands
	dec hl
.loop
	inc hl
	ld a, [hl]
	cp $ff
	jr z, .next
	ld a, [de]
	cp [hl]
	inc hl
	jr c, .loop
	cp [hl]
	jr nc, .loop
	ld a, "?"
	ld [de], a
	jr .loop

.next
	inc de
	dec b
	jr nz, .checkchar
	pop de
	push de
	ld a, "?"
	ld [de], a
	inc de
	ld a, "@"
	ld [de], a
.done
	pop de
	pop bc
	ret

.textcommands
; table defining which characters are actually text commands
; format:
	;      ≥           <
	db "<START>",  $04       + 1
	db "<PLAY_G>", $18       + 1
	db $1d,        "%"       + 1
	db $35,        "<GREEN>" + 1
	db "<ENEMY>",  "<ENEMY>" + 1
	db $49,        "<TM>"    + 1
	db "<ROCKET>", "┘"       + 1
	db -1 ; end

INCLUDE "engine/math.asm"
ItemAttributes:
INCLUDE "items/item_attributes.asm"
INCLUDE "engine/overworld/npc_movement.asm"
INCLUDE "engine/events/happiness_egg.asm"
INCLUDE "engine/events/shuckle.asm"
INCLUDE "engine/events/haircut.asm"

SECTION "bank2", ROMX, BANK[$2]
SwapTextboxPalettes::
	ld hl, wTileMap
	ld de, wAttrMap
	ld b, $12
.asm_8008
	ld c, $14
.asm_800a
	ld a, [hli]
	push hl
	srl a
	jr c, .asm_8024
	ld hl, wTilesetPalettes
	add [hl]
	ld l, a
	ld a, [wTilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	and $f
	bit 3, a
	jr z, .asm_8045
	jr .asm_8038

.asm_8024
	ld hl, wTilesetPalettes
	add [hl]
	ld l, a
	ld a, [wTilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	swap a
	and $f
	bit 3, a
	jr z, .asm_8045
.asm_8038
	ld a, [wMapGroup]
	dec a
	ld hl, Unknown85d7
	add l
	ld l, a
	jr nc, .asm_8044
	inc h
.asm_8044
	ld a, [hl]
.asm_8045
	pop hl
	ld [de], a
	inc de
	dec c
	jr nz, .asm_800a
	dec b
	jr nz, .asm_8008
	ret

ScrollBGMapPalettes:: ; 804f (2:404f)
	ld hl, wBGMapBuffer
	ld de, wBGMapPalBuffer
.asm_8055
	ld a, [hli]
	push hl
	srl a
	jr c, .asm_806f
	ld hl, wTilesetPalettes
	add [hl]
	ld l, a
	ld a, [wTilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	and $f
	bit 3, a
	jr z, .asm_8090
	jr .asm_8083

.asm_806f
	ld hl, wTilesetPalettes
	add [hl]
	ld l, a
	ld a, [wTilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	swap a
	and $f
	bit 3, a
	jr z, .asm_8090
.asm_8083
	ld a, [wMapGroup]
	dec a
	ld hl, Unknown85d7
	add l
	ld l, a
	jr nc, .asm_808f
	inc h
.asm_808f
	ld a, [hl]
.asm_8090
	pop hl
	ld [de], a
	inc de
	dec c
	jr nz, .asm_8055
	ret

INCLUDE "gfx/tilesets/palette_maps.asm"

Unknown85d7:
	rept 26 ; NUM_MAP_GROUPS
	db PAL_BG_ROOF
	endr

INCLUDE "engine/overworld/player_object.asm"
INCLUDE "engine/sine.asm"
INCLUDE "engine/predef.asm"
INCLUDE "engine/color.asm"

SECTION "bank3", ROMX, BANK[$3]
CheckTime::
	ld a, [wTimeOfDay]
	ld hl, TimeOfDayTable
	ld de, $2
	call IsInArray
	inc hl
	ld c, [hl]
	ret c
	xor a
	ld c, a
	ret

TimeOfDayTable: ; c012
	db MORN, 1 << MORN
	db DAY,  1 << DAY
	db NITE, 1 << NITE
	db NITE, 1 << NITE
	db -1

INCLUDE "engine/engine_flags.asm"
INCLUDE "engine/variables.asm"
INCLUDE "engine/specials.asm"

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

INCLUDE "engine/health.asm"
INCLUDE "engine/events/overworld.asm"
INCLUDE "engine/items.asm"
INCLUDE "engine/overworld/player_step.asm"
INCLUDE "engine/anim_hp_bar.asm"
INCLUDE "engine/move_mon.asm"
INCLUDE "engine/billspctop.asm"

Functione673: ; e673 (3:6673)
	ld hl, wBreedMon1Species
	ld de, wTempMonSpecies
	ld bc, $20
	call CopyBytes
	callab CalcLevel
	ld a, [wBreedMon1Level]
	ld b, a
	ld a, d
	ld e, a
	sub b
	ld d, a
	ret

Functione68e: ; e68e (3:668e)
	ld hl, wBreedMon2Species
	ld de, wTempMon
	ld bc, $20
	call CopyBytes
	callab CalcLevel
	ld a, [wBreedMon2Level]
	ld b, a
	ld a, d
	ld e, a
	sub b
	ld d, a
	ret

PartySearch_MaximumLevel: ; e6a9 (3:66a9)
	ld hl, wPartyMon1Level
	call PartySearch_LessThanValue
	ret

PartySearch_MinimumHappiness: ; e6b0 (3:66b0)
	ld hl, wPartyMon1Happiness
	call PartySearch_GreaterThanOrEqualToValue
	ret

PartySearch_SameSpecies: ; e6b7 (3:66b7)
	ld hl, wPartyMons
	jp PartySearch_GetIndexOfSpeciesInParty

PartySearch_SameSpeciesAndYourID: ; e6bd (3:66bd)
	ld hl, wPartyMon1
	call PartySearch_GetIndexOfSpeciesInParty
	ret z
	ld a, c
	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [wPlayerID]
	cp [hl]
	jr nz, .nope
	inc hl
	ld a, [wPlayerID + 1]
	cp [hl]
	jr nz, .nope
	ld a, $1
	and a
	ret

.nope
	xor a
	ret

PartySearch_GreaterThanOrEqualToValue: ; e6e1 (3:66e1)
	ld c, $0
	ld a, [wPartyCount]
	ld d, a
.loop
	ld a, d
	dec a
	push hl
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, b
	cp [hl]
	pop hl
	jr z, .shift
	jr nc, .skip
.shift
	ld a, c
	or $1
	ld c, a
.skip
	sla c
	dec d
	jr nz, .loop
	call PartySearch_FilterEggs
	ld a, c
	and a
	ret

PartySearch_LessThanValue: ; e708 (3:6708)
	ld c, $0
	ld a, [wPokemonData]
	ld d, a
.loop
	ld a, d
	dec a
	push hl
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, b
	cp [hl]
	pop hl
	jr c, .skip
	ld a, c
	or $1
	ld c, a
.skip
	sla c
	dec d
	jr nz, .loop
	call PartySearch_FilterEggs
	ld a, c
	and a
	ret

PartySearch_GetIndexOfSpeciesInParty: ; e72d (3:672d)
	ld c, -1
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp $ff
	ret z
	inc c
	cp b
	jr nz, .loop
	ld a, $1
	and a
	ret

PartySearch_FilterEggs: ; e73e (3:673e)
	ld e, $FF ^ 1
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp $ff
	ret z
	cp EGG
	jr nz, .not_egg
	ld a, c
	and e
	ld c, a
.not_egg
	rlc e
	jr .loop

BugContest_SetCaughtContestMon:
	ld a, [wContestMonSpecies]
	and a
	jr z, .asm_e76e
	ld [wd151], a
	callba DisplayAlreadyCaughtText
	callba DisplayCaughtContestMonStats
	lb bc, 14, 7
	call PlaceYesNoBox
	ret c
.asm_e76e
	call GenerateBugContestMonStats
	ld a, [wTempEnemyMonSpecies]
	ld [wd151], a
	call GetPokemonName
	ld hl, Text_CaughtBugMon
	call PrintText
	ret

GenerateBugContestMonStats: ; e781 (3:6781)
	ld a, [wTempEnemyMonSpecies]
	ld [wCurSpecies], a
	ld [wd004], a
	call GetBaseData
	xor a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wContestMon
	call ByteFill
	xor a
	ld [wMonType], a
	ld hl, wContestMon
	jp GeneratePartyMonStats

Text_CaughtBugMon:
	; Caught @ !
	text_jump Text_CaughtBugMon_
	db "@"

INCLUDE "items/item_effects.asm"

KnowsMove:
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld a, [wd14d]
	ld b, a
	ld c, $4
.asm_fa28
	ld a, [hli]
	cp b
	jr z, .asm_fa31
	dec c
	jr nz, .asm_fa28
	and a
	ret

.asm_fa31
	ld hl, Text_KnowsMove
	call PrintText
	scf
	ret

Text_KnowsMove:
	text_jump Text_KnowsMove_
	db "@"

SECTION "bank4", ROMX, BANK[$4]

INCLUDE "engine/overworld/player_movement.asm"
INCLUDE "engine/pack.asm"
INCLUDE "engine/overworld/time.asm"
INCLUDE "engine/learn_tm.asm"
INCLUDE "engine/namingscreen.asm"

AbortBugCatchingContest::
	dr $1269a, $126fd
HealMachineAnim:
	dr $126fd, $12947

ItemfinderFunction:
	dr $12947, $12e33

PartyMonItemName::
	dr $12e33, $12fa0
Function12fa0:
	dr $12fa0, $1399d
GiveParkBalls:
	dr $1399d, $13a5f
Function13a5f:
	dr $13a5f, $13d44
ApplyPokerusTick:
	dr $13d44, $13d64
SelectRandomBugContestContestants:
	dr $13d64, $13dce
ContestDropOffMons:
	dr $13dce, $13ded
ContestReturnMons:
	dr $13ded, $13e03

SECTION "bank5", ROMX, BANK[$5]
	dr $14000, $14032
Function14032:: ; 14032
	dr $14032, $14089
StartClock:: ; 14089
	dr $14089, $140dc
ClockContinue: ; 140dc
	dr $140dc, $140ff
Function140ff:: ; 140ff
	dr $140ff, $1413c
Function1413c:: ; 1413c
	dr $1413c, $1414b
RefreshSprites:: ; 1414b
	dr $1414b, $1415c
Function1415c:: ; 1415c
	dr $1415c, $1416d
Function1416d:: ; 1416d
	dr $1416d, $14226
Function14226:
	dr $14226, $14317
DoesSpriteHaveFacings_:: ; 14317
	dr $14317, $14334
GetSpritePalette_:: ; 14334
	dr $14334, $14a18
Function14a18:: ; 14a18
	dr $14a18, $14a2d
Function14a2d:: ; 14a2d
	dr $14a2d, $14a44
Function14a44: ; 14a44
	dr $14a44, $14a73
CheckCutCollision:
	dr $14a73, $14bd2
StartMovePkmnWOMail_SaveGame:
	dr $14bd2, $14ef5
TryLoadSaveFile: ; 14ef5
	dr $14ef5, $15484
RunMapSetupScript::
	dr $15484, $1560c
DelayLoadingNewSprites:
	dr $1560c, $15612
Function15612:: ; 15612
	dr $15612, $15871
PokemonCenterPC:
	dr $15871, $159b0
Function159b0:
	dr $159b0, $1646d
BankOfMom:
	dr $1646d, $16935
DayCareMan:
	dr $16935, $16989
DayCareLady:
	dr $16989, $16b8c
DayCareManOutside:
	dr $16b8c, $16e3a
Function16e3a:
	dr $16e3a, $16ff7
PhotoStudio:
	dr $16ff7, $171d1
Function171d1:
	dr $171d1, $177a5
DayCareMon1:
	dr $177a5, $177c4
DayCareMon2:
	dr $177c4, $1783e

SECTION "bank6", ROMX, BANK[$6]
	dr $18000, $1bdbc

SECTION "bank7", ROMX, BANK[$7]
LoadMapGroupRoof::
	dr $1c000, $1ffbd

SECTION "bank8", ROMX, BANK[$8]
	dr $20000, $23e3d

SECTION "bank9", ROMX, BANK[$9]
StringBufferPointers::
	dr $24000, $2400e
_2DMenu_::
	dr $2400e, $24136
StaticMenuJoypad_::
	dr $24136, $24139
ScrollingMenuJoypad_::
	dr $24139, $242a0
PushWindow_::
	dr $242a0, $24307
ExitMenu_::
	dr $24307, $24395
InitVerticalMenuCursor_::
	dr $24395, $243eb
UpdateItemDescription:
	dr $243eb, $244d7
InitScrollingMenu::
	dr $244d7, $244f3
ScrollingMenu_::
	dr $244f3, $24834
SwitchItemsInBag:
	dr $24834, $249dc
PlaceMenuItemName:
	dr $249dc, $249eb
PlaceMenuItemQuantity:
	dr $249eb, $24a10
PlaceMoneyTopRight:
	dr $24a10, $24a4d
DisplayCoinCaseBalance:
	dr $24a4d, $24a76
DisplayMoneyAndCoinBalance:
	dr $24a76, $24b8d
Function24b8d:
	dr $24b8d, $24f20
SelectQuantityToToss:
	dr $24f20, $267ca
ProfOaksPCBoot:
	dr $267ca, $2692d
InitDecorations: ; 2692d
	dr $2692d, $270d5
ReceiveDecorationC:
	dr $270d5, $271be
ToggleMaptileDecorations:
	dr $271be, $27216
ToggleDecorationsVisibility:
	dr $27216, $27271
GetTrainerDVs:
	dr $27271, $27307
ReturnToBattle_UseBall_:
	dr $27307, $27bd3

SECTION "banka", ROMX, BANK[$a]
	dr $28000, $28d88

Predef_LinkTextbox::
	dr $28d88, $28dea

TradeAnimation::
	dr $28dea, $28e22

TradeAnimationPlayer2::
	dr $28e22, $29a47
CheckTimeCapsuleCompatibility:
	dr $29a47, $29ac7
EnterTimeCapsule:
	dr $29ac7, $29ad9
WaitForOtherPlayerToExit:
	dr $29ad9, $29b22
SetBitsForLinkTradeRequest:
	dr $29b22, $29b2b
SetBitsForBattleRequest:
	dr $29b2b, $29b34
SetBitsForTimeCapsuleRequest:
	dr $29b34, $29b4b
WaitForLinkedFriend:
	dr $29b4b, $29bcc
CheckLinkTimeout:
	dr $29bcc, $29c71
TryQuickSave:
	dr $29c71, $29c8d
CheckBothSelectedSameRoom:
	dr $29c8d, $29cba
TimeCapsule:
	dr $29cba, $29ccf
TradeCenter:
	dr $29ccf, $29ce4
Colosseum:
	dr $29ce4, $29cf9
CloseLink:
	dr $29cf9, $29d01
FailedLinkToPast:
	dr $29d01, $29d4e
CableClubCheckWhichChris:
	dr $29d4e, $29dff
Function29dff:
	dr $29dff, $2a4bf
MysteryGift_CopyReceivedDecosToPC:
	dr $2a4bf, $2a4e7
UnlockMysteryGift:
	dr $2a4e7, $2a4f6
Function2a4f6:
	dr $2a4f6, $2a7d7
InitRoamMons:
	dr $2a7d7, $2a8e0
JumpRoamMons:
	dr $2a8e0, $2a9f7
Function2a9f7:
	dr $2a9f7, $2aa6b
Function2aa6b:
	dr $2aa6b, $2aab3
Function2aab3:
	dr $2aab3, $2c000

SECTION "bankb", ROMX, BANK[$b]
	dr $2c000, $2c352
MoveDeletion:
	dr $2c352, $2c57a

Pack_TMHMPocketMenu_:
	dr $2c57a, $2c5ca

AskTeachTMHM:
	dr $2c5ca, $2c606

ChooseMonToLearnTMHM:
	dr $2c606, $2c672

TeachTMHM:
	dr $2c672, $2c943

PrintMoveDesc::
	dr $2c943, $30000

SECTION "bankc", ROMX, BANK[$c]
	dr $30000, $34000

SECTION "bankd", ROMX, BANK[$d]
	dr $34000, $34923

CheckTypeMatchup::
	dr $34923, $36313

CheckIfStatCanBeRaised:
	dr $36313, $364d7

BattleCommand_StatUpMessage:
	dr $364d7, $3656b

BattleCommand_StatUpFailText:
	dr $3656b, $366f6

CalcPlayerStats:
	dr $366f6, $37e9b

GetItemHeldEffect:
	dr $37e9b, $38000

SECTION "banke", ROMX, BANK[$e]
	dr $38000, $398f2

Battle_GetTrainerName:: ; 398f2
	dr $398f2, $3c000

SECTION "bankf", ROMX, BANK[$f]
	dr $3c000, $3c551

FleeMons::
	dr $3c551, $3d70a

CheckPlayerPartyForFitPkmn::
	dr $3d70a, $3d8f5

Function3d8f5:
	dr $3d8f5, $3d907

Function3d907:
	dr $3d907, $3dda9

UpdatePlayerHUD::
	dr $3dda9, $3de97

UpdateEnemyHUD::
	dr $3de97, $3e74b

LoadEnemyMon:
	dr $3e74b, $3ec11
BattleRandom_:: ; 3ec11
	dr $3ec11, $3f196

FillInExpBar::
	dr $3f196, $3f243

GetMonBackpic::
	dr $3f243, $3f282

GetMonFrontpic::
	dr $3f282, $3f2c7

StartBattle::
	dr $3f2c7, $3f55d
Function3f55d:
	dr $3f55d, $40000

SECTION "bank10", ROMX, BANK[$10]
	dr $40000, $41afe
Moves::
	dr $41afe, $421db

EvolvePokemon:
	dr $421db, $421e9

EvolveAfterBattle::
	dr $421e9, $42483

LearnLevelMoves::
	dr $42483, $424dd

FillMoves::
	dr $424dd, $4278d

GetPreEvolution:
	dr $4278d, $427bd

EvosAttacksPointers::
	dr $427bd, $44000

SECTION "bank11", ROMX, BANK[$11]
	dr $44000, $44360

PokedexDataPointerTable::
	dr $44360, $44648

PlaceGraphic::
	dr $44648, $44870
DeletePartyMonMail:
	dr $44870, $4488c

IsAnyPokemonHoldingMail:
	dr $4488c, $48000

SECTION "bank12", ROMX, BANK[$12]
	dr $48000, $4c000

SECTION "bank13", ROMX, BANK[$13]
	dr $4c000, $50000

SECTION "bank14", ROMX, BANK[$14]
SelectMonFromParty:
	dr $50000, $5004f

LoadPartyMenuGFX:
	dr $5004f, $5005f

WritePartyMenuTilemap:
	dr $5005f, $50355

InitPartyMenuGFX:
	dr $50355, $5037a

InitPartyMenuWithCancel:
	dr $5037a, $503cc

PartyMenuSelect:
	dr $503cc, $5040f

PrintPartyMenuText:
	dr $5040f, $504db

PrintPartyMenuActionText:
	dr $504db, $5054f

LoadFishingGFX:
	dr $5054f, $50763

SquirtbottleFunction:
	dr $50763, $507ac

CardKeyFunction:
	dr $507ac, $507e7

BasementKeyFunction:
	dr $507e7, $50819

SacredAshFunction:
	dr $50819, $5087d

CopyPkmnToTempMon::
	dr $5087d, $50940

PrintMonTypes::
	dr $50940, $5096d

PrintMoveType::
	dr $5096d, $50986

PrintType::
	dr $50986, $50997

GetTypeName::
	dr $50997, $50b3d

DrawPlayerHP::
	dr $50b3d, $50b41

DrawEnemyHP::
	dr $50b41, $50bae

StatsScreenInit::
	dr $50bae, $5128f

PrintTempMonStats::
	dr $5128f, $512f1

GetGender::
	dr $512f1, $51364

ListMovePP::
	dr $51364, $513e4

Predef22::
	dr $513e4, $51437

PlaceNonFaintStatus::
	dr $51437, $51478

ListMoves::
	dr $51478, $51524

CalcLevel:
	dr $51524, $51550

CalcExpAtLevel:
	dr $51550, $51749

GetUnownLetter::
	dr $51749, $51780

GetFrontpic::
	dr $51780, $51786

FrontpicPredef::
	dr $51786, $51803

GetBackpic::
	dr $51803, $518a0

GetTrainerPic::
	dr $518a0, $518fa

DecompressPredef::
	dr $518fa, $51b0b
BaseData:: ; 51b0b
	dr $51b0b, $53a83
UnknownEggPic:: ; 53a83
	dr $53a83, $54000

SECTION "bank15", ROMX, BANK[$15]
	dr $54000, $58000

SECTION "bank16", ROMX, BANK[$16]
	dr $58000, $5c000

SECTION "bank17", ROMX, BANK[$17]
	dr $5c000, $60000

SECTION "bank18", ROMX, BANK[$18]
	dr $60000, $64000

SECTION "bank19", ROMX, BANK[$19]
	dr $64000, $68000

SECTION "bank1a", ROMX, BANK[$1a]
	dr $68000, $6c000

SECTION "bank1b", ROMX, BANK[$1b]
	dr $6c000, $70000

SECTION "bank1c", ROMX, BANK[$1c]
	dr $70000, $74000

SECTION "bank1d", ROMX, BANK[$1d]
	dr $74000, $78000

SECTION "bank1e", ROMX, BANK[$1e]
	dr $78000, $7c000

SECTION "bank1f", ROMX, BANK[$1f]
	dr $7c000, $80000

SECTION "bank20", ROMX, BANK[$20]
	dr $80000, $84000

SECTION "bank21", ROMX, BANK[$21]
	dr $84000, $842db

PrinterReceive_:: ; 842db
	dr $842db, $84684

Function84684:
	dr $84684, $88000

SECTION "bank22", ROMX, BANK[$22]
	dr $88000, $8c000

SECTION "bank23", ROMX, BANK[$23]
	dr $8c000, $8c17a

ResetClock_:
	dr $8c17a, $8c310

DeleteSaveData_:
	dr $8c310, $8c355

Predef35::
Predef36::
	ret

UpdateTimeOfDayPal:: ; 8c356
	dr $8c356, $8c366

_TimeOfDayPals:: ; 8c366
	dr $8c366, $8c397

_UpdateTimePals:: ; 8c397
	dr $8c397, $8c3a0

FadeInPalettes:: ; 8c3a0
	dr $8c3a0, $8c3ab

FadeOutPalettes:: ; 8c3ab
	dr $8c3ab, $8c3b9

FadeInQuickly:
	dr $8c3b9, $8c3c4

FadeBlackQuickly:
	dr $8c3c4, $8c3e9

Function8c3e9:: ; 8c3e9
	dr $8c3e9, $8c513

Predef_StartBattle::
	dr $8c513, $8ca5e

PlayWhirlpoolSound:
	dr $8ca5e, $8ca6b

BlindingFlash:
	dr $8ca6b, $8ca8e

ShakeHeadbuttTree:
	dr $8ca8e, $8cbb8

OWCutAnimation:
	dr $8cbb8, $8cd65

FlyFromAnimation:
	dr $8cd65, $8cdab

FlyToAnimation:
	dr $8cdab, $8ce7c

MagnetTrain:
	dr $8ce7c, $8d174

ClearAnimatedObjectBuffer:
	dr $8d174, $8d183

AnimatedObjects_PlayFrameAndDelay:
	dr $8d183, $8d18a

AnimatedObjects_PlayFrame:
	dr $8d18a, $8d1f7

InitAnimatedObjectStruct_:: ; 8d1f7
	dr $8d1f7, $8d332

ReinitAnimatedObjectFrame_:: ; 8d332

IF DEF(GOLD)
	dr $8d332, $8e79f

LoadMenuMonIcon::
	dr $8e79f, $90000
ENDC

IF DEF(SILVER)
	dr $8d332, $8e785

LoadMenuMonIcon::
	dr $8e785, $90000
ENDC

SECTION "bank24", ROMX, BANK[$24]
	dr $90000, $90641
InitClock:
	dr $90641, $908dc
SetDayOfWeek:
	dr $908dc, $90a1b
Function90a1b:
	dr $90a1b, $90a54
Function90a54:
	dr $90a54, $90a8d
Function90a8d:
	dr $90a8d, $90b0f
PrintHour:
	dr $90b0f, $9188a
Function9188a:
	dr $9188a, $919c1
Function919c1:
	dr $919c1, $91a4f
TownMap_:
	dr $91a4f, $91c7f

Area_::
	dr $91c7f, $92c36
Function92c36:
	dr $92c36, $94000

SECTION "bank25", ROMX, BANK[$25]
MapTriggers:: ; 94000
	dr $94000, $940ed

MapGroupPointers::
	dr $940ed, $965f9

OverworldLoop::
	dr $965f9, $96b89

EnableScriptMode:: ; 96b89
	dr $96b89, $96b91

ScriptEvents:: ; 96b91
	dr $96b91, $97365

CallCallback:: ; 97365
	dr $97365, $97a59

WarpToSpawnPoint:
	dr $97a59, $97c2a

Function97c2a:: ; 97c2a
	dr $97c2a, $98000

SECTION "bank26", ROMX, BANK[$26]
IF DEF(GOLD)
TitleScreenGFX1:
	dr $98000, $98476
TitleScreenGFX2:
	dr $98476, $98616
GSIntroTilemap:
	dr $98616, $9c000
ENDC

IF DEF(SILVER)
TitleScreenGFX1:
	dr $98000, $98498
TitleScreenGFX2:
	dr $98498, $9862a
GSIntroTilemap:
	dr $9862a, $9c000
ENDC

SECTION "bank27", ROMX, BANK[$27]
	dr $9c000, $a0000

SECTION "bank28", ROMX, BANK[$28]
	dr $a0000, $a4000

SECTION "bank29", ROMX, BANK[$29]
	dr $a4000, $a8000

SECTION "bank2a", ROMX, BANK[$2a]
	dr $a8000, $ac000

SECTION "bank2b", ROMX, BANK[$2b]
	dr $ac000, $b0000

SECTION "bank2c", ROMX, BANK[$2c]
	dr $b0000, $b4000

SECTION "bank2d", ROMX, BANK[$2d]
	dr $b4000, $b8000

SECTION "bank2e", ROMX, BANK[$2e]
	dr $b8000, $ba378

TreeMonEncounter:
	dr $ba378, $ba3a1

RockMonEncounter:
	dr $ba3a1, $bc000

SECTION "bank2f", ROMX, BANK[$2f]
	dr $bc000, $c0000

SECTION "bank30", ROMX, BANK[$30]
PlayerSpriteGFX:
	dr $c0000, $c03c0

SilverSpriteGFX:
	dr $c03c0, $c0fc0

MomSpriteGFX:
	dr $c0fc0, $c4000

SECTION "bank31", ROMX, BANK[$31]
	dr $c4000, $c7a40
Functionc7a40:
	dr $c7a40, $c7a5a
CheckForLuckyNumberWinners:
	dr $c7a5a, $c7bad
PrintTodaysLuckyNumber:
	dr $c7bad, $c7bbf
CheckPartyFullAfterContest:
	dr $c7bbf, $c7cd0
Functionc7cd0:
	dr $c7cd0, $c8000

SECTION "bank32", ROMX, BANK[$32]
BattleAnimations:: ; Not actually where it is, I just needed the label for BANK to work
	dr $c8000, $c80d6

Predef2F::
	dr $c80d6, $cbc76

LoadPoisonBGPals::
	dr $cbc76, $cc000

SECTION "bank33", ROMX, BANK[$33]
DisplayCaughtContestMonStats:
	dr $cc000, $cc0c8

DisplayAlreadyCaughtText:
	dr $cc0c8, $cc0d6

Predef38::
Predef39::
	ret

PlayBattleAnim::
	dr $cc0d7, $cc283

BattleAnimCommands::
	dr $cc283, $d0000

SECTION "bank34", ROMX, BANK[$34]
	dr $d0000, $d4000

SECTION "bank35", ROMX, BANK[$35]
	dr $d4000, $d8000

SECTION "bank36", ROMX, BANK[$36]
	dr $d8000, $dc000

SECTION "bank37", ROMX, BANK[$37]
	dr $dc000, $e0000

SECTION "bank38", ROMX, BANK[$38]
	dr $e0000, $e0002
Functione0002:
	dr $e0002, $e0909
Functione0909:
	dr $e0909, $e199d
Functione199d:
	dr $e199d, $e2668
Functione2668:
	dr $e2668, $e2b9e

DepositPokemon_:
	dr $e2b9e, $e2d71

WithdrawPokemon_:
	dr $e2d71, $e2f47

MovePKMNWithoutMail_:
	dr $e2f47, $e3d25

ChangeBox_:
	dr $e3d25, $e4000

SECTION "bank39", ROMX, BANK[$39]
TitleScreenGFX5:
	dr $e4000, $e41e0
TitleScreenGFX3:
IF DEF(GOLD)
	dr $e41e0, $e4260
TitleScreenGFX4:
	dr $e4260, $e4608
OptionsMenu:
	dr $e4608, $e49a8
Copyright_GFPresents:
	dr $e49a8, $e4cb1
GoldSilverIntro:
	dr $e4cb1, $e8000
ENDC

IF DEF(SILVER)
	dr $e41e0, $e4220
TitleScreenGFX4:
	dr $e4220, $e4450
OptionsMenu:
	dr $e4450, $e47f0
Copyright_GFPresents:
	dr $e47f0, $e4af9
GoldSilverIntro:
	dr $e4af9, $e8000
ENDC

SECTION "bank3a", ROMX, BANK[$3a]
DisableAudio_::
	dr $e8000, $e805c

UpdateSound_::
	dr $e805c, $e8b30

PlayMusic_::
	dr $e8b30, $e8b79

PlayCryHeader_::
	dr $e8b79, $e8c04

PlaySFX_::
	dr $e8c04, $ec000

SECTION "bank3b", ROMX, BANK[$3b]
	dr $ec000, $f0000

SECTION "bank3c", ROMX, BANK[$3c]
	dr $f0000, $f2747
CryHeaders::
	dr $f2747, $f4000

SECTION "bank3d", ROMX, BANK[$3d]
	dr $f4000, $f8000

SECTION "bank3e", ROMX, BANK[$3e]
Functionf8000::
	dr $f8000, $f800c
Functionf800c::
	dr $f800c, $f8032
Functionf8032::
	dr $f8032, $fb4be

TileCollisionTable::
	dr $fb4be, $fb5be
Shrink1Pic:
	dr $fb5be, $fb64e
Shrink2Pic:
	dr $fb64e, $fb7f7
Functionfb7f7:
	dr $fb7f7, $fb94b
Functionfb94b:
	dr $fb94b, $fb981
NewPokedexEntry:
	dr $fb981, $fba12

ConvertMon_1to2::
	dr $fba12, $fbb22
UpdateUnownDex:
	dr $fbb22, $fbc3c
CheckMagikarpLength:
	dr $fbc3c, $fbdd6
MagikarpHouseSign:
	dr $fbdd6, $fc000

SECTION "bank3f", ROMX, BANK[$3f]
	nop
Predef3A::
	ret

	dr $fc002, $100000

SECTION "bank40", ROMX, BANK[$40]
BattleText:: ; Not actually where it is, I just needed the label for BANK to work
	dr $100000, $101746

Text_ConfusedNoMore::
	dr $101746, $104000

SECTION "bank41", ROMX, BANK[$41]
	dr $104000, $108000

SECTION "bank42", ROMX, BANK[$42]
INCLUDE "maps/SproutTower1F.asm"
INCLUDE "maps/SproutTower2F.asm"
INCLUDE "maps/SproutTower3F.asm"
	dr $108b1b, $108c8c
	dr $108c8c, $108c9e
	dr $108c9e, $108cbf
	dr $108cbf, $108d10
	dr $108d10, $108d4b
	dr $108d4b, $108d5d
	dr $108d5d, $108d8d
	dr $108d8d, $108de0
	dr $108de0, $108e2c
	dr $108e2c, $1093b8
	dr $1093b8, $109dca

SECTION "bank43", ROMX, BANK[$43]
INCLUDE "maps/NationalPark.asm"
INCLUDE "maps/NationalParkBugContest.asm"
	dr $10cccf, $10f198

SECTION "bank44", ROMX, BANK[$44]
	dr $110000, $114000

SECTION "bank45", ROMX, BANK[$45]
	dr $114000, $118000

SECTION "bank46", ROMX, BANK[$46]
	dr $118000, $11c000

SECTION "bank47", ROMX, BANK[$47]
	dr $11c000, $120000

SECTION "bank48", ROMX, BANK[$48]
	dr $120000, $124000

SECTION "bank49", ROMX, BANK[$49]
	dr $124000, $128000

SECTION "bank4a", ROMX, BANK[$4a]
	dr $128000, $12c000

SECTION "bank4b", ROMX, BANK[$4b]
	dr $12c000, $130000

SECTION "bank4c", ROMX, BANK[$4c]
	dr $130000, $134000

SECTION "bank4d", ROMX, BANK[$4d]
	dr $134000, $138000

SECTION "bank4e", ROMX, BANK[$4e]
	dr $138000, $13c000

SECTION "bank4f", ROMX, BANK[$4f]
	dr $13c000, $140000

SECTION "bank50", ROMX, BANK[$50]
	dr $140000, $144000

SECTION "bank51", ROMX, BANK[$51]
	dr $144000, $148000

SECTION "bank52", ROMX, BANK[$52]
	dr $148000, $14c000

SECTION "bank53", ROMX, BANK[$53]
	dr $14c000, $150000

SECTION "bank54", ROMX, BANK[$54]
INCLUDE "maps/CeruleanGymBadgeSpeechHouse.asm"
INCLUDE "maps/CeruleanPoliceStation.asm"
INCLUDE "maps/CeruleanTradeSpeechHouse.asm"
INCLUDE "maps/CeruleanPokecenter1F.asm"
INCLUDE "maps/CeruleanPokecenter2FBeta.asm"
INCLUDE "maps/CeruleanGym.asm"
INCLUDE "maps/CeruleanMart.asm"
INCLUDE "maps/Route10Pokecenter1F.asm"
INCLUDE "maps/Route10Pokecenter2FBeta.asm"
INCLUDE "maps/PowerPlant.asm"
INCLUDE "maps/BillsHouse.asm"

SECTION "bank55", ROMX, BANK[$55]
	dr $154000, $158000

SECTION "bank56", ROMX, BANK[$56]
	dr $158000, $15c000

SECTION "bank57", ROMX, BANK[$57]
	dr $15c000, $15e7a2

INCLUDE "maps/GoldenrodGameCorner.asm"
INCLUDE "maps/IlexForestAzaleaGate.asm"
INCLUDE "maps/Route34IlexForestGate.asm"
INCLUDE "maps/DayCare.asm"

SECTION "bank58", ROMX, BANK[$58]
	dr $160000, $164000

SECTION "bank59", ROMX, BANK[$59]
	dr $164000, $168000

SECTION "bank5a", ROMX, BANK[$5a]
	dr $168000, $16c000

SECTION "bank5b", ROMX, BANK[$5b]
	dr $16c000, $170000

SECTION "bank5c", ROMX, BANK[$5c]
	dr $170000, $174000

SECTION "bank5d", ROMX, BANK[$5d]
	dr $174000, $178000

SECTION "bank5e", ROMX, BANK[$5e]
	dr $178000, $17c000

SECTION "bank5f", ROMX, BANK[$5f]
	dr $17c000, $180000

SECTION "bank60", ROMX, BANK[$60]
	dr $180000, $184000

SECTION "bank61", ROMX, BANK[$61]
	dr $184000, $188000

SECTION "bank62", ROMX, BANK[$62]
	dr $188000, $18c000

SECTION "bank63", ROMX, BANK[$63]
	dr $18c000, $190000

SECTION "bank67", ROMX, BANK[$67]
	dr $19c000, $1a0000

SECTION "bank68", ROMX, BANK[$68]
PokedexEntries1::
	dr $1a0000, $1a4000

SECTION "bank69", ROMX, BANK[$69]
PokedexEntries2::
	dr $1a4000, $1a8000

SECTION "bank6a", ROMX, BANK[$6a]
PokedexEntries3::
	dr $1a8000, $1ac000

SECTION "bank6b", ROMX, BANK[$6b]
PokedexEntries4::
	dr $1ac000, $1b0000

SECTION "bank6c", ROMX, BANK[$6c]
ItemNames::
	dr $1b0000, $1b0955
TrainerClassNames::
	dr $1b0955, $1b0b74
PokemonNames::
	dr $1b0b74, $1b1574
MoveNames::
	dr $1b1574, $1b4000

SECTION "bank6d", ROMX, BANK[$6d]
	dr $1b4000, $1b8000

SECTION "bank6e", ROMX, BANK[$6e]
	dr $1b8000, $1bc000

SECTION "bank6f", ROMX, BANK[$6f]
	dr $1bc000, $1c0000

SECTION "bank70", ROMX, BANK[$70]
	dr $1c0000, $1c0a66
UpdateTimePredef::
	dr $1c0a66, $1c0de9
DudeAutoInput_A::
	dr $1c0de9, $1c0dee

DudeAutoInput_RightA::
	dr $1c0dee, $1c4000

SECTION "bank71", ROMX, BANK[$71]
	dr $1c4000, $1c8000

SECTION "bank72", ROMX, BANK[$72]
	dr $1c8000, $1cc000

SECTION "bank73", ROMX, BANK[$73]
	dr $1cc000, $1d0000

SECTION "bank74", ROMX, BANK[$74]
	dr $1d0000, $1d4000

SECTION "bank75", ROMX, BANK[$75]
	dr $1d4000, $1d8000

SECTION "bank76", ROMX, BANK[$76]
	dr $1d8000, $1dc000

SECTION "bank77", ROMX, BANK[$77]
	dr $1dc000, $1e0000

SECTION "bank78", ROMX, BANK[$78]
	dr $1e0000, $1e4000

SECTION "bank79", ROMX, BANK[$79]
	dr $1e4000, $1e8000

SECTION "bank7a", ROMX, BANK[$7a]
	dr $1e8000, $1ec000

SECTION "bank7b", ROMX, BANK[$7b]
	dr $1ec000, $1f0000

SECTION "bank7c", ROMX, BANK[$7c]
	dr $1f0000, $1f4000

SECTION "bank7d", ROMX, BANK[$7d]
	dr $1f4000, $1f8000

SECTION "bank7e", ROMX, BANK[$7e]
	dr $1f8000, $1fc000

SECTION "bank7f", ROMX, BANK[$7f]
	dr $1fc000, $200000
