roms := pokegold.gbc pokesilver.gbc

rom_obj := \
audio.o \
home.o \
main.o \
wram.o \
data/text/common.o \
data/maps/map_data.o \
data/pokemon/egg_moves.o \
data/pokemon/evos_attacks.o \
engine/movie/credits.o \
engine/overworld/events.o \
gfx/sprites.o \
gfx/tilesets.o

# Distinguish asm files which are game-exclusive for building (*_[gold|silver].asm)
gs_excl_asm := \
data/pokemon/dex_entries \
gfx/pics

gold_excl_obj := $(addsuffix _gold.o,$(gs_excl_asm))
silver_excl_obj := $(addsuffix _silver.o,$(gs_excl_asm))
gold_obj := $(rom_obj:.o=_gold.o) $(gold_excl_obj)
silver_obj := $(rom_obj:.o=_silver.o) $(silver_excl_obj)


### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.PHONY: all gold silver clean tidy compare tools
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: $(roms)
gold:   pokegold.gbc
silver: pokesilver.gbc

clean:
	rm -f $(roms) $(gold_obj) $(silver_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) rgbdscheck.o
	find gfx \( -name "*.[12]bpp" -o -name "*.lz" -o -name "*.gbcpal" -o -name "*.dimensions" -o -name "*.sgb.tilemap" \) -delete
	$(MAKE) clean -C tools/

tidy:
	rm -f $(roms) $(gold_obj) $(silver_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) rgbdscheck.o
	$(MAKE) clean -C tools/

compare: $(roms)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -L -Weverything
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(gold_obj):   RGBASMFLAGS += -D _GOLD
$(silver_obj): RGBASMFLAGS += -D _SILVER

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes $2) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# Dependencies for shared objects (drop _gold and _silver from asm file basenames)
$(foreach obj, $(filter-out $(gold_excl_obj), $(gold_obj)), \
	$(eval $(call DEP,$(obj),$(obj:_gold.o=.asm))))
$(foreach obj, $(filter-out $(silver_excl_obj), $(silver_obj)), \
	$(eval $(call DEP,$(obj),$(obj:_silver.o=.asm))))

# Dependencies for game-exclusive objects (keep _gold and _silver in asm file basenames)
$(foreach obj, $(gold_excl_obj) $(silver_excl_obj), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))

endif


pokegold.gbc: $(gold_obj) layout.link
	$(RGBLINK) -n pokegold.sym -m pokegold.map -l layout.link -o $@ $(gold_obj)
	$(RGBFIX) -cjsv -t POKEMON_GLD -i AAUE -k 01 -l 0x33 -m 0x10 -r 3 -p 0 $@

pokesilver.gbc: $(silver_obj) layout.link
	$(RGBLINK) -n pokesilver.sym -m pokesilver.map -l layout.link -o $@ $(silver_obj)
	$(RGBFIX) -cjsv -t POKEMON_SLV -i AAXE -k 01 -l 0x33 -m 0x10 -r 3 -p 0 $@


### LZ compression rules

# Delete this line if you don't care about matching and just want optimal compression.
include gfx/lz.mk

%.lz: %
	tools/lzcomp $(LZFLAGS) -- $< $@


### Misc file-specific graphics rules

gfx/pokemon/%/front.2bpp: rgbgfx += -h
gfx/pokemon/%/front_gold.2bpp: rgbgfx += -h
gfx/pokemon/%/front_silver.2bpp: rgbgfx += -h

gfx/pokemon/%/back.2bpp: rgbgfx += -h
gfx/pokemon/%/back_gold.2bpp: rgbgfx += -h
gfx/pokemon/%/back_silver.2bpp: rgbgfx += -h

gfx/pokemon/%/back_gold.2bpp: gfx/pokemon/%/back.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

gfx/pokemon/%/back_silver.2bpp: gfx/pokemon/%/back.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

gfx/trainers/%.2bpp: rgbgfx += -h

