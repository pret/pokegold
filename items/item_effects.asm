DoItemEffect_:: ; e7a6 (3:67a6)
	ld a, [wd002]
	ld [wd151], a
	call GetItemName
	call Function317b
	ld a, $1
	ld [wFieldMoveSucceeded], a
	ld a, [wd002]
	dec a
	ld hl, .ItemEffects
	rst JumpTable
	ret

.ItemEffects
	dw MasterBall
	dw UltraBall
	dw Brightpowder
	dw GreatBall
	dw PokeBall
	dw TownMap
	dw Bicycle
	dw MoonStone
	dw Antidote
	dw BurnHeal
	dw IceHeal
	dw Awakening
	dw ParlyzHeal
	dw FullRestore
	dw MaxPotion
	dw HyperPotion
	dw SuperPotion
	dw Potion
	dw EscapeRope
	dw Repel
	dw MaxElixer
	dw FireStone
	dw Thunderstone
	dw WaterStone
	dw Item19
	dw HPUp
	dw Protein
	dw Iron
	dw Carbos
	dw LuckyPunch
	dw Calcium
	dw RareCandy
	dw XAccuracy
	dw LeafStone
	dw MetalPowder
	dw Nugget
	dw PokeDoll
	dw FullHeal
	dw Revive
	dw MaxRevive
	dw GuardSpec
	dw SuperRepel
	dw MaxRepel
	dw DireHit
	dw Item2D
	dw FreshWater
	dw SodaPop
	dw Lemonade
	dw XAttack
	dw Item32
	dw XDefend
	dw XSpeed
	dw XSpecial
	dw CoinCase
	dw Itemfinder
	dw PokeFlute
	dw ExpShare
	dw OldRod
	dw GoodRod
	dw SilverLeaf
	dw SuperRod
	dw PPUp
	dw Ether
	dw MaxEther
	dw Elixer
	dw RedScale
	dw Secretpotion
	dw SSTicket
	dw MysteryEgg
	dw Item47
	dw SilverWing
	dw MoomooMilk
	dw QuickClaw
	dw Psncureberry
	dw GoldLeaf
	dw SoftSand
	dw SharpBeak
	dw Przcureberry
	dw BurntBerry
	dw IceBerry
	dw PoisonBarb
	dw KingsRock
	dw BitterBerry
	dw MintBerry
	dw RedApricorn
	dw Tinymushroom
	dw BigMushroom
	dw Silverpowder
	dw BluApricorn
	dw Item5A
	dw AmuletCoin
	dw YlwApricorn
	dw GrnApricorn
	dw CleanseTag
	dw MysticWater
	dw Twistedspoon
	dw WhtApricorn
	dw Blackbelt
	dw BlkApricorn
	dw Item64
	dw PnkApricorn
	dw Blackglasses
	dw Slowpoketail
	dw PinkBow
	dw Stick
	dw SmokeBall
	dw Nevermeltice
	dw Magnet
	dw Miracleberry
	dw Pearl
	dw BigPearl
	dw Everstone
	dw SpellTag
	dw Ragecandybar
	dw Item73
	dw Item74
	dw MiracleSeed
	dw ThickClub
	dw FocusBand
	dw Item78
	dw Energypowder
	dw EnergyRoot
	dw HealPowder
	dw RevivalHerb
	dw HardStone
	dw LuckyEgg
	dw CardKey
	dw MachinePart
	dw Item81
	dw LostItem
	dw Stardust
	dw StarPiece
	dw BasementKey
	dw Pass
	dw Item87
	dw Item88
	dw Item89
	dw Charcoal
	dw BerryJuice
	dw ScopeLens
	dw Item8D
	dw Item8E
	dw MetalCoat
	dw DragonFang
	dw Item91
	dw Leftovers
	dw Item93
	dw Item94
	dw Item95
	dw Mysteryberry
	dw DragonScale
	dw BerserkGene
	dw Item99
	dw Item9A
	dw Item9B
	dw SacredAsh
	dw HeavyBall
	dw FlowerMail
	dw LevelBall
	dw LureBall
	dw FastBall
	dw ItemA2
	dw LightBall
	dw FriendBall
	dw MoonBall
	dw LoveBall
	dw NormalBox
	dw GorgeousBox
	dw SunStone
	dw PolkadotBow
	dw ItemAB
	dw UpGrade
	dw Berry
	dw GoldBerry
	dw Squirtbottle
	dw ItemB0
	dw ParkBall
	dw RainbowWing
	dw ItemB3

