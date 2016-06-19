GetPredefPointer:: ; 8b3b (2:4b3b)
	ld a, h
	ld [wPredefHLBuffer], a
	ld a, l
	ld [wPredefHLBuffer + 1], a
	push de
	ld a, [wPredefID]
	ld e, a
	ld d, $0
	ld hl, PredefPointers
	add hl, de
	add hl, de
	add hl, de
	pop de
	ld a, [hli]
	ld [wPredefPointerBuffer + 1], a
	ld a, [hli]
	ld [wPredefPointerBuffer], a
	ld a, [hl]
	ret

PredefPointers::
; temp macro
predef_pointer: macro
IF DEF(GOLD)
	dwb \1, \3
ENDC
IF DEF(SILVER)
	dwb \2, \3
ENDC
endm

	predef_pointer $65e7, $65ad, $01 ; add_predef LearnMove ; $0
	dwb $4031, $01                   ; add_predef Predef1 ; $1
	predef_pointer $469d, $469b, $03 ; add_predef HealParty
	predef_pointer $4661, $465f, $03 ; add_predef FlagPredef
	predef_pointer $46de, $46dc, $03 ; add_predef ComputeHPBarPixels
	predef_pointer $5a73, $5a71, $03 ; add_predef FillPP
	predef_pointer $5892, $5890, $03 ; add_predef TryAddMonToParty
	predef_pointer $5a9c, $5a9a, $03 ; add_predef AddTempmonToParty
	predef_pointer $5b45, $5b43, $03 ; add_predef SentGetPkmnIntoFromBox
	predef_pointer $5e74, $5e72, $03 ; add_predef SentPkmnIntoBox
	predef_pointer $5f92, $5f90, $03 ; add_predef GiveEgg
	predef_pointer $4725, $4723, $03 ; add_predef AnimateHPBar
	predef_pointer $616d, $616b, $03 ; add_predef CalcPkmnStats
	predef_pointer $6181, $617f, $03 ; add_predef CalcPkmnStatC
	dwb $5a25, $04                   ; add_predef CanLearnTMHMMove
	dwb $5a56, $04                   ; add_predef GetTMHMMove
	dwb $4d88, $0a                   ; add_predef Predef_LinkTextbox ; $ 10
	dwb $4943, $0b                   ; add_predef PrintMoveDesc
	dwb $5da9, $0f                   ; add_predef UpdatePlayerHUD
	dwb $4648, $11                   ; add_predef PlaceGraphic
	dwb $570a, $0f                   ; add_predef CheckPlayerPartyForFitPkmn
	dwb $5e97, $0f                   ; add_predef UpdateEnemyHUD
	dwb $72c7, $0f                   ; add_predef StartBattle
	dwb $7196, $0f                   ; add_predef FillInExpBar
	dwb $7243, $0f                   ; add_predef GetMonBackpic ; $18
	dwb $7282, $0f                   ; add_predef GetMonFrontpic
	dwb $6483, $10                   ; add_predef LearnLevelMoves
	dwb $64dd, $10                   ; add_predef FillMoves
	dwb $61e9, $10                   ; add_predef EvolveAfterBattle
	dwb $4e22, $0a                   ; add_predef TradeAnimationPlayer2
	dwb $4dea, $0a                   ; add_predef TradeAnimation
	dwb $487d, $14                   ; add_predef CopyPkmnToTempMon
	dwb $5478, $14                   ; add_predef ListMoves ; $20
	dwb $5437, $14                   ; add_predef PlaceNonFaintStatus
	dwb $53e4, $14                   ; add_predef Predef22
	dwb $5364, $14                   ; add_predef ListMovePP
	dwb $52f1, $14                   ; add_predef GetGender
	dwb $4bae, $14                   ; add_predef StatsScreenInit
	dwb $4b3d, $14                   ; add_predef DrawPlayerHP
	dwb $4b41, $14                   ; add_predef DrawEnemyHP
	dwb $528f, $14                   ; add_predef PrintTempMonStats ; $28
	dwb $4997, $14                   ; add_predef GetTypeName
	dwb $496d, $14                   ; add_predef PrintMoveType
	dwb $4986, $14                   ; add_predef PrintType
	dwb $4940, $14                   ; add_predef PrintMonTypes
	dwb $5749, $14                   ; add_predef GetUnownLetter
	dwb $7c76, $32                   ; add_predef LoadPoisonBGPals
	dwb $40d6, $32                   ; add_predef Predef2F
	dwb $5cc0, $02                   ; add_predef InitSGBBorder ; $30
	dwb $4c2d, $02                   ; add_predef Predef_LoadSGBLayout
	dwb $5c7f, $24                   ; add_predef Area_
	dwb $5072, $02                   ; add_predef CheckContestMon
	dwb $4513, $23                   ; add_predef Predef_StartBattle
	dwb $4355, $23                   ; add_predef Predef35
	dwb $4355, $23                   ; add_predef Predef36
	dwb $40d7, $33                   ; add_predef PlayBattleAnim
	dwb $40d6, $33                   ; add_predef Predef38 ; $38
	dwb $40d6, $33                   ; add_predef Predef39
	dwb $4001, $3f                   ; add_predef Predef3A
	dwb $6e33, $04                   ; add_predef PartyMonItemName
	dwb $5780, $14                   ; add_predef GetFrontpic
	dwb $5803, $14                   ; add_predef GetBackpic
	dwb $58a0, $14                   ; add_predef FrontpicPredef
	dwb $58fa, $14                   ; add_predef GetTrainerPic
	dwb $4923, $0d                   ; add_predef DecompressPredef ; $40
	dwb $7a12, $3e                   ; add_predef CheckTypeMatchup
	dwb $7981, $3e                   ; add_predef ConvertMon_1to2
	dwb $5786, $14                   ; add_predef NewPokedexEntry
	dwb $4a66, $70
    dbw $ff, InexplicablyEmptyFunction
