	object_const_def
	const ECRUTEAKTINTOWERENTRANCE_SAGE1
	const ECRUTEAKTINTOWERENTRANCE_SAGE2
	const ECRUTEAKTINTOWERENTRANCE_SAGE3
	const ECRUTEAKTINTOWERENTRANCE_GRAMPS

EcruteakTinTowerEntrance_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks

.DummyScene0:
	end

.DummyScene1:
	end

EcruteakTinTowerEntranceSageBlocksLeft:
	checkevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_SAGE_RIGHT
	iftrue EcruteakTinTowerEntranceAlreadyBlocked
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE2, EcruteakTinTowerEntranceSageBlocksLeftMovement
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE1, 4, 6
	appear ECRUTEAKTINTOWERENTRANCE_SAGE1
	pause 5
	disappear ECRUTEAKTINTOWERENTRANCE_SAGE2
	end

EcruteakTinTowerEntranceSageBlocksRight:
	checkevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_SAGE_LEFT
	iftrue EcruteakTinTowerEntranceAlreadyBlocked
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE1, EcruteakTinTowerEntranceSageBlocksRightMovement
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE2, 5, 6
	appear ECRUTEAKTINTOWERENTRANCE_SAGE2
	pause 5
	disappear ECRUTEAKTINTOWERENTRANCE_SAGE1
	end

EcruteakTinTowerEntranceAlreadyBlocked:
	end

EcruteakTinTowerEntranceSageScript:
	faceplayer
	opentext
	checkflag ENGINE_FOGBADGE
	iftrue .BlockPassage_GotFogBadge
	writetext EcruteakTinTowerEntranceSageText
	waitbutton
	closetext
	end

.BlockPassage_GotFogBadge:
	writetext EcruteakTinTowerEntranceSageText_GotFogBadge
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceWanderingSageScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	writetext EcruteakTinTowerEntranceWanderingSageText
	waitbutton
	closetext
	end

.GotRainbowWing:
	writetext EcruteakTinTowerEntranceWanderingSageText_GotRainbowWing
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceGrampsScript:
	jumptextfaceplayer EcruteakTinTowerEntranceGrampsText

EcruteakTinTowerEntranceSageBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

EcruteakTinTowerEntranceSageBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

EcruteakTinTowerEntranceSageText:
	text "TIN TOWER is off"
	line "limits to anyone"

	para "without ECRUTEAK"
	line "GYM's BADGE."

	para "Sorry, but you'll"
	line "have to leave."
	done

EcruteakTinTowerEntranceSageText_GotFogBadge:
	text "TIN TOWER is off"
	line "limits to anyone"

	para "without ECRUTEAK"
	line "GYM's BADGE."

	para "Ah!"

	para "ECRUTEAK's GYM"
	line "BADGE! Please, go"
	cont "right through."
	done

EcruteakTinTowerEntranceWanderingSageText:
	text "The TIN TOWER up"
	line "ahead was built"

	para "as a roost for"
	line "flying #MON."
	done

EcruteakTinTowerEntranceWanderingSageText_GotRainbowWing:
	text "The TIN TOWER"
	line "shook! A #MON"

	para "must have returned"
	line "to the top!"
	done

EcruteakTinTowerEntranceGrampsText:
	text "Two towers…"
	line "Two #MON…"

	para "But when one"
	line "burned down, both"

	para "#MON flew away,"
	line "never to return."
	done

EcruteakTinTowerEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 3
	warp_event  5, 17, ECRUTEAK_CITY, 3
	warp_event  5,  3, ECRUTEAK_TIN_TOWER_ENTRANCE, 4
	warp_event 17, 15, ECRUTEAK_TIN_TOWER_ENTRANCE, 3
	warp_event 17,  3, ECRUTEAK_TIN_TOWER_BACK_ENTRANCE, 3

	def_coord_events
	coord_event  4,  7, SCENE_DEFAULT, EcruteakTinTowerEntranceSageBlocksLeft
	coord_event  5,  7, SCENE_DEFAULT, EcruteakTinTowerEntranceSageBlocksRight

	def_bg_events

	def_object_events
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_SAGE_LEFT
	object_event  5,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_SAGE_RIGHT
	object_event  6,  9, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceWanderingSageScript, -1
	object_event  3, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceGrampsScript, -1
