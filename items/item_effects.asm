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
	ld hl, wOptions
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
	jp hl

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

	; BUG: farcall overwrites a,
	; and GetItemHeldEffect takes b anyway.

	; This is probably the reason
	; the HELD_CATCH_CHANCE effect
	; is never used.

	; Uncomment the line below to fix.

	ld a, [wBattleMonItem]
	; ld b, a
	farcall GetItemHeldEffect ; d:7e9b
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
	farcall LoadEnemyMon
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
	ld [wCurPartySpecies], a
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
	ld [wCurPartyMon], a
	ld hl, wPartyMon1Nickname
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	push de
	xor a
	ld [wMonType], a
	ld b, $0
	farcall NamingScreen
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
	ld a, [wCurPartySpecies]
	ld [wd151], a
	call GetPokemonName
	call YesNoBox
	jr c, .init_name_in_sram
	xor a
	ld [wCurPartyMon], a
	ld a, $2
	ld [wMonType], a
	ld de, wMonOrItemNameBuffer
	ld b, $0
	farcall NamingScreen
	ld a, $1
	call OpenSRAM
	ld hl, wMonOrItemNameBuffer
	ld de, sBoxMonNicknames
	ld bc, MON_NAME_LENGTH
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
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	call CloseSRAM
	ld hl, Text_SentToBillsPC ; $6e3f
	call PrintText
	call RotateThreePalettesRight
	call Functiond9e
	jr .end_ball_function

.catch_bug_contest_mon
	farcall BugContest_SetCaughtContestMon ; same bank
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
	ld [wItemQuantityChangeBuffer], a
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
	add BANK("Pokedex Entries 001-064")
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
	ld [wCurPartyMon], a
	farcall GetGender ; 14:52f1
	jr c, .asm_edba
	ld d, $0
	jr nz, .asm_ed8d
	inc d
.asm_ed8d
	push de
	ld a, [wTempEnemyMonSpecies]
	ld [wCurPartySpecies], a
	ld a, $4
	ld [wMonType], a
	farcall GetGender ; 14:52f1
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
	text_far Text_ThisMonCantBeCaught_
	db "@"

Text_YouMissedThePokemon:
	text_far Text_YouMissedThePokemon_
	db "@"

Text_ThePokemonBrokeFree:
	text_far Text_ThePokemonBrokeFree_
	db "@"

Text_AppearedToBeCaught:
	text_far Text_AppearedToBeCaught_
	db "@"

Text_AarghAlmostHadIt:
	text_far Text_AarghAlmostHadIt_
	db "@"

Text_ShootItWasSoCloseToo:
	text_far Text_ShootItWasSoCloseToo_
	db "@"

Text_GotchaMonWasCaught:
	text_far Text_GotchaMonWasCaught_
	text_asm
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
	text_far Text_Promptbutton_2
	db "@"

Text_SentToBillsPC:
	text_far Text_SentToBillsPC_
	db "@"

Text_MonNewlyAddedToPokedex:
	text_far Text_MonNewlyAddedToPokedex_
	db "@"

Text_AskNicknameNewlyCaughtMon:
	text_far Text_AskNicknameNewlyCaughtMon_
	db "@"

ReturnToBattle_UseBall: ; ee4e (3:6e4e)
	farcall ReturnToBattle_UseBall_ ; 9:7307
	ret

TownMap: ; ee55 (3:6e55)
	farcall TownMap_ ; 24:5a4f
	ret

Bicycle: ; ee5c
	farcall BicycleFunction ; same bank
	ret

FireStone: ; ee63
LeafStone: ; ee63
MoonStone: ; ee63
SunStone: ; ee63
Thunderstone: ; ee63
WaterStone: ; ee63
	ld b, PARTYMENUACTION_EVO_STONE
	call Functionf24f
	jp c, .cancel
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld a, [hl]
	cp EVERSTONE
	jr z, .failed
	ld a, $1
	ld [wd0d2], a
	farcall EvolvePokemon ; 10:61db
	ld a, [wd154]
	and a
	jr z, .failed
	jp Functionf7dc

.failed
	call Functionf839
.cancel
	xor a
	ld [wFieldMoveSucceeded], a
	ret


Calcium: ; ee91
Carbos: ; ee91
HPUp: ; ee91
Iron: ; ee91
Protein: ; ee91
	ld b, PARTYMENUACTION_HEALING_ITEM
	call Functionf24f
	jp c, Functioneef3
	call Functionef49
	call Functionef2d
	ld a, MON_STAT_EXP
	call GetPartyParamLocation
	add hl, bc
	ld a, [hl]
	cp 100
	jr nc, Functioneed7
	add 10
	ld [hl], a
	call Functioneee0
	call Functionef2d
	ld hl, StatStrings
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer2
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	call Functionf7c7
	ld hl, Text_StatRoseFromVitamin ; $6efa
	call PrintText
	ld c, HAPPINESS_USEDITEM
	farcall ChangeHappiness
	jp Functionf7dc

Functioneed7:
	ld hl, Text_WontHaveAnyEffect ; $7866
	call PrintText
	jp ClearPalettes

Functioneee0: ; eee0 (3:6ee0)
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, MON_STAT_EXP - 1
	call GetPartyParamLocation
	ld b, $1
	predef_jump CalcPkmnStats

Functioneef3: ; eef3 (3:6ef3)
	xor a
	ld [wFieldMoveSucceeded], a
	jp ClearPalettes

Text_StatRoseFromVitamin:
	text_far Text_StatRoseFromVitamin_
	db "@"

StatStrings:
	dw .health
	dw .attack
	dw .defense
	dw .speed
	dw .special

.health  db "HEALTH@"
.attack  db "ATTACK@"
.defense db "DEFENSE@"
.speed   db "SPEED@"
.special db "SPECIAL@"

