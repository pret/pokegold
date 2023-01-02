roms := \
	pokegold.gbc \
	pokesilver.gbc \
	pokegold_debug.gbc \
	pokesilver_debug.gbc
patches := \
	pokegold.patch \
	pokesilver.patch

rom_obj := \
	audio.o \
	home.o \
	main.o \
	ram.o \
	data/text/common.o \
	data/maps/map_data.o \
	data/pokemon/egg_moves.o \
	data/pokemon/evos_attacks.o \
	engine/movie/credits.o \
	engine/overworld/events.o \
	gfx/misc.o \
	gfx/sprites.o \
	gfx/tilesets.o

# Distinguish asm files which are game-exclusive for building (*_[gold|silver].asm)
gs_excl_asm := \
	data/pokemon/dex_entries \
	gfx/pics

gold_excl_obj         := $(addsuffix _gold.o,$(gs_excl_asm))
silver_excl_obj       := $(addsuffix _silver.o,$(gs_excl_asm))
gold_debug_excl_obj   := $(addsuffix _gold_debug.o,$(gs_excl_asm))
silver_debug_excl_obj := $(addsuffix _silver_debug.o,$(gs_excl_asm))
gold_vc_excl_obj      := $(addsuffix _gold_vc.o,$(gs_excl_asm))
silver_vc_excl_obj    := $(addsuffix _silver_vc.o,$(gs_excl_asm))

pokegold_obj          := $(rom_obj:.o=_gold.o) $(gold_excl_obj)
pokesilver_obj        := $(rom_obj:.o=_silver.o) $(silver_excl_obj)
pokegold_debug_obj    := $(rom_obj:.o=_gold_debug.o) $(gold_debug_excl_obj)
pokesilver_debug_obj  := $(rom_obj:.o=_silver_debug.o) $(silver_debug_excl_obj)
pokegold_vc_obj       := $(rom_obj:.o=_gold_vc.o) $(gold_vc_excl_obj)
pokesilver_vc_obj     := $(rom_obj:.o=_silver_vc.o) $(silver_vc_excl_obj)


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
.PHONY: all gold silver gold_debug silver_debug clean tidy compare tools
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: $(roms)
gold:         pokegold.gbc
silver:       pokesilver.gbc
gold_debug:   pokegold_debug.gbc
silver_debug: pokesilver_debug.gbc
gold_vc:      pokegold.patch
silver_vc:    pokesilver.patch

clean: tidy
	find gfx \
	     \( -name "*.[12]bpp" \
	        -o -name "*.lz" \
	        -o -name "*.gbcpal" \
	        -o -name "*.dimensions" \
	        -o -name "*.sgb.tilemap" \) \
	     -delete

tidy:
	$(RM) $(roms) \
	      $(roms:.gbc=.sym) \
	      $(roms:.gbc=.map) \
	      $(patches) \
	      $(patches:.patch=_vc.gbc) \
	      $(patches:.patch=_vc.sym) \
	      $(patches:.patch=_vc.map) \
	      $(patches:%.patch=vc/%.constants.sym) \
	      $(pokegold_obj) \
	      $(pokesilver_obj) \
	      $(pokegold_vc_obj) \
	      $(pokesilver_vc_obj) \
	      $(pokegold_debug_obj) \
	      $(pokesilver_debug_obj) \
	      rgbdscheck.o
	$(MAKE) clean -C tools/

compare: $(roms) $(patches)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -hL -Q8 -P includes.asm -Weverything -Wnumeric-string=2 -Wtruncation=1
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(pokegold_obj):         RGBASMFLAGS += -D _GOLD
$(pokesilver_obj):       RGBASMFLAGS += -D _SILVER
$(pokegold_debug_obj):   RGBASMFLAGS += -D _GOLD -D _DEBUG
$(pokesilver_debug_obj): RGBASMFLAGS += -D _SILVER -D _DEBUG
$(pokegold_vc_obj):      RGBASMFLAGS += -D _GOLD -D _GOLD_VC
$(pokesilver_vc_obj):    RGBASMFLAGS += -D _SILVER -D _GOLD_VC

%.patch: vc/%.constants.sym %_vc.gbc %.gbc vc/%.patch.template
	tools/make_patch $*_vc.sym $^ $@

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
preinclude_deps := includes.asm $(shell tools/scan_includes includes.asm)
define DEP
$1: $2 $$(shell tools/scan_includes $2) $(preinclude_deps) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Dependencies for shared objects (drop _gold and _silver from asm file basenames)
$(foreach obj, $(filter-out $(gold_excl_obj), $(pokegold_obj)), \
	$(eval $(call DEP,$(obj),$(obj:_gold.o=.asm))))
$(foreach obj, $(filter-out $(silver_excl_obj), $(pokesilver_obj)), \
	$(eval $(call DEP,$(obj),$(obj:_silver.o=.asm))))
$(foreach obj, $(filter-out $(gold_debug_excl_obj), $(pokegold_debug_obj)), \
	$(eval $(call DEP,$(obj),$(obj:_gold_debug.o=.asm))))
$(foreach obj, $(filter-out $(silver_debug_excl_obj), $(pokesilver_debug_obj)), \
	$(eval $(call DEP,$(obj),$(obj:_silver_debug.o=.asm))))
$(foreach obj, $(filter-out $(gold_vc_excl_obj), $(pokegold_vc_obj)), \
	$(eval $(call DEP,$(obj),$(obj:_gold_vc.o=.asm))))
