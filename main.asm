INCLUDE "constants.asm"


SECTION "bank1", ROMX

INCLUDE "engine/link/place_waiting_text.asm"
INCLUDE "engine/gfx/load_push_oam.asm"
INCLUDE "engine/overworld/map_objects.asm"
INCLUDE "engine/menus/intro_menu.asm"
INCLUDE "engine/overworld/init_map.asm"
INCLUDE "engine/pokemon/learn.asm"
INCLUDE "engine/pokemon/correct_nick_errors.asm"
INCLUDE "engine/math/math.asm"
INCLUDE "data/items/attributes.asm"
INCLUDE "engine/overworld/npc_movement.asm"
INCLUDE "engine/events/happiness_egg.asm"
INCLUDE "engine/events/shuckle.asm"
INCLUDE "engine/events/haircut.asm"

SECTION "bank2", ROMX

INCLUDE "engine/tilesets/map_palettes.asm"
INCLUDE "gfx/tileset_palette_maps.asm"
INCLUDE "engine/overworld/player_object.asm"
INCLUDE "engine/math/sine.asm"
INCLUDE "engine/predef.asm"
INCLUDE "engine/gfx/color.asm"

SECTION "bank3", ROMX

INCLUDE "engine/events/checktime.asm"
INCLUDE "engine/events/engine_flags.asm"
INCLUDE "engine/overworld/variables.asm"
INCLUDE "engine/events/specials.asm"
INCLUDE "engine/smallflag.asm"
INCLUDE "engine/pokemon/health.asm"
INCLUDE "engine/events/overworld.asm"
INCLUDE "engine/items/items.asm"
INCLUDE "engine/overworld/player_step.asm"
INCLUDE "engine/battle/anim_hp_bar.asm"
INCLUDE "engine/pokemon/move_mon.asm"
INCLUDE "engine/pokemon/bills_pc_top.asm"
INCLUDE "engine/pokemon/breedmon_level_growth.asm"
INCLUDE "engine/pokemon/search2.asm"
INCLUDE "engine/events/bug_contest/caught_mon.asm"
INCLUDE "engine/items/item_effects.asm"
INCLUDE "engine/pokemon/knows_move.asm"

SECTION "bank4", ROMX

INCLUDE "engine/overworld/player_movement.asm"
INCLUDE "engine/items/pack.asm"
INCLUDE "engine/overworld/time.asm"
INCLUDE "engine/items/tmhm2.asm"
INCLUDE "engine/menus/naming_screen.asm"
INCLUDE "engine/events/misc_scripts.asm"
INCLUDE "engine/events/heal_machine_anim.asm"
INCLUDE "engine/events/whiteout.asm"
INCLUDE "engine/events/forced_movement.asm"
INCLUDE "engine/events/itemfinder.asm"
INCLUDE "engine/menus/start_menu.asm"
INCLUDE "engine/pokemon/mon_menu.asm"
INCLUDE "engine/overworld/select_menu.asm"
INCLUDE "engine/events/elevator.asm"
INCLUDE "engine/events/bug_contest/contest.asm"
INCLUDE "engine/events/repel.asm"
INCLUDE "engine/events/hidden_item.asm"
INCLUDE "engine/events/std_collision.asm"
INCLUDE "engine/events/bug_contest/judging.asm"
INCLUDE "engine/events/pokerus/apply_pokerus_tick.asm"
INCLUDE "engine/events/bug_contest/contest_2.asm"

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
LoadUsedSpritesGFX:
	dr $14226, $14317
_DoesSpriteHaveFacings:: ; 14317
	dr $14317, $14334
_GetSpritePalette:: ; 14334
	dr $14334, $14a18
Function14a18:: ; 14a18
	dr $14a18, $14a2d
Function14a2d:: ; 14a2d
	dr $14a2d, $14a44
Function14a44: ; 14a44
	dr $14a44, $14a73
CheckCutCollision:
	dr $14a73, $14abe
