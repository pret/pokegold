MACRO spriteanimoam
; vtile offset, data pointer
	db \1
	dw \2
ENDM

SpriteAnimOAMData:
; entries correspond to SPRITE_ANIM_OAMSET_* constants (see constants/sprite_anim_constants.asm)
	table_width 3
	spriteanimoam $00, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_RED_WALK_1
	spriteanimoam $04, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_RED_WALK_2
	spriteanimoam $4c, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_INTRO_BUBBLE_1
	spriteanimoam $5c, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_INTRO_BUBBLE_2
	spriteanimoam $6c, .OAMData_GSIntroShellder          ; SPRITE_ANIM_OAMSET_GS_INTRO_SHELLDER_1
	spriteanimoam $6e, .OAMData_GSIntroShellder          ; SPRITE_ANIM_OAMSET_GS_INTRO_SHELLDER_2
	spriteanimoam $2d, .OAMData_GSIntroMagikarp          ; SPRITE_ANIM_OAMSET_GS_INTRO_MAGIKARP_1
	spriteanimoam $4d, .OAMData_GSIntroMagikarp          ; SPRITE_ANIM_OAMSET_GS_INTRO_MAGIKARP_2
	spriteanimoam $60, .OAMData_UnusedIntroAerodactyl    ; SPRITE_ANIM_OAMSET_UNUSED_INTRO_AERODACTYL
	spriteanimoam $00, .OAMData_GSIntroLapras1           ; SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_1
	spriteanimoam $00, .OAMData_GSIntroLapras2           ; SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_2
	spriteanimoam $06, .OAMData_GSIntroLapras3           ; SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_3
	spriteanimoam $0c, .OAMData_GSIntroNote              ; SPRITE_ANIM_OAMSET_GS_INTRO_NOTE
	spriteanimoam $0d, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_INTRO_INVISIBLE_NOTE
	spriteanimoam $00, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_1
	spriteanimoam $04, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_2
	spriteanimoam $08, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_3
	spriteanimoam $40, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_1
	spriteanimoam $44, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_2
	spriteanimoam $48, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_3
	spriteanimoam $4c, .OAMData_GSIntroJigglypuffPikachu ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_4
	spriteanimoam $80, .OAMData_GSIntroPikachuTail       ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_1
	spriteanimoam $85, .OAMData_GSIntroPikachuTail       ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_2
	spriteanimoam $8a, .OAMData_GSIntroPikachuTail       ; SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_3
	spriteanimoam $00, .OAMData_GSIntroSmallFireball     ; SPRITE_ANIM_OAMSET_GS_INTRO_SMALL_FIREBALL
	spriteanimoam $01, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_GS_INTRO_MED_FIREBALL
	spriteanimoam $09, .OAMData_GSIntroBigFireball       ; SPRITE_ANIM_OAMSET_GS_INTRO_BIG_FIREBALL
	spriteanimoam $10, .OAMData_GSIntroStarter           ; SPRITE_ANIM_OAMSET_GS_INTRO_CHIKORITA
	spriteanimoam $29, .OAMData_GSIntroStarter           ; SPRITE_ANIM_OAMSET_GS_INTRO_CYNDAQUIL
	spriteanimoam $42, .OAMData_GSIntroStarter           ; SPRITE_ANIM_OAMSET_GS_INTRO_TOTODILE
	spriteanimoam $f8, .OAMData_GSTitleTrail             ; SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_1
	spriteanimoam $fa, .OAMData_GSTitleTrail             ; SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_2
	spriteanimoam $00, .OAMData_TextEntryCursor          ; SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR
	spriteanimoam $00, .OAMData_TextEntryCursorBig       ; SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG
	spriteanimoam $00, .OAMData_GSGameFreakLogo          ; SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO
	spriteanimoam $0f, .OAMData_GSGameFreakLogoStar      ; SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_STAR
	spriteanimoam $11, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_1
	spriteanimoam $12, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_2
	spriteanimoam $13, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_3
	spriteanimoam $00, .OAMData_SlotsGolem               ; SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1
	spriteanimoam $08, .OAMData_SlotsGolem               ; SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2
	spriteanimoam $10, .OAMData_SlotsChansey1            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1
	spriteanimoam $10, .OAMData_SlotsChansey2            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_2
	spriteanimoam $10, .OAMData_SlotsChansey3            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_3
	spriteanimoam $10, .OAMData_SlotsChansey4            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4
	spriteanimoam $10, .OAMData_SlotsChansey5            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_5
	spriteanimoam $3a, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_SLOTS_EGG
	spriteanimoam $00, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_STILL_CURSOR
	spriteanimoam $00, .OAMData_TradePokeBall1           ; SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1
	spriteanimoam $02, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2
	spriteanimoam $06, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADE_POOF_1
	spriteanimoam $0a, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADE_POOF_2
	spriteanimoam $0e, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADE_POOF_3
	spriteanimoam $12, .OAMData_TradeTubeBulge           ; SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_1
	spriteanimoam $13, .OAMData_TradeTubeBulge           ; SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_2
	spriteanimoam $00, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_TRADEMON_ICON_1
	spriteanimoam $04, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_TRADEMON_ICON_2
	spriteanimoam $10, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE
	spriteanimoam $00, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1
	spriteanimoam $04, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2
	spriteanimoam $00, .OAMData_RadioTuningKnob          ; SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB
	spriteanimoam $00, .OAMData_PartyMonWithMail1        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1
	spriteanimoam $00, .OAMData_PartyMonWithMail2        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2
	spriteanimoam $00, .OAMData_PartyMonWithItem1        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1
	spriteanimoam $00, .OAMData_PartyMonWithItem2        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2
	spriteanimoam $00, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1
	spriteanimoam $04, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2
	spriteanimoam $00, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_43
	spriteanimoam $30, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_44
	spriteanimoam $03, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_45
	spriteanimoam $33, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_46
	spriteanimoam $06, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_47
	spriteanimoam $36, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_48
	spriteanimoam $09, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_49
	spriteanimoam $39, .OAMData_Unused43_4A              ; SPRITE_ANIM_OAMSET_UNUSED_4A
	spriteanimoam $0c, .OAMData_Unused4B                 ; SPRITE_ANIM_OAMSET_UNUSED_4B
	spriteanimoam $0c, .OAMData_Unused4C                 ; SPRITE_ANIM_OAMSET_UNUSED_4C
	spriteanimoam $3c, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_UNUSED_4D
	spriteanimoam $3e, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_UNUSED_4E
	spriteanimoam $00, .OAMData_Leaf                     ; SPRITE_ANIM_OAMSET_LEAF
	spriteanimoam $00, .OAMData_Tree                     ; SPRITE_ANIM_OAMSET_TREE_1
	spriteanimoam $00, .OAMData_CutTree2                 ; SPRITE_ANIM_OAMSET_CUT_TREE_2
	spriteanimoam $00, .OAMData_CutTree3                 ; SPRITE_ANIM_OAMSET_CUT_TREE_3
	spriteanimoam $00, .OAMData_CutTree4                 ; SPRITE_ANIM_OAMSET_CUT_TREE_4
	spriteanimoam $00, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_EGG_CRACK
	spriteanimoam $01, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_EGG_HATCH
