GetUnownLetter:
; Return Unown letter in wUnownLetter based on DVs at hl

; Take the middle 2 bits of each DV and place them in order:
;	atk  def  spd  spc
;	.ww..xx.  .yy..zz.

	; atk
	ld a, [hl]
	and %01100000
	sla a
	ld b, a
	; def
	ld a, [hli]
	and %00000110
	swap a
	srl a
	or b
	ld b, a

	; spd
	ld a, [hl]
	and %01100000
	swap a
	sla a
	or b
	ld b, a
	; spc
	ld a, [hl]
	and %00000110
	srl a
	or b

; Divide by 10 to get 0-25
	ldh [hDividend + 3], a
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ldh [hDividend + 2], a
	ld a, $ff / NUM_UNOWN + 1
	ldh [hDivisor], a
	ld b, 4
	call Divide

; Increment to get 1-26
	ldh a, [hQuotient + 3]
	inc a
	ld [wUnownLetter], a
	ret

GetMonFrontpic:
	call GetFrontpic
	jp Load2bppToSRAM

UnusedFrontpicPredef:
	call GetFrontpic
	push hl
	farcall StubbedGetFrontpic
	pop hl
	jp Load2bppToSRAM

GetFrontpic:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	and a
	ret z
	cp NUM_POKEMON + 1
	ret z
	cp EGG + 1
	ret nc

	push de
	call GetBaseData
	ld a, [wBasePicSize]
	and $f
	ld b, a
	push bc
	ld a, BANK(sDecompressBuffer)
	call OpenSRAM

	; These are assumed to be at the same address in their respective banks.
	assert PokemonPicPointers == UnownPicPointers
	ld hl, PokemonPicPointers
	ld a, [wCurPartySpecies]
	ld d, BANK(PokemonPicPointers)
	cp UNOWN
	jr z, .unown
	cp EGG
	jr nz, .not_egg
	ld hl, EggPic
	ld a, BANK(EggPic)
	jr .ok

.unown
	ld a, [wUnownLetter]
	ld d, BANK(UnownPicPointers)

.not_egg
	dec a
	ld bc, 6
	call AddNTimes
	ld a, d
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, d
	call GetFarWord
	pop af

.ok
	ld de, sDecompressBuffer
	call FarDecompress
	pop bc
	ld hl, sDecompressScratch
	ld de, sDecompressBuffer
	call PadFrontpic
	pop hl
	ret

Load2bppToSRAM:
	ld de, sDecompressScratch
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	jp CloseSRAM

GetMonBackpic:
	ld a, [wCurPartySpecies]
	and a
	ret z
	cp NUM_POKEMON + 1
	ret z
	cp EGG + 1
	ret nc

	push de
	ld a, BANK(sDecompressBuffer)
	call OpenSRAM

	; These are assumed to be at the same address in their respective banks.
	assert PokemonPicPointers == UnownPicPointers
	ld hl, PokemonPicPointers
	ld a, [wCurPartySpecies]
	ld d, BANK(PokemonPicPointers)
	cp UNOWN
	jr nz, .ok
	ld a, [wUnownLetter]
	ld d, BANK(UnownPicPointers)
.ok
	dec a
	ld bc, 6
	call AddNTimes
	ld bc, 3
	add hl, bc
	ld a, d
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, d
	call GetFarByte
	push af
	inc hl
	ld a, d
	call GetFarByte
	ld h, a
	pop af
	ld l, a
	ld de, sDecompressBuffer
	pop af
	call FarDecompress
	ld hl, sDecompressBuffer
	ld c, 6 * 6
	call FixBackpicAlignment
	pop hl
	ld de, sDecompressBuffer
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	call CloseSRAM
	ret

