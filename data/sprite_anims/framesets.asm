SpriteAnimFrameData:
; entries correspond to SPRITE_ANIM_FRAMESET_* constants (see constants/sprite_anim_constants.asm)
	table_width 2
	dw .Frameset_00
	dw .Frameset_PartyMon
	dw .Frameset_PartyMonWithMail
	dw .Frameset_PartyMonWithItem
	dw .Frameset_GSIntroBubble
	dw .Frameset_GSIntroShellder
	dw .Frameset_GSIntroMagikarp
	dw .Frameset_UnusedIntroAerodactyl
	dw .Frameset_GSIntroLapras
	dw .Frameset_GSIntroNote
	dw .Frameset_GSIntroInvisibleNote
	dw .Frameset_GSIntroJigglypuff
	dw .Frameset_GSIntroJigglypuff2
	dw .Frameset_GSIntroPikachu
	dw .Frameset_GSIntroPikachu2
	dw .Frameset_GSIntroPikachu3
	dw .Frameset_GSIntroPikachuTail
	dw .Frameset_GSIntroPikachuTail2
	dw .Frameset_GSIntroFireball
	dw .Frameset_GSIntroChikorita
	dw .Frameset_GSIntroCyndaquil
	dw .Frameset_GSIntroTotodile
	dw .Frameset_GSTitleTrail
	dw .Frameset_GSIntroPikachu
	dw .Frameset_GSIntroPikachu2
	dw .Frameset_GSIntroPikachu4
	dw .Frameset_TextEntryCursor
	dw .Frameset_TextEntryCursorBig
	dw .Frameset_GameFreakLogo
	dw .Frameset_GSGameFreakLogoStar
	dw .Frameset_GSGameFreakLogoSparkle
	dw .Frameset_SlotsGolem
	dw .Frameset_SlotsChansey
	dw .Frameset_SlotsChansey2
	dw .Frameset_SlotsEgg
	dw .Frameset_RedWalk
	dw .Frameset_StillCursor
	dw .Frameset_TradePokeBall
	dw .Frameset_TradePokeBallWobble
	dw .Frameset_TradePoof
	dw .Frameset_TradeTubeBulge
	dw .Frameset_TrademonIcon
	dw .Frameset_TrademonBubble
	dw .Frameset_EvolutionBallOfLight
	dw .Frameset_RadioTuningKnob
	dw .Frameset_MagnetTrainRed
	dw .Frameset_Unused2E
	dw .Frameset_Leaf
	dw .Frameset_CutTree
	dw .Frameset_EggCrack
	dw .Frameset_EggHatch1
	dw .Frameset_EggHatch2
	dw .Frameset_EggHatch3
	dw .Frameset_EggHatch4
	dw .Frameset_GSIntroHoOhLugia
	dw .Frameset_HeadbuttTree
	assert_table_length NUM_SPRITE_ANIM_FRAMESETS

.Frameset_00:
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_1, 32
	oamend

.Frameset_PartyMon:
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_2,  8
	oamrestart

.Frameset_PartyMonWithMail:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1,  8
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2,  8
	oamrestart

.Frameset_PartyMonWithItem:
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1,  8
	oamframe SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2,  8
	oamrestart

.Frameset_RedWalk:
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_2,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	oamframe SPRITE_ANIM_OAMSET_RED_WALK_2,  8, B_OAM_XFLIP
	oamrestart

.Frameset_GSIntroBubble:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_BUBBLE_1,  8
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_BUBBLE_2,  8
	oamrestart

.Frameset_GSIntroShellder:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_SHELLDER_1,  8
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_SHELLDER_2,  8
	oamrestart

.Frameset_GSIntroMagikarp:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_MAGIKARP_1,  1, B_OAM_XFLIP
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_MAGIKARP_2,  1, B_OAM_XFLIP
	oamrestart

.Frameset_UnusedIntroAerodactyl:
	oamframe SPRITE_ANIM_OAMSET_UNUSED_INTRO_AERODACTYL,  7, B_OAM_XFLIP
	oamend

.Frameset_GSIntroLapras:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_1,  7
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_2,  7
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_3,  7
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_1,  7
	oamrestart

.Frameset_GSIntroNote:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_NOTE,  8
	oamend

.Frameset_GSIntroInvisibleNote:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_INVISIBLE_NOTE,  8
	oamend

.Frameset_GSIntroJigglypuff:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_1, 25, B_OAM_XFLIP
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_3,  9
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_1, 25
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_3,  9
	oamrestart

.Frameset_GSIntroJigglypuff2:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_2, 32
	oamend

.Frameset_GSIntroPikachu:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_1,  4
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_2,  5
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_4,  4
	oamrestart

.Frameset_GSIntroPikachu2:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_2,  8
	oamend

.Frameset_GSIntroPikachu3:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_3, 32
	oamend

.Frameset_GSIntroPikachuTail:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_1,  3
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_2,  3
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_3,  3
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_2,  3
	oamrestart

.Frameset_GSIntroPikachuTail2:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_1, 31
	oamend

.Frameset_GSIntroFireball:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_SMALL_FIREBALL,  1
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_MED_FIREBALL,  1
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_BIG_FIREBALL,  1
	oamdelete

.Frameset_GSIntroChikorita:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_CHIKORITA, 24
	oamdelete

.Frameset_GSIntroCyndaquil:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_CYNDAQUIL, 24, B_OAM_XFLIP
	oamdelete

.Frameset_GSIntroTotodile:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_TOTODILE, 24
	oamdelete

.Frameset_GSTitleTrail:
IF DEF(_GOLD)
	oamframe SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_1,  1
	oamframe SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_2,  1
	oamrestart