Functionef2d: ; ef2d (3:6f2d)
	ld a, [wd002]
	ld hl, StatOffsets
.asm_ef33
	cp [hl]
	inc hl
	jr z, .asm_ef3a
	inc hl
	jr .asm_ef33

.asm_ef3a
	ld a, [hl]
	ld c, a
	ld b, $0
	ret

StatOffsets:
	db HP_UP,    MON_HP_EXP - MON_STAT_EXP
	db PROTEIN, MON_ATK_EXP - MON_STAT_EXP
	db IRON,    MON_DEF_EXP - MON_STAT_EXP
	db CARBOS,  MON_SPD_EXP - MON_STAT_EXP
	db CALCIUM, MON_SPC_EXP - MON_STAT_EXP

Functionef49: ; ef49 (3:6f49)
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	ld [wd151], a
	ld a, $1f
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a
	call GetBaseData
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNick
	ret

RareCandy: ; ef68 (3:6f68)
	ld b, PARTYMENUACTION_HEALING_ITEM
	call Functionf24f
	jp c, Functioneef3
	call Functionef49
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	cp MAX_LEVEL
	jp nc, Functioneed7
	inc a
	ld [hl], a
	ld [wCurPartyLevel], a
	push de
	ld d, a
	farcall CalcExpAtLevel
	pop de
	ld a, $8
	call GetPartyParamLocation
	ld a, [hQuotient]
	ld [hli], a
	ld a, [hPrintNum3]
	ld [hli], a
	ld a, [hPrintNum4]
	ld [hl], a
	ld a, $24
	call GetPartyParamLocation
	ld a, [hli]
	ld b, a
	ld c, [hl]
	push bc
	call Functioneee0
	ld a, $25
	call GetPartyParamLocation
	pop bc
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	dec hl
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a
	ld c, $1
	farcall ChangeHappiness
	ld a, PARTYMENUTEXT_LEVEL_UP
	call Functionf2a0
	xor a
	ld [wMonType], a
	predef CopyPkmnToTempMon
	hlcoord 9, 0
	ld b, 10
	ld c, 9
	call TextBox
	hlcoord 11, 1
	ld bc, $4
	predef PrintTempMonStats
	call WaitPressAorB_BlinkCursor
	xor a
	ld [wMonType], a
	ld a, [wCurPartySpecies]
	ld [wd151], a
	predef LearnLevelMoves
	xor a
	ld [wd0d2], a
	farcall EvolvePokemon
	jp Functionf7dc

HealPowder: ; f003 (3:7003)
	ld b, $1
	call Functionf24f
	jp c, Functionf2f4
	call Functionf030
	cp $0
	jr nz, .asm_f01f
	ld c, $f
	farcall ChangeHappiness
	call Functionf81d
	ld a, $0
.asm_f01f
	jp Functionf0f4

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
	ld b, $1
	call Functionf24f
	jp c, Functionf2f4
Functionf02a:
	call Functionf030
	jp Functionf0f4

Functionf030: ; f030 (3:7030)
	call Functionf363
	ld a, $1
	ret z
	call Functionf0ae
	ld a, MON_STATUS
	call GetPartyParamLocation
	ld a, [hl]
	and c
	jr nz, .asm_f04a
	call Functionf05f
	ld a, $1
	ret nc
	ld b, PARTYMENUTEXT_HEAL_CONFUSION
.asm_f04a
	xor a
	ld [hl], a
	ld a, b
	ld [wPartyMenuActionText], a
	call Functionf086
	call Functionf7c7
	call Functionf2cf
	call Functionf7dc
	ld a, $0
	ret

Functionf05f: ; f05f (3:705f)
	call Functionf2fc
	jr nc, .asm_f072
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr z, .asm_f072
	ld a, c
	cp $ff
	jr nz, .asm_f072
	scf
	ret

.asm_f072
	and a
	ret

RestoreBattlemonHP:
	call Functionf2fc
	ret nc
	ld a, $22
	call GetPartyParamLocation
	ld a, [hli]
	ld [wBattleMonHP], a
	ld a, [hld]
	ld [wBattleMonHP + 1], a
	ret

Functionf086: ; f086 (3:7086)
	call Functionf2fc
	ret nc
	xor a
	ld [wBattleMonStatus], a
	ld hl, wPlayerSubStatus5
	res 0, [hl]
	ld hl, wPlayerSubStatus1
	res 0, [hl]
	call Functionf0ae
	ld a, c
	cp $ff
	jr nz, .asm_f0a5
	ld hl, wPlayerSubStatus3
	res 7, [hl]
.asm_f0a5
	push bc
	farcall CalcPlayerStats ; d:66f6
	pop bc
	ret

Functionf0ae: ; f0ae (3:70ae)
	push hl
	ld a, [wd002]
	ld hl, .healingactions ; $70c7
	ld bc, $3
.asm_f0b8
	cp [hl]
	jr z, .asm_f0be
	add hl, bc
	jr .asm_f0b8

.asm_f0be
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hl]
	ld c, a
	cp $ff
	pop hl
	ret

