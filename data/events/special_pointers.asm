; Special routines can be used with the "special" map script command.
; They often use wScriptVar for arguments and return values.

add_special: MACRO
; Some ROM0 specials have a nonzero bank.
\1Special::
if _NARG == 1
	dba \1
else
	dbw \2, \1
endc
ENDM

SpecialsPointers::
	add_special WarpToSpawnPoint

; Communications
	add_special SetBitsForLinkTradeRequest
	add_special WaitForLinkedFriend
	add_special CheckLinkTimeout_Receptionist
	add_special TryQuickSave
	add_special CheckBothSelectedSameRoom
	add_special FailedLinkToPast
	add_special CloseLink
	add_special WaitForOtherPlayerToExit
	add_special SetBitsForBattleRequest
	add_special SetBitsForTimeCapsuleRequest
	add_special CheckTimeCapsuleCompatibility
	add_special EnterTimeCapsule
	add_special TradeCenter
	add_special Colosseum
	add_special TimeCapsule
	add_special CableClubCheckWhichChris
	add_special CheckMysteryGift
	add_special GetMysteryGiftItem
	add_special UnlockMysteryGift

; Map events
	add_special BugContestJudging
	add_special CheckPartyFullAfterContest
	add_special ContestDropOffMons
	add_special ContestReturnMons
	add_special GiveParkBalls
	add_special CheckMagikarpLength
	add_special MagikarpHouseSign
	add_special HealParty ; this is both a special and a predef
	add_special PokemonCenterPC
	add_special PlayersHousePC
	add_special DayCareMan
	add_special DayCareLady
	add_special DayCareManOutside
	add_special MoveDeletion
	add_special BankOfMom
	add_special MagnetTrain
	add_special NameRival
	add_special SetDayOfWeek
	add_special OverworldTownMap
	add_special UnownPrinter
	add_special MapRadio
	add_special UnownPuzzle
	add_special SlotMachine
	add_special CardFlip
	add_special UnusedMemoryGame ; unused
	add_special ClearBGPalettesBufferScreen ; unused
	add_special FadeOutPalettes
	add_special FadeBlackQuickly
	add_special FadeInPalettes
	add_special FadeInQuickly
	add_special ReloadSpritesNoPalettes, 2
	add_special ClearBGPalettes
	add_special UpdateTimePals
	add_special ClearTilemap ; unused as special
	add_special UpdateSprites
	add_special UpdatePlayerSprite
	add_special GameCornerPrizeMonCheckDex
	add_special UnusedSetSeenMon ; unused
	add_special WaitSFX, 3
	add_special PlayMapMusic
	add_special RestartMapMusic
	add_special HealMachineAnim
	add_special SurfStartStep
	add_special FindPartyMonAboveLevel ; unused
	add_special FindPartyMonAtLeastThatHappy ; unused
	add_special FindPartyMonThatSpecies
	add_special FindPartyMonThatSpeciesYourTrainerID
	add_special UnusedCheckUnusedTwoDayTimer ; unused
	add_special DayCareMon1
	add_special DayCareMon2
	add_special SelectRandomBugContestContestants
	add_special ActivateFishingSwarm
	add_special ToggleMaptileDecorations
	add_special ToggleDecorationsVisibility
	add_special GiveShuckle
	add_special ReturnShuckie
	add_special BillsGrandfather
	add_special CheckPokerus
	add_special DisplayCoinCaseBalance
	add_special DisplayMoneyAndCoinBalance
	add_special PlaceMoneyTopRight
	add_special CheckForLuckyNumberWinners
	add_special CheckLuckyNumberShowFlag
	add_special ResetLuckyNumberShowFlag
	add_special PrintTodaysLuckyNumber
	add_special SelectApricornForKurt
	add_special NameRater
	add_special DisplayLinkRecord
	add_special GetFirstPokemonHappiness
	add_special CheckFirstMonIsEgg
	add_special RandomUnseenWildMon
	add_special RandomPhoneWildMon
	add_special RandomPhoneMon
	add_special LoadUsedSpritesGFX
	add_special PlaySlowCry
	add_special SnorlaxAwake
	add_special OlderHaircutBrother
	add_special YoungerHaircutBrother
	add_special DaisysGrooming
	add_special PlayCurMonCry
	add_special ProfOaksPCBoot
	add_special GameboyCheck
	add_special TrainerHouse
	add_special PhotoStudio
	add_special InitRoamMons
	add_special FadeOutMusic
	add_special Diploma
	add_special PrintDiploma
	add_special InitialSetDSTFlag
	add_special InitialClearDSTFlag
	add_special MrChrono
	add_special UnusedDummySpecial ; unused

; Crystal Special Pointers ported to Gold/Silver
	add_special CelebiShrineEvent
	add_special CheckCaughtCelebi
