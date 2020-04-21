#!/bin/sh
# Finds asm sources that aren't included in the build

# top-level sources listed in Makefile
toplevel='audio.asm data/text/common.asm data/pokemon/dex_entries.asm wram.asm
main.asm home.asm gfx/sprites.asm gfx/pics_gold.asm gfx/pics_silver.asm'

for asm in $toplevel; do
	echo "$asm"
	python tools/scan_includes.py "$asm"
	echo
done | tr ' ' '\n' | sort -u > includes.txt
git ls-files | grep '\.asm$' | sort -u > sources.txt
comm -23 sources.txt includes.txt
rm sources.txt includes.txt