FastBall: ; e926
FriendBall: ; e926
GreatBall: ; e926
HeavyBall: ; e926
LevelBall: ; e926
LoveBall: ; e926
LureBall: ; e926
MasterBall: ; e926
MoonBall: ; e926
ParkBall: ; e926
PokeBall: ; e926
UltraBall: ; e926
	ld a, [wBattleMode]
	dec a
	jp nz, Functionf7e7
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nz, .room_in_party_or_pc
	ld a, $1
	call OpenSRAM
	ld a, [$ad6c]
	cp $14
	call CloseSRAM
	jp z, FailToUseBall
.room_in_party_or_pc
	xor a
	ld [wWildMon], a
	ld a, [wd002]
	cp PARK_BALL
	call nz, ReturnToBattle_UseBall
	ld hl, Options
	res NO_TEXT_SCROLL, [hl]
	ld hl, Text_UsedItem ; $7884
	call PrintText
	ld a, [wd114]
	ld b, a
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jp z, .catch_without_fail
	ld a, [wd002]
	cp MASTER_BALL
	jp z, .catch_without_fail
	ld a, [wd002]
	ld c, a
	ld hl, BallMultiplierFunctionTable ; $6c73
.get_multiplier_loop
	ld a, [hli]
	cp $ff
	jr z, .skip_or_return_from_ball_fn
	cp c
	jr z, .call_ball_function
	inc hl
	inc hl
	jr .get_multiplier_loop

.call_ball_function
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .skip_or_return_from_ball_fn
	push de
	jp [hl]

.skip_or_return_from_ball_fn
	ld a, [wd002]
	cp LEVEL_BALL
	ld a, b
	jp z, .skip_hp_calc
	ld a, b
	ld [hPrintNum4], a
	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld e, [hl]
; (3 * MaxHP - 2 * CurHP) / (3 * MaxHP) * level
	sla c
	rl b
	ld h, d
	ld l, e
	add hl, de
	add hl, de
	ld d, h
	ld e, l
; This routine is buggy.  The intention is to get de, the Max HP score,
; to be an 8-bit number.  To do this, we divide both bc and de by 4.
; It only does this division once, and doesn't check to make sure that
; e is not zero.  In addition to passing along a divide-by-zero error,
; this could also cause an unusually small denominator to be passed,
; sending the resulting catch rate through the floor.
	ld a, d
	and a
	jr z, .okay_hp_div
	srl d
	rr e
	srl d
	rr e
	srl b
	rr c
	srl b
	rr c
	ld a, c
	and a
	jr nz, .okay_hp_div
	ld c, $1
.okay_hp_div
	ld b, e
	push bc
	ld a, b
	sub c
	ld [hRemainder], a
	xor a
	ld [hDividend], a
	ld [hQuotient], a
	ld [hStringCmpString2], a
	call Multiply
	pop bc
	ld a, b
	ld [hRemainder], a
	ld b, $4
	call Divide
	ld a, [hPrintNum4]
	and a
	jr nz, .statuscheck
	ld a, $1
.statuscheck
; This routine is buggy. It was intended that SLP and FRZ provide a higher
; catch rate than BRN/PSN/PAR, which in turn provide a higher catch rate than
; no status effect at all. But instead, it makes BRN/PSN/PAR provide no
; benefit.
; Uncomment the line below to fix this.
	ld b, a
	ld a, [wEnemyMonStatus]
	and 1 << FRZ | SLP
	ld c, $a
	jr nz, .add_status
	; ld a, [wEnemyMonStatus]
	and a
	ld c, $5
	jr nz, .add_status
	ld c, $0
.add_status
	ld a, b
	add c
	jr nc, .max_catch_rate
	ld a, $ff
.max_catch_rate
	ld d, a
	push de

	; BUG: callba overwrites a,
	; and GetItemHeldEffect takes b anyway.

	; This is probably the reason
	; the HELD_CATCH_CHANCE effect
	; is never used.

	; Uncomment the line below to fix.

	ld a, [wBattleMonItem]
	; ld b, a
	callba GetItemHeldEffect ; d:7e9b
	ld a, b
	cp HELD_CATCH_CHANCE
	pop de
	ld a, d
	jr nz, .skip_hp_calc
	add c
	jr nc, .skip_hp_calc
	ld a, $ff
.skip_hp_calc
	ld b, a
	ld [wCurHPAnimMaxHP], a
	call Random
	cp b
	ld a, $0
	jr z, .catch_without_fail
	jr nc, .asm_ea23
.catch_without_fail
	ld a, [wEnemyMonSpecies]
.asm_ea23
	ld [wWildMon], a
	ld c, 20
	call DelayFrames
	ld a, [wd002]
	cp POKE_BALL + 1
	jr c, .asm_ea34
	ld a, $5
