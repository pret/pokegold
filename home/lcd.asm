LCD:: ; 41b (0:041b)
	push af
	ldh a, [hLCDCPointer]
	and a
	jr z, .done
	push hl
	ldh a, [rLY]
	ld l, a
	ld h, wLYOverrides >> 8
	ld h, [hl]
	ldh a, [hLCDCPointer]
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
	ldh a, [rLCDC]
	bit 7, a
	ret z

	xor a
	ldh [rIF], a
	ldh a, [rIE]
	ld b, a

; Disable VBlank
	res 0, a
	ldh [rIE], a

.wait
; Wait until VBlank would normally happen
	ldh a, [rLY]
	cp 145
	jr nz, .wait

	ldh a, [rLCDC]
	and %01111111
	ldh [rLCDC], a

	xor a
	ldh [rIF], a
	ld a, b
	ldh [rIE], a
	ret

EnableLCD::
	ldh a, [rLCDC]
	set 7, a
	ldh [rLCDC], a
	ret
