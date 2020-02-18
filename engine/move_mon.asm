TryAddMonToParty:: ; d892 (3:5892)
	ld de, wPartyCount
	ld a, [wMonType]
	and $f
	jr z, .asm_d89f
	ld de, wOTPartyCount
.asm_d89f
	ld a, [de]
	inc a
	cp $7
	ret nc
	ld [de], a
	ld a, [de]
	ld [hMoveMon], a
	add e
	ld e, a
	jr nc, .asm_d8ad
	inc d
.asm_d8ad
	ld a, [wCurPartySpecies]
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	ld hl, wPartyMon1OT
	ld a, [wMonType]
	and $f
	jr z, .asm_d8c2
	ld hl, wOTPartyMonOT
.asm_d8c2
	ld a, [hMoveMon]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wMonType]
	and a
	jr nz, .asm_d8f6
	ld a, [wCurPartySpecies]
	ld [wd151], a
	call GetPokemonName
	ld hl, wPartyMonNicknames
	ld a, [hMoveMon]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wStringBuffer1
	ld bc, NAME_LENGTH
	call CopyBytes
.asm_d8f6
	ld hl, wPartyMon1Species
	ld a, [wMonType]
	and $f
	jr z, .asm_d903
	ld hl, wOTPartyMon1
.asm_d903
	ld a, [hMoveMon]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
GeneratePartyMonStats:
	ld e, l
	ld d, h
	push hl
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wd120]
	ld [de], a
	inc de
	ld a, [wBattleMode]
	and a
	ld a, $0
	jr z, .asm_d928
	ld a, [wEnemyMonItem]
.asm_d928
	ld [de], a
	inc de
	push de
	ld h, d
	ld l, e
	ld a, [wBattleMode]
	and a
	jr z, .asm_d949
	ld a, [wMonType]
	and a
	jr nz, .asm_d949
	ld de, wEnemyMonMoves
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	jr .asm_d956

.asm_d949
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wBuffer1], a
	predef FillMoves
.asm_d956
	pop de
	inc de
	inc de
	inc de
	inc de
	ld a, [wPlayerID]
	ld [de], a
	inc de
	ld a, [wPlayerID + 1]
	ld [de], a
	inc de
	push de
	ld a, [wCurPartyLevel]
	ld d, a
	callfar CalcExpAtLevel ; 14:5550
	pop de
	ld a, [hPrintNum2]
	ld [de], a
	inc de
	ld a, [hStringCmpString2]
	ld [de], a
	inc de
	ld a, [hPrintNum4]
	ld [de], a
	inc de
	xor a
	ld b, $a
.asm_d980
	ld [de], a
	inc de
	dec b
	jr nz, .asm_d980
	pop hl
	push hl
	ld a, [wMonType]
	and $f
	jr z, .asm_d998
	push hl
	farcall GetTrainerDVs ; 9:7271
	pop hl
	jr .asm_d9bb

.asm_d998
	ld a, [wCurPartySpecies]
	ld [wd151], a
	dec a
	push de
	call CheckCaughtMon
	ld a, [wd151]
	dec a
	call SetSeenAndCaughtMon
	pop de
	pop hl
	push hl
	ld a, [wBattleMode]
	and a
	jr nz, .asm_d9f9
	call Random
	ld b, a
	call Random
	ld c, a
.asm_d9bb
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	push hl
	push de
	inc hl
	inc hl
	call FillPP
	pop de
	pop hl
	inc de
	inc de
	inc de
	inc de
	ld a, $46
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [wCurPartyLevel]
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld bc, $a
	add hl, bc
	ld a, $1
	ld c, a
	ld b, $0
	call CalcMonStatC
	ld a, [hStringCmpString2]
	ld [de], a
	inc de
	ld a, [hPrintNum4]
	ld [de], a
	inc de
	jr .asm_da2f

.asm_d9f9
	ld a, [wEnemyMonMovesEnd]
	ld [de], a
	inc de
	ld a, [wEnemyMonMovesEnd + 1]
	ld [de], a
	inc de
	push hl
	ld hl, wEnemyMonPP
	ld b, $4
