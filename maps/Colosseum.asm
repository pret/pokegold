	object_const_def
	const COLOSSEUM_CHRIS1
	const COLOSSEUM_CHRIS2

Colosseum_MapScripts:
	def_scene_scripts
	scene_script .InitializeColosseum, SCENE_COLOSSEUM_INITIALIZE
	scene_script .DummyScene1,         SCENE_COLOSSEUM_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .SetWhichChris

.InitializeColosseum:
	sdefer .InitializeAndPreparePokecenter2F
	end

.DummyScene1:
	end

.SetWhichChris:
	special CableClubCheckWhichChris
	iffalse .Chris2
	disappear COLOSSEUM_CHRIS2
	appear COLOSSEUM_CHRIS1
	endcallback

.Chris2:
	disappear COLOSSEUM_CHRIS1
	appear COLOSSEUM_CHRIS2
	endcallback

.InitializeAndPreparePokecenter2F:
	setscene SCENE_COLOSSEUM_NOOP
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	end

ColosseumConsoleScript:
	special Colosseum
	newloadmap MAPSETUP_LINKRETURN
	end

CableClubFriendScript:
	opentext
	writetext .FriendReadyText
	waitbutton
	closetext
	end

.FriendReadyText:
	text "Your friend is"
	line "ready."
	done

Colosseum_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, POKECENTER_2F, 3
	warp_event  5,  7, POKECENTER_2F, 3

	def_coord_events

	def_bg_events
	bg_event  4,  4, BGEVENT_RIGHT, ColosseumConsoleScript
	bg_event  5,  4, BGEVENT_LEFT, ColosseumConsoleScript

	def_object_events
	object_event  3,  4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CableClubFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  6,  4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CableClubFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