$(foreach obj, $(filter-out $(silver_vc_excl_obj), $(pokesilver_vc_obj)), \
	$(eval $(call DEP,$(obj),$(obj:_silver_vc.o=.asm))))

# Dependencies for game-exclusive objects (keep _gold and _silver in asm file basenames)
$(foreach obj, $(gold_excl_obj) $(silver_excl_obj), \
	$(eval $(call DEP,$(obj),$(obj:.o=.asm))))
$(foreach obj, $(gold_debug_excl_obj), \
	$(eval $(call DEP,$(obj),$(obj:_gold_debug.o=_gold.asm))))
$(foreach obj, $(silver_debug_excl_obj), \
	$(eval $(call DEP,$(obj),$(obj:_silver_debug.o=_silver.asm))))
$(foreach obj, $(gold_vc_excl_obj), \
	$(eval $(call DEP,$(obj),$(obj:_gold_vc.o=_gold.asm))))
$(foreach obj, $(silver_vc_excl_obj), \
	$(eval $(call DEP,$(obj),$(obj:_silver_vc.o=_silver.asm))))

# Dependencies for VC files that need to run scan_includes
%.constants.sym: %.constants.asm $(shell tools/scan_includes %.constants.asm) $(preinclude_deps) | rgbdscheck.o
	$(RGBASM) $(RGBASMFLAGS) $< > $@

endif


pokegold_opt         = -cjsv -t POKEMON_GLD -i AAUE -k 01 -l 0x33 -m 0x10 -r 3 -p 0
pokesilver_opt       = -cjsv -t POKEMON_SLV -i AAXE -k 01 -l 0x33 -m 0x10 -r 3 -p 0
pokegold_debug_opt   = -cjsv -t POKEMON_GLD -i AAUE -k 01 -l 0x33 -m 0x10 -r 3 -p 0
pokesilver_debug_opt = -cjsv -t POKEMON_SLV -i AAXE -k 01 -l 0x33 -m 0x10 -r 3 -p 0
pokegold_vc_opt      = -cjsv -t POKEMON_GLD -i AAUE -k 01 -l 0x33 -m 0x10 -r 3 -p 0
pokesilver_vc_opt    = -cjsv -t POKEMON_SLV -i AAXE -k 01 -l 0x33 -m 0x10 -r 3 -p 0

%.gbc: $$(%_obj) layout.link
	$(RGBLINK) -n $*.sym -m $*.map -l layout.link -o $@ $(filter %.o,$^)
	$(RGBFIX) $($*_opt) $@
	tools/stadium $@


### LZ compression rules

# Delete this line if you don't care about matching and just want optimal compression.
include gfx/lz.mk

%.lz: %
	tools/lzcomp $(LZFLAGS) -- $< $@


### Misc file-specific graphics rules

gfx/pokemon/%/front.2bpp: rgbgfx += -Z -c embedded
gfx/pokemon/%/front_gold.2bpp: rgbgfx += -Z -c embedded
gfx/pokemon/%/front_silver.2bpp: rgbgfx += -Z -c embedded

gfx/pokemon/%/back.2bpp: rgbgfx += -Z -c embedded
gfx/pokemon/%/back_gold.2bpp: rgbgfx += -Z -c embedded
gfx/pokemon/%/back_silver.2bpp: rgbgfx += -Z -c embedded

gfx/pokemon/%/back_gold.2bpp: gfx/pokemon/%/back.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

gfx/pokemon/%/back_silver.2bpp: gfx/pokemon/%/back.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

gfx/trainers/%.2bpp: rgbgfx += -Z -c embedded

gfx/intro/fire.2bpp: tools/gfx += --remove-whitespace
gfx/intro/fire1.2bpp: gfx/intro/charizard1.2bpp gfx/intro/charizard2_top.2bpp gfx/intro/space.2bpp ; cat $^ > $@
gfx/intro/fire2.2bpp: gfx/intro/charizard2_bottom.2bpp gfx/intro/charizard3.2bpp ; cat $^ > $@
gfx/intro/fire3.2bpp: gfx/intro/fire.2bpp gfx/intro/unused_blastoise_venusaur.2bpp ; cat $^ > $@

gfx/new_game/shrink1.2bpp: rgbgfx += -Z
gfx/new_game/shrink2.2bpp: rgbgfx += -Z

gfx/mail/dragonite.1bpp: tools/gfx += --remove-whitespace
gfx/mail/large_note.1bpp: tools/gfx += --remove-whitespace
gfx/mail/surf_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/flower_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/litebluemail_border.1bpp: tools/gfx += --remove-whitespace

gfx/pokedex/pokedex.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/pokedex_sgb.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/question_mark.2bpp: rgbgfx += -Z
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
gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates --preserve=0x23,0x27
gfx/trade/game_boy_cable.2bpp: gfx/trade/game_boy.2bpp gfx/trade/link_cable.2bpp ; cat $^ > $@

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

gfx/player/chris.2bpp: rgbgfx += -Z
gfx/player/chris_back.2bpp: rgbgfx += -Z

gfx/trainer_card/leaders.2bpp: tools/gfx += --trim-whitespace

gfx/overworld/chris_fish.2bpp: tools/gfx += --trim-whitespace

gfx/sprites/big_onix.2bpp: tools/gfx += --remove-whitespace --remove-xflip

gfx/battle/dude.2bpp: rgbgfx += -Z

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
	$(RGBGFX) -c embedded -p $@ $<

%.dimensions: %.png
	tools/png_dimensions $< $@
