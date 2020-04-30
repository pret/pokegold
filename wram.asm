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

wc1c5:: db ; c1c5

wInputType::        db ; c1c6
wAutoInputAddress:: dw ; c1c7
wAutoInputBank::    db ; c1c9
wAutoInputLength::  db ; c1ca

wDebugFlags:: ds 1 ; c1cb
wGameLogicPaused:: ds 1 ; c1cc
wSpriteUpdatesEnabled:: db
wUnusedScriptByteBuffer:: db ; c1ce
wMapTimeOfDay:: ds 1 ; c1cf
	ds 3
wPrinterConnectionOpen:: ds 1
wPrinterOpcode:: ds 1 ; c1d4
wc1d5:: ds 1 ; c1d5
wDisableTextAcceleration:: ds 1 ; c1d6
wPCItemsCursor:: db ; c1d7
wPCItemsScrollPosition:: db ; c1d8
wc1d9:: ds 1 ; c1d9
wc1da:: ds 1 ; c1da
wc1db:: ds 1 ; c1db
wc1dc:: ds 1 ; c1dc
wc1dd:: ds 1 ; c1dd
wc1de:: ds 1 ; c1de
wc1df:: ds 1 ; c1df
wc1e0:: ds 1 ; c1e0
wc1e1:: ds 1 ; c1e1
wc1e2:: ds 1 ; c1e2
wc1e3:: ds 1 ; c1e3
wc1e4:: ds 1 ; c1e4
wc1e5:: ds 1 ; c1e5
wc1e6:: ds 1 ; c1e6
wc1e7:: ds 1 ; c1e7
wc1e8:: ds 1 ; c1e8
wc1e9:: ds 1 ; c1e9
wc1ea:: ds 1 ; c1ea
wc1eb:: ds 1 ; c1eb
wc1ec:: ds 1 ; c1ec
wc1ed:: ds 1 ; c1ed
wc1ee:: ds 1 ; c1ee
wc1ef:: ds 1 ; c1ef
wc1f0:: ds 1 ; c1f0
wc1f1:: ds 1 ; c1f1
wc1f2:: ds 1 ; c1f2
wc1f3:: ds 1 ; c1f3
wc1f4:: ds 1 ; c1f4
wc1f5:: ds 1 ; c1f5
wc1f6:: ds 1 ; c1f6
wc1f7:: ds 1 ; c1f7
wc1f8:: ds 1 ; c1f8
wc1f9:: ds 1 ; c1f9
wc1fa:: ds 1 ; c1fa
wc1fb:: ds 1 ; c1fb
wc1fc:: ds 1 ; c1fc
wc1fd:: ds 1 ; c1fd
wc1fe:: ds 1 ; c1fe
wc1ff:: ds 1 ; c1ff

SECTION "GBC Palettes", WRAM0
palbuffer: MACRO
\1Pal0:: ds 8
\1Pal1:: ds 8
\1Pal2:: ds 8
\1Pal3:: ds 8
\1Pal4:: ds 8
\1Pal5:: ds 8
\1Pal6:: ds 8
\1Pal7:: ds 8
ENDM

wBGPals1:: palbuffer wTempBG ; c200
wOBPals1:: palbuffer wTempOB ; c240
wBGPals2::     palbuffer wBG     ; c280
wOBPals2::     palbuffer wOB     ; c2c0

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


SECTION "TileMap", WRAM0
wTilemap:: ; c3a0
	ds SCREEN_HEIGHT * SCREEN_WIDTH
wTilemapEnd:: ; c508

SECTION "Animated Objects", WRAM0

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
wTempTilemap::
	ds SCREEN_HEIGHT * SCREEN_WIDTH

NEXTU
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

wAnimatedObjectStructCount:: ds 1 ; c5bc
wCurrSpriteOAMAddr:: ds 1 ; c5bd

wCurIcon:: ; c5be
	ds 1

wCurIconTile:: ds 1 ; c5bf
wSpriteAnimAddrBackup::
wSpriteAnimIDBuffer::
wCurSpriteOAMFlags:: ; c5c0
	dw
wCurAnimVTile:: ds 1 ; c5c2
wCurAnimXCoord:: ds 1 ; c5c3
wCurAnimYCoord:: ds 1 ; c5c4
wCurAnimXOffset:: ds 1 ; c5c5
wCurAnimYOffset:: ds 1 ; c5c6
wGlobalAnimYOffset:: ds 1 ; c5c7
wGlobalAnimXOffset:: ds 1 ; c5c8
wSpriteAnimsEnd:: ; c5c9

wc5c9:: ds 1 ; c5c9
wc5ca:: ds 1 ; c5ca
wc5cb:: ds 1 ; c5cb
wc5cc:: ds 1 ; c5cc
wc5cd:: ds 1 ; c5cd
wc5ce:: ds 1 ; c5ce
wc5cf:: ds 1 ; c5cf

UNION ; c5d0
; trade
wTradeMons::
wPlayerTrademon:: trademon wPlayerTrademon
wOTTrademon::     trademon wOTTrademon
wTrademonsEnd::
wTradeAnimAddress:: dw
wLinkPlayer1Name:: ds NAME_LENGTH
wLinkPlayer2Name:: ds NAME_LENGTH
wLinkTradeSendmonSpecies:: db
wLinkTradeGetmonSpecies::  db

NEXTU ; c5d0
; engine/gfx/color.asm ?
	ds 50
wc602:: ds 1 ; c602
wc603:: ds 1 ; c603
wc604:: ds 1 ; c604
wc605:: ds 1 ; c605
wc606:: ds 1 ; c606
wc607:: ds 1 ; c607

NEXTU ; c5d0
; naming screen
wNamingScreenDestinationPointer:: dw ; c5d0
wNamingScreenCurNameLength:: db ; c5d2
wNamingScreenMaxNameLength:: db ; c5d3
wNamingScreenType:: db ; c5d4
wNamingScreenCursorObjectPointer:: dw ; c5d5
wNamingScreenLastCharacter:: db ; c5d7
wNamingScreenStringEntryCoord:: dw ; c5d8
ENDU

	ds 126

wc6ca:: ds 1 ; c6ca
wc6cb:: ds 1 ; c6cb
wc6cc:: ds 1 ; c6cc
wc6cd:: ds 1 ; c6cd
wc6ce:: ds 1 ; c6ce
wc6cf:: ds 1 ; c6cf
wc6d0:: ds 1 ; c6d0
wc6d1:: ds 1 ; c6d1
wc6d2:: ds 1 ; c6d2
wc6d3:: ds 1 ; c6d3
wc6d4:: ds 1 ; c6d4
wc6d5:: ds 1 ; c6d5
wc6d6:: ds 1 ; c6d6
wc6d7:: ds 1 ; c6d7
wc6d8:: ds 1 ; c6d8
wc6d9:: ds 1 ; c6d9
wc6da:: ds 1 ; c6da
wc6db:: ds 1 ; c6db
wc6dc:: ds 1 ; c6dc
wc6dd:: ds 1 ; c6dd
wc6de:: ds 1 ; c6de
wc6df:: ds 1 ; c6df
wc6e0:: ds 1 ; c6e0
wc6e1:: ds 1 ; c6e1
wc6e2:: ds 1 ; c6e2
wc6e3:: ds 1 ; c6e3
wc6e4:: ds 1 ; c6e4
wc6e5:: ds 1 ; c6e5
wc6e6:: ds 1 ; c6e6
wc6e7:: ds 1 ; c6e7

; This was a buffer for map-related pointers in the 1997 G/S prototype.
; See wMapBuffer in pokegold-spaceworld's wram.asm.
wUnusedMapBuffer:: ds 24
wUnusedMapBufferEnd::

wOverworldMapBlocks::
wLYOverrides::
wHallOfFamePokemonList::
wc700:: ds 1 ; c700
wc701:: ds 1 ; c701
wc702:: ds 1 ; c702
wc703:: ds 1 ; c703
wc704:: ds 1 ; c704
wc705:: ds 1 ; c705
wc706:: ds 1 ; c706
wc707:: ds 1 ; c707
wc708:: ds 1 ; c708
wc709:: ds 1 ; c709
wc70a:: ds 1 ; c70a
wc70b:: ds 1 ; c70b
wc70c:: ds 1 ; c70c
wc70d:: ds 1 ; c70d
wc70e:: ds 1 ; c70e
wc70f:: ds 1 ; c70f
wc710:: ds 1 ; c710
wc711:: ds 1 ; c711
wc712:: ds 1 ; c712
wc713:: ds 1 ; c713
wc714:: ds 1 ; c714
wc715:: ds 1 ; c715
wc716:: ds 1 ; c716
wc717:: ds 1 ; c717
wc718:: ds 1 ; c718
wc719:: ds 1 ; c719
wc71a:: ds 1 ; c71a
wc71b:: ds 1 ; c71b
wc71c:: ds 1 ; c71c
wc71d:: ds 1 ; c71d
wc71e:: ds 1 ; c71e
wc71f:: ds 1 ; c71f
wc720:: ds 1 ; c720
wc721:: ds 1 ; c721
wc722:: ds 1 ; c722
wc723:: ds 1 ; c723
wc724:: ds 1 ; c724
wc725:: ds 1 ; c725
wc726:: ds 1 ; c726
wc727:: ds 1 ; c727
wc728:: ds 1 ; c728
wc729:: ds 1 ; c729
wc72a:: ds 1 ; c72a
wc72b:: ds 1 ; c72b
wc72c:: ds 1 ; c72c
wc72d:: ds 1 ; c72d
wc72e:: ds 1 ; c72e
wc72f:: ds 1 ; c72f
wc730:: ds 1 ; c730
wc731:: ds 1 ; c731
wc732:: ds 1 ; c732
wc733:: ds 1 ; c733
wc734:: ds 1 ; c734
wc735:: ds 1 ; c735
wc736:: ds 1 ; c736
wc737:: ds 1 ; c737
wc738:: ds 1 ; c738
wc739:: ds 1 ; c739
wc73a:: ds 1 ; c73a
wc73b:: ds 1 ; c73b
wc73c:: ds 1 ; c73c
wc73d:: ds 1 ; c73d
wc73e:: ds 1 ; c73e
wc73f:: ds 1 ; c73f
wc740:: ds 1 ; c740
wc741:: ds 1 ; c741
wc742:: ds 1 ; c742
wc743:: ds 1 ; c743
wc744:: ds 1 ; c744
wc745:: ds 1 ; c745
wc746:: ds 1 ; c746
wc747:: ds 1 ; c747
wc748:: ds 1 ; c748
wc749:: ds 1 ; c749
wc74a:: ds 1 ; c74a
wc74b:: ds 1 ; c74b
wc74c:: ds 1 ; c74c
wc74d:: ds 1 ; c74d
wc74e:: ds 1 ; c74e
wc74f:: ds 1 ; c74f
wc750:: ds 1 ; c750
wc751:: ds 1 ; c751
wc752:: ds 1 ; c752
wc753:: ds 1 ; c753
wc754:: ds 1 ; c754
wc755:: ds 1 ; c755
wc756:: ds 1 ; c756
wc757:: ds 1 ; c757
wc758:: ds 1 ; c758
wc759:: ds 1 ; c759
wc75a:: ds 1 ; c75a
wc75b:: ds 1 ; c75b
wc75c:: ds 1 ; c75c
wc75d:: ds 1 ; c75d
wc75e:: ds 1 ; c75e
wc75f:: ds 1 ; c75f
wc760:: ds 1 ; c760
wHallOfFamePokemonListEnd::
wc761:: ds 1 ; c761
wc762:: ds 1 ; c762
wc763:: ds 1 ; c763
wc764:: ds 1 ; c764
wc765:: ds 1 ; c765
wc766:: ds 1 ; c766
wc767:: ds 1 ; c767
wc768:: ds 1 ; c768
wc769:: ds 1 ; c769
wc76a:: ds 1 ; c76a
wc76b:: ds 1 ; c76b
wc76c:: ds 1 ; c76c
wc76d:: ds 1 ; c76d
wc76e:: ds 1 ; c76e
wc76f:: ds 1 ; c76f
wc770:: ds 1 ; c770
wc771:: ds 1 ; c771
wc772:: ds 1 ; c772
wc773:: ds 1 ; c773
wc774:: ds 1 ; c774
wc775:: ds 1 ; c775
wc776:: ds 1 ; c776
wc777:: ds 1 ; c777
wc778:: ds 1 ; c778
wc779:: ds 1 ; c779
wc77a:: ds 1 ; c77a
wc77b:: ds 1 ; c77b
wc77c:: ds 1 ; c77c
wc77d:: ds 1 ; c77d
wc77e:: ds 1 ; c77e
wc77f:: ds 1 ; c77f
wc780:: ds 1 ; c780
wc781:: ds 1 ; c781
wc782:: ds 1 ; c782
wc783:: ds 1 ; c783
wc784:: ds 1 ; c784
wc785:: ds 1 ; c785
wc786:: ds 1 ; c786
wc787:: ds 1 ; c787
wc788:: ds 1 ; c788
wc789:: ds 1 ; c789
wc78a:: ds 1 ; c78a
wc78b:: ds 1 ; c78b
wc78c:: ds 1 ; c78c
wc78d:: ds 1 ; c78d
wc78e:: ds 1 ; c78e
wc78f:: ds 1 ; c78f
wLYOverridesEnd::
wc790:: ds 1 ; c790
wc791:: ds 1 ; c791
wc792:: ds 1 ; c792
wc793:: ds 1 ; c793
wc794:: ds 1 ; c794
wc795:: ds 1 ; c795
wc796:: ds 1 ; c796
wc797:: ds 1 ; c797
wc798:: ds 1 ; c798
wc799:: ds 1 ; c799
wc79a:: ds 1 ; c79a
wc79b:: ds 1 ; c79b
wc79c:: ds 1 ; c79c
wc79d:: ds 1 ; c79d
wc79e:: ds 1 ; c79e
wc79f:: ds 1 ; c79f
wc7a0:: ds 1 ; c7a0
wc7a1:: ds 1 ; c7a1
wc7a2:: ds 1 ; c7a2
wc7a3:: ds 1 ; c7a3
wc7a4:: ds 1 ; c7a4
wc7a5:: ds 1 ; c7a5
wc7a6:: ds 1 ; c7a6
wc7a7:: ds 1 ; c7a7
wc7a8:: ds 1 ; c7a8
wc7a9:: ds 1 ; c7a9
wc7aa:: ds 1 ; c7aa
wc7ab:: ds 1 ; c7ab
wc7ac:: ds 1 ; c7ac
wc7ad:: ds 1 ; c7ad
wc7ae:: ds 1 ; c7ae
wc7af:: ds 1 ; c7af
wc7b0:: ds 1 ; c7b0
wc7b1:: ds 1 ; c7b1
wc7b2:: ds 1 ; c7b2
wc7b3:: ds 1 ; c7b3
wc7b4:: ds 1 ; c7b4
wc7b5:: ds 1 ; c7b5
wc7b6:: ds 1 ; c7b6
wc7b7:: ds 1 ; c7b7
wc7b8:: ds 1 ; c7b8
wc7b9:: ds 1 ; c7b9
wc7ba:: ds 1 ; c7ba
wc7bb:: ds 1 ; c7bb
wc7bc:: ds 1 ; c7bc
wc7bd:: ds 1 ; c7bd
wc7be:: ds 1 ; c7be
wc7bf:: ds 1 ; c7bf
wc7c0:: ds 1 ; c7c0
wc7c1:: ds 1 ; c7c1
wc7c2:: ds 1 ; c7c2
wc7c3:: ds 1 ; c7c3
wc7c4:: ds 1 ; c7c4
wc7c5:: ds 1 ; c7c5
wc7c6:: ds 1 ; c7c6
wc7c7:: ds 1 ; c7c7
wc7c8:: ds 1 ; c7c8
wc7c9:: ds 1 ; c7c9
wc7ca:: ds 1 ; c7ca
wc7cb:: ds 1 ; c7cb
wc7cc:: ds 1 ; c7cc
wc7cd:: ds 1 ; c7cd
wc7ce:: ds 1 ; c7ce
wc7cf:: ds 1 ; c7cf
wc7d0:: ds 1 ; c7d0
wc7d1:: ds 1 ; c7d1
wc7d2:: ds 1 ; c7d2
wc7d3:: ds 1 ; c7d3
wc7d4:: ds 1 ; c7d4
wc7d5:: ds 1 ; c7d5
wc7d6:: ds 1 ; c7d6
wc7d7:: ds 1 ; c7d7
wc7d8:: ds 1 ; c7d8
wc7d9:: ds 1 ; c7d9
wc7da:: ds 1 ; c7da
wc7db:: ds 1 ; c7db
wc7dc:: ds 1 ; c7dc
wc7dd:: ds 1 ; c7dd
wc7de:: ds 1 ; c7de
wc7df:: ds 1 ; c7df
wc7e0:: ds 1 ; c7e0
wc7e1:: ds 1 ; c7e1
wc7e2:: ds 1 ; c7e2
wc7e3:: ds 1 ; c7e3
wc7e4:: ds 1 ; c7e4
wc7e5:: ds 1 ; c7e5
wc7e6:: ds 1 ; c7e6
wc7e7:: ds 1 ; c7e7
wc7e8:: ds 1 ; c7e8
wc7e9:: ds 1 ; c7e9
wc7ea:: ds 1 ; c7ea
wc7eb:: ds 1 ; c7eb
wc7ec:: ds 1 ; c7ec
wc7ed:: ds 1 ; c7ed
wc7ee:: ds 1 ; c7ee
wc7ef:: ds 1 ; c7ef
wc7f0:: ds 1 ; c7f0
wc7f1:: ds 1 ; c7f1
wc7f2:: ds 1 ; c7f2
wc7f3:: ds 1 ; c7f3
wc7f4:: ds 1 ; c7f4
wc7f5:: ds 1 ; c7f5
wc7f6:: ds 1 ; c7f6
wc7f7:: ds 1 ; c7f7
wc7f8:: ds 1 ; c7f8
wc7f9:: ds 1 ; c7f9
wc7fa:: ds 1 ; c7fa
wc7fb:: ds 1 ; c7fb
wc7fc:: ds 1 ; c7fc
wc7fd:: ds 1 ; c7fd
wc7fe:: ds 1 ; c7fe
wc7ff:: ds 1 ; c7ff

