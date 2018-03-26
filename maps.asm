INCLUDE "includes.asm"


SECTION "Map Headers", ROMX, BANK[$25]

INCLUDE "maps/map_headers.asm"
INCLUDE "maps/second_map_headers.asm"


SECTION "Map Blockdata 2a", ROMX, BANK[$2a]

INCLUDE "maps/blockdata_2a.asm"


SECTION "Map Blockdata 2b", ROMX, BANK[$2b]

INCLUDE "maps/blockdata_2b.asm"


SECTION "Map Scripts 51", ROMX, BANK[$51]

INCLUDE "maps/OlivinePokeCenter1F.asm"


SECTION "Map Scripts 60", ROMX, BANK[$60]

INCLUDE "maps/ElmsLab.asm"
