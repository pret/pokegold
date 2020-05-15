; InputType: ; c2c7
AUTO_INPUT EQU $ff

; wDebugFlags:: ; c2cc
	const_def
	const DEBUG_BATTLE_F
	const DEBUG_FIELD_F

; wMonType:: ; cf5f
	const_def
	const PARTYMON   ; 0
	const OTPARTYMON ; 1
	const BOXMON     ; 2
	const TEMPMON    ; 3
	const WILDMON    ; 4

; wGameTimerPause:: ; cfbc
GAMETIMERPAUSE_TIMER_PAUSED_F EQU 0
GAMETIMERPAUSE_MOBILE_7_F     EQU 7

; wOptions:: ; cfcc
TEXT_DELAY_MASK EQU %111
	const_def 4
	const NO_TEXT_SCROLL ; 4
	const STEREO         ; 5
	const BATTLE_SHIFT   ; 6
	const BATTLE_SCENE   ; 7

TEXT_DELAY_FAST EQU %001 ; 1
TEXT_DELAY_MED  EQU %011 ; 3
TEXT_DELAY_SLOW EQU %101 ; 5

; wOptions2::
	const_def
	const MENU_ACCOUNT ; 0

; wTextboxFlags::
	const_def
	const FAST_TEXT_DELAY_F ; 0
	const NO_TEXT_DELAY_F   ; 1

; GBPrinter:
PRINT_LIGHTEST EQU $00
PRINT_LIGHTER  EQU $20
PRINT_NORMAL   EQU $40
PRINT_DARKER   EQU $60
PRINT_DARKEST  EQU $7f

; WalkingDirection: ; d043
	const_def -1
	const STANDING ; -1
	const DOWN     ; 0
	const UP       ; 1
	const LEFT     ; 2
	const RIGHT    ; 3
NUM_DIRECTIONS EQU const_value

DOWN_MASK  EQU 1 << DOWN
UP_MASK    EQU 1 << UP
LEFT_MASK  EQU 1 << LEFT
RIGHT_MASK EQU 1 << RIGHT

; FacingDirection: ; d044
FACE_CURRENT EQU 0
FACE_DOWN  EQU 8
FACE_UP    EQU 4
FACE_LEFT  EQU 2
FACE_RIGHT EQU 1

; TimeOfDay: ; d269
MORN_F     EQU 0
DAY_F      EQU 1
NITE_F     EQU 2
DARKNESS_F EQU 3

MORN     EQU 1 << MORN_F
DAY      EQU 1 << DAY_F
NITE     EQU 1 << NITE_F
DARKNESS EQU 1 << DARKNESS_F

; ScriptFlags: ; d434
SCRIPT_RUNNING EQU 2

; ScriptMode: ; d437
SCRIPT_OFF EQU 0
SCRIPT_READ EQU 1
SCRIPT_WAIT_MOVEMENT EQU 2
SCRIPT_WAIT EQU 3

; CurDay: ; d4cb
SUNDAY    EQU 0
MONDAY    EQU 1
TUESDAY   EQU 2
WEDNESDAY EQU 3
THURSDAY  EQU 4
FRIDAY    EQU 5
SATURDAY  EQU 6

; MapObjects: ; d71e

PLAYER_OBJECT EQU 0
NUM_OBJECTS   EQU 16

; wStatusFlags::
        const_def
        const STATUSFLAGS_POKEDEX_F                  ; 0
        const STATUSFLAGS_UNOWN_DEX_F                ; 1
        const STATUSFLAGS_FLASH_F                    ; 2
        const STATUSFLAGS_CAUGHT_POKERUS_F           ; 3
        const STATUSFLAGS_ROCKET_SIGNAL_F            ; 4
        const STATUSFLAGS_NO_WILD_ENCOUNTERS_F       ; 5
        const STATUSFLAGS_HALL_OF_FAME_F             ; 6
        const STATUSFLAGS_MAIN_MENU_MOBILE_CHOICES_F ; 7

; wStatusFlags2::
        const_def
        const STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F ; 0
        const STATUSFLAGS2_SAFARI_GAME_F            ; 1
        const STATUSFLAGS2_BUG_CONTEST_TIMER_F      ; 2
        const STATUSFLAGS2_UNUSED_3_F               ; 3
        const STATUSFLAGS2_BIKE_SHOP_CALL_F         ; 4
        const STATUSFLAGS2_UNUSED_5_F               ; 5
        const STATUSFLAGS2_REACHED_GOLDENROD_F      ; 6
        const STATUSFLAGS2_ROCKETS_IN_MAHOGANY_F    ; 7

; wJohtoBadges: ; d57c
	const_def
	const ZEPHYRBADGE
	const HIVEBADGE
	const PLAINBADGE
	const FOGBADGE
	const MINERALBADGE
	const STORMBADGE
	const GLACIERBADGE
	const RISINGBADGE
NUM_JOHTO_BADGES EQU const_value

; wKantoBadges:: ds 1 ; d57d
	const_def
	const BOULDERBADGE
	const CASCADEBADGE
	const THUNDERBADGE
	const RAINBOWBADGE
	const SOULBADGE
	const MARSHBADGE
	const VOLCANOBADGE
	const EARTHBADGE
NUM_KANTO_BADGES EQU const_value
NUM_BADGES EQU NUM_JOHTO_BADGES + NUM_KANTO_BADGES

; WhichRegisteredItem: ; d95b
REGISTERED_POCKET EQU %11000000
REGISTERED_NUMBER EQU %00111111

; wDayCareMan:: ; dc40
DAYCAREMAN_HAS_MON_F         EQU 0
DAYCAREMAN_MONS_COMPATIBLE_F EQU 5
DAYCAREMAN_HAS_EGG_F         EQU 6

; wDayCareLady:: ; dc77
DAYCARELADY_HAS_MON_F        EQU 0

; used with both wDayCareMan and wDayCareLady
DAYCARE_INTRO_SEEN_F         EQU 7

; PlayerState: ; d95d
PLAYER_NORMAL    EQU 0
PLAYER_BIKE      EQU 1
PLAYER_SLIP      EQU 2
PLAYER_SURF      EQU 4
PLAYER_SURF_PIKA EQU 8

; After-Champion Spawn
SPAWN_LANCE EQU 1
SPAWN_RED EQU 2

; wPokemonWithdrawDepositParameter
PC_WITHDRAW EQU 0
PC_DEPOSIT EQU 1
DAYCARE_WITHDRAW EQU 2
DAYCARE_DEPOSIT EQU 3

; wCurrentDexMode
	const_def
	const DEXMODE_NEW
	const DEXMODE_OLD
	const DEXMODE_ABC
	const DEXMODE_UNOWN
