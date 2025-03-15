EmptyAllSRAMBanks:
	ld a, 0
	call .EmptyBank
	ld a, 1
	call .EmptyBank
	ld a, 2
	call .EmptyBank
	ld a, 3
	call .EmptyBank
	ret

.EmptyBank:
	call OpenSRAM
	ld hl, STARTOF(SRAM)
	ld bc, SIZEOF(SRAM)
	xor a
	call ByteFill
	call CloseSRAM
	ret
