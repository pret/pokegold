PrintLetterDelay::
; Wait before printing the next letter.

; The text speed setting in wOptions is actually a frame count:
; 	fast: 1 frame
; 	mid:  3 frames
; 	slow: 5 frames

; wTextboxFlags[!0] and A or B override text speed with a one-frame delay.
; wOptions[4] and wTextboxFlags[!1] disable the delay.

	ld a, [wOptions]
	bit NO_TEXT_SCROLL, a
	ret nz

; non-scrolling text?
	ld a, [wTextboxFlags]
	bit NO_TEXT_DELAY_F, a
	ret z

	push hl
	push de
	push bc

	ld hl, hOAMUpdate
	ld a, [hl]
	push af

; orginally turned oam update off...
;	ld a, 1
	ld [hl], a

; force fast scroll?
	ld a, [wTextboxFlags]
	bit FAST_TEXT_DELAY_F, a
	jr z, .fast

; text speed
	ld a, [wOptions]
	and %111
	jr .updatedelay

.fast
	ld a, TEXT_DELAY_FAST

.updatedelay
	ld [wTextDelayFrames], a

.checkjoypad
	call GetJoypad

; input override
	ld a, [wDisableTextAcceleration]
	and a
	jr nz, .wait

; Wait one frame if holding A or B.
	ldh a, [hJoyDown]
	bit A_BUTTON_F, a
	jr z, .checkb
	jr .delay
.checkb
	bit B_BUTTON_F, a
	jr z, .wait

.delay
	call DelayFrame
	jr .end

.wait
	ld a, [wTextDelayFrames]
	and a
	jr nz, .checkjoypad

.end
	pop af
	ldh [hOAMUpdate], a
	pop bc
	pop de
	pop hl
	ret

CopyDataUntil::
; Copy [hl .. bc) to de.

; In other words, the source data is
; from hl up to but not including bc,
; and the destination is de.

	ld a, [hli]
	ld [de], a
	inc de
	ld a, h
	cp b
	jr nz, CopyDataUntil
	ld a, l
	cp c
	jr nz, CopyDataUntil
	ret

INCLUDE "home/print_num.asm"

Function33ce::
; Print c-digit hex number from de to hl
.asm_33ce
	push bc
	call Function33d7
	pop bc
	dec c
	jr nz, .asm_33ce
	ret

Function33d7:: ; 33d7 (0:33d7)
	ld a, [de]
	swap a
	and $f
	call Function33e9
	ld [hli], a
	ld a, [de]
	and $f
	call Function33e9
	ld [hli], a
	inc de
	ret

Function33e9:: ; 33e9 (0:33e9)
	ld bc, .digits
	add c
	ld c, a
	ld a, $0
	adc b
	ld b, a
	ld a, [bc]
	ret

.digits db "0123456789ABCDEF"

FarPrintText::
	ld [wBuffer], a
	ldh a, [hROMBank]
	push af
	ld a, [wBuffer]
	rst Bankswitch

	call PrintText

	pop af
	rst Bankswitch
	ret

CallPointerAt::
	ldh a, [hROMBank]
	push af
	ld a, [hli]
	rst Bankswitch

	ld a, [hli]
	ld h, [hl]
	ld l, a

	call _hl_

	pop hl
	ld a, h
	rst Bankswitch
	ret