.asm_da09
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_da09
	pop hl
	ld a, $46
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [wCurPartyLevel]
	ld [de], a
	inc de
	ld hl, wEnemyMonStatus
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
.asm_da2f
	ld a, [wBattleMode]
	dec a
	jr nz, .asm_da41
	ld hl, wEnemyMonMaxHP
	ld bc, $c
	call CopyBytes
	pop hl
	jr .asm_da4b

.asm_da41
	pop hl
	ld bc, $a
	add hl, bc
	ld b, $0
	call CalcMonStats
.asm_da4b
	ld a, [wMonType]
	and $f
	jr nz, .asm_da71
	ld a, [wCurPartySpecies]
	cp $c9
	jr nz, .asm_da71
	ld hl, wPartyMon1DVs
	ld a, [wPokemonData]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	predef GetUnownLetter
	callfar UpdateUnownDex
.asm_da71
	scf
	ret

FillPP: ; da73 (3:5a73)
	push bc
	ld b, $4
.asm_da76
	ld a, [hli]
	and a
	jr z, .asm_da95
	dec a
	push hl
	push de
	push bc
	ld hl, $5afe
	ld bc, $7
	call AddNTimes
	ld de, wStringBuffer1
	ld a, $10
	call FarCopyBytes
	pop bc
	pop de
	pop hl
	ld a, [wStringBuffer1 + 5]
.asm_da95
	ld [de], a
	inc de
	dec b
	jr nz, .asm_da76
	pop bc
	ret

AddTempmonToParty: ; da9c (3:5a9c)
	ld hl, wPartyCount
	ld a, [hl]
	cp $6
	scf
	ret z
	inc a
	ld [hl], a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wCurPartySpecies]
	ld [hli], a
	ld [hl], $ff
	ld hl, wPartyMon1Species
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wTempMonSpecies
	call CopyBytes
	ld hl, wPartyMon6StatsEnd
	ld a, [wPartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wOTPartyMon6StatsEnd
	ld a, [wCurPartyMon]
	call SkipNames
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, wPartyMonNicknames
	ld a, [wPartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wOTPartyMon1Nickname
	ld a, [wCurPartyMon]
	call SkipNames
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld [wd151], a
	cp EGG
	jr z, .asm_db18
	dec a
	call SetSeenAndCaughtMon
	ld hl, wPartyMon1Happiness
	ld a, [wPokemonData]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld [hl], 70
.asm_db18
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr nz, .asm_db43
	ld hl, wPartyMon1DVs
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	predef GetUnownLetter
	callfar UpdateUnownDex
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .asm_db43
	ld a, [wd11e]
	ld [wFirstUnownSeen], a
.asm_db43
	and a
	ret

SendGetMonIntoFromBox: ; db45 (3:5b45)
	ld a, $1
	call OpenSRAM
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_db66
	cp $2
	jr z, .asm_db66
	cp $3
	ld hl, wBreedMon1Species
	jr z, .asm_dba1
	ld hl, sBoxCount
	ld a, [hl]
	cp MONS_PER_BOX
	jr nz, .asm_db6f
	jp Functiondcb7

.asm_db66
	ld hl, wPartyCount
	ld a, [hl]
	cp $6
	jp z, Functiondcb7
.asm_db6f
	inc a
	ld [hl], a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wPokemonWithdrawDepositParameter]
	cp $2
	ld a, [wBreedMon1Species]
	jr z, .asm_db82
	ld a, [wCurPartySpecies]
.asm_db82
	ld [hli], a
	ld [hl], $ff
	ld a, [wPokemonWithdrawDepositParameter]
	dec a
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPokemonData]
	jr nz, .asm_db9d
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [sBoxCount]
.asm_db9d
	dec a
	call AddNTimes