FixPicBank:
; Precondition:  a = defined bank for pic
; Postcondition: a = repaired bank for pic
;
; Pic bank values that will get repaired (and what they'll be repaired to):
;     $13 -> BANK("Pics 12")
;     $14 -> BANK("Pics 13")
;     $1f -> BANK("Pics 14")
;
; Otherwise, the repaired bank will match the defined bank.
	push hl
	push bc
	ld b, a
	ld hl, .FixPicBankTable
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	inc hl
	cp b
	jr nz, .loop
	dec hl
	ld b, [hl]

.done
	ld a, b
	pop bc
	pop hl
	ret

.FixPicBankTable:
	db $13, BANK("Pics 12")
	db $14, BANK("Pics 13")
	db $1f, BANK("Pics 14")
	db -1

Intro_GetMonFrontpic:
	ld a, c
	push de
	ld hl, PokemonPicPointers
	dec a
	ld bc, 6
	call AddNTimes
	ld a, BANK(PokemonPicPointers)
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, BANK(PokemonPicPointers)
	call GetFarWord
	pop af
	pop de
	call FarDecompress
	ret

GetTrainerPic:
	ld a, [wTrainerClass]
	and a
	ret z
	cp NUM_TRAINER_CLASSES + 1
	ret nc
	ld a, 0
	call WaitBGMap
	xor a
	ldh [hBGMapMode], a
	ld a, BANK(sDecompressBuffer)
	call OpenSRAM
	push de
	ld hl, TrainerPicPointers
	ld a, [wTrainerClass]
	dec a
	ld bc, 3
	call AddNTimes
	ld a, BANK(TrainerPicPointers)
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, BANK(TrainerPicPointers)
	call GetFarByte
	push af
	inc hl
	ld a, BANK(TrainerPicPointers)
	call GetFarByte
	ld h, a
	pop af
	ld l, a
	ld de, sDecompressBuffer
	pop af
	call FarDecompress
	pop hl
	ld de, sDecompressBuffer
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	call CloseSRAM
	call WaitBGMap
	ld a, 1
	ldh [hBGMapMode], a
	ret

DecompressGet2bpp:
; Decompress lz data from b:hl to sDecompressBuffer, then copy it to address de.

	push de
	push bc
	ld a, BANK(sDecompressBuffer)
	call OpenSRAM
	ld a, b
	ld de, sDecompressBuffer
	call FarDecompress
	pop bc
	ld de, sDecompressBuffer
	pop hl
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	call CloseSRAM
	ret

FixBackpicAlignment:
	push de
	push bc
	ld a, [wBoxAlignment]
	and a
	jr z, .keep_dims
	ld a, c
	cp 7 * 7
	ld de, 7 * 7 tiles
	jr z, .got_dims
	cp 6 * 6
	ld de, 6 * 6 tiles
	jr z, .got_dims
	ld de, 5 * 5 tiles

.got_dims
	ld a, [hl]
	ld b, 0
	ld c, 8
.loop
	rra
	rl b
	dec c
	jr nz, .loop
	ld a, b
	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .got_dims

.keep_dims
	pop bc
	pop de
	ret

PadFrontpic:
; pads frontpic to fill 7x7 box
	ld a, b
	cp 6
	jr z, .six
	cp 5
	jr z, .five

.seven_loop
	ld c, 7 << 4
	call LoadOrientedFrontpic
	dec b
	jr nz, .seven_loop
	ret

.six
	ld c, 7 << 4
	xor a
	call .Fill
.six_loop
	ld c, (7 - 6) << 4
	xor a
	call .Fill
	ld c, 6 << 4
	call LoadOrientedFrontpic
	dec b
	jr nz, .six_loop
	ret

.five
	ld c, 7 << 4
	xor a
	call .Fill
.five_loop
	ld c, (7 - 5) << 4
	xor a
	call .Fill
	ld c, 5 << 4
	call LoadOrientedFrontpic
	dec b
	jr nz, .five_loop
	ld c, 7 << 4
	xor a
	call .Fill
	ret

.Fill:
rept 4
	srl c
endr
.fill_loop
rept 16
	ld [hli], a
endr
	dec c
	jr nz, .fill_loop
	ret

LoadOrientedFrontpic:
	ld a, [wBoxAlignment]
	and a
	jr nz, .x_flip
rept 4
	srl c
endr
.left_loop
rept 16
	ld a, [de]
	inc de
	ld [hli], a
endr
	dec c
	jr nz, .left_loop
	ret

.x_flip
	push bc
.right_loop
	ld a, [de]
	inc de
	ld b, a
	xor a
rept 8
	rr b
	rla
endr
	ld [hli], a
	dec c
	jr nz, .right_loop
	pop bc
	ret
