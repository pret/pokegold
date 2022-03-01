INCLUDE "constants.asm"

INCLUDE "macros/wram.asm"


INCLUDE "vram.asm"


SECTION "Audio RAM", WRAM0

; nonzero if playing
wMusicPlaying:: db

wAudio::
; wChannel1 - wChannel8
for n, 1, NUM_CHANNELS + 1
wChannel{d:n}:: channel_struct wChannel{d:n}
endr

	ds 1

wCurTrackDuty:: db
wCurTrackVolumeEnvelope:: db
wCurTrackFrequency:: dw
wUnusedBCDNumber:: db ; BCD value, dummied out
wCurNoteDuration:: db ; used in MusicE0 and LoadNote

wCurMusicByte:: db
wCurChannel:: db
wVolume::
; corresponds to rNR50
; Channel control / ON-OFF / Volume (R/W)
;   bit 7 - Vin->SO2 ON/OFF
;   bit 6-4 - SO2 output level (volume) (# 0-7)
;   bit 3 - Vin->SO1 ON/OFF
;   bit 2-0 - SO1 output level (volume) (# 0-7)
	db
wSoundOutput::
; corresponds to rNR51
; bit 4-7: ch1-4 so2 on/off
; bit 0-3: ch1-4 so1 on/off
	db
wPitchSweep::
; corresponds to rNR10
; bit 7:   unused
; bit 4-6: sweep time
; bit 3:   sweep direction
; but 0-2: sweep shift
	db

wMusicID:: dw
wMusicBank:: db
wNoiseSampleAddress:: dw
wNoiseSampleDelay:: db
	ds 1
wMusicNoiseSampleSet:: db
wSFXNoiseSampleSet:: db

wLowHealthAlarm::
; bit 7: on/off
; bit 4: pitch
; bit 0-3: counter
	db

wMusicFade::
; fades volume over x frames
; bit 7: fade in/out
; bit 0-5: number of frames for each volume level
; $00 = none (default)
	db
wMusicFadeCount:: db
wMusicFadeID:: dw

	ds 5

wCryPitch:: dw
wCryLength:: dw

wLastVolume:: db
wUnusedMusicF9Flag:: db

wSFXPriority::
; if nonzero, turn off music when playing sfx
	db

	ds 1

wChannel1JumpCondition:: db
wChannel2JumpCondition:: db
wChannel3JumpCondition:: db
wChannel4JumpCondition:: db

wStereoPanningMask:: db

wCryTracks::
; plays only in left or right track depending on what side the monster is on
; both tracks active outside of battle
	db

wSFXDuration:: db
wCurSFX::
; id of sfx currently playing
	db

wAudioEnd::

wMapMusic:: db

wDontPlayMapMusicOnReload:: db


SECTION "WRAM", WRAM0

wLZAddress:: dw
wLZBank::    db

	ds 1

wInputType::        db
wAutoInputAddress:: dw
wAutoInputBank::    db
wAutoInputLength::  db

wDebugFlags:: db
wGameLogicPaused:: db
wSpriteUpdatesEnabled:: db

wUnusedScriptByte:: db

wMapTimeOfDay:: db

	ds 3

wPrinterConnectionOpen:: db
wPrinterOpcode:: db
wPrevDexEntry:: db
wDisableTextAcceleration:: db
wPCItemsCursor:: db
wPCItemsScrollPosition:: db


SECTION "GBC Palettes", WRAM0

; eight 4-color palettes each
wBGPals1:: ds 8 palettes
wOBPals1:: ds 8 palettes
wBGPals2:: ds 8 palettes
wOBPals2:: ds 8 palettes


SECTION "Sprites", WRAM0

wVirtualOAM::
; wVirtualOAMSprite00 - wVirtualOAMSprite39
for n, NUM_SPRITE_OAM_STRUCTS
wVirtualOAMSprite{02d:n}:: sprite_oam_struct wVirtualOAMSprite{02d:n}
endr
wVirtualOAMEnd::


SECTION "Tilemap", WRAM0

wTilemap::
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT
wTilemapEnd::


; This union spans 480 bytes.
SECTION UNION "Miscellaneous", WRAM0

; surrounding tiles
; This buffer determines the size for the rest of the union;
; it uses exactly 480 bytes.
wSurroundingTiles:: ds SURROUNDING_WIDTH * SURROUNDING_HEIGHT


SECTION UNION "Miscellaneous", WRAM0

; box save buffer
; SaveBoxAddress uses this buffer in three steps because it
; needs more space than the buffer can hold.
wBoxPartialData:: ds 480
wBoxPartialDataEnd::


SECTION UNION "Miscellaneous", WRAM0

; 20x18 grid of 8x8 tiles
wTempTilemap::
	ds SCREEN_WIDTH * SCREEN_HEIGHT


SECTION UNION "Miscellaneous", WRAM0

; link patch lists
wPlayerPatchLists:: ds 200
wOTPatchLists:: ds 200


SECTION UNION "Miscellaneous", WRAM0

; This union spans 200 bytes.
UNION
wSpriteAnimData::

wSpriteAnimDict::
; wSpriteAnimDict pairs keys with values
; keys: SPRITE_ANIM_DICT_* indexes (taken from SpriteAnimSeqData)
; values: vTiles0 offsets
	ds NUM_SPRITEANIMDICT_ENTRIES * 2

wSpriteAnimationStructs::
; wSpriteAnim1 - wSpriteAnim10
for n, 1, NUM_SPRITE_ANIM_STRUCTS + 1
; field  0:   index
; fields 1-3: loaded from SpriteAnimSeqData
wSpriteAnim{d:n}:: sprite_anim_struct wSpriteAnim{d:n}
endr
wSpriteAnimationStructsEnd::

wSpriteAnimCount:: db
wCurSpriteOAMAddr:: db

wCurIcon:: db

wCurIconTile:: db
UNION
wSpriteAnimID::
wCurSpriteOAMFlags:: db
NEXTU
wSpriteAnimAddrBackup:: dw
ENDU
wCurAnimVTile:: db
wCurAnimXCoord:: db
wCurAnimYCoord:: db
wCurAnimXOffset:: db
wCurAnimYOffset:: db
wGlobalAnimYOffset:: db
wGlobalAnimXOffset:: db

wSpriteAnimDataEnd::

	ds 7

NEXTU
; timeset temp storage
wTimeSetBuffer::
	ds 20
wInitHourBuffer:: db
	ds 9
wInitMinuteBuffer:: db
	ds 19
wTimeSetBufferEnd::

NEXTU
; hall of fame temp struct
wHallOfFameTemp:: hall_of_fame wHallOfFameTemp

NEXTU
; debug mon color picker
wDebugMiddleColors::
wDebugLightColor:: ds 2
wDebugDarkColor::  ds 2
	ds 6
wDebugRedChannel::   db
wDebugGreenChannel:: db
wDebugBlueChannel::  db

NEXTU
; debug tileset color picker
wDebugPalette::
wDebugWhiteTileColor:: ds 2
wDebugLightTileColor:: ds 2
wDebugDarkTileColor::  ds 2
wDebugBlackTileColor:: ds 2
ENDU

; This union spans 280 bytes.
UNION
; pokedex
wPokedexDataStart::
wPokedexOrder:: ds $100 ; >= NUM_POKEMON
wPokedexOrderEnd::
wDexListingScrollOffset:: db ; offset of the first displayed entry from the start
wDexListingCursor:: db ; Dex cursor
wDexListingEnd:: db ; Last mon to display
wDexListingHeight:: db ; number of entries displayed at once in the dex listing
wCurDexMode:: db ; Pokedex Mode
wDexSearchMonType1:: db ; first type to search
wDexSearchMonType2:: db ; second type to search
wDexSearchResultCount:: db
wDexArrowCursorPosIndex:: db
wDexArrowCursorDelayCounter:: db
wDexArrowCursorBlinkCounter:: db
wDexSearchSlowpokeFrame:: db
wUnlockedUnownMode:: db
wDexCurUnownIndex:: db
wDexUnownCount:: db
wDexConvertedMonType:: db ; mon type converted from dex search mon type
wDexListingScrollOffsetBackup:: db
wDexListingCursorBackup:: db
wBackupDexListingCursor:: db
wBackupDexListingPage:: db
wDexCurLocation:: db
wPokedexDataEnd::
	ds 3

NEXTU
; pokegear
wPokegearPhoneDisplayPosition:: db
wPokegearPhoneCursorPosition:: db
wPokegearPhoneScrollPosition:: db
wPokegearPhoneSelectedPerson:: db
wPokegearPhoneSubmenuCursor:: db
wPokegearMapCursorObjectPointer:: dw
wPokegearMapCursorLandmark:: db
wPokegearMapPlayerIconLandmark:: db
wPokegearRadioChannelBank:: db
wPokegearRadioChannelAddr:: dw
wPokegearRadioMusicPlaying:: db

NEXTU
; trade
wPlayerTrademon:: trademon wPlayerTrademon
wOTTrademon::     trademon wOTTrademon
wTradeAnimAddress:: dw
wLinkPlayer1Name:: ds NAME_LENGTH
wLinkPlayer2Name:: ds NAME_LENGTH
wLinkTradeSendmonSpecies:: db
wLinkTradeGetmonSpecies::  db

NEXTU
; naming screen
wNamingScreenDestinationPointer:: dw
wNamingScreenCurNameLength:: db
wNamingScreenMaxNameLength:: db
wNamingScreenType:: db
wNamingScreenCursorObjectPointer:: dw
wNamingScreenLastCharacter:: db
wNamingScreenStringEntryCoord:: dw

NEXTU
; slot machine
wSlots::
wReel1:: slot_reel wReel1
wReel2:: slot_reel wReel2
wReel3:: slot_reel wReel3
wReel1Stopped:: ds 3
wReel2Stopped:: ds 3
wReel3Stopped:: ds 3
wSlotBias:: db
wSlotBet:: db
wFirstTwoReelsMatching:: db
wFirstTwoReelsMatchingSevens:: db
wSlotMatched:: db
wCurReelStopped:: ds 3
wPayout:: dw
wCurReelXCoord:: db
wCurReelYCoord:: db
	ds 2
wSlotBuildingMatch:: db
wSlotsDataEnd::
	ds 28
wSlotsEnd::

NEXTU
; card flip
wDeck:: ds 4 * 6
wDeckEnd::
wCardFlipNumCardsPlayed:: db
wCardFlipFaceUpCard:: db
wDiscardPile:: ds 4 * 6
wDiscardPileEnd::

; beta poker game
wBetaPokerSGBPals:: db
	ds 2
wBetaPokerSGBAttr:: db
wBetaPokerSGBCol:: db
wBetaPokerSGBRow:: db

NEXTU
; unused memory game
wMemoryGameCards:: ds 9 * 5
wMemoryGameCardsEnd::
wMemoryGameLastCardPicked:: db
wMemoryGameCard1:: db
wMemoryGameCard2:: db
wMemoryGameCard1Location:: db
wMemoryGameCard2Location:: db
wMemoryGameNumberTriesRemaining:: db
wMemoryGameLastMatches:: ds 5
wMemoryGameCounter:: db
wMemoryGameNumCardsMatched:: db

NEXTU
; unown puzzle
wPuzzlePieces:: ds 6 * 6
ENDU


SECTION "Unused Map Buffer", WRAM0

; This was a buffer for map-related pointers in the 1997 G/S prototype.
; See wMapBuffer in pokegold-spaceworld's wram.asm.
wUnusedMapBuffer:: ds 24
wUnusedMapBufferEnd::


SECTION UNION "Overworld Map", WRAM0

; overworld map blocks
wOverworldMapBlocks:: ds 1300
wOverworldMapBlocksEnd::


SECTION UNION "Overworld Map", WRAM0

; decompress buffer in wram
wDecompressScratch:: ds 40 tiles


SECTION UNION "Overworld Map", WRAM0

; GB Printer data
wGameboyPrinterRAM::
wGameboyPrinter2bppSource:: ds 40 tiles
wGameboyPrinter2bppSourceEnd::
wUnusedGameboyPrinterSafeCancelFlag:: db
wPrinterRowIndex:: db

; Printer data
wPrinterData:: ds 4
wPrinterChecksum:: dw
wPrinterHandshake:: db
wPrinterStatusFlags::
; bit 7: set if error 1 (battery low)
; bit 6: set if error 4 (too hot or cold)
; bit 5: set if error 3 (paper jammed or empty)
; if this and the previous byte are both $ff: error 2 (connection error)
	db

wHandshakeFrameDelay:: db
wPrinterSerialFrameDelay:: db
wPrinterSendByteOffset:: dw
wPrinterSendByteCounter:: dw

; tilemap backup?
wPrinterTilemapBuffer:: ds SCREEN_HEIGHT * SCREEN_WIDTH
wPrinterStatus:: db
	ds 1
; High nibble is for margin before the image, low nibble is for after.
wPrinterMargins:: db
wPrinterExposureTime:: db
	ds 16
wGameboyPrinterRAMEnd::


SECTION UNION "Overworld Map", WRAM0

; bill's pc data
wBillsPCData::
wBillsPCPokemonList::
; (species, box number, list index) x30
	ds 3 * 30
	ds 720
wBillsPC_ScrollPosition:: db
wBillsPC_CursorPosition:: db
wBillsPC_NumMonsInBox:: db
wBillsPC_NumMonsOnScreen:: db
wBillsPC_LoadedBox:: db ; 0 if party, 1 - 14 if box, 15 if active box
wBillsPC_BackupScrollPosition:: db
wBillsPC_BackupCursorPosition:: db
wBillsPC_BackupLoadedBox:: db
wBillsPC_MonHasMail:: db
	ds 5
wBillsPCDataEnd::


SECTION UNION "Overworld Map", WRAM0

; Hall of Fame data
wHallOfFamePokemonList:: hall_of_fame wHallOfFamePokemonList


SECTION UNION "Overworld Map", WRAM0

; debug color picker
wDebugOriginalColors:: ds 256 * 4


SECTION UNION "Overworld Map", WRAM0

; unused sprite anims
	ds 4
wUnusedPikachuFrameset:: db
	ds 18
wUnusedJigglypuffNoteXCoord:: db


SECTION UNION "Overworld Map", WRAM0

; raw link data
wLinkData:: ds 1300
wLinkDataEnd::


SECTION UNION "Overworld Map", WRAM0

; link data members
wLinkPlayerName:: ds NAME_LENGTH
wLinkPartyCount:: db
wLinkPartySpecies:: ds PARTY_LENGTH
wLinkPartyEnd:: db ; older code doesn't check PartyCount

UNION
; link player data
wLinkPlayerData::
; wLinkPlayerPartyMon1 - wLinkPlayerPartyMon6
for n, 1, PARTY_LENGTH + 1
wLinkPlayerPartyMon{d:n}:: party_struct wLinkPlayerPartyMon{d:n}
endr

wLinkPlayerPartyMonOTs::
; wLinkPlayerPartyMon1OT - wLinkPlayerPartyMon6OT
for n, 1, PARTY_LENGTH + 1
wLinkPlayerPartyMon{d:n}OT:: ds NAME_LENGTH
endr

wLinkPlayerPartyMonNicknames::
; wLinkPlayerPartyMon1Nickname - wLinkPlayerPartyMon6Nickname
for n, 1, PARTY_LENGTH + 1
wLinkPlayerPartyMon{d:n}Nickname:: ds MON_NAME_LENGTH
endr

NEXTU
; time capsule party data
wTimeCapsulePlayerData::
; wTimeCapsulePartyMon1 - wTimeCapsulePartyMon6
for n, 1, PARTY_LENGTH + 1
wTimeCapsulePartyMon{d:n}:: red_party_struct wTimeCapsulePartyMon{d:n}
endr

wTimeCapsulePartyMonOTs::
; wTimeCapsulePartyMon1OT - wTimeCapsulePartyMon6OT
for n, 1, PARTY_LENGTH + 1
wTimeCapsulePartyMon{d:n}OT:: ds NAME_LENGTH
endr

wTimeCapsulePartyMonNicknames::
; wTimeCapsulePartyMon1Nickname - wTimeCapsulePartyMon6Nickname
for n, 1, PARTY_LENGTH + 1
wTimeCapsulePartyMon{d:n}Nickname:: ds MON_NAME_LENGTH
endr

NEXTU
; link patch lists
wLinkPatchList1:: ds SERIAL_PATCH_LIST_LENGTH
wLinkPatchList2:: ds SERIAL_PATCH_LIST_LENGTH
ENDU


SECTION UNION "Overworld Map", WRAM0

; link data prep
	ds 1000
wCurLinkOTPartyMonTypePointer:: dw

wLinkOTPartyMonTypes::
; wLinkOTPartyMon1Type - wLinkOTPartyMon6Type
for n, 1, PARTY_LENGTH + 1
wLinkOTPartyMon{d:n}Type:: dw
endr


SECTION UNION "Overworld Map", WRAM0

; link mail data
	ds 500
wLinkPlayerMail::
wLinkPlayerMailPreamble:: ds SERIAL_MAIL_PREAMBLE_LENGTH
wLinkPlayerMailMessages:: ds (MAIL_MSG_LENGTH + 1) * PARTY_LENGTH
wLinkPlayerMailMetadata:: ds (MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1)) * PARTY_LENGTH
wLinkPlayerMailPatchSet:: ds 103
wLinkPlayerMailEnd::
	ds 10
wLinkOTMail::
wLinkOTMailMessages:: ds (MAIL_MSG_LENGTH + 1) * PARTY_LENGTH
wLinkOTMailMetadata:: ds (MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1)) * PARTY_LENGTH
wOTPlayerMailPatchSet:: ds 103 + SERIAL_MAIL_PREAMBLE_LENGTH
wLinkOTMailEnd::
	ds 10