ELIF DEF(_SILVER)
	oamframe SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_1, 32
	oamend
ENDC

.Frameset_GSIntroPikachu4:
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_2,  0
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_3, 15
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_4, 15
	oamend

.Frameset_TextEntryCursor:
	oamframe SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR,  1
	oamwait 1
	oamrestart

.Frameset_TextEntryCursorBig:
	oamframe SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG,  1
	oamwait 1
	oamrestart

.Frameset_GameFreakLogo:
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO,  8
	oamend

.Frameset_GSGameFreakLogoStar:
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_STAR,  3
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_STAR,  3, B_OAM_YFLIP
	oamrestart

.Frameset_GSGameFreakLogoSparkle:
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_1,  2
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_2,  2
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_3,  2
	oamframe SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_2,  2
	oamrestart

.Frameset_SlotsGolem:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1,  7, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2,  7, B_OAM_XFLIP
	oamrestart

.Frameset_SlotsChansey:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_2,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_3,  7
	oamrestart

.Frameset_SlotsChansey2:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_5,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4,  7
	oamframe SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	oamend

.Frameset_SlotsEgg:
	oamframe SPRITE_ANIM_OAMSET_SLOTS_EGG, 20
	oamend

.Frameset_StillCursor:
	oamframe SPRITE_ANIM_OAMSET_STILL_CURSOR, 32
	oamend

.Frameset_TradePokeBall:
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1, 32
	oamend

.Frameset_TradePokeBallWobble:
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, B_OAM_XFLIP
	oamrestart

.Frameset_TradePoof:
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_1,  4
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_2,  4
	oamframe SPRITE_ANIM_OAMSET_TRADE_POOF_3,  4
	oamdelete

.Frameset_TradeTubeBulge:
	oamframe SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_1,  3
	oamframe SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_2,  3
	oamrestart

.Frameset_TrademonIcon:
	oamframe SPRITE_ANIM_OAMSET_TRADEMON_ICON_1,  7
	oamframe SPRITE_ANIM_OAMSET_TRADEMON_ICON_2,  7
	oamrestart

.Frameset_TrademonBubble:
	oamframe SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE, 32
	oamend

.Frameset_EvolutionBallOfLight:
	oamframe SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	oamframe SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1,  2
	oamframe SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	oamend

.Frameset_RadioTuningKnob:
	oamframe SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB, 32
	oamend

.Frameset_MagnetTrainRed:
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1,  8
	oamframe SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2,  8, B_OAM_XFLIP
	oamrestart

.Frameset_Unknown1: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_43,  8
	oamframe SPRITE_ANIM_OAMSET_UNUSED_44,  8
	oamrestart

.Frameset_Unknown2: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_45,  8
	oamframe SPRITE_ANIM_OAMSET_UNUSED_46,  8
	oamrestart

.Frameset_Unknown3: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_47,  8
	oamframe SPRITE_ANIM_OAMSET_UNUSED_48,  8
	oamrestart

.Frameset_Unknown4: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_49,  1
	oamframe SPRITE_ANIM_OAMSET_UNUSED_49,  1, B_OAM_XFLIP
	oamframe SPRITE_ANIM_OAMSET_UNUSED_49,  1, B_OAM_XFLIP, B_OAM_YFLIP
	oamframe SPRITE_ANIM_OAMSET_UNUSED_49,  1, B_OAM_YFLIP
	oamrestart

.Frameset_Unknown5: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4A, 32
	oamend

.Frameset_Unknown6: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4B, 32
	oamend

.Frameset_Unknown7: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4C, 32
	oamend

.Frameset_Unknown8: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4D, 32
	oamend

.Frameset_Unknown9: ; unreferenced
	oamframe SPRITE_ANIM_OAMSET_UNUSED_4E,  3
	oamwait 3
	oamrestart

.Frameset_Unused2E:
	oamwait 32
	oamend

.Frameset_Leaf:
	oamframe SPRITE_ANIM_OAMSET_LEAF, 32
	oamend

.Frameset_CutTree:
	oamframe SPRITE_ANIM_OAMSET_TREE_1,      2
	oamframe SPRITE_ANIM_OAMSET_CUT_TREE_2, 16
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_CUT_TREE_3,  1
	oamwait 1
	oamframe SPRITE_ANIM_OAMSET_CUT_TREE_4,  1
	oamdelete

.Frameset_EggCrack:
	oamframe SPRITE_ANIM_OAMSET_EGG_CRACK, 32
	oamend

.Frameset_EggHatch1:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32
	oamend

.Frameset_EggHatch2:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32, B_OAM_XFLIP
	oamend

.Frameset_EggHatch3:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32, B_OAM_YFLIP
	oamend

.Frameset_EggHatch4:
	oamframe SPRITE_ANIM_OAMSET_EGG_HATCH, 32, B_OAM_XFLIP, B_OAM_YFLIP
	oamend

.Frameset_GSIntroHoOhLugia:
IF DEF(_GOLD)
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_1, 10
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2,  9
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3, 10
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_4, 10
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3,  9
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_5, 10
	oamrestart
ELIF DEF(_SILVER)
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2,  3
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_1,  7
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2,  7
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3,  7
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3,  7
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_4,  7
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_4,  7
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3,  7
	oamframe SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2,  3
	oamrestart
ENDC

.Frameset_HeadbuttTree:
	oamframe SPRITE_ANIM_OAMSET_TREE_1,           2
	oamframe SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2
	oamframe SPRITE_ANIM_OAMSET_TREE_1,           2
	oamframe SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2, B_OAM_XFLIP
	oamrestart
