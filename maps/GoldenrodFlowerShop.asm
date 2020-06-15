	const_def 2 ; object constants
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA

GoldenrodFlowerShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FlowerShopTeacherScript:
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .Lalala
	checkflag ENGINE_PLAINBADGE
	iffalse .Lalala
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherBetterThanWhitneyText
	promptbutton
	verbosegiveitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext

.Lalala:
	turnobject GOLDENRODFLOWERSHOP_TEACHER, LEFT
	opentext
	writetext GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText
	waitbutton
	closetext
	end

FlowerShopFloriaScript:
	faceplayer
	opentext
	checkflag ENGINE_PLAINBADGE
	iffalse .NoPlainBadge
	writetext GoldenrodFlowerShopFloriaJumpsInSurpriseText
	waitbutton
	closetext
	end

.NoPlainBadge:
	writetext GoldenrodFlowerShopFloriaMustBeAMonText
	waitbutton
	closetext
	end

FlowerShopShelf1:
; unused
	jumpstd PictureBookshelfScript

FlowerShopShelf2:
; unused
	jumpstd MagazineBookshelfScript

FlowerShopRadio:
; unused
	jumpstd Radio2Script

GoldenrodFlowerShopTeacherBetterThanWhitneyText:
	text "Oh, you're better"
	line "than WHITNEY."

	para "Do you know about"
	line "that moving tree?"

	para "If you wet it with"
	line "a SQUIRTBOTTLE, it"
	cont "attacks."

	para "But since you"
	line "have some BADGES,"
	cont "you should be OK."
	done

GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText:
	text "Lalala lalalala."
	line "Have plenty of"
	cont "water, my lovely!"
	done

GoldenrodFlowerShopFloriaMustBeAMonText:
	text "When I watered"
	line "that moving tree"

	para "on ROUTE 36, it"
	line "jumped!"

	para "I think it must be"
	line "a #MON."

	para "But it would take"
	line "someone like WHIT-"
	cont "NEY, our GYM LEAD-"
	cont "ER, to beat it."
	done

GoldenrodFlowerShopFloriaJumpsInSurpriseText:
	text "Do you know about"
	line "the moving tree?"

	para "If you water it,"
	line "it jumps up in"
	cont "surprise!"
	done

GoldenrodFlowerShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, -1