SECTION UNION "Overworld Map", WRAM0

; received link mail data
	ds 500
wLinkReceivedMail:: ds MAIL_STRUCT_LENGTH * PARTY_LENGTH
wLinkReceivedMailEnd:: db


SECTION UNION "Overworld Map", WRAM0

; mystery gift data
wMysteryGiftStaging:: ds 80

wMysteryGiftTrainer:: ds 1 + (1 + 1 + NUM_MOVES) * PARTY_LENGTH + 1
wMysteryGiftTrainerEnd::

	ds 138

wMysteryGiftPartnerData::
wMysteryGiftGameVersion:: db
wMysteryGiftPartnerID:: dw
wMysteryGiftPartnerName:: ds NAME_LENGTH
wMysteryGiftPartnerDexCaught:: db
wMysteryGiftPartnerSentDeco:: db
wMysteryGiftPartnerWhichItem:: db
wMysteryGiftPartnerWhichDeco:: db
wMysteryGiftPartnerBackupItem:: db
	ds 1
wMysteryGiftPartnerDataEnd::

	ds 60

wMysteryGiftPlayerData::
	ds 1
wMysteryGiftPlayerID:: dw
wMysteryGiftPlayerName:: ds NAME_LENGTH
wMysteryGiftPlayerDexCaught:: db
wMysteryGiftPlayerSentDeco:: db
wMysteryGiftPlayerWhichItem:: db
wMysteryGiftPlayerWhichDeco:: db
wMysteryGiftPlayerBackupItem:: db
	ds 1
