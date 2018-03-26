ElmsLab_MapScriptHeader:
	dr $180000, $181557

ElmsLab_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $b, $4, 1, NEW_BARK_TOWN
	warp_def $b, $5, 1, NEW_BARK_TOWN

.XYTriggers:
	db 8
	xy_trigger 1, $6, $4, $0, $40b8, $0, $0
	xy_trigger 1, $6, $5, $0, $40b8, $0, $0
	xy_trigger 3, $5, $4, $0, $4362, $0, $0
	xy_trigger 3, $5, $5, $0, $435e, $0, $0
	xy_trigger 5, $8, $4, $0, $42cb, $0, $0
	xy_trigger 5, $8, $5, $0, $42da, $0, $0
	xy_trigger 6, $8, $4, $0, $42f9, $0, $0
	xy_trigger 6, $8, $5, $0, $4308, $0, $0

.Signposts:
	db 15
	signpost 1, 2, SIGNPOST_READ, $41c6
	signpost 1, 6, SIGNPOST_READ, $43ad
	signpost 1, 7, SIGNPOST_READ, $43ad
	signpost 1, 8, SIGNPOST_READ, $43ad
	signpost 1, 9, SIGNPOST_READ, $43ad
	signpost 7, 0, SIGNPOST_READ, $439b
	signpost 7, 1, SIGNPOST_READ, $439e
	signpost 7, 2, SIGNPOST_READ, $43a1
	signpost 7, 3, SIGNPOST_READ, $43a4
	signpost 7, 6, SIGNPOST_READ, $43ad
	signpost 7, 7, SIGNPOST_READ, $43ad
	signpost 7, 8, SIGNPOST_READ, $43ad
	signpost 7, 9, SIGNPOST_READ, $43ad
	signpost 3, 9, SIGNPOST_READ, $43a7
	signpost 0, 5, SIGNPOST_READ, $437f

.PersonEvents:
	db 6
	person_event SPRITE_ELM, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, $4033, -1
	person_event SPRITE_SCIENTIST, 9, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, $4332, EVENT_ELMS_AIDE_IN_LAB
	person_event SPRITE_POKE_BALL, 3, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, $40c6, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	person_event SPRITE_POKE_BALL, 3, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, $4108, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	person_event SPRITE_POKE_BALL, 3, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, $4144, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	person_event SPRITE_OFFICER, 3, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, $4366, EVENT_COP_IN_ELMS_LAB

	dr $181640, $184000
