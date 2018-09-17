	const_def 2 ; object constants
	const OLIVINELIGHTHOUSE2F_SAILOR
	const OLIVINELIGHTHOUSE2F_GENTLEMAN

OlivineLighthouse2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerGentlemanAlfred:
	trainer GENTLEMAN, ALFRED, EVENT_BEAT_GENTLEMAN_ALFRED, GentlemanAlfredSeenText, GentlemanAlfredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanAlfredAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorHuey:
	trainer SAILOR, HUEY1, EVENT_BEAT_SAILOR_HUEY, SailorHueySeenText, SailorHueyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_HUEY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_SAILOR_HUEY
	iftrue .NumberAccepted
	checkevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	writetext SailorHueyAfterBattleText
	buttonsound
	setevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .AskForNumber

.AskedBefore:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_SAILOR_HUEY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	trainertotext SAILOR, HUEY1, MEM_BUFFER_0
	scall .RegisteredNumber
	jump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext SailorHueyBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
	loadtrainer SAILOR, HUEY1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_HUEY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SAILOR, HUEY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_HUEY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SAILOR, HUEY3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_HUEY_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.Rematch:
	jumpstd rematchm
	end

SailorHueySeenText:
	text "Men of the sea are"
	line "always spoiling"
	cont "for a good fight!"
	done

SailorHueyBeatenText:
	text "Urf!"
	line "I lose!"
	done

SailorHueyAfterBattleText:
	text "What power!"
	line "How would you like"

	para "to sail the seas"
	line "with me?"
	done

GentlemanAlfredSeenText:
	text "Hm? This is no"
	line "place for playing."
	done

GentlemanAlfredBeatenText:
	text "Ah! I can see that"
	line "you're serious."
	done

GentlemanAlfredAfterBattleText:
	text "Up top is a #-"
	line "MON that keeps the"
	cont "LIGHTHOUSE lit."

	para "But I hear that"
	line "it's sick now and"

	para "can't be cured by"
	line "ordinary medicine."
	done

OlivineLighthouse2F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_1F, 3
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_3F, 2
	warp_event 16, 13, OLIVINE_LIGHTHOUSE_1F, 4
	warp_event 17, 13, OLIVINE_LIGHTHOUSE_1F, 5
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_3F, 4
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_3F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  9,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorHuey, -1
	object_event 17,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGentlemanAlfred, -1
