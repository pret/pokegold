INCLUDE "constants.asm"


SECTION "bank1", ROMX

INCLUDE "engine/link/place_waiting_text.asm"
INCLUDE "engine/gfx/load_push_oam.asm"
INCLUDE "engine/overworld/map_objects.asm"
INCLUDE "engine/menus/main_menu.asm"
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
INCLUDE "engine/battle_anims/pokeball_wobble.asm"
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
INCLUDE "data/tilesets.asm"
INCLUDE "engine/events/pokecenter_pc.asm"
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

TilesetKantoMeta::
INCBIN "data/tilesets/kanto_metatiles.bin"
TilesetKantoColl::
	dr $18800, $18a00
Tileset0GFX::
TilesetJohtoGFX::
INCBIN "gfx/tilesets/johto.2bpp.lz"

Tileset0Meta::
TilesetJohtoMeta::
INCBIN "data/tilesets/johto_metatiles.bin"
Tileset0Coll::
TilesetJohtoColl::
	dr $19806, $19a06
TilesetJohtoModernGFX::
INCBIN "gfx/tilesets/johto_modern.2bpp.lz"

TilesetJohtoModernMeta::
INCBIN "data/tilesets/johto_modern_metatiles.bin"
TilesetJohtoModernColl::
	dr $1a80c, $1b40c

TilesetTraditionalHouseGFX::
INCBIN "gfx/tilesets/traditional_house.2bpp.lz"
TilesetTraditionalHouseMeta::
INCBIN "data/tilesets/traditional_house_metatiles.bin"
TilesetTraditionalHouseColl::
	dr $1bcbc, $1bdbc


SECTION "bank7", ROMX

LoadMapGroupRoof::
	dr $1c000, $1c30c

TilesetGateGFX::
INCBIN "gfx/tilesets/gate.2bpp.lz"
TilesetGateMeta::
INCBIN "data/tilesets/gate_metatiles.bin"
TilesetGateColl::
	dr $1cb0c, $1cc0c
TilesetPokecenterGFX::
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"

TilesetPokecenterMeta::
INCBIN "data/tilesets/pokecenter_metatiles.bin"
TilesetPokecenterColl::
	dr $1d43c, $1d53c
TilesetPortGFX::
INCBIN "gfx/tilesets/port.2bpp.lz"
TilesetPortMeta::
INCBIN "data/tilesets/port_metatiles.bin"
TilesetPortColl::
	dr $1dd4c, $1de4c
TilesetPlayersHouseGFX::
INCBIN "gfx/tilesets/players_house.2bpp.lz"

TilesetPlayersHouseMeta::
INCBIN "data/tilesets/players_house_metatiles.bin"
TilesetPlayersHouseColl::
	dr $1e62c, $1e72c
TilesetMansionGFX::
INCBIN "gfx/tilesets/mansion.2bpp.lz"
TilesetMansionMeta::
INCBIN "data/tilesets/mansion_metatiles.bin"
TilesetMansionColl::
	dr $1eebc, $1efbc
TilesetCaveGFX::
INCBIN "gfx/tilesets/cave.2bpp.lz"

TilesetCaveMeta::
TilesetDarkCaveMeta::
INCBIN "data/tilesets/cave_metatiles.bin"
TilesetCaveColl::
TilesetDarkCaveColl::
	dr $1f74c, $1f84c


SECTION "bank8", ROMX

RestartClock_GetWraparoundTime::
	dr $20000, $20021
RestartClock::
	dr $20021, $20181

TilesetTowerGFX::
INCBIN "gfx/tilesets/tower.2bpp.lz"
TilesetTowerMeta::
INCBIN "data/tilesets/tower_metatiles.bin"
TilesetTowerColl::
	dr $209b1, $20ab1
TilesetLabGFX::
INCBIN "gfx/tilesets/lab.2bpp.lz"
TilesetLabMeta::
INCBIN "data/tilesets/lab_metatiles.bin"

TilesetLabColl::
	dr $21281, $21381
TilesetFacilityGFX::
INCBIN "gfx/tilesets/facility.2bpp.lz"
TilesetFacilityMeta::
INCBIN "data/tilesets/facility_metatiles.bin"
TilesetFacilityColl::
	dr $21ba1, $21ca1
