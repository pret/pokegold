RepelWoreOffScript::
	opentext
	writetext .RepelWoreOffText
	waitbutton
	closetext
	end

.RepelWoreOffText:
	text_far _RepelWoreOffText
	text_end

UseAnotherRepelScript::
	opentext
	writetext .UseAnotherRepelText
	yesorno
	iffalse .declined
	callasm UseAnotherRepel
	closetext
	end

.declined
	closetext
	end

.UseAnotherRepelText:
	text_far _UseAnotherRepelText
	text_end

UseAnotherRepel:
; Use the repel stored in wRepelType
	ld a, [wRepelType]
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call TossItem
	call DoItemEffect
	ret