wLYOverridesBackup::
wc800:: ds 1 ; c800
wc801:: ds 1 ; c801
wc802:: ds 1 ; c802
wMysteryGiftPartnerName::
wc803:: ds 1 ; c803
wc804:: ds 1 ; c804
wc805:: ds 1 ; c805
wc806:: ds 1 ; c806
wc807:: ds 1 ; c807
wc808:: ds 1 ; c808
wc809:: ds 1 ; c809
wc80a:: ds 1 ; c80a
wc80b:: ds 1 ; c80b
wc80c:: ds 1 ; c80c
wc80d:: ds 1 ; c80d
wc80e:: ds 1 ; c80e
wc80f:: ds 1 ; c80f
wc810:: ds 1 ; c810
wc811:: ds 1 ; c811
wc812:: ds 1 ; c812
wc813:: ds 1 ; c813
wc814:: ds 1 ; c814
wc815:: ds 1 ; c815
wc816:: ds 1 ; c816
wc817:: ds 1 ; c817
wc818:: ds 1 ; c818
wc819:: ds 1 ; c819
wc81a:: ds 1 ; c81a
wc81b:: ds 1 ; c81b
wc81c:: ds 1 ; c81c
wc81d:: ds 1 ; c81d
wc81e:: ds 1 ; c81e
wc81f:: ds 1 ; c81f
wc820:: ds 1 ; c820
wc821:: ds 1 ; c821
wc822:: ds 1 ; c822
wc823:: ds 1 ; c823
wc824:: ds 1 ; c824
wc825:: ds 1 ; c825
wc826:: ds 1 ; c826
wc827:: ds 1 ; c827
wc828:: ds 1 ; c828
wc829:: ds 1 ; c829
wc82a:: ds 1 ; c82a
wc82b:: ds 1 ; c82b
wc82c:: ds 1 ; c82c
wc82d:: ds 1 ; c82d
wc82e:: ds 1 ; c82e
wc82f:: ds 1 ; c82f
wc830:: ds 1 ; c830
wc831:: ds 1 ; c831
wc832:: ds 1 ; c832
wc833:: ds 1 ; c833
wc834:: ds 1 ; c834
wc835:: ds 1 ; c835
wc836:: ds 1 ; c836
wc837:: ds 1 ; c837
wc838:: ds 1 ; c838
wc839:: ds 1 ; c839
wc83a:: ds 1 ; c83a
wc83b:: ds 1 ; c83b
wc83c:: ds 1 ; c83c
wc83d:: ds 1 ; c83d
wc83e:: ds 1 ; c83e
wc83f:: ds 1 ; c83f
wc840:: ds 1 ; c840
wc841:: ds 1 ; c841
wc842:: ds 1 ; c842
wc843:: ds 1 ; c843
wc844:: ds 1 ; c844
wc845:: ds 1 ; c845
wc846:: ds 1 ; c846
wc847:: ds 1 ; c847
wc848:: ds 1 ; c848
wc849:: ds 1 ; c849
wc84a:: ds 1 ; c84a
wc84b:: ds 1 ; c84b
wc84c:: ds 1 ; c84c
wc84d:: ds 1 ; c84d
wc84e:: ds 1 ; c84e
wc84f:: ds 1 ; c84f
wc850:: ds 1 ; c850
wc851:: ds 1 ; c851
wc852:: ds 1 ; c852
wMysteryGiftPlayerName::
wc853:: ds 1 ; c853
wc854:: ds 1 ; c854
wc855:: ds 1 ; c855
wc856:: ds 1 ; c856
wc857:: ds 1 ; c857
wc858:: ds 1 ; c858
wc859:: ds 1 ; c859
wc85a:: ds 1 ; c85a
wc85b:: ds 1 ; c85b
wc85c:: ds 1 ; c85c
wc85d:: ds 1 ; c85d
wc85e:: ds 1 ; c85e
wc85f:: ds 1 ; c85f
wc860:: ds 1 ; c860
wc861:: ds 1 ; c861
wc862:: ds 1 ; c862
wc863:: ds 1 ; c863
wc864:: ds 1 ; c864
wc865:: ds 1 ; c865
wc866:: ds 1 ; c866
wc867:: ds 1 ; c867
wc868:: ds 1 ; c868
wc869:: ds 1 ; c869
wc86a:: ds 1 ; c86a
wc86b:: ds 1 ; c86b
wc86c:: ds 1 ; c86c
wc86d:: ds 1 ; c86d
wc86e:: ds 1 ; c86e
wc86f:: ds 1 ; c86f
wc870:: ds 1 ; c870
wc871:: ds 1 ; c871
wc872:: ds 1 ; c872
wc873:: ds 1 ; c873
wc874:: ds 1 ; c874
wc875:: ds 1 ; c875
wc876:: ds 1 ; c876
wc877:: ds 1 ; c877
wc878:: ds 1 ; c878
wc879:: ds 1 ; c879
wc87a:: ds 1 ; c87a
wc87b:: ds 1 ; c87b
wc87c:: ds 1 ; c87c
wc87d:: ds 1 ; c87d
wc87e:: ds 1 ; c87e
wc87f:: ds 1 ; c87f
wc880:: ds 1 ; c880
wc881:: ds 1 ; c881
wc882:: ds 1 ; c882
wc883:: ds 1 ; c883
wc884:: ds 1 ; c884
wc885:: ds 1 ; c885
wc886:: ds 1 ; c886
wc887:: ds 1 ; c887
wc888:: ds 1 ; c888
wc889:: ds 1 ; c889
wc88a:: ds 1 ; c88a
wc88b:: ds 1 ; c88b
wc88c:: ds 1 ; c88c
wc88d:: ds 1 ; c88d
wc88e:: ds 1 ; c88e
wc88f:: ds 1 ; c88f
wLYOverridesBackupEnd::
wc890:: ds 1 ; c890
wc891:: ds 1 ; c891
wc892:: ds 1 ; c892
wc893:: ds 1 ; c893
wc894:: ds 1 ; c894
wc895:: ds 1 ; c895
wc896:: ds 1 ; c896
wc897:: ds 1 ; c897
wc898:: ds 1 ; c898
wc899:: ds 1 ; c899
wc89a:: ds 1 ; c89a
wc89b:: ds 1 ; c89b
wc89c:: ds 1 ; c89c
wc89d:: ds 1 ; c89d
wc89e:: ds 1 ; c89e
wc89f:: ds 1 ; c89f
wc8a0:: ds 1 ; c8a0
wc8a1:: ds 1 ; c8a1
wc8a2:: ds 1 ; c8a2
wc8a3:: ds 1 ; c8a3
wc8a4:: ds 1 ; c8a4
wc8a5:: ds 1 ; c8a5
wc8a6:: ds 1 ; c8a6
wc8a7:: ds 1 ; c8a7
wc8a8:: ds 1 ; c8a8
wc8a9:: ds 1 ; c8a9
wc8aa:: ds 1 ; c8aa
wc8ab:: ds 1 ; c8ab
wc8ac:: ds 1 ; c8ac
wc8ad:: ds 1 ; c8ad
wc8ae:: ds 1 ; c8ae
wc8af:: ds 1 ; c8af
wc8b0:: ds 1 ; c8b0
wc8b1:: ds 1 ; c8b1
wc8b2:: ds 1 ; c8b2
wc8b3:: ds 1 ; c8b3
wc8b4:: ds 1 ; c8b4
wc8b5:: ds 1 ; c8b5
wc8b6:: ds 1 ; c8b6
wc8b7:: ds 1 ; c8b7
wc8b8:: ds 1 ; c8b8
wc8b9:: ds 1 ; c8b9
wc8ba:: ds 1 ; c8ba
wc8bb:: ds 1 ; c8bb
wc8bc:: ds 1 ; c8bc
wc8bd:: ds 1 ; c8bd
wc8be:: ds 1 ; c8be
wc8bf:: ds 1 ; c8bf
wc8c0:: ds 1 ; c8c0
wc8c1:: ds 1 ; c8c1
wc8c2:: ds 1 ; c8c2
wc8c3:: ds 1 ; c8c3
wc8c4:: ds 1 ; c8c4
wc8c5:: ds 1 ; c8c5
wc8c6:: ds 1 ; c8c6
wc8c7:: ds 1 ; c8c7
wc8c8:: ds 1 ; c8c8
wc8c9:: ds 1 ; c8c9
wc8ca:: ds 1 ; c8ca
wc8cb:: ds 1 ; c8cb
wc8cc:: ds 1 ; c8cc
wc8cd:: ds 1 ; c8cd
wc8ce:: ds 1 ; c8ce
wc8cf:: ds 1 ; c8cf
wc8d0:: ds 1 ; c8d0
wc8d1:: ds 1 ; c8d1
wc8d2:: ds 1 ; c8d2
wc8d3:: ds 1 ; c8d3
wc8d4:: ds 1 ; c8d4
wc8d5:: ds 1 ; c8d5
wc8d6:: ds 1 ; c8d6
wc8d7:: ds 1 ; c8d7
wc8d8:: ds 1 ; c8d8
wc8d9:: ds 1 ; c8d9
wc8da:: ds 1 ; c8da
wc8db:: ds 1 ; c8db
wc8dc:: ds 1 ; c8dc
wc8dd:: ds 1 ; c8dd
wc8de:: ds 1 ; c8de
wc8df:: ds 1 ; c8df
wc8e0:: ds 1 ; c8e0
wc8e1:: ds 1 ; c8e1
wc8e2:: ds 1 ; c8e2
wc8e3:: ds 1 ; c8e3
wc8e4:: ds 1 ; c8e4
wc8e5:: ds 1 ; c8e5
wc8e6:: ds 1 ; c8e6
wc8e7:: ds 1 ; c8e7
wc8e8:: ds 1 ; c8e8
wc8e9:: ds 1 ; c8e9
wc8ea:: ds 1 ; c8ea
wc8eb:: ds 1 ; c8eb
wc8ec:: ds 1 ; c8ec
wc8ed:: ds 1 ; c8ed
wc8ee:: ds 1 ; c8ee
wc8ef:: ds 1 ; c8ef
wc8f0:: ds 1 ; c8f0
wc8f1:: ds 1 ; c8f1
wc8f2:: ds 1 ; c8f2
wc8f3:: ds 1 ; c8f3
wc8f4:: ds 1 ; c8f4
wc8f5:: ds 1 ; c8f5
wc8f6:: ds 1 ; c8f6
wc8f7:: ds 1 ; c8f7
wc8f8:: ds 1 ; c8f8
wc8f9:: ds 1 ; c8f9
wc8fa:: ds 1 ; c8fa
wc8fb:: ds 1 ; c8fb
wc8fc:: ds 1 ; c8fc
wc8fd:: ds 1 ; c8fd
wc8fe:: ds 1 ; c8fe
wc8ff:: ds 1 ; c8ff
wc900:: ds 1 ; c900
wc901:: ds 1 ; c901
wc902:: ds 1 ; c902
wc903:: ds 1 ; c903
wc904:: ds 1 ; c904
wc905:: ds 1 ; c905
wc906:: ds 1 ; c906
wc907:: ds 1 ; c907
wc908:: ds 1 ; c908
wc909:: ds 1 ; c909
wc90a:: ds 1 ; c90a
wc90b:: ds 1 ; c90b
wc90c:: ds 1 ; c90c
wc90d:: ds 1 ; c90d
wc90e:: ds 1 ; c90e
wc90f:: ds 1 ; c90f
wc910:: ds 1 ; c910
wc911:: ds 1 ; c911
wc912:: ds 1 ; c912
wc913:: ds 1 ; c913
wc914:: ds 1 ; c914
wc915:: ds 1 ; c915
wc916:: ds 1 ; c916
wc917:: ds 1 ; c917
wc918:: ds 1 ; c918
wc919:: ds 1 ; c919
wc91a:: ds 1 ; c91a
wc91b:: ds 1 ; c91b
wc91c:: ds 1 ; c91c
wc91d:: ds 1 ; c91d
wc91e:: ds 1 ; c91e
wc91f:: ds 1 ; c91f
wc920:: ds 1 ; c920
wc921:: ds 1 ; c921
wc922:: ds 1 ; c922
wc923:: ds 1 ; c923
wc924:: ds 1 ; c924
wc925:: ds 1 ; c925
wc926:: ds 1 ; c926
wc927:: ds 1 ; c927
wc928:: ds 1 ; c928
wc929:: ds 1 ; c929
wc92a:: ds 1 ; c92a
wc92b:: ds 1 ; c92b
wc92c:: ds 1 ; c92c
wc92d:: ds 1 ; c92d
wc92e:: ds 1 ; c92e
wc92f:: ds 1 ; c92f
wc930:: ds 1 ; c930
wc931:: ds 1 ; c931
wc932:: ds 1 ; c932
wc933:: ds 1 ; c933
wc934:: ds 1 ; c934
wc935:: ds 1 ; c935
wc936:: ds 1 ; c936
wc937:: ds 1 ; c937
wc938:: ds 1 ; c938
wc939:: ds 1 ; c939
wc93a:: ds 1 ; c93a
wc93b:: ds 1 ; c93b
wc93c:: ds 1 ; c93c
wc93d:: ds 1 ; c93d
wc93e:: ds 1 ; c93e
wc93f:: ds 1 ; c93f
wc940:: ds 1 ; c940
wc941:: ds 1 ; c941
wc942:: ds 1 ; c942
wc943:: ds 1 ; c943
wc944:: ds 1 ; c944
wc945:: ds 1 ; c945
wc946:: ds 1 ; c946
wc947:: ds 1 ; c947
wc948:: ds 1 ; c948
wc949:: ds 1 ; c949
wc94a:: ds 1 ; c94a
wc94b:: ds 1 ; c94b
wc94c:: ds 1 ; c94c
wc94d:: ds 1 ; c94d
wc94e:: ds 1 ; c94e
wc94f:: ds 1 ; c94f
wc950:: ds 1 ; c950
wc951:: ds 1 ; c951
wc952:: ds 1 ; c952
wc953:: ds 1 ; c953
wc954:: ds 1 ; c954
wc955:: ds 1 ; c955
wc956:: ds 1 ; c956
wc957:: ds 1 ; c957
wc958:: ds 1 ; c958
wc959:: ds 1 ; c959
wc95a:: ds 1 ; c95a
wc95b:: ds 1 ; c95b
wc95c:: ds 1 ; c95c
wc95d:: ds 1 ; c95d
wc95e:: ds 1 ; c95e
wc95f:: ds 1 ; c95f
wc960:: ds 1 ; c960
wc961:: ds 1 ; c961
wc962:: ds 1 ; c962
wc963:: ds 1 ; c963
wc964:: ds 1 ; c964
wc965:: ds 1 ; c965
wc966:: ds 1 ; c966
wc967:: ds 1 ; c967
wc968:: ds 1 ; c968
wc969:: ds 1 ; c969
wc96a:: ds 1 ; c96a
wc96b:: ds 1 ; c96b
wc96c:: ds 1 ; c96c
wc96d:: ds 1 ; c96d
wc96e:: ds 1 ; c96e
wc96f:: ds 1 ; c96f
wc970:: ds 1 ; c970
wc971:: ds 1 ; c971
wc972:: ds 1 ; c972
wc973:: ds 1 ; c973
wc974:: ds 1 ; c974
wc975:: ds 1 ; c975
wc976:: ds 1 ; c976
wc977:: ds 1 ; c977
wc978:: ds 1 ; c978
wc979:: ds 1 ; c979
wc97a:: ds 1 ; c97a
wc97b:: ds 1 ; c97b
wc97c:: ds 1 ; c97c
wc97d:: ds 1 ; c97d
wc97e:: ds 1 ; c97e
wc97f:: ds 1 ; c97f
wc980:: ds 1 ; c980
wc981:: ds 1 ; c981
wc982:: ds 1 ; c982
wc983:: ds 1 ; c983
wc984:: ds 1 ; c984
wc985:: ds 1 ; c985
wc986:: ds 1 ; c986
wc987:: ds 1 ; c987
wc988:: ds 1 ; c988
wc989:: ds 1 ; c989
wHandshakeFrameDelay:: ds 1 ; c98a
wc98b:: ds 1 ; c98b
wc98c:: ds 1 ; c98c
wc98d:: ds 1 ; c98d
wc98e:: ds 1 ; c98e
wc98f:: ds 1 ; c98f
wc990:: ds 1 ; c990
wc991:: ds 1 ; c991
wc992:: ds 1 ; c992
wc993:: ds 1 ; c993
wc994:: ds 1 ; c994
wc995:: ds 1 ; c995
wc996:: ds 1 ; c996
wc997:: ds 1 ; c997
wc998:: ds 1 ; c998
wc999:: ds 1 ; c999
wc99a:: ds 1 ; c99a
wc99b:: ds 1 ; c99b
wc99c:: ds 1 ; c99c
wc99d:: ds 1 ; c99d
wc99e:: ds 1 ; c99e
wc99f:: ds 1 ; c99f
wc9a0:: ds 1 ; c9a0
wc9a1:: ds 1 ; c9a1
wc9a2:: ds 1 ; c9a2
wc9a3:: ds 1 ; c9a3
wc9a4:: ds 1 ; c9a4
wc9a5:: ds 1 ; c9a5
wc9a6:: ds 1 ; c9a6
wc9a7:: ds 1 ; c9a7
wc9a8:: ds 1 ; c9a8
wc9a9:: ds 1 ; c9a9
wc9aa:: ds 1 ; c9aa
wc9ab:: ds 1 ; c9ab
wc9ac:: ds 1 ; c9ac
wc9ad:: ds 1 ; c9ad
wc9ae:: ds 1 ; c9ae
wc9af:: ds 1 ; c9af
wc9b0:: ds 1 ; c9b0
wc9b1:: ds 1 ; c9b1
wc9b2:: ds 1 ; c9b2
wc9b3:: ds 1 ; c9b3
wc9b4:: ds 1 ; c9b4
wc9b5:: ds 1 ; c9b5
wc9b6:: ds 1 ; c9b6
wc9b7:: ds 1 ; c9b7
wc9b8:: ds 1 ; c9b8
wc9b9:: ds 1 ; c9b9
wc9ba:: ds 1 ; c9ba
wc9bb:: ds 1 ; c9bb
wc9bc:: ds 1 ; c9bc
wc9bd:: ds 1 ; c9bd
wc9be:: ds 1 ; c9be
wc9bf:: ds 1 ; c9bf
wc9c0:: ds 1 ; c9c0
wc9c1:: ds 1 ; c9c1
wc9c2:: ds 1 ; c9c2
wc9c3:: ds 1 ; c9c3
wc9c4:: ds 1 ; c9c4
wc9c5:: ds 1 ; c9c5
wc9c6:: ds 1 ; c9c6
wc9c7:: ds 1 ; c9c7
wc9c8:: ds 1 ; c9c8
wc9c9:: ds 1 ; c9c9
wc9ca:: ds 1 ; c9ca
wc9cb:: ds 1 ; c9cb
wc9cc:: ds 1 ; c9cc
wc9cd:: ds 1 ; c9cd
wc9ce:: ds 1 ; c9ce
wc9cf:: ds 1 ; c9cf
wc9d0:: ds 1 ; c9d0
wc9d1:: ds 1 ; c9d1
wc9d2:: ds 1 ; c9d2
wc9d3:: ds 1 ; c9d3
wc9d4:: ds 1 ; c9d4
wc9d5:: ds 1 ; c9d5
wc9d6:: ds 1 ; c9d6
wc9d7:: ds 1 ; c9d7
wc9d8:: ds 1 ; c9d8
wc9d9:: ds 1 ; c9d9
wc9da:: ds 1 ; c9da
wc9db:: ds 1 ; c9db
wc9dc:: ds 1 ; c9dc
wc9dd:: ds 1 ; c9dd
wc9de:: ds 1 ; c9de
wc9df:: ds 1 ; c9df
wc9e0:: ds 1 ; c9e0
wc9e1:: ds 1 ; c9e1
wc9e2:: ds 1 ; c9e2
wc9e3:: ds 1 ; c9e3
wc9e4:: ds 1 ; c9e4
wc9e5:: ds 1 ; c9e5
wc9e6:: ds 1 ; c9e6
wc9e7:: ds 1 ; c9e7
wc9e8:: ds 1 ; c9e8
wc9e9:: ds 1 ; c9e9
wc9ea:: ds 1 ; c9ea
wc9eb:: ds 1 ; c9eb
wc9ec:: ds 1 ; c9ec
wc9ed:: ds 1 ; c9ed
wc9ee:: ds 1 ; c9ee
wc9ef:: ds 1 ; c9ef
wc9f0:: ds 1 ; c9f0
wc9f1:: ds 1 ; c9f1
wc9f2:: ds 1 ; c9f2
wc9f3:: ds 1 ; c9f3
wc9f4:: ds 1 ; c9f4
wc9f5:: ds 1 ; c9f5
wc9f6:: ds 1 ; c9f6
wc9f7:: ds 1 ; c9f7
wc9f8:: ds 1 ; c9f8
wc9f9:: ds 1 ; c9f9
wc9fa:: ds 1 ; c9fa
wc9fb:: ds 1 ; c9fb
wc9fc:: ds 1 ; c9fc
wc9fd:: ds 1 ; c9fd
wc9fe:: ds 1 ; c9fe
wc9ff:: ds 1 ; c9ff
wca00:: ds 1 ; ca00
wca01:: ds 1 ; ca01
wca02:: ds 1 ; ca02
wca03:: ds 1 ; ca03
wca04:: ds 1 ; ca04
wca05:: ds 1 ; ca05
wca06:: ds 1 ; ca06
wca07:: ds 1 ; ca07
wca08:: ds 1 ; ca08
wca09:: ds 1 ; ca09
wca0a:: ds 1 ; ca0a
wca0b:: ds 1 ; ca0b
wca0c:: ds 1 ; ca0c
wca0d:: ds 1 ; ca0d
wca0e:: ds 1 ; ca0e
wca0f:: ds 1 ; ca0f
wBattleAnimAddress:: dw ; ca10
wca12:: ds 1 ; ca12
wca13:: ds 1 ; ca13
wca14:: ds 1 ; ca14
wca15:: ds 1 ; ca15
wca16:: ds 1 ; ca16
wBattleAnimByte:: db ; ca17
wca18:: ds 1 ; ca18
wca19:: ds 1 ; ca19
wca1a:: ds 1 ; ca1a
wca1b:: ds 1 ; ca1b
wca1c:: ds 1 ; ca1c
wca1d:: ds 1 ; ca1d
wca1e:: ds 1 ; ca1e
wca1f:: ds 1 ; ca1f
wca20:: ds 1 ; ca20
wca21:: ds 1 ; ca21
wca22:: ds 1 ; ca22
wca23:: ds 1 ; ca23
wca24:: ds 1 ; ca24
wca25:: ds 1 ; ca25
wca26:: ds 1 ; ca26
wca27:: ds 1 ; ca27
wca28:: ds 1 ; ca28
wca29:: ds 1 ; ca29
wca2a:: ds 1 ; ca2a
wca2b:: ds 1 ; ca2b
wca2c:: ds 1 ; ca2c
wca2d:: ds 1 ; ca2d
wca2e:: ds 1 ; ca2e
wca2f:: ds 1 ; ca2f
wca30:: ds 1 ; ca30
wca31:: ds 1 ; ca31
wca32:: ds 1 ; ca32
wca33:: ds 1 ; ca33
wca34:: ds 1 ; ca34
wca35:: ds 1 ; ca35
wca36:: ds 1 ; ca36
wca37:: ds 1 ; ca37
wca38:: ds 1 ; ca38
wca39:: ds 1 ; ca39
wca3a:: ds 1 ; ca3a
wca3b:: ds 1 ; ca3b
wca3c:: ds 1 ; ca3c
wca3d:: ds 1 ; ca3d
wca3e:: ds 1 ; ca3e
wca3f:: ds 1 ; ca3f
wca40:: ds 1 ; ca40
wca41:: ds 1 ; ca41
wca42:: ds 1 ; ca42
wca43:: ds 1 ; ca43
wca44:: ds 1 ; ca44
wca45:: ds 1 ; ca45
wca46:: ds 1 ; ca46
wca47:: ds 1 ; ca47
wca48:: ds 1 ; ca48
wca49:: ds 1 ; ca49
wca4a:: ds 1 ; ca4a
wca4b:: ds 1 ; ca4b
wca4c:: ds 1 ; ca4c
wca4d:: ds 1 ; ca4d
wca4e:: ds 1 ; ca4e
wca4f:: ds 1 ; ca4f
wca50:: ds 1 ; ca50
wca51:: ds 1 ; ca51
wca52:: ds 1 ; ca52
wca53:: ds 1 ; ca53
wca54:: ds 1 ; ca54
wca55:: ds 1 ; ca55
wca56:: ds 1 ; ca56
wca57:: ds 1 ; ca57
wca58:: ds 1 ; ca58
wca59:: ds 1 ; ca59
wca5a:: ds 1 ; ca5a
wca5b:: ds 1 ; ca5b
wca5c:: ds 1 ; ca5c
wca5d:: ds 1 ; ca5d
wca5e:: ds 1 ; ca5e
wca5f:: ds 1 ; ca5f
wca60:: ds 1 ; ca60
wca61:: ds 1 ; ca61
wca62:: ds 1 ; ca62
wca63:: ds 1 ; ca63
wca64:: ds 1 ; ca64
wca65:: ds 1 ; ca65
wca66:: ds 1 ; ca66
wca67:: ds 1 ; ca67
wca68:: ds 1 ; ca68
wca69:: ds 1 ; ca69
wca6a:: ds 1 ; ca6a
wca6b:: ds 1 ; ca6b
wca6c:: ds 1 ; ca6c
wca6d:: ds 1 ; ca6d
wca6e:: ds 1 ; ca6e
wca6f:: ds 1 ; ca6f
wca70:: ds 1 ; ca70
wca71:: ds 1 ; ca71
wca72:: ds 1 ; ca72
wca73:: ds 1 ; ca73
wca74:: ds 1 ; ca74
wca75:: ds 1 ; ca75
wca76:: ds 1 ; ca76
wca77:: ds 1 ; ca77
wca78:: ds 1 ; ca78
wca79:: ds 1 ; ca79
wca7a:: ds 1 ; ca7a
wca7b:: ds 1 ; ca7b
wca7c:: ds 1 ; ca7c
wca7d:: ds 1 ; ca7d
wca7e:: ds 1 ; ca7e
wca7f:: ds 1 ; ca7f
wca80:: ds 1 ; ca80
wca81:: ds 1 ; ca81
wca82:: ds 1 ; ca82
wca83:: ds 1 ; ca83
wca84:: ds 1 ; ca84
wca85:: ds 1 ; ca85
wca86:: ds 1 ; ca86
wca87:: ds 1 ; ca87
wca88:: ds 1 ; ca88
wca89:: ds 1 ; ca89
wca8a:: ds 1 ; ca8a
wca8b:: ds 1 ; ca8b
wca8c:: ds 1 ; ca8c
wca8d:: ds 1 ; ca8d
wca8e:: ds 1 ; ca8e
wca8f:: ds 1 ; ca8f
wca90:: ds 1 ; ca90
wca91:: ds 1 ; ca91
wca92:: ds 1 ; ca92
wca93:: ds 1 ; ca93
wca94:: ds 1 ; ca94
wca95:: ds 1 ; ca95
wca96:: ds 1 ; ca96
wca97:: ds 1 ; ca97
wca98:: ds 1 ; ca98
wca99:: ds 1 ; ca99
wca9a:: ds 1 ; ca9a
wca9b:: ds 1 ; ca9b
wca9c:: ds 1 ; ca9c
wca9d:: ds 1 ; ca9d
wca9e:: ds 1 ; ca9e
wca9f:: ds 1 ; ca9f
wcaa0:: ds 1 ; caa0
wcaa1:: ds 1 ; caa1
wcaa2:: ds 1 ; caa2
wcaa3:: ds 1 ; caa3
wcaa4:: ds 1 ; caa4
wcaa5:: ds 1 ; caa5
wcaa6:: ds 1 ; caa6
wcaa7:: ds 1 ; caa7
wcaa8:: ds 1 ; caa8
wcaa9:: ds 1 ; caa9
wcaaa:: ds 1 ; caaa
wcaab:: ds 1 ; caab
wcaac:: ds 1 ; caac
wcaad:: ds 1 ; caad
wcaae:: ds 1 ; caae
wcaaf:: ds 1 ; caaf
wcab0:: ds 1 ; cab0
wcab1:: ds 1 ; cab1
wcab2:: ds 1 ; cab2
wcab3:: ds 1 ; cab3
wcab4:: ds 1 ; cab4
wcab5:: ds 1 ; cab5
wcab6:: ds 1 ; cab6
wcab7:: ds 1 ; cab7
wcab8:: ds 1 ; cab8
wcab9:: ds 1 ; cab9
wcaba:: ds 1 ; caba
wcabb:: ds 1 ; cabb
wcabc:: ds 1 ; cabc
wcabd:: ds 1 ; cabd
wcabe:: ds 1 ; cabe
wcabf:: ds 1 ; cabf
wcac0:: ds 1 ; cac0
wcac1:: ds 1 ; cac1
wcac2:: ds 1 ; cac2
wcac3:: ds 1 ; cac3
wcac4:: ds 1 ; cac4
wcac5:: ds 1 ; cac5
wcac6:: ds 1 ; cac6
wcac7:: ds 1 ; cac7
wcac8:: ds 1 ; cac8
wcac9:: ds 1 ; cac9
wcaca:: ds 1 ; caca
wcacb:: ds 1 ; cacb
wcacc:: ds 1 ; cacc
wcacd:: ds 1 ; cacd
wcace:: ds 1 ; cace
wcacf:: ds 1 ; cacf
wcad0:: ds 1 ; cad0
wcad1:: ds 1 ; cad1
wcad2:: ds 1 ; cad2
wcad3:: ds 1 ; cad3
wcad4:: ds 1 ; cad4
wcad5:: ds 1 ; cad5
wcad6:: ds 1 ; cad6
wcad7:: ds 1 ; cad7
wcad8:: ds 1 ; cad8
wcad9:: ds 1 ; cad9
wcada:: ds 1 ; cada
wcadb:: ds 1 ; cadb
wcadc:: ds 1 ; cadc
wcadd:: ds 1 ; cadd
wcade:: ds 1 ; cade
wcadf:: ds 1 ; cadf
wcae0:: ds 1 ; cae0
wcae1:: ds 1 ; cae1
wcae2:: ds 1 ; cae2
wcae3:: ds 1 ; cae3
wcae4:: ds 1 ; cae4
wcae5:: ds 1 ; cae5
wcae6:: ds 1 ; cae6
wcae7:: ds 1 ; cae7