TilesetMartGFX::
INCBIN "gfx/tilesets/mart.2bpp.lz"

TilesetMartMeta::
INCBIN "data/tilesets/mart_metatiles.bin"
TilesetMartColl::
	dr $22451, $22551
TilesetGameCornerGFX::
INCBIN "gfx/tilesets/game_corner.2bpp.lz"
TilesetGameCornerMeta::
INCBIN "data/tilesets/game_corner_metatiles.bin"
TilesetGameCornerColl::
	dr $22d51, $22e51
TilesetTrainStationGFX::
INCBIN "gfx/tilesets/train_station.2bpp.lz"

TilesetTrainStationMeta::
INCBIN "data/tilesets/train_station_metatiles.bin"
TilesetTrainStationColl::
	dr $235f1, $236f1
TilesetForestMeta::
INCBIN "data/tilesets/forest_metatiles.bin"

CatchTutorial::
	dr $23971, $239fe


SECTION "bank9", ROMX

INCLUDE "data/text_buffers.asm"
INCLUDE "engine/menus/menu.asm"
INCLUDE "engine/items/update_item_description.asm"
INCLUDE "engine/events/pokepic.asm"
INCLUDE "engine/overworld/map_objects_2.asm"
INCLUDE "engine/menus/scrolling_menu.asm"
INCLUDE "engine/items/switch_items.asm"
INCLUDE "engine/menus/menu_2.asm"
INCLUDE "engine/pokemon/mon_submenu.asm"
INCLUDE "engine/battle/menu.asm"
INCLUDE "engine/items/buy_sell_toss.asm"
INCLUDE "engine/menus/trainer_card.asm"
INCLUDE "engine/events/prof_oaks_pc.asm"
INCLUDE "engine/overworld/decorations.asm"
INCLUDE "engine/battle/read_trainer_dvs.asm"
INCLUDE "engine/battle/returntobattle_useball.asm"
INCLUDE "engine/battle/consume_held_item.asm"
INCLUDE "data/moves/effects.asm"


SECTION "bankA", ROMX

INCLUDE "engine/link/link.asm"
INCLUDE "engine/link/mystery_gift.asm"
INCLUDE "engine/overworld/wildmons.asm"


SECTION "bankB", ROMX

INCLUDE "engine/items/print_item_description.asm"
INCLUDE "engine/battle/trainer_huds.asm"
INCLUDE "engine/battle/ai/redundant.asm"
INCLUDE "engine/events/move_deleter.asm"
INCLUDE "engine/link/mystery_gift_2.asm"
INCLUDE "engine/items/tmhm.asm"
INCLUDE "engine/pokemon/print_move_description.asm"
INCLUDE "engine/events/pokerus/pokerus.asm"


SECTION "bankC", ROMX

TilesetEliteFourRoomGFX::
INCBIN "gfx/tilesets/elite_four_room.2bpp.lz"
TilesetEliteFourRoomMeta::
INCBIN "data/tilesets/elite_four_room_metatiles.bin"
TilesetEliteFourRoomColl::
	dr $308e0, $309e0
TilesetParkGFX::
INCBIN "gfx/tilesets/park.2bpp.lz"
TilesetParkMeta::
INCBIN "data/tilesets/park_metatiles.bin"

TilesetParkColl::
	dr $31240, $31340
TilesetRuinsOfAlphGFX::
INCBIN "gfx/tilesets/ruins_of_alph.2bpp.lz"
TilesetRuinsOfAlphMeta::
INCBIN "data/tilesets/ruins_of_alph_metatiles.bin"
TilesetRuinsOfAlphColl::
	dr $31a70, $31b70
TilesetRadioTowerGFX::
INCBIN "gfx/tilesets/radio_tower.2bpp.lz"
TilesetRadioTowerMeta::
INCBIN "data/tilesets/radio_tower_metatiles.bin"

TilesetRadioTowerColl::
	dr $323c0, $324c0
TilesetUndergroundGFX::
INCBIN "gfx/tilesets/underground.2bpp.lz"
TilesetUndergroundMeta::
INCBIN "data/tilesets/underground_metatiles.bin"
TilesetUndergroundColl::
	dr $32c90, $32d90
