roms := pokegold.gbc pokesilver.gbc

rom_obj := \
audio.o \
home.o \
main.o \
wram.o \
data/text/common.o \
data/maps/map_data.o \
data/pokemon/dex_entries.o \
engine/overworld/events.o \
gfx/sprites.o

# Distinguish asm files which are game-exclusive for building (*_[gold|silver].asm)
gs_excl_asm := gfx/pics
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

PYTHON := python
gfx := $(PYTHON) tools/gfx.py


### Build targets

.SUFFIXES:
.PHONY: all gold silver clean tidy pngs compare tools
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: $(roms)
gold: pokegold.gbc
silver: pokesilver.gbc

tidy:
	rm -f $(roms) $(gold_obj) $(silver_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) rgbdscheck.o
	$(MAKE) clean -C tools/

clean:
	rm -f $(roms) $(gold_obj) $(silver_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) rgbdscheck.o
	find gfx \( -iname "*.png" -not -iname "big_onix.png" \) -delete
	$(MAKE) clean -C tools/

compare: $(roms)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -L -Weverything
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
	$(RGBFIX) -cjsv -i AAUE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t "POKEMON_GLD" $@

pokesilver.gbc: $(silver_obj) layout.link
	$(RGBLINK) -n pokesilver.sym -m pokesilver.map -l layout.link -o $@ $(silver_obj)
	$(RGBFIX) -cjsv -i AAXE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t "POKEMON_SLV" $@

pngs:
	find gfx -iname "*.lz"      -exec $(gfx) unlz {} +
	find gfx -iname "*.[12]bpp" -exec $(gfx) png  {} +
	find gfx -iname "*.[12]bpp" -exec touch {} +
	find gfx -iname "*.lz"      -exec touch {} +
	find gfx/pokemon gfx/trainers -iname "*.[1,2]bpp" -delete
	rm gfx/battle/dude.2bpp gfx/player/chris_back.2bpp gfx/trade/game_boy.2bpp