.asm_ea34
	ld [wcb67], a
	ld de, ANIM_THROW_POKE_BALL
	ld a, e
	ld [wcf3e], a
	ld a, d
	ld [wcf3f], a
	xor a
	ld [hBattleTurn], a
	ld [wBuffer2], a
	ld [wcf46], a
	predef PlayBattleAnim
	ld a, [wWildMon]
	and a
	jr nz, .caught
	ld a, [wBuffer2]
	cp $1
	ld hl, Text_ThePokemonBrokeFree ; $6e09
	jp z, .break_free
	cp $2
	ld hl, Text_AppearedToBeCaught ; $6e0e
	jp z, .break_free
	cp $3
	ld hl, Text_AarghAlmostHadIt ; $6e13
	jp z, .break_free
	cp $4
	ld hl, Text_ShootItWasSoCloseToo ; $6e18
	jp z, .break_free
.caught
	ld hl, wEnemyMonStatus
	ld a, [hli]
	push af
	inc hl
	ld a, [hli]
	push af
	ld a, [hl]
	push af
	push hl
	ld hl, wEnemyMonItem
	ld a, [hl]
	push af
	push hl
	ld hl, wEnemySubStatus5
	ld a, [hl]
	push af
	set SUBSTATUS_TRANSFORMED, [hl]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .ditto
	jr .not_ditto

.ditto
	ld a, DITTO
	ld [wTempEnemyMonSpecies], a
	jr .load_data

.not_ditto
	set SUBSTATUS_TRANSFORMED, [hl]
	ld hl, wcbd0
	ld a, [wEnemyMonDVs]
	ld [hli], a
	ld a, [wEnemyMonMovesEnd + 1]
	ld [hl], a
.load_data
	ld a, [wTempEnemyMonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wEnemyMonLevel]
	ld [wCurPartyLevel], a
	callba LoadEnemyMon
	pop af
	ld [wEnemySubStatus5], a
	pop hl
	pop af
	ld [hl], a
	pop hl
	pop af
	ld [hld], a
	pop af
	ld [hld], a
	dec hl
	pop af
	ld [hl], a
	ld hl, wEnemySubStatus5
	bit SUBSTATUS_TRANSFORMED, [hl]
	jr nz, .transformed
	ld hl, wWildMonMoves
	ld de, wEnemyMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	ld hl, wWildMonPP
	ld de, wEnemyMonPP
	ld bc, NUM_MOVES
	call CopyBytes
.transformed
	ld a, [wEnemyMonSpecies]
	ld [wWildMon], a
	ld [wd004], a
	ld [wd151], a
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jp z, .finish_tutorial
	ld hl, Text_GotchaMonWasCaught ; $6e1d
	call PrintText
	call ClearSprites
	ld a, [wd151]
	dec a
	call CheckCaughtMon
	ld a, c
	push af
	ld a, [wd151]
	dec a
	call SetSeenAndCaughtMon
	pop af
	and a
	jr nz, .skip_dex
	call CheckReceivedDex
	jr z, .skip_dex
	ld hl, Text_MonNewlyAddedToPokedex ; $6e44
	call PrintText
	call ClearSprites
	ld a, [wEnemyMonSpecies]
	ld [wd151], a
	predef NewPokedexEntry
.skip_dex
	ld a, [wBattleType]
	cp BATTLETYPE_CONTEST
	jp z, .catch_bug_contest_mon
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr z, .send_mon_to_pc
	xor a
	ld [wMonType], a
	call ClearSprites
	predef TryAddMonToParty
	ld a, [wd002]
	cp FRIEND_BALL
	jr nz, .skip_party_mon_friend_ball
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, FRIEND_BALL_HAPPINESS
	ld [hl], a
.skip_party_mon_friend_ball
	ld hl, Text_AskNicknameNewlyCaughtMon ; $6e49
	call PrintText
	ld a, [wCurPartySpecies]
	ld [wd151], a
	call GetPokemonName
	call YesNoBox
	jp c, .end_ball_function
	ld a, [wPartyCount]
	dec a
	ld [wd005], a
	ld hl, wPartyMon1Nickname
	ld bc, PKMN_NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	push de
	xor a
	ld [wMonType], a
	ld b, $0
	callba NamingScreen
	call RotateThreePalettesRight
	call Functiond9e
	pop hl
	ld de, wStringBuffer1
	call InitName
	jp .end_ball_function

.send_mon_to_pc
	call ClearSprites
	predef SentPkmnIntoBox
	ld a, BANK(sBoxCount)
	call OpenSRAM
	ld a, [sBoxCount]
	cp MONS_PER_BOX
	jr nz, .not_full_yet
	ld hl, wBattleResult
	set 7, [hl]