TilesetIcePathGFX::
INCBIN "gfx/tilesets/ice_path.2bpp.lz"

TilesetIcePathMeta::
INCBIN "data/tilesets/ice_path_metatiles.bin"
TilesetIcePathColl::
	dr $335d0, $336d0
TilesetDarkCaveGFX::
INCBIN "gfx/tilesets/dark_cave.2bpp.lz"
TilesetForestGFX::
INCBIN "gfx/tilesets/forest.2bpp.lz"


SECTION "Effect Commands", ROMX

INCLUDE "engine/battle/effect_commands.asm"


SECTION "Enemy Trainers", ROMX

INCLUDE "engine/battle/ai/items.asm"
INCLUDE "engine/battle/ai/scoring.asm"
INCLUDE "engine/battle/read_trainer_attributes.asm"
INCLUDE "engine/battle/read_trainer_party.asm"


SECTION "Battle Core", ROMX

INCLUDE "engine/battle/core.asm"
INCLUDE "data/battle/effect_command_pointers.asm"


SECTION "bank10", ROMX

INCLUDE "engine/pokedex/pokedex.asm"
INCLUDE "data/moves/moves.asm"
INCLUDE "engine/pokemon/evolve.asm"


SECTION "bank11", ROMX

INCLUDE "engine/events/fruit_trees.asm"
INCLUDE "engine/battle/ai/move.asm"
INCLUDE "engine/pokedex/pokedex_2.asm"
INCLUDE "engine/battle/start_battle.asm"
INCLUDE "engine/gfx/place_graphic.asm"
INCLUDE "engine/pokemon/mail.asm"


SECTION "bank14", ROMX

SelectMonFromParty::
	dr $50000, $5001d
SelectTradeOrDayCareMon::
	dr $5001d, $5004f
LoadPartyMenuGFX::
	dr $5004f, $5005f
WritePartyMenuTilemap::
	dr $5005f, $50355
InitPartyMenuGFX::
	dr $50355, $5037a
InitPartyMenuWithCancel::
	dr $5037a, $503a2
InitPartyMenuNoCancel::
	dr $503a2, $503cc
PartyMenuSelect::
	dr $503cc, $5040f
PrintPartyMenuText::
	dr $5040f, $504db
PrintPartyMenuActionText::
	dr $504db, $5054f
LoadFishingGFX::
	dr $5054f, $50610
DoPoisonStep::
	dr $50610, $506f2
SweetScentFromMenu::
	dr $506f2, $50763
_Squirtbottle::
	dr $50763, $507ac
_CardKey::
	dr $507ac, $507e7
_BasementKey::
	dr $507e7, $50819
_SacredAsh::
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
	dr $51478, $514c2
InitList::
	dr $514c2, $51524
CalcLevel::
	dr $51524, $51550
CalcExpAtLevel::
	dr $51550, $5161b
_SwitchPartyMons::
	dr $5161b, $51749
INCLUDE "engine/gfx/load_pics.asm"
INCLUDE "engine/pokemon/move_mon_wo_mail.asm"
INCLUDE "data/pokemon/base_stats.asm"

Unknown53a6b::
	dr $53a6b, $53a83
EggPic::
INCBIN "gfx/pokemon/egg/front.2bpp.lz"


SECTION "bank21", ROMX

Printer_StartTransmission::
	dr $84000, $842db
_PrinterReceive::
	dr $842db, $8442c
PrintDexEntry::
	dr $8442c, $84560
PrintUnownStamp::
	dr $84560, $845d4
PrintMailAndExit::
	dr $845d4, $84616
PrintPartymon::
	dr $84616, $84684
_PrintDiploma::
	dr $84684, $8640a

HallOfFame::
	dr $8640a, $86446
RedCredits::
	dr $86446, $86632
_HallOfFamePC::
	dr $86632, $87b65
INCLUDE "data/credits_strings_pointers.asm"


SECTION "bank23", ROMX

SaveMenu_CopyTilemapAtOnce::
	dr $8c000, $8c0b9
PhoneRing_CopyTilemapAtOnce::
	dr $8c0b9, $8c17a
