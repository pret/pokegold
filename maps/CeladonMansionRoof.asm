	object_const_def ; object_event constants

CeladonMansionRoof_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansionRoofGraffiti:
	jumptext CeladonMansionRoofGraffitiText

CeladonMansionRoofGraffitiText:
	text "I KNOW EVERYTHING!"
	done

CeladonMansionRoof_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  1,  1, CELADON_MANSION_3F, 1
	warp_event  6,  1, CELADON_MANSION_3F, 4
	warp_event  2,  5, CELADON_MANSION_ROOF_HOUSE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