IF DEF(_GOLD)
	spriteanimoam $00, .OAMData_GSIntroHoOh1             ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_1
	spriteanimoam $00, .OAMData_GSIntroHoOh2             ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_2
	spriteanimoam $00, .OAMData_GSIntroHoOh3             ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_3
	spriteanimoam $00, .OAMData_GSIntroHoOh4             ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_4
	spriteanimoam $00, .OAMData_GSIntroHoOh5             ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_5
ELIF DEF(_SILVER)
	spriteanimoam $00, .OAMData_GSIntroLugia1            ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_1
	spriteanimoam $20, .OAMData_GSIntroLugia1            ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_2
	spriteanimoam $40, .OAMData_GSIntroLugia2            ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_3
	spriteanimoam $60, .OAMData_GSIntroLugia2            ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_4
	spriteanimoam $00, .OAMData_GSIntroLugia1            ; SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_5
ENDC
	spriteanimoam $04, .OAMData_Tree                     ; SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2
	assert_table_length NUM_SPRITE_ANIM_OAMSETS

.OAMData_1x1_Palette0:
	db 1
	dbsprite -1, -1,  4,  4, $00, 0

.OAMData_GSIntroShellder:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0
	dbsprite  0, -1,  0,  0, $01, 0
	dbsprite -1,  0,  0,  0, $10, 0
	dbsprite  0,  0,  0,  0, $11, 0

.OAMData_GSGameFreakLogoStar:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0
	dbsprite  0, -1,  0,  0, $00, 0 | OAM_XFLIP
	dbsprite -1,  0,  0,  0, $01, 0
	dbsprite  0,  0,  0,  0, $01, 0 | OAM_XFLIP

.OAMData_TradePokeBall1:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0 | OAM_PRIO
	dbsprite  0, -1,  0,  0, $00, 0 | OAM_XFLIP | OAM_PRIO
	dbsprite -1,  0,  0,  0, $01, 0 | OAM_PRIO
	dbsprite  0,  0,  0,  0, $01, 0 | OAM_XFLIP | OAM_PRIO

.OAMData_GSIntroSmallFireball:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0
	dbsprite  0, -1,  0,  0, $00, 0 | OAM_XFLIP
	dbsprite -1,  0,  0,  0, $00, 0 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP

.OAMData_TradeTubeBulge:
	db 4
	dbsprite -1, -1,  0,  0, $00, 7
	dbsprite  0, -1,  0,  0, $00, 7 | OAM_XFLIP
	dbsprite -1,  0,  0,  0, $00, 7 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $00, 7 | OAM_XFLIP | OAM_YFLIP

.OAMData_Unknown1: ; unreferenced
	db 4
	dbsprite -1, -1,  0,  0, $00, 0 | OAM_PRIO
	dbsprite  0, -1,  0,  0, $00, 0 | OAM_XFLIP | OAM_PRIO
	dbsprite -1,  0,  0,  0, $00, 0 | OAM_YFLIP | OAM_PRIO
	dbsprite  0,  0,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP | OAM_PRIO

.OAMData_TradePoofBubble:
	db 16
	dbsprite -2, -2,  0,  0, $00, 0
	dbsprite -1, -2,  0,  0, $01, 0
	dbsprite -2, -1,  0,  0, $02, 0
	dbsprite -1, -1,  0,  0, $03, 0
	dbsprite  0, -2,  0,  0, $01, 0 | OAM_XFLIP
	dbsprite  1, -2,  0,  0, $00, 0 | OAM_XFLIP
	dbsprite  0, -1,  0,  0, $03, 0 | OAM_XFLIP
	dbsprite  1, -1,  0,  0, $02, 0 | OAM_XFLIP
	dbsprite -2,  0,  0,  0, $02, 0 | OAM_YFLIP
	dbsprite -1,  0,  0,  0, $03, 0 | OAM_YFLIP
	dbsprite -2,  1,  0,  0, $00, 0 | OAM_YFLIP
	dbsprite -1,  1,  0,  0, $01, 0 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $03, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  1,  0,  0,  0, $02, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  0,  1,  0,  0, $01, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  1,  1,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP

.OAMData_GSIntroBigFireball:
	db 36
	dbsprite -3, -3,  0,  0, $00, 0
	dbsprite -2, -3,  0,  0, $01, 0
	dbsprite -1, -3,  0,  0, $02, 0
	dbsprite -3, -2,  0,  0, $03, 0
	dbsprite -2, -2,  0,  0, $04, 0
	dbsprite -1, -2,  0,  0, $05, 0
	dbsprite -3, -1,  0,  0, $06, 0
	dbsprite -2, -1,  0,  0, $05, 0
	dbsprite -1, -1,  0,  0, $05, 0
	dbsprite  0, -3,  0,  0, $02, 0 | OAM_XFLIP
	dbsprite  1, -3,  0,  0, $01, 0 | OAM_XFLIP
	dbsprite  2, -3,  0,  0, $00, 0 | OAM_XFLIP
	dbsprite  0, -2,  0,  0, $05, 0 | OAM_XFLIP
	dbsprite  1, -2,  0,  0, $04, 0 | OAM_XFLIP
	dbsprite  2, -2,  0,  0, $03, 0 | OAM_XFLIP
	dbsprite  0, -1,  0,  0, $05, 0 | OAM_XFLIP
	dbsprite  1, -1,  0,  0, $05, 0 | OAM_XFLIP
	dbsprite  2, -1,  0,  0, $06, 0 | OAM_XFLIP
	dbsprite -3,  0,  0,  0, $06, 0 | OAM_YFLIP
	dbsprite -2,  0,  0,  0, $05, 0 | OAM_YFLIP
	dbsprite -1,  0,  0,  0, $05, 0 | OAM_YFLIP
	dbsprite -3,  1,  0,  0, $03, 0 | OAM_YFLIP
	dbsprite -2,  1,  0,  0, $04, 0 | OAM_YFLIP
	dbsprite -1,  1,  0,  0, $05, 0 | OAM_YFLIP
	dbsprite -3,  2,  0,  0, $00, 0 | OAM_YFLIP
	dbsprite -2,  2,  0,  0, $01, 0 | OAM_YFLIP
	dbsprite -1,  2,  0,  0, $02, 0 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $05, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  1,  0,  0,  0, $05, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  2,  0,  0,  0, $06, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  0,  1,  0,  0, $05, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  1,  1,  0,  0, $04, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  2,  1,  0,  0, $03, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  0,  2,  0,  0, $02, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  1,  2,  0,  0, $01, 0 | OAM_XFLIP | OAM_YFLIP
	dbsprite  2,  2,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP

.OAMData_Unused43_4A:
	db 9
	dbsprite -2, -2,  4,  4, $00, 0
	dbsprite -1, -2,  4,  4, $01, 0
	dbsprite  0, -2,  4,  4, $02, 0
	dbsprite -2, -1,  4,  4, $10, 0
	dbsprite -1, -1,  4,  4, $11, 0
	dbsprite  0, -1,  4,  4, $12, 0
	dbsprite -2,  0,  4,  4, $20, 0
	dbsprite -1,  0,  4,  4, $21, 0
	dbsprite  0,  0,  4,  4, $22, 0

.OAMData_GSIntroJigglypuffPikachu:
	db 16
	dbsprite -2, -2,  0,  0, $00, 0
	dbsprite -1, -2,  0,  0, $01, 0
	dbsprite  0, -2,  0,  0, $02, 0
	dbsprite  1, -2,  0,  0, $03, 0
	dbsprite -2, -1,  0,  0, $10, 0
	dbsprite -1, -1,  0,  0, $11, 0
	dbsprite  0, -1,  0,  0, $12, 0
	dbsprite  1, -1,  0,  0, $13, 0
	dbsprite -2,  0,  0,  0, $20, 0
	dbsprite -1,  0,  0,  0, $21, 0
	dbsprite  0,  0,  0,  0, $22, 0
	dbsprite  1,  0,  0,  0, $23, 0
	dbsprite -2,  1,  0,  0, $30, 0
	dbsprite -1,  1,  0,  0, $31, 0
	dbsprite  0,  1,  0,  0, $32, 0
	dbsprite  1,  1,  0,  0, $33, 0

.OAMData_GSIntroStarter:
	db 25
	dbsprite -3, -3,  4,  4, $00, 0
	dbsprite -3, -2,  4,  4, $01, 0
	dbsprite -3, -1,  4,  4, $02, 0
	dbsprite -3,  0,  4,  4, $03, 0
	dbsprite -3,  1,  4,  4, $04, 0
	dbsprite -2, -3,  4,  4, $05, 0
	dbsprite -2, -2,  4,  4, $06, 0
	dbsprite -2, -1,  4,  4, $07, 0
	dbsprite -2,  0,  4,  4, $08, 0
	dbsprite -2,  1,  4,  4, $09, 0
	dbsprite -1, -3,  4,  4, $0a, 0
	dbsprite -1, -2,  4,  4, $0b, 0
	dbsprite -1, -1,  4,  4, $0c, 0
	dbsprite -1,  0,  4,  4, $0d, 0
	dbsprite -1,  1,  4,  4, $0e, 0
	dbsprite  0, -3,  4,  4, $0f, 0
	dbsprite  0, -2,  4,  4, $10, 0
	dbsprite  0, -1,  4,  4, $11, 0
	dbsprite  0,  0,  4,  4, $12, 0
	dbsprite  0,  1,  4,  4, $13, 0
	dbsprite  1, -3,  4,  4, $14, 0
	dbsprite  1, -2,  4,  4, $15, 0
	dbsprite  1, -1,  4,  4, $16, 0
	dbsprite  1,  0,  4,  4, $17, 0
	dbsprite  1,  1,  4,  4, $18, 0