wMysteryGiftPlayerDataEnd::


SECTION UNION "Overworld Map", WRAM0

; LCD expects wLYOverrides to have an alignment of $100
wLYOverrides:: ds SCREEN_HEIGHT_PX
wLYOverridesEnd::

UNION
	ds 16
wLYOverrides2:: ds SCREEN_HEIGHT_PX
wLYOverrides2End::

NEXTU
	ds $100 - SCREEN_HEIGHT_PX
wLYOverridesBackup:: ds SCREEN_HEIGHT_PX
wLYOverridesBackupEnd:: ds $100 - SCREEN_HEIGHT_PX
ENDU

UNION
; blank credits tile buffer
wCreditsBlankFrame2bpp:: ds 4 * 4 tiles
wCreditsBlankFrame2bppEnd::

NEXTU
; mystery gift data
wUnusedMysteryGiftStagedDataLength:: db
wMysteryGiftMessageCount:: db
wMysteryGiftStagedDataLength:: db

NEXTU
; battle
wBattleAnimTileDict::
; wBattleAnimTileDict pairs keys with values
; keys: ANIM_GFX_* indexes (taken from anim_*gfx arguments)
; values: vTiles0 offsets
	ds NUM_BATTLEANIMTILEDICT_ENTRIES * 2

wActiveAnimObjects::
; wAnimObject1 - wAnimObject10
for n, 1, NUM_ANIM_OBJECTS + 1
wAnimObject{d:n}:: battle_anim_struct wAnimObject{d:n}
endr

wActiveBGEffects::
; wBGEffect1 - wBGEffect5
for n, 1, NUM_BG_EFFECTS + 1
wBGEffect{d:n}:: battle_bg_effect wBGEffect{d:n}
endr

wLastAnimObjectIndex:: db

wBattleAnimFlags:: db
wBattleAnimAddress:: dw
wBattleAnimDelay:: db
wBattleAnimParent:: dw
wBattleAnimLoops:: db
wBattleAnimVar:: db
wBattleAnimByte:: db
wBattleAnimOAMPointerLo:: db

UNION
wBattleObjectTempID:: db
wBattleObjectTempXCoord:: db
wBattleObjectTempYCoord:: db
wBattleObjectTempParam:: db

NEXTU
wBattleBGEffectTempID:: db
wBattleBGEffectTempJumptableIndex:: db
wBattleBGEffectTempTurn:: db
wBattleBGEffectTempParam:: db

NEXTU
wBattleAnimTempOAMFlags:: db
wBattleAnimTempFixY:: db
wBattleAnimTempTileID:: db
wBattleAnimTempXCoord:: db
wBattleAnimTempYCoord:: db
wBattleAnimTempXOffset:: db
wBattleAnimTempYOffset:: db
wBattleAnimTempFrameOAMFlags:: db
wBattleAnimTempPalette:: db

NEXTU
wBattleAnimGFXTempTileID::
wBattleAnimGFXTempPicHeight:: db

NEXTU
wBattleSineWaveTempProgress:: db
wBattleSineWaveTempOffset:: db
wBattleSineWaveTempAmplitude:: db
wBattleSineWaveTempTimer:: db

NEXTU
wBattlePicResizeTempBaseTileID:: db
wBattlePicResizeTempPointer:: dw
ENDU

UNION
	ds 50
wBattleAnimEnd::

NEXTU
wSurfWaveBGEffect:: ds $40
wSurfWaveBGEffectEnd::
ENDU

	ds 134

wBattle::
wEnemyMoveStruct:: move_struct wEnemyMoveStruct
wPlayerMoveStruct:: move_struct wPlayerMoveStruct

wEnemyMonNickname::  ds MON_NAME_LENGTH
wBattleMonNickname:: ds MON_NAME_LENGTH

UNION
; battle mon
wBattleMon:: battle_struct wBattleMon

NEXTU
; intro water/grass/fire cutscene data
	ds 4
wIntroJumptableIndex:: db
wIntroBGMapPointer:: dw
wIntroTilemapPointer:: dw
wIntroTilesPointer:: dw
wIntroFrameCounter1:: db
wIntroFrameCounter2:: db
wIntroSpriteStateFlag:: db
ENDU

	ds 2

wEnemyTrainerItem1:: db
wEnemyTrainerItem2:: db
wEnemyTrainerBaseReward:: db
wEnemyTrainerAIFlags:: ds 3
wOTClassName:: ds TRAINER_CLASS_NAME_LENGTH

wCurOTMon:: db

wBattleParticipantsNotFainted::
; Bit array.  Bits 0 - 5 correspond to party members 1 - 6.
; Bit set if the mon appears in battle.
; Bit cleared if the mon faints.
; Backed up if the enemy switches.
; All bits cleared if the enemy faints.
	db

wTypeModifier::
; >10: super-effective
;  10: normal
; <10: not very effective
; bit 7: stab
	db

wCriticalHit::
; 0 if not critical
; 1 for a critical hit
; 2 for a OHKO
	db

wAttackMissed::
; nonzero for a miss
	db

wPlayerSubStatus1:: db
wPlayerSubStatus2:: db
wPlayerSubStatus3:: db
wPlayerSubStatus4:: db
wPlayerSubStatus5:: db

wEnemySubStatus1:: db
wEnemySubStatus2:: db
wEnemySubStatus3:: db
wEnemySubStatus4:: db
wEnemySubStatus5:: db

wPlayerRolloutCount:: db
wPlayerConfuseCount:: db
wPlayerToxicCount:: db
wPlayerDisableCount:: db
wPlayerEncoreCount:: db
wPlayerPerishCount:: db
wPlayerFuryCutterCount:: db
wPlayerProtectCount:: db

wEnemyRolloutCount:: db
wEnemyConfuseCount:: db
wEnemyToxicCount:: db
wEnemyDisableCount:: db
wEnemyEncoreCount:: db
wEnemyPerishCount:: db
wEnemyFuryCutterCount:: db
wEnemyProtectCount:: db

wPlayerDamageTaken:: dw
wEnemyDamageTaken::  dw

wBattleReward:: ds 3

wBattleAnimParam:: db

wBattleScriptBuffer:: ds 40

wBattleScriptBufferAddress:: dw
wTurnEnded:: db

	ds 1

wPlayerStats::
wPlayerAttack::  dw
wPlayerDefense:: dw
wPlayerSpeed::   dw
wPlayerSpAtk::   dw
wPlayerSpDef::   dw
	ds 1

wEnemyStats::
wEnemyAttack::  dw
wEnemyDefense:: dw
wEnemySpeed::   dw
wEnemySpAtk::   dw
wEnemySpDef::   dw
	ds 1

wPlayerStatLevels::
wPlayerAtkLevel::  db
wPlayerDefLevel::  db
wPlayerSpdLevel::  db
wPlayerSAtkLevel:: db
wPlayerSDefLevel:: db
wPlayerAccLevel::  db
wPlayerEvaLevel::  db
	ds 1

wEnemyStatLevels::
wEnemyAtkLevel::  db
wEnemyDefLevel::  db
wEnemySpdLevel::  db
wEnemySAtkLevel:: db
wEnemySDefLevel:: db
wEnemyAccLevel::  db
wEnemyEvaLevel::  db
	ds 1

wEnemyTurnsTaken::  db
wPlayerTurnsTaken:: db
	ds 1

wPlayerSubstituteHP:: db
wEnemySubstituteHP::  db

wUnusedPlayerLockedMove:: db
	ds 1

wCurPlayerMove:: db
wCurEnemyMove::  db

wLinkBattleRNCount::
; how far through the prng stream
	db

wEnemyItemState:: db
	ds 2
wCurEnemyMoveNum:: db

wEnemyHPAtTimeOfPlayerSwitch:: dw
wPayDayMoney:: ds 3

wSafariMonAngerCount:: db ; unreferenced
wSafariMonEating:: db
	ds 1
wEnemyBackupDVs:: dw ; used when enemy is transformed
wAlreadyDisobeyed:: db

wDisabledMove:: db
wEnemyDisabledMove:: db
wWhichMonFaintedFirst:: db

; exists so you can't counter on switch
wLastPlayerCounterMove:: db
wLastEnemyCounterMove:: db

wEnemyMinimized:: db

wAlreadyFailed:: db

wBattleParticipantsIncludingFainted:: db
wBattleLowHealthAlarm:: db
wPlayerMinimized:: db
wPlayerScreens::
; bit
; 0 spikes
; 1
; 2 safeguard
; 3 light screen
; 4 reflect
; 5-7 unused
	db

wEnemyScreens::
; see wPlayerScreens
	db

wPlayerSafeguardCount:: db
wPlayerLightScreenCount:: db
wPlayerReflectCount:: db
	ds 1

wEnemySafeguardCount:: db
wEnemyLightScreenCount:: db
wEnemyReflectCount:: db
	ds 2

wBattleWeather::
; 00 normal
; 01 rain
; 02 sun
; 03 sandstorm
; 04 rain stopped
; 05 sunliight faded
; 06 sandstorm subsided
	db

wWeatherCount::
; # turns remaining
	db

wLoweredStat:: db
wEffectFailed:: db
wFailedMessage:: db
wEnemyGoesFirst:: db

wPlayerIsSwitching:: db
wEnemyIsSwitching:: db

wPlayerUsedMoves::
; add a move that has been used once by the player
; added in order of use
	ds NUM_MOVES

