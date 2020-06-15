EcruteakTinTowerBackEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakTinTowerBackEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  4, ECRUTEAK_CITY, 4
	warp_event  7,  5, ECRUTEAK_CITY, 5
	warp_event  2,  4, ECRUTEAK_TIN_TOWER_ENTRANCE, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
