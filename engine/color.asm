PALPACKET_LENGTH EQU $10
INCLUDE "predef/sgb.asm"

SHINY_ATK_BIT EQU 5
SHINY_DEF_VAL EQU 10
SHINY_SPD_VAL EQU 10
SHINY_SPC_VAL EQU 10

CheckShininess:
	dr $9052, $9072
CheckContestMon:
	dr $9072, $91e5
ApplyMonOrTrainerPals:
	dr $91e5, $9311

INCLUDE "predef/cgb.asm"

Function9a94:
	dr $9a94, $9cc0
InitSGBBorder:
	dr $9cc0, $9cfd
InitCGBPals:: ; 9cfd
	dr $9cfd, $bc3a
