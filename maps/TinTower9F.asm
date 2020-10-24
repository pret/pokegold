TinTower9F_MapScripts:
	def_scene_scripts

	def_callbacks

TinTower9FUnusedHoOhText: ; unreferenced
	text "HO-OH: Shaoooh!"
	done

TinTower9FUnusedLugiaText: ; unreferenced
	text "LUGIA: Gyaaan!"
	done

TinTower9F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  3, TIN_TOWER_8F, 2
	warp_event  2,  5, TIN_TOWER_8F, 3
	warp_event 12,  7, TIN_TOWER_8F, 4
	warp_event  7,  9, TIN_TOWER_ROOF, 1
	warp_event 16,  7, TIN_TOWER_7F, 5
	warp_event  6, 13, TIN_TOWER_8F, 5
	warp_event  8, 13, TIN_TOWER_8F, 6

	def_coord_events

	def_bg_events

	def_object_events