.OAMData_Unknown2: ; unreferenced
	db 36
	dbsprite -3, -3,  0,  0, $00, 0
	dbsprite -2, -3,  0,  0, $01, 0
	dbsprite -1, -3,  0,  0, $02, 0
	dbsprite  0, -3,  0,  0, $03, 0
	dbsprite  1, -3,  0,  0, $04, 0
	dbsprite  2, -3,  0,  0, $05, 0
	dbsprite -3, -2,  0,  0, $06, 0
	dbsprite -2, -2,  0,  0, $07, 0
	dbsprite -1, -2,  0,  0, $08, 0
	dbsprite  0, -2,  0,  0, $09, 0
	dbsprite  1, -2,  0,  0, $0a, 0
	dbsprite  2, -2,  0,  0, $0b, 0
	dbsprite -3, -1,  0,  0, $0c, 0
	dbsprite -2, -1,  0,  0, $0d, 0
	dbsprite -1, -1,  0,  0, $0e, 0
	dbsprite  0, -1,  0,  0, $0f, 0
	dbsprite  1, -1,  0,  0, $10, 0
	dbsprite  2, -1,  0,  0, $11, 0
	dbsprite -3,  0,  0,  0, $12, 0
	dbsprite -2,  0,  0,  0, $13, 0
	dbsprite -1,  0,  0,  0, $14, 0
	dbsprite  0,  0,  0,  0, $15, 0
	dbsprite  1,  0,  0,  0, $16, 0
	dbsprite  2,  0,  0,  0, $17, 0
	dbsprite -3,  1,  0,  0, $18, 0
	dbsprite -2,  1,  0,  0, $19, 0
	dbsprite -1,  1,  0,  0, $1a, 0
	dbsprite  0,  1,  0,  0, $1b, 0
	dbsprite  1,  1,  0,  0, $1c, 0
	dbsprite  2,  1,  0,  0, $1d, 0
	dbsprite -3,  2,  0,  0, $1e, 0
	dbsprite -2,  2,  0,  0, $1f, 0
	dbsprite -1,  2,  0,  0, $20, 0
	dbsprite  0,  2,  0,  0, $21, 0
	dbsprite  1,  2,  0,  0, $22, 0
	dbsprite  2,  2,  0,  0, $23, 0

.OAMData_RedWalk:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $02, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_MagnetTrainRed:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED | OAM_PRIO
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED | OAM_PRIO
	dbsprite -1,  0,  0,  0, $02, PAL_OW_RED | OAM_PRIO
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED | OAM_PRIO

.OAMData_PartyMonWithMail1:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $08, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_PartyMonWithMail2:
	db 4
	dbsprite -1, -1,  0,  0, $04, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $05, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $08, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $07, PAL_OW_RED

.OAMData_PartyMonWithItem1:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $09, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_PartyMonWithItem2:
	db 4
	dbsprite -1, -1,  0,  0, $04, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $05, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $09, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $07, PAL_OW_RED

.OAMData_GSIntroMagikarp:
	db 6
	dbsprite -2, -1,  4,  0, $00, 1
	dbsprite -1, -1,  4,  0, $01, 1
	dbsprite  0, -1,  4,  0, $02, 1
	dbsprite -2,  0,  4,  0, $10, 1
	dbsprite -1,  0,  4,  0, $11, 1
	dbsprite  0,  0,  4,  0, $12, 1

.OAMData_UnusedIntroAerodactyl:
; These OAM sprite definitions, with the vtile offset $60 from SpriteAnimOAMData,
; correspond to unused Aerodactyl graphics in pokegold-spaceworld's gfx/intro/water_pokemon.png.
	db 10
	dbsprite -2, -2,  0,  4, $00, 0
	dbsprite -1, -2,  0,  4, $01, 0
	dbsprite  0, -2,  0,  4, $02, 0
	dbsprite  1, -2,  0,  4, $03, 0
	dbsprite -2, -1,  0,  4, $04, 0
	dbsprite -1, -1,  0,  4, $05, 0
	dbsprite  0, -1,  0,  4, $06, 0
	dbsprite -2,  0,  0,  4, $08, 0
	dbsprite -1,  0,  0,  4, $09, 0
	dbsprite  0,  0,  0,  4, $0a, 0

.OAMData_GSIntroLapras1:
	db 27
	dbsprite -3, -3,  0,  0, $00, 0
	dbsprite -2, -3,  0,  0, $01, 0
	dbsprite -1, -3,  0,  0, $02, 0
	dbsprite -3, -2,  0,  0, $10, 0
	dbsprite -2, -2,  0,  0, $11, 0
	dbsprite -1, -2,  0,  0, $12, 0
	dbsprite -3, -1,  0,  0, $20, 0
	dbsprite -2, -1,  0,  0, $21, 0
	dbsprite -1, -1,  0,  0, $22, 0
	dbsprite  0, -1,  0,  0, $23, 0
	dbsprite -3,  0,  0,  0, $30, 0 | OAM_PRIO
	dbsprite -2,  0,  0,  0, $31, 0 | OAM_PRIO
	dbsprite -1,  0,  0,  0, $32, 0 | OAM_PRIO
	dbsprite  0,  0,  0,  0, $33, 0 | OAM_PRIO
	dbsprite  1,  0,  0,  0, $34, 0 | OAM_PRIO
	dbsprite -3,  1,  0,  0, $40, 0 | OAM_PRIO
	dbsprite -2,  1,  0,  0, $41, 0 | OAM_PRIO
	dbsprite -1,  1,  0,  0, $42, 0 | OAM_PRIO
	dbsprite  0,  1,  0,  0, $43, 0 | OAM_PRIO
	dbsprite  1,  1,  0,  0, $44, 0 | OAM_PRIO
	dbsprite  2,  1,  0,  0, $45, 0 | OAM_PRIO
	dbsprite -3,  2,  0,  0, $50, 0 | OAM_PRIO
	dbsprite -2,  2,  0,  0, $51, 0 | OAM_PRIO
	dbsprite -1,  2,  0,  0, $52, 0 | OAM_PRIO
	dbsprite  0,  2,  0,  0, $53, 0 | OAM_PRIO
	dbsprite  1,  2,  0,  0, $54, 0 | OAM_PRIO
	dbsprite  2,  2,  0,  0, $55, 0 | OAM_PRIO