wEnemyMoveStruct:: move_struct wEnemyMoveStruct
wPlayerMoveStruct:: move_struct wPlayerMoveStruct

wEnemyMonNick:: ds MON_NAME_LENGTH ; caf6
wBattleMonNick:: ds MON_NAME_LENGTH ; cb01

wBattleMon:: battle_struct wBattleMon ; cb0c

wcb2c:: ds 1 ; cb2c
wcb2d:: ds 1 ; cb2d
wEnemyTrainerItem1:: db ; cb2e
wEnemyTrainerItem2:: db ; cb2f
wEnemyTrainerBaseReward:: db ; cb30
wcb31:: ds 1 ; cb31
wcb32:: ds 1 ; cb32
wcb33:: ds 1 ; cb33

wOTClassName:: ds NAME_LENGTH ; cb34

wcb3f:: ds 1 ; cb3f
wcb40:: ds 1 ; cb40
wCurOTMon:: ds 1 ; cb41
wBattleParticipantsNotFainted:: db ; cb42
wTypeModifier:: db ; cb43
wCriticalHit:: db ; cb44
wAttackMissed:: db ; cb45
wPlayerSubStatus1:: ds 1 ; cb46
wPlayerSubStatus2:: ds 1 ; cb47
wPlayerSubStatus3:: ds 1 ; cb48
wPlayerSubStatus4:: ds 1 ; cb49
wPlayerSubStatus5:: ds 1 ; cb4a
wEnemySubStatus1:: ds 1 ; cb4b
wEnemySubStatus2:: ds 1 ; cb4c
wEnemySubStatus3:: ds 1 ; cb4d
wEnemySubStatus4:: ds 1 ; cb4e
wEnemySubStatus5:: ds 1 ; cb4f
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
wPlayerDamageTaken::
wcb60:: ds 1 ; cb60
wcb61:: ds 1 ; cb61
wEnemyDamageTaken::
wcb62:: ds 1 ; cb62
wcb63:: ds 1 ; cb63
wBattleReward::
wcb64:: ds 1 ; cb64
wcb65:: ds 1 ; cb65
wcb66:: ds 1 ; cb66
wBattleAnimParam::
wKickCounter::
wPresentPower::
	db ; cb67
