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
INCLUDE "engine/link/mystery_gift_gfx.asm"
INCLUDE "engine/pokemon/breeding.asm"


SECTION "Roofs", ROMX

INCLUDE "engine/tilesets/mapgroup_roofs.asm"


SECTION "Clock Reset", ROMX

INCLUDE "engine/rtc/restart_clock.asm"


SECTION "Catch Tutorial", ROMX

INCLUDE "engine/events/catch_tutorial.asm"


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


INCLUDE "engine/pokemon/party_menu.asm"
INCLUDE "engine/events/fishing_gfx.asm"
INCLUDE "engine/events/poisonstep.asm"
INCLUDE "engine/events/sweet_scent.asm"
INCLUDE "engine/events/squirtbottle.asm"
INCLUDE "engine/events/card_key.asm"
INCLUDE "engine/events/basement_key.asm"
INCLUDE "engine/events/sacred_ash.asm"
INCLUDE "engine/pokemon/tempmon.asm"
INCLUDE "engine/pokemon/types.asm"
INCLUDE "engine/battle/unreferenced_getgen1trainerclassname.asm"
INCLUDE "engine/pokemon/mon_stats.asm"
INCLUDE "engine/link/init_list.asm"
INCLUDE "engine/pokemon/experience.asm"
INCLUDE "engine/pokemon/switchpartymons.asm"
INCLUDE "engine/gfx/load_pics.asm"
INCLUDE "engine/pokemon/move_mon_wo_mail.asm"
INCLUDE "data/pokemon/base_stats.asm"
INCLUDE "data/pokemon/unused_pic_banks.asm"

EggPic::
INCBIN "gfx/pokemon/egg/front.2bpp.lz"


SECTION "bank21", ROMX

INCLUDE "engine/printer/printer_serial.asm"
INCLUDE "engine/printer/printer.asm"
INCLUDE "gfx/battle_anims.asm"
INCLUDE "engine/events/halloffame.asm"


SECTION "bank23", ROMX

INCLUDE "engine/menus/savemenu_copytilemapatonce.asm"
INCLUDE "engine/phone/phonering_copytilemapatonce.asm"

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
	dr $8e93d, $8fdbe
InitDisplayForHallOfFame::
	dr $8fdbe, $8fdff
InitDisplayForRedCredits::
	dr $8fdff, $8fe43

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
	dr $8e923, $8fda4
InitDisplayForHallOfFame::
	dr $8fda4, $8fde5
InitDisplayForRedCredits::
	dr $8fde5, $8fe43
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
INCBIN "gfx/title/logo_bottom_gold.2bpp.lz"
TitleScreenGFX2::
INCBIN "gfx/title/logo_top_gold.2bpp.lz"

ELIF DEF(_SILVER)
TitleScreenGFX1::
INCBIN "gfx/title/logo_bottom_silver.2bpp.lz"
TitleScreenGFX2::
INCBIN "gfx/title/logo_top_silver.2bpp.lz"
ENDC

TitleScreenTilemap::
INCBIN "gfx/title/logo.tilemap"


SECTION "bank2e_2", ROMX

INCLUDE "engine/events/checkforhiddenitems.asm"
INCLUDE "engine/events/treemons.asm"
INCLUDE "engine/pokegear/radio.asm"
INCLUDE "engine/pokemon/mail_2.asm"


SECTION "bank31_2", ROMX

INCLUDE "engine/events/pokerus/check_pokerus.asm"
INCLUDE "engine/events/lucky_number.asm"
INCLUDE "engine/pokemon/caught_data.asm"


SECTION "bank32", ROMX

ExecuteBGEffects::
	dr $c8000, $c80d6
DummyPredef2F::
	dr $c80d6, $c900a
INCLUDE "data/moves/animations.asm"

LoadPoisonBGPals::
	dr $cbc76, $cbcbd
TheEndGFX::
INCBIN "gfx/credits/theend.2bpp"


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


SECTION "bank38", ROMX

	ret
	ret
_Diploma::
	dr $e0002, $e0009
PlaceDiplomaOnScreen::
	dr $e0009, $e00ae
PrintDiplomaPage2::
	dr $e00ae, $e081b
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
	dr $e2f47, $e3773

StatsScreenDPad::
	dr $e3773, $e3d25
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
	dr $f8081, $f80a6
StatsScreen_LoadFont::
	dr $f80a6, $f80d9
LoadStatsScreenPageTilesGFX::
	dr $f80d9, $f80f2

FontExtra:
	dr $f80f2, $f8aa2
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

INCLUDE "data/collision_permissions.asm"

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


SECTION "bank3F", ROMX

INCLUDE "engine/tilesets/tileset_anims.asm"
INCLUDE "engine/events/npc_trade.asm"
INCLUDE "engine/events/mom_phone.asm"
INCLUDE "engine/link/mystery_gift_3.asm"
INCLUDE "engine/menus/debug.asm"


SECTION "Standard Scripts", ROMX

INCLUDE "engine/events/std_scripts.asm"
INCLUDE "data/text/std_text.asm"
INCLUDE "data/text/battle.asm"


SECTION "Phone Scripts", ROMX

INCLUDE "engine/phone/scripts/unused.asm"
INCLUDE "engine/phone/scripts/mom.asm"
INCLUDE "engine/phone/scripts/bill.asm"
INCLUDE "engine/phone/scripts/elm.asm"
INCLUDE "engine/phone/scripts/trainers.asm"
INCLUDE "engine/phone/scripts/bike_shop.asm"
INCLUDE "data/phone/text/unused.asm"
INCLUDE "data/phone/text/mom.asm"
INCLUDE "data/phone/text/bill.asm"
INCLUDE "data/phone/text/elm.asm"
INCLUDE "data/phone/text/trainers.asm"
INCLUDE "data/phone/text/bike_shop.asm"


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


SECTION "bank70_2", ROMX

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
