; base data struct members (see data/pokemon/base_stats/*.asm)
BASE_DEX_NO      EQUS "(wBaseDexNo - wCurBaseData)"
BASE_STATS       EQUS "(wBaseStats - wCurBaseData)"
BASE_HP          EQUS "(wBaseHP - wCurBaseData)"
BASE_ATK         EQUS "(wBaseAttack - wCurBaseData)"
BASE_SPD         EQUS "(wBaseSpeed - wCurBaseData)"
BASE_SAT         EQUS "(wBaseSpecialAttack - wCurBaseData)"
BASE_SDF         EQUS "(wBaseSpecialDefense - wCurBaseData)"
BASE_TYPES       EQUS "(wBaseType - wCurBaseData)"
BASE_TYPE_1      EQUS "(wBaseType1 - wCurBaseData)"
BASE_TYPE_2      EQUS "(wBaseType2 - wCurBaseData)"
BASE_CATCH_RATE  EQUS "(wBaseCatchRate - wCurBaseData)"
BASE_EXP         EQUS "(wBaseExp - wCurBaseData)"
BASE_ITEMS       EQUS "(wBaseItems - wCurBaseData)"
BASE_ITEM_1      EQUS "(wBaseItem1 - wCurBaseData)"
BASE_ITEM_2      EQUS "(wBaseItem2 - wCurBaseData)"
BASE_GENDER      EQUS "(wBaseGender - wCurBaseData)"
BASE_UNKNOWN_1   EQUS "(wBaseUnknown1 - wCurBaseData)"
BASE_EGG_STEPS   EQUS "(wBaseEggSteps - wCurBaseData)"
BASE_UNKNOWN_2   EQUS "(wBaseUnknown2 - wCurBaseData)"
BASE_PIC_SIZE    EQUS "(wBasePicSize - wCurBaseData)"
BASE_PADDING     EQUS "(wBasePadding - wCurBaseData)"
BASE_GROWTH_RATE EQUS "(wBaseGrowthRate - wCurBaseData)"
BASE_EGG_GROUPS  EQUS "(wBaseEggGroups - wCurBaseData)"
BASE_TMHM        EQUS "(wBaseTMHM - wCurBaseData)"
BASE_DATA_SIZE   EQUS "(wCurBaseDataEnd - wCurBaseData)"

; gender ratio constants
GENDER_F0      EQU 0 percent
GENDER_F12_5   EQU 12 percent + 1
GENDER_F25     EQU 25 percent
GENDER_F50     EQU 50 percent
GENDER_F75     EQU 75 percent
GENDER_F100    EQU 100 percent - 1
GENDER_UNKNOWN EQU -1

; wBaseGrowthRate values
; GrowthRates indexes (see data/growth_rates.asm)
	const_def
	const GROWTH_MEDIUM_FAST
	const GROWTH_SLIGHTLY_FAST
	const GROWTH_SLIGHTLY_SLOW
	const GROWTH_MEDIUM_SLOW
	const GROWTH_FAST
	const GROWTH_SLOW

; egg group constants
const_value SET 1
	const MONSTER      ; 1
	const AMPHIBIAN    ; 2
	const INSECT       ; 3
	const AVIAN        ; 4
	const FIELD        ; 5
	const FAIRY        ; 6
	const PLANT        ; 7
	const HUMANSHAPE   ; 8
	const INVERTEBRATE ; 9
	const INANIMATE    ; a
	const AMORPHOUS    ; b
	const FISH         ; c
	const LADIES_MAN   ; d
	const REPTILE      ; e
	const NO_EGGS      ; f


; menu sprites
const_value SET 1
	const ICON_POLIWAG
	const ICON_JIGGLYPUFF
	const ICON_DIGLETT
	const ICON_PIKACHU
	const ICON_STARYU
	const ICON_FISH
	const ICON_BIRD
	const ICON_MONSTER
	const ICON_CLEFAIRY
	const ICON_ODDISH
	const ICON_BUG
	const ICON_GHOST
	const ICON_LAPRAS
	const ICON_HUMANSHAPE
	const ICON_FOX
	const ICON_EQUINE
	const ICON_SHELL
	const ICON_BLOB
	const ICON_SERPENT
	const ICON_VOLTORB
	const ICON_SQUIRTLE
	const ICON_BULBASAUR
	const ICON_CHARMANDER
	const ICON_CATERPILLAR
	const ICON_UNOWN
	const ICON_GEODUDE
	const ICON_FIGHTER
	const ICON_EGG
	const ICON_JELLYFISH
	const ICON_MOTH
	const ICON_BAT
	const ICON_SNORLAX
	const ICON_HO_OH
	const ICON_LUGIA
	const ICON_GYARADOS
	const ICON_SLOWPOKE
	const ICON_SUDOWOODO
	const ICON_BIGMON

; maximum number of party pokemon
PARTY_LENGTH EQU 6

; boxes
MONS_PER_BOX EQU 20
NUM_BOXES    EQU 14

; hall of fame
HOF_MON_LENGTH = 1 + 2 + 2 + 1 + (MON_NAME_LENGTH + -1) ; species, id, dvs, level, nick
HOF_LENGTH = 1 + HOF_MON_LENGTH * PARTY_LENGTH + 1 ; win count, party, terminator
NUM_HOF_TEAMS = 30

; evolution types
const_value SET 1
	const EVOLVE_LEVEL
	const EVOLVE_ITEM
	const EVOLVE_TRADE
	const EVOLVE_HAPPINESS
	const EVOLVE_STAT


; happiness evolution triggers
const_value SET 1
	const TR_ANYTIME
	const TR_MORNDAY
	const TR_NITE


; stat evolution triggers
const_value SET 1
	const ATK_GT_DEF
	const ATK_LT_DEF
	const ATK_EQ_DEF

NUM_GRASSMON EQU 7
NUM_WATERMON EQU 3

GRASS_WILDDATA_LENGTH EQU (NUM_GRASSMON * 2 + 1) * 3 + 2
WATER_WILDDATA_LENGTH EQU (NUM_WATERMON * 2 + 1) * 1 + 2

; ChangeHappiness arguments (see data/happiness_changes.asm)
const_value = 1
	const HAPPINESS_GAINLEVEL         ; 01
	const HAPPINESS_USEDITEM          ; 02
	const HAPPINESS_USEDXITEM         ; 03
	const HAPPINESS_GYMBATTLE         ; 04
	const HAPPINESS_LEARNMOVE         ; 05
	const HAPPINESS_FAINTED           ; 06
	const HAPPINESS_POISONFAINT       ; 07
	const HAPPINESS_BEATENBYSTRONGFOE ; 08
	const HAPPINESS_YOUNGCUT1         ; 09
	const HAPPINESS_YOUNGCUT2         ; 0a
	const HAPPINESS_YOUNGCUT3         ; 0b
	const HAPPINESS_OLDERCUT1         ; 0c
	const HAPPINESS_OLDERCUT2         ; 0d
	const HAPPINESS_OLDERCUT3         ; 0e
	const HAPPINESS_BITTERPOWDER      ; 0f
	const HAPPINESS_ENERGYROOT        ; 10
	const HAPPINESS_REVIVALHERB       ; 11
	const HAPPINESS_GROOMING          ; 12
	const HAPPINESS_GAINLEVELATHOME   ; 13

; significant happiness values
BASE_HAPPINESS        EQU 70
FRIEND_BALL_HAPPINESS EQU 200
HAPPINESS_TO_EVOLVE   EQU 220
HAPPINESS_THRESHOLD_1 EQU 100
HAPPINESS_THRESHOLD_2 EQU 200

; PP
PP_UP_MASK EQU %11000000
PP_UP_ONE  EQU %01000000
PP_MASK    EQU %00111111