.healingactions
	db ANTIDOTE,     PARTYMENUTEXT_HEAL_PSN, 1 << PSN
	db BURN_HEAL,    PARTYMENUTEXT_HEAL_BRN, 1 << BRN
	db ICE_HEAL,     PARTYMENUTEXT_HEAL_FRZ, 1 << FRZ
	db AWAKENING,    PARTYMENUTEXT_HEAL_SLP, SLP
	db PARLYZ_HEAL,  PARTYMENUTEXT_HEAL_PAR, 1 << PAR
	db FULL_HEAL,    PARTYMENUTEXT_HEAL_ALL, %11111111
	db FULL_RESTORE, PARTYMENUTEXT_HEAL_ALL, %11111111
	db HEAL_POWDER,  PARTYMENUTEXT_HEAL_ALL, %11111111
	db PSNCUREBERRY, PARTYMENUTEXT_HEAL_PSN, 1 << PSN
	db PRZCUREBERRY, PARTYMENUTEXT_HEAL_PAR, 1 << PAR
	db BURNT_BERRY,  PARTYMENUTEXT_HEAL_FRZ, 1 << FRZ
	db ICE_BERRY,    PARTYMENUTEXT_HEAL_BRN, 1 << BRN
	db MINT_BERRY,   PARTYMENUTEXT_HEAL_SLP, SLP
	db MIRACLEBERRY, PARTYMENUTEXT_HEAL_ALL, %11111111
	db -1, 0, 0

Functionf0f4: ; f0f4 (3:70f4)
	ld hl, .Jumptable ; $70f9
	rst JumpTable
	ret

.Jumptable:
	dw Functionf2f8
	dw Functionf2ef
	dw Functionf2f4

RevivalHerb: ; f0ff
	ld b, $1
	call Functionf24f
	jp c, Functionf2f4
	call Functionf12c
	cp $0
	jr nz, .asm_f11b
	ld c, $11
	farcall ChangeHappiness
	call Functionf81d
	ld a, $0
.asm_f11b
	jp Functionf0f4

MaxRevive: ; f11e
Revive: ; f11e
	ld b, $1
	call Functionf24f
	jp c, Functionf2f4
	call Functionf12c
	jp Functionf0f4

Functionf12c: ; f12c (3:712c)
	call Functionf363
	ld a, $1
	ret nz
	ld a, [wBattleMode]
	and a
	jr z, .asm_f15a
	ld a, [wCurPartyMon]
	ld c, a
	ld d, $0
	ld hl, wcbda
	ld b, CHECK_FLAG
	predef FlagPredef
	ld a, c
	and a
	jr z, .asm_f15a
	ld a, [wCurPartyMon]
	ld c, a
	ld hl, wcb42
	ld b, SET_FLAG
	predef FlagPredef
.asm_f15a
	xor a
	ld [wLowHealthAlarm], a
	ld a, [wd002]
	cp REVIVE
	jr z, .asm_f16a
	call Functionf319
	jr .asm_f16d

.asm_f16a
	call Functionf310
.asm_f16d
	call Functionf231
	ld a, $f7
	ld [wPartyMenuActionText], a
	call Functionf2cf
	call Functionf7dc
	ld a, $0
	ret

FullRestore: ; f17e (3:717e)
	ld b, $1
	call Functionf24f
	jp c, Functionf2f4
	call Functionf363
	jp z, Functionf2ef
	call CalculateCurHPAnimRemainingHP
	jr c, .asm_f194
	jp Functionf02a

.asm_f194
	call Functionf19a
	jp Functionf0f4

Functionf19a: ; f19a (3:719a)
	xor a
	ld [wLowHealthAlarm], a
	call Functionf319
	ld a, $20
	call GetPartyParamLocation
	xor a
	ld [hli], a
	ld [hl], a
	call Functionf086
	call RestoreBattlemonHP
	call Functionf231
	ld a, $f5
	ld [wPartyMenuActionText], a
	call Functionf2cf
	call Functionf7dc
	ld a, $0
	ret

BitterBerry: ; f1c0
	ld hl, wPlayerSubStatus3
	bit 7, [hl]
	ld a, $1
	jr z, .asm_f1d9
	res 7, [hl]
	xor a
	ld [hBattleTurn], a
	call Functionf7d0
	ld hl, ConfusedNoMoreText
	call StdBattleTextBox
	ld a, $0
.asm_f1d9
	jp Functionf0f4

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
	call Functionf1ff
	jp Functionf0f4

Energypowder: ; f1e2 (3:71e2)
	ld c, $f
	jr asm_f1e8

EnergyRoot: ; f1e6 (3:71e6)
	ld c, $10
asm_f1e8
	push bc
	call Functionf1ff
	pop bc
	cp $0
	jr nz, .asm_f1fc
	farcall ChangeHappiness
	call Functionf81d
	ld a, $0
.asm_f1fc
	jp Functionf0f4

Functionf1ff: ; f1ff (3:71ff)
	ld b, PARTYMENUACTION_HEALING_ITEM
	call Functionf24f
	ld a, $2
	ret c
	call Functionf363
	ld a, $1
	ret z
	call CalculateCurHPAnimRemainingHP
	ld a, $1
	ret nc
	xor a
	ld [wLowHealthAlarm], a
	call Functionf3eb
	call Functionf327
	call RestoreBattlemonHP
	call Functionf231
	ld a, PARTYMENUTEXT_HEAL_HP
	ld [wPartyMenuActionText], a
	call Functionf2cf
	call Functionf7dc
	ld a, $0
	ret

Functionf231: ; f231 (3:7231)
	push de
	ld de, $4
	call WaitPlaySFX
	pop de
	ld a, [wCurPartyMon]
	hlcoord 11, 0
	ld bc, $28
	call AddNTimes
	ld a, $2
	ld [wWhichHPBar], a
	predef_jump AnimateHPBar

Functionf24f: ; f24f (3:724f)
	call Functionf261
	ret c
	ld a, [wCurPartySpecies]
	cp EGG
	jr nz, .asm_f25f
	call Functionf82f
	scf
	ret

.asm_f25f
	and a
	ret

Functionf261: ; f261 (3:7261)
	ld a, b
	ld [wPartyMenuActionText], a
	push hl
	push de
	push bc
	call ClearBGPalettes
	call Functionf272
	pop bc
	pop de
	pop hl
	ret

Functionf272: ; f272 (3:7272)
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	farcall PartyMenuSelect
	ret

