; These are all the asm constants needed to make the gold_vc patch.

MACRO vc_const
	DEF x = \1
	println "00:{04x:x} \1" ; same format as rgblink's .sym file
ENDM

; [FPA 001 Begin]
	vc_const "F"
	vc_const "I"
	vc_const "S"
	vc_const "U"
	vc_const "R"

; [FPA 002 Begin]
	vc_const "E"
	vc_const "L"
	vc_const "D"

; [FPA 003 Begin]
	vc_const "T"
	vc_const "H"
	vc_const "N"

; [FPA 004 Begin]
	vc_const "Y"
	vc_const "P"
	; "<SPACE>" is necessary since spaces separate template command arguments
	charmap "<SPACE>", " "
	vc_const "<SPACE>"

; [FPA 005 Begin]
	vc_const "O"

; [FPA 006 Begin]
	vc_const "X"

; [FPA 007 Begin]
	vc_const "A"
	vc_const "@"

; [FPA 042801 Begin]
	vc_const ANIM_GFX_BUBBLE

; [fight begin]
	vc_const SCREEN_HEIGHT_PX

; [print forbid 2]
	vc_const NO_INPUT
	vc_const A_BUTTON
	vc_const B_BUTTON
	vc_const D_UP
	vc_const D_DOWN

; [print forbid 3]
	vc_const MAPGROUP_CIANWOOD
	vc_const MAP_CIANWOOD_PHOTO_STUDIO
