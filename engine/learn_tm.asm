CanLearnTMHMMove: ; 11a25 (4:5a25)
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wd138
	push hl
	ld a, [wd14d]
	ld b, a
	ld c, $0
	ld hl, TMMovesList
.asm_11a3b
	ld a, [hli]
	and a
	jr z, .asm_11a52
	cp b
	jr z, .asm_11a45
	inc c
	jr .asm_11a3b

.asm_11a45
	pop hl
	ld b, CHECK_FLAG
	push de
	ld d, $0
	predef FlagPredef
	pop de
	ret

.asm_11a52
	pop hl
	ld c, $0
	ret

GetTMHMMove: ; 11a56 (4:5a56)
	ld a, [wd151]
	dec a
	ld hl, TMMovesList
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wd151], a
	ret

TMMovesList:
	db DYNAMICPUNCH
	db HEADBUTT
	db CURSE
	db ROLLOUT
	db ROAR
	db TOXIC
	db ZAP_CANNON
	db ROCK_SMASH
	db PSYCH_UP
	db HIDDEN_POWER
	db SUNNY_DAY
	db SWEET_SCENT
	db SNORE
	db BLIZZARD
	db HYPER_BEAM
	db ICY_WIND
	db PROTECT
	db RAIN_DANCE
	db GIGA_DRAIN
	db ENDURE
	db FRUSTRATION
	db SOLARBEAM
	db IRON_TAIL
	db DRAGONBREATH
	db THUNDER
	db EARTHQUAKE
	db RETURN
	db DIG
	db PSYCHIC_M
	db SHADOW_BALL
	db MUD_SLAP
	db DOUBLE_TEAM
	db ICE_PUNCH
	db SWAGGER
	db SLEEP_TALK
	db SLUDGE_BOMB
	db SANDSTORM
	db FIRE_BLAST
	db SWIFT
	db DEFENSE_CURL
	db THUNDERPUNCH
	db DREAM_EATER
	db DETECT
	db REST
	db ATTRACT
	db THIEF
	db STEEL_WING
	db FIRE_PUNCH
	db FURY_CUTTER
	db NIGHTMARE
	db CUT
	db FLY
	db SURF
	db STRENGTH
	db FLASH
	db WHIRLPOOL
	db WATERFALL

	db 0
	db 0
	db 0
	db 0