Functionf2a0: ; f2a0 (3:72a0)
	ld [wPartyMenuActionText], a
	ld a, [wCurPartySpecies]
	push af
	ld a, [wCurPartyMon]
	push af
	push hl
	push de
	push bc
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuActionText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	pop bc
	pop de
	pop hl
	pop af
	ld [wCurPartyMon], a
	pop af
	ld [wCurPartySpecies], a
	ret

Functionf2cf: ; f2cf (3:72cf)
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	ld a, [wPartyMenuActionText]
	call Functionf2a0
	ld a, $1
	ld [hBGMapMode], a
	ld c, 50
	call DelayFrames
	jp WaitPressAorB_BlinkCursor

Functionf2ef: ; f2ef (3:72ef)
	call Functionf839
	jr Functionf2f8

Functionf2f4: ; f2f4 (3:72f4)
	xor a
	ld [wFieldMoveSucceeded], a
Functionf2f8: ; f2f8 (3:72f8)
	call ClearPalettes
	ret

Functionf2fc: ; f2fc (3:72fc)
	ld a, [wBattleMode]
	and a
	ret z
	ld a, [wCurPartyMon]
	push hl
	ld hl, wCurBattleMon
	cp [hl]
	pop hl
	jr nz, .asm_f30e
	scf
	ret

.asm_f30e
	xor a
	ret

Functionf310: ; f310 (3:7310)
	call GetCurHPAnimMaxHP
	srl d
	rr e
	jr asm_f31c

Functionf319: ; f319 (3:7319)
	call GetCurHPAnimMaxHP
asm_f31c
	ld a, MON_HP
	call GetPartyParamLocation
	ld [hl], d
	inc hl
	ld [hl], e
	jp CopyCurHPToAnimBufferNewHP

Functionf327: ; f327 (3:7327)
	ld a, $23
	call GetPartyParamLocation
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hl], a
	jr c, .asm_f34b
	call CopyCurHPToAnimBufferNewHP
	ld a, MON_HP + 1
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, MON_MAXHP + 1
	call GetPartyParamLocation
	ld a, [de]
	sub [hl]
	dec de
	dec hl
	ld a, [de]
	sbc [hl]
	jr c, .asm_f34e
.asm_f34b
	call Functionf319
.asm_f34e
	ret

Functionf34f: ; f34f (3:734f)
	ld a, MON_HP + 1
	call GetPartyParamLocation
	ld a, [hl]
	sub e
	ld [hld], a
	ld a, [hl]
	sbc d
	ld [hl], a
	jr nc, .asm_f35f
	xor a
	ld [hld], a
	ld [hl], a
.asm_f35f
	call CopyCurHPToAnimBufferNewHP
	ret

Functionf363: ; f363 (3:7363)
	push de
	call CopyMaxHPToAnimBufferMaxHP
	call CopyCurHPToAnimBufferOldHP
	call GetCurHPAnimOldHP
	ld a, d
	or e
	pop de
	ret

CalculateCurHPAnimRemainingHP: ; f371 (3:7371)
	call GetCurHPAnimOldHP
	ld h, d
	ld l, e
	call GetCurHPAnimMaxHP
	ld a, l
	sub e
	ld a, h
	sbc d
	ret

CopyCurHPToAnimBufferNewHP: ; f37e (3:737e)
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [hli]
	ld [wCurHPAnimNewHP + 1], a
	ld a, [hl]
	ld [wCurHPAnimNewHP], a
	ret

SetCurHPAnimNewHP:
	ld a, d
	ld [wCurHPAnimNewHP + 1], a
	ld a, e
	ld [wCurHPAnimNewHP], a
	ret

GetCurHPAnimNewHP:
	ld a, [wCurHPAnimNewHP + 1]
	ld d, a
	ld a, [wCurHPAnimNewHP]
	ld e, a
	ret

CopyCurHPToAnimBufferOldHP: ; f39e (3:739e)
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [hli]
	ld [wCurHPAnimOldHP + 1], a
	ld a, [hl]
	ld [wCurHPAnimOldHP], a
	ret

GetCurHPAnimOldHP: ; f3ac (3:73ac)
	ld a, [wCurHPAnimOldHP + 1]
	ld d, a
	ld a, [wCurHPAnimOldHP]
	ld e, a
	ret

CopyMaxHPToAnimBufferMaxHP: ; f3b5 (3:73b5)
	push hl
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld a, [hli]
	ld [wCurHPAnimMaxHP + 1], a
	ld a, [hl]
	ld [wCurHPAnimMaxHP], a
	pop hl
	ret

GetCurHPAnimMaxHP: ; f3c5 (3:73c5)
	ld a, [wCurHPAnimMaxHP + 1]
	ld d, a
	ld a, [wCurHPAnimMaxHP]
	ld e, a
	ret

GetOneFifthMaxHP: ; f3ce (3:73ce)
	push bc
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld a, [hli]
	ld [hDividend], a
	ld a, [hl]
	ld [hPrintNum2], a
	ld a, $5
	ld [hMultiplier], a
	ld b, $2
	call Divide
	ld a, [hStringCmpString2]
	ld d, a
	ld a, [hPrintNum4]
	ld e, a
	pop bc
	ret

Functionf3eb: ; f3eb (3:73eb)
	push hl
	ld a, [wd002]
	ld hl, HealingItemParameters
	ld d, a
.asm_f3f3
	ld a, [hli]
	cp -1
	jr z, .asm_f3ff
	cp d
	jr z, .asm_f400
	inc hl
	inc hl
	jr .asm_f3f3

.asm_f3ff
	scf
.asm_f400
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	ret

