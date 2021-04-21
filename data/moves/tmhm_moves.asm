; The add_tm and add_hm macros in constants/item_constants.asm simultaneously
; define constants for the item IDs and for the corresponding move values.

TMHMMoves:
; entries correspond to *_TMNUM constants (see constants/item_constants.asm)
	table_width 1, TMHMMoves

; TMs
for n, 1, NUM_TMS + 1
	db TM{02d:n}_MOVE
endr
	assert_table_length NUM_TMS

; HMs
for n, 1, NUM_HMS + 1
	db HM{02d:n}_MOVE
endr
	assert_table_length NUM_TM_HM

	db 0 ; end

; unused
	db 0
	db 0
	db 0