.OAMData_GSIntroLapras2:
	db 27
	dbsprite -3, -3,  0,  0, $0d, 0
	dbsprite -2, -3,  0,  0, $0e, 0
	dbsprite -1, -3,  0,  0, $0f, 0
	dbsprite -3, -2,  0,  0, $1d, 0
	dbsprite -2, -2,  0,  0, $1e, 0
	dbsprite -1, -2,  0,  0, $1f, 0
	dbsprite -3, -1,  0,  0, $20, 0
	dbsprite -2, -1,  0,  0, $21, 0
	dbsprite -1, -1,  0,  0, $22, 0
	dbsprite  0, -1,  0,  0, $23, 0
	dbsprite -3,  0,  0,  0, $30, 0 | OAM_PRIO
	dbsprite -2,  0,  0,  0, $31, 0 | OAM_PRIO
	dbsprite -1,  0,  0,  0, $32, 0 | OAM_PRIO
	dbsprite  0,  0,  0,  0, $33, 0 | OAM_PRIO
	dbsprite  1,  0,  0,  0, $34, 0 | OAM_PRIO
	dbsprite -3,  1,  0,  0, $40, 0 | OAM_PRIO
	dbsprite -2,  1,  0,  0, $41, 0 | OAM_PRIO
	dbsprite -1,  1,  0,  0, $42, 0 | OAM_PRIO
	dbsprite  0,  1,  0,  0, $43, 0 | OAM_PRIO
	dbsprite  1,  1,  0,  0, $44, 0 | OAM_PRIO
	dbsprite  2,  1,  0,  0, $45, 0 | OAM_PRIO
	dbsprite -3,  2,  0,  0, $50, 0 | OAM_PRIO
	dbsprite -2,  2,  0,  0, $51, 0 | OAM_PRIO
	dbsprite -1,  2,  0,  0, $52, 0 | OAM_PRIO
	dbsprite  0,  2,  0,  0, $53, 0 | OAM_PRIO
	dbsprite  1,  2,  0,  0, $54, 0 | OAM_PRIO
	dbsprite  2,  2,  0,  0, $55, 0 | OAM_PRIO

.OAMData_GSIntroLapras3:
	db 29
	dbsprite -3, -3,  0,  0, $00, 0
	dbsprite -2, -3,  0,  0, $01, 0
	dbsprite -1, -3,  0,  0, $02, 0
	dbsprite  0, -3,  0,  0, $03, 0
	dbsprite -3, -2,  0,  0, $10, 0
	dbsprite -2, -2,  0,  0, $11, 0
	dbsprite -1, -2,  0,  0, $12, 0
	dbsprite  0, -2,  0,  0, $13, 0
	dbsprite -3, -1,  0,  0, $20, 0
	dbsprite -2, -1,  0,  0, $21, 0
	dbsprite -1, -1,  0,  0, $22, 0
	dbsprite  0, -1,  0,  0, $23, 0
	dbsprite  1, -1,  0,  0, $24, 0
	dbsprite -3,  0,  0,  0, $30, 0 | OAM_PRIO
	dbsprite -2,  0,  0,  0, $31, 0 | OAM_PRIO
	dbsprite -1,  0,  0,  0, $32, 0 | OAM_PRIO
	dbsprite  0,  0,  0,  0, $33, 0 | OAM_PRIO
	dbsprite  1,  0,  0,  0, $34, 0 | OAM_PRIO
	dbsprite -3,  1,  0,  0, $40, 0 | OAM_PRIO
	dbsprite -2,  1,  0,  0, $41, 0 | OAM_PRIO
	dbsprite -1,  1,  0,  0, $42, 0 | OAM_PRIO
	dbsprite  0,  1,  0,  0, $43, 0 | OAM_PRIO
	dbsprite  1,  1,  0,  0, $44, 0 | OAM_PRIO
	dbsprite  2,  1,  0,  0, $45, 0 | OAM_PRIO
	dbsprite -2,  2,  0,  0, $51, 0 | OAM_PRIO
	dbsprite -1,  2,  0,  0, $52, 0 | OAM_PRIO
	dbsprite  0,  2,  0,  0, $53, 0 | OAM_PRIO
	dbsprite  1,  2,  0,  0, $54, 0 | OAM_PRIO
	dbsprite  2,  2,  0,  0, $55, 0 | OAM_PRIO

.OAMData_GSIntroNote:
	db 2
	dbsprite -1, -1,  4,  0, $00, 0
	dbsprite -1,  0,  4,  0, $10, 0

.OAMData_GSIntroPikachuTail:
	db 5
	dbsprite  3, -2,  0,  0, $00, 0
	dbsprite  4, -2,  0,  0, $01, 0
	dbsprite  2, -1,  0,  0, $02, 0
	dbsprite  3, -1,  0,  0, $03, 0
	dbsprite  2,  0,  0,  0, $04, 0

.OAMData_Leaf:
	db 1
	dbsprite -1, -1,  4,  4, $00, PAL_OW_TREE

.OAMData_Tree:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_TREE
	dbsprite  0, -1,  0,  0, $01, PAL_OW_TREE
	dbsprite -1,  0,  0,  0, $02, PAL_OW_TREE
	dbsprite  0,  0,  0,  0, $03, PAL_OW_TREE

