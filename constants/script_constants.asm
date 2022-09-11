; object constants
DEF PLAYER      EQU  0
DEF LAST_TALKED EQU -2

; string buffer constants
	const_def
	const STRING_BUFFER_3 ; use wStringBuffer3
	const STRING_BUFFER_4 ; use wStringBuffer4
	const STRING_BUFFER_5 ; use wStringBuffer5
DEF NUM_STRING_BUFFERS EQU const_value

DEF STRING_BUFFER_LENGTH EQU 19

; checkmoney/takemoney accounts
	const_def
	const YOUR_MONEY ; 0
	const MOMS_MONEY ; 1

; checkmoney/checkcoins return values
	const_def
	const HAVE_MORE   ; 0
	const HAVE_AMOUNT ; 1
	const HAVE_LESS   ; 2

; checkpokemail return values
	const_def
	const POKEMAIL_WRONG_MAIL ; 0
	const POKEMAIL_CORRECT    ; 1
	const POKEMAIL_REFUSED    ; 2
	const POKEMAIL_NO_MAIL    ; 3
	const POKEMAIL_LAST_MON   ; 4

; askforphonenumber return values
	const_def
	const PHONE_CONTACT_GOT     ; 0
	const PHONE_CONTACTS_FULL   ; 1
	const PHONE_CONTACT_REFUSED ; 2

; trainertext arguments
	const_def
	const TRAINERTEXT_SEEN
	const TRAINERTEXT_WIN
	const TRAINERTEXT_LOSS

; readvar/writevar/loadvar arguments
; _GetVarAction.VarActionTable indexes (see engine/overworld/variables.asm)
	const_def
	const VAR_STRINGBUFFER2    ; 00
	const VAR_PARTYCOUNT       ; 01
	const VAR_BATTLERESULT     ; 02
	const VAR_BATTLETYPE       ; 03
	const VAR_TIMEOFDAY        ; 04
	const VAR_DEXCAUGHT        ; 05
	const VAR_DEXSEEN          ; 06
	const VAR_BADGES           ; 07
	const VAR_MOVEMENT         ; 08
	const VAR_FACING           ; 09
	const VAR_HOUR             ; 0a
	const VAR_WEEKDAY          ; 0b
	const VAR_MAPGROUP         ; 0c
	const VAR_MAPNUMBER        ; 0d
	const VAR_UNOWNCOUNT       ; 0e
	const VAR_ENVIRONMENT      ; 0f
	const VAR_BOXSPACE         ; 10
	const VAR_CONTESTMINUTES   ; 11
	const VAR_XCOORD           ; 12
	const VAR_YCOORD           ; 13
	const VAR_SPECIALPHONECALL ; 14
DEF NUM_VARS EQU const_value

; variable action types
DEF RETVAR_STRBUF2 EQU 0 << 6
DEF RETVAR_ADDR_DE EQU 1 << 6
DEF RETVAR_EXECUTE EQU 2 << 6

; PlayerEventScriptPointers indexes (see engine/overworld/events.asm)
	const_def -1
	const PLAYEREVENT_MAPSCRIPT
	const PLAYEREVENT_NONE
	const PLAYEREVENT_SEENBYTRAINER
	const PLAYEREVENT_TALKTOTRAINER
	const PLAYEREVENT_ITEMBALL
	const PLAYEREVENT_CONNECTION
	const PLAYEREVENT_WARP
	const PLAYEREVENT_FALL
	const PLAYEREVENT_WHITEOUT
	const PLAYEREVENT_HATCH
	const PLAYEREVENT_JOYCHANGEFACING
DEF NUM_PLAYER_EVENTS EQU const_value

; PlayerMovementPointers indexes (see engine/overworld/events.asm)
	const_def
	const PLAYERMOVEMENT_NORMAL
	const PLAYERMOVEMENT_WARP
	const PLAYERMOVEMENT_TURN
	const PLAYERMOVEMENT_FORCE_TURN
	const PLAYERMOVEMENT_FINISH
	const PLAYERMOVEMENT_CONTINUE
	const PLAYERMOVEMENT_EXIT_WATER
	const PLAYERMOVEMENT_JUMP
DEF NUM_PLAYER_MOVEMENTS EQU const_value

