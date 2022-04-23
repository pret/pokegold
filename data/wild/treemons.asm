TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2, TreeMons
	dw TreeMonSet_None
	dw TreeMonSet_Forest
	dw TreeMonSet_Canyon
	dw TreeMonSet_Rock
	assert_table_length NUM_TREEMON_SETS
; last two are unused/ignored
	dw TreeMonSet_Unused
	dw TreeMonSet_City

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_None:
TreeMonSet_Unused:
TreeMonSet_City:
; common
	db 50, VENONAT,    21
	db 30, VENONAT,    21
	db 10, ABRA,       21
	db  5, ABRA,       21
	db  5, VENOMOTH,   21
	db -1
; rare
	db 50, VENONAT,    21
	db 30, MAGNEMITE,  21
	db 10, ABRA,       21
	db  5, ABRA,       21
	db  5, VENOMOTH,   21
	db -1

TreeMonSet_Forest:

IF DEF(_GOLD)
; common
	db 50, CATERPIE,   15
	db 15, CATERPIE,   15
	db 15, METAPOD,    15
	db 10, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db  5, BUTTERFREE, 15
	db -1
; rare
	db 50, CATERPIE,   15
	db 15, PINECO,     15
	db 15, PINECO,     15
	db 10, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db  5, BUTTERFREE, 15
	db -1

ELIF DEF(_SILVER)
; common
	db 50, WEEDLE,     15
	db 15, WEEDLE,     15
	db 15, KAKUNA,     15
	db 10, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db  5, BEEDRILL,   15
	db -1
; rare
	db 50, WEEDLE,     15
	db 15, PINECO,     15
	db 15, PINECO,     15
	db 10, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db  5, BEEDRILL,   15
	db -1
ENDC

TreeMonSet_Canyon:
; common
	db 50, SPEAROW,    15
	db 15, SPEAROW,    15
	db 15, SPEAROW,    15
	db 10, AIPOM,      15
	db  5, AIPOM,      15
	db  5, AIPOM,      15
	db -1
; rare
	db 50, SPEAROW,    15
	db 15, HERACROSS,  15
	db 15, HERACROSS,  15
	db 10, AIPOM,      15
	db  5, AIPOM,      15
	db  5, AIPOM,      15
	db -1

TreeMonSet_Rock:
	db 90, KRABBY,     21
	db 10, SHUCKLE,    21
	db -1