wBattleScriptBuffer:: db ; cb68
wcb69:: ds 1 ; cb69
wcb6a:: ds 1 ; cb6a
wcb6b:: ds 1 ; cb6b
wcb6c:: ds 1 ; cb6c
wcb6d:: ds 1 ; cb6d
wcb6e:: ds 1 ; cb6e
wcb6f:: ds 1 ; cb6f
wcb70:: ds 1 ; cb70
wcb71:: ds 1 ; cb71
wcb72:: ds 1 ; cb72
wcb73:: ds 1 ; cb73
wcb74:: ds 1 ; cb74
wcb75:: ds 1 ; cb75
wcb76:: ds 1 ; cb76
wcb77:: ds 1 ; cb77
wcb78:: ds 1 ; cb78
wcb79:: ds 1 ; cb79
wcb7a:: ds 1 ; cb7a
wcb7b:: ds 1 ; cb7b
wcb7c:: ds 1 ; cb7c
wcb7d:: ds 1 ; cb7d
wcb7e:: ds 1 ; cb7e
wcb7f:: ds 1 ; cb7f
wcb80:: ds 1 ; cb80
wcb81:: ds 1 ; cb81
wcb82:: ds 1 ; cb82
wcb83:: ds 1 ; cb83
wcb84:: ds 1 ; cb84
wcb85:: ds 1 ; cb85
wcb86:: ds 1 ; cb86
wcb87:: ds 1 ; cb87
wcb88:: ds 1 ; cb88
wcb89:: ds 1 ; cb89
wcb8a:: ds 1 ; cb8a
wcb8b:: ds 1 ; cb8b
wcb8c:: ds 1 ; cb8c
wcb8d:: ds 1 ; cb8d
wcb8e:: ds 1 ; cb8e
wcb8f:: ds 1 ; cb8f
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
wEnemyStatLevelsEnd::