; script data sizes (see macros/scripts/maps.asm)
DEF SCENE_SCRIPT_SIZE EQU  4 ; scene_script
DEF CALLBACK_SIZE     EQU  3 ; callback
DEF WARP_EVENT_SIZE   EQU  5 ; warp_event
DEF COORD_EVENT_SIZE  EQU  8 ; coord_event
DEF BG_EVENT_SIZE     EQU  5 ; bg_event
DEF OBJECT_EVENT_SIZE EQU 13 ; object_event

; A coord_event for scene -1 will always activate,
; regardless of the map's scene variable value.
DEF SCENE_ALWAYS EQU -1

; bg_event types
; BGEventJumptable indexes (see engine/overworld/events.asm)
	const_def
	const BGEVENT_READ
	const BGEVENT_UP
	const BGEVENT_DOWN
	const BGEVENT_RIGHT
	const BGEVENT_LEFT
	const BGEVENT_IFSET
	const BGEVENT_IFNOTSET
	const BGEVENT_ITEM
	const BGEVENT_COPY
DEF NUM_BGEVENTS EQU const_value

; object_event types
; ObjectEventTypeArray indexes (see engine/overworld/events.asm)
	const_def
	const OBJECTTYPE_SCRIPT
	const OBJECTTYPE_ITEMBALL
	const OBJECTTYPE_TRAINER
	const OBJECTTYPE_3
	const OBJECTTYPE_4
	const OBJECTTYPE_5
	const OBJECTTYPE_6
DEF NUM_OBJECT_TYPES EQU const_value

; command queue members
rsreset
DEF CMDQUEUE_TYPE            rb
DEF CMDQUEUE_ADDR            rb
DEF CMDQUEUE_02              rb
DEF CMDQUEUE_03              rb
DEF CMDQUEUE_04              rb
DEF CMDQUEUE_JUMPTABLE_INDEX rb
DEF CMDQUEUE_ENTRY_SIZE EQU _RS
DEF CMDQUEUE_CAPACITY EQU 4

; HandleQueuedCommand.Jumptable indexes (see engine/overworld/events.asm)
	const_def
	const CMDQUEUE_NULL
	const CMDQUEUE_TYPE1
	const CMDQUEUE_STONETABLE
	const CMDQUEUE_TYPE3
	const CMDQUEUE_TYPE4
DEF NUM_CMDQUEUE_TYPES EQU const_value

DEF MAX_XYCOMPARE_LENGTH EQU 32

; elevfloor macro values
; ElevatorFloorNames indexes (see data/events/elevator_floors.asm)
	const_def
	const FLOOR_B4F
	const FLOOR_B3F
	const FLOOR_B2F
	const FLOOR_B1F
	const FLOOR_1F
	const FLOOR_2F
	const FLOOR_3F
	const FLOOR_4F
	const FLOOR_5F
	const FLOOR_6F
	const FLOOR_7F
	const FLOOR_8F
	const FLOOR_9F
	const FLOOR_10F
	const FLOOR_11F
	const FLOOR_ROOF
DEF NUM_FLOORS EQU const_value

; showemote arguments
; Emotes indexes (see data/sprites/emotes.asm)
	const_def
	const EMOTE_SHOCK
	const EMOTE_QUESTION
	const EMOTE_HAPPY
	const EMOTE_SAD
	const EMOTE_HEART
	const EMOTE_BOLT
	const EMOTE_SLEEP
	const EMOTE_FISH
	const EMOTE_SHADOW
	const EMOTE_ROD
	const EMOTE_BOULDER_DUST
	const EMOTE_GRASS_RUSTLE
DEF NUM_EMOTES EQU const_value
DEF EMOTE_FROM_MEM EQU -1
DEF EMOTE_LENGTH EQU 6

