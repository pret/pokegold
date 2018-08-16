Function73e1:
	xor a
	ld [wMonType], a
	ld a, SHUCKLE
	ld [wd004], a
	ld a, $f
	ld [wCurPartyLevel], a
	predef TryAddMonToParty
	jr nc, .asm_743f
	ld bc, $30
	ld a, [wPokemonData]
	dec a
	push af
	push bc
	ld hl, wPartyMon1Item
	call AddNTimes
	ld [hl], BERRY
	pop bc
	pop af
	ld hl, wPartyMon1ID
	call AddNTimes
	ld a, $2
	ld [hli], a
	ld [hl], $6
	ld a, [wPokemonData]
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld de, ShuckieName
	call CopyName2
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon6StatsEnd
	call SkipNames
	ld de, ManiaName
	call CopyName2
	SetFlag ENGINE_SHUCKLE_GIVEN
	ld a, $1
	ld [wScriptVar], a
	ret

.asm_743f
	xor a
	ld [wScriptVar], a
	ret

ManiaName:
	db "MANIA@"
ShuckieName:
	db "SHUCKIE@"

Function7452:
	callba Function50000
	jr c, .asm_74ba
	ld a, [wd004]
	cp SHUCKLE
	jr nz, .asm_74c0
	ld a, [wd005]
	ld hl, wPartyMon1ID
	ld bc, $30
	call AddNTimes
	ld a, [hli]
	cp $2
	jr nz, .asm_74c0
	ld a, [hl]
	cp $6
	jr nz, .asm_74c0
	ld a, [wd005]
	ld hl, wPartyMonOT
	call SkipNames
	ld de, ManiaName
.asm_7483
	ld a, [de]
	cp [hl]
	jr nz, .asm_74c0
	cp "@"
	jr z, .asm_748f
	inc de
	inc hl
	jr .asm_7483

.asm_748f
	callba CheckCurPartyMonFainted
	jr c, .asm_74c5
	ld a, [wd005]
	ld hl, wPartyMon1Happiness
	ld bc, $30
	call AddNTimes
	ld a, [hl]
	cp $96
	ld a, $3
	jr nc, .asm_74b6
	xor a
	ld [wd008], a
	callab RemoveMonFromPartyOrBox
	ld a, $2
.asm_74b6
	ld [wScriptVar], a
	ret

.asm_74ba
	ld a, $1
	ld [wScriptVar], a
	ret

.asm_74c0
	xor a
	ld [wScriptVar], a
	ret

.asm_74c5
	ld a, $4
	ld [wScriptVar], a
	ret

Function74cb:
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
