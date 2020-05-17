tilepal: MACRO
; pals
rept _NARG / 2
	dn PAL_BG_\2, PAL_BG_\1
	shift
	shift
endr
endm

INCLUDE "gfx/tilesets/palette_maps.asm"

Unknown85d7:
	ds 26, $06