; fruittree arguments
; FruitTreeItems indexes (see data/items/fruit_trees.asm)
	const_def 1
	const FRUITTREE_ROUTE_29      ; 01
	const FRUITTREE_ROUTE_30_1    ; 02
	const FRUITTREE_ROUTE_38      ; 03
	const FRUITTREE_ROUTE_46_1    ; 04
	const FRUITTREE_ROUTE_30_2    ; 05
	const FRUITTREE_ROUTE_33      ; 06
	const FRUITTREE_ROUTE_31      ; 07
	const FRUITTREE_ROUTE_43      ; 08
	const FRUITTREE_VIOLET_CITY   ; 09
	const FRUITTREE_ROUTE_46_2    ; 0a
	const FRUITTREE_ROUTE_35      ; 0b
	const FRUITTREE_ROUTE_45      ; 0c
	const FRUITTREE_ROUTE_36      ; 0d
	const FRUITTREE_ROUTE_26      ; 0e
	const FRUITTREE_ROUTE_39      ; 0f
	const FRUITTREE_ROUTE_44      ; 10
	const FRUITTREE_ROUTE_37_1    ; 11
	const FRUITTREE_ROUTE_37_2    ; 12
	const FRUITTREE_ROUTE_37_3    ; 13
	const FRUITTREE_AZALEA_TOWN   ; 14
	const FRUITTREE_ROUTE_42_1    ; 15
	const FRUITTREE_ROUTE_42_2    ; 16
	const FRUITTREE_ROUTE_42_3    ; 17
	const FRUITTREE_ROUTE_11      ; 18
	const FRUITTREE_ROUTE_2       ; 19
	const FRUITTREE_ROUTE_1       ; 1a
	const FRUITTREE_ROUTE_8       ; 1b
	const FRUITTREE_PEWTER_CITY_1 ; 1c
	const FRUITTREE_PEWTER_CITY_2 ; 1d
	const FRUITTREE_FUCHSIA_CITY  ; 1e
DEF NUM_FRUIT_TREES EQU const_value - 1

; describedecoration arguments
; DescribeDecoration.JumpTable indexes (see engine/overworld/decorations.asm)
	const_def
	const DECODESC_POSTER     ; 0
	const DECODESC_LEFT_DOLL  ; 1
	const DECODESC_RIGHT_DOLL ; 2
	const DECODESC_BIG_DOLL   ; 3
	const DECODESC_CONSOLE    ; 4
DEF NUM_DECODESCS EQU const_value

; ActivateFishingSwarm setval arguments
	const_def
	const FISHSWARM_NONE     ; 0
	const FISHSWARM_QWILFISH ; 1
	const FISHSWARM_REMORAID ; 2

; SpecialGameboyCheck return values
	const_def
	const GBCHECK_GB  ; 0
	const GBCHECK_SGB ; 1
	const GBCHECK_CGB ; 2

; CheckMagikarpLength return values
	const_def
	const MAGIKARPLENGTH_NOT_MAGIKARP ; 0
	const MAGIKARPLENGTH_REFUSED      ; 1
	const MAGIKARPLENGTH_TOO_SHORT    ; 2
	const MAGIKARPLENGTH_BEAT_RECORD  ; 3

; ReturnShuckie return values
	const_def
	const SHUCKIE_WRONG_MON ; 0
	const SHUCKIE_REFUSED   ; 1
	const SHUCKIE_RETURNED  ; 2
	const SHUCKIE_HAPPY     ; 3
	const SHUCKIE_FAINTED   ; 4

; CheckPartyFullAfterContest return values
	const_def
	const BUGCONTEST_CAUGHT_MON ; 0
	const BUGCONTEST_BOXED_MON  ; 1
	const BUGCONTEST_NO_CATCH   ; 2

; Bug-Catching Contest values
DEF BUG_CONTEST_BALLS EQU 20
DEF BUG_CONTEST_MINUTES EQU 20
DEF BUG_CONTEST_SECONDS EQU 0
DEF BUG_CONTEST_PLAYER EQU 1
DEF NUM_BUG_CONTESTANTS EQU 10 ; not counting the player
DEF BUG_CONTESTANT_SIZE EQU 4

; HealMachineAnim setval arguments
; HealMachineAnim.Pointers indexes (see engine/events/heal_machine_anim.asm)
	const_def
	const HEALMACHINE_POKECENTER   ; 0
	const HEALMACHINE_ELMS_LAB     ; 1
	const HEALMACHINE_HALL_OF_FAME ; 2

; UnownPuzzle setval arguments
; LoadUnownPuzzlePiecesGFX.LZPointers indexes (see engine/games/unown_puzzle.asm)
	const_def
	const UNOWNPUZZLE_KABUTO     ; 0
	const UNOWNPUZZLE_OMANYTE    ; 1
	const UNOWNPUZZLE_AERODACTYL ; 2
	const UNOWNPUZZLE_HO_OH      ; 3
DEF NUM_UNOWN_PUZZLES EQU const_value
