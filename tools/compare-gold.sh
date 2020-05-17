#!/bin/sh
# Compares baserom-gold.gbc and pokegold.gbc

# create baserom-gold.txt if necessary
if [ ! -f baserom-gold.txt ]; then
	hexdump -C baserom-gold.gbc > baserom-gold.txt
fi

hexdump -C pokegold.gbc > pokegold.txt

diff -u baserom-gold.txt pokegold.txt | less