SaveMenu:
	dr $14abe, $14bd2
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
	dr $159b0, $1624f
TakeMoney:
	dr $1624f, $16260
CompareMoney:
	dr $16260, $1646d
BankOfMom:
	dr $1646d, $16935

INCLUDE "engine/events/daycare.asm"
Function16e3a:
	dr $16e3a, $16ff7
PhotoStudio:
	dr $16ff7, $171d1
CheckBreedmonCompatibility:
	dr $171d1, $17467
InitEggMoves:
	dr $17467, $177a5
DayCareMon1:
	dr $177a5, $177c4
DayCareMon2:
	dr $177c4, $1783e

SECTION "bank6", ROMX, BANK[$6]
	dr $18000, $1bdbc

SECTION "bank7", ROMX, BANK[$7]
LoadMapGroupRoof::
	dr $1c000, $1f84c

SECTION "bank8", ROMX, BANK[$8]
	dr $20000, $23e3d

SECTION "bank9", ROMX, BANK[$9]
StringBufferPointers::
	dr $24000, $2400e
_2DMenu_::
	dr $2400e, $24136
_StaticMenuJoypad::
	dr $24136, $24139
_ScrollingMenuJoypad::
	dr $24139, $242a0
_PushWindow::
	dr $242a0, $24307
_ExitMenu::
	dr $24307, $24395
_InitVerticalMenuCursor::
	dr $24395, $243eb
UpdateItemDescription:
	dr $243eb, $244d7
_InitScrollingMenu::
	dr $244d7, $244f3
_ScrollingMenu::
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
	dr $24a76, $24b05
StartMenu_DrawBugContestStatusBox:
	dr $24b05, $24b10
StartMenu_PrintBugContestStatus:
	dr $24b10, $24b8d
Function24b8d:
	dr $24b8d, $24c89
MonSubmenu:
	dr $24c89, $24f20
SelectQuantityToToss:
	dr $24f20, $25061
TrainerCard:
	dr $25061, $267ca
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

INCLUDE "engine/battle/read_trainer_dvs.asm"

ReturnToBattle_UseBall_:
	dr $27307, $27bd3

SECTION "banka", ROMX, BANK[$a]
	dr $28000, $28d88

LinkTextboxAtHL::
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
RandomUnseenWildMon:
	dr $2a9f7, $2aa6b
RandomPhoneWildMon:
	dr $2aa6b, $2aab3
RandomPhoneMon:
	dr $2aab3, $2ab35
JohtoGrassWildMons:
	dr $2ab35, $2c000

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
	dr $38000, $394f3

GetTrainerClassName::
	dr $394f3, $398f2
Battle_GetTrainerName::
	dr $398f2, $398fa
GetTrainerName::
	dr $398fa, $3993e

INCLUDE "data/trainers/parties.asm"

SECTION "bankf", ROMX, BANK[$f]
	dr $3c000, $3c551

FleeMons::
	dr $3c551, $3d70a

CheckPlayerPartyForFitMon::
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
_BattleRandom:: ; 3ec11
	dr $3ec11, $3f196

FillInExpBar::
	dr $3f196, $3f243

GetBattleMonBackpic::
	dr $3f243, $3f282

GetEnemyMonFrontpic::
	dr $3f282, $3f2c7

StartBattle::
	dr $3f2c7, $3f55d
Function3f55d:
	dr $3f55d, $40000

SECTION "bank10", ROMX, BANK[$10]
Pokedex::
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
	dr $44648, $44679
SendMailToPC::
	dr $44679, $44870
DeletePartyMonMail:
	dr $44870, $4488c

IsAnyPokemonHoldingMail:
	dr $4488c, $48000

SECTION "bank13", ROMX, BANK[$13]
	dr $4c000, $50000

SECTION "bank14", ROMX, BANK[$14]
SelectMonFromParty:
	dr $50000, $5001d

SelectTradeOrDayCareMon:
	dr $5001d, $5004f