wEnemyTurnsTaken:: db ; cbba
wPlayerTurnsTaken:: db ; cbbb
wcbbc:: ds 1 ; cbbc
wPlayerSubstituteHP:: db ; cbbd
wEnemySubstituteHP:: db ; cbbe
wUnusedPlayerLockedMove:: db ; cbbf
wcbc0:: ds 1 ; cbc0
wCurPlayerMove:: db ; cbc1
wCurEnemyMove:: db ; cbc2
wLinkBattleRNCount:: db ; cbc3
wEnemyItemState:: db ; cbc4
wcbc5:: ds 1 ; cbc5
wcbc6:: ds 1 ; cbc6
wCurEnemyMoveNum:: db ; cbc7
wEnemyHPAtTimeOfPlayerSwitch:: dw ; cbc8
wPayDayMoney:: ds 3 ; cbca

wcbcd:: ds 1 ; cbcd
wSafariMonEating:: db ; cbce
wcbcf:: ds 1 ; cbcf
wEnemyBackupDVs:: dw
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
wPlayerScreens:: db ; cbdd
wEnemyScreens:: db ; cbde
wPlayerSafeguardCount:: db ; cbdf
wPlayerLightScreenCount:: db ; cbe0
wcbe1:: ds 1 ; cbe1
wcbe2:: ds 1 ; cbe2
wEnemySafeguardCount:: db ; cbe3
wEnemyLightScreenCount:: db ; cbe4
wcbe5:: ds 1 ; cbe5
wcbe6:: ds 1 ; cbe6
wcbe7:: ds 1 ; cbe7
wBattleWeather:: db ; cbe8
wWeatherCount:: db ; cbe9
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
wcc03:: ds 1 ; cc03
wcc04:: ds 1 ; cc04
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

UNION
wWildMonMoves:: ; cc13
	ds NUM_MOVES
NEXTU
	ds 1
wOverworldMapBlocksEnd::
	ds NUM_MOVES - 1
ENDU

wWildMonPP:: ds NUM_MOVES ; cc17

wAmuletCoin:: db ; cc1b
wSomeoneIsRampaging:: db ; cc1c
wPlayerJustGotFrozen:: db ; cc1d
wEnemyJustGotFrozen:: db ; cc1e
	ds 1

ENDU ; cc20

SECTION "Video", WRAM0

; wBGMapBuffer
wBGMapBuffer::     ds 40 ; cd20
wBGMapPalBuffer::  ds 40 ; cd48
wBGMapBufferPtrs:: ds 40 ; cd70 ; 20 bg map addresses (16x8 tiles)
wBGMapBufferEnd::

wColorLayoutPredefID:: ds 1 ; cc98
wPlayerHPPal:: db ; cc99
wEnemyHPPal:: db ; cc9a
wcc9b:: ds 1 ; cc9b
wcc9c:: ds 1 ; cc9c
wcc9d:: ds 1 ; cc9d
wcc9e:: ds 1 ; cc9e
wcc9f:: ds 1 ; cc9f
wcca0:: ds 1 ; cca0
wcca1:: ds 1 ; cca1
wcca2:: ds 1 ; cca2
wcca3:: ds 1 ; cca3
wcca4:: ds 1 ; cca4
wcca5:: ds 1 ; cca5
wcca6:: ds 1 ; cca6
wcca7:: ds 1 ; cca7
wcca8:: ds 1 ; cca8
wcca9:: ds 1 ; cca9
wccaa:: ds 1 ; ccaa
wccab:: ds 1 ; ccab
wccac:: ds 1 ; ccac
wccad:: ds 1 ; ccad
wccae:: ds 1 ; ccae
wccaf:: ds 1 ; ccaf
wccb0:: ds 1 ; ccb0
wccb1:: ds 1 ; ccb1
wccb2:: ds 1 ; ccb2
wccb3:: ds 1 ; ccb3
wccb4:: ds 1 ; ccb4
wccb5:: ds 1 ; ccb5
wccb6:: ds 1 ; ccb6
wccb7:: ds 1 ; ccb7
wccb8:: ds 1 ; ccb8
wccb9:: ds 1 ; ccb9
wccba:: ds 1 ; ccba
wccbb:: ds 1 ; ccbb
wccbc:: ds 1 ; ccbc
wccbd:: ds 1 ; ccbd
wccbe:: ds 1 ; ccbe
wccbf:: ds 1 ; ccbf
wccc0:: ds 1 ; ccc0
wccc1:: ds 1 ; ccc1
wccc2:: ds 1 ; ccc2
wccc3:: ds 1 ; ccc3
wccc4:: ds 1 ; ccc4
wccc5:: ds 1 ; ccc5
wccc6:: ds 1 ; ccc6
wccc7:: ds 1 ; ccc7
wccc8:: ds 1 ; ccc8
wccc9:: ds 1 ; ccc9
wccca:: ds 1 ; ccca
wcccb:: ds 1 ; cccb
wcccc:: ds 1 ; cccc
wcccd:: ds 1 ; cccd
wccce:: ds 1 ; ccce
wcccf:: ds 1 ; cccf
wccd0:: ds 1 ; ccd0
wccd1:: ds 1 ; ccd1
wccd2:: ds 1 ; ccd2
wccd3:: ds 1 ; ccd3
wccd4:: ds 1 ; ccd4
wccd5:: ds 1 ; ccd5
wccd6:: ds 1 ; ccd6
wccd7:: ds 1 ; ccd7
wccd8:: ds 1 ; ccd8

wAttrmap:: ; ccd9
	ds SCREEN_HEIGHT * SCREEN_WIDTH
wAttrmapEnd:: ; ce41

wce41:: ds 1 ; ce41
wce42:: ds 1 ; ce42
wce43:: ds 1 ; ce43
wce44:: ds 1 ; ce44
wce45:: ds 1 ; ce45
wce46:: ds 1 ; ce46
wce47:: ds 1 ; ce47
wce48:: ds 1 ; ce48
wce49:: ds 1 ; ce49
wce4a:: ds 1 ; ce4a
wce4b:: ds 1 ; ce4b
wce4c:: ds 1 ; ce4c
wce4d:: ds 1 ; ce4d
wce4e:: ds 1 ; ce4e
wce4f:: ds 1 ; ce4f
wce50:: ds 1 ; ce50
wOtherPlayerLinkMode:: db ; ce51
wOtherPlayerLinkAction:: ; ce52
wBattleAction::
	db
wce53:: ds 1 ; ce53
wce54:: ds 1 ; ce54
wce55:: ds 1 ; ce55
wPlayerLinkAction:: ds 1 ; ce56
wce57:: ds 1 ; ce57
wce58:: ds 1 ; ce58
wce59:: ds 1 ; ce59
wce5a:: ds 1 ; ce5a
wLinkTimeoutFrames:: ds 2
wce5d:: ds 2 ; ce5d
wMonType:: ds 1 ; ce5f
wCurSpecies:: ds 1 ; ce60
wNamedObjectTypeBuffer:: ds 1 ; ce61
wce62:: ds 1 ; ce62
wce63::
wJumptableIndex::
	db

UNION ; ce64
; unidentified
wce64:: db
wce65:: db
wce66:: db

NEXTU ; ce64
; intro and title data
wIntroSceneFrameCounter:: db
UNION ; ce65
wIntroSceneTimer:: db
NEXTU ; ce65
wTitleScreenTimer:: dw
ENDU

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
; miscellaneous
wFrameCounter::
wMomBankDigitCursorPosition::
	db
ENDU ; ce67

wRequested2bpp:: ds 1 ; ce67
wRequested2bppSource:: dw ; ce68
wRequested2bppDest:: dw ; ce6a

wRequested1bpp:: ds 1 ; ce6c
wRequested1bppSource:: dw ; ce6d
wRequested1bppDest:: dw ; ce6f

wSecondsSince:: db ; ce71
wMinutesSince:: db ; ce72
wHoursSince:: db ; ce73
wDaysSince:: db ; ce74
wce75:: ds 1 ; ce75
wce76:: ds 1 ; ce76
wce77:: ds 1 ; ce77
wce78:: ds 1 ; ce78
wce79:: ds 1 ; ce79
wce7a:: ds 1 ; ce7a
wce7b:: ds 1 ; ce7b
wce7c:: ds 1 ; ce7c
wce7d:: ds 1 ; ce7d
wce7e:: ds 1 ; ce7e
wce7f:: ds 1 ; ce7f
wce80:: ds 1 ; ce80
wPlayerBGMapOffsetX:: db ; ce81
wPlayerBGMapOffsetY:: db ; ce82

wPlayerStepVectorX:: ds 1 ; ce83
wPlayerStepVectorY:: ds 1 ; ce84
wPlayerStepFlags:: ds 1 ; ce85
wPlayerStepDirection:: ds 1 ; ce86

wPlayerNextMovement:: db ; ce87
wPlayerMovement:: db ; ce88
wce89:: ds 1 ; ce89
wce8a:: ds 1 ; ce8a
wMovementObject:: ds 1 ; ce8b
wMovementDataBank:: ds 1 ; ce8c
wMovementDataAddress:: dw ; ce8d
wce8f:: ds 1 ; ce8f
wce90:: ds 1 ; ce90
wce91:: ds 1 ; ce91
wce92:: ds 1 ; ce92
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

wTileDown:: ds 1 ; cea3
wTileUp:: ds 1 ; cea4
wTileLeft:: ds 1 ; cea5
wTileRight:: ds 1 ; cea6
wTilePermissions:: ds 1 ; cea7

wWindowData::
wWindowStackPointer:: dw ; cea8
wMenuJoypad:: db ; ceaa
wMenuSelection:: db ; ceab
wMenuSelectionQuantity:: db ; ceac
wWhichIndexSet:: db ; cead
wScrollingMenuCursorPosition:: db ; ceae
wWindowStackSize:: db ; ceaf
wceb0:: ds 1 ; ceb0
wceb1:: ds 1 ; ceb1
wceb2:: ds 1 ; ceb2
wceb3:: ds 1 ; ceb3
wceb4:: ds 1 ; ceb4
wceb5:: ds 1 ; ceb5
wceb6:: ds 1 ; ceb6
wceb7:: ds 1 ; ceb7
wWindowDataEnd::

wMenuHeader::
wMenuFlags:: ds 1 ; ceb8
wMenuBorderTopCoord:: ds 1 ; ceb9
wMenuBorderLeftCoord:: ds 1 ; ceba
wMenuBorderBottomCoord:: ds 1 ; cebb
wMenuBorderRightCoord:: ds 1 ; cebc
wMenuDataPointer:: dw ; cebd
wMenuCursorBuffer:: ds 1 ; cebf
wcec0:: ds 1 ; cec0
wcec1:: ds 1 ; cec1
wcec2:: ds 1 ; cec2
wcec3:: ds 1 ; cec3
wcec4:: ds 1 ; cec4
wcec5:: ds 1 ; cec5
wcec6:: ds 1 ; cec6
wcec7:: ds 1 ; cec7
wMenuHeaderEnd::

wMenuData::
wMenuDataFlags:: ds 1 ; cec8

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

wOverworldDelay:: ds 1 ; cee8
wTextDelayFrames:: ds 1 ; cee9
wVBlankOccurred:: ds 1 ; ceea

wceeb:: ds 1 ; ceeb
wDefaultSpawnpoint:: db

UNION ; ceed
; mail temp storage
wTempMail:: mailmsg wTempMail

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
; movement buffer data
wMovementBufferCount:: db
wMovementBufferObject:: db
wUnusedMovementBufferBank:: db
wUnusedMovementBufferPointer:: dw
wMovementBuffer:: ds 55

NEXTU
; earthquake data buffer
wEarthquakeMovementDataBuffer:: ds 5

