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

; wOptions: ; cfcc
FAST_TEXT      EQU 0
MED_TEXT       EQU 1
SLOW_TEXT      EQU 2
NO_TEXT_SCROLL EQU 4
; bits
STEREO         EQU 5
BATTLE_SHIFT   EQU 6
BATTLE_SCENE   EQU 7

; Options2:
MENU_ACCOUNT EQU 0

; GBPrinter:
PRINT_LIGHTEST EQU $00
PRINT_LIGHTER  EQU $20
PRINT_NORMAL   EQU $40
PRINT_DARKER   EQU $60
PRINT_DARKEST  EQU $7f

; WalkingDirection: ; d043
STANDING EQU -1
DOWN     EQU 0
UP       EQU 1
LEFT     EQU 2
RIGHT    EQU 3

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
