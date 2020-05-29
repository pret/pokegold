#!/bin/sh
# Finds files that aren't included in the build

# top-level sources listed in Makefile
toplevel='audio.asm data/text/common.asm data/pokemon/dex_entries.asm wram.asm
main.asm home.asm gfx/sprites.asm gfx/pics_gold.asm gfx/pics_silver.asm
data/maps/map_data.asm engine/overworld/events.asm rgbdscheck.asm
data/pokemon/egg_moves.asm data/pokemon/evos_attacks.asm gfx/tilesets.asm
engine/movie/credits.asm'

for asm in $toplevel; do
	echo "$asm"
	python tools/scan_includes.py "$asm"
	echo
done | tr ' ' '\n' | sort -u > includes.txt
git ls-files | grep -E '\.(asm|gbcpal|pal|lz|[1,2]bpp|blk|bin|rle|attrmap|tilemap|dimensions)$' | sort -u > sources.txt
comm -23 sources.txt includes.txt
rm sources.txt includes.txt
