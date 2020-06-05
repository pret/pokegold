	object_const_def ; object_event constants
	const TINTOWER1F_SAGE

TinTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTowerSageScript:
	jumptextfaceplayer TinTowerSageText

TinTowerSageText:
	text "I'm trying to un-"
	line "cover the secret"

	para "of the legendary"
	line "#MON that is"
	cont "said to land here."

	para "They say that the"
	line "#MON has flown"

	para "continuously ever"
	line "since the TOWER in"
	cont "the West burned."

	para "So, I thought that"
	line "if I had what the"

	para "#MON has, it"
	line "would be attracted"
	cont "by that item."

	para "I think that item"
	line "is probably…"

	para "A RAINBOW WING!"

	para "But, where would"
	line "I find one?"
	done

TinTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 15, ECRUTEAK_CITY, 12
	warp_event 10, 15, ECRUTEAK_CITY, 12
	warp_event 10,  2, TIN_TOWER_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTowerSageScript, EVENT_TEAM_ROCKET_DISBANDED