NEXTU ; ceed
; unidentified
wceed:: db ; ceed
wceee:: db ; ceee
wceef:: db ; ceef

	ds 1
wcef1:: ds 2 ; cef1
wcef3:: ds 2 ; cef3
	ds 2
wcef7:: ds 1 ; cef7
wcef8:: ds 1 ; cef8
	ds 1
wcefa:: ds 1 ; cefa
wcefb:: ds 1 ; cefb
wcefc:: ds 1 ; cefc
wcefd:: ds 1 ; cefd
wcefe:: ds 1 ; cefe
wceff:: ds 2 ; ceff
	ds 1
wcf02:: ds 1 ; cf02
wcf03:: ds 1 ; cf03
wcf04:: ds 1 ; cf04
	ds 19
wcf18:: ds 1 ; cf18
wcf19:: ds 1 ; cf19
wcf1a:: ds 1 ; cf1a
wcf1b:: ds 1 ; cf1b
wcf1c:: ds 1 ; cf1c
wcf1d:: ds 1 ; cf1d
wcf1e:: ds 1 ; cf1e
wcf1f:: ds 2 ; cf1f
wcf21:: ds 2 ; cf21
	ds 6

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
; backup menu data
	ds 7
wMenuCursorBufferBackup:: db
wMenuScrollPositionBackup:: db
ENDU

wcf3a:: ds 1
wBoxAlignment:: db
wUnusedBufferCF3C:: dw
wFXAnimID:: dw
ENDU

wcf40:: ds 1 ; cf40
wcf41:: ds 1 ; cf41
wcf42:: ds 1 ; cf42
wBGP:: ds 1
wOBP0:: ds 1
wOBP1:: ds 1
wNumHits:: db ; cf46
wcf47:: ds 1 ; cf47
wMonOrItemNameBuffer:: ds 1 ; cf48
wcf49:: ds 1 ; cf49
wcf4a:: ds 1 ; cf4a
wcf4b:: ds 1 ; cf4b
wcf4c:: ds 1 ; cf4c
wcf4d:: ds 1 ; cf4d
wcf4e:: ds 1 ; cf4e
wcf4f:: ds 1 ; cf4f
wcf50:: ds 1 ; cf50
wcf51:: ds 1 ; cf51
wcf52:: ds 1 ; cf52
wcf53:: ds 1 ; cf53
wcf54:: ds 1 ; cf54
wcf55:: ds 1 ; cf55
wcf56:: ds 1 ; cf56
wcf57:: ds 1 ; cf57
wcf58:: ds 1 ; cf58
wcf59:: ds 1 ; cf59
wcf5a:: ds 1 ; cf5a
wcf5b:: ds 1 ; cf5b
wcf5c:: ds 1 ; cf5c
wcf5d:: ds 1 ; cf5d
wcf5e:: ds 1 ; cf5e
wcf5f:: ds 1 ; cf5f
wcf60:: ds 1 ; cf60
wcf61:: ds 1 ; cf61
wcf62:: ds 1 ; cf62
wcf63:: ds 1 ; cf63
wcf64:: ds 1 ; cf64
wcf65:: ds 1 ; cf65
wcf66:: ds 1 ; cf66
wcf67:: ds 1 ; cf67
wcf68:: ds 1 ; cf68
wcf69:: ds 1 ; cf69
wcf6a:: ds 1 ; cf6a

wStringBuffer1:: ds 19 ; cf6b
wStringBuffer2:: ds 19 ; cf7e
wStringBuffer3:: ds 19 ; cf91
wStringBuffer4:: ds 19 ; cfa4

UNION
wStringBuffer5:: ds 19 ; cfb7
NEXTU
	ds 13
wBattleMenuCursorBuffer:: dw ; cfc4
wCurBattleMon:: db ; cfc6
wCurMoveNum:: db; cfc7
wLastPocket:: db ; cfc8
wPartyMenuCursor:: ds 1 ; cfc9
ENDU

wItemsPocketCursor:: db ; cfca
wKeyItemsPocketCursor:: db ; cfcb
wBallsPocketCursor:: db ; cfcc
wcfcd:: ds 1 ; cfcd
wcfce:: ds 1 ; cfce
wItemsPocketScrollPosition:: db ; cfcf
wKeyItemsPocketScrollPosition:: db; cfd0
wBallsPocketScrollPosition:: db ; cfd1
wcfd2:: ds 1 ; cfd2

wSwitchMon::
wSwitchItem::
wMoveSwapBuffer::
wcfd3::
	db ; cfd3

wMenuScrollPosition:: ds 4

wQueuedScriptBank:: db ; cfd8
wQueuedScriptAddr:: dw ; cfd9
wPredefID:: ds 1 ; cfdb
wPredefTemp:: dw ; cfdc
wPredefAddress:: dw ; cfde
wFarCallBCBuffer:: dw ; cfe0
wcfe2:: ds 1 ; cfe2
wNumMoves:: ds 1 ; cfe3

wFieldMoveSucceeded::
wItemEffectSucceeded::
wBattlePlayerAction::
	db ; cfe4

wVramState:: ds 1
wcfe6:: ds 1 ; cfe6
wcfe7:: ds 1 ; cfe7
wcfe8:: ds 1 ; cfe8
wBattleResult:: ds 1 ; cfe9
wcfea:: ds 1 ; cfea
wUsingItemWithSelect:: ds 1 ; cfeb

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
wMailboxEnd:: ; d0fe
ENDU ; cffc

wcffc:: ds 1 ; cffc
wcffd:: ds 1 ; cffd
wcffe:: ds 1 ; cffe
wcfff:: ds 1 ; cfff

SECTION "WRAM1", WRAMX, BANK[$1]
wd000:: ds 1 ; d000
wd001:: ds 1 ; d001
wCurItem:: db ; d002
wCurItemQuantity:: ; d003
wMartItemID::
	db

wCurPartySpecies:: ; d004
	ds 1

wCurPartyMon:: ; d005
; contains which monster in a party
; is being dealt with at the moment
; 0-5
	ds 1

wd006:: ds 1 ; d006

wWhichHPBar:: ; d007
; 0: Enemy
; 1: Player
; 2: Party Menu
	ds 1

wPokemonWithdrawDepositParameter:: ; d008
; 0: Take from PC
; 1: Put into PC
; 2: Take from Day-Care
; 3: Put into Day-Care
	ds 1

wItemQuantityChangeBuffer:: ds 1 ; d009
wItemQuantityBuffer:: ds 1 ; d00a

wTempMon:: party_struct wTempMon ; d00b

wSpriteFlags:: ds 1 ; d03b

wHandlePlayerStep:: ds 2 ; d03c

wPartyMenuActionText:: ds 1 ; d03e

wItemAttributeParamBuffer:: ds 1 ; d03f

wCurPartyLevel:: ds 1 ; d040
wScrollingMenuListSize:: ds 1 ; d041

wLinkMode:: ds 1 ; d042
; 0 not in link battle
; 1 link battle

; used when following a map warp
wNextWarp:: ds 1 ; d043
wNextMapGroup:: ds 1 ; d044
wNextMapNumber:: ds 1 ; d045
wPrevWarp:: ds 1 ; d046
wPrevMapGroup:: ds 1 ; d047
wPrevMapNumber:: ds 1 ; d048

wd049:: ds 1 ; d049
wd04a:: ds 1 ; d04a
wd04b:: ds 1 ; d04b
wd04c:: ds 1 ; d04c
wd04d:: ds 1 ; d04d
wd04e:: ds 1 ; d04e
wd04f:: ds 1 ; d04f
wd050:: ds 1 ; d050
wd051:: ds 1 ; d051
wd052:: ds 1 ; d052
wd053:: ds 1 ; d053
wd054:: ds 1 ; d054
wd055:: ds 1 ; d055
wd056:: ds 1 ; d056
wd057:: ds 1 ; d057
wd058:: ds 1 ; d058
wd059:: ds 1 ; d059
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

wEvolvableFlags:: db ; d0d1
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
wBattleMode:: ds 1 ; d116
wTempWildMonSpecies:: db ; d117

wOtherTrainerClass:: ; d118
; class (Youngster, Bug Catcher, etc.) of opposing trainer
; 0 if opponent is a wild Pokémon, not a trainer
	db

wBattleType:: db ; d119
wd11a:: ds 1 ; d11a
wOtherTrainerID:: db ; d11b
wForcedSwitch:: db ; d11c
wTrainerClass:: db ; d11d
wUnownLetter:: db ; d11e
wMoveSelectionMenuType:: db ; d11f

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
wd138:: ds 1 ; d138
wd139:: ds 1 ; d139
wd13a:: ds 1 ; d13a
wd13b:: ds 1 ; d13b
wd13c:: ds 1 ; d13c
wd13d:: ds 1 ; d13d
wd13e:: ds 1 ; d13e
wd13f:: ds 1 ; d13f
wCurBaseDataEnd::

wd140:: ds 1 ; d140
wCurDamage:: ds 2 ; d141
wd143:: ds 1 ; d143
wd144:: ds 1 ; d144
wd145:: ds 1 ; d145
wd146:: ds 1 ; d146
wd147:: ds 1 ; d147
wd148:: ds 1 ; d148
wListMoves_MoveIndicesBuffer:: ds NUM_MOVES
wPutativeTMHMMove:: db ; d14d
wd14e:: ds 1 ; d14e
wWildMon:: ds 1 ; d14f
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
wd154:: ds 1 ; d154
wROMBankBackup:: ds 1 ; d155
wFarByte::
wTempBank:: db ; d156
wTimeOfDay:: ds 1 ; d157
wd158:: ds 1 ; d158

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

wd178:: ds 1 ; d178
wWildEncounterCooldown:: db ; d179
wXYComparePointer:: dw ; d17a
wd17c:: ds 1 ; d17c
wd17d:: ds 1 ; d17d
wd17e:: ds 1 ; d17e
wd17f:: ds 1 ; d17f
wBattleScriptFlags:: db ; d180
wd181:: ds 1 ; d181
wPlayerSpriteSetupFlags:: db ; d182
wMapReentryScriptQueueFlag:: db ; d183
wMapReentryScriptBank:: db
wMapReentryScriptAddress:: dw ; d185
wd187:: ds 1 ; d187
wd188:: ds 1 ; d188
wd189:: ds 1 ; d189
wd18a:: ds 1 ; d18a
wTimeCyclesSinceLastCall:: ds 1 ; d18b
wReceiveCallDelay_MinsRemaining:: ds 1 ; d18c
wReceiveCallDelay_StartTime:: ds 1 ; d18d
wd18e:: ds 1 ; d18e
wd18f:: ds 1 ; d18f
wd190:: ds 1 ; d190
wd191:: ds 1 ; d191
wd192:: ds 1 ; d192
wBugContestMinsRemaining:: ds 1 ; d193
wBugContestSecsRemaining:: ds 1 ; d194
wd195:: ds 1 ; d195
wd196:: ds 1 ; d196
wMapStatusEnd::
wd197:: ds 1 ; d197
wd198:: ds 1 ; d198

wOptions:: ; d199
; bit 0-2: number of frames to delay when printing text
;   fast 1; mid 3; slow 5
; bit 3: ?
; bit 4: no text delay
; bit 5: stereo off/on
; bit 6: battle style shift/set
; bit 7: battle scene off/on
	ds 1

wSaveFileExists:: ds 1 ; d19a
wTextboxFrame:: ; d19b
; bits 0-2: textbox frame 0-7
	ds 1

wTextboxFlags:: ; d19c
; bit 0: 1-frame text delay
; bit 1: when unset, no text delay
	ds 1
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
	ds 1

	ds 2

wOptionsEnd::

SECTION "Game Data", WRAMX, BANK[1]
wGameData::
wPlayerData::
wPlayerData1::
wPlayerID:: dw ; d1a1

wPlayerName:: ds NAME_LENGTH ; d1a3
wMomsName:: ds NAME_LENGTH ; d1ae
wRivalName:: ds NAME_LENGTH ; d1b9
wRedsName:: ds NAME_LENGTH ; d1c4
wGreensName:: ds NAME_LENGTH ; d1cf

wSavedAtLeastOnce:: ds 1 ; d1da
wd1db:: ds 1 ; d1db
wStartDay:: db ; d1dc
wStartHour:: db ; d1dd
wStartMinute:: db ; d1de
wStartSecond:: db ; d1df
wRTC:: ds 4 ; d1e0

wd1e4:: ds 1 ; d1e4
wd1e5:: ds 1 ; d1e5
wd1e6:: ds 1 ; d1e6
wd1e7:: ds 1 ; d1e7
wDST:: db ; d1e8
wd1e9:: ds 1 ; d1e9

wGameTimeCap::     ds 1 ; d1ea
wGameTimeHours::   ds 2 ; d1eb
wGameTimeMinutes:: ds 1 ; d1ed
wGameTimeSeconds:: ds 1 ; d1ee
wGameTimeFrames::  ds 1 ; d1ef

	ds 2

wCurDay:: ds 1 ; d1f2

	ds 1