wEnemyAISwitchScore:: db
wEnemySwitchMonParam:: db
wEnemySwitchMonIndex:: db
wTempLevel:: db
wLastPlayerMon:: db
wLastPlayerMove:: db
wLastEnemyMove:: db

wPlayerFutureSightCount:: db
wEnemyFutureSightCount:: db

wGivingExperienceToExpShareHolders:: db

wBackupEnemyMonBaseStats:: ds NUM_EXP_STATS
wBackupEnemyMonCatchRate:: db
wBackupEnemyMonBaseExp:: db

wPlayerFutureSightDamage:: dw
wEnemyFutureSightDamage:: dw
wPlayerRageCounter:: db
wEnemyRageCounter:: db

wBeatUpHitAtLeastOnce:: db

wPlayerTrappingMove:: db
wEnemyTrappingMove:: db
wPlayerWrapCount:: db
wEnemyWrapCount:: db
wPlayerCharging:: db
wEnemyCharging:: db

wBattleEnded:: db

wWildMonMoves:: ds NUM_MOVES
wWildMonPP:: ds NUM_MOVES

wAmuletCoin:: db

wSomeoneIsRampaging:: db

wPlayerJustGotFrozen:: db
wEnemyJustGotFrozen:: db
wBattleEnd::

	ds 1

ENDU


IF DEF(_DEBUG)
SECTION UNION "Overworld Map", WRAM0

; debug room paged values
UNION
; debug room new item values
wDebugRoomItemID::       db
wDebugRoomItemQuantity:: db
NEXTU
; debug room new pokemon values
wDebugRoomMon::    box_struct wDebugRoomMon
wDebugRoomMonBox:: db
NEXTU
; debug room RTC values
wDebugRoomRTCSec::  db
wDebugRoomRTCMin::  db
wDebugRoomRTCHour:: db
wDebugRoomRTCDay::  dw
wDebugRoomRTCCurSec::  db
wDebugRoomRTCCurMin::  db
wDebugRoomRTCCurHour:: db
wDebugRoomRTCCurDay::  dw
NEXTU
; debug room GB ID values
wDebugRoomGBID:: dw
ENDU

ENDC


SECTION "Video", WRAM0

; wBGMapBuffer
wBGMapBuffer::     ds 40
wBGMapPalBuffer::  ds 40
wBGMapBufferPointers:: ds 20 * 2
wBGMapBufferEnd::

wDefaultSGBLayout:: db

wPlayerHPPal:: db
wEnemyHPPal:: db

wHPPals:: ds PARTY_LENGTH
wCurHPPal:: db

	ds 7

wSGBPals:: ds 48

wAttrmap::
; 20x18 grid of bg tile attributes for 8x8 tiles
; read horizontally from the top row
;		bit 7: priority
;		bit 6: y flip
;		bit 5: x flip
;		bit 4: pal # (non-cgb)
;		bit 3: vram bank (cgb only)
;		bit 2-0: pal # (cgb only)
	ds SCREEN_WIDTH * SCREEN_HEIGHT
wAttrmapEnd::

wTileAnimBuffer:: ds 1 tiles

; link data
UNION
wOtherPlayerLinkMode:: db
wOtherPlayerLinkAction::
wBattleAction:: db
	ds 3
wPlayerLinkAction:: db
wUnusedLinkAction:: db
	ds 3
NEXTU
wLinkReceivedSyncBuffer:: ds 5
wLinkPlayerSyncBuffer:: ds 5
ENDU
wLinkTimeoutFrames:: dw
wLinkByteTimeout:: dw

wMonType:: db

wCurSpecies:: db

wNamedObjectType:: db

	ds 1

wJumptableIndex:: db

UNION
; intro data
wIntroSceneFrameCounter:: db
wIntroSceneTimer:: db

NEXTU
; title data
wTitleScreenSelectedOption:: db
wTitleScreenTimer:: dw

NEXTU
; credits data
wCreditsBorderFrame:: db
wCreditsBorderMon:: db
wCreditsLYOverride:: db

NEXTU
; pokedex
wPrevDexEntryJumptableIndex:: db
wPrevDexEntryBackup::
wPokedexStatus:: db
wUnusedPokedexByte:: db

NEXTU
; pokegear
wPokegearCard:: db
wPokegearMapRegion:: db
wUnusedPokegearByte:: db

NEXTU
; pack
wPackJumptableIndex:: db
wCurPocket:: db
wPackUsedItem:: db

NEXTU
; trainer card badges
wTrainerCardBadgeFrameCounter:: db
wTrainerCardBadgeTileID:: db
wTrainerCardBadgeAttributes:: db

NEXTU
; slot machine
wSlotsDelay:: db
	ds 1
wUnusedSlotReelIconDelay:: db

NEXTU
; card flip
wCardFlipCursorY:: db
wCardFlipCursorX:: db
wCardFlipWhichCard:: db

NEXTU
; unused memory game
wMemoryGameCardChoice:: db

NEXTU
; magnet train
wMagnetTrainOffset:: db
wMagnetTrainPosition:: db
wMagnetTrainWaitCounter:: db

NEXTU
; unown puzzle data
wHoldingUnownPuzzlePiece:: db
wUnownPuzzleCursorPosition:: db
wUnownPuzzleHeldPiece:: db

NEXTU
; battle transitions
wBattleTransitionCounter:: db
wBattleTransitionSineWaveOffset::
wBattleTransitionSpinQuadrant:: db

NEXTU
; bill's pc
wUnusedBillsPCData:: ds 3

NEXTU
; debug mon color picker
wDebugColorRGBJumptableIndex:: db
wDebugColorCurColor:: db
wDebugColorCurMon:: db

NEXTU
; debug tileset color picker
wDebugTilesetCurPalette:: db
wDebugTilesetRGBJumptableIndex:: db
wDebugTilesetCurColor:: db

NEXTU
; miscellaneous
wFrameCounter::
wMomBankDigitCursorPosition::
wNamingScreenLetterCase::
wHallOfFameMonCounter::
wTradeDialog::
	db
wFrameCounter2::
wPrinterQueueLength::
wUnusedSGB1eColorOffset::
	db
ENDU

wRequested2bppSize:: db
wRequested2bppSource:: dw
wRequested2bppDest:: dw

wRequested1bppSize:: db
wRequested1bppSource:: dw
wRequested1bppDest:: dw

wSecondsSince:: db
wMinutesSince:: db
wHoursSince:: db
wDaysSince:: db

	ds 12

wPlayerBGMapOffsetX:: db ; used in FollowNotExact; unit is pixels
wPlayerBGMapOffsetY:: db ; used in FollowNotExact; unit is pixels

wPlayerStepVectorX:: db
wPlayerStepVectorY:: db
wPlayerStepFlags:: db
wPlayerStepDirection:: db

wPlayerNextMovement:: db
wPlayerMovement:: db

	ds 2

wMovementObject:: db
wMovementDataBank:: db
wMovementDataAddress:: dw
wIndexedMovement2Pointer:: dw

	ds 2

wMovementByteWasControlSwitch:: db

UNION
wObjectPriorities:: ds NUM_OBJECT_STRUCTS

NEXTU
wMovementPointer:: dw
	ds 3
wTempObjectCopyMapObjectIndex:: db
wTempObjectCopySprite:: db
wTempObjectCopySpriteVTile:: db
wTempObjectCopyPalette:: db
wTempObjectCopyMovement:: db
wTempObjectCopyRange:: db
wTempObjectCopyX:: db
wTempObjectCopyY:: db
wTempObjectCopyRadius:: db
ENDU

	ds 1

wTileDown::  db
wTileUp::    db
wTileLeft::  db
wTileRight:: db

wTilePermissions:: db

wMenuMetadata::
wWindowStackPointer:: dw
wMenuJoypad:: db
wMenuSelection:: db
wMenuSelectionQuantity:: db
wWhichIndexSet:: db
wScrollingMenuCursorPosition:: db
wWindowStackSize:: db
	ds 8
wMenuMetadataEnd::

; menu header
wMenuHeader::
wMenuFlags:: db
wMenuBorderTopCoord:: db
wMenuBorderLeftCoord:: db
wMenuBorderBottomCoord:: db
wMenuBorderRightCoord:: db
wMenuDataPointer:: dw
wMenuCursorPosition:: db
	ds 8
wMenuHeaderEnd::

wMenuData::
wMenuDataFlags:: db

UNION
; Vertical Menu/DoNthMenu/SetUpMenu
wMenuDataItems:: db
wMenuDataIndicesPointer:: dw
wMenuDataDisplayFunctionPointer:: dw
wMenuDataPointerTableAddr:: dw

NEXTU
; 2D Menu
wMenuData_2DMenuDimensions:: db
wMenuData_2DMenuSpacing:: db
wMenuData_2DMenuItemStringsBank:: db
wMenuData_2DMenuItemStringsAddr:: dw
wMenuData_2DMenuFunctionBank:: db
wMenuData_2DMenuFunctionAddr:: dw

NEXTU
; Scrolling Menu
wMenuData_ScrollingMenuHeight:: db
wMenuData_ScrollingMenuWidth:: db
wMenuData_ScrollingMenuItemFormat:: db
wMenuData_ItemsPointerBank:: db
wMenuData_ItemsPointerAddr:: dw
wMenuData_ScrollingMenuFunction1:: ds 3
wMenuData_ScrollingMenuFunction2:: ds 3
wMenuData_ScrollingMenuFunction3:: ds 3
ENDU
wMenuDataEnd::

