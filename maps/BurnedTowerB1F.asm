	object_const_def
	const BURNEDTOWERB1F_BOULDER
	const BURNEDTOWERB1F_RAIKOU1
	const BURNEDTOWERB1F_ENTEI1
	const BURNEDTOWERB1F_SUICUNE1
	const BURNEDTOWERB1F_RAIKOU2
	const BURNEDTOWERB1F_ENTEI2
	const BURNEDTOWERB1F_SUICUNE2
	const BURNEDTOWERB1F_POKE_BALL1
	const BURNEDTOWERB1F_POKE_BALL2

BurnedTowerB1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks

.DummyScene0:
	end

.DummyScene1:
	end

ReleaseTheBeasts:
	playmusic MUSIC_NONE
	pause 30
	appear BURNEDTOWERB1F_RAIKOU1
	turnobject PLAYER, UP
	pause 5
	disappear BURNEDTOWERB1F_RAIKOU2
	pause 15
	cry RAIKOU
	appear BURNEDTOWERB1F_ENTEI1
	turnobject PLAYER, UP
	pause 5
	disappear BURNEDTOWERB1F_ENTEI2
	pause 15
	cry ENTEI
	appear BURNEDTOWERB1F_SUICUNE1
	turnobject PLAYER, UP
	pause 5
	disappear BURNEDTOWERB1F_SUICUNE2
	pause 15
	cry SUICUNE
	pause 15
	playsound SFX_WARP_FROM
	turnobject PLAYER, RIGHT
	applymovement BURNEDTOWERB1F_RAIKOU1, BurnedTowerRaikouMovement
	disappear BURNEDTOWERB1F_RAIKOU1
	waitsfx
	playsound SFX_WARP_FROM
	turnobject PLAYER, DOWN
	applymovement BURNEDTOWERB1F_ENTEI1, BurnedTowerEnteiMovement
	disappear BURNEDTOWERB1F_ENTEI1
	waitsfx
	playsound SFX_WARP_FROM
	turnobject PLAYER, LEFT
	applymovement BURNEDTOWERB1F_SUICUNE1, BurnedTowerSuicuneMovement
	disappear BURNEDTOWERB1F_SUICUNE1
	waitsfx
	special RestartMapMusic
	setscene SCENE_FINISHED
	setevent EVENT_RELEASED_THE_BEASTS
	special InitRoamMons
	end

UnusedEnteiScript: ; unreferenced
	opentext
	writetext UnusedEnteiText
	cry ENTEI
	waitbutton
	closetext
	loadwildmon ENTEI, 40
	startbattle
	ifequal DRAW, .draw
	disappear BURNEDTOWERB1F_ENTEI1
	reloadmapafterbattle
	end
.draw
	reloadmapafterbattle
	disappear BURNEDTOWERB1F_ENTEI1
	end

BurnedTowerB1FHPUp:
	itemball HP_UP

BurnedTowerB1FTMEndure:
	itemball TM_ENDURE

BurnedTowerB1FBoulder:
	jumpstd StrengthBoulderScript

BurnedTowerB1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_BURNED_TOWER_B1F_HIDDEN_ULTRA_BALL

BurnedTowerB1FHiddenBurnHeal:
	hiddenitem BURN_HEAL, EVENT_BURNED_TOWER_B1F_HIDDEN_BURN_HEAL

BurnedTowerB1FHiddenNugget:
	hiddenitem NUGGET, EVENT_BURNED_TOWER_B1F_HIDDEN_NUGGET

BurnedTowerRaikouMovement:
	set_sliding
	fast_jump_step RIGHT
	big_step RIGHT
	fast_jump_step RIGHT
	big_step RIGHT
	remove_sliding
	step_end

BurnedTowerEnteiMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	remove_sliding
	step_end

BurnedTowerSuicuneMovement:
	set_sliding
	fast_jump_step LEFT
	big_step LEFT
	remove_sliding
	step_end

UnusedEnteiText:
	text "ENTEI: Bufuu!"
	done

BurnedTowerB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, BURNED_TOWER_1F, 3
	warp_event 17,  7, BURNED_TOWER_1F, 7
	warp_event 10,  8, BURNED_TOWER_1F, 9
	warp_event  3, 13, BURNED_TOWER_1F, 10
	warp_event 17, 14, BURNED_TOWER_1F, 12
	warp_event  7, 15, BURNED_TOWER_1F, 14

	def_coord_events
	coord_event  9,  5, SCENE_DEFAULT, ReleaseTheBeasts

	def_bg_events
	bg_event  2, 13, BGEVENT_ITEM, BurnedTowerB1FHiddenUltraBall
	bg_event 17, 14, BGEVENT_ITEM, BurnedTowerB1FHiddenBurnHeal
	bg_event  8,  3, BGEVENT_ITEM, BurnedTowerB1FHiddenNugget

	def_object_events
	object_event 17,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurnedTowerB1FBoulder, -1
	object_event 10,  3, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_1
	object_event  8,  4, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_1
	object_event  7,  2, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_1
	object_event 10,  3, SPRITE_GROWLITHE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_2
	object_event  8,  4, SPRITE_GROWLITHE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_2
	object_event  7,  2, SPRITE_GROWLITHE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_2
	object_event  4,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurnedTowerB1FHPUp, EVENT_BURNED_TOWER_B1F_HP_UP
	object_event 15,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurnedTowerB1FTMEndure, EVENT_BURNED_TOWER_B1F_TM_ENDURE