wObjectFollow_Leader:: ds 1 ; d1f4
wObjectFollow_Follower:: ds 1 ; d1f5
wCenteredObject:: ds 1 ; d1f6
wFollowerMovementQueueLength:: ds 1 ; d1f7
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
	ds 1
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

wObjectMasks:: db ; d545
wd546:: ds 1 ; d546
wd547:: ds 1 ; d547
wd548:: ds 1 ; d548
wd549:: ds 1 ; d549
wd54a:: ds 1 ; d54a
wd54b:: ds 1 ; d54b
wd54c:: ds 1 ; d54c
wd54d:: ds 1 ; d54d
wd54e:: ds 1 ; d54e
wd54f:: ds 1 ; d54f
wd550:: ds 1 ; d550
wd551:: ds 1 ; d551
wd552:: ds 1 ; d552
wd553:: ds 1 ; d553
wd554:: ds 1 ; d554
wVariableSprites:: ds $100 - SPRITE_VARS ; d555
wEnteredMapFromContinue:: db ; d565
wd566:: ds 1 ; d566
wd567:: ds 1 ; d567
wTimeOfDayPal:: db
wd569:: ds 1 ; d569
wd56a:: ds 1 ; d56a
wd56b:: ds 1 ; d56b
wd56c:: ds 1 ; d56c
wd56d:: ds 1 ; d56d
wTimeOfDayPalset:: db ; d56e
wd56f:: ds 1 ; d56f
wd570:: ds 1 ; d570
wPlayerData2End::
wPlayerData3::
wStatusFlags:: ds 1 ; d571
wStatusFlags2:: ds 1 ; d572
wMoney:: ds 3 ; d573
wMomsMoney:: ds 3 ; d576
wMomSavingMoney:: ds 1 ; d579

wCoins:: dw ; d57a

wBadges::
wJohtoBadges:: ds 1 ; d57c
wKantoBadges:: ds 1 ; d57d

wTMsHMs:: ds NUM_TMS + NUM_HMS ; d57e
wTMsHMsEnd::

wNumItems:: ds 1 ; d5b7
wItems:: ds MAX_ITEMS * 2 + 1 ; d5b8
wItemsEnd::

wNumKeyItems:: ds 1 ; d5e1
wKeyItems:: ds MAX_KEY_ITEMS + 1 ; d5e2
wKeyItemsEnd::

wNumBalls:: ds 1 ; d5fc
wBalls:: ds MAX_BALLS * 2 + 1 ; d5fd
wBallsEnd::

wNumPCItems:: ds 1
wPCItems:: ds MAX_PC_ITEMS * 2 + 1 ; d616
wPCItemsEnd::

wPokegearFlags:: ; d67c
; bit 0: map
; bit 1: radio
; bit 2: phone
; bit 3: expn
; bit 7: on/off
	ds 1

wRadioTuningKnob:: ds 1 ; d67d
wLastDexMode:: ds 1 ; d67e

	ds 1

wWhichRegisteredItem:: ds 1 ; d680
wRegisteredItem:: ds 1 ; d681

wPlayerState:: ds 1 ; d682

wHallOfFameCount:: db ; d683
wd684:: ds 1 ; d684
wd685:: ds 1 ; d685
wd686:: ds 1 ; d686
wd687:: ds 1 ; d687
wd688:: ds 1 ; d688
wd689:: ds 1 ; d689
wd68a:: ds 1 ; d68a
wd68b:: ds 1 ; d68b
wd68c:: ds 1 ; d68c
wd68d:: ds 1 ; d68d
wd68e:: ds 1 ; d68e
wd68f:: ds 1 ; d68f
wd690:: ds 1 ; d690
wd691:: ds 1 ; d691
wd692:: ds 1 ; d692
wd693:: ds 1 ; d693
wd694:: ds 1 ; d694
wd695:: ds 1 ; d695
wd696:: ds 1 ; d696
wd697:: ds 1 ; d697
wd698:: ds 1 ; d698
wd699:: ds 1 ; d699
wd69a:: ds 1 ; d69a
wd69b:: ds 1 ; d69b
wd69c:: ds 1 ; d69c
wd69d:: ds 1 ; d69d
wd69e:: ds 1 ; d69e
wd69f:: ds 1 ; d69f
wd6a0:: ds 1 ; d6a0
wd6a1:: ds 1 ; d6a1
wd6a2:: ds 1 ; d6a2
wd6a3:: ds 1 ; d6a3
wd6a4:: ds 1 ; d6a4
wd6a5:: ds 1 ; d6a5
wd6a6:: ds 1 ; d6a6
wMooMooBerries:: ds 1 ; d6a7
wUndergroundSwitchPositions:: ds 1 ; d6a8
wd6a9:: ds 1 ; d6a9
wd6aa:: ds 1 ; d6aa
wd6ab:: ds 1 ; d6ab
wd6ac:: ds 1 ; d6ac
wd6ad:: ds 1 ; d6ad
wd6ae:: ds 1 ; d6ae
wd6af:: ds 1 ; d6af
wd6b0:: ds 1 ; d6b0
wd6b1:: ds 1 ; d6b1
wd6b2:: ds 1 ; d6b2
wd6b3:: ds 1 ; d6b3
wd6b4:: ds 1 ; d6b4
wd6b5:: ds 1 ; d6b5
wd6b6:: ds 1 ; d6b6

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

wd6f2:: ds 1 ; d6f2
wd6f3:: ds 1 ; d6f3
wd6f4:: ds 1 ; d6f4
wd6f5:: ds 1 ; d6f5
wd6f6:: ds 1 ; d6f6
wd6f7:: ds 1 ; d6f7
wd6f8:: ds 1 ; d6f8
wd6f9:: ds 1 ; d6f9
wd6fa:: ds 1 ; d6fa
wd6fb:: ds 1 ; d6fb
wd6fc:: ds 1 ; d6fc
wd6fd:: ds 1 ; d6fd
wd6fe:: ds 1 ; d6fe
wd6ff:: ds 1 ; d6ff
wd700:: ds 1 ; d700
wd701:: ds 1 ; d701
wd702:: ds 1 ; d702
wd703:: ds 1 ; d703
wd704:: ds 1 ; d704
wd705:: ds 1 ; d705
wd706:: ds 1 ; d706
wd707:: ds 1 ; d707
wd708:: ds 1 ; d708
wd709:: ds 1 ; d709
wd70a:: ds 1 ; d70a
wd70b:: ds 1 ; d70b
wd70c:: ds 1 ; d70c
wd70d:: ds 1 ; d70d
wd70e:: ds 1 ; d70e
wd70f:: ds 1 ; d70f
wd710:: ds 1 ; d710
wd711:: ds 1 ; d711
wd712:: ds 1 ; d712
wd713:: ds 1 ; d713
wd714:: ds 1 ; d714
wd715:: ds 1 ; d715
wd716:: ds 1 ; d716
wd717:: ds 1 ; d717
wd718:: ds 1 ; d718
wd719:: ds 1 ; d719
wd71a:: ds 1 ; d71a
wd71b:: ds 1 ; d71b
wd71c:: ds 1 ; d71c
wd71d:: ds 1 ; d71d
wd71e:: ds 1 ; d71e
wd71f:: ds 1 ; d71f
wd720:: ds 1 ; d720
wd721:: ds 1 ; d721
wd722:: ds 1 ; d722
wd723:: ds 1 ; d723
wd724:: ds 1 ; d724
wd725:: ds 1 ; d725
wd726:: ds 1 ; d726
wd727:: ds 1 ; d727
wd728:: ds 1 ; d728
wd729:: ds 1 ; d729
wd72a:: ds 1 ; d72a
wd72b:: ds 1 ; d72b
wd72c:: ds 1 ; d72c
wd72d:: ds 1 ; d72d
wd72e:: ds 1 ; d72e
wd72f:: ds 1 ; d72f
wd730:: ds 1 ; d730
wd731:: ds 1 ; d731
wd732:: ds 1 ; d732
wd733:: ds 1 ; d733
wd734:: ds 1 ; d734
wd735:: ds 1 ; d735
wd736:: ds 1 ; d736
wd737:: ds 1 ; d737
wd738:: ds 1 ; d738
wd739:: ds 1 ; d739
wd73a:: ds 1 ; d73a
wd73b:: ds 1 ; d73b
wd73c:: ds 1 ; d73c
wd73d:: ds 1 ; d73d
wd73e:: ds 1 ; d73e
wd73f:: ds 1 ; d73f
wd740:: ds 1 ; d740
wd741:: ds 1 ; d741
wd742:: ds 1 ; d742
wd743:: ds 1 ; d743
wd744:: ds 1 ; d744
wd745:: ds 1 ; d745
wd746:: ds 1 ; d746
wd747:: ds 1 ; d747
wd748:: ds 1 ; d748
wd749:: ds 1 ; d749
wd74a:: ds 1 ; d74a
wd74b:: ds 1 ; d74b
wd74c:: ds 1 ; d74c
wd74d:: ds 1 ; d74d
wd74e:: ds 1 ; d74e
wd74f:: ds 1 ; d74f
wd750:: ds 1 ; d750
wd751:: ds 1 ; d751
wd752:: ds 1 ; d752
wd753:: ds 1 ; d753
wd754:: ds 1 ; d754
wd755:: ds 1 ; d755
wd756:: ds 1 ; d756
wd757:: ds 1 ; d757
wd758:: ds 1 ; d758
wd759:: ds 1 ; d759
wd75a:: ds 1 ; d75a
wd75b:: ds 1 ; d75b
wd75c:: ds 1 ; d75c
wd75d:: ds 1 ; d75d
wd75e:: ds 1 ; d75e
wd75f:: ds 1 ; d75f
wd760:: ds 1 ; d760
wd761:: ds 1 ; d761
wd762:: ds 1 ; d762
wd763:: ds 1 ; d763
wd764:: ds 1 ; d764
wd765:: ds 1 ; d765
wd766:: ds 1 ; d766
wd767:: ds 1 ; d767
wd768:: ds 1 ; d768
wd769:: ds 1 ; d769
wd76a:: ds 1 ; d76a
wd76b:: ds 1 ; d76b
wd76c:: ds 1 ; d76c
wd76d:: ds 1 ; d76d
wd76e:: ds 1 ; d76e
wd76f:: ds 1 ; d76f
wd770:: ds 1 ; d770
wd771:: ds 1 ; d771
wd772:: ds 1 ; d772
wd773:: ds 1 ; d773
wd774:: ds 1 ; d774
wd775:: ds 1 ; d775
wd776:: ds 1 ; d776
wd777:: ds 1 ; d777
wd778:: ds 1 ; d778
wd779:: ds 1 ; d779
wd77a:: ds 1 ; d77a
wd77b:: ds 1 ; d77b
wd77c:: ds 1 ; d77c
wd77d:: ds 1 ; d77d
wd77e:: ds 1 ; d77e
wd77f:: ds 1 ; d77f
wd780:: ds 1 ; d780
wd781:: ds 1 ; d781
wd782:: ds 1 ; d782
wd783:: ds 1 ; d783
wd784:: ds 1 ; d784
wd785:: ds 1 ; d785
wd786:: ds 1 ; d786
wd787:: ds 1 ; d787
wd788:: ds 1 ; d788
wd789:: ds 1 ; d789
wd78a:: ds 1 ; d78a
wd78b:: ds 1 ; d78b
wd78c:: ds 1 ; d78c
wd78d:: ds 1 ; d78d
wd78e:: ds 1 ; d78e
wd78f:: ds 1 ; d78f
wd790:: ds 1 ; d790
wd791:: ds 1 ; d791
wd792:: ds 1 ; d792
wd793:: ds 1 ; d793
wd794:: ds 1 ; d794
wd795:: ds 1 ; d795
wd796:: ds 1 ; d796
wd797:: ds 1 ; d797
wd798:: ds 1 ; d798
wd799:: ds 1 ; d799
wd79a:: ds 1 ; d79a
wd79b:: ds 1 ; d79b
wd79c:: ds 1 ; d79c
wd79d:: ds 1 ; d79d
wd79e:: ds 1 ; d79e
wd79f:: ds 1 ; d79f
wd7a0:: ds 1 ; d7a0
wd7a1:: ds 1 ; d7a1
wd7a2:: ds 1 ; d7a2
wd7a3:: ds 1 ; d7a3
wd7a4:: ds 1 ; d7a4
wd7a5:: ds 1 ; d7a5
wd7a6:: ds 1 ; d7a6
wd7a7:: ds 1 ; d7a7
wd7a8:: ds 1 ; d7a8
wd7a9:: ds 1 ; d7a9
wd7aa:: ds 1 ; d7aa
wd7ab:: ds 1 ; d7ab
wd7ac:: ds 1 ; d7ac
wd7ad:: ds 1 ; d7ad
wd7ae:: ds 1 ; d7ae
wd7af:: ds 1 ; d7af
wd7b0:: ds 1 ; d7b0
wd7b1:: ds 1 ; d7b1
wd7b2:: ds 1 ; d7b2
wd7b3:: ds 1 ; d7b3
wd7b4:: ds 1 ; d7b4
wd7b5:: ds 1 ; d7b5
wd7b6:: ds 1 ; d7b6