.not_full_yet
	ld a, [wd002]
	cp FRIEND_BALL
	jr nz, .skip_box_mon_friend_ball
	ld a, FRIEND_BALL_HAPPINESS
	ld [sBoxMon1Happiness], a
.skip_box_mon_friend_ball
	call CloseSRAM
	ld hl, Text_AskNicknameNewlyCaughtMon ; $6e49
	call PrintText
	ld a, [wd004]
	ld [wd151], a
	call GetPokemonName
	call YesNoBox
	jr c, .init_name_in_sram
	xor a
	ld [wd005], a
	ld a, $2
	ld [wMonType], a
	ld de, wMonOrItemNameBuffer
	ld b, $0
	callba NamingScreen
	ld a, $1
	call OpenSRAM
	ld hl, wMonOrItemNameBuffer
	ld de, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld hl, sBoxMonNicknames
	ld de, wStringBuffer1
	call InitName
	call CloseSRAM
.init_name_in_sram
	ld a, $1
	call OpenSRAM
	ld hl, sBoxMonNicknames
	ld de, wMonOrItemNameBuffer
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call CloseSRAM
	ld hl, Text_SentToBillsPC ; $6e3f
	call PrintText
	call RotateThreePalettesRight
	call Functiond9e
	jr .end_ball_function

.catch_bug_contest_mon
	callba BugContest_SetCaughtContestMon ; same bank
	jr .end_ball_function

.finish_tutorial
	ld hl, Text_GotchaMonWasCaught ; $6e1d
.break_free
	call PrintText
	call ClearSprites
.end_ball_function
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	ret z
	cp BATTLETYPE_DEBUG
	ret z
	cp BATTLETYPE_CONTEST
	jr z, .used_park_ball
	ld a, [wWildMon]
	and a
	jr z, .toss
	call ClearBGPalettes
	call ClearTileMap
.toss
	ld hl, wNumItems
	inc a
	ld [wd009], a
	jp TossItem

.used_park_ball
	ld hl, wParkBalls
	dec [hl]
	ret

BallMultiplierFunctionTable: ; ec73
	dbw ULTRA_BALL,  UltraBallMultiplier
	dbw GREAT_BALL,  GreatBallMultiplier
	dbw SAFARI_BALL, SafariBallMultiplier ; Safari Ball, leftover from RBY
	dbw HEAVY_BALL,  HeavyBallMultiplier
	dbw LEVEL_BALL,  LevelBallMultiplier
	dbw LURE_BALL,   LureBallMultiplier
	dbw FAST_BALL,   FastBallMultiplier
	dbw MOON_BALL,   MoonBallMultiplier
	dbw LOVE_BALL,   LoveBallMultiplier
	dbw PARK_BALL,   ParkBallMultiplier
	db $ff

UltraBallMultiplier:
	sla b
	ret nc
	ld b, $ff
	ret

GreatBallMultiplier:
SafariBallMultiplier:
ParkBallMultiplier:
	ld a, b
	srl a
	add b
	ld b, a
	ret nc
	ld b, $ff
	ret

HeavyBallMultiplier:
	ld a, [wEnemyMon]
	dec a
	ld hl, PokedexDataPointerTable
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	rlca
	rlca
	and $3
	add BANK(PokedexEntries1) ; $68
	ld d, a
	ld a, BANK(PokedexDataPointerTable)
	call GetFarHalfword
.loop
	ld a, d
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop
	ld a, d
	push bc
	inc hl
	inc hl
	call GetFarHalfword
	srl h
	rr l
	ld b, h
	ld c, l
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	call .sub_bc
	srl b
	rr c
	call .sub_bc
	ld a, h
	pop bc
	jr .compare

.sub_bc
	push bc
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	add hl, bc
	pop bc
	ret

.compare
	ld c, a
	cp 1024 >> 8 ; 102.4 kg
	jr c, .lightmon
	ld hl, .WeightsTable ; $6d18
.lookup
	ld a, c
	cp [hl]
	jr c, .heavymon
	inc hl
	inc hl
	jr .lookup

.heavymon
	inc hl
	ld a, b
	add [hl]
	ld b, a
	ret nc
	ld b, $ff
	ret

.lightmon
	ld a, b
	sub 20
	ld b, a
	ret nc
	ld b, $1
	ret

.WeightsTable
; weight factor, boost
	db 2048 >> 8, 0
	db 3072 >> 8, 20
	db 4096 >> 8, 30
	db 65280 >> 8, 40

LureBallMultiplier:
	ld a, [wBattleType]
	cp BATTLETYPE_FISH
	ret nz
	ld a, b
	add a
	jr c, .asm_ed2d
	add b
	jr nc, .asm_ed2f
.asm_ed2d
	ld a, $ff
