RTC:: ; 343
; update time and time-sensitive palettes

; rtc enabled?
	ld a, [wSpriteUpdatesEnabled]
	cp 0
	ret z

	call UpdateTime

; obj update on?
	ld a, [wVramState]
	bit 0, a
	ret z

TimeOfDayPals:: ; 352
	callfar _TimeOfDayPals
	ret

UpdateTimePals:: ; 359
	callfar _UpdateTimePals
	ret
