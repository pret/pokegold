
OpenSRAM::
	push af ; 30e1
	ld a, $1 ; 30e2
	ld [MBC3LatchClock], a ; 30e4
	ld a, $a ; 30e7
	ld [MBC3SRamEnable], a ; 30e9
	pop af ; 30ec
	ld [MBC3SRamBank], a ; 30ed
	ret ; 30f0
; 30f1

CloseSRAM::
	push af ; 30f1
	ld a, $0 ; 30f2
	ld [MBC3LatchClock], a ; 30f4
	ld [MBC3SRamEnable], a ; 30f7
	pop af ; 30fa
	ret ; 30fb
; 30fc
