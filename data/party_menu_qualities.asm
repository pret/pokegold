; WritePartyMenuTilemap.Jumptable indexes (see engine/pokemon/party_menu.asm)
	const_def
	const PARTYMENUQUALITY_NICKNAMES
	const PARTYMENUQUALITY_HP_BAR
	const PARTYMENUQUALITY_HP_DIGITS
	const PARTYMENUQUALITY_LEVEL
	const PARTYMENUQUALITY_STATUS
	const PARTYMENUQUALITY_TMHM_COMPAT
	const PARTYMENUQUALITY_EVO_STONE_COMPAT
	const PARTYMENUQUALITY_GENDER

MACRO partymenuqualities
	rept _NARG
		db PARTYMENUQUALITY_\1
		shift
	endr
	db -1 ; end
ENDM

PartyMenuQualityPointers:
; entries correspond to PARTYMENUACTION_* constants
	table_width 2, PartyMenuQualityPointers
	dw .Default  ; PARTYMENUACTION_CHOOSE_POKEMON
	dw .Default  ; PARTYMENUACTION_HEALING_ITEM
	dw .Default  ; PARTYMENUACTION_SWITCH
	dw .TMHM     ; PARTYMENUACTION_TEACH_TMHM
	dw .Default  ; PARTYMENUACTION_MOVE
	dw .EvoStone ; PARTYMENUACTION_EVO_STONE
	dw .Gender   ; PARTYMENUACTION_GIVE_MON
	dw .Gender   ; PARTYMENUACTION_GIVE_MON_FEMALE
	dw .Default  ; PARTYMENUACTION_GIVE_ITEM
	assert_table_length NUM_PARTYMENUACTIONS

.Default:  partymenuqualities NICKNAMES, HP_BAR, HP_DIGITS, LEVEL, STATUS
.TMHM:     partymenuqualities NICKNAMES, TMHM_COMPAT,       LEVEL, STATUS
.EvoStone: partymenuqualities NICKNAMES, EVO_STONE_COMPAT,  LEVEL, STATUS
.Gender:   partymenuqualities NICKNAMES, GENDER,            LEVEL, STATUS