.asm_ed2f
	ld b, a
	ret

MoonBallMultiplier:
; This function is buggy.
; Intent:  multiply catch rate by 4 if mon evolves with moon stone
; Reality: no boost
	push bc
	ld a, [wTempEnemyMonSpecies]
	dec a
	ld c, a
	ld b, $0
	ld hl, EvosAttacksPointers ; $67bd
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers) ; $10
	call GetFarHalfword
	pop bc
	push bc
	ld a, BANK(EvosAttacksPointers) ; $10
	call GetFarByte
	cp EVOLVE_ITEM
	pop bc
	ret nz
	inc hl
	inc hl
	inc hl
; Moon Stone's constant from Pokémon Red is used.
; No Pokémon evolve with Burn Heal,
; so Moon Balls always have a catch rate of 1×.
	push bc
	ld a, BANK(EvosAttacksPointers) ; $10
	call GetFarByte
	cp MOON_STONE_RED ; BURN_HEAL
	pop bc
	ret nz
	sla b
	jr c, .max
	sla b
	jr nc, .done
.max
	ld b, $ff
.done
	ret

LoveBallMultiplier:
; This function is buggy.
; Intent:  multiply catch rate by 8 if mons are of same species, different sex
; Reality: multiply catch rate by 8 if mons are of same species, same sex
	ld a, [wTempEnemyMonSpecies]
	ld c, a
	ld a, [wd0ee]
	cp c
	ret nz
	push bc
	ld a, [wd0ee]
	ld [wCurPartySpecies], a
	xor a
	ld [wMonType], a
	ld a, [wCurBattleMon]
	ld [wd005], a
	callba GetGender ; 14:52f1
	jr c, .asm_edba
	ld d, $0
	jr nz, .asm_ed8d
	inc d
.asm_ed8d
	push de
	ld a, [wTempEnemyMonSpecies]
	ld [wd004], a
	ld a, $4
	ld [wMonType], a
	callba GetGender ; 14:52f1
	jr c, .asm_edb9
	ld d, $0
	jr nz, .asm_eda6
	inc d
.asm_eda6
	ld a, d
	pop de
	cp d
	pop bc
	ret nz ; for the intended effect, this should be “ret z”
	sla b
	jr c, .asm_edb6
	sla b
	jr c, .asm_edb6
	sla b
	ret nc
.asm_edb6
	ld b, $ff
	ret

.asm_edb9
	pop de
.asm_edba
	pop bc
	ret

FastBallMultiplier:
; This function is buggy.
; Intent:  multiply catch rate by 4 if enemy mon is in one of the three
;          FleeMons tables.
; Reality: multiply catch rate by 4 if enemy mon is one of the first three in
;          the first FleeMons table.
	ld a, [wTempEnemyMonSpecies]
	ld c, a
	ld hl, FleeMons
	ld d, $3
.asm_edc5
	ld a, BANK(FleeMons)
	call GetFarByte
	inc hl
	cp $ff
	jr z, .asm_eddc
	cp c
	jr nz, .asm_eddc ; for the intended effect, this should be “jr nz, .loop”
	sla b
	jr c, .asm_edd9
	sla b
	ret nc
.asm_edd9
	ld b, $ff
	ret

.asm_eddc
	dec d
	jr nz, .asm_edc5
	ret

LevelBallMultiplier:
; multiply catch rate by 8 if player mon level / 4 > enemy mon level
; multiply catch rate by 4 if player mon level / 2 > enemy mon level
; multiply catch rate by 2 if player mon level > enemy mon level
	ld a, [wBattleMonLevel]
	ld c, a
	ld a, [wEnemyMonLevel]
	cp c
	ret nc
	sla b
	jr c, .asm_edfc
	srl c
	cp c
	ret nc
	sla b
	jr c, .asm_edfc
	srl c
	cp c
	ret nc
	sla b
	ret nc
.asm_edfc
	ld b, $ff
	ret

; These two texts were carried over from gen 1.
; They are not used in gen 2, and are dummied out.

Text_ThisMonCantBeCaught:
	text_jump Text_ThisMonCantBeCaught_
	db "@"

Text_YouMissedThePokemon:
	text_jump Text_YouMissedThePokemon_
	db "@"

Text_ThePokemonBrokeFree:
	text_jump Text_ThePokemonBrokeFree_
	db "@"

Text_AppearedToBeCaught:
	text_jump Text_AppearedToBeCaught_
	db "@"

Text_AarghAlmostHadIt:
	text_jump Text_AarghAlmostHadIt_
	db "@"

Text_ShootItWasSoCloseToo:
	text_jump Text_ShootItWasSoCloseToo_
	db "@"