HealingItemParameters:
	dbw FRESH_WATER,   50
	dbw SODA_POP,      60
	dbw LEMONADE,      80
	dbw HYPER_POTION, 200
	dbw SUPER_POTION,  50
	dbw POTION,        20
	dbw MAX_POTION,   999
	dbw FULL_RESTORE, 999
	dbw MOOMOO_MILK,  100
	dbw BERRY,         10
	dbw GOLD_BERRY,    30
	dbw ENERGYPOWDER,  50
	dbw ENERGY_ROOT,  200
	dbw RAGECANDYBAR,  20
	dbw BERRY_JUICE,   20
	dbw -1,             0

	ld a, [wPartyMenuCursor]
	dec a
	ld b, a
	call Functionf46f
	jr c, .asm_f469
	ld a, b
	ld [wCurPartyMon], a
	call Functionf363
	call GetOneFifthMaxHP
	call Functionf34f
	push bc
	call Functionf231
	pop bc
	call GetOneFifthMaxHP
	ld a, c
	ld [wCurPartyMon], a
	call Functionf363
	call Functionf327
.asm_f45d
	call Functionf231
	ld a, PARTYMENUTEXT_HEAL_HP
	call Functionf2a0
	call JoyWaitAorB
.asm_f469
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	ret

Functionf46f: ; f46f (3:746f)
	push bc
	ld a, $1
	ld [wPartyMenuActionText], a
	call Functionf272
	pop bc
	jr c, .asm_f494
	ld a, [wPartyMenuCursor]
	dec a
	ld c, a
	ld a, b
	cp c
	jr z, .asm_f496
	ld a, c
	ld [wCurPartyMon], a
	call Functionf363
	jr z, .asm_f496
	call CalculateCurHPAnimRemainingHP
	jr nc, .asm_f496
	xor a
	ret

.asm_f494
	scf
	ret

.asm_f496
	push bc
	ld hl, Text_MilkDrinkCantBeUsed
	call MenuTextBoxBackup
	pop bc
	jr Functionf46f

Text_MilkDrinkCantBeUsed:
	text_far Text_MilkDrinkCantBeUsed_
	db "@"

EscapeRope: ; f4a5 (3:74a5)
	xor a
	ld [wFieldMoveSucceeded], a
	farcall EscapeRopeFunction ; same bank
	ld a, [wFieldMoveSucceeded]
	cp $1
	call z, Functionf7dc
	ret

SuperRepel: ; f4b8 (3:74b8)
	ld b, 200
	jr asm_f4c2

MaxRepel: ; f4bc (3:74bc)
	ld b, 250
	jr asm_f4c2

Repel: ; f4c0 (3:74c0)
	ld b, 100
asm_f4c2
	ld a, [wRepelSteps]
	and a
	ld hl, Text_RepelsEffectsStillLinger
	jp nz, PrintText
	ld a, b
	ld [wRepelSteps], a
	jp Functionf7d0

Text_RepelsEffectsStillLinger:
	text_far Text_RepelUsedEarlierIsStillInEffect
	db "@"

XAccuracy: ; f4d8 (3:74d8)
	ld hl, wPlayerSubStatus4
	bit SUBSTATUS_X_ACCURACY, [hl]
	jp nz, Functionf811
	set SUBSTATUS_X_ACCURACY, [hl]
	jp Functionf7d0

PokeDoll: ; f4e5 (3:74e5)
	ld a, [wBattleMode]
	dec a
	jr nz, .asm_f4f6
	inc a
	ld [wd11c], a
	inc a
	ld [wBattleResult], a
	jp Functionf7d0

.asm_f4f6
	xor a
	ld [wFieldMoveSucceeded], a
	ret

GuardSpec: ; f4fb (3:74fb)
	ld hl, wPlayerSubStatus4
	bit SUBSTATUS_MIST, [hl]
	jp nz, Functionf811
	set SUBSTATUS_MIST, [hl]
	jp Functionf7d0

DireHit: ; f508 (3:7508)
	ld hl, wPlayerSubStatus4
	bit SUBSTATUS_FOCUS_ENERGY, [hl]
	jp nz, Functionf811
	set SUBSTATUS_FOCUS_ENERGY, [hl]
	jp Functionf7d0

XAttack: ; f515
XDefend: ; f515
XSpecial: ; f515
XSpeed: ; f515
	call Functionf7d0
	ld a, [wd002]
	ld hl, .x_item_table
.asm_f51e
	cp [hl]
	jr z, .asm_f525
	inc hl
	inc hl
	jr .asm_f51e

.asm_f525
	inc hl
	ld b, [hl]
	xor a
	ld [hBattleTurn], a
	ld [wcb45], a
	ld [wcbeb], a
	farcall CheckIfStatCanBeRaised
	call WaitSFX
	farcall BattleCommand_StatUpMessage
	farcall BattleCommand_StatUpFailText
	ld a, [wCurBattleMon]
	ld [wCurPartyMon], a
	ld c, HAPPINESS_USEDXITEM
	farcall ChangeHappiness
	ret

.x_item_table
	db X_ATTACK,  ATTACK
	db X_DEFEND,  DEFENSE
	db X_SPEED,   SPEED
	db X_SPECIAL, SP_ATTACK

PokeFlute: ; f55c (3:755c)
	ld a, [wBattleMode]
	and a
	jr nz, .asm_f562
.asm_f562
	xor a
	ld [wceed], a
	ld b, $ff ^ SLP
	ld hl, wPartyMon1End
	call Functionf5a4
	ld a, [wBattleMode]
	cp $1
	jr z, .asm_f57b
	ld hl, wOTPartyMon1End
	call Functionf5a4
.asm_f57b
	ld hl, wBattleMonStatus
	ld a, [hl]
	and b
	ld [hl], a
	ld hl, wEnemyMonStatus
	ld a, [hl]
	and b
	ld [hl], a
	ld a, [wMovementBufferCount]
	and a
	ld hl, Text_NowThatsACatchyTune ; $75bc
	jp z, PrintText
	ld hl, Text_PlayedThePokeFlute ; $75c6
	call PrintText
	ld a, [wLowHealthAlarm]
	and $80
	jr nz, .asm_f59e
