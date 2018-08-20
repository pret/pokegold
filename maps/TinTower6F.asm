TinTower6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower6F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  9, TIN_TOWER_7F, 1
	warp_event 11, 15, TIN_TOWER_5F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
