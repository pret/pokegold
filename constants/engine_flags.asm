	const_def

	engine_flag_def ENGINE_RADIO_CARD,                            wPokegearFlags, 1 ; radio card       ; $0
	engine_flag_def ENGINE_MAP_CARD,                              wPokegearFlags, 0 ; map card
	engine_flag_def ENGINE_PHONE_CARD,                            wPokegearFlags, 2 ; phone card
	engine_flag_def ENGINE_EXPN_CARD,                             wPokegearFlags, 3 ; expn card
	engine_flag_def ENGINE_POKEGEAR,                              wPokegearFlags, 7 ; on/off

	engine_flag_def ENGINE_DAY_CARE_MAN_HAS_EGG,                   wDayCareMan, 6 ; egg is ready
	engine_flag_def ENGINE_DAY_CARE_MAN_HAS_MON,                   wDayCareMan, 0 ; monster 1 in daycare

	engine_flag_def ENGINE_DAY_CARE_LADY_HAS_MON,                  wDaycareLady, 0 ; monster 2 in daycare

	engine_flag_def ENGINE_MOM_SAVING_MONEY,                      wMomSavingMoney, 0 ; mom saving money ; $8
	engine_flag_def ENGINE_DST,                                   wMomSavingMoney, 7 ; dst

	engine_flag_def ENGINE_0A,                                    wUnusedTwoDayTimerOn, 0 ; unused

	engine_flag_def ENGINE_POKEDEX,                               wStatusFlags, 0 ; pokedex
	engine_flag_def ENGINE_UNOWN_DEX,                             wStatusFlags, 1 ; unown dex
	engine_flag_def ENGINE_POKERUS,                               wStatusFlags, 3 ; pokerus
	engine_flag_def ENGINE_ROCKET_SIGNAL_ON_CH20,                 wStatusFlags, 4 ; rocket signal on ch20
	engine_flag_def ENGINE_CREDITS_SKIP,                          wStatusFlags, 6 ; credits skip
	engine_flag_def ENGINE_BUG_CONTEST_TIMER,                     wStatusFlags2, 2 ; bug contest timer ; $10
	engine_flag_def ENGINE_SAFARI_ZONE,                           wStatusFlags2, 1 ; safari zone?
	engine_flag_def ENGINE_ROCKETS_IN_RADIO_TOWER,                wStatusFlags2, 0 ; rockets in radio tower
	engine_flag_def ENGINE_BIKE_SHOP_CALL_ENABLED,                wStatusFlags2, 4 ; bike shop call enabled (1024 bike steps reqd)
	engine_flag_def ENGINE_GIVE_POKERUS,                          wStatusFlags2, 5 ; give pokerus
	engine_flag_def ENGINE_FLORIA,                                wStatusFlags2, 6 ; berry -> berry juice when trading?
	engine_flag_def ENGINE_ROCKETS_IN_MAHOGANY,                   wStatusFlags2, 7 ; rockets in mahogany

	engine_flag_def ENGINE_STRENGTH_ACTIVE,                       wBikeFlags, 0 ; strength active
	engine_flag_def ENGINE_ALWAYS_ON_BIKE,                        wBikeFlags, 1 ; always on bike (cant surf)  ; $18
	engine_flag_def ENGINE_DOWNHILL,                              wBikeFlags, 2 ; downhill (cycling road)

	engine_flag_def ENGINE_ZEPHYRBADGE,                           wJohtoBadges, 0 ; zephyrbadge
	engine_flag_def ENGINE_HIVEBADGE,                             wJohtoBadges, 1 ; hivebadge
	engine_flag_def ENGINE_PLAINBADGE,                            wJohtoBadges, 2 ; plainbadge
	engine_flag_def ENGINE_FOGBADGE,                              wJohtoBadges, 3 ; fogbadge
	engine_flag_def ENGINE_MINERALBADGE,                          wJohtoBadges, 4 ; mineralbadge
	engine_flag_def ENGINE_STORMBADGE,                            wJohtoBadges, 5 ; stormbadge
	engine_flag_def ENGINE_GLACIERBADGE,                          wJohtoBadges, 6 ; glacierbadge ; $20
	engine_flag_def ENGINE_RISINGBADGE,                           wJohtoBadges, 7 ; risingbadge

	engine_flag_def ENGINE_BOULDERBADGE,                          wKantoBadges, 0 ; boulderbadge
	engine_flag_def ENGINE_CASCADEBADGE,                          wKantoBadges, 1 ; cascadebadge
	engine_flag_def ENGINE_THUNDERBADGE,                          wKantoBadges, 2 ; thunderbadge
	engine_flag_def ENGINE_RAINBOWBADGE,                          wKantoBadges, 3 ; rainbowbadge
	engine_flag_def ENGINE_SOULBADGE,                             wKantoBadges, 4 ; soulbadge
	engine_flag_def ENGINE_MARSHBADGE,                            wKantoBadges, 5 ; marshbadge
	engine_flag_def ENGINE_VOLCANOBADGE,                          wKantoBadges, 6 ; volcanobadge ; $28
	engine_flag_def ENGINE_EARTHBADGE,                            wKantoBadges, 7 ; earthbadge

	engine_flag_def ENGINE_UNLOCKED_UNOWNS_1,                     wUnlockedUnowns, 0
	engine_flag_def ENGINE_UNLOCKED_UNOWNS_2,                     wUnlockedUnowns, 1
	engine_flag_def ENGINE_UNLOCKED_UNOWNS_3,                     wUnlockedUnowns, 2
	engine_flag_def ENGINE_UNLOCKED_UNOWNS_4,                     wUnlockedUnowns, 3
	engine_flag_def ENGINE_UNLOCKED_UNOWNS_5,                     wUnlockedUnowns, 4
	engine_flag_def ENGINE_UNLOCKED_UNOWNS_6,                     wUnlockedUnowns, 5
	engine_flag_def ENGINE_UNLOCKED_UNOWNS_7,                     wUnlockedUnowns, 6   ; $30
	engine_flag_def ENGINE_UNLOCKED_UNOWNS_8,                     wUnlockedUnowns, 7

	engine_flag_def ENGINE_FLYPOINT_KRISS_HOUSE,                  wVisitedSpawns,     0 ; your house
	engine_flag_def ENGINE_FLYPOINT_VIRIDIAN_POKECENTER,          wVisitedSpawns,     1 ; viridian pokecenter
	engine_flag_def ENGINE_FLYPOINT_PALLET,                       wVisitedSpawns,     2 ; pallet
	engine_flag_def ENGINE_FLYPOINT_VIRIDIAN,                     wVisitedSpawns,     3 ; viridian
	engine_flag_def ENGINE_FLYPOINT_PEWTER,                       wVisitedSpawns,     4 ; pewter
	engine_flag_def ENGINE_FLYPOINT_CERULEAN,                     wVisitedSpawns,     5 ; cerulean
	engine_flag_def ENGINE_FLYPOINT_ROCK_TUNNEL,                  wVisitedSpawns,     6 ; rock tunnel ; $38
	engine_flag_def ENGINE_FLYPOINT_VERMILION,                    wVisitedSpawns,     7 ; vermilion
	engine_flag_def ENGINE_FLYPOINT_LAVENDER,                     wVisitedSpawns + 1, 0 ; lavender
	engine_flag_def ENGINE_FLYPOINT_SAFFRON,                      wVisitedSpawns + 1, 1 ; saffron
	engine_flag_def ENGINE_FLYPOINT_CELADON,                      wVisitedSpawns + 1, 2 ; celadon
	engine_flag_def ENGINE_FLYPOINT_FUCHSIA,                      wVisitedSpawns + 1, 3 ; fuchsia
	engine_flag_def ENGINE_FLYPOINT_CINNABAR,                     wVisitedSpawns + 1, 4 ; cinnabar
	engine_flag_def ENGINE_FLYPOINT_INDIGO_PLATEAU,               wVisitedSpawns + 1, 5 ; indigo plateau
	engine_flag_def ENGINE_FLYPOINT_NEW_BARK,                     wVisitedSpawns + 1, 6 ; new bark ; $40
	engine_flag_def ENGINE_FLYPOINT_CHERRYGROVE,                  wVisitedSpawns + 1, 7 ; cherrygrove
	engine_flag_def ENGINE_FLYPOINT_VIOLET,                       wVisitedSpawns + 2, 0 ; violet
                                                                                        ; union cave
	engine_flag_def ENGINE_FLYPOINT_AZALEA,                       wVisitedSpawns + 2, 2 ; azalea
	engine_flag_def ENGINE_FLYPOINT_CIANWOOD,                     wVisitedSpawns + 2, 3 ; cianwood
	engine_flag_def ENGINE_FLYPOINT_GOLDENROD,                    wVisitedSpawns + 2, 4 ; goldenrod
	engine_flag_def ENGINE_FLYPOINT_OLIVINE,                      wVisitedSpawns + 2, 5 ; olivine
	engine_flag_def ENGINE_FLYPOINT_ECRUTEAK,                     wVisitedSpawns + 2, 6 ; ecruteak
	engine_flag_def ENGINE_FLYPOINT_MAHOGANY,                     wVisitedSpawns + 2, 7 ; mahogany  ; $48
	engine_flag_def ENGINE_FLYPOINT_LAKE_OF_RAGE,                 wVisitedSpawns + 3, 0 ; lake of rage
	engine_flag_def ENGINE_FLYPOINT_BLACKTHORN,                   wVisitedSpawns + 3, 1 ; blackthorn
	engine_flag_def ENGINE_FLYPOINT_SILVER_CAVE,                  wVisitedSpawns + 3, 2 ; silver cave
                                                                                        ; fast ship
	engine_flag_def ENGINE_FLYPOINT_UNUSED,                       wVisitedSpawns + 3, 4 ; unused
	engine_flag_def ENGINE_LUCKY_NUMBER_SHOW,                     wLuckyNumberShowFlag, 0
	engine_flag_def ENGINE_4E,                                    wStatusFlags2, 3

	engine_flag_def ENGINE_KURT_MAKING_BALLS,                     wDailyFlags, 0 ; kurt making balls
	engine_flag_def ENGINE_DAILY_BUG_CONTEST,                     wDailyFlags, 1 ; did bug catching contest today ; $50
	engine_flag_def ENGINE_SPECIAL_WILDDATA,                      wDailyFlags, 2 ; special wilddata?
	engine_flag_def ENGINE_TIME_CAPSULE,                          wDailyFlags, 3 ; time capsule (24h wait)
	engine_flag_def ENGINE_ALL_FRUIT_TREES,                       wDailyFlags, 4 ; all fruit trees
	engine_flag_def ENGINE_SHUCKLE_GIVEN,                         wDailyFlags, 5 ; shuckle given
	engine_flag_def ENGINE_GOLDENROD_UNDERGROUND_MERCHANT_CLOSED, wDailyFlags, 6 ; goldenrod underground merchant closed
	engine_flag_def ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY,          wDailyFlags, 7 ; fought in trainer hall today

	engine_flag_def ENGINE_MT_MOON_SQUARE_CLEFAIRY,               wWeeklyFlags, 0 ; mt moon square clefairy
	engine_flag_def ENGINE_UNION_CAVE_LAPRAS,                     wWeeklyFlags, 1 ; union cave lapras  ; $58
	engine_flag_def ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT,     wWeeklyFlags, 2 ; goldenrod underground haircut used
	engine_flag_def ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT,     wWeeklyFlags, 3 ; goldenrod mall happiness event floor05 person07
	engine_flag_def ENGINE_TEA_IN_BLUES_HOUSE,                    wWeeklyFlags, 4 ; tea in blues house
	engine_flag_def ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT,            wWeeklyFlags, 5 ; indigo plateau rival fight
NUM_ENGINE_FLAGS EQU const_value
