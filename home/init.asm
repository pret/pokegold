Reset:: ; 5b0 (0:05b0)
	call Function3d4f
	xor a
	ld [hMapAnims], a
	call Function3564
	ei
	ld hl, wd8ba
	set 7, [hl]
	ld c, 32
	call DelayFrames
	jr Init
_Start:: ; 5c6 (0:05c6)
	cp $11
	jr z, .cgb
	xor a
	jr .load
.cgb
	ld a, $1
.load
	ld [hCGB], a
Init:: ; 5d1 (0:05d1)
	di
	xor a
	ld [rIF], a
	ld [rIE], a
	ld [rRP], a
	ld [rSCX], a
	ld [rSCY], a
	ld [rSB], a
	ld [rSC], a
	ld [rWX], a
	ld [rWY], a
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
	ld [rTMA], a
	ld [rTAC], a
	ld [wceeb], a
	ld a, $4
	ld [rTAC], a
.wait
	ld a, [rLY]
	cp 145
	jr nz, .wait
	xor a
	ld [rLCDC], a

; Clear WRAM
	ld hl, wc000
	ld bc, $2000
.ByteFill
	ld [hl], $0
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .ByteFill

	ld sp, wStackTop

	call ClearVRAM
	ld a, [hCGB]
	push af
	xor a
	ld hl, HRAM_START
	ld bc, HRAM_END - HRAM_START
	call Function314c
	pop af
	ld [hCGB], a
	call Function30ff
	ld a, $1
	rst Bankswitch
	call Function4032
	xor a
	ld [hMapAnims], a
	ld [hSCX], a
	ld [hSCY], a
	ld [rJOYP], a
	ld a, $8
	ld [rSTAT], a
	ld a, $90
	ld [hWY], a
	ld [rWY], a
	ld a, $7
	ld [hWX], a
	ld [rWX], a
	ld a, $ff
	ld [hLinkPlayerNumber], a
	ld h, $98
	call Function699
	ld h, $9c
	call Function699

	callab Function9cfd
	ld a, $9c

	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	callba Function14089
	ld a, $a
	ld [MBC3SRamEnable], a
	ld a, $0
	ld [MBC3LatchClock], a
	ld [MBC3SRamEnable], a
	ld a, $e3
	ld [rLCDC], a
	ld a, $1f
	ld [rIE], a
	ei
	call DelayFrame
	ld a, $30
	call Function2e49
	call Function3d4f
	xor a
	ld [wc1c0], a
IF DEF(GOLD)
	jp Function6545
ENDC
IF DEF(SILVER)
	jp Function650b
ENDC

ClearVRAM:: ; 68e (0:068e)
	ld hl, $8000
	ld bc, $2000
	xor a
	call Function314c
	ret

Function699:: ; 699 (0:0699)
	ld a, $7f
	jr asm_69e

Function69d:: ; 69d
	ld a, l
asm_69e
	ld de, $400
	ld l, e
.loop
	ld [hli], a
	dec e
	jr nz, .loop
	dec d
	jr nz, .loop
	ret
