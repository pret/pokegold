Predef_LoadSGBLayout: ; 8c2d (2:4c2d)
	call CheckCGB
	jp nz, Predef_LoadSGBLayoutCGB
	ld a, b
	cp SCGB_RAM
	jr nz, .asm_8c3b
	ld a, [wColorLayoutPredefID]
.asm_8c3b
	cp SCGB_PARTY_MENU_HP_PALS
	jp z, SGB_ApplyPartyMenuHPPals
	ld l, a
	ld h, $0
	add hl, hl
	ld de, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, FinishSGBPredefFunction
	push de
	jp [hl]

.Jumptable
	dw Function8c90
	dw Function8c97
	dw Function8d3f
	dw Function8d46
	dw Function8d95
	dw Function8e3c
	dw Function8e43
	dw Function8e51
	dw Function8e4a
	dw Function8e9b
	dw Function8d8e
	dw Function8eb7
	dw Function8e6e
	dw Function8f04
	dw Function8d1f
	dw Function8e81
	dw Function8e14
	dw Function8e88
	dw Function8f12
	dw Function8e7a
	dw Function8e35
	dw Function8f04
	dw Function8e0d
	dw Function8dd3
	dw Function8f0b
	dw Function8f90
	dw Function8f97
	dw Function8fc3
	dw Function8fca
	dw Function8e4a
	dw Function8f53
	dw Function8dcc

Function8c90:
	dr $8c90, $8c97

Function8c97:
	dr $8c97, $8d1f

Function8d1f:
	dr $8d1f, $8d3f

Function8d3f:
	dr $8d3f, $8d46

Function8d46:
	dr $8d46, $8d8e

Function8d8e:
	dr $8d8e, $8d95

Function8d95:
	dr $8d95, $8dcc

Function8dcc:
	dr $8dcc, $8dd3

Function8dd3:
	dr $8dd3, $8e0d

Function8e0d:
	dr $8e0d, $8e14

Function8e14:
	dr $8e14, $8e35

Function8e35:
	dr $8e35, $8e3c

Function8e3c:
	dr $8e3c, $8e43

Function8e43:
	dr $8e43, $8e4a

Function8e4a:
	dr $8e4a, $8e51

Function8e51:
	dr $8e51, $8e6e

Function8e6e:
	dr $8e6e, $8e7a

Function8e7a:
	dr $8e7a, $8e81

Function8e81:
	dr $8e81, $8e88

Function8e88:
	dr $8e88, $8e9b

Function8e9b:
	dr $8e9b, $8eb7

Function8eb7:
	dr $8eb7, $8f04

Function8f04:
	dr $8f04, $8f0b

Function8f0b:
	dr $8f0b, $8f12

Function8f12:
	dr $8f12, $8f53

Function8f53:
	dr $8f53, $8f90

Function8f90:
	dr $8f90, $8f97

Function8f97:
	dr $8f97, $8fc3

Function8fc3:
	dr $8fc3, $8fca

Function8fca:
	dr $8fca, $904a

FinishSGBPredefFunction:
	dr $904a, $9052
