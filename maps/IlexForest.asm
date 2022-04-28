	object_const_def
	const ILEXFOREST_FARFETCHD1
	const ILEXFOREST_FARFETCHD2
	const ILEXFOREST_FARFETCHD3
	const ILEXFOREST_FARFETCHD4
	const ILEXFOREST_FARFETCHD5
	const ILEXFOREST_FARFETCHD6
	const ILEXFOREST_FARFETCHD7
	const ILEXFOREST_FARFETCHD8
	const ILEXFOREST_FARFETCHD9
	const ILEXFOREST_FARFETCHD10
	const ILEXFOREST_YOUNGSTER
	const ILEXFOREST_BLACK_BELT
	const ILEXFOREST_ROCKER
	const ILEXFOREST_POKE_BALL

IlexForest_MapScripts:
	def_scene_scripts

	def_callbacks

IlexForestCharcoalApprenticeScript:
	faceplayer
	opentext
	checkevent EVENT_HERDED_FARFETCHD
	iftrue .DoneFarfetchd
	writetext IlexForestApprenticeIntroText
	waitbutton
	closetext
	end

.DoneFarfetchd:
	writetext IlexForestApprenticeAfterText
	waitbutton
	closetext
	end

FarfetchdPosition1:
	faceplayer
	opentext
	writetext Text_ItsTheMissingPokemon
	promptbutton
	writetext Text_Kwaaaa
	cry FARFETCH_D
	waitbutton
	closetext
	applymovement ILEXFOREST_FARFETCHD1, MovementData_Farfetchd_Pos1_Pos2
	appear ILEXFOREST_FARFETCHD2
	pause 5
	disappear ILEXFOREST_FARFETCHD1
	end

FarfetchdPosition2:
	scall FarfetchdCryAndCheckFacing
	ifequal DOWN, .Position2_Down
	applymovement ILEXFOREST_FARFETCHD2, MovementData_Farfetchd_Pos2_Pos3
	appear ILEXFOREST_FARFETCHD3
	pause 5
	disappear ILEXFOREST_FARFETCHD2
	end

.Position2_Down:
	applymovement ILEXFOREST_FARFETCHD2, MovementData_Farfetchd_Pos2_Pos8
	appear ILEXFOREST_FARFETCHD8
	pause 5
	disappear ILEXFOREST_FARFETCHD2
	end

FarfetchdPosition3:
	scall FarfetchdCryAndCheckFacing
	ifequal LEFT, .Position3_Left
	applymovement ILEXFOREST_FARFETCHD3, MovementData_Farfetchd_Pos3_Pos4
	appear ILEXFOREST_FARFETCHD4
	pause 5
	disappear ILEXFOREST_FARFETCHD3
	end

.Position3_Left:
	applymovement ILEXFOREST_FARFETCHD3, MovementData_Farfetchd_Pos3_Pos2
	appear ILEXFOREST_FARFETCHD2
	pause 5
	disappear ILEXFOREST_FARFETCHD3
	end

FarfetchdPosition4:
	scall FarfetchdCryAndCheckFacing
	ifequal UP, .Position4_Up
	applymovement ILEXFOREST_FARFETCHD4, MovementData_Farfetchd_Pos4_Pos5
	appear ILEXFOREST_FARFETCHD5
	pause 5
	disappear ILEXFOREST_FARFETCHD4
	end

.Position4_Up:
	applymovement ILEXFOREST_FARFETCHD4, MovementData_Farfetchd_Pos4_Pos3
	appear ILEXFOREST_FARFETCHD3
	pause 5
	disappear ILEXFOREST_FARFETCHD4
	end

FarfetchdPosition5:
	scall FarfetchdCryAndCheckFacing
	ifequal UP, .Position5_Up
	ifequal LEFT, .Position5_Left
	ifequal RIGHT, .Position5_Right
	applymovement ILEXFOREST_FARFETCHD5, MovementData_Farfetchd_Pos5_Pos6
	appear ILEXFOREST_FARFETCHD6
	pause 5
	disappear ILEXFOREST_FARFETCHD5
	end