Text_GotchaMonWasCaught:
	text_jump Text_GotchaMonWasCaught_
	start_asm
	call WaitSFX
	push bc
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_CAPTURE
	call PlayMusic
	pop bc
	ld hl, Text_CaughtMonWaitbutton
	ret

Text_CaughtMonWaitbutton:
	text_jump Text_CaughtMonWaitbutton_
	db "@"

Text_SentToBillsPC:
	text_jump Text_SentToBillsPC_
	db "@"

Text_MonNewlyAddedToPokedex:
	text_jump Text_MonNewlyAddedToPokedex_
	db "@"

Text_AskNicknameNewlyCaughtMon:
	text_jump Text_AskNicknameNewlyCaughtMon_
	db "@"

ReturnToBattle_UseBall: ; ee4e (3:6e4e)
	callba ReturnToBattle_UseBall_ ; 9:7307
	ret

IF DEF(GOLD)
TownMap: ; ee55
	dr $ee55, $ee5c

Bicycle: ; ee5c
	dr $ee5c, $ee63

FireStone: ; ee63
LeafStone: ; ee63
MoonStone: ; ee63
SunStone: ; ee63
Thunderstone: ; ee63
WaterStone: ; ee63
	dr $ee63, $ee91

Calcium: ; ee91
Carbos: ; ee91
HPUp: ; ee91
Iron: ; ee91
Protein: ; ee91
	dr $ee91, $ef68

RareCandy: ; ef68
	dr $ef68, $f003

HealPowder: ; f003
	dr $f003, $f022

Antidote: ; f022
Awakening: ; f022
BurnHeal: ; f022
BurntBerry: ; f022
FullHeal: ; f022
IceBerry: ; f022
IceHeal: ; f022
MintBerry: ; f022
Miracleberry: ; f022
ParlyzHeal: ; f022
Przcureberry: ; f022
Psncureberry: ; f022
	dr $f022, $f0ff

RevivalHerb: ; f0ff
	dr $f0ff, $f11e

MaxRevive: ; f11e
Revive: ; f11e
	dr $f11e, $f17e

FullRestore: ; f17e
	dr $f17e, $f1c0

BitterBerry: ; f1c0
	dr $f1c0, $f1dc

Berry: ; f1dc
BerryJuice: ; f1dc
FreshWater: ; f1dc
GoldBerry: ; f1dc
HyperPotion: ; f1dc
Lemonade: ; f1dc
MaxPotion: ; f1dc
MoomooMilk: ; f1dc
Potion: ; f1dc
Ragecandybar: ; f1dc
SodaPop: ; f1dc
SuperPotion: ; f1dc
	dr $f1dc, $f1e2

Energypowder: ; f1e2
	dr $f1e2, $f1e6

EnergyRoot: ; f1e6
	dr $f1e6, $f4a5

EscapeRope: ; f4a5
	dr $f4a5, $f4b8

SuperRepel: ; f4b8
	dr $f4b8, $f4bc

MaxRepel: ; f4bc
	dr $f4bc, $f4c0

Repel: ; f4c0
	dr $f4c0, $f4d8

XAccuracy: ; f4d8
	dr $f4d8, $f4e5

PokeDoll: ; f4e5
	dr $f4e5, $f4fb

GuardSpec: ; f4fb
	dr $f4fb, $f508

DireHit: ; f508
	dr $f508, $f515

XAttack: ; f515
XDefend: ; f515
XSpecial: ; f515
XSpeed: ; f515
	dr $f515, $f55c

PokeFlute: ; f55c
	dr $f55c, $f5e1

CoinCase: ; f5e1
	dr $f5e1, $f5ec

OldRod: ; f5ec
	dr $f5ec, $f5f0

GoodRod: ; f5f0
	dr $f5f0, $f5f4

SuperRod: ; f5f4
	dr $f5f4, $f5ff

Itemfinder: ; f5ff
	dr $f5ff, $f606

Elixer: ; f606
Ether: ; f606
MaxElixer: ; f606
MaxEther: ; f606
Mysteryberry: ; f606
PPUp: ; f606
	dr $f606, $f785

Squirtbottle: ; f785
	dr $f785, $f78c

CardKey: ; f78c
	dr $f78c, $f793

BasementKey: ; f793
	dr $f793, $f79a

SacredAsh: ; f79a
	dr $f79a, $f7aa

NormalBox: ; f7aa
	dr $f7aa, $f7ae

GorgeousBox: ; f7ae
	dr $f7ae, $f7c4

