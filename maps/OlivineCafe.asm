	object_const_def
	const OLIVINECAFE_SAILOR
	const OLIVINECAFE_FISHING_GURU

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeStrengthSailorText:
	text "Hah! Your #MON"
	line "sure look like"
	cont "lightweights!"

	para "They don't have"
	line "the power to move"
	cont "boulders aside."

	para "Here, use this"
	line "and teach them"
	cont "STRENGTH!"

	para "You'll need"
	line "GOLDENROD's GYM"

	para "BADGE to use that"
	line "outside battles."
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "On the sea, the"
	line "only thing you can"

	para "count on is your"
	line "own good self!"

	para "I'm so proud of my"
	line "buff bod!"
	done

OlivineCafeFishingGuruText:
	text "Crossing the sea?"
	line "Then listen up!"

	para "There are whirl-"
	line "pools on the way"
	cont "to CIANWOOD."

	para "Your #MON must"
	line "know a special"

	para "move to get over"
	line "the whirlpools."
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  1,  5, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
