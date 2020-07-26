	object_const_def
	const ROUTE33_POKEFAN_M
	const ROUTE33_FRUIT_TREE

Route33_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHikerAnthony:
	trainer HIKER, ANTHONY2, EVENT_BEAT_HIKER_ANTHONY, HikerAnthony2SeenText, HikerAnthony2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_ANTHONY_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_HIKER_ANTHONY
	iftrue .NumberAccepted
	checkevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext HikerAnthony2AfterText
	promptbutton
	setevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForPhoneNumber

.AskAgain:
	scall .AskNumber2
.AskForPhoneNumber:
	askforphonenumber PHONE_HIKER_ANTHONY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, HIKER, ANTHONY2
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext HikerAnthony2BeatenText, 0
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
	loadtrainer HIKER, ANTHONY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ANTHONY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer HIKER, ANTHONY1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ANTHONY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer HIKER, ANTHONY3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ANTHONY_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.RematchStd:
	jumpstd RematchMScript
	end

Route33Sign:
	jumptext Route33SignText

Route33FruitTree:
	fruittree FRUITTREE_ROUTE_33

HikerAnthony2SeenText:
	text "I came through the"
	line "tunnel, but I"

	para "still have plenty"
	line "of energy left."
	done

HikerAnthony2BeatenText:
	text "Whoa, boy! You've"
	line "got more zip."
	done

HikerAnthony2AfterText:
	text "We HIKERS are at"
	line "our best in the"
	cont "mountains."
	done

Route33SignText:
	text "ROUTE 33"
	done

Route33_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  9, UNION_CAVE_1F, 3

	def_coord_events

	def_bg_events
	bg_event 11, 11, BGEVENT_READ, Route33Sign

	def_object_events
	object_event  6, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event 14, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route33FruitTree, -1
