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

SECTION "bank5", ROMX

INCLUDE "engine/rtc/rtc.asm"
INCLUDE "engine/overworld/overworld.asm"
INCLUDE "engine/overworld/tile_events.asm"
INCLUDE "engine/menus/empty_sram.asm"
INCLUDE "engine/menus/save.asm"
INCLUDE "data/maps/spawn_points.asm"
INCLUDE "engine/overworld/load_map_part.asm"
INCLUDE "engine/overworld/spawn_points.asm"
INCLUDE "engine/overworld/map_setup.asm"
INCLUDE "engine/events/pokemon_pc.asm"
INCLUDE "engine/items/mart.asm"
INCLUDE "engine/events/money.asm"
INCLUDE "data/items/marts.asm"
INCLUDE "engine/events/mom.asm"
INCLUDE "engine/events/daycare.asm"
INCLUDE "engine/events/print_unown.asm"
INCLUDE "engine/events/print_photo.asm"
INCLUDE "unknown/bank05_704d.asm"
INCLUDE "engine/pokemon/breeding.asm"

SECTION "bank6", ROMX
	dr $18000, $1bdbc

SECTION "bank7", ROMX

LoadMapGroupRoof::
	dr $1c000, $1f84c

SECTION "bank8", ROMX
	dr $20000, $239fe
EggMovePointers:
	dr $239fe, $23e3d

SECTION "bank9", ROMX

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
	dr $243eb, $24477
LoadObjectMasks:
	dr $24477, $244d7
_InitScrollingMenu::
	dr $244d7, $244f3
_ScrollingMenu::
	dr $244f3, $2462e
ScrollingMenu_ClearLeftColumn:
	dr $2462e, $24834
SwitchItemsInBag:
	dr $24834, $249dc
PlaceMenuItemName:
	dr $249dc, $249eb
PlaceMenuItemQuantity:
	dr $249eb, $24a10
PlaceMoneyTopRight:
	dr $24a10, $24a18
PlaceMoneyBottomLeft:
	dr $24a18, $24a20
PlaceMoneyAtTopLeftOfTextbox:
	dr $24a20, $24a4d
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
	dr $24f20, $24f2a
SelectQuantityToBuy:
	dr $24f2a, $24f42
SelectQuantityToSell:
	dr $24f42, $25061

TrainerCard:
	dr $25061, $267af

ProfOaksPC:
	dr $267af, $267ca
ProfOaksPCBoot:
	dr $267ca, $2692d
InitDecorations:
	dr $2692d, $26938
_PlayerDecorationMenu:
	dr $26938, $270d5

ReceiveDecorationC:
	dr $270d5, $271be
ToggleMaptileDecorations:
	dr $271be, $27216
ToggleDecorationsVisibility:
	dr $27216, $27271
INCLUDE "engine/battle/read_trainer_dvs.asm"
ReturnToBattle_UseBall_:
	dr $27307, $2739f
INCLUDE "data/moves/effects.asm"

SECTION "banka", ROMX
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
	dr $2a4f6, $2a507
BackupMysteryGift:
	dr $2a507, $2a518
RestoreMysteryGift:
	dr $2a518, $2a539
LoadWildMonData:
	dr $2a539, $2a7d7
InitRoamMons:
	dr $2a7d7, $2a859
UpdateRoamMons:
	dr $2a859, $2a8e0
JumpRoamMons:
	dr $2a8e0, $2a9f7
RandomUnseenWildMon:
	dr $2a9f7, $2aa6b
RandomPhoneWildMon:
	dr $2aa6b, $2aab3
RandomPhoneMon:
	dr $2aab3, $2ab35
JohtoGrassWildMons:
	dr $2ab35, $2bee3

SECTION "bankb", ROMX
	dr $2c000, $2c225
INCLUDE "engine/battle/ai/redundant.asm"
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
	dr $2c943, $2ca31

SECTION "bankc", ROMX
	dr $30000, $33d81


SECTION "Effect Commands", ROMX

INCLUDE "engine/battle/effect_commands.asm"
BattleCommand_Stab:
	dr $34822, $34918
BattleCheckTypeMatchup::
	dr $34918, $34923
CheckTypeMatchup::
	dr $34923, $3499e
INCLUDE "engine/battle/ai/switch.asm"
	dr $34d01, $3503e

BattleCommand_LowerSub:
	dr $3503e, $3514e
BattleCommand_SwitchTurn:
	dr $3514e, $35155
BattleCommand_RaiseSub:
	dr $35155, $353f5
EndMoveEffect:
	dr $353f5, $3553d
EnemyAttackDamage::
	dr $3553d, $3571e
HitSelfInConfusion:
	dr $3571e, $35753
BattleCommand_DamageCalc::
	dr $35753, $35868
BattleCommand_ConstantDamage::
	dr $35868, $35e3c
FarPlayBattleAnimation:
	dr $35e3c, $35e44
PlayFXAnimID:
	dr $35e44, $35e58
DoEnemyDamage:
	dr $35e58, $35eba
