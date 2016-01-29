; INCLUDE "includes.asm"

SECTION "VRAM", VRAM

SECTION "WRAM0", WRAM0

SECTION "BATTLE", WRAM0[$caef]
wBattle::
wEnemyMoveStruct::  move_struct wEnemyMoveStruct
wPlayerMoveStruct:: move_struct wPlayerMoveStruct

EnemyMonNick::  ds PKMN_NAME_LENGTH
BattleMonNick:: ds PKMN_NAME_LENGTH

BattleMon:: battle_struct BattleMon

	ds 2

wWildMon:: ds 1
	ds 1
wEnemyTrainerItem1:: ds 1
wEnemyTrainerItem2:: ds 1
wEnemyTrainerBaseReward:: ds 1
wEnemyTrainerAIFlags:: ds 3
OTClassName:: ds NAME_LENGTH

	ds 2

CurOTMon::
	ds 1

wBattleParticipantsNotFainted::
; Bit array.  Bits 0 - 5 correspond to party members 1 - 6.
; Bit set if the mon appears in battle.
; Bit cleared if the mon faints.
; Backed up if the enemy switches.
; All bits cleared if the enemy faints.
	ds 1

TypeModifier::
; >10: super-effective
;  10: normal
; <10: not very effective
; bit 7: stab
	ds 1

CriticalHit::
; 0 if not critical
; 1 for a critical hit
; 2 for a OHKO
	ds 1

AttackMissed::
; nonzero for a miss
	ds 1

PlayerSubStatus1::
; bit
; 7 attract
; 6 encore
; 5 endure
; 4 perish song
; 3 identified
; 2 protect
; 1 curse
; 0 nightmare
	ds 1
PlayerSubStatus2::
; bit
; 7
; 6
; 5
; 4
; 3
; 2
; 1
; 0 curled
	ds 1
PlayerSubStatus3::
; bit
; 7 confused
; 6 flying
; 5 underground
; 4 charged
; 3 flinch
; 2
; 1 rollout
; 0 bide
	ds 1
PlayerSubStatus4::
; bit
; 7 leech seed
; 6 rage
; 5 recharge
; 4 substitute
; 3
; 2 focus energy
; 1 mist
; 0 bide: unleashed energy
	ds 1
PlayerSubStatus5::
; bit
; 7 cant run
; 6 destiny bond
; 5 lock-on
; 4 encore
; 3 transformed
; 2
; 1
; 0 toxic
	ds 1

EnemySubStatus1::
; see PlayerSubStatus1
	ds 1
EnemySubStatus2::
; see PlayerSubStatus2
	ds 1
EnemySubStatus3::
; see PlayerSubStatus3
	ds 1
EnemySubStatus4::
; see PlayerSubStatus4
	ds 1
EnemySubStatus5::
; see PlayerSubStatus5
	ds 1

PlayerRolloutCount::
	ds 1
PlayerConfuseCount::
	ds 1
PlayerToxicCount::
	ds 1
PlayerDisableCount::
	ds 1
PlayerEncoreCount::
	ds 1
PlayerPerishCount::
	ds 1
PlayerFuryCutterCount::
	ds 1
PlayerProtectCount::
	ds 1

EnemyRolloutCount::
	ds 1
EnemyConfuseCount::
	ds 1
EnemyToxicCount::
	ds 1
EnemyDisableCount::
	ds 1
EnemyEncoreCount::
	ds 1
EnemyPerishCount::
	ds 1
EnemyFuryCutterCount::
	ds 1
EnemyProtectCount::
	ds 1

PlayerDamageTaken::
	ds 2
EnemyDamageTaken::
	ds 2

wBattleReward:: ds 3
wBattleAnimParam::
wKickCounter::
wPresentPower:: ds 1
BattleScriptBuffer::
	ds 40

BattleScriptBufferLoc::
	ds 2

wTurnEnded:: ds 1
	ds 1

PlayerStats::
	ds 10
	ds 1
EnemyStats::
	ds 10
	ds 1

PlayerStatLevels::
; 07 neutral
PlayerAtkLevel::
	ds 1
PlayerDefLevel::
	ds 1
PlayerSpdLevel::
	ds 1
PlayerSAtkLevel::
	ds 1

wc6d0::
PlayerSDefLevel::
	ds 1
PlayerAccLevel::
	ds 1
PlayerEvaLevel::
	ds 1
; c6d3
	ds 1
PlayerStatLevelsEnd::

EnemyStatLevels::
; 07 neutral
EnemyAtkLevel::
	ds 1
EnemyDefLevel::
	ds 1