gfx/intro/fire1.2bpp: gfx/intro/charizard1.2bpp gfx/intro/charizard2_top.2bpp gfx/intro/space.2bpp ; cat $^ > $@
gfx/intro/fire2.2bpp: gfx/intro/charizard2_bottom.2bpp gfx/intro/charizard3.2bpp ; cat $^ > $@
gfx/intro/fire3.2bpp: gfx/intro/fire.2bpp gfx/intro/unused_blastoise_venusaur.2bpp ; cat $^ > $@

gfx/new_game/shrink1.2bpp: rgbgfx += -h
gfx/new_game/shrink2.2bpp: rgbgfx += -h

gfx/mail/dragonite.1bpp: tools/gfx += --remove-whitespace
gfx/mail/large_note.1bpp: tools/gfx += --remove-whitespace
gfx/mail/surf_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/flower_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/litebluemail_border.1bpp: tools/gfx += --remove-whitespace

gfx/pokedex/pokedex.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/pokedex_sgb.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/question_mark.2bpp: rgbgfx += -h
gfx/pokedex/slowpoke.2bpp: tools/gfx += --trim-whitespace

gfx/pokegear/pokegear.2bpp: rgbgfx += -x2
gfx/pokegear/pokegear_sprites.2bpp: tools/gfx += --trim-whitespace

gfx/mystery_gift/mystery_gift.2bpp: tools/gfx += --remove-whitespace
gfx/mystery_gift/mystery_gift_2.2bpp: tools/gfx += --trim-whitespace
gfx/mystery_gift/question_mark.1bpp: tools/gfx += --remove-whitespace

gfx/title/logo_bottom_gold.2bpp: tools/gfx += --trim-whitespace
gfx/title/logo_bottom_silver.2bpp: tools/gfx += --trim-whitespace
gfx/title/hooh_gold.2bpp: tools/gfx += --interleave --png=$<
gfx/title/lugia_silver.2bpp: tools/gfx += --interleave --png=$<

gfx/trade/ball.2bpp: tools/gfx += --remove-whitespace

gfx/slots/slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/slots_2.2bpp: tools/gfx += --interleave --png=$<
gfx/slots/slots_3.2bpp: tools/gfx += --interleave --png=$< --remove-duplicates --keep-whitespace --remove-xflip

gfx/card_flip/card_flip_1.2bpp: tools/gfx += --trim-whitespace
gfx/card_flip/card_flip_2.2bpp: tools/gfx += --remove-whitespace

gfx/battle_anims/angels.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/beam.2bpp: tools/gfx += --remove-xflip --remove-yflip --remove-whitespace
gfx/battle_anims/bubble.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/charge.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/egg.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/explosion.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/hit.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/horn.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/lightning.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/misc.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/battle_anims/noise.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/objects.2bpp: tools/gfx += --remove-whitespace --remove-xflip
gfx/battle_anims/pokeball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/reflect.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/rocks.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/skyattack.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/status.2bpp: tools/gfx += --remove-whitespace

gfx/player/chris.2bpp: rgbgfx += -h
gfx/player/chris_back.2bpp: rgbgfx += -h

gfx/trainer_card/leaders.2bpp: tools/gfx += --trim-whitespace

gfx/overworld/chris_fish.2bpp: tools/gfx += --trim-whitespace

gfx/sprites/big_onix.2bpp: tools/gfx += --remove-whitespace --remove-xflip

gfx/battle/dude.2bpp: rgbgfx += -h

gfx/font/unused_bold_font.1bpp: tools/gfx += --trim-whitespace

gfx/sgb/gold_border.2bpp: tools/gfx += --trim-whitespace
gfx/sgb/silver_border.2bpp: tools/gfx += --trim-whitespace
gfx/sgb/gold_border.sgb.tilemap: gfx/sgb/gold_border.bin ; tr < $< -d '\000' > $@
gfx/sgb/silver_border.sgb.tilemap: gfx/sgb/silver_border.bin ; tr < $< -d '\000' > $@


### Catch-all graphics rules

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.gbcpal: %.png
	$(RGBGFX) -p $@ $<

%.dimensions: %.png
	tools/png_dimensions $< $@