wEventFlags:: flag_array NUM_EVENTS ; d7b7

wd8b1:: ds 1 ; d8b1
wd8b2:: ds 1 ; d8b2
wd8b3:: ds 1 ; d8b3
wd8b4:: ds 1 ; d8b4
wd8b5:: ds 1 ; d8b5
wd8b6:: ds 1 ; d8b6
wd8b7:: ds 1 ; d8b7
wGameTimerPause:: ds 1 ; d8b8
wd8b9:: ds 1 ; d8b9
wd8ba:: ; d8ba
; bits 4, 6, or 7 can be used to disable joypad input
; bit 4
; bit 6: mon fainted?
; bit 7: SGB flag?
	db
wd8bb:: ds 1 ; d8bb
wCurBox:: ds 1 ; d8bc

	ds 2

; 8 chars + $50
wBoxNames:: ds BOX_NAME_LENGTH * NUM_BOXES ; d8bf

wd93d:: ds 1 ; d93d
wd93e:: ds 1 ; d93e
wBikeFlags:: ds 1 ; d93f
wd940:: ds 1 ; d940

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

wd957:: ds 1 ; d957
wd958:: ds 1 ; d958
wd959:: ds 1 ; d959
wd95a:: ds 1 ; d95a
wd95b:: ds 1 ; d95b
wd95c:: ds 1 ; d95c
wd95d:: ds 1 ; d95d
wd95e:: ds 1 ; d95e
wd95f:: ds 1 ; d95f
wd960:: ds 1 ; d960
wd961:: ds 1 ; d961
wd962:: ds 1 ; d962

wMomItemTriggerBalance:: ds 3 ; d963

wDailyResetTimer:: dw ; d966
wDailyFlags1:: db ; d968
wDailyFlags2:: db ; d969
wd96a:: ds 1 ; d96a
wd96b:: ds 1 ; d96b
wd96c:: ds 1 ; d96c
wTimerEventStartDay:: db ; d96d
wd96e:: ds 1 ; d96e
wd96f:: ds 1 ; d96f
wd970:: ds 1 ; d970
wd971:: ds 1 ; d971
wd972:: ds 1 ; d972
wd973:: ds 1 ; d973
wd974:: ds 1 ; d974
wd975:: ds 1 ; d975
wd976:: ds 1 ; d976
wLuckyNumberDayBuffer:: ds 1 ; d977
wd978:: ds 1 ; d978
wd979:: ds 1 ; d979
wd97a:: ds 1 ; d97a
wSpecialPhoneCallID:: ds 1 ; d97b
wd97c:: ds 1 ; d97c
wd97d:: ds 1 ; d97d
wd97e:: ds 1 ; d97e
wBugContestStartTime:: ds 1 ; d97f
wd980:: ds 1 ; d980
wd981:: ds 1 ; d981
wd982:: ds 1 ; d982
wUnusedTwoDayTimerOn:: ds 1 ; d983
wUnusedTwoDayTimer:: ds 1 ; d984
wUnusedTwoDayTimerStartDate:: ds 1 ; d985
wd986:: ds 1 ; d986
wd987:: ds 1 ; d987
wd988:: ds 1 ; d988
wd989:: ds 1 ; d989
wd98a:: ds 1 ; d98a
wd98b:: ds 1 ; d98b
wd98c:: ds 1 ; d98c
wd98d:: ds 1 ; d98d
wd98e:: ds 1 ; d98e
wd98f:: ds 1 ; d98f
wd990:: ds 1 ; d990
wd991:: ds 1 ; d991
wd992:: ds 1 ; d992
wd993:: ds 1 ; d993
wd994:: ds 1 ; d994
wd995:: ds 1 ; d995
wd996:: ds 1 ; d996
wd997:: ds 1 ; d997
wd998:: ds 1 ; d998
wd999:: ds 1 ; d999
wd99a:: ds 1 ; d99a
wd99b:: ds 1 ; d99b
wd99c:: ds 1 ; d99c
wd99d:: ds 1 ; d99d
wd99e:: ds 1 ; d99e
wd99f:: ds 1 ; d99f
wd9a0:: ds 1 ; d9a0
wd9a1:: ds 1 ; d9a1
wd9a2:: ds 1 ; d9a2
wd9a3:: ds 1 ; d9a3
wd9a4:: ds 1 ; d9a4
wd9a5:: ds 1 ; d9a5
wd9a6:: ds 1 ; d9a6
wd9a7:: ds 1 ; d9a7
wd9a8:: ds 1 ; d9a8
wd9a9:: ds 1 ; d9a9
wd9aa:: ds 1 ; d9aa
wd9ab:: ds 1 ; d9ab
wd9ac:: ds 1 ; d9ac
wd9ad:: ds 1 ; d9ad
wd9ae:: ds 1 ; d9ae
wd9af:: ds 1 ; d9af
wd9b0:: ds 1 ; d9b0
wd9b1:: ds 1 ; d9b1
wd9b2:: ds 1 ; d9b2
wd9b3:: ds 1 ; d9b3
wd9b4:: ds 1 ; d9b4
wd9b5:: ds 1 ; d9b5
wd9b6:: ds 1 ; d9b6
wd9b7:: ds 1 ; d9b7
wd9b8:: ds 1 ; d9b8
wd9b9:: ds 1 ; d9b9
wd9ba:: ds 1 ; d9ba
wd9bb:: ds 1 ; d9bb
wd9bc:: ds 1 ; d9bc
wStepCount:: db ; d9bd
wPoisonStepCount:: db ; d9be
	ds 2
wHappinessStepCount:: db ; d9c1
	ds 1
wParkBallsRemaining::
wSafariBallsRemaining:: db ; d9c3
wSafariTimeRemaining:: dw ; d9c4
wd9c6:: ds 1 ; d9c6
wd9c7:: ds 1 ; d9c7
wd9c8:: ds 1 ; d9c8
wd9c9:: ds 1 ; d9c9
wd9ca:: ds 1 ; d9ca
wd9cb:: ds 1 ; d9cb
wd9cc:: ds 1 ; d9cc
wd9cd:: ds 1 ; d9cd
wd9ce:: ds 1 ; d9ce
wd9cf:: ds 1 ; d9cf
wd9d0:: ds 1 ; d9d0
wd9d1:: ds 1 ; d9d1
wd9d2:: ds 1 ; d9d2
wd9d3:: ds 1 ; d9d3
wd9d4:: ds 1 ; d9d4
wd9d5:: ds 1 ; d9d5
wd9d6:: ds 1 ; d9d6
wd9d7:: ds 1 ; d9d7
wd9d8:: ds 1 ; d9d8
wd9d9:: ds 1 ; d9d9
wd9da:: ds 1 ; d9da
wd9db:: ds 1 ; d9db
wd9dc:: ds 1 ; d9dc
wd9dd:: ds 1 ; d9dd
wd9de:: ds 1 ; d9de
wd9df:: ds 1 ; d9df
wd9e0:: ds 1 ; d9e0
wd9e1:: ds 1 ; d9e1
wd9e2:: ds 1 ; d9e2
wd9e3:: ds 1 ; d9e3
wd9e4:: ds 1 ; d9e4
wd9e5:: ds 1 ; d9e5
wd9e6:: ds 1 ; d9e6
wLuckyNumberShowFlag:: ds 1 ; d9e7
wd9e8:: ds 1 ; d9e8
wLuckyIDNumber:: dw ; d9e9

wRepelEffect:: db ; If a Repel is in use, it contains the nr of steps it's still active
wBikeStep:: dw

wPlayerData3End::
wPlayerDataEnd::

wCurMapData::
wVisitedSpawns:: ds 4 ; flag_array NUM_SPAWNS ; d9ee

	warp_struct wDig ; d9f2

wBackupWarpNumber:: db ; d9f5
wBackupMapGroup:: db ; d9f6
wBackupMapNumber:: db ; d9f7

wd9f8:: ds 1 ; d9f8
wd9f9:: ds 1 ; d9f9
wd9fa:: ds 1 ; d9fa
wLastSpawnMapGroup:: db
wLastSpawnMapNumber:: db
wd9fd:: ds 1 ; d9fd
wd9fe:: ds 1 ; d9fe
wWarpNumber:: ds 1 ; d9ff
wMapGroup:: ds 1 ; da00
wMapNumber:: ds 1 ; da01
wYCoord:: ds 1 ; da02
wXCoord:: ds 1 ; da03
wScreenSave:: ds SCREEN_META_WIDTH * SCREEN_META_HEIGHT

wCurMapDataEnd::

SECTION "Party", WRAMX, BANK[1]

wPokemonData::
wPartyCount:: ds 1 ; da22
wPartySpecies:: ds PARTY_LENGTH ; da23
wPartySpeciesEnd:: ds 1 ; da29

wPartyMons::
wPartyMon1:: party_struct wPartyMon1 ; da2a
wPartyMon2:: party_struct wPartyMon2 ; da5a
wPartyMon3:: party_struct wPartyMon3 ; da8a
wPartyMon4:: party_struct wPartyMon4 ; daba
wPartyMon5:: party_struct wPartyMon5 ; daea
wPartyMon6:: party_struct wPartyMon6 ; db1a

wPartyMonOT::
wPartyMon1OT:: ds NAME_LENGTH ; db4a
wPartyMon2OT:: ds NAME_LENGTH ; db55
wPartyMon3OT:: ds NAME_LENGTH ; db60
wPartyMon4OT:: ds NAME_LENGTH ; db6b
wPartyMon5OT:: ds NAME_LENGTH ; db76
wPartyMon6OT:: ds NAME_LENGTH ; db81

wPartyMonNicknames::
wPartyMon1Nickname:: ds MON_NAME_LENGTH ; db8c
wPartyMon2Nickname:: ds MON_NAME_LENGTH ; db97
wPartyMon3Nickname:: ds MON_NAME_LENGTH ; dba2
wPartyMon4Nickname:: ds MON_NAME_LENGTH ; dbad
wPartyMon5Nickname:: ds MON_NAME_LENGTH ; dbb8
wPartyMon6Nickname:: ds MON_NAME_LENGTH ; dbc3
wPartyMonNicknamesEnd::

	ds 22 ; equivalent to NAME_LENGTH + MON_NAME_LENGTH, possibly a reference to 7 pokemon?

wPokedexCaught:: flag_array NUM_POKEMON ; dbe4
wEndPokedexCaught::

wPokedexSeen::   flag_array NUM_POKEMON ; dc04
wEndPokedexSeen::

wUnownDex:: ds NUM_UNOWN ; dc24
wUnlockedUnowns:: ds 1 ; dc3e
wFirstUnownSeen:: ds 1 ; dc3f

wDayCareMan:: ; dc40
; bit 7: active
; bit 6: egg ready
; bit 5: monsters are compatible
; bit 0: monster 1 in day-care
	ds 1

wBreedMon1::
wBreedMon1Nick::  ds MON_NAME_LENGTH ; dc41
wBreedMon1OT::    ds NAME_LENGTH ; dc4c
; TODO fix incorrect Stats label
wBreedMon1Stats:: box_struct wBreedMon1 ; dc57

wDayCareLady:: ; dc77
; bit 7: active
; bit 0: monster 2 in day-care
	ds 1

wStepsToEgg:: ; dc78
	ds 1

wBreedMotherOrNonDitto:: ; dc79
;  z: yes
; nz: no
	ds 1

wBreedMon2::
wBreedMon2Nick::  ds MON_NAME_LENGTH ; dc7a
wBreedMon2OT::    ds NAME_LENGTH ; dc85
wBreedMon2Stats:: box_struct wBreedMon2 ; dc90

wEggNick:: ds MON_NAME_LENGTH ; dcb0
wEggOT::   ds NAME_LENGTH ; dcbb
wEggMon::  box_struct wEggMon ; dcc6

wBugContestSecondPartySpecies:: db ; dce6

wContestMon:: party_struct wContestMon ; dce7

wDunsparceMapGroup:: ds 1 ; dd17
wDunsparceMapNumber:: ds 1 ; dd18
wFishingSwarmFlag:: ds 1 ; dd19

wRoamMon1:: roam_struct wRoamMon1 ; dd1a
wRoamMon2:: roam_struct wRoamMon2 ; dd21
wRoamMon3:: roam_struct wRoamMon3 ; dd28

wRoamMons_CurrentMapNumber:: ds 1 ; dd2f
wRoamMons_CurrentMapGroup:: ds 1 ; dd30
wRoamMons_LastMapNumber:: ds 1 ; dd31
wRoamMons_LastMapGroup:: ds 1 ; dd32

wBestMagikarpLengthFeet:: ds 1 ; dd33
wBestMagikarpLengthInches:: ds 1 ; dd34
wMagikarpRecordHoldersName:: ds NAME_LENGTH ; dd35

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
	ds 1

INCLUDE "sram.asm"

INCLUDE "hram.asm"