DoPlayerDamage:
	dr $35eba, $35f7c
UpdateMoveData:
	dr $35f7c, $36313

RaiseStat:
	dr $36313, $364d7
BattleCommand_StatUpMessage:
	dr $364d7, $3656b
BattleCommand_StatUpFailText:
	dr $3656b, $366f6
CalcPlayerStats:
	dr $366f6, $378bd

ResetFuryCutterCount:
	dr $378bd, $378f4
CheckOppositeGender:
	dr $378f4, $37e7d
GetUserItem:
	dr $37e7d, $37e9b
GetItemHeldEffect:
	dr $37e9b, $37f3e
CallBattleCore:
	dr $37f3e, $37f4b
BattleCommand_MoveDelay:
	dr $37f4b, $37f6c
GetMoveAttr:
	dr $37f6c, $37f86
GetMoveByte:
	dr $37f86, $37f99
AppearUserRaiseSub:
	dr $37f99, $37fa0


SECTION "Enemy Trainers", ROMX

INCLUDE "engine/battle/ai/items.asm"
INCLUDE "engine/battle/ai/scoring.asm"
INCLUDE "engine/battle/read_trainer_attributes.asm"
INCLUDE "engine/battle/read_trainer_party.asm"


SECTION "Battle Core", ROMX
	dr $3c000, $3c551
FleeMons::
	dr $3c551, $3d39f

EnemySwitch:
	dr $3d39f, $3d438
ResetBattleParticipants:
	dr $3d438, $3d6cb
NewEnemyMonStatus:
	dr $3d6cb, $3d6fe
ResetEnemyStatLevels:
	dr $3d6fe, $3d70a
CheckPlayerPartyForFitMon::
	dr $3d70a, $3d8f5
Function3d8f5:
	dr $3d8f5, $3d907
Function3d907:
	dr $3d907, $3dabc
PursuitSwitch:
	dr $3dabc, $3dda9
UpdatePlayerHUD::
	dr $3dda9, $3de97
UpdateEnemyHUD::
	dr $3de97, $3e6e8

CheckEnemyLockedIn::
	dr $3e6e8, $3e74b
LoadEnemyMon:
	dr $3e74b, $3ec11
_BattleRandom::
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
	dr $3f55d, $3fd3d
BattleCommandPointers:
	dr $3fd3d, $3fe9b

SECTION "bank10", ROMX

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
	dr $427bd, $43e57

SECTION "bank11", ROMX
	dr $44000, $440c8
INCLUDE "engine/battle/ai/move.asm"
	dr $441c2, $44360
PokedexDataPointerTable::
	dr $44360, $44648
PlaceGraphic::
	dr $44648, $44679
SendMailToPC::
	dr $44679, $44830
BackupPartyMonMail:
	dr $44830, $44850
RestorePartyMonMail:
	dr $44850, $44870
DeletePartyMonMail:
	dr $44870, $4488c
IsAnyPokemonHoldingMail:
	dr $4488c, $448ab
_PlayerMailBoxMenu:
	dr $448ab, $44aa2

SECTION "bank14", ROMX

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
INCBIN "gfx/pokemon/egg/front.2bpp.lz"

SECTION "bank21", ROMX
	dr $84000, $842db
_PrinterReceive::
	dr $842db, $84560
PrintUnownStamp:
	dr $84560, $845d4
PrintMailAndExit:
	dr $845d4, $84616
PrintPartymon:
	dr $84616, $84684
Function84684:
	dr $84684, $86632

_HallOfFamePC:
	dr $86632, $87bfd

SECTION "bank23", ROMX

SaveMenu_CopyTilemapAtOnce:
	dr $8c000, $8c17a
ResetClock_:
	dr $8c17a, $8c310
DeleteSaveData_:
	dr $8c310, $8c355
DummyPredef35::
DummyPredef36::
	ret
UpdateTimeOfDayPal::
	dr $8c356, $8c366
_TimeOfDayPals::
	dr $8c366, $8c397
_UpdateTimePals::
	dr $8c397, $8c3a0
FadeInPalettes::
	dr $8c3a0, $8c3ab
FadeOutPalettes::
	dr $8c3ab, $8c3b9
FadeInQuickly:
	dr $8c3b9, $8c3c4
FadeBlackQuickly:
	dr $8c3c4, $8c3e9
Function8c3e9::
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

ClearSpriteAnims:
	dr $8d174, $8d183
PlaySpriteAnimationsAndDelay:
	dr $8d183, $8d18a
PlaySpriteAnimations:
	dr $8d18a, $8d1f7
_InitSpriteAnimStruct::
	dr $8d1f7, $8d332
_ReinitSpriteAnimFrame::

IF DEF(_GOLD)
	dr $8d332, $8e774
ClearSpriteAnims2::
	dr $8e774, $8e78b
LoadOverworldMonIcon::
	dr $8e78b, $8e79f
LoadMenuMonIcon::
	dr $8e79f, $8e922
UnfreezeMonIcons::
	dr $8e922, $8e93d