LoadPartyMenuGFX:
	dr $5004f, $5005f

WritePartyMenuTilemap:
	dr $5005f, $50355

InitPartyMenuGFX:
	dr $50355, $5037a

InitPartyMenuWithCancel:
	dr $5037a, $503a2

InitPartyMenuNoCancel:
	dr $503a2, $503cc

PartyMenuSelect:
	dr $503cc, $5040f

PrintPartyMenuText:
	dr $5040f, $504db

PrintPartyMenuActionText:
	dr $504db, $5054f

LoadFishingGFX:
	dr $5054f, $506f2

SweetScentFromMenu:
	dr $506f2, $50763

SquirtbottleFunction:
	dr $50763, $507ac

CardKeyFunction:
	dr $507ac, $507e7

BasementKeyFunction:
	dr $507e7, $50819

SacredAshFunction:
	dr $50819, $5087d

CopyMonToTempMon::
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

Unused_PlaceEnemyHPLevel::
	dr $513e4, $51437

PlaceNonFaintStatus::
	dr $51437, $51478

ListMoves::
	dr $51478, $51524

CalcLevel:
	dr $51524, $51550

CalcExpAtLevel:
	dr $51550, $5161b

_SwitchPartyMons:
	dr $5161b, $51749

INCLUDE "engine/gfx/load_pics.asm"
INCLUDE "engine/pokemon/move_mon_wo_mail.asm"
INCLUDE "data/pokemon/base_stats.asm"

Unknown53a6b:
	dr $53a6b, $53a83

EggPic::
	dr $53a83, $54000

SECTION "bank21", ROMX, BANK[$21]
	dr $84000, $842db

_PrinterReceive:: ; 842db
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

DummyPredef35::
DummyPredef36::
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

DoBattleTransition::
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

_InitSpriteAnimStruct:: ; 8d1f7
	dr $8d1f7, $8d332

_ReinitSpriteAnimFrame:: ; 8d332

IF DEF(_GOLD)
	dr $8d332, $8e774

ClearSpriteAnims2::
	dr $8e774, $8e79f
LoadMenuMonIcon::
	dr $8e79f, $8e922
UnfreezeMonIcons::
	dr $8e922, $8e93d
HoldSwitchmonIcon::
	dr $8e93d, $90000
ENDC

IF DEF(_SILVER)
	dr $8d332, $8e75a

ClearSpriteAnims2::
	dr $8e75a, $8e785
LoadMenuMonIcon::
	dr $8e785, $8e908
UnfreezeMonIcons::
	dr $8e908, $8e923
HoldSwitchmonIcon::
	dr $8e923, $90000
ENDC

SECTION "bank24", ROMX, BANK[$24]
	dr $90000, $90641
InitClock:
	dr $90641, $908dc
SetDayOfWeek:
	dr $908dc, $90a1b
InitialSetDSTFlag:
	dr $90a1b, $90a54
InitialClearDSTFlag:
	dr $90a54, $90a8d
MrChrono:
	dr $90a8d, $90b0f
PrintHour:
	dr $90b0f, $90b5e
PokeGear:
	dr $90b5e, $917ca
RadioMusicRestartDE:
	dr $917ca, $917de
RadioMusicRestartPokemonChannel:
	dr $917de, $9188a
Function9188a:
	dr $9188a, $919c1
Function919c1:
	dr $919c1, $91a4f
TownMap_:
	dr $91a4f, $91c7f

Pokedex_GetArea::
	dr $91c7f, $92364
GetLandmarkName:
	dr $92364, $92c36
Function92c36:
	dr $92c36, $94000

SECTION "bank25", ROMX, BANK[$25]
MapTriggers:: ; 94000
	dr $94000, $940ed

INCLUDE "data/maps/maps.asm"
INCLUDE "data/maps/attributes.asm"

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
IF DEF(_GOLD)
TitleScreenGFX1:
	dr $98000, $98476
