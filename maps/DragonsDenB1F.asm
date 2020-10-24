	object_const_def
	const DRAGONSDENB1F_POKE_BALL1
	const DRAGONSDENB1F_CLAIR
	const DRAGONSDENB1F_SILVER

DragonsDenB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .CheckSilver

.CheckSilver:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .CheckDay
	disappear DRAGONSDENB1F_SILVER
	endcallback

.CheckDay:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .AppearSilver
	ifequal THURSDAY, .AppearSilver
	disappear DRAGONSDENB1F_SILVER
	endcallback

.AppearSilver:
	appear DRAGONSDENB1F_SILVER
	endcallback

DragonsDenB1FDragonFangScript:
	giveitem DRAGON_FANG
	iffalse .BagFullDragonFang
	disappear DRAGONSDENB1F_POKE_BALL1
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	readvar VAR_FACING
	ifequal RIGHT, .next
	sjump .next2
.next
	moveobject DRAGONSDENB1F_CLAIR, 34, 21
.next2
	appear DRAGONSDENB1F_CLAIR
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksToYou
	turnobject PLAYER, DOWN
	opentext
	writetext ClairText_GiveDragonbreathDragonDen
	promptbutton
	waitsfx
	writetext DragonShrinePlayerReceivedRisingBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RISINGBADGE
	specialphonecall SPECIALCALL_MASTERBALL
	writetext DragonShrineRisingBadgeExplanationText
	promptbutton
	verbosegiveitem TM_DRAGONBREATH, 1
	iffalse .ClairLastText
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext ClairText_DescribeDragonbreathDragonDen
	promptbutton
	sjump .ClairLastText
.ClairLastText
	writetext ClairText_CollectedAllBadges
	waitbutton
	closetext
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksAway
	disappear DRAGONSDENB1F_CLAIR
	end

.BagFullDragonFang:
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	promptbutton
	writetext Text_NoRoomForDragonFang
	waitbutton
	closetext
	end

DragonsDenB1FSilverScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .SilverTalkAgain
	writetext SilverText_Training1
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	special RestartMapMusic
	end

.SilverTalkAgain:
	writetext SilverText_Training2
	waitbutton
	closetext
	special RestartMapMusic
	end

DragonShrineSignpost:
	jumptext DragonShrineSignpostText

DragonsDenB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE

DragonsDenB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION

DragonsDenB1FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER

MovementDragonsDen_ClairWalksToYou:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementDragonsDen_ClairWalksAway:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ClairText_GiveDragonbreathDragonDen:
	text "CLAIR: All right."
	line "I recognize your"

	para "true power. This"
	line "BADGE is yours."
	done

DragonShrinePlayerReceivedRisingBadgeText:
	text "<PLAYER> received"
	line "RISINGBADGE."
	done

DragonShrineRisingBadgeExplanationText:
	text "RISINGBADGE will"
	line "enable your"

	para "#MON to use the"
	line "move for climbing"
	cont "waterfalls."

	para "Also, all #MON"
	line "will recognize you"

	para "as a trainer and"
	line "obey your every"

	para "command without"
	line "question."

	para "I also want you to"
	line "have this TM."
	done

Text_ReceivedTM24: ; unreferenced
	text "<PLAYER> received"
	line "TM24."
	done

ClairText_DescribeDragonbreathDragonDen:
	text "That contains"
	line "DRAGONBREATH."

	para "No, it doesn't"
	line "have anything to"
	cont "do with my breath."

	para "If you don't want"
	line "it, you don't have"
	cont "to take it."
	done

ClairText_CollectedAllBadges:
	text "So, you've col-"
	line "lected all the"
	cont "BADGES."

	para "Your destination"
	line "is the #MON"

	para "LEAGUE in INDIGO"
	line "PLATEAU."

	para "Do you know how to"
	line "get there?"

	para "From here, go to"
	line "NEW BARK TOWN."

	para "Then SURF east."
	line "The route there is"
	cont "very tough."

	para "Don't you dare"
	line "lose at the #-"
	cont "MON LEAGUE!"

	para "If you do, I'll"
	line "feel even worse"

	para "about having lost"
	line "to you!"
	done

DragonShrineSignpostText:
	text "DRAGON SHRINE"

	para "A shrine honoring"
	line "the dragon #MON"

	para "said to have lived"
	line "in DRAGON'S DEN."
	done

SilverText_Training1:
	text "…"
	line "What? <PLAYER>?"

	para "…No, I won't"
	line "battle you now…"

	para "My #MON aren't"
	line "ready to beat you."

	para "I can't push them"
	line "too hard now."

	para "I have to be dis-"
	line "ciplined to become"

	para "the greatest #-"
	line "MON trainer…"
	done

SilverText_Training2:
	text "…"

	para "Whew…"

	para "Learn to stay out"
	line "of my way…"
	done

Text_FoundDragonFang:
	text "<PLAYER> found a"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Text_NoRoomForDragonFang:
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

DragonsDenB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20,  3, DRAGONS_DEN_1F, 3

	def_coord_events

	def_bg_events
	bg_event 18, 24, BGEVENT_READ, DragonShrineSignpost
	bg_event 31,  4, BGEVENT_ITEM, DragonsDenB1FHiddenRevive
	bg_event 21, 17, BGEVENT_ITEM, DragonsDenB1FHiddenMaxPotion
	bg_event 31, 15, BGEVENT_ITEM, DragonsDenB1FHiddenMaxElixer

	def_object_events
	object_event 35, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FDragonFangScript, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	object_event 35, 22, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGONS_DEN_CLAIR
	object_event 20, 23, SPRITE_SILVER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FSilverScript, EVENT_RIVAL_DRAGONS_DEN