.asm_f59e
	ld hl, Text_AllSleepingMonWokeUp ; $75c1
	jp PrintText

Functionf5a4: ; f5a4 (3:75a4)
	ld de, $30
	ld c, $6
.asm_f5a9
	ld a, [hl]
	push af
	and $7
	jr z, .asm_f5b4
	ld a, $1
	ld [wceed], a
.asm_f5b4
	pop af
	and b
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_f5a9
	ret

Text_NowThatsACatchyTune:
	text_far Text_NowThatsACatchyTune_
	db "@"

Text_AllSleepingMonWokeUp:
	text_far Text_AllSleepingMonWokeUp_
	db "@"

Text_PlayedThePokeFlute:
	text_far Text_PlayedThePokeFlute_
	text_asm
	ld a, [wBattleMode]
	and a
	jr nz, .asm_f5dc
	push de
	ld de, SFX_POKEFLUTE
	call WaitPlaySFX
	call WaitSFX
	pop de
.asm_f5dc
	ld hl, .terminator
	ret

.terminator db "@"

CoinCase: ; f5e1 (3:75e1)
	ld hl, Text_CoinCase
	jp MenuTextBoxWaitButton

Text_CoinCase:
	text_far Text_CoinCase_
	db "@"

OldRod: ; f5ec (3:75ec)
	ld e, $0
	jr UseRod

GoodRod: ; f5f0 (3:75f0)
	ld e, $1
	jr UseRod

SuperRod: ; f5f4 (3:75f4)
	ld e, $2
	jr UseRod

UseRod:
	farcall FishingRodFunction ; same bank
	ret

Itemfinder: ; f5ff (3:75ff)
	farcall ItemfinderFunction
	ret

Elixer: ; f606
Ether: ; f606
MaxElixer: ; f606
MaxEther: ; f606
Mysteryberry: ; f606
PPUp: ; f606 (3:7606)
	ld a, [wd002]
	ld [wMovementBufferCount], a
.asm_f60c
	ld b, $1
	call Functionf24f
	jp c, Functionf727
.asm_f614
	ld a, [wMovementBufferCount]
	cp MAX_ELIXER
	jp z, Functionf6f6
	cp ELIXER
	jp z, Functionf6f6
	ld hl, Text_RaiseThePPOfWhichMove
	ld a, [wMovementBufferCount]
	cp PP_UP
	jr z, .asm_f62e
	ld hl, Text_RestoreThePPOfWhichMove
.asm_f62e
	call PrintText
	ld a, [wcfc7]
	push af
	xor a
	ld [wcfc7], a
	ld a, $2
	ld [wd11f], a
	ld a, $f
	ld hl, $62f3
	rst FarCall
	pop bc
	ld a, b
	ld [wcfc7], a
	jr nz, .asm_f60c
	ld hl, wPartyMon1Moves
	ld bc, $30
	call Functionf9aa
	push hl
	ld a, [hl]
	ld [wd151], a
	call GetMoveName
	call Function317b
	pop hl
	ld a, [wceed]
	cp PP_UP
	jp nz, Functionf6ee
	ld a, [hl]
	cp $a6
	jr z, .asm_f676
	ld bc, $15
	add hl, bc
	ld a, [hl]
	cp $c0
	jr c, .asm_f67e
.asm_f676
	ld hl, Text_PPIsMaxedOut ; $7776
	call PrintText
	jr .asm_f614

.asm_f67e
	ld a, [hl]
	add $40
	ld [hl], a
	ld a, $1
	ld [wd151], a
	call Functionf893
	call Functionf7c7
	ld hl, Text_PPsIncreased ; $777b
	call PrintText
asm_f693
	call ClearPalettes
	jp Functionf7dc

asm_f699
	ld a, [wBattleMode]
	and a
	jr z, .asm_f6b3
	ld a, [wCurPartyMon]
	ld b, a
	ld a, [wCurBattleMon]
	cp b
	jr nz, .asm_f6b3
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .asm_f6b3
	call Functionf6be
.asm_f6b3
	call Functionf7c7
	ld hl, Text_PPWasRestored
	call PrintText
	jr asm_f693

Functionf6be: ; f6be (3:76be)
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Moves
	ld bc, $30
	call AddNTimes
	ld de, wBattleMonMoves
	ld b, $4
.asm_f6cf
	ld a, [de]
	and a
	jr z, .asm_f6ed
	cp [hl]
	jr nz, .asm_f6e8
	push hl
	push de
	push bc
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	ld bc, $15
	add hl, bc
	ld a, [hl]
	ld [de], a
	pop bc
	pop de
	pop hl
.asm_f6e8
	inc hl
	inc de
	dec b
	jr nz, .asm_f6cf
.asm_f6ed
	ret

Functionf6ee: ; f6ee (3:76ee)
	call Functionf72f
	jr nz, asm_f699
	jp Functionf724

Functionf6f6: ; f6f6 (3:76f6)
	xor a
	ld hl, wMenuCursorY
	ld [hli], a
	ld [hl], a
	ld b, $4
.asm_f6fe
	push bc
	ld hl, wPartyMon1Moves
	ld bc, $30
	call Functionf9aa
	ld a, [hl]
	and a
	jr z, .asm_f715
	call Functionf72f
	jr z, .asm_f715
	ld hl, wcee1
	inc [hl]
.asm_f715
	ld hl, wMenuCursorY
	inc [hl]
	pop bc
	dec b
	jr nz, .asm_f6fe
	ld a, [wcee1]
	and a
	jp nz, asm_f699
