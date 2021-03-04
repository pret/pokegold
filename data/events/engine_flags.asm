engine_flag: MACRO
; location, bit
; (all locations are in WRAM bank 1)
	dwb \1 + (\2 / 8), 1 << (\2 % 8)
ENDM

EngineFlags:
; entries correspond to ENGINE_* constants
	table_width 3, EngineFlags

	; pokegear
	engine_flag wPokegearFlags, POKEGEAR_RADIO_CARD_F
	engine_flag wPokegearFlags, POKEGEAR_MAP_CARD_F
	engine_flag wPokegearFlags, POKEGEAR_PHONE_CARD_F
	engine_flag wPokegearFlags, POKEGEAR_EXPN_CARD_F
	engine_flag wPokegearFlags, POKEGEAR_OBTAINED_F

	; day-care
	engine_flag wDayCareMan, DAYCAREMAN_HAS_EGG_F
	engine_flag wDayCareMan, DAYCAREMAN_HAS_MON_F
	engine_flag wDayCareLady, DAYCARELADY_HAS_MON_F

	engine_flag wMomSavingMoney, MOM_SAVING_SOME_MONEY_F
	engine_flag wMomSavingMoney, MOM_ACTIVE_F

	engine_flag wUnusedTwoDayTimerOn, 0 ; unused, possibly related to a 2-day timer

	engine_flag wStatusFlags, STATUSFLAGS_POKEDEX_F
	engine_flag wStatusFlags, STATUSFLAGS_UNOWN_DEX_F
	engine_flag wStatusFlags, STATUSFLAGS_CAUGHT_POKERUS_F
	engine_flag wStatusFlags, STATUSFLAGS_ROCKET_SIGNAL_F
	engine_flag wStatusFlags, STATUSFLAGS_HALL_OF_FAME_F

	engine_flag wStatusFlags2, STATUSFLAGS2_BUG_CONTEST_TIMER_F
	engine_flag wStatusFlags2, STATUSFLAGS2_SAFARI_GAME_F
	engine_flag wStatusFlags2, STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F
	engine_flag wStatusFlags2, STATUSFLAGS2_BIKE_SHOP_CALL_F
	engine_flag wStatusFlags2, STATUSFLAGS2_UNUSED_5_F
	engine_flag wStatusFlags2, STATUSFLAGS2_REACHED_GOLDENROD_F
	engine_flag wStatusFlags2, STATUSFLAGS2_ROCKETS_IN_MAHOGANY_F

	engine_flag wBikeFlags, BIKEFLAGS_STRENGTH_ACTIVE_F
	engine_flag wBikeFlags, BIKEFLAGS_ALWAYS_ON_BIKE_F
	engine_flag wBikeFlags, BIKEFLAGS_DOWNHILL_F

	engine_flag wJohtoBadges, ZEPHYRBADGE
	engine_flag wJohtoBadges, HIVEBADGE
	engine_flag wJohtoBadges, PLAINBADGE
	engine_flag wJohtoBadges, FOGBADGE
	engine_flag wJohtoBadges, MINERALBADGE
	engine_flag wJohtoBadges, STORMBADGE
	engine_flag wJohtoBadges, GLACIERBADGE
	engine_flag wJohtoBadges, RISINGBADGE

	engine_flag wKantoBadges, BOULDERBADGE
	engine_flag wKantoBadges, CASCADEBADGE
	engine_flag wKantoBadges, THUNDERBADGE
	engine_flag wKantoBadges, RAINBOWBADGE
	engine_flag wKantoBadges, SOULBADGE
	engine_flag wKantoBadges, MARSHBADGE
	engine_flag wKantoBadges, VOLCANOBADGE
	engine_flag wKantoBadges, EARTHBADGE

	; unown sets (see data/wild/unlocked_unowns.asm)
	engine_flag wUnlockedUnowns, 0 ; A-K
	engine_flag wUnlockedUnowns, 1 ; L-R
	engine_flag wUnlockedUnowns, 2 ; S-W
	engine_flag wUnlockedUnowns, 3 ; X-Z
	engine_flag wUnlockedUnowns, 4 ; unused
	engine_flag wUnlockedUnowns, 5 ; unused
	engine_flag wUnlockedUnowns, 6 ; unused
	engine_flag wUnlockedUnowns, 7 ; unused

	; fly
	engine_flag wVisitedSpawns, SPAWN_HOME
	engine_flag wVisitedSpawns, SPAWN_DEBUG
	engine_flag wVisitedSpawns, SPAWN_PALLET
	engine_flag wVisitedSpawns, SPAWN_VIRIDIAN
	engine_flag wVisitedSpawns, SPAWN_PEWTER
	engine_flag wVisitedSpawns, SPAWN_CERULEAN
	engine_flag wVisitedSpawns, SPAWN_ROCK_TUNNEL
	engine_flag wVisitedSpawns, SPAWN_VERMILION
	engine_flag wVisitedSpawns, SPAWN_LAVENDER
	engine_flag wVisitedSpawns, SPAWN_SAFFRON
	engine_flag wVisitedSpawns, SPAWN_CELADON
	engine_flag wVisitedSpawns, SPAWN_FUCHSIA
	engine_flag wVisitedSpawns, SPAWN_CINNABAR
	engine_flag wVisitedSpawns, SPAWN_INDIGO
	engine_flag wVisitedSpawns, SPAWN_NEW_BARK
	engine_flag wVisitedSpawns, SPAWN_CHERRYGROVE
	engine_flag wVisitedSpawns, SPAWN_VIOLET
	engine_flag wVisitedSpawns, SPAWN_AZALEA
	engine_flag wVisitedSpawns, SPAWN_CIANWOOD
	engine_flag wVisitedSpawns, SPAWN_GOLDENROD
	engine_flag wVisitedSpawns, SPAWN_OLIVINE
	engine_flag wVisitedSpawns, SPAWN_ECRUTEAK
	engine_flag wVisitedSpawns, SPAWN_MAHOGANY
	engine_flag wVisitedSpawns, SPAWN_LAKE_OF_RAGE
	engine_flag wVisitedSpawns, SPAWN_BLACKTHORN
	engine_flag wVisitedSpawns, SPAWN_MT_SILVER
	engine_flag wVisitedSpawns, NUM_SPAWNS ; unused

	engine_flag wLuckyNumberShowFlag, LUCKYNUMBERSHOW_GAME_OVER_F

	engine_flag wStatusFlags2, STATUSFLAGS2_UNUSED_3_F

	engine_flag wDailyFlags1, DAILYFLAGS1_KURT_MAKING_BALLS_F
	engine_flag wDailyFlags1, DAILYFLAGS1_BUG_CONTEST_F
	engine_flag wDailyFlags1, DAILYFLAGS1_SWARM_F
	engine_flag wDailyFlags1, DAILYFLAGS1_TIME_CAPSULE_F
	engine_flag wDailyFlags1, DAILYFLAGS1_ALL_FRUIT_TREES_F
	engine_flag wDailyFlags1, DAILYFLAGS1_GOT_SHUCKIE_TODAY_F
	engine_flag wDailyFlags1, DAILYFLAGS1_GOLDENROD_UNDERGROUND_BARGAIN_F
	engine_flag wDailyFlags1, DAILYFLAGS1_TRAINER_HOUSE_F

	engine_flag wDailyFlags2, DAILYFLAGS2_MT_MOON_SQUARE_CLEFAIRY_F
	engine_flag wDailyFlags2, DAILYFLAGS2_UNION_CAVE_LAPRAS_F
	engine_flag wDailyFlags2, DAILYFLAGS2_GOLDENROD_UNDERGROUND_GOT_HAIRCUT_F
	engine_flag wDailyFlags2, DAILYFLAGS2_GOLDENROD_DEPT_STORE_TM27_RETURN_F
	engine_flag wDailyFlags2, DAILYFLAGS2_DAISYS_GROOMING_F
	engine_flag wDailyFlags2, DAILYFLAGS2_INDIGO_PLATEAU_RIVAL_FIGHT_F

	assert_table_length NUM_ENGINE_FLAGS