.OAMData_TextEntryCursor:
	db 4
	dbsprite -1, -1,  7,  7, $00, 0
	dbsprite  0, -1,  0,  7, $00, 0 | OAM_XFLIP
	dbsprite -1,  0,  7,  0, $00, 0 | OAM_YFLIP
	dbsprite  0,  0,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP

.OAMData_TextEntryCursorBig:
	db 10
	dbsprite  0, -1,  0,  7, $00, 0
	dbsprite  1, -1,  0,  7, $01, 0
	dbsprite  2, -1,  0,  7, $01, 0
	dbsprite  3, -1,  0,  7, $01, 0
	dbsprite  4, -1,  0,  7, $00, 0 | OAM_XFLIP
	dbsprite  0,  0,  0,  0, $00, 0 | OAM_YFLIP
	dbsprite  1,  0,  0,  0, $01, 0 | OAM_YFLIP
	dbsprite  2,  0,  0,  0, $01, 0 | OAM_YFLIP
	dbsprite  3,  0,  0,  0, $01, 0 | OAM_YFLIP
	dbsprite  4,  0,  0,  0, $00, 0 | OAM_XFLIP | OAM_YFLIP

.OAMData_GSGameFreakLogo:
	db 15
	dbsprite -2, -3,  4,  4, $00, 1 | OAM_PAL1
	dbsprite -1, -3,  4,  4, $01, 1 | OAM_PAL1
	dbsprite  0, -3,  4,  4, $02, 1 | OAM_PAL1
	dbsprite -2, -2,  4,  4, $03, 1 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $04, 1 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $05, 1 | OAM_PAL1
	dbsprite -2, -1,  4,  4, $06, 1 | OAM_PAL1
	dbsprite -1, -1,  4,  4, $07, 1 | OAM_PAL1
	dbsprite  0, -1,  4,  4, $08, 1 | OAM_PAL1
	dbsprite -2,  0,  4,  4, $09, 1 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $0a, 1 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $0b, 1 | OAM_PAL1
	dbsprite -2,  1,  4,  4, $0c, 1 | OAM_PAL1
	dbsprite -1,  1,  4,  4, $0d, 1 | OAM_PAL1
	dbsprite  0,  1,  4,  4, $0e, 1 | OAM_PAL1

.OAMData_SlotsGolem:
	db 6
	dbsprite -2, -2,  4,  4, $00, 5 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $02, 5 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $00, 5 | OAM_PAL1 | OAM_XFLIP
	dbsprite -2,  0,  4,  4, $04, 5 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $06, 5 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $04, 5 | OAM_PAL1 | OAM_XFLIP

.OAMData_SlotsChansey1:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $02, 6 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $04, 6 | OAM_PAL1
	dbsprite -2,  0,  4,  4, $06, 6 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $08, 6 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $0a, 6 | OAM_PAL1

.OAMData_SlotsChansey2:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $02, 6 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $04, 6 | OAM_PAL1
	dbsprite -2,  0,  4,  4, $0c, 6 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $0e, 6 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $10, 6 | OAM_PAL1

.OAMData_SlotsChansey3:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $02, 6 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $04, 6 | OAM_PAL1
	dbsprite -2,  0,  4,  4, $12, 6 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $14, 6 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $16, 6 | OAM_PAL1

.OAMData_SlotsChansey4:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $02, 6 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $04, 6 | OAM_PAL1
	dbsprite -2,  0,  4,  4, $18, 6 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $1a, 6 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $1c, 6 | OAM_PAL1

.OAMData_SlotsChansey5:
	db 6
	dbsprite -2, -2,  4,  4, $1e, 6 | OAM_PAL1
	dbsprite -1, -2,  4,  4, $20, 6 | OAM_PAL1
	dbsprite  0, -2,  4,  4, $22, 6 | OAM_PAL1
	dbsprite -2,  0,  4,  4, $24, 6 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $26, 6 | OAM_PAL1
	dbsprite  0,  0,  4,  4, $28, 6 | OAM_PAL1

.OAMData_RadioTuningKnob:
	db 3
	dbsprite -1, -2,  4,  4, $00, 0 | OAM_PAL1
	dbsprite -1, -1,  4,  4, $00, 0 | OAM_PAL1
	dbsprite -1,  0,  4,  4, $00, 0 | OAM_PAL1

.OAMData_Unused4B:
	db 6
	dbsprite  0,  0,  0,  0, $00, 0
	dbsprite  1,  0,  0,  0, $01, 0
	dbsprite  2,  0,  0,  0, $01, 0
	dbsprite  3,  0,  0,  0, $01, 0
	dbsprite  4,  0,  0,  0, $02, 0
	dbsprite  5,  0,  0,  0, $03, 0

.OAMData_Unused4C:
	db 4
	dbsprite  0,  0,  0,  0, $00, 0
	dbsprite  1,  0,  0,  0, $01, 0
	dbsprite  2,  0,  0,  0, $02, 0
	dbsprite  3,  0,  0,  0, $03, 0

.OAMData_CutTree2:
	db 4
	dbsprite -2, -1,  6,  0, $00, PAL_OW_TREE
	dbsprite  0, -1,  2,  0, $01, PAL_OW_TREE
	dbsprite -2,  0,  6,  0, $02, PAL_OW_TREE
	dbsprite  0,  0,  2,  0, $03, PAL_OW_TREE

.OAMData_CutTree3:
	db 4
	dbsprite -2, -1,  4,  0, $00, PAL_OW_TREE
	dbsprite  0, -1,  4,  0, $01, PAL_OW_TREE
	dbsprite -2,  0,  4,  0, $02, PAL_OW_TREE
	dbsprite  0,  0,  4,  0, $03, PAL_OW_TREE