_ResetClock::
	dr $8c17a, $8c310
_DeleteSaveData::
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
FadeInQuickly::
	dr $8c3b9, $8c3c4
FadeBlackQuickly::
	dr $8c3c4, $8c3e9
ReplaceTimeOfDayPals::
	dr $8c3e9, $8c513
DoBattleTransition::
	dr $8c513, $8ca5e
PlayWhirlpoolSound::
	dr $8ca5e, $8ca6b
BlindingFlash::
	dr $8ca6b, $8ca8e
ShakeHeadbuttTree::
	dr $8ca8e, $8cbb8
OWCutAnimation::
	dr $8cbb8, $8cd65
FlyFromAnim::
	dr $8cd65, $8cdab
FlyToAnim::
	dr $8cdab, $8ce7c
MagnetTrain::
	dr $8ce7c, $8d174

ClearSpriteAnims::
	dr $8d174, $8d183
PlaySpriteAnimationsAndDelayFrame::
	dr $8d183, $8d18a
PlaySpriteAnimations::
	dr $8d18a, $8d1c9
DoNextFrameForFirst16Sprites::
	dr $8d1c9, $8d1f7
_InitSpriteAnimStruct::
	dr $8d1f7, $8d332

_ReinitSpriteAnimFrame::
IF DEF(_GOLD)
	dr $8d332, $8e6fd
AnimateEndOfExpBar::
	dr $8e6fd, $8e774
ClearSpriteAnims2::
	dr $8e774, $8e78b
LoadOverworldMonIcon::
	dr $8e78b, $8e79f
LoadMenuMonIcon::
	dr $8e79f, $8e88f
GetSpeciesIcon::
	dr $8e88f, $8e8fb
FreezeMonIcons::
	dr $8e8fb, $8e922
UnfreezeMonIcons::
	dr $8e922, $8e93d
HoldSwitchmonIcon::
	dr $8e93d, $8fe43

ELIF DEF(_SILVER)
	dr $8d332, $8e6e3
AnimateEndOfExpBar::
	dr $8e6e3, $8e75a
ClearSpriteAnims2::
	dr $8e75a, $8e771
LoadOverworldMonIcon::
	dr $8e771, $8e785
LoadMenuMonIcon::
	dr $8e785, $8e875
GetSpeciesIcon::
	dr $8e875, $8e8e1
FreezeMonIcons::
	dr $8e8e1, $8e908
UnfreezeMonIcons::
	dr $8e908, $8e923
HoldSwitchmonIcon::
	dr $8e923, $8fe29
ENDC


SECTION "bank24", ROMX

INCLUDE "engine/phone/phone.asm"
INCLUDE "engine/rtc/timeset.asm"
INCLUDE "engine/pokegear/pokegear.asm"
INCLUDE "engine/overworld/landmarks.asm"
INCLUDE "engine/events/fish.asm"
INCLUDE "engine/games/slot_machine.asm"


SECTION "bank26", ROMX

IF DEF(_GOLD)
TitleScreenGFX1::
	dr $98000, $98476
TitleScreenGFX2::
	dr $98476, $98616
GSIntroTilemap::
	dr $98616, $98857

ELIF DEF(_SILVER)
TitleScreenGFX1::
	dr $98000, $98498
TitleScreenGFX2::
	dr $98498, $9862a
GSIntroTilemap::
	dr $9862a, $9886b
ENDC


SECTION "bank2e_2", ROMX

INCLUDE "engine/events/checkforhiddenitems.asm"
INCLUDE "engine/events/treemons.asm"
INCLUDE "engine/pokegear/radio.asm"
INCLUDE "engine/pokemon/mail_2.asm"


SECTION "bank31_2", ROMX

_CheckPokerus::
	dr $c7a40, $c7a5a
CheckForLuckyNumberWinners::
	dr $c7a5a, $c7bad
PrintTodaysLuckyNumber::
	dr $c7bad, $c7bbf
CheckPartyFullAfterContest::
	dr $c7bbf, $c7cd0
GiveANickname_YesNo::
	dr $c7cd0, $c7cde


SECTION "bank32", ROMX

ExecuteBGEffects::
	dr $c8000, $c80d6
