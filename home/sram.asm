OpenSRAM:: ; 30e1 (0:30e1)
	push af
	ld a, $1
	ld [MBC3LatchClock], a
	ld a, $a
	ld [MBC3SRamEnable], a
	pop af
	ld [MBC3SRamBank], a
	ret
CloseSRAM:: ; 30f1 (0:30f1)
	push af
	ld a, $0
	ld [MBC3LatchClock], a
	ld [MBC3SRamEnable], a
	pop af
	ret
