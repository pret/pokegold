TypeNames:
; entries correspond to types (see constants/type_constants.asm)
	table_width 2
	dw Normal
	dw Fighting
	dw Flying
	dw Poison
	dw Ground
	dw Rock
	dw Bird
	dw Bug
	dw Ghost
	dw Steel
	assert_table_length UNUSED_TYPES
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw CurseType
	assert_table_length UNUSED_TYPES_END
	dw Fire
	dw Water
	dw Grass
	dw Electric
	dw Psychic
	dw Ice
	dw Dragon
	dw Dark
	assert_table_length TYPES_END

Normal:    db "NORMAL@"
Fighting:  db "FIGHTING@"
Flying:    db "FLYING@"
Poison:    db "POISON@"
CurseType: db "???@"
Fire:      db "FIRE@"
Water:     db "WATER@"
Grass:     db "GRASS@"
Electric:  db "ELECTRIC@"
Psychic:   db "PSYCHIC@"
Ice:       db "ICE@"
Ground:    db "GROUND@"
Rock:      db "ROCK@"
Bird:      db "BIRD@"
Bug:       db "BUG@"
Ghost:     db "GHOST@"
Steel:     db "STEEL@"
Dragon:    db "DRAGON@"
Dark:      db "DARK@"
