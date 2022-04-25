HappinessChanges:
; entries correspond to HAPPINESS_* constants
	table_width 3, HappinessChanges
	; change if happiness < 100, change if happiness < 200, change otherwise
	db  +5,  +3,  +2 ; Gained a level
	db  +5,  +3,  +2 ; Vitamin
	db  +1,  +1,  +0 ; X Item
	db  +4,  +3,  +2 ; Battled a Gym Leader
	db  +3,  +2,  +1 ; Learned a move
	db  -1,  -2,  -3 ; Lost to an enemy
	db  -1,  -1,  -2 ; Fainted due to poison
	db  -1,  -1,  -2 ; Lost to a much stronger enemy
	db  +2,  +2,  +2 ; Haircut (older brother) 1
	db  +5,  +5,  +2 ; Haircut (older brother) 2
	db  +10, +10, +4 ; Haircut (older brother) 3
	db  +1,  +1,  +1 ; Haircut (younger brother) 1
	db  +3,  +3,  +1 ; Haircut (younger brother) 2
	db +10, +10,  +4 ; Haircut (younger brother) 3
	db  -4,  -4,  -2 ; Used Heal Powder or Energypowder (bitter)
	db  -6,  -6,  -4 ; Used Energy Root (bitter)
	db  -8,  -8,  -6 ; Used Revival Herb (bitter)
	db  +3,  +3,  +1 ; Grooming
	assert_table_length NUM_HAPPINESS_CHANGES