TitleScreenGFX2:
	dr $98476, $98616
GSIntroTilemap:
	dr $98616, $9c000
ENDC

IF DEF(_SILVER)
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

INCLUDE "data/maps/blocks.asm"

SECTION "bank2d", ROMX, BANK[$2d]
	dr $b4000, $b8000

SECTION "bank2e_2", ROMX

INCLUDE "engine/events/checkforhiddenitems.asm"
INCLUDE "engine/events/treemons.asm"
INCLUDE "engine/pokegear/radio.asm"

ReadPartyMonMail:
	dr $baeca, $bbaed
ItemIsMail:
	dr $bbaed, $bc000

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
	dr $c8000, $c80d6

DummyPredef2F::
	dr $c80d6, $c900a

INCLUDE "data/moves/animations.asm"

LoadPoisonBGPals::
	dr $cbc76, $cc000

SECTION "bank33", ROMX, BANK[$33]
DisplayCaughtContestMonStats:
	dr $cc000, $cc0c8

DisplayAlreadyCaughtText:
	dr $cc0c8, $cc0d6

DummyPredef38::
DummyPredef39::
	ret

PlayBattleAnim::
	dr $cc0d7, $cc283

ClearBattleAnims::
	dr $cc283, $cfce3

SECTION "bank34", ROMX, BANK[$34]
	dr $d0000, $d4000

SECTION "bank35", ROMX, BANK[$35]
	dr $d4000, $d8000

SECTION "bank36", ROMX, BANK[$36]
	dr $d8000, $dc000

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

CopyrightGFX:
	INCBIN "gfx/intro/copyright.2bpp"

IF DEF(_GOLD)
TitleScreenGFX3:
	dr $e41e0, $e4260
TitleScreenGFX4:
	dr $e4260, $e4608
OptionsMenu:
	dr $e4608, $e49a8
ENDC

IF DEF(_SILVER)
TitleScreenGFX3:
	dr $e41e0, $e4220
TitleScreenGFX4:
	dr $e4220, $e4450
OptionsMenu:
	dr $e4450, $e47f0
ENDC

INCLUDE "engine/movie/gamefreak_presents.asm"

IF DEF(_GOLD)
GoldSilverIntro:
	dr $e4cb1, $e8000
ENDC

IF DEF(_SILVER)
GoldSilverIntro:
	dr $e4af9, $e8000
ENDC

SECTION "bank3e", ROMX, BANK[$3e]
Functionf8000::
	dr $f8000, $f800c
Functionf800c::
	dr $f800c, $f8032
_LoadFontsBattleExtra::
	dr $f8032, $f80d9
LoadStatsScreenPageTilesGFX::
	dr $f80d9, $fb4be

TileCollisionTable::
	dr $fb4be, $fb5be
Shrink1Pic:
	dr $fb5be, $fb64e
Shrink2Pic:
	dr $fb64e, $fb7f7
_NameRater:
	dr $fb7f7, $fb94b
PlaySlowCry:
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
DummyPredef3A::
	ret

	dr $fc002, $100000

SECTION "bank40", ROMX, BANK[$40]
	dr $100000, $10110c

INCLUDE "data/text/battle.asm"

SECTION "bank41", ROMX, BANK[$41]
	dr $104000, $108000

INCLUDE "data/maps/scripts.asm"

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
INCLUDE "data/moves/descriptions.asm"

	dr $1b61f3, $1b8000

SECTION "bank6e", ROMX, BANK[$6e]
	dr $1b8000, $1bc000

SECTION "bank6f", ROMX, BANK[$6f]
	dr $1bc000, $1c0000

SECTION "bank70", ROMX, BANK[$70]
	dr $1c0000, $1c0a66
UpdateTimePredef::
	dr $1c0a66, $1c0a7a
StubbedGetFrontpic::
	ret
Function1c0a7b::
	dr $1c0a7b, $1c0de9
_DudeAutoInput_A::
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