.OAMData_CutTree4:
	db 4
	dbsprite -2, -1,  0,  0, $00, PAL_OW_TREE
	dbsprite  1, -1,  0,  0, $01, PAL_OW_TREE
	dbsprite -2,  0,  0,  0, $02, PAL_OW_TREE
	dbsprite  1,  0,  0,  0, $03, PAL_OW_TREE

IF DEF(_GOLD)
.OAMData_GSIntroHoOh1:
	db 19
	dbsprite -4, -1,  0,  0, $00, 0
	dbsprite -3, -2,  0,  0, $02, 0
	dbsprite -3,  0,  0,  0, $04, 0
	dbsprite -2, -3,  0,  0, $06, 0
	dbsprite -2, -1,  0,  0, $08, 0
	dbsprite -2,  1,  0,  0, $0a, 0
	dbsprite -1, -3,  0,  0, $0c, 0
	dbsprite -1, -1,  0,  0, $0e, 0
	dbsprite -1,  1,  0,  0, $10, 0
	dbsprite  0, -3,  0,  0, $12, 0
	dbsprite  0, -1,  0,  0, $14, 0
	dbsprite  0,  1,  0,  0, $16, 0
	dbsprite  1, -3,  0,  0, $18, 0
	dbsprite  1, -1,  0,  0, $1a, 0
	dbsprite  1,  1,  0,  0, $1c, 0
	dbsprite  2, -1,  0,  0, $1e, 0
	dbsprite  2,  1,  0,  0, $20, 0
	dbsprite  3, -2,  0,  0, $22, 0
	dbsprite  3,  0,  0,  0, $24, 0

.OAMData_GSIntroHoOh2:
	db 16
	dbsprite -4, -1,  0,  0, $00, 0
	dbsprite -3, -2,  0,  0, $02, 0
	dbsprite -3,  0,  0,  0, $04, 0
	dbsprite -2, -1,  0,  0, $26, 0
	dbsprite -2,  1,  0,  0, $0a, 0
	dbsprite -1, -3,  0,  0, $28, 0
	dbsprite -1, -1,  0,  0, $2a, 0
	dbsprite -1,  1,  0,  0, $10, 0
	dbsprite  0, -1,  0,  0, $2c, 0
	dbsprite  0,  1,  0,  0, $16, 0
	dbsprite  1, -1,  0,  0, $30, 0
	dbsprite  1,  1,  0,  0, $1c, 0
	dbsprite  2, -1,  0,  0, $1e, 0
	dbsprite  2,  1,  0,  0, $20, 0
	dbsprite  3, -2,  0,  0, $22, 0
	dbsprite  3,  0,  0,  0, $24, 0

.OAMData_GSIntroHoOh3:
	db 15
	dbsprite -4, -1,  0,  0, $00, 0
	dbsprite -3, -2,  0,  0, $02, 0
	dbsprite -3,  0,  0,  0, $32, 0
	dbsprite -2, -1,  0,  0, $34, 0
	dbsprite -2,  1,  0,  0, $36, 0
	dbsprite -1, -1,  0,  0, $38, 0
	dbsprite -1,  1,  0,  0, $3a, 0
	dbsprite  0, -1,  0,  0, $3c, 0
	dbsprite  0,  1,  0,  0, $3e, 0
	dbsprite  1, -1,  0,  0, $30, 0
	dbsprite  1,  1,  0,  0, $1c, 0
	dbsprite  2, -1,  0,  0, $1e, 0
	dbsprite  2,  1,  0,  0, $20, 0
	dbsprite  3, -2,  0,  0, $22, 0
	dbsprite  3,  0,  0,  0, $24, 0

.OAMData_GSIntroHoOh4:
	db 17
	dbsprite -4, -1,  0,  0, $00, 0
	dbsprite -3, -2,  0,  0, $02, 0
	dbsprite -3,  0,  0,  0, $04, 0
	dbsprite -2, -1,  0,  0, $40, 0
	dbsprite -2,  1,  0,  0, $42, 0
	dbsprite -2,  3,  0,  0, $44, 0
	dbsprite -1, -1,  0,  0, $46, 0
	dbsprite -1,  1,  0,  0, $48, 0
	dbsprite -1,  3,  0,  0, $4a, 0
	dbsprite  0, -1,  0,  0, $4c, 0
	dbsprite  0,  1,  0,  0, $4e, 0
	dbsprite  1, -1,  0,  0, $30, 0
	dbsprite  1,  1,  0,  0, $1c, 0
	dbsprite  2, -1,  0,  0, $1e, 0
	dbsprite  2,  1,  0,  0, $20, 0
	dbsprite  3, -2,  0,  0, $22, 0
	dbsprite  3,  0,  0,  0, $24, 0

.OAMData_GSIntroHoOh5:
	db 17
	dbsprite -4, -1,  0,  0, $00, 0
	dbsprite -3, -2,  0,  0, $02, 0
	dbsprite -3,  0,  0,  0, $04, 0
	dbsprite -2, -1,  0,  0, $50, 0
	dbsprite -2,  1,  0,  0, $0a, 0
	dbsprite -1, -3,  0,  0, $52, 0
	dbsprite -1, -1,  0,  0, $54, 0
	dbsprite -1,  1,  0,  0, $10, 0
	dbsprite  0, -3,  0,  0, $56, 0
	dbsprite  0, -1,  0,  0, $2e, 0
	dbsprite  0,  1,  0,  0, $16, 0
	dbsprite  1, -1,  0,  0, $30, 0
	dbsprite  1,  1,  0,  0, $1c, 0
	dbsprite  2, -1,  0,  0, $1e, 0
	dbsprite  2,  1,  0,  0, $20, 0
	dbsprite  3, -2,  0,  0, $22, 0
	dbsprite  3,  0,  0,  0, $24, 0