.Position5_Left:
	applymovement ILEXFOREST_FARFETCHD5, MovementData_Farfetchd_Pos5_Pos7
	appear ILEXFOREST_FARFETCHD7
	pause 5
	disappear ILEXFOREST_FARFETCHD5
	end

.Position5_Up:
	applymovement ILEXFOREST_FARFETCHD5, MovementData_Farfetched_Pos5_Pos4_Up
	appear ILEXFOREST_FARFETCHD4
	pause 5
	disappear ILEXFOREST_FARFETCHD5
	end

.Position5_Right:
	applymovement ILEXFOREST_FARFETCHD5, MovementData_Farfetched_Pos5_Pos4_Right
	appear ILEXFOREST_FARFETCHD4
	pause 5
	disappear ILEXFOREST_FARFETCHD5
	end

FarfetchdPosition6:
	scall FarfetchdCryAndCheckFacing
	ifequal RIGHT, .Position6_Right
	applymovement ILEXFOREST_FARFETCHD6, MovementData_Farfetched_Pos6_Pos7
	appear ILEXFOREST_FARFETCHD7
	pause 5
	disappear ILEXFOREST_FARFETCHD6
	end

.Position6_Right:
	applymovement ILEXFOREST_FARFETCHD6, MovementData_Farfetched_Pos6_Pos5
	appear ILEXFOREST_FARFETCHD5
	pause 5
	disappear ILEXFOREST_FARFETCHD6
	end

FarfetchdPosition7:
	scall FarfetchdCryAndCheckFacing
	ifequal DOWN, .Position7_Down
	ifequal LEFT, .Position7_Left
	applymovement ILEXFOREST_FARFETCHD7, MovementData_Farfetched_Pos7_Pos8
	appear ILEXFOREST_FARFETCHD8
	pause 5
	disappear ILEXFOREST_FARFETCHD7
	end

.Position7_Left:
	applymovement ILEXFOREST_FARFETCHD7, MovementData_Farfetched_Pos7_Pos6
	appear ILEXFOREST_FARFETCHD6
	pause 5
	disappear ILEXFOREST_FARFETCHD7
	end

.Position7_Down:
	applymovement ILEXFOREST_FARFETCHD7, MovementData_Farfetched_Pos7_Pos5
	appear ILEXFOREST_FARFETCHD5
	pause 5
	disappear ILEXFOREST_FARFETCHD7
	end

FarfetchdPosition8:
	scall FarfetchdCryAndCheckFacing
	ifequal UP, .Position8_Up
	ifequal LEFT, .Position8_Left
	ifequal RIGHT, .Position8_Right
	applymovement ILEXFOREST_FARFETCHD8, MovementData_Farfetched_Pos8_Pos9
	appear ILEXFOREST_FARFETCHD9
	pause 5
	disappear ILEXFOREST_FARFETCHD8
	end

.Position8_Right:
	applymovement ILEXFOREST_FARFETCHD8, MovementData_Farfetched_Pos8_Pos7
	appear ILEXFOREST_FARFETCHD7
	pause 5
	disappear ILEXFOREST_FARFETCHD8
	end

.Position8_Up:
.Position8_Left:
	applymovement ILEXFOREST_FARFETCHD8, MovementData_Farfetched_Pos8_Pos2
	appear ILEXFOREST_FARFETCHD2
	pause 5
	disappear ILEXFOREST_FARFETCHD8
	end

FarfetchdPosition9:
	scall FarfetchdCryAndCheckFacing
	ifequal DOWN, .Position9_Down
	ifequal RIGHT, .Position9_Right
	applymovement ILEXFOREST_FARFETCHD9, MovementData_Farfetched_Pos9_Pos10
	appear ILEXFOREST_FARFETCHD10
	pause 5
	disappear ILEXFOREST_FARFETCHD9
	appear 13 ; ILEXFOREST_BLACK_BELT
	setevent EVENT_CHARCOAL_KILN_BOSS
	setevent EVENT_HERDED_FARFETCHD
	end