DummyPredef2F::
	dr $c80d6, $c900a
INCLUDE "data/moves/animations.asm"

LoadPoisonBGPals::
	dr $cbc76, $cbdba


SECTION "Move Animations", ROMX

DisplayCaughtContestMonStats::
	dr $cc000, $cc0c8
DisplayAlreadyCaughtText::
	dr $cc0c8, $cc0d6
DummyPredef38::
DummyPredef39::
	ret
PlayBattleAnim::
	dr $cc0d7, $cc283
BattleAnimCommands::
	dr $cc283, $cc5f7
BattleAnimCmd_RaiseSub::
	dr $cc5f7, $cc67c
BattleAnimCmd_MinimizeOpp::
	dr $cc67c, $cc836
ClearBattleAnims::
	dr $cc836, $ce6aa

BattleAnim_Sine_e::
	dr $ce6aa, $cfce3


SECTION "Font Inversed", ROMX

FontInversed:
INCBIN "gfx/font/font_inversed.1bpp"


SECTION "bank37_2", ROMX

TilesetChampionsRoomGFX::
INCBIN "gfx/tilesets/champions_room.2bpp.lz"
TilesetChampionsRoomMeta::
INCBIN "data/tilesets/champions_room_metatiles.bin"
TilesetChampionsRoomColl::
	dr $de033, $de133
TilesetHouseGFX::
INCBIN "gfx/tilesets/house.2bpp.lz"
TilesetHouseMeta::
INCBIN "data/tilesets/house_metatiles.bin"
TilesetHouseColl::
	dr $de9d3, $dead3
TilesetLighthouseGFX::
INCBIN "gfx/tilesets/lighthouse.2bpp.lz"
TilesetLighthouseMeta::
INCBIN "data/tilesets/lighthouse_metatiles.bin"
TilesetLighthouseColl::
	dr $df2d3, $df3d3
TilesetPlayersRoomGFX::
INCBIN "gfx/tilesets/players_room.2bpp.lz"
TilesetPlayersRoomMeta::
INCBIN "data/tilesets/players_room_metatiles.bin"
TilesetPlayersRoomColl::
	dr $dfc93, $dfd93
TilesetForestColl::
	dr $dfd93, $dfe93


SECTION "bank38", ROMX

	ret
	ret
_Diploma::
	dr $e0002, $e081b
RotateUnownFrontpic::
	dr $e081b, $e0909
_CardFlip::
	dr $e0909, $e199d

_UnownPuzzle::
	dr $e199d, $e2668

_DummyGame::
	dr $e2668, $e2b9e
_DepositPKMN::
	dr $e2b9e, $e2d71
_WithdrawPKMN::
	dr $e2d71, $e2f47
_MovePKMNWithoutMail::
	dr $e2f47, $e3d25

_ChangeBox::
	dr $e3d25, $e3f74


SECTION "bank39", ROMX

CopyrightGFX::
INCBIN "gfx/intro/copyright.2bpp"

IF DEF(_GOLD)
TitleScreenGFX3::
	dr $e41e0, $e4260
TitleScreenGFX4::
	dr $e4260, $e4608
_OptionsMenu::
	dr $e4608, $e49a8

ELIF DEF(_SILVER)
TitleScreenGFX3::
	dr $e41e0, $e4220
TitleScreenGFX4::
	dr $e4220, $e4450
_OptionsMenu::
	dr $e4450, $e47f0
ENDC

INCLUDE "engine/movie/gamefreak_presents.asm"

IF DEF(_GOLD)
GoldSilverIntro::
	dr $e4cb1, $e7678

ELIF DEF(_SILVER)
GoldSilverIntro::
	dr $e4af9, $e74c0
ENDC


SECTION "bank3e", ROMX

_LoadStandardFont::
	dr $f8000, $f800c
_LoadFontsExtra::
	dr $f800c, $f8032
_LoadFontsBattleExtra::
	dr $f8032, $f8066
LoadBattleFontsHPBar::
	dr $f8066, $f8081
LoadHPBar::
	dr $f8081, $f80d9
LoadStatsScreenPageTilesGFX::
	dr $f80d9, $f8aa2
