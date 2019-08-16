PYTHON := python
MD5 := md5sum -c

.SUFFIXES:
.PHONY: all clean gold silver pngs compare
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

gfx       := $(PYTHON) gfx.py
includes  := $(PYTHON) scan_includes.py


rom_obj := \
audio.o \
data/text/common.o \
data/pokemon/dex_entries.o \
wram.o \
main.o \
home.o

gold_obj := $(rom_obj:.o=_gold.o)
silver_obj := $(rom_obj:.o=_silver.o)

roms := pokegold.gbc pokesilver.gbc

all: $(roms)
gold: pokegold.gbc
silver: pokesilver.gbc

clean:
	rm -f $(roms) $(gold_obj) $(silver_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)

compare: pokegold.gbc pokesilver.gbc
	@$(MD5) roms.md5

%.asm: ;

define DEP
$1: $$(shell $$(includes) $2)
endef
$(foreach obj, $(gold_obj), $(eval $(call DEP,$(obj),$(obj:_gold.o=.asm))))
$(foreach obj, $(silver_obj), $(eval $(call DEP,$(obj),$(obj:_silver.o=.asm))))

$(gold_obj): %_gold.o: %.asm $$(dep)
	rgbasm -D GOLD -o $@ $<

$(silver_obj): %_silver.o: %.asm $$(dep)
	rgbasm -D SILVER -o $@ $<

pokegold.gbc: $(gold_obj)
	rgblink -n pokegold.sym -m pokegold.map -l pokegold.link -o $@ $^
	rgbfix -cjsv -i AAUE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t "POKEMON_GLD" $@

pokesilver.gbc: $(silver_obj)
	rgblink -n pokesilver.sym -m pokesilver.map -l pokesilver.link -o $@ $^
	rgbfix -cjsv -i AAXE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t "POKEMON_SLV" $@

pngs:
	find . -iname "*.lz"      -exec $(gfx) unlz {} +
	find . -iname "*.[12]bpp" -exec $(gfx) png  {} +
	find . -iname "*.[12]bpp" -exec touch {} +
	find . -iname "*.lz"      -exec touch {} +

%.png: ;
%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<
%.lz: % ; $(gfx) lz $<

%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;
