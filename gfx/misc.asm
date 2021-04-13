SECTION "Egg Pic", ROMX

EggPic::
INCBIN "gfx/pokemon/egg/front.2bpp.lz"


SECTION "Title Screen", ROMX

IF DEF(_GOLD)
TitleScreenGFX1::
INCBIN "gfx/title/logo_bottom_gold.2bpp.lz"
TitleScreenGFX2::
INCBIN "gfx/title/logo_top_gold.2bpp.lz"

ELIF DEF(_SILVER)
TitleScreenGFX1::
INCBIN "gfx/title/logo_bottom_silver.2bpp.lz"
TitleScreenGFX2::
INCBIN "gfx/title/logo_top_silver.2bpp.lz"
ENDC

TitleScreenTilemap::
INCBIN "gfx/title/logo.tilemap"


SECTION "The End", ROMX

TheEndGFX::
INCBIN "gfx/credits/theend.2bpp"


SECTION "Font Inversed", ROMX

FontInversed::
INCBIN "gfx/font/font_inversed.1bpp"


SECTION "Copyright", ROMX

CopyrightGFX::
INCBIN "gfx/splash/copyright.2bpp"


SECTION "Title Screen 2", ROMX

IF DEF(_GOLD)
TitleScreenGFX3::
INCBIN "gfx/title/title_trail_gold.2bpp"
TitleScreenGFX4::
INCBIN "gfx/title/hooh_gold.2bpp.lz"

ELIF DEF(_SILVER)
TitleScreenGFX3::
INCBIN "gfx/title/title_trail_silver.2bpp"
TitleScreenGFX4::
INCBIN "gfx/title/lugia_silver.2bpp.lz"
ENDC


SECTION "Shrink Pics", ROMX

Shrink1Pic::
INCBIN "gfx/new_game/shrink1.2bpp.lz"
Shrink2Pic::
INCBIN "gfx/new_game/shrink2.2bpp.lz"


SECTION "Pokégear GFX", ROMX

PokegearGFX::
INCBIN "gfx/pokegear/pokegear.2bpp.lz"
