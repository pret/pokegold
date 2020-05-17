GetPokeBallWobble:
; Returns whether a Poke Ball will wobble in the catch animation.
; Whether a Pokemon is caught is determined beforehand.

	ld a, [wBuffer2]
	inc a
	ld [wBuffer2], a

; Wobble up to 3 times.
	cp 3 + 1
	jr z, .finished

	ld a, [wWildMon]
	and a
	ld c, 0 ; next
	ret nz

	ld hl, WobbleProbabilities
	ld a, [wBuffer1]
	ld b, a
.loop
	ld a, [hli]
	cp b
	jr nc, .checkwobble
	inc hl
	jr .loop

.checkwobble
	ld b, [hl]
	call Random
	cp b
	ld c, 0 ; next
	ret c
	ld c, 2 ; escaped
	ret

.finished
	ld a, [wWildMon]
	and a
	ld c, 1 ; caught
	ret nz
	ld c, 2 ; escaped
	ret

INCLUDE "data/battle/wobble_probabilities.asm"
