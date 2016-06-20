GetFirstPokemonHappiness:
	ld hl, wPartyMon1Happiness
	ld bc, $30
	ld de, wPartySpecies
.asm_7275
	ld a, [de]
	cp EGG
	jr nz, .asm_727e
	inc de
	add hl, bc
	jr .asm_7275

.asm_727e
	ld [wd151], a
	ld a, [hl]
	ld [wScriptVar], a
	call GetPokemonName
	jp Function7542

CheckFirstMonIsEgg:
	ld a, [wPartySpecies]
	ld [wd151], a
	cp EGG
	ld a, $1
	jr z, .asm_7298
	xor a
.asm_7298
	ld [wScriptVar], a
	call GetPokemonName
	jp Function7542

ChangeHappiness: ; 72a1 (1:72a1)
	ld a, [wd005]
	inc a
	ld e, a
	ld d, $0
	ld hl, wPartyCount
	add hl, de
	ld a, [hl]
	cp $fd
	ret z
	push bc
	ld hl, wPartyMon1Happiness
	ld bc, $30
	ld a, [wd005]
	call AddNTimes
	pop bc
	ld d, h
	ld e, l
	push de
	ld a, [de]
	cp $64
	ld e, $0
	jr c, .asm_72ce
	inc e
	cp $c8
	jr c, .asm_72ce
	inc e
.asm_72ce
	dec c
	ld b, $0
	ld hl, .Actions
	add hl, bc
	add hl, bc
	add hl, bc
	ld d, $0
	add hl, de
	ld a, [hl]
	cp $64
	pop de
	ld a, [de]
	jr nc, .asm_72e8
	add [hl]
	jr nc, .asm_72ec
	ld a, $ff
	jr .asm_72ec

.asm_72e8
	add [hl]
	jr c, .asm_72ec
	xor a
.asm_72ec
	ld [de], a
	ld a, [wBattleMode]
	and a
	ret z
	ld a, [wd005]
	ld b, a
	ld a, [wcfc9]
	cp b
	ret nz
	ld a, [de]
	ld [wBattleMonHappiness], a
	ret

.Actions:
	db  +5,  +3,  +2 ; Gained a level
	db  +5,  +3,  +2 ; Vitamin
	db  +1,  +1,  +0 ; X Item
	db  +3,  +2,  +1 ; Battled a Gym Leader
	db  +1,  +1,  +0 ; Learned a move
	db  -1,  -1,  -1 ; Lost to an enemy
	db  -5,  -5, -10 ; Fainted due to poison
	db  -5,  -5, -10 ; Lost to a much stronger enemy
	db  +1,  +1,  +1 ; Haircut (Y1)
	db  +3,  +3,  +1 ; Haircut (Y2)
	db  +5,  +5,  +2 ; Haircut (Y3)
	db  +1,  +1,  +1 ; Haircut (O1)
	db  +3,  +3,  +1 ; Haircut (O2)
	db +10, +10,  +4 ; Haircut (O3)
	db  -5,  -5, -10 ; Used Heal Powder or Energypowder (bitter)
	db -10, -10, -15 ; Used Energy Root (bitter)
	db -15, -15, -20 ; Used Revival Herb (bitter)
	db  +3,  +3,  +1 ; Grooming

StepHappiness::
	ld hl, wd9c1
	ld a, [hl]
	inc a
	and $1
	ld [hl], a
	ret nz
	ld de, wPartyCount
	ld a, [de]
	and a
	ret z
	ld c, a
	ld hl, wPartyMon1Happiness
.asm_7349
	inc de
	ld a, [de]
	cp EGG
	jr z, .asm_7354
	inc [hl]
	jr nz, .asm_7354
	ld [hl], $ff
.asm_7354
	push de
	ld de, $30
	add hl, de
	pop de
	dec c
	jr nz, .asm_7349
	ret

DaycareStep::
	ld a, [wDayCareMan]
	bit 0, a
	jr z, .daycare_lady
	ld a, [wdc76]
	cp 100
	jr nc, .daycare_lady
	ld hl, wdc61
	inc [hl]
	jr nz, .daycare_lady
	dec hl
	inc [hl]
	jr nz, .daycare_lady
	dec hl
	inc [hl]
	ld a, [hl]
	cp 5242880 / $10000
	jr c, .daycare_lady
	ld a, 5242880 / $10000
	ld [hl], a
.daycare_lady
	ld a, [wDaycareLady]
	bit 0, a
	jr z, .check_egg
	ld a, [wdcaf]
	cp 100
	jr nc, .check_egg
	ld hl, wdc9a
	inc [hl]
	jr nz, .check_egg
	dec hl
	inc [hl]
	jr nz, .check_egg
	dec hl
	inc [hl]
	ld a, [hl]
	cp 5242880 / $10000
	jr c, .check_egg
	ld a, 5242880 / $10000
	ld [hl], a
.check_egg
	ld hl, wDayCareMan
	bit 5, [hl]
	ret z
	ld hl, wdc78
	dec [hl]
	ret nz
	call Random
	ld [hl], a
	callab Function171d1
	ld a, [wd151]
	cp 230
	ld b, -1 + 32 percent
	jr nc, .okay
	ld a, [wd151]
	cp 170
	ld b, 16 percent
	jr nc, .okay
	ld a, [wd151]
	cp 110
	ld b, 12 percent
	jr nc, .okay
	ld b, 4 percent
.okay
	call Random
	cp b
	ret nc
	ld hl, wDayCareMan
	res 5, [hl]
	set 6, [hl]
	ret