.asm_dba1
	push hl
	ld e, l
	ld d, h
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	jr z, .asm_dbbd
	cp $2
	ld hl, wBreedMon1Species
	jr z, .asm_dbc3
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
.asm_dbbd
	ld a, [wCurPartyMon]
	call AddNTimes
.asm_dbc3
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [wPokemonWithdrawDepositParameter]
	cp $3
	ld de, wBreedMon1OT
	jr z, .asm_dbe8
	dec a
	ld hl, wPartyMonOT
	ld a, [wPokemonData]
	jr nz, .asm_dbe2
	ld hl, sBoxMonOT
	ld a, [sBoxCount]
.asm_dbe2
	dec a
	call SkipNames
	ld d, h
	ld e, l
.asm_dbe8
	ld hl, sBoxMonOT
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_dbfb
	ld hl, wBreedMon1OT
	cp $2
	jr z, .asm_dc01
	ld hl, wPartyMon6StatsEnd
.asm_dbfb
	ld a, [wCurPartyMon]
	call SkipNames
.asm_dc01
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wPokemonWithdrawDepositParameter]
	cp $3
	ld de, wBreedMon1Nick
	jr z, .asm_dc26
	dec a
	ld hl, wPartyMon1Nickname
	ld a, [wPokemonData]
	jr nz, .asm_dc20
	ld hl, sBoxMonNicknames
	ld a, [sBoxCount]
.asm_dc20
	dec a
	call SkipNames
	ld d, h
	ld e, l
.asm_dc26
	ld hl, sBoxMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_dc39
	ld hl, wBreedMon1Nick
	cp $2
	jr z, .asm_dc3f
	ld hl, wPartyMon1Nickname
.asm_dc39
	ld a, [wCurPartyMon]
	call SkipNames
.asm_dc3f
	ld bc, NAME_LENGTH
	call CopyBytes
	pop hl
	ld a, [wPokemonWithdrawDepositParameter]
	cp $1
	jr z, .asm_dcaa
	cp $3
	jp z, Functiondcb2
	push hl
	srl a
	add $2
	ld [wMonType], a
	predef CopyMonToTempMon
	callfar CalcLevel
	ld a, d
	ld [wCurPartyLevel], a
	pop hl
	ld b, h
	ld c, l
	ld hl, $1f
	add hl, bc
	ld [hl], a
	ld hl, $24
	add hl, bc
	ld d, h
	ld e, l
	ld hl, $a
	add hl, bc
	push bc
	ld b, $1
	call CalcMonStats
	pop bc
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr nz, Functiondcb2
	ld hl, $20
	add hl, bc
	xor a
	ld [hl], a
	ld hl, $22
	add hl, bc
	ld d, h
	ld e, l
	ld a, [wCurPartySpecies]
	cp $fd
	jr z, .asm_dca4
	inc hl
	inc hl
	ld a, [hli]
	ld [de], a
	ld a, [hl]
	inc de
	ld [de], a
	jr Functiondcb2

.asm_dca4
	xor a
	ld [de], a
	inc de
	ld [de], a
	jr Functiondcb2

.asm_dcaa
	ld a, [sBoxCount]
	dec a
	ld b, a
	call Functiondcbc
Functiondcb2: ; dcb2 (3:5cb2)
	call CloseSRAM
	and a
	ret

Functiondcb7: ; dcb7 (3:5cb7)
	call CloseSRAM
	scf
	ret

Functiondcbc: ; dcbc (3:5cbc)
	ld a, b
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, $17
	add hl, bc
	push hl
	push bc
	ld de, wTempMonPP
	ld bc, $4
	call CopyBytes
	pop bc
	ld hl, $2
	add hl, bc
	push hl
	ld de, wTempMonMoves
	ld bc, $4
	call CopyBytes
	pop hl
	pop de
	ld a, [wMenuCursorY]
	push af
	ld a, [wMonType]
	push af
	ld b, $0
