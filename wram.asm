INCLUDE "includes.asm"
INCLUDE "macros/wram.asm"
INCLUDE "vram.asm"

SECTION "Audio RAM", WRAM0
wc000::
wMusic::
wMusicPlaying:: ; c000
; nonzero if playing
	ds 1

wChannels::
wChannel1:: channel_struct wChannel1 ; c101
wChannel2:: channel_struct wChannel2 ; c133
wChannel3:: channel_struct wChannel3 ; c165
wChannel4:: channel_struct wChannel4 ; c197

wSFXChannels::
wChannel5:: channel_struct wChannel5 ; c1c9
wChannel6:: channel_struct wChannel6 ; c1fb
wChannel7:: channel_struct wChannel7 ; c12d
wChannel8:: channel_struct wChannel8 ; c15f

	ds 1 ; c191
wCurTrackDuty:: ds 1
wCurTrackIntensity:: ds 1
wCurTrackFrequency:: dw
wUnusedBCDNumber:: db ; BCD value, dummied out
wCurNoteDuration:: ds 1 ; used in MusicE0 and LoadNote

wCurMusicByte:: ; c198
	ds 1
wCurChannel:: ; c199
	ds 1
wVolume:: ; c19a
; corresponds to $ff24
; Channel control / ON-OFF / Volume (R/W)
;   bit 7 - Vin->SO2 ON/OFF
;   bit 6-4 - SO2 output level (volume) (# 0-7)
;   bit 3 - Vin->SO1 ON/OFF
;   bit 2-0 - SO1 output level (volume) (# 0-7)
	ds 1
wSoundOutput:: ; c19b
; corresponds to $ff25
; bit 4-7: ch1-4 so2 on/off
; bit 0-3: ch1-4 so1 on/off
	ds 1
wSoundInput:: ; c19c
; corresponds to $ff26
; bit 7: global on/off
; bit 0: ch1 on/off
; bit 1: ch2 on/off
; bit 2: ch3 on/off
; bit 3: ch4 on/off
	ds 1

wMusicID::
wMusicIDLo:: ; c19d
	ds 1
wMusicIDHi:: ; c19e
	ds 1
wMusicBank:: ; c19f
	ds 1
wNoiseSampleAddress::
wNoiseSampleAddressLo:: ; c1a0
	ds 1
wNoiseSampleAddressHi:: ; c1a1
	ds 1
wNoiseSampleDelay:: ; noise delay? ; c1a2
	ds 1
; c1a3
	ds 1
wMusicNoiseSampleSet:: ; c1a4
	ds 1
wSFXNoiseSampleSet:: ; c1a5
	ds 1
wLowHealthAlarm:: ; c1a6
; bit 7: on/off
; bit 4: pitch
; bit 0-3: counter
	ds 1
wMusicFade:: ; c1a7
; fades volume over x frames
; bit 7: fade in/out
; bit 0-5: number of frames for each volume level
; $00 = none (default)
	ds 1
wMusicFadeCount:: ; c1a8
	ds 1
wMusicFadeID::
wMusicFadeIDLo:: ; c1a9
	ds 1
wMusicFadeIDHi:: ; c1aa
	ds 1
	ds 5
wCryPitch:: ; c1b0
	ds 2
wCryLength:: ; c1b2
	ds 2
wLastVolume:: ; c1b4
	ds 1
wUnusedMusicF9Flag:: ds 1 ; c1b5
wSFXPriority:: ; c1b6
; if nonzero, turn off music when playing sfx
	ds 1
	ds 1
wChannel1JumpCondition:: ds 1
wChannel2JumpCondition:: ds 1
wChannel3JumpCondition:: ds 1
wChannel4JumpCondition:: ds 1
wStereoPanningMask:: ds 1 ; c1bc
wCryTracks:: ; c1bd
; plays only in left or right track depending on what side the monster is on
; both tracks active outside of battle
	ds 1
wSFXDuration:: ds 1
wCurSFX:: ; c1bf
; id of sfx currently playing
	ds 1
wChannelsEnd::
wMapMusic:: ; c1c0
	ds 1

wDontPlayMapMusicOnReload:: ds 1
wMusicEnd::

SECTION "WRAM", WRAM0
wLZAddress:: dw ; c1c2
wLZBank:: ds 1 ; c1c4
wc1c5:: ds 1 ; c1c5

wInputType:: ds 1 ; c1c6
wAutoInputAddress:: dw ; c1c7
wAutoInputBank:: ds 1 ; c1c9
wAutoInputLength:: ds 1 ; c1ca

wMonStatusFlags:: ds 1 ; c1cb
wGameLogicPaused:: ds 1 ; c1cc
wRTCEnabled:: ds 1
wc1ce:: ds 1 ; c1ce
wMapTimeOfDay:: ds 1 ; c1cf
	ds 3
wPrinterConnectionOpen:: ds 1
wPrinterOpcode:: ds 1 ; c1d4
wc1d5:: ds 1 ; c1d5
wc1d6:: ds 1 ; c1d6
wc1d7:: ds 1 ; c1d7
wc1d8:: ds 1 ; c1d8
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

wTempBGPals:: palbuffer wTempBG ; c200
wTempOBPals:: palbuffer wTempOB ; c240
wBGPals::     palbuffer wBG     ; c280
wOBPals::     palbuffer wOB     ; c2c0

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
wTileMap:: ; c3a0
	ds SCREEN_HEIGHT * SCREEN_WIDTH
wTileMapEnd:: ; c508

SECTION "Animated Objects", WRAM0
wMisc:: ; c508
wTileMapBackup:: ; c508
	; ds SCREEN_HEIGHT * SCREEN_WIDTH
wAnimatedObjectDynamicVTileOffsets:: ds 10 * 2 ; c508
wAnimatedObjectStructs:: ; c51c
; Field  0: Index
; Fields 1-3: Loaded from AnimatedObjectStructSeqData
wAnimatedObjectStruct1::  sprite_anim_struct wAnimatedObjectStruct1  ; c51c
wAnimatedObjectStruct2::  sprite_anim_struct wAnimatedObjectStruct2  ; c52c
wAnimatedObjectStruct3::  sprite_anim_struct wAnimatedObjectStruct3  ; c53c
wAnimatedObjectStruct4::  sprite_anim_struct wAnimatedObjectStruct4  ; c54c
wAnimatedObjectStruct5::  sprite_anim_struct wAnimatedObjectStruct5  ; c55c
wAnimatedObjectStruct6::  sprite_anim_struct wAnimatedObjectStruct6  ; c56c
wAnimatedObjectStruct7::  sprite_anim_struct wAnimatedObjectStruct7  ; c57c
wAnimatedObjectStruct8::  sprite_anim_struct wAnimatedObjectStruct8  ; c58c
wAnimatedObjectStruct9::  sprite_anim_struct wAnimatedObjectStruct9  ; c59c
wAnimatedObjectStruct10:: sprite_anim_struct wAnimatedObjectStruct10 ; c5ac
wAnimatedObjectStructsEnd::

wAnimatedObjectStructCount:: ds 1 ; c5bc
wCurrSpriteOAMAddr:: ds 1 ; c5bd

wCurIcon:: ; c5be
	ds 1

wCurIconTile:: ds 1 ; c5bf
wAnimatedObjectStructAddrBackup::
wAnimatedObjectStructIDBuffer::
wCurrSpriteAddSubFlags:: ; c5c0
	ds 2
wCurrAnimVTile:: ds 1 ; c5c2
wCurrAnimXCoord:: ds 1 ; c5c3
wCurrAnimYCoord:: ds 1 ; c5c4
wCurrAnimXOffset:: ds 1 ; c5c5
wCurrAnimYOffset:: ds 1 ; c5c6
wGlobalAnimYOffset:: ds 1 ; c5c7
wGlobalAnimXOffset:: ds 1 ; c5c8
wAnimatedObjectsEnd:: ; c5c9

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
; naming screen
wNamingScreenDestinationPointer:: dw ; c5d0
wc5d2:: ds 1 ; c5d2
wc5d3:: ds 1 ; c5d3
wNamingScreenType:: ds 1 ; c5d4

wc5d5:: ds 1 ; c5d5
wc5d6:: ds 1 ; c5d6
wc5d7:: ds 1 ; c5d7
wc5d8:: ds 1 ; c5d8
wc5d9:: ds 1 ; c5d9
wc5da:: ds 1 ; c5da
wc5db:: ds 1 ; c5db
wc5dc:: ds 1 ; c5dc
wc5dd:: ds 1 ; c5dd
wc5de:: ds 1 ; c5de
wc5df:: ds 1 ; c5df
wc5e0:: ds 1 ; c5e0
wc5e1:: ds 1 ; c5e1
wc5e2:: ds 1 ; c5e2
wc5e3:: ds 1 ; c5e3
wc5e4:: ds 1 ; c5e4
wc5e5:: ds 1 ; c5e5
wc5e6:: ds 1 ; c5e6
wc5e7:: ds 1 ; c5e7
wc5e8:: ds 1 ; c5e8
wc5e9:: ds 1 ; c5e9
wc5ea:: ds 1 ; c5ea
wc5eb:: ds 1 ; c5eb
wc5ec:: ds 1 ; c5ec
wc5ed:: ds 1 ; c5ed
wc5ee:: ds 1 ; c5ee
wc5ef:: ds 1 ; c5ef
wc5f0:: ds 1 ; c5f0
wc5f1:: ds 1 ; c5f1
wc5f2:: ds 1 ; c5f2
wc5f3:: ds 1 ; c5f3
wc5f4:: ds 1 ; c5f4
wc5f5:: ds 1 ; c5f5
wc5f6:: ds 1 ; c5f6
wc5f7:: ds 1 ; c5f7
wc5f8:: ds 1 ; c5f8
wc5f9:: ds 1 ; c5f9
wc5fa:: ds 1 ; c5fa
wc5fb:: ds 1 ; c5fb
wc5fc:: ds 1 ; c5fc
wc5fd:: ds 1 ; c5fd
wc5fe:: ds 1 ; c5fe
wc5ff:: ds 1 ; c5ff
wc600:: ds 1 ; c600
wc601:: ds 1 ; c601
wc602:: ds 1 ; c602
wc603:: ds 1 ; c603
wc604:: ds 1 ; c604
wc605:: ds 1 ; c605
wc606:: ds 1 ; c606
wc607:: ds 1 ; c607
wc608:: ds 1 ; c608
wc609:: ds 1 ; c609
wc60a:: ds 1 ; c60a
wc60b:: ds 1 ; c60b
wc60c:: ds 1 ; c60c
wc60d:: ds 1 ; c60d
wc60e:: ds 1 ; c60e
wc60f:: ds 1 ; c60f
wc610:: ds 1 ; c610
wc611:: ds 1 ; c611
wc612:: ds 1 ; c612
wc613:: ds 1 ; c613
wc614:: ds 1 ; c614
wc615:: ds 1 ; c615
wc616:: ds 1 ; c616
wc617:: ds 1 ; c617
wc618:: ds 1 ; c618
wc619:: ds 1 ; c619
wc61a:: ds 1 ; c61a
wc61b:: ds 1 ; c61b
wc61c:: ds 1 ; c61c
wc61d:: ds 1 ; c61d
wc61e:: ds 1 ; c61e
wc61f:: ds 1 ; c61f
wc620:: ds 1 ; c620
wc621:: ds 1 ; c621
wc622:: ds 1 ; c622
wc623:: ds 1 ; c623
wc624:: ds 1 ; c624
wc625:: ds 1 ; c625
wc626:: ds 1 ; c626
wc627:: ds 1 ; c627
wc628:: ds 1 ; c628
wc629:: ds 1 ; c629
wc62a:: ds 1 ; c62a
wc62b:: ds 1 ; c62b
wc62c:: ds 1 ; c62c
wc62d:: ds 1 ; c62d
wc62e:: ds 1 ; c62e
wc62f:: ds 1 ; c62f
wc630:: ds 1 ; c630
wc631:: ds 1 ; c631
wc632:: ds 1 ; c632
wc633:: ds 1 ; c633
wc634:: ds 1 ; c634
wc635:: ds 1 ; c635
wc636:: ds 1 ; c636
wc637:: ds 1 ; c637
wc638:: ds 1 ; c638
wc639:: ds 1 ; c639
wc63a:: ds 1 ; c63a
wc63b:: ds 1 ; c63b
wc63c:: ds 1 ; c63c
wc63d:: ds 1 ; c63d
wc63e:: ds 1 ; c63e
wc63f:: ds 1 ; c63f
wc640:: ds 1 ; c640
wc641:: ds 1 ; c641
wc642:: ds 1 ; c642
wc643:: ds 1 ; c643
wc644:: ds 1 ; c644
wc645:: ds 1 ; c645
wc646:: ds 1 ; c646
wc647:: ds 1 ; c647
wc648:: ds 1 ; c648
wc649:: ds 1 ; c649
wc64a:: ds 1 ; c64a
wc64b:: ds 1 ; c64b
wc64c:: ds 1 ; c64c
wc64d:: ds 1 ; c64d
wc64e:: ds 1 ; c64e
wc64f:: ds 1 ; c64f
wc650:: ds 1 ; c650
wc651:: ds 1 ; c651
wc652:: ds 1 ; c652
wc653:: ds 1 ; c653
wc654:: ds 1 ; c654
wc655:: ds 1 ; c655
wc656:: ds 1 ; c656
wc657:: ds 1 ; c657
wc658:: ds 1 ; c658
wc659:: ds 1 ; c659
wc65a:: ds 1 ; c65a
wc65b:: ds 1 ; c65b
wc65c:: ds 1 ; c65c
wc65d:: ds 1 ; c65d
wc65e:: ds 1 ; c65e
wc65f:: ds 1 ; c65f
wc660:: ds 1 ; c660
wc661:: ds 1 ; c661
wc662:: ds 1 ; c662
wc663:: ds 1 ; c663
wc664:: ds 1 ; c664
wc665:: ds 1 ; c665
wc666:: ds 1 ; c666
wc667:: ds 1 ; c667
wc668:: ds 1 ; c668
wc669:: ds 1 ; c669
wc66a:: ds 1 ; c66a
wc66b:: ds 1 ; c66b
wc66c:: ds 1 ; c66c
wc66d:: ds 1 ; c66d
wc66e:: ds 1 ; c66e
wc66f:: ds 1 ; c66f
wc670:: ds 1 ; c670
wc671:: ds 1 ; c671
wc672:: ds 1 ; c672
wc673:: ds 1 ; c673
wc674:: ds 1 ; c674
wc675:: ds 1 ; c675
wc676:: ds 1 ; c676
wc677:: ds 1 ; c677
wc678:: ds 1 ; c678
wc679:: ds 1 ; c679
wc67a:: ds 1 ; c67a
wc67b:: ds 1 ; c67b
wc67c:: ds 1 ; c67c
wc67d:: ds 1 ; c67d
wc67e:: ds 1 ; c67e
wc67f:: ds 1 ; c67f
wc680:: ds 1 ; c680
wc681:: ds 1 ; c681
wc682:: ds 1 ; c682
wc683:: ds 1 ; c683
wc684:: ds 1 ; c684
wc685:: ds 1 ; c685
wc686:: ds 1 ; c686
wc687:: ds 1 ; c687
wc688:: ds 1 ; c688
wc689:: ds 1 ; c689
wc68a:: ds 1 ; c68a
wc68b:: ds 1 ; c68b
wc68c:: ds 1 ; c68c
wc68d:: ds 1 ; c68d
wc68e:: ds 1 ; c68e
wc68f:: ds 1 ; c68f
wc690:: ds 1 ; c690
wc691:: ds 1 ; c691
wc692:: ds 1 ; c692
wc693:: ds 1 ; c693
wc694:: ds 1 ; c694
wc695:: ds 1 ; c695
wc696:: ds 1 ; c696
wc697:: ds 1 ; c697
wc698:: ds 1 ; c698
wc699:: ds 1 ; c699
wc69a:: ds 1 ; c69a
wc69b:: ds 1 ; c69b
wc69c:: ds 1 ; c69c
wc69d:: ds 1 ; c69d
wc69e:: ds 1 ; c69e
wc69f:: ds 1 ; c69f
wc6a0:: ds 1 ; c6a0
wc6a1:: ds 1 ; c6a1
wc6a2:: ds 1 ; c6a2
wc6a3:: ds 1 ; c6a3
wc6a4:: ds 1 ; c6a4
wc6a5:: ds 1 ; c6a5
wc6a6:: ds 1 ; c6a6
wc6a7:: ds 1 ; c6a7
wc6a8:: ds 1 ; c6a8
wc6a9:: ds 1 ; c6a9
wc6aa:: ds 1 ; c6aa
wc6ab:: ds 1 ; c6ab
wc6ac:: ds 1 ; c6ac
wc6ad:: ds 1 ; c6ad
wc6ae:: ds 1 ; c6ae
wc6af:: ds 1 ; c6af
wc6b0:: ds 1 ; c6b0
wc6b1:: ds 1 ; c6b1
wc6b2:: ds 1 ; c6b2
wc6b3:: ds 1 ; c6b3
wc6b4:: ds 1 ; c6b4
wc6b5:: ds 1 ; c6b5
wc6b6:: ds 1 ; c6b6
wc6b7:: ds 1 ; c6b7
wc6b8:: ds 1 ; c6b8
wc6b9:: ds 1 ; c6b9
wc6ba:: ds 1 ; c6ba
wc6bb:: ds 1 ; c6bb
wc6bc:: ds 1 ; c6bc
wc6bd:: ds 1 ; c6bd
wc6be:: ds 1 ; c6be
wc6bf:: ds 1 ; c6bf
wc6c0:: ds 1 ; c6c0
wc6c1:: ds 1 ; c6c1
wc6c2:: ds 1 ; c6c2
wc6c3:: ds 1 ; c6c3
wc6c4:: ds 1 ; c6c4
wc6c5:: ds 1 ; c6c5
wc6c6:: ds 1 ; c6c6
wc6c7:: ds 1 ; c6c7
wc6c8:: ds 1 ; c6c8
wc6c9:: ds 1 ; c6c9
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
wc6e8:: ds 1 ; c6e8
wc6e9:: ds 1 ; c6e9
wc6ea:: ds 1 ; c6ea
wc6eb:: ds 1 ; c6eb
wc6ec:: ds 1 ; c6ec
wc6ed:: ds 1 ; c6ed
wc6ee:: ds 1 ; c6ee
wc6ef:: ds 1 ; c6ef
wc6f0:: ds 1 ; c6f0
wc6f1:: ds 1 ; c6f1
wc6f2:: ds 1 ; c6f2
wc6f3:: ds 1 ; c6f3
wc6f4:: ds 1 ; c6f4
wc6f5:: ds 1 ; c6f5
wc6f6:: ds 1 ; c6f6
wc6f7:: ds 1 ; c6f7
wc6f8:: ds 1 ; c6f8
wc6f9:: ds 1 ; c6f9
wc6fa:: ds 1 ; c6fa
wc6fb:: ds 1 ; c6fb
wc6fc:: ds 1 ; c6fc
wc6fd:: ds 1 ; c6fd
wc6fe:: ds 1 ; c6fe
wc6ff:: ds 1 ; c6ff

wOverworldMap::
wOverworldMapBlocks::
wLYOverrides::
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
wLYOverridesEnd::

wLYOverridesBuffer::
wc800:: ds 1 ; c800
wc801:: ds 1 ; c801
wc802:: ds 1 ; c802
UNION
wc803:: ds 1 ; c803
NEXTU
wMysteryGiftPartnerName:: ds 1 ; c803
ENDU
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
UNION
wc853:: ds 1 ; c853
NEXTU
wMysteryGiftPlayerName::
ENDU
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
wLYOverridesBufferEnd::

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
wca10:: ds 1 ; ca10
wca11:: ds 1 ; ca11
wca12:: ds 1 ; ca12
wca13:: ds 1 ; ca13
wca14:: ds 1 ; ca14
wca15:: ds 1 ; ca15
wca16:: ds 1 ; ca16
wca17:: ds 1 ; ca17
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
wcb2e:: ds 1 ; cb2e
wcb2f:: ds 1 ; cb2f
wcb30:: ds 1 ; cb30
wcb31:: ds 1 ; cb31
wcb32:: ds 1 ; cb32
wcb33:: ds 1 ; cb33

wOTClassName:: ds NAME_LENGTH ; cb34

wcb3f:: ds 1 ; cb3f
wcb40:: ds 1 ; cb40
wCurOTMon:: ds 1 ; cb41
wcb42:: ds 1 ; cb42
wcb43:: ds 1 ; cb43
wcb44:: ds 1 ; cb44
wcb45:: ds 1 ; cb45
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
wcb50:: ds 1 ; cb50
wcb51:: ds 1 ; cb51
wcb52:: ds 1 ; cb52
wcb53:: ds 1 ; cb53
wcb54:: ds 1 ; cb54
wcb55:: ds 1 ; cb55
wcb56:: ds 1 ; cb56
wcb57:: ds 1 ; cb57
wcb58:: ds 1 ; cb58
wcb59:: ds 1 ; cb59
wcb5a:: ds 1 ; cb5a
wcb5b:: ds 1 ; cb5b
wcb5c:: ds 1 ; cb5c
wcb5d:: ds 1 ; cb5d
wcb5e:: ds 1 ; cb5e
wcb5f:: ds 1 ; cb5f
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
wcb67:: ds 1 ; cb67
wcb68:: ds 1 ; cb68
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
wcb90:: ds 1 ; cb90
wcb91:: ds 1 ; cb91
wcb92:: ds 1 ; cb92
wcb93:: ds 1 ; cb93
wcb94:: ds 1 ; cb94
wcb95:: ds 1 ; cb95
wcb96:: ds 1 ; cb96
wcb97:: ds 1 ; cb97
wcb98:: ds 1 ; cb98
wcb99:: ds 1 ; cb99
wcb9a:: ds 1 ; cb9a
wcb9b:: ds 1 ; cb9b
wcb9c:: ds 1 ; cb9c
wcb9d:: ds 1 ; cb9d
wcb9e:: ds 1 ; cb9e
wcb9f:: ds 1 ; cb9f
wcba0:: ds 1 ; cba0
wcba1:: ds 1 ; cba1
wcba2:: ds 1 ; cba2
wcba3:: ds 1 ; cba3
wcba4:: ds 1 ; cba4
wcba5:: ds 1 ; cba5
wcba6:: ds 1 ; cba6
wcba7:: ds 1 ; cba7
wcba8:: ds 1 ; cba8
wcba9:: ds 1 ; cba9
wcbaa:: ds 1 ; cbaa
wcbab:: ds 1 ; cbab
wcbac:: ds 1 ; cbac
wcbad:: ds 1 ; cbad
wcbae:: ds 1 ; cbae
wcbaf:: ds 1 ; cbaf
wcbb0:: ds 1 ; cbb0
wcbb1:: ds 1 ; cbb1
wcbb2:: ds 1 ; cbb2
wcbb3:: ds 1 ; cbb3
wcbb4:: ds 1 ; cbb4
wcbb5:: ds 1 ; cbb5
wcbb6:: ds 1 ; cbb6
wcbb7:: ds 1 ; cbb7
wcbb8:: ds 1 ; cbb8
wcbb9:: ds 1 ; cbb9
wcbba:: ds 1 ; cbba
wcbbb:: ds 1 ; cbbb
wcbbc:: ds 1 ; cbbc
wcbbd:: ds 1 ; cbbd
wcbbe:: ds 1 ; cbbe
wcbbf:: ds 1 ; cbbf
wcbc0:: ds 1 ; cbc0
wCurPlayerMove:: ds 1 ; cbc1
wCurEnemyMove:: ds 1 ; cbc2
wcbc3:: ds 1 ; cbc3
wcbc4:: ds 1 ; cbc4
wcbc5:: ds 1 ; cbc5
wcbc6:: ds 1 ; cbc6
wcbc7:: ds 1 ; cbc7
wcbc8:: ds 1 ; cbc8
wcbc9:: ds 1 ; cbc9
wPayDayMoney:: ds 3 ; cbca

wcbcd:: ds 1 ; cbcd
wcbce:: ds 1 ; cbce
wcbcf:: ds 1 ; cbcf
wcbd0:: ds 1 ; cbd0
wcbd1:: ds 1 ; cbd1
wcbd2:: ds 1 ; cbd2
wcbd3:: ds 1 ; cbd3
wcbd4:: ds 1 ; cbd4
wcbd5:: ds 1 ; cbd5
wLastEnemyCounterMove:: ds 1 ; cbd6
wLastPlayerCounterMove:: ds 1 ; cbd7
wcbd8:: ds 1 ; cbd8
wcbd9:: ds 1 ; cbd9
wcbda:: ds 1 ; cbda
wcbdb:: ds 1 ; cbdb
wcbdc:: ds 1 ; cbdc
wcbdd:: ds 1 ; cbdd
wcbde:: ds 1 ; cbde
wcbdf:: ds 1 ; cbdf
wcbe0:: ds 1 ; cbe0
wcbe1:: ds 1 ; cbe1
wcbe2:: ds 1 ; cbe2
wcbe3:: ds 1 ; cbe3
wcbe4:: ds 1 ; cbe4
wcbe5:: ds 1 ; cbe5
wcbe6:: ds 1 ; cbe6
wcbe7:: ds 1 ; cbe7
wcbe8:: ds 1 ; cbe8
wcbe9:: ds 1 ; cbe9
wcbea:: ds 1 ; cbea
wcbeb:: ds 1 ; cbeb
wcbec:: ds 1 ; cbec
wcbed:: ds 1 ; cbed
wcbee:: ds 1 ; cbee
wcbef:: ds 1 ; cbef
wcbf0:: ds 1 ; cbf0
wcbf1:: ds 1 ; cbf1
wcbf2:: ds 1 ; cbf2
wcbf3:: ds 1 ; cbf3
wcbf4:: ds 1 ; cbf4
wcbf5:: ds 1 ; cbf5
wcbf6:: ds 1 ; cbf6
wcbf7:: ds 1 ; cbf7
wcbf8:: ds 1 ; cbf8
wLastPlayerMove:: ds 1 ; cbf9
wLastEnemyMove:: ds 1 ; cbfa
wcbfb:: ds 1 ; cbfb
wcbfc:: ds 1 ; cbfc
wcbfd:: ds 1 ; cbfd
wcbfe:: ds 1 ; cbfe
wcbff:: ds 1 ; cbff
wcc00:: ds 1 ; cc00
wcc01:: ds 1 ; cc01
wcc02:: ds 1 ; cc02
wcc03:: ds 1 ; cc03
wcc04:: ds 1 ; cc04
wcc05:: ds 1 ; cc05
wcc06:: ds 1 ; cc06
wcc07:: ds 1 ; cc07
wcc08:: ds 1 ; cc08
wcc09:: ds 1 ; cc09
wcc0a:: ds 1 ; cc0a
wcc0b:: ds 1 ; cc0b
wcc0c:: ds 1 ; cc0c
wcc0d:: ds 1 ; cc0d
wcc0e:: ds 1 ; cc0e
wcc0f:: ds 1 ; cc0f
wcc10:: ds 1 ; cc10
wcc11:: ds 1 ; cc11
wcc12:: ds 1 ; cc12
wWildMonMoves:: ds 1 ; cc13
wOverworldMapEnd::
	ds NUM_MOVES +- 1
wWildMonPP:: ds NUM_MOVES ; cc17

wcc1b:: ds 1 ; cc1b
wcc1c:: ds 1 ; cc1c
wcc1d:: ds 1 ; cc1d
wcc1e:: ds 1 ; cc1e
wcc1f:: ds 1 ; cc1f
ENDU ; cc20

SECTION "Video", WRAM0
wBGMapBuffer:: ds 1 ; cc20
wcc21:: ds 1 ; cc21
wcc22:: ds 1 ; cc22
wcc23:: ds 1 ; cc23
wcc24:: ds 1 ; cc24
wcc25:: ds 1 ; cc25
wcc26:: ds 1 ; cc26
wcc27:: ds 1 ; cc27
wcc28:: ds 1 ; cc28
wcc29:: ds 1 ; cc29
wcc2a:: ds 1 ; cc2a
wcc2b:: ds 1 ; cc2b
wcc2c:: ds 1 ; cc2c
wcc2d:: ds 1 ; cc2d
wcc2e:: ds 1 ; cc2e
wcc2f:: ds 1 ; cc2f
wcc30:: ds 1 ; cc30
wcc31:: ds 1 ; cc31
wcc32:: ds 1 ; cc32
wcc33:: ds 1 ; cc33
wcc34:: ds 1 ; cc34
wcc35:: ds 1 ; cc35
wcc36:: ds 1 ; cc36
wcc37:: ds 1 ; cc37
wcc38:: ds 1 ; cc38
wcc39:: ds 1 ; cc39
wcc3a:: ds 1 ; cc3a
wcc3b:: ds 1 ; cc3b
wcc3c:: ds 1 ; cc3c
wcc3d:: ds 1 ; cc3d
wcc3e:: ds 1 ; cc3e
wcc3f:: ds 1 ; cc3f
wcc40:: ds 1 ; cc40
wcc41:: ds 1 ; cc41
wcc42:: ds 1 ; cc42
wcc43:: ds 1 ; cc43
wcc44:: ds 1 ; cc44
wcc45:: ds 1 ; cc45
wcc46:: ds 1 ; cc46
wcc47:: ds 1 ; cc47
wBGMapPalBuffer:: ds 1 ; cc48
wcc49:: ds 1 ; cc49
wcc4a:: ds 1 ; cc4a
wcc4b:: ds 1 ; cc4b
wcc4c:: ds 1 ; cc4c
wcc4d:: ds 1 ; cc4d
wcc4e:: ds 1 ; cc4e
wcc4f:: ds 1 ; cc4f
wcc50:: ds 1 ; cc50
wcc51:: ds 1 ; cc51
wcc52:: ds 1 ; cc52
wcc53:: ds 1 ; cc53
wcc54:: ds 1 ; cc54
wcc55:: ds 1 ; cc55
wcc56:: ds 1 ; cc56
wcc57:: ds 1 ; cc57
wcc58:: ds 1 ; cc58
wcc59:: ds 1 ; cc59
wcc5a:: ds 1 ; cc5a
wcc5b:: ds 1 ; cc5b
wcc5c:: ds 1 ; cc5c
wcc5d:: ds 1 ; cc5d
wcc5e:: ds 1 ; cc5e
wcc5f:: ds 1 ; cc5f
wcc60:: ds 1 ; cc60
wcc61:: ds 1 ; cc61
wcc62:: ds 1 ; cc62
wcc63:: ds 1 ; cc63
wcc64:: ds 1 ; cc64
wcc65:: ds 1 ; cc65
wcc66:: ds 1 ; cc66
wcc67:: ds 1 ; cc67
wcc68:: ds 1 ; cc68
wcc69:: ds 1 ; cc69
wcc6a:: ds 1 ; cc6a
wcc6b:: ds 1 ; cc6b
wcc6c:: ds 1 ; cc6c
wcc6d:: ds 1 ; cc6d
wcc6e:: ds 1 ; cc6e
wcc6f:: ds 1 ; cc6f
wBGMapBufferPtrs:: ds 1 ; cc70
wcc71:: ds 1 ; cc71
wcc72:: ds 1 ; cc72
wcc73:: ds 1 ; cc73
wcc74:: ds 1 ; cc74
wcc75:: ds 1 ; cc75
wcc76:: ds 1 ; cc76
wcc77:: ds 1 ; cc77
wcc78:: ds 1 ; cc78
wcc79:: ds 1 ; cc79
wcc7a:: ds 1 ; cc7a
wcc7b:: ds 1 ; cc7b
wcc7c:: ds 1 ; cc7c
wcc7d:: ds 1 ; cc7d
wcc7e:: ds 1 ; cc7e
wcc7f:: ds 1 ; cc7f
wcc80:: ds 1 ; cc80
wcc81:: ds 1 ; cc81
wcc82:: ds 1 ; cc82
wcc83:: ds 1 ; cc83
wcc84:: ds 1 ; cc84
wcc85:: ds 1 ; cc85
wcc86:: ds 1 ; cc86
wcc87:: ds 1 ; cc87
wcc88:: ds 1 ; cc88
wcc89:: ds 1 ; cc89
wcc8a:: ds 1 ; cc8a
wcc8b:: ds 1 ; cc8b
wcc8c:: ds 1 ; cc8c
wcc8d:: ds 1 ; cc8d
wcc8e:: ds 1 ; cc8e
wcc8f:: ds 1 ; cc8f
wcc90:: ds 1 ; cc90
wcc91:: ds 1 ; cc91
wcc92:: ds 1 ; cc92
wcc93:: ds 1 ; cc93
wcc94:: ds 1 ; cc94
wcc95:: ds 1 ; cc95
wcc96:: ds 1 ; cc96
wcc97:: ds 1 ; cc97
wColorLayoutPredefID:: ds 1 ; cc98
wcc99:: ds 1 ; cc99
wcc9a:: ds 1 ; cc9a
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

wAttrMap:: ; ccd9
	ds SCREEN_HEIGHT * SCREEN_WIDTH
wAttrMapEnd:: ; ce41

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
wOtherPlayerLinkMode:: ds 1 ; ce51
wOtherPlayerLinkAction:: ds 1 ; ce52
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
wce61:: ds 1 ; ce61
wce62:: ds 1 ; ce62
wce63::
wJumpTableIndex::
	db ; ce63
wce64:: ds 1 ; ce64
wce65::
wIntroSceneTimer::
	db ; ce65
wce66:: ds 1 ; ce66

wRequested2bpp:: ds 1 ; ce67
wRequested2bppSource:: dw ; ce68
wRequested2bppDest:: dw ; ce6a

wRequested1bpp:: ds 1 ; ce6c
wRequested1bppSource:: dw ; ce6d
wRequested1bppDest:: dw ; ce6f

wSecsSince:: ds 1 ; ce71
wMinsSince:: ds 1 ; ce72
wHoursSince:: ds 1 ; ce73
wDaysSince:: ds 1 ; ce74
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
wce81:: ds 1 ; ce81
wce82:: ds 1 ; ce82

wPlayerStepVectorX:: ds 1 ; ce83
wPlayerStepVectorY:: ds 1 ; ce84
wPlayerStepFlags:: ds 1 ; ce85
wPlayerStepDirection:: ds 1 ; ce86

wce87:: ds 1 ; ce87
wce88:: ds 1 ; ce88
wce89:: ds 1 ; ce89
wce8a:: ds 1 ; ce8a
wMovementPerson:: ds 1 ; ce8b
wMovementDataPointerBank:: ds 1 ; ce8c
wMovementDataPointerAddr:: dw ; ce8d
wce8f:: ds 1 ; ce8f
wce90:: ds 1 ; ce90
wce91:: ds 1 ; ce91
wce92:: ds 1 ; ce92
wce93:: ds 1 ; ce93
wce94:: ds 1 ; ce94
wce95:: ds 1 ; ce95
wce96:: ds 1 ; ce96
wce97:: ds 1 ; ce97
wce98:: ds 1 ; ce98
wce99:: ds 1 ; ce99
wce9a:: ds 1 ; ce9a
wce9b:: ds 1 ; ce9b
wce9c:: ds 1 ; ce9c
wce9d:: ds 1 ; ce9d
wce9e:: ds 1 ; ce9e
wce9f:: ds 1 ; ce9f
wcea0:: ds 1 ; cea0
wcea1:: ds 1 ; cea1
wcea2:: ds 1 ; cea2

wTileDown:: ds 1 ; cea3
wTileUp:: ds 1 ; cea4
wTileLeft:: ds 1 ; cea5
wTileRight:: ds 1 ; cea6
wTilePermissions:: ds 1 ; cea7

wWindowData::
wWindowStackPointer:: dw ; cea8
wMenuJoypad:: ds 1 ; ceaa
wMenuSelection:: ds 1 ; ceab
wceac:: ds 1 ; ceac
wWhichIndexSet:: ds 1 ; cead
wceae:: ds 1 ; ceae
wceaf:: ds 1 ; ceaf
wceb0:: ds 1 ; ceb0
wceb1:: ds 1 ; ceb1
wceb2:: ds 1 ; ceb2
wceb3:: ds 1 ; ceb3
wceb4:: ds 1 ; ceb4
wceb5:: ds 1 ; ceb5
wceb6:: ds 1 ; ceb6
wceb7:: ds 1 ; ceb7
wWindowDataEnd::

wMenuDataHeader::
wceb8:: ds 1 ; ceb8
wMenuBorderTopCoord:: ds 1 ; ceb9
wMenuBorderLeftCoord:: ds 1 ; ceba
wMenuBorderBottomCoord:: ds 1 ; cebb
wMenuBorderRightCoord:: ds 1 ; cebc
wMenuData2Pointer:: dw ; cebd
wMenuCursorBuffer:: ds 1 ; cebf
wcec0:: ds 1 ; cec0
wcec1:: ds 1 ; cec1
wcec2:: ds 1 ; cec2
wcec3:: ds 1 ; cec3
wcec4:: ds 1 ; cec4
wcec5:: ds 1 ; cec5
wcec6:: ds 1 ; cec6
wcec7:: ds 1 ; cec7
wMenuDataHeaderEnd::

wMenuData2::
wMenuData2Flags:: ds 1 ; cec8
wMenuData2Items:: ds 1 ; cec9
wMenuData2IndicesPointer:: ds 1 ; ceca
wMenuDataBank:: ds 1 ; cecb
wMenuData2DisplayFunctionPointer:: dw ; cecc
wMenuData2PointerTableAddr:: ds 1 ; cece
wcecf:: ds 1 ; cecf
wced0:: ds 1 ; ced0
wced1:: ds 1 ; ced1
wced2:: ds 1 ; ced2
wced3:: ds 1 ; ced3
wced4:: ds 1 ; ced4
wced5:: ds 1 ; ced5
wced6:: ds 1 ; ced6
wced7:: ds 1 ; ced7
wMenuData2End::

wMenuData3::
w2DMenuCursorInitY:: ds 1 ; ced8
wced9:: ds 1 ; ced9
wceda:: ds 1 ; ceda
wcedb:: ds 1 ; cedb
wcedc:: ds 1 ; cedc
wcedd:: ds 1 ; cedd
wcede:: ds 1 ; cede
wMenuJoypadFilter:: ds 1 ; cedf
wMenuCursorY:: ds 1 ; cee0
wcee1:: ds 1 ; cee1
wcee2:: ds 1 ; cee2
wCursorCurrentTile:: ds 1 ; cee3
wcee4:: ds 1 ; cee4
wcee5:: ds 1 ; cee5
wcee6:: ds 1 ; cee6
wcee7:: ds 1 ; cee7
wMenuData3End::

wOverworldDelay:: ds 1 ; cee8
wTextDelayFrames:: ds 1 ; cee9
wVBlankOccurred:: ds 1 ; ceea

wceeb:: ds 1 ; ceeb
wceec:: ds 1 ; ceec

wMovementBufferCount:: ; ceed
wceed:: ds 1 ; ceed

wMovementBufferPerson::
wceee:: ds 1 ; ceee

wTemporaryBuffer::
wBugContestFirstPlaceScore::
wceef:: ds 1 ; ceef
wcef0:: ds 1 ; cef0
wcef1:: ds 1 ; cef1

wMovementBuffer::
wcef2:: ds 1 ; cef2

wBugContestSecondPlaceScore::
wcef3:: ds 1 ; cef3
wcef4:: ds 1 ; cef4
wcef5:: ds 1 ; cef5
wcef6:: ds 1 ; cef6
wBugContestThirdPlaceScore::
wcef7:: ds 1 ; cef7
wcef8:: ds 1 ; cef8
wcef9:: ds 1 ; cef9
wcefa:: ds 1 ; cefa
wcefb:: ds 1 ; cefb
wcefc:: ds 1 ; cefc
wcefd:: ds 1 ; cefd
wcefe:: ds 1 ; cefe
wceff:: ds 1 ; ceff
wcf00:: ds 1 ; cf00
wBugContestWinnerName::
wcf01:: ds 1 ; cf01
wcf02:: ds 1 ; cf02
wcf03:: ds 1 ; cf03
wcf04:: ds 1 ; cf04
wcf05:: ds 1 ; cf05
wcf06:: ds 1 ; cf06
wcf07:: ds 1 ; cf07
wcf08:: ds 1 ; cf08
wcf09:: ds 1 ; cf09
wcf0a:: ds 1 ; cf0a
wcf0b:: ds 1 ; cf0b
wcf0c:: ds 1 ; cf0c
wcf0d:: ds 1 ; cf0d
wcf0e:: ds 1 ; cf0e
wcf0f:: ds 1 ; cf0f
wcf10:: ds 1 ; cf10
wcf11:: ds 1 ; cf11
wcf12:: ds 1 ; cf12
wcf13:: ds 1 ; cf13
wcf14:: ds 1 ; cf14
wcf15:: ds 1 ; cf15
wcf16:: ds 1 ; cf16
wcf17:: ds 1 ; cf17
wcf18:: ds 1 ; cf18
wcf19:: ds 1 ; cf19
wcf1a:: ds 1 ; cf1a
wcf1b:: ds 1 ; cf1b
wcf1c:: ds 1 ; cf1c
wcf1d:: ds 1 ; cf1d
wcf1e:: ds 1 ; cf1e
wcf1f:: ds 1 ; cf1f
wcf20:: ds 1 ; cf20
wcf21:: ds 1 ; cf21
wcf22:: ds 1 ; cf22
wcf23:: ds 1 ; cf23
wcf24:: ds 1 ; cf24
wcf25:: ds 1 ; cf25
wcf26:: ds 1 ; cf26
wcf27:: ds 1 ; cf27
wcf28:: ds 1 ; cf28
wcf29:: ds 1 ; cf29
wcf2a:: ds 1 ; cf2a
wcf2b:: ds 1 ; cf2b
wTempTrainerHeader::
wcf2c:: ds 1 ; cf2c
wcf2d:: ds 1 ; cf2d
wcf2e:: ds 1 ; cf2e
wcf2f:: ds 1 ; cf2f
wcf30:: ds 1 ; cf30
wcf31:: ds 1 ; cf31
wWinTextPointer:: dw ; cf32
wLossTextPointer:: dw ; cf34
wcf36:: ds 1 ; cf36
wcf37:: ds 1 ; cf37
wcf38:: ds 1 ; cf38
wTempTrainerHeaderEnd::
wcf39:: ds 1 ; cf39
wcf3a:: ds 1 ; cf3a
wcf3b:: ds 1 ; cf3b
wcf3c:: ds 1 ; cf3c
wcf3d:: ds 1 ; cf3d
wcf3e:: ds 1 ; cf3e
wcf3f:: ds 1 ; cf3f
wcf40:: ds 1 ; cf40
wcf41:: ds 1 ; cf41
wcf42:: ds 1 ; cf42
wBGP:: ds 1
wOBP0:: ds 1
wOPB1:: ds 1
wcf46:: ds 1 ; cf46
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
	ds 15
wCurBattleMon:: ds 1 ; cfc6
wcfc7:: ds 1 ; cfc7
wcfc8:: ds 1 ; cfc8
wPartyMenuCursor:: ds 1 ; cfc9
ENDU

wcfca:: ds 1 ; cfca
wcfcb:: ds 1 ; cfcb
wcfcc:: ds 1 ; cfcc
wcfcd:: ds 1 ; cfcd
wcfce:: ds 1 ; cfce
wcfcf:: ds 1 ; cfcf
wcfd0:: ds 1 ; cfd0
wcfd1:: ds 1 ; cfd1
wcfd2:: ds 1 ; cfd2
wcfd3:: ds 1 ; cfd3
wcfd4:: ds 1 ; cfd4
wcfd5:: ds 1 ; cfd5
wcfd6:: ds 1 ; cfd6
wcfd7:: ds 1 ; cfd7
wcfd8:: ds 1 ; cfd8
wcfd9:: ds 1 ; cfd9
wcfda:: ds 1 ; cfda
wPredefID:: ds 1 ; cfdb
wPredefHLBuffer:: dw ; cfdc
wPredefPointerBuffer:: dw ; cfde
wFarCallBCBuffer:: dw ; cfe0
wcfe2:: ds 1 ; cfe2
wcfe3:: ds 1 ; cfe3
wFieldMoveSucceeded:: ds 1 ; cfe4
wVramState:: ds 1
wcfe6:: ds 1 ; cfe6
wcfe7:: ds 1 ; cfe7
wcfe8:: ds 1 ; cfe8
wBattleResult:: ds 1 ; cfe9
wcfea:: ds 1 ; cfea
wUsingItemWithSelect:: ds 1 ; cfeb
wcfec:: ds 1 ; cfec
wcfed:: ds 1 ; cfed
wcfee:: ds 1 ; cfee
wcfef:: ds 1 ; cfef
wcff0:: ds 1 ; cff0
wcff1:: ds 1 ; cff1
wcff2:: ds 1 ; cff2
wcff3:: ds 1 ; cff3
wcff4:: ds 1 ; cff4
wcff5:: ds 1 ; cff5
wcff6:: ds 1 ; cff6
wcff7:: ds 1 ; cff7
wcff8:: ds 1 ; cff8
wcff9:: ds 1 ; cff9
wcffa:: ds 1 ; cffa
wcffb:: ds 1 ; cffb
wcffc:: ds 1 ; cffc
wcffd:: ds 1 ; cffd
wcffe:: ds 1 ; cffe
wcfff:: ds 1 ; cfff

SECTION "WRAM1", WRAMX, BANK[$1]
wd000:: ds 1 ; d000
wd001:: ds 1 ; d001
wd002:: ds 1 ; d002
wd003:: ds 1 ; d003

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
wNextWarpNumber:: ds 1 ; d043
wNextMapGroup:: ds 1 ; d044
wNextMapNumber:: ds 1 ; d045
wPrevWarpNumber:: ds 1 ; d046
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
wd05a:: ds 1 ; d05a
wd05b:: ds 1 ; d05b
wd05c:: ds 1 ; d05c

wUsedSprites:: ds SPRITE_GFX_LIST_CAPACITY ; d05d

wOverworldMapAnchor:: dw ; d07d

wd07f:: ds 1 ; d07f
wd080:: ds 1 ; d080
wd081:: ds 1 ; d081
wd082:: ds 1 ; d082
wPermission:: ds 1 ; d083
wd084:: ds 1 ; d084
wd085:: ds 1 ; d085
wMapBorderBlock:: ds 1 ; d086
wd087:: ds 1 ; d087
wMapWidth:: ds 1 ; d088
wd089:: ds 1 ; d089
wd08a:: ds 1 ; d08a
wd08b:: ds 1 ; d08b
wd08c:: ds 1 ; d08c
wd08d:: ds 1 ; d08d
wd08e:: ds 1 ; d08e
wd08f:: ds 1 ; d08f
wd090:: ds 1 ; d090
wd091:: ds 1 ; d091
wd092:: ds 1 ; d092
wd093:: ds 1 ; d093
wd094:: ds 1 ; d094
wd095:: ds 1 ; d095
wd096:: ds 1 ; d096
wd097:: ds 1 ; d097
wd098:: ds 1 ; d098
wd099:: ds 1 ; d099
wd09a:: ds 1 ; d09a
wd09b:: ds 1 ; d09b
wd09c:: ds 1 ; d09c
wd09d:: ds 1 ; d09d
wd09e:: ds 1 ; d09e
wd09f:: ds 1 ; d09f
wd0a0:: ds 1 ; d0a0
wd0a1:: ds 1 ; d0a1
wd0a2:: ds 1 ; d0a2
wd0a3:: ds 1 ; d0a3
wd0a4:: ds 1 ; d0a4
wd0a5:: ds 1 ; d0a5
wd0a6:: ds 1 ; d0a6
wd0a7:: ds 1 ; d0a7
wd0a8:: ds 1 ; d0a8
wd0a9:: ds 1 ; d0a9
wd0aa:: ds 1 ; d0aa
wd0ab:: ds 1 ; d0ab
wd0ac:: ds 1 ; d0ac
wd0ad:: ds 1 ; d0ad
wd0ae:: ds 1 ; d0ae
wd0af:: ds 1 ; d0af
wd0b0:: ds 1 ; d0b0
wd0b1:: ds 1 ; d0b1
wd0b2:: ds 1 ; d0b2
wd0b3:: ds 1 ; d0b3
wd0b4:: ds 1 ; d0b4
wd0b5:: ds 1 ; d0b5
wd0b6:: ds 1 ; d0b6
wd0b7:: ds 1 ; d0b7
wd0b8:: ds 1 ; d0b8
wd0b9:: ds 1 ; d0b9
wd0ba:: ds 1 ; d0ba
wd0bb:: ds 1 ; d0bb
wd0bc:: ds 1 ; d0bc
wd0bd:: ds 1 ; d0bd
wd0be:: ds 1 ; d0be
wd0bf:: ds 1 ; d0bf
wd0c0:: ds 1 ; d0c0
wd0c1:: ds 1 ; d0c1
wd0c2:: ds 1 ; d0c2
wd0c3:: ds 1 ; d0c3
wd0c4:: ds 1 ; d0c4
wTilesetBlocksBank:: ds 1 ; d0c5
wTilesetBlocksAddress:: dw ; d0c6
wd0c8:: ds 1 ; d0c8
wd0c9:: ds 1 ; d0c9
wd0ca:: ds 1 ; d0ca
wd0cb:: ds 1 ; d0cb
wd0cc:: ds 1 ; d0cc
wd0cd:: ds 1 ; d0cd
wd0ce:: ds 1 ; d0ce
wTilesetPalettes:: dw ; d0cf
wd0d1:: ds 1 ; d0d1
wd0d2:: ds 1 ; d0d2

UNION
wCurHPAnim::
wCurHPAnimMaxHP::   dw ; d0d3
wCurHPAnimOldHP::   dw ; d0d5
wCurHPAnimNewHP::   dw ; d0d7
wCurHPAnimPal::     db ; d0d9
wCurHPBarPixels::   db ; d0da
wNewHPBarPixels::   db ; d0db
wCurHPAnimDeltaHP:: dw ; d0dc
wCurHPAnimLowHP::   db ; d0de
wCurHPAnimHighHP::  db ; d0df
wCurHPAnimEnd::
NEXTU

wBuffer1:: ds 1 ; d0d3
wBuffer2:: ds 1 ; d0d4
wBuffer3:: ds 1 ; d0d5
wBuffer4:: ds 1 ; d0d6
wBuffer5:: ds 1 ; d0d7
wBuffer6:: ds 1 ; d0d8
wd0d9:: ds 1 ; d0d9
wd0da:: ds 1 ; d0da
wd0db:: ds 1 ; d0db
wLinkBuffer:: ds 1 ; d0dc
wd0dd:: ds 1 ; d0dd
wd0de:: ds 1 ; d0de
wd0df:: ds 1 ; d0df
ENDU
wd0e0:: ds 1 ; d0e0
wd0e1:: ds 1 ; d0e1
wd0e2:: ds 1 ; d0e2
wd0e3:: ds 1 ; d0e3
wd0e4:: ds 1 ; d0e4
wd0e5:: ds 1 ; d0e5
wd0e6:: ds 1 ; d0e6
wd0e7:: ds 1 ; d0e7
wd0e8:: ds 1 ; d0e8
wd0e9:: ds 1 ; d0e9
wd0ea:: ds 1 ; d0ea
wd0eb:: ds 1 ; d0eb
wd0ec:: ds 1 ; d0ec
wTempEnemyMonSpecies:: ds 1 ; d0ed
wd0ee:: ds 1 ; d0ee

wEnemyMon:: battle_struct wEnemyMon ; d0ef

wd10f:: ds 1 ; d10f
wd110:: ds 1 ; d110
wd111:: ds 1 ; d111
wd112:: ds 1 ; d112
wd113:: ds 1 ; d113
wd114:: ds 1 ; d114
wd115:: ds 1 ; d115
wBattleMode:: ds 1 ; d116
wd117:: ds 1 ; d117

wOtherTrainerClass:: ; d118
; class (Youngster, Bug Catcher, etc.) of opposing trainer
; 0 if opponent is a wild Pokémon, not a trainer
	db

wBattleType:: ds 1 ; d119
wd11a:: ds 1 ; d11a
wd11b:: ds 1 ; d11b
wd11c:: ds 1 ; d11c
wTrainerClass:: ds 1 ; d11d
wd11e:: ds 1 ; d11e
wd11f:: ds 1 ; d11f

wBaseData:: ; d120
wd120:: ds 1 ; d120
wd121:: ds 1 ; d121
wd122:: ds 1 ; d122
wd123:: ds 1 ; d123
wd124:: ds 1 ; d124
wd125:: ds 1 ; d125
wd126:: ds 1 ; d126
wd127:: ds 1 ; d127
wd128:: ds 1 ; d128
wd129:: ds 1 ; d129
wd12a:: ds 1 ; d12a
wd12b:: ds 1 ; d12b
wd12c:: ds 1 ; d12c
wd12d:: ds 1 ; d12d
wd12e:: ds 1 ; d12e
wBaseEggSteps:: db ; d12f
wd130:: ds 1 ; d130
wd131:: ds 1 ; d131
wd132:: ds 1 ; d132
wd133:: ds 1 ; d133
wd134:: ds 1 ; d134
wd135:: ds 1 ; d135
wd136:: ds 1 ; d136
wd137:: ds 1 ; d137
wd138:: ds 1 ; d138
wd139:: ds 1 ; d139
wd13a:: ds 1 ; d13a
wd13b:: ds 1 ; d13b
wd13c:: ds 1 ; d13c
wd13d:: ds 1 ; d13d
wd13e:: ds 1 ; d13e
wd13f:: ds 1 ; d13f
wBaseDataEnd::

wd140:: ds 1 ; d140
wCurDamage:: ds 2 ; d141
wd143:: ds 1 ; d143
wd144:: ds 1 ; d144
wd145:: ds 1 ; d145
wd146:: ds 1 ; d146
wd147:: ds 1 ; d147
wd148:: ds 1 ; d148
wd149:: ds 1 ; d149
wd14a:: ds 1 ; d14a
wd14b:: ds 1 ; d14b
wd14c:: ds 1 ; d14c
wd14d:: ds 1 ; d14d
wd14e:: ds 1 ; d14e
wWildMon:: ds 1 ; d14f
wd150:: ds 1 ; d150
wTempNumBuffer::
wNamedObjectIndexBuffer::
wDeciramBuffer::
wBreedingCompatibility::
wd151:: ds 1 ; d151
wd152:: ds 1 ; d152
wd153:: ds 1 ; d153
wd154:: ds 1 ; d154
wROMBankBackup:: ds 1 ; d155
wBuffer:: ds 1 ; d156
wTimeOfDay:: ds 1 ; d157
wd158:: ds 1 ; d158
wd159:: ds 1 ; d159
wd15a:: ds 1 ; d15a
wd15b:: ds 1 ; d15b
wd15c:: ds 1 ; d15c
wd15d:: ds 1 ; d15d
wd15e:: ds 1 ; d15e
wd15f:: ds 1 ; d15f
wScriptBank:: ds 1 ; d160
wd161:: ds 1 ; d161
wd162:: ds 1 ; d162
wd163:: ds 1 ; d163
wd164:: ds 1 ; d164
wd165:: ds 1 ; d165
wd166:: ds 1 ; d166
wd167:: ds 1 ; d167
wd168:: ds 1 ; d168
wd169:: ds 1 ; d169
wd16a:: ds 1 ; d16a
wd16b:: ds 1 ; d16b
wd16c:: ds 1 ; d16c
wd16d:: ds 1 ; d16d
wd16e:: ds 1 ; d16e
wd16f:: ds 1 ; d16f
wd170:: ds 1 ; d170
wd171:: ds 1 ; d171
wd172:: ds 1 ; d172
wScriptVar:: ds 1 ; d173
wd174:: ds 1 ; d174
wd175:: ds 1 ; d175
wd176:: ds 1 ; d176
wd177:: ds 1 ; d177
wd178:: ds 1 ; d178
wd179:: ds 1 ; d179
wd17a:: ds 1 ; d17a
wd17b:: ds 1 ; d17b
wd17c:: ds 1 ; d17c
wd17d:: ds 1 ; d17d
wd17e:: ds 1 ; d17e
wd17f:: ds 1 ; d17f
wd180:: ds 1 ; d180
wd181:: ds 1 ; d181
wd182:: ds 1 ; d182
wd183:: ds 1 ; d183
wd184:: ds 1 ; d184
wd185:: ds 1 ; d185
wd186:: ds 1 ; d186
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
wTextBoxFrame:: ; d19b
; bits 0-2: textbox frame 0-7
	ds 1

wTextBoxFlags:: ; d19c
; bit 0: 1-frame text delay
; bit 1: when unset, no text delay
	ds 1
wGBPrinter:: ; d19d
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
wPlayerID:: dw ; d1a1

wPlayerName:: ds NAME_LENGTH ; d1a3
wMomsName:: ds NAME_LENGTH ; d1ae
wRivalName:: ds NAME_LENGTH ; d1b9
wRedsName:: ds NAME_LENGTH ; d1c4
wGreensName:: ds NAME_LENGTH ; d1cf

wSavedAtLeastOnce:: ds 1 ; d1da
wd1db:: ds 1 ; d1db
wd1dc:: ds 1 ; d1dc
wd1dd:: ds 1 ; d1dd
wd1de:: ds 1 ; d1de
wd1df:: ds 1 ; d1df
wd1e0:: ds 1 ; d1e0
wd1e1:: ds 1 ; d1e1
wd1e2:: ds 1 ; d1e2
wd1e3:: ds 1 ; d1e3
wd1e4:: ds 1 ; d1e4
wd1e5:: ds 1 ; d1e5
wd1e6:: ds 1 ; d1e6
wd1e7:: ds 1 ; d1e7
wd1e8:: ds 1 ; d1e8
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
	object_struct wPlayer ; d1fd
	object_struct wObject1 ; d225
	object_struct wObject2 ; d24d
	object_struct wObject3 ; d275
	object_struct wObject4 ; d29d
	object_struct wObject5 ; d2c5
	object_struct wObject6 ; d2ed
	object_struct wObject7 ; d315
	object_struct wObject8 ; d33d
	object_struct wObject9 ; d365
	object_struct wObject10 ; d38d
	object_struct wObject11 ; d3b5
	object_struct wObject12 ; d3dd
wObjectStructsEnd:: ; d405

wCmdQueue:: ds CMDQUEUE_CAPACITY * CMDQUEUE_ENTRY_SIZE ; d405
; d41d

	ds 40

; TODO these should be wMapObject1 etc.
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

wd545:: ds 1 ; d545
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
wd555:: ds 1 ; d555
wd556:: ds 1 ; d556
wd557:: ds 1 ; d557
wd558:: ds 1 ; d558
wd559:: ds 1 ; d559
wd55a:: ds 1 ; d55a
wd55b:: ds 1 ; d55b
wd55c:: ds 1 ; d55c
wd55d:: ds 1 ; d55d
wd55e:: ds 1 ; d55e
wd55f:: ds 1 ; d55f
wd560:: ds 1 ; d560
wd561:: ds 1 ; d561
wd562:: ds 1 ; d562
wd563:: ds 1 ; d563
wd564:: ds 1 ; d564
wd565:: ds 1 ; d565
wd566:: ds 1 ; d566
wd567:: ds 1 ; d567
wTimeOfDayPal:: ds 1
wd569:: ds 1 ; d569
wd56a:: ds 1 ; d56a
wd56b:: ds 1 ; d56b
wd56c:: ds 1 ; d56c
wd56d:: ds 1 ; d56d
wd56e:: ds 1 ; d56e
wd56f:: ds 1 ; d56f
wd570:: ds 1 ; d570
wStatusFlags:: ds 1 ; d571
wStatusFlags2:: ds 1 ; d572
wMoney:: ds 3 ; d573
wd576:: ds 1 ; d576
wd577:: ds 1 ; d577
wd578:: ds 1 ; d578
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

wPCItems:: ds MAX_PC_ITEMS * 2 + 1 ; d616
wPCItemsEnd::

	ds 1

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

wd683:: ds 1 ; d683
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

; some of these are probably wrong
; TODO rename to SceneID
wPokecenter2FTrigger::                       ds 1 ; d6b7
wTradeCenterTrigger::                        ds 1 ; d6b8
wColosseumTrigger::                          ds 1 ; d6b9
wTimeCapsuleTrigger::                        ds 1 ; d6ba
wPowerPlantTrigger::                         ds 1 ; d6bb
wCeruleanGymTrigger::                        ds 1 ; d6bc
wRoute25Trigger::                            ds 1 ; d6bd
wTrainerHouseB1FTrigger::                    ds 1 ; d6be
wVictoryRoadGateTrigger::                    ds 1 ; d6bf
wSaffronTrainStationTrigger::                ds 1 ; d6c0
wRoute16GateTrigger::                        ds 1 ; d6c1
wRoute1718GateTrigger::                      ds 1 ; d6c2
wIndigoPlateauPokecenter1FTrigger::          ds 1 ; d6c3
wWillsRoomTrigger::                          ds 1 ; d6c4
wKogasRoomTrigger::                          ds 1 ; d6c5
wBrunosRoomTrigger::                         ds 1 ; d6c6
wKarensRoomTrigger::                         ds 1 ; d6c7
wLancesRoomTrigger::                         ds 1 ; d6c8
wHallOfFameTrigger::                         ds 1 ; d6c9
wRoute27Trigger::                            ds 1 ; d6ca
wNewBarkTownTrigger::                        ds 1 ; d6cb
wElmsLabTrigger::                            ds 1 ; d6cc
wKrissHouse1FTrigger::                       ds 1 ; d6cd
wRoute29Trigger::                            ds 1 ; d6ce
wCherrygroveCityTrigger::                    ds 1 ; d6cf
wMrPokemonsHouseTrigger::                    ds 1 ; d6d0
wRoute32Trigger::                            ds 1 ; d6d1
wRoute35NationalParkGateTrigger::            ds 1 ; d6d2
wRoute36NationalParkGateTrigger::            ds 1 ; d6d3
wAzaleaTownTrigger::                         ds 1 ; d6d4
wGoldenrodGymTrigger::                       ds 1 ; d6d5
wGoldenrodMagnetTrainStationTrigger::        ds 1 ; d6d6
wOlivineCityTrigger::                        ds 1 ; d6d7
wRoute34Trigger::                            ds 1 ; d6d8
wEcruteakHouseTrigger::                      ds 1 ; d6d9
wEcruteakPokecenter1FTrigger::               ds 1 ; d6da
wMahoganyTownTrigger::                       ds 1 ; d6db
wRoute43GateTrigger::                        ds 1 ; d6dc
wMountMoonTrigger::                          ds 1 ; d6dd
wSproutTower3FTrigger::                      ds 1 ; d6de
wBurnedTower1FTrigger::                      ds 1 ; d6df
wBurnedTowerB1FTrigger::                     ds 1 ; d6e0
wd6e1:: ds 1 ; d6e1
wd6e2:: ds 1 ; d6e2
wd6e3:: ds 1 ; d6e3
wd6e4:: ds 1 ; d6e4
wd6e5:: ds 1 ; d6e5
wd6e6:: ds 1 ; d6e6
wd6e7:: ds 1 ; d6e7
wd6e8:: ds 1 ; d6e8
wd6e9:: ds 1 ; d6e9
wd6ea:: ds 1 ; d6ea
wd6eb:: ds 1 ; d6eb
wd6ec:: ds 1 ; d6ec
wd6ed:: ds 1 ; d6ed
wd6ee:: ds 1 ; d6ee
wd6ef:: ds 1 ; d6ef
wd6f0:: ds 1 ; d6f0
wd6f1:: ds 1 ; d6f1
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
wd8ba:: ds 1 ; d8ba
wd8bb:: ds 1 ; d8bb
wCurBox:: ds 1 ; d8bc

	ds 2

; 8 chars + $50
wBoxNames:: ds BOX_NAME_LENGTH * NUM_BOXES ; d8bf

wd93d:: ds 1 ; d93d
wd93e:: ds 1 ; d93e
wBikeFlags:: ds 1 ; d93f
wd940:: ds 1 ; d940
wCurrentMapTriggerPointer:: dw ; d941
wd943:: ds 1 ; d943
wd944:: ds 1 ; d944
wCurrMapWarpCount:: ds 1 ; d945
wCurrMapWarpHeaderPointer:: dw ; d946
wd948:: ds 1 ; d948
wd949:: ds 1 ; d949
wd94a:: ds 1 ; d94a
wd94b:: ds 1 ; d94b
wd94c:: ds 1 ; d94c
wd94d:: ds 1 ; d94d
wd94e:: ds 1 ; d94e
wd94f:: ds 1 ; d94f
wd950:: ds 1 ; d950
wd951:: ds 1 ; d951
wd952:: ds 1 ; d952
wd953:: ds 1 ; d953
wd954:: ds 1 ; d954
wd955:: ds 1 ; d955
wd956:: ds 1 ; d956
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
wDailyFlags:: ds 1 ; d968
wWeeklyFlags:: ds 1 ; d969
wd96a:: ds 1 ; d96a
wd96b:: ds 1 ; d96b
wd96c:: ds 1 ; d96c
wStartDay:: ds 1 ; d96d
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
wd9bd:: ds 1 ; d9bd
wd9be:: ds 1 ; d9be
wd9bf:: ds 1 ; d9bf
wd9c0:: ds 1 ; d9c0
wd9c1:: ds 1 ; d9c1
wd9c2:: ds 1 ; d9c2
wParkBalls:: ds 1 ; d9c3
wd9c4:: ds 1 ; d9c4
wd9c5:: ds 1 ; d9c5
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
wd9e9:: ds 1 ; d9e9
wd9ea:: ds 1 ; d9ea
wRepelSteps:: ds 1 ; d9eb
wd9ec:: ds 1 ; d9ec
wd9ed:: ds 1 ; d9ed

wMapData::
wVisitedSpawns:: ds 4 ; flag_array NUM_SPAWNS ; d9ee

	warp_struct wDig ; d9f2
wd9f5:: ds 1 ; d9f5
wd9f6:: ds 1 ; d9f6
wd9f7:: ds 1 ; d9f7
wd9f8:: ds 1 ; d9f8
wd9f9:: ds 1 ; d9f9
wd9fa:: ds 1 ; d9fa
wd9fb:: ds 1 ; d9fb
wd9fc:: ds 1 ; d9fc
wd9fd:: ds 1 ; d9fd
wd9fe:: ds 1 ; d9fe
wd9ff:: ds 1 ; d9ff

wMapGroup:: ds 1 ; da00
wMapNumber:: ds 1 ; da01
wYCoord:: ds 1 ; da02
wXCoord:: ds 1 ; da03
wda04:: ds 1 ; da04
wda05:: ds 1 ; da05
wda06:: ds 1 ; da06
wda07:: ds 1 ; da07
wda08:: ds 1 ; da08
wda09:: ds 1 ; da09
wda0a:: ds 1 ; da0a
wda0b:: ds 1 ; da0b
wda0c:: ds 1 ; da0c
wda0d:: ds 1 ; da0d
wda0e:: ds 1 ; da0e
wda0f:: ds 1 ; da0f
wda10:: ds 1 ; da10
wda11:: ds 1 ; da11
wda12:: ds 1 ; da12
wda13:: ds 1 ; da13
wda14:: ds 1 ; da14
wda15:: ds 1 ; da15
wda16:: ds 1 ; da16
wda17:: ds 1 ; da17
wda18:: ds 1 ; da18
wda19:: ds 1 ; da19
wda1a:: ds 1 ; da1a
wda1b:: ds 1 ; da1b
wda1c:: ds 1 ; da1c
wda1d:: ds 1 ; da1d
wda1e:: ds 1 ; da1e
wda1f:: ds 1 ; da1f
wda20:: ds 1 ; da20
wda21:: ds 1 ; da21

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
wPokedexSeen::   flag_array NUM_POKEMON ; dc04

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

wdd40:: ds 1 ; dd40
wdd41:: ds 1 ; dd41
wdd42:: ds 1 ; dd42
wdd43:: ds 1 ; dd43
wdd44:: ds 1 ; dd44
wdd45:: ds 1 ; dd45
wdd46:: ds 1 ; dd46
wdd47:: ds 1 ; dd47
wdd48:: ds 1 ; dd48
wdd49:: ds 1 ; dd49
wdd4a:: ds 1 ; dd4a
wdd4b:: ds 1 ; dd4b
wdd4c:: ds 1 ; dd4c
wdd4d:: ds 1 ; dd4d
wdd4e:: ds 1 ; dd4e
wdd4f:: ds 1 ; dd4f
wdd50:: ds 1 ; dd50
wdd51:: ds 1 ; dd51
wdd52:: ds 1 ; dd52
wdd53:: ds 1 ; dd53
wdd54:: ds 1 ; dd54

SECTION "OT Party", WRAMX, BANK[1]

wOTPartyCount:: ds 1 ; dd55
wOTPartySpecies:: ds PARTY_LENGTH ; dd56
wOTPartySpeciesEnd:: ds 1 ; dd5c

; The tutorial pack uses the OT party space.
; It's placed here rather than at wOTPartyCount
; to avoid confusing the game.

UNION
wDudePack::
wDudeNumItems:: ds 1 ; dd5d
wDudeItems:: ds 2 * 4 ; dd5e
wDudeItemsEnd:: ds 1 ; dd66

wDudeNumKeyItems:: ds 1 ; dd67
wDudeKeyItems:: ds 18 ; dd68
wDudeKeyItemsEnd:: ds 1 ; dd7a

wDudeNumBalls:: ds 1 ; dd7b
wDudeBalls:: ds 2 * 4 ; dd7c
wDudeBallsEnd:: ds 1 ; dd84
wDudePackEnd::
NEXTU

wOTPartyMons::
wOTPartyMon1:: party_struct wOTPartyMon1 ; dd5d
wOTPartyMon2:: party_struct wOTPartyMon2 ; dd8d
wOTPartyMon3:: party_struct wOTPartyMon3 ; ddbd
wOTPartyMon4:: party_struct wOTPartyMon4 ; dded
wOTPartyMon5:: party_struct wOTPartyMon5 ; de1d
wOTPartyMon6:: party_struct wOTPartyMon6 ; de4d

wOTPartyMonOT::
wOTPartyMon1OT:: ds NAME_LENGTH ; de7d
wOTPartyMon2OT:: ds NAME_LENGTH ; de88
wOTPartyMon3OT:: ds NAME_LENGTH ; de93
wOTPartyMon4OT:: ds NAME_LENGTH ; de9e
wOTPartyMon5OT:: ds NAME_LENGTH ; dea9
wOTPartyMon6OT:: ds NAME_LENGTH ; deb4

wOTPartyMonNicknames::
wOTPartyMon1Nickname:: ds MON_NAME_LENGTH ; debf
wOTPartyMon2Nickname:: ds MON_NAME_LENGTH ; deca
wOTPartyMon3Nickname:: ds MON_NAME_LENGTH ; ded5
wOTPartyMon4Nickname:: ds MON_NAME_LENGTH ; dee0
wOTPartyMon5Nickname:: ds MON_NAME_LENGTH ; deeb
wOTPartyMon6Nickname:: ds MON_NAME_LENGTH ; def6
ENDU

wGameDataEnd::

SECTION "Stack", WRAMX, BANK[1]

wStackTop::
	ds 1

INCLUDE "sram.asm"