Functionf724: ; f724 (3:7724)
	call Functionf839
Functionf727: ; f727 (3:7727)
	call ClearPalettes
	xor a
	ld [wFieldMoveSucceeded], a
	ret

Functionf72f: ; f72f (3:772f)
	xor a
	ld [wMonType], a
	call GetMaxPPOfMove
	ld hl, wPartyMon1PP
	ld bc, $30
	call Functionf9aa
	ld a, [wd151]
	ld b, a
	ld a, [hl]
	and $3f
	cp b
	jr nc, .asm_f76a
	ld a, [wceed]
	cp MAX_ELIXER
	jr z, .asm_f764
	cp $40
	jr z, .asm_f764
	ld c, $5
	cp $96
	jr z, .asm_f75c
	ld c, $a
.asm_f75c
	ld a, [hl]
	and $3f
	add c
	cp b
	jr nc, .asm_f764
	ld b, a
.asm_f764
	ld a, [hl]
	and $c0
	or b
	ld [hl], a
	ret

.asm_f76a
	xor a
	ret

Text_RaiseThePPOfWhichMove:
	text_far Text_RaiseThePPOfWhichMove_
	db "@"

Text_RestoreThePPOfWhichMove:
	text_far Text_RestoreThePPOfWhichMove_
	db "@"

Text_PPIsMaxedOut:
	text_far Text_PPIsMaxedOut_
	db "@"

Text_PPsIncreased:
	text_far Text_PPsIncreased_
	db "@"

Text_PPWasRestored:
	text_far Text_PPWasRestored_
	db "@"

Squirtbottle: ; f785 (3:7785)
	farcall SquirtbottleFunction ; 14:4763
	ret

CardKey: ; f78c (3:778c)
	farcall CardKeyFunction ; 14:47ac
	ret

BasementKey: ; f793 (3:7793)
	farcall BasementKeyFunction ; 14:47e7
	ret

SacredAsh: ; f79a (3:779a)
	farcall SacredAshFunction ; 14:4819
	ld a, [wFieldMoveSucceeded]
	cp $1
	ret nz
	call Functionf7dc
	ret

NormalBox: ; f7aa (3:77aa)
	ld c, DECOFLAG_SILVER_TROPHY_DOLL
	jr asm_f7b0

GorgeousBox: ; f7ae (3:77ae)
	ld c, DECOFLAG_GOLD_TROPHY_DOLL
asm_f7b0
	farcall ReceiveDecorationC ; 9:70d5
	ld hl, Text_TrophyInside ; $77bf
	call PrintText
	jp Functionf7dc

Text_TrophyInside:
	text_far Text_TrophyInside_
	db "@"

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
	jp Functionf834

Functionf7c7: ; f7c7 (3:77c7)
	push de
	ld de, SFX_FULL_HEAL
	call WaitPlaySFX
	pop de
	ret

Functionf7d0: ; f7d0 (3:77d0)
	ld hl, Text_UsedItem
	call PrintText
	call Functionf7c7
	call WaitPressAorB_BlinkCursor
Functionf7dc: ; f7dc (3:77dc)
	ld hl, wTMsHMsEnd
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	jp TossItem

Functionf7e7: ; f7e7 (3:77e7)
	call ReturnToBattle_UseBall
	ld de, Start
	ld a, e
	ld [wcf3e], a
	ld a, d
	ld [wcf3f], a
	xor a
	ld [wcb67], a
	ld [hBattleTurn], a
	ld [wcf46], a
	predef PlayBattleAnim
	ld hl, Text_BlockedTheBall
	call PrintText
	ld hl, Text_DontBeAThief
	call PrintText
	jr Functionf7dc

Functionf811: ; f811 (3:7811)
	ld hl, Text_WontHaveAnyEffect
	call PrintText
	ld a, $2
	ld [wFieldMoveSucceeded], a
	ret

Functionf81d: ; f81d (3:781d)
	ld hl, Text_LooksBitter
	jp PrintText

FailToUseBall: ; f823 (3:7823)
	ld hl, Text_CantUseBallBoxIsFull
	call PrintText
	ld a, $2
	ld [wFieldMoveSucceeded], a
	ret

Functionf82f: ; f82f (3:782f)
	ld hl, Text_CantUseOnEgg
	jr asm_f84b

Functionf834: ; f834 (3:7834)
	ld hl, Text_IsntTheTimeToUseThat
	jr asm_f84b

Functionf839: ; f839 (3:7839)
	ld hl, Text_WontHaveAnyEffect
	jr asm_f84b

Functionf83e:
	ld hl, Text_BelongsToSomeoneElse
	jr asm_f84b

Functionf843:
	ld hl, Text_CyclingIsntAllowed
	jr asm_f84b

Functionf848:
	ld hl, Text_CantGetOnYourItemNow
asm_f84b
	xor a
	ld [wFieldMoveSucceeded], a
	jp PrintText

Text_LooksBitter:
	text_far Text_LooksBitter_
	db "@"

Text_CantUseOnEgg:
	text_far Text_CantUseOnEgg_
	db "@"

Text_IsntTheTimeToUseThat:
	text_far Text_IsntTheTimeToUseThat_
	db "@"

Text_BelongsToSomeoneElse:
	text_far Text_BelongsToSomeoneElse_
	db "@"

Text_WontHaveAnyEffect:
	text_far Text_WontHaveAnyEffect_
	db "@"

Text_BlockedTheBall:
	text_far Text_BlockedTheBall_
	db "@"

Text_DontBeAThief:
	text_far Text_DontBeAThief_
	db "@"

Text_CyclingIsntAllowed:
	text_far Text_CyclingIsntAllowed_
	db "@"

Text_CantGetOnYourItemNow:
	text_far Text_CantGetOnYourItemNow_
	db "@"