.Position9_Right:
	applymovement ILEXFOREST_FARFETCHD9, MovementData_Farfetched_Pos9_Pos8_Right
	appear ILEXFOREST_FARFETCHD8
	pause 5
	disappear ILEXFOREST_FARFETCHD9
	end

.Position9_Down:
	applymovement ILEXFOREST_FARFETCHD9, MovementData_Farfetched_Pos9_Pos8_Down
	appear ILEXFOREST_FARFETCHD8
	pause 5
	disappear ILEXFOREST_FARFETCHD9
	end

FarfetchdPosition10:
	faceplayer
	opentext
	writetext Text_Kwaaaa
	cry FARFETCH_D
	waitbutton
	closetext
	end

FarfetchdCryAndCheckFacing:
	faceplayer
	opentext
	writetext Text_Kwaaaa
	cry FARFETCH_D
	waitbutton
	closetext
	readvar VAR_FACING
	end

IlexForestCharcoalMasterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .AlreadyGotCut
	writetext Text_CharcoalMasterIntro
	promptbutton
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM01_CUT
	writetext Text_CharcoalMasterOutro
	waitbutton
	closetext
	setevent EVENT_ILEX_FOREST_FARFETCHD_10
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	clearevent EVENT_CHARCOAL_KILN_FARFETCH_D
	clearevent EVENT_CHARCOAL_KILN_APPRENTICE
	clearevent EVENT_CHARCOAL_KILN_BOSS
	end

.AlreadyGotCut:
	writetext Text_CharcoalMasterTalkAfter
	waitbutton
	closetext
	end

IlexForestHeadbuttGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .AlreadyGotHeadbutt
	writetext Text_HeadbuttIntro
	promptbutton
	verbosegiveitem TM_HEADBUTT
	iffalse .BagFull
	setevent EVENT_GOT_TM02_HEADBUTT
.AlreadyGotHeadbutt:
	writetext Text_HeadbuttOutro
	waitbutton
.BagFull:
	closetext
	end

IlexForestRevive:
	itemball GS_BALL

IlexForestHiddenEther:
	hiddenitem ETHER, EVENT_ILEX_FOREST_HIDDEN_ETHER

IlexForestHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION

IlexForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL

IlexForestBoulder: ; unreferenced
	jumpstd StrengthBoulderScript

IlexForestSignpost:
	jumptext IlexForestSignpostText

IlexForestShrineScript:
	jumptext Text_IlexForestShrine

MovementData_Farfetchd_Pos1_Pos2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetchd_Pos2_Pos3:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos2_Pos8:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos3_Pos4:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetchd_Pos3_Pos2:
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos4_Pos5:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos4_Pos3:
	big_step LEFT
	jump_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos5_Pos6:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos5_Pos7:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetched_Pos5_Pos4_Up:
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	step_end

MovementData_Farfetched_Pos5_Pos4_Right:
	big_step RIGHT
	turn_head UP
	step_sleep 1
	turn_head DOWN
	step_sleep 1
	turn_head UP
	step_sleep 1
	big_step DOWN
	big_step DOWN
	fix_facing
	jump_step UP
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos6_Pos7:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos6_Pos5:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos7_Pos8:
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetched_Pos7_Pos6:
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos7_Pos5:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos8_Pos9:
	big_step DOWN
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetched_Pos8_Pos7:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos8_Pos2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos10:
	big_step LEFT
	big_step LEFT
	fix_facing
	jump_step RIGHT
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos8_Right:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos8_Down:
	big_step LEFT
	big_step LEFT
	fix_facing
	jump_step RIGHT
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

IlexForestApprenticeIntroText:
	text "Oh, man… My boss"
	line "is going to be"
	cont "steaming…"

	para "The FARFETCH'D"
	line "that CUTS trees"

	para "for charcoal took"
	line "off on me."

	para "I can't go looking"
	line "for it here in the"
	cont "ILEX FOREST."

	para "It's too big, dark"
	line "and scary for me…"
	done

IlexForestApprenticeAfterText:
	text "Wow! Thanks a"
	line "whole bunch!"

	para "My boss's #MON"
	line "won't obey me be-"
	cont "cause I don't have"
	cont "a BADGE."
	done