StatsScreenPageTilesGFX::
	dr $f8aa2, $f8bb2
EnemyHPBarBorderGFX::
	dr $f8bb2, $f8bd2
HPExpBarBorderGFX::
	dr $f8bd2, $f8c02
ExpBarGFX::
	dr $f8c02, $f8c92
TownMapGFX::
	dr $f8c92, $f930e

Footprints::
	dr $f930e, $fb30e

UnownFont::
	dr $fb30e, $fb4be
TileCollisionTable::
	dr $fb4be, $fb5be
Shrink1Pic::
	dr $fb5be, $fb64e
Shrink2Pic::
	dr $fb64e, $fb68e
ValidateOTTrademon::
	dr $fb68e, $fb6ed
Functionfb6ed::
	dr $fb6ed, $fb71d
PlaceTradePartnerNamesAndParty::
	dr $fb71d, $fb760
KantoMonSpecials::
	dr $fb760, $fb7f7
_NameRater::
	dr $fb7f7, $fb94b
PlaySlowCry::
	dr $fb94b, $fb981
NewPokedexEntry::
	dr $fb981, $fb9fb
ConvertMon_2to1::
	dr $fb9fb, $fba12
ConvertMon_1to2::
	dr $fba12, $fbb22
UpdateUnownDex::
	dr $fbb22, $fbb38
PrintUnownWord::
	dr $fbb38, $fbc3c
CheckMagikarpLength::
	dr $fbc3c, $fbd00
CalcMagikarpLength::
	dr $fbd00, $fbdd6
MagikarpHouseSign::
	dr $fbdd6, $fbdf1
HiddenPowerDamage::
	dr $fbdf1, $fbe5a
_DisappearUser::
	dr $fbe5a, $fbe6f
_AppearUserRaiseSub::
	dr $fbe6f, $fbe77
_AppearUserLowerSub::
	dr $fbe77, $fbeaa
DoWeatherModifiers::
	dr $fbeaa, $fbf2b
DoBadgeTypeBoosts::
	dr $fbf2b, $fbf93


SECTION "bank3f", ROMX

INCLUDE "engine/tilesets/tileset_anims.asm"
INCLUDE "engine/events/npc_trade.asm"
MomTriesToBuySomething::
	dr $fcd87, $fcf6a
StagePartyDataForMysteryGift::
	dr $fcf6a, $fcfb2
InitMysteryGiftLayout::
	dr $fcfb2, $fde20


SECTION "Standard Scripts", ROMX

INCLUDE "engine/events/std_scripts.asm"
INCLUDE "data/text/std_text.asm"
INCLUDE "data/text/battle.asm"


SECTION "bank41", ROMX

; Phone scripts and text
UnusedPhoneScript::
	dr $104000, $104004
MomPhoneCalleeScript::
	dr $104004, $104124
MomPhoneLectureScript::
	dr $104124, $104137
BillPhoneCalleeScript::
	dr $104137, $104172
BillPhoneCallerScript::
	dr $104172, $104177
ElmPhoneCalleeScript::
	dr $104177, $1041e1
ElmPhoneCallerScript::
	dr $1041e1, $10422a
JackPhoneCalleeScript::
	dr $10422a, $104234
JackPhoneCallerScript::
	dr $104234, $104256
BeverlyPhoneCalleeScript::
	dr $104256, $104260
BeverlyPhoneCallerScript::
	dr $104260, $104282
HueyPhoneCalleeScript::
	dr $104282, $10428c
HueyPhoneCallerScript::
	dr $10428c, $1042a7
GavenPhoneCalleeScript::
	dr $1042a7, $1042b1
GavenPhoneCallerScript::
	dr $1042b1, $1042d3
BethPhoneCalleeScript::
	dr $1042d3, $1042dd
BethPhoneCallerScript::
	dr $1042dd, $1042ff
JosePhoneCalleeScript::
	dr $1042ff, $104309
JosePhoneCallerScript::
	dr $104309, $104332
ReenaPhoneCalleeScript::
	dr $104332, $10433c
ReenaPhoneCallerScript::
	dr $10433c, $10435e
JoeyPhoneCalleeScript::
	dr $10435e, $104368