.asm_dcf2
	ld a, [hli]
	and a
	jr z, .asm_dd1e
	ld [wTempMonMoves], a
	ld a, $2
	ld [wMonType], a
	ld a, b
	ld [wMenuCursorY], a
	push bc
	push hl
	push de
	farcall GetMaxPPOfMove ; same bank
	pop de
	pop hl
	ld a, [wd151]
	ld b, a
	ld a, [de]
	and $c0
	add b
	ld [de], a
	pop bc
	inc de
	inc b
	ld a, b
	cp $4
	jr c, .asm_dcf2
.asm_dd1e
	pop af
	ld [wMonType], a
	pop af
	ld [wMenuCursorY], a
	ret

RetrieveMonFromDayCareMan:
	ld a, [wBreedMon1Species]
	ld [wCurPartySpecies], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	call GetBreedMon1LevelGrowth
	ld a, b
	ld [wMovementBufferCount], a
	ld a, e
	ld [wCurPartyLevel], a
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp Functiondd6a

RetrieveMonFromDayCareLady:
	ld a, [wBreedMon2Species]
	ld [wCurPartySpecies], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	call GetBreedMon2LevelGrowth
	ld a, b
	ld [wMovementBufferCount], a
	ld a, e
	ld [wCurPartyLevel], a
	ld a, $1
	ld [wPokemonWithdrawDepositParameter], a
	jp Functiondd6a ; super long jump

Functiondd6a: ; dd6a (3:5d6a)
	ld hl, wPokemonData
	ld a, [hl]
	cp $6
	jr nz, .asm_dd74
	scf ; We shouldn't be here if we've come this far.
	ret

.asm_dd74
	inc a
	ld [hl], a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	ld a, [wBreedMon1Species]
	ld de, wBreedMon1Nick
	jr z, .asm_dd8c
	ld a, [wBreedMon2Species]
	ld de, wBreedMon2Nick
