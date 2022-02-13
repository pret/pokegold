SpriteAnimFrameData:
; entries correspond to SPRITE_ANIM_FRAMESET_* constants (see constants/sprite_anim_constants.asm)
	table_width 2, SpriteAnimFrameData
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
	dw .Frameset_CelebiLeft
	dw .Frameset_CelebiRight
	assert_table_length NUM_SPRITE_ANIM_FRAMESETS

.Frameset_00:
	frame SPRITE_ANIM_OAMSET_RED_WALK_1, 32
	endanim

.Frameset_PartyMon:
	frame SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	frame SPRITE_ANIM_OAMSET_RED_WALK_2,  8
	dorestart

.Frameset_PartyMonWithMail:
	frame SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1,  8
	frame SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2,  8
	dorestart

.Frameset_PartyMonWithItem:
	frame SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1,  8
	frame SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2,  8
	dorestart

.Frameset_RedWalk:
	frame SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	frame SPRITE_ANIM_OAMSET_RED_WALK_2,  8
	frame SPRITE_ANIM_OAMSET_RED_WALK_1,  8
	frame SPRITE_ANIM_OAMSET_RED_WALK_2,  8, OAM_X_FLIP
	dorestart

.Frameset_GSIntroBubble:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_BUBBLE_1,  8
	frame SPRITE_ANIM_OAMSET_GS_INTRO_BUBBLE_2,  8
	dorestart

.Frameset_GSIntroShellder:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_SHELLDER_1,  8
	frame SPRITE_ANIM_OAMSET_GS_INTRO_SHELLDER_2,  8
	dorestart

.Frameset_GSIntroMagikarp:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_MAGIKARP_1,  1, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_GS_INTRO_MAGIKARP_2,  1, OAM_X_FLIP
	dorestart

.Frameset_UnusedIntroAerodactyl:
	frame SPRITE_ANIM_OAMSET_UNUSED_INTRO_AERODACTYL,  7, OAM_X_FLIP
	endanim

.Frameset_GSIntroLapras:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_1,  7
	frame SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_2,  7
	frame SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_3,  7
	frame SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_1,  7
	dorestart

.Frameset_GSIntroNote:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_NOTE,  8
	endanim

.Frameset_GSIntroInvisibleNote:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_INVISIBLE_NOTE,  8
	endanim

.Frameset_GSIntroJigglypuff:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_1, 25, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_3,  9
	frame SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_1, 25
	frame SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_3,  9
	dorestart

.Frameset_GSIntroJigglypuff2:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_2, 32
	endanim

.Frameset_GSIntroPikachu:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_1,  4
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_2,  5
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_4,  4
	dorestart

.Frameset_GSIntroPikachu2:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_2,  8
	endanim

.Frameset_GSIntroPikachu3:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_3, 32
	endanim

.Frameset_GSIntroPikachuTail:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_1,  3
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_2,  3
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_3,  3
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_2,  3
	dorestart

.Frameset_GSIntroPikachuTail2:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_1, 31
	endanim

.Frameset_GSIntroFireball:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_SMALL_FIREBALL,  1
	frame SPRITE_ANIM_OAMSET_GS_INTRO_MED_FIREBALL,  1
	frame SPRITE_ANIM_OAMSET_GS_INTRO_BIG_FIREBALL,  1
	delanim

.Frameset_GSIntroChikorita:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_CHIKORITA, 24
	delanim

.Frameset_GSIntroCyndaquil:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_CYNDAQUIL, 24, OAM_X_FLIP
	delanim

.Frameset_GSIntroTotodile:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_TOTODILE, 24
	delanim

.Frameset_GSTitleTrail:
IF DEF(_GOLD)
	frame SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_1,  1
	frame SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_2,  1
	dorestart
ELIF DEF(_SILVER)
	frame SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_1, 32
	endanim
ENDC

.Frameset_GSIntroPikachu4:
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_2,  0
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_3, 15
	frame SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_4, 15
	endanim

.Frameset_TextEntryCursor:
	frame SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR,  1
	dowait 1
	dorestart

.Frameset_TextEntryCursorBig:
	frame SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG,  1
	dowait 1
	dorestart

.Frameset_GameFreakLogo:
	frame SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO,  8
	endanim

.Frameset_GSGameFreakLogoStar:
	frame SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_STAR,  3
	frame SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_STAR,  3, OAM_Y_FLIP
	dorestart

.Frameset_GSGameFreakLogoSparkle:
	frame SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_1,  2
	frame SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_2,  2
	frame SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_3,  2
	frame SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_2,  2
	dorestart

.Frameset_SlotsGolem:
	frame SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1,  7, OAM_Y_FLIP
	frame SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2,  7, OAM_X_FLIP
	dorestart

.Frameset_SlotsChansey:
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_2,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_3,  7
	dorestart

.Frameset_SlotsChansey2:
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_5,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4,  7
	frame SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1,  7
	endanim

.Frameset_SlotsEgg:
	frame SPRITE_ANIM_OAMSET_SLOTS_EGG, 20
	endanim

.Frameset_StillCursor:
	frame SPRITE_ANIM_OAMSET_STILL_CURSOR, 32
	endanim

.Frameset_TradePokeBall:
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1, 32
	endanim

.Frameset_TradePokeBallWobble:
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2,  3, OAM_X_FLIP
	dorestart

