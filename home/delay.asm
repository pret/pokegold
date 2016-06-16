DelayFrame:: ; 32e
	ld a, $1
	ld [$ceea], a
.asm_333
	halt
	ld a, [$ceea]
	and a
	jr nz, .asm_333
	ret

DelayFrames:: ; 33c
.loop
	call DelayFrame
	dec c
	jr nz, .loop
	ret