Text_CantUseBallBoxIsFull:
	text_far Text_CantUseBallBoxIsFull_
	db "@"

Text_UsedItem:
	text_far Text_UsedItem_
	db "@"

Text_GotOnItem:
	text_far Text_GotOnItem_
	db "@"

Text_GotOffItem:
	text_far Text_GotOffItem_
	db "@"

Functionf893: ; f893 (3:7893)
	ld a, $2
	call GetPartyParamLocation
	push hl
	ld de, wBuffer1
	predef FillPP
	pop hl
	ld bc, $15
	add hl, bc
	ld de, wCurHPAnimMaxHP
	ld b, $0
.asm_f8ab
	inc b
	ld a, b
	cp $5
	ret z
	ld a, [wd151]
	dec a
	jr nz, .asm_f8bd
	ld a, [wMenuCursorY]
	inc a
	cp b
	jr nz, .asm_f8c4
.asm_f8bd
	ld a, [hl]
	and $c0
	ld a, [de]
	call nz, Functionf8c8
.asm_f8c4
	inc hl
	inc de
	jr .asm_f8ab

Functionf8c8: ; f8c8 (3:78c8)
	push bc
	ld a, [de]
	ld [hPrintNum4], a
	xor a
	ld [hPastLeadingZeroes], a
	ld [hQuotient], a
	ld [hPrintNum3], a
	ld a, $5
	ld [hRemainder], a
	ld b, $4
	call Divide
	ld a, [hl]
	ld b, a
	swap a
	and $f
	srl a
	srl a
	ld c, a
	and a
	jr z, .asm_f8fd
.asm_f8ea
	ld a, [hPrintNum4]
	cp $8
	jr c, .asm_f8f2
	ld a, $7
.asm_f8f2
	add b
	ld b, a
	ld a, [wd151]
	dec a
	jr z, .asm_f8fd
	dec c
	jr nz, .asm_f8ea
.asm_f8fd
	ld [hl], b
	pop bc
	ret

Functionf900: ; f900 (3:7900)
	ld a, $17
	call GetPartyParamLocation
	push hl
	ld a, $2
	call GetPartyParamLocation
	pop de
	xor a
	ld [wMenuCursorY], a
	ld [wMonType], a
	ld c, $4
.asm_f915
	ld a, [hli]
	and a
	ret z
	push hl
	push de
	push bc
	call GetMaxPPOfMove
	pop bc
	pop de
	ld a, [de]
	and $c0
	ld b, a
	ld a, [wd151]
	add b
	ld [de], a
	inc de
	ld hl, wMenuCursorY
	inc [hl]
	pop hl
	dec c
	jr nz, .asm_f915
	ret

GetMaxPPOfMove: ; f933 (3:7933)
	ld a, [wStringBuffer1]
	push af
	ld a, [wStringBuffer1 + 1]
	push af
	ld a, [wMonType]
	and a
	ld hl, wPartyMon1Moves
	ld bc, $30
	jr z, .asm_f961
	ld hl, wOTPartyMon1Moves
	dec a
	jr z, .asm_f961
	ld hl, wTempMonMoves
	dec a
	jr z, .asm_f95c
	ld hl, wTempMonMoves
	dec a
	jr z, .asm_f95c
	ld hl, wBattleMonMoves
.asm_f95c
	call Functionf9b0
	jr .asm_f964

.asm_f961
	call Functionf9aa
.asm_f964
	ld a, [hl]
	dec a
	push hl
	ld hl, Moves + MOVE_PP
	ld bc, $7
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld b, a
	ld de, wStringBuffer1
	ld [de], a
	pop hl
	push bc
	ld bc, $15
	ld a, [wMonType]
	cp $4
	jr nz, .asm_f989
	ld bc, $6
.asm_f989
	add hl, bc
	ld a, [hl]
	and $c0
	pop bc
	or b
	ld hl, wStringBuffer1 + 1
	ld [hl], a
	xor a
	ld [wd151], a
	ld a, b
	call Functionf8c8
	ld a, [hl]
	and $3f
	ld [wd151], a
	pop af
	ld [wStringBuffer1 + 1], a
.asm_f9a3
	pop af
	ld [wStringBuffer1], a
	ret

Functionf9aa: ; f9aa (3:79aa)
	ld a, [wCurPartyMon]
	call AddNTimes
Functionf9b0: ; f9b0 (3:79b0)
	ld a, [wMenuCursorY]
	ld c, a
	ld b, $0
	add hl, bc
	ret

GetPokeballWobble:
	ld a, [wBuffer2]
	inc a
	ld [wBuffer2], a
	cp $4
	jr z, .asm_f9e3
	ld a, [wWildMon]
	and a
	ld c, $0
	ret nz
	ld hl, PokeballWobbleProbabilities
	ld a, [wCurHPAnimMaxHP]
	ld b, a
.asm_f9d1
	ld a, [hli]
	cp b
	jr nc, .asm_f9d8
	inc hl
	jr .asm_f9d1

.asm_f9d8
	ld b, [hl]
	call Random
	cp b
	ld c, $0
	ret c
	ld c, $2
	ret

.asm_f9e3
	ld a, [wWildMon]
	and a
	ld c, $1
	ret nz
	ld c, $2
	ret

PokeballWobbleProbabilities:
	db   1,  63
	db   2,  75
	db   3,  84
	db   4,  90
	db   5,  95
	db   7, 103
	db  10, 113
	db  15, 126
	db  20, 134
	db  30, 149
	db  40, 160
	db  50, 169
	db  60, 177
	db  80, 191
	db 100, 201
	db 120, 211
	db 140, 220
	db 160, 227
	db 180, 234
	db 200, 240
	db 220, 246
	db 240, 251
	db 254, 253
	db 255, 255