Text_ItsTheMissingPokemon:
	text "It's the missing"
	line "#MON!"
	done

Text_Kwaaaa:
	text "FARFETCH'D: Kwaa!"
	done

Text_CharcoalMasterIntro:
	text "Ah! My FARFETCH'D!"

	para "You found it for"
	line "us, kid?"

	para "Without it, we"
	line "wouldn't be able"

	para "to CUT trees for"
	line "charcoal."

	para "Thanks, kid!"

	para "Now, how can I"
	line "thank you…"

	para "I know! Here, take"
	line "this."
	done

Text_CharcoalMasterOutro:
	text "That's the CUT HM."
	line "Teach that to a"

	para "#MON to clear"
	line "small trees."

	para "Of course, you"
	line "have to have the"

	para "GYM BADGE from"
	line "AZALEA to use it."
	done

Text_CharcoalMasterTalkAfter:
	text "Do you want to"
	line "apprentice as a"

	para "charcoal maker"
	line "with me?"

	para "You'll be first-"
	line "rate in ten years!"
	done

Text_HeadbuttIntro:
	text "What am I doing?"

	para "I'm shaking trees"
	line "using HEADBUTT."

	para "It's fun. Here,"
	line "you try it too!"
	done

Text_HeadbuttOutro:
	text "Rattle trees with"
	line "HEADBUTT. Some-"
	cont "times, sleeping"
	cont "#MON fall out."
	done

IlexForestSignpostText:
	text "ILEX FOREST is"
	line "so overgrown with"

	para "trees that you"
	line "can't see the sky."

	para "Please watch out"
	line "for items that may"
	cont "have been dropped."
	done

Text_IlexForestShrine:
	text "ILEX FOREST"
	line "SHRINE…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"
	done

IlexForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  5, ROUTE_34_ILEX_FOREST_GATE, 3
	warp_event  3, 42, ILEX_FOREST_AZALEA_GATE, 1
	warp_event  3, 43, ILEX_FOREST_AZALEA_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  3, 17, BGEVENT_READ, IlexForestSignpost
	bg_event 27,  1, BGEVENT_ITEM, IlexForestHiddenEther
	bg_event 17,  7, BGEVENT_ITEM, IlexForestHiddenSuperPotion
	bg_event  9, 17, BGEVENT_ITEM, IlexForestHiddenFullHeal
	bg_event  8, 22, BGEVENT_READ, IlexForestShrineScript

	def_object_events
	object_event 14, 31, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FarfetchdPosition1, EVENT_ILEX_FOREST_FARFETCHD_1
	object_event 15, 25, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FarfetchdPosition2, EVENT_ILEX_FOREST_FARFETCHD_2
	object_event 20, 24, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FarfetchdPosition3, EVENT_ILEX_FOREST_FARFETCHD_3
	object_event 29, 22, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FarfetchdPosition4, EVENT_ILEX_FOREST_FARFETCHD_4
	object_event 28, 31, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FarfetchdPosition5, EVENT_ILEX_FOREST_FARFETCHD_5
	object_event 24, 35, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FarfetchdPosition6, EVENT_ILEX_FOREST_FARFETCHD_6
	object_event 22, 31, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FarfetchdPosition7, EVENT_ILEX_FOREST_FARFETCHD_7
	object_event 15, 29, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FarfetchdPosition8, EVENT_ILEX_FOREST_FARFETCHD_8
	object_event 10, 35, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FarfetchdPosition9, EVENT_ILEX_FOREST_FARFETCHD_9
 	object_event 6, 28, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FarfetchdPosition10, EVENT_ILEX_FOREST_FARFETCHD_10
        object_event  7, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestCharcoalApprenticeScript, EVENT_ILEX_FOREST_APPRENTICE
        object_event  5, 28, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestCharcoalMasterScript, EVENT_ILEX_FOREST_CHARCOAL_MASTER
        object_event 15, 14, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestHeadbuttGuyScript, -1
        object_event 20, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestRevive, EVENT_ILEX_FOREST_REVIVE
