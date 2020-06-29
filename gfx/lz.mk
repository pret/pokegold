# Delete these rules if you don't care about matching.

%.lz: LZFLAGS = --compressor multipass

gfx/battle_anims/%.lz: LZFLAGS += --method 2 --align 4

gfx/battle/dude.2bpp.lz: LZFLAGS += --align 4

gfx/diploma/diploma.2bpp.lz: LZFLAGS += --method 8 --align 1

gfx/dummy_game/dummy_game.2bpp.lz: LZFLAGS += --method 2 --align 4

gfx/intro/%.lz: LZFLAGS += --align 4
gfx/intro/water1.2bpp.lz: LZFLAGS += --method 2 --align 4

gfx/new_game/shrink1.2bpp.lz: LZFLAGS += --align 4
gfx/new_game/shrink2.2bpp.lz: LZFLAGS += --align 4

gfx/pc/pc.2bpp.lz: LZFLAGS += --align 4

gfx/player/chris_back.2bpp.lz: LZFLAGS += --align 4

gfx/pokedex/pokedex.2bpp.lz: LZFLAGS += --method 8 --align 1
gfx/pokedex/pokedex_sgb.2bpp.lz: LZFLAGS += --method 8 --align 1
gfx/pokedex/question_mark.2bpp.lz: LZFLAGS += --align 4
gfx/pokedex/slowpoke.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1

gfx/pokegear/pokegear.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/pokegear/pokegear_sprites.2bpp.lz: LZFLAGS += --align 4
gfx/pokegear/town_map.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1

gfx/pokemon/hitmontop/back_gold.2bpp.lz: LZFLAGS += --method 4
gfx/pokemon/miltank/back_gold.2bpp.lz: LZFLAGS += --method 4

gfx/slots/slots_1.2bpp.lz: LZFLAGS += --method 2 --align 4
gfx/slots/slots_2.2bpp.lz: LZFLAGS += --align 4
gfx/slots/slots_3.2bpp.lz: LZFLAGS += --align 4

gfx/tilesets/%.lz: LZFLAGS += --align 4
gfx/tilesets/game_corner.2bpp.lz: LZFLAGS += --method 2 --align 4
gfx/tilesets/house.2bpp.lz: LZFLAGS += --method 2 --align 4
gfx/tilesets/johto.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/johto_modern.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/kanto.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/mansion.2bpp.lz: LZFLAGS += --method 2 --align 4
gfx/tilesets/mart.2bpp.lz: LZFLAGS += --method 2 --align 4
gfx/tilesets/players_room.2bpp.lz: LZFLAGS += --method 4 --align 4
gfx/tilesets/radio_tower.2bpp.lz: LZFLAGS += --method 2 --align 4
gfx/tilesets/ruins_of_alph.2bpp.lz: LZFLAGS += --method 6 --align 4
gfx/tilesets/tower.2bpp.lz: LZFLAGS += --method 2 --align 4

gfx/title/hooh_gold.2bpp.lz: LZFLAGS += --align 3
gfx/title/logo_bottom_gold.2bpp.lz: LZFLAGS += --method 9 --align 1
gfx/title/logo_bottom_silver.2bpp.lz: LZFLAGS += --method 9 --align 1
gfx/title/logo_top_gold.2bpp.lz: LZFLAGS += --method 9 --align 1
gfx/title/logo_top_silver.2bpp.lz: LZFLAGS += --method 9 --align 1
gfx/title/lugia_silver.2bpp.lz: LZFLAGS += --align 4

gfx/unown_puzzle/%.lz: LZFLAGS += --align 4
gfx/unown_puzzle/start_cancel.2bpp.lz: LZFLAGS += --method 8 --align 1