.asm_dd8c
	ld [hli], a
	ld [wCurSpecies], a
	ld a, $ff
	ld [hl], a
	ld hl, wPartyMon1Nickname
	ld a, [wPartyCount]
	dec a
	call SkipNames
	push hl
	ld h, d
	ld l, e
	pop de
	call CopyBytes
	push hl
	ld hl, wPartyMonOT
	ld a, [wPartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	pop hl
	call CopyBytes
	push hl
	call Functionde20
	pop hl
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	call GetBaseData
	call Functionde20
	ld b, d
	ld c, e
	ld hl, $1f
	add hl, bc
	ld a, [wCurPartyLevel]
	ld [hl], a
	ld hl, $24
	add hl, bc
	ld d, h
	ld e, l
	ld hl, $a
	add hl, bc
	push bc
	ld b, $1
	call CalcMonStats
	ld hl, wPartyMon1Moves
	ld a, [wPokemonData]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld a, $1
	ld [wCurHPAnim], a
	predef FillMoves
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	farcall Functionc6bc ; same bank
	ld a, [wCurPartyLevel]
	ld d, a
	callfar CalcExpAtLevel
	pop bc
	ld hl, $8
	add hl, bc
	ld a, [hQuotient]
	ld [hli], a
	ld a, [hPrintNum3]
	ld [hli], a
	ld a, [hPrintNum4]
	ld [hl], a
	and a
	ret

Functionde20: ; de20 (3:5e20)
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ret

DepositMonWithDayCareMan:
	ld de, wBreedMon1Nick
	call Functionde4a
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp RemoveMonFromPartyOrBox

DepositMonWithDayCareLady:
	ld de, wBreedMon2Nick
	call Functionde4a
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp RemoveMonFromPartyOrBox

Functionde4a: ; de4a (3:5e4a)
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call SkipNames
	call CopyBytes
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1OT
	call SkipNames
	call CopyBytes
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld bc, BOXMON_STRUCT_LENGTH
	jp CopyBytes

SendMonIntoBox: ; de74 (3:5e74)
	ld a, $1
	call OpenSRAM
	ld de, sBoxCount
	ld a, [de]
	cp $14
	jp nc, Functiondf48
	inc a
	ld [de], a
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	ld c, a
.asm_de8b
	inc de
	ld a, [de]
	ld b, a
	ld a, c
	ld c, b
	ld [de], a
	inc a
	jr nz, .asm_de8b
	call GetBaseData
	call Functiondf4d
	ld hl, wPlayerName
	ld de, sBoxMonOT
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld [wd151], a
	call GetPokemonName
	ld de, sBoxMonNicknames
	ld hl, wStringBuffer1
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, wEnemyMon
	ld de, sBoxMon1Species
	ld bc, $6
	call CopyBytes
	ld hl, wGameData
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	push de
	ld a, [wCurPartyLevel]
	ld d, a
	callfar CalcExpAtLevel
	pop de
	ld a, [hQuotient]
	ld [de], a
	inc de
	ld a, [hPrintNum3]
	ld [de], a
	inc de
	ld a, [hPrintNum4]
	ld [de], a
	inc de
	xor a
	ld b, $a
.asm_deeb
	ld [de], a
	inc de
	dec b
	jr nz, .asm_deeb
	ld hl, wEnemyMonMovesEnd
	ld b, $6
.asm_def5
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_def5
	ld a, $46
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [wCurPartyLevel]
	ld [de], a
	ld a, [wCurPartySpecies]
	dec a
	call SetSeenAndCaughtMon
	ld a, [wCurPartySpecies]
	cp $c9
	jr nz, .asm_df26
	ld hl, sBoxMon1DVs
	predef GetUnownLetter
	callfar UpdateUnownDex
.asm_df26
	ld hl, sBoxMon1Moves
	ld de, wTempMonMoves
	ld bc, $4
	call CopyBytes
	ld hl, sBoxMon1PP
	ld de, wTempMonPP
	ld bc, $4
	call CopyBytes
	ld b, $0
	call Functiondcbc
	call CloseSRAM
	scf
	ret

Functiondf48: ; df48 (3:5f48)
	call CloseSRAM
	and a
	ret

Functiondf4d: ; df4d (3:5f4d)
	ld hl, sBoxMonOT
	ld bc, NAME_LENGTH
	call Functiondf65
	ld hl, sBoxMonNicknames
	ld bc, NAME_LENGTH
	call Functiondf65
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
Functiondf65: ; df65 (3:5f65)
	ld a, [sBoxCount]
	cp $2
	ret c
	push hl
	call AddNTimes
	dec hl
	ld e, l
	ld d, h
	pop hl
	ld a, [sBoxCount]
	dec a
	call AddNTimes
	dec hl
	push hl
	ld a, [sBoxCount]
	dec a
	ld hl, $0
	call AddNTimes
	ld c, l
	ld b, h
	pop hl
.asm_df89
	ld a, [hld]
	ld [de], a
	dec de
	dec bc
	ld a, c
	or b
	jr nz, .asm_df89
	ret

GiveEgg: ; df92 (3:5f92)
	ld a, [wCurPartySpecies]
	push af
	callfar GetPreEvolution
	callfar GetPreEvolution
	ld a, [wCurPartySpecies]
	dec a
	push af
	call CheckCaughtMon
	pop af
	push bc
	call CheckSeenMon
	push bc
	call TryAddMonToParty
	pop bc
	ld a, c
	and a
	jr nz, .asm_dfc9
	ld a, [wCurPartySpecies]
	dec a
	ld c, a
	ld d, $0
	ld hl, wPokedexCaught
	ld b, RESET_FLAG
	predef SmallFarFlagAction
.asm_dfc9
	pop bc
	ld a, c
	and a
	jr nz, .asm_dfdf
	ld a, [wCurPartySpecies]
	dec a
	ld c, a
	ld d, $0
	ld hl, wPokedexSeen
	ld b, RESET_FLAG
	predef SmallFarFlagAction
.asm_dfdf
	pop af
	ld [wCurPartySpecies], a
	ld a, [wPokemonData]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Species
	call AddNTimes
	ld a, [wCurPartySpecies]
	ld [hl], a
	ld hl, wPokemonData
	ld a, [hl]
	ld b, $0
	ld c, a
	add hl, bc
	ld a, $fd
	ld [hl], a
	ld a, [wPokemonData]
	dec a
	ld hl, wPartyMon1Nickname
	call SkipNames
	ld de, String_Egg
	call CopyName2
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [wDebugFlags]
	bit 1, a
	ld a, $1
	jr nz, .asm_e028
	ld a, [wBaseEggSteps]
.asm_e028
	ld [hl], a
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	xor a
	ld [hli], a
	ld [hl], a
	and a
	ret

String_Egg:
	db "EGG@"

RemoveMonFromPartyOrBox: ; e03f (3:603f)
	ld hl, wPartyCount
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e050
	ld a, $1
	call OpenSRAM
	ld hl, sBoxCount
.asm_e050
	ld a, [hl]
	dec a
	ld [hli], a
	ld a, [wCurPartyMon]
	ld c, a
	ld b, $0
	add hl, bc
	ld e, l
	ld d, h
	inc de
.asm_e05d
	ld a, [de]
	inc de
	ld [hli], a
	inc a
	jr nz, .asm_e05d
	ld hl, wPartyMon6StatsEnd
	ld d, $5
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e073
	ld hl, sBoxMonOT
	ld d, $13
.asm_e073
	ld a, [wCurPartyMon]
	call SkipNames
	ld a, [wCurPartyMon]
	cp d
	jr nz, .asm_e084
	ld [hl], $ff
	jp .asm_e0f6

.asm_e084
	ld d, h
	ld e, l
	ld bc, NAME_LENGTH
	add hl, bc
	ld bc, wPartyMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e096
	ld bc, sBoxMonNicknames
.asm_e096
	call CopyDataUntil
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e0ab
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
.asm_e0ab
	ld a, [wCurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e0c2
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	ld bc, sBoxMonOT
	jr .asm_e0c9

.asm_e0c2
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	ld bc, wPartyMonOT
.asm_e0c9
	call CopyDataUntil
	ld hl, wPartyMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e0d8
	ld hl, sBoxMonNicknames
.asm_e0d8
	ld bc, NAME_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld bc, NAME_LENGTH
	add hl, bc
	ld bc, wPartyMonNicknamesEnd
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e0f3
	ld bc, sBoxEnd
.asm_e0f3
	call CopyDataUntil
.asm_e0f6
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jp nz, CloseSRAM
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, $0
	call OpenSRAM
	ld hl, wPokemonData
	ld a, [wCurPartyMon]
	cp [hl]
	jr z, .asm_e137
	ld hl, s0_a600
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	add hl, bc
	pop de
	ld a, [wCurPartyMon]
	ld b, a
.asm_e120
	push bc
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop hl
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	add hl, bc
	pop de
	pop bc
	inc b
	ld a, [wPartyCount]
	cp b
	jr nz, .asm_e120
.asm_e137
	jp CloseSRAM

ComputeNPCTrademonStats:
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [MON_LEVEL], a ; wow
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld d, h
	ld e, l
	push de
	ld a, MON_STAT_EXP - 1
	call GetPartyParamLocation
	ld b, $1
	call CalcMonStats
	pop de
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret

CalcMonStats: ; e16d
; Calculates all 6 Stats of a Pkmn
; b: Take into account stat EXP if TRUE
; 'c' counts from 1-6 and points with 'BaseStats' to the base value
; hl is the path to the Stat EXP
; results in $ffb7 and $ffb8 are saved in [de]

	ld c, $0
.loop
	inc c
	call CalcMonStatC
	ld a, [hMultiplicand + 1]
	ld [de], a
	inc de
	ld a, [hMultiplicand + 2]
	ld [de], a
	inc de
	ld a, c
	cp STAT_SDEF
	jr nz, .loop
	ret
; e17b

CalcMonStatC: ; e181
; 'c' is 1-6 and points to the BaseStat
; 1: HP
; 2: Attack
; 3: Defense
; 4: Speed
; 5: SpAtk
; 6: SpDef
	push hl
	push de
	push bc
	ld a, b
	ld d, a
	push hl
	ld hl, wd121
	dec hl ; has to be decreased, because 'c' begins with 1
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld e, a
	pop hl
	push hl
	ld a, c
	cp STAT_SDEF
	jr nz, .not_spdef
	dec hl
	dec hl

.not_spdef
	sla c
	ld a, d
	and a
	jr z, .no_stat_exp
	add hl, bc
.sqrt_loop
	xor a
	ld [hMultiplicand], a
	ld [hMultiplicand + 1], a
	inc b
	ld a, b
	cp $ff
	jr z, .no_stat_exp
	ld [hMultiplicand + 2], a
	ld [hMultiplier], a
	call Multiply
	ld a, [hld]
	ld d, a
	ld a, [hProduct + 3]
	sub d
	ld a, [hli]
	ld d, a
	ld a, [hProduct + 2]
	sbc d
	jr c, .sqrt_loop
.no_stat_exp
	srl c
	pop hl
	push bc
	ld bc, MON_DVS - MON_HP_EXP + 1
	add hl, bc
	pop bc
	ld a, c
	cp STAT_ATK
	jr z, .Attack
	cp STAT_DEF
	jr z, .Defense
	cp STAT_SPD
	jr z, .Speed
	cp STAT_SATK
	jr z, .Special
	cp STAT_SDEF
	jr z, .Special
; DV_HP = (DV_ATK & 1) << 3 + (DV_DEF & 1) << 2 + (DV_SPD & 1) << 1 + (DV_SPC & 1)
	push bc
	ld a, [hl]
	swap a
	and $1
	add a
	add a
	add a
	ld b, a
	ld a, [hli]
	and $1
	add a
	add a
	add b
	ld b, a
	ld a, [hl]
	swap a
	and $1
	add a
	add b
	ld b, a
	ld a, [hl]
	and $1
	add b
	pop bc
	jr .GotDV

.Attack:
	ld a, [hl]
	swap a
	and $f
	jr .GotDV

.Defense:
	ld a, [hl]
	and $f
	jr .GotDV

.Speed:
	inc hl
	ld a, [hl]
	swap a
	and $f
	jr .GotDV

.Special:
	inc hl
	ld a, [hl]
	and $f

.GotDV:
	ld d, 0
	add e
	ld e, a
	jr nc, .no_overflow_1
	inc d

.no_overflow_1
	sla e
	rl d
	srl b
	srl b
	ld a, b
	add e
	jr nc, .no_overflow_2
	inc d

.no_overflow_2
	ld [hMultiplicand + 2], a
	ld a, d
	ld [hMultiplicand + 1], a
	xor a
	ld [hMultiplicand + 0], a
	ld a, [wCurPartyLevel]
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct + 1]
	ld [hDividend + 0], a
	ld a, [hProduct + 2]
	ld [hDividend + 1], a
	ld a, [hProduct + 3]
	ld [hDividend + 2], a
	ld a, 100
	ld [hDivisor], a
	ld a, 3
	ld b, a
	call Divide
	ld a, c
	cp STAT_HP
	ld a, 5
	jr nz, .not_hp
	ld a, [wCurPartyLevel]
	ld b, a
	ld a, [hQuotient + 2]
	add b
	ld [hMultiplicand + 2], a
	jr nc, .no_overflow_3
	ld a, [hQuotient + 1]
	inc a
	ld [hMultiplicand + 1], a

.no_overflow_3
	ld a, 10

.not_hp
	ld b, a
	ld a, [hQuotient + 2]
	add b
	ld [hMultiplicand + 2], a
	jr nc, .no_overflow_4
	ld a, [hQuotient + 1]
	inc a
	ld [hMultiplicand + 1], a

.no_overflow_4
	ld a, [hQuotient + 1]
	cp (1000 / $100) + 1
	jr nc, .max_stat
	cp 1000 / $100
	jr c, .stat_value_okay
	ld a, [hQuotient + 2]
	cp 1000 % $100
	jr c, .stat_value_okay

.max_stat
	ld a, 999 / $100
	ld [hMultiplicand + 1], a
	ld a, 999 % $100
	ld [hMultiplicand + 2], a

.stat_value_okay
	pop bc
	pop de
	pop hl
	ret

GivePoke: ; Give a Pokemon from script
	push de
	push bc
	xor a
	ld [wMonType], a
	call TryAddMonToParty
	jr nc, .asm_e2c9
	ld hl, wPartyMon1Nickname
	ld a, [wPokemonData]
	dec a
	ld [wCurPartyMon], a
	call SkipNames
	ld d, h
	ld e, l
	pop bc
	ld a, b
	ld b, $0
	push bc
	push de
	push af
	ld a, [wd002]
	and a
	jr z, .asm_e2fa
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [wd002]
	ld [hl], a
	jr .asm_e2fa

.asm_e2c9
	ld a, [wCurPartySpecies]
	ld [wTempEnemyMonSpecies], a
	callfar LoadEnemyMon
	call SendMonIntoBox
	jp nc, Functione3af
	ld a, BOXMON
	ld [wMonType], a
	xor a
	ld [wCurPartyMon], a
	ld de, wMonOrItemNameBuffer
	pop bc
	ld a, b
	ld b, $1
	push bc
	push de
	push af
	ld a, [wd002]
	and a
	jr z, .asm_e2fa
	ld a, [wd002]
	ld [sBoxMon1Item], a
.asm_e2fa
	ld a, [wCurPartySpecies]
	ld [wd151], a
	ld [wTempEnemyMonSpecies], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop af
	and a
	jr z, .asm_e381
	pop de
	pop bc
	pop hl
	push bc
	push hl
	ld a, [wScriptBank]
	call GetFarHalfword
	ld bc, MON_NAME_LENGTH
	ld a, [wScriptBank]
	call FarCopyBytes
	pop hl
	inc hl
	inc hl
	ld a, [wScriptBank]
	call GetFarHalfword
	pop bc
	ld a, b
	and a
	push de
	push bc
	jr nz, .asm_e360
	push hl
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1OT
	call SkipNames
	ld d, h
	ld e, l
	pop hl
	ld a, [wScriptBank]
	call FarCopyBytes
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, 01001 / $100
	ld [hli], a
	ld [hl], 01001 % $100
	jr .asm_e38d

.asm_e360
	ld a, BANK(sBoxMonOT)
	call OpenSRAM
	ld de, sBoxMonOT
	ld bc, MON_NAME_LENGTH
	ld a, [wScriptBank]
	call FarCopyBytes
	ld hl, sBoxMon1ID
	call Random
	ld [hli], a
	call Random
	ld [hl], a
	call CloseSRAM
	jr .asm_e38d

.asm_e381
	callfar Functionc7cd0
	pop de
	jr c, .asm_e38d
	call InitNickname
.asm_e38d
	pop bc
	pop de
	ld a, b
	and a
	ret z
	ld hl, TextJump_WasSentToBillsPC
	call PrintText
	ld a, BANK(sBoxMonNicknames)
	call OpenSRAM
	ld hl, wMonOrItemNameBuffer
	ld de, sBoxMonNicknames
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	call CloseSRAM
	ld b, $1
	ret

Functione3af: ; e3af (3:63af)
	pop bc
	pop de
	ld b, $2
	ret

TextJump_WasSentToBillsPC:
	text_far Text_WasSentToBillsPC
	db "@"

InitNickname: ; e3b9 (3:63b9)
	push de
	call LoadStandardMenuDataHeader
	call DisableSpriteUpdates
	pop de
	push de
	ld b, $0
	farcall NamingScreen
	pop hl
	ld de, wStringBuffer1
	call InitName
	ld a, $4 ; XXX could this be in bank 4 in pokered?
	ld hl, ExitAllMenus
	rst FarCall
	ret