wMoreMenuData::
w2DMenuData::
w2DMenuCursorInitY:: db
w2DMenuCursorInitX:: db
w2DMenuNumRows:: db
w2DMenuNumCols:: db
w2DMenuFlags1::
; bit 7: Disable checking of wMenuJoypadFilter
; bit 6: Enable sprite animations
; bit 5: Wrap around vertically
; bit 4: Wrap around horizontally
; bit 3: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 5 is disabled and we tried to go too far down
; bit 2: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 5 is disabled and we tried to go too far up
; bit 1: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 4 is disabled and we tried to go too far left
; bit 0: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 4 is disabled and we tried to go too far right
	db
w2DMenuFlags2:: db
w2DMenuCursorOffsets:: db
wMenuJoypadFilter:: db
w2DMenuDataEnd::
wMenuCursorY:: db
wMenuCursorX:: db
wCursorOffCharacter:: db
wCursorCurrentTile:: dw
	ds 3
wMoreMenuDataEnd::

wOverworldDelay:: db
wTextDelayFrames:: db
wVBlankOccurred:: db

wBetaTitleSequenceOpeningType::
; This selected the title screen animation (fire/notes) in pokegold-spaceworld.
	db

wDefaultSpawnpoint:: db

UNION
; mon buffer
wBufferMonNickname:: ds MON_NAME_LENGTH
wBufferMonOT:: ds NAME_LENGTH
wBufferMon:: party_struct wBufferMon

NEXTU
; magnet train
wMagnetTrainDirection:: db
wMagnetTrainInitPosition:: db
wMagnetTrainHoldPosition:: db
wMagnetTrainFinalPosition:: db
wMagnetTrainPlayerSpriteInitX:: db

NEXTU
; credits
wCreditsPos:: dw
wCreditsTimer:: db

NEXTU
; mail temp storage
wTempMail:: mailmsg wTempMail

NEXTU
; bug-catching contest
wBugContestResults::
	bugcontestwinner wBugContestFirstPlace
	bugcontestwinner wBugContestSecondPlace
	bugcontestwinner wBugContestThirdPlace
wBugContestWinnersEnd::
	bugcontestwinner wBugContestTemp
	ds 4
wBugContestWinnerName:: ds NAME_LENGTH

NEXTU
; mart items
wMartItem1BCD:: ds 3
wMartItem2BCD:: ds 3
wMartItem3BCD:: ds 3
wMartItem4BCD:: ds 3
wMartItem5BCD:: ds 3
wMartItem6BCD:: ds 3
wMartItem7BCD:: ds 3
wMartItem8BCD:: ds 3
wMartItem9BCD:: ds 3
wMartItem10BCD:: ds 3

NEXTU
; town map data
wTownMapPlayerIconLandmark:: db
UNION
wTownMapCursorLandmark:: db
wTownMapCursorObjectPointer:: dw
NEXTU
wTownMapCursorCoordinates:: dw
wStartFlypoint:: db
wEndFlypoint:: db
ENDU

NEXTU
; phone call data
wPhoneScriptBank:: db
wPhoneCaller:: dw

NEXTU
; radio data
wCurRadioLine:: db
wNextRadioLine:: db
wRadioTextDelay:: db
wNumRadioLinesPrinted:: db
wOaksPKMNTalkSegmentCounter:: db
	ds 5
wRadioText:: ds 2 * SCREEN_WIDTH

NEXTU
; lucky number show
wLuckyNumberDigitsBuffer:: ds 5

NEXTU
; movement buffer data
wMovementBufferCount:: db
wMovementBufferObject:: db
wUnusedMovementBufferBank:: db
wUnusedMovementBufferPointer:: dw
wMovementBuffer:: ds 55

NEXTU
; box printing
wWhichBoxMonToPrint:: db
wFinishedPrintingBox:: db
wAddrOfBoxToPrint:: dw
wBankOfBoxToPrint:: db
wWhichBoxToPrint:: db

NEXTU
; Unown printing
wPrintedUnownTileSource:: ds 1 tiles
wPrintedUnownTileDest:: ds 1 tiles

NEXTU
; trainer HUD data
	ds 1
wPlaceBallsDirection:: db
wTrainerHUDTiles:: ds 4

NEXTU
; battle exp gain
wExperienceGained:: ds 3

NEXTU
; earthquake data buffer
wEarthquakeMovementDataBuffer:: ds 5

NEXTU
; switching items in pack
wSwitchItemBuffer:: ds 2 ; may store 1 or 2 bytes

NEXTU
; switching pokemon in party
; may store NAME_LENGTH, PARTYMON_STRUCT_LENGTH, or MAIL_STRUCT_LENGTH bytes
wSwitchMonBuffer:: ds 48

NEXTU
; giving pokemon mail
wMonMailMessageBuffer:: ds MAIL_MSG_LENGTH + 1

NEXTU
; bill's pc
UNION
wBoxNameBuffer:: ds BOX_NAME_LENGTH
NEXTU
	ds 1
wBillsPCTempListIndex:: db
wBillsPCTempBoxCount:: db
ENDU

NEXTU
; prof. oak's pc
wTempPokedexSeenCount:: db
wTempPokedexCaughtCount:: db

NEXTU
; player's room pc
UNION
wDecoNameBuffer:: ds ITEM_NAME_LENGTH
NEXTU
wNumOwnedDecoCategories:: db
wOwnedDecoCategories:: ds 16
ENDU

NEXTU
; trade
wCurTradePartyMon:: db
wCurOTTradePartyMon:: db
wBufferTrademonNickname:: ds MON_NAME_LENGTH

NEXTU
; link battle record data
wLinkBattleRecordBuffer::
wLinkBattleRecordName::   ds NAME_LENGTH
wLinkBattleRecordWins::   dw
wLinkBattleRecordLosses:: dw
wLinkBattleRecordDraws::  dw

NEXTU
; miscellaneous
wTempDayOfWeek::
wPrevPartyLevel::
wCurBeatUpPartyMon::
wUnownPuzzleCornerTile::
wKeepSevenBiasChance::
wPokeFluteCuredSleep::
wTempRestorePPItem::
	db

NEXTU
; debug color picker
wDebugColorIsTrainer:: db
wDebugColorIsShiny:: db
wDebugColorCurTMHM:: db

IF DEF(_DEBUG)
NEXTU
; debug room paged values
wDebugRoomCurPage::        db
wDebugRoomCurValue::       db
wDebugRoomAFunction::      dw
wDebugRoomStartFunction::  dw
wDebugRoomSelectFunction:: dw
wDebugRoomAutoFunction::   dw
wDebugRoomPageCount::      db
wDebugRoomPagesPointer::   dw
ENDC

NEXTU
; Every previous NEXTU takes up 60 or fewer bytes,
; except the initial "mon buffer" UNION.
	ds 60

UNION
; trainer data
wSeenTrainerBank:: db
wSeenTrainerDistance:: db
wSeenTrainerDirection:: db
wTempTrainer::
wTempTrainerEventFlag:: dw
wTempTrainerClass:: db
wTempTrainerID:: db
wSeenTextPointer:: dw
wWinTextPointer:: dw
wLossTextPointer:: dw
wScriptAfterPointer:: dw
wRunningTrainerBattleScript:: db
wTempTrainerEnd::

NEXTU
; menu items list
wMenuItemsList:: ds 16
wMenuItemsListEnd::

NEXTU
; fruit tree data
wCurFruitTree:: db
wCurFruit:: db

NEXTU
; item ball data
wItemBallData::
wItemBallItemID:: db
wItemBallQuantity:: db
wItemBallDataEnd::

NEXTU
; hidden item data
wHiddenItemData::
wHiddenItemEvent:: dw
wHiddenItemID:: db
wHiddenItemDataEnd::

NEXTU
; elevator data
wElevatorData::
wElevatorPointerBank:: db
wElevatorPointer:: dw
wElevatorOriginFloor:: db
wElevatorDataEnd::

NEXTU
; coord event data
wCurCoordEvent::
wCurCoordEventSceneID:: db
wCurCoordEventMapY:: db
wCurCoordEventMapX:: db
	ds 1
wCurCoordEventScriptAddr:: dw

NEXTU
; BG event data
wCurBGEvent::
wCurBGEventYCoord:: db
wCurBGEventXCoord:: db
wCurBGEventType:: db
wCurBGEventScriptAddr:: dw

NEXTU
; mart data
wMartType:: db
wMartPointerBank:: db
wMartPointer:: dw
wMartJumptableIndex:: db
wBargainShopFlags:: db

NEXTU
; player movement data
wCurInput::
wFacingTileID:: db
wWalkingIntoNPC:: db
wWalkingIntoLand:: db
wWalkingIntoEdgeWarp:: db
wMovementAnimation:: db
wWalkingDirection:: db
wFacingDirection:: db
wWalkingX:: db
wWalkingY:: db
wWalkingTile:: db
	ds 6
wPlayerTurningDirection:: db

NEXTU
; std script buffer
	ds 1
wJumpStdScriptBuffer:: ds 3

NEXTU
; phone script data
wCheckedTime:: db
wPhoneListIndex:: db
wNumAvailableCallers:: db
wAvailableCallers:: ds CONTACT_LIST_SIZE

NEXTU
; phone caller contact
	ds 1
wCallerContact:: ds PHONE_CONTACT_SIZE

NEXTU
; backup menu data
	ds 7
wMenuCursorPositionBackup:: db
wMenuScrollPositionBackup:: db

NEXTU
; poison step data
wPoisonStepData::
wPoisonStepFlagSum:: db
wPoisonStepPartyFlags:: ds PARTY_LENGTH
wPoisonStepDataEnd::
ENDU

	ds 1

wBoxAlignment:: db
wFarDecompressPicPointer:: dw
wFXAnimID:: dw
ENDU

wPlaceBallsX:: db
wPlaceBallsY:: db
wTileAnimationTimer:: db

