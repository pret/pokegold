GiveShuckle:
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

ReturnShuckle:
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
