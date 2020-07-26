	object_const_def
	const COPYCATSHOUSE2F_COPYCAT
	const COPYCATSHOUSE2F_DODRIO
	const COPYCATSHOUSE2F_FAIRYDOLL ; lost item
	const COPYCATSHOUSE2F_MONSTERDOLL
	const COPYCATSHOUSE2F_BIRDDOLL

CopycatsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

Copycat:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue .TryGivePassAgain
	checkitem LOST_ITEM
	iftrue .ReturnLostItem
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special LoadUsedSpritesGFX
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .TalkAboutLostItem
	opentext
	writetext CopycatText_Male_1
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_QuickMimicking
	waitbutton
	closetext
	end

.TalkAboutLostItem:
	opentext
	writetext CopycatText_Male_2
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Worried
	waitbutton
	closetext
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	end

.ReturnLostItem:
	opentext
	writetext CopycatText_GiveDoll
	promptbutton
	takeitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjump .GivePass

.TryGivePassAgain:
	opentext
.GivePass:
	writetext CopycatText_GivePass
	promptbutton
	verbosegiveitem PASS
	iffalse .Cancel
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	writetext CopycatText_ExplainPass
	waitbutton
	closetext
	end

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Male_3
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_ItsAScream
	waitbutton
.Cancel:
	closetext
	end

CopycatsDodrio:
	opentext
	writetext CopycatsDodrioText1
	cry DODRIO
	promptbutton
	writetext CopycatsDodrioText2
	waitbutton
	closetext
	end

CopycatsHouse2FDoll:
	jumptext CopycatsHouse2FDollText

CopycatsHouse2FBookshelf:
	jumpstd PictureBookshelfScript

CopycatSpinAroundMovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

CopycatText_Male_1:
	text "<PLAYER>: Hi! Do"
	line "you like #MON?"

	para "<PLAYER>: Uh, no, I"
	line "just asked you."

	para "<PLAYER>: Huh?"
	line "You're strange!"
	done

CopycatText_QuickMimicking:
	text "COPYCAT: Hmm?"
	line "Quit mimicking?"

	para "But that's my"
	line "favorite hobby!"
	done

CopycatText_Male_2:
	text "<PLAYER>: Hi!"
	line "I heard that you"

	para "lost your favorite"
	line "# DOLL."

	para "<PLAYER>: If I find"
	line "it, you'll give me"
	cont "a rail PASS?"

	para "<PLAYER>: I'll go"
	line "find it for you."

	para "You think you lost"
	line "it when you went"
	cont "to VERMILION CITY?"
	done

CopycatText_Worried:
	text "COPYCAT: Pardon?"

	para "I shouldn't decide"
	line "what you should"
	cont "do?"

	para "But I'm really"
	line "worried… What if"
	cont "someone finds it?"
	done

CopycatText_GiveDoll:
	text "COPYCAT: Yay!"
	line "That's my CLEFAIRY"
	cont "# DOLL!"

	para "See the tear where"
	line "the right leg is"

	para "sewn on? That's"
	line "proof!"
	done

CopycatText_GivePass:
	text "OK. Here's the"
	line "MAGNET TRAIN PASS"
	cont "like I promised!"
	done

CopycatText_ExplainPass:
	text "COPYCAT: That's"
	line "the PASS for the"
	cont "MAGNET TRAIN."

	para "The rail company"
	line "man gave me that"

	para "when they tore"
	line "down our old house"
	cont "for the STATION."
	done

CopycatText_Male_3:
	text "<PLAYER>: Hi!"
	line "Thanks a lot for"
	cont "the rail PASS!"

	para "<PLAYER>: Pardon?"

	para "<PLAYER>: Is it"
	line "that fun to mimic"
	cont "my every move?"
	done

CopycatText_ItsAScream:
	text "COPYCAT: You bet!"
	line "It's a scream!"
	done

CopycatsDodrioText1:
	text "DODRIO: Gii giii!"
	done

CopycatsDodrioText2:
	text "MIRROR, MIRROR ON"
	line "THE WALL, WHO'S"

	para "THE FAIREST ONE OF"
	line "ALL?"
	done

CopycatsHouse2FDollText:
	text "This is a rare"
	line "#MON! Huh?"

	para "It's only a doll…"
	done

CopycatsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CopycatsHouse2FBookshelf
	bg_event  1,  1, BGEVENT_READ, CopycatsHouse2FBookshelf

	def_object_events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Copycat, -1
	object_event  6,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsDodrio, -1
	object_event  6,  1, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  7,  1, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