EnemySpdLevel::
	ds 1
EnemySAtkLevel::
	ds 1
EnemySDefLevel::
	ds 1
EnemyAccLevel::
	ds 1
EnemyEvaLevel::
	ds 1

	ds 1
EnemyTurnsTaken::
	ds 1
PlayerTurnsTaken::
	ds 1

	ds 1

PlayerSubstituteHP::
	ds 1
EnemySubstituteHP::
	ds 1

wUnusedPlayerLockedMove:: ds 1
	ds 1
CurPlayerMove::
	ds 1
CurEnemyMove::
	ds 1

LinkBattleRNCount::
; how far through the prng stream
	ds 1

wEnemyItemState:: ds 1
	ds 2
CurEnemyMoveNum::
	ds 1

wEnemyHPAtTimeOfPlayerSwitch:: ds 2
wPayDayMoney:: ds 3

wSafariMonAngerCount:: ds 1
wSafariMonEating:: ds 2
wEnemyBackupDVs::
	ds 2
AlreadyDisobeyed::
	ds 1

DisabledMove::
	ds 1
EnemyDisabledMove::
	ds 1
wWhichMonFaintedFirst:: ds 1

; exists so you can't counter on switch
LastEnemyCounterMove::
	ds 1
LastPlayerCounterMove::
	ds 1

wEnemyMinimized:: ds 1

AlreadyFailed::
	ds 1

wBattleParticipantsIncludingFainted:: ds 1
wDanger:: ds 1
wPlayerMinimized:: ds 1
PlayerScreens::
; bit
; 4 reflect
; 3 light screen
; 2 safeguard
; 0 spikes
	ds 1

EnemyScreens::
; see PlayerScreens
	ds 1

PlayerSafeguardCount::
	ds 1
PlayerLightScreenCount::
	ds 1
PlayerReflectCount::
	ds 1

	ds 1
EnemySafeguardCount::
	ds 1
EnemyLightScreenCount::
	ds 1
EnemyReflectCount::
	ds 1
	ds 2
Weather::
; 00 normal
; 01 rain
; 02 sun
; 03 sandstorm
; 04 rain stopped
; 05 sunliight faded
; 06 sandstorm subsided
	ds 1

WeatherCount::
; # turns remaining
	ds 1

LoweredStat::
	ds 1
EffectFailed::
	ds 1
FailedMessage::
	ds 1
wEnemyGoesFirst::
	ds 1
wPlayerIsSwitching:: ds 1
wEnemyIsSwitching::  ds 1

PlayerUsedMoves::
; add a move that has been used once by the player
; added in order of use
	ds NUM_MOVES

wEnemyAISwitchScore:: ds 1
wEnemySwitchMonParam:: ds 1
wEnemySwitchMonIndex:: ds 1
wTempLevel:: ds 1
LastPlayerMon:: ds 1
LastPlayerMove::
	ds 1
LastEnemyMove::
	ds 1

wPlayerFutureSightCount:: ds 1
wEnemyFutureSightCount:: ds 1
wGivingExperienceToExpShareHolders:: ds 1
wBackupEnemyMonBaseStats:: ds 5
wBackupEnemyMonCatchRate:: db
wBackupEnemyMonBaseExp:: db
wPlayerFutureSightDamage:: ds 2
wEnemyFutureSightDamage:: ds 2
wPlayerRageCounter:: ds 1
wEnemyRageCounter:: ds 1
wBeatUpHitAtLeastOnce:: ds 1
wPlayerTrappingMove:: ds 1
wEnemyTrappingMove:: ds 1
wPlayerWrapCount:: ds 1
wEnemyWrapCount:: ds 1
wPlayerCharging:: ds 1
wEnemyCharging:: ds 1
BattleEnded::
	ds 1

wWildMonMoves:: ds NUM_MOVES
wWildMonPP:: ds NUM_MOVES
wAmuletCoin:: ds 1
wSomeoneIsRampaging:: ds 1
wPlayerJustGotFrozen:: ds 1
wEnemyJustGotFrozen:: ds 1
wBattleEnd::

SECTION "WRAM1", WRAMX, BANK[1]

SECTION "WRAM2", WRAMX, BANK[2]

SECTION "WRAM3", WRAMX, BANK[3]

SECTION "WRAM4", WRAMX, BANK[4]

SECTION "WRAM5", WRAMX, BANK[5]

SECTION "WRAM6", WRAMX, BANK[6]

SECTION "SRAM0", SRAM, BANK[0]

SECTION "SRAM1", SRAM, BANK[1]

