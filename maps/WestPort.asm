	object_const_def

WestPort_MapScripts:
	def_scene_scripts

	def_callbacks
	
WestPortTest:
	callasm VermilionDock_SyncScrollWithLY
	end

VermilionDock_SyncScrollWithLY:
	ld h, d
	ld l, $50
	call .sync_scroll_ly
	ld h, $0
	ld l, $80
.sync_scroll_ly
	ldh a, [rLY]
	cp l
	jr nz, .sync_scroll_ly
	ld a, h
	ldh [rSCX], a
.wait_for_ly_match
	ldh a, [rLY]
	cp h
	jr z, .wait_for_ly_match
	ret	

WestPort_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 5, WEST_PORT, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 13,  5, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestPortTest, -1
