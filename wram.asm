INCLUDE "constants.asm"

INCLUDE "macros/wram.asm"

INCLUDE "vram.asm"


SECTION "Audio RAM", WRAM0

wMusic::

; nonzero if playing
wMusicPlaying:: db ; c000

wChannels::
wChannel1:: channel_struct wChannel1 ; c001
wChannel2:: channel_struct wChannel2 ; c033
wChannel3:: channel_struct wChannel3 ; c065
wChannel4:: channel_struct wChannel4 ; c097

wSFXChannels::
wChannel5:: channel_struct wChannel5 ; c0c9
wChannel6:: channel_struct wChannel6 ; c0fb
wChannel7:: channel_struct wChannel7 ; c12d
wChannel8:: channel_struct wChannel8 ; c15f

	ds 1 ; c191

wCurTrackDuty:: db
wCurTrackVolumeEnvelope:: db
wCurTrackFrequency:: dw
wUnusedBCDNumber:: db ; BCD value, dummied out
wCurNoteDuration:: db ; used in MusicE0 and LoadNote

wCurMusicByte:: db ; c198
wCurChannel:: db ; c199
wVolume:: ; c19a
; corresponds to rNR50
; Channel control / ON-OFF / Volume (R/W)
;   bit 7 - Vin->SO2 ON/OFF
;   bit 6-4 - SO2 output level (volume) (# 0-7)
;   bit 3 - Vin->SO1 ON/OFF
;   bit 2-0 - SO1 output level (volume) (# 0-7)
	db
wSoundOutput:: ; c19b
; corresponds to rNR51
; bit 4-7: ch1-4 so2 on/off
; bit 0-3: ch1-4 so1 on/off
	db
wPitchSweep:: ; c19c
; corresponds to rNR10
; bit 7:   unused
; bit 4-6: sweep time
; bit 3:   sweep direction
; but 0-2: sweep shift
	db

wMusicID:: dw ; c19d
wMusicBank:: db ; c19f
wNoiseSampleAddress:: dw ; c1a0
wNoiseSampleDelay:: db ; c1a2
	ds 1 ; c1a3
wMusicNoiseSampleSet:: db ; c1a4
wSFXNoiseSampleSet:: db ; c1a5

wLowHealthAlarm:: ; c1a6
; bit 7: on/off
; bit 4: pitch
; bit 0-3: counter
	db

wMusicFade:: ; c1a7
; fades volume over x frames
; bit 7: fade in/out
; bit 0-5: number of frames for each volume level
; $00 = none (default)
	db
wMusicFadeCount:: db ; c1a8
wMusicFadeID:: dw ; c1a9

	ds 5

wCryPitch:: dw ; c1b0
wCryLength:: dw ; c1b2

wLastVolume:: db ; c1b4
wUnusedMusicF9Flag:: db ; c1b5

wSFXPriority:: ; c1b6
; if nonzero, turn off music when playing sfx
	db

	ds 1

wChannel1JumpCondition:: db
wChannel2JumpCondition:: db
wChannel3JumpCondition:: db
wChannel4JumpCondition:: db

wStereoPanningMask:: db ; c1bc

wCryTracks:: ; c1bd
; plays only in left or right track depending on what side the monster is on
; both tracks active outside of battle
	db

wSFXDuration:: db
wCurSFX:: ; c1bf
; id of sfx currently playing
	db
wChannelsEnd::

wMapMusic:: db ; c1c0

wDontPlayMapMusicOnReload:: db
wMusicEnd::


SECTION "WRAM", WRAM0

wLZAddress:: dw ; c1c2
wLZBank::    db ; c1c4

	ds 1

wInputType::        db ; c1c6
wAutoInputAddress:: dw ; c1c7
wAutoInputBank::    db ; c1c9
wAutoInputLength::  db ; c1ca

wDebugFlags:: db
wGameLogicPaused:: db ; c1cc
wSpriteUpdatesEnabled:: db

wUnusedScriptByteBuffer:: db

wMapTimeOfDay:: db

	ds 3

wPrinterConnectionOpen:: db
wPrinterOpcode:: db
wPrevDexEntry:: db
wDisableTextAcceleration:: db
wPCItemsCursor:: db
wPCItemsScrollPosition:: db

	ds 39


SECTION "GBC Palettes", WRAM0

; eight 4-color palettes each
wBGPals1:: ds 8 palettes ; c200
wOBPals1:: ds 8 palettes ; c240
wBGPals2:: ds 8 palettes ; c280
wOBPals2:: ds 8 palettes ; c2c0


SECTION "Sprites", WRAM0

wVirtualOAM:: ; c300
wVirtualOAMSprite00:: sprite_oam_struct wVirtualOAMSprite00
wVirtualOAMSprite01:: sprite_oam_struct wVirtualOAMSprite01
wVirtualOAMSprite02:: sprite_oam_struct wVirtualOAMSprite02
wVirtualOAMSprite03:: sprite_oam_struct wVirtualOAMSprite03
wVirtualOAMSprite04:: sprite_oam_struct wVirtualOAMSprite04
wVirtualOAMSprite05:: sprite_oam_struct wVirtualOAMSprite05
wVirtualOAMSprite06:: sprite_oam_struct wVirtualOAMSprite06
wVirtualOAMSprite07:: sprite_oam_struct wVirtualOAMSprite07
wVirtualOAMSprite08:: sprite_oam_struct wVirtualOAMSprite08
wVirtualOAMSprite09:: sprite_oam_struct wVirtualOAMSprite09
wVirtualOAMSprite10:: sprite_oam_struct wVirtualOAMSprite10
wVirtualOAMSprite11:: sprite_oam_struct wVirtualOAMSprite11
wVirtualOAMSprite12:: sprite_oam_struct wVirtualOAMSprite12
wVirtualOAMSprite13:: sprite_oam_struct wVirtualOAMSprite13
wVirtualOAMSprite14:: sprite_oam_struct wVirtualOAMSprite14
wVirtualOAMSprite15:: sprite_oam_struct wVirtualOAMSprite15
wVirtualOAMSprite16:: sprite_oam_struct wVirtualOAMSprite16
wVirtualOAMSprite17:: sprite_oam_struct wVirtualOAMSprite17
wVirtualOAMSprite18:: sprite_oam_struct wVirtualOAMSprite18
wVirtualOAMSprite19:: sprite_oam_struct wVirtualOAMSprite19
wVirtualOAMSprite20:: sprite_oam_struct wVirtualOAMSprite20
wVirtualOAMSprite21:: sprite_oam_struct wVirtualOAMSprite21
wVirtualOAMSprite22:: sprite_oam_struct wVirtualOAMSprite22
wVirtualOAMSprite23:: sprite_oam_struct wVirtualOAMSprite23
wVirtualOAMSprite24:: sprite_oam_struct wVirtualOAMSprite24
wVirtualOAMSprite25:: sprite_oam_struct wVirtualOAMSprite25
wVirtualOAMSprite26:: sprite_oam_struct wVirtualOAMSprite26
wVirtualOAMSprite27:: sprite_oam_struct wVirtualOAMSprite27
wVirtualOAMSprite28:: sprite_oam_struct wVirtualOAMSprite28
wVirtualOAMSprite29:: sprite_oam_struct wVirtualOAMSprite29
wVirtualOAMSprite30:: sprite_oam_struct wVirtualOAMSprite30
wVirtualOAMSprite31:: sprite_oam_struct wVirtualOAMSprite31
wVirtualOAMSprite32:: sprite_oam_struct wVirtualOAMSprite32
wVirtualOAMSprite33:: sprite_oam_struct wVirtualOAMSprite33
wVirtualOAMSprite34:: sprite_oam_struct wVirtualOAMSprite34
wVirtualOAMSprite35:: sprite_oam_struct wVirtualOAMSprite35
wVirtualOAMSprite36:: sprite_oam_struct wVirtualOAMSprite36
wVirtualOAMSprite37:: sprite_oam_struct wVirtualOAMSprite37
wVirtualOAMSprite38:: sprite_oam_struct wVirtualOAMSprite38
wVirtualOAMSprite39:: sprite_oam_struct wVirtualOAMSprite39
wVirtualOAMEnd::


SECTION "Tilemap", WRAM0

wTilemap:: ; c3a0
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT
wTilemapEnd::


SECTION "Miscellaneous", WRAM0

; This union spans 480 bytes from c508 to c6e8.
UNION ; c508
; surrounding tiles
; This buffer determines the size for the rest of the union;
; it uses exactly 480 bytes.
wSurroundingTiles:: ds SURROUNDING_WIDTH * SURROUNDING_HEIGHT

NEXTU ; c508
; box save buffer
; SaveBoxAddress uses this buffer in three steps because it
; needs more space than the buffer can hold.
wBoxPartialData:: ds 480
wBoxPartialDataEnd::

NEXTU ; c508
; 20x18 grid of 8x8 tiles
wTempTilemap::
	ds SCREEN_WIDTH * SCREEN_HEIGHT ; $168 = 360

NEXTU ; c508
; unown puzzle
wUnownPuzzle::
	ds 200
wPuzzlePieces:: ds 6 * 6
	ds 244
wUnownPuzzleEnd::

NEXTU ; c508

; This union spans 200 bytes from c508 to c5d0.
UNION ; c508
; wSpriteAnimDict is a 10x2 dictionary
; keys: taken from third column of SpriteAnimSeqData
; values: vTiles
wSpriteAnimDict:: ds 10 * 2

wSpriteAnimationStructs::
; field  0:   index
; fields 1-3: loaded from SpriteAnimSeqData
wSpriteAnim1::  sprite_anim_struct wSpriteAnim1
wSpriteAnim2::  sprite_anim_struct wSpriteAnim2
wSpriteAnim3::  sprite_anim_struct wSpriteAnim3
wSpriteAnim4::  sprite_anim_struct wSpriteAnim4
wSpriteAnim5::  sprite_anim_struct wSpriteAnim5
wSpriteAnim6::  sprite_anim_struct wSpriteAnim6
wSpriteAnim7::  sprite_anim_struct wSpriteAnim7
wSpriteAnim8::  sprite_anim_struct wSpriteAnim8
wSpriteAnim9::  sprite_anim_struct wSpriteAnim9
wSpriteAnim10:: sprite_anim_struct wSpriteAnim10
wSpriteAnimationStructsEnd::

wSpriteAnimCount:: db
wCurSpriteOAMAddr:: db

wCurIcon:: db ; c5be

wCurIconTile:: db
wSpriteAnimAddrBackup::
wSpriteAnimIDBuffer::
wCurSpriteOAMFlags::
	dw
wCurAnimVTile:: db
wCurAnimXCoord:: db
wCurAnimYCoord:: db
wCurAnimXOffset:: db
wCurAnimYOffset:: db
wGlobalAnimYOffset:: db
wGlobalAnimXOffset:: db
wSpriteAnimsEnd::
	ds 7

NEXTU ; c508
; timeset temp storage
wTimeSetBuffer::
	ds 20
wInitHourBuffer:: db ; c51c
	ds 9
wInitMinuteBuffer:: db ; c526
	ds 19
wTimeSetBufferEnd::

NEXTU ; c508
; hall of fame temp struct
wHallOfFameTemp:: hall_of_fame wHallOfFameTemp

NEXTU ; c508
; link engine data
wLink_c508:: ds 10
wc512:: ds 10

NEXTU ; c508
; unused (engine/menus/debug.asm)
wc508:: ds 13
ENDU ; c5d0

; This union spans 280 bytes from c5d0 to c6e8.
UNION ; c5d0
; pokedex
wPokedexDataStart:: ; c5d0
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

NEXTU ; c5d0
; pokegear
wPokegearPhoneLoadNameBuffer:: db ; c5d0
wPokegearPhoneCursorPosition:: db ; c5d1
wPokegearPhoneScrollPosition:: db ; c5d2
wPokegearPhoneSelectedPerson:: db ; cd3
wPokegearPhoneSubmenuCursor:: db ; c5d4
wPokegearMapCursorObjectPointer:: dw ; c5d5
wPokegearMapCursorLandmark:: db ; c5d7
wPokegearMapPlayerIconLandmark:: db ; c5d8
wPokegearRadioChannelBank:: db ; c5d9
wPokegearRadioChannelAddr:: dw ; c5da
wPokegearRadioMusicPlaying:: db ; c5dc

NEXTU ; c5d0
; trade
wTrademons:: ; c5d0
wPlayerTrademon:: trademon wPlayerTrademon
wOTTrademon::     trademon wOTTrademon
wTrademonsEnd::
wTradeAnimAddress:: dw
wLinkPlayer1Name:: ds NAME_LENGTH
wLinkPlayer2Name:: ds NAME_LENGTH
wLinkTradeSendmonSpecies:: db
wLinkTradeGetmonSpecies::  db

NEXTU
; naming screen
wNamingScreenDestinationPointer:: dw ; c5d0
wNamingScreenCurNameLength:: db ; c5d2
wNamingScreenMaxNameLength:: db ; c5d3
wNamingScreenType:: db ; c5d4
wNamingScreenCursorObjectPointer:: dw ; c5d5
wNamingScreenLastCharacter:: db ; c5d7
wNamingScreenStringEntryCoord:: dw ; c5d8

NEXTU ; c5d0
; slot machine
wSlots:: ; c5d0
wReel1:: slot_reel wReel1
wReel2:: slot_reel wReel2
wReel3:: slot_reel wReel3
; c600
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

NEXTU ; c5d0
; card flip
wCardFlip:: ; c5d0
wDeck:: ds 24
wDeckEnd::
; c5e8
wCardFlipNumCardsPlayed:: db
wCardFlipFaceUpCard:: db
wDiscardPile:: ds 24
wDiscardPileEnd::
wCardFlipEnd::

NEXTU ; c5d0
; dummy game
wDummyGame:: ; c5d0
wDummyGameCards:: ds 9 * 5
wDummyGameCardsEnd::
wDummyGameLastCardPicked:: db ; c5fd
wDummyGameCard1:: db ; c5fe
wDummyGameCard2:: db ; c5ff
wDummyGameCard1Location:: db ; c600
wDummyGameCard2Location:: db ; c601
wDummyGameNumberTriesRemaining:: db ; c602
wDummyGameLastMatches:: ds 5 ; c603
wDummyGameCounter:: db ; c608
wDummyGameNumCardsMatched:: db ; c609
wDummyGameEnd::

NEXTU ; c5d0
; unused (engine/gfx/color.asm)
	ds 50

wc602:: db ; c602
	ds 2

wc605:: db ; c605
wc606:: db ; c606
wc607:: db ; c607
ENDU ; c6e8

ENDU ; c6e8

; This was a buffer for map-related pointers in the 1997 G/S prototype.
; See wMapBuffer in pokegold-spaceworld's wram.asm.
wUnusedMapBuffer:: ds 24
wUnusedMapBufferEnd::


SECTION "Overworld Map", WRAM0

UNION ; c700
; overworld map blocks
wOverworldMapBlocks:: ds 1300 ; c700
wOverworldMapBlocksEnd::

NEXTU ; c700
; decompress buffer in wram
wDecompressScratch:: ds 40 tiles

NEXTU ; c700
; GB Printer screen RAM
wGameboyPrinterRAM::
wGameboyPrinterScreen:: ds SCREEN_HEIGHT * SCREEN_WIDTH ; c700
wGameboyPrinterScreenEnd:: ; c868

NEXTU ; c700
; GB Printer data
wGameboyPrinter2bppSource:: ds 40 tiles
wGameboyPrinter2bppSourceEnd::
wc980:: db
wPrinterRowIndex:: db

; Printer data
wPrinterData:: ds 4
wPrinterChecksum:: dw ; c986
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
wPrinterTilemapBuffer:: ds SCREEN_HEIGHT * SCREEN_WIDTH ; c990
wPrinterTilemapBufferEnd::
wPrinterStatus:: db ; caf8
	ds 1
; High nibble is for margin before the image, low nibble is for after.
wPrinterMargins:: db ; cafa
wPrinterExposureTime:: db ; cafb
	ds 16
wGameboyPrinterRAMEnd::

NEXTU ; c700
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

NEXTU ; c700
; Hall of Fame data
wHallOfFamePokemonList:: hall_of_fame wHallOfFamePokemonList

NEXTU ; c700
; raw link data
wLinkData:: ds $514
wLinkDataEnd::

NEXTU ; c700
; unused (engine/gfx/sprite_anims.asm)
	ds 4
wc704:: ds 19
wc717:: ds 1

NEXTU ; c700
; link data members
wLinkPlayerName:: ds NAME_LENGTH
wLinkPartyCount:: db
wLinkPartySpecies:: ds PARTY_LENGTH
wLinkPartyEnd:: db ; older code doesn't check PartyCount

UNION ; c713
; time capsule party data
wTimeCapsulePlayerData::
wTimeCapsulePartyMon1:: red_party_struct wTimeCapsulePartyMon1
wTimeCapsulePartyMon2:: red_party_struct wTimeCapsulePartyMon2
wTimeCapsulePartyMon3:: red_party_struct wTimeCapsulePartyMon3
wTimeCapsulePartyMon4:: red_party_struct wTimeCapsulePartyMon4
wTimeCapsulePartyMon5:: red_party_struct wTimeCapsulePartyMon5
wTimeCapsulePartyMon6:: red_party_struct wTimeCapsulePartyMon6
wTimeCapsulePartyMonOTNames:: ds PARTY_LENGTH * NAME_LENGTH
wTimeCapsulePartyMonNicks:: ds PARTY_LENGTH * MON_NAME_LENGTH
wTimeCapsulePlayerDataEnd::

NEXTU ; c713
; link player data
wLinkPlayerData::
wLinkPlayerPartyMon1:: party_struct wLinkPlayerPartyMon1
wLinkPlayerPartyMon2:: party_struct wLinkPlayerPartyMon2
wLinkPlayerPartyMon3:: party_struct wLinkPlayerPartyMon3
wLinkPlayerPartyMon4:: party_struct wLinkPlayerPartyMon4
wLinkPlayerPartyMon5:: party_struct wLinkPlayerPartyMon5
wLinkPlayerPartyMon6:: party_struct wLinkPlayerPartyMon6
wLinkPlayerPartyMonOTNames:: ds PARTY_LENGTH * NAME_LENGTH
wLinkPlayerPartyMonNicks:: ds PARTY_LENGTH * MON_NAME_LENGTH
wLinkPlayerDataEnd::
ENDU

NEXTU ; c700
; mystery gift data
wMysteryGiftPartyTemp:: ; ds PARTY_LENGTH * (1 + 1 + NUM_MOVES)
wMysteryGiftStaging::
wc700:: ds 80

wMysteryGiftTrainerData:: ds (1 + 1 + NUM_MOVES) * PARTY_LENGTH + 2
wMysteryGiftTrainerDataEnd::

	ds 138

wMysteryGiftPartnerData::
wc800:: db
wMysteryGiftPartnerID:: dw
wMysteryGiftPartnerName:: ds NAME_LENGTH
wMysteryGiftPartnerDexCaught:: db
wc80f::
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

	ds 144

wc8f4:: ds 5
wc8f9:: ds 7

NEXTU ; c700
; LCD expects wLYOverrides to have an alignment of $100
wLYOverrides:: ds SCREEN_HEIGHT_PX
wLYOverridesEnd::

UNION ; c790
	ds 16
wLYOverrides2:: ds SCREEN_HEIGHT_PX
wLYOverrides2End::

NEXTU ; c790
	ds $100 - SCREEN_HEIGHT_PX
wLYOverridesBackup:: ds SCREEN_HEIGHT_PX
wLYOverridesBackupEnd:: ds $100 - SCREEN_HEIGHT_PX
ENDU

UNION ; c900
; blank credits tile buffer
wCreditsBlankFrame2bpp:: ds 4 * 4 tiles
wCreditsBlankFrame2bppEnd::

NEXTU ; c900
; mystery gift data
wc900:: db
wc901:: db
wc902:: db

NEXTU ; c900
; link
	ds 191
wc9bf:: ds 79
wca0e:: ds 5
wca13:: ds 113
wca84:: ds 100
wcae8:: dw
wLinkOTPartyMonTypes:: ds 2 * PARTY_LENGTH ; caea
	ds 84
wcb4a:: ds 84
wcb9e:: ds 130

NEXTU ; c900
; battle
wBattleAnimTileDict:: ds 10

wActiveAnimObjects:: ; c90a
wAnimObject01:: battle_anim_struct wAnimObject01
wAnimObject02:: battle_anim_struct wAnimObject02
wAnimObject03:: battle_anim_struct wAnimObject03
wAnimObject04:: battle_anim_struct wAnimObject04
wAnimObject05:: battle_anim_struct wAnimObject05
wAnimObject06:: battle_anim_struct wAnimObject06
wAnimObject07:: battle_anim_struct wAnimObject07
wAnimObject08:: battle_anim_struct wAnimObject08
wAnimObject09:: battle_anim_struct wAnimObject09
wAnimObject10:: battle_anim_struct wAnimObject10
wActiveAnimObjectsEnd::

wActiveBGEffects:: ; c9fa
wBGEffect1:: battle_bg_effect wBGEffect1
wBGEffect2:: battle_bg_effect wBGEffect2
wBGEffect3:: battle_bg_effect wBGEffect3
wBGEffect4:: battle_bg_effect wBGEffect4
wBGEffect5:: battle_bg_effect wBGEffect5
wActiveBGEffectsEnd::

wLastAnimObjectIndex:: db ; ca0e

wBattleAnimFlags:: db ; ca0f
wBattleAnimAddress:: dw ; ca10
wBattleAnimDelay:: db ; ca12
wBattleAnimParent:: dw ; ca13
wBattleAnimLoops:: db ; ca15
wBattleAnimVar:: db ; ca16
wBattleAnimByte:: db ; ca17
wBattleAnimOAMPointerLo:: db ; ca18

UNION ; ca19
; unidentified
wBattleAnimTemp0:: db
wBattleAnimTemp1:: db
wBattleAnimTemp2:: db
wBattleAnimTemp3:: db

NEXTU ; ca19
wBattleObjectTempID:: db
wBattleObjectTempXCoord:: db
wBattleObjectTempYCoord:: db
wBattleObjectTempParam:: db

NEXTU ; ca19
wBattleAnimTempOAMFlags:: db
wBattleAnimTempField02:: db
wBattleAnimTempTileID:: db
wBattleAnimTempXCoord:: db
wBattleAnimTempYCoord:: db
wBattleAnimTempXOffset:: db
wBattleAnimTempYOffset:: db
wBattleAnimTempFrameOAMFlags:: db
wBattleAnimTempPalette:: db
ENDU ; ca22

UNION ; ca22
	ds $32
wBattleAnimEnd::

NEXTU ; ca22
wSurfWaveBGEffect:: ds $40
wSurfWaveBGEffectEnd::
ENDU ; ca62

	ds 134

wBattle:: ; cae8
wEnemyMoveStruct:: move_struct wEnemyMoveStruct
wPlayerMoveStruct:: move_struct wPlayerMoveStruct

wEnemyMonNick:: ds MON_NAME_LENGTH ; caf6
wBattleMonNick:: ds MON_NAME_LENGTH ; cb01

UNION ; cb0c
; battle mon
wBattleMon:: battle_struct wBattleMon ; cb0c

NEXTU ; cb0c
; intro water/grass/fire cutscene data
	ds 4
wIntroJumptableIndex:: db
wIntroBGMapPointer:: dw
wIntroTilemapPointer:: dw
wIntroTilesPointer:: dw
wIntroFrameCounter1:: db
wIntroFrameCounter2:: db
wcb19:: db
ENDU ; cb2c

	ds 2

wEnemyTrainerItem1:: db ; cb2e
wEnemyTrainerItem2:: db ; cb2f
wEnemyTrainerBaseReward:: db ; cb30

	ds 3

wOTClassName:: ds TRAINER_CLASS_NAME_LENGTH ; cb34

wCurOTMon:: db ; cb41

wBattleParticipantsNotFainted::
; Bit array.  Bits 0 - 5 correspond to party members 1 - 6.
; Bit set if the mon appears in battle.
; Bit cleared if the mon faints.
; Backed up if the enemy switches.
; All bits cleared if the enemy faints.
	db

wTypeModifier:: ; cb43
; >10: super-effective
;  10: normal
; <10: not very effective
; bit 7: stab
	db

wCriticalHit:: ; cb44
; 0 if not critical
; 1 for a critical hit
; 2 for a OHKO
	db

wAttackMissed:: ; cb45
; nonzero for a miss
	db

wPlayerSubStatus1:: ; cb46
; bit
; 7 in love
; 6 rollout
; 5 endure
; 4 perish song
; 3 identified
; 2 protect
; 1 curse
; 0 nightmare
	db
wPlayerSubStatus2:: ; cb47
; bit
; 7
; 6
; 5
; 4
; 3
; 2
; 1
; 0 curled
	db
wPlayerSubStatus3:: ; cb48
; bit
; 7 confused
; 6 flying
; 5 underground
; 4 charged
; 3 flinched
; 2 in loop
; 1 rampage
; 0 bide
	db
wPlayerSubStatus4:: ; cb49
; bit
; 7 leech seed
; 6 rage
; 5 recharge
; 4 substitute
; 3
; 2 focus energy
; 1 mist
; 0 x accuracy
	db
wPlayerSubStatus5:: ; cb4a
; bit
; 7 can't run
; 6 destiny bond
; 5 lock-on
; 4 encored
; 3 transformed
; 2
; 1
; 0 toxic
	db

wEnemySubStatus1:: ; cb4b
; see wPlayerSubStatus1
	db
wEnemySubStatus2:: ; cb4c
; see wPlayerSubStatus2
	db
wEnemySubStatus3:: ; cb4d
; see wPlayerSubStatus3
	db
wEnemySubStatus4:: ; cb4e
; see wPlayerSubStatus4
	db
wEnemySubStatus5:: ; cb4f
; see wPlayerSubStatus5
	db

wPlayerRolloutCount:: db ; cb50
wPlayerConfuseCount:: db ; cb51
wPlayerToxicCount:: db ; cb52
wPlayerDisableCount:: db ; cb53
wPlayerEncoreCount:: db ; cb54
wPlayerPerishCount:: db ; cb55
wPlayerFuryCutterCount:: db ; cb56
wPlayerProtectCount:: db ; cb57

wEnemyRolloutCount:: db ; cb58
wEnemyConfuseCount:: db ; cb59
wEnemyToxicCount:: db ; cb5a
wEnemyDisableCount:: db ; cb5b
wEnemyEncoreCount:: db ; cb5c
wEnemyPerishCount:: db ; cb5d
wEnemyFuryCutterCount:: db ; cb5e
wEnemyProtectCount:: db ; cb5f

wPlayerDamageTaken:: dw ; cb60
wEnemyDamageTaken:: dw ; cb62

wBattleReward:: ds 3 ; cb64
wBattleAnimParam::
wKickCounter::
wPresentPower::
	db ; cb67
wBattleScriptBuffer:: ds 40 ; cb68

wBattleScriptBufferAddress:: dw ; cb90
wTurnEnded:: db ; cb92

	ds 1

wPlayerStats:: ; cb94
wPlayerAttack:: dw
wPlayerDefense:: dw
wPlayerSpeed:: dw
wPlayerSpAtk:: dw
wPlayerSpDef:: dw
	ds 1

wEnemyStats:: ; cb9f
wEnemyAttack:: dw
wEnemyDefense:: dw
wEnemySpeed:: dw
wEnemySpAtk:: dw
wEnemySpDef:: dw
	ds 1

wPlayerStatLevels:: ; cbaa
; 07 neutral
wPlayerAtkLevel:: db ; cbaa
wPlayerDefLevel:: db ; cbab
wPlayerSpdLevel:: db ; cbac
wPlayerSAtkLevel:: db ; cbad
wPlayerSDefLevel:: db ; cbae
wPlayerAccLevel:: db ; cbaf
wPlayerEvaLevel:: db ; cbb0
	ds 1
wPlayerStatLevelsEnd::

wEnemyStatLevels:: ; cbb2
; 07 neutral
wEnemyAtkLevel:: db ; cbb2
wEnemyDefLevel:: db ; cbb3
wEnemySpdLevel:: db ; cbb4
wEnemySAtkLevel:: db ; cbb5
wEnemySDefLevel:: db ; cbb6
wEnemyAccLevel:: db ; cbb7
wEnemyEvaLevel:: db ; cbb8
	ds 1

wEnemyTurnsTaken:: db ; cbba
wPlayerTurnsTaken:: db ; cbbb
	ds 1

wPlayerSubstituteHP:: db ; cbbd
wEnemySubstituteHP:: db ; cbbe

wUnusedPlayerLockedMove:: db ; cbbf
	ds 1

wCurPlayerMove:: db ; cbc1
wCurEnemyMove:: db ; cbc2

wLinkBattleRNCount:: ; cbc3
; how far through the prng stream
	db

wEnemyItemState:: db ; cbc4
	ds 2
wCurEnemyMoveNum:: db ; cbc7

wEnemyHPAtTimeOfPlayerSwitch:: dw ; cbc8
wPayDayMoney:: ds 3 ; cbca

wSafariMonAngerCount:: db ; cbcd
wSafariMonEating:: db ; cbce
	ds 1
wEnemyBackupDVs:: dw ; cbd0 ; used when enemy is transformed
wAlreadyDisobeyed:: db ; cbd2

wDisabledMove:: db ; cbd3
wEnemyDisabledMove:: db ; cbd4
wWhichMonFaintedFirst:: db ; cbd5

; exists so you can't counter on switch
wLastPlayerCounterMove:: db ; cbd6
wLastEnemyCounterMove:: db ; cbd7

wEnemyMinimized:: db ; cbd8

wAlreadyFailed:: db ; cbd9

wBattleParticipantsIncludingFainted:: db ; cbda
wBattleLowHealthAlarm:: db ; cbdb
wPlayerMinimized:: db ; cbdc
wPlayerScreens:: ; cbdd
; bit
; 7
; 6
; 5
; 4 reflect
; 3 light screen
; 2 safeguard
; 1
; 0 spikes
	db

wEnemyScreens:: ; cbde
; see wPlayerScreens
	db

wPlayerSafeguardCount:: db ; cbdf
wPlayerLightScreenCount:: db ; cbe0
wPlayerReflectCount:: db ; cbe1
	ds 1

wEnemySafeguardCount:: db ; cbe3
wEnemyLightScreenCount:: db ; cbe4
wEnemyReflectCount:: db ; cbe5
	ds 2

wBattleWeather:: ; cbe8
; 00 normal
; 01 rain
; 02 sun
; 03 sandstorm
; 04 rain stopped
; 05 sunliight faded
; 06 sandstorm subsided
	db

wWeatherCount:: ; cbe9
; # turns remaining
	db

wLoweredStat:: db ; cbea
wEffectFailed:: db ; cbeb
wFailedMessage:: db ; cbec
wEnemyGoesFirst:: db ; cbed

wPlayerIsSwitching:: db ; cbee
wEnemyIsSwitching:: db ; cbef

wPlayerUsedMoves:: ; cbf0
; add a move that has been used once by the player
; added in order of use
	ds NUM_MOVES

wEnemyAISwitchScore:: db ; cbf4
wEnemySwitchMonParam:: db ; cbf5
wEnemySwitchMonIndex:: db ; cbf6
wTempLevel:: db ; cbf7
wLastPlayerMon:: db ; cbf8
wLastPlayerMove:: db ; cbf9
wLastEnemyMove:: db ; cbfa

wPlayerFutureSightCount:: db ; cbfb
wEnemyFutureSightCount:: db ; cbfc

wGivingExperienceToExpShareHolders:: db ; cbfd

wBackupEnemyMonBaseStats:: ds 5 ; cbfe
wBackupEnemyMonCatchRate:: db ; cc03
wBackupEnemyMonBaseExp:: db ; cc04

wPlayerFutureSightDamage:: dw ; cc05
wEnemyFutureSightDamage:: dw ; cc07
wPlayerRageCounter:: db ; cc09
wEnemyRageCounter:: db ; cc0a

wBeatUpHitAtLeastOnce:: db ; cc0b

wPlayerTrappingMove:: db ; cc0c
wEnemyTrappingMove:: db ; cc0d
wPlayerWrapCount:: db ; cc0e
wEnemyWrapCount:: db ; cc0f
wPlayerCharging:: db ; cc10
wEnemyCharging:: db ; cc11

wBattleEnded:: db ; cc12

wWildMonMoves:: ds NUM_MOVES ; cc13
wWildMonPP:: ds NUM_MOVES ; cc17

wAmuletCoin:: db ; cc1b

wSomeoneIsRampaging:: db ; cc1c

wPlayerJustGotFrozen:: db ; cc1d
wEnemyJustGotFrozen:: db ; cc1e
wBattleEnd::

	ds 1

ENDU

ENDU ; cc20


SECTION "Video", WRAM0

; wBGMapBuffer
wBGMapBuffer::     ds 40 ; cc20
wBGMapPalBuffer::  ds 40 ; cc48
wBGMapBufferPtrs:: ds 40 ; cc70 ; 20 bg map addresses (16x8 tiles)
wBGMapBufferEnd::

wSGBPredef:: db ; cc98

wPlayerHPPal:: db ; cc99
wEnemyHPPal:: db ; cc9a

wHPPals:: ds PARTY_LENGTH
wCurHPPal:: db

	ds 7

wSGBPals:: ds 48 ; cca9

wAttrmap:: ; ccd9
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

wTileAnimBuffer:: ds 1 tiles ; ce41

wOtherPlayerLinkMode:: db ; ce51
wOtherPlayerLinkAction:: ; ce52
wBattleAction:: db
	ds 3
wPlayerLinkAction:: db ; ce56
wce57:: db
	ds 3
wLinkTimeoutFrames:: dw ; ce5b
wce5d:: dw

wMonType:: db ; ce5f

wCurSpecies:: db ; ce60

wNamedObjectTypeBuffer:: db

	ds 1

wJumptableIndex:: db

UNION ; ce64
; unidentified
wce64:: db
wce65:: db
wce66:: db

NEXTU ; ce64
; gfpresents, title, and intro menu timers
wIntroSceneFrameCounter:: db
UNION ; ce65
wIntroSceneTimer:: db
NEXTU ; ce65
wTitleScreenTimer:: dw
ENDU

NEXTU ; ce64
; credits data
wCreditsBorderFrame:: db
wCreditsBorderMon:: db
wCreditsLYOverride:: db

NEXTU ; ce64
; pokedex
wPrevDexEntryJumptableIndex:: db
wPrevDexEntryBackup::
wPokedexStatus:: db

NEXTU ; ce64
; pokegear
wPokegearCard:: db
wPokegearMapRegion:: db

NEXTU ; ce64
; pack
wPackJumptableIndex:: db
wCurPocket:: db
wPackUsedItem:: db

NEXTU ; ce64
; trainer card badges
wTrainerCardBadgeFrameCounter:: db
wTrainerCardBadgeTileID:: db
wTrainerCardBadgeAttributes:: db

NEXTU ; ce64
; card flip data
wCardFlipCursorY:: db
wCardFlipCursorX:: db
wCardFlipWhichCard:: db

NEXTU ; ce64
; magnet train
wMagnetTrainOffset:: db
wMagnetTrainPosition:: db
wMagnetTrainWaitCounter:: db

NEXTU ; ce64
; unown puzzle data
wHoldingUnownPuzzlePiece:: db
wUnownPuzzleCursorPosition:: db
wUnownPuzzleHeldPiece:: db

NEXTU ; ce64
; miscellaneous
wFrameCounter::
wMomBankDigitCursorPosition::
wNamingScreenLetterCase::
wHallOfFameMonCounter::
wSlotsDelay::
	db
wPrinterQueueLength:: db
ENDU ; ce67

wRequested2bpp::
wRequested2bppSize:: db ; ce67
wRequested2bppSource:: dw ; ce68
wRequested2bppDest:: dw ; ce6a

wRequested1bpp::
wRequested1bppSize:: db ; ce6c
wRequested1bppSource:: dw ; ce6d
wRequested1bppDest:: dw ; ce6f

wSecondsSince:: db ; ce71
wMinutesSince:: db ; ce72
wHoursSince:: db ; ce73
wDaysSince:: db ; ce74

	ds 12

wPlayerBGMapOffsetX:: db ; used in FollowNotExact; unit is pixels
wPlayerBGMapOffsetY:: db ; used in FollowNotExact; unit is pixels

wPlayerStepVectorX:: db ; ce83
wPlayerStepVectorY:: db ; ce84
wPlayerStepFlags:: db ; ce85
wPlayerStepDirection:: db ; ce86

wPlayerNextMovement:: db ; ce87
wPlayerMovement:: db ; ce88

	ds 2

wMovementObject:: db ; ce8b
wMovementDataBank:: db ; ce8c
wMovementDataAddress:: dw ; ce8d
wce8f:: db ; ce8f

	ds 3

wMovementByteWasControlSwitch:: db ; ce93
wMovementPointer:: dw ; ce94

	ds 3

wTempObjectCopyMapObjectIndex:: db ; ce99
wTempObjectCopySprite:: db ; ce9a
wTempObjectCopySpriteVTile:: db ; ce9b
wTempObjectCopyPalette:: db ; ce9c
wTempObjectCopyMovement:: db ; ce9d
wTempObjectCopyRange:: db ; ce9e
wTempObjectCopyX:: db ; ce9f
wTempObjectCopyY:: db ; cea0
wTempObjectCopyRadius:: db ; cea1

	ds 1

wTileDown::  db ; cea3
wTileUp::    db ; cea4
wTileLeft::  db ; cea5
wTileRight:: db ; cea6

wTilePermissions:: db ; cea7

wWindowStackPointer:: dw ; cea8
wMenuJoypad:: db ; ceaa
wMenuSelection:: db ; ceab
wMenuSelectionQuantity:: db ; ceac
wWhichIndexSet:: db ; cead
wScrollingMenuCursorPosition:: db ; ceae
wWindowStackSize:: db ; ceaf

	ds 8

; menu header
wMenuHeader:: ; ceb8
wMenuFlags:: db
wMenuBorderTopCoord:: db
wMenuBorderLeftCoord:: db
wMenuBorderBottomCoord:: db
wMenuBorderRightCoord:: db
wMenuDataPointer:: dw
wMenuCursorBuffer:: dw
	ds 7
wMenuHeaderEnd::

wMenuData::
wMenuDataFlags:: db ; cec8

UNION ; cec9
; Vertical Menu/DoNthMenu/SetUpMenu
wMenuDataItems:: db ; cec9
wMenuDataIndicesPointer:: dw ; ceca
wMenuDataDisplayFunctionPointer:: dw ; cecc
wMenuDataPointerTableAddr:: dw ; cece

NEXTU ; cec9
; 2D Menu
wMenuData_2DMenuDimensions:: db ; cec9
wMenuData_2DMenuSpacing:: db ; ceca
wMenuData_2DMenuItemStringsBank:: db ; cecb
wMenuData_2DMenuItemStringsAddr:: dw ; cecc
wMenuData_2DMenuFunctionBank:: db ; cece
wMenuData_2DMenuFunctionAddr:: dw ; cecf

NEXTU ; cec9
; Scrolling Menu
wMenuData_ScrollingMenuHeight:: db ; cec9
wMenuData_ScrollingMenuWidth:: db ; ceca
wMenuData_ScrollingMenuItemFormat:: db ; cecb
wMenuData_ItemsPointerBank:: db ; cecc
wMenuData_ItemsPointerAddr:: dw ; cecd
wMenuData_ScrollingMenuFunction1:: ds 3 ; cecf
wMenuData_ScrollingMenuFunction2:: ds 3 ; ced2
wMenuData_ScrollingMenuFunction3:: ds 3 ; ced5
ENDU ; ced8
wMenuDataEnd::

w2DMenuData::
w2DMenuCursorInitY:: db ; ced8
w2DMenuCursorInitX:: db ; ced9
w2DMenuNumRows:: db ; ceda
w2DMenuNumCols:: db ; cedb
w2DMenuFlags1:: ; cedc
; bit 7: Disable checking of wMenuJoypadFilter
; bit 6: Enable sprite animations
; bit 5: Wrap around vertically
; bit 4: Wrap around horizontally
; bit 3: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 5 is disabled and we tried to go too far down
; bit 2: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 5 is disabled and we tried to go too far up
; bit 1: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 4 is disabled and we tried to go too far left
; bit 0: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 4 is disabled and we tried to go too far right
	db
w2DMenuFlags2:: db ; cedd
w2DMenuCursorOffsets:: db ; cede
wMenuJoypadFilter:: db ; cedf
w2DMenuDataEnd::
wMenuCursorY:: db ; cee0
wMenuCursorX:: db ; cee1
wCursorOffCharacter:: db ; cee2
wCursorCurrentTile:: dw ; cee3

	ds 3

wOverworldDelay:: db ; cee8
wTextDelayFrames:: db ; cee9
wVBlankOccurred:: db ; ceea

wceeb:: db
wDefaultSpawnpoint:: db

UNION ; ceed
; mail temp storage
wTempMail:: mailmsg wTempMail

NEXTU ; ceed
; magnet train
wMagnetTrain:: ; used only for BANK(wMagnetTrain)
wMagnetTrainDirection:: db
wMagnetTrainInitPosition:: db
wMagnetTrainHoldPosition:: db
wMagnetTrainFinalPosition:: db
wMagnetTrainPlayerSpriteInitX:: db

NEXTU ; ceed
; credits
wCreditsPos:: dw
wCreditsTimer:: db

NEXTU ; ceed
; mon buffer
wBufferMonNick:: ds MON_NAME_LENGTH ; ceed
wBufferMonOT:: ds NAME_LENGTH ; cef8
wBufferMon:: party_struct wBufferMon ; cf03
	ds 8

NEXTU ; ceed
; bug-catching contest
wBugContestResults::
	bugcontestwinner wBugContestFirstPlace
	bugcontestwinner wBugContestSecondPlace
	bugcontestwinner wBugContestThirdPlace
wBugContestWinnersEnd::
	bugcontestwinner wBugContestTemp
	ds 4
wBugContestWinnerName:: ds NAME_LENGTH

NEXTU ; ceed
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

NEXTU ; ceed
; town map data
wTownMapPlayerIconLandmark:: db
UNION
wTownMapCursorLandmark:: db
wTownMapCursorObjectPointer:: dw
NEXTU
wTownMapCursorCoordinates:: dw
ENDU

NEXTU ; ceed
; phone call data
wPhoneScriptBank:: db
wPhoneCaller:: dw

NEXTU ; ceed
; radio data
wCurRadioLine:: db
wNextRadioLine:: db
wRadioTextDelay:: db
wNumRadioLinesPrinted:: db
wOaksPKMNTalkSegmentCounter:: db
	ds 5
wRadioText:: ds 2 * SCREEN_WIDTH
wRadioTextEnd::

NEXTU ; ceed
; lucky number show
wLuckyNumberDigitsBuffer:: ds 5

NEXTU ; ceed
; movement buffer data
wMovementBufferCount:: db
wMovementBufferObject:: db
wUnusedMovementBufferBank:: db
wUnusedMovementBufferPointer:: dw
wMovementBuffer:: ds 55

NEXTU ; ceed
; box printing
wWhichBoxMonToPrint:: db
wFinishedPrintingBox:: db
wAddrOfBoxToPrint:: dw
wBankOfBoxToPrint:: db
wWhichBoxToPrint:: db

NEXTU ; ceed
; trainer HUD data
	ds 1
wPlaceBallsDirection:: db
wTrainerHUDTiles:: ds 4

NEXTU ; ceed
; earthquake data buffer
wEarthquakeMovementDataBuffer:: ds 5

NEXTU ; ceed
; miscellaneous
wTempDayOfWeek::
wKeepSevenBiasChance:: ; used in the slots to handle the favoring of 7 symbol streaks
	db
	ds 2
wStartFlypoint:: db
wEndFlypoint:: db

NEXTU ; ceed
; unidentified
wceed:: db
wceee:: db
wceef:: db

	ds 8

wcef8:: ds 1
	ds 1
wcefa:: ds 1
	ds 1
wcefc:: ds 1
wcefd:: ds 1

	ds 43

UNION ; cf29
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

NEXTU ; cf29
; menu items list
wMenuItemsList:: ds 16
wMenuItemsListEnd::

NEXTU ; cf29
; fruit tree data
wCurFruitTree:: db
wCurFruit:: db

NEXTU ; cf29
; item ball data
wItemBallData::
wItemBallItemID:: db
wItemBallQuantity:: db
wItemBallDataEnd::

NEXTU ; cf29
; hidden item data
wHiddenItemData::
wHiddenItemEvent:: dw
wHiddenItemID:: db
wHiddenItemDataEnd::

NEXTU ; cf29
; elevator data
wElevatorData::
wElevatorPointerBank:: db
wElevatorPointer:: dw
wElevatorOriginFloor:: db
wElevatorDataEnd::

NEXTU ; cf29
; coord event data
wCurCoordEvent::
wCurCoordEventSceneID:: db
wCurCoordEventMapY:: db
wCurCoordEventMapX:: db
	ds 1
wCurCoordEventScriptAddr:: dw

NEXTU ; cf29
; BG event data
wCurBGEvent::
wCurBGEventYCoord:: db
wCurBGEventXCoord:: db
wCurBGEventType:: db
wCurBGEventScriptAddr:: dw

NEXTU ; cf29
; mart data
wMartType:: db
wMartPointerBank:: db
wMartPointer:: dw
wMartJumptableIndex:: db
wBargainShopFlags:: db

NEXTU ; cf29
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

NEXTU ; cf29
; std script buffer
	ds 1
wJumpStdScriptBuffer:: ds 3

NEXTU ; cf29
; phone script data
wCheckedTime:: db
wPhoneListIndex:: db
wNumAvailableCallers:: db
wAvailableCallers:: ds CONTACT_LIST_SIZE

NEXTU ; cf29
; phone caller contact
	ds 1
wCallerContact:: ds PHONE_CONTACT_SIZE

NEXTU ; cf29
; backup menu data
	ds 7
wMenuCursorBufferBackup:: db
wMenuScrollPositionBackup:: db

NEXTU ; cf29
; poison step data
wPoisonStepData::
wPoisonStepFlagSum:: db
wPoisonStepPartyFlags:: ds PARTY_LENGTH
wPoisonStepDataEnd::
ENDU ; cf3a

	ds 1

wBoxAlignment:: db
wUnusedBufferCF3C:: dw
wFXAnimID:: dw
ENDU ; cf40

wPlaceBallsX:: db ; cf40
wPlaceBallsY:: db ; cf41
wTileAnimationTimer:: db ; cf42

; palette backups?
wBGP:: db
wOBP0:: db
wOBP1:: db

wNumHits:: db ; cf46

	ds 1

wMonOrItemNameBuffer:: ds 22 ; cf48
wTMHMMoveNameBackup:: ds MOVE_NAME_LENGTH ; cf5e

wStringBuffer1:: ds 19 ; cf6b
wStringBuffer2:: ds 19 ; cf7e
wStringBuffer3:: ds 19 ; cf91
wStringBuffer4:: ds 19 ; cfa4
wStringBuffer5:: ds 13 ; cfb7

wBattleMenuCursorBuffer:: dw ; cfc4
wCurBattleMon:: db ; cfc6
wCurMoveNum:: db; cfc7
wLastPocket:: db ; cfc8

wPartyMenuCursor:: db ; cfc9
wItemsPocketCursor:: db ; cfca
wKeyItemsPocketCursor:: db ; cfcb
wBallsPocketCursor:: db ; cfcc
wTMHMPocketCursor:: db ; cfcd

	ds 1

wItemsPocketScrollPosition:: db ; cfcf
wKeyItemsPocketScrollPosition:: db; cfd0
wBallsPocketScrollPosition:: db ; cfd1
wTMHMPocketScrollPosition:: db ; cfd2

wSwitchMon::
wSwitchItem::
wMoveSwapBuffer::
	db

wMenuScrollPosition:: ds 4

wQueuedScriptBank:: db
wQueuedScriptAddr:: dw

wPredefID:: db ; cfdb
wPredefTemp:: dw ; cfdc
wPredefAddress:: dw ; cfde
wFarCallBCBuffer:: dw ; cfe0
	ds 1

wNumMoves:: db

wFieldMoveSucceeded::
wItemEffectSucceeded::
wBattlePlayerAction::
; 0 - use move
; 1 - use item
; 2 - switch
wSolvedUnownPuzzle::
	db ; cfe4

wVramState:: ; cfe5
; bit 0: overworld sprite updating on/off
; bit 6: something to do with text
; bit 7: on when surf initiates
;        flickers when climbing waterfall
	db

	ds 3

wBattleResult:: ; cfe9
; WIN, LOSE, or DRAW
; bit 7: box full
	db

	ds 1

wUsingItemWithSelect:: db ; cfeb

UNION ; cfec
; mart data
wCurMart:: ds 16
wCurMartEnd::

NEXTU ; cfec
; elevator data
wCurElevator:: db
wCurElevatorFloors:: db

NEXTU ; cfec
; mailbox data
wCurMessageScrollPosition:: db
wCurMessageIndex:: db
wMailboxCount:: db
wMailboxItems:: ds MAILBOX_CAPACITY
wMailboxEnd::
ENDU ; cffc

wListPointer:: dw ; cffc
wUnusedCFFE:: dw ; cffe


SECTION "WRAM 1", WRAMX

wItemAttributesPtr:: dw ; d000

wCurItem:: db ; d002
wCurItemQuantity:: ; d003
wMartItemID::
	db

wCurPartySpecies:: db ; d004

wCurPartyMon:: ; d005
; contains which monster in a party
; is being dealt with at the moment
; 0-5
	db
	ds 1

wWhichHPBar:: ; d007
; 0: Enemy
; 1: Player
; 2: Party Menu
	db

wPokemonWithdrawDepositParameter:: ; d008
; 0: Take from PC
; 1: Put into PC
; 2: Take from Day-Care
; 3: Put into Day-Care
	db

wItemQuantityChangeBuffer:: db ; d009
wItemQuantityBuffer:: db ; d00a

wTempMon:: party_struct wTempMon ; d00b

wSpriteFlags:: db ; d03b

wHandlePlayerStep:: db ; d03c

	ds 1

wPartyMenuActionText:: db ; d03e

wItemAttributeParamBuffer:: db ; d03f

wCurPartyLevel:: db ; d040
wScrollingMenuListSize:: db ; d041

wLinkMode:: db ; d042
; 0 not in link battle
; 1 link battle

; used when following a map warp
wNextWarp:: db ; d043
wNextMapGroup:: db ; d044
wNextMapNumber:: db ; d045
wPrevWarp:: db ; d046
wPrevMapGroup:: db ; d047
wPrevMapNumber:: db ; d048

	ds 17

wUnusedD05A:: db

wBGMapAnchor:: dw ; d05b

wUsedSprites:: ds SPRITE_GFX_LIST_CAPACITY * 2
wUsedSpritesEnd::
	ds 8

wOverworldMapAnchor:: dw ; d07d
wMetatileStandingY:: db ; d07f
wMetatileStandingX:: db ; d080

wMapPartial::
wMapAttributesBank:: db ; d081
wMapTileset:: db ; d082
wEnvironment:: db ; d083
wMapAttributesPointer:: dw ; d084
wMapPartialEnd::

wMapAttributes:: ; d086
wMapBorderBlock:: db ; d086
; width/height are in blocks (2x2 walkable tiles, 4x4 graphics tiles)
wMapHeight:: db ; d087
wMapWidth:: db ; d088
wMapBlocksBank:: db; d089
wMapBlocksPointer:: dw ; d08a
wMapScriptsBank:: db ; d08c
wMapScriptsPointer:: dw ; d08d
wMapEventsPointer:: dw ; d08f
; bit set
wMapConnections:: db ; d091
wMapAttributesEnd::

wNorthMapConnection:: map_connection_struct wNorth ; d092
wSouthMapConnection:: map_connection_struct wSouth ; d09e
wWestMapConnection::  map_connection_struct wWest ; d0aa
wEastMapConnection::  map_connection_struct wEast ; d0b6

wTileset::
wTilesetBank:: db ; d0c2
wTilesetAddress:: dw ; d0c3
wTilesetBlocksBank:: db ; d0c5
wTilesetBlocksAddress:: dw ; d0c6
wTilesetCollisionBank:: db ; d0c8
wTilesetCollisionAddress:: dw ; d0c9
wTilesetAnim:: dw ; bank 3f ; d0cb
	ds 2 ; unused ; d0cd
wTilesetPalettes:: dw ; bank 3f ; d0cf
wTilesetEnd::

wEvolvableFlags:: flag_array PARTY_LENGTH ; d0d1

wForceEvolution:: db ; d0d2

UNION ; d0d3
; general-purpose buffers
wBuffer1:: db ; d0d3
wBuffer2:: db ; d0d4
wBuffer3:: db ; d0d5
wBuffer4:: db ; d0d6
wBuffer5:: db ; d0d7
wBuffer6:: db ; d0d8

NEXTU ; d0d3
; HP bar animations
wCurHPAnimMaxHP::   dw ; d0d3
wCurHPAnimOldHP::   dw ; d0d5
wCurHPAnimNewHP::   dw ; d0d7
wCurHPAnimPal::     db ; d0d9
wCurHPBarPixels::   db ; d0da
wNewHPBarPixels::   db ; d0db
wCurHPAnimDeltaHP:: dw ; d0dc
wCurHPAnimLowHP::   db ; d0de
wCurHPAnimHighHP::  db ; d0df

NEXTU ; d0d3
; evolution data
wEvolutionOldSpecies:: db ; d0d3
wEvolutionNewSpecies:: db ; d0d4
wEvolutionPicOffset:: db ; d0d5
wEvolutionCanceled:: db ; d0d6

NEXTU

	ds 9

wd0dc:: ds 1

NEXTU ; d0d3
; miscellaneous
wMagikarpLength:: dw
wSelectedDecoration:: db
wOtherDecoration::    db
	ds 3
wCurEnemyItem:: db
ENDU ; d0e0

	ds 3

wLinkBattleRNs:: ds 10 ; d0e3

wTempEnemyMonSpecies:: db ; d0ed
wTempBattleMonSpecies:: db ; d0ee

wEnemyMon:: battle_struct wEnemyMon ; d0ef
wEnemyMonBaseStats:: ds 5 ; d10f
wEnemyMonCatchRate:: db ; d114
wEnemyMonBaseExp::   db ; d115
wEnemyMonEnd::

wBattleMode:: ; d116
; 0: overworld
; 1: wild battle
; 2: trainer battle
	db

wTempWildMonSpecies:: db

wOtherTrainerClass:: ; d118
; class (Youngster, Bug Catcher, etc.) of opposing trainer
; 0 if opponent is a wild Pokémon, not a trainer
	db

; BATTLETYPE_* values
wBattleType:: db ; d119

	ds 1

wOtherTrainerID:: ; d11b
; which trainer of the class that you're fighting
; (Joey, Mikey, Albert, etc.)
	db

wForcedSwitch:: db

wTrainerClass:: db ; d11d

wUnownLetter:: db ; d11e

wMoveSelectionMenuType:: db ; d11f

; corresponds to the data/pokemon/base_stats/*.asm contents
wCurBaseData:: ; d120
wBaseDexNo:: db ; d120
wBaseStats:: ; d121
wBaseHP:: db ; d121
wBaseAttack:: db ; d122
wBaseDefense:: db ; d123
wBaseSpeed:: db ; d124
wBaseSpecialAttack:: db ; d125
wBaseSpecialDefense:: db ; d126
wBaseType:: ; d127
wBaseType1:: db ; d127
wBaseType2:: db ; d128
wBaseCatchRate:: db ; d129
wBaseExp:: db ; d12a
wBaseItems:: ; d12b
wBaseItem1:: db ; d12b
wBaseItem2:: db ; d12c
wBaseGender:: db ; d12d
wBaseUnknown1:: db ; d12e
wBaseEggSteps:: db ; d12f
wBaseUnknown2:: db ; d130
wBasePicSize:: db ; d131
wBaseUnusedFrontpic:: dw ; d132
wBaseUnusedBackpic:: dw ; d134
wBaseGrowthRate:: db ; d136
wBaseEggGroups:: db ; d137
wBaseTMHM:: flag_array NUM_TMS + NUM_HMS ; d138
wCurBaseDataEnd::

	ds 1

wCurDamage:: dw ; d141

	ds 2

wMornEncounterRate::  db ; d145
wDayEncounterRate::   db ; d146
wNiteEncounterRate::  db ; d147
wWaterEncounterRate:: db ; d148
wListMoves_MoveIndicesBuffer:: ds NUM_MOVES
wPutativeTMHMMove:: db ; d14d
wInitListType:: db ; d14e
wWildMon:: db ; d14f
wBattleHasJustStarted:: db ; d150

; d151 has many different short-term uses
wNamedObjectIndexBuffer::
wDeciramBuffer::
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
wd151::
	db ; d151

wFailedToFlee:: db ; d152
wNumFleeAttempts:: db ; d153
wMonTriedToEvolve:: db ; d154

wROMBankBackup:: db ; d155
wFarByte::
wTempBank:: db ; d156

wTimeOfDay:: db ; d157

	ds 1

wMapStatus:: db ; d159
wMapEventStatus:: db ; d15a

wScriptFlags:: ; d15b
; bit 3: priority jump
	db
wScriptFlags2:: ; d15c
	db
wScriptFlags3:: ; d15d
; bit 0: count steps
; bit 1: coord events
; bit 2: warps and connections
; bit 4: wild encounters
; bit 5: unknown
	db

wScriptMode:: db ; d15e
wScriptRunning:: db ; d15f
wScriptBank:: db ; d160
wScriptPos:: dw ; d161

wScriptStackSize:: db
wScriptStack:: ds 3 * 5
wScriptVar:: db ; d173
wScriptDelay:: db ; d174

wPriorityScriptBank::
wScriptTextBank::
	db ; d175
wPriorityScriptAddr::
wScriptTextAddr::
	dw ; d176
	ds 1
wWildEncounterCooldown:: db ; d179
wXYComparePointer:: dw ; d17a
wd17c:: ds 1 ; d17c
	ds 3
wBattleScriptFlags:: dw ; d180
wPlayerSpriteSetupFlags:: ; d182
	db
wMapReentryScriptQueueFlag:: db ; d183
wMapReentryScriptBank:: db
wMapReentryScriptAddress:: dw ; d185

	ds 4

wTimeCyclesSinceLastCall:: db ; d18b
wReceiveCallDelay_MinsRemaining:: db ; d18c
wReceiveCallDelay_StartTime:: ds 3 ; d18d

	ds 3

wBugContestMinsRemaining:: db ; d193
wBugContestSecsRemaining:: db ; d194

	ds 2

wMapStatusEnd::

	ds 2

wOptions:: ; d199
; bit 0-2: number of frames to delay when printing text
;   fast 1; mid 3; slow 5
; bit 3: ?
; bit 4: no text delay
; bit 5: stereo off/on
; bit 6: battle style shift/set
; bit 7: battle scene off/on
	db

wSaveFileExists:: db ; d19a
wTextboxFrame:: ; d19b
; bits 0-2: textbox frame 0-7
	db

wTextboxFlags:: ; d19c
; bit 0: 1-frame text delay
; bit 1: when unset, no text delay
	db
wGBPrinterBrightness:: ; d19d
; bit 0-6: brightness
;   lightest: $00
;   lighter:  $20
;   normal:   $40 (default)
;   darker:   $60
;   darkest:  $7F
	db
wOptions2:: ; d19e
; bit 0: menu account off/on
	db

	ds 2

wOptionsEnd::


SECTION "Game Data", WRAMX

wGameData::
wPlayerData::
wPlayerData1::
wPlayerID:: dw ; d1a1

wPlayerName:: ds NAME_LENGTH ; d1a3
wMomsName:: ds NAME_LENGTH ; d1ae
wRivalName:: ds NAME_LENGTH ; d1b9
wRedsName:: ds NAME_LENGTH ; d1c4
wGreensName:: ds NAME_LENGTH ; d1cf

wSavedAtLeastOnce:: db ; d1da
wSpawnAfterChampion:: db ; d1db
wStartDay:: db ; d1dc
wStartHour:: db ; d1dd
wStartMinute:: db ; d1de
wStartSecond:: db ; d1df
wRTC:: ds 4 ; d1e0

wDSTBackupDay:: db ; d1e4
wDSTBackupHours:: db ; d1e5
wDSTBackupMinutes:: db ; d1e6
wDSTBackupSeconds:: db ; d1e7

wDST:: ; d1e8
; bit 7: dst
	db

	ds 1

wGameTimeCap::     db ; d1ea
wGameTimeHours::   dw ; d1eb
wGameTimeMinutes:: db ; d1ed
wGameTimeSeconds:: db ; d1ee
wGameTimeFrames::  db ; d1ef

	ds 2

wCurDay:: db ; d1f2

	ds 1

wObjectFollow_Leader:: db ; d1f4
wObjectFollow_Follower:: db ; d1f5
wCenteredObject:: db ; d1f6
wFollowerMovementQueueLength:: db ; d1f7
wFollowMovementQueue:: ds 5 ; d1f8

wObjectStructs:: ; d1fd
wPlayerStruct::   object_struct wPlayer
wObject1Struct::  object_struct wObject1
wObject2Struct::  object_struct wObject2
wObject3Struct::  object_struct wObject3
wObject4Struct::  object_struct wObject4
wObject5Struct::  object_struct wObject5
wObject6Struct::  object_struct wObject6
wObject7Struct::  object_struct wObject7
wObject8Struct::  object_struct wObject8
wObject9Struct::  object_struct wObject9
wObject10Struct:: object_struct wObject10
UNION
	ds 18
wPlayerData1End::
wPlayerData2::
NEXTU
wObject11Struct:: object_struct wObject11
wObject12Struct:: object_struct wObject12
wObjectStructsEnd::
ENDU

wCmdQueue:: ds CMDQUEUE_CAPACITY * CMDQUEUE_ENTRY_SIZE ; d405
; d41d

	ds 40

wMapObjects:: ; d445
wPlayerObject:: map_object wPlayer  ; d445
wMap1Object::   map_object wMap1    ; d455
wMap2Object::   map_object wMap2    ; d465
wMap3Object::   map_object wMap3    ; d475
wMap4Object::   map_object wMap4    ; d485
wMap5Object::   map_object wMap5    ; d495
wMap6Object::   map_object wMap6    ; d4a5
wMap7Object::   map_object wMap7    ; d4b5
wMap8Object::   map_object wMap8    ; d4c5
wMap9Object::   map_object wMap9    ; d4d5
wMap10Object::  map_object wMap10   ; d4e5
wMap11Object::  map_object wMap11   ; d4f5
wMap12Object::  map_object wMap12   ; d505
wMap13Object::  map_object wMap13   ; d515
wMap14Object::  map_object wMap14   ; d525
wMap15Object::  map_object wMap15   ; d535
wMapObjectsEnd:: ; d545

wObjectMasks:: ds NUM_OBJECTS ; d545

wVariableSprites:: ds $100 - SPRITE_VARS ; d555

wEnteredMapFromContinue:: db ; d565
	ds 2
wTimeOfDayPal:: db
	ds 4
wTimeOfDayPalFlags:: db ; d56d
wTimeOfDayPalset:: db ; d56e
wCurTimeOfDay:: db ; d56f

	ds 1

wPlayerData2End::
wPlayerData3::
wStatusFlags::
	db ; d571
wStatusFlags2:: db ; d572

wMoney:: ds 3 ; d573
wMomsMoney:: ds 3 ; d576

wMomSavingMoney:: ; d579
; bit 0: saving some money
; bit 1: saving half money (unused)
; bit 2: saving all money (unused)
; bit 7: active
	db

wCoins:: dw ; d57a

wBadges::
wJohtoBadges:: flag_array NUM_JOHTO_BADGES ; d57c
wKantoBadges:: flag_array NUM_KANTO_BADGES ; d57d

wTMsHMs:: ds NUM_TMS + NUM_HMS ; d57e
wTMsHMsEnd::

wNumItems:: db ; d5b7
wItems:: ds MAX_ITEMS * 2 + 1 ; d5b8
wItemsEnd::

wNumKeyItems:: db ; d5e1
wKeyItems:: ds MAX_KEY_ITEMS + 1 ; d5e2
wKeyItemsEnd::

wNumBalls:: db ; d5fc
wBalls:: ds MAX_BALLS * 2 + 1 ; d5fd
wBallsEnd::

wNumPCItems:: db
wPCItems:: ds MAX_PC_ITEMS * 2 + 1 ; d616
wPCItemsEnd::

wPokegearFlags::
; bit 0: map
; bit 1: radio
; bit 2: phone
; bit 3: expn
; bit 7: on/off
	db
wRadioTuningKnob:: db ; d67d
wLastDexMode:: db ; d67e
	ds 1
wWhichRegisteredItem:: db ; d680
wRegisteredItem:: db ; d681

wPlayerState:: db ; d682

wHallOfFameCount:: dw
wTradeFlags:: flag_array NUM_NPC_TRADES ; d685

	ds 33

wMooMooBerries:: db ; d6a7
wUndergroundSwitchPositions:: db ; d6a8

	ds 14

wPokecenter2FSceneID::                            db ; d6b7
wTradeCenterSceneID::                             db ; d6b8
wColosseumSceneID::                               db ; d6b9
wTimeCapsuleSceneID::                             db ; d6ba
wPowerPlantSceneID::                              db ; d6bb
wCeruleanGymSceneID::                             db ; d6bc
wRoute25SceneID::                                 db ; d6bd
wTrainerHouseB1FSceneID::                         db ; d6be
wVictoryRoadGateSceneID::                         db ; d6bf
wSaffronMagnetTrainStationSceneID::               db ; d6c0
wRoute16GateSceneID::                             db ; d6c1
wRoute17Route18GateSceneID::                      db ; d6c2
wIndigoPlateauPokecenter1FSceneID::               db ; d6c3
wWillsRoomSceneID::                               db ; d6c4
wKogasRoomSceneID::                               db ; d6c5
wBrunosRoomSceneID::                              db ; d6c6
wKarensRoomSceneID::                              db ; d6c7
wLancesRoomSceneID::                              db ; d6c8
wHallOfFameSceneID::                              db ; d6c9
wRoute27SceneID::                                 db ; d6ca
wNewBarkTownSceneID::                             db ; d6cb
wElmsLabSceneID::                                 db ; d6cc
wPlayersHouse1FSceneID::                          db ; d6cd
wRoute29SceneID::                                 db ; d6ce
wCherrygroveCitySceneID::                         db ; d6cf
wMrPokemonsHouseSceneID::                         db ; d6d0
wRoute32SceneID::                                 db ; d6d1
wRoute35NationalParkGateSceneID::                 db ; d6d2
wRoute36NationalParkGateSceneID::                 db ; d6d3
wAzaleaTownSceneID::                              db ; d6d4
wGoldenrodGymSceneID::                            db ; d6d5
wGoldenrodMagnetTrainStationSceneID::             db ; d6d6
wOlivineCitySceneID::                             db ; d6d7
wRoute34SceneID::                                 db ; d6d8
wEcruteakTinTowerEntranceSceneID::                db ; d6d9
wEcruteakPokecenter1FSceneID::                    db ; d6da
wMahoganyTownSceneID::                            db ; d6db
wRoute43GateSceneID::                             db ; d6dc
wMountMoonSceneID::                               db ; d6dd
wSproutTower3FSceneID::                           db ; d6de
wBurnedTower1FSceneID::                           db ; d6df
wBurnedTowerB1FSceneID::                          db ; d6e0
wRadioTower5FSceneID::                            db ; d6e1
wRuinsOfAlphOutsideSceneID::                      db ; d6e2
wRuinsOfAlphResearchCenterSceneID::               db ; d6e3
wRuinsOfAlphInnerChamberSceneID::                 db ; d6e4
wMahoganyMart1FSceneID::                          db ; d6e5
wTeamRocketBaseB1FSceneID::                       db ; d6e6
wTeamRocketBaseB2FSceneID::                       db ; d6e7
wTeamRocketBaseB3FSceneID::                       db ; d6e8
wGoldenrodUndergroundSwitchRoomEntrancesSceneID:: db ; d6e9
wSilverCaveRoom3SceneID::                         db ; d6ea
wVictoryRoadSceneID::                             db ; d6eb
wDragonsDenB1FSceneID::                           db ; d6ec
wOlivinePortSceneID::                             db ; d6ed
wVermilionPortSceneID::                           db ; d6ee
wFastShip1FSceneID::                              db ; d6ef
wFastShipB1FSceneID::                             db ; d6f0
wMountMoonSquareSceneID::                         db ; d6f1

	ds 197

wEventFlags:: flag_array NUM_EVENTS ; d7b7

	ds 14

wd8b7:: db

wGameTimerPause:: db ; d8b8

	ds 1

wd8ba:: ; d8ba
; bits 4, 6, or 7 can be used to disable joypad input
; bit 4
; bit 6: mon fainted?
; bit 7: SGB flag?
	db

	ds 1

wCurBox:: db ; d8bc

	ds 2

; 8 chars + $50
wBoxNames:: ds BOX_NAME_LENGTH * NUM_BOXES ; d8bf

	ds 2

wBikeFlags:: ; d93f
; bit 0: using strength
; bit 1: always on bike
; bit 2: downhill
	db
	ds 1 ; cleared along with wBikeFlags by ResetBikeFlags

wCurMapSceneScriptPointer:: dw ; d941

wCurCaller:: dw ; d943
wCurMapWarpCount:: db ; d945
wCurMapWarpsPointer:: dw ; d946
wCurMapCoordEventCount:: db ; d948
wCurMapCoordEventsPointer:: dw ; d949
wCurMapBGEventCount:: db ; d94b
wCurMapBGEventsPointer:: dw ; d94c
wCurMapObjectEventCount:: db ; d94e
wCurMapObjectEventsPointer:: dw ; d94f
wCurMapSceneScriptCount:: db ; d951
wCurMapSceneScriptsPointer:: dw ; d952
wCurMapCallbackCount:: db ; d954
wCurMapCallbacksPointer:: dw ; d955

	ds 2

; Sprite id of each decoration
wDecoBed::           db ; d959
wDecoCarpet::        db ; d95a
wDecoPlant::         db ; d95b
wDecoPoster::        db ; d95c
wDecoConsole::       db ; d95d
wDecoLeftOrnament::  db ; d95e
wDecoRightOrnament:: db ; d95f
wDecoBigDoll::       db ; d960

; Items bought from Mom
wWhichMomItem:: db ; d961
wWhichMomItemSet:: db ; d962
wMomItemTriggerBalance:: ds 3 ; d963

wDailyResetTimer:: dw ; d966
wDailyFlags1:: db ; d968
wDailyFlags2:: db ; d969
	ds 3
wTimerEventStartDay:: db
	ds 3

wFruitTreeFlags:: flag_array NUM_FRUIT_TREES ; d971

	ds 2

wLuckyNumberDayBuffer:: dw ; d977
	ds 2
wSpecialPhoneCallID:: db ; d97b
	ds 3
wBugContestStartTime:: ds 4 ; day, hour, min, sec ; d97f
wUnusedTwoDayTimerOn:: db ; d983
wUnusedTwoDayTimer:: db
wUnusedTwoDayTimerStartDate:: db

	ds 55

wStepCount:: db ; d9bd
wPoisonStepCount:: db ; d9be
	ds 2
wHappinessStepCount:: db
	ds 1

wParkBallsRemaining::
wSafariBallsRemaining:: db ; d9c3
wSafariTimeRemaining:: dw ; d9c4

wPhoneList:: ds CONTACT_LIST_SIZE ; d9c6
; d9d0
	ds 23

wLuckyNumberShowFlag:: db ; d9e7
	ds 1
wLuckyIDNumber:: dw ; d9e9

wRepelEffect:: db ; If a Repel is in use, it contains the nr of steps it's still active
wBikeStep:: dw

wPlayerData3End::
wPlayerDataEnd::

wCurMapData::

wVisitedSpawns:: flag_array NUM_SPAWNS ; d9ee

wDigWarpNumber:: db ; d9f2
wDigMapGroup::   db ; d9f3
wDigMapNumber::  db ; d9f4

; used on maps like second floor pokécenter, which are reused, so we know which
; map to return to
wBackupWarpNumber:: db ; d9f5
wBackupMapGroup::   db ; d9f6
wBackupMapNumber::  db ; d9f7

	ds 3

wLastSpawnMapGroup:: db
wLastSpawnMapNumber:: db

	ds 2

wWarpNumber:: db ; d9ff
wMapGroup:: db ; da00
wMapNumber:: db ; da01
wYCoord:: db ; da02
wXCoord:: db ; da03
wScreenSave:: ds SCREEN_META_WIDTH * SCREEN_META_HEIGHT

wCurMapDataEnd::


SECTION "Party", WRAMX

wPokemonData::
wPartyCount::   db ; da22
wPartySpecies:: ds PARTY_LENGTH ; da23
wPartyEnd::     db ; da29 ; older code doesn't check wPartyCount

wPartyMons::
wPartyMon1:: party_struct wPartyMon1 ; da2a
wPartyMon2:: party_struct wPartyMon2 ; da5a
wPartyMon3:: party_struct wPartyMon3 ; da8a
wPartyMon4:: party_struct wPartyMon4 ; daba
wPartyMon5:: party_struct wPartyMon5 ; daea
wPartyMon6:: party_struct wPartyMon6 ; db1a

wPartyMonOT:: ds NAME_LENGTH * PARTY_LENGTH ; db4a

wPartyMonNicknames:: ds MON_NAME_LENGTH * PARTY_LENGTH ; db8c
wPartyMonNicknamesEnd::

	ds 22 ; equivalent to NAME_LENGTH + MON_NAME_LENGTH, possibly a reference to 7 pokemon?

wPokedexCaught:: flag_array NUM_POKEMON ; dbe4
wEndPokedexCaught::

wPokedexSeen:: flag_array NUM_POKEMON ; dc04
wEndPokedexSeen::

wUnownDex:: ds NUM_UNOWN ; dc24
wUnlockedUnowns:: db ; dc3e
wFirstUnownSeen:: db ; dc3f

wDayCareMan:: ; dc40
; bit 7: active
; bit 6: egg ready
; bit 5: monsters are compatible
; bit 0: monster 1 in day-care
	db

wBreedMon1::
wBreedMon1Nick::  ds MON_NAME_LENGTH ; dc41
wBreedMon1OT::    ds NAME_LENGTH ; dc4c
wBreedMon1Stats:: box_struct wBreedMon1 ; dc57

wDayCareLady:: ; dc77
; bit 7: active
; bit 0: monster 2 in day-care
	db

wStepsToEgg:: ; dc78
	db
wBreedMotherOrNonDitto:: ; dc79
;  z: yes
; nz: no
	db

wBreedMon2::
wBreedMon2Nick::  ds MON_NAME_LENGTH ; dc7a
wBreedMon2OT::    ds NAME_LENGTH ; dc85
wBreedMon2Stats:: box_struct wBreedMon2 ; dc90

wEggNick:: ds MON_NAME_LENGTH ; dcb0
wEggOT::   ds NAME_LENGTH ; dcbb
wEggMon::  box_struct wEggMon ; dcc6

wBugContestSecondPartySpecies:: db ; dce6
wContestMon:: party_struct wContestMon ; dce7

wSwarmMapGroup:: db ; dd17
wSwarmMapNumber:: db ; dd18
wFishingSwarmFlag:: db ; dd19

wRoamMon1:: roam_struct wRoamMon1 ; dd1a
wRoamMon2:: roam_struct wRoamMon2 ; dd21
wRoamMon3:: roam_struct wRoamMon3 ; dd28

wRoamMons_CurMapNumber:: db
wRoamMons_CurMapGroup:: db
wRoamMons_LastMapNumber:: db
wRoamMons_LastMapGroup:: db

wBestMagikarpLengthFeet:: db
wBestMagikarpLengthInches:: db
wMagikarpRecordHoldersName:: ds NAME_LENGTH

UNION ; dd40
wPokedexShowPointerAddr:: dw
wPokedexShowPointerBank:: db
	ds 3

NEXTU ; dd40
wUnusedEggHatchFlag:: db

NEXTU ; dd40
; enemy party
wOTPlayerName:: ds NAME_LENGTH ; dd40
wOTPlayerID:: dw ; dd4b
	ds 8
wOTPartyCount::   db ; dd55
wOTPartySpecies:: ds PARTY_LENGTH ; dd56
wOTPartyEnd::     db ; older code doesn't check PartyCount
ENDU ; dd5d

UNION ; dd5d
; catch tutorial dude pack
wDudeBag::
wDudeNumItems:: db
wDudeItems:: ds 2 * 4
wDudeItemsEnd:: db

wDudeNumKeyItems:: db ; dd67
wDudeKeyItems:: ds 18
wDudeKeyItemsEnd:: db

wDudeNumBalls:: db ; dd7b
wDudeBalls:: ds 2 * 4 ; dd7c
wDudeBallsEnd:: db ; dd84
wDudeBagEnd::

NEXTU ; dd5d
; ot party mons
wOTPartyMons::
wOTPartyMon1:: party_struct wOTPartyMon1 ; dd5d
wOTPartyMon2:: party_struct wOTPartyMon2 ; dd8d
wOTPartyMon3:: party_struct wOTPartyMon3 ; ddbd
wOTPartyMon4:: party_struct wOTPartyMon4 ; dded
wOTPartyMon5:: party_struct wOTPartyMon5 ; de1d
wOTPartyMon6:: party_struct wOTPartyMon6 ; de4d
wOTPartyMonsEnd::

wOTPartyMonOT:: ds NAME_LENGTH * PARTY_LENGTH ; de7d
wOTPartyMonNicknames:: ds MON_NAME_LENGTH * PARTY_LENGTH ; debf
wOTPartyDataEnd::
ENDU ; df01

wPokemonDataEnd::
wGameDataEnd::


SECTION "Stack", WRAMX

wStackTop::


INCLUDE "sram.asm"

INCLUDE "hram.asm"
