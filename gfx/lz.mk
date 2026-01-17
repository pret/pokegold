# Delete these rules if you don't care about matching.

$(BUILDDIR)/%.lz: LZFLAGS = --compressor multipass

$(BUILDDIR)/gfx/battle_anims/%.lz: LZFLAGS += --method 2 --align 4

$(BUILDDIR)/gfx/battle/dude.2bpp.lz: LZFLAGS += --align 4

$(BUILDDIR)/gfx/diploma/diploma.2bpp.lz: LZFLAGS += --method 8 --align 1

$(BUILDDIR)/gfx/memory_game/memory_game.2bpp.lz: LZFLAGS += --method 2 --align 4

$(BUILDDIR)/gfx/intro/%.lz: LZFLAGS += --align 4
$(BUILDDIR)/gfx/intro/water1.2bpp.lz: LZFLAGS += --method 2 --align 4

$(BUILDDIR)/gfx/new_game/shrink1.2bpp.lz: LZFLAGS += --align 4
$(BUILDDIR)/gfx/new_game/shrink2.2bpp.lz: LZFLAGS += --align 4

$(BUILDDIR)/gfx/pc/pc.2bpp.lz: LZFLAGS += --align 4

$(BUILDDIR)/gfx/player/chris_back.2bpp.lz: LZFLAGS += --align 4

$(BUILDDIR)/gfx/pokedex/pokedex.2bpp.lz: LZFLAGS += --method 8 --align 1
$(BUILDDIR)/gfx/pokedex/pokedex_sgb.2bpp.lz: LZFLAGS += --method 8 --align 1
$(BUILDDIR)/gfx/pokedex/question_mark.2bpp.lz: LZFLAGS += --align 4
$(BUILDDIR)/gfx/pokedex/slowpoke.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1

$(BUILDDIR)/gfx/pokegear/pokegear.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
$(BUILDDIR)/gfx/pokegear/pokegear_sprites.2bpp.lz: LZFLAGS += --align 4
$(BUILDDIR)/gfx/pokegear/town_map.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1

$(BUILDDIR)/gfx/pokemon/hitmontop/back_gold.2bpp.lz: LZFLAGS += --method 4
$(BUILDDIR)/gfx/pokemon/miltank/back_gold.2bpp.lz: LZFLAGS += --method 4

$(BUILDDIR)/gfx/slots/slots_1.2bpp.lz: LZFLAGS += --method 2 --align 4
$(BUILDDIR)/gfx/slots/slots_2.2bpp.lz: LZFLAGS += --align 4
$(BUILDDIR)/gfx/slots/slots_3.2bpp.lz: LZFLAGS += --align 4

$(BUILDDIR)/gfx/tilesets/%.lz: LZFLAGS += --align 4
$(BUILDDIR)/gfx/tilesets/game_corner.2bpp.lz: LZFLAGS += --method 2 --align 4
$(BUILDDIR)/gfx/tilesets/house.2bpp.lz: LZFLAGS += --method 2 --align 4
$(BUILDDIR)/gfx/tilesets/johto.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
$(BUILDDIR)/gfx/tilesets/johto_modern.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
$(BUILDDIR)/gfx/tilesets/kanto.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
$(BUILDDIR)/gfx/tilesets/mansion.2bpp.lz: LZFLAGS += --method 2 --align 4
$(BUILDDIR)/gfx/tilesets/mart.2bpp.lz: LZFLAGS += --method 2 --align 4
$(BUILDDIR)/gfx/tilesets/players_room.2bpp.lz: LZFLAGS += --method 4 --align 4
$(BUILDDIR)/gfx/tilesets/radio_tower.2bpp.lz: LZFLAGS += --method 2 --align 4
$(BUILDDIR)/gfx/tilesets/ruins_of_alph.2bpp.lz: LZFLAGS += --method 6 --align 4
$(BUILDDIR)/gfx/tilesets/tower.2bpp.lz: LZFLAGS += --method 2 --align 4

$(BUILDDIR)/gfx/title/hooh_gold.2bpp.lz: LZFLAGS += --align 3
$(BUILDDIR)/gfx/title/logo_bottom_gold.2bpp.lz: LZFLAGS += --method 9 --align 1
$(BUILDDIR)/gfx/title/logo_bottom_silver.2bpp.lz: LZFLAGS += --method 9 --align 1
$(BUILDDIR)/gfx/title/logo_top_gold.2bpp.lz: LZFLAGS += --method 9 --align 1
$(BUILDDIR)/gfx/title/logo_top_silver.2bpp.lz: LZFLAGS += --method 9 --align 1
$(BUILDDIR)/gfx/title/lugia_silver.2bpp.lz: LZFLAGS += --align 4

$(BUILDDIR)/gfx/unown_puzzle/%.lz: LZFLAGS += --align 4
$(BUILDDIR)/gfx/unown_puzzle/start_cancel.2bpp.lz: LZFLAGS += --method 8 --align 1