AmuletCoin: ; f7c4
BerserkGene: ; f7c4
BigMushroom: ; f7c4
BigPearl: ; f7c4
Blackbelt: ; f7c4
Blackglasses: ; f7c4
BlkApricorn: ; f7c4
BluApricorn: ; f7c4
Brightpowder: ; f7c4
Charcoal: ; f7c4
CleanseTag: ; f7c4
DragonFang: ; f7c4
DragonScale: ; f7c4
Everstone: ; f7c4
ExpShare: ; f7c4
FlowerMail: ; f7c4
FocusBand: ; f7c4
GoldLeaf: ; f7c4
GrnApricorn: ; f7c4
HardStone: ; f7c4
Item19: ; f7c4
Item2D: ; f7c4
Item32: ; f7c4
Item47: ; f7c4
Item5A: ; f7c4
Item64: ; f7c4
Item73: ; f7c4
Item74: ; f7c4
Item78: ; f7c4
Item81: ; f7c4
Item87: ; f7c4
Item88: ; f7c4
Item89: ; f7c4
Item8D: ; f7c4
Item8E: ; f7c4
Item91: ; f7c4
Item93: ; f7c4
Item94: ; f7c4
Item95: ; f7c4
Item99: ; f7c4
Item9A: ; f7c4
Item9B: ; f7c4
ItemA2: ; f7c4
ItemAB: ; f7c4
ItemB0: ; f7c4
ItemB3: ; f7c4
KingsRock: ; f7c4
Leftovers: ; f7c4
LightBall: ; f7c4
LostItem: ; f7c4
LuckyEgg: ; f7c4
LuckyPunch: ; f7c4
MachinePart: ; f7c4
Magnet: ; f7c4
MetalCoat: ; f7c4
MetalPowder: ; f7c4
MiracleSeed: ; f7c4
MysteryEgg: ; f7c4
MysticWater: ; f7c4
Nevermeltice: ; f7c4
Nugget: ; f7c4
Pass: ; f7c4
Pearl: ; f7c4
PinkBow: ; f7c4
PnkApricorn: ; f7c4
PoisonBarb: ; f7c4
PolkadotBow: ; f7c4
QuickClaw: ; f7c4
RainbowWing: ; f7c4
RedApricorn: ; f7c4
RedScale: ; f7c4
SSTicket: ; f7c4
ScopeLens: ; f7c4
Secretpotion: ; f7c4
SharpBeak: ; f7c4
SilverLeaf: ; f7c4
SilverWing: ; f7c4
Silverpowder: ; f7c4
Slowpoketail: ; f7c4
SmokeBall: ; f7c4
SoftSand: ; f7c4
SpellTag: ; f7c4
StarPiece: ; f7c4
Stardust: ; f7c4
Stick: ; f7c4
ThickClub: ; f7c4
Tinymushroom: ; f7c4
Twistedspoon: ; f7c4
UpGrade: ; f7c4
WhtApricorn: ; f7c4
YlwApricorn: ; f7c4
	dr $f7c4, $f7e7

Functionf7e7:
	dr $f7e7, $f823

FailToUseBall:
	dr $f823, $f884

Text_UsedItem:
	dr $f884, $f900
ENDC

IF DEF(SILVER)
TownMap ; ee53
	dr $ee53, $ee5a

Bicycle ; ee5a
	dr $ee5a, $ee61

FireStone ; ee61
LeafStone ; ee61
MoonStone ; ee61
SunStone ; ee61
Thunderstone ; ee61
WaterStone ; ee61
	dr $ee61, $ee8f

Calcium ; ee8f
Carbos ; ee8f
HPUp ; ee8f
Iron ; ee8f
Protein ; ee8f
	dr $ee8f, $ef66

RareCandy ; ef66
	dr $ef66, $f001

HealPowder ; f001
	dr $f001, $f020

Antidote ; f020
Awakening ; f020
BurnHeal ; f020
BurntBerry ; f020
FullHeal ; f020
IceBerry ; f020
IceHeal ; f020
MintBerry ; f020
Miracleberry ; f020
ParlyzHeal ; f020
Przcureberry ; f020
Psncureberry ; f020
	dr $f020, $f0fd

RevivalHerb ; f0fd
	dr $f0fd, $f11c

MaxRevive ; f11c
Revive ; f11c
	dr $f11c, $f17c

FullRestore ; f17c
	dr $f17c, $f1be

BitterBerry ; f1be
	dr $f1be, $f1da

Berry ; f1da
BerryJuice ; f1da
FreshWater ; f1da
GoldBerry ; f1da
HyperPotion ; f1da
Lemonade ; f1da
MaxPotion ; f1da
MoomooMilk ; f1da
Potion ; f1da
Ragecandybar ; f1da
SodaPop ; f1da
SuperPotion ; f1da
	dr $f1da, $f1e0

Energypowder ; f1e0
	dr $f1e0, $f1e4

