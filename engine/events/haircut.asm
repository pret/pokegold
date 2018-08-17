BillsGrandfather:
	callba Function50000
	jr c, .asm_74e2
	ld a, [wd004]
	ld [wScriptVar], a
	ld [wd151], a
	call GetPokemonName
	jp Function7542

.asm_74e2
	xor a
	ld [wScriptVar], a
	ret

Function74e7:
	ld hl, Data_752d
	jr asm_74f4

Function74ec:
	ld hl, Data_7536
	jr asm_74f4

Function74f1:
	ld hl, Data_753f
asm_74f4
	push hl
	callba Function50000
	pop hl
	jr c, .asm_7522
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .asm_7527
	push hl
	call GetCurNick
	call Function7542
	pop hl
	call Random
.asm_7510
	sub [hl]
	jr c, .asm_7518
	inc hl
	inc hl
	inc hl
	jr .asm_7510

.asm_7518
	inc hl
	ld a, [hli]
	ld [wScriptVar], a
	ld c, [hl]
	call ChangeHappiness
	ret

.asm_7522
	xor a
	ld [wScriptVar], a
	ret

.asm_7527
	ld a, $1
	ld [wScriptVar], a
	ret

Data_752d:
	db $4c, $02, $09
	db $80, $03, $0a
	db $ff, $04, $0b

Data_7536:
	db $9a, $02, $0c
	db $4c, $03, $0d
	db $ff, $04, $0e

Data_753f:
	db $ff, $02, $12

Function7542: ; 7542 (1:7542)
	ld hl, wStringBuffer1
	ld de, wStringBuffer3
	ld bc, MON_NAME_LENGTH
	jp CopyBytes