JoeyPhoneCallerScript::
	dr $104368, $104390
WadePhoneCalleeScript::
	dr $104390, $1043b5
WadePhoneCallerScript::
	dr $1043b5, $1043f8
RalphPhoneCalleeScript::
	dr $1043f8, $104402
RalphPhoneCallerScript::
	dr $104402, $104446
LizPhoneCalleeScript::
	dr $104446, $104450
LizPhoneCallerScript::
	dr $104450, $104478
AnthonyPhoneCalleeScript::
	dr $104478, $104482
AnthonyPhoneCallerScript::
	dr $104482, $1044c4
ToddPhoneCalleeScript::
	dr $1044c4, $1044ce
ToddPhoneCallerScript::
	dr $1044ce, $1044f6
GinaPhoneCalleeScript::
	dr $1044f6, $104506
GinaPhoneCallerScript::
	dr $104506, $104534
IrwinPhoneCalleeScript::
	dr $104534, $104544
IrwinPhoneCallerScript::
	dr $104544, $10456c
ArniePhoneCalleeScript::
	dr $10456c, $104576
ArniePhoneCallerScript::
	dr $104576, $1045b2
AlanPhoneCalleeScript::
	dr $1045b2, $1045bc
AlanPhoneCallerScript::
	dr $1045bc, $1045de
DanaPhoneCalleeScript::
	dr $1045de, $1045e8
DanaPhoneCallerScript::
	dr $1045e8, $10460a
ChadPhoneCalleeScript::
	dr $10460a, $104614
ChadPhoneCallerScript::
	dr $104614, $104650
DerekPhoneCalleeScript::
	dr $104650, $104675
DerekPhoneCallerScript::
	dr $104675, $1046b2
ChrisPhoneCalleeScript::
	dr $1046b2, $1046bc
ChrisPhoneCallerScript::
	dr $1046bc, $1046de
BrentPhoneCalleeScript::
	dr $1046de, $1046e8
BrentPhoneCallerScript::
	dr $1046e8, $104711
TiffanyPhoneCalleeScript::
	dr $104711, $10471b
TiffanyPhoneCallerScript::
	dr $10471b, $104744
VancePhoneCalleeScript::
	dr $104744, $10474e
VancePhoneCallerScript::
	dr $10474e, $104770
WiltonPhoneCalleeScript::
	dr $104770, $10477a
WiltonPhoneCallerScript::
	dr $10477a, $1047b8
KenjiPhoneCalleeScript::
	dr $1047b8, $1047c2
KenjiPhoneCallerScript::
	dr $1047c2, $1047e4
ParryPhoneCalleeScript::
	dr $1047e4, $1047ee
ParryPhoneCallerScript::
	dr $1047ee, $10482a
ErinPhoneCalleeScript::
	dr $10482a, $104834
ErinPhoneCallerScript::
	dr $104834, $104a80
BikeShopPhoneCallerScript::
	dr $104a80, $10614d


SECTION "Names", ROMX

INCLUDE "data/items/names.asm"
INCLUDE "data/trainers/class_names.asm"
INCLUDE "data/pokemon/names.asm"
INCLUDE "data/moves/names.asm"


SECTION "Move Descriptions", ROMX

INCLUDE "data/moves/descriptions.asm"


SECTION "Item Descriptions", ROMX

INCLUDE "data/items/descriptions.asm"


SECTION "bank70", ROMX

INCLUDE "engine/printer/print_party.asm"

TilesetKantoGFX:
INCBIN "gfx/tilesets/kanto.2bpp.lz"

INCLUDE "engine/rtc/print_hours_mins.asm"
INCLUDE "engine/pokedex/pokedex_3.asm"
INCLUDE "engine/events/catch_tutorial_input.asm"
INCLUDE "engine/pokegear/townmap_convertlinebreakcharacters.asm"

PokegearGFX:
INCBIN "gfx/pokegear/pokegear.2bpp.lz"

INCLUDE "data/credits_strings.asm"


SECTION "Stadium Data", ROMX

IF DEF(_GOLD)
INCBIN "data/stadium/stadium_gold.bin"
ELIF DEF(_SILVER)
INCBIN "data/stadium/stadium_silver.bin"
ENDC