; palette backups?
wBGP:: db
wOBP0:: db
wOBP1:: db

wNumHits:: db

	ds 1

wMonOrItemNameBuffer:: ds NAME_LENGTH
	ds NAME_LENGTH
wTMHMMoveNameBackup:: ds MOVE_NAME_LENGTH

wStringBuffer1:: ds STRING_BUFFER_LENGTH
wStringBuffer2:: ds STRING_BUFFER_LENGTH
wStringBuffer3:: ds STRING_BUFFER_LENGTH
wStringBuffer4:: ds STRING_BUFFER_LENGTH
wStringBuffer5:: ds MOVE_NAME_LENGTH

wBattleMenuCursorPosition:: db

	ds 1

wCurBattleMon:: 
; index of the player's mon currently in battle (0-5)
	db

wCurMoveNum:: db

wLastPocket:: db

wPartyMenuCursor:: db
wItemsPocketCursor:: db
wKeyItemsPocketCursor:: db
wBallsPocketCursor:: db
wTMHMPocketCursor:: db

	ds 1

wItemsPocketScrollPosition:: db
wKeyItemsPocketScrollPosition:: db
wBallsPocketScrollPosition:: db
wTMHMPocketScrollPosition:: db

wSwitchMon::
wSwitchItem::
wSwappingMove::
	db

wMenuScrollPosition:: ds 4

wQueuedScriptBank:: db
wQueuedScriptAddr:: dw

wPredefID:: db
wPredefHL:: dw
wPredefAddress:: dw
wFarCallBC:: dw
	ds 1

wNumMoves:: db

wFieldMoveSucceeded::
wItemEffectSucceeded::
wBattlePlayerAction::
; 0 - use move
; 1 - use item
; 2 - switch
wSolvedUnownPuzzle::
	db

wVramState::
; bit 0: overworld sprite updating on/off
; bit 6: something to do with text
; bit 7: on when surf initiates
;        flickers when climbing waterfall
	db

	ds 3

wBattleResult::
; WIN, LOSE, or DRAW
; bit 7: box full
	db

	ds 1

wUsingItemWithSelect:: db

UNION
; mart data
wCurMartCount:: db
wCurMartItems:: ds 15

NEXTU
; elevator data
wCurElevatorCount:: db
wCurElevatorFloors:: ds 15

NEXTU
; mailbox data
wCurMessageScrollPosition:: db
wCurMessageIndex:: db
wMailboxCount:: db
wMailboxItems:: ds MAILBOX_CAPACITY
ENDU

wListPointer:: dw
wUnusedNamesPointer:: dw


SECTION "WRAM 1", WRAMX

wItemAttributesPointer:: dw

wCurItem:: db
wCurItemQuantity::
wMartItemID::
	db

wCurPartySpecies:: db

wCurPartyMon::
; index of mon's party location (0-5)
	db

	ds 1

wWhichHPBar::
; 0: Enemy
; 1: Player
; 2: Party Menu
	db

wPokemonWithdrawDepositParameter::
; 0: Take from PC
; 1: Put into PC
; 2: Take from Day-Care
; 3: Put into Day-Care
	db

wItemQuantityChange:: db
wItemQuantity:: db

wTempMon:: party_struct wTempMon

wSpriteFlags:: db

wHandlePlayerStep:: db

	ds 1

wPartyMenuActionText:: db

wItemAttributeValue:: db

wCurPartyLevel:: db

wScrollingMenuListSize:: db

wLinkMode:: db
; 0 not in link battle
; 1 link battle

; used when following a map warp
wNextWarp:: db
wNextMapGroup:: db
wNextMapNumber:: db
wPrevWarp:: db
wPrevMapGroup:: db
wPrevMapNumber:: db

	ds 17

wUnusedAddOutdoorSpritesReturnValue:: db

wBGMapAnchor:: dw

wUsedSprites:: ds SPRITE_GFX_LIST_CAPACITY * 2
wUsedSpritesEnd::
	ds 8

wOverworldMapAnchor:: dw
wMetatileStandingY:: db
wMetatileStandingX:: db

wMapPartial::
wMapAttributesBank:: db
wMapTileset:: db
wEnvironment:: db
wMapAttributesPointer:: dw
wMapPartialEnd::

wMapAttributes::
wMapBorderBlock:: db
; width/height are in blocks (2x2 walkable tiles, 4x4 graphics tiles)
wMapHeight:: db
wMapWidth:: db
wMapBlocksBank:: db
wMapBlocksPointer:: dw
wMapScriptsBank:: db
wMapScriptsPointer:: dw
wMapEventsPointer:: dw
; bit set
wMapConnections:: db
wMapAttributesEnd::

wNorthMapConnection:: map_connection_struct wNorth
wSouthMapConnection:: map_connection_struct wSouth
wWestMapConnection::  map_connection_struct wWest
wEastMapConnection::  map_connection_struct wEast

wTileset::
wTilesetBank:: db
wTilesetAddress:: dw
wTilesetBlocksBank:: db
wTilesetBlocksAddress:: dw
wTilesetCollisionBank:: db
wTilesetCollisionAddress:: dw
wTilesetAnim:: dw ; bank 3f
	ds 2 ; unused
wTilesetPalettes:: dw ; bank 3f
wTilesetEnd::
	assert wTilesetEnd - wTileset == TILESET_LENGTH

wEvolvableFlags:: flag_array PARTY_LENGTH

wForceEvolution:: db

UNION
; general-purpose HP buffers
wHPBuffer1:: dw
wHPBuffer2:: dw
wHPBuffer3:: dw

NEXTU
; HP bar animations
wCurHPAnimMaxHP::   dw
wCurHPAnimOldHP::   dw
wCurHPAnimNewHP::   dw
wCurHPAnimPal::     db
wCurHPBarPixels::   db
wNewHPBarPixels::   db
wCurHPAnimDeltaHP:: dw
wCurHPAnimLowHP::   db
wCurHPAnimHighHP::  db

NEXTU
; move AI
wEnemyAIMoveScores:: ds NUM_MOVES

NEXTU
; switch AI
wEnemyEffectivenessVsPlayerMons:: flag_array PARTY_LENGTH
wPlayerEffectivenessVsEnemyMons:: flag_array PARTY_LENGTH

NEXTU
; battle HUD
wBattleHUDTiles:: ds PARTY_LENGTH

NEXTU
; thrown ball data
wFinalCatchRate:: db
wThrownBallWobbleCount:: db

NEXTU
; evolution data
wEvolutionOldSpecies:: db
wEvolutionNewSpecies:: db
wEvolutionPicOffset::  db
wEvolutionCanceled::   db

NEXTU
; experience
wExpToNextLevel:: ds 3

NEXTU
; PP Up
wPPUpPPBuffer:: ds NUM_MOVES

NEXTU
; lucky number show
wMonIDDigitsBuffer:: ds 5

NEXTU
; mon submenu
wMonSubmenuCount:: db
wMonSubmenuItems:: ds NUM_MONMENU_ITEMS + 1

NEXTU
; field move data
wFieldMoveData::
wFieldMoveJumptableIndex:: db
wEscapeRopeOrDigType::
wSurfingPlayerState::
wFishingRodUsed:: db
wCutWhirlpoolOverworldBlockAddr:: dw
wCutWhirlpoolReplacementBlock:: db
wCutWhirlpoolAnimationType::
wStrengthSpecies::
wFishingResult:: db
	ds 1
wFieldMoveDataEnd::

NEXTU
; hidden items
wCurMapScriptBank:: db
wRemainingBGEventCount:: db
wBottomRightYCoord:: db
wBottomRightXCoord:: db

NEXTU
; heal machine anim
wHealMachineAnimType::  db
wHealMachineTempOBP1::  db
wHealMachineAnimState:: db

NEXTU
; decorations
wCurDecoration::          db
wSelectedDecorationSide:: db
wSelectedDecoration::     db
wOtherDecoration::        db
wChangedDecorations::     db
wCurDecorationCategory::  db

NEXTU
; withdraw/deposit items
wPCItemQuantityChange:: db
wPCItemQuantity:: db

NEXTU
; mail
wCurMailAuthorID:: dw
wCurMailIndex:: db

NEXTU
; kurt
wKurtApricornCount:: db
wKurtApricornItems:: ds 10

NEXTU
; tree mons
wTreeMonCoordScore:: db
wTreeMonOTIDScore::  db

NEXTU
; restart clock
wRestartClockCurDivision::   db
wRestartClockPrevDivision::  db
wRestartClockUpArrowYCoord:: db
wRestartClockDay::  db
wRestartClockHour:: db
wRestartClockMin::  db

NEXTU
; link
	ds 9
wLinkBattleRNPreamble:: ds SERIAL_RN_PREAMBLE_LENGTH
wLinkBattleRNs:: ds SERIAL_RNS_LENGTH

NEXTU
; miscellaneous bytes
wSkipMovesBeforeLevelUp::
wRegisteredPhoneNumbers::
wListMovesLineSpacing:: db
wSwitchMonTo:: db
wSwitchMonFrom:: db
	ds 4
wCurEnemyItem:: db

NEXTU
; miscellaneous words
wBuySellItemPrice::
wTempMysteryGiftTimer::
wMagikarpLength:: dw
ENDU

wTempEnemyMonSpecies::  db
wTempBattleMonSpecies:: db

wEnemyMon:: battle_struct wEnemyMon
wEnemyMonBaseStats:: ds NUM_EXP_STATS
wEnemyMonCatchRate:: db
wEnemyMonBaseExp::   db
wEnemyMonEnd::

wBattleMode::
; 0: overworld
; 1: wild battle
; 2: trainer battle
	db

