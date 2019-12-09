RepelWoreOffScript::
	opentext
	writetext .RepelWoreOffText
	waitbutton
	closetext
	end

.RepelWoreOffText:
	text_jump _RepelWoreOffText
	db "@"

HiddenItemScript::
	opentext
	copybytetovar $CF2B
	itemtotext MEM_BUFFER_0, USE_SCRIPT_VAR
	writetext .PlayerFoundItemText
	giveitem ITEM_FROM_MEM
	iffalse .bag_full
	callasm SetMemEvent
	specialsound
	itemnotify
	jump .finish

.bag_full
	buttonsound
	writetext .ButNoSpaceText
	waitbutton

.finish
	closetext
	end

.PlayerFoundItemText:
	text_jump _PlayerFoundItemText
	db "@"

.ButNoSpaceText:
	text_jump _ButNoSpaceText
	db "@"

SetMemEvent:
	ld hl, wcf29
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld b, SET_FLAG
	call EventFlagAction
	ret