EnergyRoot ; f1e4
	dr $f1e4, $f4a3

EscapeRope ; f4a3
	dr $f4a3, $f4b6

SuperRepel ; f4b6
	dr $f4b6, $f4ba

MaxRepel ; f4ba
	dr $f4ba, $f4be

Repel ; f4be
	dr $f4be, $f4d6

XAccuracy ; f4d6
	dr $f4d6, $f4e3

PokeDoll ; f4e3
	dr $f4e3, $f4f9

GuardSpec ; f4f9
	dr $f4f9, $f506

DireHit ; f506
	dr $f506, $f513

XAttack ; f513
XDefend ; f513
XSpecial ; f513
XSpeed ; f513
	dr $f513, $f55a

PokeFlute ; f55a
	dr $f55a, $f5df

CoinCase ; f5df
	dr $f5df, $f5ea

OldRod ; f5ea
	dr $f5ea, $f5ee

GoodRod ; f5ee
	dr $f5ee, $f5f2

SuperRod ; f5f2
	dr $f5f2, $f5fd

Itemfinder ; f5fd
	dr $f5fd, $f604

Elixer ; f604
Ether ; f604
MaxElixer ; f604
MaxEther ; f604
Mysteryberry ; f604
PPUp ; f604
	dr $f604, $f783

Squirtbottle ; f783
	dr $f783, $f78a

CardKey ; f78a
	dr $f78a, $f791

BasementKey ; f791
	dr $f791, $f798

SacredAsh ; f798
	dr $f798, $f7a8

NormalBox ; f7a8
	dr $f7a8, $f7ac

GorgeousBox ; f7ac
	dr $f7ac, $f7c2

AmuletCoin ; f7c2
BerserkGene ; f7c2
BigMushroom ; f7c2
BigPearl ; f7c2
Blackbelt ; f7c2
Blackglasses ; f7c2
BlkApricorn ; f7c2
BluApricorn ; f7c2
Brightpowder ; f7c2
Charcoal ; f7c2
CleanseTag ; f7c2
DragonFang ; f7c2
DragonScale ; f7c2
Everstone ; f7c2
ExpShare ; f7c2
FlowerMail ; f7c2
FocusBand ; f7c2
GoldLeaf ; f7c2
GrnApricorn ; f7c2
HardStone ; f7c2
Item19 ; f7c2
Item2D ; f7c2
Item32 ; f7c2
Item47 ; f7c2
Item5A ; f7c2
Item64 ; f7c2
Item73 ; f7c2
Item74 ; f7c2
Item78 ; f7c2
Item81 ; f7c2
Item87 ; f7c2
Item88 ; f7c2
Item89 ; f7c2
Item8D ; f7c2
Item8E ; f7c2
Item91 ; f7c2
Item93 ; f7c2
Item94 ; f7c2
Item95 ; f7c2
Item99 ; f7c2
Item9A ; f7c2
Item9B ; f7c2
ItemA2 ; f7c2
ItemAB ; f7c2
ItemB0 ; f7c2
ItemB3 ; f7c2
KingsRock ; f7c2
Leftovers ; f7c2
LightBall ; f7c2
LostItem ; f7c2
LuckyEgg ; f7c2
LuckyPunch ; f7c2
MachinePart ; f7c2
Magnet ; f7c2
MetalCoat ; f7c2
MetalPowder ; f7c2
MiracleSeed ; f7c2
MysteryEgg ; f7c2
MysticWater ; f7c2
Nevermeltice ; f7c2
Nugget ; f7c2
Pass ; f7c2
Pearl ; f7c2
PinkBow ; f7c2
PnkApricorn ; f7c2
PoisonBarb ; f7c2
PolkadotBow ; f7c2
QuickClaw ; f7c2
RainbowWing ; f7c2
RedApricorn ; f7c2
RedScale ; f7c2
SSTicket ; f7c2
ScopeLens ; f7c2
Secretpotion ; f7c2
SharpBeak ; f7c2
SilverLeaf ; f7c2
SilverWing ; f7c2
Silverpowder ; f7c2
Slowpoketail ; f7c2
SmokeBall ; f7c2
SoftSand ; f7c2
SpellTag ; f7c2
StarPiece ; f7c2
Stardust ; f7c2
Stick ; f7c2
ThickClub ; f7c2
Tinymushroom ; f7c2
Twistedspoon ; f7c2
UpGrade ; f7c2
WhtApricorn ; f7c2
YlwApricorn ; f7c2
	dr $f7c2, $f7e5

Functionf7e7:
	dr $f7e5, $f821

FailToUseBall:
	dr $f821, $f882

Text_UsedItem:
	dr $f882, $f8fe
ENDC