HoldSwitchmonIcon::
	dr $8e93d, $8fe43
ELIF DEF(_SILVER)
	dr $8d332, $8e75a
ClearSpriteAnims2::
	dr $8e75a, $8e771
LoadOverworldMonIcon::
	dr $8e771, $8e785
LoadMenuMonIcon::
	dr $8e785, $8e908
UnfreezeMonIcons::
	dr $8e908, $8e923
HoldSwitchmonIcon::
	dr $8e923, $8fe29
ENDC

SECTION "bank24", ROMX
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
	dr $92c36, $93f86

SECTION "bank25", ROMX

MapTriggers::
	dr $94000, $940ed

INCLUDE "data/maps/maps.asm"
INCLUDE "data/maps/attributes.asm"

OverworldLoop::
	dr $965f9, $96b89
EnableScriptMode::
	dr $96b89, $96b91
ScriptEvents::
	dr $96b91, $97365

CallCallback::
	dr $97365, $97a59
WarpToSpawnPoint:
	dr $97a59, $97c2a
Function97c2a::
	dr $97c2a, $97d96

SECTION "bank26", ROMX

IF DEF(_GOLD)
TitleScreenGFX1:
	dr $98000, $98476
TitleScreenGFX2:
	dr $98476, $98616
GSIntroTilemap:
	dr $98616, $98857
ELIF DEF(_SILVER)
TitleScreenGFX1:
	dr $98000, $98498
TitleScreenGFX2:
	dr $98498, $9862a
GSIntroTilemap:
	dr $9862a, $9886b
ENDC

INCLUDE "data/maps/blocks.asm"

SECTION "bank2e_2", ROMX

INCLUDE "engine/events/checkforhiddenitems.asm"
INCLUDE "engine/events/treemons.asm"
INCLUDE "engine/pokegear/radio.asm"
INCLUDE "engine/pokemon/mail_2.asm"

SECTION "bank31_2", ROMX
Functionc7a40:
	dr $c7a40, $c7a5a
CheckForLuckyNumberWinners:
	dr $c7a5a, $c7bad
PrintTodaysLuckyNumber:
	dr $c7bad, $c7bbf
CheckPartyFullAfterContest:
	dr $c7bbf, $c7cd0
Functionc7cd0:
	dr $c7cd0, $c7cde

SECTION "bank32", ROMX
	dr $c8000, $c80d6
DummyPredef2F::
	dr $c80d6, $c900a

INCLUDE "data/moves/animations.asm"

LoadPoisonBGPals::
	dr $cbc76, $cbdba

SECTION "bank33", ROMX

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

SECTION "bank36", ROMX
	dr $d8000, $d8400

SECTION "bank38", ROMX
	dr $e0000, $e0002
Functione0002:
	dr $e0002, $e081b
RotateUnownFrontpic:
	dr $e081b, $e0909
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
	dr $e3d25, $e3f74

SECTION "bank39", ROMX

CopyrightGFX:
INCBIN "gfx/intro/copyright.2bpp"

IF DEF(_GOLD)
TitleScreenGFX3:
	dr $e41e0, $e4260
TitleScreenGFX4:
	dr $e4260, $e4608
OptionsMenu:
	dr $e4608, $e49a8
ELIF DEF(_SILVER)
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
	dr $e4cb1, $e7678
ELIF DEF(_SILVER)
GoldSilverIntro:
	dr $e4af9, $e74c0
ENDC

SECTION "bank3e", ROMX

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
	dr $fbdd6, $fbdf1
HiddenPowerDamage:
	dr $fbdf1, $fbf93

SECTION "bank3f", ROMX
	nop
DummyPredef3A::
	ret
	dr $fc002, $fde20

SECTION "bank40", ROMX
	dr $100000, $10110c

INCLUDE "data/text/battle.asm"

SECTION "bank41", ROMX
	dr $104000, $10614d

INCLUDE "data/maps/scripts.asm"

SECTION "bank6c", ROMX

ItemNames::
	dr $1b0000, $1b0955
TrainerClassNames::
	dr $1b0955, $1b0b74
PokemonNames::
	dr $1b0b74, $1b1574
MoveNames::
	dr $1b1574, $1b1ee1

SECTION "bank6d", ROMX

INCLUDE "data/moves/descriptions.asm"

SECTION "bank6e", ROMX
	dr $1b8000, $1b9544

SECTION "bank70", ROMX
	dr $1c0000, $1c0a66
UpdateTimePredef::
	dr $1c0a66, $1c0a7a
StubbedGetFrontpic::
	ret
Function1c0a7b::
	dr $1c0a7b, $1c0de9
_DudeAutoInput_A::
	dr $1c0de9, $1c0dee

IF DEF(_GOLD)
DudeAutoInput_RightA::
	dr $1c0dee, $1c168b
ELIF DEF(_SILVER)
DudeAutoInput_RightA::
	dr $1c0dee, $1c168c
ENDC

SECTION "bank7f", ROMX
	dr $1ffdf8, $200000
