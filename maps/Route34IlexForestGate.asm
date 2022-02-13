	object_const_def
	const ROUTE34ILEXFORESTGATE_TEACHER
	const ROUTE34ILEXFORESTGATE_BUTTERFREE
	const ROUTE34ILEXFORESTGATE_LASS

Route34IlexForestGate_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .IsForestRestless

.IsForestRestless:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .Normal
	;disappear ROUTE34ILEXFORESTGATE_TEACHER1
	;appear ROUTE34ILEXFORESTGATE_TEACHER2
	endcallback

.Normal:
	;disappear ROUTE34ILEXFORESTGATE_TEACHER2
	;appear ROUTE34ILEXFORESTGATE_TEACHER1
	endcallback

Route34IlexForestGateCelebiEvent:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .skip
	showemote EMOTE_SHOCK, ROUTE34ILEXFORESTGATE_TEACHER, 20
	turnobject ROUTE34ILEXFORESTGATE_TEACHER, LEFT
	turnobject PLAYER, RIGHT
	follow PLAYER, ROUTE34ILEXFORESTGATE_TEACHER
	applymovement PLAYER, Route34IlexForestGateTeacherBlocksPlayerMovement
	stopfollow
	turnobject PLAYER, DOWN
	opentext
	writetext Route34IlexForestGateTeacher_ForestIsRestless
	waitbutton
	closetext
	applymovement ROUTE34ILEXFORESTGATE_TEACHER, Route34IlexForestGateTeacherReturnsMovement
.skip:
	end

Route34IlexForestGateTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue .GotSweetScent
	writetext Route34IlexForestGateTeacherText
	promptbutton
	verbosegiveitem TM_SWEET_SCENT
	iffalse .NoRoom
	setevent EVENT_GOT_TM12_SWEET_SCENT
.GotSweetScent:
	writetext Route34IlexForestGateTeacher_GotSweetScent
	waitbutton
.NoRoom:
	closetext
	end

Route34IlexForestGateButterfreeScript:
	opentext
	writetext Route34IlexForestGateButterfreeText
	cry BUTTERFREE
	waitbutton
	closetext
	end

Route34IlexForestGateLassScript:
	jumptextfaceplayer Route34IlexForestGateLassText

Route34IlexForestGateTeacherBlocksPlayerMovement:
	step UP
	step UP
	step_end

Route34IlexForestGateTeacherReturnsMovement:
	step DOWN
	step RIGHT
	step_end

Route34IlexForestGateTeacherText:
	text "Oh, honey. You're"
	line "making a #DEX?"

	para "It must be hard if"
	line "#MON won't"

	para "appear. Try using"
	line "this TM."
	done

Route34IlexForestGateTeacher_GotSweetScent:
	text "It's SWEET SCENT."

	para "Use it wherever"
	line "#MON appear."

	para "#MON will be"
	line "enticed by it."
	done

Route34IlexForestGateTeacher_ForestIsRestless:
	text "Something's wrong"
	line "in ILEX FOREST…"

	para "You should stay"
	line "away right now."
	done

Route34IlexForestGateButterfreeText:
	text "BUTTERFREE: Freeh!"
	done

Route34IlexForestGateLassText:
	text "Did you see the"
	line "shrine honoring"
	cont "the protector?"

	para "It watches over"
	line "the FOREST from"
	cont "across time."

	para "I think that it"
	line "must be a grass-"
	cont "type #MON."
	done

Route34IlexForestGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_34, 1
	warp_event  5,  0, ROUTE_34, 2
	warp_event  4,  7, ILEX_FOREST, 1
	warp_event  5,  7, ILEX_FOREST, 1

	def_coord_events
	coord_event 4, 7, SCENE_DEFAULT, Route34IlexForestGateCelebiEvent

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, -1
	object_event  9,  4, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateButterfreeScript, -1
	object_event  3,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateLassScript, -1
