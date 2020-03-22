#!/bin/sh
# Compares baserom-silver.gbc and pokesilver.gbc

# create baserom-silver.txt if necessary
if [ ! -f baserom-silver.txt ]; then
	hexdump -C baserom-silver.gbc > baserom-silver.txt
fi

hexdump -C pokesilver.gbc > pokesilver.txt

diff -u baserom-silver.txt pokesilver.txt | less