.Frameset_TradePoof:
	frame SPRITE_ANIM_OAMSET_TRADE_POOF_1,  4
	frame SPRITE_ANIM_OAMSET_TRADE_POOF_2,  4
	frame SPRITE_ANIM_OAMSET_TRADE_POOF_3,  4
	delanim

.Frameset_TradeTubeBulge:
	frame SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_1,  3
	frame SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_2,  3
	dorestart

.Frameset_TrademonIcon:
	frame SPRITE_ANIM_OAMSET_TRADEMON_ICON_1,  7
	frame SPRITE_ANIM_OAMSET_TRADEMON_ICON_2,  7
	dorestart

.Frameset_TrademonBubble:
	frame SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE, 32
	endanim

.Frameset_EvolutionBallOfLight:
	frame SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	frame SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1,  2
	frame SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2,  2
	endanim

.Frameset_RadioTuningKnob:
	frame SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB, 32
	endanim

.Frameset_MagnetTrainRed:
	frame SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1,  8
	frame SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2,  8
	frame SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1,  8
	frame SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2,  8, OAM_X_FLIP
	dorestart

.Frameset_Unknown1: ; unreferenced
	frame SPRITE_ANIM_OAMSET_UNUSED_43,  8
	frame SPRITE_ANIM_OAMSET_UNUSED_44,  8
	dorestart

.Frameset_Unknown2: ; unreferenced
	frame SPRITE_ANIM_OAMSET_UNUSED_45,  8
	frame SPRITE_ANIM_OAMSET_UNUSED_46,  8
	dorestart

.Frameset_Unknown3: ; unreferenced
	frame SPRITE_ANIM_OAMSET_UNUSED_47,  8
	frame SPRITE_ANIM_OAMSET_UNUSED_48,  8
	dorestart

.Frameset_Unknown4: ; unreferenced
	frame SPRITE_ANIM_OAMSET_UNUSED_49,  1
	frame SPRITE_ANIM_OAMSET_UNUSED_49,  1, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_UNUSED_49,  1, OAM_X_FLIP, OAM_Y_FLIP
	frame SPRITE_ANIM_OAMSET_UNUSED_49,  1, OAM_Y_FLIP
	dorestart

.Frameset_Unknown5: ; unreferenced
	frame SPRITE_ANIM_OAMSET_UNUSED_4A, 32
	endanim

.Frameset_Unknown6: ; unreferenced
	frame SPRITE_ANIM_OAMSET_UNUSED_4B, 32
	endanim

.Frameset_Unknown7: ; unreferenced
	frame SPRITE_ANIM_OAMSET_UNUSED_4C, 32
	endanim

.Frameset_Unknown8: ; unreferenced
	frame SPRITE_ANIM_OAMSET_UNUSED_4D, 32
	endanim

.Frameset_Unknown9: ; unreferenced
	frame SPRITE_ANIM_OAMSET_UNUSED_4E,  3
	dowait 3
	dorestart

.Frameset_Unused2E:
	dowait 32
	endanim

.Frameset_Leaf:
	frame SPRITE_ANIM_OAMSET_LEAF, 32
	endanim

.Frameset_CutTree:
	frame SPRITE_ANIM_OAMSET_TREE_1,      2
	frame SPRITE_ANIM_OAMSET_CUT_TREE_2, 16
	dowait 1
	frame SPRITE_ANIM_OAMSET_CUT_TREE_3,  1
	dowait 1
	frame SPRITE_ANIM_OAMSET_CUT_TREE_4,  1
	delanim

.Frameset_EggCrack:
	frame SPRITE_ANIM_OAMSET_EGG_CRACK, 32
	endanim

.Frameset_EggHatch1:
	frame SPRITE_ANIM_OAMSET_EGG_HATCH, 32
	endanim

.Frameset_EggHatch2:
	frame SPRITE_ANIM_OAMSET_EGG_HATCH, 32, OAM_X_FLIP
	endanim

.Frameset_EggHatch3:
	frame SPRITE_ANIM_OAMSET_EGG_HATCH, 32, OAM_Y_FLIP
	endanim

.Frameset_EggHatch4:
	frame SPRITE_ANIM_OAMSET_EGG_HATCH, 32, OAM_X_FLIP, OAM_Y_FLIP
	endanim

.Frameset_GSIntroHoOhLugia:
IF DEF(_GOLD)
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_1, 10
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2,  9
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3, 10
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_4, 10
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3,  9
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_5, 10
	dorestart
ELIF DEF(_SILVER)
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2,  3
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_1,  7
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2,  7
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3,  7
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3,  7
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_4,  7
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_4,  7
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3,  7
	frame SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2,  3
	dorestart
ENDC

.Frameset_HeadbuttTree:
	frame SPRITE_ANIM_OAMSET_TREE_1,           2
	frame SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2
	frame SPRITE_ANIM_OAMSET_TREE_1,           2
	frame SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2,  2, OAM_X_FLIP
	dorestart

.Frameset_CelebiLeft:
	frame SPRITE_ANIM_OAMSET_CELEBI_1,  8
	frame SPRITE_ANIM_OAMSET_CELEBI_2,  8
	endanim

.Frameset_CelebiRight:
	frame SPRITE_ANIM_OAMSET_CELEBI_1,  8, OAM_X_FLIP
	frame SPRITE_ANIM_OAMSET_CELEBI_2,  8, OAM_X_FLIP
	endanim
