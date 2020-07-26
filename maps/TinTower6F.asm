TinTower6F_MapScripts:
	def_scene_scripts

	def_callbacks

TinTower6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, TIN_TOWER_7F, 1
	warp_event 11, 15, TIN_TOWER_5F, 1

	def_coord_events

	def_bg_events

	def_object_events