wTempWildMonSpecies:: db

wOtherTrainerClass::
; class (Youngster, Bug Catcher, etc.) of opposing trainer
; 0 if opponent is a wild Pokémon, not a trainer
	db

; BATTLETYPE_* values
wBattleType:: db

	ds 1

wOtherTrainerID::
; which trainer of the class that you're fighting
; (Joey, Mikey, Albert, etc.)
	db

wForcedSwitch:: db

wTrainerClass:: db

wUnownLetter:: db

wMoveSelectionMenuType:: db

; corresponds to the data/pokemon/base_stats/*.asm contents
wCurBaseData::
wBaseDexNo:: db
wBaseStats::
wBaseHP:: db
wBaseAttack:: db
wBaseDefense:: db
wBaseSpeed:: db
wBaseSpecialAttack:: db
wBaseSpecialDefense:: db
wBaseType::
wBaseType1:: db
wBaseType2:: db
wBaseCatchRate:: db
wBaseExp:: db
wBaseItems::
wBaseItem1:: db
wBaseItem2:: db
wBaseGender:: db
wBaseUnknown1:: db
wBaseEggSteps:: db
wBaseUnknown2:: db
wBasePicSize:: db
wBaseUnusedFrontpic:: dw
wBaseUnusedBackpic:: dw
wBaseGrowthRate:: db
wBaseEggGroups:: db
wBaseTMHM:: flag_array NUM_TM_HM
wCurBaseDataEnd::
	assert wCurBaseDataEnd - wCurBaseData == BASE_DATA_SIZE

	ds 1

wCurDamage:: dw

	ds 2

wMornEncounterRate::  db
wDayEncounterRate::   db
wNiteEncounterRate::  db
wWaterEncounterRate:: db
wListMoves_MoveIndicesBuffer:: ds NUM_MOVES
wPutativeTMHMMove:: db
wInitListType:: db
wWildMon:: db
wBattleHasJustStarted:: db

wNamedObjectIndex::
wTextDecimalByte::
wTempByteValue::
wNumSetBits::
wTypeMatchup::
wCurType::
wTempSpecies::
wTempIconSpecies::
wTempTMHM::
wTempPP::
wNextBoxOrPartyIndex::
wChosenCableClubRoom::
wBreedingCompatibility::
wMoveGrammar::
wApplyStatLevelMultipliersToEnemy::
wUsePPUp::
	db

wFailedToFlee:: db
wNumFleeAttempts:: db
wMonTriedToEvolve:: db

wROMBankBackup:: db
wFarByte::
wTempBank:: db

wTimeOfDay:: db

	ds 1

wMapStatus:: db
wMapEventStatus:: db

wScriptFlags::
; bit 3: run deferred script
	db
	ds 1
wScriptFlags2::
; bit 0: count steps
; bit 1: coord events
; bit 2: warps and connections
; bit 4: wild encounters
; bit 5: unknown
	db

wScriptMode:: db
wScriptRunning:: db
wScriptBank:: db
wScriptPos:: dw

wScriptStackSize:: db
wScriptStack:: ds 3 * 5
wScriptVar:: db
wScriptDelay:: db

wDeferredScriptBank::
wScriptTextBank::
	db
wDeferredScriptAddr::
wScriptTextAddr::
	dw
	ds 1
wWildEncounterCooldown:: db

wXYComparePointer:: dw
wXYCompareFlags:: flag_array MAX_XYCOMPARE_LENGTH

wBattleScriptFlags:: db
	ds 1
wPlayerSpriteSetupFlags::
	db

wMapReentryScriptQueueFlag:: db
wMapReentryScriptBank:: db
wMapReentryScriptAddress:: dw

	ds 4

wTimeCyclesSinceLastCall:: db
wReceiveCallDelay_MinsRemaining:: db
wReceiveCallDelay_StartTime:: ds 3

	ds 3

wBugContestMinsRemaining:: db
wBugContestSecsRemaining:: db

	ds 2

wMapStatusEnd::

	ds 2

wOptions::
; bit 0-2: number of frames to delay when printing text
;   fast 1; mid 3; slow 5
; bit 3: ?
; bit 4: no text delay
; bit 5: stereo off/on
; bit 6: battle style shift/set
; bit 7: battle scene off/on
	db

wSaveFileExists:: db
wTextboxFrame::
; bits 0-2: textbox frame 0-7
	db

wTextboxFlags::
; bit 0: 1-frame text delay
; bit 1: when unset, no text delay
	db
wGBPrinterBrightness::
; bit 0-6: brightness
;   lightest: $00
;   lighter:  $20
;   normal:   $40 (default)
;   darker:   $60
;   darkest:  $7F
	db
wOptions2::
; bit 0: menu account off/on
	db

	ds 2

wOptionsEnd::


SECTION "Game Data", WRAMX

wGameData::
wPlayerData::
wPlayerData1::
wPlayerID:: dw

wPlayerName:: ds NAME_LENGTH
wMomsName::   ds NAME_LENGTH
wRivalName::  ds NAME_LENGTH
wRedsName::   ds NAME_LENGTH
wGreensName:: ds NAME_LENGTH

wSavedAtLeastOnce:: db
wSpawnAfterChampion:: db

; init time set at newgame
wStartDay::    db
wStartHour::   db
wStartMinute:: db
wStartSecond:: db

wRTC:: ds 4

wDSTBackupDay::     db
wDSTBackupHours::   db
wDSTBackupMinutes:: db
wDSTBackupSeconds:: db

wDST::
; bit 7: dst
	db

	ds 1

wGameTimeCap::     db
wGameTimeHours::   dw
wGameTimeMinutes:: db
wGameTimeSeconds:: db
wGameTimeFrames::  db

	ds 2

wCurDay:: db

	ds 1

wObjectFollow_Leader:: db
wObjectFollow_Follower:: db
wCenteredObject:: db
wFollowerMovementQueueLength:: db
wFollowMovementQueue:: ds 5

UNION
wObjectStructs::
wPlayerStruct:: object_struct wPlayer ; player is object struct 0
; wObjectStruct1 - wObjectStruct12
for n, 1, NUM_OBJECT_STRUCTS
wObject{d:n}Struct:: object_struct wObject{d:n}
endr
NEXTU
	ds 458
wPlayerData1End::
wPlayerData2::
ENDU

wCmdQueue:: ds CMDQUEUE_CAPACITY * CMDQUEUE_ENTRY_SIZE

	ds 40

wMapObjects::
wPlayerObject:: map_object wPlayer ; player is map object 0
; wMap1Object - wMap15Object
for n, 1, NUM_OBJECTS
wMap{d:n}Object:: map_object wMap{d:n}
endr

wObjectMasks:: ds NUM_OBJECTS

wVariableSprites:: ds $100 - SPRITE_VARS

wEnteredMapFromContinue:: db
	ds 2
wTimeOfDayPal:: db
	ds 4
wTimeOfDayPalFlags:: db
wTimeOfDayPalset:: db
wCurTimeOfDay:: db

	ds 1

wPlayerData2End::
wPlayerData3::
wStatusFlags::
	db
wStatusFlags2:: db

wMoney:: ds 3
wMomsMoney:: ds 3

wMomSavingMoney::
; bit 0: saving some money
; bit 1: saving half money (unused)
; bit 2: saving all money (unused)
; bit 7: active
	db

wCoins:: dw

wBadges::
wJohtoBadges:: flag_array NUM_JOHTO_BADGES
wKantoBadges:: flag_array NUM_KANTO_BADGES

wTMsHMs:: ds NUM_TMS + NUM_HMS

wNumItems:: db
wItems:: ds MAX_ITEMS * 2 + 1

wNumKeyItems:: db
wKeyItems:: ds MAX_KEY_ITEMS + 1

wNumBalls:: db
wBalls:: ds MAX_BALLS * 2 + 1

wNumPCItems:: db
wPCItems:: ds MAX_PC_ITEMS * 2 + 1

wPokegearFlags::
; bit 0: map
; bit 1: radio
; bit 2: phone
; bit 3: expn
; bit 7: on/off
	db
wRadioTuningKnob:: db
wLastDexMode:: db
	ds 1
wWhichRegisteredItem:: db
wRegisteredItem:: db

wPlayerState:: db

wHallOfFameCount:: db
	ds 1
wTradeFlags:: flag_array NUM_NPC_TRADES

	ds 33

wMooMooBerries:: db
wUndergroundSwitchPositions:: db

	ds 14

wPokecenter2FSceneID::                            db
wTradeCenterSceneID::                             db
wColosseumSceneID::                               db
wTimeCapsuleSceneID::                             db
wPowerPlantSceneID::                              db
wCeruleanGymSceneID::                             db
wRoute25SceneID::                                 db
wTrainerHouseB1FSceneID::                         db
wVictoryRoadGateSceneID::                         db
wSaffronMagnetTrainStationSceneID::               db
wRoute16GateSceneID::                             db
wRoute17Route18GateSceneID::                      db
wIndigoPlateauPokecenter1FSceneID::               db
wWillsRoomSceneID::                               db
wKogasRoomSceneID::                               db
wBrunosRoomSceneID::                              db
wKarensRoomSceneID::                              db
wLancesRoomSceneID::                              db
wHallOfFameSceneID::                              db
wRoute27SceneID::                                 db
wNewBarkTownSceneID::                             db
wElmsLabSceneID::                                 db
wPlayersHouse1FSceneID::                          db
wRoute29SceneID::                                 db
wCherrygroveCitySceneID::                         db
wMrPokemonsHouseSceneID::                         db
wRoute32SceneID::                                 db
wRoute35NationalParkGateSceneID::                 db
wRoute36NationalParkGateSceneID::                 db
wAzaleaTownSceneID::                              db
wGoldenrodGymSceneID::                            db
wGoldenrodMagnetTrainStationSceneID::             db
wOlivineCitySceneID::                             db
wRoute34SceneID::                                 db
wEcruteakTinTowerEntranceSceneID::                db
wEcruteakPokecenter1FSceneID::                    db
wMahoganyTownSceneID::                            db
wRoute43GateSceneID::                             db
wMountMoonSceneID::                               db
wSproutTower3FSceneID::                           db
wBurnedTower1FSceneID::                           db
wBurnedTowerB1FSceneID::                          db
wRadioTower5FSceneID::                            db
wRuinsOfAlphOutsideSceneID::                      db
wRuinsOfAlphResearchCenterSceneID::               db
wRuinsOfAlphInnerChamberSceneID::                 db
wMahoganyMart1FSceneID::                          db
wTeamRocketBaseB1FSceneID::                       db
wTeamRocketBaseB2FSceneID::                       db
wTeamRocketBaseB3FSceneID::                       db
wGoldenrodUndergroundSwitchRoomEntrancesSceneID:: db
wSilverCaveRoom3SceneID::                         db
wVictoryRoadSceneID::                             db
wDragonsDenB1FSceneID::                           db
wOlivinePortSceneID::                             db
wVermilionPortSceneID::                           db
wFastShip1FSceneID::                              db
wFastShipB1FSceneID::                             db
wMountMoonSquareSceneID::                         db

	ds 197

wEventFlags:: flag_array NUM_EVENTS

wUnusedLinkCommunicationByte:: db

wGameTimerPaused::
; bit 7: game timer paused
	db

	ds 1

wJoypadDisable::
; bits 4, 6, or 7 can be used to disable joypad input
; bit 4
; bit 6: ongoing mon faint animation
; bit 7: ongoing sgb data transfer
	db

	ds 1

wCurBox:: db

	ds 2

wBoxNames:: ds BOX_NAME_LENGTH * NUM_BOXES

	ds 2

wBikeFlags::
; bit 0: using strength
; bit 1: always on bike
; bit 2: downhill
	db
	ds 1 ; cleared along with wBikeFlags by ResetBikeFlags

wCurMapSceneScriptPointer:: dw

wCurCaller:: dw
wCurMapWarpCount:: db
wCurMapWarpsPointer:: dw
wCurMapCoordEventCount:: db
wCurMapCoordEventsPointer:: dw
wCurMapBGEventCount:: db
wCurMapBGEventsPointer:: dw
wCurMapObjectEventCount:: db
wCurMapObjectEventsPointer:: dw
wCurMapSceneScriptCount:: db
wCurMapSceneScriptsPointer:: dw
wCurMapCallbackCount:: db
wCurMapCallbacksPointer:: dw

	ds 2

; Sprite id of each decoration
wDecoBed::           db
wDecoCarpet::        db
wDecoPlant::         db
wDecoPoster::        db
wDecoConsole::       db
wDecoLeftOrnament::  db
wDecoRightOrnament:: db
wDecoBigDoll::       db

; Items bought from Mom
wWhichMomItem:: db
wWhichMomItemSet:: db
wMomItemTriggerBalance:: ds 3

wDailyResetTimer:: dw
wDailyFlags1:: db
wDailyFlags2:: db
	ds 3
wTimerEventStartDay:: db
	ds 3

wFruitTreeFlags:: flag_array NUM_FRUIT_TREES

	ds 2

wLuckyNumberDayTimer:: dw
	ds 2
wSpecialPhoneCallID:: db
	ds 3
wBugContestStartTime:: ds 4 ; day, hour, min, sec
wUnusedTwoDayTimerOn:: db
wUnusedTwoDayTimer:: db
wUnusedTwoDayTimerStartDate:: db

	ds 55

wStepCount:: db
wPoisonStepCount:: db
	ds 2
wHappinessStepCount:: db
	ds 1

wParkBallsRemaining::
wSafariBallsRemaining:: db
wSafariTimeRemaining:: dw

wPhoneList:: ds CONTACT_LIST_SIZE + 1

	ds 22

wLuckyNumberShowFlag:: db
	ds 1
wLuckyIDNumber:: dw

wRepelEffect:: db ; If a Repel is in use, it contains the nr of steps it's still active
wBikeStep:: dw

wPlayerData3End::
wPlayerDataEnd::

wCurMapData::

wVisitedSpawns:: flag_array NUM_SPAWNS

wDigWarpNumber:: db
wDigMapGroup::   db
wDigMapNumber::  db

; used on maps like second floor pokécenter, which are reused, so we know which
; map to return to
wBackupWarpNumber:: db
wBackupMapGroup::   db
wBackupMapNumber::  db

	ds 3

wLastSpawnMapGroup:: db
wLastSpawnMapNumber:: db

	ds 2

wWarpNumber:: db
wMapGroup:: db
wMapNumber:: db
wYCoord:: db
wXCoord:: db
wScreenSave:: ds SCREEN_META_WIDTH * SCREEN_META_HEIGHT

wCurMapDataEnd::


SECTION "Party", WRAMX

wPokemonData::
wPartyCount::   db
wPartySpecies:: ds PARTY_LENGTH
wPartyEnd::     db ; older code doesn't check wPartyCount

wPartyMons::
; wPartyMon1 - wPartyMon6
for n, 1, PARTY_LENGTH + 1
wPartyMon{d:n}:: party_struct wPartyMon{d:n}
endr

wPartyMonOTs::
; wPartyMon1OT - wPartyMon6OT
for n, 1, PARTY_LENGTH + 1
wPartyMon{d:n}OT:: ds NAME_LENGTH
endr

wPartyMonNicknames::
; wPartyMon1Nickname - wPartyMon6Nickname
for n, 1, PARTY_LENGTH + 1
wPartyMon{d:n}Nickname:: ds MON_NAME_LENGTH
endr
wPartyMonNicknamesEnd::

	ds 22

wPokedexCaught:: flag_array NUM_POKEMON
wEndPokedexCaught::

wPokedexSeen:: flag_array NUM_POKEMON
wEndPokedexSeen::

wUnownDex:: ds NUM_UNOWN
wUnlockedUnowns:: db
wFirstUnownSeen:: db

wDayCareMan::
; bit 7: active
; bit 6: egg ready
; bit 5: monsters are compatible
; bit 0: monster 1 in day-care
	db

wBreedMon1Nickname:: ds MON_NAME_LENGTH
wBreedMon1OT:: ds NAME_LENGTH
wBreedMon1:: box_struct wBreedMon1

wDayCareLady::
; bit 7: active
; bit 0: monster 2 in day-care
	db

wStepsToEgg::
	db
wBreedMotherOrNonDitto::
;  z: yes
; nz: no
	db

wBreedMon2Nickname:: ds MON_NAME_LENGTH
wBreedMon2OT:: ds NAME_LENGTH
wBreedMon2:: box_struct wBreedMon2

wEggMonNickname:: ds MON_NAME_LENGTH
wEggMonOT:: ds NAME_LENGTH
wEggMon:: box_struct wEggMon

wBugContestSecondPartySpecies:: db
wContestMon:: party_struct wContestMon

wSwarmMapGroup:: db
wSwarmMapNumber:: db
wFishingSwarmFlag:: db

wRoamMon1:: roam_struct wRoamMon1
wRoamMon2:: roam_struct wRoamMon2
wRoamMon3:: roam_struct wRoamMon3

wRoamMons_CurMapNumber:: db
wRoamMons_CurMapGroup:: db
wRoamMons_LastMapNumber:: db
wRoamMons_LastMapGroup:: db

wBestMagikarpLengthFeet:: db
wBestMagikarpLengthInches:: db
wMagikarpRecordHoldersName:: ds NAME_LENGTH

UNION
wPokedexShowPointerAddr:: dw
wPokedexShowPointerBank:: db
	ds 3

NEXTU
wUnusedEggHatchFlag:: db

NEXTU
; enemy party
wOTPartyData::
wOTPlayerName:: ds NAME_LENGTH
wOTPlayerID:: dw
	ds 8
wOTPartyCount::   db
wOTPartySpecies:: ds PARTY_LENGTH
wOTPartyEnd::     db ; older code doesn't check PartyCount
ENDU

UNION
; ot party mons
wOTPartyMons::
; wOTPartyMon1 - wOTPartyMon6
for n, 1, PARTY_LENGTH + 1
wOTPartyMon{d:n}:: party_struct wOTPartyMon{d:n}
endr

wOTPartyMonOTs::
; wOTPartyMon1OT - wOTPartyMon6OT
for n, 1, PARTY_LENGTH + 1
wOTPartyMon{d:n}OT:: ds NAME_LENGTH
endr

wOTPartyMonNicknames::
; wOTPartyMon1Nickname - wOTPartyMon6Nickname
for n, 1, PARTY_LENGTH + 1
wOTPartyMon{d:n}Nickname:: ds MON_NAME_LENGTH
endr
wOTPartyDataEnd::

NEXTU
; catch tutorial dude pack
wDudeNumItems:: db
wDudeItems:: ds 2 * 4 + 1

wDudeNumKeyItems:: db
wDudeKeyItems:: ds 18 + 1

wDudeNumBalls:: db
wDudeBalls:: ds 2 * 4 + 1
ENDU

wPokemonDataEnd::
wGameDataEnd::


SECTION "Stack", WRAMX

	ds 2
wStackBottom::
	ds $fc
wStackTop::
	ds 1


INCLUDE "sram.asm"

INCLUDE "hram.asm"
