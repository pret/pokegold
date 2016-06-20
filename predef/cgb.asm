CheckCGB:
	ld a, [hCGB]
	and a
	ret

Predef_LoadSGBLayoutCGB:
	ld a, b
	cp SCGB_RAM
	jr nz, .asm_931d
	ld a, [wColorLayoutPredefID]
.asm_931d
	cp SCGB_PARTY_MENU_HP_PALS
	jp z, Function9b75
	call Function9b01
	ld l, a
	ld h, $0
	add hl, hl
	ld de, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return
	push de
	jp [hl]

.return
	ret

.Jumptable
	dw Function9376
	dw Function9399
	dw Function944a
	dw Function945e
	dw Function94f1
	dw Function9605
	dw Function968d
	dw Function96b7
	dw Function973e
	dw Function9757
	dw Function9760
	dw Function976d
	dw Function97af
	dw Function97d4
	dw Function98be
	dw Function98f1
	dw Function9905
	dw Function9728
	dw Function999f
	dw Function99d9
	dw Function991e
	dw Function9802
	dw Function95d5
	dw Function9561
	dw Function97e1
	dw Function9a03
	dw Function9a2e
	dw Function9a5a
	dw Function9a7b
	dw Function9a94
	dw Function9a47
	dw Function9502

Function9376:
	dr $9376, $9399

Function9399:
	dr $9399, $944a

Function944a:
	dr $944a, $945e

Function945e:
	dr $945e, $94eb

StatsScreenPals:
	dr $94eb, $94f1

Function94f1:
	dr $94f1, $9502

Function9502:
	dr $9502, $9561

Function9561:
	dr $9561, $95d5

Function95d5:
	dr $95d5, $9605

Function9605:
	dr $9605, $968d

Function968d:
	dr $968d, $96b7

Function96b7:
	dr $96b7, $9728

Function9728:
	dr $9728, $973e

Function973e:
	dr $973e, $9757

Function9757:
	dr $9757, $9760

Function9760:
	dr $9760, $976d

Function976d:
	dr $976d, $97af

Function97af:
	dr $97af, $97d4

Function97d4:
	dr $97d4, $97e1

Function97e1:
	dr $97e1, $9802

Function9802:
	dr $9802, $98be

Function98be:
	dr $98be, $98f1

Function98f1:
	dr $98f1, $9905

Function9905:
	dr $9905, $991e

Function991e:
	dr $991e, $999f

Function999f:
	dr $999f, $99d9

Function99d9:
	dr $99d9, $9a03

Function9a03:
	dr $9a03, $9a2e

Function9a2e:
	dr $9a2e, $9a47

Function9a47:
	dr $9a47, $9a5a

Function9a5a:
	dr $9a5a, $9a7b

Function9a7b:
	dr $9a7b, $9a94
