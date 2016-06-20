tilepal: MACRO
; pals
rept _NARG / 2
	dn PAL_BG_\2, PAL_BG_\1
	shift
	shift
endr
endm
