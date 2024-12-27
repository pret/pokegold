FontExtra:
INCBIN "gfx/font/font_extra.2bpp"

Font:
INCBIN "gfx/font/font.1bpp"

FontBattleExtra:
INCBIN "gfx/font/font_battle_extra.2bpp"

Frames:
	table_width TEXTBOX_FRAME_TILES * LEN_1BPP_TILE
INCBIN "gfx/frames/1.1bpp"
INCBIN "gfx/frames/2.1bpp"
INCBIN "gfx/frames/3.1bpp"
INCBIN "gfx/frames/4.1bpp"
INCBIN "gfx/frames/5.1bpp"
INCBIN "gfx/frames/6.1bpp"
INCBIN "gfx/frames/7.1bpp"
INCBIN "gfx/frames/8.1bpp"
	assert_table_length NUM_FRAMES
INCBIN "gfx/frames/9.1bpp" ; unused

StatsScreenPageTilesGFX:
INCBIN "gfx/stats/stats_tiles.2bpp"

EnemyHPBarBorderGFX:
INCBIN "gfx/battle/enemy_hp_bar_border.1bpp"

HPExpBarBorderGFX:
INCBIN "gfx/battle/hp_exp_bar_border.1bpp"

ExpBarGFX:
INCBIN "gfx/battle/expbar.2bpp"

TownMapGFX:
INCBIN "gfx/pokegear/town_map.2bpp.lz"

UnusedWeekdayKanjiGFX: ; unreferenced
INCBIN "gfx/font/unused_weekday_kanji.2bpp"

PokegearPhoneIconGFX:
INCBIN "gfx/font/phone_icon.2bpp"

UnusedBoldFontGFX: ; unreferenced
INCBIN "gfx/font/unused_bold_font.1bpp"

TextboxSpaceGFX:
INCBIN "gfx/font/space.1bpp"

FontsExtra_SolidBlackAndUpArrowGFX:
INCBIN "gfx/font/black.1bpp"
INCBIN "gfx/font/up_arrow.1bpp"

INCLUDE "gfx/footprints.asm"

UnownFont:
INCBIN "gfx/font/unown_font.2bpp"
