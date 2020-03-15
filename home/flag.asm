ResetMapBufferEventFlags:: ; 2f10 (0:2f10)
	xor a
	ld hl, wEventFlags
	ld [hli], a
	ret

ResetBikeFlags:: ; 2f16 (0:2f16)
	xor a
	ld hl, wBikeFlags
	ld [hli], a
	ld [hl], a
	ret

ResetFlashIfOutOfCave:: ; 2f1d (0:2f1d)
	ld a, [wPermission]
	cp $2
	jr z, .turn_off_lights
	cp $1
	jr z, .turn_off_lights
	ret

.turn_off_lights
	ld hl, wStatusFlags
	res 2, [hl] ; FLASH
	ret

EventFlagAction::
	ld hl, wEventFlags
	call FlagAction
	ret

FlagAction:: ; 2f36 (0:2f36)
; Perform action b on bit de in flag array hl.

; inputs:
; b: function
;    0 clear bit
;    1 set bit
;    2 check bit
; de: bit number
; hl: index within bit table

	; get index within the byte
	ld a, e
	and 7

	; shift de right by three bits (get the index within memory)
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	add hl, de

	; implement a decoder
	ld c, 1
	rrca
	jr nc, .one
	rlc c
.one
	rrca
	jr nc, .two
	rlc c
	rlc c
.two
	rrca
	jr nc, .three
	swap c
.three

	; check b's value: 0, 1, 2
	ld a, b
	cp 1
	jr c, .clearbit ; 0
	jr z, .setbit ; 1

	; check bit
	ld a, [hl]
	and c
	ld c, a
	ret

.setbit
	; set bit
	ld a, [hl]
	or c
	ld [hl], a
	ret

.clearbit
	; clear bit
	ld a, c
	cpl
	and [hl]
	ld [hl], a
	ret

CheckReceivedDex::
	ld de, ENGINE_POKEDEX
	ld b, CHECK_FLAG
	farcall EngineFlagAction
	ld a, c
	and a
	ret

Unreferenced_CheckBPressedDebug::
; Used in debug ROMs to walk through walls and avoid encounters.

	ld a, [wDebugFlags]
	bit 1, a
	ret z
	
	ldh a, [hJoyDown]
	bit 1, a
	ret

xor_a::
	xor a
	ret

xor_a_dec_a::
	xor a
	dec a
	ret

Unreferenced_CheckFieldDebug::
	push hl
	ld hl, wDebugFlags
	bit DEBUG_FIELD_F, [hl]
	pop hl
	ret