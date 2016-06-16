Function343::
	ld a, [$c1cd] ; 343
	cp $0 ; 346
	ret z ; 348
	call Function467 ; 349
	ld a, [$cfe5] ; 34c
	bit 0, a ; 34f
	ret z ; 351
Function352::
	ld hl, $4366 ; 352
	ld a, $23 ; 355
	rst FarCall ; 357
	ret ; 358
; 359

Function359::
	ld hl, $4397 ; 359
	ld a, $23 ; 35c
	rst FarCall ; 35e
	ret ; 35f
; 360