.OAMData_GSTitleTrail:
	db 1
	dbsprite -1, -1,  4,  4, $00, 1 | OAM_PAL1

ELIF DEF(_SILVER)
.OAMData_GSIntroLugia1:
	db 16
	dbsprite -5, -2,  0,  0, $00, 0
	dbsprite -5,  0,  0,  0, $02, 0
	dbsprite -4, -2,  0,  0, $04, 0
	dbsprite -4,  0,  0,  0, $06, 0
	dbsprite -3, -1,  0,  0, $08, 0
	dbsprite -2, -1,  0,  0, $0a, 0
	dbsprite -1, -2,  0,  0, $0c, 0
	dbsprite -1,  0,  0,  0, $0e, 0
	dbsprite  0, -2,  0,  0, $10, 0
	dbsprite  0,  0,  0,  0, $12, 0
	dbsprite  1, -2,  0,  0, $14, 0
	dbsprite  1,  0,  0,  0, $16, 0
	dbsprite  2, -2,  0,  0, $18, 0
	dbsprite  2,  0,  0,  0, $1a, 0
	dbsprite  3, -1,  0,  0, $1c, 0
	dbsprite  4, -1,  0,  0, $1e, 0

.OAMData_GSIntroLugia2:
	db 16
	dbsprite -5, -2,  0,  0, $00, 0
	dbsprite -5,  0,  0,  0, $02, 0
	dbsprite -4, -2,  0,  0, $04, 0
	dbsprite -4,  0,  0,  0, $06, 0
	dbsprite -3, -1,  0,  0, $08, 0
	dbsprite -2, -1,  0,  0, $0a, 0
	dbsprite -1, -2,  0,  0, $0c, 0
	dbsprite -1,  0,  0,  0, $0e, 0
	dbsprite  0, -2,  0,  0, $10, 0
	dbsprite  0,  0,  0,  0, $12, 0
	dbsprite  1, -2,  0,  0, $14, 0
	dbsprite  1,  0,  0,  0, $16, 0
	dbsprite  2, -2,  0,  0, $18, 0
	dbsprite  2,  0,  0,  0, $1a, 0
	dbsprite  3, -2,  0,  0, $1c, 0
	dbsprite  4, -2,  0,  0, $1e, 0

.OAMData_GSIntroLugia3: ; unreferenced
	db 17
	dbsprite -5, -2,  0,  0, $3c, 0
	dbsprite -5,  0,  0,  0, $3e, 0
	dbsprite -4, -2,  0,  0, $40, 0
	dbsprite -4,  0,  0,  0, $42, 0
	dbsprite -3, -1,  0,  0, $44, 0
	dbsprite -2, -2,  0,  0, $46, 0
	dbsprite -2,  0,  0,  0, $48, 0
	dbsprite -1, -2,  0,  0, $4a, 0
	dbsprite -1,  0,  0,  0, $78, 0
	dbsprite  0, -2,  0,  0, $4c, 0
	dbsprite  0,  0,  0,  0, $7a, 0
	dbsprite  1, -2,  0,  0, $4e, 0
	dbsprite  1,  0,  0,  0, $50, 0
	dbsprite  2, -2,  0,  0, $52, 0
	dbsprite  2,  0,  0,  0, $54, 0
	dbsprite  3, -1,  0,  0, $56, 0
	dbsprite  4, -1,  0,  0, $58, 0

.OAMData_GSIntroLugia4: ; unreferenced
	db 17
	dbsprite -5, -2,  0,  0, $5a, 0
	dbsprite -5,  0,  0,  0, $5c, 0
	dbsprite -4, -2,  0,  0, $5e, 0
	dbsprite -4,  0,  0,  0, $60, 0
	dbsprite -3, -1,  0,  0, $62, 0
	dbsprite -2, -2,  0,  0, $64, 0
	dbsprite -2,  0,  0,  0, $66, 0
	dbsprite -1, -2,  0,  0, $68, 0
	dbsprite -1,  0,  0,  0, $78, 0
	dbsprite  0, -2,  0,  0, $6a, 0
	dbsprite  0,  0,  0,  0, $7a, 0
	dbsprite  1, -2,  0,  0, $6c, 0
	dbsprite  1,  0,  0,  0, $6e, 0
	dbsprite  2, -2,  0,  0, $70, 0
	dbsprite  2,  0,  0,  0, $72, 0
	dbsprite  3, -1,  0,  0, $74, 0
	dbsprite  4, -1,  0,  0, $76, 0

.OAMData_GSIntroLugia5: ; unreferenced
	db 17
	dbsprite -5, -2,  0,  0, $5a, 0
	dbsprite -5,  0,  0,  0, $5c, 0
	dbsprite -4, -2,  0,  0, $5e, 0
	dbsprite -4,  0,  0,  0, $60, 0
	dbsprite -3, -1,  0,  0, $62, 0
	dbsprite -2, -2,  0,  0, $64, 0
	dbsprite -2,  0,  0,  0, $66, 0
	dbsprite -1, -2,  0,  0, $68, 0
	dbsprite -1,  0,  0,  0, $78, 0
	dbsprite  0, -2,  0,  0, $6a, 0
	dbsprite  0,  0,  0,  0, $7a, 0
	dbsprite  1, -2,  0,  0, $6c, 0
	dbsprite  1,  0,  0,  0, $6e, 0
	dbsprite  2, -2,  0,  0, $70, 0
	dbsprite  2,  0,  0,  0, $72, 0
	dbsprite  3, -1,  0,  0, $74, 0
	dbsprite  4, -1,  0,  0, $76, 0

.OAMData_GSTitleTrail:
	db 2
	dbsprite -1, -1,  0,  0, $00, 0
	dbsprite  0, -1,  0,  0, $02, 0
ENDC
