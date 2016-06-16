LCD:: ; 41b (0:041b)
	push af
	ld a, [hLCDCPointer]
	and a
	jr z, .done
	push hl
	ld a, [rLY]
	ld l, a
	ld h, wLYOverrides >> 8
	ld h, [hl]
	ld a, [hLCDCPointer]
	ld l, a
	ld a, h
	ld h, rSCY >> 8
	ld [hl], a
	pop hl
.done
	pop af
	reti

DisableLCD::
; Turn the LCD off

; Don't need to do anything if the LCD is already off
	ld a, [rLCDC]
	bit 7, a
	ret z

	xor a
	ld [rIF], a
	ld a, [rIE]
	ld b, a

; Disable VBlank
	res 0, a
	ld [rIE], a

.wait
; Wait until VBlank would normally happen
	ld a, [rLY]
	cp 145
	jr nz, .wait

	ld a, [rLCDC]
	and %01111111
	ld [rLCDC], a

	xor a
	ld [rIF], a
	ld a, b
	ld [rIE], a
	ret

EnableLCD::
	ld a, [rLCDC]
	set 7, a
	ld [rLCDC], a
	ret
